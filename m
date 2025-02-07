Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 749DAA2CD5F
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2025 21:01:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.883909.1293743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgUWg-0007ry-45; Fri, 07 Feb 2025 20:00:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 883909.1293743; Fri, 07 Feb 2025 20:00:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgUWg-0007q3-1B; Fri, 07 Feb 2025 20:00:34 +0000
Received: by outflank-mailman (input) for mailman id 883909;
 Fri, 07 Feb 2025 20:00:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p4G/=U6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tgUWe-0007px-Jw
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2025 20:00:32 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e9a8d6b-e58e-11ef-b3ef-695165c68f79;
 Fri, 07 Feb 2025 21:00:30 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ab7800d3939so306101966b.2
 for <xen-devel@lists.xenproject.org>; Fri, 07 Feb 2025 12:00:30 -0800 (PST)
Received: from [192.168.209.66] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab796babc1dsm54856066b.89.2025.02.07.12.00.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Feb 2025 12:00:29 -0800 (PST)
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
X-Inumbo-ID: 2e9a8d6b-e58e-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738958430; x=1739563230; darn=lists.xenproject.org;
        h=in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mir1Ng1olTU9eP+vBUu/aILmR+BhN24pu8XSIqi/DVw=;
        b=Vcx3Swyeel06ph7EsBWqqq/zjAf2C+uA7e2U7hBnVK2UWU81Nd0dzgVstLUteHyLPL
         v3pIDUi4MFNdqy9RLkwaVxX9tcU8SRjvtGnlagAfF1Lb28H8OQkWSCriyfRnDBqorCk4
         2M+cXe+2pGiEb8J1XTZ4/vbSivjmrF4cmbYHRAjmF6wwOcwqdKLSu69z9kb4/eD24uuI
         PYuqAn0wT5j8peKZ/6NE+41ib6E8YjvbZMDYcFCMRnKzOv871GazfFSzczScoDeLTTbM
         0f1Ad2zWTH4MRSvfcyuxZF04D3P6KKCLnWkoFl9gn1S75g/Me6nulLk/ugcXLvRCtjG4
         v5Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738958430; x=1739563230;
        h=in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Mir1Ng1olTU9eP+vBUu/aILmR+BhN24pu8XSIqi/DVw=;
        b=cHFb5HuooyZa5OCqx9tpF6jzRrcHP5UiU4G0NtfN2KcrpNKnyulQw3y2CV5fZX7Mcs
         H+W0TsbRd0oFkgkafaPl/yrcpilTuBnBZHZ40MJlNTRgLNAYF2lLT8zWkvz+rdDOAq0G
         rKQ69OlKcrfI30mSzguLAAIGi65jBV3hkm8lQqmF63c1LAHoSAfdl1HffDQ6H51sGKMf
         r+jPc1LEBClMDryb65fompJTILZNIoP8qGD7fbUBMCbomaMGhUlZ94cGPnWD9wQToHKY
         ByuuXfV8ZlbZfd4+zDaKfqxEMGopb28hR46u9SiYP0iHXVagBAcDipbsc/4nNaLWkA7O
         1Jmw==
X-Forwarded-Encrypted: i=1; AJvYcCWHwQirPAs8zvdluZMQJlKpYHRfeePSa/sMZE7GpEjGLZDH8ofxhP0z//Qvru0sxQs1D3ExluTiReo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwE0uxxpn+KLnIHZlcAbxtDs1lr0fECbIQ67gX4FbB99ZmC4PPQ
	gvv+9jlxHzGWTY/lpQqNpHSEw81aIvovKKaLLPrJnvRLBKPZkDPf
X-Gm-Gg: ASbGncvlf3o0VGnO+GYQpqkM+ylBs1rJji+RKKFAhr4nWWwZ3b5Fw8Vkqi5HBSr91Ma
	xQZBTTZ1rxaBHNZlkOivGYPh9Kvx42G6lNHdTo6oXrzYAL8K3CEoobtmTKW5NFKANEwZlJPMzal
	SWW0Ft3yU1/DIEr1X4CXl3rNuaTOj4iyizlAayx8KonJr8tLdYA1a6Kqu4hUQO624YF0rf/5VXD
	Yn8ktalmE0Jd/wAklwPHqE9iFl/bBE9DEevgh/Nzp4odtaU7m84oCnexy8oDq7m7O3+q8cUH49V
	0Q7oMYdHRgIIAHTHUelRe/nVmvM=
X-Google-Smtp-Source: AGHT+IFXRiiNUUY9GoXgP9lSTFKJnlwuy+1i/aSxOi0ChgkbYOmto3lzAmpiOfKFUTP8/DeKAlji7w==
X-Received: by 2002:a17:907:3e27:b0:aa6:7737:199c with SMTP id a640c23a62f3a-ab789ada791mr462192266b.15.1738958429530;
        Fri, 07 Feb 2025 12:00:29 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------j0vUaGFwIJv1ZfBjTWvntItU"
