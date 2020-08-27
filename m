Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D01254E20
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 21:22:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBNTJ-0007q9-7g; Thu, 27 Aug 2020 19:22:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QM1O=CF=cs.pub.ro=costin.lupu@srs-us1.protection.inumbo.net>)
 id 1kBNTH-0007q2-LT
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 19:22:03 +0000
X-Inumbo-ID: 4bb75524-a619-4cd3-ad4e-c35f28024fa2
Received: from mx.upb.ro (unknown [141.85.13.250])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4bb75524-a619-4cd3-ad4e-c35f28024fa2;
 Thu, 27 Aug 2020 19:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id 4D3C3B561EB6;
 Thu, 27 Aug 2020 22:22:00 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id v1h6na_2yrWp; Thu, 27 Aug 2020 22:21:58 +0300 (EEST)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id 70D6EB561EEC;
 Thu, 27 Aug 2020 22:21:58 +0300 (EEST)
X-Virus-Scanned: amavisd-new at upb.ro
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id dwV7eRlWnW-h; Thu, 27 Aug 2020 22:21:58 +0300 (EEST)
Received: from localhost.localdomain (5-12-253-103.residential.rdsnet.ro
 [5.12.253.103]) by mx.upb.ro (Postfix) with ESMTPSA id 1578CB561EB6;
 Thu, 27 Aug 2020 22:21:57 +0300 (EEST)
From: Costin Lupu <costin.lupu@cs.pub.ro>
To: xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	jbeulich@suse.com
Subject: [PATCH] stubdom/grub: Update init_netfront() call for mini-os
Date: Thu, 27 Aug 2020 22:21:57 +0300
Message-Id: <20200827192157.30648-1-costin.lupu@cs.pub.ro>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This patch updates the call of init_netfront() function according to its
recently updated declaration which can also include parameters for gatewa=
y
and netmask addresses. While we are here, the patch also removes passing
the ip parameter because (a) it is not used anywhere and (b) it wastes
memory since it would reference a dynamically allocated string.

Signed-off-by: Costin Lupu <costin.lupu@cs.pub.ro>
---
 stubdom/grub/mini-os.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/stubdom/grub/mini-os.c b/stubdom/grub/mini-os.c
index 4fc052a255..b33dbf02fb 100644
--- a/stubdom/grub/mini-os.c
+++ b/stubdom/grub/mini-os.c
@@ -291,8 +291,6 @@ struct netfront_dev *net_dev;
 int
 minios_probe (struct nic *nic)
 {
-    char *ip;
-
     if (net_dev)
         return 1;
=20
@@ -300,7 +298,7 @@ minios_probe (struct nic *nic)
     grub_memset ((char *) arptable, 0,
                  MAX_ARP * sizeof (struct arptable_t));
=20
-    net_dev =3D init_netfront(NULL, (void*) -1, nic->node_addr, &ip);
+    net_dev =3D init_netfront(NULL, (void*) -1, nic->node_addr, NULL, NU=
LL, NULL);
     if (!net_dev)
         return 0;
=20
--=20
2.20.1


