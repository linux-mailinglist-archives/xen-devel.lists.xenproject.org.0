Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 656AFA9711D
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 17:37:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963121.1354182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Fg1-0006zI-Pb; Tue, 22 Apr 2025 15:36:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963121.1354182; Tue, 22 Apr 2025 15:36:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Fg1-0006xD-M0; Tue, 22 Apr 2025 15:36:49 +0000
Received: by outflank-mailman (input) for mailman id 963121;
 Tue, 22 Apr 2025 15:36:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NnGu=XI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u7Fg0-0006wW-Sk
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 15:36:48 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99c1ed22-1f8f-11f0-9eb0-5ba50f476ded;
 Tue, 22 Apr 2025 17:36:47 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a064a3e143so441377f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 08:36:47 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa420683sm15692394f8f.20.2025.04.22.08.36.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 08:36:46 -0700 (PDT)
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
X-Inumbo-ID: 99c1ed22-1f8f-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745336206; x=1745941006; darn=lists.xenproject.org;
        h=in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZouUHaOXGJo6zsh+NMun7vt5sY2xVQyjZc7KQyc4Bo=;
        b=LcAL5DzyqgyOjlmH/AKGDFlt1lc8ad5WWiU7YTZegsLrPV+OIYtuf1OYT16hY67PAb
         W5l7CGjBMU/HXHVchmrJhBDLS0hi+xPwygZUs92AKLcXdQAeGeYZOLygTiB3JsoAQhu/
         H+M2kN1fyou19o5GhWxm5IQQsD/L1YTzjUE/Bs5AUg3C86RWnwRvZTrSDOL4vmiZMoFe
         6yrNfQdAgwFf28bVlqveUy8ilZS60WzE7gilplbHT/LVJ+bbyVAMMJBBL7AIxk/Azi1j
         0O6/CAH9wxB2fko6XDnKYif4uwzmUqcx4RSl9oA/VYoQy9n0FWSLy1G8+sOLX0jkHlAS
         PReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745336206; x=1745941006;
        h=in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gZouUHaOXGJo6zsh+NMun7vt5sY2xVQyjZc7KQyc4Bo=;
        b=G/dXySvz94ClWXQTWaT8hKGyJb3s7/kEj9UMm4tVhSKjXDJrDcXP+t3Sj9GD7Cwt97
         a0YNz76pknZLYzNt8mKe3AjW85iexmngpGRX+5DVysbJ7HBY4hpB4hIQgBsh2lHJGQmk
         l/AeSd3s7MASCSZHj1lm/45+lue1Gnh5LzadUXN57/2PW+OhTPa8qcH0hJvnszK0p2kR
         Y1brIt5tMm1YTQyv2NKLGbji66a2zcjAeMHTURy9HE/67ElKpDRyTs/QPzTGqKajrwt5
         LJrbvYSrmr0i+oxiDlRVfAsU4NWNaxFEw9feaFYpmqyJwPqfsWmD0bPfs8y+DIxYiikS
         OBGw==
X-Forwarded-Encrypted: i=1; AJvYcCXbWAnnwriqmlQZJnNB6AMQlq+vpPX9ZZ5TKqEyViRJ0eR0+G0O6zEqyTRiEuHgWXRDaX2U2vmTEcA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy4KT5h4Sgg85qO2W9zfoKwTn0fIHTjhUueA7Kbo8Io72Oaf/DW
	BsqgOgefTUOlO3PTRF90W+scvNkV2JOMT2xX9Zkuc3zDZV3vDbCN
