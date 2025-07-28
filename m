Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC266B136FC
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 10:52:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061117.1426609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugJac-0005Va-12; Mon, 28 Jul 2025 08:52:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061117.1426609; Mon, 28 Jul 2025 08:52:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugJab-0005TV-U1; Mon, 28 Jul 2025 08:52:09 +0000
Received: by outflank-mailman (input) for mailman id 1061117;
 Mon, 28 Jul 2025 08:52:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WhXX=2J=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ugJaa-0005T6-Ko
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 08:52:08 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24338a3c-6b90-11f0-a31e-13f23c93f187;
 Mon, 28 Jul 2025 10:52:07 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-61521cd7be2so1538469a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 01:52:07 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af63585ff45sm396854666b.5.2025.07.28.01.52.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 01:52:05 -0700 (PDT)
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
X-Inumbo-ID: 24338a3c-6b90-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753692727; x=1754297527; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jlfrffV+baMNieZug0o6iMbawUY/zv53nFh4X1Tzuas=;
        b=Z1m3+F+Fnv3Cw6weglcKpazQanNraGCPUGfeXV3z00+NGnpayUh2INVgCkuUvNb0u4
         eSIqwCXwKC0Au4vVOmmwGNJnN90zqWezhZ7fhHVriokfQdsnZgV5rWqURzyBdKeZSGId
         oFsXVJ2X/fnQ8lvb46pyUoqZW7z6m/30yFeq5qKiLAdL49PupJ7FRKjr0kRtCDOigsQj
         ct/EJyT8S61l2uRlbr5ITFfp9xQtbXicXeUTJ8Ja6vBrHtoy3yFCQG52ZdzaHI3tMl4T
         Vg4WECGkkr1Xnq9j9Q7/JE2iwaxp+YbBJQhL5xieHnWg8VD+MPrRz7uH2h7apt+9G1++
         a2ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753692727; x=1754297527;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jlfrffV+baMNieZug0o6iMbawUY/zv53nFh4X1Tzuas=;
        b=ei1EusYKvEwTPvE/sNt2snAlUO12sJC+RgtZ7lnUj749ocEhbDwR/K1l5W19V/168O
         yjGVHPNvHJzVc2YgBEb0fHzEf6ltiq+3iKQJxxqGghAJg+vRM+8Z4Duszkcel5/16/cA
         IlGBBU3+ua8QMtrvFST7i8FPDJqNqaDyBczB6PsvcWhiRBCUAyrFTz1sh1+VFzbdo3nY
         9beMg5et9xo66aYDTk1/xvfA8+OZvBL7TRG4qpAWZeePShNCAaV4zzzvXgN+12l6DsGy
         o8waJlrs+9ZODr72J6t1Dmf0AWjlSlh8L1HdO9eVDjFS9L3SE6z1kHhP2FvDh8CuvMQv
         BDcg==
X-Forwarded-Encrypted: i=1; AJvYcCXYlOP2XgZ4Zkiolx1LqgZofIwNeC6MBD492A6J0LAGXtFCglm9ayf4q+OlwrpguQqqSgvdZ51MM3w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwIKO8Qotmp5EW3srccQPD+WtN+zQqwCHw4Cdjs1dzk0bTJfAwr
	4nFy1SshoWpZopv3Hi/UlpE2+QZ6nR8yXG6XNzQkdlX6ui9lNnP8JDho
X-Gm-Gg: ASbGncsvme/vK23Y5mosanT36c48ARYWff4GxfBRXnwPkulXR7ueZ51RQhvqkfSsKs+
	GHrMFfJx1vemtkXBciZiJIgtrMNdpAs4TFvmZvhXkMgijXCsVo3bRRTMrDskmridRcBxt+FAgb4
	GgmxCRwkVXqjkIzitiENeGs7gVqRcINvic/TcInfyHN9fHLtiTEzwvqeF/pYcifdgKg+Bu1IU7K
	9wZYxzw1ROi3fiEObOhyhshP0zn4OE5RgH0rzHSZqcTpq+QQMxEoj1Ire2DlXXca51pIPvC7GVe
	IuHgPXkHixdr6l14boR+0uTkb4yuhiJVQU4qtOFxCXkXzdCX1tGkhkrK2IMy38UMAgog4yX4HBA
	z/J/R+XuZDo1SJdu/VnOF/UTQTQyDGHd9typyrrHdoudrua4zcAwNGuzKF8OfOGz+NLdTmmA=
X-Google-Smtp-Source: AGHT+IHrd7cJ+zTR6n1GsDoKDi+vQxt91pdjvDBo7TVlcQ0cHG5vhWxS+Ed5ZU6a43oEOthiMTWsog==
X-Received: by 2002:a17:907:843:b0:ade:3ce3:15d1 with SMTP id a640c23a62f3a-af617f52b7cmr1436886566b.27.1753692726499;
        Mon, 28 Jul 2025 01:52:06 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------2bXm36yqjmyBJuwq0aGvkJrL"
