Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2B95394DD
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 18:18:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339878.564792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw4Ye-00018S-Gy; Tue, 31 May 2022 16:17:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339878.564792; Tue, 31 May 2022 16:17:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw4Ye-00016d-D1; Tue, 31 May 2022 16:17:24 +0000
Received: by outflank-mailman (input) for mailman id 339878;
 Tue, 31 May 2022 16:17:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xfyb=WH=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nw4Yd-0000Ue-93
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 16:17:23 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 258afb33-e0fd-11ec-837f-e5687231ffcc;
 Tue, 31 May 2022 18:17:21 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 16540138379315.054051441504043;
 Tue, 31 May 2022 09:17:17 -0700 (PDT)
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
X-Inumbo-ID: 258afb33-e0fd-11ec-837f-e5687231ffcc
ARC-Seal: i=1; a=rsa-sha256; t=1654013839; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Lp0cZBacg2y9/sc5/afICGrKtarrhdLwoXwFUumbt4zSohnuao5/VCAvRuma2znsk7czKXBawFUlSj5iqGMaM75iKyf4T8MQYMpLAKQ+CDOIa13RwWu79cTRJoHl65bFpxY7VHYjDq3008iipKopNm4OMnATBNXT5VyMgOwo79c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1654013839; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=vrGrsXsKMeGJYOjt6Ch9wm5kkhtaTzHolvvolDcSGk4=; 
	b=XTUmsg2kUotzjzg7Taxy/iBPuh7cDhCLzIskHJtJ34GtndYAeOGolxcQ8vO9kFwKgRW24rGv+NSrXUzFuhBcGzwyt6x1bfOla42QDJIXvzDYaE2IU7S6z/9zwf5TXDcivjZ2UswCIwe9M/vVR1u62+dTO0rkQpiSc7wjtRA9SfM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1654013839;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=vrGrsXsKMeGJYOjt6Ch9wm5kkhtaTzHolvvolDcSGk4=;
	b=jGc7OKLbf9oS2/4oMunYLbM7svks/dpo2QflI4sGAQVWhWzsXXUfN/z2VT7EJqT2
	TxRzghO4DV0g+/t08p4oLwGdYBMUTgeH+3LUkgMwJjTyLgXY/773MH8viwxs35GF00S
	xKXc63gN+/s4Xbv4EfxM9uVha+3U5wAEokQW8bOE=
Message-ID: <604e79d6-d07f-1a28-83a0-55fede499e12@apertussolutions.com>
Date: Tue, 31 May 2022 12:15:48 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 1/3] xsm: only search for a policy file when needed
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io, jandryuk@gmail.com,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org
References: <20220531150857.19727-1-dpsmith@apertussolutions.com>
 <20220531150857.19727-2-dpsmith@apertussolutions.com>
 <1358771f-32ae-8a6b-9894-980014d7112c@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <1358771f-32ae-8a6b-9894-980014d7112c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External


On 5/31/22 11:51, Jan Beulich wrote:
> On 31.05.2022 17:08, Daniel P. Smith wrote:
>> It is possible to select a few different build configurations that results in
>> the unnecessary walking of the boot module list looking for a policy module.
>> This specifically occurs when the flask policy is enabled but either the dummy
>> or the SILO policy is selected as the enforcing policy. This is not ideal for
>> configurations like hyperlaunch and dom0less when there could be a number of
>> modules to be walked or doing an unnecessary device tree lookup.
>>
>> This patch introduces the policy_file_required flag for tracking when an XSM
>> policy module requires a policy file. Only when the policy_file_required flag
>> is set to true, will XSM search the boot modules for a policy file.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
> Looks technically okay, so
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> but couldn't you ...
> 
>> @@ -148,7 +160,7 @@ int __init xsm_multiboot_init(
>>  
>>      printk("XSM Framework v" XSM_FRAMEWORK_VERSION " initialized\n");
>>  
>> -    if ( XSM_MAGIC )
>> +    if ( policy_file_required && XSM_MAGIC )
>>      {
>>          ret = xsm_multiboot_policy_init(module_map, mbi, &policy_buffer,
>>                                          &policy_size);
>> @@ -176,7 +188,7 @@ int __init xsm_dt_init(void)
>>  
>>      printk("XSM Framework v" XSM_FRAMEWORK_VERSION " initialized\n");
>>  
>> -    if ( XSM_MAGIC )
>> +    if ( policy_file_required && XSM_MAGIC )
>>      {
>>          ret = xsm_dt_policy_init(&policy_buffer, &policy_size);
>>          if ( ret )
> 
> ... drop the two "&& XSM_MAGIC" here at this time? Afaict policy_file_required
> cannot be true when XSM_MAGIC is zero.

I was on the fence about this, as it should be rendered as redundant as
you point out. I am good with dropping on next spin.

v/r,
dps

