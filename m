Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 426DCB2A5D0
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 15:38:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086121.1444354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uo03n-0006V7-Pp; Mon, 18 Aug 2025 13:38:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086121.1444354; Mon, 18 Aug 2025 13:38:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uo03n-0006Ry-Mf; Mon, 18 Aug 2025 13:38:03 +0000
Received: by outflank-mailman (input) for mailman id 1086121;
 Mon, 18 Aug 2025 13:38:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YQjc=26=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uo03m-0006Rs-7c
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 13:38:02 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8eefac4b-7c38-11f0-a32a-13f23c93f187;
 Mon, 18 Aug 2025 15:38:00 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-afcb731ca8eso685372966b.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Aug 2025 06:38:00 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdce53f19sm807253566b.26.2025.08.18.06.37.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 06:37:59 -0700 (PDT)
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
X-Inumbo-ID: 8eefac4b-7c38-11f0-a32a-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755524280; x=1756129080; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aU6WsleQrH2ihQNXjsgn5kb3s440pPqiiKUIoE9B/8E=;
        b=aRSnpCvE+vuuiiSj4zdTOOho7YfTIf+ke1dWpXFhxXD3n0iX3EXEa0T+69X1S/4vu8
         MgqaO0PEIETwZscuGu/5uanrVVpGiygMMtUf9H64HWgAKB4MvFiHNSY/kTe1f4+ehjyj
         38sgJfp0CQkh4QoFkm/yUsGEm58Mc43y2ZYciD93IQ23FqVvbJYKeJ6cHcWzjNTMFceV
         WRp57ouso7OlaPgwCkkXLFYHXDxR0cABTYtl0oV5jdqClIE/jtxU2Bk/IC9Iw3tX78TI
         cX8wXQtJFpKosGGLgXpBzJzd91yX5dIKvXJnHP1Q1SeyyS9DW1Hd5nNNU+4ohe9g9Wnk
         bk/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755524280; x=1756129080;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aU6WsleQrH2ihQNXjsgn5kb3s440pPqiiKUIoE9B/8E=;
        b=qqfsPUstDy9pnnnKB/HPxKJwRA3+xGQIhwUFGydY/3gUkHMp1a1OIA+ZC66qPTXBAL
         rvXiHjqkMi3peYkUrl+yShsPPt4IOUqkaN2akdZXcO8F9XrQmN+8J98lvoMqj5S1os4W
         j7AlbF7D3K00bJFkJG3rj8GvehJxRR8xVQ6l2UMGAuroDaHZnQIxXPHzQVU4UhGCD0mO
         rgAu+8j1x5RDJcQmMhg1008z5R9PK/7/rEc5MXJrT11g1Yf3uLk0K8hNbxVO0gbPFdE2
         n6MRgJ9aEYBlbUHzptySWAPqjw7PUzsf1/gnhRBHZXIXMlzJ7uSoD8yzG0lgUzKJ3mUk
         nJGw==
X-Forwarded-Encrypted: i=1; AJvYcCWVC8zf+MaA6+rt3VWnIQyw55PuNtGQADYmmI6nqkyJTfK+LX/3xBUPt16TqD+jEtI9uUksWesVGIE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwnNg6xqumclH/kFgm6dQ5kDyjnXrtsIk/jegE3tlb9QNaIqfLe
	oaH1IGAqVTBPTUSm1KdJOc5MN7u+QBdgml6VfQJjkqHfgoH8Ps16ZU3Y
X-Gm-Gg: ASbGncuUMCauzbKJhKldiJg5wauJfg5s3UtXQvBuXhHtyUQrkn6ZCCYHJMmU/4qZsNM
	VtO9IV+5jal6MBeC3/FTBC9BqkRlwPEk7R5aeCpQcVFAxtYUTAoTjsQAOMDFEDD0FQ8SKBOu7Cb
	WqgMm44/eutF7Tt1zpIgM+qoFck35V+GrA7gX2PYIxzJKPv5/xrhAHSmegjph7IYJep2XO9fPqE
	hcSqGIxyrnR2R5JLUSm4jghCBTCwCTQi/J0LYrDDZimmMNm1mL3sQjpuyhM78LD0KOF02MQRShK
	bphvL+1/KFmsRskt+pZE/483P+bcXl3jpxp316NNCdcw+rsy5RXLutXH2eSbulN0JwG0DJyAnJ6
	ftWJlpM0zjjq/3ZMTB7YpSHrXmUnfc152eLD87uCNqV9f+vBfPBTMRok6X9C+iAFnNM8/V6SrxE
	DELmBsCA==
