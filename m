Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A91A3C312
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 16:07:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893105.1302035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tklfP-0002Yc-OR; Wed, 19 Feb 2025 15:07:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893105.1302035; Wed, 19 Feb 2025 15:07:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tklfP-0002WE-Ku; Wed, 19 Feb 2025 15:07:15 +0000
Received: by outflank-mailman (input) for mailman id 893105;
 Wed, 19 Feb 2025 15:07:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GJ0s=VK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tklfN-0002W8-P9
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 15:07:13 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3268106e-eed3-11ef-9aa8-95dc52dad729;
 Wed, 19 Feb 2025 16:07:12 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-545284eac3bso5886537e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 07:07:12 -0800 (PST)
Received: from [172.24.85.51] ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5462ea153a9sm293983e87.176.2025.02.19.07.07.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 07:07:10 -0800 (PST)
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
X-Inumbo-ID: 3268106e-eed3-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739977632; x=1740582432; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FQnqEaIq4pPQbyFf5rfunE6fDBSdIx7AHUJbvxerkMo=;
        b=DwRHIJfxQ3S6/AjVDvaK8XRMShdGR4+D9Lpw+gY8UX5V/LtXQFPi0KVbNHQ5rTlf2K
         YuqfkqE61BfxBgZ0WzTSknSdtoZvkJPjAN64gVT1LYKjmEPR7otTC0ynmrrsi43KBFhe
         P9TEa1SastVAqmZViHo94hvX9Qicr5IlrqUB9KYbKVcTq320SrEuup3dFBGxpkLnkGIv
         JRQ0CcCNyvMGxAzIPU/Buqr2QS5yAaDVmLRQ9J9Ei5jZvADGqDONMMkkT27WAOS9dBZB
         YSRN5ChVx0XcW3eyehcPFvNGZTTslVt8cnxGJA5RMeCHHS3KWc06qpMXIczsp1T3DswY
         c/jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739977632; x=1740582432;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FQnqEaIq4pPQbyFf5rfunE6fDBSdIx7AHUJbvxerkMo=;
        b=C2Py8FwzOf5p6WqLoKxQuOHk8TO1S9PlrUqi+w213UHQsibR/ehrIxLNLVmxHU24ox
         Jq/TP+RkvqXr67UMODmiP2x2v8VMZWziGj/gZNUpAKHF4DkaHVPvwG2aIyqhwz8RUjKt
         kwRnaxb57+xnj5zI7MZZqr656PnKUGPwdcTq9Z0XNospO8s1kJ3Ed4AEAm1fO01fyKMs
         r69Mu5sYVP1NKWZh9Wy2pKWCu43xKNnOrFm8oMJ7K9RoU8sq5idP5RUPXuWYnvfolZoC
         RhjmXT0pCD8UeBuovBzQFmLNi0f4m/TaL+z511v4YCEH8mWPo64nuQcU7jn7ZEDowSia
         /+QA==
X-Forwarded-Encrypted: i=1; AJvYcCU/M8Q/Zdwfq1JePDMB1U8w8KKmSWzWLElvgHmvzmPiJInLLN3Mtv1NoDW12CvEkOnHFIsfnnIMiB4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzNk9DU09sjQr3PfdO6/uRUXG2D2e+pLi96HPaa6i/pdMabzzX3
	Jezg9sc1K0ReR7hMfBULEsKSpJrzfK9fhFs643IDGyiKySftS7z0
X-Gm-Gg: ASbGnctMD1qV93ycfwib1fTxKIQx7Foc1FPJT0v5+sNgzTfruZKMqs3FMJJykwKtax/
	msVI+Ap0Qep3l/6wW7eRU796XcA2x45jGDIOLVo6nVR7fIv4R2GDw5jgFO9CpOsiQohesKd5lns
	SLu3dKdCOdBZVhUPVaYlpw7Fa4oVzKMKYplV94j69X8PjiRwvu0abFg1Gt+HVUs1AC71Yq4sHuG
	HlmnZa8k8oLXbFJffrmZy5NwPmUH7AaJOMrkUy2Ubu1NEdRRNc1F5rWTw+LmIhBY/x5QN7mgwnk
	v2Z1nvIBJc7oKTymVSwt75Ds
