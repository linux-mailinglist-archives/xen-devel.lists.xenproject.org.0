Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BD4BADEB8
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 17:37:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1134339.1472266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3cQ1-00060p-5i; Tue, 30 Sep 2025 15:37:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1134339.1472266; Tue, 30 Sep 2025 15:37:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3cQ1-0005z8-2X; Tue, 30 Sep 2025 15:37:33 +0000
Received: by outflank-mailman (input) for mailman id 1134339;
 Tue, 30 Sep 2025 15:37:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t+de=4J=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v3cPy-0005z2-So
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 15:37:31 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5fc20b27-9e13-11f0-9d14-b5c5bf9af7f9;
 Tue, 30 Sep 2025 17:37:29 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-62fc0b7bf62so9070436a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Sep 2025 08:37:29 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-67-38.play-internet.pl.
 [109.243.67.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-634a3ae3080sm10224554a12.34.2025.09.30.08.37.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Sep 2025 08:37:27 -0700 (PDT)
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
X-Inumbo-ID: 5fc20b27-9e13-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759246649; x=1759851449; darn=lists.xenproject.org;
        h=in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fuMyB6rXhVK0PZTSNrISLSFJ6oW2z4Pi9ijtTa3093s=;
        b=SUaUG5uFjuG23yd/8uR1jkpcnJ5AgUgWV8jozF9l0ojKI/ePO3gn8mwBoish3b9Nln
         KG6yE/H7MrFUNPnNOMnfQuqOotSvpGx7myZB+bhiS4ijRv2TPRC0K3S8SmqzIMc2UdYx
         Cv7l/2FTjaXu1oGlM3PIRoZNEVZWrQtIWnw3i8n/sKiueELeq9zvXsuj+PKdMtR55UMG
         v3bP2Myl8a94w6o6lDO7154ScA8nBz3xQ0Yg2oRE6vAJg/rm3b16IZjIAEGX9kZC2KNS
         E9jXol7zT7ts6oGxoxwUF/snUoTP1PtwliuSgp7sF0im3wRgiKzG047iQdXi9bbH2UFM
         QDmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759246649; x=1759851449;
        h=in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fuMyB6rXhVK0PZTSNrISLSFJ6oW2z4Pi9ijtTa3093s=;
        b=CkR1UB4xuD1QBTiesS+GfescZ+VfSGMlmeGnbd0CecHPFDQ7zjFdGbUvj58/05GOBs
         axvbTn5m0d+6m5f0Dc3CJkVxAqcyQsb3T4pX4ixlJ3LWqM5Q/YVKimKACq5l3gFKvGFb
         h40VY1hwJ8LX4F/AnRmWec09F1DU3pNPy2GSJBtzRZL25z7l+mjP1bZ0KeYQTmLrRndR
         rUZPFOnC3sjl39UgXH7j+ySKqBgIPy/9HYARdgFuInum08VSe/GWPY7nT4JNbk7+G61L
         VbqgVqJrxwN1ganW7fwj5Z3PQYWVeHgD7h3H1nmsnJQ3KYpttP1fAr8l9eC4Hgmdcv1W
         w37w==
X-Forwarded-Encrypted: i=1; AJvYcCVJ2Plt1SioQTD6KGD9ha9UF4PKF2KjcBHkglYbpjF+mrs76DO6sP7UEbOnDuTSsEyjyoXGy4BQDNE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxzgThW8Vw/uLpIZv/EL5OmSEADMHUXYilAkPsoU1is6OlD6Pd2
	euvN4F58fW040y+ejcO3zz+5XSMktpNuH3yJlZFrh7XI6uqGNw5rtq6j
X-Gm-Gg: ASbGncuujhwUx3BXHM0HyMdWRImaEciFKyuKF3v6LAWvZXI8f8wNbSBrRuBBouDA4LC
	s10tR6++M/un9PsbYB8ifW+ay2SeDL/BZPUxsPCV84e5mIS+NIVtxsvn3E+POGTSMRmHYdAUY3d
	J35Lqw7HpwLWD8v97NcBd6WqHXLKTNhlWZFy55uTVmz+MixPdWwh3en821Q7B1S4abn6gqWLAdh
	sX13stVGwg/rakbgEMJ6pSaBfZf55gIDloKfluesvaHadwbg4ipTv3HkeTDCYSHxCxnGyxOxw+y
	0t7on5dhUqYIshgAXT1TDxPGhAPF5Iv1Gy/nGY+Zaahg2eumQTuDnEveh7IQyMBFOiCZfkGIoo8
	RfP03BSPlI18QaZDs2zK5i+IVd9ELdBb739QiwoqWN1ZbyQTEeHltW0wiRWSlrooMVzFTb0+iWM
	a+SIhkWgWiwQAwr8GtYdAv
X-Google-Smtp-Source: AGHT+IFPDKcoUyqOCgUkLYGUoDNbhv85t3FajzvRctj2MdnQP3aXtlMZP9zpIUFQS0rKgiLoAXfgcw==
X-Received: by 2002:a05:6402:4402:b0:634:4e0:8360 with SMTP id 4fb4d7f45d1cf-63678bbacc4mr359560a12.2.1759246647860;
        Tue, 30 Sep 2025 08:37:27 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------pqLEyfA0yoXTd9U4TL07n00L"
Message-ID: <577daeb5-d43f-4172-9a3b-2062c01b8d45@gmail.com>
Date: Tue, 30 Sep 2025 17:37:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v4 17/18] xen/riscv: add support of page lookup by GFN
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
 <5065d9f1552fd940cc19087d8e00a0fa3519e66c.1758145428.git.oleksii.kurochko@gmail.com>
 <854ff53f-5af0-43bf-83b0-8e1e1e0deefc@suse.com>
