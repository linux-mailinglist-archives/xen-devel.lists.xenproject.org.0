Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B592A25DDA
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2025 16:05:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880680.1290760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tey0o-0005TD-21; Mon, 03 Feb 2025 15:05:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880680.1290760; Mon, 03 Feb 2025 15:05:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tey0n-0005RN-VT; Mon, 03 Feb 2025 15:05:21 +0000
Received: by outflank-mailman (input) for mailman id 880680;
 Mon, 03 Feb 2025 15:05:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o2EM=U2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tey0m-0005R1-QN
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2025 15:05:20 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47931850-e240-11ef-99a4-01e77a169b0f;
 Mon, 03 Feb 2025 16:05:18 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-38634c35129so3547003f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2025 07:05:18 -0800 (PST)
Received: from [192.168.100.192] (lfbn-gre-1-190-108.w90-112.abo.wanadoo.fr.
 [90.112.153.108]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e23dea58sm156161205e9.15.2025.02.03.07.05.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 07:05:16 -0800 (PST)
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
X-Inumbo-ID: 47931850-e240-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738595117; x=1739199917; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wZB8elgAsx5qYVX0a5ekwI5Rxz7SfhCXFoK5e253VZo=;
        b=QI8I6Q8KtYq/1xW/3WWcggcWBww1fOFQNDTdvN3kscI+bwKL3YVFZuaHsOH2e7RCjX
         uEeqoU/HIvy13EIN5dK8wDrZPf4FcFHCA8AQAYe4HXr+Cv+hXKprBVvCQZjenof7f13I
         R0CfCwercTyTUDxU/+VnG0aGmD5NSsDv094cPt/q8n/6A1i/9D5quCZK/paP+VUmGY+Y
         0eFqoqR2eSAkhSY4kFfNvAU0cDqGkBWrANJI/BHxj7SVokmVZlaow4AmBB44yithmYmz
         uH9vZgrbby8f/got3xmZYV/KUybReFSqpOm9/+TinA5b6zkV5YmNHCrxggiRKHVOo4sj
         Q9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738595117; x=1739199917;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wZB8elgAsx5qYVX0a5ekwI5Rxz7SfhCXFoK5e253VZo=;
        b=Dv51k/UXmQ0vZQD6qi8q4FBDKgMN/A7g9NtJtZ8ZiUeZ9s1E5Bq2DLOLr4YIeNpwP+
         6NiZC2Pyn94wk8yIdzPC9wODpBgfghRZO3e6HRNCYB5UMWol1Dvau27rFq/s5bpTHt/u
         Q2XCYa2dILay25cLObUY6i4gDzGb0QH4SV4r81y3/PcTeoqAW3BqNoKIWHVcXy6a8nu5
         6Fx9IwAPIG1uFzP/mQD6wuksjgl12LGrGQbVpQ5MxJEhCbYhhYfV0GGQisZddN87s7dI
         bgxft5NPXMvS/Gd7YS8whBRKP6hEd/gvDM0VF35qxMxDiOjJJMaUKligp3LDqga3Q8KH
         4Htw==
X-Forwarded-Encrypted: i=1; AJvYcCVMnpSdV5QMC4T6+Mq9Evhod/8YyH6r7pQpbRKe5ZrkVYb+Wh2IKkuXiFPgbX1xI5nCyz8HsOn3eHo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwhrLHfsOL7GwWAXt0z7xydOCIL+0y0XeCdMTxJZaGJdy77FUiH
	3eSyzcZwGoBOYK+MGY4D1w8jvcz1vofq4oXB0YbS/Zg0BOV+exL0
X-Gm-Gg: ASbGncsyFjM6kyMaCpWPrdbvP9jDk/Ra5wM2Doivu+x+kU3Mpu3rvUhBTp3kq/t5A/j
	RFZSm+qBqQyYZQt+73Q5Of6gehpopLn0syIhrxmp5iwDPhXdF//an+cMgJFi0PZz5bbm5qpeYfn
	2TnxdH6A9y93plovAsPG5Hh2JCL0Q+H8pRPbwtKFwl40S04rrrWwbGn5OtbopCNJ8grn0sK73Tu
	MOb5irOYP8WpR5lHeG2H4m8aJ0jVZJUaT7hPCFoaCVK6mOjh+8v3al8qrRPvjDxC+9wOQLSUMnd
	LolyR8rrcWlInP+tKaQikbPN3c7fuRauQItnnkHkBca5JerRTtaqApfLf5eKW11Fu/EDf4YfIkN
	Cnho=
X-Google-Smtp-Source: AGHT+IGwwCHDBxKjsWgHihoKCU4cU+KRjs1YjyBy1qp6Vp7Oang8bLd44njc4llAcCI2iZ+iMtVEBQ==
X-Received: by 2002:a5d:64a1:0:b0:38a:88bc:bae4 with SMTP id ffacd0b85a97d-38c519697d5mr16769591f8f.18.1738595116824;
        Mon, 03 Feb 2025 07:05:16 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------3jDQBQtwbR1iU4Cte7vkTc9p"
Message-ID: <4ee4c8c8-b392-4c0a-8173-624d661409f4@gmail.com>
Date: Mon, 3 Feb 2025 16:05:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/riscv: identify specific ISA supported by cpu
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <ddf678bb829003b2c4a0a85166a29b61e75bcea9.1737643226.git.oleksii.kurochko@gmail.com>
 <e51b0425-568a-4a4b-b240-a5276a017a70@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <e51b0425-568a-4a4b-b240-a5276a017a70@suse.com>

This is a multi-part message in MIME format.
--------------3jDQBQtwbR1iU4Cte7vkTc9p
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/27/25 3:47 PM, Jan Beulich wrote:
>> +    *dt_cpuid = dt_read_paddr(prop, dt_n_addr_cells(cpu));
>> +
>> +    return 0;
>> +}
>> +
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
>> +    RISCV_ISA_EXT_DATA(i, RISCV_ISA_EXT_i),
>> +    RISCV_ISA_EXT_DATA(m, RISCV_ISA_EXT_m),
>> +    RISCV_ISA_EXT_DATA(a, RISCV_ISA_EXT_a),
>> +    RISCV_ISA_EXT_DATA(f, RISCV_ISA_EXT_f),
>> +    RISCV_ISA_EXT_DATA(d, RISCV_ISA_EXT_d),
>> +    RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_q),
>> +    RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
>> +    RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
>> +    RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
>> +    RISCV_ISA_EXT_DATA(zifencei, RISCV_ISA_EXT_ZIFENCEI),
>> +    RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
>> +    RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
>> +    RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
>> +    RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
>> +    RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
>> +};
> Just to clarify: There's no particular sorting intended for this table,
> while ...
>
>> +static const struct riscv_isa_ext_data __initconst required_extensions[] = {
>> +    RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
>> +    RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
>> +    RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
>> +};
> ... this one looks to mean to be alphabetically sorted?

