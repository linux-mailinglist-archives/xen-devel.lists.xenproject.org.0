Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BFE30A4A1
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 10:52:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79640.145046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6VsC-0000Bt-Bl; Mon, 01 Feb 2021 09:51:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79640.145046; Mon, 01 Feb 2021 09:51:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6VsC-0000BU-8X; Mon, 01 Feb 2021 09:51:56 +0000
Received: by outflank-mailman (input) for mailman id 79640;
 Mon, 01 Feb 2021 09:51:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4N3t=HD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l6VsA-0000BP-K9
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 09:51:54 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8ab9db54-4460-451b-a6ef-98127d973801;
 Mon, 01 Feb 2021 09:51:53 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 04BC1ACF4;
 Mon,  1 Feb 2021 09:51:53 +0000 (UTC)
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
X-Inumbo-ID: 8ab9db54-4460-451b-a6ef-98127d973801
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612173113; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2tnGneDSnu7+cSQ/HFxC8HHQO4QsR5EtasRZB/JHnM4=;
	b=t05sYcMlPdocTZQZGPc2o34ykxBhDhtKtpZkc0IRuDIPG/PMrd5DH5DRloVBEgSaQrNTq9
	boWmP52lR1N8yeEcyGWsqMA480ieTpk1BtcjG9EhNgYNM5g33yBqVBfdEQ/wO/3WnyQzFt
	qvvAz3fVQZ+wb6AC6yozKg0vjjNI898=
Subject: Re: [PATCH v8 16/16] x86/vm_event: Carry the vmtrace buffer position
 in vm_event
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>,
 =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210130025852.12430-1-andrew.cooper3@citrix.com>
 <20210130025852.12430-17-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <43d6d4a8-6a3a-4476-6262-122784270d8b@suse.com>
Date: Mon, 1 Feb 2021 10:51:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210130025852.12430-17-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.01.2021 03:58, Andrew Cooper wrote:
> From: Tamas K Lengyel <tamas.lengyel@intel.com>
> 
> Add vmtrace_pos field to x86 regs in vm_event. Initialized to ~0 if
> vmtrace is not in use.
> 
> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

