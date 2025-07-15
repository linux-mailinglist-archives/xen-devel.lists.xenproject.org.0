Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F37B061B9
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 16:47:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044471.1414560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubgwH-0003xz-0f; Tue, 15 Jul 2025 14:47:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044471.1414560; Tue, 15 Jul 2025 14:47:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubgwG-0003vq-Tq; Tue, 15 Jul 2025 14:47:24 +0000
Received: by outflank-mailman (input) for mailman id 1044471;
 Tue, 15 Jul 2025 14:47:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pIFU=Z4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ubgwF-0003vk-C1
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 14:47:23 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c82e9c7-618a-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 16:47:20 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-60c5b7cae8bso9053426a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jul 2025 07:47:20 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-611e2d35bf8sm6557170a12.68.2025.07.15.07.47.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jul 2025 07:47:19 -0700 (PDT)
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
X-Inumbo-ID: 9c82e9c7-618a-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752590840; x=1753195640; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y2Fxv5GouFQE8ZPp7TfAQtIWU/9VslUSKXUrlD6Z6A8=;
        b=Hr31uzJYiEwSKk0AwD0WqvxgUV5/OOumxVglClUgsq38ZHcb8VT/vThpDjkdj8sOUJ
         zSbofGRidqH9sqXHjLuWgI6ro7KZWCOVr9tHWf/Bm3gs4S7xyCfnDS48zE4Jdkl7Z+dQ
         izyt9hgEPOdh4wCbFN84BlTLXUjtVjYIQjo6SoMt8iNGyRmCqu+GTKDupSD6SY5zWsOI
         xieBLuG8ttTnXXs6iy4YbQ2rNWJAAJ1NkNZBrDm/69t2oZlzSrK73/tHREv9y1cRmwgM
         izAuvZmdp2vtF06xbwkFWVWWrnMK3nquSG8gbEtZlqlq1pmnB1zGU6vfkcD9Z8ighBqK
         txFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752590840; x=1753195640;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y2Fxv5GouFQE8ZPp7TfAQtIWU/9VslUSKXUrlD6Z6A8=;
        b=I+WpeMTUNLIHhJg4w+QlRTX8XMhfyXBF+8h341S1kVicgE4NjYBOh7h+Aez5fP/MFf
         DUGaXz+lh5ICV+W30kxGEhqsFtCA177jEs6/j6g3hFjqUPAZR+JhgxvKbpdt2oKhNS+x
         3/WcZFWhr/KXjmbTFs1Hb/FarRdEnS8bjF+Uk/mPNjuBesMpeDOpT2BI3G9seeC/CGPE
         FKGcvPRPd2gfggATAb/dyThlCy5iPF40sKbBOQBsopDFK+qRD19QYJsLiIP6K+T9Cb6Z
         xlDoGk8ahK7m5nf67m0IJ21haht+K2vHbZQ8ZT2T3BVKIROfsBs0OX6J2ZpA8aGWIU9h
         NL+A==
X-Forwarded-Encrypted: i=1; AJvYcCVW4XwOdk+AZ8qH3DJ1HlTBN9lNRqjr+BvVHOU52MTzp/+rO5Xu+TREzCuk82Ju1cf31FnDQ/fPhNg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxo2cJC97u3kUAS4PFUdbDvq5rycuEAor4On+0DzLC24IQMn8VF
	5CYlDCcXo1nJW9ym7aoYPPS096U6Cv2o9QoW9XxxEEWWk7MPjKuoS4fI
X-Gm-Gg: ASbGncs9vGdCUJS2iMSOCmIlLAjbwcCr5qchB8LODkcF7QP/en2VTmUIKMzBanLQ29k
	f06IqfPmKssuFHa//iedVeBPN7362gvQH7iPfWH1rLJsCiND5gqMh7ErJOXhpwFweEnTMmsZCpK
	SD+8l03zSbFuPhxpB50KL5dKXap2XLzxBmSpuCKFus32VTDbz77EGbMWplmYzqTo9S1rUqG2tR0
	kBPsHMEHY9gUwaN/mn+G7qLcVJhSF36f1qussUhjhU1HKzJgrJJIYpn8K7w752kZRPLUuu3eZeA
	XDElBJvUZxtx7vN6+IoNjXMsHetB6jHIFuZ40EGSqezcr3i/g4oLx/NNBxHHRluCldJt25UNDRB
	wakfDEMn4n/5HA6Xpo276CIWOt1DLjqXM4QgpzfKUv7YoVDuNXjpTSPSh5e8w+k7A+JrPwzM=
