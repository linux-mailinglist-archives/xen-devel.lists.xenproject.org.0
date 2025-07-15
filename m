Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAF1B05DB5
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 15:46:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044360.1414455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubfz3-0007i9-Gs; Tue, 15 Jul 2025 13:46:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044360.1414455; Tue, 15 Jul 2025 13:46:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubfz3-0007fh-CB; Tue, 15 Jul 2025 13:46:13 +0000
Received: by outflank-mailman (input) for mailman id 1044360;
 Tue, 15 Jul 2025 13:46:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QMY+=Z4=uniontech.com=wangyuli@srs-se1.protection.inumbo.net>)
 id 1ubfz2-0005C8-3i
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 13:46:12 +0000
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f50ccb9-6182-11f0-a319-13f23c93f187;
 Tue, 15 Jul 2025 15:46:10 +0200 (CEST)
Received: from avenger-e500 ( [localhost]) by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 15 Jul 2025 21:45:09 +0800 (CST)
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
X-Inumbo-ID: 0f50ccb9-6182-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1752587127;
	bh=DQOAtGRHzOhokt1byV1hDfgfMVfreeOvNYgUQQUEI+w=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=dt/d39U/JvCGRYvJywjrnl6l+GFiWSoghBEC8LTHxqR9Qje6oIFcAkRizOqLdSzXs
	 GMHBh5+6oynlPBWuLPdwN8DzoqGlX+xfe8PDbLUefu65zP9IgoIjFczk1dMH/QJHiX
	 Fa3X5qoKmbn21HWedq5TPEsnWWmhrHTAmkKDcYFU=
X-QQ-mid: zesmtpip2t1752587114t4242d337
X-QQ-Originating-IP: bUZPMnhKZ8NU12puD/0nV8FvyCDfWloR8Qvt76r6nV8=
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 17289734867236313614
EX-QQ-RecipientCnt: 63
From: WangYuli <wangyuli@uniontech.com>
To: wangyuli@uniontech.com
Cc: airlied@gmail.com,
	akpm@linux-foundation.org,
	alison.schofield@intel.com,
	andrew+netdev@lunn.ch,
	andriy.shevchenko@linux.intel.com,
	arend.vanspriel@broadcom.com,
	bp@alien8.de,
	brcm80211-dev-list.pdl@broadcom.com,
	brcm80211@lists.linux.dev,
	colin.i.king@gmail.com,
	cvam0000@gmail.com,
	dan.j.williams@intel.com,
	dave.hansen@linux.intel.com,
	dave.jiang@intel.com,
	dave@stgolabs.net,
	davem@davemloft.net,
	dri-devel@lists.freedesktop.org,
	edumazet@google.com,
	gregkh@linuxfoundation.org,
	guanwentao@uniontech.com,
	hpa@zytor.com,
	ilpo.jarvinen@linux.intel.com,
	intel-xe@lists.freedesktop.org,
	ira.weiny@intel.com,
	j@jannau.net,
	jeff.johnson@oss.qualcomm.com,
	jgross@suse.com,
	jirislaby@kernel.org,
	johannes.berg@intel.com,
	jonathan.cameron@huawei.com,
	kuba@kernel.org,
	kvalo@kernel.org,
	kvm@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux@treblig.org,
	lucas.demarchi@intel.com,
	marcin.s.wojtas@gmail.com,
	ming.li@zohomail.com,
	mingo@kernel.org,
	mingo@redhat.com,
	netdev@vger.kernel.org,
	niecheng1@uniontech.com,
	oleksandr_tyshchenko@epam.com,
	pabeni@redhat.com,
	pbonzini@redhat.com,
	quic_ramess@quicinc.com,
	ragazenta@gmail.com,
	rodrigo.vivi@intel.com,
	seanjc@google.com,
	shenlichuan@vivo.com,
	simona@ffwll.ch,
	sstabellini@kernel.org,
	tglx@linutronix.de,
	thomas.hellstrom@linux.intel.com,
	vishal.l.verma@intel.com,
	x86@kernel.org,
	xen-devel@lists.xenproject.org,
	yujiaoliang@vivo.com,
	zhanjun@uniontech.com
