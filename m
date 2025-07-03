Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE56CAF7162
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 13:02:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032014.1405790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXHho-0007G0-CX; Thu, 03 Jul 2025 11:02:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032014.1405790; Thu, 03 Jul 2025 11:02:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXHho-0007E1-98; Thu, 03 Jul 2025 11:02:16 +0000
Received: by outflank-mailman (input) for mailman id 1032014;
 Thu, 03 Jul 2025 11:02:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jdSv=ZQ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uXHhm-0007Di-7V
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 11:02:14 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2bb267b3-57fd-11f0-b894-0df219b8e170;
 Thu, 03 Jul 2025 13:02:12 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ae0bc7aa21bso1142455966b.2
 for <xen-devel@lists.xenproject.org>; Thu, 03 Jul 2025 04:02:12 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae3d0351285sm169766466b.23.2025.07.03.04.02.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jul 2025 04:02:10 -0700 (PDT)
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
X-Inumbo-ID: 2bb267b3-57fd-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751540531; x=1752145331; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=imrwkHAr/x9EX+7mmgtJXEPgZ90CbEZ9S1Et3uwTnXI=;
        b=MB9z3YAfELQ4IMVtjpfpGXN6DekAOmzaozqm72NQijuA0tvt1cEC19Sy6TO4Zk8iAc
         Hc4NQgvLhV9wzjBsTM3GtWnNrlPJF5RVD73L/BG68c/a6Ic3Ma+r73cSQftlipSjB+2l
         z76o1bTDk/NnydStnlHnKteD+bl006owtnA4RSpSnTMYvR1hR+nR2sxS2AAG1slWjlyh
         qjjx/xVT3ydnp2vkbI55KT9l4uoR6PKMUaYYx4QsjUBVFN44fnMsFCpsOrNWLiSX/esa
         uIp953xxbkjfo1fUxOoalyCx0zqEM3yELbdwzXfkxscLqM4aIfcrlmFwn2S+rKCz9p1i
         yO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751540531; x=1752145331;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=imrwkHAr/x9EX+7mmgtJXEPgZ90CbEZ9S1Et3uwTnXI=;
        b=W+tl+5ql6qIpwaFohIiYP4ur4KOiiwgw2Onbtw7gQmLCePwT4AYAkJLMqaSZf325Vw
         3AdjjVCdXWnJRqX21n3Ztp/ZSLlBaYOdKj8tFsUcYqHAkFWhLQQ0ZfpuIaY8Kxwh5cNf
         4xcPV4bzBvmStYaQFH+mxa0EoqqHwPrvBholIzuGgKWtvEVfwZIWcGfpOgABi0DTpa74
         4avC8IIrYm045xDE4QmmoI8GP1D73xqp1v36LR40Cm9FvpfWlOPssc1bq6nyoxhw/2u2
         ratzF64EZxTRGKDvJkXSM4IzQWeG6Q9lf5r098WU9sby7PsVzM9qjfFCcaeh9SlGaGlN
         LRnQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0ry494Y/1rzE+uBP6R9MqMJARSDdUB9EEMhqrZryddM628c7LTbYXzZfihdK5gGID2i0AmMpNaNI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxiOfC4oSkATxsVhYCsDhd0iDP2VwROugzw3hA9aFuHrq++NGKp
	KAC9BLV6Ia2MJ5K/nU/+C1FkyL5KTcFmUx8cF13FVcUH03dT0bpKlgU0
X-Gm-Gg: ASbGncsj9hxskX5I6WIFgEaqNJzyQnWqo+jCMolipIc/kMdNhHgj9QX7YwpdBmd+J41
	efYFnYbPapDzwjTZrT+R+B3bOZf4kO43Nq6jkztZOJcbPzNNUnB/1rgVxSaSA6Ktzt95kvdWO8E
	m9ipDOwWIoQk95LRMohldqsaONZBNbhd6nu9hSN/Ti3YAFZg+KlL2fPzqX9LB4XS0FbgQtJjU0i
	PnZG5IwIzlOC3JmQH3lVQCQsWOQEygM1Z6889WbeaZKMGv7s8C9a+HZ7ducE2StryEzgCTrAajP
	EhC+Rso/bXrO25MBH5bvy1VvAeEIOsYl8rfYgoeDkcyLxmE1F4KWo3LS+Bblpfw/meFfL/AYMK4
	7YnUvl/4B0ohBHuWRTn1VePVpXh0rUOKm5B0=
X-Google-Smtp-Source: AGHT+IHzNSWvQBgnhxnCYlHS8Ofkk4s790Ivs1gcQFZETcFhrU5e8Tgv0YajGroET8CAI6JBYNxevA==
X-Received: by 2002:a17:907:d2e3:b0:ad8:8efe:31fd with SMTP id a640c23a62f3a-ae3c2ce9d46mr632083566b.52.1751540531290;
        Thu, 03 Jul 2025 04:02:11 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------N2hto0SVtZTOqsZgINrHwUip"
Message-ID: <5fbe849c-3b8a-45dd-a217-c1dbf831da47@gmail.com>
Date: Thu, 3 Jul 2025 13:02:09 +0200
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f1e26c40-c70d-4d86-96ec-7643a9d08e76@suse.com>

