Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCEBA905BF
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 16:12:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956289.1349754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u53Ut-0006no-63; Wed, 16 Apr 2025 14:12:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956289.1349754; Wed, 16 Apr 2025 14:12:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u53Ut-0006m7-39; Wed, 16 Apr 2025 14:12:15 +0000
Received: by outflank-mailman (input) for mailman id 956289;
 Wed, 16 Apr 2025 14:12:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S7a8=XC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1u53Us-0006ll-3I
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 14:12:14 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c97b0452-1acc-11f0-9ffb-bf95429c2676;
 Wed, 16 Apr 2025 16:12:11 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1744812723172683.7635562943351;
 Wed, 16 Apr 2025 07:12:03 -0700 (PDT)
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
X-Inumbo-ID: c97b0452-1acc-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; t=1744812725; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QHNLL+5vmdKvqVw1qzJgvTbiYi0Bnehjd0xotZRy83b3a/19/HT5cQOgcMF5093r3ZnE8oGrBVccAOvnZz0Sd1E8q9rm+U79JQav6qkrijutMd1DumltC4aEcKlVD8UsZCRTXI8WIUvINqivELsVVSMKc1wdjvGyboEIe82Xe1g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744812725; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HjHIDCJ6vhRgTl/TRb3i+ubzpsPbyIkzA8+8I4xIEiU=; 
	b=DMeFLj43iMxs36/7uwgRBOQtfniYZYlatnOQnWTCF8Bj3z5zb8DBZXE6d49Px3JO5DESYOPZQLvyC1r1y11HmuU9t+fhYHsKbek4lAWki7Ibs1Le7FPrDwmWWLAquw607DB+vTBR7NjC13JBx3JqVGegZxnprlfZV/NtjUD8xQ8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744812725;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=HjHIDCJ6vhRgTl/TRb3i+ubzpsPbyIkzA8+8I4xIEiU=;
	b=qV5JEjZAsO2dGbqZhyUM8MNPwxVHrWcnqCFFZrbCSMX1khsjpTvAkhlss+mbZTUR
	n0Fk3NQNu4/ftKob07vrDMinJbO+2DHqMQ+tc6gDl5RyxilDWhDsXhu4Gi09bD2xu3x
	VabSjakMqSZ+WCvsdd7BlZP/B/i+BmCD9KV8SMog=
Message-ID: <d47ce533-bc0a-472f-ad11-e350150410b9@apertussolutions.com>
Date: Wed, 16 Apr 2025 10:12:01 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/16] x86/hyperlaunch: add memory parsing to domain
 config
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org, Alejandro Vallejo <agarciav@amd.com>
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-15-agarciav@amd.com>
 <e78824bc-3b0a-406e-80ac-5a67b127254f@suse.com>
 <2fe06df0-ee92-4466-a532-ff246efffdac@apertussolutions.com>
 <1c12c10f-02e3-4b12-a890-205d3fa0ca39@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <1c12c10f-02e3-4b12-a890-205d3fa0ca39@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External



V/r,
Daniel P. Smith
Apertus Solutions, LLC

On 4/16/25 09:41, Jan Beulich wrote:
> On 16.04.2025 15:37, Daniel P. Smith wrote:
>> On 4/10/25 08:03, Jan Beulich wrote:
>>> On 08.04.2025 18:07, Alejandro Vallejo wrote:
>>>> @@ -212,6 +213,39 @@ static int __init process_domain_node(
>>>>                else
>>>>                    printk("PV\n");
>>>>            }
>>>> +        else if ( strncmp(prop_name, "memory", name_len) == 0 )
>>>> +        {
>>>> +            uint64_t kb;
>>>> +            if ( fdt_prop_as_u64(prop, &kb) != 0 )
>>>
>>> Nit (you know what I have to say here, and again below.)
>>>
>>>> +            {
>>>> +                printk("  failed processing memory for domain %s\n", name);
>>>> +                return -EINVAL;
>>>
>>> Any reason to override fdt_prop_as_u64()'s return value here?
>>
>> IMHO this should be a function that libfdt should provide, but altering
>> libftd directly would make uprev'ing it challenging. The least I could
>> do is make the function behave like the rest of libfdt's helper functions.
> 
> How's this related to the question that I raised? I didn't question the
> function, but a particular aspect of the specific use that is being made
> of it here.

Your question was, "Any reason to override fdt_prop_as_u64()'s return 
value here?"

And my answer was, I copied libfdt's behavior for its helper functions. 
IOW, to have the helper behave like libfdt's other helper functions.

v/r,
dps

