Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CACD9751D7
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 14:19:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796496.1206105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soMJd-0002LM-Ey; Wed, 11 Sep 2024 12:19:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796496.1206105; Wed, 11 Sep 2024 12:19:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soMJd-0002Jr-CN; Wed, 11 Sep 2024 12:19:21 +0000
Received: by outflank-mailman (input) for mailman id 796496;
 Wed, 11 Sep 2024 12:19:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1soMJb-0002Jl-Mt
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 12:19:19 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10f5b2c6-7038-11ef-99a1-01e77a169b0f;
 Wed, 11 Sep 2024 14:19:17 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2f029e9c9cfso14144631fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2024 05:19:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25c72ea5sm609294666b.99.2024.09.11.05.19.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2024 05:19:16 -0700 (PDT)
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
X-Inumbo-ID: 10f5b2c6-7038-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726057157; x=1726661957; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FwGshSrysBsS7dpDaUGD9wbyH3KrW/5vqOmelm0cSE0=;
        b=Ry7DCkz9RNZj2TfI4hWORFlHoSXR0dBvSQpViklOu6hMGRmuXS4R0znAV6lnFjVAYp
         sMrkK9nYQhiqI7WriN150UwXUKnCJ/aDUF5L+31HweSEDS8kxWgRqlz3ROljIb4s/o5w
         6+LfLcaQJ1D0KTjsFvhjETt8XKM7siNrsalMh3RHa91BUz9T3kxNI85Cc67UANsOHR/M
         9Teeahy91pDB+tsUkoheqF/dsdZBhmGAox/YZrHRtOuHWxN0s8x9p1BcWPUDFL7TOrNX
         JMrvDbd9q3JCFnBpMCilvtLMfzNotqkijtr3fRRqOuSWX3exPUQxdG8kBtuaTGVpASB9
         jwEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726057157; x=1726661957;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FwGshSrysBsS7dpDaUGD9wbyH3KrW/5vqOmelm0cSE0=;
        b=toBKpQsrlbzoZMLOTABlivl0dN8qD+V9bCjDrI0NRkJq8HqFskGjbs83oTfL8Q2thd
         grXZR/9+415qsaGuVDTBciKmmr6SR4PcWUdE9CK7ePdTPvy9dRCdYO1Tg7bIKYwoXCxa
         0NrGnmIYQDvL2FcZCe5abidUG/zxIndPlETfOJv8na1hWF6Oe5GLkQAAx34LDAzNM7xt
         ptk5TdrwKvKYg3tenAgweBLovQUvzkEi9sIFHkFoHI4Fdc/wdhlt765di3+orrOxqaL/
         0426L3NGlMmMoj4RbEkMvBYEVSghYxsv82PQc7jEqRi7P5fGZv8bnQDEYXqui1PFt99t
         XNlg==
X-Gm-Message-State: AOJu0YyBzQulUpDVArLxXAh+rE4MaNYcDGETrdv4vA+3Xt9Q+O7rMu+v
	aOEokITNNdoquZJBrxaBfLQ0cyLFndkUlATtT9Lks/FHTl+sYmRbtLTKITnk7m67L9BDxo+yW+Q
	=
X-Google-Smtp-Source: AGHT+IH7KfW8plrXQSTORLa/h5Vp9SzN2v4fzjDvPZoXLdBT8bZcaJHeopYBBwQWDQRM/jSInSfnGg==
X-Received: by 2002:a2e:bc15:0:b0:2f6:6198:1cf9 with SMTP id 38308e7fff4ca-2f75aa0a315mr146761271fa.31.1726057157076;
        Wed, 11 Sep 2024 05:19:17 -0700 (PDT)
Message-ID: <f0cd7c48-6816-4050-a505-693c4a470506@suse.com>
Date: Wed, 11 Sep 2024 14:19:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] ioreq: don't wrongly claim "success" in ioreq_send_buffered()
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

Returning a literal number is a bad idea anyway when all other returns
use IOREQ_STATUS_* values. While that's maybe intended on Arm (mapping
to IO_ABORT), mapping to X86EMUL_OKAY is surely wrong on x86.

Fixes: f6bf39f84f82 ("x86/hvm: add support for broadcast of buffered ioreqs...")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Judging from history, it may want to be IOREQ_STATUS_UNHANDLED instead,
eliminating the need for IOREQ_STATUS_BAD. That'll be a behavioral
change on Arm then too, though.

Shouldn't IOREQ_READ requests also be rejected here, for the result of
a read not possibly coming from anywhere, yet a (bogus) caller then
assuming some data was actually returned?

--- a/xen/arch/arm/include/asm/ioreq.h
+++ b/xen/arch/arm/include/asm/ioreq.h
@@ -56,6 +56,7 @@ static inline void msix_write_completion
 #define IOREQ_STATUS_HANDLED     IO_HANDLED
 #define IOREQ_STATUS_UNHANDLED   IO_UNHANDLED
 #define IOREQ_STATUS_RETRY       IO_RETRY
+#define IOREQ_STATUS_BAD         IO_ABORT
 
 #endif /* __ASM_ARM_IOREQ_H__ */
 
--- a/xen/arch/x86/include/asm/hvm/ioreq.h
+++ b/xen/arch/x86/include/asm/hvm/ioreq.h
@@ -12,6 +12,7 @@
 #define IOREQ_STATUS_HANDLED     X86EMUL_OKAY
 #define IOREQ_STATUS_UNHANDLED   X86EMUL_UNHANDLEABLE
 #define IOREQ_STATUS_RETRY       X86EMUL_RETRY
+#define IOREQ_STATUS_BAD         X86EMUL_UNRECOGNIZED
 
 #endif /* __ASM_X86_HVM_IOREQ_H__ */
 
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -1175,7 +1175,7 @@ static int ioreq_send_buffered(struct io
         return IOREQ_STATUS_UNHANDLED;
 
     /*
-     * Return 0 for the cases we can't deal with:
+     * Return BAD for the cases we can't deal with:
      *  - 'addr' is only a 20-bit field, so we cannot address beyond 1MB
      *  - we cannot buffer accesses to guest memory buffers, as the guest
      *    may expect the memory buffer to be synchronously accessed
@@ -1183,7 +1183,7 @@ static int ioreq_send_buffered(struct io
      *    support data_is_ptr we do not waste space for the count field either
      */
     if ( (p->addr > 0xfffffUL) || p->data_is_ptr || (p->count != 1) )
-        return 0;
+        return IOREQ_STATUS_BAD;
 
     switch ( p->size )
     {

