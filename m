Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EBFA77FAD
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 17:59:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934649.1336292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tze0t-0007Iu-Qy; Tue, 01 Apr 2025 15:58:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934649.1336292; Tue, 01 Apr 2025 15:58:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tze0t-0007Gj-O1; Tue, 01 Apr 2025 15:58:55 +0000
Received: by outflank-mailman (input) for mailman id 934649;
 Tue, 01 Apr 2025 15:58:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4pMn=WT=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tze0r-0007Gd-Sv
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 15:58:53 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34c1091f-0f12-11f0-9ffb-bf95429c2676;
 Tue, 01 Apr 2025 17:58:51 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-aaee2c5ee6eso859894266b.1
 for <xen-devel@lists.xenproject.org>; Tue, 01 Apr 2025 08:58:51 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac71922bf79sm777430666b.35.2025.04.01.08.58.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Apr 2025 08:58:50 -0700 (PDT)
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
X-Inumbo-ID: 34c1091f-0f12-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743523131; x=1744127931; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j8htelpKbTU2dix2B4lkHfx85WH71okU6YTp1RO/csU=;
        b=RqMKO4NMrnisWpVFDM82Y9ifZ4y6vFOzeDSnOTGc5cFIgO/p/D8IWNcAkjfThpsyrj
         qV152d+2+Jp0b01BjmGJC9i7LD+83i0CJ2fCjEAFkaddehkc+OyiS1cmAC99w7MUfcWI
         7NIdTxbnUnSVTNpxu5uIDRHW7t7TNqTnBMiuUAeJBDKnXG+3KqxsmRljb8ZxMwk4szdu
         nIyvd8C56Oa7jJohTH6hvuxyNPTPA3NrcDFgeOZH3NzqL2O3cH5e2BDCYixKxRv7IneT
         Jo7RGZgsk/gycVrfHQ0Db+1FN70wz9aBkdsagdhF2MUbyDoDZzH/Pk9+eE2Bau4LQRsX
         /YKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743523131; x=1744127931;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j8htelpKbTU2dix2B4lkHfx85WH71okU6YTp1RO/csU=;
        b=Z3yGQo+VwwXhQqQQAr3AxHczwSxqnFwTfBGaNeqVr7v4l0im2pcjgwZKmUysaLIcse
         2jCCvOLWPVNm1OZoKzgvEHUogws58oI/T3z93NOXu6OXbaZDNptjOBjYLDq75gVpW2Vt
         DsmnatfEVoQkRDISriJ1XVaAQ/ELgmyUIJSM+f9/9fnZWqJSMdqPPCmQPTHQ/LdxnjHx
         CKuCZ0XL42SzbPlBnxiiXTeAeVFRBhWyUcnlRMUVKoXD09gP7bXgfZuj41FV1PrAID6j
         3vfep2yJci72MTPEy794v8cz9eOreDpYhUHVHDOctpvONi7tm6UXW3LzmXMe1q2RC1xx
         uVsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvJApPExEbgBdMJII9AhTZXrSlNtuyCF6icxvxID8ZVYAQq0TQ7S7m3wlQJEVDtMnDVgx1X9Mbkj8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YziXtFTfE91lXDM5jeZLeSErSzN3jqXSPsXNNIpV/S+jL3fsDqu
	Z71uEs3k5+dnWEvm9e15F3Bqri6AjoP8GPzE6wcr1qnuvFzGbqI7
X-Gm-Gg: ASbGncv1a/k6V3L9sBNjnOQxNxwGKGzQqbL/a6pri2DpP5j4FEtMci/u+VxX8FZbiW7
	r5wbZ8+38kDr3PINjp49HCk7/LWvvlB1JZY4C5i/6d9e/wehgBE3f6Bp4DAxab43B7edVjif2u4
	1uhZEhYFrMcJN5BR3pwogx3zI6l3dbDNIKC2grT37YhPUmqMhnWblNirybthC82P3eoQ+DotvQQ
	69ohKQGn+3dCTbHKdxo5XPKgez++mgcxA6qND87pBGS8TVIwVxm0PNPYjIR6yl5XO+QaPgnws7f
	410/UcBPo8T7WymSgk9my0zUDP7cWMPO2Sdl/cFh6uQn79wExT7xkM8lJtC7jZvLBIs+pj0O5UU
	a+G22NJf/Y6QjLc8wQrwc
