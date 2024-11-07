Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A05E9C09AB
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 16:09:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831955.1247333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9481-0001Le-2I; Thu, 07 Nov 2024 15:08:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831955.1247333; Thu, 07 Nov 2024 15:08:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9480-0001Ih-Vk; Thu, 07 Nov 2024 15:08:56 +0000
Received: by outflank-mailman (input) for mailman id 831955;
 Thu, 07 Nov 2024 15:08:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9PMW=SC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t947z-0001Ib-OB
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 15:08:55 +0000
Received: from sender3-of-o59.zoho.com (sender3-of-o59.zoho.com
 [136.143.184.59]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31c3e7d0-9d1a-11ef-a0c6-8be0dac302b0;
 Thu, 07 Nov 2024 16:08:51 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1730992124005463.56805739058893;
 Thu, 7 Nov 2024 07:08:44 -0800 (PST)
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
X-Inumbo-ID: 31c3e7d0-9d1a-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg0LjU5IiwiaGVsbyI6InNlbmRlcjMtb2YtbzU5LnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6IjMxYzNlN2QwLTlkMWEtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTkyMTMyLjI1MjI5LCJzZW5kZXIiOiJkcHNtaXRoQGFwZXJ0dXNzb2x1dGlvbnMuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=1; a=rsa-sha256; t=1730992126; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WjZS1+1JGHtrkOwzTZT5R6DsIKJilWtlfqoU+DMscyvBB5qonaIEbO8VlptOfgR6BTwuDMh2mWSfacwC1Axo0oPtiBgp1LByOf4QoU4sFFpRjH1sf18toVUDETZzUuoPsMxgC/IRYSHv7rTQdnfDdRO39qRxngGpUbR8sCSEIkw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1730992126; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KSjlVB/tCxG/hK6mCg5S2Bydfu62JEN8jSgv282MD+0=; 
	b=X3lKTXtGu4FSK0oA1hm8hRYv+l/GX9MkEgpb2JIZvTwJeLm7jE4hMLpZ5s3bIu9x4lZM/r2ROcaT4dEn7yQo8BTGQACe0+0dMxzxGdwGVClFzsCu59x8UeCS3bMsg3rJsTloPZ/xva2KwM+Da2BCRVs2ViGtgtspOmCUxBQJImM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730992126;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=KSjlVB/tCxG/hK6mCg5S2Bydfu62JEN8jSgv282MD+0=;
	b=tlOroXzDUwwdHCh9+ljeQLzA/aebjcd9D58WTsJpuB1I03CZdra69k21NDt5DNN2
	2AoBHDJY/Qz6eO9Vh0M/siKhnxjT0d3wvAicwJDzyNdBpdWz/Wi8M9kGai1w4aeC/4J
	vCklvUrnfGmFRA8xPA+JxcAX9eDG/xbFMHoD1ctI=
Message-ID: <bc6dab85-75a6-4bb2-83cc-884bc07650f5@apertussolutions.com>
Date: Thu, 7 Nov 2024 10:08:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/12] x86/boot: eliminate module_map
To: Jan Beulich <jbeulich@suse.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241102172551.17233-1-dpsmith@apertussolutions.com>
 <20241102172551.17233-3-dpsmith@apertussolutions.com>
 <d32a3eb9-c0cb-4f87-9f88-4fc0d32cf1e8@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <d32a3eb9-c0cb-4f87-9f88-4fc0d32cf1e8@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 11/7/24 05:05, Jan Beulich wrote:
> On 02.11.2024 18:25, Daniel P. Smith wrote:
>> --- a/xen/arch/x86/cpu/microcode/core.c
>> +++ b/xen/arch/x86/cpu/microcode/core.c
>> @@ -790,15 +790,13 @@ static int __init early_microcode_load(struct boot_info *bi)
>>   
>>       if ( opt_scan ) /* Scan for a CPIO archive */
>>       {
>> -        for ( idx = 1; idx < bi->nr_modules; ++idx )
>> +        for_each_boot_module_by_type(idx, bi, BOOTMOD_UNKNOWN)
>>           {
>> +            struct boot_module *bm = &bi->mods[idx];
> 
> pointer-to-const? You really want to get used to applying const to pointed-to
> types whenever possible. IOW ...

Yes, I have been trying to be more diligent to add them when possible. 
To the point that I have had to unwind some due to writes that must be 
done in later function calls they get passed. Obviously this is not one 
of those case and can fix this one.

>> --- a/xen/xsm/xsm_policy.c
>> +++ b/xen/xsm/xsm_policy.c
>> @@ -33,22 +33,18 @@
>>   int __init xsm_multiboot_policy_init(
>>       struct boot_info *bi, void **policy_buffer, size_t *policy_size)
>>   {
>> -    int i;
>> +    unsigned int i;
>>       int rc = 0;
>>       u32 *_policy_start;
>>       unsigned long _policy_len;
>>   
>> -    /*
>> -     * Try all modules and see whichever could be the binary policy.
>> -     * Adjust module_map for the module that is the binary policy.
>> -     */
>> -    for ( i = bi->nr_modules - 1; i >= 1; i-- )
>> +    /* Try all unknown modules and see whichever could be the binary policy. */
>> +    for_each_boot_module_by_type(i, bi, BOOTMOD_UNKNOWN)
>>       {
>> -        if ( !test_bit(i, bi->module_map) )
>> -            continue;
>> +        struct boot_module *bm = &bi->mods[i];
> 
> ... same here (and likely elsewhere in the series).

Nope, you can't const this one as that will cause this is at the tail 
end of the loop to fail:

+            bm->type = BOOTMOD_XSM_POLICY;

v/r,
dps

