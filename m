Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D2CAF7304
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 13:55:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032084.1405840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXIWE-0001mv-Rt; Thu, 03 Jul 2025 11:54:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032084.1405840; Thu, 03 Jul 2025 11:54:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXIWE-0001lU-Of; Thu, 03 Jul 2025 11:54:22 +0000
Received: by outflank-mailman (input) for mailman id 1032084;
 Thu, 03 Jul 2025 11:54:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jdSv=ZQ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uXIWD-0001lO-ES
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 11:54:21 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71cfbf7e-5804-11f0-b894-0df219b8e170;
 Thu, 03 Jul 2025 13:54:16 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-60c5b7cae8bso9258310a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Jul 2025 04:54:16 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60c831cd0a9sm10574216a12.60.2025.07.03.04.54.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jul 2025 04:54:14 -0700 (PDT)
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
X-Inumbo-ID: 71cfbf7e-5804-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751543656; x=1752148456; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F+PzACbTBlw8mA1pkHVYJrwhi9625jdzHeHzNMqMAOg=;
        b=PS7HbW30EoTxgAzFJBHq1Z+DXq4nUSLAiXbFuj0zno0w8E6umtdbNeKKKK4qX93gjI
         dt6CGrw94OsS7zopzw6kxFhE1xCO+UZdCuSsdTknW2J5GvALeZBX0jRMp2HvU+eOLrz0
         ULz0UVK6Jx4z738bjwOpUWMf2Sb0AkYwi0F1+1lj+JuGOjb/96zOp7La8w/TYKUvQhyH
         IxR/EpAygPF2qSSXZWe87f2HN3RUa+599CX1XHfx9LUbkJDV/4wo0io0VDRIZL9Uhc+X
         s9vhejj+8mpWIeVEYyZIdctf8o7+hHh20+/OA9mSmHU5h5g+KhY7pf160RagBJOw4be1
         VcWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751543656; x=1752148456;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F+PzACbTBlw8mA1pkHVYJrwhi9625jdzHeHzNMqMAOg=;
        b=TUciE3uqzLyHlf3SetW9eHNJ2CLklohDHBAq8I03KUX+xH3oHr4TPlPj3RD9XtH4y0
         7wFjgPlD+XCDWtM2JQopEvXdW6M40MDUXxSIyA1Pt0I9fN+tXY9y9klKmP+/CxqIxfL7
         5B9fSJLfowEPLrFmNkWI23vSH9n+KqSbQRlRaGeD0fAjAIp8MKZ03gSxWj/+5DooMjgU
         pEcoA37g9wzZK3fHJLish7uQbQ2Bh8xQ8qbSvmPkXZi7U4d5OAOlYkVMooFa1UxA6gsv
         Y58MBQOtzKAP6jP70xXnlXGFi6tV9Padzy2NhxK2y+AwE9ar57Km3baMXToXf04nv/Rw
         vDgA==
X-Forwarded-Encrypted: i=1; AJvYcCWwZPpILUWjsopSHauMTp1k/GZZBQ7DyzkyiV3BKh09YpKuF5FB7W9MTs0hYgzXSphu/0FS8vFMscs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzdg8+BEiiKdTQdIuEXBlupnc5/jV9QBwGZu7/Qs4DHniJdew0J
	+FOEqN2N1aRFnHHZ7/iGl9onFE2CW5WbXUgnhOYrD1LubTuvay5LRAHf
X-Gm-Gg: ASbGncv9NIALT4ndG7CsXp/MlVzEE59uLhfDJ/rdnj1RLC86ZsO4Lqi/bB3aLP+gT40
	oz9Lxgke3bVYo82Z5A1Uk545P/11VbIacVzgpmFtuCZAE7dA+UgB/TL/Wm7ikrveXvS7nvT2AMP
	jjfHc0DAIydK9hO4xGXMgQo69Yl4Gz+DzGFNQAg6ElKzyaSeqTfvK2WERt4MSxf08JXG7y6JmnX
	WgXLQCfosBoV9MDeoGfsiDxeIxS/+oEDw6i5seKEVYwI7KSua7iepFZNQI9X1DL0VtPcer9BCsW
	BB2n6thq2dkuTreZPJQUQ3m/5cjNltu8Rm/Wd26lqIFHxIJetRfxhHEoghzzqztL7yqm6713aph
	wi9OaOckPiuXBOWYGQeBRefSnx5WcuknTeet5poAnWzsHtQ==