X-Gm-Gg: ASbGncsDePfF9DLkigcpeS0oHDJyRwNpyMHcT9XD1XJQWroYxeMq89dAcaauuBkTPo3
	5ozsSzdXn2uSiei4WqxA1WWZBzXjMwQ3mfE3F2OrrVgGi/JgPwxX0qakhAVyjcRYPNVNv/jYjp2
	tVEa7Kuy3IyjsmA+ryRmiazeKTn2Z/HK1X+rqYNLaJbrTA6o1VI6tCuPnrFMW/rY4BA96tJBuhI
	NDbZZJo+x3fInE66ZjAz0bBPo+SPJvY0Qe9O/n/hYuCqcJAJdlZrVj7qVAGgSCfkf2353ZB0xyI
	pyZEDLz132UatuVkvjFr4EYRpIy5DXWsQmoeMHeEDddNbUyCIvCfTtitJH0YtD8Rzsb0szUNYMq
	8eVJXMXEmrDNTkwFl
X-Google-Smtp-Source: AGHT+IEDYIw3dMMtAEfq6f2xhKa/NvdCq5+gU1hGChfeZAVKLdAcSScLAC/lj0nSK5nou6jDXVkiqw==
X-Received: by 2002:a05:6000:144d:b0:39c:1257:dbaa with SMTP id ffacd0b85a97d-39efbaf2477mr12161038f8f.58.1745336206423;
        Tue, 22 Apr 2025 08:36:46 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------SnOcsL6gdKBY7OSz5IHvCJ8M"
Message-ID: <54f90f7f-cbce-47bd-96d0-d395aa698db8@gmail.com>
Date: Tue, 22 Apr 2025 17:36:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] xen/common: dom0less: introduce common
 domain-build.c
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1744626032.git.oleksii.kurochko@gmail.com>
 <9dbf651ce177a7292f80879373e86a51305f216e.1744626032.git.oleksii.kurochko@gmail.com>
 <faa552cb-d933-492b-b3ed-e803856265ab@suse.com>
 <6010658f-9e29-40d9-902c-890cb27a2a4b@gmail.com>
Content-Language: en-US
In-Reply-To: <6010658f-9e29-40d9-902c-890cb27a2a4b@gmail.com>

