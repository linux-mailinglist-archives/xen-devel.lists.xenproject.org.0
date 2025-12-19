Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 789C6CD1AAB
	for <lists+xen-devel@lfdr.de>; Fri, 19 Dec 2025 20:43:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1191062.1511168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWgNE-0000F6-EO; Fri, 19 Dec 2025 19:42:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1191062.1511168; Fri, 19 Dec 2025 19:42:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWgNE-0000DL-Be; Fri, 19 Dec 2025 19:42:48 +0000
Received: by outflank-mailman (input) for mailman id 1191062;
 Fri, 19 Dec 2025 19:42:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S3ad=6Z=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vWgNC-0000CG-OO
 for xen-devel@lists.xenproject.org; Fri, 19 Dec 2025 19:42:46 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3cfac1e-dd12-11f0-9cce-f158ae23cfc8;
 Fri, 19 Dec 2025 20:42:45 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b7277324204so363026766b.0
 for <xen-devel@lists.xenproject.org>; Fri, 19 Dec 2025 11:42:45 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64b90f53c16sm2929507a12.1.2025.12.19.11.42.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Dec 2025 11:42:43 -0800 (PST)
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
X-Inumbo-ID: e3cfac1e-dd12-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766173364; x=1766778164; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sJVTBdtfWI3hhuPfY2fsP6x9zqHGSithUg07Fh9Kulk=;
        b=e+lylv2UfJFOj/ZrnlqqkqxrvNwSEiLWaKnGMUy9wjPKAZ+l7dK/BaA47O7CO9mC8Y
         zlA5KUXdgvchiCouKy2nY1gMhHVNJaN5QRK+F57aWVHxeUNRFi4giluC44ZFG600RXyH
         wY26C3jrV0VtxTqj/UnV4AknKUNIqnOZ4w/V3y/iDq0WL2HHZTER06XIVulXCu9vpzjY
         JEGdyL2RCq4HUBmKOD+BxezwgO9cZVQSJ6A80rv/8yf0bwMy2STwYeQem3PsxANw2ZMo
         ZRMQyBnbdsEgcYvfytKwYrf16PN7GC79xRs1wCDfjD14Obvb8msLlVKiymtPZ6QcjGJ0
         pjIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766173364; x=1766778164;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sJVTBdtfWI3hhuPfY2fsP6x9zqHGSithUg07Fh9Kulk=;
        b=SGnG8fA/tDbbKJjuaQT+TXwqhh0wZLJGrD//sz1AGJchWXh9UjE+KXgX2QNA1k18lO
         oFcKwWx1wGbXMHjHOyjS4Fbnk1jxl5AlDXQ10NFc851hu3T8+FUVBjgLvgASxzuGOWTu
         Ftxq67O4j0MWRC/FSi9sB6eeoo/kgCWr5UVvcTycJS754MnxF0eVTSuQVjCxatEufAJb
         YiAkPFVn7JWZx87MEEKYcVogp2dj2LJ3R3QQOqQdcMhMTRvxHqUCGpkT1IYsn0clA3v3
         YeeQYaFSY+6FCU3zEJw+y71dFoMfHUhYCQzhMllB6dAqvDF4GcYHxi9Sr3ElG+EYFIQ/
         PW4w==
X-Forwarded-Encrypted: i=1; AJvYcCWTPDhtc/xJ0by/6OLuM84NU6GVV+G2M6HCbYkLbBb8UCVDLYqK1gYbER2K60OkEEp2k9jYlUqLXAA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxmQKxFb3WBzA5dgPOljbQ2JAOF6p0nR7n6j3cfIWzt+btWGnk+
	fvaJrgEKlAL7VxjKflIoN81tXcD4+GfnCfOOnN5GTh8vgNP3Py3zPZH1
X-Gm-Gg: AY/fxX7ftM3lEQWSt2QhFT5iDDzYurydGD4DT18B2gSXo0c05W+i3ySD2Lepea5XgQC
	vJiksCLDGdKB64urfjEpnOGLX6NO+JHDFC9tvgLyTr87JIoAmwpyrZkMeAFBifSdLLZfBPlwJq4
	HJJl4etFufWIAlWnzpCaU2We6ldbdLErR8XU+Nq0SaLVezCG5R6zzIEEKDTz1JDQtaOOOK4DfoW
	+p9j2DXFPzA7e6oSs98rXMvw/QIw3ud/82elH+V6pA9dKhXDgEzYdLEay2uguDRayBKlXwP90oA
	D/rwUGkWkH24i82zspB3LWFhpDVuRrFUriWEL3/8vM+F1v7Gq4jOndUUCb0CpPv/7kZuZcoQGvi
	vuYPWGaEoGxwaQVfL4tEJ6ScO42yj7WuiZiEMRps39hUQLWbYevD80yDUZBwMVOQT4iBjEhmMin
	zKvIco4fq8BcjH1Zws70xBK5W2TeThhxIvK2f5jO+uhOuaElhTXkeuC1fLdqbHjfd0
