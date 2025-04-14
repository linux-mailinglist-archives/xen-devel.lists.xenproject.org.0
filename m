Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA9AA885B4
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 16:51:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.950522.1346810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4L8v-0007YC-TK; Mon, 14 Apr 2025 14:50:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 950522.1346810; Mon, 14 Apr 2025 14:50:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4L8v-0007Vx-QD; Mon, 14 Apr 2025 14:50:37 +0000
Received: by outflank-mailman (input) for mailman id 950522;
 Mon, 14 Apr 2025 14:50:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YdIb=XA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u4L8u-0007Vp-FX
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 14:50:36 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d24a5b25-193f-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 16:50:35 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5e5e63162a0so7306993a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 07:50:35 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1ccd255sm910312666b.156.2025.04.14.07.50.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 07:50:33 -0700 (PDT)
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
X-Inumbo-ID: d24a5b25-193f-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744642234; x=1745247034; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ssKW7qnqudOt5C98+v8q6rM8aAHHrH+UyYnvLLgTX8U=;
        b=SbWA9Ty7U8IcCD1AUu0jsRXtEjPVKlIjV0pV2VNvfCVzDNkJih0FsHAVH8bm9p+ksI
         X3R6FtBJDvP24wmhqLrvgfeHZYYkCFMso5QwDZ1nhMx2iLnJMcUCh73HiNWdeQlazYi1
         Un78xquxEJeypb3RaNn7COKDjXOXYSeYIc4jwJDY8BTFXMInytNqz65uADRYgHO4o61v
         ueEsRpOUE8k7C0fSvFNdKcBCYtylk8bnykzDFjVRV3qj6QY0EbQFZjJLoXsch1JLEtnP
         GeRBht1YgopsDWOdnA3CIez4F6xgpp6NK/J3yzR2WMcnJq1F1ftQ8l6xkKGOs+Y2n/1S
         k4wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744642234; x=1745247034;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ssKW7qnqudOt5C98+v8q6rM8aAHHrH+UyYnvLLgTX8U=;
        b=OwmnD6KlWUmhFuvUX+DxQMdnfamI2b/QUEQmfuRdkjPsY6BihzD/VkvZSaG+ZNiCC7
         BUud/hTEQPc3khkAY3oK7StJHcepd/AczSQTbxbCGy7EPENpa9fusS0D4FAbLfZsLPA2
         n5UTCrVGODPNqhZelvUYatLOVQxR4ilTfumzRMLdpPk8+csipbK7c8fraL5OFDohMDn6
         jxQw7+Wv4cCLRcyVbZtrQq4k6LsZsYPy4ETIEbQAcXeMRo2Odct51Ph3tEXrSux+IlVI
         2KVnbeYd9RIen7toLEzEgB5sYs4ny8TafknarFq70KpOrjm1Yd6VEhiIAVxksfY7mMr7
         pNSw==
X-Forwarded-Encrypted: i=1; AJvYcCW+InS63g2DwXpzUZexX1IqUYBpDb/Qb3vxhUNkuJ3j2reszi5mP3OM3/IDHimwga20KxRsJtrJ5fE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyWzm+U4AUA+fqlzMQrO37sn1VzYNYdf4A4G21of+DVLhZsE00T
	whDteyiiEmYUYcvaXVt7TclEKewS0vyrKCpXGeIstp1ZDoErMQN5
X-Gm-Gg: ASbGnctyMLHVhTQKUzcMdcdg8tr76dCky6KCtPWm1v/+k71XbSSride2/DhCSduofe8
	U33UN1wFCSoenjSNGOquACn0tGqpqSbpzYbQUv33gyHUEKj9laN1BCZA/vJ2q1X2cr76rZiITvW
	T9zsC7RIgXQZRC3xaGZ7Oay33KKUO87fygQ4ZFwRFTjEzXFbQbPNVkdTXxGOBTGXHqXxOEcWWGW
	Rq20DU4XZKJZoP+FaFgALZZaCcU0iEZONMjrKM7kLSjg3Cz/do97nu6KgZznvf0nZp2u3FrgG23
	e63KvIsYRXnXDdachdufYZhPHrBovFva8qkkQ6RNEVdfhfB3yc9klfjUBwjmlEWfcsRIIBYxfNv
	rgA6HI36LaJoE2cr5
X-Google-Smtp-Source: AGHT+IGtmczYQE2lLO/Swp2K6JUtF5S6Nrpq2iEg9+A5Yci3N77obqbyzsh9pHd7VA9g4kSe773q1g==
X-Received: by 2002:a17:907:3d0e:b0:ac7:ec75:c65b with SMTP id a640c23a62f3a-acad34dd659mr1171271866b.36.1744642234150;
        Mon, 14 Apr 2025 07:50:34 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------yo4C76a0szgaZfAxZHH92FIz"
