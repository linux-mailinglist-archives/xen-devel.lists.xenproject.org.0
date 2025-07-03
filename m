Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 047EBAF759C
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 15:29:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032166.1405899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXJzk-0000ey-I8; Thu, 03 Jul 2025 13:28:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032166.1405899; Thu, 03 Jul 2025 13:28:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXJzk-0000cG-F8; Thu, 03 Jul 2025 13:28:56 +0000
Received: by outflank-mailman (input) for mailman id 1032166;
 Thu, 03 Jul 2025 13:28:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jdSv=ZQ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uXJzj-0000cA-FK
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 13:28:55 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a89dd57d-5811-11f0-b894-0df219b8e170;
 Thu, 03 Jul 2025 15:28:51 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-addda47ebeaso1673583166b.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Jul 2025 06:28:51 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae353c0138bsm1250908366b.85.2025.07.03.06.28.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jul 2025 06:28:49 -0700 (PDT)
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
X-Inumbo-ID: a89dd57d-5811-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751549331; x=1752154131; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vzmFWHWtVXKQ44Ax6ZC5IDYqW73qWt3Bc840TmdRKoE=;
        b=dR6lPMRRNhAvwjb3zO6zM3rxr2Db3LhtkxwIWDW4UC29Y5PO9ms2dkBHc1WGzldnp7
         JtmMTmbWSuXkkPlvqQxnHZ628m1JiBEoIbzHnjTxArN3baXmbfODuRKyM0OC6WoYMakF
         u9AU1IzCyztKmL7aJv9ZangwGX4DXg2ZPea/xNmSNGqs3rUA1VEa9VCKEPS4Kl7Ua+5V
         JXlYrLnOb4MtIG+vgZ9LAVB9S/ux/rjVEDEx+aECqjqQ0mJ6fgnW0cI7Pxsy2vXf3Yvf
         ZIBDaTByduFNc1TAoWd3lJP38hf2FeTAtz8IriLYWkXZ+mWEvmuMDsS1m2GamXtegg27
         12Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751549331; x=1752154131;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vzmFWHWtVXKQ44Ax6ZC5IDYqW73qWt3Bc840TmdRKoE=;
        b=qwwSiIoNaafdU1/iAB0wHfjfsCZXKdW2m8DYqrON6fSIdJQdsEsFyPLGSbAMJR0BMA
         zGNR0Yuc8nBOPI9hrWEZjK4/M0ewOQnB+kquSvMbQqcyRef3N9goW92IEGnUOshtiDga
         oDlscHd7kTS0x8wmFweUJwNkuqdhOtaHqynwPuTCAgoT8JGxAm5w6Y1sRutDDTtzE/UF
         tEepFWM+AVcERfsgraeOQ3tGXqSWG9y2cOO4gq9G05NJWsc7YUyjbviqFTB5t3kzEw9g
         P01hQArOwhAk4u24Ikh1q5YeO1esgj2pj86fz9TIB53Lijo78e+7BPF7gqKnltSTY1Pw
         MHlw==
X-Forwarded-Encrypted: i=1; AJvYcCU5kCmZygqggy0DbacQj2I1ZVb92epBJ5FbCOObJwOtI0UNEd7GxPNNnqb0C9F+FHpyYb9OrgoNNxA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwacdtQ4YoqyI0gNdcziubKf04t9gLwZmMOZbePA1V76ue6ixUR
	swJ1pZ+gNCoOyxMffh2NEQSHYecKoDq6JyZ90gsNfsVgmoejIXMD2KKS
X-Gm-Gg: ASbGncsR4ofeXHet9ktWEhWEsQUmMDRgc+rlhrGdbqG4CSlbmVBmHyEQT4u2hz9MRCZ
	H43VAiqda0puhB5ZtZq6KaqLEdhTjYpXzzZzX3yytSmlfg5BchS2ewHUtPhc93fznjbSfjuWLgv
	cuKqclf3cPuXUtge0uva+1lKbsN23KyfEeiwVaOI99qCS4R4OmP618wsaQfa24do4KUxhjbWIZ+
	RTDv5gJW0en8hk8unyzzOpXgx3knHWgcy+T1h58hUUCNGxlzuLFpJjZdh/kLBSZfM1bvM6wZ18o
	UKPxyUvCor5Pm14Kai1sMJOvw1c4yOxN5I0Nfcv4Ojo0869HDjCGyaqwpd3m8O9VeKU7HRTKgeL
	CiM71Wvvyh5pt5C73NrxXqqUMK1tFf+q3/ZI=