This is a multi-part message in MIME format.
--------------SnOcsL6gdKBY7OSz5IHvCJ8M
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/22/25 5:26 PM, Oleksii Kurochko wrote:
>
>
> On 4/17/25 4:45 PM, Jan Beulich wrote:
>> On 14.04.2025 17:56, Oleksii Kurochko wrote:
>>> --- a/xen/include/xen/fdt-domain-build.h
>>> +++ b/xen/include/xen/fdt-domain-build.h
>>> @@ -5,6 +5,7 @@
>>>   #include <xen/bootfdt.h>
>>>   #include <xen/device_tree.h>
>>>   #include <xen/fdt-kernel.h>
>>> +#include <xen/mm.h>
>>>   #include <xen/types.h>
>>>   
>>>   #if __has_include(<asm/domain_build.h>)
>>> @@ -32,7 +33,37 @@ int make_memory_node(const struct kernel_info *kinfo, int addrcells,
>>>                        int sizecells, const struct membanks *mem);
>>>   int make_timer_node(const struct kernel_info *kinfo);
>>>   
>>> -unsigned int get_allocation_size(paddr_t size);
>>> +
>>> +static inline int get_allocation_size(paddr_t size)
>>> +{
>>> +    /*
>>> +     * get_order_from_bytes returns the order greater than or equal to
>>> +     * the given size, but we need less than or equal. Adding one to
>>> +     * the size pushes an evenly aligned size into the next order, so
>>> +     * we can then unconditionally subtract 1 from the order which is
>>> +     * returned.
>>> +     */
>>> +    return get_order_from_bytes(size + 1) - 1;
>>> +}
>>> +
>>> +typedef unsigned long (*copy_to_guest_phys_cb)(struct domain *d,
>>> +                                               paddr_t gpa,
>>> +                                               void *buf,
>> This very much looks like the latest now, when the code is made common,
>> it wants to be const void *. Even if this may require another prereq
>> patch.
>>
>> However, instead of using a function pointer, couldn't the now common
>> code call copy_to_guest_phys_flush_dcache() conditionally upon
>> IS_ENABLED(CONFIG_<whatever>)?
> I thought about having IS_ENABLED(CONFIG_ARM) as, at the moment, this is necessary to
> be called only for Arm as guest domain on Arm could be ran with cache disabled so to be sure
> that DTB, kernel and initrd is fully in RAM this function should be called.
>
> For RISC-V, it isn't possible case as guest domain won't run with cache disabled.

Here I meant flush_dcache() part of copy_to_guest_phys_flush_dcache().

~ Oleksii

>> Or provide a weak
>> copy_to_guest_phys_flush_dcache() which would simply call
>> copy_to_guest_phys()?
> Could it be a weak function with empty implementation?
> Is copy_to_guest_phys() implemented for other archs?

--------------SnOcsL6gdKBY7OSz5IHvCJ8M
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
    <div class="moz-cite-prefix">On 4/22/25 5:26 PM, Oleksii Kurochko
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:6010658f-9e29-40d9-902c-890cb27a2a4b@gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 4/17/25 4:45 PM, Jan Beulich
        wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:faa552cb-d933-492b-b3ed-e803856265ab@suse.com">
        <pre wrap="" class="moz-quote-pre">On 14.04.2025 17:56, Oleksii Kurochko wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">--- a/xen/include/xen/fdt-domain-build.h
+++ b/xen/include/xen/fdt-domain-build.h
@@ -5,6 +5,7 @@
 #include &lt;xen/bootfdt.h&gt;
 #include &lt;xen/device_tree.h&gt;
 #include &lt;xen/fdt-kernel.h&gt;
+#include &lt;xen/mm.h&gt;
 #include &lt;xen/types.h&gt;
 
 #if __has_include(&lt;asm/domain_build.h&gt;)
@@ -32,7 +33,37 @@ int make_memory_node(const struct kernel_info *kinfo, int addrcells,
                      int sizecells, const struct membanks *mem);
 int make_timer_node(const struct kernel_info *kinfo);
 
-unsigned int get_allocation_size(paddr_t size);
+
+static inline int get_allocation_size(paddr_t size)
+{
+    /*
+     * get_order_from_bytes returns the order greater than or equal to
+     * the given size, but we need less than or equal. Adding one to
+     * the size pushes an evenly aligned size into the next order, so
+     * we can then unconditionally subtract 1 from the order which is
+     * returned.
+     */
+    return get_order_from_bytes(size + 1) - 1;
+}
+
+typedef unsigned long (*copy_to_guest_phys_cb)(struct domain *d,
+                                               paddr_t gpa,
+                                               void *buf,
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">This very much looks like the latest now, when the code is made common,
it wants to be const void *. Even if this may require another prereq
patch.

However, instead of using a function pointer, couldn't the now common
code call copy_to_guest_phys_flush_dcache() conditionally upon
IS_ENABLED(CONFIG_&lt;whatever&gt;)? </pre>
      </blockquote>
      <pre>I thought about having IS_ENABLED(CONFIG_ARM) as, at the moment, this is necessary to
be called only for Arm as guest domain on Arm could be ran with cache disabled so to be sure
that DTB, kernel and initrd is fully in RAM this function should be called.

For RISC-V, it isn't possible case as guest domain won't run with cache disabled.</pre>
    </blockquote>
    <pre>Here I meant flush_dcache() part of copy_to_guest_phys_flush_dcache().

~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:6010658f-9e29-40d9-902c-890cb27a2a4b@gmail.com">
      <pre>
</pre>
      <blockquote type="cite"
        cite="mid:faa552cb-d933-492b-b3ed-e803856265ab@suse.com">
        <pre wrap="" class="moz-quote-pre">Or provide a weak
copy_to_guest_phys_flush_dcache() which would simply call
copy_to_guest_phys()?</pre>
      </blockquote>
      <pre>Could it be a weak function with empty implementation?
Is copy_to_guest_phys() implemented for other archs?</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------SnOcsL6gdKBY7OSz5IHvCJ8M--

