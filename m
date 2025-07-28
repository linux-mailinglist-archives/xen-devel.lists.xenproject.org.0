Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C85B139FB
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 13:38:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061372.1426933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugMB1-0001Bi-PH; Mon, 28 Jul 2025 11:37:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061372.1426933; Mon, 28 Jul 2025 11:37:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugMB1-0001A2-MB; Mon, 28 Jul 2025 11:37:55 +0000
Received: by outflank-mailman (input) for mailman id 1061372;
 Mon, 28 Jul 2025 11:37:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WhXX=2J=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ugMAz-00019w-P3
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 11:37:53 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4bd1ea3e-6ba7-11f0-a31e-13f23c93f187;
 Mon, 28 Jul 2025 13:37:52 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-6088d856c6eso8313124a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 04:37:52 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6151f13c87esm2134980a12.35.2025.07.28.04.37.50
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 04:37:50 -0700 (PDT)
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
X-Inumbo-ID: 4bd1ea3e-6ba7-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753702672; x=1754307472; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b9rDCfdCnwhGu+LprCXt5KZN3hnsyDloxmBYyp9+KV0=;
        b=TZ2yHuGxYHqDCFJVMSZmb5pOlqpqVnw1xf00fP0BBOX9rPZHwj8b59vtTw0UCW/mtW
         JydnS+wpRqta0BtmqHn/tDrzcXIgg2czu10rXUvbk3nRKD5BO27jHuiShnRq3TcCQ374
         b25rIp3QT7qqj3h4rrtjHMJJj/whF8VVuzQT0zyxiwuc6DLNxxE9m4cxrr0faqDU01Na
         +aNjz+/kF8tCTE8S7j4XjkKaLPxbanjz4E14dnYU6AX0NIzyBM1YS7mNA6c1Qt3xGyix
         ZI8Zg9vT2bo74KnPTngvtcxqE/gUq0llDzzf+lephqwzBBefDrzv0kDMx+6Tz8I9hSaB
         MJqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753702672; x=1754307472;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=b9rDCfdCnwhGu+LprCXt5KZN3hnsyDloxmBYyp9+KV0=;
        b=WQ+KGlEjjosDksDz2iXosCl8bP5xNhWibxjNowVeVUVH1CJ+Gg5EYYzJUk+YPTz8Sy
         T53cwKgRKDe2X2pVhepxKvCKuKLV55VLT1s4nKus51N6o0OCKx7jdZi47gTslHEaNc01
         rgE5fueeeW/RQIfAnTq81YNOWlJATP9H3IeRWP77VPxWLnJEFsaZxlG5K3ksmoMiV/gO
         Gqq9A9b7rVtI6lcJYlUF1wI4HRRUkkkO+2X7zXuxd/bH8FrY+HC4n/Ird4UiNAjMCyj9
         dPhha2AE1db6XrC1g86xnt/7cRakEGRgKSvu3n3s62KJ2F6RUwgQ5gefhSFIBog+2bdY
         MdNg==
X-Gm-Message-State: AOJu0Yx8GDV07tkCiA8sh/jJubRT8NlfpaIpWnLsL1z3+f3n+E8AOItv
	tveWORxVioqTeIuH3MyG0uwwE1BWuoPKTuokSR2WLiHBsAk5cfFQltIpj1E4Vg==
X-Gm-Gg: ASbGncsyg140a2m891nHnsAK92IEmU+pMi0YrPYArw32uxResYCh5vEW6Qb/ubVrX50
	xntM/jTpc5bv3FWnZKG86wWszuTX7pnCHn1AZm7UHs2USNkRf0s0W8i0VRCre17xejMFQYSKtpd
	U2pa3zL/nmj2kwJRMqhS+tc/4U+GU0+LL4dJfW87yyCViPRjjk/Fd+zvPq5/nP1isFLzfOcJd9B
	m3dA3yszLbvIKncLqFlcVS3IiqyZdoXatZ7NTAkIFRyXP7IM/KQokkp2Xn94PeBMuMknB7sMx6r
	sIn77R/o4Lu0Yn1/KQpXBuD1oyss11niLsePTfP8ZdXgfm/363LJlV7cXn+GDN0rWnQdwFngtat
	/HP9TVdXua36/fL/jkh+SmNAWS+EubANJywauQtcPrbMfyUxOURuQ1EatrEYeCcok6tEqOsc=
X-Google-Smtp-Source: AGHT+IHjDje7KcgVAKY/uqGSsB6Jtzhvfo6EommKyqp4cFzvU2RlM6emcGbKOq7oRoGu3NO0BY5KzA==
X-Received: by 2002:a05:6402:1e89:b0:615:281b:897a with SMTP id 4fb4d7f45d1cf-615281b8cdfmr4129341a12.29.1753702671407;
        Mon, 28 Jul 2025 04:37:51 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------Ole0XlyjuZlZxZZrFuQpV1IK"
Message-ID: <e9ac761d-dc12-43b5-8d67-984f3938817d@gmail.com>
Date: Mon, 28 Jul 2025 13:37:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/17] xen/riscv: Implement p2m_entry_from_mfn() and
 support PBMT configuration
To: xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
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
 <78488064-694a-4020-8c08-7b12184b8669@gmail.com>
 <7d789e2d-19c1-443e-a319-ad230f5f9ebd@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <7d789e2d-19c1-443e-a319-ad230f5f9ebd@suse.com>

