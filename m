Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BBDAD5226
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 12:40:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011462.1389896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPIrJ-0007f8-Fw; Wed, 11 Jun 2025 10:39:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011462.1389896; Wed, 11 Jun 2025 10:39:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPIrJ-0007cP-DB; Wed, 11 Jun 2025 10:39:05 +0000
Received: by outflank-mailman (input) for mailman id 1011462;
 Wed, 11 Jun 2025 10:39:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/mXZ=Y2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uPIrI-0007cJ-9M
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 10:39:04 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4adeff2e-46b0-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 12:39:03 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-604bff84741so12302857a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 03:39:03 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade1dc1c87esm881733266b.107.2025.06.11.03.39.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jun 2025 03:39:02 -0700 (PDT)
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
X-Inumbo-ID: 4adeff2e-46b0-11f0-a307-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749638343; x=1750243143; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ijH0RIOfhByEJpympgF+ymn1CM6wgXAooij3e84izYA=;
        b=ANb8c793tURNpJsztWWDCrgGFt3Dn5ITOhWEZrqGFvQ7mTsMwVEPJfU5qR6QnKha2I
         QSufANjOVBP7juoAvPh2KJu+ZcFi7hLR9QFS3CpRtU7hMU/syH6cgaHIq8w0cmSlV6gd
         uA1yrI/nZzUdh1c40R1phZV9AiuYydsK04iG/YcuJN8BGHRbG9f2o9i5c3fOh2B+QuEk
         sD/bj1GK9KNY1jF6MSm9uWDju9nAlifk7AycnG+lK/nOINzqasW3OLeEiKD4LuPzwFOV
         Cjl20S/2ZyuZuq+GC+k/Yeh1LsPCuvAIw+I9f6zvVHge3RKpnVw3FxOkm4E6bk3dDJwU
         AP4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749638343; x=1750243143;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ijH0RIOfhByEJpympgF+ymn1CM6wgXAooij3e84izYA=;
        b=nkqhiIF9DoSNjtoY5RR9PKX7rJfviSkfg5efaXnNzZg50YHFJYY3Ja57YvkTn2kKrJ
         zZZNjkwd3PU0dnpUSvrpBa27mq+0F5mJzJleQQ2otyzAqFQw72GpHnKyQ8HSNS8iG6xe
         4sg47HK5h5cLn2Zr0YhpkwV47Gt4/xuZA6keF3ON2DXU5gXEuPYcGwQDhcE5Fto86ybF
         qVGpH4zwuJMVrcAycBFxtF2LPwEowTtgTGs/J/zVFEcEqpwXtPKja2rO+wmMetIxqkQn
         +2Vm8bosZqnj/HrGa0dK2Km4yMl5/hFgg/MEU+fqXOn2SNA4bg06kK2zyXKnN1ZdbS51
         2NiA==
X-Gm-Message-State: AOJu0YxL+9unIO6twRGKukqHO4vjFh568akd2iiCk7Ozqr7rVcdBiSS7
	0g1G5qB7JZapvSjv6fyvj9mh247L7XRzdOaDXv612rHiONChcw42Lge4
X-Gm-Gg: ASbGncst41Sw6M5Smlh3dghbjoLRvcSHobptASD4GWAxtLcSlNqiLPcFAmZAbSqERUe
	JcJaSQPJ6ZxuhZ0eE74g/Dwte0/oBlNDKVcSHtNqgDXA31+V7BnVWQPsK6gpQh0AwUSs1QlMgo0
	EKTnIwR3GXKvNLizNX4y8tD9LQiPPzaxoYF/xBkGtcJ2vDdm4utrMO7D385YvsI9yoCM1KEjoTh
	m54PWbxGrU/3P7fpeRC6vRmpqmXadTCcezVElaf90lqQMj/P6aneqj7vK8Hc8zf9xZoq5i7NltF
	kSe0CzOsYlCQcnqisHDPkrPfsIXk0jnhEF/DlrTVeN69MUgJ+TBoXHKNlcrPc3hXL93X+QHj8KS
	aT8xc1XoDjOn3o5/dEVvHfkdiWrUQ9kjw/zE=
X-Google-Smtp-Source: AGHT+IF03mSQmMrdyOIot75ldt0+oTBbrVCxcnprMbhTaR5lQcAqLeilUUTyUZOm4bo7QWdtZKe4LQ==
X-Received: by 2002:a17:906:c114:b0:ad4:fd7f:a4 with SMTP id a640c23a62f3a-ade8c8c2d36mr206145766b.47.1749638342388;
        Wed, 11 Jun 2025 03:39:02 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------tzJUobWi6u0Z69yXIKNM8kCo"
Message-ID: <4fb007fd-3a87-4a12-ae73-15870d7bae42@gmail.com>
Date: Wed, 11 Jun 2025 12:38:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen 4.21 Development Update [May]
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 Mykyta Poturai <Mykyta_Poturai@epam.com>, Juergen Gross <jgross@suse.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Luca Fancellu <luca.fancellu@arm.com>, Jason Andryuk
 <jason.andryuk@amd.com>, Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Sergii Dmytruk <sergii.dmytruk@3mdeb.com>, Penny Zheng
 <Penny.Zheng@amd.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Roger Pau Monne <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, dmkhn@proton.me,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Grygorii Strashko <gragst.linux@gmail.com>,
 Alejandro Vallejo <agarciav@amd.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Community Manager <community.manager@xenproject.org>
