Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A973C9ED43F
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 18:59:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855207.1268211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLQzY-0005uN-SN; Wed, 11 Dec 2024 17:59:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855207.1268211; Wed, 11 Dec 2024 17:59:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLQzY-0005sk-PH; Wed, 11 Dec 2024 17:59:20 +0000
Received: by outflank-mailman (input) for mailman id 855207;
 Wed, 11 Dec 2024 17:59:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lbUB=TE=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tLQzX-0005se-PE
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 17:59:19 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a31916fe-b7e9-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 18:59:17 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 173393994988872.60557394017133;
 Wed, 11 Dec 2024 09:59:09 -0800 (PST)
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
X-Inumbo-ID: a31916fe-b7e9-11ef-a0d5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1733939953; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hqxRH5RV7htdgT7GRVx8ZiV5cW3j0gf7biq49LzS4fsk68BwR6hGq86Thk3KT2aBgjLTwwoYLql1ZxCbbR23gGyxXeiVtO3qbr/IFZa+wAfYO+oj3btiFxPulzQ7yWOnwpQwcj8Ey2TJTBzCZYPbVw19CJyX4x0BuiFxOkVIc/g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1733939953; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=aUUQXotjCoae9FguMP4BnsvFjSve1T6Oc0EOyn8t6SM=; 
	b=D80qysFUmnfdm8MeqtMktXF7bGuL5Qrj1Mc3ojiOpzg3ptUUGqyfmheiUYHFfXy1TVXyFNqkWfsbLxRaubiSl0kp25wKgP88zMoJYP4ukPdnGgDOsAAM0/IpucRisBlcTJWcvIzxe1an1HUY2ZqEm/ecdFrur8+7fV7mEcJhZ9k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733939953;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=aUUQXotjCoae9FguMP4BnsvFjSve1T6Oc0EOyn8t6SM=;
	b=ZF4SmA1DxFcDbjuJtm8k77NZu8o+rUN4ubukGQAA6CmuGmf0OWejs9wgsZUSHyiH
	XyvpRC0S0w546b7Rc9MvmK0VqhzbAQAMhMrrjwgekuohh66mgEMHww/z6TQT+M4JYZ7
	3xi7455gjW4/tyQ028J5Mfb1scwa0/ZEQRRy8rWg=
Message-ID: <8072fa09-1e3c-43a7-a36c-4c965314ac22@apertussolutions.com>
Date: Wed, 11 Dec 2024 12:59:08 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/15] x86/hyperlaunch: add memory parsing to domain
 config
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-14-dpsmith@apertussolutions.com>
 <4c4d8cf0-cc31-4042-8efb-892f56047d11@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <4c4d8cf0-cc31-4042-8efb-892f56047d11@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 11/25/24 19:03, Jason Andryuk wrote:
> On 2024-11-23 13:20, Daniel P. Smith wrote:
>> Add three properties, memory, mem-min, and mem-max, to the domain node 
>> device
>> tree parsing to define the memory allocation for a domain. All three 
>> fields are
>> expressed in kb and written as a u64 in the device tree entries.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
> 
>> diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
>> index c231191faec7..1c3b7ff0e658 100644
>> --- a/xen/arch/x86/dom0_build.c
>> +++ b/xen/arch/x86/dom0_build.c
>> @@ -609,6 +609,14 @@ int __init construct_dom0(struct boot_domain *bd)
>>       process_pending_softirqs();
>> +    /* If param dom0_size was not set and HL config provided memory 
>> size */
>> +    if ( !get_memsize(&dom0_size, LONG_MAX) && bd->mem_pages )
>> +        dom0_size.nr_pages = bd->mem_pages;
>> +    if ( !get_memsize(&dom0_min_size, LONG_MAX) && bd->min_pages )
>> +        dom0_size.nr_pages = bd->min_pages;
>> +    if ( !get_memsize(&dom0_max_size, LONG_MAX) && bd->max_pages )
>> +        dom0_size.nr_pages = bd->max_pages;
>> +
> 
> This placement seems a little random.  Can this move into 
> dom0_compute_nr_pages()?

As I started to rebase the multi-domain code around all the changes that 
happened under the boot module review, dom0_compute_nr_pages() became a 
mess to work with again. The result does see this drop in favor of 
handling during dom_compute_nr_pages(). I will look to back port that 
refactoring to here.

v/r,
dps

