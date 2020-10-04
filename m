Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1759E282973
	for <lists+xen-devel@lfdr.de>; Sun,  4 Oct 2020 09:39:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2693.7704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOybr-0001uy-G1; Sun, 04 Oct 2020 07:39:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2693.7704; Sun, 04 Oct 2020 07:39:07 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOybr-0001uZ-Cn; Sun, 04 Oct 2020 07:39:07 +0000
Received: by outflank-mailman (input) for mailman id 2693;
 Sun, 04 Oct 2020 07:39:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nivo=DL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kOybp-0001uU-Ho
 for xen-devel@lists.xenproject.org; Sun, 04 Oct 2020 07:39:05 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a077db5a-2f37-49f2-aab0-7271529a538d;
 Sun, 04 Oct 2020 07:39:03 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C79F8ACDB;
 Sun,  4 Oct 2020 07:39:02 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nivo=DL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kOybp-0001uU-Ho
	for xen-devel@lists.xenproject.org; Sun, 04 Oct 2020 07:39:05 +0000
X-Inumbo-ID: a077db5a-2f37-49f2-aab0-7271529a538d
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id a077db5a-2f37-49f2-aab0-7271529a538d;
	Sun, 04 Oct 2020 07:39:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601797142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ADXyo3ab3pBs4ZZ1xq/Uzp7I/o62e/+Hfh2P56RTVyw=;
	b=ZVjBXAwRO9vdmHQhaWP4CRSK/l/HxWekNguOGTTtp4Thpm78yx/oFSqW1iArADFCwMK+hO
	sGxYIP3QKtcCL5hpjBi+FJf6DtjyOrqUTG7Qshbmwo9LFJZSsSN1iWPYe21vzkfGUc6CYE
	u+e7/k+ANYXvFcgRiY6NM+8uleo7PvU=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id C79F8ACDB;
	Sun,  4 Oct 2020 07:39:02 +0000 (UTC)
Subject: Re: [PATCH] x86/S3: Restore CR4 earlier during resume
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
References: <20201002213650.2197-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7d4e12ca-cb0d-3fbd-7d24-27bd46b8b95c@suse.com>
Date: Sun, 4 Oct 2020 09:38:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201002213650.2197-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 02.10.2020 23:36, Andrew Cooper wrote:
> c/s 4304ff420e5 "x86/S3: Drop {save,restore}_rest_processor_state()
> completely" moved CR4 restoration up into C, to account for the fact that MCE
> was explicitly handled later.
> 
> However, time_resume() ends up making an EFI Runtime Service call, and EFI
> explodes without OSFXSR, presumably when trying to spill %xmm registers onto
> the stack.
> 
> Given this codepath, and the potential for other issues of a similar kind (TLB
> flushing vs INVPCID, HVM logic vs VMXE, etc), restore CR4 in asm before
> entering C.
> 
> Ignore the previous MCE special case, because its not actually necessary.  The
> handler is already suitably configured from before suspend.

Are you suggesting we could drop the call to mcheck_init() altogether?

> Fixes: 4304ff420e5 ("x86/S3: Drop {save,restore}_rest_processor_state() completely")
> Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

