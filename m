Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF2CA7A7C7
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 18:21:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936932.1338048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0NJ4-0000vi-Py; Thu, 03 Apr 2025 16:20:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936932.1338048; Thu, 03 Apr 2025 16:20:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0NJ4-0000tF-N6; Thu, 03 Apr 2025 16:20:42 +0000
Received: by outflank-mailman (input) for mailman id 936932;
 Thu, 03 Apr 2025 16:20:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8sHC=WV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u0NJ3-0000mp-7U
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 16:20:41 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92fb40ca-10a7-11f0-9ffb-bf95429c2676;
 Thu, 03 Apr 2025 18:20:36 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5ec9d24acfbso4055952a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 03 Apr 2025 09:20:36 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac7c01c20f1sm116318266b.177.2025.04.03.09.20.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Apr 2025 09:20:34 -0700 (PDT)
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
X-Inumbo-ID: 92fb40ca-10a7-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743697235; x=1744302035; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+z11WJnJOatLnkEUyyYOo4mxIOabotJnqQF68ndEaj0=;
        b=KMwJXBnF6+opZ2NYzTu4ZOTHAQhzmhfvA8DqvwFh5IsYnzbSdKN/7pCumkkS27F7i9
         lbyOeif7hUIi//a3Hk6EpoBb8H0lViORxJNnXtX6J5dmT2xA4CviZiY3dx0EoY7+AcPz
         gWCbhINEtkKYexnRi0qy62ZCrwr+QJXFvfZsBsi2hvwi5S4vZU129oki0AksypIlbIsP
         GagQCHkTUSOeJB9hFTk2fV0o6zt9XbjxxrdDMY4M0lj2yppyH+xGI2lS/YmjTdVJH81/
         54UnqgGi/Ufe9xPizgw8b07M8FO0MfMky5W1f3qinT4irsVf65qKaDiVJSCuAV/STt3L
         ueog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743697235; x=1744302035;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+z11WJnJOatLnkEUyyYOo4mxIOabotJnqQF68ndEaj0=;
        b=fs7vgIR6L/i7ZqHqN5uYFrXyLOaXwJDtF35e/DuVVRHrdXbSu1aHNLqIDn5EFz6UFG
         i1mVIl9Ojt37vl0HOqZHTmvdj4LKxq5XesLqAkmQGA1+/NqsYuZXfE3wCM3KznbrDFJW
         +wczY7KoqeiFwxDIkwv3pAoIpfqkqlXOFW6c2xdtqVLi9GJrbj0T5NnK53ubpFJd/l21
         ZkxKJ6xA0jSgaGW7/dj255DGhbVCnkJrcA3glu9b6/9Ea/KbsAdeVQWiATE2yJW3OrcL
         bu/ictJet+h7kZ2UrA5FfdW+oM2sQQQqYhIgqTJRfLHYcc02QgTEnsfw+KDZTcv/khA4
         7bWg==
X-Forwarded-Encrypted: i=1; AJvYcCVdLSu1Vj3JxBoPjkYzLKKYgI8mzFZNH8ROEDbl22EzwI0+A4NdDMbRSqsDFpCbinH1jKx6uepiJXQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YydEZGC0TuA0ugFJlcvAdAS0FmdiLaA2n1oGl8wWr9038LYLWHe
	tlkxkxpvuxPbb6s7OwrwEyG3nBAzIPu/g/KMC55PRTXCVBySdB7B
X-Gm-Gg: ASbGncuT2mpCzqFJW7yZoEyj/Q/rZ4PC+Q7i3mZ+gbKuCeCttCl4OuLYoS6k+O5iCeX
	YwN7Wsl1VTFx+BMhdiofHMosEuQsxUmrgm2jf1FDGFv6YGslSONpCeNVdd/dv0u556EK7DXifEn
	qv2ED6dSWe44+SdZtFBdQEhqBfAVMjU4zSIfbbnB7otyDlXKPYJbeMAOFbpPCFtM0XKc1G+03fz
	WS+x38JrtDFQaanKKTsK8NO3Qm2QDjtGe/m1Q039r+a/nFQPaFa/eu0kEMrra9kVO2RV8t8nk59
	zRh4X6sUoTDh0Xf2zVmR2nUwe+ZfusnfGNveqGxVZF4N9YCrmBRcrG6DLfaM7XnP0FmwyzK9RoU
	tyyRL/tZfFBUeI+ew5zsW
X-Google-Smtp-Source: AGHT+IF7xGhlOmChENg1Hao6eTILkSUrWK5mMyvMTJTgCdRq0Jg3AznDwMETJms8aIjKRDlD006R9w==
X-Received: by 2002:a17:907:3f1a:b0:ac3:ef17:f6f0 with SMTP id a640c23a62f3a-ac7b6b49876mr352169066b.5.1743697235248;
        Thu, 03 Apr 2025 09:20:35 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------UokBImlYq4ZEzn8WCJSlYpx7"
