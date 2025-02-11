Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1334BA3120F
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 17:51:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885774.1295576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thtT0-0002Xv-PF; Tue, 11 Feb 2025 16:50:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885774.1295576; Tue, 11 Feb 2025 16:50:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thtT0-0002VS-Lo; Tue, 11 Feb 2025 16:50:34 +0000
Received: by outflank-mailman (input) for mailman id 885774;
 Tue, 11 Feb 2025 16:50:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GN4I=VC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1thtSy-0002VK-HH
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 16:50:32 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d44e5c9-e898-11ef-b3ef-695165c68f79;
 Tue, 11 Feb 2025 17:50:30 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5450cf3ef63so2399173e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2025 08:50:30 -0800 (PST)
Received: from [192.168.209.66] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5450c9434fcsm678601e87.223.2025.02.11.08.50.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2025 08:50:28 -0800 (PST)
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
X-Inumbo-ID: 4d44e5c9-e898-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739292629; x=1739897429; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mraFYGdjZ3p+xsoVweFVFWZWsbvtMfk7Gt8ykva4+x4=;
        b=Yfddm4ScPAp52VLeoA3jGKHdDsAO2SyBqH0rzLiJJW/ZqaEH0Nh1RbfkuB8H1ahV7w
         GiF92Wd/+2F3+VRdU+CJ6ik67tb36ztfIqzSfSXMZiRr2LWS1tnUlbD0+Dk+RXRurG2Q
         E9cNHTKjylD06cZHeOxkwbtvrWLo+6KulRjrZrXBeFqPFXVh8STTRga/a/0qR7FSxj2X
         F1Du9VXM4wk6Upix6OpmOKT+/uNuGb+3s8Vvg2LOzLQtT7tPdm6t7mvuObnerNhVzX1I
         C4KFOF+OztVu0VHH7Na6eIV3EOysNalZGDFmxyHHpkzcTz4EawMTuGLwy9tnONkM3qZc
         T/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739292629; x=1739897429;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mraFYGdjZ3p+xsoVweFVFWZWsbvtMfk7Gt8ykva4+x4=;
        b=GeMZpXZlXxnXSHtH3a1+ZhoMKA78P09KFtYETaYLUH6ccEPjDNlOkgWYaMxrqNqDTk
         enoEMqRwSOneFKoYlHDIMvQPQ2G1jPUDmW6/YL+PhRe1Uj0mf523PYVUs3LfG8NO3xiq
         D/9bT0uLEjcXkeGLyi0W6YdIlByR9O40gnN59eC9LzkBOPvHtMSVAL8BnLJlbQcfqRso
         63lVhld1tgGyyaLbYZLtFf50hUjqFK8bOkBrPSmRzFeEib3Rk7PdsYhoRmS4VBfM72Vf
         Nn6FnzJTz2pGVmUTC/qrifrIrJlay7XbKNIXkgXnGlQhg/7x2an34biAF/OM0gj1esQe
         HuZw==
X-Forwarded-Encrypted: i=1; AJvYcCX7O7dLIIeGQenKB9cOhWYYbUuL503Fg8YWrjQoIW791g5ft/YFrPJcq02hPfcUybgcvwFo8uiVw30=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyh+3YGFV8sznPFgpHVSsBYV2Fk8ylIRV3bZQWbwUpeVEGhHc4J
	oKprcLo7pEykyrvm8tAsOdtHNFkf28KpiVGnM1F+MIwS0PIHo5EL
X-Gm-Gg: ASbGnct1PvQxkAQHo5b6EsZdZS9YSbYlah9kkUy7RJR55yq3awAjlm11D0QNS6NL6Eg
	sLydkIy8SEL73+giGu7O9dVud7ZyQjsudRbABVwPRdzznztA+AEv+fTDzffYoNxtsK9myqbom4u
	zmCSC/UXUWo9n47mXF+QhM8v11xxR49wqAufSNrSOs8Ddqp++KJjUD48PsXooQWDWUcgDv5Eu/g
	ATfRDRPLqw1JEW01xMYX0oyHnv5gPLVh4EwXEn9Jer/5zf/DnUE9jN8I/lRHhgRKXw+yaS1iSL7
	pj+rKXjaYle5yDPWjtL+CgtyjqY=
