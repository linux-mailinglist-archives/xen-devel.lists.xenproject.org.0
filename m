Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FEACD1C2E
	for <lists+xen-devel@lfdr.de>; Fri, 19 Dec 2025 21:34:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1191109.1511189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWhB5-0006zs-CN; Fri, 19 Dec 2025 20:34:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1191109.1511189; Fri, 19 Dec 2025 20:34:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWhB5-0006xn-9P; Fri, 19 Dec 2025 20:34:19 +0000
Received: by outflank-mailman (input) for mailman id 1191109;
 Fri, 19 Dec 2025 20:34:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S3ad=6Z=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vWhB4-0006xh-4E
 for xen-devel@lists.xenproject.org; Fri, 19 Dec 2025 20:34:18 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 112fc46f-dd1a-11f0-9cce-f158ae23cfc8;
 Fri, 19 Dec 2025 21:34:07 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b728a43e410so365449466b.1
 for <xen-devel@lists.xenproject.org>; Fri, 19 Dec 2025 12:34:07 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037f0b7bcsm319479466b.49.2025.12.19.12.34.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Dec 2025 12:34:06 -0800 (PST)
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
X-Inumbo-ID: 112fc46f-dd1a-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766176447; x=1766781247; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RR4GYzAKKe4og/bh9b9xEsR2dGwI9S+rND+baEDC3hc=;
        b=Dxmm44/h1UH6estlBr/TfUm0kvPs6iXK6ksmwAJQ7xfquuEr9OWpvLlmRbp+zPhIM8
         kK5PbHHbsKjOB8S9Q4DdyY4Oo5P1jHU3N/+6q+203uS1Eh4Nh438xnRwpnPbudYRKA8o
         /z4B1O9rNZwNXatorU3EHBXeFDXoUqfPdQPFdRU77J1zoZZOm9LJut3x49mlD6YnMW0B
         YNcOvqozeF3lIqSqNNuxGYCC1+B2rwc1sXPLzLRzRvUxLKPHYZ3fnAfKAJFAPoBZY5z0
         ohPxFf8Ykixz9s0WbvbKC+96N+XZoQKYvlOg9BakyU9dHl4+bVQL7zwLQtwQo7K+qOlJ
         ZaRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766176447; x=1766781247;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RR4GYzAKKe4og/bh9b9xEsR2dGwI9S+rND+baEDC3hc=;
        b=ak+vL2P15LBbXwiCqrirYW1GAZpkcVqyEj9gYwx3rEgoH5ow1zJuqyPtoVr6AJnQeM
         U7Mg6QsHiVT74LC8citvy14LU0tP0O/2Vpv/2ew5G6f24rv1MVMXcrqGylRBMANgKIJD
         2NoxB/iIj8Laidz2WLAzViLsnlgkh2EprOVeDn/kXP8mw5ZVklGxWpo8wWbJKuzZgp3z
         kAxm3zqa8B7xILfzLwUCkB4e+Xf3fFriytFnEu2CnW+LTAnTkZvwp6G4/3D/mSXejxhv
         qtKep7gC733iMYKyKvs4Pvmiqx8hEfcPkdb+C67OQba+qlC7CjFEYt3VA3hymOz3y2CZ
         MARg==
X-Forwarded-Encrypted: i=1; AJvYcCXegfpMoPv6rGUk3PLZWnU5dlwD24cB1RpNm//Mkjl5TXpkxzfE/67FYhBvJKYo9S5zPSsQsaQzD50=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzy8/1aedtgVMXF0fIh9LmhMuDkjncv47Ow+t8YKrmxHhjeCKV1
	Na0735ZuLD8/nzzXi/oADyPBqZgFSU2XsAxaTXjeDqV9BhgC9Qo6XUVgGKBpjg==
X-Gm-Gg: AY/fxX7/GRH0wUO4+raGsP1Q4sLQcOhC8NZU5vxTwXPSpR9aF094ghhojg2+HfEPQJ2
	dVp3wAoC36a2CLY/m0fsmSkhr/ufOM72eHVdOK19k8QmlzMM52qnu3Y+YLGA3n4ifHH+5mzDnOH
	+YtK6J5+VWXIomEX/8kvWnnR0OmphCLSNGxUjO6XanzpaRW+UCysSZwYInTMzNNIvl+fQLJnuA3
	S3dqxQJRkKoawYFjQynncdtqEWBiL2D7jin98rUP01fveTVWfijbbyfeuNkwj9ZPqO1R1SDdmXn
	6X8Xsja6CWR1riVojUuVgRzm1Ajr0xsE5kWVEZ8lhdGbUNZ28J4B2cc47AFGYriPJpC5A/Vl1i7
	TKCPZgr5jdUXlv1O7U9NiNgEgSbduWLyMivbgaQTeBjXMm/NPZFtI3S/LaRW/wxdCd9YSB475v+
	LNy83cF7Bj2woMIHxBzRfE8w2N270MvluTDSKBiM5QGBj+I9qCB7bhGlAUCPxTVvj2