Content-Language: en-US
In-Reply-To: <854ff53f-5af0-43bf-83b0-8e1e1e0deefc@suse.com>

This is a multi-part message in MIME format.
--------------pqLEyfA0yoXTd9U4TL07n00L
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/22/25 10:46 PM, Jan Beulich wrote:
> On 17.09.2025 23:55, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/p2m.c
>> +++ b/xen/arch/riscv/p2m.c
>> @@ -978,3 +978,189 @@ int map_regions_p2mt(struct domain *d,
>>   
>>       return rc;
>>   }
>> +
>> +
> Nit: No double blank lines please.
>
>> +/*
>> + * p2m_get_entry() should always return the correct order value, even if an
>> + * entry is not present (i.e. the GFN is outside the range):
>> + *   [p2m->lowest_mapped_gfn, p2m->max_mapped_gfn]).    (1)
>> + *
>> + * This ensures that callers of p2m_get_entry() can determine what range of
>> + * address space would be altered by a corresponding p2m_set_entry().
>> + * Also, it would help to avoid cost page walks for GFNs outside range (1).
>> + *
>> + * Therefore, this function returns true for GFNs outside range (1), and in
>> + * that case the corresponding level is returned via the level_out argument.
>> + * Otherwise, it returns false and p2m_get_entry() performs a page walk to
>> + * find the proper entry.
>> + */
>> +static bool check_outside_boundary(gfn_t gfn, gfn_t boundary, bool is_lower,
>> +                                   unsigned int *level_out)
>> +{
>> +    unsigned int level;
>> +
>> +    if ( (is_lower && gfn_x(gfn) < gfn_x(boundary)) ||
>> +         (!is_lower && gfn_x(gfn) > gfn_x(boundary)) )
> I understand people write things this way, but personally I find it confusing
> to read. Why not simply use a conditional operator here (and again below):
>
>      if ( is_lower ? gfn_x(gfn) < gfn_x(boundary)
>                    : gfn_x(gfn) > gfn_x(boundary) )

I am okay with both options. If you think the second one is more readable then I
will use it.

>> +    {
>> +        for ( level = P2M_ROOT_LEVEL; level; level-- )
>> +        {
>> +            unsigned long mask = PFN_DOWN(P2M_LEVEL_MASK(level));
> Don't you need to accumulate the mask to use across loop iterations here
> (or calculate it accordingly)? Else ...
>
>> +            if ( (is_lower && ((gfn_x(gfn) & mask) < gfn_x(boundary))) ||
>> +                 (!is_lower && ((gfn_x(gfn) & mask) > gfn_x(boundary))) )
> ... here you'll compare some middle part of the original GFN against the
> boundary.

Agree, accumulation of the mask should be done here.

>> +            {
>> +                *level_out = level;
>> +                return true;
>> +            }
>> +        }
>> +    }
>> +
>> +    return false;
>> +}
>> +
>> +/*
>> + * Get the details of a given gfn.
>> + *
>> + * If the entry is present, the associated MFN will be returned and the
>> + * p2m type of the mapping.
>> + * The page_order will correspond to the order of the mapping in the page
>> + * table (i.e it could be a superpage).
>> + *
>> + * If the entry is not present, INVALID_MFN will be returned and the
>> + * page_order will be set according to the order of the invalid range.
>> + *
>> + * valid will contain the value of bit[0] (e.g valid bit) of the
>> + * entry.
>> + */
>> +static mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
>> +                           p2m_type_t *t,
>> +                           unsigned int *page_order,
>> +                           bool *valid)
>> +{
>> +    unsigned int level = 0;
>> +    pte_t entry, *table;
>> +    int rc;
>> +    mfn_t mfn = INVALID_MFN;
>> +    DECLARE_OFFSETS(offsets, gfn_to_gaddr(gfn));
>> +
>> +    ASSERT(p2m_is_locked(p2m));
>> +
>> +    if ( valid )
>> +        *valid = false;
> Wouldn't you better similarly set *t to some "default" value?

I think it makes sense. I will set it to p2m_invalid.

>> +    if ( check_outside_boundary(gfn, p2m->lowest_mapped_gfn, true, &level) )
>> +        goto out;
>> +
>> +    if ( check_outside_boundary(gfn, p2m->max_mapped_gfn, false, &level) )
>> +        goto out;
>> +
>> +    table = p2m_get_root_pointer(p2m, gfn);
>> +
>> +    /*
>> +     * The table should always be non-NULL because the gfn is below
>> +     * p2m->max_mapped_gfn and the root table pages are always present.
>> +     */
>> +    if ( !table )
>> +    {
>> +        ASSERT_UNREACHABLE();
>> +        level = P2M_ROOT_LEVEL;
>> +        goto out;
>> +    }
>> +
>> +    for ( level = P2M_ROOT_LEVEL; level; level-- )
>> +    {
>> +        rc = p2m_next_level(p2m, false, level, &table, offsets[level]);
>> +        if ( (rc == P2M_TABLE_MAP_NONE) || (rc == P2M_TABLE_MAP_NOMEM) )
>> +            goto out_unmap;
> Getting back P2M_TABLE_MAP_NOMEM here is a bug, not really a loop exit
> condition.

Oh, I agree. With the second argument set to|false|,|rc = P2M_TABLE_MAP_NOMEM|
will never be returned, so it can simply be dropped.


>
>> +        if ( rc != P2M_TABLE_NORMAL )
>> +            break;
>> +    }
>> +
>> +    entry = table[offsets[level]];
>> +
>> +    if ( pte_is_valid(entry) )
>> +    {
>> +        if ( t )
>> +            *t = p2m_get_type(entry);
>> +
>> +        mfn = pte_get_mfn(entry);
>> +        /*
>> +         * The entry may point to a superpage. Find the MFN associated
>> +         * to the GFN.
>> +         */
>> +        mfn = mfn_add(mfn,
>> +                      gfn_x(gfn) & (BIT(P2M_LEVEL_ORDER(level), UL) - 1));
> May want to assert that the respective bits of "mfn" are actually clear
> before this calculation.

ASSERT(!(mfn & (BIT(P2M_LEVEL_ORDER(level), UL) - 1)));
Do you mean something like that?

I am not 100% sure that there is really need for that as page-fault exception
is raised if the PA is insufficienlty aligned:
  Any level of PTE may be a leaf PTE, so in addition to 4 KiB pages, Sv39 supports
  2 MiB megapages and 1 GiB gigapages, each of which must be virtually and
  physically aligned to a boundary equal to its size. A page-fault exception is
  raised if the physical address is insufficiently aligned.

>
>> +        if ( valid )
>> +            *valid = pte_is_valid(entry);
>> +    }
>> +
>> + out_unmap:
>> +    unmap_domain_page(table);
>> +
>> + out:
>> +    if ( page_order )
>> +        *page_order = P2M_LEVEL_ORDER(level);
>> +
>> +    return mfn;
>> +}
>> +
>> +static mfn_t p2m_lookup(struct p2m_domain *p2m, gfn_t gfn, p2m_type_t *t)
>> +{
>> +    mfn_t mfn;
>> +
>> +    p2m_read_lock(p2m);
>> +    mfn = p2m_get_entry(p2m, gfn, t, NULL, NULL);
> Seeing the two NULLs here I wonder: What use is the "valid" parameter of that
> function?

`valid` parameter isn't really needed anymore. It was needed when I had a copy
of `valid` bit with real (in PTE) valid bit set to 0 to track which one pages
are used.
I will drop `valid` parameter.

> And what use is the function here when it doesn't also return the
> order?

It could be used for gfn_to_mfn(), but p2m_get_entry() could be used too, just
not need to forget to wrap by p2m_read_(un)lock() each time when p2m_get_entry()
is used. Probably, it makes sense to put p2m_read_(un)lock() inside p2m_get_entry().
I think we can leave only p2m_get_entry() and drop p2m_lookup().

>   IOW I'm not sure having this helper is actually worthwhile. This is
> even more so that ...
>> +    p2m_read_unlock(p2m);
>> +
>> +    return mfn;
>> +}
>> +
>> +struct page_info *p2m_get_page_from_gfn(struct p2m_domain *p2m, gfn_t gfn,
>> +                                        p2m_type_t *t)
>> +{
>> +    struct page_info *page;
>> +    p2m_type_t p2mt = p2m_invalid;
>> +    mfn_t mfn;
>> +
>> +    p2m_read_lock(p2m);
>> +    mfn = p2m_lookup(p2m, gfn, t);
> ... there's a locking problem here: You cannot acquire a read lock in a
> nested fashion - that's a recipe for a deadlock when between the first
> acquire and the 2nd acquire attempt another CPU tries to acquire the
> lock for writing (which will result in no further readers being allowed
> in). It wasn't all that long ago that in the security team we actually
> audited the code base for the absence of such a pattern.

Oh, missed such case. Thanks for explanation and review.

~ Oleksii

--------------pqLEyfA0yoXTd9U4TL07n00L
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
    <div class="moz-cite-prefix">On 9/22/25 10:46 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:854ff53f-5af0-43bf-83b0-8e1e1e0deefc@suse.com">
      <pre wrap="" class="moz-quote-pre">On 17.09.2025 23:55, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -978,3 +978,189 @@ int map_regions_p2mt(struct domain *d,
 
     return rc;
 }
+
+
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Nit: No double blank lines please.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+/*
+ * p2m_get_entry() should always return the correct order value, even if an
+ * entry is not present (i.e. the GFN is outside the range):
+ *   [p2m-&gt;lowest_mapped_gfn, p2m-&gt;max_mapped_gfn]).    (1)
+ *
+ * This ensures that callers of p2m_get_entry() can determine what range of
+ * address space would be altered by a corresponding p2m_set_entry().
+ * Also, it would help to avoid cost page walks for GFNs outside range (1).
+ *
+ * Therefore, this function returns true for GFNs outside range (1), and in
+ * that case the corresponding level is returned via the level_out argument.
+ * Otherwise, it returns false and p2m_get_entry() performs a page walk to
+ * find the proper entry.
+ */
+static bool check_outside_boundary(gfn_t gfn, gfn_t boundary, bool is_lower,
+                                   unsigned int *level_out)
+{
+    unsigned int level;
+
+    if ( (is_lower &amp;&amp; gfn_x(gfn) &lt; gfn_x(boundary)) ||
+         (!is_lower &amp;&amp; gfn_x(gfn) &gt; gfn_x(boundary)) )
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">I understand people write things this way, but personally I find it confusing
to read. Why not simply use a conditional operator here (and again below):

    if ( is_lower ? gfn_x(gfn) &lt; gfn_x(boundary)
                  : gfn_x(gfn) &gt; gfn_x(boundary) )</pre>
    </blockquote>
    <pre>I am okay with both options. If you think the second one is more readable then I
will use it.

</pre>
    <blockquote type="cite"
      cite="mid:854ff53f-5af0-43bf-83b0-8e1e1e0deefc@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    {
+        for ( level = P2M_ROOT_LEVEL; level; level-- )
+        {
+            unsigned long mask = PFN_DOWN(P2M_LEVEL_MASK(level));
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Don't you need to accumulate the mask to use across loop iterations here
(or calculate it accordingly)? Else ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+            if ( (is_lower &amp;&amp; ((gfn_x(gfn) &amp; mask) &lt; gfn_x(boundary))) ||
+                 (!is_lower &amp;&amp; ((gfn_x(gfn) &amp; mask) &gt; gfn_x(boundary))) )
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">... here you'll compare some middle part of the original GFN against the
boundary.</pre>
    </blockquote>
    <pre>Agree, accumulation of the mask should be done here.

</pre>
    <blockquote type="cite"
      cite="mid:854ff53f-5af0-43bf-83b0-8e1e1e0deefc@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+            {
+                *level_out = level;
+                return true;
+            }
+        }
+    }
+
+    return false;
+}
+
+/*
+ * Get the details of a given gfn.
+ *
+ * If the entry is present, the associated MFN will be returned and the
+ * p2m type of the mapping.
+ * The page_order will correspond to the order of the mapping in the page
+ * table (i.e it could be a superpage).
+ *
+ * If the entry is not present, INVALID_MFN will be returned and the
+ * page_order will be set according to the order of the invalid range.
+ *
+ * valid will contain the value of bit[0] (e.g valid bit) of the
+ * entry.
+ */
+static mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
+                           p2m_type_t *t,
+                           unsigned int *page_order,
+                           bool *valid)
+{
+    unsigned int level = 0;
+    pte_t entry, *table;
+    int rc;
+    mfn_t mfn = INVALID_MFN;
+    DECLARE_OFFSETS(offsets, gfn_to_gaddr(gfn));
+
+    ASSERT(p2m_is_locked(p2m));
+
+    if ( valid )
+        *valid = false;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Wouldn't you better similarly set *t to some "default" value?</pre>
    </blockquote>
    <pre>I think it makes sense. I will set it to p2m_invalid.
</pre>
    <blockquote type="cite"
      cite="mid:854ff53f-5af0-43bf-83b0-8e1e1e0deefc@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    if ( check_outside_boundary(gfn, p2m-&gt;lowest_mapped_gfn, true, &amp;level) )
+        goto out;
+
+    if ( check_outside_boundary(gfn, p2m-&gt;max_mapped_gfn, false, &amp;level) )
+        goto out;
+
+    table = p2m_get_root_pointer(p2m, gfn);
+
+    /*
+     * The table should always be non-NULL because the gfn is below
+     * p2m-&gt;max_mapped_gfn and the root table pages are always present.
+     */
+    if ( !table )
+    {
+        ASSERT_UNREACHABLE();
+        level = P2M_ROOT_LEVEL;
+        goto out;
+    }
+
+    for ( level = P2M_ROOT_LEVEL; level; level-- )
+    {
+        rc = p2m_next_level(p2m, false, level, &amp;table, offsets[level]);
+        if ( (rc == P2M_TABLE_MAP_NONE) || (rc == P2M_TABLE_MAP_NOMEM) )
+            goto out_unmap;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Getting back P2M_TABLE_MAP_NOMEM here is a bug, not really a loop exit
condition.</pre>
    </blockquote>
    <pre>Oh, I agree. With the second argument set to <code
    data-start="106" data-end="113">false</code>, <code data-start="115"
    data-end="141">rc = P2M_TABLE_MAP_NOMEM</code>
will never be returned, so it can simply be dropped.


</pre>
    <blockquote type="cite"
      cite="mid:854ff53f-5af0-43bf-83b0-8e1e1e0deefc@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+        if ( rc != P2M_TABLE_NORMAL )
+            break;
+    }
+
+    entry = table[offsets[level]];
+
+    if ( pte_is_valid(entry) )
+    {
+        if ( t )
+            *t = p2m_get_type(entry);
+
+        mfn = pte_get_mfn(entry);
+        /*
+         * The entry may point to a superpage. Find the MFN associated
+         * to the GFN.
+         */
+        mfn = mfn_add(mfn,
+                      gfn_x(gfn) &amp; (BIT(P2M_LEVEL_ORDER(level), UL) - 1));
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">May want to assert that the respective bits of "mfn" are actually clear
before this calculation.</pre>
    </blockquote>
    <pre>ASSERT(!(mfn &amp; (BIT(P2M_LEVEL_ORDER(level), UL) - 1)));
Do you mean something like that?

I am not 100% sure that there is really need for that as page-fault exception
is raised if the PA is insufficienlty aligned:
 Any level of PTE may be a leaf PTE, so in addition to 4 KiB pages, Sv39 supports
 2 MiB megapages and 1 GiB gigapages, each of which must be virtually and
 physically aligned to a boundary equal to its size. A page-fault exception is
 raised if the physical address is insufficiently aligned.
</pre>
    <blockquote type="cite"
      cite="mid:854ff53f-5af0-43bf-83b0-8e1e1e0deefc@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+        if ( valid )
+            *valid = pte_is_valid(entry);
+    }
+
+ out_unmap:
+    unmap_domain_page(table);
+
+ out:
+    if ( page_order )
+        *page_order = P2M_LEVEL_ORDER(level);
+
+    return mfn;
+}
+
+static mfn_t p2m_lookup(struct p2m_domain *p2m, gfn_t gfn, p2m_type_t *t)
+{
+    mfn_t mfn;
+
+    p2m_read_lock(p2m);
+    mfn = p2m_get_entry(p2m, gfn, t, NULL, NULL);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Seeing the two NULLs here I wonder: What use is the "valid" parameter of that
function? </pre>
    </blockquote>
    <pre>`valid` parameter isn't really needed anymore. It was needed when I had a copy
of `valid` bit with real (in PTE) valid bit set to 0 to track which one pages
are used.
I will drop `valid` parameter.

</pre>
    <blockquote type="cite"
      cite="mid:854ff53f-5af0-43bf-83b0-8e1e1e0deefc@suse.com">
      <pre wrap="" class="moz-quote-pre">And what use is the function here when it doesn't also return the
order?</pre>
    </blockquote>
    <pre>It could be used for gfn_to_mfn(), but p2m_get_entry() could be used too, just
not need to forget to wrap by p2m_read_(un)lock() each time when p2m_get_entry()
is used. Probably, it makes sense to put p2m_read_(un)lock() inside p2m_get_entry().
I think we can leave only p2m_get_entry() and drop p2m_lookup().

</pre>
    <blockquote type="cite"
      cite="mid:854ff53f-5af0-43bf-83b0-8e1e1e0deefc@suse.com">
      <pre wrap="" class="moz-quote-pre"> IOW I'm not sure having this helper is actually worthwhile. This is
even more so that ...
</pre>
    </blockquote>
    <blockquote type="cite"
      cite="mid:854ff53f-5af0-43bf-83b0-8e1e1e0deefc@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    p2m_read_unlock(p2m);
+
+    return mfn;
+}
+
+struct page_info *p2m_get_page_from_gfn(struct p2m_domain *p2m, gfn_t gfn,
+                                        p2m_type_t *t)
+{
+    struct page_info *page;
+    p2m_type_t p2mt = p2m_invalid;
+    mfn_t mfn;
+
+    p2m_read_lock(p2m);
+    mfn = p2m_lookup(p2m, gfn, t);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">... there's a locking problem here: You cannot acquire a read lock in a
nested fashion - that's a recipe for a deadlock when between the first
acquire and the 2nd acquire attempt another CPU tries to acquire the
lock for writing (which will result in no further readers being allowed
in). It wasn't all that long ago that in the security team we actually
audited the code base for the absence of such a pattern.</pre>
    </blockquote>
    <pre>Oh, missed such case. Thanks for explanation and review.

~ Oleksii
</pre>
  </body>
</html>

--------------pqLEyfA0yoXTd9U4TL07n00L--

