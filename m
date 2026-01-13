Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF13FD17D14
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 10:59:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201334.1516992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfbAh-0001Ru-Ja; Tue, 13 Jan 2026 09:58:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201334.1516992; Tue, 13 Jan 2026 09:58:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfbAh-0001PM-Fn; Tue, 13 Jan 2026 09:58:43 +0000
Received: by outflank-mailman (input) for mailman id 1201334;
 Tue, 13 Jan 2026 09:58:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i8AK=7S=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vfbAg-0001PC-7F
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 09:58:42 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6fa0823a-f066-11f0-9ccf-f158ae23cfc8;
 Tue, 13 Jan 2026 10:58:40 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b872b588774so229214666b.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 Jan 2026 01:58:40 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a4cfe60sm2167668366b.45.2026.01.13.01.58.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 01:58:38 -0800 (PST)
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
X-Inumbo-ID: 6fa0823a-f066-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768298319; x=1768903119; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZeHND3fA0DNMCgGWGUXtopoOxfkaIwFxkfRbh5fbUfM=;
        b=AfTW8xswj+u0XEbHBa7rxXQY47B0tPaLE6nCgsC/Th695ryE1UPgN2HJxn1jgzG1+N
         YzQLkUSLbCzuIlIfgoExvT/fD0sADMqdxkSFi+01yEovyeHJoRACBkHuS/e0L8xmL7w3
         jjLCNmN4GtL3GQ4EhZFc6f5MafpHgsydCTt1mw8OybSq2Gw+n2aFG8RUiRu68FGY5aso
         rvttXsYksXIodvYEeOKZPa0qMGcS3R9k8FkFK4gV6dV3DNKJl2GO4+q/Hhfh8EAa6YQ9
         QDaHRCYNU+zsJ0j31+Ek7Denyd54n75915Cb4R2eP59hPrG0e9sX771CV7I6tra7uZ4Y
         qKNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768298319; x=1768903119;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZeHND3fA0DNMCgGWGUXtopoOxfkaIwFxkfRbh5fbUfM=;
        b=dL6WrA4YvFRd5MUs1zqHbjbkO7CsXAZMRiMMFlOgWp7sKFou075u6/97Vs5MUCzI7b
         W8Qsno+VrtC7c1Vxjs0SwtvDviNgKu1HsvOw3jUWL2nevhMDtW+e46Oe5QCZlczVxCXs
         oyButySvLnwqQwH4lBYwc/LbbONRBUO63tpNWpG4jC/6flGLY7dz6CQQ5d8EldirOUlb
         LYJHsr/bjsdAZHTXhvj9f5qTnBwyQP/vFs3FxyJiL6Ag7STNwzYva+DrZYqqm7bvX25w
         dxee2Mh5DAIQf9w65dDD0ppaE9zhJFOfGGm21TOvuuPCeQB9yya6hY1njWRKXnLKa+ua
         uP3w==
X-Forwarded-Encrypted: i=1; AJvYcCVDXFFra4gHDjNl3XWTvLAWj/On5sBh1OypmTKDu2usnGRkIOyO8QYrG6amYBdtkEWwAlaJvJA1SGs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxH4TF5I6L5JBtgHq2/2EYO02+Y7M4sfdo3Woo+UuirDO3JQP1b
	DuRethnlLkMADjFlN7zbAROxYF13ShFr/FX1W997dMSDn2kHfLlyOtGw
X-Gm-Gg: AY/fxX586mmcmExxRUc2qoqbwGYYjM4YPe60SQ7oumJI6Zqzqw1LhOAwRCQFM+A9QLu
	fcl2qtGjJQVKCQFaa6BxpNDV5qkC2AgxjZiXIp8jS6yEzhMChhOjDhDfQ1d34WeyRZG9rSbJuge
	ElkfraEai7Ww3s5V2FKYe9Iy9H8Nwlr4GRcPbK3JwBD9w1rX7tOly6Nf7S/+HAUzNpm2zNPdEPc
	USsm0XrV74SixLucaNuMYrQ1d90mP4MaS8akjggLVdNxqFXXXNOZo5lr2s5zTRcXtlfZKUxMoU/
	gts0Sycb+AVwfLJR3OeySCgFXTdzWqPfKoOpJy6wFo3yUL9X1WvdjKRXeK86ZoLsj0KnjEhPxQs
	mLFmnRm9eTKBDeB5D7jX+IB9n2dF29yDkZ2bE+V5G4W10GlgUkQqs2CAYTRXWlJdwRdSu9OtGq1
	RTWGtndIm+sPXRs/vBIOaxA7RrVOTtf0vFHey3Np9y5tqNt0bCc5mgUJEW2Ze5uq8=