Message-ID: <0e2e03ae-521a-42c4-9538-2c831b74112c@gmail.com>
Date: Fri, 7 Feb 2025 21:00:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4-21 v4] xen/riscv: identify specific ISA supported by
 cpu
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <a63c60c7a97a2b361e3a41f57bed61c0c9a0a89f.1738653407.git.oleksii.kurochko@gmail.com>
 <ab7077b3-6bef-4025-9389-345a345a141c@suse.com>
 <68c8222d-bc5a-4614-bc03-a1ea02693221@gmail.com>
Content-Language: en-US
In-Reply-To: <68c8222d-bc5a-4614-bc03-a1ea02693221@gmail.com>

This is a multi-part message in MIME format.
--------------j0vUaGFwIJv1ZfBjTWvntItU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/7/25 5:47 PM, Oleksii Kurochko wrote:
>
>
> On 2/4/25 12:47 PM, Jan Beulich wrote:
>>> +const struct riscv_isa_ext_data __initconst riscv_isa_ext[] = {
>>> +    RISCV_ISA_EXT_DATA(i, RISCV_ISA_EXT_i),
>>> +    RISCV_ISA_EXT_DATA(m, RISCV_ISA_EXT_m),
>>> +    RISCV_ISA_EXT_DATA(a, RISCV_ISA_EXT_a),
>>> +    RISCV_ISA_EXT_DATA(f, RISCV_ISA_EXT_f),
>>> +    RISCV_ISA_EXT_DATA(d, RISCV_ISA_EXT_d),
>>> +    RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_q),
>>> +    RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
>>> +    RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
>>> +    RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
>>> +    RISCV_ISA_EXT_DATA(zifencei, RISCV_ISA_EXT_ZIFENCEI),
>>> +    RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
>>> +    RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
>>> +    RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
>>> +    RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
>>> +    RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
>>> +};
>>> +
>>> +static const struct riscv_isa_ext_data __initconst required_extensions[] = {
>>> +    RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
>>> +    RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
>>> +    RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
>>> +};
>> Coming back to my earlier question regarding the B (pseudo-)extension:
>> Since riscv_isa_ext[] only contains Zbb, is it precluded anywhere in
>> the spec that DT may mention just B when all of its constituents are
>> supported?
>>
>> Which gets me on to G, which is somewhat similar in nature to B. We
>> require G when RISCV_ISA_RV64G=y, yet required_extensions[] doesn't
>> name it or its constituents. Much like we require C when RISCV_ISA_C=y,
>> yet it's not in the table.
> Another one thing I am thinking about if we really need a separate required_extensions[] array.
>
> We can leave only riscv_isa_ext[] and then just do a check:
>   bitmap_weight(riscv_isa, ...) == ARRAY_SIZE(riscv_isa_ext)

It seems like we still need to have two arrays: one for what Xen is supported (and could be passed to guest
by riscv,isa) and one for what is required for boot.

~ Oleksii

--------------j0vUaGFwIJv1ZfBjTWvntItU
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
    <div class="moz-cite-prefix">On 2/7/25 5:47 PM, Oleksii Kurochko
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:68c8222d-bc5a-4614-bc03-a1ea02693221@gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 2/4/25 12:47 PM, Jan Beulich
        wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:ab7077b3-6bef-4025-9389-345a345a141c@suse.com">
        <pre class="moz-quote-pre" wrap=""><blockquote type="cite"
        style="color: #007cff;"><pre wrap="" class="moz-quote-pre">+const struct riscv_isa_ext_data __initconst riscv_isa_ext[] = {
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
+
+static const struct riscv_isa_ext_data __initconst required_extensions[] = {
+    RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
+    RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
+    RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
+};
</pre></blockquote><pre wrap="" class="moz-quote-pre">Coming back to my earlier question regarding the B (pseudo-)extension:
Since riscv_isa_ext[] only contains Zbb, is it precluded anywhere in
the spec that DT may mention just B when all of its constituents are
supported?

Which gets me on to G, which is somewhat similar in nature to B. We
require G when RISCV_ISA_RV64G=y, yet required_extensions[] doesn't
name it or its constituents. Much like we require C when RISCV_ISA_C=y,
yet it's not in the table.
</pre></pre>
      </blockquote>
      <pre>Another one thing I am thinking about if we really need a separate required_extensions[] array.

We can leave only riscv_isa_ext[] and then just do a check:
 bitmap_weight(riscv_isa, ...) == ARRAY_SIZE(riscv_isa_ext)</pre>
    </blockquote>
    <pre>It seems like we still need to have two arrays: one for what Xen is supported (and could be passed to guest
by riscv,isa) and one for what is required for boot.</pre>
    <pre>
~ Oleksii
</pre>
  </body>
</html>

--------------j0vUaGFwIJv1ZfBjTWvntItU--

