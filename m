Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC79308883
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 12:47:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78058.141834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5SEo-0000AO-N4; Fri, 29 Jan 2021 11:46:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78058.141834; Fri, 29 Jan 2021 11:46:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5SEo-00009q-Jn; Fri, 29 Jan 2021 11:46:54 +0000
Received: by outflank-mailman (input) for mailman id 78058;
 Fri, 29 Jan 2021 11:46:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mmvf=HA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l5SEn-00009k-E2
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 11:46:53 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e075c8d0-7e52-4ab9-a82f-e733f1b23842;
 Fri, 29 Jan 2021 11:46:52 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EC0ADAD7F;
 Fri, 29 Jan 2021 11:46:51 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: e075c8d0-7e52-4ab9-a82f-e733f1b23842
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611920812; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IyMKMzPzMD8QsROuI+qerekG8tj+OZ6zpmXK38cnLqc=;
	b=DOP51xNBplFQx2TDcEFKhuFzivOfGGM/Gtu3dVt59jEz5pop6vatdhXSdoBldc5HY/JOr8
	p/s2eyvJitm3d5XlfdkDoZpO0xhB4ooCnuvG3LdcHBMriROlR7KhP8VXDIjWjn1tD/Gqof
	2MjvmDdRpj7mP2CcLPZnr1KnD8Ns018=
Subject: Re: [PATCH] x86/HVM: support emulated UMIP
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <5a8b1c37-5f53-746f-ba87-778d4d980d99@suse.com>
Message-ID: <3beaf17b-6064-28b1-23f3-482e3e8cd110@suse.com>
Date: Fri, 29 Jan 2021 12:46:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <5a8b1c37-5f53-746f-ba87-778d4d980d99@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 29.01.2021 12:45, Jan Beulich wrote:
> There are three noteworthy drawbacks:
> 1) The intercepts we need to enable here are CPL-independent, i.e. we
>    now have to emulate certain instructions for ring 0.
> 2) On VMX there's no intercept for SMSW, so the emulation isn't really
>    complete there.
> 3) The CR4 write intercept on SVM is lower priority than all exception
>    checks, so we need to intercept #GP.
> Therefore this emulation doesn't get offered to guests by default.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v3: Don't offer emulation by default. Re-base.
> v2: Split off the x86 insn emulator part. Re-base. Use hvm_featureset
>     in hvm_cr4_guest_reserved_bits().

As per this, the title was meant to start [PATCH v3]; sorry.
The v2 submission was quite some time ago, though.

Jan

