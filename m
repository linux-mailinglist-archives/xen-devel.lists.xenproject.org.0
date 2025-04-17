Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F88A918DF
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 12:12:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957318.1350463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5MDz-0006Ja-Ho; Thu, 17 Apr 2025 10:12:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957318.1350463; Thu, 17 Apr 2025 10:12:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5MDz-0006HD-F5; Thu, 17 Apr 2025 10:12:03 +0000
Received: by outflank-mailman (input) for mailman id 957318;
 Thu, 17 Apr 2025 10:12:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uBz4=XD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u5MDy-0006H5-87
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 10:12:02 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67525381-1b74-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 12:12:01 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-abbd96bef64so98384366b.3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 03:12:01 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acb3d128cedsm262826166b.123.2025.04.17.03.11.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 03:12:00 -0700 (PDT)
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
X-Inumbo-ID: 67525381-1b74-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744884721; x=1745489521; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ai3wsBVVZRiOatKoqkD7LHE+athJzCL4+d1xenPHLJQ=;
        b=K3XsiOcrrbmszIK5+UqrtwRDgz3DmPueZNgMnaiLKlCUUkws6/yTgqm/jpttkemrpu
         5dZieoT7Lx0dPjlcesVVH8bPmZdpBQJgILM/VE/R4XOkNCQrs+4gsfIG1GInWDBh8T0O
         T8FtgFbh4w3aezHZctDkE8KZB3gUxM2/6Yj1LbbEyaa3lfZ3EXPaEx47+6enYQDYE6uc
         LmWne+coMP/YvVcI7IQUF1vK/OkqQRaU0qp1Pkkpq6r1YnpFHzQUB34AvDR4ORMSArdy
         1Rxzsbjy33e7e0wT1VrwS73GltzFzrQpwNIPyNQGbix90jJ/cPrWmlvHeHApfJaq5/XE
         gjuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744884721; x=1745489521;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ai3wsBVVZRiOatKoqkD7LHE+athJzCL4+d1xenPHLJQ=;
        b=uSSUSesMIwodAjvLEnPqyR+z32Y/fgYVrU0lA3uZdaOkPphYlL1/eX0cXZTjc19k8C
         st3xqoeBfvUhfCrVkceD2M47UR16ocMRwIonlAdA0+261qdTEtFCamxczIRF90R2jUDE
         skDHTsrPSLGjr94hFuBprUxiwM8zmI3FHiLTNtN3C4fwcN67khTl1bnqqq2O5upBSzzp
         hATWFRnuEigcZgksrbDJFCgB5VGJ0JDidrOdONiwpGnGo21eSZJ6/j8kabY4GrUj0ZjG
         tvhfakHzexihRj5D4WO78X8MU1YG76UUK1umSvgCkvmosln3Jk0lAB0+DpvXrNstMz/o
         GxuQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4vE5MzGTDnVWG3BTQMkcGEpqFFHFoQBHqnHf3fIeCw0pCYmEcZBbbo/A5T/Y25uMDsw5Rbupanyc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzZMtFgxfj7wptp9x76z0Mh4Vot7IvBrjTmzNRRwOVaV2R5nkjz
	ueOh9AzKK7btroy6tvvCyiJ+7yvDcKSlojAI2Ix1dBNOhZ9ZJGP2y7+E8Q==
X-Gm-Gg: ASbGncvWd1Z/bU5RPuGbsA/w1fjd+pqkzOZujlD6MwFQbg3oshLkOcTGorpUSpjIS5H
	LEdlke+srYPvoAxuPx0jki4ch+GgRFlCMah1JwgOgPBgXRoMXY4jaJetlFOhVL5v3eyWbNH+xtA
	mF8wjTri9pCbNAe81IBk5iWMDzAeylEJMxRC0Q8Z5tuI4hjM9XzZd+vixfQS+ayq7dD7mDEI/JB
	zsLoxXQqkBuZB29TdBYn79t/vAEd9eJZYQgmsaAqpsjJ91iG1TSGMbhupcGdUuoEEznl7J2RNow
	ieVYVcymCxyJvXfiICRCh/vR2rkjNBuOA6GdqIHx6uURA14HsRCiVxZ+Uxv+72d2q6RV3aBW99M
	4xwIlmiwD6BplkqvU
X-Google-Smtp-Source: AGHT+IFHwjaVhiwMfVLTYDO6aCPOEy3lqYrEngluVifpziAVyDz3QVy5nBPK4pHoQRO45AWjQ+XrPw==
X-Received: by 2002:a17:907:bc90:b0:acb:4cd7:2963 with SMTP id a640c23a62f3a-acb4cd7329cmr347753866b.33.1744884720477;
        Thu, 17 Apr 2025 03:12:00 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------uuLNrlaOPQ8Me7ICZc0Tsul6"
Message-ID: <4851cd30-73a5-4d97-b506-850d67c285d7@gmail.com>
Date: Thu, 17 Apr 2025 12:11:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 13/14] xen/riscv: initialize interrupt controller
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
 <cb730a1293f14dd7fd58f98f5ecda4e2523b2d90.1744126720.git.oleksii.kurochko@gmail.com>
 <bcffc56a-5518-4bcc-9124-d49a98ae727a@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <bcffc56a-5518-4bcc-9124-d49a98ae727a@suse.com>

This is a multi-part message in MIME format.
--------------uuLNrlaOPQ8Me7ICZc0Tsul6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/15/25 5:59 PM, Jan Beulich wrote:
> On 08.04.2025 17:57, Oleksii Kurochko wrote:
>> Call intc_init() to do basic initialization steps for APLIC and IMISC.
>>
>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
> Acked-by: Jan Beulich<jbeulich@suse.com>
> yet ...
>
>> --- a/xen/arch/riscv/setup.c
>> +++ b/xen/arch/riscv/setup.c
>> @@ -136,6 +136,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
>>   
>>       intc_preinit();
>>   
>> +    intc_init();
>> +
>>       printk("All set up\n");
>>   
>>       machine_halt();
> ... this being everything here I wonder if this can't be folded with the
> patch where the function is introduced.

Sure, it can be folded. I will do that to reduce patch series.

~ Oleksii

--------------uuLNrlaOPQ8Me7ICZc0Tsul6
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
    <div class="moz-cite-prefix">On 4/15/25 5:59 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:bcffc56a-5518-4bcc-9124-d49a98ae727a@suse.com">
      <pre wrap="" class="moz-quote-pre">On 08.04.2025 17:57, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Call intc_init() to do basic initialization steps for APLIC and IMISC.

Signed-off-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Acked-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
yet ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -136,6 +136,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     intc_preinit();
 
+    intc_init();
+
     printk("All set up\n");
 
     machine_halt();
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... this being everything here I wonder if this can't be folded with the
patch where the function is introduced.</pre>
    </blockquote>
    <pre>Sure, it can be folded. I will do that to reduce patch series.

~ Oleksii
</pre>
  </body>
</html>

--------------uuLNrlaOPQ8Me7ICZc0Tsul6--

