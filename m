Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F6AAF5DD9
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 17:59:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031402.1405227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWzrt-0003M8-Sj; Wed, 02 Jul 2025 15:59:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031402.1405227; Wed, 02 Jul 2025 15:59:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWzrt-0003J5-Pv; Wed, 02 Jul 2025 15:59:29 +0000
Received: by outflank-mailman (input) for mailman id 1031402;
 Wed, 02 Jul 2025 15:59:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QWaS=ZP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uWzrr-0003Ix-Rb
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 15:59:27 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87089a96-575d-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 17:59:25 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-60702d77c60so14166380a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 08:59:25 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae36327ce4asm1023074666b.163.2025.07.02.08.59.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 08:59:24 -0700 (PDT)
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
X-Inumbo-ID: 87089a96-575d-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751471965; x=1752076765; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JuIldrVBq0M11PeO1lSXGlfbCWeajVU16IxMmYzDqBM=;
        b=GhNmKdjXGTWfs43FR0V7dp6Ok4KlOlFfz1LZhBR+EAMc6yyFDp0uZ35W7UHnaB3rzZ
         Xx2zHZKXsNREq+SOWBfpYZly4s2dcJP/0kAbA3VJoxzbPNPWtxmDWDJtHGXAqiU0GNyX
         kRMfU2SGpzU9ZLmq07KjgEs+1FJ9phah1Ku71m4waYgTA0iyzXuIdPHS1WXyZfWJKbyB
         vlpyFdNVso5DcFJDYNhafxad1W6Dn99Mw8IYXKORwgX8f2DHPfHY35B/wLhmADMfCt7r
         wjgQT41wUzcYGB5AeqvA31xlasdNeGRePBd43UOzXKeL9QYw6Y9GW/4LvnqfNpYDCugR
         sJTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751471965; x=1752076765;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JuIldrVBq0M11PeO1lSXGlfbCWeajVU16IxMmYzDqBM=;
        b=WII/Wf8NERUej181r1Vdwjz551OOVVGVJpsXDI0AwGXxiBneBfrkAD+eMt00x+1a5A
         QzI2Y08ynLvTh8PZ8K6FFkBQGr6zvT0I3lgwU2UfBGP1g8SxNdK581GF0L2L8RF1TF+u
         BrEXjEXDS68bMUpabSoOm0KWIICunIsCIxlRzCfNHM+6pYE/hljmkCBXPOczg8YjQNrz
         BYqoC48RQDLn+ey3gGaGuiaS3/kZnIKEKskJzgFXZqNYVXC8IEnpYlIgyTFq4qf3atzk
         U+fx3ObuxcO/Cl2wZFkOfZd9nKaKT0zbAnxZItfMbgIsDLUarvTeJs31LyRgF7jONFSP
         kZaw==
X-Forwarded-Encrypted: i=1; AJvYcCWt4gELmNvJ5VKOzhp3eqpfGOMQUFBDaMRH+/CZrykuc4YgNTWJSMJsoX82eGht1hinuEkY1iVna4E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwMInMAayLOvyflQ9jwSnLWIzotnYuIFEaLqT9wQn+bimRDHJVd
	zDyxvMPjT+FmowKPS6lZ9TQa60LAP/ul33bHWI9CltJWHRvbcJmfimUy
X-Gm-Gg: ASbGncuf5jf1ZedEsW0jSl0bZ7BFWXnvLPG0TZ2jhFeAPTm2X7j8eKGO1AvFxEcShAY
	Pjao1J0I8YrNKYCUtHpBmGcFpzAl9QUT5Krg4W19wuyqAESxoPNgysYW9tFjMOkWYWtGuQ8Irut
	n8v8QFtc+Vwm4IYeyJuPQ6mnUhExy7MuBExg8CqX1DqGR2FSyM6ostepdAXMcwAQglYkwT6W0fR
	nfrkJecD070kjjPtggBHZX103kmhjLgZcGRtU2a/iUsQ+JkLbcqE7Sg+px9XYVmW6HU79xTV6nf
	dgZcbO8j+0LqIeunUyM9wsIR04nPkg3XoigTyMQRXtK2ozNEFk4wfyP46nKcjj53yCx44JV1MZO
	9Ur56A7Tfl1H0Mh7BdT4k+30YrBhBwFk6acA=
X-Google-Smtp-Source: AGHT+IHL3A8kxow/sWLqJoIeOUxBUx7DoL1Cw97QnjhqJUdTvHDT2KDnpvy/YTQrLw3zOry43JGVug==
X-Received: by 2002:a17:907:2d2a:b0:ad5:5b2e:655b with SMTP id a640c23a62f3a-ae3c2b4d9d0mr371911366b.25.1751471964823;
        Wed, 02 Jul 2025 08:59:24 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------pld813cglQuyB5Vma2N2RlbN"
