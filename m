Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E8962D066
	for <lists+xen-devel@lfdr.de>; Thu, 17 Nov 2022 02:09:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444452.699703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovTOD-00030C-QW; Thu, 17 Nov 2022 01:08:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444452.699703; Thu, 17 Nov 2022 01:08:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovTOD-0002s7-MW; Thu, 17 Nov 2022 01:08:25 +0000
Received: by outflank-mailman (input) for mailman id 444452;
 Thu, 17 Nov 2022 01:08:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BOBv=3R=citrix.com=prvs=31353e2df=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ovTOC-0002PW-CP
 for xen-devel@lists.xenproject.org; Thu, 17 Nov 2022 01:08:24 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 544abed0-6614-11ed-91b6-6bf2151ebd3b;
 Thu, 17 Nov 2022 02:08:23 +0100 (CET)
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
X-Inumbo-ID: 544abed0-6614-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668647303;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ap2hp5WICNPWbnbtbccI6RyBgntjwRWIPNLozuORhLE=;
  b=KWMGzipBweGURFunZZOb4n5S9B7QG//zgxiZVcIz6KPuo0KrHW6McnnV
   qrtzBhmZjDuMKuU88mkCDlnvfWszZTgCop/xreKKxYZoC74SMxk1Vi8vR
   /8pB1fN6xWuSAHodwBVLwHxAUnuluDG0BaNEZQE8XQObGT7wIjDmZ6aQp
   w=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 85008573
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:HVS5KKLuDOayhK8qFE+RJZUlxSXFcZb7ZxGr2PjKsXjdYENS1TYCz
 mMYCzqDbP3YNmfzKt13YYWz8EsOvp+Dz4QxGgJlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPdwP9TlK6q4mlB5wVgPasjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c4uJ1of7
 flJEww0Ywygn8Sn35+mVbJV05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpPE+ojx5nYz/7DLoXmuuyi2a5WDpfsF+P/oI84nTJzRw327/oWDbQUozXHZ0FwxnDz
 o7A1zjfEwAFOIy88AqI2W2vqbfVxQ31RqtHQdVU8dY12QbOlwT/EiY+a1y/pvWoj1+kbPhWI
 UcU5ykGoLA78QqgSdyVdx+lpH+JuDYMVtwWFPc1gCmHx7DI+Q+fCi4BRyRYdd09nMYsQHoh0
 Vrht/PkAyZ+9oKcT321/62R6zi1PEA9NnQebCUJSQ8E5djLo4wpiB/LCNF5H8adntDzXD393
 T2OhCw/nKkIy94G0b2h+lLKiC7qoYLGJiYXzAjKWmOu7itieZWoIYev7DDz8vJoPIufCF6bs
 xA5d9O2tb5US8vXzWrUHbtLTOrBC+u53CP02HhUToEkpg+RwnO/Xph28S5TOVgyC5NREdP2W
 3P7tQRU7Z5VGXKla65rfo68Y/gXIbjc+cfNDa6NMIcXCnRlXErepXw1OxbMt4z4uBJ0+ZzTL
 6t3ZipF4ZwyLa18hAS7SO4GuVPA7nBvnDiDLXwXIvnO7FZ/WJJ3Ye1bWLdtRrpjhE9hnOky2
 4g3Cidy408DONASmwGOmWPTRHhTRZTBObj4qtZMasmIKRd8FWcqBpf5mO1/K9I/xPgKzLmXp
 BlRv3O0LnKk3BUrzi3TNBhehE7HB84j/RrXwwRxVbpX55TTSdn2t/pOH3fGVbIm6PZi3ZZJo
 wotIq297zUmYmqvxgnxmrGt9t04KkX13lPm0ujMSGFXQqOMjjfhorfMFjYDPgFXZsZrnaPSe
 4Gd6z4=
IronPort-HdrOrdr: A9a23:q8GjOK5QtxsrF6uzNgPXwM7XdLJyesId70hD6qhwISY7TiX+rb
 HJoB17726StN9/YhAdcLy7VZVoBEmsl6KdgrNhWYtKPjOHhILAFugLhuHfKn/bakjDH4ZmpN
 5dmsNFZuEYY2IXsS+D2njaL+od
X-IronPort-AV: E=Sophos;i="5.96,169,1665460800"; 
   d="scan'208";a="85008573"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Henry Wang <Henry.Wang@arm.com>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 4/4] xen/arm: Correct the p2m pool size calculations
Date: Thu, 17 Nov 2022 01:08:04 +0000
Message-ID: <20221117010804.9384-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20221117010804.9384-1-andrew.cooper3@citrix.com>
References: <20221117010804.9384-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Allocating or freeing p2m pages doesn't alter the size of the mempool; only
the split between free and used pages.

Right now, the hypercalls operate on the free subset of the pool, meaning that
XEN_DOMCTL_get_paging_mempool_size varies with time as the guest shuffles its
physmap, and XEN_DOMCTL_set_paging_mempool_size ignores the used subset of the
pool and lets the guest grow unbounded.

This fixes test-pagign-mempool on ARM so that the behaviour matches x86.

This is part of XSA-409 / CVE-2022-33747.

Fixes: cbea5a1149ca ("xen/arm: Allocate and free P2M pages from the P2M pool")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
Release-acked-by: Henry Wang <Henry.Wang@arm.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Henry Wang <Henry.Wang@arm.com>
CC: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/arch/arm/p2m.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index b2f7e8d804aa..9bc5443d9e8a 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -72,7 +72,6 @@ static struct page_info *p2m_alloc_page(struct domain *d)
             spin_unlock(&d->arch.paging.lock);
             return NULL;
         }
-        d->arch.paging.p2m_total_pages--;
     }
     spin_unlock(&d->arch.paging.lock);
 
@@ -85,10 +84,7 @@ static void p2m_free_page(struct domain *d, struct page_info *pg)
     if ( is_hardware_domain(d) )
         free_domheap_page(pg);
     else
-    {
-        d->arch.paging.p2m_total_pages++;
         page_list_add_tail(pg, &d->arch.paging.p2m_freelist);
-    }
     spin_unlock(&d->arch.paging.lock);
 }
 
-- 
2.11.0


