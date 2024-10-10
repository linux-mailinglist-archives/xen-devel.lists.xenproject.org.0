Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2226E9979CA
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 02:49:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815316.1229037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syhMQ-00044k-I7; Thu, 10 Oct 2024 00:48:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815316.1229037; Thu, 10 Oct 2024 00:48:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syhMQ-00041p-Ep; Thu, 10 Oct 2024 00:48:58 +0000
Received: by outflank-mailman (input) for mailman id 815316;
 Thu, 10 Oct 2024 00:48:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RAAn=RG=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1syhMO-0003zA-Fk
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 00:48:56 +0000
Received: from sender3-of-o59.zoho.com (sender3-of-o59.zoho.com
 [136.143.184.59]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c483ac2-86a1-11ef-a0bd-8be0dac302b0;
 Thu, 10 Oct 2024 02:48:55 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728521327947535.3189888307714;
 Wed, 9 Oct 2024 17:48:47 -0700 (PDT)
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
X-Inumbo-ID: 6c483ac2-86a1-11ef-a0bd-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1728521330; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RP1K6fjitmnKWpbyLLfm2Mmspb+2/k/+C5shkF3JFXW6iKszLKLXHT/MoUmEGdSW5zzYdfapAJJPQSKtk2xTlyNWGdmOqbLOMJQO3vrKSXAX0nU+4aA2tE4gEEuJCJHocSJw1hJlr6MvFAOfHaWvY0aZJU9hkEYFByrR85n3iWE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728521330; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=a3VU1X5SA5I7VYI789eu+HfeUv6MaDgsObZz5TaOGpQ=; 
	b=DcQxUhXU4ICvrNKDME13tsAqPY37m58mStP6LOykYLBO0pXrC/oqYU/SPcyVNRKmjx9lqKD8D05fyW9AcMs/MPjAU1WoQt2kIOpIrRHvKOjvWKaSh5ML6BekzSp0rNcf9QItqNFDxVSboh5OyVfXs3qU9gOOgtEgFDUv8Lsy0Dc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728521330;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=a3VU1X5SA5I7VYI789eu+HfeUv6MaDgsObZz5TaOGpQ=;
	b=qv0pwbjXw5T6vW/HZlWbQIn18wyU2w5QKSr28IA95xJ91gCwI7HsXi8rTEw9ItrH
	lifmG+txO6cgH4dvGzzIG+ji62tWpwbg21C8VYUKlyoTaejOyk5dgjYdUlAqWVVgeEC
	uMCfeNrTmV014bRKNyYgboMRaKRxBzVNGEqRKaeQ=
Message-ID: <8a881a8c-0ef5-4ca1-bd31-2651b064a26a@apertussolutions.com>
Date: Wed, 9 Oct 2024 20:48:46 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 42/44] x86/boot: convert construct_dom0 to struct
 boot_domain
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-43-dpsmith@apertussolutions.com>
 <b6429ff7-207d-4247-9bc7-4875a68a2b68@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <b6429ff7-207d-4247-9bc7-4875a68a2b68@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/8/24 15:47, Jason Andryuk wrote:
> On 2024-10-06 17:49, Daniel P. Smith wrote:
>> A struct boot_domain now encapsulates the domain reference, kernel, 
>> ramdisk,
>> and command line for the domain being constructed. As a result of this
>> encapsulation, construct_dom0 can now take a single struct boot_domain 
>> instead
>> of these four parameters.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>   xen/arch/x86/dom0_build.c        | 19 +++++++++----------
>>   xen/arch/x86/include/asm/setup.h |  4 +---
>>   xen/arch/x86/setup.c             |  2 +-
>>   3 files changed, 11 insertions(+), 14 deletions(-)
>>
>> diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
>> index 71b2e3afc1a1..e552f2e9abef 100644
>> --- a/xen/arch/x86/dom0_build.c
>> +++ b/xen/arch/x86/dom0_build.c
>> @@ -597,22 +597,21 @@ int __init dom0_setup_permissions(struct domain *d)
>>       return rc;
>>   }
>> -int __init construct_dom0(struct domain *d, const struct boot_module 
>> *image,
>> -                          struct boot_module *initrd, const char 
>> *cmdline)
>> +int __init construct_dom0(struct boot_domain *bd)
>>   {
>>       int rc;
> 
> I think a local variable would be better:
> 
>      struct domain *d = bd->d;
> 
> The patch is smaller, and using just d is common in the hypervisor.

Ack.

v/r,
dps

