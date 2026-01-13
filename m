Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7D4D18852
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 12:39:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201510.1517132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfck7-0004ec-Pu; Tue, 13 Jan 2026 11:39:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201510.1517132; Tue, 13 Jan 2026 11:39:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfck7-0004bV-MV; Tue, 13 Jan 2026 11:39:23 +0000
Received: by outflank-mailman (input) for mailman id 1201510;
 Tue, 13 Jan 2026 11:39:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i8AK=7S=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vfck6-0004bP-Ez
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 11:39:22 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7fb4dce9-f074-11f0-9ccf-f158ae23cfc8;
 Tue, 13 Jan 2026 12:39:19 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b872b588774so243786066b.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 Jan 2026 03:39:19 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b870e33259esm697935066b.8.2026.01.13.03.39.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 03:39:18 -0800 (PST)
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
X-Inumbo-ID: 7fb4dce9-f074-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768304359; x=1768909159; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WxW/Bi8YXCerp6fENlNPiTLE6uiSEZIC+yyayAUgB0o=;
        b=iv2+I4fIWQ0Hxx+ARsa/nX4PO0gi8G1MHG8CDGANlZOtmphVCABcERMF9742FKthbY
         McL3IkEMpzmJrftyuTUklBVNKemutc/sAbHK9RRMSuumvWW68SHq0UokCNP13ypmA8yH
         8s6etkM+JMHSLKUFc5UZ33FdhOCKm9CiS8kkSaCzZKyhuJOBZGa7HoOW8wDP5+jT+F7G
         uqMkdtl8vO4j6sKyTFrUJpOgeQXjUI6V1Ky5kE24clb34KTtINvqTRsILnInvTEpSQhG
         fLbqjhNZwn2czKS42iWfq55Tmf2iqF0+Da0fl1sO8E3zxarR31tgqYV3UYJKBtKgrs+R
         KZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768304359; x=1768909159;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WxW/Bi8YXCerp6fENlNPiTLE6uiSEZIC+yyayAUgB0o=;
        b=c/G/APdFymOBy1R22LIIdHOsiyNZyuXZeobGucokWgKLWR7KIrLFvaassBdyvOQU3q
         G5537ocJJrV15aa21yszHd/S2OmwqykwkMxGv3Huv/Yujor4sPG2FNy6aUqN5o+io7GK
         J78pHrbN/0m3JTDvpRzwjPvZUqrj6tTKNQknjC9iwEWM24FJEdePeoRi3jcn6B6Rhk5d
         /iLT82LVSr7S/SE6MBboGHWhFRN70DnH53cznlXAiH9r4AF742JFzTLStpy1BSOqps0s
         rw7JUBbNrANTsWgNcOLBpLuSSnwxZM27TrnAQHVED7tbTEefO/cZJ4x5XmWav/uocnbH
         OvxA==
X-Forwarded-Encrypted: i=1; AJvYcCWDxpJvJZaRN0dpPdXhRJNyIx5hGGW+k5xoBAyNzrCcCctKqdpfniMHNiqkBDkx8L+85dqaKii357k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzMt7Fa9XZTJAxFBoNzHT5SzCxIVwyXQjcWbK981VGOZslfJ3vz
	RwSRGW6Rq3mFL4zMRJ/s3CJc0oR+DRPGlPTEyplvX++jvaEXY5IVgVxM
X-Gm-Gg: AY/fxX7exNUBWYEZQX3ElDh0OzLfcgwEw3FJHSuyadGpbiX8RtmQB5gRhphHSsKqcyR
	S2LH+zidIg8p9VThGpSWyWQbMrZfrVrdXi0obuYXB2UUQpXdzJ3EDgozTdIwplEgEsPYX0AJ6IL
	Gl1L1BXkjH3py6U8Ag2UXwveZOSymM2FWm9ZcGeE7iq8BOXrSHprj/mh1VMQF2qAhEpYwSqceMX
	Wl3+NyII/92ZdMp2zcdX6yJGEp6WcanqBqC2byUlP02uZiRngxWeMDMt7l+FQVNi6upHBAXb03d
	eyw7jvf9pAtZsrFwM4Xe1mtlgvnkC+ajUXWQak1i8uU2wru8xWgXP73+n3wFDpFQn/ADyt9hOzL
	FVU4XvzRF++zEFq+KrnGhMivfSJs1q/VS+Dmd/iqkT5NyAGx0Ri90Y33+joAGl0V3F+VjuMWS3e
	6OClm/zF3Nii37Cf7FcRZr2biEI5XT9KM2b67/ND+0nx52i+EUD/8OfrZPfjWSOjE=
X-Google-Smtp-Source: AGHT+IEjaL8obUVDyMLgiNW/+NkhGXD9GLLfvYNaESBtQmV+V9SwiJY5sb9NDAFAX8npemETX6PmEw==
X-Received: by 2002:a17:907:3d88:b0:b87:4bdb:1061 with SMTP id a640c23a62f3a-b874bdb232dmr60506466b.1.1768304359161;
        Tue, 13 Jan 2026 03:39:19 -0800 (PST)
