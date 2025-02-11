Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 723CBA30FC4
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 16:29:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885693.1295505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thsBs-0002UU-NL; Tue, 11 Feb 2025 15:28:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885693.1295505; Tue, 11 Feb 2025 15:28:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thsBs-0002T4-KD; Tue, 11 Feb 2025 15:28:48 +0000
Received: by outflank-mailman (input) for mailman id 885693;
 Tue, 11 Feb 2025 15:28:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GN4I=VC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1thsBq-0002Sy-Rl
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 15:28:47 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df6e2587-e88c-11ef-b3ef-695165c68f79;
 Tue, 11 Feb 2025 16:28:41 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5450abbdce0so2442395e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2025 07:28:41 -0800 (PST)
Received: from [192.168.209.66] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54506c6b218sm958984e87.222.2025.02.11.07.28.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2025 07:28:40 -0800 (PST)
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
X-Inumbo-ID: df6e2587-e88c-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739287721; x=1739892521; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kiS3cBfzou9rO47HcJmBS77eN8im0c0nuVZztpoPt4I=;
        b=H9zvE01Mcp/cQkFcuo4AUxxsrcqzWsCZwnLQ9x2KxSgGZvCl4ktfauSOR3zHkQlBhw
         D1A9FRu0c7s1sT1CpJ5oXzia8ThtjdhGtgwowRz49iFb7kfSQ8Lxv7sj8rTu+AyWhJlU
         doCJuCzNG92SaJhXpsKBlQGntAfKSOcW0mfwT8ynyr4zg+t5GI0/fqpbYJ7iHzBhDm5S
         bEq6yPL87kJjeJcKubCZGevl7S1FywKHNl0GpDaSTfy2uyuANJaTyuGHV71b2hma9fUn
         tjfnx1aQsFFKOnEsx/Xc6re4ziFRdV6FSVR4PdGYt0aqwEqqX+1Z9TktcTNBRnp12qbg
         r0kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739287721; x=1739892521;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kiS3cBfzou9rO47HcJmBS77eN8im0c0nuVZztpoPt4I=;
        b=TKFgY80o+4fNGZoXnsVKbsTanMNdwSSzD7t/bUFN4QXpJDWV3QcoN9LtH8g15pfO/v
         7JkbfrXkmDUpJ1AI4l/sWXNIpP03yQofbUST9sy6vE7qM/U5v1bNrCgkrc6mc5xC01TC
         Tblpu79z3v8NDTpuSj6jQiZcacMI1htW5YTdg0H9fs+8gJtVk2+X24UL5CloZTFUr5Ou
         PwhrXvArY6MuXSYzq1dltTABfMzqaonsX03mx+Di/l1+DEZe+ns+CTPKMtZXdzQOlWjK
         jEyMRziNxz4TwW1JlFGeS1hQOjFNkW/fjBnH7F2Kius4gkN2pZ0K4EKMi7PHwVb09CC6
         hrGA==
X-Forwarded-Encrypted: i=1; AJvYcCXS4mrbg8T8L/g6Zl2axrVHi7VkUnCb3etkh3SHE2DQQ+z0rXWyLZ7PVc5pquLXuSpf0BI9L7P/LXc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwwIwrz+56LpESxRqu4DUKCE0iPU98P+ls1BQdLz6SfSaTFbFEj
	SJVvBdUPFXrmNhux8RkJ0m0xbX4x6KIemQgUJTj2h486ptKWZ3vP
X-Gm-Gg: ASbGncsot321AeE9hOkr9ONSSpvSe9jTLC6I8diuclygivaAaPr6BGth+WLurdsBh5U
	J7rBgALDFVU8trZ6U1o0Q/VfAf25rq5qNCvRyzQ8Yhp29x2wVQ+klYugBv8+ykLpQGE0SfXCjE9
	caEZal6cqBmMFutA8fkOyxpNmujIRvzULjpheOSWxg0/8+reTG/3GiJKoot2x2E8NLm0DdTK3Lc
	TDZ/FUcXYxrfNEhghQyO9CfJmsSpkQy3K/Z5trRXS29rvg38lb+8ryJKvP8XmmX8VpOhUdVtQu+
	6mpvQ6QC25+skky0NcwrwkJT9YU=
