Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E8F9BD9CE
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 00:41:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830518.1245536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8T9u-0008Fi-4N; Tue, 05 Nov 2024 23:40:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830518.1245536; Tue, 05 Nov 2024 23:40:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8T9u-0008DI-1F; Tue, 05 Nov 2024 23:40:26 +0000
Received: by outflank-mailman (input) for mailman id 830518;
 Tue, 05 Nov 2024 23:40:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/xwF=SA=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t8T9s-0008DC-Pj
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2024 23:40:24 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50f81b21-9bcf-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 00:40:20 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1730850015508589.0477555983164;
 Tue, 5 Nov 2024 15:40:15 -0800 (PST)
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
X-Inumbo-ID: 50f81b21-9bcf-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6IjUwZjgxYjIxLTliY2YtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODUwMDIxLjA4NDMxNCwic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1730850016; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CNinTLXaLMC9xmeAjBNLD+CcDOqeZ7x4Xyn8BxbT4RY1d9OCkNqNk7uKkEBOXGp7O3VOHz8WhbP2q0lbhF3IHGZVuw7S+fMNJGKXbWJnmkeuL3Fh30vVOAwZebQRJQ21GvV9R7tu+xhRu7V9y6iUeR6J2TX08W0btmijsMvVAeI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1730850016; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=YQdMQ7PJtxZ+nEb2TBPI5ITRfGSKvRQZ/r0uTZkytDw=; 
	b=l6MMpVsVw5J02JvH2v+hTOrUDWRNlnpeBlIHZNYTm+ngSEk092YUSIUpxpB0NoFnmBaMMEguvoBWC0E/zZXkif16L3Mmw5JtDWwoz70NdCbskaA3fM1kEnOEcXuZ2ecqcP8TUfT7//vig0v0IFeGd0WnRd/ePH/sc/6QBf1Oyi8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730850016;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=YQdMQ7PJtxZ+nEb2TBPI5ITRfGSKvRQZ/r0uTZkytDw=;
	b=HRBrrjTc3X6hlAjgqWYmJj3q0SRIL8V6v90lHcjuMnwc4GNU/MiJfU1S2BO0iXcn
	sImnmwcdSF+fIrGEGUnWp/XP63qzlL5ihfHEzxAo69jilMuvdme4SEy8AADsljvja1J
	bIaR01oruitlSrf/GxxoZrXxcvMIwoTFvzTuYkM8=
Message-ID: <2123d209-2600-4022-b295-e7d6c35bf969@apertussolutions.com>
Date: Tue, 5 Nov 2024 18:40:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] x86/ucode: Fold microcode_grab_module() into its
 single caller
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20241028091856.2151603-1-andrew.cooper3@citrix.com>
 <20241028091856.2151603-6-andrew.cooper3@citrix.com>
 <d68a6509-a79e-4ea7-ad39-da77243a36e7@apertussolutions.com>
 <9b25640d-8180-4f9b-96a7-a214bbdfa238@citrix.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <9b25640d-8180-4f9b-96a7-a214bbdfa238@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 11/5/24 18:07, Andrew Cooper wrote:
> On 02/11/2024 4:33 pm, Daniel P. Smith wrote:
>> On 10/28/24 05:18, Andrew Cooper wrote:
>>> @@ -831,7 +818,15 @@ static int __init early_microcode_load(struct
>>> boot_info *bi)
>>>        size_t size;
>>>        struct microcode_patch *patch;
>>>    -    microcode_grab_module(bi);
>>> +    if ( ucode_mod_idx < 0 )
>>> +        ucode_mod_idx += bi->nr_modules;
>>> +    if ( ucode_mod_idx <= 0 || ucode_mod_idx >= bi->nr_modules ||
>>> +         !__test_and_clear_bit(ucode_mod_idx, bi->module_map) )
>>> +        goto scan;
>>> +    ucode_mod = *bi->mods[ucode_mod_idx].mod;
>>> + scan:
>>> +    if ( ucode_scan )
>>> +        microcode_scan_module(bi);
>>>          if ( !ucode_mod.mod_end && !ucode_blob.size )
>>>            return 0;
>>
>> Just a suggestion, but would it be useful to add a comment to explain
>> the three conditions of ucode_mod_idx that are being handled before
>> scanning is attempted?
> 
> The already did that, but it's in the next patch, which also rearranges
> this block massively.

I realized that and meant to come back to adjust my response. As such,

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