X-Google-Smtp-Source: AGHT+IEvacjBE7UXFZZW7w+4Ao2BZUsYxM10KdSIh9AVdvVE4NAHW60ESZmKrtiSWApnVeg5Y3HvFA==
X-Received: by 2002:a05:6402:1eca:b0:607:16b1:7489 with SMTP id 4fb4d7f45d1cf-611e8487f11mr15881494a12.20.1752590839777;
        Tue, 15 Jul 2025 07:47:19 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------V2ZpHYHgOd76CQAy0A6kTIvq"
Message-ID: <640178f8-a189-4f84-abff-0ef87ba566a5@gmail.com>
Date: Tue, 15 Jul 2025 16:47:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/17] xen/riscv: Implement p2m_entry_from_mfn() and
 support PBMT configuration
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <994ab3dd6822c4cd02a6a576041da115abeff6ed.1749555949.git.oleksii.kurochko@gmail.com>
 <f6e789cd-0ef3-488d-94da-1b7c94946720@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f6e789cd-0ef3-488d-94da-1b7c94946720@suse.com>

This is a multi-part message in MIME format.
--------------V2ZpHYHgOd76CQAy0A6kTIvq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 7/1/25 5:08 PM, Jan Beulich wrote:
> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>
>> --- a/xen/arch/riscv/p2m.c
>> +++ b/xen/arch/riscv/p2m.c
>> @@ -345,6 +345,26 @@ static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
>>       return __map_domain_page(p2m->root + root_table_indx);
>>   }
>>   
>> +static int p2m_type_radix_set(struct p2m_domain *p2m, pte_t pte, p2m_type_t t)
> See comments on the earlier patch regarding naming.
>
>> +{
>> +    int rc;
>> +    gfn_t gfn = mfn_to_gfn(p2m->domain, mfn_from_pte(pte));
> How does this work, when you record GFNs only for Xenheap pages?

I think I don't understand what is an issue. Could you please provide
some extra details?

> I don't
> think you can get around having the caller pass in the GFN. At which point
> the PTE probably doesn't need passing.

It’s an option. PTE argument, I think, we still need because as we discussed
earlier, partly some P2M types will be stored in PTE bits.

I’m also wondering whether the MFN could be used to identify the P2M PTE’s type,
or if, in general, it isn’t unique (since different GFNs can map to the same MFN),
meaning it can't reliably be used to determine the PTE’s type. Right?

>
>> +    rc = radix_tree_insert(&p2m->p2m_type, gfn_x(gfn),
>> +                           radix_tree_int_to_ptr(t));
>> +    if ( rc == -EEXIST )
>> +    {
>> +        /* If a setting already exists, change it to the new one */
>> +        radix_tree_replace_slot(
>> +            radix_tree_lookup_slot(
>> +                &p2m->p2m_type, gfn_x(gfn)),
>> +            radix_tree_int_to_ptr(t));
>> +        rc = 0;
>> +    }
>> +
>> +    return rc;
>> +}
>> +
>>   static p2m_type_t p2m_type_radix_get(struct p2m_domain *p2m, pte_t pte)
>>   {
>>       void *ptr;
>> @@ -389,12 +409,87 @@ static inline void p2m_remove_pte(pte_t *p, bool clean_pte)
>>       p2m_write_pte(p, pte, clean_pte);
>>   }
>>   
>> -static pte_t p2m_entry_from_mfn(struct p2m_domain *p2m, mfn_t mfn,
>> -                                p2m_type_t t, p2m_access_t a)
>> +static void p2m_set_permission(pte_t *e, p2m_type_t t, p2m_access_t a)
>>   {
>> -    panic("%s: hasn't been implemented yet\n", __func__);
>> +    /* First apply type permissions */
>> +    switch ( t )
>> +    {
>> +    case p2m_ram_rw:
>> +        e->pte |= PTE_ACCESS_MASK;
>> +        break;
>> +
>> +    case p2m_mmio_direct_dev:
>> +        e->pte |= (PTE_READABLE | PTE_WRITABLE);
>> +        e->pte &= ~PTE_EXECUTABLE;
> What's wrong with code living in MMIO, e.g. in the ROM of a PCI device?
> Such code would want to be executable.

I think you are right and nothing wrong with code living in MMIO.

According to the spec:
   I/O regions can specify which combinations of read, write, or execute accesses
   to which data widths are supported.

>> +        break;
>> +
>> +    case p2m_invalid:
>> +        e->pte &= ~PTE_ACCESS_MASK;
>> +        break;
>> +
>> +    default:
>> +        BUG();
>> +        break;
>> +    }
> I think you ought to handle all types that are defined right away. I also
> don't think you should BUG() in the default case (also in the other switch()
> below). ASSERT_UNEACHABLE() may be fine, along with clearing all permissions
> in the entry for release builds.
>
>> +    /* Then restrict with access permissions */
>> +    switch ( a )
>> +    {
>> +    case p2m_access_rwx:
>> +        break;
>> +    case p2m_access_wx:
>> +        e->pte &= ~PTE_READABLE;
>> +        break;
>> +    case p2m_access_rw:
>> +        e->pte &= ~PTE_EXECUTABLE;
>> +        break;
>> +    case p2m_access_w:
>> +        e->pte &= ~(PTE_READABLE | PTE_EXECUTABLE);
>> +        e->pte &= ~PTE_EXECUTABLE;
>> +        break;
>> +    case p2m_access_rx:
>> +    case p2m_access_rx2rw:
>> +        e->pte &= ~PTE_WRITABLE;
>> +        break;
>> +    case p2m_access_x:
>> +        e->pte &= ~(PTE_READABLE | PTE_WRITABLE);
>> +        break;
>> +    case p2m_access_r:
>> +        e->pte &= ~(PTE_WRITABLE | PTE_EXECUTABLE);
>> +        break;
>> +    case p2m_access_n:
>> +    case p2m_access_n2rwx:
>> +        e->pte &= ~PTE_ACCESS_MASK;
>> +        break;
>> +    default:
>> +        BUG();
>> +        break;
>> +    }
> Nit: Blank lines between non-fall-through case blocks, please.
>
>> +static pte_t p2m_entry_from_mfn(struct p2m_domain *p2m, mfn_t mfn, p2m_type_t t, p2m_access_t a)
>> +{
>> +    pte_t e = (pte_t) { 1 };
> What's the 1 doing here?

Set valid bit of PTE to 1.

>
>> +    switch ( t )
>> +    {
>> +    case p2m_mmio_direct_dev:
>> +        e.pte |= PTE_PBMT_IO;
>> +        break;
>> +
>> +    default:
>> +        break;
>> +    }
>> +
>> +    p2m_set_permission(&e, t, a);
>> +
>> +    ASSERT(!(mfn_to_maddr(mfn) & ~PADDR_MASK));
>> +
>> +    pte_set_mfn(&e, mfn);
> Based on how things work on x86 (and how I would have expected them to also
> work on Arm), may I suggest that you set MFN ahead of permissions, so that
> the permissions setting function can use the MFN for e.g. a lookup in
> mmio_ro_ranges.

Sure, just a note that on Arm, the MFN is set last.

>
>> +    BUG_ON(p2m_type_radix_set(p2m, e, t));
> I'm not convinced of this error handling here either. Radix tree insertion
> _can_ fail, e.g. when there's no memory left. This must not bring down Xen,
> or we'll have an XSA right away. You could zap the PTE, or if need be you
> could crash the offending domain.

IIUC what is "zap the PTE", then I will do in this way:
     if ( p2m_set_type(p2m, e, t) )
         e.pte = 0;

But then it will lead to an MMU failure—how is that expected to be handled?
There’s no guarantee that, at the moment of handling this exception, enough
memory will be available to set a type for the PTE and also there is not really
clear how to detect in exception handler that it is needed just to re-try to
set a type. Or should we just call|domain_crash()|?
In that case, it seems more reasonable to call|domain_crash() |immediately in
|p2m_pte_from_mfn().|

>
> In this context (not sure if I asked before): With this use of a radix tree,
> how do you intend to bound the amount of memory that a domain can use, by
> making Xen insert very many entries?

I didn’t think about that. I assumed it would be enough to set the amount of
memory a guest domain can use by specifying|xen,domain-p2m-mem-mb| in the DTS,
or using some predefined value if|xen,domain-p2m-mem-mb| isn’t explicitly set.

Also, it seems this would just lead to the issue you mentioned earlier: when
the memory runs out,|domain_crash()| will be called or PTE will be zapped.

~ Oleksii

--------------V2ZpHYHgOd76CQAy0A6kTIvq
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
    <div class="moz-cite-prefix">On 7/1/25 5:08 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:f6e789cd-0ef3-488d-94da-1b7c94946720@suse.com">
      <pre wrap="" class="moz-quote-pre">On 10.06.2025 15:05, Oleksii Kurochko wrote:

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -345,6 +345,26 @@ static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
     return __map_domain_page(p2m-&gt;root + root_table_indx);
 }
 
