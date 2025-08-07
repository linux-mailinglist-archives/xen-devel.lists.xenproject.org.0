Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEEEB1DB27
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 17:59:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073267.1436167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk31d-0001Am-H1; Thu, 07 Aug 2025 15:59:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073267.1436167; Thu, 07 Aug 2025 15:59:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk31d-00017m-Dj; Thu, 07 Aug 2025 15:59:29 +0000
Received: by outflank-mailman (input) for mailman id 1073267;
 Thu, 07 Aug 2025 15:59:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oMMd=2T=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uk31b-00017c-FM
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 15:59:27 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7da6901d-73a7-11f0-b898-0df219b8e170;
 Thu, 07 Aug 2025 17:59:25 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-ae6f8d3bcd4so227618266b.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Aug 2025 08:59:25 -0700 (PDT)
Received: from [192.168.1.17] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af93d62bc97sm1056064666b.80.2025.08.07.08.59.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Aug 2025 08:59:24 -0700 (PDT)
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
X-Inumbo-ID: 7da6901d-73a7-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754582365; x=1755187165; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0wgtPBavqi4PFHyWY9Rb9EAc0CZ4jorCn0z6GQ8ZqWE=;
        b=RKtPQNkv97/JGpObUssHpocSl8hMwDX0AyxITsndHeDk6DD6ruWOjBvl6IlPTkJD1x
         owQQ6bnZve03zzQXqIyGIKcofnJmRM7ZkjQqterHoCXzRgl4weuhcOb+7WgKv3ABFkjp
         HYmnMsSC6IO8B+AY276xz6sfUt1lRImCoWwalUPEwNlWMToFY1Z5E2EdwJow+/FT7dVl
         m2/l7XXEgMq7C7YOwwfYMoWi8++4NB65ATNdX11NZd/mSOhtjFrw+syOUXi5gwpLR+IL
         GzBbevODLNzcu7rPZW2LMd0LYVwElUAVUgen3S2f8632uPbebKjwH5lCwXw+GQxDvICS
         0uig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754582365; x=1755187165;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0wgtPBavqi4PFHyWY9Rb9EAc0CZ4jorCn0z6GQ8ZqWE=;
        b=dP0gMuw0IteE18BTzJpXtla6YYiLWeWXIXtUB9eIBV5VE49iyftISqNlXBF0ZVEVdK
         RstcBWNpn78EviSUdVnf6QXoEUn5+nbud9TvRUBuoHVPrEanlvUD05G45KNFML7tElET
         0nHAT/O6u4obQ7Tle8sJP1GCALQwcuLzdWiHRdIAXZpGczOZQCR3Sg+OFEmCfmjWza69
         zC+QgMC+Fe7UFK6eU0OBDc7R2nLph+wWTsGYn+9e92u0aMOxlL0c5JdY8CDUbKNJ9vYS
         2m6XBCBD+fYLJARlshluJ4QjiT/OTXj5g/U0I3vZeVOjJWEll6dbE2vfgoGuh9tON7uO
         ntVA==
X-Forwarded-Encrypted: i=1; AJvYcCVNGlegRuVbvPWlb3TbmsPCKDjQxY1BNU5dWzUrFG18TA3PYH2TRg9jN+T5iOwZ89+WeSLwULWtpjc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzgrxqlPlOOBRVFpGiUl94OChS/K3qIu+22Z3TbwuvJgJHwr/FV
	i7pzFGvkkkgMY5EZJqwVYaeKnYVuwOL3ecO4jkR8tkZ7YiFzKCbwvcNM
X-Gm-Gg: ASbGncsDKmZjyDMCNz6PJXfAZeOvhqjZEiIvNXMPhdPyDmIapedvJ4KF3HqX3GHH2O8
	ESgHYiu4zsfQtvMf/w+I+6RdjAwUTkDbDi2FYjEnaKZB3ojlWk+22kd8PcFCZJzD4ouIJTTitz8
	Zz+WQ25EvuYOv6zGZUCEmBeZWJ1lgnRW0NpjqiSJqZTGvKBeUX0WwfBEQNVVcwD/1FyEm55e4kG
	CKgBsiGm7TeYphRXFn+/iaGScW1YI3fYKCQc4ldIqXCEe2SbGjDdvFPKKO0jJh3Ya4WUePoNdtB
	EaWYfqrVcj1VUsJmZmCfwfMSZZft+Z8yX0RJ8hQAxSZGMr7asRq1NBnTBMc0tsL5tJfxhqcYvVJ
	ujn5T+eNx+AkDmGR3KqE6TkEIOeEbsaL1J6EGgLEk7PIhJaE5lssfYN2fzWKe4smb49js43gx
