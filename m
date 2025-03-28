Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7A5A745BB
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 09:53:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930327.1332967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty5Sl-0003fU-6c; Fri, 28 Mar 2025 08:53:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930327.1332967; Fri, 28 Mar 2025 08:53:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty5Sl-0003dD-3q; Fri, 28 Mar 2025 08:53:15 +0000
Received: by outflank-mailman (input) for mailman id 930327;
 Fri, 28 Mar 2025 08:53:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QVst=WP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ty5Sj-0003d5-5A
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 08:53:13 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13aa034c-0bb2-11f0-9ffa-bf95429c2676;
 Fri, 28 Mar 2025 09:53:11 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5e6167d0536so3752363a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 28 Mar 2025 01:53:11 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5edc16aae09sm1045758a12.6.2025.03.28.01.53.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Mar 2025 01:53:09 -0700 (PDT)
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
X-Inumbo-ID: 13aa034c-0bb2-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743151990; x=1743756790; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R/WnZPlwT5gj+uVh3nw/Ii6GOkLXlbI8P6+Lg6cYNL4=;
        b=YuYNf1zEn/F/v7fhpTv2WR0xTAOu5SXdcmCZxGlREbb8sayA+kktXk6h5xiu16aiNl
         fssjDeDCK4fRSqdRgyrnxzXg9pI5sUI/CjBiY+LdVJnae/DEcTpoppo8UH7vBno5SKf4
         x95EDh0vWLOiOAySFwCJ8Hwj2FufALooUowkLLJoSA9gNTDaOj9n3Ogv920h8/E6nNbV
         Rn99aqzHByVbXXRbGMjZqa1Wdn8v/6LfdB7/oR8EIMQDvDuvBoozwBzMeyzg7vwE/xLP
         tsDIJjVqIaOnDm0GJ5+lMVkqeLa7WI/aQ1VyOF03wEQuv5uHTp4MCRo3gbKBX0I/mxj1
         +3ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743151990; x=1743756790;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R/WnZPlwT5gj+uVh3nw/Ii6GOkLXlbI8P6+Lg6cYNL4=;
        b=mI9cIwCwtLlwUyrJgrDIZwwf0rUoHBdj9UPHV83zbBMGTOXgl4YvyrpnKOVj1Dno0U
         6QTX5GIGkuFJ/L3EpLdpvTD8LrnWOWNImEv6WYsXV8snu9bRRq4mwGQ/3g6/HWr00rQv
         QytdNxNblQEL3qGnh/FTSoToUdOj7ZOmezpj+cxBBD6j01/+2JD++sh49d+KhEAItJCU
         L4ojMpgGs+LQ8o10ubybDdEz55wqaKf1TzmRF8cq5PUnLSCzQSetm5nH9OqO0vGCLTLe
         Xl/NLaoK2Q5bQyuEhn9yskrVpPaBYBHFtcvsROKbFXR97Juh81WQqk+Glj1Fgq8tplMU
         VS5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWZNh1csrg3TsS7HB5DAaRABuY0GTxKtYw5p9/GN2TRGvdJTsblDm+infUvfyzXJMJSy/ybXfstA4U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxH8EZP6t73DsiVwxW4LEM17VtkrvVFWLXFp8yK5QoZxq3ZEob6
	4T3JGdthRF3glR8mlZEcIbtFJ1l+gRPfaOWqbZ0siKq6ra0rcF4I
X-Gm-Gg: ASbGncsSAUFmBb/uhCX6JChizVmr9eVGEuMLopbHOTI+qTfO8B25h9AUo2SEsKBefwv
	o+eKUsuHARXl7Txu/XyLsjg5L2pnJc3LrcRkkwRRhovJkRwbMuXOjanKCjOd/YcqPkz+J0bZG47
	tc2mblAJrHmB0fQx7qauD33CpDq32bb+qNFbcgLAri+6tQk/EUvNC26syI6vN62Zb1gC0jNvxr0
	N6bgdRcg27AZCJTIFhCchhZLL3DVsFwxlmaVGNnMCBYDBsmR5Q7oRSRqnkn2f34o69bVyUCpJru
	dN+G/N3DeE0ZTODg7PFCzqhr3HfIYejKNEx4M94aeV8HZI0WQjzjGm2sJv+B1ZGQqKnKca7k4lE
	3KpK8q2xzxHYW0lbGgOck
