Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 693C5A7B921
	for <lists+xen-devel@lfdr.de>; Fri,  4 Apr 2025 10:43:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937941.1338791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0cdp-00043Z-4f; Fri, 04 Apr 2025 08:43:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937941.1338791; Fri, 04 Apr 2025 08:43:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0cdp-00041z-07; Fri, 04 Apr 2025 08:43:09 +0000
Received: by outflank-mailman (input) for mailman id 937941;
 Fri, 04 Apr 2025 08:43:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iWoU=WW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u0cdn-00041t-3l
 for xen-devel@lists.xenproject.org; Fri, 04 Apr 2025 08:43:07 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3b67d83-1130-11f0-9eaa-5ba50f476ded;
 Fri, 04 Apr 2025 10:43:05 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5e6167d0536so3191620a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 04 Apr 2025 01:43:05 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f0880a45bdsm1942187a12.71.2025.04.04.01.43.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Apr 2025 01:43:04 -0700 (PDT)
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
X-Inumbo-ID: d3b67d83-1130-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743756185; x=1744360985; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nMdlDnFeE/ugQuOKWKolBfE2c+xXSu7MDrl9WQXcshg=;
        b=H0R2BVeTL4Ep3WWQDlLm8RVPEKjK4PoMZgo8V6U+/VaBheHflCXGtWzH3T+NT5D4yx
         84QTen+300uaIpxtgJR6Cu1/954irJO5/bhmHmFm+KYvsf0kn9ooVp0DRdHFQUiJfYw9
         alyrrm/HHrhaw3zUbtB1HFD45z0nQSrFS2r4NKVqeiYI07WcZALA33Cj6LTNP0OQttqf
         EdPw/C3r2fpFRQbSYgxuMMwqNvwYJwJyG1gFWz/HtSosESsD788xi6P5i7Owzu4olB0L
         1hk4VYCy4B3Tf5gD/tRFDuh9V0sK69lj1MbGLGe2VrwYhE6izzDF2L0gTFNngD9Pf+mb
         VCxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743756185; x=1744360985;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nMdlDnFeE/ugQuOKWKolBfE2c+xXSu7MDrl9WQXcshg=;
        b=RrWJurI8lWYh1Kqg/8yL5EKGmpde7+g6YFhP0uAMyr1JRAUzBzK+B7xbsFu7q6B3xb
         SlV+Uz8K8vD4bhkAZF1DBI8JYh8aEcHG3mwFgWyWtinPNUs8aSu5JAfD3fmmJvAgI96i
         cO+T8PnnSZLWyMA4VbknTjGoR5R/wtcyFOZA9RnUkl7W9uuxf/dODaMLSPJkXDqXm4qc
         6H3m/sRGZF1VGPR3u4FGKJI2KPsmWYR0ljnNFo/66J7rc3c3i4YJanfjtHubbAGmNXl+
         YyZO6dR1ZitjzwI649e5rnWSS20MfZF2MJv5kObAPaC+JA4axKNH+wy3+khyBSNt94W2
         5t0A==
X-Forwarded-Encrypted: i=1; AJvYcCUahxY62Zk+q2Y/IVQ9mgFBboupYx67VIxjgIfYDWK88wk2n5MBxJRc0Ad1R5BKTEV/nzBh/dU/TVI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxUeg/dmMf5t2zmDaPrXIKzJkwSXOXiEfrUHGrurJKfndc7nPNE
	6PU7OHKfksRnJEM1am/TsjGLE3ds+lrji2XyaM9/LPcQgLKRbEal