X-Google-Smtp-Source: AGHT+IF6JpGu0ylcGSsFXKfkBWZUNHNaQB51sxXElkBY8cIkavWQP5x60LqdH4bvjmey/yjsXPrlhg==
X-Received: by 2002:a17:907:96a5:b0:ade:198c:4b6f with SMTP id a640c23a62f3a-af9c1c503ecmr42455566b.1.1754582364461;
        Thu, 07 Aug 2025 08:59:24 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------5KcyPkjop0awM4nKFAFs0bwU"
Message-ID: <9fec023f-3b93-49a4-8ee2-ab2194951b19@gmail.com>
Date: Thu, 7 Aug 2025 17:59:22 +0200
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
 <3c02593f-deae-4109-9334-0ac4376a9a9e@suse.com>
 <d160c6da-a4a8-44ca-9dc5-b1e3cb31bde5@gmail.com>
 <d81b41c9-59e1-4807-af27-9d952d35ba42@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <d81b41c9-59e1-4807-af27-9d952d35ba42@suse.com>

This is a multi-part message in MIME format.
--------------5KcyPkjop0awM4nKFAFs0bwU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/7/25 5:30 PM, Jan Beulich wrote:
> On 07.08.2025 14:00, Oleksii Kurochko wrote:
>> On 8/5/25 12:37 PM, Jan Beulich wrote:
>>> On 31.07.2025 17:58, Oleksii Kurochko wrote:
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
>>> Hmm, and the pool is then left shrunk by 4 pages?
>> Yes until they are used for root table it shouldn't be in p2m pool (freelist),
>> when root table will be freed then it makes sense to return them back.
>> Am I missing something?
> I'm commenting specifically on the error path here.

Ohh, got it.

In this case, should we really care about this 4 pages as a domain can't be ran
without allocated page root table and a panic() will be occured anyway according
to the create_domUs() common code (construct_domU() -> domain_p2m_set_allocation()
-> p2m_set_allocation() -> p2m_alloc_root_table()):
...
         rc = construct_domU(&ki, node);
         if ( rc )
             panic("Could not set up domain %s (rc = %d)\n",
                   dt_node_name(node), rc);
...
(Note: I missed to return a value returned by p2m_alloc_root_table() in p2m_set_allocation()
so it isn't really propagated, at the moment, but I will fix that in the next patch
version) ...

>> Probably, you meant that it is needed to update p2m->pages?
> That (I think) I commented on elsewhere, yes.
...

if it is needed really to update p2m->pages when a page is allocated, I think
it will be better to in p2m_allocate_root() immediately after alloc_domheap_pages()
is called in p2m_allocate_root().

~ Oleksii


--------------5KcyPkjop0awM4nKFAFs0bwU
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
    <div class="moz-cite-prefix">On 8/7/25 5:30 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:d81b41c9-59e1-4807-af27-9d952d35ba42@suse.com">
      <pre wrap="" class="moz-quote-pre">On 07.08.2025 14:00, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 8/5/25 12:37 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 31.07.2025 17:58, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+    /*
+     * Return back nr_root_pages to assure the root table memory is also
+     * accounted against the P2M pool of the domain.
+     */
+    if ( !paging_ret_pages_to_domheap(d, nr_root_pages) )
+        return -ENOMEM;
+
+    page = p2m_allocate_root(d);
+    if ( !page )
+        return -ENOMEM;
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Hmm, and the pool is then left shrunk by 4 pages?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Yes until they are used for root table it shouldn't be in p2m pool (freelist),
when root table will be freed then it makes sense to return them back.
Am I missing something?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I'm commenting specifically on the error path here.</pre>
    </blockquote>
    <pre>Ohh, got it.

In this case, should we really care about this 4 pages as a domain can't be ran
without allocated page root table and a panic() will be occured anyway according
to the create_domUs() common code (construct_domU() -&gt; domain_p2m_set_allocation()
-&gt; p2m_set_allocation() -&gt; p2m_alloc_root_table()):
...
        rc = construct_domU(&amp;ki, node);
        if ( rc )
            panic("Could not set up domain %s (rc = %d)\n",
                  dt_node_name(node), rc);
...
(Note: I missed to return a value returned by p2m_alloc_root_table() in p2m_set_allocation()
so it isn't really propagated, at the moment, but I will fix that in the next patch
version) ...

</pre>
    <blockquote type="cite"
      cite="mid:d81b41c9-59e1-4807-af27-9d952d35ba42@suse.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Probably, you meant that it is needed to update p2m-&gt;pages?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
That (I think) I commented on elsewhere, yes.</pre>
    </blockquote>
    ... <br>
    <pre>if it is needed really to update p2m-&gt;pages when a page is allocated, I think
it will be better to in p2m_allocate_root() immediately after alloc_domheap_pages()
is called in p2m_allocate_root().

</pre>
    <pre>~ Oleksii
</pre>
    <br>
  </body>
</html>

--------------5KcyPkjop0awM4nKFAFs0bwU--