Message-ID: <ff6502ab-78b2-49c9-b383-d71a774c0a99@gmail.com>
Date: Tue, 13 Jan 2026 12:39:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 05/15] xen/riscv: implement stub for
 smp_send_event_check_mask()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
 <837c863f5995cc4371e82b481211b053656ec7e7.1766595589.git.oleksii.kurochko@gmail.com>
 <319e6162-7a5b-4030-ae9f-a86a48e73605@suse.com>
 <94c0cd09-7aaa-4ae1-913e-57d883916682@gmail.com>
 <b08265c6-6c19-4935-be34-face486bf994@suse.com>
 <92cfc028-cabd-4686-b6b9-7cc047a909c9@gmail.com>
 <2786eab5-ff25-4d8d-b0d1-84a1d2727f9f@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <2786eab5-ff25-4d8d-b0d1-84a1d2727f9f@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/13/26 11:22 AM, Jan Beulich wrote:
> On 13.01.2026 10:58, Oleksii Kurochko wrote:
>> On 1/12/26 6:05 PM, Jan Beulich wrote:
>>> On 12.01.2026 17:53, Oleksii Kurochko wrote:
>>>> On 1/7/26 4:47 PM, Jan Beulich wrote:
>>>>> On 24.12.2025 18:03, Oleksii Kurochko wrote:
>>>>>> @@ -13,3 +14,10 @@
>>>>>>     struct pcpu_info pcpu_info[NR_CPUS] = { [0 ... NR_CPUS - 1] = {
>>>>>>         .processor_id = NR_CPUS,
>>>>>>     }};
>>>>>> +
>>>>>> +void smp_send_event_check_mask(const cpumask_t *mask)
>>>>>> +{
>>>>>> +#if CONFIG_NR_CPUS > 1
>>>>>> +# error "smp_send_event_check_mask() unimplemented"
>>>>>> +#endif
>>>>>> +}
>>>>> CONFIG_NR_CPUS is 64 by default for 64-bit arch-es, from all I can tell, also
>>>>> for RISC-V. And there's no "override" in riscv64_defconfig. How is the above
>>>>> going to work in CI? Then again I must be overlooking something, as the config
>>>>> used in CI has CONFIG_NR_CPUS=1. Just that I can't tell why that is.
>>>> It is 1 because of the defintion of NR_CPUS in KConfig:
>>>> config NR_CPUS
>>>> 	int "Maximum number of CPUs"
>>>> 	range 1 1 if ARM && MPU
>>>> 	range 1 16383
>>>>            .... ( all other range props are condtional and there is no RISC-V in dependency)
>>>> so for RISC-V "range 1 16383" used and CONFIG_NR_CPUS is set to the minimal of this range,
>>>> so it is 1.
>>> I fear I don't follow: Why would the lowest value be picked, rather than the
>>> specified default (which would be 64 for RV64)? That's what I thought the
>>> default values are there (among other purposes).
>> But there is no default for RISC-V for config NR_CPUS:
>>
>>     config NR_CPUS
>> 	  int "Maximum number of CPUs"
>> 	  range 1 1 if ARM && MPU
>> 	  range 1 16383
>> 	  default "256" if X86
>> 	  default "1" if ARM && MPU
>> 	  default "8" if ARM && RCAR3
>> 	  default "4" if ARM && QEMU
>> 	  default "4" if ARM && MPSOC
>> 	  default "128" if ARM
>> 	  help
>> 	    ...
> Oh, indeed, that's what I was overlooking.
>
>> So a value from range [1, 16383] is chosen and based on the code of sym_validate_range():
>>           ...
>> 	val = strtoll(sym->curr.val, NULL, base);
>> 	val2 = sym_get_range_val(prop->expr->left.sym, base);
>> 	if (val >= val2) {
>> 		val2 = sym_get_range_val(prop->expr->right.sym, base);
>> 		if (val <= val2)
>> 			return;
>> 	}
>> 	if (sym->type == S_INT)
>> 		sprintf(str, "%lld", val2);
>> 	else
>> 		sprintf(str, "0x%llx", val2);
>>           sym->curr.val = xstrdup(str);
>>
>> First initialization of val2 it is the left value of the range [1, 16383],so it is 1
>> and val is 0 (I assume so that it is by initialization 0), thereby val2 = 1 will be
>> used as a value for NR_CPUS.
> But is this behavior documented anywhere?

I wasn't able to find that and it was a reason why I checked the code.


>   Wouldn't RISC-V (and PPC) better
> gain suitable defaults, making explicit what is wanted (for the time being)?
> E.g.
>
> config NR_CPUS
> 	int "Maximum number of CPUs"
> 	range 1 1 if ARM && MPU
> 	range 1 16383
> 	default "256" if X86
> 	default "1" if !ARM || MPU
> 	default "8" if RCAR3
> 	default "4" if QEMU
> 	default "4" if MPSOC
> 	default "128"

Maybe, it would be better.

~ Oleksii