X-Google-Smtp-Source: AGHT+IEe8RpKAADCXRhkXWgNY+tJ7IrnC1l0rpDxkVZ0ACgyTOxTki3DBMTKJcqDdQnI8vMDoNIn7Q==
X-Received: by 2002:a17:907:97c2:b0:b73:4b22:19c5 with SMTP id a640c23a62f3a-b803722a7f4mr399916266b.44.1766173364370;
        Fri, 19 Dec 2025 11:42:44 -0800 (PST)
Message-ID: <622c0143-a155-467f-a6d4-0b1d31d3b47b@gmail.com>
Date: Fri, 19 Dec 2025 20:42:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] xen/riscv: introduce vSBI extension framework
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1765888425.git.oleksii.kurochko@gmail.com>
 <dc1045d1831908678a1e4a79571adab2ab362ef6.1765888425.git.oleksii.kurochko@gmail.com>
 <870f4a16-eda3-48ae-9d67-f496cf6493b1@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <870f4a16-eda3-48ae-9d67-f496cf6493b1@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/18/25 2:52 PM, Jan Beulich wrote:
> On 17.12.2025 17:54, Oleksii Kurochko wrote:
>> --- /dev/null
>> +++ b/xen/arch/riscv/vsbi/core.c
>> @@ -0,0 +1,56 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#include <xen/sched.h>
>> +
>> +#include <asm/processor.h>
>> +#include <asm/sbi.h>
>> +#include <asm/vsbi.h>
>> +
>> +extern const struct vsbi_ext _svsbi_exts[], _evsbi_exts[];
>> +
>> +void __init check_vsbi_ext_ranges(void)
>> +{
>> +    for ( const struct vsbi_ext *a = _svsbi_exts; a != _evsbi_exts; a++ )
>> +        for ( const struct vsbi_ext *b = a + 1; b != _evsbi_exts; b++ )
> Like here, ...
>
>> +            if ( !(a->eid_end < b->eid_start || b->eid_end < a->eid_start) )
>> +                panic("EID range overlap detected: "
>> +                      "%s:[#%#lx..#%#lx] vs %s:[#%#lx..#%#lx]\n",
>> +                      a->name, a->eid_start, a->eid_end,
>> +                      b->name, b->eid_start, b->eid_end);
>> +}
>> +
>> +const struct vsbi_ext *vsbi_find_extension(unsigned long eid)
>> +{
>> +    const struct vsbi_ext *ext;
>> +
>> +    for ( ext = _svsbi_exts; ext != _evsbi_exts; ext++ )
> ... declare "ext" inside the for()?

I decided that it would be better then the following alignment of for loop:
     for ( const struct vsbi_ext *ext = _svsbi_exts;
           ext != _evsbi_exts;
           ext++ )

I am okay to change that to be aligned with the code above.

>
>> +        if ( (eid >= ext->eid_start) && (eid <= ext->eid_end) )
>> +            return ext;
>> +
>> +    return NULL;
>> +}
>> +
>> +void vsbi_handle_ecall(struct vcpu *vcpu, struct cpu_user_regs *regs)
>> +{
>> +    const unsigned long eid = regs->a7;
>> +    const unsigned long fid = regs->a6;
>> +    const struct vsbi_ext *ext = vsbi_find_extension(eid);
>> +    int ret;
>> +
>> +    if ( ext )
>> +        ret = ext->handler(vcpu, eid, fid, regs);
>> +    else
>> +    {
>> +        printk("Unsupported Guest SBI EID #%#lx, FID #%lu\n", eid, regs->a1);
> As before - anything guest triggered must not cause log spam issues.
> Minimally you want to use XENLOG_GUEST in such cases, but I think you
> really mean gprintk() here.
>
> A connected question then arises: Why is "vcpu" being passed in, when
> the sole caller only ever passes "current"? (The connection here is
> that gprintk() also uses current, and hence would be wrong to use when
> vcpu != current.) Same question goes for the ->handler() hook.

Good question. I tried to keep this more generic, but after your comment I
cannot find a case where this argument is actually used with something
other than|current in downstream code.|

Let’s drop the|vcpu| argument for now, and if it is needed in the future,
we can reintroduce it then.

Thanks.

~ Oleksii


