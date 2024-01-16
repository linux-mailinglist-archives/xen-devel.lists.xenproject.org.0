Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A5182F2C7
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 17:59:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667914.1039604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPmmF-0006OD-8q; Tue, 16 Jan 2024 16:59:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667914.1039604; Tue, 16 Jan 2024 16:59:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPmmF-0006LS-5i; Tue, 16 Jan 2024 16:59:03 +0000
Received: by outflank-mailman (input) for mailman id 667914;
 Tue, 16 Jan 2024 16:59:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MjSB=I2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rPmmE-0006K8-FI
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 16:59:02 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c1c9a73-b490-11ee-98f1-6d05b1d4d9a1;
 Tue, 16 Jan 2024 17:59:01 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2cca8eb0509so124646511fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jan 2024 08:59:01 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bs10-20020a056638450a00b0046e9ad3dbe3sm446602jab.128.2024.01.16.08.58.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jan 2024 08:59:00 -0800 (PST)
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
X-Inumbo-ID: 8c1c9a73-b490-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705424341; x=1706029141; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pC3awBdfkOU+DgeWa6Gv9VA13lRqs0I2JhFJq/TvClQ=;
        b=cMKbAEOmfRT47y4Eu4pEEPcvOSwxXLRb+HpCWfslWlB+xiqfqLlgM1Zg6ADhQJ/WJB
         mUTRBglhvgj+Jt1CPwb/E8fEkq0QXLVNg0A5Ka7n7EUGJk+KTxuKoCWdXe+J9eTD5zLw
         8fRj4MAekzXp8rqOA1b5i3Dm/kyGhcyN6cQ5WaPJSus2Q1BWSw1wwQmYYurF4AljV136
         ph7n5SqJwtR4dVsYeKWQPCLXpirsGI1Z4r+2SWaXGVizcbwiVZvO1qr1NjQTYmRgm2pL
         hLRECEIJDiTMnsyb6cKQwMWuLmFu6fhxLys0hihgcJKWhL2Bqz1kwuTT4tMgwlhM68cq
         myAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705424341; x=1706029141;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pC3awBdfkOU+DgeWa6Gv9VA13lRqs0I2JhFJq/TvClQ=;
        b=aMlsO32hUUC6Qe3eoPRJKBW3OG7oUDlXtErIrtJxT4PHXNx0oyJZBhRjqzKt7y7QFn
         kZKD+jld09hv7H8mTQJTApTHC/Ck1/zBPMqQIMmDAcIM0VftrDkY5CDiol5+mtxfrYxa
         D4g29yEwUTvWi0m4b8TNZXff9nZfVbXqksCjBCBHre9ZKDGYD8lOArvikpghvTri+ubX
         y9hNdUa2PZ690Xngf32PnjAMsCfsO5JLyM/nhGtz1KZ+4ZqneNFVtvy74tdPutNDQ56A
         NwORzySB1L0XGPT6aEUt9cWz7kn5FjIXlP2etwTWBjqNpYbM3/KI0dPZVJeKIAg0FgK7
         11BQ==
X-Gm-Message-State: AOJu0Yw4P5+4Jm4KBa0ILWPdWb1ltdTNaDdsywnetAuqj7Ur6ZPfiqSK
	tnNPophLHbS5PY1wMIe9AjYCl2d4sw7qjWaw5vvR4tu+hg==
X-Google-Smtp-Source: AGHT+IFWeLLASNg6p9Vo36TSvTSFg+DW7XJb5ZwxrTR0WBzHqoKMPHD9w54TAxqLbAlhqb5WUTH43Q==
X-Received: by 2002:a2e:7c06:0:b0:2cd:463f:6c34 with SMTP id x6-20020a2e7c06000000b002cd463f6c34mr3405756ljc.78.1705424341046;
        Tue, 16 Jan 2024 08:59:01 -0800 (PST)
Message-ID: <5f7afa11-3216-4175-b05b-3ff78920fa00@suse.com>
Date: Tue, 16 Jan 2024 17:58:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/PV: use altcall for I/O emulation quirk hook
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

This way we can arrange for ioemul_handle_proliant_quirk()'s ENDBR to
also be zapped. Utilize existing data rather than introducing another
otherwise unused static variable (array); eventually (if any new quirk
was in need of adding) we may want to use .callback and .driver_data
anyway.

For the decision to be taken before the 2nd alternative patching pass,
the initcall needs to become a pre-SMP one.

While touching this code, also arrange for it to not be built at all
when !PV - that way the respective ENDBR won't be there from the
beginning.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Obviously the file may want moving to pv/ then. I wasn't sure whether
to also fold doing so right into here.

--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -45,7 +45,7 @@ obj-$(CONFIG_LIVEPATCH) += alternative.o
 obj-y += msi.o
 obj-y += msr.o
 obj-$(CONFIG_INDIRECT_THUNK) += indirect-thunk.o
-obj-y += ioport_emulate.o
+obj-$(CONFIG_PV) += ioport_emulate.o
 obj-y += irq.o
 obj-$(CONFIG_KEXEC) += machine_kexec.o
 obj-y += mm.o x86_64/mm.o
--- a/xen/arch/x86/ioport_emulate.c
+++ b/xen/arch/x86/ioport_emulate.c
@@ -36,7 +36,7 @@ static unsigned int cf_check ioemul_hand
 }
 
 /* This table is the set of system-specific I/O emulation hooks. */
-static const struct dmi_system_id __initconstrel ioport_quirks_tbl[] = {
+static const struct dmi_system_id __initconst_cf_clobber ioport_quirks_tbl[] = {
     /*
      * I/O emulation hook for certain HP ProLiant servers with
      * 'special' SMM goodness.
@@ -46,6 +46,8 @@ static const struct dmi_system_id __init
         DMI_MATCH2(
             DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
             DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant DL3")),
+        /* Need in one entry only as long as .callback isn't also used. */
+        .driver_data = ioemul_handle_proliant_quirk,
     },
     {
         .ident = "HP ProLiant DL5xx",
@@ -99,7 +101,7 @@ static int __init cf_check ioport_quirks
 
     return 0;
 }
-__initcall(ioport_quirks_init);
+presmp_initcall(ioport_quirks_init);
 
 /*
  * Local variables:
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -112,7 +112,8 @@ static io_emul_stub_t *io_emul_stub_setu
     /* Some platforms might need to quirk the stub for specific inputs. */
     if ( unlikely(ioemul_handle_quirk) )
     {
-        quirk_bytes = ioemul_handle_quirk(opcode, p, ctxt->ctxt.regs);
+        quirk_bytes = alternative_call(ioemul_handle_quirk, opcode, p,
+                                       ctxt->ctxt.regs);
         p += quirk_bytes;
     }
 

