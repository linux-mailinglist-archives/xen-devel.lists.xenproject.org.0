Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B0DA71F8F
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 20:50:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928232.1330983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txWkr-0005CD-Qc; Wed, 26 Mar 2025 19:49:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928232.1330983; Wed, 26 Mar 2025 19:49:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txWkr-00059i-NW; Wed, 26 Mar 2025 19:49:37 +0000
Received: by outflank-mailman (input) for mailman id 928232;
 Wed, 26 Mar 2025 19:49:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+Jq=WN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1txWkq-00059a-EM
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 19:49:36 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 710c1b1c-0a7b-11f0-9ffa-bf95429c2676;
 Wed, 26 Mar 2025 20:49:34 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5e5e0caa151so371762a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 12:49:34 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ebccf84600sm9895855a12.19.2025.03.26.12.49.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 12:49:33 -0700 (PDT)
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
X-Inumbo-ID: 710c1b1c-0a7b-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743018574; x=1743623374; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FKlyMe5NmwlIerDlrSZYIk6XVWD21J6zqo0x6V8By9s=;
        b=I1F5Hnz08Ogy5M6YH/7Bx5SrS5tYujhLtTCqmiO2YSJ6gVjqP0CxDKFJXEp3UcAL2o
         4OhZIyKRErOsfAyndYHDYpWvLM6wacxGqe3xs7qKmTegx2YB/7Euiyu+J71rv/OzyZY2
         TxtO9LPziLo+wSxtqEpzyo3q7/xOCcG3HvEG2gR3LzpJ5CHfOpjvC0WeDO6Lki0/d78N
         gwGMxUOfOoFC9/gG9Vrfl75R6hfePVbV+h9tBaWf3y4X5QRh8zEiF+gofiud6mfzYNca
         WcoTTzqVyIDbrIeEYYteTIh6Dk0t96aZeOgGds4Kn9J3Af0XE9aIIeMa6sBJbxXL97vk
         W6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743018574; x=1743623374;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FKlyMe5NmwlIerDlrSZYIk6XVWD21J6zqo0x6V8By9s=;
        b=hiPIMgdytpIDPyU/N9mpbSLRqQVa0HXciXLh4v3sJ1PX568t9PzjRLW5zm7kaq/uuM
         b8A1koY2LlfaltL2DaIWTgxQ5CdaE5eEnR4mLUytzymzHaMn7cMeYO0RvETnPMh4oAJu
         EeJLJ8YTN9/OFsebTzJW/XN38EvGFODV2WScORAalRwV1Q80cVDkgUapNVwFoa9kQl2G
         0epYrzZhXi8ezax1OQ7EggbpX/P/XmrYJSy7R5O827P1i7LI/HCgEWP/xEBCdJ0prtmN
         nyK4w8o9rpxwYvfGtrXpVpeQ34tqUXdQEuvz0HiMF7uq3iQWMgH7cB9BhJ4GAJteIgqs
         NV1w==
X-Forwarded-Encrypted: i=1; AJvYcCUZS7u7LIy4r6CWRxXcpUX/DKOMkNg0u8dkCBuZffHw4t0dWiDNUzUFH5qlkIQ8AznXjuyv/CD9xPg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyngVqZ8Nz/GB1ELgoeLh/sUERtaW1dSxbhdhcRKjNRoH8Mvhc5
	sYqM3J8uFwsCycbUmSYVxcAz9KzBsE9F2Uovglf97i/MdFv+XNgF
X-Gm-Gg: ASbGncsQRVYZ29SLKbFG59e9QpuqfgmBHLPoQW/jl4xtm/5oHkDroQYykjwd8ZW6DWQ
	zUTttnhXBKi5KjE4xLydpuDb69bxmjvpbongsZYp3H0bmmtRUa+oexI/tc8jxaaWf4dDL9xbfsJ
	AhOLBhuLlq9a3MJnbUh9PhXWdNIpv4Xy2+4/U/IXj4ftAreRCRyTa8VWse+l0n1xvQl045KwBjH
	nmNGG7yrad8UXMUEpLv7LDh1ce/BWUUL3IvPeNJ5cSxknXcOaIvXjcf0zu87e3DTvGQaSN3uEHY
	LRqRBzD8tAeGc0sncjzgsVU0dA5cqUZJBG8whastNIQTDl+gqPzQ1kxQ8jRMj/zGAN0SUM3i2kV
	nRWU+sIWXNKf4b+V30JGq
X-Google-Smtp-Source: AGHT+IFTuRSW0NkmVbVpKr9+fvMG59P7oKelrXy458/mQp069sIYHQ1Xql+JCIBQHqUTt1oNu2O8OA==
X-Received: by 2002:a05:6402:42c2:b0:5ec:c982:7efe with SMTP id 4fb4d7f45d1cf-5ed8e59ddbamr865040a12.14.1743018573448;
        Wed, 26 Mar 2025 12:49:33 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------L5vjZPFKi1omyaQgWb35deWR"
