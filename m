Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A691BAC2205
	for <lists+xen-devel@lfdr.de>; Fri, 23 May 2025 13:35:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.995639.1377926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIQg2-0006Y2-P5; Fri, 23 May 2025 11:35:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 995639.1377926; Fri, 23 May 2025 11:35:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIQg2-0006Wb-MU; Fri, 23 May 2025 11:35:02 +0000
Received: by outflank-mailman (input) for mailman id 995639;
 Fri, 23 May 2025 11:35:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=59Zg=YH=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uIQg1-0006WV-FX
 for xen-devel@lists.xenproject.org; Fri, 23 May 2025 11:35:01 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5532836-37c9-11f0-b892-0df219b8e170;
 Fri, 23 May 2025 13:34:59 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ad5297704aaso1530101866b.2
 for <xen-devel@lists.xenproject.org>; Fri, 23 May 2025 04:34:59 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d4420ccsm1197136366b.110.2025.05.23.04.34.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 May 2025 04:34:58 -0700 (PDT)
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
X-Inumbo-ID: f5532836-37c9-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748000099; x=1748604899; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/B3enXGVCVlxeacnZp2rSb6m1gRv4OfVjhKViwqA/U=;
        b=WeHcmB9Bk4OzWzib8+V0aC58FdMyJ0ThpKcySCWfG39FNDkJvcxEhfzHK6XPGALraD
         EhBc3bpHyyltaC+w6Kn4bmvejr+Aee12Pn2iAiokpvcZeSprvsxVJq3Qn9CdJgRkC5ur
         582/f0jHhM44XYYLZ2kR5Fmvgv1AsQiXJgZLKElJaWQwQ2Mxkpgzdzol2UMYB2WXVJJF
         i7SgQKBfIebxxmVGf9WDU1NgekWeHqXYXOIC5bbKubOU/iuRwwX815SO+y0sib0IDU+0
         C5+9nJPuxoFcCRgGYnryXKZa3XtLNXZa064vSuWUjdvT262vyGffb2QSuDg0WyU+D0OA
         CkGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748000099; x=1748604899;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m/B3enXGVCVlxeacnZp2rSb6m1gRv4OfVjhKViwqA/U=;
        b=UsqMZV30E4ImfeVyUCjMMWxAFNfPw1u/14FDmTSvStUHselYE7GnjN1vSMzU+OLueD
         64VeDqD5e8GmItILMNgIibJLk7LlDfEbAU+rvqpJrvtrU/OTXXcKFenmRSbkKdDHvPib
         mMXDSeoKNkLT8xFC7BTR6tU+lqXxqCNZtEEWe60OpWclg+u7RIsInrOUF54GCVIw/YBb
         kfqUlVvovU+x0wmnQbuyjFFNoGBTXa7LyZ0uQLmXUk7HJNnNZWSJwVPBO0TSV8z9Xb+U
         nW5Oth/GN0zsgyO8iuH/xmFB84Dwv+QMG+wUi3Yzm1plPj5wBM1hT64PeMhXvwJrs2oz
         PHfg==
X-Forwarded-Encrypted: i=1; AJvYcCVdc89/9jaYp3r6MW6YxxvP3u3/SJg/zbBxoizD4xNzD+mNNR9xpytgsmZHpGlFVE7Cmnu+UGdOmIE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz7mkkczmak2DICxgW3B1HMKWsNeE3U+/DiExQDV24bbfiuKAnQ
	YALLJAzcL9gCnG65GxJu8vZFAaBy0fpvdP6p3+kWnwulqW03t/DTUEys
X-Gm-Gg: ASbGncucrNO0hCHsSkmUD4jF4+cBCHlPdMpEtKXHBwqmGz8wr20fTDT3lmYBClFain2
	Xkk3q2J7Op6MIoPxz51KD1yPMnNc82gKZaDEhHnI0y4m5QuOSlWVDRTNPZ+neoXN8M46RjHbs0c
	2W8gc3zRyvB+jiKy9N2uk8lgmjQlJoCmYrEuhiYRTimXE/InCM9VJPxCcKTPE33UNItbur3uXzu
	GDNznl6wDpK5zP2Z+AIMTnAtL3an7qMVQYNwuL6gF2xRZriTOg9/NAyTZYH8Jt0kolz1scuFXvX
	EfqtKP/7s/m3e4j+l9sHt6uGMJFlrLrgD/0OhySLXqEdz//m4NzDQEP3SPL3EUVzL8NKQeqNGY+
	uFURpmjX18qT3QXUqblj6IGAhvIM1zwi8sIo=
X-Google-Smtp-Source: AGHT+IGHggtOf2c5gJg+CfrPL62I+mF8eF+SUMqk7FJZdqFlNKhxg8kkplPwJeNoFjsoI6q7nmDbew==
X-Received: by 2002:a17:907:97c6:b0:abf:7453:1f1a with SMTP id a640c23a62f3a-ad52d5174e6mr2725320066b.36.1748000098682;
        Fri, 23 May 2025 04:34:58 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------A8TRKA4dtCKZX41CdgjuMFbv"