X-Gm-Gg: ASbGncugY6+QVsCMjjETiCEvjySpTe3mX+ASGB4xzXXPOt6BfGGlfk8N+6b8nFmD4gO
	HTmA40HiKTm53Z9z18wmltorZBQBbQjRenQk1oEz2k5eoIEHuHlYMzAzbzQCL7SvvAk0CLp5ryo
	bdov4KGHyqCE7+csuZgNOG3WdiFWSwybWvtgl/PbxGq0eNR5x1YpR1FCd1tCfLORck6h/W6BntA
	hyPUndbalxAxuKD3rGdsUEozek3wXjwTeBTL7CNJm6kDkxxGp7/oPdf5jufTIF5a42Uqlr2cHrV
	XU0DoqXufyy1wy8xxtcciJoIhQDTDULV2TgIhOcLRdYisfZZUwQFZrWGLopPn5B+uW+J4PCuumX
	D0RNgIaqX1HcD1R5QuRVeCls5KwkuWZs=
X-Google-Smtp-Source: AGHT+IEHTyJ5tHtqj733uXfBNO2G4B2FU3pL1edfgEnysxMnpkFXh3GXyjk14+1hOV+RpizrQDrWKQ==
X-Received: by 2002:a05:6402:2708:b0:5f0:9eb3:8e71 with SMTP id 4fb4d7f45d1cf-5f0b3e34eafmr1943326a12.27.1743756184949;
        Fri, 04 Apr 2025 01:43:04 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------3yWG1vJgau96FWZoQYQnAYCa"
Message-ID: <d954c167-8243-43ab-9bfb-2e47c8ea171a@gmail.com>
Date: Fri, 4 Apr 2025 10:43:02 +0200
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
 <30d8e316-aff5-498a-b2bd-448e0b2518ae@gmail.com>
 <3c2127ec-63fb-457b-8229-fc8a2b9fbf00@suse.com>
 <a4eb8bcf-7043-4661-8879-cdb33d1ca252@gmail.com>
 <14ac3e72-d21d-4b45-a434-d123152c0113@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <14ac3e72-d21d-4b45-a434-d123152c0113@suse.com>

This is a multi-part message in MIME format.
--------------3yWG1vJgau96FWZoQYQnAYCa
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 4/4/25 9:52 AM, Jan Beulich wrote:
> On 04.04.2025 09:31, Oleksii Kurochko wrote:
>> On 4/4/25 8:56 AM, Jan Beulich wrote:
>>> On 03.04.2025 18:20, Oleksii Kurochko wrote:
>>>> On 4/1/25 6:04 PM, Jan Beulich wrote:
>>>>> On 01.04.2025 17:58, Oleksii Kurochko wrote:
>>>>>> On 3/31/25 6:14 PM, Jan Beulich wrote:
>>>>>>> On 31.03.2025 17:20, Oleksii Kurochko wrote:
>>>>>>>> +        _AC(XEN_VIRT_START, UL) >> vpn1_shift;
>>>>>>>> +    const unsigned long xen_virt_end_vpn =
>>>>>>>> +        xen_virt_starn_vpn + ((XEN_VIRT_SIZE >> vpn1_shift) - 1);
>>>>>>>> +
>>>>>>>>          if ((va >= DIRECTMAP_VIRT_START) &&
>>>>>>>>              (va <= DIRECTMAP_VIRT_END))
>>>>>>>>              return directmapoff_to_maddr(va - directmap_virt_start);
>>>>>>>>      
>>>>>>>> -    BUILD_BUG_ON(XEN_VIRT_SIZE != MB(2));
>>>>>>>> -    ASSERT((va >> (PAGETABLE_ORDER + PAGE_SHIFT)) ==
>>>>>>>> -           (_AC(XEN_VIRT_START, UL) >> (PAGETABLE_ORDER + PAGE_SHIFT)));
>>>>>>>> +    BUILD_BUG_ON(XEN_VIRT_SIZE != MB(8));
>>>>>>> Is it necessary to be != ? Won't > suffice?
>>>>>> It could be just > MB(2). Or perphaps >=.
>>>>>> = would make the build fail, wouldn't it?
>>>> I just realized that BUILD_BUG_ON() condition is compared to zero so actually everything what
>>>> will make the condition true will cause a build fail as inside it used !(condition).
>>> ???
>> |BUILD_BUG_ON()| forces a compilation error if the given condition is true. Therefore, if the condition
>> |XEN_VIRT_SIZE != MB(2)| is changed to|XEN_VIRT_SIZE > MB(2)|, the condition will always evaluate to true
>> (assuming|XEN_VIRT_SIZE| is greater than 2 MB), which will result in a compilation error.
> Well, it was you who used MB(2) in a reply, when previously talk was of MB(8),
> and that to grow to MB(16). The BUILD_BUG_ON() is - aiui - about you having set
> aside enough page table space. Quite possibly the need for this BUILD_BUG_ON()
> then disappears altogether when XEN_VIRT_SIZE is properly taken into account
> for the number-of-page-tables calculation. In no event do I see why the MB(2)
> boundary would be relevant for anything going forward.