Message-ID: <cb66e1e4-7ac4-4a98-9bdb-b92e6c069f0a@gmail.com>
Date: Wed, 26 Mar 2025 20:49:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] xen/riscv: introduce preinit_xen_time()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <1a04711f46a1c0a7cdf709abc37f143747215495.1742918184.git.oleksii.kurochko@gmail.com>
 <86c067f2-87ff-4e75-b94a-9d760fc730e5@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <86c067f2-87ff-4e75-b94a-9d760fc730e5@suse.com>

This is a multi-part message in MIME format.
--------------L5vjZPFKi1omyaQgWb35deWR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/26/25 4:13 PM, Jan Beulich wrote:
> On 25.03.2025 18:36, Oleksii Kurochko wrote:
>> preinit_xen_time() does two things:
>> 1. Parse timebase-frequency properpy of /cpus node to initialize
>>     cpu_khz variable.
>> 2. Initialize xen_start_clock_cycles with the current time counter
>>     value.
>>
>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>> ---
>> Changes in v2:
>>   - Update SPDX tag for time.c
>>   - s/read_mostly/__ro_after_init for boot_count variable.
>>   - Add declaration of boot_count to asm/time.h.
>>   - Rename boot_count to xen_start_clock_cycles.
> I'm not going to insist on another name change, but I'm having a hard time
> seeing why almost any global variable in Xen would need to have a xen_
> prefix. "start" also can be ambiguous, so imo boot_clock_cycles would have
> been best.

I can change that during the work on the version of this patch.

>
>> --- /dev/null
>> +++ b/xen/arch/riscv/time.c
>> @@ -0,0 +1,39 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +#include <xen/device_tree.h>
>> +#include <xen/init.h>
>> +#include <xen/lib.h>
>> +#include <xen/sections.h>
>> +
>> +unsigned long __ro_after_init cpu_khz; /* CPU clock frequency in kHz. */
>> +unsigned long __ro_after_init xen_start_clock_cycles;
> For the theoretical at this point case of support RV32, will unsigned long
> be wide enough? I.e. is the counter only 32 bits wide when XLEN=32?

No, it will be really an issue and the type should be uint64_t for this variable
because on RV32I the timeh CSR is a read-only shadow of the upper 32 bits of the
memory-mapped mtime register, while time shadows only the lower 32 bits of mtime.
So on RV32 it is still 64-bit long and requires two reads to get cycle value.

>
>> +static __initdata struct dt_device_node *timer;
> Please can __initdata (and alike) live at its canonical place, between
> type and identifier?
>
> It's also unclear at this point why this needs to be a file scope variable.

Because this variable is used and will be used only in preinit_dt_xen_time().
But I think we could move the declaration of this variable to preinit_dt_xen_time()
as it is used only during preinit_dt_xen_time().

>
>> +/* Set up the timer on the boot CPU (early init function) */
>> +static void __init preinit_dt_xen_time(void)
>> +{
>> +    static const struct dt_device_match __initconstrel timer_ids[] =
>> +    {
>> +        DT_MATCH_PATH("/cpus"),
>> +        { /* sentinel */ },
>> +    };
>> +    uint32_t rate;
>> +
>> +    timer = dt_find_matching_node(NULL, timer_ids);
>> +    if ( !timer )
>> +        panic("Unable to find a compatible timer in the device tree\n");
>> +
>> +    dt_device_set_used_by(timer, DOMID_XEN);
>> +
>> +    if ( !dt_property_read_u32(timer, "timebase-frequency", &rate) )
>> +        panic("Unable to find clock frequency\n");
>> +
>> +    cpu_khz = rate / 1000;
> "rate" being only 32 bits wide, what about clock rates above 4GHz? Or is
> this some external clock running at a much lower rate than the CPU would?

It is the frequency of the hardware timer that drives the 
|mtime|register, it defines the frequency (in Hz) at which the timer 
increments.


>
>> +}
>> +
>> +void __init preinit_xen_time(void)
>> +{
>> +    preinit_dt_xen_time();
>> +
>> +    xen_start_clock_cycles = get_cycles();
>> +}
> I take it that more stuff is going to be added to this function? Else I
> wouldn't see why preinit_dt_xen_time() needed to be a separate function.

Actually, I checked my latest downstream branch and I haven't added nothing
extra to this function.
Only one thing that I want to add is ACPI case:
     if ( acpi_disabled )
         preinit_dt_xen_time();
     else
         panic("TBD\n"); /* preinit_acpi_xen_time(); */

~ Oleksii

