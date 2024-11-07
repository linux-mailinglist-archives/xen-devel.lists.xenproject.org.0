Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 296A19C09F5
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 16:21:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832024.1247424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t94Jc-0000UF-83; Thu, 07 Nov 2024 15:20:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832024.1247424; Thu, 07 Nov 2024 15:20:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t94Jc-0000RT-4W; Thu, 07 Nov 2024 15:20:56 +0000
Received: by outflank-mailman (input) for mailman id 832024;
 Thu, 07 Nov 2024 15:20:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9PMW=SC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t94Jb-0000R7-5W
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 15:20:55 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de1e845c-9d1b-11ef-a0c6-8be0dac302b0;
 Thu, 07 Nov 2024 16:20:50 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1730992841286423.78284299951997;
 Thu, 7 Nov 2024 07:20:41 -0800 (PST)
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
X-Inumbo-ID: de1e845c-9d1b-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6ImRlMWU4NDVjLTlkMWItMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTkyODUwLjczOTg5LCJzZW5kZXIiOiJkcHNtaXRoQGFwZXJ0dXNzb2x1dGlvbnMuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=1; a=rsa-sha256; t=1730992842; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=h52WZWOC9y9F//b25eN81aMqkH21pn4MDFZJA6xBrsr32GgGxAfciN/Rx8F9EBi/129EuGgavmOM834IvAiRUT4PZdzxHYFVWMnhgAJ64obXFduPU9uQlNLHL4iowPCKOsAObawmID+Ij0W2t2tnjQN4CRNMsNEQ/9NUpgI+T40=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1730992842; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=e7pUCQEXiwbHmhXpKP5ghbovuABm4HGgLAe3v5b9E3g=; 
	b=hXplxh2bF5WvY+jh5NzYxsfSMuop8DsCy+7yVxwI3VedsHOstmQC0RrAi3rYmxsHs9oARa8PvE5ivIY/tGM0vRVA5pKKS2zXyNL9FwfrKRsV3hCLoyl77rx63eP1HriMohEEF5dtaiW2UJGhNw2yqAhLVQnmWSR4L+7pspG109o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730992842;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=e7pUCQEXiwbHmhXpKP5ghbovuABm4HGgLAe3v5b9E3g=;
	b=NhKj6hPuMqWuvwQ6wLio3JogxMxQ+VZxcvxFLpYk4iE9/5E6enkH733Mp08g/2iE
	P8yc/Xmpe7Yaq1+1HGNCoTGUBzbhiGNu5GynhNLTEHSOdNJtmQMJSebx2WZ1iDShyBI
	2a28YlPseBy/Lmo1lqijYi0Bn6mw0ibpp72y3DqM=
Message-ID: <63f5ad89-5221-4d2b-b6d2-aec78fa3d0dd@apertussolutions.com>
Date: Thu, 7 Nov 2024 10:20:39 -0500
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
 <bc6dab85-75a6-4bb2-83cc-884bc07650f5@apertussolutions.com>
 <4c40ca3e-73ab-402b-b5f9-23146ec14e60@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <4c40ca3e-73ab-402b-b5f9-23146ec14e60@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 11/7/24 10:15, Jan Beulich wrote:
> On 07.11.2024 16:08, Daniel P. Smith wrote:
>> On 11/7/24 05:05, Jan Beulich wrote:
>>> On 02.11.2024 18:25, Daniel P. Smith wrote:
>>>> --- a/xen/xsm/xsm_policy.c
>>>> +++ b/xen/xsm/xsm_policy.c
>>>> @@ -33,22 +33,18 @@
>>>>    int __init xsm_multiboot_policy_init(
>>>>        struct boot_info *bi, void **policy_buffer, size_t *policy_size)
>>>>    {
>>>> -    int i;
>>>> +    unsigned int i;
>>>>        int rc = 0;
>>>>        u32 *_policy_start;
>>>>        unsigned long _policy_len;
>>>>    
>>>> -    /*
>>>> -     * Try all modules and see whichever could be the binary policy.
>>>> -     * Adjust module_map for the module that is the binary policy.
>>>> -     */
>>>> -    for ( i = bi->nr_modules - 1; i >= 1; i-- )
>>>> +    /* Try all unknown modules and see whichever could be the binary policy. */
>>>> +    for_each_boot_module_by_type(i, bi, BOOTMOD_UNKNOWN)
>>>>        {
>>>> -        if ( !test_bit(i, bi->module_map) )
>>>> -            continue;
>>>> +        struct boot_module *bm = &bi->mods[i];
>>>
>>> ... same here (and likely elsewhere in the series).
>>
>> Nope, you can't const this one as that will cause this is at the tail
>> end of the loop to fail:
>>
>> +            bm->type = BOOTMOD_XSM_POLICY;
> 
> Oh, I had managed to not spot that.

No worries. As I said, I have been trying to develop the habit to check 
if write usage will be needed, const-ing and then finding myself often 
greeted with gcc error about write to const. Wish gcc could warn about 
pointers that have no writes in scope to help catch viable candidates.

v/r,
dps

