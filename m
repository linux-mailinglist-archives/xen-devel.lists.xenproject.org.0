Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8BA321B5A
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 16:26:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88169.165670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lED6h-0008H3-Jc; Mon, 22 Feb 2021 15:26:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88169.165670; Mon, 22 Feb 2021 15:26:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lED6h-0008Ge-GM; Mon, 22 Feb 2021 15:26:43 +0000
Received: by outflank-mailman (input) for mailman id 88169;
 Mon, 22 Feb 2021 15:26:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3rhT=HY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lED6g-0008GZ-HH
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 15:26:42 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 44ce8b9d-2542-4ec9-859e-d85d342fa419;
 Mon, 22 Feb 2021 15:26:41 +0000 (UTC)
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
X-Inumbo-ID: 44ce8b9d-2542-4ec9-859e-d85d342fa419
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614007601;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=GSpUnuMR6P81lwxsJXWAxZKkt6WUyH49l16sFhBlTeo=;
  b=erDQncfLorNnz7QXpbE4VgQUp91Kpl0UI3YXLjhvOxtyHa2b3zoK25WU
   p9RDDEVgzlg/GWMDFCJoGmkQPc8Q29vVZ8bhPWS0sTiowJUC4v1jwix5s
   FEtOtGpEqnLowhe2v1dTCEDzVmNKlZvqh8uJW5buP9egtR60PMlKjf9I7
   M=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: CKU1se9KpxAoYcMj5mnSPkpOjhlJJuGCjc+h39MY4NTC10nf7atAezkIvbhlTCa1fbMrLSSX6Y
 VanWFfQZkKnNAl3gc0LRd85ta0KCYoWctKGM6pn4YfFUeJ+MJleVUDLZSfn8ZRu5FidSTKx1Id
 8/DM22JuVcqo8MEezdbbsuYzmvz2DJx061tqTpohxKbBM3ISAPcV40e/xpy9dX8uhl/RJ3F7xP
 Aom5xK9ZECUzxnu1ReYkQ9qdYDxVaZYlPwpew5TWE8/ZKKv3Q7faBq9JLxxPaBJh3as+PLcWI8
 xU4=
X-SBRS: 4.0
X-MesageID: 38116280
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,197,1610427600"; 
   d="scan'208";a="38116280"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Ian Jackson <iwj@xenproject.org>
Subject: Domain reference counting breakage
Date: Mon, 22 Feb 2021 15:26:17 +0000
Message-ID: <20210222152617.16382-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

At the moment, attempting to create an HVM guest with max_gnttab_frames of 0
causes Xen to explode on the:

  BUG_ON(atomic_read(&d->refcnt) != DOMAIN_DESTROYED);

in _domain_destroy().  Intrumenting Xen a little more to highlight where the
modifcations to d->refcnt occur:

  (d6) --- Xen Test Framework ---
  (d6) Environment: PV 64bit (Long mode 4 levels)
  (d6) Testing domain create:
  (d6) Testing x86 PVH Shadow
  (d6) (XEN) d0v0 Hit #DB in Xen context: e008:ffff82d0402046b5 [domain_create+0x1c3/0x7f1], stk e010:ffff83003fea7d58, dr6 ffff0ff1
  (d6) (XEN) d0v0 Hit #DB in Xen context: e008:ffff82d040321b11 [share_xen_page_with_guest+0x175/0x190], stk e010:ffff83003fea7ce8, dr6 ffff0ff1
  (d6) (XEN) d0v0 Hit #DB in Xen context: e008:ffff82d04022595b [assign_pages+0x223/0x2b7], stk e010:ffff83003fea7c68, dr6 ffff0ff1
  (d6) (XEN) grant_table.c:1934: Bad grant table sizes: grant 0, maptrack 0
  (d6) (XEN) *** d1 ref 3
  (d6) (XEN) d0v0 Hit #DB in Xen context: e008:ffff82d0402048bc [domain_create+0x3ca/0x7f1], stk e010:ffff83003fea7d58, dr6 ffff0ff1
  (d6) (XEN) d0v0 Hit #DB in Xen context: e008:ffff82d040225e11 [free_domheap_pages+0x422/0x44a], stk e010:ffff83003fea7c38, dr6 ffff0ff1
  (d6) (XEN) Xen BUG at domain.c:450
  (d6) (XEN) ----[ Xen-4.15-unstable  x86_64  debug=y  Not tainted ]----
  (d6) (XEN) CPU:    0
  (d6) (XEN) RIP:    e008:[<ffff82d040204366>] common/domain.c#_domain_destroy+0x69/0x6b

the problem becomes apparent.

First of all, there is a reference count leak - share_xen_page_with_guest()'s
reference isn't freed anywhere.

However, the main problem is the 4th #DB above is this atomic_set()

  d->is_dying = DOMDYING_dead;
  if ( hardware_domain == d )
      hardware_domain = old_hwdom;
  printk("*** %pd ref %d\n", d, atomic_read(&d->refcnt));
  atomic_set(&d->refcnt, DOMAIN_DESTROYED);

in the domain_create() error path, which happens before free_domheap_pages()
drops the ref acquired assign_pages(), and destroys still-relevant information
pertaining to the guest.

The best options is probably to use atomic_sub() to subtract (DOMAIN_DESTROYED
+ 1) from the current refcount, which preserves the extra refs taken by
share_xen_page_with_guest() and assign_pages() until they can be freed
appropriately.

~Andrew