X-Google-Smtp-Source: AGHT+IFhN4QCkMzlbDXDrzYMd1gXNcCBJYE8ENdcOVf/8VTxXjH5S5z8SkF69ze7kYT9TPO1D7Goww==
X-Received: by 2002:a17:907:7f06:b0:ae0:a590:bc64 with SMTP id a640c23a62f3a-ae3d840e2b6mr306811866b.18.1751549330192;
        Thu, 03 Jul 2025 06:28:50 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------Q0pqgelkPEJQcl6Ri6v0t71d"
Message-ID: <2c3b4abe-2b42-4498-8c6f-639dda8a7ab0@gmail.com>
Date: Thu, 3 Jul 2025 15:28:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/17] xen/riscv: implement guest_physmap_add_entry()
 for mapping GFNs to MFNs
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <0b1f7ead7eb1b7c8687d388cca50b46eefb8e408.1749555949.git.oleksii.kurochko@gmail.com>
 <f1e26c40-c70d-4d86-96ec-7643a9d08e76@suse.com>
 <5fbe849c-3b8a-45dd-a217-c1dbf831da47@gmail.com>
 <03f0a7eb-f541-4f2b-8b88-500fd483dd48@suse.com>
 <0c1f9567-5530-4f90-8996-86a1f9662b52@gmail.com>
 <5328b683-07d2-4590-9a8a-eac0cb2e4c79@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <5328b683-07d2-4590-9a8a-eac0cb2e4c79@suse.com>

