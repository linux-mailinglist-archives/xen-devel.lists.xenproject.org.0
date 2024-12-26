Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4599FCBCC
	for <lists+xen-devel@lfdr.de>; Thu, 26 Dec 2024 17:17:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863226.1274639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQqX3-0005d7-N9; Thu, 26 Dec 2024 16:16:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863226.1274639; Thu, 26 Dec 2024 16:16:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQqX3-0005bh-H8; Thu, 26 Dec 2024 16:16:17 +0000
Received: by outflank-mailman (input) for mailman id 863226;
 Thu, 26 Dec 2024 16:16:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vkhu=TT=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tQqX2-0005bb-4p
 for xen-devel@lists.xenproject.org; Thu, 26 Dec 2024 16:16:16 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b95ac171-c3a4-11ef-a0da-8be0dac302b0;
 Thu, 26 Dec 2024 17:16:14 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1735229765773367.7759362648453;
 Thu, 26 Dec 2024 08:16:05 -0800 (PST)
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
X-Inumbo-ID: b95ac171-c3a4-11ef-a0da-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1735229767; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=a7B9U03m7oglKjoxJdzbsAqRmCNMdY715+dstrtLbYuIAmfWGHI38TjGikOtVcArZH5CuuJhNSsoUzTJZYG8MSbaoL5z8TmiF/xXSgdnnzMmK65FNcwO+T3pc8G8D+uJej/Ef4oPvXF8GHyud6wCPuw3YFE4ZaoqZnnErRwlqfc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1735229767; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=YqqKeyet+2uUgrlg44C8mno8IzfJtoe6MzUCfi5C2wo=; 
	b=gz8QZ3Gi3q72ZeSylQ3A62sfOi79i26LQgOcbvx4OE5eIooaeQz824NyA02ACLdB3pSluVar9BY3gjSdfR2zI7oov1faMxFsS13kQYTQeAktykVOO3hIAskb3VhGbzP+mN0al7nrPNDeZ2ar+sHZzWXCItCNlTbQ0D5Sl6K6CL0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1735229767;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:From:From:To:To:Cc:Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=YqqKeyet+2uUgrlg44C8mno8IzfJtoe6MzUCfi5C2wo=;
	b=rNLlcdT4kXEBUbaFleHQSF3Ev6FJ2GbnLXFDaEHOGWsItNNqh5saxRc/ZTS+l1iW
	N/hjbg7VDFIxUvPuur0jdKHq1m3cjY7Xu88cVU9OXHSNgu+1ZBIiqTJEoR4e1/q4AnE
	kfkVlUpiOnmUHVREVb8OBTL7WOQslKiNC28ZjXuc=
Message-ID: <420a0920-cb18-4294-9dc6-3b564843ba89@apertussolutions.com>
Date: Thu, 26 Dec 2024 11:16:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/15] x86/hyperlaunch: add memory parsing to domain
 config
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-14-dpsmith@apertussolutions.com>
 <4c4d8cf0-cc31-4042-8efb-892f56047d11@amd.com>
 <8072fa09-1e3c-43a7-a36c-4c965314ac22@apertussolutions.com>
Content-Language: en-US
In-Reply-To: <8072fa09-1e3c-43a7-a36c-4c965314ac22@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 12/11/24 12:59, Daniel P. Smith wrote:
> On 11/25/24 19:03, Jason Andryuk wrote:
>> On 2024-11-23 13:20, Daniel P. Smith wrote:
>>> Add three properties, memory, mem-min, and mem-max, to the domain 
>>> node device
>>> tree parsing to define the memory allocation for a domain. All three 
>>> fields are
>>> expressed in kb and written as a u64 in the device tree entries.
>>>
>>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>>> ---
>>
>>> diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
>>> index c231191faec7..1c3b7ff0e658 100644
>>> --- a/xen/arch/x86/dom0_build.c
>>> +++ b/xen/arch/x86/dom0_build.c
>>> @@ -609,6 +609,14 @@ int __init construct_dom0(struct boot_domain *bd)
>>>       process_pending_softirqs();
>>> +    /* If param dom0_size was not set and HL config provided memory 
>>> size */
>>> +    if ( !get_memsize(&dom0_size, LONG_MAX) && bd->mem_pages )
>>> +        dom0_size.nr_pages = bd->mem_pages;
>>> +    if ( !get_memsize(&dom0_min_size, LONG_MAX) && bd->min_pages )
>>> +        dom0_size.nr_pages = bd->min_pages;
>>> +    if ( !get_memsize(&dom0_max_size, LONG_MAX) && bd->max_pages )
>>> +        dom0_size.nr_pages = bd->max_pages;
>>> +
>>
>> This placement seems a little random.  Can this move into 
>> dom0_compute_nr_pages()?
> 
> As I started to rebase the multi-domain code around all the changes that 
> happened under the boot module review, dom0_compute_nr_pages() became a 
> mess to work with again. The result does see this drop in favor of 
> handling during dom_compute_nr_pages(). I will look to back port that 
> refactoring to here.

Before sending out v2, wanted to respond back that I did not see an 
immediate way to move this up to dom0_compute_nr_pages() without bring 
in a series of unrelated changes.

v/r,
dps


