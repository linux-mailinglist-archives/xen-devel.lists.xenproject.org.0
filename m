Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C970D9D88B6
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 16:05:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842704.1258376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFaeJ-00038x-Rf; Mon, 25 Nov 2024 15:05:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842704.1258376; Mon, 25 Nov 2024 15:05:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFaeJ-00037T-On; Mon, 25 Nov 2024 15:05:15 +0000
Received: by outflank-mailman (input) for mailman id 842704;
 Mon, 25 Nov 2024 15:05:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mqqh=SU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tFaeH-00037N-IF
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 15:05:13 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9b943ea-ab3e-11ef-a0cd-8be0dac302b0;
 Mon, 25 Nov 2024 16:05:09 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5d01db666ceso4316658a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 25 Nov 2024 07:05:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa50b28dd59sm472346266b.7.2024.11.25.07.05.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2024 07:05:04 -0800 (PST)
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
X-Inumbo-ID: a9b943ea-ab3e-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzIiLCJoZWxvIjoibWFpbC1lZDEteDUzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImE5Yjk0M2VhLWFiM2UtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNTQ3MTA5LjcxNzc0MSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732547109; x=1733151909; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AHQrPgDLFge4x/7fwo43s+2wgrV0HGSrmV/YErP3WjU=;
        b=RbAjeyVOBxpMh91jFcpqBFrSg0/CaArA9+IHPejfWmEaxenpGEOaOlXW58R6HfMeqZ
         twbSIWQlqUFeUSMVSH6dadMJwtRgRtWtYePBTfSeTeBc/NRp1FkLUXdWCBKfWGaENVDE
         +K7zPNPf4WGdNXaAH/jNT6bdZ+MKMgZ6kOCRNhiWTRyaw/KeoKYCM63Z3DGmOIiXdSIc
         YOew0N2ar+iufi0qNgNFQumP7Hhy82dPkRCCenzg/T2jRkhbsbUrhc63d/jnthb2Iws+
         uXefWZ+3YTEr/bdo3Sd59PnxdUAIscSTBhPk5FnWa12cNEQGHECwsT0TIzv1cy3Anl/B
         qdew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732547109; x=1733151909;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AHQrPgDLFge4x/7fwo43s+2wgrV0HGSrmV/YErP3WjU=;
        b=R1YZVp0M4qDqQZXhgjjzVcP5nlL2gHUv4YA+rHInYh15bzvIzvT8BkPuHux0G/7EZC
         dFK2JZ+vfReFCvWWgyNAgpzjOd6PwWI5xwY+LbkjggUA7YMPqqzZalMYIX9IGFsRxWnv
         TYe8NC5IEhQxgzayHm27n3We4cviqd2b1XlzGn+KuLuBT/o+QA5tJ1BA82w/y5Cr3Wqi
         /7KuP7w1AakuG/mKhcaKl6A/xMo7/OChKwdXCvSpE1ig/+8xHIx10A9OjcnW1niSZqeo
         0qamfqBRnptri7dLe4qLJ+ZQ8tQKRxKM8f9RIHPV7bG+DSUX7FC/avmL/fDybyO1kgA0
         GjoQ==
X-Gm-Message-State: AOJu0Ywm2X/NQWtQrjwTpORT66Qoj7NisSZYrUIItR6Ewu8cyAC7vUHQ
	PeUGQVqYSDX8m7sX85u4DRQg0W5/j98dzvq+/nsakf0lDGCygEQASjw9vku87OjqxR5Lb3LFiHs
	=
X-Gm-Gg: ASbGnctqxoHXNwC9v6aA0jp1Nn/hGMxtoK1SYO8sHPb4W7LY7vlNba+sb4mEegyDBhd
	HftQkYybNf+fIiKXI1bXdIR1xVKiHkJq5HbuAoebvc+M2dMAM65wxQaCuQcMQeJZgZIg3g5Lxxk
	eJ5BeMD1vFOmz+n6Ser5r/u8UZIINTEGopKQjzSO2LEg82dfQNWNBIrrIJhFsD1hCG1aWAqShPc
	RTbNKSUaVbglWaUgpuo9za0JV1WJFRUNOL4Jit3HAjOGe2ymZQVD5IyOisL1b4K1fnJ98Anwm/V
	uIEG/zZkQYdLdJX5TYqwwKDx9zUk6WYLr9I=
X-Google-Smtp-Source: AGHT+IGTar6Ny5us3jHGxZ+Heo78lSJGMNWVhJ1a6Ju/vnosPCBCHyjAoBbv28tGy7LSgOCSSoF/Fw==
X-Received: by 2002:a17:906:1bb1:b0:aa5:4ca6:11b1 with SMTP id a640c23a62f3a-aa54ca61205mr426941566b.52.1732547105074;
        Mon, 25 Nov 2024 07:05:05 -0800 (PST)
Message-ID: <3a25cd59-e1cb-4bfc-b868-fb11599d22f5@suse.com>
Date: Mon, 25 Nov 2024 16:05:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v7 0/7] x86emul: misc additions
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Language: en-US
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

1: x86emul: support LKGS
2: x86emul+VMX: support {RD,WR}MSRLIST
3: x86emul: support USER_MSR instructions
4: x86/cpu-policy: re-arrange no-VMX logic
5: VMX: support USER_MSR
6: x86emul: support MSR_IMM instructions
7: x86emul: support non-SIMD MOVRS

Due to lack of specification the VMX counterpart for MSR_IMM is still
missing (unlike USER_MSR).

Jan