References: <7364a71d-2604-49ca-bab7-d21544d49b10@gmail.com>
 <CAGeoDV_2BSUaL+9=zVZpgOi6vC6fcEE2Rt0Du0mTPO3pyxrR7w@mail.gmail.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <CAGeoDV_2BSUaL+9=zVZpgOi6vC6fcEE2Rt0Du0mTPO3pyxrR7w@mail.gmail.com>

This is a multi-part message in MIME format.
--------------tzJUobWi6u0Z69yXIKNM8kCo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Mykola,

On 6/11/25 9:03 AM, Mykola Kvach wrote:
>> === ARM ===
>>
>> * SMMU handling for PCIe Passthrough on ARM (v11)
>>     - Mykyta Poturai
>>     -
>> https://lore.kernel.org/xen-devel/cover.1741958647.git.mykyta_poturai@epam.com/
>>     -
>> https://patchew.org/Xen/cover.1748422217.git.mykyta._5Fpoturai@epam.com/
>>
>> * xen/arm: scmi: introduce SCI SCMI SMC multi-agent support
>>     - Grygorii Strashko
>>     -
>> https://lore.kernel.org/xen-devel/20250311111618.1850927-1-grygorii_strashko@epam.com/
>>
>> * Add initial Xen Suspend-to-RAM support on ARM64 (v4)
>>     - Mykola Kvach
>>     -
>> https://lore.kernel.org/xen-devel/cover.1741164138.git.xakep.amatop@gmail.com/
>>     -https://patchew.org/Xen/cover.1748848482.git.mykola._5Fkvach@epam.com/
> I'd like to propose including initial support for Suspend-to-RAM in Xen 4.21.
>
> This feature enables Xen and its guests to enter suspend state via
> PSCI SYSTEM_SUSPEND. Xen suspend is triggered from the hardware domain.
>
> Support is currently Experimental.

Thanks for your feedback!

I saw that there are two patch series connected to Suspend-to-RAM topic:
-https://lore.kernel.org/xen-devel/cover.1748337249.git.mykola_kvach@epam.com/
-https://lore.kernel.org/xen-devel/cover.1748848482.git.mykola_kvach@epam.com/

So it seems like we should follow a progress for these two patch series in parallel.
Or the difference is that one of patch series is for connect to guest and another
to hardware domains.

Am I missing something?

~ Oleksii

--------------tzJUobWi6u0Z69yXIKNM8kCo
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hello Mykola,
</pre>
    <div class="moz-cite-prefix">On 6/11/25 9:03 AM, Mykola Kvach wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAGeoDV_2BSUaL+9=zVZpgOi6vC6fcEE2Rt0Du0mTPO3pyxrR7w@mail.gmail.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
=== ARM ===

* SMMU handling for PCIe Passthrough on ARM (v11)
   - Mykyta Poturai
   -
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/cover.1741958647.git.mykyta_poturai@epam.com/">https://lore.kernel.org/xen-devel/cover.1741958647.git.mykyta_poturai@epam.com/</a>
   -
<a class="moz-txt-link-freetext" href="https://patchew.org/Xen/cover.1748422217.git.mykyta._5Fpoturai@epam.com/">https://patchew.org/Xen/cover.1748422217.git.mykyta._5Fpoturai@epam.com/</a>

* xen/arm: scmi: introduce SCI SCMI SMC multi-agent support
   - Grygorii Strashko
   -
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/20250311111618.1850927-1-grygorii_strashko@epam.com/">https://lore.kernel.org/xen-devel/20250311111618.1850927-1-grygorii_strashko@epam.com/</a>

* Add initial Xen Suspend-to-RAM support on ARM64 (v4)
   - Mykola Kvach
   -
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/cover.1741164138.git.xakep.amatop@gmail.com/">https://lore.kernel.org/xen-devel/cover.1741164138.git.xakep.amatop@gmail.com/</a>
   - <a class="moz-txt-link-freetext" href="https://patchew.org/Xen/cover.1748848482.git.mykola._5Fkvach@epam.com/">https://patchew.org/Xen/cover.1748848482.git.mykola._5Fkvach@epam.com/</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I'd like to propose including initial support for Suspend-to-RAM in Xen 4.21.

This feature enables Xen and its guests to enter suspend state via
PSCI SYSTEM_SUSPEND. Xen suspend is triggered from the hardware domain.

Support is currently Experimental.</pre>
    </blockquote>
    <pre>Thanks for your feedback!

I saw that there are two patch series connected to Suspend-to-RAM topic:
- <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/cover.1748337249.git.mykola_kvach@epam.com/">https://lore.kernel.org/xen-devel/cover.1748337249.git.mykola_kvach@epam.com/</a>
- <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/cover.1748848482.git.mykola_kvach@epam.com/">https://lore.kernel.org/xen-devel/cover.1748848482.git.mykola_kvach@epam.com/</a>

So it seems like we should follow a progress for these two patch series in parallel.
Or the difference is that one of patch series is for connect to guest and another
to hardware domains.

Am I missing something?

~ Oleksii
</pre>
  </body>
</html>

--------------tzJUobWi6u0Z69yXIKNM8kCo--

