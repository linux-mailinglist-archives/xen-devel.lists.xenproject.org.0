Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CB8A2C93E
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2025 17:48:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.883850.1293703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgRWO-0006Tb-Un; Fri, 07 Feb 2025 16:48:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 883850.1293703; Fri, 07 Feb 2025 16:48:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgRWO-0006RF-Rj; Fri, 07 Feb 2025 16:48:04 +0000
Received: by outflank-mailman (input) for mailman id 883850;
 Fri, 07 Feb 2025 16:48:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p4G/=U6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tgRWN-0006LQ-Lo
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2025 16:48:03 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46c37b14-e573-11ef-b3ef-695165c68f79;
 Fri, 07 Feb 2025 17:47:54 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-544ff616010so386252e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 07 Feb 2025 08:48:01 -0800 (PST)
Received: from [192.168.209.66] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5441053ec1fsm501747e87.34.2025.02.07.08.48.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Feb 2025 08:48:00 -0800 (PST)
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
X-Inumbo-ID: 46c37b14-e573-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738946881; x=1739551681; darn=lists.xenproject.org;
        h=in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fCeI9ErGr7ZhoIg9M2Hk1wwMKZCTlAkiCDeZ6If5G9E=;
        b=ivR0P1UZSfLQGONbi2FV6wtDrjZRdFL/pSX9mrQRKNavmvjl/WVxmcQCE/2QKcvR8v
         EVCu0htxG45JiF0zqlqjYsvs+8PatuDWv0daFs2pPhBvv2IXz3M2jEUCfBm/bEX3peIL
         SX5r2cL+6zYlod5T3T4sf6bSVNBurHpnh1n4qxaIbi8VkIqoiUqzPqNBWxA1CnW/dGTC
         03Lk5AnMDCz2LGj2GNEw2vgRWvX12TAelhCIi0RxEwTN1Tp4QAyhl6EG1kmZuT8PuOqS
         OtuWv3VOIUXqUQkPOf+uHckMpdJHFWWqd6KC2gjJ1UWqO9ZynfFFYA0w82pbJq98u90q
         xN6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738946881; x=1739551681;
        h=in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fCeI9ErGr7ZhoIg9M2Hk1wwMKZCTlAkiCDeZ6If5G9E=;
        b=n+LYQ2Vpof5d7Lo0mFWCU0ro/0lsK9+kP1TklCFtK4w/iPLhUj3TZNcP7DrCCpbw8P
         AWsHiXhBDC4OYphKHqyebgfYW1Clog5d1J5KhoVlxRpJZMyNPS/aG4V6C17hiAJYkvkG
         SREJ+7BjX0kwSFBLrjwGCKuGTElBGA/aP/zNJlywbELAVvx5O093wp1s9L/+9muVh6Nj
         0qprR5V0Xf0BZTJNOkxtD45iJgp/T8cSo/j/QyfvSKdfYBJkW1sGP4O354Sb6xlJmjbl
         a5m5LBnzTslOV2oxPYUacz66OD4ILIILGmIa5QkoOr7axUzv1uZ0K5yEWoe1qbv2nhDx
         bjRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtuERTG4tjIsoQ/vOq2eBnqapxc6ile9PQOC6GFGcwD/cT2AxPF4lJJcBM4YeSILBBfpltO0M8+2w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxwcEQxvt2nTnzKlvcnaA2dbS/799cASI45XpbIGOhuozmW5Zkh
	yWvY5pTJvyJfAoYEnS5kCHsIUDklWvkUohpoIpz7iSnQdEoLdH/n
X-Gm-Gg: ASbGncvKEQtOur0uzClsFK3LS20PtSHgZjfzF0isjDPVLC6fwcOjOKtdupDpKBQxlDC
	9twlm2d867HhVpeSa8rJhL/ptfGnv9bqx/Scmy1MjJt1a92GPGj5uDQYrQqJ40UhOp0qAdXrVyA
	SfXBnORSnLuRn5BDEPjiMY7tANk1EjhRPdsNnLl2nRPz10UR1fOjd8tonz3EQXmPynhO4VgSz1z
	qUFh6qIsAhOaxbvQkjMjDpkeNQFDD+hWo3T4J2dfIMrQqfDViGkcQ7OsJ2U50JAdZgSiPrgVV9Q
	ElAue/Aq3IcbXcQ0/jojEg9oihU=
X-Google-Smtp-Source: AGHT+IHg25L6dXUDj4Oei8z0p6/gl/uCnvjWe1ACQ0biUwYN30/tA6KoXXuMDHGLGfaGI+PMecvdqA==
X-Received: by 2002:a05:6512:b98:b0:540:1d0a:581d with SMTP id 2adb3069b0e04-54414aa6d50mr1516108e87.24.1738946880989;
        Fri, 07 Feb 2025 08:48:00 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------cmmj6lrEtiE7giy0LiFLxcfk"
Message-ID: <2ecd15fb-dcd0-4105-971e-a04eb26963cf@gmail.com>
Date: Fri, 7 Feb 2025 17:48:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for 4-21 v4] xen/riscv: identify specific ISA supported by
 cpu
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
Content-Language: en-US
In-Reply-To: <ab7077b3-6bef-4025-9389-345a345a141c@suse.com>

This is a multi-part message in MIME format.
--------------cmmj6lrEtiE7giy0LiFLxcfk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/4/25 12:47 PM, Jan Beulich wrote:
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
>> +
>> +static const struct riscv_isa_ext_data __initconst required_extensions[] = {
>> +    RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
>> +    RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
>> +    RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
>> +};
> Coming back to my earlier question regarding the B (pseudo-)extension:
> Since riscv_isa_ext[] only contains Zbb, is it precluded anywhere in
> the spec that DT may mention just B when all of its constituents are
> supported?
>
> Which gets me on to G, which is somewhat similar in nature to B. We
> require G when RISCV_ISA_RV64G=y, yet required_extensions[] doesn't
> name it or its constituents. Much like we require C when RISCV_ISA_C=y,
> yet it's not in the table.

Another one thing I am thinking about if we really need a separate required_extensions[] array.

We can leave only riscv_isa_ext[] and then just do a check:
  bitmap_weight(riscv_isa, ...) == ARRAY_SIZE(riscv_isa_ext)



--------------cmmj6lrEtiE7giy0LiFLxcfk
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
    <div class="moz-cite-prefix">On 2/4/25 12:47 PM, Jan Beulich wrote:<br>
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
 bitmap_weight(riscv_isa, ...) == ARRAY_SIZE(riscv_isa_ext)



</pre>
  </body>
</html>

--------------cmmj6lrEtiE7giy0LiFLxcfk--

