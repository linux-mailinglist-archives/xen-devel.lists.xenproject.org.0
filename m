Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8849E3F8F
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2024 17:25:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.848646.1263485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIsB7-0005HO-6P; Wed, 04 Dec 2024 16:24:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 848646.1263485; Wed, 04 Dec 2024 16:24:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIsB7-0005Eg-3B; Wed, 04 Dec 2024 16:24:41 +0000
Received: by outflank-mailman (input) for mailman id 848646;
 Wed, 04 Dec 2024 16:24:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fO+b=S5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tIsB5-0005Ea-KL
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2024 16:24:39 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ffbf54e-b25c-11ef-a0d4-8be0dac302b0;
 Wed, 04 Dec 2024 17:24:37 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 173332946810217.00801812770635;
 Wed, 4 Dec 2024 08:24:28 -0800 (PST)
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
X-Inumbo-ID: 3ffbf54e-b25c-11ef-a0d4-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1733329470; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WNq13jO1YktDI/g1fnvrIExCRVTunQiDgEMKtqnGifs+T+3BDDLCCZzYnfF4jE7MhlVVA51TUuwu/Offdl6YJQcHtZ8WOJ3tCrxyM7vS2KKdxpszYRufMH3mXMuuAqlE+NwzZI8OC7AeJlMq0ISbJrUpC11UZHxlXyrune6gZ/8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1733329470; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=RxgYDXsBYiRkEpYFcGDo2cbsf/3SzYXigoj7D8z8bSc=; 
	b=gVx9Ick3So0c3yGCbfhAHhKZrpSw69kTdn2gErFhP0pMS+5iqvWEx8igDof9qFwTR8ohldBQj1NfeBozG20zZzjVIlrvqY9ytdBdgkmM03ortgY5DsSn9efVdPibP6rjr2SprRIGxjF6TnNlWyWf+UcVf3+s4syougKRN6LI98Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733329470;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=RxgYDXsBYiRkEpYFcGDo2cbsf/3SzYXigoj7D8z8bSc=;
	b=WAIZfcoNXyTgFZUdt3MQwa6PQ+cx9/R/fYOMP70aRZ1MkKQQBR6R8fwsxWriM0Yd
	5U3Z1NldYmWzp2qtdlUWI41n5YjuWP4KwuB6s10h2MFkIjHoZ9r6nRhEPs3P5uipEwt
	V21RcOO0d0qNss5JoR6Ut4kM8rjoJ6U9bsdAJ5VY=
Message-ID: <3da1fda2-21ee-4768-acc3-34133a6aa05b@apertussolutions.com>
Date: Wed, 4 Dec 2024 11:24:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/6] x86/boot: introduce boot domain
To: Jan Beulich <jbeulich@suse.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241115131204.32135-1-dpsmith@apertussolutions.com>
 <20241115131204.32135-5-dpsmith@apertussolutions.com>
 <6c2defc4-f8ae-4d5a-a9b8-721f168e6520@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <6c2defc4-f8ae-4d5a-a9b8-721f168e6520@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 11/27/24 05:22, Jan Beulich wrote:
> On 15.11.2024 14:12, Daniel P. Smith wrote:
>> --- /dev/null
>> +++ b/xen/arch/x86/include/asm/bootdomain.h
>> @@ -0,0 +1,31 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * Copyright (c) 2024 Apertus Solutions, LLC
>> + * Author: Daniel P. Smith <dpsmith@apertussolutions.com>
>> + * Copyright (c) 2024 Christopher Clark <christopher.w.clark@gmail.com>
>> + */
>> +
>> +#ifndef __XEN_X86_BOOTDOMAIN_H__
>> +#define __XEN_X86_BOOTDOMAIN_H__
>> +
>> +struct boot_module;
>> +struct domain;
> 
> You don't really need these, do you? The uses ...

Your are correct, they are not necessary for C to compile. I can drop them.

v/r,
dps

