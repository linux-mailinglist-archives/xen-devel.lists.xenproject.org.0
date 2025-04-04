Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C919A7B845
	for <lists+xen-devel@lfdr.de>; Fri,  4 Apr 2025 09:32:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937825.1338700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0bWn-0004Af-8b; Fri, 04 Apr 2025 07:31:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937825.1338700; Fri, 04 Apr 2025 07:31:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0bWn-00048R-5s; Fri, 04 Apr 2025 07:31:49 +0000
Received: by outflank-mailman (input) for mailman id 937825;
 Fri, 04 Apr 2025 07:31:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iWoU=WW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u0bWl-00048J-3B
 for xen-devel@lists.xenproject.org; Fri, 04 Apr 2025 07:31:47 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dcdb3184-1126-11f0-9eaa-5ba50f476ded;
 Fri, 04 Apr 2025 09:31:46 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-ac29af3382dso267729666b.2
 for <xen-devel@lists.xenproject.org>; Fri, 04 Apr 2025 00:31:46 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac7c0186550sm210660966b.144.2025.04.04.00.31.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Apr 2025 00:31:44 -0700 (PDT)
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
X-Inumbo-ID: dcdb3184-1126-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743751905; x=1744356705; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LQfoTEG4MRtopApKswk9oTRymy8zhlkI+bcVVGiZ9Ws=;
        b=QVwWco4Ah8HyfWhO1IAMm+BgsPXnyrJLads95yhTrUaHlIvvlF4PwVKB6p/V4PXV08
         UGaTr23QgEHGwb9J6CXq7OyIdHa33Yg636tqvJ30sNeZTqElGknzy82+uJjrN037V91o
         PAYwfiRmOyL2mWBN9HsZubGugAbHALxiC2ZLupX9ZoP+2TawYuKzYnEwk+FKNIFzQa+9
         URR67QTxSiEs5OQ75vZYndWBgmkY5FFduQ0yVo1lv1+/hDRjwBE5sOct9b78akDxHoXZ
         xLtNlzOm4ffbncq5x95bZhnIVXjM/aQKqH0ctStIYkF3bl8Qa9shhw7iEKbBa05NhLJL
         YNOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743751905; x=1744356705;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LQfoTEG4MRtopApKswk9oTRymy8zhlkI+bcVVGiZ9Ws=;
        b=rcJDqJPYnh59E2ek7WMJE5/xL1ZGxZXHWaAxUct1sMsXsuuhPcdt114vHM/CbSMrNP
         9zvPW8+ZMjXvyXfMbYFkzgzXe4FwuRNGgY4A67CTgAqesj7VWp8YPH3vjeNDhiqSKCf9
         dE9IN+GDlzL6WWDwgtHQjgM0Ez+QFJSDFSUbZ/VJh1Rh4wclC2dSYt3SDC8AgvVNiGF+
         9e34imHYEppTKzu/0Lon0XqbJRjny93kN2EcdHLUt5vUOv4XAH2St4aEbMkddggDLf6g
         6Zzqh8eSoxLUGxTYGTEePV2Uy8GY0GMGOfTs6N7aKpdiAoIIH9m+UDYYDoQaY+Uzb/sJ
         bcLA==
X-Forwarded-Encrypted: i=1; AJvYcCXU7xRY4xDZ8jEGTTb7z3ZqOPZ6w8drskMK8rh28ggTBEQWIEqia8GDs/1GYLOYci1ighprkesK1AM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzkajYCfTHC9J0gBKXt9RM+VuYfrlmkYoWmPT5+M1xNjwic7XMj
	ZTG6/k11vKYdM1uUjqQJJmeHWlQM4P9D0cjUo2OGvTVeybLjCU7L
X-Gm-Gg: ASbGncskL3zrPUS8y1tTHjsenmqoVTHgGQxVxzRXaPHRwFsojClzVBWdnuKiTmB2uU/
	qdYETCR2Dz8i6TvMe/FLbGwKg11uIboBnRL2unhS8IVdJJtxef7XXNzPcpqD8RxjvYWBGMdoPy5
	zYo6lPFJPsFoAMArahSrxonfRynWrB1v7yLOgLjVpcmTsKKFYZsoWULE4BL86viv98f3Dv+Sh8L
	svU89TG6nXeFrPYpgAhhCj57Kuq7mKXBCzjZDISxG/QUxZolFpddTuKdZYeNKfYQvPcbeWbuyTd
	TPxVDThHKaMg9Hx6NqogwCEYb32WBTQsEBT/pgrI9FKJ/qsVc0TmZ6iIYplluvwpuCNaHR1TBe2
	gZPAIGpMElwsyhEmg2aqb