X-Google-Smtp-Source: AGHT+IHZrytY0aXJHOPK1iZWN5t9mPviI9RdXM9rFQxFi5TW1lNsLH5wek0IeUwp9U3wcDap2WHyhw==
X-Received: by 2002:a05:6402:5243:b0:5e7:8efa:ba13 with SMTP id 4fb4d7f45d1cf-5ed8df6a9f8mr6499609a12.7.1743151990207;
        Fri, 28 Mar 2025 01:53:10 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------VtPgCnlEs5IUQay8qRuqripN"
Message-ID: <1db4c47b-49f0-458d-ad00-1e55bb2774e9@gmail.com>
Date: Fri, 28 Mar 2025 09:53:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/config.h: Move BITS_PER_* definitions from
 asm/config.h to xen/config.h
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <6b21fb046cf1c8ca760f5ad72fa3cc13b59c4069.1743092485.git.oleksii.kurochko@gmail.com>
 <404e86cf-740b-4613-8534-a18b3654f874@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <404e86cf-740b-4613-8534-a18b3654f874@suse.com>

This is a multi-part message in MIME format.
--------------VtPgCnlEs5IUQay8qRuqripN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/28/25 8:49 AM, Jan Beulich wrote:
> On 27.03.2025 18:33, Oleksii Kurochko wrote:
>> BITS_PER_* values can be defined in a common way using compiler-provided macros.
>> Thus, these definitions are moved to xen/config.h to reduce duplication across
>> architectures.
>>
>> Additionally, *_BYTEORDER macros are removed, as BITS_PER_* values now come
>> directly from the compiler environment.
>>
>> The arch_fls() implementation for Arm and PPC is updated to use BITS_PER_INT
>> instead of a hardcoded value of 32.
>>
>> Suggested-by: Andrew Cooper<andrew.cooper3@citrix.com>
>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
> Reviewed-by: Jan Beulich<jbeulich@suse.com>
> albeit ...
>
>> --- a/xen/include/xen/config.h
>> +++ b/xen/include/xen/config.h
>> @@ -98,4 +98,14 @@
>>   #define ZERO_BLOCK_PTR ((void *)-1L)
>>   #endif
>>   
>> +#define BYTES_PER_LONG  __SIZEOF_LONG__
> ... I remain unconvinced that we actually need this (yet then not its sibling
> for int). All uses I can spot could be replaced by sizeof(long). This (and its
> sibling) would be needed only for #if uses, and there I would then wonder why
> we couldn't use __SIZEOF_LONG__ directly, now that we assume its universally
> available.

I left only because|BYTES_PER_LONG| is used in ARM and x86 code.
If no one minds, I can replace|BYTES_PER_LONG| with|__SIZEOF_LONG__|.

~ Oleksii

--------------VtPgCnlEs5IUQay8qRuqripN
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
    <div class="moz-cite-prefix">On 3/28/25 8:49 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:404e86cf-740b-4613-8534-a18b3654f874@suse.com">
      <pre wrap="" class="moz-quote-pre">On 27.03.2025 18:33, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">BITS_PER_* values can be defined in a common way using compiler-provided macros.
Thus, these definitions are moved to xen/config.h to reduce duplication across
architectures.

Additionally, *_BYTEORDER macros are removed, as BITS_PER_* values now come
directly from the compiler environment.

The arch_fls() implementation for Arm and PPC is updated to use BITS_PER_INT
instead of a hardcoded value of 32.

Suggested-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>
Signed-off-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Reviewed-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
albeit ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/include/xen/config.h
+++ b/xen/include/xen/config.h
@@ -98,4 +98,14 @@
 #define ZERO_BLOCK_PTR ((void *)-1L)
 #endif
 
+#define BYTES_PER_LONG  __SIZEOF_LONG__
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... I remain unconvinced that we actually need this (yet then not its sibling
for int). All uses I can spot could be replaced by sizeof(long). This (and its
sibling) would be needed only for #if uses, and there I would then wonder why
we couldn't use __SIZEOF_LONG__ directly, now that we assume its universally
available.</pre>
    </blockquote>
    <pre>I left only because <code data-start="67" data-end="83">BYTES_PER_LONG</code> is used in ARM and x86 code.
If no one minds, I can replace <code data-start="146" data-end="162">BYTES_PER_LONG</code> with <code
    data-start="168" data-end="185" data-is-only-node="">__SIZEOF_LONG__</code>.

~ Oleksii</pre>
  </body>
</html>

--------------VtPgCnlEs5IUQay8qRuqripN--