Subject: [PATCH v2 6/8] serial: 8250_dw: Fix typo "notifer"
Date: Tue, 15 Jul 2025 21:44:05 +0800
Message-ID: <2BF1749F02ADE664+20250715134407.540483-6-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <BD5C52D2838AEA48+20250715134050.539234-1-wangyuli@uniontech.com>
References: <BD5C52D2838AEA48+20250715134050.539234-1-wangyuli@uniontech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NYuZLBhQBuqvZPqTaA6eCRNOw1rsjH/1V0incXI0TTkXhIqjT7OcyVpB
	U4BwUK7IzVbCUS+z9mPFOXnqeyiiIwmM3D5JHQyd+IBkFoGpDBTfRxU982pmEMODO1iaxKY
	D48NOO0SiNjVs8fA9CcJ+qADBbnc+Qq6wEfJEREPTT54OKcldJY9fVxNhnH6sFSyZdZr1r+
	QhZ+SFC4XDjSNOFewsNqmG1gdtoI5qlIjUH3jOpiv7hjFQnZ/rHku2YFBeJUI9wgQu/EZ2g
	1SHvFKk7b4+awytyd6trjgbB00PeVMLjlfrTxj9kxoHbCtD928FdzMZo2Gtnt+xtZyi9vdd
	xmxCmPa1+SWXVGMJElU6ck0QgB6Gu96yBRNEfs4KoC12IgmPa8C6kyrhBLpeLsL0BQfh8DW
	rmvUy+khQwMdaV2duDMxGBqB6u+dGdAcZp2JbS/blmkcJXaAx1f/mmFinZVe6tyqB7GVobX
	8/pako5aZr+woWT+p9txzW2E5uSmir4xXa1u1zVyTCGk2TtJdeZe5u3JPxrq0Bw5QGG/DUM
	FZWj5jTkINwLqHc0UrudOSiQ3uABt53gye9gBlFEanwVKt8dCe/RuDHOVnzHob0VTXzeXG1
	LonRGyEjbzoOkl/Iq8WlEqSv7mm91gapRqeIv9tTSYdljJSr6+I7S0mo5+o1QSDHQiVzktm
	PA1h8R0OREJoJfygD1WNfmzH1b/KltS8ePC9yAeJXq3WoLJEbO+1dAX0MX1n1JEleDlZpXL
	YMDRU81uTsLV6Zd9gywX8FGcu9RhBTw6RLR1kK4DXtAOEeECV0iZE2UNGXpWUKoNsKVspzi
	3bIBCVfcK6GnIX2R45rvjdHh82MP4jIVrPHIOovNuC0R5+uNV1ZAWzCpVGc8iQHEcY/wXAe
	ymu5iDY28lWKG+hHKuvDrTAzpGr/6cIe7xlq+IQge73r9PjfXPp/qx6bSuF3QnyvKq5C97h
	1Pa9z/dsdW6qzlVBgSAT6g8T6asn4XPy97OzJbneZfv6yu+3LicvLYJi50aGC0JDgQb3/eB
	LGINhlHiuRFPDJYACemTkiooy1LjK0y5rkmmrwRe7Gr9CIoLmnfnDjDPtqoRKTAFPa+FnsD
	6JUUZK/LCruGk7cYsWkCUM=
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0

There is a spelling mistake of 'notifer' in the comment which
should be 'notifier'.

Link: https://lore.kernel.org/all/B3C019B63C93846F+20250715071245.398846-1-wangyuli@uniontech.com/
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 drivers/tty/serial/8250/8250_dw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 1902f29444a1..6d9af6417620 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -392,7 +392,7 @@ static void dw8250_set_termios(struct uart_port *p, struct ktermios *termios,
 	rate = clk_round_rate(d->clk, newrate);
 	if (rate > 0) {
 		/*
-		 * Note that any clock-notifer worker will block in
+		 * Note that any clock-notifier worker will block in
 		 * serial8250_update_uartclk() until we are done.
 		 */
 		ret = clk_set_rate(d->clk, newrate);
-- 
2.50.0