X-Google-Smtp-Source: AGHT+IFhXCuOgljTK8alXcoIlemvZQ0YKSpjnp43Og0j+ByHWhBl2b33+FOHWM+AIR2S5KaD3oHvWA==
X-Received: by 2002:a17:907:96a5:b0:ac3:ec77:27fb with SMTP id a640c23a62f3a-ac738a8b84cmr1061901066b.26.1743523131100;
        Tue, 01 Apr 2025 08:58:51 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------sSxrmNcgtobUfYa6NOQKX0v9"
Message-ID: <32264ccb-e566-41e0-973f-5bc7d874f970@gmail.com>
Date: Tue, 1 Apr 2025 17:58:50 +0200
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <54ebdcb7-071f-411f-803a-930dc330a497@suse.com>

This is a multi-part message in MIME format.
--------------sSxrmNcgtobUfYa6NOQKX0v9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/31/25 6:14 PM, Jan Beulich wrote:
> On 31.03.2025 17:20, Oleksii Kurochko wrote:
>> A randconfig job failed with the following issue:
>>    riscv64-linux-gnu-ld: Xen too large for early-boot assumptions
>>
>> The reason is that enabling the UBSAN config increased the size of
>> the Xen binary.
>>
>> Increase XEN_VIRT_SIZE to reserve enough space, allowing both UBSAN
>> and GCOV to be enabled together, with some slack for future growth.
> At some point you may want to use 2M mappings for .text (rx), .rodata
> (r), and .data (rw). Together with .init that would then completely
> fill those 8Mb afaict. Hence you may want to go a little further right
> away, e.g. to 16Mb.

It makes sense to me. I'll update to 16 Mb then right now.

>> +        _AC(XEN_VIRT_START, UL) >> vpn1_shift;
>> +    const unsigned long xen_virt_end_vpn =
>> +        xen_virt_starn_vpn + ((XEN_VIRT_SIZE >> vpn1_shift) - 1);
>> +
>>       if ((va >= DIRECTMAP_VIRT_START) &&
>>           (va <= DIRECTMAP_VIRT_END))
>>           return directmapoff_to_maddr(va - directmap_virt_start);
>>   
>> -    BUILD_BUG_ON(XEN_VIRT_SIZE != MB(2));
>> -    ASSERT((va >> (PAGETABLE_ORDER + PAGE_SHIFT)) ==
>> -           (_AC(XEN_VIRT_START, UL) >> (PAGETABLE_ORDER + PAGE_SHIFT)));
>> +    BUILD_BUG_ON(XEN_VIRT_SIZE != MB(8));
> Is it necessary to be != ? Won't > suffice?

It could be just > MB(2). Or perphaps >=.

>
>> +    ASSERT((va_vpn >= xen_virt_starn_vpn) && (va_vpn <= xen_virt_end_vpn));
> Are you sure about <= on the rhs of the && ?

I am using -1 [ ((XEN_VIRT_SIZE >> vpn1_shift) - 1) ] when calculating the xen_virt_end_vpn to make the range inclusive.
So it should be fine.

>
>> --- a/xen/arch/riscv/mm.c
>> +++ b/xen/arch/riscv/mm.c
>> @@ -31,20 +31,21 @@ unsigned long __ro_after_init phys_offset; /* = load_start - XEN_VIRT_START */
>>   #define LOAD_TO_LINK(addr) ((unsigned long)(addr) - phys_offset)
>>   
>>   /*
>> - * It is expected that Xen won't be more then 2 MB.
>> + * It is expected that Xen won't be more then 8 MB.
>>    * The check in xen.lds.S guarantees that.
>> - * At least 3 page tables (in case of Sv39 ) are needed to cover 2 MB.
>> + * At least 6 page tables (in case of Sv39) are needed to cover 8 MB.
>>    * One for each page level table with PAGE_SIZE = 4 Kb.
>>    *
>> - * One L0 page table can cover 2 MB(512 entries of one page table * PAGE_SIZE).
>> + * Four L0 page table can cover 8 MB(512 entries of
>> + * one page table * PAGE_SIZE).
>>    *
>>    * It might be needed one more page table in case when Xen load address
>>    * isn't 2 MB aligned.
>>    *
>> - * CONFIG_PAGING_LEVELS page tables are needed for the identity mapping,
>> + * (CONFIG_PAGING_LEVELS + 2) page tables are needed for the identity mapping,
>>    * except that the root page table is shared with the initial mapping
>>    */
>> -#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) * 2 + 1)
>> +#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS + 2) * 2 + 1)
> I'm in trouble fitting the comment updates with the update of the #define. Why
> would more tables be needed for the identity mapping?

Agree, it isn't needed more tables for the identity mapping.

>   Why does XEN_VIRT_SIZE
> not appear anywhere here?

