Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 933C3B1E97C
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 15:47:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1074387.1437012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukNQj-0002ka-MK; Fri, 08 Aug 2025 13:46:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1074387.1437012; Fri, 08 Aug 2025 13:46:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukNQj-0002hU-JT; Fri, 08 Aug 2025 13:46:45 +0000
Received: by outflank-mailman (input) for mailman id 1074387;
 Fri, 08 Aug 2025 13:46:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2rj7=2U=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ukNQi-0002hO-6L
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 13:46:44 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d6911b5-745e-11f0-b898-0df219b8e170;
 Fri, 08 Aug 2025 15:46:41 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-af93c3bac8fso312229666b.2
 for <xen-devel@lists.xenproject.org>; Fri, 08 Aug 2025 06:46:42 -0700 (PDT)
Received: from [192.168.1.17] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a1e8359sm1493378766b.89.2025.08.08.06.46.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Aug 2025 06:46:40 -0700 (PDT)
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
X-Inumbo-ID: 1d6911b5-745e-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754660801; x=1755265601; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9X/gHSWHoD5/52Bh3JqREg4+5ErH7JV/Pztmadne+Vo=;
        b=eQVGtWHx69NFc29s3zBk0dM/ptM59L03KnB6iyBsr4mNOnoq3dENpPxyTWxtHz4gBA
         epWjcOzCxie0OByQNdGGYJWhoGYt1h++p80sSY32ruQ90Nmj/XBav9WPL3RQnmWZaa55
         2GkFB+PkXep419HSQJzTeyeRdPIzhWGDbQ1x8gJzopUt6PsVeBkFb44TNBJQ0E7v4foZ
         7H8RKXRxm6+7GxXnW4QzKksA+IROTWPOMH0A7t+YyRQ+VKf5zE/3Gf7Vlu+fB52vopYW
         e6n0C9z9ApMSFFOa+++kY7bOOL/WKyUHuwculZza2D6T+VksatOQhQ1QmW7ZrJUgJA63
         dbKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754660801; x=1755265601;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9X/gHSWHoD5/52Bh3JqREg4+5ErH7JV/Pztmadne+Vo=;
        b=EVFwwRWLOQjNMMLLYacCh5MaOLKpS5AH7749BS9V0OB+shs6zBTbfKwyCKyecw7An2
         t7zWm0gG3VNP7md8cdaGHJKwnVXY7Py/psSKCH3nMIMDdU6eZtsFHjLUTWf9F/i13mLf
         5ir+kMzCMs/JHx2/OwJjYL8zIo+apLuF4Ye7sUTqlT5ntruB8DA9USA5j/uUOVacQxIK
         Fa8rwAQQZDWGou9fH2ogfbEXTZ934AVtpMbmhNKvJDKw+nuBJn52QX8IbotcAADSRdhE
         5PAHvhoZ4zjR4etZKsmTCK1Kzih7g815kNztL+w9EqtBg2bXQayGT3/JpBzwkL6i80Xe
         xJ6A==
X-Forwarded-Encrypted: i=1; AJvYcCW1cWTDqAimKaYnIg6dLvSBa7FkHVPIHmril7G9chyNIMoIcMGI5Qyoak1Zn8Uvn9oWcxPEP/8MVz0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzKi+X141JqD82e02vB4t5QwFgSIZPDDj08WFJ2oaEiD4+mzJhp
	ynUrqzNWV9cezwMq8fCKe8125EfhSiDPV4NPSbOYP5vJNgmxfAbyy/Wp
X-Gm-Gg: ASbGncuIH5vQQWuxbJ0RxftDx8H/ud+qCf66cQxL5n4xPgSyrbCEndJ9YlBHUXFoOjM
	JzDYI2EQXuxpv4ehOTc2qFPNjO/Xf6Fqr5thX/ZWTCjLRgCM4HSfC5K8XT2exw/FfmVbAWmcQRs
	CRUq2F0Q1UYmc8rZOjIGJfUpDedn4fVMM6XjhCsq8r+t2SgC0RVHhsWxEsO6zspGWjTZqAjM3ht
	7gUvERxoKBNxOz8kOzvC119nEbyo2JuYgZwtXFsZ670r4E5yUO9nRzCkw0ifpfCJIK92ccphnXU
	GCxOp8KRu1WKRZ/VjMGcdtVvfEC7a9UVtEPPogH5Kbh3rErrlBCX1uhLx1zojyKBlITsyqt6Wp4
	GCjCkt54+tG+8s7fgTNv3ReP6rwWTiB/9/GeLy4O8kYZVnsdV6BWi0IpZZU3WMDxA+x1p7Ko4
X-Google-Smtp-Source: AGHT+IG2csbz+Qw9X2IDb/H+Yt9lAGgaf/HP8bwc1mA1dQBm1Mw/3SjEqmp08n5rm7Q2w6P6Ddmt7g==
X-Received: by 2002:a17:907:a45:b0:af1:8336:6651 with SMTP id a640c23a62f3a-af9c64f7465mr294133766b.33.1754660801051;
        Fri, 08 Aug 2025 06:46:41 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------UeLToCNY0qfZGDEeATW01CXA"
