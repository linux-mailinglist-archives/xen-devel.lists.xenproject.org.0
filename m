Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6166330CA9
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 12:48:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94818.178585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJEMW-0000PZ-TP; Mon, 08 Mar 2021 11:47:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94818.178585; Mon, 08 Mar 2021 11:47:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJEMW-0000PA-QB; Mon, 08 Mar 2021 11:47:48 +0000
Received: by outflank-mailman (input) for mailman id 94818;
 Mon, 08 Mar 2021 11:47:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mI6H=IG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lJEMU-0000P5-QP
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 11:47:46 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fd665ff1-a22b-4b07-b109-a86b0179145a;
 Mon, 08 Mar 2021 11:47:45 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 06B7FACBF;
 Mon,  8 Mar 2021 11:47:45 +0000 (UTC)
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
X-Inumbo-ID: fd665ff1-a22b-4b07-b109-a86b0179145a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615204065; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SBOuMZ34kV89EhI/qtaTSYIJIcHsQ0+B54P/z8QrV6w=;
	b=UyzL5+zvEk5rfRzA4wzhLO+XDsBg6rMXhAfAkiaSbtBhWd0g8OHNPNa0NQrFl7cbD0snRg
	hvcRPxGje+jCJV+Ow1u+3y6nHJKSE8BciyMzcgsLnZuldlruPn8acmrVwjI4CVU99QpdhL
	cmK7gkOYogWt0z7HmY8BTiIFWSYAlsM=
Subject: Re: [PATCH v2 2/2][4.15] x86/AMD: expose HWCR.TscFreqSel to guests
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <iwj@xenproject.org>
References: <f5f17207-b601-2909-8a5c-55276e734272@suse.com>
 <c91b190a-aaa1-d3b8-10eb-d8da7ad1f834@suse.com>
 <YEYMgQ+e5A9/jqQE@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c5dd3650-b8cf-ba4c-70ee-f0dd09a1ea09@suse.com>
Date: Mon, 8 Mar 2021 12:47:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YEYMgQ+e5A9/jqQE@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 08.03.2021 12:37, Roger Pau Monné wrote:
> On Fri, Mar 05, 2021 at 10:50:54AM +0100, Jan Beulich wrote:
>> Linux has been warning ("firmware bug") about this bit being clear for a
>> long time. While writable in older hardware it has been readonly on more
>> than just most recent hardware. For simplicitly report it always set (if
>> anything we may want to log the issue ourselves if it turns out to be
>> clear on older hardware).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> One question below.
> 
>> ---
>> v2: New.
>> ---
>> There are likely more bits worthwhile to expose, but for about every one
>> of them there would be the risk of a lengthy discussion, as there are
>> clear downsides to exposing such information, the more that it would be
>> tbd whether the hardware values should be surfaced, and if so what
>> should happen when the guest gets migrated.
>>
>> The main risk with making the read not fault here is that guests might
>> imply they can also write this MSR then.
>>
>> --- a/xen/arch/x86/msr.c
>> +++ b/xen/arch/x86/msr.c
>> @@ -315,6 +315,12 @@ int guest_rdmsr(struct vcpu *v, uint32_t
>>          *val = msrs->tsc_aux;
>>          break;
>>  
>> +    case MSR_K8_HWCR:
>> +        if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
>> +            goto gp_fault;
>> +        *val = K8_HWCR_TSC_FREQ_SEL;
> 
> I've been only able to find information about this MSR up to family
> 10h, but I think in theory Xen might also run on family 0Fh, do you
> know if the MSR is present there, and the bit has the same meaning?

From its name (and its K7 alternative name) it's clear the register
had been there at that point. And indeed the bit has a different
meaning there (its the bottom bit of a 6-bit START_FID field if the
BKDG I'm looking at can be trusted. Since I don't think it matters
much whether we expose a value of 0x00 or a value of 0x01 there,
and since we likely don't want to make #GP raising dependent upon
family when we don't _really_ need to, I would want to propose that
the value used is good enough uniformly.

>> --- a/xen/include/asm-x86/msr-index.h
>> +++ b/xen/include/asm-x86/msr-index.h
>> @@ -287,6 +287,8 @@
>>  
>>  #define MSR_K7_HWCR			0xc0010015
> 
> We could likely drop the K7 define here, as Xen won't be able to run
> on K7 hardware anymore AFAICT.

Indeed, but not at this point in time.

Jan

