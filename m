Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B539DB20C59
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 16:44:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077716.1438746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulTkv-0001K7-3Q; Mon, 11 Aug 2025 14:44:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077716.1438746; Mon, 11 Aug 2025 14:44:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulTkv-0001HQ-0I; Mon, 11 Aug 2025 14:44:09 +0000
Received: by outflank-mailman (input) for mailman id 1077716;
 Mon, 11 Aug 2025 14:44:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MOyo=2X=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ulTkt-0001HJ-LZ
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 14:44:07 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a101d46f-76c1-11f0-b898-0df219b8e170;
 Mon, 11 Aug 2025 16:44:05 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-af958127df5so669517266b.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 07:44:05 -0700 (PDT)
Received: from [192.168.1.17] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0766b8sm2035173166b.25.2025.08.11.07.44.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 07:44:03 -0700 (PDT)
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
X-Inumbo-ID: a101d46f-76c1-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754923444; x=1755528244; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kCDzhV1gdL7gWyvcPn5QunPXYe+y9kR3Y1+xAuyR2fA=;
        b=ibKc3z7jv7cDKGlZYdd7K7cyFdtG7VKROGX7zlRSkaJ0PoGRuaAwix3LPTzF0DA8zL
         262/S10KLC3wfQDHsBRvn5DxSCYb0oLFmDlstzJP3nBoPQjlkAoUbgH/crWR3K93ybBN
         TGUiTeVcBMs3djaf8jY5N8CU+haTPkErtCY4MSzFK2XI51YgtkV9yWw7Gop3TuoIXgiv
         PJmqYGPI7Xy2O0ILIOKvgJXyNnv0TCiEw24/ihWh3xvW/z4IJ2iJR+85X9zH10iKX2cj
         sQDZQdk8r0Mhgwyl5HKfGatTAtNfuntmfAM3CdYHy8Yzn/4KClCAZ507S+b5Ov9iK+X3
         d46w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754923444; x=1755528244;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kCDzhV1gdL7gWyvcPn5QunPXYe+y9kR3Y1+xAuyR2fA=;
        b=bQrjWYjTVE5oK9txfg30GMeUuDE79UiqLn+dEu1hv3M3RkGlr41q4URfwFwFPU/90D
         +eGUZRIzDOy2hOQyf6tbjC/qhlwGSntLriedupkY1V6no5+YuopRDPek7G+WMLMRK8Xy
         zc2GQazUQCULDeXlYXrjdzKWXo1vKV9xlqbnnVFufav+88iJvK45/J++WH5ssGSIL6t+
         9TIVImWVdmYw83zkbgtEct/CKy65waYJFju2koIlrdSo8R5rpe81m8Tt9m5tYKELEwgR
         +Ox/QW66K+czyX/fnVTQDgUWFoLLcGEAI6jkgEgJLjLrqYSu+RaEX66SgqWahJ2YIh3Q
         wm6Q==
X-Forwarded-Encrypted: i=1; AJvYcCV/N4os8rL6Ad6tUEpgciZEGYbTeOdJpRhaAzEgD1ynjhiZksibBFnrQ3V1fIABRfw/as30uxtZITM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzhXu88lj7V2Y41NxVHk0jNc0aLPpizr0LlneoCyXoHz13qzi6+
	xM+wDS1+bRRV699A00IeH/nvcC7umIjLGrGIsZRolL6eOTepD3tuqpQX
X-Gm-Gg: ASbGnctGguNxDqy8dgHbVuKEsYflMPo9xYPJ/Kn038BGvWzC31Sc0ethiwah5iBXTM8
	oorDFEEeTBNdGLIEDIoCRiiAEsEAU0dFup6h37I3MR5T8TzsgV32TBWVefUaD7AWS84Q9LsIB/N
	7i1pu8Ox708vsPst1VPvkxKGOFyUNwLHS4NqAq7uUqjgZ9sihMxCnRmq0NFDGArZPW+MSvVH7JW
	Yu6J266t1pMy9EtFV5XWepyLU6BXG0JMRI15WhvR2+rkosWMywj5Hidq+6GW6d+3Lg8WCQuZEVC
	DpGB/Yz7kmeThJUNAVpquP4gKScTuNqdY5Ei8DD/ihnR5bPYFV+49B0kTrZI6WV7AFHwaSYpETO
	Ohuq1SwBtlio5EmYF4rp/p1t/95b3DLxk8zYkdRy0ILc4q41JoTpuXQXUo2W0CD7EVgkOEOAc