Message-ID: <31c75a64-8b69-47ac-9e08-6010fa6cfb9c@gmail.com>
Date: Fri, 8 Aug 2025 15:46:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/20] xen/riscv: implement function to map memory in
 guest p2m
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <e00dcbecf8f0dbe863628dcc45526100f9ee86a3.1753973161.git.oleksii.kurochko@gmail.com>
 <e7b4b220-4da9-4a87-a4d6-179350849eaa@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <e7b4b220-4da9-4a87-a4d6-179350849eaa@suse.com>

This is a multi-part message in MIME format.
--------------UeLToCNY0qfZGDEeATW01CXA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/5/25 5:20 PM, Jan Beulich wrote:
> On 31.07.2025 17:58, Oleksii Kurochko wrote:
>> Implement map_regions_p2mt() to map a region in the guest p2m with
>> a specific p2m type. The memory attributes will be derived from the
>> p2m type. This function is going to be called from dom0less common
>> code.
> s/is going to be/is/ ? Such a call exists already, after all.
>
>> --- a/xen/arch/riscv/include/asm/p2m.h
>> +++ b/xen/arch/riscv/include/asm/p2m.h
>> @@ -121,21 +121,22 @@ static inline int guest_physmap_mark_populate_on_demand(struct domain *d,
>>       return -EOPNOTSUPP;
>>   }
>>   
>> -static inline int guest_physmap_add_entry(struct domain *d,
>> -                                          gfn_t gfn, mfn_t mfn,
>> -                                          unsigned long page_order,
>> -                                          p2m_type_t t)
>> -{
>> -    BUG_ON("unimplemented");
>> -    return -EINVAL;
>> -}
>> +/*
>> + * Map a region in the guest p2m with a specific p2m type.
> What is "the guest p2m"? In your answer, please consider the possible
> (and at some point likely necessary) existence of altp2m and nestedp2m.
> In patch 04 you introduce p2m_get_hostp2m(), and I expect it's that
> what you mean here.

In the current one context it is host p2m. I can update the comment with:
"guest's hostp2m".

>
>> --- a/xen/arch/riscv/p2m.c
>> +++ b/xen/arch/riscv/p2m.c
>> @@ -9,6 +9,41 @@
>>   
>>   unsigned int __read_mostly p2m_root_order;
>>   
>> +/*
>> + * Force a synchronous P2M TLB flush.
>> + *
>> + * Must be called with the p2m lock held.
>> + */
>> +static void p2m_force_tlb_flush_sync(struct p2m_domain *p2m)
>> +{
>> +    struct domain *d = p2m->domain;
> Pointer-to-const please. Personally, given the implementation of this
> function (and also ...
>
>> +    ASSERT(p2m_is_write_locked(p2m));
>> +
>> +    sbi_remote_hfence_gvma(d->dirty_cpumask, 0, 0);
>> +
>> +    p2m->need_flush = false;
>> +}
>> +
>> +void p2m_tlb_flush_sync(struct p2m_domain *p2m)
>> +{
>> +    if ( p2m->need_flush )
>> +        p2m_force_tlb_flush_sync(p2m);
>> +}
> ... this one) I'd further ask for the function parameters to also be
> pointer-to-const, but Andrew may object to that. Andrew - it continues to
> be unclear to me under what conditions you agree with adding const, and
> under what conditions you would object to me asking for such. Please can
> you take the time to clarify this?
>
>> +/* Unlock the flush and do a P2M TLB flush if necessary */
>> +void p2m_write_unlock(struct p2m_domain *p2m)
>> +{
>> +    /*
>> +     * The final flush is done with the P2M write lock taken to avoid
>> +     * someone else modifying the P2M wbefore the TLB invalidation has
> Nit: Stray 'w'.
>
>> +     * completed.
>> +     */
>> +    p2m_tlb_flush_sync(p2m);
> Wasn't the plan to have this be conditional?

Not really, probably, I misunderstood you before.

Previously, I only had|p2m_force_tlb_flush_sync()| here, instead of
|p2m_tlb_flush_sync()|, and the latter includes a condition check on
|p2m->need_flush|.

>
>> @@ -139,3 +174,33 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
>>   
>>       return 0;
>>   }
>> +
>> +static int p2m_set_range(struct p2m_domain *p2m,
>> +                         gfn_t sgfn,
>> +                         unsigned long nr,
>> +                         mfn_t smfn,
>> +                         p2m_type_t t)
>> +{
>> +    return -EOPNOTSUPP;
>> +}
>> +
>> +static int p2m_insert_mapping(struct p2m_domain *p2m, gfn_t start_gfn,
>> +                              unsigned long nr, mfn_t mfn, p2m_type_t t)
>> +{
>> +    int rc;
>> +
>> +    p2m_write_lock(p2m);
>> +    rc = p2m_set_range(p2m, start_gfn, nr, mfn, t);
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
>> +    return p2m_insert_mapping(p2m_get_hostp2m(d), gfn, nr, mfn, p2mt);
>> +}
> And eventually both helper functions will gain further callers? Otherwise
> it's a little hard to see why they would both need to be separate functions.

