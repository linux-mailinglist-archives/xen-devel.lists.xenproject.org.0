Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 197B9AA927C
	for <lists+xen-devel@lfdr.de>; Mon,  5 May 2025 13:56:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.976055.1363304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBuQj-0005CU-Q0; Mon, 05 May 2025 11:56:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 976055.1363304; Mon, 05 May 2025 11:56:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBuQj-0005Ac-NE; Mon, 05 May 2025 11:56:17 +0000
Received: by outflank-mailman (input) for mailman id 976055;
 Mon, 05 May 2025 11:56:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cdRb=XV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uBuQi-0005AW-8j
 for xen-devel@lists.xenproject.org; Mon, 05 May 2025 11:56:16 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1e63c2a-29a7-11f0-9eb4-5ba50f476ded;
 Mon, 05 May 2025 13:56:14 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-acae7e7587dso691501066b.2
 for <xen-devel@lists.xenproject.org>; Mon, 05 May 2025 04:56:14 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-69-225.play-internet.pl.
 [109.243.69.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1894c022bsm477030766b.89.2025.05.05.04.56.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 May 2025 04:56:13 -0700 (PDT)
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
X-Inumbo-ID: f1e63c2a-29a7-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746446174; x=1747050974; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kq8FQfr0WeKKJCjisU3fxWI+DuWETWkFkZ7f6juxceg=;
        b=jRvSqw2Yr7WC1zt8beJeNSQUDbWmVItPZ3Fc68fUGgNrTZpI+djVnSVn0C/+WYC+vi
         jFgdVZumM9Y74OJvdO+5g0gTHS38o8uSAPT8OmEunUqSPFwN2CVFpAyK8l6cVkOBwC6r
         eFZxjnyNhuMfl9yfAZFQK758yw9bdmbuOU+3/uOChK0TONuOulThvodWT1Pt11+gNk6T
         IAvD7G2RwzW4m4gHbb5iU+lGXhYqO1MxyHzrHhE7E4uGfiJz3L6l1kua+PN5UQLv8LzI
         C0C9BBR6cT5vrKM6qmxTnd11MvrGXtv3GfL3hJem9tLgPg8jzguPDY9garC6EFZ/++XK
         Odgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746446174; x=1747050974;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kq8FQfr0WeKKJCjisU3fxWI+DuWETWkFkZ7f6juxceg=;
        b=tpLzd1L7kYgr8EW5d/LpP1N8p+zg49gM4hnun4HvQVITOEl6drMRJg+ep2gwXkfS8E
         kauYQMrngFsmMIpc4Bixia7mlhEohUMhHGQJaVsf9TdXJlBa80frTGkWBiI9oECzmsPG
         maxEK1JsHQUjit+4fKcJv9f4yvppzfulDmgHjhMOzkg+Me8RacwM4HehSWudHWxFNppb
         vg5VmnzGm6ZlWkTjIKwDMaLFiheNavbPEamzx0sqGMZCVX1UnzHPx2OhkLCMygFnPEaK
         4eH84beSi5mklUqan4GynMwv66DDw2pDazIA1FrOkUiWl4Vgpg3UUpXqWwizZ/Vf/agF
         JDyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXbCqZtoW7nHsLXvRdikfZAGb1sR94i7ueojwi74E27txoacF3s2hWeSzsudlD+QEkXyY28+vF1G4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzypt8VnLmHopBYv7SQMR76u3fITEs8Vuk8fWcsQS78VSQG8z+A
	W5Bkxh5fWt8Rq358m0a61iA4X3oeytwo0IAmd++DzSq1yn6l77P9
X-Gm-Gg: ASbGncvG3zHuOMlA1qgvgHq39WJ2rLHVHbsidIgYe/56S0DAxpKGzgdcvyGkoDxYXYO
	EBULi4irDj0uPoe7e450U8jWi24AoT9KXDkjViBeT2lOBU/oGn0S5kWvqovekwgaTSsRp03olj1
	4iuKmAmv2bWUiJpQkyV5X1qG5S2w5DWCOxv+2jeXi4+AfasG3BtrLsAF7/0rY9UioQPzmmN7HBO
	1jf1dvdHUCuUZBq6PhSeI50K3ooU32uuMx9WzVMtTl0KZkLL9xT0ERs5wvJx0+yG8g2JSz/rhpc
	f8q0qwOnBoGu7b9Lg+BGmsin2pgjdLjVThX0uDKxSfuiWEb7hukWEZorqouljxybDMSKeU19LL1
	Y8149lHQgO9nMcSC1
X-Google-Smtp-Source: AGHT+IFMXlE81FNBLcQpMsjfS2JkJFfW54rZiWbQyl9SyOFAJJDaBFsmKVORMa1S2Fq0B1z7/igoNA==
X-Received: by 2002:a17:907:25c6:b0:ace:6d53:3da3 with SMTP id a640c23a62f3a-ad1a493159dmr539798266b.23.1746446173668;
        Mon, 05 May 2025 04:56:13 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------ZvohIC1AKe8bsEWLb3jw92ev"
Message-ID: <4616ca34-d6c1-4f63-8a27-8bd3ab40f879@gmail.com>
Date: Mon, 5 May 2025 13:56:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] asm-generic: move parts of Arm's asm/kernel.h to
 common code
