Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4005B1E575
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 11:15:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1074173.1436846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukJBG-0005ZN-2y; Fri, 08 Aug 2025 09:14:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1074173.1436846; Fri, 08 Aug 2025 09:14:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukJBF-0005X0-Vl; Fri, 08 Aug 2025 09:14:29 +0000
Received: by outflank-mailman (input) for mailman id 1074173;
 Fri, 08 Aug 2025 09:14:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2rj7=2U=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ukJBE-0005Wu-R5
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 09:14:28 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14e55648-7438-11f0-b898-0df219b8e170;
 Fri, 08 Aug 2025 11:14:26 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-af934d7c932so279095766b.3
 for <xen-devel@lists.xenproject.org>; Fri, 08 Aug 2025 02:14:26 -0700 (PDT)
Received: from [192.168.1.17] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0a37a8sm1466918266b.40.2025.08.08.02.14.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Aug 2025 02:14:25 -0700 (PDT)
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
X-Inumbo-ID: 14e55648-7438-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754644466; x=1755249266; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pl1ZzAy1LqPq4LjhFItU9Y3FV9NUFt6Urx1O9YusIrI=;
        b=gJXLZXIe+Q2CGIaRKQCce+5qPJAhpjajWPSV64imR1TEFIpIjmyQsHlCjon9Uk9CD0
         ZEED0cwQVxTUfPhV86adrdESN1DcqkUvHi/tMCmCItUllRv5Jr2ot4lxf879MMpXe/Pk
         bq8mIVkufaBvAjGoKoC9ggd/kbjBzO70qT6kUNlsmGsmG3DAo4/Ts7dViujx3ux2Tza1
         BwDQHEqsyJsFeYv8WatYSRx5gfB/y6SKnXUFuRCNxhi0QJh+VyeOakZEcQr8xtf/eRpU
         tMTHEY/i5q2Ggx7pjxE5XADSdS+S00qty56OkyDElpCFH5zje//Z0u+VeD0nOBGgbKO8
         PhrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754644466; x=1755249266;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Pl1ZzAy1LqPq4LjhFItU9Y3FV9NUFt6Urx1O9YusIrI=;
        b=afOwLFKQ6CRKoiBINLxTh2TySKMn8SFnAe1EAdow5av77tAhT7KQgNk0mbhwHP8TQn
         hcG/14AxevpjmkyAvA7qecIVreM+uJJ1/oGfnWzDhDC9tDzxiTfYOkr//HYyCLj9dRbv
         DPMwqi9Nzx5b73WM7xKbzAGgsk+QCfDaK/6jcZui5w7tjQ4pGKsc//G8SRlqej7Sw4yZ
         hujTu3X7WwFBvdYANHOL+5MmARyvDNUFs1ESl7tHKSOmxNWWAXTAzK9WZ5R4FCENU6eV
         YNhrWVbB54PNkJGxOdDKzSndTBtERtqeXozfj0E3ZvoW/B756hlyvpDZBmh1zXBsEenr
         woXg==
X-Forwarded-Encrypted: i=1; AJvYcCViOsCQpKSKieP+2VNfLiVHnrnvkzl3gdr8R1b5z3ZBB7eMtk6x7qg/mWtaqgmXCiVHlAixq54S7v4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxivc8fm6EgJObC46RbLXvGvtxpNwBqmJiDQ6hNdtHUAF9VUWO2
	muvXYYY+sjp0njyZ0mF0AKHN8xd8NzzjzaHF6SSqYdbOqhBYlGMX5tjL
