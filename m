Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A45834CE5B4
	for <lists+xen-devel@lfdr.de>; Sat,  5 Mar 2022 17:03:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.285146.484438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQWrN-0007CH-Pi; Sat, 05 Mar 2022 16:02:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 285146.484438; Sat, 05 Mar 2022 16:02:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQWrN-00079l-M2; Sat, 05 Mar 2022 16:02:21 +0000
Received: by outflank-mailman (input) for mailman id 285146;
 Sat, 05 Mar 2022 13:39:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GEmz=TQ=uniontech.com=zhanglianjie@srs-se1.protection.inumbo.net>)
 id 1nQUcn-0003WL-EU
 for xen-devel@lists.xenproject.org; Sat, 05 Mar 2022 13:39:09 +0000
Received: from smtpbg152.qq.com (smtpbg152.qq.com [13.245.186.79])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d120542-9c89-11ec-8eba-a37418f5ba1a;
 Sat, 05 Mar 2022 14:39:02 +0100 (CET)
Received: from localhost.localdomain ( [114.222.120.105])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Sat, 05 Mar 2022 21:38:34 +0800 (CST)
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
X-Inumbo-ID: 9d120542-9c89-11ec-8eba-a37418f5ba1a
X-QQ-mid: bizesmtp80t1646487530t0ad08pm
X-QQ-SSF: 01400000002000B0I000B00A0000000
X-QQ-FEAT: F3yR32iATbigXkT0FCE9DsObg5oq/MN3OGcaVKW3SzyBGnuKqNLFJhhrnBSss
	OEeEKWXCYXFgWxlBFjnddgdP3hYrW7Boq5CIhmIdRlax3caNoJd34bgMazPzJnmFaSCfE3U
	irLUm43siAqYb5/xhKRPLiPLZEVIApzI5pl3OhTu1wDyiDdpEL2zhysTrZtfdaROI3Zk+rk
	1rHdciWu44nEdT/JA0tNNTgnCq3sX2lqdwmHvBWyCE27uiY+8eY2pssFLWh7wr/WMrF2ANT
	oVua3dfwqv32zcYaPeEnJ2bhGSnjYDtnkSG9ZN2M1T7NoWMcLMGznKLejy6drQVQBqqpDNF
	ShmC+9yljlPiUI2pvM=
X-QQ-GoodBg: 2
From: zhanglianjie <zhanglianjie@uniontech.com>
To: Juergen Gross <jgross@suse.com>,
	David Vrabel <david.vrabel@citrix.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	zhanglianjie <zhanglianjie@uniontech.com>
Subject: [PATCH] drivers/xen: use helper macro __ATTR_RW
Date: Sat,  5 Mar 2022 21:38:23 +0800
Message-Id: <20220305133823.158961-1-zhanglianjie@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign6
X-QQ-Bgrelay: 1

Use helper macro __ATTR_RW to define HYPERVISOR_ATTR_RW to make code more clear.
Minor readability improvement.

Signed-off-by: zhanglianjie <zhanglianjie@uniontech.com>

diff --git a/drivers/xen/sys-hypervisor.c b/drivers/xen/sys-hypervisor.c
index feb1d16252e7..fcb0792f090e 100644
--- a/drivers/xen/sys-hypervisor.c
+++ b/drivers/xen/sys-hypervisor.c
@@ -22,11 +22,10 @@
 #endif

 #define HYPERVISOR_ATTR_RO(_name) \
-static struct hyp_sysfs_attr  _name##_attr = __ATTR_RO(_name)
+static struct hyp_sysfs_attr _name##_attr = __ATTR_RO(_name)

 #define HYPERVISOR_ATTR_RW(_name) \
-static struct hyp_sysfs_attr _name##_attr = \
-	__ATTR(_name, 0644, _name##_show, _name##_store)
+static struct hyp_sysfs_attr _name##_attr = __ATTR_RW(_name)

 struct hyp_sysfs_attr {
 	struct attribute attr;
--
2.20.1