Good point.
Actually, I think that it is enough to have map_regions_p2mt() as it is used
for dom0less common code, and re-use it every where potentially p2m_insert_mapping()
will be needed.

~ Oleksii

--------------UeLToCNY0qfZGDEeATW01CXA
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
    <div class="moz-cite-prefix">On 8/5/25 5:20 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:e7b4b220-4da9-4a87-a4d6-179350849eaa@suse.com">
      <pre wrap="" class="moz-quote-pre">On 31.07.2025 17:58, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Implement map_regions_p2mt() to map a region in the guest p2m with
a specific p2m type. The memory attributes will be derived from the
p2m type. This function is going to be called from dom0less common
code.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
s/is going to be/is/ ? Such a call exists already, after all.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -121,21 +121,22 @@ static inline int guest_physmap_mark_populate_on_demand(struct domain *d,
     return -EOPNOTSUPP;
 }
 
-static inline int guest_physmap_add_entry(struct domain *d,
-                                          gfn_t gfn, mfn_t mfn,
-                                          unsigned long page_order,
-                                          p2m_type_t t)
-{
-    BUG_ON("unimplemented");
-    return -EINVAL;
-}
+/*
+ * Map a region in the guest p2m with a specific p2m type.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
What is "the guest p2m"? In your answer, please consider the possible
(and at some point likely necessary) existence of altp2m and nestedp2m.
In patch 04 you introduce p2m_get_hostp2m(), and I expect it's that
what you mean here.</pre>
    </blockquote>
    <pre>In the current one context it is host p2m. I can update the comment with:
"guest's hostp2m".

</pre>
    <blockquote type="cite"
      cite="mid:e7b4b220-4da9-4a87-a4d6-179350849eaa@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -9,6 +9,41 @@
 
 unsigned int __read_mostly p2m_root_order;
 
+/*
+ * Force a synchronous P2M TLB flush.
+ *
+ * Must be called with the p2m lock held.
+ */
+static void p2m_force_tlb_flush_sync(struct p2m_domain *p2m)
+{
+    struct domain *d = p2m-&gt;domain;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Pointer-to-const please. Personally, given the implementation of this
function (and also ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    ASSERT(p2m_is_write_locked(p2m));
+
+    sbi_remote_hfence_gvma(d-&gt;dirty_cpumask, 0, 0);
+
+    p2m-&gt;need_flush = false;
+}
+
+void p2m_tlb_flush_sync(struct p2m_domain *p2m)
+{
+    if ( p2m-&gt;need_flush )
+        p2m_force_tlb_flush_sync(p2m);
+}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... this one) I'd further ask for the function parameters to also be
pointer-to-const, but Andrew may object to that. Andrew - it continues to
be unclear to me under what conditions you agree with adding const, and
under what conditions you would object to me asking for such. Please can
you take the time to clarify this?

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+/* Unlock the flush and do a P2M TLB flush if necessary */
+void p2m_write_unlock(struct p2m_domain *p2m)
+{
+    /*
+     * The final flush is done with the P2M write lock taken to avoid
+     * someone else modifying the P2M wbefore the TLB invalidation has
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Nit: Stray 'w'.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+     * completed.
+     */
+    p2m_tlb_flush_sync(p2m);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Wasn't the plan to have this be conditional?</pre>
    </blockquote>
    <pre>Not really, probably, I misunderstood you before.

Previously, I only had <code data-start="76" data-end="104">p2m_force_tlb_flush_sync()</code> here, instead of
<code data-start="122" data-end="144">p2m_tlb_flush_sync()</code>, and the latter includes a condition check on
<code data-start="191" data-end="208">p2m-&gt;need_flush</code>.

</pre>
    <blockquote type="cite"
      cite="mid:e7b4b220-4da9-4a87-a4d6-179350849eaa@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -139,3 +174,33 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
 
     return 0;
 }
+
+static int p2m_set_range(struct p2m_domain *p2m,
+                         gfn_t sgfn,
+                         unsigned long nr,
+                         mfn_t smfn,
+                         p2m_type_t t)
+{
+    return -EOPNOTSUPP;
+}
+
+static int p2m_insert_mapping(struct p2m_domain *p2m, gfn_t start_gfn,
+                              unsigned long nr, mfn_t mfn, p2m_type_t t)
+{
+    int rc;
+
+    p2m_write_lock(p2m);
+    rc = p2m_set_range(p2m, start_gfn, nr, mfn, t);
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
+    return p2m_insert_mapping(p2m_get_hostp2m(d), gfn, nr, mfn, p2mt);
+}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
And eventually both helper functions will gain further callers? Otherwise
it's a little hard to see why they would both need to be separate functions.</pre>
    </blockquote>
    <pre>Good point.
Actually, I think that it is enough to have map_regions_p2mt() as it is used
for dom0less common code, and re-use it every where potentially p2m_insert_mapping()
will be needed.
</pre>
    <pre>~ Oleksii
</pre>
  </body>
</html>

--------------UeLToCNY0qfZGDEeATW01CXA--