X-Google-Smtp-Source: AGHT+IGjLowpRoD1DpZ7vJNFPrE8xQQ+ayBf/+1ABieeCSPyA1LAQUg/Xr+T6PHO2WWbmgsrBgSDRQ==
X-Received: by 2002:a05:6402:2390:b0:607:2b27:7f41 with SMTP id 4fb4d7f45d1cf-60e6cc75b47mr2064089a12.4.1751543655244;
        Thu, 03 Jul 2025 04:54:15 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------ZJo5NImyf3nJkXpaKibQSO4p"
Message-ID: <0c1f9567-5530-4f90-8996-86a1f9662b52@gmail.com>
Date: Thu, 3 Jul 2025 13:54:13 +0200
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <03f0a7eb-f541-4f2b-8b88-500fd483dd48@suse.com>

This is a multi-part message in MIME format.
--------------ZJo5NImyf3nJkXpaKibQSO4p
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/3/25 1:33 PM, Jan Beulich wrote:
> On 03.07.2025 13:02, Oleksii Kurochko wrote:
>> On 6/30/25 5:59 PM, Jan Beulich wrote:
>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>> +                              unsigned long nr, mfn_t mfn, p2m_type_t t)
>>>> +{
>>>> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
>>>> +    int rc;
>>>> +
>>>> +    p2m_write_lock(p2m);
>>>> +    rc = p2m_set_entry(p2m, start_gfn, nr, mfn, t, p2m->default_access);
>>>> +    p2m_write_unlock(p2m);
>>>> +
>>>> +    return rc;
>>>> +}
>>>> +
>>>> +int map_regions_p2mt(struct domain *d,
>>>> +                     gfn_t gfn,
>>>> +                     unsigned long nr,
>>>> +                     mfn_t mfn,
>>>> +                     p2m_type_t p2mt)
>>>> +{
>>>> +    return p2m_insert_mapping(d, gfn, nr, mfn, p2mt);
>>>> +}
>>> What is this function doing here? The description says "for generic mapping
>>> purposes", which really may mean anything. Plus, if and when you need it, it
>>> wants to come with a name that fits with e.g. ...
>> These names are used across the common code and various architectures. Not all
>> architectures need to implement all of these functions.
>> I believe|guest_physmap_add_page()| (which internally calls|guest_physmap_add_entry()|)
>> is needed to be implemented for all architectures, while|map_regions_p2mt()| is used
>> by Arm and the common Dom0less-related code, and because of RISC-V is going to re-use
>> common Dom0less code it is implementing this function too.
> First, my comment was solely about this one function above. And then I didn't
> even know Arm had such a function. It's not used from common code (except again
> from dom0less code where it should have been better abstracted, imo). I'm also
> not surprised I wasn't aware of it since, as can be implied from the above,
> otherwise I would likely have complained about its name not fitting the general
> scheme (which isn't all that good either).

If I'm right, there is nothing similar to|map_regions_p2mt()| in the common headers.

Anyway, I think we could follow up with a patch to rename this function to
something more appropriate.

I was thinking about adding something like|map_regions_to_guest()|,|map_p2m_regions()|,
or|map_p2m_memory()| to|xen/mm.h|, along with proper renaming in the Arm code.

Does that make sense?

>
>>>> +int guest_physmap_add_entry(struct domain *d,
>>>> +                            gfn_t gfn,
>>>> +                            mfn_t mfn,
>>>> +                            unsigned long page_order,
>>>> +                            p2m_type_t t)
>>> ... this one, to understand their relationship / difference.
>> Basically, the difference is only in API and where they are expected to be used:
>> - guest_physmap_add_entry() to map and set a specific p2m type for a page.
>> - map_regions_p2mt() to map a region (mostly MMIO) in the guest p2m with
>>     a specific p2m type.
> Sorry, from this description they still look basically identical to me. The
> visible difference being that one takes a "nr" argument and the other a
> "page_order" one. Which still makes them largely redundant, and which still
> suggests that the earlier one's name doesn't really fit.
>
>> I added both of them here as they are implemented in a similar way.
>> I will re-word commit subject and message:
>>     xen/riscv: implement functions to map memory in guest p2m
>>
>>     Introduce guest_physmap_add_entry() to map a page and assign a specific
>>     p2m type, and map_regions_p2mt() to map a region (typically MMIO) in
>>     the guest p2m with a designated p2m type.
> I.e., as per above, two functions for basically the same purpose.

Generally, I agree that the purpose is the same.

I will then just drop|guest_physmap_add_entry()| and use only
|map_regions_p2mt()| (or whatever name we decide on).

~ Oleksii

--------------ZJo5NImyf3nJkXpaKibQSO4p
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
    <div class="moz-cite-prefix">On 7/3/25 1:33 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:03f0a7eb-f541-4f2b-8b88-500fd483dd48@suse.com">
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
        <pre wrap="" class="moz-quote-pre">
These names are used across the common code and various architectures. Not all
architectures need to implement all of these functions.
I believe|guest_physmap_add_page()| (which internally calls|guest_physmap_add_entry()|)
is needed to be implemented for all architectures, while|map_regions_p2mt()| is used
by Arm and the common Dom0less-related code, and because of RISC-V is going to re-use
common Dom0less code it is implementing this function too.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
First, my comment was solely about this one function above. And then I didn't
even know Arm had such a function. It's not used from common code (except again
from dom0less code where it should have been better abstracted, imo). I'm also
not surprised I wasn't aware of it since, as can be implied from the above,
otherwise I would likely have complained about its name not fitting the general
scheme (which isn't all that good either).</pre>
    </blockquote>
    <pre data-start="50" data-end="240">If I'm right, there is nothing similar to <code
    data-start="92" data-end="112">map_regions_p2mt()</code> in the common headers.

Anyway, I think we could follow up with a patch to rename this function to
something more appropriate.</pre>
    <pre data-start="242" data-end="412">I was thinking about adding something like <code
    data-start="285" data-end="309">map_regions_to_guest()</code>, <code
    data-start="311" data-end="330">map_p2m_regions()</code>,
or <code data-start="335" data-end="353">map_p2m_memory()</code> to <code
    data-start="357" data-end="367">xen/mm.h</code>, along with proper renaming in the Arm code.</pre>
    <pre data-start="414" data-end="435" data-is-last-node=""
    data-is-only-node="">Does that make sense?

</pre>
    <blockquote type="cite"
      cite="mid:03f0a7eb-f541-4f2b-8b88-500fd483dd48@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+int guest_physmap_add_entry(struct domain *d,
+                            gfn_t gfn,
+                            mfn_t mfn,
+                            unsigned long page_order,
+                            p2m_type_t t)
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">... this one, to understand their relationship / difference.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Basically, the difference is only in API and where they are expected to be used:
- guest_physmap_add_entry() to map and set a specific p2m type for a page.
- map_regions_p2mt() to map a region (mostly MMIO) in the guest p2m with
   a specific p2m type.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Sorry, from this description they still look basically identical to me. The
visible difference being that one takes a "nr" argument and the other a
"page_order" one. Which still makes them largely redundant, and which still
suggests that the earlier one's name doesn't really fit.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">I added both of them here as they are implemented in a similar way.
I will re-word commit subject and message:
   xen/riscv: implement functions to map memory in guest p2m

   Introduce guest_physmap_add_entry() to map a page and assign a specific
   p2m type, and map_regions_p2mt() to map a region (typically MMIO) in
   the guest p2m with a designated p2m type.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I.e., as per above, two functions for basically the same purpose.</pre>
    </blockquote>
    <pre>Generally, I agree that the purpose is the same.

I will then just drop <code data-start="72" data-end="99">guest_physmap_add_entry()</code> and use only
<code data-start="115" data-end="135">map_regions_p2mt()</code> (or whatever name we decide on).</pre>
    <pre>~ Oleksii
</pre>
  </body>
</html>

--------------ZJo5NImyf3nJkXpaKibQSO4p--

