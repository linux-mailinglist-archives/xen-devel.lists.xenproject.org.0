Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12853C8B01C
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 17:38:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173097.1498185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOIWh-0006W9-GR; Wed, 26 Nov 2025 16:37:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173097.1498185; Wed, 26 Nov 2025 16:37:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOIWh-0006Ui-Ct; Wed, 26 Nov 2025 16:37:55 +0000
Received: by outflank-mailman (input) for mailman id 1173097;
 Wed, 26 Nov 2025 16:37:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K59t=6C=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vOIWg-0006Uc-6I
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 16:37:54 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40e409e4-cae6-11f0-9d18-b5c5bf9af7f9;
 Wed, 26 Nov 2025 17:37:53 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b739ef3f739so676149666b.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Nov 2025 08:37:53 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b766d386665sm1612890266b.53.2025.11.26.08.37.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Nov 2025 08:37:51 -0800 (PST)
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
X-Inumbo-ID: 40e409e4-cae6-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764175072; x=1764779872; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tS/pKReLatHsMGWTfXEMg3NYcFBNhlBAwxjHuNsie90=;
        b=Pd1n04knlfIU+AsGrw67XUuAS+Rnt202haLoHyGRMCCWT8tpveTe0tsYRt7jVU2Ir5
         T5RLZesIeKsTOpkoHwltd+YhmGkB4S3V59hSZOGTVI4EAWuOSEm7wDNyrouZjQ52uPbJ
         TEd0mQ6tVSIYzouiXCfGKnxk2j9lm+3Pm0PEJvJ2oLYSASY8GZZ7Cx8SxPrf+wZ6FIdr
         OgKPCb1g0FvnY7GfKSBXp2G7urxVkNitV0BJ2a7extuyGJBjHY8wueMnz6J7/ozyKCiO
         jR6Kop3eDPNkEubxQSrWiHilqpnj26i042MXU8JDh4d9QesUqzE7gVHA1inp3bhctI9k
         Jj+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764175072; x=1764779872;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tS/pKReLatHsMGWTfXEMg3NYcFBNhlBAwxjHuNsie90=;
        b=wOD84ZL5L1WI0Y5Ut9djm/nMs7/fBlPqv0/Z7TEgoc4h8dEiUbdBm25t46OsFzTT9e
         Bu8nPf902gaq7vY7hNO5a/FyywyjIF7jB3NbmmF78jkLOTQc/AdkzuIl3M7rEYakbfpR
         huwBVSvIgNk/wYiVk82cTHWLRmAi3fEPqSjvgHlhz58y/k5zfzVc/ybrcE8as+AnNYXq
         WGSuiQrcajJt8F7sLdRI41VZm1MEZcNeCXmiDikfdkwrRvrbyWtxbADjvAiOiZWz0vru
         lkua/6F6YsRGFmnIOQ6oe+Ddr5hwW6hb7ArCBHReKwqZKi7Hy8wNIdRfCVxuRJF8S/Q/
         o7Hw==
X-Forwarded-Encrypted: i=1; AJvYcCWZW4v6kN2R0eORr0siBoBxfrLbnA9mP61Inz/Fyzy1tlpL9Sl4pdp54XWAFS+Rl0zNaqsY6xebirs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzmwVbZzvkkPkWVL64gYIWbawJvvGjlyma7zgladOtBzkbEFGlh
	EVQ4AaGUXUcaNALt0JpaJRPTbiVaUrMUa1iFwacW7ocjhXCa9xp0ICI4
X-Gm-Gg: ASbGncupkRcRsnhqLXPeDGbZO055Fp1kMVwyDZkvIBqrJPTWb3CgB0Mf5BDKqsvI3ao
	9t0xc0TjgYV917j/uBK7BEnP8Wu7IcTDTKNp6Qo5pWGS9s579rCz7GVQGaue6BGdydlh/WxpV8t
	Ujt0q7kXO37ioAdIA5mvg952COxM2vV+KIZGjQX9N+jcE9GBIWaQhCK6LT3x+QPMRkNUp+EwO5h
	rtnqRZ8ABG2KVdFTmYLfCf/q/EFw3YWArWHSCp0ZQfsvlQBMvbo8u/R/zmd2Lcs5kaN9zfm4CX1
	iQ3SLOola1Y2JU9zQg0fiYx8LX47riO31WcTaAfCQ/PEY0Jn/484rbsicO67FJLIETq058kAKW0
	IHD8hM/fAHVO+vggrkrwj702TbHqZf0i3N9R9suygMCzPUUCmxySMxlwM+pETlAhgm17tonUwP/
	ex/7GOZ/PyBdO59RNmWC1ZBY3ypio7SCF+esNJfPXx1oDbv9F7CkdmuZqXU8gRUnVm