This is a multi-part message in MIME format.
--------------Ole0XlyjuZlZxZZrFuQpV1IK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/28/25 11:09 AM, Jan Beulich wrote:
> On 28.07.2025 10:52, Oleksii Kurochko wrote:
>> On 7/23/25 11:46 AM, Jan Beulich wrote:
>>>> I assume that I have in this case to take some pages for an intermediate page
>>>> table from freelist P2M pool, set an owner domain to NULL (pg->inuse.domain = NULL).
>>>>
>>>> Then in this case it isn't clear why pg->list can't be re-used to link several pages
>>>> for intermediate page table purposes + metadata? Is it because pg->list can be not
>>>> empty? In this case it isn't clear if I could use a page, which has threaded pages.
>>> Actually looks like I was mis-remembering. Pages removed from freelist indeed
>>> aren't put on any other list, so the linking fields are available for use. I
>>> guess I had x86 shadow code in mind, where the linking fields are further used.
>> Perhaps, I misunderstood you about "linking fields", but it seems like I can't reuse
>> struct page_info->list as it is used by page_list_add() which is called by p2m_alloc_page()
>> to allocate page(s) for an intermediate page table:
>>      static inline void
>>      page_list_add(struct page_info *page, struct page_list_head *head)
>>      {
>>           list_add(&page->list, head);
>>      }
>>
>>       struct page_info * paging_alloc_page(struct domain *d)
>>       {
>>           struct page_info *pg;
>>
>>           spin_lock(&d->arch.paging.lock);
>>           pg = page_list_remove_head(&d->arch.paging.freelist);
>>           spin_unlock(&d->arch.paging.lock);
>>
>>           INIT_LIST_HEAD(&pg->list);
>>
>>           return pg;
>>       }
>>
>>       static struct page_info *p2m_alloc_page(struct domain *d)
>>       {
>>           struct page_info *pg = paging_alloc_page(d);
>>
>>           if ( pg )
>>               page_list_add(pg, &p2m_get_hostp2m(d)->pages);
>>
>>           return pg;
>>       }
>>
>> So I have to reuse another field from struct page_info. It seems like it won't be an
>> issue if to add a new struct page_list_entry metadata_list to 'union v':
>>       union {
>>           /* Page is in use */
>>           struct {
>>               /* Owner of this page (NULL if page is anonymous). */
>>               struct domain *domain;
>>           } inuse;
>>
>>           /* Page is on a free list. */
>>           struct {
>>               /* Order-size of the free chunk this page is the head of. */
>>               unsigned int order;
>>           } free;
>> +
>> +       struct page_list_entry metadata_list;
>>       } v;
>>
>> Am I missing something?
> Well, you're doubling the size of that union then, aren't you? As was mentioned
> quite some time ago, struct page_info needs quite a bit of care when you mean
> to add new fields there. Question is whether for the purpose here you actually
> need a doubly-linked list. A single pointer would be fine to put there.

Agree, a single pointer will be more then enough.

I'm thinking if it is possible to do something with the case if someone will try
to use:
   #define page_get_owner(p)    (p)->v.inuse.domain
for a page which was allocated for metadata storage. Shouldn't I have a separate
list for such pages and a macro which will check if a page is in this list?
Similar a list which we have for p2m pages in struct p2m_domain:
     ...
     /* Pages used to construct the p2m */
     struct page_list_head pages;
     ...

Of course, such pages are allocated by alloc_domheap_page(d, MEMF_no_owner),
so there is no owner. But if someone will accidentally use this macro for such
pages then it will be an issue as ->domain likely won't be a NULL anymore.

~ Oleksii


--------------Ole0XlyjuZlZxZZrFuQpV1IK
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
    <div class="moz-cite-prefix">On 7/28/25 11:09 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:7d789e2d-19c1-443e-a319-ad230f5f9ebd@suse.com">
      <pre wrap="" class="moz-quote-pre">On 28.07.2025 10:52, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 7/23/25 11:46 AM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">I assume that I have in this case to take some pages for an intermediate page
table from freelist P2M pool, set an owner domain to NULL (pg-&gt;inuse.domain = NULL).

Then in this case it isn't clear why pg-&gt;list can't be re-used to link several pages
for intermediate page table purposes + metadata? Is it because pg-&gt;list can be not
empty? In this case it isn't clear if I could use a page, which has threaded pages.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Actually looks like I was mis-remembering. Pages removed from freelist indeed
aren't put on any other list, so the linking fields are available for use. I
guess I had x86 shadow code in mind, where the linking fields are further used.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Perhaps, I misunderstood you about "linking fields", but it seems like I can't reuse
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
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Well, you're doubling the size of that union then, aren't you? As was mentioned
quite some time ago, struct page_info needs quite a bit of care when you mean
to add new fields there. Question is whether for the purpose here you actually
need a doubly-linked list. A single pointer would be fine to put there.</pre>
    </blockquote>
    <pre>Agree, a single pointer will be more then enough.</pre>
    <pre>I'm thinking if it is possible to do something with the case if someone will try
to use:
  #define page_get_owner(p)    (p)-&gt;v.inuse.domain
for a page which was allocated for metadata storage. Shouldn't I have a separate
list for such pages and a macro which will check if a page is in this list?
Similar a list which we have for p2m pages in struct p2m_domain:
    ...
    /* Pages used to construct the p2m */
    struct page_list_head pages;
    ...

Of course, such pages are allocated by alloc_domheap_page(d, MEMF_no_owner),
so there is no owner. But if someone will accidentally use this macro for such
pages then it will be an issue as -&gt;domain likely won't be a NULL anymore.

~ Oleksii


</pre>
  </body>
</html>

--------------Ole0XlyjuZlZxZZrFuQpV1IK--

