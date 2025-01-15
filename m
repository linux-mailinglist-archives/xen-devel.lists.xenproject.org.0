Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B51BA12A1B
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 18:48:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872971.1283970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY7Uc-0003aI-0s; Wed, 15 Jan 2025 17:47:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872971.1283970; Wed, 15 Jan 2025 17:47:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY7Ub-0003Xn-UK; Wed, 15 Jan 2025 17:47:49 +0000
Received: by outflank-mailman (input) for mailman id 872971;
 Wed, 15 Jan 2025 17:47:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3mb0=UH=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tY7Ua-0003Xh-6X
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 17:47:48 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d31eb316-d368-11ef-99a4-01e77a169b0f;
 Wed, 15 Jan 2025 18:47:45 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1736963259126220.9793921436053;
 Wed, 15 Jan 2025 09:47:39 -0800 (PST)
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
X-Inumbo-ID: d31eb316-d368-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1736963261; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JYWIOhZqImmzpqoVH6gpdDeE5eXipdmf3zhuhChtHW9peHmAp+TNaaTRMYI3pVIqisG8ILw7uzQ/kkEYYmOhkjQqY2CbGAChrqTIhm/1NHOABvfAAyDCyFo1ySM+omlMxSi2RXagQ/sQB2UN18lcJum2+//aLQfguilIgVC6Z10=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1736963261; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=f0hX9slKCdmAZPrw4d9Mc8tP6Sq7M8FYgsZIfrlpNqQ=; 
	b=Oaei4Kz4r3EzK1SAwlYyl2Jpe+RwEC3UcqcSuah9nMm8JDh0JdjLEHird38NtVvn64w8NRbG+u06NeuEUzeQ2Cb2QFumav6fIoQAqg9k3rZ6yJnC+DU9Zs3q8xs9nds1zl3rVSvvCAc5FFpc/U1TmHEeQtU2z188jYxtdU+04eU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736963261;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=f0hX9slKCdmAZPrw4d9Mc8tP6Sq7M8FYgsZIfrlpNqQ=;
	b=ruha0R5Oh506enUDt/gBgzB0lq/LqP7kN6lJAhzIsEoJV9yNKQXnoWtpLKwoUqOj
	9P4X2jYZckbeRyNKyttZhz0UjrVhpBbGt0eJA88p4WAHR0tx9ogb8M0RIwVhMFwUvuX
	G3i/64IlMwjkAdTxvWPZe3bzDWn9PGfT9PU9ZBQA=
Message-ID: <3f82f214-7a99-4b08-a494-347bbdb88ebd@apertussolutions.com>
Date: Wed, 15 Jan 2025 12:47:38 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/15] x86/hyperlaunch: initial support for hyperlaunch
 device tree
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241226165740.29812-1-dpsmith@apertussolutions.com>
 <20241226165740.29812-8-dpsmith@apertussolutions.com>
 <f02d01c0-2860-4645-b0a5-24cdc1415b12@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <f02d01c0-2860-4645-b0a5-24cdc1415b12@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 1/10/25 17:20, Jason Andryuk wrote:
> On 2024-12-26 11:57, Daniel P. Smith wrote:
>> Add the ability to detect both a formal hyperlaunch device tree or a 
>> dom0less
>> device tree. If the hyperlaunch device tree is found, then count the 
>> number of
>> domain entries, reporting an error if more than one is found.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
>> diff --git a/xen/arch/x86/domain-builder/fdt.c b/xen/arch/x86/domain- 
>> builder/fdt.c
>> index 4a3f80648f86..5793bdc9fd47 100644
>> --- a/xen/arch/x86/domain-builder/fdt.c
>> +++ b/xen/arch/x86/domain-builder/fdt.c
>> @@ -13,14 +13,77 @@
>>   #include "fdt.h"
>> +static int __init find_hyperlaunch_node(const void *fdt)
>> +{
>> +    int hv_node = fdt_path_offset(fdt, "/chosen/hypervisor");
>> +
>> +    if ( hv_node >= 0 )
>> +    {
>> +        /* Anything other than zero indicates no match */
>> +        if ( fdt_node_check_compatible(fdt, hv_node, "hypervisor,xen") )
>> +            return -ENODATA;
>> +        else
>> +            return hv_node;
>> +    }
>> +    else
>> +    {
>> +        /* Lood for dom0less config */
> 
> Look

Ack.

>> +        int node, chosen_node = fdt_path_offset(fdt, "/chosen");
>> +        if ( chosen_node < 0 )
>> +            return -ENOENT;
>> +
>> +        fdt_for_each_subnode(node, fdt, chosen_node)
>> +        {
>> +            if ( fdt_node_check_compatible(fdt, node, "xen,domain") 
>> == 0 )
>> +                return chosen_node;
>> +        }
>> +    }
>> +
>> +    return -ENODATA;
>> +}
>> +
>>   int __init has_hyperlaunch_fdt(struct boot_info *bi)
>>   {
>>       int ret = 0;
>>       const void *fdt = bootstrap_map_bm(&bi- 
>> >mods[HYPERLAUNCH_MODULE_IDX]);
>> -    if ( fdt_check_header(fdt) < 0 )
>> +    if ( !fdt || fdt_check_header(fdt) < 0 )
> 
> It seems to me the !fdt check should move into the earlier patch.  What 
> do you think?

You are correct, the two conditions should have been added together.


>>           ret = -EINVAL;
>> +    else
>> +        ret = find_hyperlaunch_node(fdt);
>> +
>> +    bootstrap_unmap();
>> +
>> +    return ret < 0 ? ret : 0;
>> +}
>> +
>> +int __init walk_hyperlaunch_fdt(struct boot_info *bi)
>> +{
>> +    int ret = 0, hv_node, node;
>> +    void *fdt = bootstrap_map_bm(&bi->mods[HYPERLAUNCH_MODULE_IDX]);
>> +
>> +    if ( unlikely(!fdt) )
>> +        return -EINVAL;
>> +
>> +    hv_node = find_hyperlaunch_node(fdt);
> 
> You call find_hyperlaunch_node() twice.  It seems like you can just have 
> has_hyperlaunch_fdt() return the node and pass it into this function.

Can do.

v/r,
dps