X-Google-Smtp-Source: AGHT+IHgenN/yaNpDODtBs7+7EYP/9LMWr/Bgg8q+gfOk7Dh7zDZHzElHm4ZtD1L2sOrsOWCAxvKZQ==
X-Received: by 2002:a17:907:7e9e:b0:b71:1420:334b with SMTP id a640c23a62f3a-b76c546da4bmr658491566b.8.1764175072064;
        Wed, 26 Nov 2025 08:37:52 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------SB5jDQiNuzlX7dmqmsAAhC70"
Message-ID: <7c66aaa5-bcc5-4da5-872f-8b8a690c9a24@gmail.com>
Date: Wed, 26 Nov 2025 17:37:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/domain: introduce generic functions for domain
 struct allocation and freeing
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <b5c703a64c616d6321f8a98cd28f0659838d41df.1764167337.git.oleksii.kurochko@gmail.com>
 <1930930f-d9a4-4ad2-b6b1-5c138227924f@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1930930f-d9a4-4ad2-b6b1-5c138227924f@suse.com>

This is a multi-part message in MIME format.
--------------SB5jDQiNuzlX7dmqmsAAhC70
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/26/25 4:19 PM, Jan Beulich wrote:
> On 26.11.2025 15:32, Oleksii Kurochko wrote:
>> --- a/xen/arch/x86/include/asm/pv/domain.h
>> +++ b/xen/arch/x86/include/asm/pv/domain.h
>> @@ -18,6 +18,9 @@ extern int8_t opt_pv32;
>>   # define opt_pv32 false
>>   #endif
>>   
>> +unsigned int arch_alloc_domain_struct_bits(void);
>> +#define arch_alloc_domin_struct_bits arch_alloc_domain_struct_bits
> There was an 'a' lost in the identifier.
>
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -799,6 +799,29 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
>>       return arch_sanitise_domain_config(config);
>>   }
>>   
>> +struct domain *alloc_domain_struct(void)
>> +{
>> +    struct domain *d;
>> +    unsigned int bits = 0;
>> +
>> +#ifdef arch_alloc_domin_struct_bits
>> +    bits = arch_alloc_domin_struct_bits();
>> +#endif
> Maybe
>
> #ifndef arch_alloc_domain_struct_bits
> # define arch_alloc_domain_struct_bits() 0
> #endif
>
> ahead of the use and then simply
>
>      unsigned int bits = arch_alloc_domain_struct_bits();
>
> ?
>
>> +    BUILD_BUG_ON(sizeof(*d) > PAGE_SIZE);
>> +
>> +    d = alloc_xenheap_pages(0, MEMF_bits(bits));
> I'd go a little farther and allow the arch to specify all the memflags that
> are wanted. Then the hook name would also be less ambiguous, as "bits" can
> mean many things. Perhaps arch_alloc_domain_struct_memflags() or, since
> "memflags" kind of implies allocation, arch_domain_struct_memflags()?

I also thought about returning memflags from the hook instead of bits. Lets
then return memflags.

I will apply all other comments too.

Thanks.

~ Oleksii

--------------SB5jDQiNuzlX7dmqmsAAhC70
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
    <div class="moz-cite-prefix">On 11/26/25 4:19 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1930930f-d9a4-4ad2-b6b1-5c138227924f@suse.com">
      <pre wrap="" class="moz-quote-pre">On 26.11.2025 15:32, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/x86/include/asm/pv/domain.h
+++ b/xen/arch/x86/include/asm/pv/domain.h
@@ -18,6 +18,9 @@ extern int8_t opt_pv32;
 # define opt_pv32 false
 #endif
 
+unsigned int arch_alloc_domain_struct_bits(void);
+#define arch_alloc_domin_struct_bits arch_alloc_domain_struct_bits
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
There was an 'a' lost in the identifier.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -799,6 +799,29 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
     return arch_sanitise_domain_config(config);
 }
 
+struct domain *alloc_domain_struct(void)
+{
+    struct domain *d;
+    unsigned int bits = 0;
+
+#ifdef arch_alloc_domin_struct_bits
+    bits = arch_alloc_domin_struct_bits();
+#endif
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Maybe

#ifndef arch_alloc_domain_struct_bits
# define arch_alloc_domain_struct_bits() 0
#endif

ahead of the use and then simply

    unsigned int bits = arch_alloc_domain_struct_bits();

?

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    BUILD_BUG_ON(sizeof(*d) &gt; PAGE_SIZE);
+
+    d = alloc_xenheap_pages(0, MEMF_bits(bits));
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I'd go a little farther and allow the arch to specify all the memflags that
are wanted. Then the hook name would also be less ambiguous, as "bits" can
mean many things. Perhaps arch_alloc_domain_struct_memflags() or, since
"memflags" kind of implies allocation, arch_domain_struct_memflags()?</pre>
    </blockquote>
    <pre>I also thought about returning memflags from the hook instead of bits. Lets
then return memflags.

I will apply all other comments too.

Thanks.

~ Oleksii

</pre>
  </body>
</html>

--------------SB5jDQiNuzlX7dmqmsAAhC70--

