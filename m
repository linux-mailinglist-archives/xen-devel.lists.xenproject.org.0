Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF6EA307B4
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 10:54:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885256.1295044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thmxn-0005O3-Hb; Tue, 11 Feb 2025 09:53:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885256.1295044; Tue, 11 Feb 2025 09:53:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thmxn-0005Lu-EQ; Tue, 11 Feb 2025 09:53:55 +0000
Received: by outflank-mailman (input) for mailman id 885256;
 Tue, 11 Feb 2025 09:53:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GN4I=VC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1thmxl-0005Lo-KU
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 09:53:53 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1922b000-e85e-11ef-a075-877d107080fb;
 Tue, 11 Feb 2025 10:53:51 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5439a6179a7so5678590e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2025 01:53:51 -0800 (PST)
Received: from [192.168.209.66] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-308e5775081sm8376121fa.49.2025.02.11.01.53.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2025 01:53:50 -0800 (PST)
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
X-Inumbo-ID: 1922b000-e85e-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739267631; x=1739872431; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XOVihnNonXR35iRLA9T0X3Ybwj/yKr96TYhgTpB3Tmg=;
        b=eGZuoBP3fqEEhofkYkWi9hbPg93AQ2/ciy54/O4/9vs8A/muMz8iwn65aaINXFDZ8n
         mkURSJPI4pumVFIvDy1D3Y4FaTuJdVJqQQqmm+qwwliG/TXR9FFU47qzHjqfUZhu4xoW
         h0Q3MDmvqerH8fCMwQqBSIuLnzGzfDv8ST/XWnHcJpJcoVh7641SYPkO4yb1HfrypCp8
         gF71mb2nHaf8G1xrb6JQG8u5kFp8wsyVZO4Amk+apOLS2fk0SDuDLAoucsmwKYbHsOeC
         2qK+TssZMWUyB3+o9MPQvfxEWWMt7nLhadTIjiyhbxogypWjKXjY+cb9Vu093MjNqlK8
         f3Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739267631; x=1739872431;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XOVihnNonXR35iRLA9T0X3Ybwj/yKr96TYhgTpB3Tmg=;
        b=PTWG+4WXTz+qhkq1ek90nYmStk91n4X78cDrSkgkBM0ZOadjBo/w3JwJHGP7pYVEPa
         g+13mgpsIbUVgdblfooOw7ja/94zCZJUTEpQR3fg+vYkIALPBlOaeytGpCdbSLEAnV2x
         ok89PH7FD10Get0M9+2c+vLegeHslbgzvVvx8VJ7eTYNAPo/5oF43Tgp4V9KH+W5CPpp
         siGhx6yMboWMvQ634bb+C1ML9A+RMdgAZHVa8RVnIxc9v33LP8yJL6SVRcnIZOcnZePO
         mPWne6VUgb9/PmeEB/ARaFiDaZH+9jsDaZ3gKFcEOG6vhXbB9JJYmDLHB9TrwAm0GTV9
         eIbw==
X-Forwarded-Encrypted: i=1; AJvYcCVWFdWbs7iP9V9/8kENQTjyEd8UtWzuBQBSYrlUsptIWnHunUYEhnR6pizDtv6P7SM0XdhDPLHItMI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy40TY1LkrZj5GGT+w4jBQuMZQbDbM7bfsIceYAngfFqOMct7+t
	JJGkAli2oPNOjZxqQbwomCxUdm6oPc1FZ7TIV2Ua49PYnE9WMtE7
X-Gm-Gg: ASbGnctCFbPSIgScDx99FMGi6OZpr6JQAwM7Jg3p/5zRVxzsmAGTIjVv5V9ak8XQVB1
	HuE6MWXx8ANnPZMydp8DSdmZoXWcVV19KyA0lDgiBbjNGc2HJ8Ytz9cH4anNN1zQ++lwUVBVomw
	OMQzDkctq/7l8NRxtySFfdBMzjzsr1Mvplh4TWitCspGk2CmZnS1G8fHfusA27q8SKHedj9uzJ3
	1TnLEKDNTJU94w8JkA1RT0w6gd+ptX24hwp4ukZNAg+0XMhkTJG44Uv0OcLEcIhyB7pHWJqEUXo
	aVGxc/xfoX7AoJ2AG1A6RMjhn7Y=
