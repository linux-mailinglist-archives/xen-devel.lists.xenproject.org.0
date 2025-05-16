Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AD0AB977D
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 10:24:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986523.1372070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFqMf-0002mv-96; Fri, 16 May 2025 08:24:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986523.1372070; Fri, 16 May 2025 08:24:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFqMf-0002lP-61; Fri, 16 May 2025 08:24:21 +0000
Received: by outflank-mailman (input) for mailman id 986523;
 Fri, 16 May 2025 08:24:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n8HW=YA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uFqMd-0002lH-Ma
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 08:24:19 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28a1e68b-322f-11f0-9ffb-bf95429c2676;
 Fri, 16 May 2025 10:24:17 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a0b9af89f2so1148204f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 01:24:17 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca8d130sm2065996f8f.95.2025.05.16.01.24.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 01:24:16 -0700 (PDT)
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
X-Inumbo-ID: 28a1e68b-322f-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747383857; x=1747988657; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yyDVuf0qkfkehxoWw8Xm+qymKJHEo8e6iJFeTQOCrSY=;
        b=gLhV0YbeyD/R+X1T3VYQQ2GQSotiA9FYaCy2lRvJsbDHgR3KW0AGyu9e85+jbAJKuE
         EMwFsVtu8l1CO7Y6uJ40iID8Xh9/WfU0QbU9wg3kQrN/VR15pRyNw3iARTNNce5CpCfN
         Fr175fwTB/7FAIVqJ4oZE/G7aTehnav++9biTb5MFJyUlTypy5iaY2cO2ulg/Bv/rZ74
         4SZS2o5BObY60dyyDjyScpMJTG72d3hHkhcAG1nstDRaopqruWeCl2X3/z2XSZ9KmNgF
         JXoM28MSpXpdhht151p2c31weGk7vbFMk7K9GvdKMWzK+adUx4LiwKli7wmDZ6D6E+WK
         yQgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747383857; x=1747988657;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yyDVuf0qkfkehxoWw8Xm+qymKJHEo8e6iJFeTQOCrSY=;
        b=jpexkVNA/Kto+6GH8o/tmy15S63GrvVKGxZHJP57s4KHtnjTENG5tZq9ELXhFtn/oc
         om0rEt5yQcTbJOx07XFyFbn7L0cyrTFk05EBUf6qt/RMTMzwsJT2Vxv60ZEn6h8YW53w
         pOH4eWEvjg+33Usk9XKO8+Dp/FcPUUzrbAkOGNaXF71yHe5P2Dj474aS0oi+ikUcCqWf
         cH37U2bqAd3lZ4/9yc7mh10pilsZA3o62Htc7R3fijrmTP3BJfdavMBtJBK5br+RuwFJ
         8e1FJdhahXdJZbHp0c2vmOThZaF27/f9U3F3qZ8KNz0ruGm9Uuxvv3/tFtckEj4Rll2A
         rlKg==
X-Forwarded-Encrypted: i=1; AJvYcCVS1ZKdT6d0SDCb7/0fr7zgYkBUB9wG2IhOuflI43XFyKoTnEJQ+TEJWUsbyWxF5lJm6ctDwKvzTiQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzOJv2H7phf7wv1evHBq65IAgBRCOJfPyBWnljpJaOeuNYi0G+X
	pWhkB5AQ05er18FmANUP48myOfXwJ49y8munaJey04ESWGeqdGAfB3dJ
X-Gm-Gg: ASbGncsQHOIN4viFaoGH56Sx/r2xIejqh0Q0ni33RDCv0zt5C8LJnliuZrgmUf97xwx
	5fYUsQJNGl8aMOEIdmJMeG22MDQuZcmaUaPSCDkVfAImsqmCSLyCAKfuMfHF0re2qgPB3SYYRx2
	XmToDl9lwCndhzK+JPSVlwmd4u2BoqS8ERuMb3k/RzkfeKbA0Ii+j2CP4WK0gqHk0aA8pu+a1mU
	RNd5S2/EKFp44BLfnQmp90J5ynntRl3J2QXnU8R2mpkvf8S53bBntEQAquEhcmN4LMxWg6TitZC
	nSVxlUSVaSmn0dFpfCeHdKvAXCWHKSDmE5UC7kSy1FvlC0GI9tOnR2DXs7COmPdn8B1HcMlq9zG
	9ldn0karwZ24MOvoGRpi/uf5I
X-Google-Smtp-Source: AGHT+IEM5s8CB2USe78YYsmQSIZTz0iVYGxQ1MEOJab11Ei+HKVGSuCqX+YISwwAyHvx/jqdmKts0g==
X-Received: by 2002:a05:6000:290d:b0:3a3:5bf8:3709 with SMTP id ffacd0b85a97d-3a3600dc277mr1300021f8f.56.1747383856788;
        Fri, 16 May 2025 01:24:16 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------q3Tho88j40DcoSNjc6IBRjhx"
Message-ID: <23156520-4252-4db3-b0f7-5bcd000bc677@gmail.com>
Date: Fri, 16 May 2025 10:24:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/16] xen/riscv: introduce smp_prepare_boot_cpu()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1746530883.git.oleksii.kurochko@gmail.com>
 <704550ffbb34c94bfe85be928b2fcc0105552e82.1746530883.git.oleksii.kurochko@gmail.com>
 <3e849625-582a-4e5e-b2c2-b3eb16aae857@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <3e849625-582a-4e5e-b2c2-b3eb16aae857@suse.com>

This is a multi-part message in MIME format.
--------------q3Tho88j40DcoSNjc6IBRjhx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/13/25 5:48 PM, Jan Beulich wrote:
> On 06.05.2025 18:51, Oleksii Kurochko wrote:
>> @@ -72,6 +72,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
>>   
>>       remove_identity_mapping();
>>   
>> +    smp_prepare_boot_cpu();
>> +
>>       set_processor_id(0);
>>   
>>       set_cpuid_to_hartid(0, bootcpu_id);
> Is this a good placement? I'd think that smp_prepare_boot_cpu() ought to be
> permitted to rely on set_processor_id() already having run, for example (even
> if right now there's no such dependency). Alternatively the set_processor_id()
> call may want to move into the new function?

Agree, logically it would be better to set processor id before smp_prepare_boot_cpu().

I'll move set_processor_id(0) inside smp_prepare_boot_cpu().

Thanks.

~ Oleksii

--------------q3Tho88j40DcoSNjc6IBRjhx
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
    <div class="moz-cite-prefix">On 5/13/25 5:48 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:3e849625-582a-4e5e-b2c2-b3eb16aae857@suse.com">
      <pre wrap="" class="moz-quote-pre">On 06.05.2025 18:51, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -72,6 +72,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     remove_identity_mapping();
 
+    smp_prepare_boot_cpu();
+
     set_processor_id(0);
 
     set_cpuid_to_hartid(0, bootcpu_id);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Is this a good placement? I'd think that smp_prepare_boot_cpu() ought to be
permitted to rely on set_processor_id() already having run, for example (even
if right now there's no such dependency). Alternatively the set_processor_id()
call may want to move into the new function?</pre>
    </blockquote>
    <pre>Agree, logically it would be better to set processor id before smp_prepare_boot_cpu().

I'll move set_processor_id(0) inside smp_prepare_boot_cpu().

Thanks.

~ Oleksii</pre>
  </body>
</html>

--------------q3Tho88j40DcoSNjc6IBRjhx--