To: "Orzel, Michal" <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1746199009.git.oleksii.kurochko@gmail.com>
 <0c16f8fb2702db5fd6751c7da347a97caa431002.1746199009.git.oleksii.kurochko@gmail.com>
 <468fa57c-7e64-4a52-bfac-1280fbab4aee@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <468fa57c-7e64-4a52-bfac-1280fbab4aee@amd.com>

This is a multi-part message in MIME format.
--------------ZvohIC1AKe8bsEWLb3jw92ev
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/5/25 11:08 AM, Orzel, Michal wrote:
> On 02/05/2025 18:22, Oleksii Kurochko wrote:
>> Move the following parts to common with the following changes:
>> - struct kernel_info:
>>    - Create arch_kernel_info for arch specific kernel information.
>>      At the moment, it contains domain_type for Arm.
>>    - Rename vpl011 to vuart to have more generic name suitable for other archs.
> Why do you want to make it common? At the moment it referres to vpl011 which is
> Arm specific, so it would be better to move it to arch specific struct. Also,
> there can be more than one emulated UART (especially if you want to make the
> parsing of vuart common), in which case enum would be the best fit.

Good point. Actually, vuart/vpl011 could be moved to arch specific struct as
it doesn't used in common code anyway.

Thanks!

~ Oleksii

--------------ZvohIC1AKe8bsEWLb3jw92ev
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
    <div class="moz-cite-prefix">On 5/5/25 11:08 AM, Orzel, Michal
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:468fa57c-7e64-4a52-bfac-1280fbab4aee@amd.com">
      <pre class="moz-quote-pre" wrap=""><pre wrap=""
      class="moz-quote-pre">On 02/05/2025 18:22, Oleksii Kurochko wrote:
</pre><blockquote type="cite" style="color: #007cff;"><pre wrap=""
      class="moz-quote-pre">Move the following parts to common with the following changes:
- struct kernel_info:
  - Create arch_kernel_info for arch specific kernel information.
    At the moment, it contains domain_type for Arm.
  - Rename vpl011 to vuart to have more generic name suitable for other archs.
</pre></blockquote><pre wrap="" class="moz-quote-pre">Why do you want to make it common? At the moment it referres to vpl011 which is
Arm specific, so it would be better to move it to arch specific struct. Also,
there can be more than one emulated UART (especially if you want to make the
parsing of vuart common), in which case enum would be the best fit.</pre></pre>
    </blockquote>
    <pre>Good point. Actually, vuart/vpl011 could be moved to arch specific struct as
it doesn't used in common code anyway.

Thanks!

~ Oleksii

</pre>
  </body>
</html>

--------------ZvohIC1AKe8bsEWLb3jw92ev--