X-Google-Smtp-Source: AGHT+IEEBIlH1zSL/ZmGmemv0Ih77bGNkDeq6CKE+VI660qrIrMJgBqiWrSMlYkcZJPqqot7IlM18A==
X-Received: by 2002:a05:6512:3984:b0:544:e:cfea with SMTP id 2adb3069b0e04-54511c196f9mr608611e87.6.1739267630909;
        Tue, 11 Feb 2025 01:53:50 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------GtpJZYXlDeYl8n0JafPXRXKN"
Message-ID: <279e70a8-ad09-46bc-a1f9-7aa6707d3974@gmail.com>
Date: Tue, 11 Feb 2025 10:53:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.21 v5] xen/riscv: identify specific ISA supported by
 cpu
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <39eacdb6312988fb746e3dff7e29db2f9fcef614.1738958635.git.oleksii.kurochko@gmail.com>
 <18030e36-ac28-42e0-9bcb-2457c0281273@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <18030e36-ac28-42e0-9bcb-2457c0281273@suse.com>

This is a multi-part message in MIME format.
--------------GtpJZYXlDeYl8n0JafPXRXKN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/10/25 5:19 PM, Jan Beulich wrote:
> On 07.02.2025 21:07, Oleksii Kurochko wrote:
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
>> +    RISCV_ISA_EXT_DATA(c, RISCV_ISA_EXT_c),
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
>> +
>> +static const struct riscv_isa_ext_data __initconst required_extensions[] = {
>> +    RISCV_ISA_EXT_DATA(i, RISCV_ISA_EXT_i),
>> +    RISCV_ISA_EXT_DATA(m, RISCV_ISA_EXT_m),
>> +    RISCV_ISA_EXT_DATA(a, RISCV_ISA_EXT_a),
>> +    RISCV_ISA_EXT_DATA(f, RISCV_ISA_EXT_f),
>> +    RISCV_ISA_EXT_DATA(d, RISCV_ISA_EXT_d),
> Why would these last four (Zifencei below) not be included in #ifdef
> CONFIG_RISCV_ISA_RV64G, just like ...
>
>> +#ifdef CONFIG_RISCV_ISA_C
>> +    RISCV_ISA_EXT_DATA(c, RISCV_ISA_EXT_c),
>> +#endif
> .. this one is?

I'm not sure if it was the best decision, but I did it this way because
I believe other bitnesses (32, 128) will also need G. So, I left them
without|#ifdef| to avoid adding|#ifdef CONFIG_RV{32,128}G| in the future.

I also spent some time considering whether 'f' and 'd' are necessary
for Xen. In the end, I decided that if they aren't needed for Xen,
it might be better not to use "G" for compilation and instead explicitly
specify "ima". But it will be better to do as a separate patch (if it
makes sense).

>
>> +    RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
>> +    RISCV_ISA_EXT_DATA(zifencei, RISCV_ISA_EXT_ZIFENCEI),
>> +    RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
>> +    RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
>> +};
> Despite earlier answers to the same question, looking at just what the
> patch adds I still can't conclude how a system offering the B extension
> (under that name) will satisfy our requirement of Zbb. It's okay if you
> don't want to make adjustments to the code for now, but this at the very
> least wants clarifying in the patch description. Better would be by way
> of a code comment here.

