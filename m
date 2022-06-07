Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0256B53FE64
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jun 2022 14:10:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.343182.568354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyY1p-0006xn-RK; Tue, 07 Jun 2022 12:09:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 343182.568354; Tue, 07 Jun 2022 12:09:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyY1p-0006uP-O4; Tue, 07 Jun 2022 12:09:45 +0000
Received: by outflank-mailman (input) for mailman id 343182;
 Tue, 07 Jun 2022 12:09:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dSew=WO=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nyY1o-0006uJ-Pr
 for xen-devel@lists.xenproject.org; Tue, 07 Jun 2022 12:09:44 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b58a84e1-e65a-11ec-bd2c-47488cf2e6aa;
 Tue, 07 Jun 2022 14:09:42 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 165460377364539.0024044712826;
 Tue, 7 Jun 2022 05:09:33 -0700 (PDT)
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
X-Inumbo-ID: b58a84e1-e65a-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; t=1654603779; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dPjRd8sYiMzP0IwITrb4TfhNnXFtLRstH2f17kz4Q2A72E+pptieTSWoZIpuMN0N00ZrJFScYrSRX4i3TYo269dkZxaCxvnuARTH8zPojtn86aipcO1p/KnA+MLEyH8t160wNmMBQKQN6VIFizhffGAkem04KW8kMB6XL+HCnWg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1654603779; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=ScXb0xdi8YgdMGfuuVK8ZgufA8fQmT/uIWL/VcY2uL0=; 
	b=QWTyTRTUvJyJ982Du1iWooSedRej7un+HfCj5zSiG+gGfxBnIfvaFpVL8MyL/GagyFlNOYc8yyPI/paiz0fpS3MxhshVYFmW7s+a74kYgcnYBo80k9Goo+w5LKlyqijr1irOxIS9Y3ScKMTlu4Vbmu8XK1Lh9EI2tySF3pezclo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1654603779;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ScXb0xdi8YgdMGfuuVK8ZgufA8fQmT/uIWL/VcY2uL0=;
	b=mikFuU57+OfEbK7MamU6otc2gID4KI4ke+QFDHHMsEOiqWqGzjNhf45u0QNlXK5S
	yq/I6IB59SfCM+iV+2ujMiO9Gjd4yG8FPafiGNGDv1lVHD/oVPmNhZKxbe2QCPfRl2Y
	fJMHdMlo9SUhwWr3gGm27nCnN59ulftPtXO3+M2w=
Message-ID: <f51609ea-765a-034c-a5ca-845bad6ad5ed@apertussolutions.com>
Date: Tue, 7 Jun 2022 08:07:57 -0400
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
 <604e79d6-d07f-1a28-83a0-55fede499e12@apertussolutions.com>
 <7716ff49-a306-9938-0e91-aad45deef313@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <7716ff49-a306-9938-0e91-aad45deef313@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 6/1/22 02:04, Jan Beulich wrote:
> On 31.05.2022 18:15, Daniel P. Smith wrote:
>>
>> On 5/31/22 11:51, Jan Beulich wrote:
>>> On 31.05.2022 17:08, Daniel P. Smith wrote:
>>>> It is possible to select a few different build configurations that results in
>>>> the unnecessary walking of the boot module list looking for a policy module.
>>>> This specifically occurs when the flask policy is enabled but either the dummy
>>>> or the SILO policy is selected as the enforcing policy. This is not ideal for
>>>> configurations like hyperlaunch and dom0less when there could be a number of
>>>> modules to be walked or doing an unnecessary device tree lookup.
>>>>
>>>> This patch introduces the policy_file_required flag for tracking when an XSM
>>>> policy module requires a policy file. Only when the policy_file_required flag
>>>> is set to true, will XSM search the boot modules for a policy file.
>>>>
>>>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>>>
>>> Looks technically okay, so
>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>> but couldn't you ...
>>>
>>>> @@ -148,7 +160,7 @@ int __init xsm_multiboot_init(
>>>>  
>>>>      printk("XSM Framework v" XSM_FRAMEWORK_VERSION " initialized\n");
>>>>  
>>>> -    if ( XSM_MAGIC )
>>>> +    if ( policy_file_required && XSM_MAGIC )
>>>>      {
>>>>          ret = xsm_multiboot_policy_init(module_map, mbi, &policy_buffer,
>>>>                                          &policy_size);
>>>> @@ -176,7 +188,7 @@ int __init xsm_dt_init(void)
>>>>  
>>>>      printk("XSM Framework v" XSM_FRAMEWORK_VERSION " initialized\n");
>>>>  
>>>> -    if ( XSM_MAGIC )
>>>> +    if ( policy_file_required && XSM_MAGIC )
>>>>      {
>>>>          ret = xsm_dt_policy_init(&policy_buffer, &policy_size);
>>>>          if ( ret )
>>>
>>> ... drop the two "&& XSM_MAGIC" here at this time? Afaict policy_file_required
>>> cannot be true when XSM_MAGIC is zero.
>>
>> I was on the fence about this, as it should be rendered as redundant as
>> you point out. I am good with dropping on next spin.
> 
> I'd also be okay dropping this while committing, unless a v4 appears
> first ...

ack

v/r,
dps

