Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9534ABB0B1
	for <lists+xen-devel@lfdr.de>; Sun, 18 May 2025 17:38:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989270.1373493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGg4t-0002gx-2U; Sun, 18 May 2025 15:37:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989270.1373493; Sun, 18 May 2025 15:37:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGg4s-0002eG-WC; Sun, 18 May 2025 15:37:27 +0000
Received: by outflank-mailman (input) for mailman id 989270;
 Sun, 18 May 2025 15:37:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4ra6=YC=a-greve.de=andreas.greve@srs-se1.protection.inumbo.net>)
 id 1uGg4q-0002eA-A1
 for xen-devel@lists.xenproject.org; Sun, 18 May 2025 15:37:24 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.217]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc9a4c98-33fd-11f0-9ffb-bf95429c2676;
 Sun, 18 May 2025 17:37:21 +0200 (CEST)
Received: from dmzmail.linux.bogus by smtp.strato.de (RZmta 51.3.0 DYNA|AUTH)
 with ESMTPSA id 6293ac14IFbJTns
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate)
 for <xen-devel@lists.xenproject.org>;
 Sun, 18 May 2025 17:37:19 +0200 (CEST)
Received: from [192.168.5.100] (p508196e9.dip0.t-ipconnect.de [80.129.150.233])
 (authenticated bits=0)
 by dmzmail.linux.bogus (8.17.1.9/8.17.1.9/Debian-2+deb12u2) with ESMTPSA id
 54IFbHq4241291
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT);
 Sun, 18 May 2025 17:37:17 +0200
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
X-Inumbo-ID: fc9a4c98-33fd-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; t=1747582639; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=qW8INH6a9Fy/q9DFE7qadpbd0EgG62cfRDeoO77c8FNUCYF0/OJ5FK3NtSUHTBChvQ
    BPFfK+9KE+2YvPXCSfG+Z+MBWck4Gu8AK9Tm5QH78bMF1HZJaBqSabjYQSFkzdm4/y/e
    NX0tho1AzgGsXApLRbx6uiDH87FSwTFiB2SKoy33sLFjwXiwU2Ll9P9NhKPeTeJKX/jg
    kmvF4XY26E8cS990ouvdcpRH3YNJMFgo8cgN194QXd7ikBsYm112ra9govg8vwtFEAYn
    kg27WllKFnG17udyMek20hwT5dsUDi26+rcUUXfaLve9MR+0M5/R3CBQEpOUlcqn+xBW
    lFFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1747582639;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:Cc:References:To:Subject:Reply-To:Date:Message-ID:
    Cc:Date:From:Subject:Sender;
    bh=TxBzSHtsc9lclNxdJck3wIIncXDkvgK/dr0Fa6blPnI=;
    b=VCBjLAmK2OTbhNfR1VWLdJqQ9VzDG/GJIIYD6yWtKEo3tV8Nqw3x/7RC2WRaH3p2Pu
    WnT1UkmLihiu7amxBIv1SSgOcDezN10LWs1MChEU2rPLLmQ+3LLIJMpl6HnirXYZJlnC
    t+9/TqHLK1bmwpaltJC4KDbag/G9ZM5yXsitFc7ECqb2zbI8DU593iUVJNoPMXxy7EIm
    dxv2pOuaALFJZV1/HYWzHcOISEklFCu1hzEQafUxWE1Tx0itxIqj8iEINZj6TZA8EZJj
    uwAAbf/6C0c+oZXMO/u98rQdb6PYbxhIcfKdwosS2F6iZku7v974nL9Iv3CoQai1rSxk
    ljow==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1747582639;
    s=strato-dkim-0002; d=a-greve.de;
    h=In-Reply-To:From:Cc:References:To:Subject:Reply-To:Date:Message-ID:
    Cc:Date:From:Subject:Sender;
    bh=TxBzSHtsc9lclNxdJck3wIIncXDkvgK/dr0Fa6blPnI=;
    b=i825Os2rWRWe0HYuMVgkpDuXQqWS58WE+5cGj4RHBYMoukKb4Qu89nzClcRW75sd8E
    iHPBe8uGBVI61J4gKJBzkNf9CK/+gpIE62BWgm5r0fYAbqzAcgOfM7IOx7kdQB3D++gG
    VRpfjiMO59ZwsfIlEQXvR9EuCV+YPiGTLiA2IHovT8mYIJ4jDow2xqRAK+o46WvngoVM
    1SIOD6nf3MullIuPMSTpHRRvIB7F1MueCRpG01nnkBZvB+NUpeblQrQ7e/jgQjrKE39Z
    qaBjVNDRh5kjH4LDrEHZvznDsKcjdbjpu8za+OxGFfHKN+4HFjpe+rVdTQftJmgpd+Tc
    lzxA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1747582639;
    s=strato-dkim-0003; d=a-greve.de;
    h=In-Reply-To:From:Cc:References:To:Subject:Reply-To:Date:Message-ID:
    Cc:Date:From:Subject:Sender;
    bh=TxBzSHtsc9lclNxdJck3wIIncXDkvgK/dr0Fa6blPnI=;
    b=t1Vw6PDOnyvkUckjI3fzSjuANyckig6Kh9GZvQav/lMp2HSHqg0CinLnEOGgd+Iw9w
    UW4gb4Gxb1HfhvuJozBA==