I think that it will be better then just do the following:
   --- a/xen/arch/riscv/cpufeature.c
   +++ b/xen/arch/riscv/cpufeature.c
   @@ -171,6 +171,14 @@ static void __init match_isa_ext(const char *name, const char *name_end,
    {
        const size_t riscv_isa_ext_count = ARRAY_SIZE(riscv_isa_ext);
  
   +    if ( *name == 'b' )
   +    {
   +        __set_bit(RISCV_ISA_EXT_ZBA, bitmap);
   +        __set_bit(RISCV_ISA_EXT_ZBB, bitmap);
   +        __set_bit(RISCV_ISA_EXT_ZBS, bitmap);
   +        return;
   +    }
   +
        for ( unsigned int i = 0; i < riscv_isa_ext_count; i++ )

>> --- /dev/null
>> +++ b/xen/arch/riscv/include/asm/cpufeature.h
>> @@ -0,0 +1,57 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +#ifndef ASM__RISCV__CPUFEATURE_H
>> +#define ASM__RISCV__CPUFEATURE_H
>> +
>> +#ifndef __ASSEMBLY__
>> +
>> +#include <xen/stdbool.h>
>> +
>> +/*
>> + * These macros represent the logical IDs of each multi-letter RISC-V ISA
>> + * extension and are used in the ISA bitmap. The logical IDs start from
>> + * RISCV_ISA_EXT_BASE, which allows the 0-25 range to be reserved for single
>> + * letter extensions and are used in enum riscv_isa_ext_id.
>> + *
>> + * New extensions should just be added to the bottom, rather than added
>> + * alphabetically, in order to avoid unnecessary shuffling.
>> + */
>> +#define RISCV_ISA_EXT_BASE  26
>> +
>> +enum riscv_isa_ext_id {
>> +    RISCV_ISA_EXT_a,
>> +    RISCV_ISA_EXT_c,
>> +    RISCV_ISA_EXT_d,
>> +    RISCV_ISA_EXT_f,
>> +    RISCV_ISA_EXT_h,
>> +    RISCV_ISA_EXT_i,
>> +    RISCV_ISA_EXT_m,
>> +    RISCV_ISA_EXT_q,
>> +    RISCV_ISA_EXT_v,
> I'm sorry to be picky, but: If you use lower case letters here, why would
> ...
>
>> +    RISCV_ISA_EXT_ZICNTR = RISCV_ISA_EXT_BASE,
> ... e.g. this not be RISCV_ISA_EXT_Zicntr or RISCV_ISA_EXT_zicntr? In the
> latter case this could even be leveraged to simplify populating of the two
> arrays (RISCV_ISA_EXT_DATA() could then get away with just a single
> parameter).

It makes sense. I will use the lower case and update the macro RISCV_ISA_EXT_DATA().

Thanks.

~ Oleksii

--------------GtpJZYXlDeYl8n0JafPXRXKN
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
    <div class="moz-cite-prefix">On 2/10/25 5:19 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:18030e36-ac28-42e0-9bcb-2457c0281273@suse.com">
      <pre wrap="" class="moz-quote-pre">On 07.02.2025 21:07, Oleksii Kurochko wrote:
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
+    RISCV_ISA_EXT_DATA(i, RISCV_ISA_EXT_i),
+    RISCV_ISA_EXT_DATA(m, RISCV_ISA_EXT_m),
+    RISCV_ISA_EXT_DATA(a, RISCV_ISA_EXT_a),
+    RISCV_ISA_EXT_DATA(f, RISCV_ISA_EXT_f),
+    RISCV_ISA_EXT_DATA(d, RISCV_ISA_EXT_d),
+    RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_q),
+    RISCV_ISA_EXT_DATA(c, RISCV_ISA_EXT_c),
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
+
+static const struct riscv_isa_ext_data __initconst required_extensions[] = {
+    RISCV_ISA_EXT_DATA(i, RISCV_ISA_EXT_i),
+    RISCV_ISA_EXT_DATA(m, RISCV_ISA_EXT_m),
+    RISCV_ISA_EXT_DATA(a, RISCV_ISA_EXT_a),
+    RISCV_ISA_EXT_DATA(f, RISCV_ISA_EXT_f),
+    RISCV_ISA_EXT_DATA(d, RISCV_ISA_EXT_d),
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Why would these last four (Zifencei below) not be included in #ifdef
CONFIG_RISCV_ISA_RV64G, just like ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+#ifdef CONFIG_RISCV_ISA_C
+    RISCV_ISA_EXT_DATA(c, RISCV_ISA_EXT_c),
+#endif
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
.. this one is?</pre>
    </blockquote>
    <pre data-start="0" data-end="219">I'm not sure if it was the best decision, but I did it this way because
I believe other bitnesses (32, 128) will also need G. So, I left them
without <code data-start="150" data-end="158">#ifdef</code> to avoid adding <code
    data-start="175" data-end="202">#ifdef CONFIG_RV{32,128}G</code> in the future.</pre>
    <pre data-start="221" data-end="451" data-is-last-node="">I also spent some time considering whether 'f' and 'd' are necessary
for Xen. In the end, I decided that if they aren't needed for Xen,
it might be better not to use "G" for compilation and instead explicitly
specify "ima". But it will be better to do as a separate patch (if it
makes sense).
</pre>
    <pre></pre>
    <blockquote type="cite"
      cite="mid:18030e36-ac28-42e0-9bcb-2457c0281273@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
+    RISCV_ISA_EXT_DATA(zifencei, RISCV_ISA_EXT_ZIFENCEI),
+    RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
+    RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
+};
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Despite earlier answers to the same question, looking at just what the
patch adds I still can't conclude how a system offering the B extension
(under that name) will satisfy our requirement of Zbb. It's okay if you
don't want to make adjustments to the code for now, but this at the very
least wants clarifying in the patch description. Better would be by way
of a code comment here.</pre>
    </blockquote>
    <pre>I think that it will be better then just do the following:
  --- a/xen/arch/riscv/cpufeature.c
  +++ b/xen/arch/riscv/cpufeature.c
  @@ -171,6 +171,14 @@ static void __init match_isa_ext(const char *name, const char *name_end,
   {
       const size_t riscv_isa_ext_count = ARRAY_SIZE(riscv_isa_ext);
 
  +    if ( *name == 'b' )
  +    {
  +        __set_bit(RISCV_ISA_EXT_ZBA, bitmap);
  +        __set_bit(RISCV_ISA_EXT_ZBB, bitmap);
  +        __set_bit(RISCV_ISA_EXT_ZBS, bitmap);
  +        return;
  +    }
  +
       for ( unsigned int i = 0; i &lt; riscv_isa_ext_count; i++ )

</pre>
    <blockquote type="cite"
      cite="mid:18030e36-ac28-42e0-9bcb-2457c0281273@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- /dev/null
+++ b/xen/arch/riscv/include/asm/cpufeature.h
@@ -0,0 +1,57 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef ASM__RISCV__CPUFEATURE_H
+#define ASM__RISCV__CPUFEATURE_H
+
+#ifndef __ASSEMBLY__
+
+#include &lt;xen/stdbool.h&gt;
+
+/*
+ * These macros represent the logical IDs of each multi-letter RISC-V ISA
+ * extension and are used in the ISA bitmap. The logical IDs start from
+ * RISCV_ISA_EXT_BASE, which allows the 0-25 range to be reserved for single
+ * letter extensions and are used in enum riscv_isa_ext_id.
+ *
+ * New extensions should just be added to the bottom, rather than added
+ * alphabetically, in order to avoid unnecessary shuffling.
+ */
+#define RISCV_ISA_EXT_BASE  26
+
+enum riscv_isa_ext_id {
+    RISCV_ISA_EXT_a,
+    RISCV_ISA_EXT_c,
+    RISCV_ISA_EXT_d,
+    RISCV_ISA_EXT_f,
+    RISCV_ISA_EXT_h,
+    RISCV_ISA_EXT_i,
+    RISCV_ISA_EXT_m,
+    RISCV_ISA_EXT_q,
+    RISCV_ISA_EXT_v,
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I'm sorry to be picky, but: If you use lower case letters here, why would
...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    RISCV_ISA_EXT_ZICNTR = RISCV_ISA_EXT_BASE,
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... e.g. this not be RISCV_ISA_EXT_Zicntr or RISCV_ISA_EXT_zicntr? In the
latter case this could even be leveraged to simplify populating of the two
arrays (RISCV_ISA_EXT_DATA() could then get away with just a single
parameter).</pre>
    </blockquote>
    <pre>It makes sense. I will use the lower case and update the macro RISCV_ISA_EXT_DATA().

Thanks.

~ Oleksii
</pre>
  </body>
</html>

--------------GtpJZYXlDeYl8n0JafPXRXKN--