X-Google-Smtp-Source: AGHT+IGN7TIsCqOijARoS/ywOjqc9fIHOfrBsImD7ZeAWAP87yA8pUS8cAGVCtd4old1JVWhutJkMw==
X-Received: by 2002:a17:907:9446:b0:ae3:4f57:2110 with SMTP id a640c23a62f3a-af9c6588280mr1326265366b.54.1754923444242;
        Mon, 11 Aug 2025 07:44:04 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------kAGi4LqE0ZJsty7WsbAHekyl"
Message-ID: <e0f21085-8cce-4778-b15d-6dfd5e615aa2@gmail.com>
Date: Mon, 11 Aug 2025 16:44:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/20] xen/riscv: Implement p2m_pte_from_mfn() and
 support PBMT configuration
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <1370613cd6f52e90591b15ad52c95d7c81908cf6.1753973161.git.oleksii.kurochko@gmail.com>
 <3ede10e7-8e43-4277-9197-14a3e5ab1cc1@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <3ede10e7-8e43-4277-9197-14a3e5ab1cc1@suse.com>

This is a multi-part message in MIME format.
--------------kAGi4LqE0ZJsty7WsbAHekyl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/11/25 1:36 PM, Jan Beulich wrote:
> On 31.07.2025 17:58, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/p2m.c
>> +++ b/xen/arch/riscv/p2m.c
>> @@ -1,3 +1,4 @@
>> +#include <xen/bug.h>
>>   #include <xen/domain_page.h>
>>   #include <xen/mm.h>
>>   #include <xen/rwlock.h>
>> @@ -197,6 +198,18 @@ static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
>>       return __map_domain_page(p2m->root + root_table_indx);
>>   }
>>   
>> +static int p2m_set_type(pte_t *pte, p2m_type_t t)
>> +{
>> +    int rc = 0;
>> +
>> +    if ( t > p2m_ext_storage )
> Seeing this separator enumerator in use, it becomes pretty clear that its name
> needs to change, so one doesn't need to go look at its definition to understand
> whether it's inclusive or exclusive. (This isn't helped by there presently being
> a spare entry, which, when made use of, might then cause problems with
> expressions like this one as well.)

Then|p2m_pte_type_count| might be a better name, as it indicates how many types are
stored directly in the PTE bits.