X-Google-Smtp-Source: AGHT+IEX7UgxuBSUYDk8vU5NmzFX871vMHKJWg7x8U/4UtMWZ9ztxrGltPz2kEZcRIP2sFy3fq+gaQ==
X-Received: by 2002:a17:907:9344:b0:af8:f187:3222 with SMTP id a640c23a62f3a-afcdc35e589mr1098387166b.33.1755524279877;
        Mon, 18 Aug 2025 06:37:59 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------FX5uLnqQvBBN0CgrzLqcHXju"
Message-ID: <dcea6cee-7f8d-4f98-a72f-0969b818ffe0@gmail.com>
Date: Mon, 18 Aug 2025 15:37:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] Arm: drop assertion from page_is_ram_type()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <a2dc40a8-908a-44a7-b443-90f492a775cc@suse.com>
 <753ce2a1-8d9c-41ba-a066-abf6f625cb60@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <753ce2a1-8d9c-41ba-a066-abf6f625cb60@suse.com>

This is a multi-part message in MIME format.
--------------FX5uLnqQvBBN0CgrzLqcHXju
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/18/25 9:55 AM, Jan Beulich wrote:
> Its uses in offline_page() and query_page_offline() make it reachable on
> Arm, as long as XEN_SYSCTL_page_offline_op doesn't have any Arm-specific
> code added. It being reachable was even mentioned in the commit
> introducing it, claiming it "clearly shouldn't be called on ARM just
> yet".
>
> However, dropping the assertion from a function of this name is deemed
> problematic. Rename it to better reflect its sole purpose outside of
> x86-specific code.
>
> Fixes: 214c4cd94a80 ("xen: arm: stub page_is_ram_type")
> Signed-off-by: Jan Beulich<jbeulich@suse.com>
> ---
> v2: Rename the function used in common code.
> ---
> The new name is chosen such that, down the road, offlining of non-RAM
> could in principle also become possible.

I think it could be useful to put in commit message.

LGTM: Reviewed-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

~ Oleksii