I will sync the sorting between the tables and will use the rule 3 mentioned above where it
is mentioned how they should be ordered:
   + * 3. The first letter following the 'Z' conventionally indicates the most
   + *    closely related alphabetical extension category, IMAFDQLCBKJTPVH.
   + *    If multiple 'Z' extensions are named, they must be ordered first by
   + *    category, then alphabetically within a category.

Thereby final version will be:
   +    RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
   +    RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
   +    RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),

>
>> +static bool is_lowercase_extension_name(const char *str)
>> +{
>> +    /*
>> +     * `str` could contain full riscv,isa string from device tree so one
>> +     * of the stop condionitions is checking for '_' as extensions are
>> +     * separated by '_'.
>> +     */
>> +    for ( unsigned int i = 0; (str[i] != '\0') && (str[i] != '_'); i++ )
>> +        if ( !islower(str[i]) )
>> +            return false;
>> +
>> +    return true;
>> +}
>> +
>> +static void __init match_isa_ext(const char *name, const char *name_end,
>> +                                 unsigned long *bitmap)
>> +{
>> +    const size_t riscv_isa_ext_count = ARRAY_SIZE(riscv_isa_ext);
>> +
>> +    for ( unsigned int i = 0; i < riscv_isa_ext_count; i++ )
>> +    {
>> +        const struct riscv_isa_ext_data *ext = &riscv_isa_ext[i];
>> +
>> +        /*
>> +         * `name` (according to device tree binding) and
>> +         * `ext->name` (according to initialization of riscv_isa_ext[]
>> +         * elements) must be all in lowercase.
>> +         *
>> +         * Just to be sure that it is true, ASSERT() is added.
>> +         */
>> +        ASSERT(is_lowercase_extension_name(name) &&
>> +               is_lowercase_extension_name(ext->name));
> More general remark: While asserting on ext->name is okay, for it being
> our own data, asserting on data coming from the outside is generally not
> correct. For now I'm not going to insist on this being changed, but
> sooner or later it will want revisiting

IIUC it would be better to leave ASSERT(is_lowercase_extension_name(ext->name)) in match_isa_ext()
and put ASSERT(is_lowercase_extension_name(ext) in riscv_isa_parse_string() before match_isa_ext()
is called:
   static int __init riscv_isa_parse_string(const char *isa,
                                            unsigned long *out_bitmap)
   {
     ...
     while ( *isa )
     {
       const char *ext = isa++;
     ...
     ASSERT(is_lowercase_extension_name(ext));
     match_isa_ext(ext, ext_end, out_bitmap);
   }

Is my understanding correct?

>
>> +        if ( (name_end - name == strlen(ext->name)) &&
>> +             !strncmp(name, ext->name, name_end - name) )
>> +        {
>> +            __set_bit(ext->id, bitmap);
>> +            break;
>> +        }
>> +    }
>> +}
>> +
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
>> +    #error "unsupported RISC-V bitness"
> Nit: We generally like to have the # in the first column, and - if
> so desired - blank padding afterwards.

Should it be done only when "#if defined" used inside function or blank padding is needed only in
case when "#if defined" is used and, for example, for "#ifdef" such padding isn't needed?

>
>> +#endif
>> +
>> +    isa += 4;
>> +
>> +    while ( *isa )
>> +    {
>> +        const char *ext = isa++;
>> +        const char *ext_end = isa;
>> +        bool ext_err = false;
>> +
>> +        switch ( *ext )
>> +        {
>> +        case 'x':
>> +        case 'X':
>> +            printk_once("Vendor extensions are ignored in riscv,isa\n");
>> +            /*
>> +             * To skip an extension, we find its end.
>> +             * As multi-letter extensions must be split from other multi-letter
>> +             * extensions with an "_", the end of a multi-letter extension will
>> +             * either be the null character or the "_" at the start of the next
>> +             * multi-letter extension.
>> +             */
>> +            for ( ; *isa && *isa != '_'; ++isa )
>> +                ;
>> +            ext_err = true;
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
>> +                ext_err = true;
>> +                break;
>> +            }
>> +            fallthrough;
>> +        case 'S':
>> +        case 'z':
>> +        case 'Z':
> With match_isa_ext() insisting on ISA strings being all lowercase, what's
> the point of permitting 'S' and 'Z' here?

There is no need for this anymore; it was necessary before when the requirement didn't exist.
I will cleanup that.

Thanks.

~ Oleksii

--------------3jDQBQtwbR1iU4Cte7vkTc9p
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
    <div class="moz-cite-prefix">On 1/27/25 3:47 PM, Jan Beulich wrote:</div>
    <blockquote type="cite"
      cite="mid:e51b0425-568a-4a4b-b240-a5276a017a70@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    *dt_cpuid = dt_read_paddr(prop, dt_n_addr_cells(cpu));
+
+    return 0;
+}
+
+/*
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
+    RISCV_ISA_EXT_DATA(i, RISCV_ISA_EXT_i),
+    RISCV_ISA_EXT_DATA(m, RISCV_ISA_EXT_m),
+    RISCV_ISA_EXT_DATA(a, RISCV_ISA_EXT_a),
+    RISCV_ISA_EXT_DATA(f, RISCV_ISA_EXT_f),
+    RISCV_ISA_EXT_DATA(d, RISCV_ISA_EXT_d),
+    RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_q),
+    RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
+    RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
+    RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
+    RISCV_ISA_EXT_DATA(zifencei, RISCV_ISA_EXT_ZIFENCEI),
+    RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
+    RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
+    RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
+    RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
+    RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
+};
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Just to clarify: There's no particular sorting intended for this table,
while ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+static const struct riscv_isa_ext_data __initconst required_extensions[] = {
+    RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
+    RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
+    RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
+};
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... this one looks to mean to be alphabetically sorted?</pre>
    </blockquote>
    <pre>I will sync the sorting between the tables and will use the rule 3 mentioned above where it
is mentioned how they should be ordered:
  + * 3. The first letter following the 'Z' conventionally indicates the most
  + *    closely related alphabetical extension category, IMAFDQLCBKJTPVH.
  + *    If multiple 'Z' extensions are named, they must be ordered first by
  + *    category, then alphabetically within a category.

Thereby final version will be:
  +    RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
  +    RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
  +    RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
</pre>
    <blockquote type="cite"
      cite="mid:e51b0425-568a-4a4b-b240-a5276a017a70@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+static bool is_lowercase_extension_name(const char *str)
+{
+    /*
+     * `str` could contain full riscv,isa string from device tree so one
+     * of the stop condionitions is checking for '_' as extensions are
+     * separated by '_'.
+     */
+    for ( unsigned int i = 0; (str[i] != '\0') &amp;&amp; (str[i] != '_'); i++ )
+        if ( !islower(str[i]) )
+            return false;
+
+    return true;
+}
+
+static void __init match_isa_ext(const char *name, const char *name_end,
+                                 unsigned long *bitmap)
+{
+    const size_t riscv_isa_ext_count = ARRAY_SIZE(riscv_isa_ext);
+
+    for ( unsigned int i = 0; i &lt; riscv_isa_ext_count; i++ )
+    {
+        const struct riscv_isa_ext_data *ext = &amp;riscv_isa_ext[i];
+
+        /*
+         * `name` (according to device tree binding) and
+         * `ext-&gt;name` (according to initialization of riscv_isa_ext[]
+         * elements) must be all in lowercase.
+         *
+         * Just to be sure that it is true, ASSERT() is added.
+         */
+        ASSERT(is_lowercase_extension_name(name) &amp;&amp;
+               is_lowercase_extension_name(ext-&gt;name));
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
More general remark: While asserting on ext-&gt;name is okay, for it being
our own data, asserting on data coming from the outside is generally not
correct. For now I'm not going to insist on this being changed, but
sooner or later it will want revisiting</pre>
    </blockquote>
    <pre>IIUC it would be better to leave ASSERT(is_lowercase_extension_name(ext-&gt;name)) in match_isa_ext()
and put ASSERT(is_lowercase_extension_name(ext) in riscv_isa_parse_string() before match_isa_ext()
is called:
  static int __init riscv_isa_parse_string(const char *isa,
                                           unsigned long *out_bitmap)
  {
    ...
    while ( *isa )
    {
      const char *ext = isa++;
    ...
    ASSERT(is_lowercase_extension_name(ext));
    match_isa_ext(ext, ext_end, out_bitmap);
  }

Is my understanding correct?

</pre>
    <blockquote type="cite"
      cite="mid:e51b0425-568a-4a4b-b240-a5276a017a70@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+        if ( (name_end - name == strlen(ext-&gt;name)) &amp;&amp;
+             !strncmp(name, ext-&gt;name, name_end - name) )
+        {
+            __set_bit(ext-&gt;id, bitmap);
+            break;
+        }
+    }
+}
+
+static int __init riscv_isa_parse_string(const char *isa,
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
+    #error "unsupported RISC-V bitness"
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Nit: We generally like to have the # in the first column, and - if
so desired - blank padding afterwards.</pre>
    </blockquote>
    <pre>Should it be done only when "#if defined" used inside function or blank padding is needed only in
case when "#if defined" is used and, for example, for "#ifdef" such padding isn't needed?

</pre>
    <blockquote type="cite"
      cite="mid:e51b0425-568a-4a4b-b240-a5276a017a70@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+#endif
+
+    isa += 4;
+
+    while ( *isa )
+    {
+        const char *ext = isa++;
+        const char *ext_end = isa;
+        bool ext_err = false;
+
+        switch ( *ext )
+        {
+        case 'x':
+        case 'X':
+            printk_once("Vendor extensions are ignored in riscv,isa\n");
+            /*
+             * To skip an extension, we find its end.
+             * As multi-letter extensions must be split from other multi-letter
+             * extensions with an "_", the end of a multi-letter extension will
+             * either be the null character or the "_" at the start of the next
+             * multi-letter extension.
+             */
+            for ( ; *isa &amp;&amp; *isa != '_'; ++isa )
+                ;
+            ext_err = true;
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
+                ext_err = true;
+                break;
+            }
+            fallthrough;
+        case 'S':
+        case 'z':
+        case 'Z':
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
With match_isa_ext() insisting on ISA strings being all lowercase, what's
the point of permitting 'S' and 'Z' here?</pre>
    </blockquote>
    <pre>There is no need for this anymore; it was necessary before when the requirement didn't exist.
I will cleanup that.

Thanks.

~ Oleksii</pre>
  </body>
</html>

--------------3jDQBQtwbR1iU4Cte7vkTc9p--