+static int p2m_type_radix_set(struct p2m_domain *p2m, pte_t pte, p2m_type_t t)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
See comments on the earlier patch regarding naming.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+{
+    int rc;
+    gfn_t gfn = mfn_to_gfn(p2m-&gt;domain, mfn_from_pte(pte));
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
How does this work, when you record GFNs only for Xenheap pages? </pre>
    </blockquote>
    <pre>I think I don't understand what is an issue. Could you please provide
some extra details?

</pre>
    <blockquote type="cite"
      cite="mid:f6e789cd-0ef3-488d-94da-1b7c94946720@suse.com">
      <pre wrap="" class="moz-quote-pre">I don't
think you can get around having the caller pass in the GFN. At which point
the PTE probably doesn't need passing.</pre>
    </blockquote>
    <pre data-start="111" data-end="126">It’s an option. PTE argument, I think, we still need because as we discussed
earlier, partly some P2M types will be stored in PTE bits.

I’m also wondering whether the MFN could be used to identify the P2M PTE’s type,
or if, in general, it isn’t unique (since different GFNs can map to the same MFN),
meaning it can't reliably be used to determine the PTE’s type. Right?

</pre>
    <pre></pre>
    <blockquote type="cite"
      cite="mid:f6e789cd-0ef3-488d-94da-1b7c94946720@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    rc = radix_tree_insert(&amp;p2m-&gt;p2m_type, gfn_x(gfn),
+                           radix_tree_int_to_ptr(t));
+    if ( rc == -EEXIST )
+    {
+        /* If a setting already exists, change it to the new one */
+        radix_tree_replace_slot(
+            radix_tree_lookup_slot(
+                &amp;p2m-&gt;p2m_type, gfn_x(gfn)),
+            radix_tree_int_to_ptr(t));
+        rc = 0;
+    }
+
+    return rc;
+}
+
 static p2m_type_t p2m_type_radix_get(struct p2m_domain *p2m, pte_t pte)
 {
     void *ptr;
@@ -389,12 +409,87 @@ static inline void p2m_remove_pte(pte_t *p, bool clean_pte)
     p2m_write_pte(p, pte, clean_pte);
 }
 