X-Google-Smtp-Source: AGHT+IEcebum+DWnNSU7BgyT+4Nj8QftnCb47EuWePbX6T/xo0k0KikzFf9B+9mfJOWQxt820vOk6A==
X-Received: by 2002:a05:6512:118f:b0:545:a1a:556f with SMTP id 2adb3069b0e04-545118767edmr1320343e87.50.1739287720416;
        Tue, 11 Feb 2025 07:28:40 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------FElgY7kss6sQyEaaJQXXc02P"
Message-ID: <cf11e1a6-6b89-4eca-b13c-d8b9b81262e4@gmail.com>
Date: Tue, 11 Feb 2025 16:28:39 +0100
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <417b456f-77b9-4e8f-9641-2ac8e2fb9cda@suse.com>

This is a multi-part message in MIME format.
--------------FElgY7kss6sQyEaaJQXXc02P
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/11/25 11:01 AM, Jan Beulich wrote:
> On 11.02.2025 10:53, Oleksii Kurochko wrote:
>> On 2/10/25 5:19 PM, Jan Beulich wrote:
>>> On 07.02.2025 21:07, Oleksii Kurochko wrote:
>>>> +/*
>>>> + * The canonical order of ISA extension names in the ISA string is defined in
>>>> + * chapter 27 of the unprivileged specification.
>>>> + *
>>>> + * The specification uses vague wording, such as should, when it comes to
>>>> + * ordering, so for our purposes the following rules apply:
>>>> + *
>>>> + * 1. All multi-letter extensions must be separated from other extensions by an
>>>> + *    underscore.
>>>> + *
>>>> + * 2. Additional standard extensions (starting with 'Z') must be sorted after
>>>> + *    single-letter extensions and before any higher-privileged extensions.
>>>> + *
>>>> + * 3. The first letter following the 'Z' conventionally indicates the most
>>>> + *    closely related alphabetical extension category, IMAFDQLCBKJTPVH.
>>>> + *    If multiple 'Z' extensions are named, they must be ordered first by
>>>> + *    category, then alphabetically within a category.
>>>> + *
>>>> + * 4. Standard supervisor-level extensions (starting with 'S') must be listed
>>>> + *    after standard unprivileged extensions.  If multiple supervisor-level
>>>> + *    extensions are listed, they must be ordered alphabetically.
>>>> + *
>>>> + * 5. Standard machine-level extensions (starting with 'Zxm') must be listed
>>>> + *    after any lower-privileged, standard extensions.  If multiple
>>>> + *    machine-level extensions are listed, they must be ordered
>>>> + *    alphabetically.
>>>> + *
>>>> + * 6. Non-standard extensions (starting with 'X') must be listed after all
>>>> + *    standard extensions. If multiple non-standard extensions are listed, they
>>>> + *    must be ordered alphabetically.
>>>> + *
>>>> + * An example string following the order is:
>>>> + *    rv64imadc_zifoo_zigoo_zafoo_sbar_scar_zxmbaz_xqux_xrux
>>>> + *
>>>> + * New entries to this struct should follow the ordering rules described above.
>>>> + *
>>>> + * Extension name must be all lowercase (according to device-tree binding)
>>>> + * and strncmp() is used in match_isa_ext() to compare extension names instead
>>>> + * of strncasecmp().
>>>> + */
>>>> +const struct riscv_isa_ext_data __initconst riscv_isa_ext[] = {
>>>> +    RISCV_ISA_EXT_DATA(i, RISCV_ISA_EXT_i),
>>>> +    RISCV_ISA_EXT_DATA(m, RISCV_ISA_EXT_m),
>>>> +    RISCV_ISA_EXT_DATA(a, RISCV_ISA_EXT_a),
>>>> +    RISCV_ISA_EXT_DATA(f, RISCV_ISA_EXT_f),
>>>> +    RISCV_ISA_EXT_DATA(d, RISCV_ISA_EXT_d),
>>>> +    RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_q),
>>>> +    RISCV_ISA_EXT_DATA(c, RISCV_ISA_EXT_c),
>>>> +    RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
>>>> +    RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
>>>> +    RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
>>>> +    RISCV_ISA_EXT_DATA(zifencei, RISCV_ISA_EXT_ZIFENCEI),
>>>> +    RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
>>>> +    RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
>>>> +    RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
>>>> +    RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
>>>> +    RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
>>>> +};
>>>> +
>>>> +static const struct riscv_isa_ext_data __initconst required_extensions[] = {
>>>> +    RISCV_ISA_EXT_DATA(i, RISCV_ISA_EXT_i),
>>>> +    RISCV_ISA_EXT_DATA(m, RISCV_ISA_EXT_m),
>>>> +    RISCV_ISA_EXT_DATA(a, RISCV_ISA_EXT_a),
>>>> +    RISCV_ISA_EXT_DATA(f, RISCV_ISA_EXT_f),
>>>> +    RISCV_ISA_EXT_DATA(d, RISCV_ISA_EXT_d),
>>> Why would these last four (Zifencei below) not be included in #ifdef
>>> CONFIG_RISCV_ISA_RV64G, just like ...
>>>
>>>> +#ifdef CONFIG_RISCV_ISA_C
>>>> +    RISCV_ISA_EXT_DATA(c, RISCV_ISA_EXT_c),
>>>> +#endif
>>> .. this one is?
>> I'm not sure if it was the best decision, but I did it this way because
>> I believe other bitnesses (32, 128) will also need G. So, I left them
>> without|#ifdef| to avoid adding|#ifdef CONFIG_RV{32,128}G| in the future.
> That's fine, but then imo RISCV_ISA_RV64G ought to be dropped, and we use
> G unconditionally. Whether that's a good move I don't know. I could
> imagine embedded use cases which want to run an very simple processors.
>
>> I also spent some time considering whether 'f' and 'd' are necessary
>> for Xen. In the end, I decided that if they aren't needed for Xen,
>> it might be better not to use "G" for compilation and instead explicitly
>> specify "ima". But it will be better to do as a separate patch (if it
>> makes sense).
> That's certainly an option; use of floating point registers / insns will
> need suppressing one way or another anyway, sooner or later. And yes, I
> agree this wants to be a separate change. Even their relative order is
> not important, as long as things remain consistent at any point in time.

Actually, I think that we should drop 'f' and 'd' from required_extensions[]
array as they aren't really needed for Xen. Or make them conditional just to
be sure that if "G" was used for compilation and the code with using of them
was generated then they are really supported by a h/w.

Regarding #ifdef-ing with RISCV_ISA_RV64G, I think that we have to keep them
mentioned unconditionally as 'i', 'm', 'a', 'zicsr' and 'zifencei' which are
part of 'G' as all of them are needed by Xen to work.

~ Oleksii


--------------FElgY7kss6sQyEaaJQXXc02P
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
    <div class="moz-cite-prefix">On 2/11/25 11:01 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:417b456f-77b9-4e8f-9641-2ac8e2fb9cda@suse.com">
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
        <pre wrap="" class="moz-quote-pre">
I'm not sure if it was the best decision, but I did it this way because
I believe other bitnesses (32, 128) will also need G. So, I left them
without|#ifdef| to avoid adding|#ifdef CONFIG_RV{32,128}G| in the future.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
That's fine, but then imo RISCV_ISA_RV64G ought to be dropped, and we use
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
      <pre wrap="" class="moz-quote-pre">
That's certainly an option; use of floating point registers / insns will
need suppressing one way or another anyway, sooner or later. And yes, I
agree this wants to be a separate change. Even their relative order is
not important, as long as things remain consistent at any point in time.</pre>
    </blockquote>
    <pre>Actually, I think that we should drop 'f' and 'd' from required_extensions[]
array as they aren't really needed for Xen. Or make them conditional just to
be sure that if "G" was used for compilation and the code with using of them
was generated then they are really supported by a h/w.

Regarding #ifdef-ing with RISCV_ISA_RV64G, I think that we have to keep them
mentioned unconditionally as 'i', 'm', 'a', 'zicsr' and 'zifencei' which are
part of 'G' as all of them are needed by Xen to work.

~ Oleksii


</pre>
  </body>
</html>

--------------FElgY7kss6sQyEaaJQXXc02P--