X-Google-Smtp-Source: AGHT+IE7NA/3YfWwWs3ke3HOD1fN4aNgVPsjTj8oERIN13XvyCSAeekkLhkI9XqzKT3tXtp4KSLUyQ==
X-Received: by 2002:a05:6512:3d0b:b0:545:60b:f391 with SMTP id 2adb3069b0e04-5462eedae1dmr1508708e87.2.1739977630927;
        Wed, 19 Feb 2025 07:07:10 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------E3y0PXV0utXt7CW2dWCKKwuG"
Message-ID: <9f728cff-1d9d-4d31-90b2-f047ff370c83@gmail.com>
Date: Wed, 19 Feb 2025 16:07:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.21 v6 2/2] xen/riscv: identify specific ISA
 supported by cpu
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1739355004.git.oleksii.kurochko@gmail.com>
 <8aa59f23aa5ef551344f75889b6cf3d871e35278.1739355004.git.oleksii.kurochko@gmail.com>
 <51a514cc-3247-4c0d-bc16-821c251c416d@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <51a514cc-3247-4c0d-bc16-821c251c416d@suse.com>

This is a multi-part message in MIME format.
--------------E3y0PXV0utXt7CW2dWCKKwuG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/19/25 12:05 PM, Jan Beulich wrote:
> On 12.02.2025 17:50, Oleksii Kurochko wrote:
>> --- /dev/null
>> +++ b/xen/arch/riscv/cpufeature.c
>> @@ -0,0 +1,502 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Originally taken for Linux kernel v6.12-rc3.
>> + *
>> + * Copyright (C) 2015 ARM Ltd.
>> + * Copyright (C) 2017 SiFive
>> + * Copyright (C) 2024 Vates
>> + */
>> +
>> +#include <xen/bitmap.h>
>> +#include <xen/ctype.h>
>> +#include <xen/device_tree.h>
>> +#include <xen/errno.h>
>> +#include <xen/init.h>
>> +#include <xen/lib.h>
>> +#include <xen/sections.h>
>> +
>> +#include <asm/cpufeature.h>
>> +
>> +#ifdef CONFIG_ACPI
>> +# error "cpufeature.c functions should be updated to support ACPI"
>> +#endif
>> +
>> +struct riscv_isa_ext_data {
>> +    unsigned int id;
>> +    const char *name;
>> +};
>> +
>> +#define RISCV_ISA_EXT_DATA(ext_name)            \
>> +{                                               \
>> +    .id = RISCV_ISA_EXT_##ext_name,             \
> Nit: ## being a binary operator (just for the pre-processor) we prefer
> it, too, to be framed by blanks.
>
>> +/*
>> + * The canonical order of ISA extension names in the ISA string is defined in
>> + * chapter 27 of the unprivileged specification.
>> + *
>> + * The specification uses vague wording, such as should, when it comes to
>> + * ordering, so for our purposes the following rules apply:
>> + *
>> + * 1. All multi-letter extensions must be separated from other extensions by an
>> + *    underscore.
>> + *
>> + * 2. Additional standard extensions (starting with 'Z') must be sorted after
>> + *    single-letter extensions and before any higher-privileged extensions.
>> + *
>> + * 3. The first letter following the 'Z' conventionally indicates the most
>> + *    closely related alphabetical extension category, IMAFDQLCBKJTPVH.
>> + *    If multiple 'Z' extensions are named, they must be ordered first by
>> + *    category, then alphabetically within a category.
>> + *
>> + * 4. Standard supervisor-level extensions (starting with 'S') must be listed
>> + *    after standard unprivileged extensions.  If multiple supervisor-level
>> + *    extensions are listed, they must be ordered alphabetically.
>> + *
>> + * 5. Standard machine-level extensions (starting with 'Zxm') must be listed
>> + *    after any lower-privileged, standard extensions.  If multiple
>> + *    machine-level extensions are listed, they must be ordered
>> + *    alphabetically.
>> + *
>> + * 6. Non-standard extensions (starting with 'X') must be listed after all
>> + *    standard extensions. If multiple non-standard extensions are listed, they
>> + *    must be ordered alphabetically.
>> + *
>> + * An example string following the order is:
>> + *    rv64imadc_zifoo_zigoo_zafoo_sbar_scar_zxmbaz_xqux_xrux
>> + *
>> + * New entries to this struct should follow the ordering rules described above.
>> + *
>> + * Extension name must be all lowercase (according to device-tree binding)
>> + * and strncmp() is used in match_isa_ext() to compare extension names instead
>> + * of strncasecmp().
>> + */
>> +const struct riscv_isa_ext_data __initconst riscv_isa_ext[] = {
>> +    RISCV_ISA_EXT_DATA(i),
>> +    RISCV_ISA_EXT_DATA(m),
>> +    RISCV_ISA_EXT_DATA(a),
>> +    RISCV_ISA_EXT_DATA(f),
>> +    RISCV_ISA_EXT_DATA(d),
>> +    RISCV_ISA_EXT_DATA(q),
>> +    RISCV_ISA_EXT_DATA(c),
>> +    RISCV_ISA_EXT_DATA(h),
>> +    RISCV_ISA_EXT_DATA(zicntr),
>> +    RISCV_ISA_EXT_DATA(zicsr),
>> +    RISCV_ISA_EXT_DATA(zifencei),
>> +    RISCV_ISA_EXT_DATA(zihintpause),
>> +    RISCV_ISA_EXT_DATA(zihpm),
>> +    RISCV_ISA_EXT_DATA(zbb),
> No Zba and Zbs here, despite there now being enumerators for them?

Missed to add them here. Now someone could try to ask if they are supported
by a CPU as we have that in enumerators. I will add it then.

>
>> +static int __init riscv_isa_parse_string(const char *isa,
>> +                                         unsigned long *out_bitmap)
>> +{
>> +    if ( (isa[0] != 'r') && (isa[1] != 'v') )
>> +        return -EINVAL;
>> +
>> +#if defined(CONFIG_RISCV_32)
>> +    if ( isa[2] != '3' && isa[3] != '2' )
>> +        return -EINVAL;
>> +#elif defined(CONFIG_RISCV_64)
>> +    if ( isa[2] != '6' && isa[3] != '4' )
>> +        return -EINVAL;
>> +#else
>> +# error "unsupported RISC-V bitness"
>> +#endif
>> +
>> +    /*
>> +     * In unpriv. specification (*_20240411) is mentioned the following:
>> +     * (1) A RISC-V ISA is defined as a base integer ISA, which must be
>> +     *     present in any implementation, plus optional extensions to
>> +     *     the base ISA.
>> +     * (2) Chapter 6 describes the RV32E and RV64E subset variants of
>> +     *     the RV32I or RV64I base instruction sets respectively, which
>> +     *     have been added to support small microcontrollers, and which
>> +     *     have half the number of integer registers.
>> +     *
>> +     * What means that isa should contain, at least, I or E.
>> +     *
>> +     * As Xen isn't expected to be run on microcontrollers and according
>> +     * to device tree binding the first extension should be "i".
>> +     */
>> +    if ( isa[4] != 'i' )
>> +        return -EINVAL;
>> +
>> +    isa += 4;
>> +
>> +    while ( *isa )
>> +    {
>> +        const char *ext = isa++;
>> +        const char *ext_end = isa;
>> +
>> +        switch ( *ext )
>> +        {
>> +        case 'x':
>> +            printk_once("Vendor extensions are ignored in riscv,isa\n");
>> +            /*
>> +             * To skip an extension, we find its end.
>> +             * As multi-letter extensions must be split from other multi-letter
>> +             * extensions with an "_", the end of a multi-letter extension will
>> +             * either be the null character or the "_" at the start of the next
>> +             * multi-letter extension.
>> +             */
>> +            for ( ; *isa && *isa != '_'; ++isa )
>> +                if ( unlikely(!isalnum(*isa)) )
>> +                    goto riscv_isa_parse_string_err;
>> +
>> +            ext_end = NULL;
>> +            break;
>> +
>> +        case 's':
>> +            /*
>> +             * Workaround for invalid single-letter 's' & 'u' (QEMU):
>> +             *   Before QEMU 7.1 it was an issue with misa to ISA string
>> +             *   conversion:
>> +             *https://patchwork.kernel.org/project/qemu-devel/patch/dee09d708405075420b29115c1e9e87910b8da55.1648270894.git.research_trasio@irq.a4lg.com/#24792587
>> +             *   Additional details of the workaround on Linux kernel side:
>> +             *https://lore.kernel.org/linux-riscv/ae93358e-e117-b43d-faad-772c529f846c@irq.a4lg.com/#t
>> +             *
>> +             * No need to set the bit in riscv_isa as 's' & 'u' are
>> +             * not valid ISA extensions. It works unless the first
>> +             * multi-letter extension in the ISA string begins with
>> +             * "Su" and is not prefixed with an underscore.
>> +             */
>> +            if ( ext[-1] != '_' && ext[1] == 'u' )
>> +            {
>> +                ++isa;
>> +                ext_end = NULL;
>> +                break;
>> +            }
>> +            fallthrough;
>> +        case 'z':
>> +            /*
>> +             * Before attempting to parse the extension itself, we find its end.
>> +             * As multi-letter extensions must be split from other multi-letter
>> +             * extensions with an "_", the end of a multi-letter extension will
>> +             * either be the null character or the "_" at the start of the next
>> +             * multi-letter extension.
>> +             *
>> +             * Next, as the extensions version is currently ignored, we
>> +             * eliminate that portion. This is done by parsing backwards from
>> +             * the end of the extension, removing any numbers. This may be a
>> +             * major or minor number however, so the process is repeated if a
>> +             * minor number was found.
>> +             *
>> +             * ext_end is intended to represent the first character *after* the
>> +             * name portion of an extension, but will be decremented to the last
>> +             * character itself while eliminating the extensions version number.
>> +             * A simple re-increment solves this problem.
>> +             */
>> +            for ( ; *isa && *isa != '_'; ++isa )
>> +                if ( unlikely(!isalnum(*isa)) )
>> +                    goto riscv_isa_parse_string_err;
>> +
>> +            ext_end = isa;
>> +
>> +            if ( !isdigit(ext_end[-1]) )
>> +                break;
>> +
>> +            while ( isdigit(*--ext_end) )
>> +                ;
>> +
>> +            if ( ext_end[0] != 'p' || !isdigit(ext_end[-1]) )
>> +            {
>> +                ++ext_end;
>> +                break;
>> +            }
>> +
>> +            while ( isdigit(*--ext_end) )
>> +                ;
>> +
>> +            ++ext_end;
>> +            break;
>> +
>> +        /*
>> +         * if someone mentioned `b` extension in riscv,isa instead of Zb{a,b,s}
>> +         * explicitly then set bits exlicitly in out_bitmap to satisfy
>> +         * requirement of Zbb (mentioned in required_extensions[]).
>> +         */
> Nit (style): Comments want to start with a captial letter.
>
> With the two nits addressed and the Zba/Zbs question sorted (all
> adjustments could be done while committing, albeit the disposition of
> patch 1 isn't clear yet, so a v7 may be needed anyway):
> Acked-by: Jan Beulich<jbeulich@suse.com>

I will send new patch series anyway, I can fix the comments there.

Thanks.

~ Oleksii


>
> Jan
--------------E3y0PXV0utXt7CW2dWCKKwuG
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/19/25 12:05 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:51a514cc-3247-4c0d-bc16-821c251c416d@suse.com">
      <pre wrap="" class="moz-quote-pre">On 12.02.2025 17:50, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- /dev/null
+++ b/xen/arch/riscv/cpufeature.c
@@ -0,0 +1,502 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Originally taken for Linux kernel v6.12-rc3.
+ *
+ * Copyright (C) 2015 ARM Ltd.
+ * Copyright (C) 2017 SiFive
+ * Copyright (C) 2024 Vates
+ */
+
+#include &lt;xen/bitmap.h&gt;
+#include &lt;xen/ctype.h&gt;
+#include &lt;xen/device_tree.h&gt;
+#include &lt;xen/errno.h&gt;
+#include &lt;xen/init.h&gt;
+#include &lt;xen/lib.h&gt;
+#include &lt;xen/sections.h&gt;
+
+#include &lt;asm/cpufeature.h&gt;
+
+#ifdef CONFIG_ACPI
+# error "cpufeature.c functions should be updated to support ACPI"
+#endif
+
+struct riscv_isa_ext_data {
+    unsigned int id;
+    const char *name;
+};
+
+#define RISCV_ISA_EXT_DATA(ext_name)            \
+{                                               \
+    .id = RISCV_ISA_EXT_##ext_name,             \
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Nit: ## being a binary operator (just for the pre-processor) we prefer
it, too, to be framed by blanks.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+/*
+ * The canonical order of ISA extension names in the ISA string is defined in
+ * chapter 27 of the unprivileged specification.
+ *
+ * The specification uses vague wording, such as should, when it comes to
+ * ordering, so for our purposes the following rules apply:
+ *
+ * 1. All multi-letter extensions must be separated from other extensions by an
+ *    underscore.
+ *
+ * 2. Additional standard extensions (starting with 'Z') must be sorted after
+ *    single-letter extensions and before any higher-privileged extensions.
+ *
+ * 3. The first letter following the 'Z' conventionally indicates the most
+ *    closely related alphabetical extension category, IMAFDQLCBKJTPVH.
+ *    If multiple 'Z' extensions are named, they must be ordered first by
+ *    category, then alphabetically within a category.
+ *
+ * 4. Standard supervisor-level extensions (starting with 'S') must be listed
+ *    after standard unprivileged extensions.  If multiple supervisor-level
+ *    extensions are listed, they must be ordered alphabetically.
+ *
+ * 5. Standard machine-level extensions (starting with 'Zxm') must be listed
+ *    after any lower-privileged, standard extensions.  If multiple
+ *    machine-level extensions are listed, they must be ordered
+ *    alphabetically.
+ *
+ * 6. Non-standard extensions (starting with 'X') must be listed after all
+ *    standard extensions. If multiple non-standard extensions are listed, they
+ *    must be ordered alphabetically.
+ *
+ * An example string following the order is:
+ *    rv64imadc_zifoo_zigoo_zafoo_sbar_scar_zxmbaz_xqux_xrux
+ *
+ * New entries to this struct should follow the ordering rules described above.
+ *
+ * Extension name must be all lowercase (according to device-tree binding)
+ * and strncmp() is used in match_isa_ext() to compare extension names instead
+ * of strncasecmp().
+ */
+const struct riscv_isa_ext_data __initconst riscv_isa_ext[] = {
+    RISCV_ISA_EXT_DATA(i),
+    RISCV_ISA_EXT_DATA(m),
+    RISCV_ISA_EXT_DATA(a),
+    RISCV_ISA_EXT_DATA(f),
+    RISCV_ISA_EXT_DATA(d),
+    RISCV_ISA_EXT_DATA(q),
+    RISCV_ISA_EXT_DATA(c),
+    RISCV_ISA_EXT_DATA(h),
+    RISCV_ISA_EXT_DATA(zicntr),
+    RISCV_ISA_EXT_DATA(zicsr),
+    RISCV_ISA_EXT_DATA(zifencei),
+    RISCV_ISA_EXT_DATA(zihintpause),
+    RISCV_ISA_EXT_DATA(zihpm),
+    RISCV_ISA_EXT_DATA(zbb),
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
No Zba and Zbs here, despite there now being enumerators for them?</pre>
    </blockquote>
    <pre>Missed to add them here. Now someone could try to ask if they are supported
by a CPU as we have that in enumerators. I will add it then.

</pre>
    <blockquote type="cite"
      cite="mid:51a514cc-3247-4c0d-bc16-821c251c416d@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+static int __init riscv_isa_parse_string(const char *isa,
+                                         unsigned long *out_bitmap)
+{
+    if ( (isa[0] != 'r') &amp;&amp; (isa[1] != 'v') )
+        return -EINVAL;
+
+#if defined(CONFIG_RISCV_32)
+    if ( isa[2] != '3' &amp;&amp; isa[3] != '2' )
+        return -EINVAL;
+#elif defined(CONFIG_RISCV_64)
+    if ( isa[2] != '6' &amp;&amp; isa[3] != '4' )
+        return -EINVAL;
+#else
+# error "unsupported RISC-V bitness"
+#endif
+
+    /*
+     * In unpriv. specification (*_20240411) is mentioned the following:
+     * (1) A RISC-V ISA is defined as a base integer ISA, which must be
+     *     present in any implementation, plus optional extensions to
+     *     the base ISA.
+     * (2) Chapter 6 describes the RV32E and RV64E subset variants of
+     *     the RV32I or RV64I base instruction sets respectively, which
+     *     have been added to support small microcontrollers, and which
+     *     have half the number of integer registers.
+     *
+     * What means that isa should contain, at least, I or E.
+     *
+     * As Xen isn't expected to be run on microcontrollers and according
+     * to device tree binding the first extension should be "i".
+     */
+    if ( isa[4] != 'i' )
+        return -EINVAL;
+
+    isa += 4;
+
+    while ( *isa )
+    {
+        const char *ext = isa++;
+        const char *ext_end = isa;
+
+        switch ( *ext )
+        {
+        case 'x':
+            printk_once("Vendor extensions are ignored in riscv,isa\n");
+            /*
+             * To skip an extension, we find its end.
+             * As multi-letter extensions must be split from other multi-letter
+             * extensions with an "_", the end of a multi-letter extension will
+             * either be the null character or the "_" at the start of the next
+             * multi-letter extension.
+             */
+            for ( ; *isa &amp;&amp; *isa != '_'; ++isa )
+                if ( unlikely(!isalnum(*isa)) )
+                    goto riscv_isa_parse_string_err;
+
+            ext_end = NULL;
+            break;
+
+        case 's':
+            /*
+             * Workaround for invalid single-letter 's' &amp; 'u' (QEMU):
+             *   Before QEMU 7.1 it was an issue with misa to ISA string
+             *   conversion:
+             *     <a class="moz-txt-link-freetext" href="https://patchwork.kernel.org/project/qemu-devel/patch/dee09d708405075420b29115c1e9e87910b8da55.1648270894.git.research_trasio@irq.a4lg.com/#24792587">https://patchwork.kernel.org/project/qemu-devel/patch/dee09d708405075420b29115c1e9e87910b8da55.1648270894.git.research_trasio@irq.a4lg.com/#24792587</a>
+             *   Additional details of the workaround on Linux kernel side:
+             *     <a class="moz-txt-link-freetext" href="https://lore.kernel.org/linux-riscv/ae93358e-e117-b43d-faad-772c529f846c@irq.a4lg.com/#t">https://lore.kernel.org/linux-riscv/ae93358e-e117-b43d-faad-772c529f846c@irq.a4lg.com/#t</a>
+             *
+             * No need to set the bit in riscv_isa as 's' &amp; 'u' are
+             * not valid ISA extensions. It works unless the first
+             * multi-letter extension in the ISA string begins with
+             * "Su" and is not prefixed with an underscore.
+             */
+            if ( ext[-1] != '_' &amp;&amp; ext[1] == 'u' )
+            {
+                ++isa;
+                ext_end = NULL;
+                break;
+            }
+            fallthrough;
+        case 'z':
+            /*
+             * Before attempting to parse the extension itself, we find its end.
+             * As multi-letter extensions must be split from other multi-letter
+             * extensions with an "_", the end of a multi-letter extension will
+             * either be the null character or the "_" at the start of the next
+             * multi-letter extension.
+             *
+             * Next, as the extensions version is currently ignored, we
+             * eliminate that portion. This is done by parsing backwards from
+             * the end of the extension, removing any numbers. This may be a
+             * major or minor number however, so the process is repeated if a
+             * minor number was found.
+             *
+             * ext_end is intended to represent the first character *after* the
+             * name portion of an extension, but will be decremented to the last
+             * character itself while eliminating the extensions version number.
+             * A simple re-increment solves this problem.
+             */
+            for ( ; *isa &amp;&amp; *isa != '_'; ++isa )
+                if ( unlikely(!isalnum(*isa)) )
+                    goto riscv_isa_parse_string_err;
+
+            ext_end = isa;
+
+            if ( !isdigit(ext_end[-1]) )
+                break;
+
+            while ( isdigit(*--ext_end) )
+                ;
+
+            if ( ext_end[0] != 'p' || !isdigit(ext_end[-1]) )
+            {
+                ++ext_end;
+                break;
+            }
+
+            while ( isdigit(*--ext_end) )
+                ;
+
+            ++ext_end;
+            break;
+
+        /*
+         * if someone mentioned `b` extension in riscv,isa instead of Zb{a,b,s}
+         * explicitly then set bits exlicitly in out_bitmap to satisfy
+         * requirement of Zbb (mentioned in required_extensions[]).
+         */
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Nit (style): Comments want to start with a captial letter.

With the two nits addressed and the Zba/Zbs question sorted (all
adjustments could be done while committing, albeit the disposition of
patch 1 isn't clear yet, so a v7 may be needed anyway):
Acked-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a></pre>
    </blockquote>
    <pre>I will send new patch series anyway, I can fix the comments there.

Thanks.

~ Oleksii
</pre>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:51a514cc-3247-4c0d-bc16-821c251c416d@suse.com">
      <pre wrap="" class="moz-quote-pre">

Jan
</pre>
    </blockquote>
  </body>
</html>

--------------E3y0PXV0utXt7CW2dWCKKwuG--

