Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA616A25FD2
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2025 17:24:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880788.1290881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tezFT-0005b6-25; Mon, 03 Feb 2025 16:24:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880788.1290881; Mon, 03 Feb 2025 16:24:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tezFS-0005Za-VT; Mon, 03 Feb 2025 16:24:34 +0000
Received: by outflank-mailman (input) for mailman id 880788;
 Mon, 03 Feb 2025 16:24:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o2EM=U2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tezFS-0005Ap-9F
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2025 16:24:34 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59649959-e24b-11ef-99a4-01e77a169b0f;
 Mon, 03 Feb 2025 17:24:32 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4361c705434so34277865e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2025 08:24:32 -0800 (PST)
Received: from [192.168.100.192] (lfbn-gre-1-190-108.w90-112.abo.wanadoo.fr.
 [90.112.153.108]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e23d48b3sm168109715e9.5.2025.02.03.08.24.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 08:24:31 -0800 (PST)
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
X-Inumbo-ID: 59649959-e24b-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738599872; x=1739204672; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uFua2gNuof1X5ReUjbVfIIHwx3OSkb/KT3f+oUsjVkM=;
        b=a0aZHNUTCAMtXm29Ml6PK3CMqaKqE6pbs0cTk/NyVQ2FuYhEALCdxesiqcs7/J/FDa
         VzpjJUth9KQjSe+cSa7R/2i1ODO1AiT75hfEFFylylH1bOcauAlwasogSKzD/I+e/8qB
         5KVbLX935n5U2sZ9MCIsGAQjJz65knNGVg9shAI+Lj3QBbII5WwoO3rz67vkuKwZRK35
         nOI/siD95vbkvu3ad3iTs/wV2Q33nxqngRDpfA48OkflEHVkGpxQvpF8b17r1RgkxYrR
         KkTNPI/WqMDnufTeyliNE3v7nmO34JItXfc4Zj2m/hAV72z98iF9we1T6OlvK6v8Kdr/
         LoGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738599872; x=1739204672;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uFua2gNuof1X5ReUjbVfIIHwx3OSkb/KT3f+oUsjVkM=;
        b=gsmVUsXOlzaxzWLFTqlUqMjT3JpUiomjmA5bqM2yN0nnmOpT+ZnJ6mbAQqK5uQiS7+
         9VKwbc9UiTJDiUIbvsogk+T096mu1X3r1erX2geIMbXRKGUpCJ/hOf07WWBD/f0A7jYg
         CouhfyErgJVirhjCXRHYXBY/F/fXTGD63Mda9GY/A/EkZDxu69AxWC8w49WTloW8DrTE
         gbtbKd7AHZvg0IyMw9eI8KC52ePi7952vPBAP5wJM3GGatpJMHefExHjtyP2KEdt+KA2
         68m9GjIX5l1UV5UJwupXAp7EGld8dO1n31/pSHhPqMXlnWKgrzOUxmXDySlueaeBMaGN
         /7hw==
X-Forwarded-Encrypted: i=1; AJvYcCVBVJ3lfFbwaRzMTXkTiW74s2LCvh4H8BUK6fB0P2WRiCWxY+G4Q40SQhqw7ko26m/JSmOxnWaOFPs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwhkxE8r5skzUxe8GrLBt3TgVuunhs0QODRcvz7/aUqisr/HHEq
	YZPmS4hDrQcrLYOMWuGbX97ZthhafsyNR8xa2mkDQOSkRAQuRvSr
X-Gm-Gg: ASbGncu7dXv9w/xJHcKGuJ+yzgo0CGrST55DScT098Kuj2ZzP2ZTP7E3H4t3/BNJjow
	CVV/YrP0b1uFb2suoAHQBFIKGQtjeiaDOIjUFo9a2gH6swfeQfM+YLemGL49HPO+v9i6xJincHG
	VCayKtviLGYeHkNWMdqPuxGouBM0l8atTgLYQFZ1SRBvs/WgSYAB1PA3DGlaMCt0HinJnxmHq56
	ut5HEHnfNSRt3bU9WqbVZ0XqKgLpuPf1sPRIIID0pzuq/1LHiinR0kemSKT/WHYwBkK4TfzaOz9
	PvP5Lxk6NjotRpPJSQzfF383hQrcQMCQR9rOLSq+WRbvkvu+KZQGYONzIYL1+ZlNCkUUlhKficl
	v6TE=
X-Google-Smtp-Source: AGHT+IH0c7XT3+xANuzZ4Z3prwzaAUbdtT6Ib5NtOhdvzoFt9+4Hez0Uzrvo+b3l/0EuRCa6GXA+qw==
X-Received: by 2002:a05:600c:1c0f:b0:434:f871:1b96 with SMTP id 5b1f17b1804b1-438dc41fb6cmr206788565e9.29.1738599871333;
        Mon, 03 Feb 2025 08:24:31 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------0OPyvvB27YiGZGqXbjJxVI6W"
Message-ID: <f9c4166a-4d96-46af-adf0-1c91fe50e249@gmail.com>
Date: Mon, 3 Feb 2025 17:24:30 +0100
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
 <4ee4c8c8-b392-4c0a-8173-624d661409f4@gmail.com>
 <99a1a2f6-12d7-4a4e-a776-05d6b960cf1d@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <99a1a2f6-12d7-4a4e-a776-05d6b960cf1d@suse.com>

This is a multi-part message in MIME format.
--------------0OPyvvB27YiGZGqXbjJxVI6W
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2/3/25 5:03 PM, Jan Beulich wrote:
> On 03.02.2025 16:05, Oleksii Kurochko wrote:
>> On 1/27/25 3:47 PM, Jan Beulich wrote:
>>>> +static bool is_lowercase_extension_name(const char *str)
>>>> +{
>>>> +    /*
>>>> +     * `str` could contain full riscv,isa string from device tree so one
>>>> +     * of the stop condionitions is checking for '_' as extensions are
>>>> +     * separated by '_'.
>>>> +     */
>>>> +    for ( unsigned int i = 0; (str[i] != '\0') && (str[i] != '_'); i++ )
>>>> +        if ( !islower(str[i]) )
>>>> +            return false;
>>>> +
>>>> +    return true;
>>>> +}
>>>> +
>>>> +static void __init match_isa_ext(const char *name, const char *name_end,
>>>> +                                 unsigned long *bitmap)
>>>> +{
>>>> +    const size_t riscv_isa_ext_count = ARRAY_SIZE(riscv_isa_ext);
>>>> +
>>>> +    for ( unsigned int i = 0; i < riscv_isa_ext_count; i++ )
>>>> +    {
>>>> +        const struct riscv_isa_ext_data *ext = &riscv_isa_ext[i];
>>>> +
>>>> +        /*
>>>> +         * `name` (according to device tree binding) and
>>>> +         * `ext->name` (according to initialization of riscv_isa_ext[]
>>>> +         * elements) must be all in lowercase.
>>>> +         *
>>>> +         * Just to be sure that it is true, ASSERT() is added.
>>>> +         */
>>>> +        ASSERT(is_lowercase_extension_name(name) &&
>>>> +               is_lowercase_extension_name(ext->name));
>>> More general remark: While asserting on ext->name is okay, for it being
>>> our own data, asserting on data coming from the outside is generally not
>>> correct. For now I'm not going to insist on this being changed, but
>>> sooner or later it will want revisiting
>> IIUC it would be better to leave ASSERT(is_lowercase_extension_name(ext->name)) in match_isa_ext()
>> and put ASSERT(is_lowercase_extension_name(ext) in riscv_isa_parse_string() before match_isa_ext()
>> is called:
>>     static int __init riscv_isa_parse_string(const char *isa,
>>                                              unsigned long *out_bitmap)
>>     {
>>       ...
>>       while ( *isa )
>>       {
>>         const char *ext = isa++;
>>       ...
>>       ASSERT(is_lowercase_extension_name(ext));
>>       match_isa_ext(ext, ext_end, out_bitmap);
>>     }
>>
>> Is my understanding correct?
> That depends on the origin of the incoming "isa". Considering the function
> wants to parse it, I'd expect it still comes from DT. In which case
> asserting on it is wrong; anything may come from there, and nothing should
> cause assertion failures. Recall that assertions are checks of _our own
> internal state_ only.

But based on the device tree binding (https://elixir.bootlin.com/linux/v6.13.1/source/Documentation/devicetree/bindings/riscv/extensions.yaml#L47 <https://elixir.bootlin.com/linux/v6.13.1/source/Documentation/devicetree/bindings/riscv/extensions.yaml#L47> ),
not anything should come from DT for the riscv,isa string; only lowercase letters are allowed.
I am not sure if it makes sense to double-check if riscv,isa is correct, as my expectation (which I haven’t checked yet) is that the DTS will
be validated during compilation.

Does it make sense to double check what was put in DT's riscv,isa?

As an option, I think I could simply convert the riscv,isa value obtained from the device tree to lowercase and then remove the ASSERT() for the DT’s
ISA property altogether. This way, it won’t really matter what is placed in the riscv,isa property. Even if riscv,isa mustn't have only lowercase letters
(according to the bindings) I would anyway to convert everything to lowercase to simplify parser.

>
>>>> +static int __init riscv_isa_parse_string(const char *isa,
>>>> +                                         unsigned long *out_bitmap)
>>>> +{
>>>> +    if ( (isa[0] != 'r') && (isa[1] != 'v') )
>>>> +        return -EINVAL;
>>>> +
>>>> +#if defined(CONFIG_RISCV_32)
>>>> +    if ( isa[2] != '3' && isa[3] != '2' )
>>>> +        return -EINVAL;
>>>> +#elif defined(CONFIG_RISCV_64)
>>>> +    if ( isa[2] != '6' && isa[3] != '4' )
>>>> +        return -EINVAL;
>>>> +#else
>>>> +    #error "unsupported RISC-V bitness"
>>> Nit: We generally like to have the # in the first column, and - if
>>> so desired - blank padding afterwards.
>> Should it be done only when "#if defined" used inside function or blank padding is needed only in
>> case when "#if defined" is used and, for example, for "#ifdef" such padding isn't needed?
> I fear I don't understand the question; I see no connection to #ifdef vs
> #if defined(). Any blanks after # are generally up to the author's taste
> (unless the result is really unwieldy), as we have no style rule for that.
> There are pros and cons towards the use of such padding.

Got it. I just thought that sometimes padding is used and sometimes not, so decided that some "rule"
exist.

Thanks.

~ Oleksii

--------------0OPyvvB27YiGZGqXbjJxVI6W
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/3/25 5:03 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:99a1a2f6-12d7-4a4e-a776-05d6b960cf1d@suse.com">
      <pre wrap="" class="moz-quote-pre">On 03.02.2025 16:05, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 1/27/25 3:47 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
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
          <pre wrap="" class="moz-quote-pre">More general remark: While asserting on ext-&gt;name is okay, for it being
our own data, asserting on data coming from the outside is generally not
correct. For now I'm not going to insist on this being changed, but
sooner or later it will want revisiting
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
IIUC it would be better to leave ASSERT(is_lowercase_extension_name(ext-&gt;name)) in match_isa_ext()
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
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
That depends on the origin of the incoming "isa". Considering the function
wants to parse it, I'd expect it still comes from DT. In which case
asserting on it is wrong; anything may come from there, and nothing should
cause assertion failures. Recall that assertions are checks of _our own
internal state_ only.</pre>
    </blockquote>
    <pre>But based on the device tree binding ( <a rel="noopener"
    target="_new"
href="https://elixir.bootlin.com/linux/v6.13.1/source/Documentation/devicetree/bindings/riscv/extensions.yaml#L47"><span>https</span><span>://elixir</span><span>.bootlin</span><span>.com</span><span>/linux</span><span>/v6.13.1</span><span>/source</span><span>/Documentation</span><span>/devicetree</span><span>/bindings</span><span>/riscv</span><span>/extensions</span><span>.yaml</span><span>#L47</span></a> ),
not anything should come from DT for the riscv,isa string; only lowercase letters are allowed.
I am not sure if it makes sense to double-check if riscv,isa is correct, as my expectation (which I haven’t checked yet) is that the DTS will
be validated during compilation.

Does it make sense to double check what was put in DT's riscv,isa?

As an option, I think I could simply convert the riscv,isa value obtained from the device tree to lowercase and then remove the ASSERT() for the DT’s
ISA property altogether. This way, it won’t really matter what is placed in the riscv,isa property. Even if riscv,isa mustn't have only lowercase letters
(according to the bindings) I would anyway to convert everything to lowercase to simplify parser.

</pre>
    <blockquote type="cite"
      cite="mid:99a1a2f6-12d7-4a4e-a776-05d6b960cf1d@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
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
+    #error "unsupported RISC-V bitness"
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Nit: We generally like to have the # in the first column, and - if
so desired - blank padding afterwards.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Should it be done only when "#if defined" used inside function or blank padding is needed only in
case when "#if defined" is used and, for example, for "#ifdef" such padding isn't needed?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I fear I don't understand the question; I see no connection to #ifdef vs
#if defined(). Any blanks after # are generally up to the author's taste
(unless the result is really unwieldy), as we have no style rule for that.
There are pros and cons towards the use of such padding.</pre>
    </blockquote>
    <pre>Got it. I just thought that sometimes padding is used and sometimes not, so decided that some "rule"
exist.

Thanks.

~ Oleksii
</pre>
  </body>
</html>

--------------0OPyvvB27YiGZGqXbjJxVI6W--