Message-ID: <be826050-889b-4e4a-a358-5bfa18575533@gmail.com>
Date: Wed, 2 Jul 2025 17:59:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/17] xen/riscv: introduce page_set_xenheap_gfn()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <186e4a778a6dfab205428dfb4d0c59584a162a9f.1749555949.git.oleksii.kurochko@gmail.com>
 <b06c564f-7cf8-4c9c-9392-892ddc6d5ef4@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <b06c564f-7cf8-4c9c-9392-892ddc6d5ef4@suse.com>

This is a multi-part message in MIME format.
--------------pld813cglQuyB5Vma2N2RlbN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/30/25 5:48 PM, Jan Beulich wrote:
> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>> Introduce page_set_xenheap_gfn() helper to encode the GFN associated with
>> a Xen heap page directly into the type_info field of struct page_info.
>>
>> Introduce a GFN field in the type_info of a Xen heap page by reserving 10
>> bits (sufficient for both Sv32 and Sv39+ modes), and define PGT_gfn_mask
>> and PGT_gfn_width accordingly.
> This reads as if you wanted to encode the GFN in 10 bits.

I will reword it to:
   Reserve 10 MSB bits to store the usage counter and frame type;
   use all remaining bits to store the grant table frame GFN.
   It will be enough as Sv32 uses 22-bit GFNs and Sv{39, 47, 58} uses 44-bit GFNs.

>
> What would also help is if you said why you actually need this. x86, after
> all, gets away without anything like this. (But I understand you're more
> Arm-like here.)

I think with the rewording mentioned above it will be clear that it is needed for
grant tables. But I also can add the following:
   The grant table frame GFN will be stored directly in|struct page_info| instead
   of being maintained in separate status/shared arrays. To avoid increasing the
   size of|struct page_info|, the necessary bits are borrowed from the
|||type_info of struct page_info.|

>> @@ -229,9 +230,21 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
>>   #define PGT_writable_page PG_mask(1, 1)  /* has writable mappings?         */
>>   #define PGT_type_mask     PG_mask(1, 1)  /* Bits 31 or 63.                 */
>>   
>> -/* Count of uses of this frame as its current type. */
>> -#define PGT_count_width   PG_shift(2)
>> -#define PGT_count_mask    ((1UL << PGT_count_width) - 1)
>> + /* 9-bit count of uses of this frame as its current type. */
>> +#define PGT_count_mask    PG_mask(0x3FF, 10)
>> +
>> +/*
>> + * Sv32 has 22-bit GFN. Sv{39, 48, 57} have 44-bit GFN.
>> + * Thereby we can use for `type_info` 10 bits for all modes, having the same
>> + * amount of bits for `type_info` for all MMU modes let us avoid introducing
>> + * an extra #ifdef to that header:
>> + *   if we go with maximum possible bits for count on each configuration
>> + *   we would need to have a set of PGT_count_* and PGT_gfn_*).
>> + */
>> +#define PGT_gfn_width     PG_shift(10)
>> +#define PGT_gfn_mask      (BIT(PGT_gfn_width, UL) - 1)
>> +
>> +#define PGT_INVALID_XENHEAP_GFN   _gfn(PGT_gfn_mask)
> Commentary here would imo be preferable to be much closer to Arm's. I don't
> see the point of the extra verbosity (part of which may be fine to have in
> the description, except you already say something along these lines there).
> While in turn the comment talks of fewer bits than are actually being used
> in the RV64 case.

Sure, I will replace this comment with:
/*
  * Stored in bits [22:0] (Sv32) or [44:0] (Sv39,48,57) GFN if page is xenheap page.
  */

>> @@ -283,6 +296,19 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
>>   
>>   #define PFN_ORDER(pg) ((pg)->v.free.order)
>>   
>> +static inline void page_set_xenheap_gfn(struct page_info *p, gfn_t gfn)
>> +{
>> +    gfn_t gfn_ = gfn_eq(gfn, INVALID_GFN) ? PGT_INVALID_XENHEAP_GFN : gfn;
>> +    unsigned long x, nx, y = p->u.inuse.type_info;
>> +
>> +    ASSERT(is_xen_heap_page(p));
>> +
>> +    do {
>> +        x = y;
>> +        nx = (x & ~PGT_gfn_mask) | gfn_x(gfn_);
>> +    } while ( (y = cmpxchg(&p->u.inuse.type_info, x, nx)) != x );
>> +}
>> +
>>   extern unsigned char cpu0_boot_stack[];
>>   
>>   void setup_initial_pagetables(void);
> What about the "get" counterpart?

I haven't added it as it isn't used now and it will lead to compilation error as it will be static inline
(in a similar way as Arm introduces it).

As an option this patch could be dropped and introduced with an introduction of grant tables.

~ Oleksii

--------------pld813cglQuyB5Vma2N2RlbN
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
    <div class="moz-cite-prefix">On 6/30/25 5:48 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:b06c564f-7cf8-4c9c-9392-892ddc6d5ef4@suse.com">
      <pre wrap="" class="moz-quote-pre">On 10.06.2025 15:05, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Introduce page_set_xenheap_gfn() helper to encode the GFN associated with
