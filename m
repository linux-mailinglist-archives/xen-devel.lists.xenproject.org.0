Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3C5A91BD2
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 14:22:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957480.1350593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5OFa-0000CT-1T; Thu, 17 Apr 2025 12:21:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957480.1350593; Thu, 17 Apr 2025 12:21:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5OFZ-00009X-Uv; Thu, 17 Apr 2025 12:21:49 +0000
Received: by outflank-mailman (input) for mailman id 957480;
 Thu, 17 Apr 2025 12:21:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s05F=XD=nppct.ru=sdl@srs-se1.protection.inumbo.net>)
 id 1u5OFX-00009P-Cb
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 12:21:48 +0000
Received: from mail.nppct.ru (mail.nppct.ru [195.133.245.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 857209ca-1b86-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 14:21:43 +0200 (CEST)
Received: from mail.nppct.ru (localhost [127.0.0.1])
 by mail.nppct.ru (Postfix) with ESMTP id B7D441C0E89
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 15:21:39 +0300 (MSK)
Received: from mail.nppct.ru ([127.0.0.1])
 by mail.nppct.ru (mail.nppct.ru [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id atMB0KBaamAr for <xen-devel@lists.xenproject.org>;
 Thu, 17 Apr 2025 15:21:39 +0300 (MSK)
Received: from localhost.localdomain (unknown [87.249.24.51])
 by mail.nppct.ru (Postfix) with ESMTPSA id B90721C08D8;
 Thu, 17 Apr 2025 15:21:30 +0300 (MSK)
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
X-Inumbo-ID: 857209ca-1b86-11f0-9ffb-bf95429c2676
Authentication-Results: mail.nppct.ru (amavisd-new); dkim=pass (1024-bit key)
	reason="pass (just generated, assumed good)" header.d=nppct.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nppct.ru; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:to:from:from; s=dkim; t=1744892499; x=
	1745756500; bh=yim53aUfLmVou/JvqKYODc4xwB/wJ3VFd3Zy7HjYysY=; b=J
	nGWkbr1xEf1KsxCBwjcBkNnV6b0TZ0wYOB79+mVs6613x4wVR5biKfe2737V48jn
	9kD0F8vDRWriqLbbaZv/eecuR5ktq3lCTsVdCHVio6HPs40lv01JASYlM5moySGp
	pgbzZ+/GM5pG0iMY5EorbRIoeqTP5MR1ZFVilWFuH0=
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
Subject: [PATCH v2] xen-netfront: handle NULL returned by xdp_convert_buff_to_frame()
Date: Thu, 17 Apr 2025 12:21:17 +0000
Message-ID: <20250417122118.1009824-1-sdl@nppct.ru>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function xdp_convert_buff_to_frame() may return NULL if it fails
to correctly convert the XDP buffer into an XDP frame due to memory
constraints, internal errors, or invalid data. Failing to check for NULL
may lead to a NULL pointer dereference if the result is used later in
processing, potentially causing crashes, data corruption, or undefined
behavior.

On XDP redirect failure, the associated page must be released explicitly
if it was previously retained via get_page(). Failing to do so may result
in a memory leak, as the pages reference count is not decremented.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Cc: stable@vger.kernel.org # v5.9+
Fixes: 6c5aa6fc4def ("xen networking: add basic XDP support for xen-netfront")
Signed-off-by: Alexey Nepomnyashih <sdl@nppct.ru>
---
 drivers/net/xen-netfront.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/net/xen-netfront.c b/drivers/net/xen-netfront.c
index 63fe51d0e64d..1d3ff57a6125 100644
--- a/drivers/net/xen-netfront.c
+++ b/drivers/net/xen-netfront.c
@@ -985,20 +985,27 @@ static u32 xennet_run_xdp(struct netfront_queue *queue, struct page *pdata,
 	act = bpf_prog_run_xdp(prog, xdp);
 	switch (act) {
 	case XDP_TX:
-		get_page(pdata);
 		xdpf = xdp_convert_buff_to_frame(xdp);
-		err = xennet_xdp_xmit(queue->info->netdev, 1, &xdpf, 0);
-		if (unlikely(!err))
-			xdp_return_frame_rx_napi(xdpf);
-		else if (unlikely(err < 0))
+		if (unlikely(!xdpf)) {
 			trace_xdp_exception(queue->info->netdev, prog, act);
+			break;
+		}
+		get_page(pdata);
+		err = xennet_xdp_xmit(queue->info->netdev, 1, &xdpf, 0);
+		if (unlikely(err <= 0)) {
+			if (err < 0)
+				trace_xdp_exception(queue->info->netdev, prog, act);
+			xdp_return_frame_rx_napi(xdpf);
+		}
 		break;
 	case XDP_REDIRECT:
 		get_page(pdata);
 		err = xdp_do_redirect(queue->info->netdev, xdp, prog);
 		*need_xdp_flush = true;
-		if (unlikely(err))
+		if (unlikely(err)) {
 			trace_xdp_exception(queue->info->netdev, prog, act);
+			xdp_return_buff(xdp);
+		}
 		break;
 	case XDP_PASS:
 	case XDP_DROP:
-- 
2.43.0