Message-ID: <c2be2642-0cba-48e2-8acf-1664a96f12c9@gmail.com>
Date: Fri, 23 May 2025 13:34:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/6] xen/riscv: add new p2m types and helper macros for
 type classification
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1746805907.git.oleksii.kurochko@gmail.com>
 <52861198c7c363c4b0caf818345f4ffbec056337.1746805907.git.oleksii.kurochko@gmail.com>
 <ad1d0c41-a554-49f2-8397-a288b4b75eae@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <ad1d0c41-a554-49f2-8397-a288b4b75eae@suse.com>

This is a multi-part message in MIME format.
--------------A8TRKA4dtCKZX41CdgjuMFbv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/20/25 5:11 PM, Jan Beulich wrote:
> On 09.05.2025 17:57, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/include/asm/p2m.h
>> +++ b/xen/arch/riscv/include/asm/p2m.h
>> @@ -80,8 +80,36 @@ struct p2m_domain {
>>   typedef enum {
>>       p2m_invalid = 0,    /* Nothing mapped here */
>>       p2m_ram_rw,         /* Normal read/write domain RAM */
>> +    p2m_ram_ro,         /* Read-only; writes are silently dropped */
> This is pretty special a type, which imo better wouldn't be introduced
> without there being proper support for it. (I don't suppose RISC-V
> hardware alone can effect this type?)

It is possible to make ro by using r, w, x bits of page table entry in the
same way Arm does that:
     case p2m_ram_ro:
         e->p2m.xn = 0;
         e->p2m.write = 0;
         break;

>
>> +    p2m_mmio_direct_dev,/* Read/write mapping of genuine Device MMIO area */
>> +    p2m_map_foreign_rw, /* Read/write RAM pages from foreign domain */
>> +    p2m_map_foreign_ro, /* Read-only RAM pages from foreign domain */
> Aiui you took these from Arm. Looking at its sole use, I'm not convinced
> it's used correctly. If it is, the same comment as for p2m_ram_ro above
> would apply here, too.

p2m_mmio_direct_dev - this one is defintely needed as it is used for device
pass through to guest domain to map device's MMIO. It seems to me like it is
correctly used.

Others we don't really use now in private branches but it seems like they could be
useful, so I added them now.

I can drop them now and return back if such functionality which uses them will be
introduced for RISC-V, and at that moment I think it will be
more clear if it is used correctly or not.
Right now, I am not sure if it is.

~ Oleksii


--------------A8TRKA4dtCKZX41CdgjuMFbv
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
    <div class="moz-cite-prefix">On 5/20/25 5:11 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:ad1d0c41-a554-49f2-8397-a288b4b75eae@suse.com">
      <pre wrap="" class="moz-quote-pre">On 09.05.2025 17:57, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -80,8 +80,36 @@ struct p2m_domain {
 typedef enum {
     p2m_invalid = 0,    /* Nothing mapped here */
     p2m_ram_rw,         /* Normal read/write domain RAM */
+    p2m_ram_ro,         /* Read-only; writes are silently dropped */
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This is pretty special a type, which imo better wouldn't be introduced
without there being proper support for it. (I don't suppose RISC-V
hardware alone can effect this type?)</pre>
    </blockquote>
    <pre>It is possible to make ro by using r, w, x bits of page table entry in the
same way Arm does that:
    case p2m_ram_ro:
        e-&gt;p2m.xn = 0;
        e-&gt;p2m.write = 0;
        break;

</pre>
    <blockquote type="cite"
      cite="mid:ad1d0c41-a554-49f2-8397-a288b4b75eae@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    p2m_mmio_direct_dev,/* Read/write mapping of genuine Device MMIO area */
+    p2m_map_foreign_rw, /* Read/write RAM pages from foreign domain */
+    p2m_map_foreign_ro, /* Read-only RAM pages from foreign domain */
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Aiui you took these from Arm. Looking at its sole use, I'm not convinced
it's used correctly. If it is, the same comment as for p2m_ram_ro above
would apply here, too.</pre>
    </blockquote>
    <pre>p2m_mmio_direct_dev - this one is defintely needed as it is used for device
pass through to guest domain to map device's MMIO. It seems to me like it is
correctly used.

Others we don't really use now in private branches but it seems like they could be
useful, so I added them now.

I can drop them now and return back if such functionality which uses them will be
introduced for RISC-V, and at that moment I think it will be
more clear if it is used correctly or not.
Right now, I am not sure if it is.

~ Oleksii


</pre>
  </body>
</html>

--------------A8TRKA4dtCKZX41CdgjuMFbv--