-static pte_t p2m_entry_from_mfn(struct p2m_domain *p2m, mfn_t mfn,
-                                p2m_type_t t, p2m_access_t a)
+static void p2m_set_permission(pte_t *e, p2m_type_t t, p2m_access_t a)
 {
-    panic("%s: hasn't been implemented yet\n", __func__);
+    /* First apply type permissions */
+    switch ( t )
+    {
+    case p2m_ram_rw:
+        e-&gt;pte |= PTE_ACCESS_MASK;
+        break;
+
+    case p2m_mmio_direct_dev:
+        e-&gt;pte |= (PTE_READABLE | PTE_WRITABLE);
+        e-&gt;pte &amp;= ~PTE_EXECUTABLE;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
What's wrong with code living in MMIO, e.g. in the ROM of a PCI device?
Such code would want to be executable.
</pre>
    </blockquote>
    <pre>I think you are right and nothing wrong with code living in MMIO.

According to the spec:
  I/O regions can specify which combinations of read, write, or execute accesses
  to which data widths are supported.
</pre>
    <blockquote type="cite"
      cite="mid:f6e789cd-0ef3-488d-94da-1b7c94946720@suse.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+        break;
+
+    case p2m_invalid:
+        e-&gt;pte &amp;= ~PTE_ACCESS_MASK;
+        break;
+
+    default:
+        BUG();
+        break;
+    }
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I think you ought to handle all types that are defined right away. I also
don't think you should BUG() in the default case (also in the other switch()
below). ASSERT_UNEACHABLE() may be fine, along with clearing all permissions
in the entry for release builds.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    /* Then restrict with access permissions */
+    switch ( a )
+    {
+    case p2m_access_rwx:
+        break;
+    case p2m_access_wx:
+        e-&gt;pte &amp;= ~PTE_READABLE;
+        break;
+    case p2m_access_rw:
+        e-&gt;pte &amp;= ~PTE_EXECUTABLE;
+        break;
+    case p2m_access_w:
+        e-&gt;pte &amp;= ~(PTE_READABLE | PTE_EXECUTABLE);
+        e-&gt;pte &amp;= ~PTE_EXECUTABLE;
+        break;
+    case p2m_access_rx:
+    case p2m_access_rx2rw:
+        e-&gt;pte &amp;= ~PTE_WRITABLE;
+        break;
+    case p2m_access_x:
+        e-&gt;pte &amp;= ~(PTE_READABLE | PTE_WRITABLE);
+        break;
+    case p2m_access_r:
+        e-&gt;pte &amp;= ~(PTE_WRITABLE | PTE_EXECUTABLE);
+        break;
+    case p2m_access_n:
+    case p2m_access_n2rwx:
+        e-&gt;pte &amp;= ~PTE_ACCESS_MASK;
+        break;
+    default:
+        BUG();
+        break;
+    }
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Nit: Blank lines between non-fall-through case blocks, please.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+static pte_t p2m_entry_from_mfn(struct p2m_domain *p2m, mfn_t mfn, p2m_type_t t, p2m_access_t a)
+{
+    pte_t e = (pte_t) { 1 };
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
What's the 1 doing here?</pre>
    </blockquote>
    <pre>Set valid bit of PTE to 1.

</pre>
    <blockquote type="cite"
      cite="mid:f6e789cd-0ef3-488d-94da-1b7c94946720@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    switch ( t )
+    {
+    case p2m_mmio_direct_dev:
+        e.pte |= PTE_PBMT_IO;
+        break;
+
+    default:
+        break;
+    }
+
+    p2m_set_permission(&amp;e, t, a);
+
+    ASSERT(!(mfn_to_maddr(mfn) &amp; ~PADDR_MASK));
+
+    pte_set_mfn(&amp;e, mfn);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Based on how things work on x86 (and how I would have expected them to also
work on Arm), may I suggest that you set MFN ahead of permissions, so that
the permissions setting function can use the MFN for e.g. a lookup in
mmio_ro_ranges.</pre>
    </blockquote>
    <pre>Sure, just a note that on Arm, the MFN is set last.

</pre>
    <blockquote type="cite"
      cite="mid:f6e789cd-0ef3-488d-94da-1b7c94946720@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    BUG_ON(p2m_type_radix_set(p2m, e, t));
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I'm not convinced of this error handling here either. Radix tree insertion
_can_ fail, e.g. when there's no memory left. This must not bring down Xen,
or we'll have an XSA right away. You could zap the PTE, or if need be you
could crash the offending domain.</pre>
    </blockquote>
    <pre>IIUC what is "zap the PTE", then I will do in this way:
    if ( p2m_set_type(p2m, e, t) )
        e.pte = 0;

But then it will lead to an MMU failure—how is that expected to be handled?
There’s no guarantee that, at the moment of handling this exception, enough
memory will be available to set a type for the PTE and also there is not really
clear how to detect in exception handler that it is needed just to re-try to
set a type. Or should we just call <code data-start="229" data-end="245">domain_crash()</code>?
In that case, it seems more reasonable to call <code data-start="294"
    data-end="310">domain_crash() </code>immediately in
<code data-start="326" data-end="346">p2m_pte_from_mfn().</code></pre>
    <blockquote type="cite"
      cite="mid:f6e789cd-0ef3-488d-94da-1b7c94946720@suse.com">
      <pre wrap="" class="moz-quote-pre">

In this context (not sure if I asked before): With this use of a radix tree,
how do you intend to bound the amount of memory that a domain can use, by
making Xen insert very many entries?</pre>
    </blockquote>
    <pre data-start="0" data-end="236">I didn’t think about that. I assumed it would be enough to set the amount of
memory a guest domain can use by specifying <code data-start="121"
    data-end="144">xen,domain-p2m-mem-mb</code> in the DTS,
or using some predefined value if <code data-start="191" data-end="214">xen,domain-p2m-mem-mb</code> isn’t explicitly set.</pre>
    <pre data-start="238" data-end="363" data-is-last-node=""
    data-is-only-node="">Also, it seems this would just lead to the issue you mentioned earlier: when
the memory runs out, <code data-start="331" data-end="347">domain_crash()</code> will be called or PTE will be zapped.</pre>
    <pre>~ Oleksii
</pre>
  </body>
</html>

--------------V2ZpHYHgOd76CQAy0A6kTIvq--

