Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17461B07AB1
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 18:08:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045448.1415575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc4fl-0003pF-WB; Wed, 16 Jul 2025 16:07:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045448.1415575; Wed, 16 Jul 2025 16:07:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc4fl-0003n6-St; Wed, 16 Jul 2025 16:07:57 +0000
Received: by outflank-mailman (input) for mailman id 1045448;
 Wed, 16 Jul 2025 16:07:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vAMf=Z5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uc4fk-0003n0-Ag
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 16:07:56 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0847639c-625f-11f0-a319-13f23c93f187;
 Wed, 16 Jul 2025 18:07:55 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-60867565fb5so11103097a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 09:07:55 -0700 (PDT)
Received: from [192.168.1.17] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e82df594sm1217505166b.159.2025.07.16.09.07.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 09:07:53 -0700 (PDT)
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
X-Inumbo-ID: 0847639c-625f-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752682074; x=1753286874; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3eflDYtpwa0j9SJpyiOCel2aroZIW1aIaRR2eE0jw1c=;
        b=T0p0IdiUWS75p1pojtZ9O6Khva8Vj7PgFL8S3+yIcXC6wtfQ3TFGnIypjHi+ewjbrq
         AKCnLaWgFg5VcqQHx1HsaC8NIkZQ4fmI1c3YEi18W9/l/83oiQ+DeM4dEZBHYEcO0CjM
         Ur1KgjUxs5xvl9KvTgKo+zZ1t9kb8RYWYvllZrMaUNRy6QdWE0bbt6QXhJ6in+uJaNHu
         1JXGDdggDSQHusCEIvQbhI03x1vR0xeiKKk/n42zysoJBAwiE+0wAmiUJwp8KRekOIu+
         V/SekExsmppY+GWJd6FyjEVrfz3R8YShDJ/TGPZrMHezXe2e0V6ciEmOvRnMCY0EbRQt
         N5GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752682074; x=1753286874;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3eflDYtpwa0j9SJpyiOCel2aroZIW1aIaRR2eE0jw1c=;
        b=VVSTsuQyMpEqSLcrCt7QC3qO5cPy66h3FT77WWvCsEoX9MBDCvAtLqpb+3nmg7RvWl
         /8xYmepjP4HLpVi2BPooZsOxly5DKmMiyXJB5dZar4TRlXNZaI6npOIkCykdHgjWsF7M
         cyeuWB32TqWudBiDHeGpPH1bobDytligXPM3kRk+PHAvxY7jci9XE1W6t3sAZDuDmCGB
         MDL1DaGa3/WD/4bhOj7Lc8f/6/fsh6XuXZnEiX31GvPlo00WHRdVpkFETCQ0wsoO4feu
         eUwEcJWU7CSi5Xfu8xGrdBctourPbLtnijm3uBx6iA+gXh8mueqAfTIpJVvxQFWDWHXQ
         frlA==
X-Forwarded-Encrypted: i=1; AJvYcCXf76/uzf822sfmtWKb7JKoHKhIcWIr2QfLegUdIlNAew8pv5Y78dbZg8vX9om2O8a+GUttxsJyDOM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx3/9nNrv2AZTK9/lOOMK4wHSEXPimUY4avMCYbYij1ZOKdC9Gc
	WIVZ2lKIS8OULNSU0NdM5sydxeilv51NjAWL8nFk35z/5IGGJlOTa+cw
X-Gm-Gg: ASbGncu5jGnicfuz/GPwQgD4hiRtOMXoEr9OnzGMfw6kLrjHW2t4k4WYUIQIYUDfT7A
	CHkIqovQQA9FxVM1VSBO28xFyYOwDJ5vcR4eKLTMONZPbx9W0W07SSHFh1ucJLGRPAcUK32vnMP
	AQlEprjS+5P8QqMeUaAGxOPKy7rxvdMy5QFImQV+QaPXuQ6XcriIad/AOeyEew8RJ13yO1pMnlq
	R4F/63QX1pfClda4Klh1q63ABESTWokD/ESopb3752rlO7OrqxA2t58uuTEi5HN+KYEXkvRuu4Z
	9U0RJeLTb3jSHejM13u6FpYLdrLs5hybv0zuxZZvWbihlei1TrR0V0+ejcmDqZzs15AbRlBfRx9
	KXCizNpL5I7lej+Xwe3aDUUJ/28xKiVu69o2KYs4PKrs5XHKE13Da8sZZdFHNDudI/v6LSmp9
