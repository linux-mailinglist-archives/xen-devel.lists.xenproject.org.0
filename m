Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F06C75090
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 16:39:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1167602.1493877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM6jl-0007Eq-2e; Thu, 20 Nov 2025 15:38:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1167602.1493877; Thu, 20 Nov 2025 15:38:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM6jk-0007Bj-Vo; Thu, 20 Nov 2025 15:38:20 +0000
Received: by outflank-mailman (input) for mailman id 1167602;
 Thu, 20 Nov 2025 15:38:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0fq0=54=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vM6ji-0007Bd-HC
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 15:38:18 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eee55119-c626-11f0-9d18-b5c5bf9af7f9;
 Thu, 20 Nov 2025 16:38:16 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-b7636c96b9aso146553966b.2
 for <xen-devel@lists.xenproject.org>; Thu, 20 Nov 2025 07:38:17 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654fd4f4esm230389166b.45.2025.11.20.07.38.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Nov 2025 07:38:15 -0800 (PST)
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
X-Inumbo-ID: eee55119-c626-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763653096; x=1764257896; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/EWfI5KFtIxLzK3kuTx1lmLJOL9K/s6Qp2MrSWGTYdE=;
        b=A7ehFuqITW2wrwHmguAziEJFyQX8i2qMJxO8/HEPoG6sa1GMIEOocJff/6fcez6NGN
         V566WMYEOsoC14SCOQR+BYTgtTof9SVl5bqtXEbltzJLWa18YLC31l+5puGMuFth0m0s
         6Vu3dmJWBBfHFsWIEY5CaC6coWyS9U07dSfvSAg1Az9j4i6ljErVmiYmOEs/wvzrn/qW
         apBrj88wJGzCAMYMYU321EMh3FJ8c3WBLXAwi8jHy+UjyoKbz5Mx/yf5lR47amrpxVgG
         rD/kjRoGps9Lk9oFMZ+RRpVV2Axj4tkOr8cYmHsnGtPb+BtVRPLkkqUKghWw1I462DgD
         35bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763653096; x=1764257896;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/EWfI5KFtIxLzK3kuTx1lmLJOL9K/s6Qp2MrSWGTYdE=;
        b=avhUoAoSC+gtk9n1cWuHnXFEcjQ/dsdNVEJKxe0q3Fx3kR1S720KY8JudCNB6Vr2XU
         ZYAGY1xnh+50a385aJEZw4h74krynun0C5LR3VU6jOhqEQlZm+bj+Rm7J9IUZ8+Q97UU
         IaVt0zdz1iXQmEsxopkEDJtlXFqDjPuXvYRu2fhZ+WEWqpBB0ZmyhHHoZDaZBVReMF1w
         eSMFAyl/j0lBaSaeJtdyJzfvYcq/Vb/v0ToDFXbJVjfeydiRpJFoGQanZje2Okp69D0q
         +oo9xGhiLVMtfY+3GNbRKSONdHe4C6YuUEG/83yqa29R3GaWyn57AaBCNA+p4r+f4KYr
         unxw==
X-Forwarded-Encrypted: i=1; AJvYcCV2wsffq3YCtdEyiq+F8fmh8inCw7pD2VCMmXuSAAojpzEt80SETMLDnZleTRPeuPt/yJF41nIf270=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw7xp5pMUaiwrX6XDSGzR3G4h4FWqZrX7ZVgD4f2ddnLYqIMDuA
	Sh0/MCLkUj6DOvambl1MVSaud5lL4x6m3YyTrePq5zDH9jsFHX/yQAG4
X-Gm-Gg: ASbGncsBZBpgjBtxx4Ub959Z8Hh0O4pnw7G/hutwMII3qHKaSMqSpLzx8nb46va0OvO
	GysE3CHa/OpzWO2h68VsMZ153gPVPHI3Ber6vvQeSgVe3NFys3K99Gb4n3HelZJVf88dKBhqKpc
	GhfX2IX5W6SM0hTtQPVg69pXERn8DWtRDx6E/yKjSY0/4D6vfdh41ZjZ07+j620LWxYgcHduSWZ
	20AznTgvob9n+AFHJgSrzavC1biuvIznvtVCECt8fjRURpPsxZuuVeQuKfW+Ut1Tpki7AxCr352
	n+Ss4rb3b11K+pG/bMSXtAG437Byu44Ko68mieTtUN0lWOMthFWs+swwHh7F36wm+hGUYJuNjHt
	iwKXeg+PmxnW4M1P9/9U5PoQ5U7MIrpeD3uvncnv0uR0egSkxQJas8nkFmNOR4GfEIaPbk48k1C
	c5eplbSau6nYqJ8FSOqA4/pZwJXAxNzdipPxabQVFU9ZfRLAB63YBJZSuWCts7c3kZFMM5poI=