X-RZG-AUTH: ":I3kQck+hdfi/FoX876SYvGxtQu+BXCDuSQ9UENFBFhpuMtcK2yjIjEY8XWHyeFlVfYF7"
Content-Type: multipart/alternative;
 boundary="------------lmiZ0fl3KS8jPP4VeNF5ri02"
Message-ID: <93625976-e8af-4c39-90fb-45c926d420fd@a-greve.de>
Date: Sun, 18 May 2025 17:37:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: andreas.greve@a-greve.de
Subject: Re: BUG kernel 6.12.19 defautl_swiotlb_limit() returns wrong value
 for CONFIG_SWIOTLB_DYNAMIC=y effects atm only under XEN dom0
To: xen-devel@lists.xenproject.org
References: <f74668db-52fd-4575-8372-7bfdf10d62ac@a-greve.de>
Content-Language: en-US
Cc: andreas.greve@a-greve.de
From: Andreas Greve <andreas.greve@a-greve.de>
In-Reply-To: <f74668db-52fd-4575-8372-7bfdf10d62ac@a-greve.de>
Content-Transfer-Encoding: 8bit

This is a multi-part message in MIME format.
--------------lmiZ0fl3KS8jPP4VeNF5ri02
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello to all,

here is my BUG-Fix tested against kernel 6.12.19 and 6.12.28.

Signed-off-by: Andreas Greveandreas.greve@a-greve.de

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index abcf3fa63a56..742e6cbbe852 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -1654,7 +1654,16 @@ phys_addr_t default_swiotlb_base(void)
  phys_addr_t default_swiotlb_limit(void)
  {
  #ifdef CONFIG_SWIOTLB_DYNAMIC
-       return io_tlb_default_mem.phys_limit;
+       struct io_tlb_mem *mem = &io_tlb_default_mem;
+       phys_addr_t retval = mem->defpool.end;
+       struct io_tlb_pool *pool;
+       rcu_read_lock();
+       list_for_each_entry_rcu(pool, &mem->pools, node) {
+               if (pool->end > retval)
+                       retval = pool->end;
+       }
+       rcu_read_unlock();
+       return retval - 1;
  #else
         return io_tlb_default_mem.defpool.end - 1;
  #endif


--------------lmiZ0fl3KS8jPP4VeNF5ri02
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hello to all,</p>
    <p>here is my BUG-Fix tested against kernel 6.12.19 and 6.12.28.</p>
    <pre>Signed-off-by: Andreas Greve <a class="moz-txt-link-abbreviated" href="mailto:andreas.greve@a-greve.de">andreas.greve@a-greve.de</a></pre>
    <p></p>
    <p>diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c<br>
      index abcf3fa63a56..742e6cbbe852 100644<br>
      --- a/kernel/dma/swiotlb.c<br>
      +++ b/kernel/dma/swiotlb.c<br>
      @@ -1654,7 +1654,16 @@ phys_addr_t default_swiotlb_base(void)<br>
       phys_addr_t default_swiotlb_limit(void)<br>
       {<br>
       #ifdef CONFIG_SWIOTLB_DYNAMIC<br>
      -       return io_tlb_default_mem.phys_limit;<br>
      +       struct io_tlb_mem *mem = &amp;io_tlb_default_mem;<br>
      +       phys_addr_t retval = mem-&gt;defpool.end;<br>
      +       struct io_tlb_pool *pool;<br>
      +       rcu_read_lock();<br>
      +       list_for_each_entry_rcu(pool, &amp;mem-&gt;pools, node) {<br>
      +               if (pool-&gt;end &gt; retval)<br>
      +                       retval = pool-&gt;end;<br>
      +       }<br>
      +       rcu_read_unlock();<br>
      +       return retval - 1;<br>
       #else<br>
              return io_tlb_default_mem.defpool.end - 1;<br>
       #endif<br>
    </p>
    <br>
  </body>
</html>

--------------lmiZ0fl3KS8jPP4VeNF5ri02--

