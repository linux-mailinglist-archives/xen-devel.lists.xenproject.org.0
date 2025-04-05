Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C19A7C6CE
	for <lists+xen-devel@lfdr.de>; Sat,  5 Apr 2025 02:05:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.938623.1339259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0r1R-0002jX-1U; Sat, 05 Apr 2025 00:04:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 938623.1339259; Sat, 05 Apr 2025 00:04:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0r1Q-0002hS-UO; Sat, 05 Apr 2025 00:04:28 +0000
Received: by outflank-mailman (input) for mailman id 938623;
 Sat, 05 Apr 2025 00:04:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bjOG=WX=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1u0r1O-0002hC-RI
 for xen-devel@lists.xenproject.org; Sat, 05 Apr 2025 00:04:26 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8777c148-11b1-11f0-9eaa-5ba50f476ded;
 Sat, 05 Apr 2025 02:04:24 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1743811453000532.8431359068024;
 Fri, 4 Apr 2025 17:04:13 -0700 (PDT)
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
X-Inumbo-ID: 8777c148-11b1-11f0-9eaa-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; t=1743811456; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IdH6HNLTVA041BI1mapHx+T7Qsy2ijLfRU+vpzf4KV7AhRTtNWMAdQwvg9PZZ6VBASRXl9V6+ZRM1G49lj7fAnPD8mB5SpkQCcVec9MjpZaBBpcyBU+gDpUScRO/HTrj91HcfkNKMKRV0HGo4bzU5JiR9JEsL1h6kGdij3EIwZw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1743811456; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8hKCOaWwdJHEsUQNGcdpFlZdOftpd09n3MbhbhX7oAM=; 
	b=hPeRF/V+2gYHjC8iJ1Wn2iwuiajV5LiltWhd2I3YJa0ZVUwlMr8caa1/I/k0AfJ2IE87/s8QFzcyZhJxn+OXmZrJNltIr2MT6pRldPre/4/PF8h7Ye3u3A+sGXj1afNsGz0BFDrszwxgXJyFUxLIfy7WvC4fDK5j8yjt++RXFtM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743811456;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=8hKCOaWwdJHEsUQNGcdpFlZdOftpd09n3MbhbhX7oAM=;
	b=lqRGgz3IZYBuNvK5UeegHPl64ID9bboxjERnYWKWS8IIy0pwkexANAC6rPLTAiAH
	88EBHO21biHmabsrrI1zUq9Wp0ERtn8QceR0y8mOfZF0uW12Vaw19FX54wr2DpDbuH2
	qvfNcVVUlFE2jHAZwLhETdWMOJOJWgWsA4HI1J5o=
Message-ID: <4aa999f4-48d3-400c-9dc4-21d3f31f3d78@apertussolutions.com>
Date: Fri, 4 Apr 2025 20:04:11 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/15] x86/boot: introduce boot domain
To: Jan Beulich <jbeulich@suse.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241226165740.29812-1-dpsmith@apertussolutions.com>
 <20241226165740.29812-2-dpsmith@apertussolutions.com>
 <2e02b7d6-fe71-4ed8-a09d-5bde7438718c@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <2e02b7d6-fe71-4ed8-a09d-5bde7438718c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 1/30/25 08:45, Jan Beulich wrote:
> On 26.12.2024 17:57, Daniel P. Smith wrote:
>> @@ -596,9 +597,10 @@ int __init dom0_setup_permissions(struct domain *d)
>>       return rc;
>>   }
>>   
>> -int __init construct_dom0(struct boot_info *bi, struct domain *d)
>> +int __init construct_dom0(struct boot_domain *bd)
> 
> Pointer-to-const? Domain construction should only be consuming data
> supplied, I expect.
> 
>> --- /dev/null
>> +++ b/xen/arch/x86/include/asm/bootdomain.h
> 
> Maybe boot-domain.h? Or was that suggested before and discarded for
> whatever reason?
> 
>> @@ -0,0 +1,28 @@
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
>> +struct boot_domain {
>> +    struct boot_module *kernel;
>> +    struct boot_module *ramdisk;
> 
> "ramdisk" is Linux-centric, I think. Can we name this more generically?
> "module" perhaps, despite it then being the same name as we use for the
> modules Xen is passed?

Ramdisk is not a linux-centric, take OpenBSD for example [1]. Calling 
the field "module" is a recipe for confusion. Especially considering 
that we are more or less providing a lightweight version of the 
toolstack interface which use the name ramdisk.

[1] https://openbsd.fandom.com/wiki/Creating_a_custom_OpenBSD_RAM_disk

> Also, are consumers of this struct supposed to be able to modify what
> the pointers point to? I'd expect they aren't, in which case const will
> want adding here, too.
> 
> Jan