Message-ID: <78488064-694a-4020-8c08-7b12184b8669@gmail.com>
Date: Mon, 28 Jul 2025 10:52:04 +0200
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
 <e1c469c3-47d5-4a38-8abd-985a26cb8365@gmail.com>
 <15c9cb8e-8452-4dc3-933a-5713fc86a12a@suse.com>
 <958ae1b0-d139-41e8-b965-43ce640569c5@gmail.com>
 <007654f3-e26b-43b1-bc81-40ba25c9d787@suse.com>
 <ca3467a2-c795-4709-ad92-1744b138a148@gmail.com>
 <9e9c1943-b2af-471f-b8c9-f7179073ef99@suse.com>
 <fb7176a2-740e-4773-b1cb-3cd430d6f838@gmail.com>
 <f110cd42-d34b-44fc-bd76-85cb0bfc2357@gmail.com>
 <25f17da6-1c82-422c-941a-b0eb57786c8f@suse.com>
 <342e8524-268c-46ae-817c-5af71254b624@gmail.com>
 <7ba83171-a377-4c3d-a33b-7edb57621bb7@suse.com>
 <dabc1c47-f392-4fc1-9f84-36c880c6dd63@gmail.com>
 <170d6cc9-542e-4129-b3bb-bf9ea0844bc4@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <170d6cc9-542e-4129-b3bb-bf9ea0844bc4@suse.com>

This is a multi-part message in MIME format.
--------------2bXm36yqjmyBJuwq0aGvkJrL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/23/25 11:46 AM, Jan Beulich wrote:
>> I assume that I have in this case to take some pages for an intermediate page
>> table from freelist P2M pool, set an owner domain to NULL (pg->inuse.domain = NULL).
>>
>> Then in this case it isn't clear why pg->list can't be re-used to link several pages
>> for intermediate page table purposes + metadata? Is it because pg->list can be not
>> empty? In this case it isn't clear if I could use a page, which has threaded pages.
> Actually looks like I was mis-remembering. Pages removed from freelist indeed
> aren't put on any other list, so the linking fields are available for use. I
> guess I had x86 shadow code in mind, where the linking fields are further used.

Perhaps, I misunderstood you about "linking fields", but it seems like I can't reuse
struct page_info->list as it is used by page_list_add() which is called by p2m_alloc_page()
to allocate page(s) for an intermediate page table:
    static inline void
    page_list_add(struct page_info *page, struct page_list_head *head)
    {
         list_add(&page->list, head);
    }

     struct page_info * paging_alloc_page(struct domain *d)
     {
         struct page_info *pg;

         spin_lock(&d->arch.paging.lock);
         pg = page_list_remove_head(&d->arch.paging.freelist);
         spin_unlock(&d->arch.paging.lock);

         INIT_LIST_HEAD(&pg->list);

         return pg;
     }

     static struct page_info *p2m_alloc_page(struct domain *d)
     {
         struct page_info *pg = paging_alloc_page(d);

         if ( pg )
             page_list_add(pg, &p2m_get_hostp2m(d)->pages);

         return pg;
     }

So I have to reuse another field from struct page_info. It seems like it won't be an
issue if to add a new struct page_list_entry metadata_list to 'union v':
     union {
         /* Page is in use */
         struct {
             /* Owner of this page (NULL if page is anonymous). */
             struct domain *domain;
         } inuse;

         /* Page is on a free list. */
         struct {
             /* Order-size of the free chunk this page is the head of. */
             unsigned int order;
         } free;
+
+       struct page_list_entry metadata_list;
     } v;

Am I missing something?

~ Oleksii

--------------2bXm36yqjmyBJuwq0aGvkJrL
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
    <div class="moz-cite-prefix">On 7/23/25 11:46 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:170d6cc9-542e-4129-b3bb-bf9ea0844bc4@suse.com">
      <pre class="moz-quote-pre" wrap=""><blockquote type="cite"
      style="color: #007cff;"><pre wrap="" class="moz-quote-pre">I assume that I have in this case to take some pages for an intermediate page
table from freelist P2M pool, set an owner domain to NULL (pg-&gt;inuse.domain = NULL).

Then in this case it isn't clear why pg-&gt;list can't be re-used to link several pages
for intermediate page table purposes + metadata? Is it because pg-&gt;list can be not
empty? In this case it isn't clear if I could use a page, which has threaded pages.
</pre></blockquote><pre wrap="" class="moz-quote-pre">Actually looks like I was mis-remembering. Pages removed from freelist indeed
aren't put on any other list, so the linking fields are available for use. I
guess I had x86 shadow code in mind, where the linking fields are further used.</pre></pre>
    </blockquote>
    <pre>Perhaps, I misunderstood you about "linking fields", but it seems like I can't reuse
struct page_info-&gt;list as it is used by page_list_add() which is called by p2m_alloc_page()
to allocate page(s) for an intermediate page table:
   static inline void
   page_list_add(struct page_info *page, struct page_list_head *head)
   {
        list_add(&amp;page-&gt;list, head);
   }

    struct page_info * paging_alloc_page(struct domain *d)
    {
        struct page_info *pg;

        spin_lock(&amp;d-&gt;arch.paging.lock);
        pg = page_list_remove_head(&amp;d-&gt;arch.paging.freelist);
        spin_unlock(&amp;d-&gt;arch.paging.lock);

        INIT_LIST_HEAD(&amp;pg-&gt;list);

        return pg;
    }

    static struct page_info *p2m_alloc_page(struct domain *d)
    {
        struct page_info *pg = paging_alloc_page(d);

        if ( pg )
            page_list_add(pg, &amp;p2m_get_hostp2m(d)-&gt;pages);

        return pg;
    }

So I have to reuse another field from struct page_info. It seems like it won't be an
issue if to add a new struct page_list_entry metadata_list to 'union v':
    union {
        /* Page is in use */
        struct {
            /* Owner of this page (NULL if page is anonymous). */
            struct domain *domain;
        } inuse;

        /* Page is on a free list. */
        struct {
            /* Order-size of the free chunk this page is the head of. */
            unsigned int order;
        } free;
+
+       struct page_list_entry metadata_list;       
    } v;

Am I missing something?

~ Oleksii

</pre>
  </body>
</html>

--------------2bXm36yqjmyBJuwq0aGvkJrL--