X-Google-Smtp-Source: AGHT+IHaf5y6DbZ2r5fmz1rL9xYPQEyHKGJjCUvGaN6FJuCIAYRnViw+IumY+u/3ERZEcaATmXtqzQ==
X-Received: by 2002:a17:907:9603:b0:b80:a31:eb08 with SMTP id a640c23a62f3a-b84450205e1mr2070475866b.55.1768298319060;
        Tue, 13 Jan 2026 01:58:39 -0800 (PST)
Message-ID: <92cfc028-cabd-4686-b6b9-7cc047a909c9@gmail.com>
Date: Tue, 13 Jan 2026 10:58:37 +0100
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <b08265c6-6c19-4935-be34-face486bf994@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/12/26 6:05 PM, Jan Beulich wrote:
> On 12.01.2026 17:53, Oleksii Kurochko wrote:
>> On 1/7/26 4:47 PM, Jan Beulich wrote:
>>> On 24.12.2025 18:03, Oleksii Kurochko wrote:
>>>> @@ -13,3 +14,10 @@
>>>>    struct pcpu_info pcpu_info[NR_CPUS] = { [0 ... NR_CPUS - 1] = {
>>>>        .processor_id = NR_CPUS,
>>>>    }};
>>>> +
>>>> +void smp_send_event_check_mask(const cpumask_t *mask)
>>>> +{
>>>> +#if CONFIG_NR_CPUS > 1
>>>> +# error "smp_send_event_check_mask() unimplemented"
>>>> +#endif
>>>> +}
>>> CONFIG_NR_CPUS is 64 by default for 64-bit arch-es, from all I can tell, also
>>> for RISC-V. And there's no "override" in riscv64_defconfig. How is the above
>>> going to work in CI? Then again I must be overlooking something, as the config
>>> used in CI has CONFIG_NR_CPUS=1. Just that I can't tell why that is.
>> It is 1 because of the defintion of NR_CPUS in KConfig:
>> config NR_CPUS
>> 	int "Maximum number of CPUs"
>> 	range 1 1 if ARM && MPU
>> 	range 1 16383
>>           .... ( all other range props are condtional and there is no RISC-V in dependency)
>> so for RISC-V "range 1 16383" used and CONFIG_NR_CPUS is set to the minimal of this range,
>> so it is 1.
> I fear I don't follow: Why would the lowest value be picked, rather than the
> specified default (which would be 64 for RV64)? That's what I thought the
> default values are there (among other purposes).

But there is no default for RISC-V for config NR_CPUS:

   config NR_CPUS
	  int "Maximum number of CPUs"
	  range 1 1 if ARM && MPU
	  range 1 16383
	  default "256" if X86
	  default "1" if ARM && MPU
	  default "8" if ARM && RCAR3
	  default "4" if ARM && QEMU
	  default "4" if ARM && MPSOC
	  default "128" if ARM
	  help
	    ...

So a value from range [1, 16383] is chosen and based on the code of sym_validate_range():
         ...
	val = strtoll(sym->curr.val, NULL, base);
	val2 = sym_get_range_val(prop->expr->left.sym, base);
	if (val >= val2) {
		val2 = sym_get_range_val(prop->expr->right.sym, base);
		if (val <= val2)
			return;
	}
	if (sym->type == S_INT)
		sprintf(str, "%lld", val2);
	else
		sprintf(str, "0x%llx", val2);
         sym->curr.val = xstrdup(str);

First initialization of val2 it is the left value of the range [1, 16383],so it is 1
and val is 0 (I assume so that it is by initialization 0), thereby val2 = 1 will be
used as a value for NR_CPUS.

I also experimented by trying to update it to the range|2 16383|, and|CONFIG_NR_CPUS|
became 2.

~ Oleksii


