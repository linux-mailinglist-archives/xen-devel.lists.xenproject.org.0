Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 531FCC5CAEF
	for <lists+xen-devel@lfdr.de>; Fri, 14 Nov 2025 11:53:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1162431.1490077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJrQc-0003lN-4T; Fri, 14 Nov 2025 10:53:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1162431.1490077; Fri, 14 Nov 2025 10:53:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJrQc-0003j5-1H; Fri, 14 Nov 2025 10:53:18 +0000
Received: by outflank-mailman (input) for mailman id 1162431;
 Fri, 14 Nov 2025 10:53:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Jk/=5W=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vJrQa-0003iz-Sg
 for xen-devel@lists.xenproject.org; Fri, 14 Nov 2025 10:53:16 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e68afd0-c148-11f0-980a-7dc792cee155;
 Fri, 14 Nov 2025 11:53:14 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b736f48ba11so67903866b.0
 for <xen-devel@lists.xenproject.org>; Fri, 14 Nov 2025 02:53:14 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fd80d27sm364008066b.40.2025.11.14.02.53.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Nov 2025 02:53:13 -0800 (PST)
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
X-Inumbo-ID: 1e68afd0-c148-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763117593; x=1763722393; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5V7mv1vGxOoWeS9uVdylVzDenuHgS3a4X+a5k9O3FiI=;
        b=UuxhiBk1VwoCn3rQmksjHH3D601xiF0lsTIJ5iEv+Vc/d1grU8P2Hg/vAJ/zVyoPgc
         7qevH5tM2PYBcIBYkjVpbkiynPX/W3M36X8txbQqWgg9vgfQw9SYUUQ7szm3mX0mj0Xx
         MA6+GQq5SBH+EX3j6CG6k3WBnerwUJGC440sy68IXNdNwCqwaumbrfp2nr+iInaE2uYr
         tmjNDe956g3He4p4GVdxjs3PFGzWqnGI/ryE6J9WOhXwE/oCICifKUFGPG0wlaXQ6+X8
         tFidiKDzFzZ6M77GWzokziOgnhjAGW/F1CNKbrtqkXUl7PjIPpde6Jmk0qm2sbnUWWpX
         CjRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763117593; x=1763722393;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5V7mv1vGxOoWeS9uVdylVzDenuHgS3a4X+a5k9O3FiI=;
        b=aG3JMFg7eF/WQANhxVI410fVdtGudDsBPk1Q+2NdfXOPW9/qY8NB+6djpoB9rVfdKQ
         Hb5mRsB2OXYiqsekXqpaCQ5yelO9UsW5AzDkYGK63pmeQzzSDUYIGe3k0NfmV9B8ELMq
         PW+HlXaiCHd5hDva6LtJDU6RsgJYPaT/TC7aPUWRw+iY6xAmG8G9eho9gldVk6wP784o
         UijFWMeF0KFZnlpM9hCNDxTKrwmAJ58nk+X2gzdbjCOPCa5tiS5r08vUxn09SbqSDnUe
         dXhOz+c5brpCqazPlTEYumZUfI9L5Q7TZ1PgemFpE/NCVKKIT8bTo/CfJUpJRkAIv048
         lY0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUnBGj/padFhWBLrZJDQ3I6Tb8k2mSfTYq7Y955CVfEcWorGOnhBgwjxcuObIqqSi7lXALgWO/kyI8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YygcYHvxq4NGu1WjwgpYSeMLHsVlMAoWihl/xTbc1nvbcg5Nvr8
	o0gR4ABWsCUmxo6T3n/xCZGhhlq2Jw3quvrZRZ/e2dyl3fwLF+YWowG0
X-Gm-Gg: ASbGncsDMAKwx94KTc8RcHZC8IWVHm8wMkE+KKpqqIlsrg85QP2Jsl5DPJNXihxyQ1G
	aWccOy/OqFpAAMLivMTqqsen3OhdkYx1p7WfyQ6Pf8tk0dFIx2xam+EkbRdIjloXpBm6RarJAT0
	Ezw/ngADVdtZ62pC+dFYtffqwmo4pvr1jMamw8jhLyCeVQflrUuX20XoIVidVa/i3JYRbYPwfTs
	y0Ss4f492EqjE6zcCycW3/fTniOobf3gLG55aAnDHQxPd3jdK3dQZxnNeBX2NbYAA6jeVXG3BaA
	NShNKo51raZBWd0Q+GLiucslnP50qvaCJIV83PJAMyiRdF8YuoX4VOnl6cprsfA3iZR6rbzgUKR
	rb5Phb5n7YszMrv40e6yTis62o+0cXo2DXOxKXDqVP2cuE3IfN/tMQliKtaApYtlQJl6vw9zV7Y
	GQeTO42tWiB3c8riIfQfC7j3h0O+GfDo6rL7yw4auz7EnXeY3X1Q09H288Ltsl