>
>> @@ -222,11 +235,71 @@ static inline void p2m_clean_pte(pte_t *p, bool clean_pte)
>>       p2m_write_pte(p, pte, clean_pte);
>>   }
>>   
>> -static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t)
>> +static void p2m_set_permission(pte_t *e, p2m_type_t t)
>>   {
>> -    panic("%s: hasn't been implemented yet\n", __func__);
>> +    e->pte &= ~PTE_ACCESS_MASK;
>> +
>> +    switch ( t )
>> +    {
>> +    case p2m_grant_map_rw:
>> +    case p2m_ram_rw:
>> +        e->pte |= PTE_READABLE | PTE_WRITABLE;
>> +        break;
> While I agree for r/w grants, shouldn't r/w RAM also be executable?
>
>> +    case p2m_ext_storage:
> Why exactly would this placeholder ...
>
>> +    case p2m_mmio_direct_io:
>> +        e->pte |= PTE_ACCESS_MASK;
>> +        break;
> ... gain full access? It shouldn't make it here at all, should it?

I missed to add break between them, but I don't remember why I
put it here.
It could be freely moved before "default".

And, yes, you are right it seems like is shouldn't be handled at all
in this function as this function isn't expected to be called with
this type as this type only is used to indicate that a real type is
stored somwehere.

>
>> +
>> +    case p2m_invalid:
>> +        e->pte &= ~(PTE_ACCESS_MASK | PTE_VALID);
> Redundantly masking off PTE_ACCESS_MASK? (Plus, for the entry to be
> invalid, turning off PTE_VALID alone ought to suffice anyway?)

Agree, turning off PTE_VALID would be just enough.

>> +        break;
>> +
>> +    case p2m_grant_map_ro:
>> +        e->pte |= PTE_READABLE;
>> +        break;
>> +
>> +    default:
>> +        ASSERT_UNREACHABLE();
>> +        break;
>> +    }
>> +}
>> +
>> +static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t, bool is_table)
>> +{
>> +    pte_t e = (pte_t) { PTE_VALID };
> This and the rest of the function demand that mfn != INVALID_MFN, no matter
> whether ...
>
>> +    switch ( t )
>> +    {
>> +    case p2m_mmio_direct_io:
>> +        e.pte |= PTE_PBMT_IO;
>> +        break;
>> +
>> +    default:
>> +        break;
>> +    }
>> +
>> +    pte_set_mfn(&e, mfn);
>> +
>> +    ASSERT(!(mfn_to_maddr(mfn) & ~PADDR_MASK));
> ... PADDR_MASK is actually narrow enough to catch that case. Maybe best to
> add an explicit assertion to that effect?

Then it should be enough instead of what we have now:
   ASSERT(mfn_valid(mfn));

>
>> +    if ( !is_table )
>> +    {
>> +        p2m_set_permission(&e, t);
>> +
>> +        if ( t < p2m_ext_storage )
>> +            p2m_set_type(&e, t);
>> +        else
>> +            panic("unimplemeted\n");
> The check is already done inside p2m_set_type() - why open-code it here?

It isn't really matters now (so could be dropped), but in further patch this part
of code will look like:
         metadata[indx].pte = p2m_invalid;

         if ( t < p2m_ext_storage )
             p2m_set_type(&e, t, indx);
         else
         {
             e.pte |= MASK_INSR(p2m_ext_storage, P2M_TYPE_PTE_BITS_MASK);
             p2m_set_type(metadata, t, indx);
         }
So my intention was to re-use p2m_set_type() without changing of a prototype. So,
if a type is stored in PTE bits then we pass PTE directly, if not - then pass
metadata.

Thanks.

~ Oleksii

--------------kAGi4LqE0ZJsty7WsbAHekyl
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
    <div class="moz-cite-prefix">On 8/11/25 1:36 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:3ede10e7-8e43-4277-9197-14a3e5ab1cc1@suse.com">
      <pre wrap="" class="moz-quote-pre">On 31.07.2025 17:58, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -1,3 +1,4 @@
+#include &lt;xen/bug.h&gt;
 #include &lt;xen/domain_page.h&gt;
 #include &lt;xen/mm.h&gt;
 #include &lt;xen/rwlock.h&gt;
@@ -197,6 +198,18 @@ static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
     return __map_domain_page(p2m-&gt;root + root_table_indx);
 }
 
+static int p2m_set_type(pte_t *pte, p2m_type_t t)
+{
+    int rc = 0;
+
+    if ( t &gt; p2m_ext_storage )
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Seeing this separator enumerator in use, it becomes pretty clear that its name
needs to change, so one doesn't need to go look at its definition to understand
whether it's inclusive or exclusive. (This isn't helped by there presently being
a spare entry, which, when made use of, might then cause problems with
expressions like this one as well.)</pre>
    </blockquote>
    <pre>Then <code data-start="53" data-end="73">p2m_pte_type_count</code> might be a better name, as it indicates how many types are
stored directly in the PTE bits.

</pre>
    <blockquote type="cite"
      cite="mid:3ede10e7-8e43-4277-9197-14a3e5ab1cc1@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -222,11 +235,71 @@ static inline void p2m_clean_pte(pte_t *p, bool clean_pte)
     p2m_write_pte(p, pte, clean_pte);
 }
 
