Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A52A2C93A
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2025 17:48:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.883841.1293692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgRVS-0005zu-MX; Fri, 07 Feb 2025 16:47:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 883841.1293692; Fri, 07 Feb 2025 16:47:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgRVS-0005xL-Jk; Fri, 07 Feb 2025 16:47:06 +0000
Received: by outflank-mailman (input) for mailman id 883841;
 Fri, 07 Feb 2025 16:47:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p4G/=U6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tgRVQ-0005xD-JB
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2025 16:47:04 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 286a03b8-e573-11ef-a073-877d107080fb;
 Fri, 07 Feb 2025 17:47:03 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-3082334d1a0so8150861fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 07 Feb 2025 08:47:03 -0800 (PST)
Received: from [192.168.209.66] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-307de2fb8b4sm4657611fa.113.2025.02.07.08.47.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Feb 2025 08:47:02 -0800 (PST)
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
X-Inumbo-ID: 286a03b8-e573-11ef-a073-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738946823; x=1739551623; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KV/FgfVJxK1HifPS5oSbwLrPeO5Zl3QgXZeybMGnjNc=;
        b=OQenCLAApUWLy82+YOilsjpCauHfGBJ5W75lkftJR2v9Fj9o9Fcg9VsgGRPMWH+PFU
         iiwgLvJGJ6rrJ8p0f7zx7aD8IqFaS1JXg8dOHq/dDm/e1wq6XKD0cApzNN34RsqBzR2K
         0cG4o/hhGxCTTeeke4baWpxoOQxErLVCyEsYS6ewaUIdvbBTDAvTR9D8vtkI8uxmSUbS
         ex+WMJ2x27wzln/zg2JxmeyAjZxd4lYfg3LKY7s3F/yod7nVKdl29wxsYzL0yfLsmwb4
         4sbdqdYpF+EI6K6GA+6Um2NWsH1HcnqIrcxvlLIFMNJ8DR6s7XjK8bfomFg73kKcbm3m
         uK+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738946823; x=1739551623;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KV/FgfVJxK1HifPS5oSbwLrPeO5Zl3QgXZeybMGnjNc=;
        b=iSyv0jXGjpEeG5HSm10FtH2ILmm3yJtNkQJXJgiwFQD9Odhm/lBRzPeNtFCGxeQUFg
         WBR5ZhtFnWkepgfxi7ywGe1gDAE7SvmTzBzQLnxxW/1Z0beLhh4xztBNg6hKRzYE0zcy
         EHlBQlSy7FmtFVYpfbZ0r+/nfjhCdtx69ZWE/DFubDTBWI3AqG+HrIVvwgrmaxtUqboM
         cFvivwU4lwBOtIrGna5fisLNNoEXDmzQD/jkzPDLPE8Jg1/Js2YQgThIzqlNv/sc0Z5z
         uD4S+3Buk87uX6Dmi3LYQ0s3ue5Dixv4/cfwo7U2xk9/wfF96ID4/U4bSa9flJ0AhO9K
         lcFw==
X-Forwarded-Encrypted: i=1; AJvYcCVaDr4iXl26ClehOzqXZ5nSZoM/AL/y7XRzh478sxtPpOwm+TH94YKs9psYgZC0F0caOTCZjUkqpW0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YydulT+ze0BhLEJTbqsbD0CPM9PMVjQVaIl16qCkrZCKtbFr8B8
	JtCd8n/yvrbtjhqqIZLQIWT77kjU4syw5BIUfiOL8ybvehARrgkO
X-Gm-Gg: ASbGncv1gDL4GzaNYTbAuwTrS4SMr02zNCTsDUbHaxRP2qu7++IMANum54H/YpCh701
	tWN1fRPpxqwD036i4XzHOp0H5froSXu4odI+FAcCLBDi1UIbaBkNfniQcUpAHiMyZQ3+Sq3pzcP
	+XPMOpTC7Q7C9ZRaUw248xTOadE2oP7F+tz97qXrv6fBauTfB/6op3OeN3SQ/AdvO63Xg/Zi+XB
	UbSRRjkYMEXlaj1S7giAyhHty9kBBGaRJIOD0pldCHs1kQGrPfsW/6lJUjuULzCavvHf/kWMAbV
	mtRo40P6kxMMboW4MBdtJLmUjs0=
X-Google-Smtp-Source: AGHT+IGnRhfVs4QseLLtoS/Zfdnne/SGmKJ4RVZLfc7l3wLPc90+Zen1+SI2vQwKkqxjpaT3OQZHQA==
X-Received: by 2002:a05:651c:b08:b0:300:3307:389f with SMTP id 38308e7fff4ca-307e5bc02e6mr11673891fa.0.1738946822534;
        Fri, 07 Feb 2025 08:47:02 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------ivT9DchYulp5CDsutioKtSEt"
Message-ID: <68c8222d-bc5a-4614-bc03-a1ea02693221@gmail.com>
Date: Fri, 7 Feb 2025 17:47:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
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
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <ab7077b3-6bef-4025-9389-345a345a141c@suse.com>

This is a multi-part message in MIME format.
--------------ivT9DchYulp5CDsutioKtSEt
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

~ Oleksii

--------------ivT9DchYulp5CDsutioKtSEt
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

~ Oleksii

</pre>
  </body>
</html>

--------------ivT9DchYulp5CDsutioKtSEt--