X-Google-Smtp-Source: AGHT+IEL+EX4hX6fNLtZ02Spt+PqV9L+dA1JCC3EE0Gx22ySrvRRlke8fGy2d6eWUm1829vtUyn/tQ==
X-Received: by 2002:a17:907:1b0f:b0:b73:4fbb:37a8 with SMTP id a640c23a62f3a-b8036eba965mr453390266b.12.1766176446829;
        Fri, 19 Dec 2025 12:34:06 -0800 (PST)
Message-ID: <aac3c5e8-02a8-4463-bba9-d7b5b90c4273@gmail.com>
Date: Fri, 19 Dec 2025 21:34:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] xen/riscv: add RISC-V virtual SBI base extension
 support for guests
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1765888425.git.oleksii.kurochko@gmail.com>
 <2e42e8ee51badcfa2cb16e3db71fdecaac445bca.1765888425.git.oleksii.kurochko@gmail.com>
 <f5206b63-1f82-4abb-9740-9a0042fbcfb6@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f5206b63-1f82-4abb-9740-9a0042fbcfb6@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/18/25 3:32 PM, Jan Beulich wrote:
> On 17.12.2025 17:54, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/include/asm/sbi.h
>> +++ b/xen/arch/riscv/include/asm/sbi.h
>> @@ -14,6 +14,10 @@
>>   
>>   #include <xen/cpumask.h>
>>   
>> +#define XEN_SBI_VER_MAJOR 0
>> +#define XEN_SBI_VER_MINOR 2
>> +#define XEN_SBI_IMPID 7
> Are these numbers part of the spec (sorry, lack of a reference makes me wonder,
> plus if that were the case, I'd kind of expect the names to be SBI_XEN_..., not
> XEN_SBI_...)?

XEN_SBI_IMPID is a number defined by the SBI specification:
   https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/src/ext-base.adoc#sbi-implementation-ids

XEN_SBI_VER_MAJOR and XEN_SBI_VER_MINOR somehow also is a part of the spec, there is
no such defines explicitly, but it is real numbers of the SBI version.

I will rename the defines accordingly:
  - s/XEN_SBI_VER_MAJOR/SBI_XEN_VER_MAJOR
  - s/XEN_SBI_VER_MINOR/SBI_XEN_VER_MINOR
  - s/XEN_SBI_IMPID/SBI_XEN_IMPID

>
>> --- /dev/null
>> +++ b/xen/arch/riscv/vsbi/base-extension.c
>> @@ -0,0 +1,71 @@
>> +
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#include <xen/lib.h>
>> +#include <xen/sched.h>
>> +#include <xen/version.h>
>> +
>> +#include <asm/processor.h>
>> +#include <asm/sbi.h>
>> +#include <asm/vsbi.h>
>> +
>> +static int vsbi_base_ecall_handler(struct vcpu *vcpu, unsigned long eid,
>> +                                   unsigned long fid,
>> +                                   struct cpu_user_regs *regs)
>> +{
>> +    int ret = 0;
>> +    struct sbiret sbi_ret;
>      ASSERT(eid == SBI_EXT_BASE);
>
>> +    switch ( fid ) {
> Nit: Brace placement.
>
>> +    case SBI_EXT_BASE_GET_SPEC_VERSION:
>> +        regs->a1 = MASK_INSR(XEN_SBI_VER_MAJOR, SBI_SPEC_VERSION_MAJOR_MASK) |
>> +                   XEN_SBI_VER_MINOR;
>> +        break;
>> +    case SBI_EXT_BASE_GET_IMP_ID:
>> +        regs->a1 = XEN_SBI_IMPID;
>> +        break;
>> +    case SBI_EXT_BASE_GET_IMP_VERSION:
>> +        regs->a1 = (xen_major_version() << 16) | xen_minor_version();
>> +        break;
> Along those lines here - are we free to use an arbitrary layout (shifting major by
> 16 bits), or is this mandated by the spec? At least in the latter case, the 16 will
> want to gain a #define.

I would say that we are free to use an arbitrary layout. The specification says:
   The encoding of this version number is specific to the SBI implementation.
(https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/src/ext-base.adoc#function-get-sbi-implementation-version-fid-2)

So this fully depends on how a specific SBI implementation decides to encode the
version. For Xen, I simply copied the approach used by OpenSBI:
/**
  * OpenSBI 32-bit version with:
  * 1. upper 16-bits as major number
  * 2. lower 16-bits as minor number
  */
#define OPENSBI_VERSION ((OPENSBI_VERSION_MAJOR << 16) | \
			 (OPENSBI_VERSION_MINOR))

Therefore, I think it is fine to keep Xen’s implementation as it is now, without
introducing additional defines.

Thanks.

~ Oleksii