X-Gm-Gg: ASbGncvSOqZ52/iJE0jhADnb3kpvHo4FunHjFgB/wUYmlpLnBEw406hZje8e3+OyOOL
	QCIlDiG5id2D/hXb7yboB1RutfaZb8Dz2nJ0SMcYpsBCr4kNz8JxriAXRhyRJxkt/6UINYuuJPK
	V0hXh8AsuKWuJpsxX9V94q/Pq5gB2/SaBXOZxiYTDOgOTthwd4T9/2brm/foIBMDVemvZa9CLxY
	BeFihjUODhxrfzurnsCV3M0xAGOeHOMHfHmyMD3vxMSMYKGK1nBkRHSO3QAG9PkTWLu8m5DDNAK
	rPs4pWVOFAugdLwRHZjTTdfP6+YlbP4ri1Z4ZWY0QFQOOANwLJCNTkyYjTDpwZxxwk69j69NREb
	ZM/pIaveYTWXizuG94aD6L/z/uce/I0sGV3IpXEj5VtICnWb5fG+tVzMgImfOYPZM7dmUIwf6
X-Google-Smtp-Source: AGHT+IF+pDHxr80uiDkVGpp0iwsLT6WwNpqrsQ9pSp0lRazEh55jnBkJqGMqVlbwXcdxUum8rQ4Nkg==
X-Received: by 2002:a17:907:9281:b0:af8:fa64:917f with SMTP id a640c23a62f3a-af9c650abc2mr203839066b.48.1754644465719;
        Fri, 08 Aug 2025 02:14:25 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------t95ZBYk0mol7q0a0O8M8qfXE"
Message-ID: <6f9714f7-3b65-4903-acbf-a0aa537bb3f5@gmail.com>
Date: Fri, 8 Aug 2025 11:14:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/20] xen/riscv: add root page table allocation
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <23c79f07221dee7eb782ebb160442f3a796a41b2.1753973161.git.oleksii.kurochko@gmail.com>
 <7491c934-f847-4fe2-9d9b-a500f0888198@suse.com>
 <ccdd5caa-2c91-4125-9c6b-067c941649b1@gmail.com>
 <2aa2135f-e422-417f-a509-74f61c3b19de@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <2aa2135f-e422-417f-a509-74f61c3b19de@suse.com>

This is a multi-part message in MIME format.
--------------t95ZBYk0mol7q0a0O8M8qfXE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/7/25 5:57 PM, Jan Beulich wrote:
> On 07.08.2025 15:35, Oleksii Kurochko wrote:
>> On 8/5/25 12:43 PM, Jan Beulich wrote:
>>> On 31.07.2025 17:58, Oleksii Kurochko wrote:
>>>> +static int p2m_alloc_root_table(struct p2m_domain *p2m)
>>>> +{
>>>> +    struct domain *d = p2m->domain;
>>>> +    struct page_info *page;
>>>> +    const unsigned int nr_root_pages = P2M_ROOT_PAGES;
>>>> +
>>>> +    /*
>>>> +     * Return back nr_root_pages to assure the root table memory is also
>>>> +     * accounted against the P2M pool of the domain.
>>>> +     */
>>>> +    if ( !paging_ret_pages_to_domheap(d, nr_root_pages) )
>>>> +        return -ENOMEM;
>>>> +
>>>> +    page = p2m_allocate_root(d);
>>>> +    if ( !page )
>>>> +        return -ENOMEM;
>>>> +
>>>> +    p2m->root = page;
>>>> +
>>>> +    return 0;
>>>> +}
>>> In the success case, shouldn't you bump the paging pool's total_pages by
>>> P2M_ROOT_PAGES? (As the freeing side is missing so far, it's not easy to
>>> tell whether there's [going to be] a balancing problem in the long run.
>>> In the short run there certainly is.)
>> I think that total_pages should be updated only in case when page is added
>> to freelist.
>> In the case of p2m root table, we just returning some pages to domheap and
>> durint that decreasing an amount of total_pages as freelist has lesser pages,
>> and then just allocate pages from domheap without adding them to freelist.
> But how's freeing of a root table going to look like?

We have saved pointer to first page of P2M_ROOT_PAGES allocated for root page
table which is stored in p2m->root. Then when a domain is going to be destroyed,
then do something like:
     for ( i = 0; i < P2M_ROOT_PAGES; i++ )
         clear_and_clean_page(p2m->root + i);