X-Google-Smtp-Source: AGHT+IHhJADlTWsNdIhvCH9iJ8mE/nDpuVC7kocY3bEn9WdwWF1j5j2u7nH3synRXEIFHrQ1UHujkw==
X-Received: by 2002:a17:907:3d9e:b0:b73:52c7:fac7 with SMTP id a640c23a62f3a-b76554a67aamr397804666b.57.1763653096072;
        Thu, 20 Nov 2025 07:38:16 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------Vj02mSHy997N6no8B2pnb0vh"
Message-ID: <e2cbb6b9-ab07-4aad-8eb8-f4dd859ac6f6@gmail.com>
Date: Thu, 20 Nov 2025 16:38:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for 4.22 v5 18/18] xen/riscv: introduce metadata table to store
 P2M type
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1760974017.git.oleksii.kurochko@gmail.com>
 <d291d2efe7dcc6ddd3d16677a81c57d755c7ada2.1760974017.git.oleksii.kurochko@gmail.com>
 <6a5a9f4e-1f0e-453f-b1d1-d0e2acf97e2a@suse.com>
 <5d4ec4d9-b4c1-4365-a343-f42b390da165@gmail.com>
 <6f431394-5c08-4974-85ae-4b38f1975289@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <6f431394-5c08-4974-85ae-4b38f1975289@suse.com>

This is a multi-part message in MIME format.
--------------Vj02mSHy997N6no8B2pnb0vh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/18/25 7:58 AM, Jan Beulich wrote:
> On 17.11.2025 20:51, Oleksii Kurochko wrote:
>> On 11/12/25 12:49 PM, Jan Beulich wrote:
>>> On 20.10.2025 17:58, Oleksii Kurochko wrote:
>>>> +    if ( *md_pg )
>>>> +        metadata = __map_domain_page(*md_pg);
>>>> +
>>>> +    if ( t < p2m_first_external )
>>>> +    {
>>>>            pte->pte |= MASK_INSR(t, P2M_TYPE_PTE_BITS_MASK);
>>>>    -    return rc;
>>>> +        if ( metadata )
>>>> +            metadata[ctx->index].pte = p2m_invalid;
>>> Shouldn't this be accompanied with a BUILD_BUG_ON(p2m_invalid), as otherwise
>>> p2m_alloc_page()'s clearing of the page won't have the intended effect?
>> I think that, at least, at the moment we are always explicitly set p2m type and
>> do not rely on that by default 0==p2m_invalid.
> You don't, and ...
>
>> Just to be safe, I will add after "if ( metadata )" suggested
>> BUILD_BUG_ON(p2m_invalid):
>>          if ( metadata )
>>              metadata[ctx->index].type = p2m_invalid;
>>                  /*
>>           * metadata.type is expected to be p2m_invalid (0) after the page is
>>           * allocated and zero-initialized in p2m_alloc_page().
>>           */
>>          BUILD_BUG_ON(p2m_invalid);
>> ...
> ... this leaves me with the impression that you didn't read my reply correctly.
> p2m_alloc_page() clear the page, thus _implicitly_ setting all entries to
> p2m_invalid. That's where the BUILD_BUG_ON() would want to go (the call site,
> ftaod).

I think I still don’t fully understand what the issue would be if|p2m_invalid| were
ever equal to 1 instead of 0 in the context of a metadata page.

Yes, if|p2m_invalid| were 1, there would be a problem if someone tried to read this
metadata pagebefore it was assigned any type. They would find a value of 0, which
corresponds to a valid type rather than to|p2m_invalid|, as one might expect.
However, I’m not sure I currently see a scenario in which the metadata page would
be read before being initialized.
But just to be safe when such case will occur I am okay with putting
BUILD_BUG_ON(p2m_invalid) before p2m_alloc_page() in p2m_set_type() function.