--------------L5vjZPFKi1omyaQgWb35deWR
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
    <div class="moz-cite-prefix">On 3/26/25 4:13 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:86c067f2-87ff-4e75-b94a-9d760fc730e5@suse.com">
      <pre wrap="" class="moz-quote-pre">On 25.03.2025 18:36, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">preinit_xen_time() does two things:
1. Parse timebase-frequency properpy of /cpus node to initialize
   cpu_khz variable.
2. Initialize xen_start_clock_cycles with the current time counter
   value.

Signed-off-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
---
Changes in v2:
 - Update SPDX tag for time.c
 - s/read_mostly/__ro_after_init for boot_count variable.
 - Add declaration of boot_count to asm/time.h.
 - Rename boot_count to xen_start_clock_cycles.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I'm not going to insist on another name change, but I'm having a hard time
seeing why almost any global variable in Xen would need to have a xen_
prefix. "start" also can be ambiguous, so imo boot_clock_cycles would have
been best.</pre>
    </blockquote>
    <pre>I can change that during the work on the version of this patch.

</pre>
    <blockquote type="cite"
      cite="mid:86c067f2-87ff-4e75-b94a-9d760fc730e5@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- /dev/null
+++ b/xen/arch/riscv/time.c
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#include &lt;xen/device_tree.h&gt;
+#include &lt;xen/init.h&gt;
+#include &lt;xen/lib.h&gt;
+#include &lt;xen/sections.h&gt;
+
+unsigned long __ro_after_init cpu_khz; /* CPU clock frequency in kHz. */
+unsigned long __ro_after_init xen_start_clock_cycles;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
For the theoretical at this point case of support RV32, will unsigned long
be wide enough? I.e. is the counter only 32 bits wide when XLEN=32?</pre>
    </blockquote>
    <pre>No, it will be really an issue and the type should be uint64_t for this variable
because on RV32I the timeh CSR is a read-only shadow of the upper 32 bits of the
memory-mapped mtime register, while time shadows only the lower 32 bits of mtime.
So on RV32 it is still 64-bit long and requires two reads to get cycle value.</pre>
    <blockquote type="cite"
      cite="mid:86c067f2-87ff-4e75-b94a-9d760fc730e5@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+static __initdata struct dt_device_node *timer;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Please can __initdata (and alike) live at its canonical place, between
type and identifier?

It's also unclear at this point why this needs to be a file scope variable.</pre>
    </blockquote>
    <pre>Because this variable is used and will be used only in preinit_dt_xen_time().
But I think we could move the declaration of this variable to preinit_dt_xen_time()
as it is used only during preinit_dt_xen_time().

</pre>
    <blockquote type="cite"
      cite="mid:86c067f2-87ff-4e75-b94a-9d760fc730e5@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+/* Set up the timer on the boot CPU (early init function) */
+static void __init preinit_dt_xen_time(void)
+{
+    static const struct dt_device_match __initconstrel timer_ids[] =
+    {
+        DT_MATCH_PATH("/cpus"),
+        { /* sentinel */ },
+    };
+    uint32_t rate;
+
+    timer = dt_find_matching_node(NULL, timer_ids);
+    if ( !timer )
+        panic("Unable to find a compatible timer in the device tree\n");
+
+    dt_device_set_used_by(timer, DOMID_XEN);
+
+    if ( !dt_property_read_u32(timer, "timebase-frequency", &amp;rate) )
+        panic("Unable to find clock frequency\n");
+
+    cpu_khz = rate / 1000;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
"rate" being only 32 bits wide, what about clock rates above 4GHz? Or is
this some external clock running at a much lower rate than the CPU would?</pre>
    </blockquote>
    <pre><span data-teams="true"><span style="font-size: inherit;">It is the frequency of the hardware timer that drives the </span><code>mtime</code><span
    style="font-size: inherit;"> register,
it defines the frequency (in Hz) at which the timer increments.
</span></span></pre>
    <br>
    <blockquote type="cite"
      cite="mid:86c067f2-87ff-4e75-b94a-9d760fc730e5@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+}
+
+void __init preinit_xen_time(void)
+{
+    preinit_dt_xen_time();
+
+    xen_start_clock_cycles = get_cycles();
+}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I take it that more stuff is going to be added to this function? Else I
wouldn't see why preinit_dt_xen_time() needed to be a separate function.</pre>
    </blockquote>
    <pre>Actually, I checked my latest downstream branch and I haven't added nothing
extra to this function.
Only one thing that I want to add is ACPI case:
    if ( acpi_disabled )
        preinit_dt_xen_time();
    else
        panic("TBD\n"); /* preinit_acpi_xen_time(); */

~ Oleksii

</pre>
  </body>
</html>

--------------L5vjZPFKi1omyaQgWb35deWR--