Message-ID: <30d8e316-aff5-498a-b2bd-448e0b2518ae@gmail.com>
Date: Thu, 3 Apr 2025 18:20:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen/riscv: Increase XEN_VIRT_SIZE
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <e5fa4219ccf43125e2489cc8c49b4404e6ed22ce.1743434164.git.oleksii.kurochko@gmail.com>
 <54ebdcb7-071f-411f-803a-930dc330a497@suse.com>
 <32264ccb-e566-41e0-973f-5bc7d874f970@gmail.com>
 <9d7e1553-3af8-4fc3-a400-8714d9b68411@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <9d7e1553-3af8-4fc3-a400-8714d9b68411@suse.com>

This is a multi-part message in MIME format.
--------------UokBImlYq4ZEzn8WCJSlYpx7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/1/25 6:04 PM, Jan Beulich wrote:
> On 01.04.2025 17:58, Oleksii Kurochko wrote:
>> On 3/31/25 6:14 PM, Jan Beulich wrote:
>>> On 31.03.2025 17:20, Oleksii Kurochko wrote:
>>>> +        _AC(XEN_VIRT_START, UL) >> vpn1_shift;
>>>> +    const unsigned long xen_virt_end_vpn =
>>>> +        xen_virt_starn_vpn + ((XEN_VIRT_SIZE >> vpn1_shift) - 1);
>>>> +
>>>>        if ((va >= DIRECTMAP_VIRT_START) &&
>>>>            (va <= DIRECTMAP_VIRT_END))
>>>>            return directmapoff_to_maddr(va - directmap_virt_start);
>>>>    
>>>> -    BUILD_BUG_ON(XEN_VIRT_SIZE != MB(2));
>>>> -    ASSERT((va >> (PAGETABLE_ORDER + PAGE_SHIFT)) ==
>>>> -           (_AC(XEN_VIRT_START, UL) >> (PAGETABLE_ORDER + PAGE_SHIFT)));
>>>> +    BUILD_BUG_ON(XEN_VIRT_SIZE != MB(8));
>>> Is it necessary to be != ? Won't > suffice?
>> It could be just > MB(2). Or perphaps >=.
>> = would make the build fail, wouldn't it?

I just realized that BUILD_BUG_ON() condition is compared to zero so actually everything what
will make the condition true will cause a build fail as inside it used !(condition).

So it seems like we have to check for XEN_VIRT_SIZE != MB(16) and change each time when XEN_VIRT_SIZE
is increased.

~ Oleksii


--------------UokBImlYq4ZEzn8WCJSlYpx7
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
    <div class="moz-cite-prefix">On 4/1/25 6:04 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:9d7e1553-3af8-4fc3-a400-8714d9b68411@suse.com">
      <pre class="moz-quote-pre" wrap=""><pre wrap=""
      class="moz-quote-pre">On 01.04.2025 17:58, Oleksii Kurochko wrote:
</pre><blockquote type="cite" style="color: #007cff;"><pre wrap=""
      class="moz-quote-pre">On 3/31/25 6:14 PM, Jan Beulich wrote:
</pre><blockquote type="cite" style="color: #007cff;"><pre wrap=""
      class="moz-quote-pre">On 31.03.2025 17:20, Oleksii Kurochko wrote:
</pre><blockquote type="cite" style="color: #007cff;"><pre wrap=""
      class="moz-quote-pre">+        _AC(XEN_VIRT_START, UL) &gt;&gt; vpn1_shift;
+    const unsigned long xen_virt_end_vpn =
+        xen_virt_starn_vpn + ((XEN_VIRT_SIZE &gt;&gt; vpn1_shift) - 1);
+
      if ((va &gt;= DIRECTMAP_VIRT_START) &amp;&amp;
          (va &lt;= DIRECTMAP_VIRT_END))
          return directmapoff_to_maddr(va - directmap_virt_start);
  
-    BUILD_BUG_ON(XEN_VIRT_SIZE != MB(2));
-    ASSERT((va &gt;&gt; (PAGETABLE_ORDER + PAGE_SHIFT)) ==
-           (_AC(XEN_VIRT_START, UL) &gt;&gt; (PAGETABLE_ORDER + PAGE_SHIFT)));
+    BUILD_BUG_ON(XEN_VIRT_SIZE != MB(8));
</pre></blockquote><pre wrap="" class="moz-quote-pre">Is it necessary to be != ? Won't &gt; suffice?
</pre></blockquote><pre wrap="" class="moz-quote-pre">It could be just &gt; MB(2). Or perphaps &gt;=.
</pre></blockquote><blockquote type="cite" style="color: #007cff;"><pre
      wrap="" class="moz-quote-pre">= would make the build fail, wouldn't it?</pre></blockquote></pre>
    </blockquote>
    <pre>I just realized that BUILD_BUG_ON() condition is compared to zero so actually everything what
will make the condition true will cause a build fail as inside it used !(condition).

So it seems like we have to check for XEN_VIRT_SIZE != MB(16) and change each time when XEN_VIRT_SIZE
is increased.

~ Oleksii


</pre>
  </body>
</html>

--------------UokBImlYq4ZEzn8WCJSlYpx7--

