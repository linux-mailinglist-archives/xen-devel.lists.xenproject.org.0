Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCBD36E81D
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 11:40:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119854.226601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc39T-0006OX-Bq; Thu, 29 Apr 2021 09:40:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119854.226601; Thu, 29 Apr 2021 09:40:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc39T-0006OC-8V; Thu, 29 Apr 2021 09:40:07 +0000
Received: by outflank-mailman (input) for mailman id 119854;
 Thu, 29 Apr 2021 09:40:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xfjL=J2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lc39R-0006BD-JS
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 09:40:05 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 93005f52-26b4-41a4-a676-e4cd29567c9d;
 Thu, 29 Apr 2021 09:40:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9FD95B018;
 Thu, 29 Apr 2021 09:40:03 +0000 (UTC)
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
X-Inumbo-ID: 93005f52-26b4-41a4-a676-e4cd29567c9d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619689203; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vahH0cyhzgCAdu5nMA3Vm4iCr2LnlAjH9wZJn6cLx9I=;
	b=SOfrPhyqXARHNLVeopc75SXTUMHVwUkpF/MLEXKOgLncsFODqnBkBhfmGMqcPGMGuuc6Gq
	wg9AzlNVTBFjYRtVJXc+l7B8H5EFXA28XXiWQ50wTZ9r5RRR5mk1hOjNF6ZRs9yHn45EUH
	a8FOD8zuK9fZ1jseCE+TZugmEBLzmok=
Subject: Re: [PATCH v3 19/22] x86emul: support TILELOADD{,T1} and TILESTORE
To: paul@xen.org
References: <322de6db-e01f-0b57-5777-5d94a13c441a@suse.com>
 <fc272d90-9a3c-98e9-d811-ea9b70f89e22@suse.com>
 <6b604011-a618-871a-2a3e-9118dd1b702b@suse.com>
 <c63e6988-196d-ab7c-5971-611eba99a7d6@suse.com>
 <3c1d6f14-b091-6244-0ef0-3925601c770d@xen.org>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4f129a52-06ce-ab14-3e70-a7c78b64d344@suse.com>
Date: Thu, 29 Apr 2021 11:40:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <3c1d6f14-b091-6244-0ef0-3925601c770d@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.04.2021 09:12, Paul Durrant wrote:
> On 22/04/2021 16:11, Jan Beulich wrote:
>> On 22.04.2021 17:06, Jan Beulich wrote:
>>> On 22.04.2021 16:55, Jan Beulich wrote:
>>>> +        do {
>>>> +            /* Limit rows to just as many to cover the next one to access. */
>>>> +            cfg->start_row = i;
>>>> +            cfg->rows[modrm_reg] = i + 1;
>>>> +            write_tilecfg(cfg);
>>>> +
>>>> +            if ( vex.pfx != vex_f3 )
>>>> +                rc = ops->read(ea.mem.seg,
>>>> +                               truncate_ea(ea.mem.off + i * ea.val),
>>>> +                               row, cfg->colsb[modrm_reg], ctxt);
>>>> +
>>>> +            invoke_stub("", "", "=m" (dummy) : "a" (row));
>>>> +
>>>> +            if ( vex.pfx == vex_f3 )
>>>> +                rc = ops->write(ea.mem.seg,
>>>> +                                truncate_ea(ea.mem.off + i * ea.val),
>>>> +                                row, cfg->colsb[modrm_reg], ctxt);
>>>> +        } while ( rc == X86EMUL_OKAY && ++i < n );
>>>
>>> in principle tiles could have rows larger than 64 bytes without any
>>> separate CPUID feature flag qualifying this. struct hvm_mmio_cache,
>>> otoh, is having a fixed-size 64-byte buffer right now. Therefore I'm
>>> wondering whether we'd want to switch to dynamically allocating that
>>> to the minimum of 64 bytes and the size of a tile row, just as a
>>> precautionary measure.
>>
>> Actually, as it occurred to me only after sending, enlarging tile size
>> would under almost all circumstances require a new XSTATE component,
>> which we'd need to enable first. I consider it less likely that they'd
>> permit a wider range of layouts without increasing tile size. But we
>> might still want to play safe.
>>
> 
> I guess on-demand reallocation to a larger size would be fine. Certainly 
> we want to be sure we don't overflow.

Okay, I've added a patch doing not just this, but (perhaps even more
important) also increase struct hvmemul_cache's capacity on such
hardware.

Jan