X-Google-Smtp-Source: AGHT+IHjZzYSDuLNhdVFpMjum5Fl9Cr8K6AYUzNWetHdGaEnHMLlJ5FK+e9+bOqXeM0gojtR+lAW5g==
X-Received: by 2002:a05:6512:b17:b0:545:cc5:be90 with SMTP id 2adb3069b0e04-5450cc5bf3cmr3214469e87.35.1739292629133;
        Tue, 11 Feb 2025 08:50:29 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------tvTwDGgVoMYbypZPRMTnP9vy"
Message-ID: <bdc0a943-45f3-41fc-902e-b6fe0e12965b@gmail.com>
Date: Tue, 11 Feb 2025 17:50:28 +0100
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
 <279e70a8-ad09-46bc-a1f9-7aa6707d3974@gmail.com>
 <417b456f-77b9-4e8f-9641-2ac8e2fb9cda@suse.com>
 <cf11e1a6-6b89-4eca-b13c-d8b9b81262e4@gmail.com>
 <6e6ac5b5-82ad-4bf0-bbd8-55dd075cf268@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <6e6ac5b5-82ad-4bf0-bbd8-55dd075cf268@suse.com>

This is a multi-part message in MIME format.
--------------tvTwDGgVoMYbypZPRMTnP9vy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/11/25 4:47 PM, Jan Beulich wrote:
> On 11.02.2025 16:28, Oleksii Kurochko wrote:
>> On 2/11/25 11:01 AM, Jan Beulich wrote:
>>> On 11.02.2025 10:53, Oleksii Kurochko wrote:
>>>> On 2/10/25 5:19 PM, Jan Beulich wrote:
>>>>> On 07.02.2025 21:07, Oleksii Kurochko wrote:
>>>>>> +/*
>>>>>> + * The canonical order of ISA extension names in the ISA string is defined in
>>>>>> + * chapter 27 of the unprivileged specification.
>>>>>> + *
>>>>>> + * The specification uses vague wording, such as should, when it comes to
>>>>>> + * ordering, so for our purposes the following rules apply:
>>>>>> + *
>>>>>> + * 1. All multi-letter extensions must be separated from other extensions by an
>>>>>> + *    underscore.
>>>>>> + *
>>>>>> + * 2. Additional standard extensions (starting with 'Z') must be sorted after
>>>>>> + *    single-letter extensions and before any higher-privileged extensions.
>>>>>> + *
>>>>>> + * 3. The first letter following the 'Z' conventionally indicates the most
>>>>>> + *    closely related alphabetical extension category, IMAFDQLCBKJTPVH.
>>>>>> + *    If multiple 'Z' extensions are named, they must be ordered first by
>>>>>> + *    category, then alphabetically within a category.
>>>>>> + *
>>>>>> + * 4. Standard supervisor-level extensions (starting with 'S') must be listed
>>>>>> + *    after standard unprivileged extensions.  If multiple supervisor-level
>>>>>> + *    extensions are listed, they must be ordered alphabetically.
>>>>>> + *
>>>>>> + * 5. Standard machine-level extensions (starting with 'Zxm') must be listed
>>>>>> + *    after any lower-privileged, standard extensions.  If multiple
>>>>>> + *    machine-level extensions are listed, they must be ordered
>>>>>> + *    alphabetically.
>>>>>> + *
>>>>>> + * 6. Non-standard extensions (starting with 'X') must be listed after all
>>>>>> + *    standard extensions. If multiple non-standard extensions are listed, they
>>>>>> + *    must be ordered alphabetically.
>>>>>> + *
>>>>>> + * An example string following the order is:
>>>>>> + *    rv64imadc_zifoo_zigoo_zafoo_sbar_scar_zxmbaz_xqux_xrux
>>>>>> + *
>>>>>> + * New entries to this struct should follow the ordering rules described above.
>>>>>> + *
>>>>>> + * Extension name must be all lowercase (according to device-tree binding)
>>>>>> + * and strncmp() is used in match_isa_ext() to compare extension names instead
>>>>>> + * of strncasecmp().
>>>>>> + */
>>>>>> +const struct riscv_isa_ext_data __initconst riscv_isa_ext[] = {
>>>>>> +    RISCV_ISA_EXT_DATA(i, RISCV_ISA_EXT_i),
>>>>>> +    RISCV_ISA_EXT_DATA(m, RISCV_ISA_EXT_m),
>>>>>> +    RISCV_ISA_EXT_DATA(a, RISCV_ISA_EXT_a),
>>>>>> +    RISCV_ISA_EXT_DATA(f, RISCV_ISA_EXT_f),
>>>>>> +    RISCV_ISA_EXT_DATA(d, RISCV_ISA_EXT_d),
>>>>>> +    RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_q),
>>>>>> +    RISCV_ISA_EXT_DATA(c, RISCV_ISA_EXT_c),
>>>>>> +    RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
>>>>>> +    RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
>>>>>> +    RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
>>>>>> +    RISCV_ISA_EXT_DATA(zifencei, RISCV_ISA_EXT_ZIFENCEI),
>>>>>> +    RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
>>>>>> +    RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
>>>>>> +    RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
>>>>>> +    RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
>>>>>> +    RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
>>>>>> +};
>>>>>> +
>>>>>> +static const struct riscv_isa_ext_data __initconst required_extensions[] = {
>>>>>> +    RISCV_ISA_EXT_DATA(i, RISCV_ISA_EXT_i),
>>>>>> +    RISCV_ISA_EXT_DATA(m, RISCV_ISA_EXT_m),
>>>>>> +    RISCV_ISA_EXT_DATA(a, RISCV_ISA_EXT_a),
>>>>>> +    RISCV_ISA_EXT_DATA(f, RISCV_ISA_EXT_f),
>>>>>> +    RISCV_ISA_EXT_DATA(d, RISCV_ISA_EXT_d),
>>>>> Why would these last four (Zifencei below) not be included in #ifdef
>>>>> CONFIG_RISCV_ISA_RV64G, just like ...
>>>>>
>>>>>> +#ifdef CONFIG_RISCV_ISA_C
>>>>>> +    RISCV_ISA_EXT_DATA(c, RISCV_ISA_EXT_c),
>>>>>> +#endif
>>>>> .. this one is?
>>>> I'm not sure if it was the best decision, but I did it this way because
>>>> I believe other bitnesses (32, 128) will also need G. So, I left them
>>>> without|#ifdef| to avoid adding|#ifdef CONFIG_RV{32,128}G| in the future.
>>> That's fine, but then imo RISCV_ISA_RV64G ought to be dropped, and we use
>>> G unconditionally. Whether that's a good move I don't know. I could
>>> imagine embedded use cases which want to run an very simple processors.
>>>
>>>> I also spent some time considering whether 'f' and 'd' are necessary
>>>> for Xen. In the end, I decided that if they aren't needed for Xen,
>>>> it might be better not to use "G" for compilation and instead explicitly
>>>> specify "ima". But it will be better to do as a separate patch (if it
>>>> makes sense).
>>> That's certainly an option; use of floating point registers / insns will
>>> need suppressing one way or another anyway, sooner or later. And yes, I
>>> agree this wants to be a separate change. Even their relative order is
>>> not important, as long as things remain consistent at any point in time.
>> Actually, I think that we should drop 'f' and 'd' from required_extensions[]
>> array as they aren't really needed for Xen. Or make them conditional just to
>> be sure that if "G" was used for compilation and the code with using of them
>> was generated then they are really supported by a h/w.
> As said, that's okay. But as also said you then need to also keep the
> compiler from potentially using F or D insns / registers.
>
>> Regarding #ifdef-ing with RISCV_ISA_RV64G, I think that we have to keep them
>> mentioned unconditionally as 'i', 'm', 'a', 'zicsr' and 'zifencei' which are
>> part of 'G' as all of them are needed by Xen to work.
> Yet then why do we have CONFIG_RISCV_ISA_RV64G?

Several reasons come to my mind:
1. We still need to specify the architecture's bitness (rv32, rv64, etc.) in|march|.
2. It was more convenient to write just "G" instead of "ima_zicsr_zifencei".

Perhaps it would be better to have separate configs (similar to what Linux uses):
|1. ||riscv-march-$(CONFIG_ARCH_RV32I) := rv32ima 2. 
riscv-march-$(CONFIG_ARCH_RV64I) := rv64ima 3. riscv-march-$(CONFIG_FPU) 
:= $(riscv-march-y)fd |

For now, we can skip option 3 until|CONFIG_FPU| is actually needed.

Introduce only options 1 and 2, probably reusing|CONFIG_RISCV_32| and|CONFIG_RISCV_64|:
1.|riscv-march-$(CONFIG_RISCV_32) := rv32ima 
2.riscv-march-$(CONFIG_RISCV_64) := rv64ima |

Then, explicitly add|_zicsr| and|_zifencei|:
|||riscv-march-y := $(riscv-march-y)_zicsr_zifencei|

~ Oleksii


--------------tvTwDGgVoMYbypZPRMTnP9vy
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
    <div class="moz-cite-prefix">On 2/11/25 4:47 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:6e6ac5b5-82ad-4bf0-bbd8-55dd075cf268@suse.com">
      <pre wrap="" class="moz-quote-pre">On 11.02.2025 16:28, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 2/11/25 11:01 AM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 11.02.2025 10:53, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">On 2/10/25 5:19 PM, Jan Beulich wrote:
</pre>
            <blockquote type="cite">
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
              <pre wrap="" class="moz-quote-pre">Why would these last four (Zifencei below) not be included in #ifdef
CONFIG_RISCV_ISA_RV64G, just like ...

</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">+#ifdef CONFIG_RISCV_ISA_C
+    RISCV_ISA_EXT_DATA(c, RISCV_ISA_EXT_c),
+#endif
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">.. this one is?
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">I'm not sure if it was the best decision, but I did it this way because
I believe other bitnesses (32, 128) will also need G. So, I left them
without|#ifdef| to avoid adding|#ifdef CONFIG_RV{32,128}G| in the future.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">That's fine, but then imo RISCV_ISA_RV64G ought to be dropped, and we use
G unconditionally. Whether that's a good move I don't know. I could
imagine embedded use cases which want to run an very simple processors.

</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">I also spent some time considering whether 'f' and 'd' are necessary
for Xen. In the end, I decided that if they aren't needed for Xen,
it might be better not to use "G" for compilation and instead explicitly
specify "ima". But it will be better to do as a separate patch (if it
makes sense).
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">That's certainly an option; use of floating point registers / insns will
need suppressing one way or another anyway, sooner or later. And yes, I
agree this wants to be a separate change. Even their relative order is
not important, as long as things remain consistent at any point in time.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Actually, I think that we should drop 'f' and 'd' from required_extensions[]
array as they aren't really needed for Xen. Or make them conditional just to
be sure that if "G" was used for compilation and the code with using of them
was generated then they are really supported by a h/w.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
As said, that's okay. But as also said you then need to also keep the
compiler from potentially using F or D insns / registers.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Regarding #ifdef-ing with RISCV_ISA_RV64G, I think that we have to keep them
mentioned unconditionally as 'i', 'm', 'a', 'zicsr' and 'zifencei' which are
part of 'G' as all of them are needed by Xen to work.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Yet then why do we have CONFIG_RISCV_ISA_RV64G?</pre>
    </blockquote>
    <pre data-start="34" data-end="66">Several reasons come to my mind:
1. We still need to specify the architecture's bitness (rv32, rv64, etc.) in <code
    data-start="145" data-end="152">march</code>.
2. It was more convenient to write just "G" instead of "ima_zicsr_zifencei".

</pre>
    <pre data-start="232" data-end="313">Perhaps it would be better to have separate configs (similar to what Linux uses):
<code>1. </code><code data-start="318" data-end="363">riscv-march-$(CONFIG_ARCH_RV32I) := rv32ima
2. riscv-march-$(CONFIG_ARCH_RV64I) := rv64ima
3. riscv-march-$(CONFIG_FPU) := $(riscv-march-y)fd

</code></pre>
    <pre data-start="467" data-end="535">For now, we can skip option 3 until <code
    data-start="503" data-end="515">CONFIG_FPU</code> is actually needed.

</pre>
    <pre data-start="537" data-end="626">Introduce only options 1 and 2, probably reusing <code
    data-start="586" data-end="603">CONFIG_RISCV_32</code> and <code
    data-start="608" data-end="625">CONFIG_RISCV_64</code>:
1.<code data-start="631" data-end="674">riscv-march-$(CONFIG_RISCV_32) := rv32ima
2.riscv-march-$(CONFIG_RISCV_64) := rv64ima

</code></pre>
    <pre data-start="723" data-end="769">Then, explicitly add <code
    data-start="744" data-end="752">_zicsr</code> and <code
    data-start="757" data-end="768">_zifencei</code>:
<code>  </code><code data-start="771" data-end="821">riscv-march-y := $(riscv-march-y)_zicsr_zifencei</code></pre>
    <pre>
~ Oleksii


</pre>
  </body>
</html>

--------------tvTwDGgVoMYbypZPRMTnP9vy--