I just used 8 Mb explicitly in the comment but I think you really asked me about definition
of PGTBL_INITIAL_COUNT where I just explicitly take into account 3 extra pages for L0.
I will update it with using of XEN_VIRT_SIZE to have more generic definition of PGTBL_INITIAL_COUNT.

Thanks

~ Oleksii

--------------sSxrmNcgtobUfYa6NOQKX0v9
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
    <div class="moz-cite-prefix">On 3/31/25 6:14 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:54ebdcb7-071f-411f-803a-930dc330a497@suse.com">
      <pre wrap="" class="moz-quote-pre">On 31.03.2025 17:20, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">A randconfig job failed with the following issue:
  riscv64-linux-gnu-ld: Xen too large for early-boot assumptions

The reason is that enabling the UBSAN config increased the size of
the Xen binary.

Increase XEN_VIRT_SIZE to reserve enough space, allowing both UBSAN
and GCOV to be enabled together, with some slack for future growth.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
At some point you may want to use 2M mappings for .text (rx), .rodata
(r), and .data (rw). Together with .init that would then completely
fill those 8Mb afaict. Hence you may want to go a little further right
away, e.g. to 16Mb.</pre>
    </blockquote>
    <pre>It makes sense to me. I'll update to 16 Mb then right now.

</pre>
    <blockquote type="cite"
      cite="mid:54ebdcb7-071f-411f-803a-930dc330a497@suse.com">
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
      <pre wrap="" class="moz-quote-pre">
Is it necessary to be != ? Won't &gt; suffice?</pre>
    </blockquote>
    <pre>It could be just &gt; MB(2). Or perphaps &gt;=.

</pre>
    <blockquote type="cite"
      cite="mid:54ebdcb7-071f-411f-803a-930dc330a497@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    ASSERT((va_vpn &gt;= xen_virt_starn_vpn) &amp;&amp; (va_vpn &lt;= xen_virt_end_vpn));
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Are you sure about &lt;= on the rhs of the &amp;&amp; ?</pre>
    </blockquote>
    <pre>I am using -1 [ ((XEN_VIRT_SIZE &gt;&gt; vpn1_shift) - 1) ] when calculating the xen_virt_end_vpn to make the range inclusive.
So it should be fine.

</pre>
    <blockquote type="cite"
      cite="mid:54ebdcb7-071f-411f-803a-930dc330a497@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -31,20 +31,21 @@ unsigned long __ro_after_init phys_offset; /* = load_start - XEN_VIRT_START */
 #define LOAD_TO_LINK(addr) ((unsigned long)(addr) - phys_offset)
 
 /*
- * It is expected that Xen won't be more then 2 MB.
+ * It is expected that Xen won't be more then 8 MB.
  * The check in xen.lds.S guarantees that.
- * At least 3 page tables (in case of Sv39 ) are needed to cover 2 MB.
+ * At least 6 page tables (in case of Sv39) are needed to cover 8 MB.
  * One for each page level table with PAGE_SIZE = 4 Kb.
  *
- * One L0 page table can cover 2 MB(512 entries of one page table * PAGE_SIZE).
+ * Four L0 page table can cover 8 MB(512 entries of
+ * one page table * PAGE_SIZE).
  *
  * It might be needed one more page table in case when Xen load address
  * isn't 2 MB aligned.
  *
- * CONFIG_PAGING_LEVELS page tables are needed for the identity mapping,
+ * (CONFIG_PAGING_LEVELS + 2) page tables are needed for the identity mapping,
  * except that the root page table is shared with the initial mapping
  */
-#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) * 2 + 1)
+#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS + 2) * 2 + 1)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I'm in trouble fitting the comment updates with the update of the #define. Why
would more tables be needed for the identity mapping?</pre>
    </blockquote>
    <pre>Agree, it isn't needed more tables for the identity mapping.

</pre>
    <blockquote type="cite"
      cite="mid:54ebdcb7-071f-411f-803a-930dc330a497@suse.com">
      <pre wrap="" class="moz-quote-pre"> Why does XEN_VIRT_SIZE
not appear anywhere here?</pre>
    </blockquote>
    <pre>I just used 8 Mb explicitly in the comment but I think you really asked me about definition
of PGTBL_INITIAL_COUNT where I just explicitly take into account 3 extra pages for L0.
I will update it with using of XEN_VIRT_SIZE to have more generic definition of PGTBL_INITIAL_COUNT.

Thanks

~ Oleksii

</pre>
  </body>
</html>

--------------sSxrmNcgtobUfYa6NOQKX0v9--