Message-ID: <cedc9b5f-0a90-433c-957c-ecd2f6f26e7d@gmail.com>
Date: Mon, 14 Apr 2025 16:50:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/14] xen/riscv: implement get_s_time()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
 <e503aee3ef743210a8188a7da9e70a169dec1287.1744126720.git.oleksii.kurochko@gmail.com>
 <7f26a9cb-a685-4a2a-a470-8c5e94ddc31e@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <7f26a9cb-a685-4a2a-a470-8c5e94ddc31e@suse.com>

This is a multi-part message in MIME format.
--------------yo4C76a0szgaZfAxZHH92FIz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/10/25 2:52 PM, Jan Beulich wrote:
> On 08.04.2025 17:57, Oleksii Kurochko wrote:
>> @@ -23,6 +24,11 @@ static inline cycles_t get_cycles(void)
>>       return csr_read(CSR_TIME);
>>   }
>>   
>> +static inline s_time_t ticks_to_ns(uint64_t ticks)
>> +{
>> +    return muldiv64(ticks, SECONDS(1), 1000 * cpu_khz);
>> +}
> Why the extra multiplication by 1000? I.e. why not
> "muldiv64(ticks, MILLISECONDS(1), cpu_khz)", getting away with just one
> multiplication and a reduced risk of encountering intermediate overflow
> (affecting only hypothetical above 4THz CPUs then)?

Multiplication by 1000 was needed to convert khz to hz, but yes, your option
would be better.

>
>> --- a/xen/arch/riscv/time.c
>> +++ b/xen/arch/riscv/time.c
>> @@ -4,10 +4,17 @@
>>   #include <xen/init.h>
>>   #include <xen/lib.h>
>>   #include <xen/sections.h>
>> +#include <xen/types.h>
>>   
>>   unsigned long __ro_after_init cpu_khz; /* CPU clock frequency in kHz. */
>>   uint64_t __ro_after_init boot_clock_cycles;
>>   
>> +s_time_t get_s_time(void)
>> +{
>> +    uint64_t ticks = get_cycles() - boot_clock_cycles;
>> +    return ticks_to_ns(ticks);
> Nit: Blank line between declaration(s) and statement(s) please, as well as
> ahead of the main "return" of a function.
>
> Happy to make both adjustments upon committing, so long as you agree; then:
> Reviewed-by: Jan Beulich<jbeulich@suse.com>

I'll be happy with that.

Thank you very much.

~ Oleksii

--------------yo4C76a0szgaZfAxZHH92FIz
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
    <div class="moz-cite-prefix">On 4/10/25 2:52 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:7f26a9cb-a685-4a2a-a470-8c5e94ddc31e@suse.com">
      <pre wrap="" class="moz-quote-pre">On 08.04.2025 17:57, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -23,6 +24,11 @@ static inline cycles_t get_cycles(void)
     return csr_read(CSR_TIME);
 }
 
+static inline s_time_t ticks_to_ns(uint64_t ticks)
+{
+    return muldiv64(ticks, SECONDS(1), 1000 * cpu_khz);
+}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Why the extra multiplication by 1000? I.e. why not
"muldiv64(ticks, MILLISECONDS(1), cpu_khz)", getting away with just one
multiplication and a reduced risk of encountering intermediate overflow
(affecting only hypothetical above 4THz CPUs then)?</pre>
    </blockquote>
    <pre>Multiplication by 1000 was needed to convert khz to hz, but yes, your option
would be better.

</pre>
    <blockquote type="cite"
      cite="mid:7f26a9cb-a685-4a2a-a470-8c5e94ddc31e@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/time.c
+++ b/xen/arch/riscv/time.c
@@ -4,10 +4,17 @@
 #include &lt;xen/init.h&gt;
 #include &lt;xen/lib.h&gt;
 #include &lt;xen/sections.h&gt;
+#include &lt;xen/types.h&gt;
 
 unsigned long __ro_after_init cpu_khz; /* CPU clock frequency in kHz. */
 uint64_t __ro_after_init boot_clock_cycles;
 
+s_time_t get_s_time(void)
+{
+    uint64_t ticks = get_cycles() - boot_clock_cycles;
+    return ticks_to_ns(ticks);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Nit: Blank line between declaration(s) and statement(s) please, as well as
ahead of the main "return" of a function.

Happy to make both adjustments upon committing, so long as you agree; then:
Reviewed-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a></pre>
    </blockquote>
    <pre>I'll be happy with that.

Thank you very much.

~ Oleksii</pre>
  </body>
</html>

--------------yo4C76a0szgaZfAxZHH92FIz--