This is a multi-part message in MIME format.
--------------N2hto0SVtZTOqsZgINrHwUip
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/30/25 5:59 PM, Jan Beulich wrote:
> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>> +                              unsigned long nr, mfn_t mfn, p2m_type_t t)
>> +{
>> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
>> +    int rc;
>> +
>> +    p2m_write_lock(p2m);
>> +    rc = p2m_set_entry(p2m, start_gfn, nr, mfn, t, p2m->default_access);
>> +    p2m_write_unlock(p2m);
>> +
>> +    return rc;
>> +}
>> +
>> +int map_regions_p2mt(struct domain *d,
>> +                     gfn_t gfn,
>> +                     unsigned long nr,
>> +                     mfn_t mfn,
>> +                     p2m_type_t p2mt)
>> +{
>> +    return p2m_insert_mapping(d, gfn, nr, mfn, p2mt);
>> +}
> What is this function doing here? The description says "for generic mapping
> purposes", which really may mean anything. Plus, if and when you need it, it
> wants to come with a name that fits with e.g. ...

These names are used across the common code and various architectures. Not all
architectures need to implement all of these functions.
I believe|guest_physmap_add_page()| (which internally calls|guest_physmap_add_entry()|)
is needed to be implemented for all architectures, while|map_regions_p2mt()| is used
by Arm and the common Dom0less-related code, and because of RISC-V is going to re-use
common Dom0less code it is implementing this function too.

>> +int guest_physmap_add_entry(struct domain *d,
>> +                            gfn_t gfn,
>> +                            mfn_t mfn,
>> +                            unsigned long page_order,
>> +                            p2m_type_t t)
> ... this one, to understand their relationship / difference.

Basically, the difference is only in API and where they are expected to be used:
- guest_physmap_add_entry() to map and set a specific p2m type for a page.
- map_regions_p2mt() to map a region (mostly MMIO) in the guest p2m with
   a specific p2m type.

I added both of them here as they are implemented in a similar way.
I will re-word commit subject and message:
   xen/riscv: implement functions to map memory in guest p2m

   Introduce guest_physmap_add_entry() to map a page and assign a specific
   p2m type, and map_regions_p2mt() to map a region (typically MMIO) in
   the guest p2m with a designated p2m type.

   Currently, this functionality is not fully operational, as p2m_set_entry()
   still returns -EOPNOTSUPP.

   Additionally, introduce p2m_write_(un)lock() to protect modifications to
   the p2m page tables, along with p2m TLB flush helpers to ensure proper
   TLB invalidation (if necessary) when the p2m lock is released.

~ Oleksii

--------------N2hto0SVtZTOqsZgINrHwUip
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
    <div class="moz-cite-prefix">On 6/30/25 5:59 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:f1e26c40-c70d-4d86-96ec-7643a9d08e76@suse.com">
      <pre wrap="" class="moz-quote-pre">On 10.06.2025 15:05, Oleksii Kurochko wrote:
</pre>
      <pre wrap="" class="moz-quote-pre">
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
      <pre wrap="" class="moz-quote-pre">
What is this function doing here? The description says "for generic mapping
purposes", which really may mean anything. Plus, if and when you need it, it
wants to come with a name that fits with e.g. ...</pre>
    </blockquote>
    <pre>These names are used across the common code and various architectures. Not all
architectures need to implement all of these functions.
I believe <code data-start="195" data-end="221">guest_physmap_add_page()</code> (which internally calls <code
    data-start="246" data-end="273">guest_physmap_add_entry()</code>)
is needed to be implemented for all architectures, while <code
    data-start="319" data-end="339">map_regions_p2mt()</code> is used
by Arm and the common Dom0less-related code, and because of RISC-V is going to re-use
common Dom0less code it is implementing this function too.

</pre>
    <blockquote type="cite"
      cite="mid:f1e26c40-c70d-4d86-96ec-7643a9d08e76@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+int guest_physmap_add_entry(struct domain *d,
+                            gfn_t gfn,
+                            mfn_t mfn,
+                            unsigned long page_order,
+                            p2m_type_t t)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... this one, to understand their relationship / difference.</pre>
    </blockquote>
    <pre>Basically, the difference is only in API and where they are expected to be used:
- guest_physmap_add_entry() to map and set a specific p2m type for a page.
- map_regions_p2mt() to map a region (mostly MMIO) in the guest p2m with
  a specific p2m type.

I added both of them here as they are implemented in a similar way.
I will re-word commit subject and message:
  xen/riscv: implement functions to map memory in guest p2m

  Introduce guest_physmap_add_entry() to map a page and assign a specific
  p2m type, and map_regions_p2mt() to map a region (typically MMIO) in
  the guest p2m with a designated p2m type.

  Currently, this functionality is not fully operational, as p2m_set_entry()
  still returns -EOPNOTSUPP.

  Additionally, introduce p2m_write_(un)lock() to protect modifications to
  the p2m page tables, along with p2m TLB flush helpers to ensure proper
  TLB invalidation (if necessary) when the p2m lock is released.

~ Oleksii</pre>
  </body>
</html>

--------------N2hto0SVtZTOqsZgINrHwUip--