>
>>>> +    }
>>>> +    else
>>>> +    {
>>>> +        pte->pte |= MASK_INSR(p2m_ext_storage, P2M_TYPE_PTE_BITS_MASK);
>>>> +
>>>> +        metadata[ctx->index].pte = t;
>>> If you set t to p2m_ext_storage here, the pte->pte updating could be moved ...
>> 't' shouldn't be passed as 'p2m_ext_storage'.
> Of course not. I said "set", not "pass". I suggested to set t to p2m_ext_storage
> right after the assignment above. I notice though that I missed ...

Now, I see then ...

>
>> For example, in this case we will have that in metadata page we will have type
>> equal to p2m_ext_storage and then in pte->pte will have the type set to
>> p2m_ext_storage, and the we end that we don't have a real type stored somewhere.
>> Even more, metadata.pte shouldn't be used to store p2m_ext_storage, only
>> p2m_invalid and types mentioned in enum p2m_t after p2m_ext_storage.
>>
>>>> +    }
>>> ... here, covering both cases. Overally this may then be easier as
>>>
>>>       if ( t >= p2m_first_external )
>>>           metadata[ctx->index].pte = t;
> ... the respective line (and the figure braces which are the needed) here:
>
>          t = p2m_ext_storage;

...  (what suggested above) will work.

>
>>>       else if ( metadata )
>>>           metadata[ctx->index].pte = p2m_invalid;
>>>
>>>       pte->pte |= MASK_INSR(t, P2M_TYPE_PTE_BITS_MASK);
>>>
>>> Then raising the question whether it couldn't still be the real type that's
>>> stored in metadata[] even for t < p2m_first_external. That woiuld further
>>> reduce conditionals.
>> It would be nice, but I think that at the moment we can’t do that. As I explained
>> above, 't' should not normally be passed as p2m_ext_storage.
> Of course not, but how's that relevant to storing the _real_ type in the
> metadata page even when it's one which can also can be stored in the PTE?
> As said, for a frequently used path it may help to reduce the number of
> conditionals here.

IIUC, you are asking whether, if|pte->pte| stores a type|< p2m_ext_storage|,
it would still be possible for|metadata[].pte| to contain anyreal type?
If yes, then the answer is that it could be done, because in the|p2m_get_type() |function the value stored in|pte->pte| is checked first. If it isn't|p2m_ext_storage|,
then|metadata[].pte| will not be checked at all. So technically, it could contain
whatever we want in case when pte.pte's type != p2m_ext_storage.

But will it really reduce an amount of conditions? It seems like we still need one
condition to check of metadata is mapped and one condition to set 't' to p2m_ext_storage:
   if ( metadata )
        metadata[ctx->index].pte = t;
   
   if ( t >= p2m_first_external )
      t = p2m_ext_storage;

   pte->pte |= MASK_INSR(t, P2M_TYPE_PTE_BITS_MASK);

We can do:
   if ( metadata )
   {
        metadata[ctx->index].pte = t;
        
        if ( t >= p2m_first_external )
             t = p2m_ext_storage;
   }

   pte->pte |= MASK_INSR(t, P2M_TYPE_PTE_BITS_MASK);
It will reduce an amount of conditions if metadata wasn't used/allocated, but I think you
have a different idea, don't you?