>
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -64,10 +64,9 @@ int steal_page(
>       return -EOPNOTSUPP;
>   }
>   
> -int page_is_ram_type(unsigned long mfn, unsigned long mem_type)
> +bool page_is_offlinable(mfn_t mfn)
>   {
> -    ASSERT_UNREACHABLE();
> -    return 0;
> +    return false;
>   }
>   
>   unsigned long domain_get_maximum_gpfn(struct domain *d)
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -425,6 +425,11 @@ int page_is_ram_type(unsigned long mfn,
>       return 0;
>   }
>   
> +bool page_is_offlinable(mfn_t mfn)
> +{
> +    return page_is_ram_type(mfn_x(mfn), RAM_TYPE_CONVENTIONAL);
> +}
> +
>   unsigned int page_get_ram_type(mfn_t mfn)
>   {
>       uint64_t last = 0, maddr = mfn_to_maddr(mfn);
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -1635,7 +1635,7 @@ static unsigned long mark_page_offline(s
>   {
>       unsigned long nx, x, y = pg->count_info;
>   
> -    ASSERT(page_is_ram_type(mfn_x(page_to_mfn(pg)), RAM_TYPE_CONVENTIONAL));
> +    ASSERT(page_is_offlinable(page_to_mfn(pg)));
>       ASSERT(spin_is_locked(&heap_lock));
>   
>       do {
> @@ -1711,7 +1711,7 @@ int offline_page(mfn_t mfn, int broken,
>        * N.B. xen's txt in x86_64 is marked reserved and handled already.
>        * Also kexec range is reserved.
>        */
> -    if ( !page_is_ram_type(mfn_x(mfn), RAM_TYPE_CONVENTIONAL) )
> +    if ( !page_is_offlinable(mfn) )
>       {
>           *status = PG_OFFLINE_FAILED | PG_OFFLINE_NOT_CONV_RAM;
>           return -EINVAL;
> @@ -1851,7 +1851,7 @@ int query_page_offline(mfn_t mfn, uint32
>   {
>       struct page_info *pg;
>   
> -    if ( !mfn_valid(mfn) || !page_is_ram_type(mfn_x(mfn), RAM_TYPE_CONVENTIONAL) )
> +    if ( !mfn_valid(mfn) || !page_is_offlinable(mfn) )
>       {
>           dprintk(XENLOG_WARNING, "call expand_pages() first\n");
>           return -EINVAL;
> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -144,9 +144,11 @@ unsigned long avail_domheap_pages_region
>   unsigned long avail_node_heap_pages(unsigned int nodeid);
>   #define alloc_domheap_page(d,f) (alloc_domheap_pages(d,0,f))
>   #define free_domheap_page(p)  (free_domheap_pages(p,0))
> +
>   int online_page(mfn_t mfn, uint32_t *status);
>   int offline_page(mfn_t mfn, int broken, uint32_t *status);
>   int query_page_offline(mfn_t mfn, uint32_t *status);
> +bool page_is_offlinable(mfn_t mfn);
>   
>   void heap_init_late(void);
>   
>
--------------FX5uLnqQvBBN0CgrzLqcHXju
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
    <div class="moz-cite-prefix">On 8/18/25 9:55 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:753ce2a1-8d9c-41ba-a066-abf6f625cb60@suse.com">
      <pre wrap="" class="moz-quote-pre">Its uses in offline_page() and query_page_offline() make it reachable on
Arm, as long as XEN_SYSCTL_page_offline_op doesn't have any Arm-specific
code added. It being reachable was even mentioned in the commit
introducing it, claiming it "clearly shouldn't be called on ARM just
yet".

However, dropping the assertion from a function of this name is deemed
problematic. Rename it to better reflect its sole purpose outside of
x86-specific code.

Fixes: 214c4cd94a80 ("xen: arm: stub page_is_ram_type")
Signed-off-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
---
v2: Rename the function used in common code.
---
The new name is chosen such that, down the road, offlining of non-RAM
could in principle also become possible.</pre>
    </blockquote>
    <pre>I think it could be useful to put in commit message.

LGTM: Reviewed-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:753ce2a1-8d9c-41ba-a066-abf6f625cb60@suse.com">
      <pre wrap="" class="moz-quote-pre">

--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -64,10 +64,9 @@ int steal_page(
     return -EOPNOTSUPP;
 }
 
-int page_is_ram_type(unsigned long mfn, unsigned long mem_type)
+bool page_is_offlinable(mfn_t mfn)
 {
-    ASSERT_UNREACHABLE();
-    return 0;
+    return false;
 }
 
 unsigned long domain_get_maximum_gpfn(struct domain *d)
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -425,6 +425,11 @@ int page_is_ram_type(unsigned long mfn,
     return 0;
 }
 
+bool page_is_offlinable(mfn_t mfn)
+{
+    return page_is_ram_type(mfn_x(mfn), RAM_TYPE_CONVENTIONAL);
+}
+
 unsigned int page_get_ram_type(mfn_t mfn)
 {
     uint64_t last = 0, maddr = mfn_to_maddr(mfn);
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1635,7 +1635,7 @@ static unsigned long mark_page_offline(s
 {
     unsigned long nx, x, y = pg-&gt;count_info;
 
-    ASSERT(page_is_ram_type(mfn_x(page_to_mfn(pg)), RAM_TYPE_CONVENTIONAL));
+    ASSERT(page_is_offlinable(page_to_mfn(pg)));
     ASSERT(spin_is_locked(&amp;heap_lock));
 
     do {
@@ -1711,7 +1711,7 @@ int offline_page(mfn_t mfn, int broken,
      * N.B. xen's txt in x86_64 is marked reserved and handled already.
      * Also kexec range is reserved.
      */
-    if ( !page_is_ram_type(mfn_x(mfn), RAM_TYPE_CONVENTIONAL) )
+    if ( !page_is_offlinable(mfn) )
     {
         *status = PG_OFFLINE_FAILED | PG_OFFLINE_NOT_CONV_RAM;
         return -EINVAL;
@@ -1851,7 +1851,7 @@ int query_page_offline(mfn_t mfn, uint32
 {
     struct page_info *pg;
 
-    if ( !mfn_valid(mfn) || !page_is_ram_type(mfn_x(mfn), RAM_TYPE_CONVENTIONAL) )
+    if ( !mfn_valid(mfn) || !page_is_offlinable(mfn) )
     {
         dprintk(XENLOG_WARNING, "call expand_pages() first\n");
         return -EINVAL;
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -144,9 +144,11 @@ unsigned long avail_domheap_pages_region
 unsigned long avail_node_heap_pages(unsigned int nodeid);
 #define alloc_domheap_page(d,f) (alloc_domheap_pages(d,0,f))
 #define free_domheap_page(p)  (free_domheap_pages(p,0))
+
 int online_page(mfn_t mfn, uint32_t *status);
 int offline_page(mfn_t mfn, int broken, uint32_t *status);
 int query_page_offline(mfn_t mfn, uint32_t *status);
+bool page_is_offlinable(mfn_t mfn);
 
 void heap_init_late(void);
 

</pre>
    </blockquote>
  </body>
</html>

--------------FX5uLnqQvBBN0CgrzLqcHXju--

