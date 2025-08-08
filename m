Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6F4B1E57D
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 11:17:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1074181.1436856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukJDj-00064g-E7; Fri, 08 Aug 2025 09:17:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1074181.1436856; Fri, 08 Aug 2025 09:17:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukJDj-000636-BQ; Fri, 08 Aug 2025 09:17:03 +0000
Received: by outflank-mailman (input) for mailman id 1074181;
 Fri, 08 Aug 2025 09:17:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2rj7=2U=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ukJDh-00062v-DM
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 09:17:01 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70065d9e-7438-11f0-b898-0df219b8e170;
 Fri, 08 Aug 2025 11:16:59 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-61580eb7995so4045855a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 08 Aug 2025 02:16:59 -0700 (PDT)
Received: from [192.168.1.17] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a9115562sm13474676a12.59.2025.08.08.02.16.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Aug 2025 02:16:58 -0700 (PDT)
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
X-Inumbo-ID: 70065d9e-7438-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754644619; x=1755249419; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dsFLNMXueMtZJuH6skzEsGzdNwMqOBracJK+aOQpVEE=;
        b=BL3HPSkWYbkt47XFcZIeO0NEODvAHUpuTqEMqiX8sLiw6RsvJjJuoLl2m3g9ib8UaD
         Ep7xla1ZmzYJf0n0LjO4FE+uSggRyTwT+OfDRNyUuBuzH69hT+Rc6T5V6ssQZ+o2GyVR
         vU21cplKO7Od22jgO3L1tNCGEw0lW8Vuk6e1CiLfD9UsvixbAba+iWurPVBf4Gdl4jqk
         VnvQVT95hi+ipWSnQXcVTxQswCD8LB/7RJG8DUoRjKH0Dt4PlyhCdQPCdhd3NwLkt8UI
         Mkn/vZMlZFL0hGK/smXG9PLO0uV2EUPM0/2gXOU2Vbquzu6ns/Fn9DwuPGph96XrOk5L
         6/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754644619; x=1755249419;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dsFLNMXueMtZJuH6skzEsGzdNwMqOBracJK+aOQpVEE=;
        b=q7kFfaHn65m39ijkEnlCdetlpsNfZfVSGmh54/jtqPKekhEVeaouJTrTv/kDHZYr8r
         4AbAqnwfdJIdGwgpODppDYdNdJ0eBiuqWQvWB3XyN3OSkB/qNsm5hPdIS+/mRUqC/c6S
         7GJUG/cVnR4LggRswn9qzkPee0HK85xszUogxH65LtwNHvEo7sjSc3c7PwLVeUcr3szK
         Kcbt8c1tD0E75pGgiD8uMxphn93xdMNl7Nr33MRj6iTrFjtBpSUTxUDvtBarO+Ymo6LV
         JVcJ/WVwjma1AkPjdqDGFQwXcYY+xpxzPErdnkrdBLAV4ZvtvwOiIdzUKSmn8xNkwk7z
         ZwNg==
X-Forwarded-Encrypted: i=1; AJvYcCV6lYdVxHDWGlz5TRt8jzOG2qNBgzUHkPMaWVH2kk5+Y6qjyfRuurhml3Gak8pluAvTs9B4WKrJ5Gs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzesNJzhn3u3RG/0IHYrvFie/fSvkjId/mt5jF0OzAYLT9q2HPj
	VKNqxgHNI/53c+nebMriF0n1pdYxoa3kL0Z9GpXXiVF7f485Bp38ejrq
X-Gm-Gg: ASbGncue6kLeDNjUkrpz5tw1Hw9CvjzBQJiaKmBvW3TrM37QzucNHxJrp/JFxxymIIR
	zYEsYbt9RhjP0j2ezlwBbtSEeskCe9zRZ8Lnb7IqhBl+EwHDfWL0lgxWEeyba4E3FMs9rSQiglw
	J2bjJODWAoiHUT7dMcb2reVN6psek2cdcOEdElQ3Qq2RFLnehcOet7BXDo/kiLTeMu9kcNkaTHK
	bCk9ul0aBP3vNqdcOJ05UpxIdZzCcb3s04m8sjldxptM5ekMc87K6Q6fO9pYqdKuSqDJiDxM9Jb
	GUonz8ewp4ye3Yt5dMgyWIZmsXBciUw4gYJ3V/GOJys/DysckFW+HWJ8g7EdUJeXh3AxOUXEePB
	LcqvOVL3kpjyFjvSzv9eMDMrle+SbctXYzF43Fp7D7/8kLRtVVoHKKq+bwm6P2Ucp0n0+WglW0O
	b+QercDIc=
