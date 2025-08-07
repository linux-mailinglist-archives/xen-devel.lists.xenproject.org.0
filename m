Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA96B1DAEA
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 17:41:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073232.1436135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk2jr-00059E-JD; Thu, 07 Aug 2025 15:41:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073232.1436135; Thu, 07 Aug 2025 15:41:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk2jr-000577-GH; Thu, 07 Aug 2025 15:41:07 +0000
Received: by outflank-mailman (input) for mailman id 1073232;
 Thu, 07 Aug 2025 15:41:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oMMd=2T=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uk2jq-000571-JB
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 15:41:06 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ece8c226-73a4-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 17:41:03 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-61592ff5ebbso1831840a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Aug 2025 08:41:03 -0700 (PDT)
Received: from [192.168.1.17] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0766d1sm1334005666b.18.2025.08.07.08.41.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Aug 2025 08:41:02 -0700 (PDT)
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
X-Inumbo-ID: ece8c226-73a4-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754581263; x=1755186063; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ml60KIc2CYkWNPdjzB+KfxViAnMLY5u6Fz5Mxsc9eVI=;
        b=OCfb0vuYx1Jd4k8WbBjvL2I30KsPmWhMQSpuxwtW4tyfBBr2nkqEjpwMqnpvJNe0fu
         60ecqMbwlWiL50ZOqrVJ0hpq0yGzXlK7Z+4g2kH3w0+k/Ry57gYGXun4twJ2VMPNFA7T
         z4abP34awS16bVCHB2e/1isQlCiEsMv7cZ2ehQeIRTuMYcjePc5WhX75jQKiyA4XxvGS
         ejJVsKP3BP9CbaHW816eIP+DpS/IoPmOjxzu59vlXfU1ZoE+kzE6GQQUeMUngKQuAFkQ
         BZ4khqyn9tdlnu3kXhzeUSsb3sRyL+yBaVwxWwLUyMTUlih5tJkDhyRoVl26wiaCDrT2
         LxeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754581263; x=1755186063;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ml60KIc2CYkWNPdjzB+KfxViAnMLY5u6Fz5Mxsc9eVI=;
        b=pvIFuupQ733bG7QIdwlOngnaV/VmZGQ2E0wFiDYurb6YTzZ1Xjz6HN+kGCtuw3UcC9
         Wk5wHLWCEroBS9YxUsNd8EFIGnxM21+2Cl82THUNKxUyuHpnKF489JIOKsdnoLKjelRJ
         49hvevPZQe0BksnSbCAYcVk5iHnYf7uapAmqLEKhYS7qMmeV34MDTiTNyJ47YXFIcrgJ
         zkCU43kxgrIKAMFOH5U6SnwINE0fBrtbM6Zy4O8QuWnBFnAjipWchdbK8ztnduAgnsm+
         Cu7yR3iF2UpsMuLZYKlde6Jk5SSJGOPmXjQDvUz1ak56SVMIMma918MarpaeyfacJDFd
         ORDA==
X-Forwarded-Encrypted: i=1; AJvYcCUDgup/Jwimfa7XHxbjuub59Bvtj82ZmgPxG0tACSow/vnbsQkW5iT+h7i1qgwhQGWB2vwj1IsekoE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzhaqAG0CxKbJdkoG1a/hEInt+nRAc2eajwFeCMpjqmJq/kkCMI
	RATiB0NDCeSN60r462dO/hcKF4EuQkxiA6/S3A1d2jswmT6ChMMTfwnu
X-Gm-Gg: ASbGnctdtvn9LHAUXXUt5btlS2bzkPnqHTv1/lKSw4xXzelAzB+q6gECZ1UH3h2+a5B
	co0xn3jl4KTuyUN+LoP+x0Pmlbrv5xjlUflE0rv2CYHOD1Bje1u0PNoP6l3TUpC45eEyt3PK14m
	FLp42EjX7OV3zfMpYzdwF6BleLrWTHLfUEQDIJu8694HXAXW2e8ia3Yu0/o2jF9vwIGU6bbc7TR
	2IQfzb8UFLTMzfN6VZ4tfUMNghSnuCBNSx1rTqzftU0Fex+pdTEQDro8j0ObrU+u6g8jg1ab4Gj
	mf9fptnS5EKgYCLbsbb+zRzPk8n6lC7lfXkiXVua6h21MFCgWqhvTcXBCp5RQcip/CvBFARzdAE
	drcFlS1vZFY0HTaVa1rHnKY3/gb2hZiOsMuUr31hJLA0nExUkv3oreMvTzPlk/NMAuVFnMKgFTM
	RZcBZOVOA=
X-Google-Smtp-Source: AGHT+IFZzBeO+CrkV99PhiYIeka1twZ0VKs0QEN93feMIL1d+GHXFsdYnJhWVnQXyj9HP8SxzqX0LQ==
X-Received: by 2002:a17:907:3e20:b0:ad8:9a3b:b274 with SMTP id a640c23a62f3a-af9c1e56b52mr35970466b.52.1754581262479;
        Thu, 07 Aug 2025 08:41:02 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------sgn0ZyzKW2f2ep2DX6nNsYTN"