>
>>>> +static void p2m_free_page(struct p2m_domain *p2m, struct page_info *pg);
>>>> +
>>>> +/*
>>>> + * Free page table's page and metadata page linked to page table's page.
>>>> + */
>>>> +static void p2m_free_table(struct p2m_domain *p2m, struct page_info *tbl_pg)
>>>> +{
>>>> +    if ( tbl_pg->v.md.pg )
>>>> +        p2m_free_page(p2m, tbl_pg->v.md.pg);
>>> To play safe, maybe better also clear tbl_pg->v.md.pg?
>> I thought it would be enough to clear it during allocation in p2m_alloc_page(),
>> since I'm not sure it is critical if md.pg data were somehow leaked and read.
>> But to be safer, we can add this here:
>>     clear_and_clean_page(tbl_pg->v.md.pg, p2m->clean_dcache);
> I didn't say clear what tbl_pg->v.md.pg points to, though. I suggested to clear
> the struct field itself.

Won't be enough just tbl_pg->v.md.pg = NULL; ?

Thanks!

~ Oleksii

--------------Vj02mSHy997N6no8B2pnb0vh
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
    <div class="moz-cite-prefix">On 11/18/25 7:58 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:6f431394-5c08-4974-85ae-4b38f1975289@suse.com">
      <pre wrap="" class="moz-quote-pre">On 17.11.2025 20:51, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 11/12/25 12:49 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 20.10.2025 17:58, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+    if ( *md_pg )
+        metadata = __map_domain_page(*md_pg);
+
+    if ( t &lt; p2m_first_external )
+    {
          pte-&gt;pte |= MASK_INSR(t, P2M_TYPE_PTE_BITS_MASK);
  -    return rc;
+        if ( metadata )
+            metadata[ctx-&gt;index].pte = p2m_invalid;
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Shouldn't this be accompanied with a BUILD_BUG_ON(p2m_invalid), as otherwise
p2m_alloc_page()'s clearing of the page won't have the intended effect?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
I think that, at least, at the moment we are always explicitly set p2m type and
do not rely on that by default 0==p2m_invalid.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
You don't, and ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Just to be safe, I will add after "if ( metadata )" suggested
BUILD_BUG_ON(p2m_invalid):
        if ( metadata )
            metadata[ctx-&gt;index].type = p2m_invalid;
                /*
         * metadata.type is expected to be p2m_invalid (0) after the page is
         * allocated and zero-initialized in p2m_alloc_page().
         */
        BUILD_BUG_ON(p2m_invalid);
...
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... this leaves me with the impression that you didn't read my reply correctly.
p2m_alloc_page() clear the page, thus _implicitly_ setting all entries to
p2m_invalid. That's where the BUILD_BUG_ON() would want to go (the call site,
ftaod).</pre>
    </blockquote>
    <pre data-start="60" data-end="208">I think I still don’t fully understand what the issue would be if <code
    data-start="126" data-end="139">p2m_invalid</code> were
ever equal to 1 instead of 0 in the context of a metadata page.</pre>
    <pre data-start="210" data-end="574" data-is-last-node=""
    data-is-only-node="">Yes, if <code data-start="218" data-end="231">p2m_invalid</code> were 1, there would be a problem if someone tried to read this
metadata page <span data-start="309" data-end="317">before</span> it was assigned any type. They would find a value of 0, which
corresponds to a valid type rather than to <code data-start="423"
    data-end="436">p2m_invalid</code>, as one might expect.
However, I’m not sure I currently see a scenario in which the metadata page would
be read before being initialized.
But just to be safe when such case will occur I am okay with putting
BUILD_BUG_ON(p2m_invalid) before p2m_alloc_page() in p2m_set_type() function.</pre>
    <pre></pre>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:6f431394-5c08-4974-85ae-4b38f1975289@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+    }
+    else
+    {
+        pte-&gt;pte |= MASK_INSR(p2m_ext_storage, P2M_TYPE_PTE_BITS_MASK);
+
+        metadata[ctx-&gt;index].pte = t;
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">If you set t to p2m_ext_storage here, the pte-&gt;pte updating could be moved ...
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
't' shouldn't be passed as 'p2m_ext_storage'.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Of course not. I said "set", not "pass". I suggested to set t to p2m_ext_storage
right after the assignment above. I notice though that I missed ...</pre>
    </blockquote>
    <pre>Now, I see then ...</pre>
    <blockquote type="cite"
      cite="mid:6f431394-5c08-4974-85ae-4b38f1975289@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">For example, in this case we will have that in metadata page we will have type
equal to p2m_ext_storage and then in pte-&gt;pte will have the type set to
p2m_ext_storage, and the we end that we don't have a real type stored somewhere.
Even more, metadata.pte shouldn't be used to store p2m_ext_storage, only
p2m_invalid and types mentioned in enum p2m_t after p2m_ext_storage.

</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+    }
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">... here, covering both cases. Overally this may then be easier as

     if ( t &gt;= p2m_first_external )
         metadata[ctx-&gt;index].pte = t;
