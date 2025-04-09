Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64911A834DE
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 01:57:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944834.1343167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2fH9-0004yo-I0; Wed, 09 Apr 2025 23:56:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944834.1343167; Wed, 09 Apr 2025 23:56:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2fH9-0004wh-FB; Wed, 09 Apr 2025 23:56:11 +0000
Received: by outflank-mailman (input) for mailman id 944834;
 Wed, 09 Apr 2025 23:56:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nIbW=W3=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1u2fH7-0004wb-Uh
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 23:56:10 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32987a07-159e-11f0-9eab-5ba50f476ded;
 Thu, 10 Apr 2025 01:56:06 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1744242955396973.2761201127224;
 Wed, 9 Apr 2025 16:55:55 -0700 (PDT)
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
X-Inumbo-ID: 32987a07-159e-11f0-9eab-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; t=1744242958; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OpRffI6qwtGQMUODtX/oZHbTEzGCvC2bs81Hmqw7eSvCVYnIqQr2T1YSqgGwQNnCWKYIejxnV1IC949LA1UojZLEASDoQHdY2y8X7WTvLXYX56BtT6U0HztX/5o5W3tXmkI+Ea7spy8a1AkmX+nG6UIx1pDbhQYdoswB/N3qGWw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744242958; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=MD45N2QilsXNWUX1d+1LMhyO6pIXnc1YcziLov3+tvc=; 
	b=luH/RKkrVjDX8fAzHTi8z7DHB03nOq3HOQA6pAZ/AJ4QJsDJx32gWP/CMdLOGzu3HdOFxZTVNxrJRstHqeqoI+2EJtNXtKBU7y2VESBXf7s3LjBEoyn4G4Qp872jPFG2YDsPPDTUoHC70xRDZUJLwBkasOIHoR96soBeZj0WVnw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744242958;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=MD45N2QilsXNWUX1d+1LMhyO6pIXnc1YcziLov3+tvc=;
	b=VN2eGkgHO/XHDqd3+8vLzFqsu4kepor7PVHI05lxwK1wqVXOfMgHvqEQuSa3+3rA
	6eLUnzqqQVUcGEiy9d3bVBWtmzcxDxxFGgosKI/K41X49EjxkxuDT7j8wFTWWC2am6N
	BFhPXcnA4BfNbnRpVu6wHRjq6jsZno3K6HVZcDlk=
Message-ID: <0fabd9d0-ac4c-4ddd-83c7-e4fc2819b506@apertussolutions.com>
Date: Wed, 9 Apr 2025 19:55:53 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/15] x86/boot: introduce boot domain
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241226165740.29812-1-dpsmith@apertussolutions.com>
 <20241226165740.29812-2-dpsmith@apertussolutions.com>
 <2e02b7d6-fe71-4ed8-a09d-5bde7438718c@suse.com>
 <4aa999f4-48d3-400c-9dc4-21d3f31f3d78@apertussolutions.com>
 <72d3e83d-cb99-41b7-bf0d-b98b3927076e@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <72d3e83d-cb99-41b7-bf0d-b98b3927076e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 4/7/25 03:10, Jan Beulich wrote:
> On 05.04.2025 02:04, Daniel P. Smith wrote:
>> On 1/30/25 08:45, Jan Beulich wrote:
>>> On 26.12.2024 17:57, Daniel P. Smith wrote:
>>>> @@ -596,9 +597,10 @@ int __init dom0_setup_permissions(struct domain *d)
>>>>        return rc;
>>>>    }
>>>>    
>>>> -int __init construct_dom0(struct boot_info *bi, struct domain *d)
>>>> +int __init construct_dom0(struct boot_domain *bd)
>>>
>>> Pointer-to-const? Domain construction should only be consuming data
>>> supplied, I expect.
>>>
>>>> --- /dev/null
>>>> +++ b/xen/arch/x86/include/asm/bootdomain.h
>>>
>>> Maybe boot-domain.h? Or was that suggested before and discarded for
>>> whatever reason?
>>>
>>>> @@ -0,0 +1,28 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>>> +/*
>>>> + * Copyright (c) 2024 Apertus Solutions, LLC
>>>> + * Author: Daniel P. Smith <dpsmith@apertussolutions.com>
>>>> + * Copyright (c) 2024 Christopher Clark <christopher.w.clark@gmail.com>
>>>> + */
>>>> +
>>>> +#ifndef __XEN_X86_BOOTDOMAIN_H__
>>>> +#define __XEN_X86_BOOTDOMAIN_H__
>>>> +
>>>> +struct boot_domain {
>>>> +    struct boot_module *kernel;
>>>> +    struct boot_module *ramdisk;
>>>
>>> "ramdisk" is Linux-centric, I think. Can we name this more generically?
>>> "module" perhaps, despite it then being the same name as we use for the
>>> modules Xen is passed?
>>
>> Ramdisk is not a linux-centric, take OpenBSD for example [1]. Calling
>> the field "module" is a recipe for confusion. Especially considering
>> that we are more or less providing a lightweight version of the
>> toolstack interface which use the name ramdisk.
>>
>> [1] https://openbsd.fandom.com/wiki/Creating_a_custom_OpenBSD_RAM_disk
> 
> Just one other OS also using such a concept doesn't mean much. In fact, "ramdisk"
> isn't quite appropriate a term for Linux nowadays anymore anyway. An initrd can
> consist of multiple pieces now, not all of which end up taken as "ramdisk". I
> wouldn't insist on "module" as a name, but I continue to think "ramdisk" is
> inappropriate. The fact that the toolstack uses the term has historical reasons;
> it doesn't mean new code in Xen needs to continue to use that term.

That opening response is very disingenuous and goal post moving. Your 
initial comment asserted that it is a Linux only concept, and when met 
with another example, you now want to just brush it off.

The fact is that the concept of a ramdisk predates Linux by a 
considerable amount, 1979 CP/M introduced the concept. Yes, initrd is a 
variation of a ramdisk, which is why the field is not called initrd 
(despite that term used elsewhere as a variable name). I would also 
point out, as you very well know, Linux's multiple module ramdisk is not 
supported by Xen today, nor is there any plan to add it.

The fact is that ramdisk **is** a general term for the specific 
capability that the primary supported operating system uses, along with 
other operating systems *BSD. As a result the concept is all over the 
code base and so it is not at all unreasonable to have an explicit 
reference reserved for it.

V/r,
DPS