Message-ID: <9a89f0ad-1ba8-47a5-8b9e-1d85f7be8308@gmail.com>
Date: Thu, 7 Aug 2025 17:41:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/20] xen/riscv: add new p2m types and helper macros
 for type classification
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <3d35b6f4bb79048647020ed4e7b222585ca3a9a3.1753973161.git.oleksii.kurochko@gmail.com>
 <48dcca92-4dd8-4d6e-a4cb-c10a7ee80f19@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <48dcca92-4dd8-4d6e-a4cb-c10a7ee80f19@suse.com>

This is a multi-part message in MIME format.
--------------sgn0ZyzKW2f2ep2DX6nNsYTN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/4/25 4:16 PM, Jan Beulich wrote:
> On 31.07.2025 17:58, Oleksii Kurochko wrote:
>> - Extended p2m_type_t with additional types: p2m_mmio_direct,
>>    p2m_grant_map_{rw,ro}.
>> - Added macros to classify memory types: P2M_RAM_TYPES, P2M_GRANT_TYPES.
>> - Introduced helper predicates: p2m_is_ram(), p2m_is_any_ram().
>> - Define p2m_mmio_direct to tell handle_passthrough_prop() from common
>>    code how to map device memory.
>>
>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
> Almost ready to be acked, except for ...
>
>> --- a/xen/arch/riscv/include/asm/p2m.h
>> +++ b/xen/arch/riscv/include/asm/p2m.h
>> @@ -62,8 +62,30 @@ struct p2m_domain {
>>   typedef enum {
>>       p2m_invalid = 0,    /* Nothing mapped here */
>>       p2m_ram_rw,         /* Normal read/write domain RAM */
>> +    p2m_mmio_direct_io, /* Read/write mapping of genuine Device MMIO area,
>> +                           PTE_PBMT_IO will be used for such mappings */
>> +    p2m_ext_storage,    /* Following types'll be stored outsude PTE bits: */
>> +    p2m_grant_map_rw,   /* Read/write grant mapping */
>> +    p2m_grant_map_ro,   /* Read-only grant mapping */
>>   } p2m_type_t;
>>   
>> +#define p2m_mmio_direct p2m_mmio_direct_io
> ... this (see reply to patch 09).
>
>> +/* We use bitmaps and mask to handle groups of types */
>> +#define p2m_to_mask(t_) BIT(t_, UL)
> I notice that you moved the underscore to the back of the parameters,
> compared to how Arm has it. I wonder though: What use are these
> underscores in the first place, here and below? (There are macros where
> conflicts could arise, but the ones here don't fall in that group,
> afaict.)

Good point, there is really no name conflicts here, so underscore could
be just dropped.

~ Oleksii

--------------sgn0ZyzKW2f2ep2DX6nNsYTN
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
    <div class="moz-cite-prefix">On 8/4/25 4:16 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:48dcca92-4dd8-4d6e-a4cb-c10a7ee80f19@suse.com">
      <pre wrap="" class="moz-quote-pre">On 31.07.2025 17:58, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">- Extended p2m_type_t with additional types: p2m_mmio_direct,
  p2m_grant_map_{rw,ro}.
- Added macros to classify memory types: P2M_RAM_TYPES, P2M_GRANT_TYPES.
- Introduced helper predicates: p2m_is_ram(), p2m_is_any_ram().
- Define p2m_mmio_direct to tell handle_passthrough_prop() from common
  code how to map device memory.

Signed-off-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Almost ready to be acked, except for ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -62,8 +62,30 @@ struct p2m_domain {
 typedef enum {
     p2m_invalid = 0,    /* Nothing mapped here */
     p2m_ram_rw,         /* Normal read/write domain RAM */
+    p2m_mmio_direct_io, /* Read/write mapping of genuine Device MMIO area,
+                           PTE_PBMT_IO will be used for such mappings */
+    p2m_ext_storage,    /* Following types'll be stored outsude PTE bits: */
+    p2m_grant_map_rw,   /* Read/write grant mapping */
+    p2m_grant_map_ro,   /* Read-only grant mapping */
 } p2m_type_t;
 
+#define p2m_mmio_direct p2m_mmio_direct_io
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... this (see reply to patch 09).

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+/* We use bitmaps and mask to handle groups of types */
+#define p2m_to_mask(t_) BIT(t_, UL)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I notice that you moved the underscore to the back of the parameters,
compared to how Arm has it. I wonder though: What use are these
underscores in the first place, here and below? (There are macros where
conflicts could arise, but the ones here don't fall in that group,
afaict.)</pre>
    </blockquote>
    <pre>Good point, there is really no name conflicts here, so underscore could
be just dropped.

~ Oleksii
</pre>
  </body>
</html>

--------------sgn0ZyzKW2f2ep2DX6nNsYTN--