X-Google-Smtp-Source: AGHT+IFI8IMKoO28IfpyC1blhhD57+9yA/bF2Qu+a49BlFC8Cclg9xDc6PpgUl+2bw5S30t/Z0coDQ==
X-Received: by 2002:a17:907:97c1:b0:b3f:331a:a982 with SMTP id a640c23a62f3a-b736574ad17mr313077366b.6.1763117593263;
        Fri, 14 Nov 2025 02:53:13 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------IXAY3hEUhsmLqAcRZdbuQEby"
Message-ID: <d114e2ef-3f33-4c3b-8782-44fbddf7eaa9@gmail.com>
Date: Fri, 14 Nov 2025 11:53:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for 4.22 v5 05/18] xen/riscv: add root page table allocation
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1760974017.git.oleksii.kurochko@gmail.com>
 <81d36dc5277d4756442f3ad5d64f37148787394a.1760974017.git.oleksii.kurochko@gmail.com>
 <8e3b791c-22ca-43e2-a3bf-f440032ab1ed@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <8e3b791c-22ca-43e2-a3bf-f440032ab1ed@suse.com>

This is a multi-part message in MIME format.
--------------IXAY3hEUhsmLqAcRZdbuQEby
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/6/25 3:25 PM, Jan Beulich wrote:
> On 20.10.2025 17:57, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/p2m.c
>> +++ b/xen/arch/riscv/p2m.c
>> @@ -3,6 +3,7 @@
>>   #include <xen/init.h>
>>   #include <xen/lib.h>
>>   #include <xen/macros.h>
>> +#include <xen/domain_page.h>
>>   #include <xen/mm.h>
>>   #include <xen/paging.h>
>>   #include <xen/rwlock.h>
>> @@ -103,6 +104,70 @@ void __init pre_gstage_init(void)
>>       vmid_init();
>>   }
>>   
>> +static void clear_and_clean_page(struct page_info *page, bool clean_dcache)
>> +{
>> +    clear_domain_page(page_to_mfn(page));
>> +
>> +    /*
>> +     * If the IOMMU doesn't support coherent walks and the p2m tables are
>> +     * shared between the CPU and IOMMU, it is necessary to clean the
>> +     * d-cache.
>> +     */
>> +    if ( clean_dcache )
>> +        clean_dcache_va_range(page, PAGE_SIZE);
> This cleans part of frame_table[], but not the memory page in question.

Oh, right, we need to map the domain page first.

Would it make sense to avoid using|clear_domain_page()| in order to prevent
calling|map_domain_page()| twice (once inside|clear_domain_page()| and once
before|clean_dcache_va_range()|), and instead do it like this:
     void *p = __map_domain_page(page);

     clear_page(p);

     /*
      * If the IOMMU doesn't support coherent walks and the p2m tables are
      * shared between the CPU and IOMMU, it is necessary to clean the
      * d-cache.
      */
     if ( clean_dcache )
         clean_dcache_va_range(p, PAGE_SIZE);

     unmap_domain_page(p);

>> @@ -55,6 +76,39 @@ int paging_freelist_adjust(struct domain *d, unsigned long pages,
>>       return 0;
>>   }
>>   
>> +int paging_refill_from_domheap(struct domain *d, unsigned int nr_pages)
>> +{
>> +    ASSERT(spin_is_locked(&d->arch.paging.lock));
>> +
>> +    for ( unsigned int i = 0; i < nr_pages; i++ )
>> +    {
>> +        int rc = paging_add_page_to_freelist(d);
> The anomaly is more pronounced here, with the other function name in context:
> paging_refill_from_domheap() doesn't suggest there's a page (or several) being
> handed to it. paging_add_page_to_freelist() suggests one of its parameter
> would want to be struct page_info *. Within the naming model you chose, maybe
> paging_refill_from_domheap_one() or paging_refill_one_from_domheap()? Or
> simply _paging_refill_from_domheap()?

Thanks for suggestions. I like the option with "_*" as it is more clearly marks it
as an internal helper without introducing "_one" suffix. I will use the same approach
for paging_ret_page_to_domheap(): s/paging_ret_page_to_domheap/_paging_ret_to_domheap().

Shouldn't we use "__*" instead of "_*" or "__*" is reserved for something else? "__*" is
used quite frequent in Xen code base.

~ Oleksii


--------------IXAY3hEUhsmLqAcRZdbuQEby
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
    <div class="moz-cite-prefix">On 11/6/25 3:25 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:8e3b791c-22ca-43e2-a3bf-f440032ab1ed@suse.com">
      <pre wrap="" class="moz-quote-pre">On 20.10.2025 17:57, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -3,6 +3,7 @@
 #include &lt;xen/init.h&gt;
 #include &lt;xen/lib.h&gt;
 #include &lt;xen/macros.h&gt;
+#include &lt;xen/domain_page.h&gt;
 #include &lt;xen/mm.h&gt;
 #include &lt;xen/paging.h&gt;
 #include &lt;xen/rwlock.h&gt;
@@ -103,6 +104,70 @@ void __init pre_gstage_init(void)
     vmid_init();
 }
 
+static void clear_and_clean_page(struct page_info *page, bool clean_dcache)
+{
+    clear_domain_page(page_to_mfn(page));
+
+    /*
+     * If the IOMMU doesn't support coherent walks and the p2m tables are
+     * shared between the CPU and IOMMU, it is necessary to clean the
+     * d-cache.
+     */
+    if ( clean_dcache )
+        clean_dcache_va_range(page, PAGE_SIZE);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This cleans part of frame_table[], but not the memory page in question.</pre>
    </blockquote>
    <pre>Oh, right, we need to map the domain page first.

Would it make sense to avoid using <code data-start="149" data-end="170">clear_domain_page()</code> in order to prevent
calling <code data-start="199" data-end="218">map_domain_page()</code> twice (once inside <code
    data-start="238" data-end="259">clear_domain_page()</code> and once
before <code data-start="276" data-end="301">clean_dcache_va_range()</code>), and instead do it like this:
    void *p = __map_domain_page(page);

    clear_page(p);

    /*
     * If the IOMMU doesn't support coherent walks and the p2m tables are
     * shared between the CPU and IOMMU, it is necessary to clean the
     * d-cache.
     */
    if ( clean_dcache )
        clean_dcache_va_range(p, PAGE_SIZE);

    unmap_domain_page(p);

</pre>
    <blockquote type="cite"
      cite="mid:8e3b791c-22ca-43e2-a3bf-f440032ab1ed@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -55,6 +76,39 @@ int paging_freelist_adjust(struct domain *d, unsigned long pages,
     return 0;
 }
 
+int paging_refill_from_domheap(struct domain *d, unsigned int nr_pages)
+{
+    ASSERT(spin_is_locked(&amp;d-&gt;arch.paging.lock));
+
+    for ( unsigned int i = 0; i &lt; nr_pages; i++ )
+    {
+        int rc = paging_add_page_to_freelist(d);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
The anomaly is more pronounced here, with the other function name in context:
paging_refill_from_domheap() doesn't suggest there's a page (or several) being
handed to it. paging_add_page_to_freelist() suggests one of its parameter
would want to be struct page_info *. Within the naming model you chose, maybe
paging_refill_from_domheap_one() or paging_refill_one_from_domheap()? Or
simply _paging_refill_from_domheap()?</pre>
    </blockquote>
    <pre>Thanks for suggestions. I like the option with "_*" as it is more clearly marks it
as an internal helper without introducing "_one" suffix. I will use the same approach
for paging_ret_page_to_domheap(): s/paging_ret_page_to_domheap/_paging_ret_to_domheap().

Shouldn't we use "__*" instead of "_*" or "__*" is reserved for something else? "__*" is
used quite frequent in Xen code base.

~ Oleksii</pre>
    <br>
  </body>
</html>

--------------IXAY3hEUhsmLqAcRZdbuQEby--