X-Google-Smtp-Source: AGHT+IE6IbDhoZkauGtEsyUa8q+rskPMQVnFt7mg56kOCVeRHAc9QwTajmQJnoYrA/TPOhJWLSyawg==
X-Received: by 2002:a17:907:1c9d:b0:ac2:7a6d:c927 with SMTP id a640c23a62f3a-ac7d6f1b67cmr154085566b.50.1743751905245;
        Fri, 04 Apr 2025 00:31:45 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------SMRczfIP04OYxOzm0S6CJdGW"
Message-ID: <a4eb8bcf-7043-4661-8879-cdb33d1ca252@gmail.com>
Date: Fri, 4 Apr 2025 09:31:43 +0200
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <3c2127ec-63fb-457b-8229-fc8a2b9fbf00@suse.com>

This is a multi-part message in MIME format.
--------------SMRczfIP04OYxOzm0S6CJdGW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/4/25 8:56 AM, Jan Beulich wrote:
> On 03.04.2025 18:20, Oleksii Kurochko wrote:
>> On 4/1/25 6:04 PM, Jan Beulich wrote:
>>> On 01.04.2025 17:58, Oleksii Kurochko wrote:
>>>> On 3/31/25 6:14 PM, Jan Beulich wrote:
>>>>> On 31.03.2025 17:20, Oleksii Kurochko wrote:
>>>>>> +        _AC(XEN_VIRT_START, UL) >> vpn1_shift;
>>>>>> +    const unsigned long xen_virt_end_vpn =
>>>>>> +        xen_virt_starn_vpn + ((XEN_VIRT_SIZE >> vpn1_shift) - 1);
>>>>>> +
>>>>>>         if ((va >= DIRECTMAP_VIRT_START) &&
>>>>>>             (va <= DIRECTMAP_VIRT_END))
>>>>>>             return directmapoff_to_maddr(va - directmap_virt_start);
>>>>>>     
>>>>>> -    BUILD_BUG_ON(XEN_VIRT_SIZE != MB(2));
>>>>>> -    ASSERT((va >> (PAGETABLE_ORDER + PAGE_SHIFT)) ==
>>>>>> -           (_AC(XEN_VIRT_START, UL) >> (PAGETABLE_ORDER + PAGE_SHIFT)));
>>>>>> +    BUILD_BUG_ON(XEN_VIRT_SIZE != MB(8));
>>>>> Is it necessary to be != ? Won't > suffice?
>>>> It could be just > MB(2). Or perphaps >=.
>>>> = would make the build fail, wouldn't it?
>> I just realized that BUILD_BUG_ON() condition is compared to zero so actually everything what
>> will make the condition true will cause a build fail as inside it used !(condition).
> ???

|BUILD_BUG_ON()| forces a compilation error if the given condition is true. Therefore, if the condition
|XEN_VIRT_SIZE != MB(2)| is changed to|XEN_VIRT_SIZE > MB(2)|, the condition will always evaluate to true
(assuming|XEN_VIRT_SIZE| is greater than 2 MB), which will result in a compilation error.

~ Oleksii

>
>> So it seems like we have to check for XEN_VIRT_SIZE != MB(16) and change each time when XEN_VIRT_SIZE
>> is increased.
> I don't think so, but I need to first understand the point you make above.

--------------SMRczfIP04OYxOzm0S6CJdGW
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
    <div class="moz-cite-prefix">On 4/4/25 8:56 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:3c2127ec-63fb-457b-8229-fc8a2b9fbf00@suse.com">
      <pre wrap="" class="moz-quote-pre">On 03.04.2025 18:20, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 4/1/25 6:04 PM, Jan Beulich wrote:
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
        <pre wrap="" class="moz-quote-pre">
I just realized that BUILD_BUG_ON() condition is compared to zero so actually everything what
will make the condition true will cause a build fail as inside it used !(condition).
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
???</pre>
    </blockquote>
    <pre><code data-start="71" data-end="87">BUILD_BUG_ON()</code> forces a compilation error if the given condition is true. Therefore, if the condition
<code data-start="177" data-end="201">XEN_VIRT_SIZE != MB(2)</code> is changed to <code
    data-start="216" data-end="239">XEN_VIRT_SIZE &gt; MB(2)</code>, the condition will always evaluate to true
(assuming <code data-start="294" data-end="309" data-is-only-node="">XEN_VIRT_SIZE</code> is greater than 2 MB), which will result in a compilation error.

~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:3c2127ec-63fb-457b-8229-fc8a2b9fbf00@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">So it seems like we have to check for XEN_VIRT_SIZE != MB(16) and change each time when XEN_VIRT_SIZE
is increased.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I don't think so, but I need to first understand the point you make above.</pre>
    </blockquote>
    <pre>
</pre>
  </body>
</html>

--------------SMRczfIP04OYxOzm0S6CJdGW--