X-Google-Smtp-Source: AGHT+IEImjiv1OVj33gmetNFzz1QjCJGImUw1ryecBlJMD9gYjTTfV20C2YW57OFKpFpKps97VzOiw==
X-Received: by 2002:a17:907:e8e:b0:ae3:6994:5511 with SMTP id a640c23a62f3a-ae9c9983032mr413644266b.16.1752682073982;
        Wed, 16 Jul 2025 09:07:53 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------C7xYNx0hk36us2unqvVS0Ps2"
Message-ID: <e1c469c3-47d5-4a38-8abd-985a26cb8365@gmail.com>
Date: Wed, 16 Jul 2025 18:07:51 +0200
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
 <640178f8-a189-4f84-abff-0ef87ba566a5@gmail.com>
 <0265e61a-ad08-4b6b-a87d-dba304f6d27d@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <0265e61a-ad08-4b6b-a87d-dba304f6d27d@suse.com>

This is a multi-part message in MIME format.
--------------C7xYNx0hk36us2unqvVS0Ps2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 7/16/25 1:31 PM, Jan Beulich wrote:
> On 15.07.2025 16:47, Oleksii Kurochko wrote:
>> On 7/1/25 5:08 PM, Jan Beulich wrote:
>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>> --- a/xen/arch/riscv/p2m.c
>>>> +++ b/xen/arch/riscv/p2m.c
>>>> @@ -345,6 +345,26 @@ static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
>>>>        return __map_domain_page(p2m->root + root_table_indx);
>>>>    }
>>>>    
>>>> +static int p2m_type_radix_set(struct p2m_domain *p2m, pte_t pte, p2m_type_t t)
>>> See comments on the earlier patch regarding naming.
>>>
>>>> +{
>>>> +    int rc;
>>>> +    gfn_t gfn = mfn_to_gfn(p2m->domain, mfn_from_pte(pte));
>>> How does this work, when you record GFNs only for Xenheap pages?


>> I think I don't understand what is an issue. Could you please provide
>> some extra details?
> Counter question: The mfn_to_gfn() you currently have is only a stub. It only
> works for 1:1 mapped domains. Can you show me the eventual final implementation
> of the function, making it possible to use it here?

At the moment, I planned to support only 1:1 mapped domains, so it is final
implementation.

I think that I understand your initial question. So yes, at the moment, we have
only Xenheap pages and as for such pages we have stored GFNs it will be easy to
recover gfn for mfn, and so it will be easy to implement mfn_to_gfn() for Xenheap
pages.


>   Having such stubs, and not
> even annotated in any way, is imo a problem: People may thing they're fine to
> use when really they aren't.

Then more correct will be to pass GFN through an argument as you suggested earlier
(and I've already added such argument).

I just initially made incorrect suggestion that it is a question to an implementation
of mfn_to_gfn() to provide such implementation which supports any type of page.

>
>>>> +static pte_t p2m_entry_from_mfn(struct p2m_domain *p2m, mfn_t mfn, p2m_type_t t, p2m_access_t a)
>>>> +{
>>>> +    pte_t e = (pte_t) { 1 };
>>> What's the 1 doing here?
>> Set valid bit of PTE to 1.
> But something like this isn't to be done using a plain, unannotated literal
> number. Aiui you mean PTE_VALID here.

Yes. I will use PTE_VALID instead.

>
>>>> +    switch ( t )
>>>> +    {
>>>> +    case p2m_mmio_direct_dev:
>>>> +        e.pte |= PTE_PBMT_IO;
>>>> +        break;
>>>> +
>>>> +    default:
>>>> +        break;
>>>> +    }
>>>> +
>>>> +    p2m_set_permission(&e, t, a);
>>>> +
>>>> +    ASSERT(!(mfn_to_maddr(mfn) & ~PADDR_MASK));
>>>> +
>>>> +    pte_set_mfn(&e, mfn);
>>> Based on how things work on x86 (and how I would have expected them to also
>>> work on Arm), may I suggest that you set MFN ahead of permissions, so that
>>> the permissions setting function can use the MFN for e.g. a lookup in
>>> mmio_ro_ranges.
>> Sure, just a note that on Arm, the MFN is set last.
> That's apparently because they (still) don't have mmio_ro_ranges. That's only
> a latent issue (I hope) while they still don't have PCI support.
>
>>>> +    BUG_ON(p2m_type_radix_set(p2m, e, t));
>>> I'm not convinced of this error handling here either. Radix tree insertion
>>> _can_ fail, e.g. when there's no memory left. This must not bring down Xen,
>>> or we'll have an XSA right away. You could zap the PTE, or if need be you
>>> could crash the offending domain.
>> IIUC what is "zap the PTE", then I will do in this way:
>>       if ( p2m_set_type(p2m, e, t) )
>>           e.pte = 0;
>>
>> But then it will lead to an MMU failure—how is that expected to be handled?
>> There’s no guarantee that, at the moment of handling this exception, enough
>> memory will be available to set a type for the PTE and also there is not really
>> clear how to detect in exception handler that it is needed just to re-try to
>> set a type. Or should we just call|domain_crash()|?
>> In that case, it seems more reasonable to call|domain_crash() |immediately in
>> |p2m_pte_from_mfn().|
> As said - crashing the domain in such an event is an option. The question
> here is whether to do so right away, or whether to defer that in the hope
> that the PTE may not actually be accessed (before being rewritten).
>
>>> In this context (not sure if I asked before): With this use of a radix tree,
>>> how do you intend to bound the amount of memory that a domain can use, by
>>> making Xen insert very many entries?
>> I didn’t think about that. I assumed it would be enough to set the amount of
>> memory a guest domain can use by specifying|xen,domain-p2m-mem-mb| in the DTS,
>> or using some predefined value if|xen,domain-p2m-mem-mb| isn’t explicitly set.
> Which would require these allocations to come from that pool.

Yes, and it is true only for non-hardware domains with the current implementation.

>
>> Also, it seems this would just lead to the issue you mentioned earlier: when
>> the memory runs out,|domain_crash()| will be called or PTE will be zapped.
> Or one domain exhausting memory would cause another domain to fail. A domain
> impacting just itself may be tolerable. But a domain affecting other domains
> isn't.

But it seems like this issue could happen in any implementation. It won't happen only
if we will have only pre-populated pool for any domain type (hardware, control, guest
domain) without ability to extend them or allocate extra pages from domheap in runtime.
Otherwise, if extra pages allocation is allowed then we can't really do something
with this issue.


~ Oleksii

--------------C7xYNx0hk36us2unqvVS0Ps2
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
    <div class="moz-cite-prefix">On 7/16/25 1:31 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:0265e61a-ad08-4b6b-a87d-dba304f6d27d@suse.com">
      <pre wrap="" class="moz-quote-pre">On 15.07.2025 16:47, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 7/1/25 5:08 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
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
          <pre wrap="" class="moz-quote-pre">See comments on the earlier patch regarding naming.

</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+{
+    int rc;
+    gfn_t gfn = mfn_to_gfn(p2m-&gt;domain, mfn_from_pte(pte));
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">How does this work, when you record GFNs only for Xenheap pages?</pre>
        </blockquote>
      </blockquote>
    </blockquote>
    <p></p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:0265e61a-ad08-4b6b-a87d-dba304f6d27d@suse.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
I think I don't understand what is an issue. Could you please provide
some extra details?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Counter question: The mfn_to_gfn() you currently have is only a stub. It only
works for 1:1 mapped domains. Can you show me the eventual final implementation
of the function, making it possible to use it here?</pre>
    </blockquote>
    <pre>At the moment, I planned to support only 1:1 mapped domains, so it is final
implementation.

I think that I understand your initial question. So yes, at the moment, we have
only Xenheap pages and as for such pages we have stored GFNs it will be easy to
recover gfn for mfn, and so it will be easy to implement mfn_to_gfn() for Xenheap
pages.


</pre>
    <blockquote type="cite"
      cite="mid:0265e61a-ad08-4b6b-a87d-dba304f6d27d@suse.com">
      <pre wrap="" class="moz-quote-pre"> Having such stubs, and not
even annotated in any way, is imo a problem: People may thing they're fine to
use when really they aren't.</pre>
    </blockquote>
    <pre>Then more correct will be to pass GFN through an argument as you suggested earlier
(and I've already added such argument).

I just initially made incorrect suggestion that it is a question to an implementation
of mfn_to_gfn() to provide such implementation which supports any type of page.
</pre>
    <blockquote type="cite"
      cite="mid:0265e61a-ad08-4b6b-a87d-dba304f6d27d@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+static pte_t p2m_entry_from_mfn(struct p2m_domain *p2m, mfn_t mfn, p2m_type_t t, p2m_access_t a)
+{
+    pte_t e = (pte_t) { 1 };
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">What's the 1 doing here?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Set valid bit of PTE to 1.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
But something like this isn't to be done using a plain, unannotated literal
number. Aiui you mean PTE_VALID here.</pre>
    </blockquote>
    <pre>Yes. I will use PTE_VALID instead.

</pre>
    <blockquote type="cite"
      cite="mid:0265e61a-ad08-4b6b-a87d-dba304f6d27d@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
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
          <pre wrap="" class="moz-quote-pre">Based on how things work on x86 (and how I would have expected them to also
work on Arm), may I suggest that you set MFN ahead of permissions, so that
the permissions setting function can use the MFN for e.g. a lookup in
mmio_ro_ranges.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Sure, just a note that on Arm, the MFN is set last.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
That's apparently because they (still) don't have mmio_ro_ranges. That's only
a latent issue (I hope) while they still don't have PCI support.

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+    BUG_ON(p2m_type_radix_set(p2m, e, t));
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">I'm not convinced of this error handling here either. Radix tree insertion
_can_ fail, e.g. when there's no memory left. This must not bring down Xen,
or we'll have an XSA right away. You could zap the PTE, or if need be you
could crash the offending domain.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
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
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
As said - crashing the domain in such an event is an option. The question
here is whether to do so right away, or whether to defer that in the hope
that the PTE may not actually be accessed (before being rewritten).

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">In this context (not sure if I asked before): With this use of a radix tree,
how do you intend to bound the amount of memory that a domain can use, by
making Xen insert very many entries?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
I didn’t think about that. I assumed it would be enough to set the amount of
memory a guest domain can use by specifying|xen,domain-p2m-mem-mb| in the DTS,
or using some predefined value if|xen,domain-p2m-mem-mb| isn’t explicitly set.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Which would require these allocations to come from that pool.</pre>
    </blockquote>
    <pre>Yes, and it is true only for non-hardware domains with the current implementation.

</pre>
    <blockquote type="cite"
      cite="mid:0265e61a-ad08-4b6b-a87d-dba304f6d27d@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Also, it seems this would just lead to the issue you mentioned earlier: when
the memory runs out,|domain_crash()| will be called or PTE will be zapped.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Or one domain exhausting memory would cause another domain to fail. A domain
impacting just itself may be tolerable. But a domain affecting other domains
isn't.</pre>
    </blockquote>
    <pre>But it seems like this issue could happen in any implementation. It won't happen only
if we will have only pre-populated pool for any domain type (hardware, control, guest
domain) without ability to extend them or allocate extra pages from domheap in runtime.
Otherwise, if extra pages allocation is allowed then we can't really do something
with this issue.


~ Oleksii
</pre>
  </body>
</html>

--------------C7xYNx0hk36us2unqvVS0Ps2--

