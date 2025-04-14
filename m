Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E774A88BF6
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 21:09:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.951149.1347327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4PAs-0002BR-Qi; Mon, 14 Apr 2025 19:08:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 951149.1347327; Mon, 14 Apr 2025 19:08:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4PAs-00025i-N0; Mon, 14 Apr 2025 19:08:54 +0000
Received: by outflank-mailman (input) for mailman id 951149;
 Mon, 14 Apr 2025 18:34:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aOmN=XA=nppct.ru=sdl@srs-se1.protection.inumbo.net>)
 id 1u4Odw-0000NA-UA
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 18:34:54 +0000
Received: from mail.nppct.ru (mail.nppct.ru [195.133.245.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25321077-195f-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 20:34:49 +0200 (CEST)
Received: from mail.nppct.ru (localhost [127.0.0.1])
 by mail.nppct.ru (Postfix) with ESMTP id 8FFA31C0E8B
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 21:34:38 +0300 (MSK)
Received: from mail.nppct.ru ([127.0.0.1])
 by mail.nppct.ru (mail.nppct.ru [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id nm-4p_ZHJHya for <xen-devel@lists.xenproject.org>;
 Mon, 14 Apr 2025 21:34:34 +0300 (MSK)
Received: from localhost.localdomain (unknown [87.249.24.51])
 by mail.nppct.ru (Postfix) with ESMTPSA id 9EB5A1C08C3;
 Mon, 14 Apr 2025 21:34:15 +0300 (MSK)
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
X-Inumbo-ID: 25321077-195f-11f0-9ffb-bf95429c2676
Authentication-Results: mail.nppct.ru (amavisd-new); dkim=pass (1024-bit key)
	reason="pass (just generated, assumed good)" header.d=nppct.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nppct.ru; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:to:from:from; s=dkim; t=1744655674; x=
	1745519675; bh=s2YUvKONZpYv6BeESkipXTOMCM3/ZgRQk8zLNK4GcdM=; b=M
	OaTYnc/HQEO/PMwboMK+lWs/8VUDiRjPLpHBrTI0m5QUvdCVdVaHL6PpSvBrHl2e
	VbtW5TkXXKB1aM+938SKNRlF4bPYmG2QpIBRwC7X2pxzmJZCVZO43fk8Zs5XiBPP
	7Y3G33QkaVxLWCueFHo3aOPy2U9BsdtmG+rsQ/Gdc4=
X-Virus-Scanned: Debian amavisd-new at mail.nppct.ru
From: Alexey Nepomnyashih <sdl@nppct.ru>
To: Juergen Gross <jgross@suse.com>
Cc: Alexey Nepomnyashih <sdl@nppct.ru>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	xen-devel@lists.xenproject.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	lvc-project@linuxtesting.org,
	stable@vger.kernel.org
Subject: [PATCH] xen-netfront: handle NULL returned by xdp_convert_buff_to_frame()
Date: Mon, 14 Apr 2025 18:34:01 +0000
Message-ID: <20250414183403.265943-1-sdl@nppct.ru>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function xdp_convert_buff_to_frame() may return NULL if it fails
to correctly convert the XDP buffer into an XDP frame due to memory
constraints, internal errors, or invalid data. Failing to check for NULL
may lead to a NULL pointer dereference if the result is used later in
processing, potentially causing crashes, data corruption, or undefined
behavior.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Cc: stable@vger.kernel.org # v5.9+
Fixes: 6c5aa6fc4def ("xen networking: add basic XDP support for xen-netfront")
Signed-off-by: Alexey Nepomnyashih <sdl@nppct.ru>
---
 drivers/net/xen-netfront.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/xen-netfront.c b/drivers/net/xen-netfront.c
index 8425226c09f0..e99561de3cda 100644
--- a/drivers/net/xen-netfront.c
+++ b/drivers/net/xen-netfront.c
@@ -987,6 +987,10 @@ static u32 xennet_run_xdp(struct netfront_queue *queue, struct page *pdata,
 	case XDP_TX:
 		get_page(pdata);
 		xdpf = xdp_convert_buff_to_frame(xdp);
+		if (unlikely(!xdpf)) {
+			trace_xdp_exception(queue->info->netdev, prog, act);
+			break;
+		}
 		err = xennet_xdp_xmit(queue->info->netdev, 1, &xdpf, 0);
 		if (unlikely(!err))
 			xdp_return_frame_rx_napi(xdpf);
-- 
2.43.0