-static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t)
+static void p2m_set_permission(pte_t *e, p2m_type_t t)
 {
-    panic("%s: hasn't been implemented yet\n", __func__);
+    e-&gt;pte &amp;= ~PTE_ACCESS_MASK;
+
+    switch ( t )
+    {
+    case p2m_grant_map_rw:
+    case p2m_ram_rw:
+        e-&gt;pte |= PTE_READABLE | PTE_WRITABLE;
+        break;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
While I agree for r/w grants, shouldn't r/w RAM also be executable?

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    case p2m_ext_storage:
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Why exactly would this placeholder ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    case p2m_mmio_direct_io:
+        e-&gt;pte |= PTE_ACCESS_MASK;
+        break;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... gain full access? It shouldn't make it here at all, should it?</pre>
    </blockquote>
    <pre>I missed to add break between them, but I don't remember why I
put it here.
It could be freely moved before "default".

And, yes, you are right it seems like is shouldn't be handled at all
in this function as this function isn't expected to be called with
this type as this type only is used to indicate that a real type is
stored somwehere.
</pre>
    <blockquote type="cite"
      cite="mid:3ede10e7-8e43-4277-9197-14a3e5ab1cc1@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
+    case p2m_invalid:
+        e-&gt;pte &amp;= ~(PTE_ACCESS_MASK | PTE_VALID);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Redundantly masking off PTE_ACCESS_MASK? (Plus, for the entry to be
invalid, turning off PTE_VALID alone ought to suffice anyway?)
</pre>
    </blockquote>
    <pre>Agree, turning off PTE_VALID would be just enough.
</pre>
    <blockquote type="cite"
      cite="mid:3ede10e7-8e43-4277-9197-14a3e5ab1cc1@suse.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+        break;
+
+    case p2m_grant_map_ro:
+        e-&gt;pte |= PTE_READABLE;
+        break;
+
+    default:
+        ASSERT_UNREACHABLE();
+        break;
+    }
+}
+
+static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t, bool is_table)
+{
+    pte_t e = (pte_t) { PTE_VALID };
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This and the rest of the function demand that mfn != INVALID_MFN, no matter
whether ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    switch ( t )
+    {
+    case p2m_mmio_direct_io:
+        e.pte |= PTE_PBMT_IO;
+        break;
+
+    default:
+        break;
+    }
+
+    pte_set_mfn(&amp;e, mfn);
+
+    ASSERT(!(mfn_to_maddr(mfn) &amp; ~PADDR_MASK));
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... PADDR_MASK is actually narrow enough to catch that case. Maybe best to
add an explicit assertion to that effect?</pre>
    </blockquote>
    <pre>Then it should be enough instead of what we have now:
  ASSERT(mfn_valid(mfn));

</pre>
    <blockquote type="cite"
      cite="mid:3ede10e7-8e43-4277-9197-14a3e5ab1cc1@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    if ( !is_table )
+    {
+        p2m_set_permission(&amp;e, t);
+
+        if ( t &lt; p2m_ext_storage )
+            p2m_set_type(&amp;e, t);
+        else
+            panic("unimplemeted\n");
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
The check is already done inside p2m_set_type() - why open-code it here?</pre>
    </blockquote>
    <pre>It isn't really matters now (so could be dropped), but in further patch this part
of code will look like:
        metadata[indx].pte = p2m_invalid;

        if ( t &lt; p2m_ext_storage )
            p2m_set_type(&amp;e, t, indx);
        else
        {
            e.pte |= MASK_INSR(p2m_ext_storage, P2M_TYPE_PTE_BITS_MASK);
            p2m_set_type(metadata, t, indx);
        }
So my intention was to re-use p2m_set_type() without changing of a prototype. So,
if a type is stored in PTE bits then we pass PTE directly, if not - then pass
metadata.

Thanks.
</pre>
    <pre>~ Oleksii</pre>
  </body>
</html>

--------------kAGi4LqE0ZJsty7WsbAHekyl--