</pre>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... the respective line (and the figure braces which are the needed) here:

        t = p2m_ext_storage;</pre>
    </blockquote>
    <pre>...  (what suggested above) will work.

</pre>
    <blockquote type="cite"
      cite="mid:6f431394-5c08-4974-85ae-4b38f1975289@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">     else if ( metadata )
         metadata[ctx-&gt;index].pte = p2m_invalid;

     pte-&gt;pte |= MASK_INSR(t, P2M_TYPE_PTE_BITS_MASK);

Then raising the question whether it couldn't still be the real type that's
stored in metadata[] even for t &lt; p2m_first_external. That woiuld further
reduce conditionals.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
It would be nice, but I think that at the moment we can’t do that. As I explained
above, 't' should not normally be passed as p2m_ext_storage.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Of course not, but how's that relevant to storing the _real_ type in the
metadata page even when it's one which can also can be stored in the PTE?
As said, for a frequently used path it may help to reduce the number of
conditionals here.</pre>
    </blockquote>
    <pre data-start="60" data-end="216">IIUC, you are asking whether, if <code
    data-start="93" data-end="103">pte-&gt;pte</code> stores a type <code
    data-start="118" data-end="137">&lt; p2m_ext_storage</code>,
it would still be possible for <code data-start="172" data-end="188">metadata[].pte</code> to contain any <span
    data-start="204" data-end="210" data-is-only-node="">real</span> type?
If yes, then the answer is that it could be done, because in the <code
    data-start="283" data-end="299">p2m_get_type()
</code>function the value stored in <code data-start="331"
    data-end="341">pte-&gt;pte</code> is checked first. If it isn't <code
    data-start="374" data-end="391" data-is-only-node="">p2m_ext_storage</code>,
then <code data-start="398" data-end="414">metadata[].pte</code> will not be checked at all. So technically, it could contain
whatever we want in case when pte.pte's type != p2m_ext_storage.</pre>
    <pre>But will it really reduce an amount of conditions? It seems like we still need one
condition to check of metadata is mapped and one condition to set 't' to p2m_ext_storage:
  if ( metadata )
       metadata[ctx-&gt;index].pte = t;
  
  if ( t &gt;= p2m_first_external )
     t = p2m_ext_storage;

  pte-&gt;pte |= MASK_INSR(t, P2M_TYPE_PTE_BITS_MASK);

We can do:
  if ( metadata )
  {
       metadata[ctx-&gt;index].pte = t;
       
       if ( t &gt;= p2m_first_external )
            t = p2m_ext_storage;
  }

  pte-&gt;pte |= MASK_INSR(t, P2M_TYPE_PTE_BITS_MASK);
It will reduce an amount of conditions if metadata wasn't used/allocated, but I think you
have a different idea, don't you?


</pre>
    <blockquote type="cite"
      cite="mid:6f431394-5c08-4974-85ae-4b38f1975289@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+static void p2m_free_page(struct p2m_domain *p2m, struct page_info *pg);
+
+/*
+ * Free page table's page and metadata page linked to page table's page.
+ */
+static void p2m_free_table(struct p2m_domain *p2m, struct page_info *tbl_pg)
+{
+    if ( tbl_pg-&gt;v.md.pg )
+        p2m_free_page(p2m, tbl_pg-&gt;v.md.pg);
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">To play safe, maybe better also clear tbl_pg-&gt;v.md.pg?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
I thought it would be enough to clear it during allocation in p2m_alloc_page(),
since I'm not sure it is critical if md.pg data were somehow leaked and read.
But to be safer, we can add this here:
   clear_and_clean_page(tbl_pg-&gt;v.md.pg, p2m-&gt;clean_dcache);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I didn't say clear what tbl_pg-&gt;v.md.pg points to, though. I suggested to clear
the struct field itself.</pre>
    </blockquote>
    <pre>Won't be enough just tbl_pg-&gt;v.md.pg = NULL; ?

Thanks!

~ Oleksii</pre>
  </body>
</html>

--------------Vj02mSHy997N6no8B2pnb0vh--