Also, doesn’t|BUILD_BUG_ON()| affect how the|ASSERT()| that follows it is written?

The changes, at the moment, look like:
+    const unsigned int vpn1_shift = PAGETABLE_ORDER + PAGE_SHIFT;
+    const unsigned long va_vpn = va >> vpn1_shift;
+    const unsigned long xen_virt_start_vpn =
+        _AC(XEN_VIRT_START, UL) >> vpn1_shift;
+    const unsigned long xen_virt_end_vpn =
+        xen_virt_start_vpn + ((XEN_VIRT_SIZE >> vpn1_shift) - 1);
+
      if ((va >= DIRECTMAP_VIRT_START) &&
          (va <= DIRECTMAP_VIRT_END))
          return directmapoff_to_maddr(va - directmap_virt_start);
  
-    BUILD_BUG_ON(XEN_VIRT_SIZE != MB(2));
-    ASSERT((va >> (PAGETABLE_ORDER + PAGE_SHIFT)) ==
-           (_AC(XEN_VIRT_START, UL) >> (PAGETABLE_ORDER + PAGE_SHIFT)));
+    BUILD_BUG_ON(XEN_VIRT_SIZE != MB(16));
+    ASSERT((va_vpn >= xen_virt_start_vpn) && (va_vpn <= xen_virt_end_vpn));


If|XEN_VIRT_SIZE| is greater than|GB(1)|, then|xen_virt_end_vpn| may be calculated
incorrectly.

For example, if|XEN_VIRT_START| is|0xFFFFFFFF80000000| and|XEN_VIRT_SIZE| is|0x40200000|,
then|(XEN_VIRT_SIZE >> vpn1_shift)| equals 513, whereas|va_vpn| is always in the range [0, 511],
but xen_virt_end_vpn will be greater then 511.

So shouldn't it  be checked before ASSERT() that XEN_VIRT_SIZE is <= GB(1):
   BUILD_BUG_ON(XEN_VIRT_SIZE <= GB(1))?

~ Oleksii


--------------3yWG1vJgau96FWZoQYQnAYCa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 4/4/25 9:52 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:14ac3e72-d21d-4b45-a434-d123152c0113@suse.com">
      <pre wrap="" class="moz-quote-pre">On 04.04.2025 09:31, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 4/4/25 8:56 AM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 03.04.2025 18:20, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">On 4/1/25 6:04 PM, Jan Beulich wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">On 01.04.2025 17:58, Oleksii Kurochko wrote:
</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">On 3/31/25 6:14 PM, Jan Beulich wrote:
</pre>
                <blockquote type="cite">
                  <pre wrap="" class="moz-quote-pre">On 31.03.2025 17:20, Oleksii Kurochko wrote:
</pre>
                  <blockquote type="cite">
                    <pre wrap="" class="moz-quote-pre">+        _AC(XEN_VIRT_START, UL) &gt;&gt; vpn1_shift;
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
</pre>
                  </blockquote>
                  <pre wrap="" class="moz-quote-pre">Is it necessary to be != ? Won't &gt; suffice?