X-Google-Smtp-Source: AGHT+IGbSh3Q0jVeTL1ILLSqirnBbHP9K9hms+Nwg/fKDBChZxxxbEqoJZfExrXJPgqq8eV18IrApA==
X-Received: by 2002:a50:9ece:0:b0:615:7e88:ef95 with SMTP id 4fb4d7f45d1cf-617b37dab62mr3382839a12.11.1754644618765;
        Fri, 08 Aug 2025 02:16:58 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------4voFqTaAumBVl3v4Ha3017VV"
Message-ID: <b30d4be6-e7d8-4996-9ce3-3514fb05d7b5@gmail.com>
Date: Fri, 8 Aug 2025 11:16:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/20] xen/riscv: introduce
 page_{get,set}_xenheap_gfn()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <5aa3beb7fc0b7fc7f4d6d07ae25f37d44fc38858.1753973161.git.oleksii.kurochko@gmail.com>
 <eb865048-ec3a-479e-a552-b19fc57b6786@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <eb865048-ec3a-479e-a552-b19fc57b6786@suse.com>

This is a multi-part message in MIME format.
--------------4voFqTaAumBVl3v4Ha3017VV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/5/25 4:11 PM, Jan Beulich wrote:
> On 31.07.2025 17:58, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/include/asm/mm.h
>> +++ b/xen/arch/riscv/include/asm/mm.h
>> @@ -12,6 +12,7 @@
>>   #include <xen/sections.h>
>>   #include <xen/types.h>
>>   
>> +#include <asm/cmpxchg.h>
>>   #include <asm/page.h>
>>   #include <asm/page-bits.h>
>>   
>> @@ -247,9 +248,17 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
>>   #define PGT_writable_page PG_mask(1, 1)  /* has writable mappings?         */
>>   #define PGT_type_mask     PG_mask(1, 1)  /* Bits 31 or 63.                 */
>>   
>> -/* Count of uses of this frame as its current type. */
>> -#define PGT_count_width   PG_shift(2)
>> -#define PGT_count_mask    ((1UL << PGT_count_width) - 1)
>> + /* 9-bit count of uses of this frame as its current type. */
> Nit: Stray blank at start of line.
>
>> +#define PGT_count_mask    PG_mask(0x3FF, 10)
> A 9-bit count corresponds to a mask of 0x1ff, doesn't it? With 0x3ff the count
> can spill over the type.

It should be really 0x1ff, thanks.

~ Oleksii

--------------4voFqTaAumBVl3v4Ha3017VV
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
    <div class="moz-cite-prefix">On 8/5/25 4:11 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:eb865048-ec3a-479e-a552-b19fc57b6786@suse.com">
      <pre wrap="" class="moz-quote-pre">On 31.07.2025 17:58, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -12,6 +12,7 @@
 #include &lt;xen/sections.h&gt;
 #include &lt;xen/types.h&gt;
 
+#include &lt;asm/cmpxchg.h&gt;
 #include &lt;asm/page.h&gt;
 #include &lt;asm/page-bits.h&gt;
 
@@ -247,9 +248,17 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
 #define PGT_writable_page PG_mask(1, 1)  /* has writable mappings?         */
 #define PGT_type_mask     PG_mask(1, 1)  /* Bits 31 or 63.                 */
 
-/* Count of uses of this frame as its current type. */
-#define PGT_count_width   PG_shift(2)
-#define PGT_count_mask    ((1UL &lt;&lt; PGT_count_width) - 1)
+ /* 9-bit count of uses of this frame as its current type. */
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Nit: Stray blank at start of line.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+#define PGT_count_mask    PG_mask(0x3FF, 10)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
A 9-bit count corresponds to a mask of 0x1ff, doesn't it? With 0x3ff the count
can spill over the type.</pre>
    </blockquote>
    <pre>It should be really 0x1ff, thanks.

~ Oleksii</pre>
  </body>
</html>

--------------4voFqTaAumBVl3v4Ha3017VV--

