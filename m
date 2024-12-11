Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4CC9ECCA4
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 13:56:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854787.1267905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLMG6-0002Uc-Qq; Wed, 11 Dec 2024 12:56:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854787.1267905; Wed, 11 Dec 2024 12:56:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLMG6-0002SY-N2; Wed, 11 Dec 2024 12:56:06 +0000
Received: by outflank-mailman (input) for mailman id 854787;
 Wed, 11 Dec 2024 12:56:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lbUB=TE=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tLMG4-0002S9-Ni
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 12:56:04 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45555380-b7bf-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 13:56:01 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1733921754815984.1324331564064;
 Wed, 11 Dec 2024 04:55:54 -0800 (PST)
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
X-Inumbo-ID: 45555380-b7bf-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1733921756; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Lsl2ylJLN41Tku0prPda7vepjA4owF1bl6PyPeFIFS4+UK17HBb/W0zKhBRqi7djk+DK9/sUy8pX80expII4tfop5QZ4iMK9PbAgL/2ltWjSQHLKB7mN+jfYbVePNSqCkNYmYPuRPBIJyzms9nwqcBAtUdVYICs7FLghXR90hw0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1733921756; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WqCnRw5mQECy6J4x3YUdWuo+CzPSZcc+qQtrCAgcYAs=; 
	b=f5bzd4Se7mPy/M/1tVaw3YbZvjaxeyal0DVmJFIzrHyIgDC+xXPjAqsIunOixkpXK52hfYwQBAs/pHeXAPlyvfwgMAeQxEbYGcdLPHLEtTax3jQSJmzUq3+W3uUjGtkum6TBE1tSjMpw4HkhinC8Kd1Osi7ANxyTcINU2yXwBds=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733921756;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=WqCnRw5mQECy6J4x3YUdWuo+CzPSZcc+qQtrCAgcYAs=;
	b=NJ9V+UN2HIkGOhoz7hPUpENcBCWYfLCxSWUphhk9EPHZoaVdSKrIbZeldlKIAOEb
	KVdEqdTardywBv3Eur3R1M6S3pdE3IlMrbtodjl3CLhLaBnZ1xrhscJB+zbIggREO2x
	DPNm/7yQb4qDI1BFMhaShsbjXMpgerQBGwmlRQAE=
Message-ID: <aa8c6dd3-620a-4caa-a301-f5319ca1a63c@apertussolutions.com>
Date: Wed, 11 Dec 2024 07:55:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/15] x86/hyperlaunch: initial support for hyperlaunch
 device tree
To: Jan Beulich <jbeulich@suse.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-8-dpsmith@apertussolutions.com>
 <bf3edc2e-1bef-45c3-9853-a8a208d8888f@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <bf3edc2e-1bef-45c3-9853-a8a208d8888f@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 12/2/24 06:37, Jan Beulich wrote:
> On 23.11.2024 19:20, Daniel P. Smith wrote:
>> Add the ability to detect both a formal hyperlaunch device tree or a dom0less
>> device tree. If the hyperlaunch device tree is found, then count the number of
>> domain entries, reporting if more than one is found.
> 
> "reporting" reads like informational logging, when comment and printk() in
> walk_hyperlaunch_fdt() indicate this is actually an error (for now).

That is not a shared assumptive reading. It is equally correct to say I 
will report info and I will report an error. With that said, I can make 
it explicit.

>> --- a/xen/arch/x86/domain_builder/fdt.c
>> +++ b/xen/arch/x86/domain_builder/fdt.c
>> @@ -14,14 +14,76 @@
>>   
>>   #include "fdt.h"
>>   
>> +static int __init find_hyperlaunch_node(void *fdt)
>> +{
>> +    int hv_node = fdt_path_offset(fdt, "/chosen/hypervisor");
>> +    if ( hv_node >= 0 )
> 
> Nit: Blank line between declaration(s) and statement(s) please (also
> elsewhere).

ack.

>> --- a/xen/arch/x86/domain_builder/fdt.h
>> +++ b/xen/arch/x86/domain_builder/fdt.h
>> @@ -11,11 +11,16 @@
>>   
>>   #ifdef CONFIG_DOMAIN_BUILDER
>>   int has_hyperlaunch_fdt(struct boot_info *bi);
>> +int walk_hyperlaunch_fdt(struct boot_info *bi);
>>   #else
>>   static inline int __init has_hyperlaunch_fdt(struct boot_info *bi)
>>   {
>>       return -EINVAL;
>>   }
>> +static int __init walk_hyperlaunch_fdt(struct boot_info *bi)
> 
> inline?

Should have been.

v/r,
dps