</pre>
                </blockquote>
                <pre wrap="" class="moz-quote-pre">It could be just &gt; MB(2). Or perphaps &gt;=.
= would make the build fail, wouldn't it?
</pre>
              </blockquote>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">I just realized that BUILD_BUG_ON() condition is compared to zero so actually everything what
will make the condition true will cause a build fail as inside it used !(condition).
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">???
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
|BUILD_BUG_ON()| forces a compilation error if the given condition is true. Therefore, if the condition
|XEN_VIRT_SIZE != MB(2)| is changed to|XEN_VIRT_SIZE &gt; MB(2)|, the condition will always evaluate to true
(assuming|XEN_VIRT_SIZE| is greater than 2 MB), which will result in a compilation error.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Well, it was you who used MB(2) in a reply, when previously talk was of MB(8),
and that to grow to MB(16). The BUILD_BUG_ON() is - aiui - about you having set
aside enough page table space. Quite possibly the need for this BUILD_BUG_ON()
then disappears altogether when XEN_VIRT_SIZE is properly taken into account
for the number-of-page-tables calculation. In no event do I see why the MB(2)
boundary would be relevant for anything going forward.</pre>
    </blockquote>
    <pre data-start="105" data-end="189" class="">Also, doesn’t <code
    data-start="119" data-end="135">BUILD_BUG_ON()</code> affect how the <code
    data-start="151" data-end="161">ASSERT()</code> that follows it is written?

The changes, at the moment, look like:
+    const unsigned int vpn1_shift = PAGETABLE_ORDER + PAGE_SHIFT;
+    const unsigned long va_vpn = va &gt;&gt; vpn1_shift;
+    const unsigned long xen_virt_start_vpn =
+        _AC(XEN_VIRT_START, UL) &gt;&gt; vpn1_shift;
+    const unsigned long xen_virt_end_vpn =
+        xen_virt_start_vpn + ((XEN_VIRT_SIZE &gt;&gt; vpn1_shift) - 1);
+
     if ((va &gt;= DIRECTMAP_VIRT_START) &amp;&amp;
         (va &lt;= DIRECTMAP_VIRT_END))
         return directmapoff_to_maddr(va - directmap_virt_start);
 
-    BUILD_BUG_ON(XEN_VIRT_SIZE != MB(2));
-    ASSERT((va &gt;&gt; (PAGETABLE_ORDER + PAGE_SHIFT)) ==
-           (_AC(XEN_VIRT_START, UL) &gt;&gt; (PAGETABLE_ORDER + PAGE_SHIFT)));
+    BUILD_BUG_ON(XEN_VIRT_SIZE != MB(16));
+    ASSERT((va_vpn &gt;= xen_virt_start_vpn) &amp;&amp; (va_vpn &lt;= xen_virt_end_vpn));


If <code data-start="754" data-end="769">XEN_VIRT_SIZE</code> is greater than <code
    data-start="786" data-end="793">GB(1)</code>, then <code
    data-start="800" data-end="818">xen_virt_end_vpn</code> may be calculated
incorrectly.

For example, if <code data-start="866" data-end="882">XEN_VIRT_START</code> is <code
    data-start="886" data-end="906">0xFFFFFFFF80000000</code> and <code
    data-start="911" data-end="926">XEN_VIRT_SIZE</code> is <code
    data-start="930" data-end="942">0x40200000</code>,
then <code data-start="949" data-end="980">(XEN_VIRT_SIZE &gt;&gt; vpn1_shift)</code> equals 513, whereas <code
    data-start="1001" data-end="1009">va_vpn</code> is always in the range [0, 511],
but xen_virt_end_vpn will be greater then 511.

So shouldn't it  be checked before ASSERT() that XEN_VIRT_SIZE is &lt;= GB(1):
  BUILD_BUG_ON(XEN_VIRT_SIZE &lt;= GB(1))?

~ Oleksii


</pre>
  </body>
</html>

--------------3yWG1vJgau96FWZoQYQnAYCa--

