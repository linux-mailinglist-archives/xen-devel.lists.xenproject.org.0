Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E97D784CBB8
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 14:37:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677568.1054247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXi7E-0000qp-Sb; Wed, 07 Feb 2024 13:37:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677568.1054247; Wed, 07 Feb 2024 13:37:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXi7E-0000pD-Pv; Wed, 07 Feb 2024 13:37:28 +0000
Received: by outflank-mailman (input) for mailman id 677568;
 Wed, 07 Feb 2024 13:37:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EHwQ=JQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXi7D-00007V-44
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 13:37:27 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 079c2b0f-c5be-11ee-8a49-1f161083a0e0;
 Wed, 07 Feb 2024 14:37:25 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-33b4e6972f6so428495f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 05:37:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 z12-20020a056000110c00b0033b4ebc3c8fsm1328999wrw.2.2024.02.07.05.37.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 05:37:25 -0800 (PST)
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
X-Inumbo-ID: 079c2b0f-c5be-11ee-8a49-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707313045; x=1707917845; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Y82MohMyrcgLEJtzsSnSC+KLl8n5qIEw59SpPMusgXQ=;
        b=AUhN+VJOqRSomyX1XdT0sXVjPEG5IJSfHLljALSePrOEe2lmMzl5RLEM3B+xB0rLv+
         qOYEY6tVW9OwvRwsUf3IJtU6ES8N2JajpZnKUjXZF2H4Xrc1d7ys+c33kIhauuYvJDZJ
         n2Sk9aA3rFkFAT4lpzMx0w4lZMFQwoaEHaZM7R2Wk5yKcCEQobS4jH0sV9wqbMiXaj/w
         0kRwncGmH5Wtew8AJG/1AK/aE4eQPA02ZamRHBZHuV5iCI77vfvwAF0ShJqLdoBKj9S7
         N+vRRbDxIlIH8+7RSF78vf0N5AqfcwTXm5cWGyf7JTyYoLLl5TfJCqArwHawO5wrgoke
         eHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707313045; x=1707917845;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y82MohMyrcgLEJtzsSnSC+KLl8n5qIEw59SpPMusgXQ=;
        b=ls0qIPIjYH3GslGtlRVYvHSx1LpYHRQ4in49qn6P2cERw05nhafdqlbmB4PMhBhhSW
         Z0DaVzkBSwg545AucnXm87N52ckMtdrEUuHBF6Cnvstw32t4JbcJZX2QHBhovmWEKB4q
         eLqrDlT29IMiDbMDHBLBQzZmKvoyBO39ZarrVu8j0B8sFgHBydLvbGp4pwZofv4gUsbc
         oUNbeRntEljeKa6DF8XnAzmIWTg9hiWGczLptHkl3jm5jXq5NgXnAGFHtlJAYYFAMXiA
         bpfg3tckEHNXtbGUlmN5qfDij7LK5Y2koAb/TFiaAWc8/oRCzwPpS9gbznmG0Ue1gQ0m
         VtKg==
X-Gm-Message-State: AOJu0YyjUxxZfhp6CkYfe0x1Kgv4Rnip5DgKylsK76L35liai4GquQ3a
	EjW3jv2Bqo/R7H7nBSyDVoxQmzjGTI/+RMggkAaG2DTOtC96FYu6iUVNchIUmj5Y0uAYUdc99/0
	=
X-Google-Smtp-Source: AGHT+IFUN/uUEJTFN2yjSewFuBdgBOu537B/gJx5tTd1flGr1zhH3Prm3E38ihIpLr4G4/lXhZ0KUA==
X-Received: by 2002:a5d:6d88:0:b0:337:c454:81a8 with SMTP id l8-20020a5d6d88000000b00337c45481a8mr3845735wrs.55.1707313045482;
        Wed, 07 Feb 2024 05:37:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWgCqCvdwRAAtY3jDnLko+pXIr43NzcubyFc10vabDAJBB1OM609Uvscdtj9CEijIijeyy49nyWr3JVGcQR2xNtaDetaDEYK/TZMJuGerHmTXzEnJdYhO9KJFcWbumv7SOMrU0nwtnfIR8bH1RsKPtVfiSfMxG7ohnl+Xb8EXC4JR0y9r8Uu012OK9SBCuhkU8tyaB5HyPhZA==
Message-ID: <5fc304c0-be1f-46dd-a783-4030ec76a2f8@suse.com>
Date: Wed, 7 Feb 2024 14:37:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v6 3/7] VMX: convert entry point annotations
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Kevin Tian <kevin.tian@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <3ba82c3a-ff95-43d0-8672-a63b23bc2cdc@suse.com>
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
In-Reply-To: <3ba82c3a-ff95-43d0-8672-a63b23bc2cdc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Use the generic framework from xen/linkage.h.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v6: New.

--- a/xen/arch/x86/hvm/vmx/entry.S
+++ b/xen/arch/x86/hvm/vmx/entry.S
@@ -24,7 +24,7 @@
 #define VMRESUME     .byte 0x0f,0x01,0xc3
 #define VMLAUNCH     .byte 0x0f,0x01,0xc2
 
-ENTRY(vmx_asm_vmexit_handler)
+FUNC(vmx_asm_vmexit_handler)
         SAVE_ALL
 
         mov  %cr2,%rax
@@ -132,7 +132,7 @@ UNLIKELY_END(realmode)
         call vmx_vmentry_failure
         jmp  .Lvmx_process_softirqs
 
-ENTRY(vmx_asm_do_vmentry)
+LABEL(vmx_asm_do_vmentry)
         GET_CURRENT(bx)
         jmp  .Lvmx_do_vmentry
 
@@ -150,6 +150,4 @@ ENTRY(vmx_asm_do_vmentry)
         sti
         call do_softirq
         jmp  .Lvmx_do_vmentry
-
-        .type vmx_asm_vmexit_handler, @function
-        .size vmx_asm_vmexit_handler, . - vmx_asm_vmexit_handler
+END(vmx_asm_vmexit_handler)