...


> Logically that group
> of 4 pages would be put back into the pool. And from that the pool's
> total_pages should reflect that right after successful allocation.

... I think instead of having the loop mentioned above we could add root table
pages to p2m->pages (as you suggested) in p2m_allocate_root() and then a domain
is being destroyed just do the following:
   while ( (pg = page_list_remove_head(&p2m->pages)) )
   {
       p2m_free_page(p2m->domain, pg);
And it will be a job of internals of p2m_free_page() -> paging_free_page() to
adjust freelist's total_pages and return back page(s) allocated for root table
to the freelist. (Note: the current implementation of paging_free_page() just
add a page to freelist without updating of freelist's total_pages what looks
incorrect. And it will be enough as total_pages is present only for freelist
and there is not separate total_pages (or something similar) for p2m->pages).

~ Oleksii

--------------t95ZBYk0mol7q0a0O8M8qfXE
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
    <div class="moz-cite-prefix">On 8/7/25 5:57 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:2aa2135f-e422-417f-a509-74f61c3b19de@suse.com">
      <pre wrap="" class="moz-quote-pre">On 07.08.2025 15:35, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 8/5/25 12:43 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 31.07.2025 17:58, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+static int p2m_alloc_root_table(struct p2m_domain *p2m)
+{
+    struct domain *d = p2m-&gt;domain;
+    struct page_info *page;
+    const unsigned int nr_root_pages = P2M_ROOT_PAGES;
+
+    /*
+     * Return back nr_root_pages to assure the root table memory is also
+     * accounted against the P2M pool of the domain.
+     */
+    if ( !paging_ret_pages_to_domheap(d, nr_root_pages) )
+        return -ENOMEM;
+
+    page = p2m_allocate_root(d);
+    if ( !page )
+        return -ENOMEM;
+
+    p2m-&gt;root = page;
+
+    return 0;
+}
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">In the success case, shouldn't you bump the paging pool's total_pages by
P2M_ROOT_PAGES? (As the freeing side is missing so far, it's not easy to
tell whether there's [going to be] a balancing problem in the long run.
In the short run there certainly is.)
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
I think that total_pages should be updated only in case when page is added
to freelist.
In the case of p2m root table, we just returning some pages to domheap and
durint that decreasing an amount of total_pages as freelist has lesser pages,
and then just allocate pages from domheap without adding them to freelist.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
But how's freeing of a root table going to look like? </pre>
    </blockquote>
    <pre>We have saved pointer to first page of P2M_ROOT_PAGES allocated for root page
table which is stored in p2m-&gt;root. Then when a domain is going to be destroyed,
then do something like:
    for ( i = 0; i &lt; P2M_ROOT_PAGES; i++ )
        clear_and_clean_page(p2m-&gt;root + i);
...
</pre>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:2aa2135f-e422-417f-a509-74f61c3b19de@suse.com">
      <pre wrap="" class="moz-quote-pre">Logically that group
of 4 pages would be put back into the pool. And from that the pool's
total_pages should reflect that right after successful allocation.</pre>
    </blockquote>
    <pre>... I think instead of having the loop mentioned above we could add root table
pages to p2m-&gt;pages (as you suggested) in p2m_allocate_root() and then a domain
is being destroyed just do the following:
  while ( (pg = page_list_remove_head(&amp;p2m-&gt;pages)) )
  {
      p2m_free_page(p2m-&gt;domain, pg);
And it will be a job of internals of p2m_free_page() -&gt; paging_free_page() to
adjust freelist's total_pages and return back page(s) allocated for root table
to the freelist. (Note: the current implementation of paging_free_page() just
add a page to freelist without updating of freelist's total_pages what looks
incorrect. And it will be enough as total_pages is present only for freelist
and there is not separate total_pages (or something similar) for p2m-&gt;pages).

~ Oleksii</pre>
  </body>
</html>

--------------t95ZBYk0mol7q0a0O8M8qfXE--