This is a multi-part message in MIME format.
--------------Q0pqgelkPEJQcl6Ri6v0t71d
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/3/25 3:09 PM, Jan Beulich wrote:
> On 03.07.2025 13:54, Oleksii Kurochko wrote:
>> On 7/3/25 1:33 PM, Jan Beulich wrote:
>>> On 03.07.2025 13:02, Oleksii Kurochko wrote:
>>>> On 6/30/25 5:59 PM, Jan Beulich wrote:
>>>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>>>> +                              unsigned long nr, mfn_t mfn, p2m_type_t t)
>>>>>> +{
>>>>>> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
>>>>>> +    int rc;
>>>>>> +
>>>>>> +    p2m_write_lock(p2m);
>>>>>> +    rc = p2m_set_entry(p2m, start_gfn, nr, mfn, t, p2m->default_access);
>>>>>> +    p2m_write_unlock(p2m);
>>>>>> +
>>>>>> +    return rc;
>>>>>> +}
>>>>>> +
>>>>>> +int map_regions_p2mt(struct domain *d,
>>>>>> +                     gfn_t gfn,
>>>>>> +                     unsigned long nr,
>>>>>> +                     mfn_t mfn,
>>>>>> +                     p2m_type_t p2mt)
>>>>>> +{
>>>>>> +    return p2m_insert_mapping(d, gfn, nr, mfn, p2mt);
>>>>>> +}
>>>>> What is this function doing here? The description says "for generic mapping
>>>>> purposes", which really may mean anything. Plus, if and when you need it, it
>>>>> wants to come with a name that fits with e.g. ...
>>>> These names are used across the common code and various architectures. Not all
>>>> architectures need to implement all of these functions.
>>>> I believe|guest_physmap_add_page()| (which internally calls|guest_physmap_add_entry()|)
>>>> is needed to be implemented for all architectures, while|map_regions_p2mt()| is used
>>>> by Arm and the common Dom0less-related code, and because of RISC-V is going to re-use
>>>> common Dom0less code it is implementing this function too.
>>> First, my comment was solely about this one function above. And then I didn't
>>> even know Arm had such a function. It's not used from common code (except again
>>> from dom0less code where it should have been better abstracted, imo). I'm also
>>> not surprised I wasn't aware of it since, as can be implied from the above,
>>> otherwise I would likely have complained about its name not fitting the general
>>> scheme (which isn't all that good either).
>> If I'm right, there is nothing similar to|map_regions_p2mt()| in the common headers.
>>
>> Anyway, I think we could follow up with a patch to rename this function to
>> something more appropriate.
>>
>> I was thinking about adding something like|map_regions_to_guest()|,|map_p2m_regions()|,
>> or|map_p2m_memory()| to|xen/mm.h|, along with proper renaming in the Arm code.
>>
>> Does that make sense?
> Imo that seemingly redundant function (i.e. if it's really needed) would want
> to be named guest_physmap_<whatever>().

If it is redundant what is expected to be used instead to map_regions_p2mt() to map MMIO,
for example, to guest: guest_physmap_add_page()? Based on the comment above the definition
of this function it is for RAM: /* Untyped version for RAM only, for compatibility */

~ Oleksii

--------------Q0pqgelkPEJQcl6Ri6v0t71d
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
    <div class="moz-cite-prefix">On 7/3/25 3:09 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:5328b683-07d2-4590-9a8a-eac0cb2e4c79@suse.com">
      <pre wrap="" class="moz-quote-pre">On 03.07.2025 13:54, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 7/3/25 1:33 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 03.07.2025 13:02, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">On 6/30/25 5:59 PM, Jan Beulich wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">On 10.06.2025 15:05, Oleksii Kurochko wrote:
</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">+                              unsigned long nr, mfn_t mfn, p2m_type_t t)
+{
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+    int rc;
+
+    p2m_write_lock(p2m);
+    rc = p2m_set_entry(p2m, start_gfn, nr, mfn, t, p2m-&gt;default_access);
+    p2m_write_unlock(p2m);
+
+    return rc;
+}
+
+int map_regions_p2mt(struct domain *d,
+                     gfn_t gfn,
+                     unsigned long nr,
+                     mfn_t mfn,
+                     p2m_type_t p2mt)
+{
+    return p2m_insert_mapping(d, gfn, nr, mfn, p2mt);
+}
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">What is this function doing here? The description says "for generic mapping
purposes", which really may mean anything. Plus, if and when you need it, it
wants to come with a name that fits with e.g. ...
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">These names are used across the common code and various architectures. Not all
architectures need to implement all of these functions.
I believe|guest_physmap_add_page()| (which internally calls|guest_physmap_add_entry()|)
is needed to be implemented for all architectures, while|map_regions_p2mt()| is used
by Arm and the common Dom0less-related code, and because of RISC-V is going to re-use
common Dom0less code it is implementing this function too.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">First, my comment was solely about this one function above. And then I didn't
even know Arm had such a function. It's not used from common code (except again
from dom0less code where it should have been better abstracted, imo). I'm also
not surprised I wasn't aware of it since, as can be implied from the above,
otherwise I would likely have complained about its name not fitting the general
scheme (which isn't all that good either).
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
If I'm right, there is nothing similar to|map_regions_p2mt()| in the common headers.

Anyway, I think we could follow up with a patch to rename this function to
something more appropriate.

I was thinking about adding something like|map_regions_to_guest()|,|map_p2m_regions()|,
or|map_p2m_memory()| to|xen/mm.h|, along with proper renaming in the Arm code.

Does that make sense?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Imo that seemingly redundant function (i.e. if it's really needed) would want
to be named guest_physmap_&lt;whatever&gt;().</pre>
    </blockquote>
    <pre>If it is redundant what is expected to be used instead to map_regions_p2mt() to map MMIO,
for example, to guest: guest_physmap_add_page()? Based on the comment above the definition
of this function it is for RAM: /* Untyped version for RAM only, for compatibility */

</pre>
    <pre>~ Oleksii
</pre>
  </body>
</html>

--------------Q0pqgelkPEJQcl6Ri6v0t71d--

