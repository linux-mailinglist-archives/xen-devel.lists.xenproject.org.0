Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 465F494CEEF
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2024 12:47:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774660.1185112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scN90-0001QJ-1f; Fri, 09 Aug 2024 10:46:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774660.1185112; Fri, 09 Aug 2024 10:46:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scN8z-0001OW-UZ; Fri, 09 Aug 2024 10:46:49 +0000
Received: by outflank-mailman (input) for mailman id 774660;
 Fri, 09 Aug 2024 10:46:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jFZ1=PI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1scN8z-0001Nh-4R
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2024 10:46:49 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id acd81694-563c-11ef-8776-851b0ebba9a2;
 Fri, 09 Aug 2024 12:46:47 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a7a9cf7d3f3so231668066b.1
 for <xen-devel@lists.xenproject.org>; Fri, 09 Aug 2024 03:46:47 -0700 (PDT)
Received: from ?IPV6:2003:e5:8741:4a00:60e5:7bee:fc48:e85c?
 (p200300e587414a0060e57beefc48e85c.dip0.t-ipconnect.de.
 [2003:e5:8741:4a00:60e5:7bee:fc48:e85c])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9c0cb9esm826885666b.78.2024.08.09.03.46.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Aug 2024 03:46:46 -0700 (PDT)
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
X-Inumbo-ID: acd81694-563c-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723200406; x=1723805206; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fJs+/RT35McLGCA60w1WZuDEUgEuqSMSCbSUihWusmo=;
        b=SzP2ucDNktdq0kiderWv+nXWvb6ZEHoBhW0wWXnoZMp62S3+744+dZQJRlsvi635oh
         IHlBwluCuBk+hGp+MFyTEe1RE9a7sVMjfY3JR+9dkdALCzgXJvkhdD1xi94yOlu7w7z+
         i5nSElYePP3zwPR0Pz/rpIkYKF2nZ9gKqKKPs8aWG3PFDBS2b8zwayhUiZb3VIJfOkib
         KjaLkYXc2fJyqG8L6k6lEDUn93U8Kojztc2ZiE9leSg/gj8ynSu/vcjQlzUSLKXze3AO
         /iBS8u5MEacSeGXIBSJBNFPHoSvPSodFX7ECCtvT+bVFObKjv8OLeUgArgHKgqC8W83X
         SfAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723200406; x=1723805206;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fJs+/RT35McLGCA60w1WZuDEUgEuqSMSCbSUihWusmo=;
        b=sHXcPPUZsNXFeN/lhZlo7N61mCA42rTl2X1J/08qHyM58LfLTz3+wDa8iinijsxSIq
         50Fg42kxa6I6SkTi2WqYnkPd6NRjZdyNvw+4E3F/55asqKMjQ/nXfpHgSmG4o4dOrBVS
         Tm1naWU6eWOucSvqVc08hRRJYzUTtzFh+1c/pLWeDZ7LbhVGtAJtuBhroxbUn7RG6BlU
         KqIx2C4VSxQ9YLRZbzPYXuFvzjeSIDaO2lFR/0UoSvHr5tP1cwP1i2s2JzZOcdT18gn5
         zk/8cVZPL4dzj5FGPVJvwGHAy7mhGL6OwtyuKJUF8Gp1U/lWvTs2x+/ApgRA0BYfFuEX
         PmxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLXCVRGu+BUQl/OKt6xQFNplrU1pbd25TqDuoxjXoU3wlmRrCf4pAqINiSZSbnxCiVjXdgIxklub4C0CyEOaTCxkbsB0qTzzJewn7PfuY=
X-Gm-Message-State: AOJu0YxKJc3RkgWxFVKKt7N8pj8uaRjCEyou53hhWN5bMnUt8U6euucr
	M+2ABynwhY3CLjjdjEQgrzeRkwbh3uyV4XXqgmDXXJe/6AT++k/ElTu5ZZMiINo=
X-Google-Smtp-Source: AGHT+IHU3rQncxndKon8M2TIzQH6dJgiKVzIYK4fhBeVF/rtLt8FjgDvfOhmmFlz6r8nq1FP3RclxA==
X-Received: by 2002:a17:907:940a:b0:a7d:a0d0:f5c1 with SMTP id a640c23a62f3a-a80aa6e9af0mr78287166b.65.1723200406400;
        Fri, 09 Aug 2024 03:46:46 -0700 (PDT)
Message-ID: <34551b4d-7420-4203-bf14-564b5f3443c4@suse.com>
Date: Fri, 9 Aug 2024 12:46:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] xen: tolerate ACPI NVS memory overlapping with Xen
 allocated memory
To: Jan Beulich <jbeulich@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org
References: <20240807104110.18117-1-jgross@suse.com>
 <20240807104110.18117-6-jgross@suse.com>
 <90d67e10-6e35-487e-a9e7-611a0fa3b00b@suse.com>
 <64e0ac51-690d-4c44-85fb-6a0b8415fcb7@suse.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <64e0ac51-690d-4c44-85fb-6a0b8415fcb7@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09.08.24 11:45, Jan Beulich wrote:
> On 07.08.2024 14:05, Jan Beulich wrote:
>> On 07.08.2024 12:41, Juergen Gross wrote:
>>> In order to minimize required special handling for running as Xen PV
>>> dom0, the memory layout is modified to match that of the host. This
>>> requires to have only RAM at the locations where Xen allocated memory
>>> is living. Unfortunately there seem to be some machines, where ACPI
>>> NVS is located at 64 MB, resulting in a conflict with the loaded
>>> kernel or the initial page tables built by Xen.
>>>
>>> As ACPI NVS needs to be accessed by the kernel only for saving and
>>> restoring it across suspend operations, it can be relocated in the
>>> dom0's memory map by swapping it with unused RAM (this is possible
>>> via modification of the dom0 P2M map).
>>
>> While the kernel may not (directly) need to access it for other purposes,
>> what about AML accessing it? As you can't advertise the movement to ACPI,
>> and as non-RAM mappings are carried out by drivers/acpi/osl.c:acpi_map()
>> using acpi_os_ioremap(), phys-to-machine translations won't cover for
>> that (unless I'm overlooking something, which unfortunately seems like I
>> might be).
> 
> Thinking some more about this, the above may be pointing in the wrong
> direction. If from acpi_os_ioremap() downwards no address translation
> (PFN -> MFN) occurred, then what's coming from AML would still be
> handled correctly as far as page table entries go. The problem then
> might instead be that the mapping would appear to be covering RAM, not
> the ACPI NVS region (and there may be checks for that).

All PTE entries written go through the P->M translation.


Juergen