a Xen heap page directly into the type_info field of struct page_info.

Introduce a GFN field in the type_info of a Xen heap page by reserving 10
bits (sufficient for both Sv32 and Sv39+ modes), and define PGT_gfn_mask
and PGT_gfn_width accordingly.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This reads as if you wanted to encode the GFN in 10 bits.</pre>
    </blockquote>
    <pre>I will reword it to:
  Reserve 10 MSB bits to store the usage counter and frame type;
  use all remaining bits to store the grant table frame GFN.
  It will be enough as Sv32 uses 22-bit GFNs and Sv{39, 47, 58} uses 44-bit GFNs.

</pre>
    <blockquote type="cite"
      cite="mid:b06c564f-7cf8-4c9c-9392-892ddc6d5ef4@suse.com">
      <pre wrap="" class="moz-quote-pre">

What would also help is if you said why you actually need this. x86, after
all, gets away without anything like this. (But I understand you're more
Arm-like here.)</pre>
    </blockquote>
    <pre>I think with the rewording mentioned above it will be clear that it is needed for
grant tables. But I also can add the following:
  The grant table frame GFN will be stored directly in <code
    data-start="134" data-end="152">struct page_info</code> instead
  of being maintained in separate status/shared arrays. To avoid increasing the 
  size of <code data-start="247" data-end="265">struct page_info</code>, the necessary bits are borrowed from the
<code>  </code><code data-start="308" data-end="325">type_info of struct page_info.</code>

</pre>
    <blockquote type="cite"
      cite="mid:b06c564f-7cf8-4c9c-9392-892ddc6d5ef4@suse.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -229,9 +230,21 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
 #define PGT_writable_page PG_mask(1, 1)  /* has writable mappings?         */
 #define PGT_type_mask     PG_mask(1, 1)  /* Bits 31 or 63.                 */
 
-/* Count of uses of this frame as its current type. */
-#define PGT_count_width   PG_shift(2)
-#define PGT_count_mask    ((1UL &lt;&lt; PGT_count_width) - 1)
+ /* 9-bit count of uses of this frame as its current type. */
+#define PGT_count_mask    PG_mask(0x3FF, 10)
+
+/*
+ * Sv32 has 22-bit GFN. Sv{39, 48, 57} have 44-bit GFN.
+ * Thereby we can use for `type_info` 10 bits for all modes, having the same
+ * amount of bits for `type_info` for all MMU modes let us avoid introducing
+ * an extra #ifdef to that header:
+ *   if we go with maximum possible bits for count on each configuration
+ *   we would need to have a set of PGT_count_* and PGT_gfn_*).
+ */
+#define PGT_gfn_width     PG_shift(10)
+#define PGT_gfn_mask      (BIT(PGT_gfn_width, UL) - 1)
+
+#define PGT_INVALID_XENHEAP_GFN   _gfn(PGT_gfn_mask)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Commentary here would imo be preferable to be much closer to Arm's. I don't
see the point of the extra verbosity (part of which may be fine to have in
the description, except you already say something along these lines there).
While in turn the comment talks of fewer bits than are actually being used
in the RV64 case.</pre>
    </blockquote>
    <pre>Sure, I will replace this comment with:
/*
 * Stored in bits [22:0] (Sv32) or [44:0] (Sv39,48,57) GFN if page is xenheap page.
 */
</pre>
    <blockquote type="cite"
      cite="mid:b06c564f-7cf8-4c9c-9392-892ddc6d5ef4@suse.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -283,6 +296,19 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
 
 #define PFN_ORDER(pg) ((pg)-&gt;v.free.order)
 
+static inline void page_set_xenheap_gfn(struct page_info *p, gfn_t gfn)
+{
+    gfn_t gfn_ = gfn_eq(gfn, INVALID_GFN) ? PGT_INVALID_XENHEAP_GFN : gfn;
+    unsigned long x, nx, y = p-&gt;u.inuse.type_info;
+
+    ASSERT(is_xen_heap_page(p));
+
+    do {
+        x = y;
+        nx = (x &amp; ~PGT_gfn_mask) | gfn_x(gfn_);
+    } while ( (y = cmpxchg(&amp;p-&gt;u.inuse.type_info, x, nx)) != x );
+}
+
 extern unsigned char cpu0_boot_stack[];
 
 void setup_initial_pagetables(void);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
What about the "get" counterpart?</pre>
    </blockquote>
    <pre>I haven't added it as it isn't used now and it will lead to compilation error as it will be static inline
(in a similar way as Arm introduces it).

As an option this patch could be dropped and introduced with an introduction of grant tables.
</pre>
    <pre>~ Oleksii
</pre>
  </body>
</html>

--------------pld813cglQuyB5Vma2N2RlbN--

