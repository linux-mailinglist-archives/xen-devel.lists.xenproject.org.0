Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 051A8B05DB3
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 15:46:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044357.1414446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubfz0-0007PB-8V; Tue, 15 Jul 2025 13:46:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044357.1414446; Tue, 15 Jul 2025 13:46:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubfz0-0007M2-5O; Tue, 15 Jul 2025 13:46:10 +0000
Received: by outflank-mailman (input) for mailman id 1044357;
 Tue, 15 Jul 2025 13:46:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QMY+=Z4=uniontech.com=wangyuli@srs-se1.protection.inumbo.net>)
 id 1ubfyy-0004rl-H0
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 13:46:08 +0000
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c7b0ef5-6182-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 15:46:06 +0200 (CEST)
Received: from avenger-e500 ( [localhost]) by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 15 Jul 2025 21:44:54 +0800 (CST)
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
X-Inumbo-ID: 0c7b0ef5-6182-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1752587112;
	bh=rQmC2fT7t1QerTXaC4lb+PTlBodpE334vwPD+1BbEVQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Wjts9OSmF7J9zue7nrnsfbwPy4jBQa19CYFuWNOu+GAYLzB8oiQzzn/IQM1Th1ifL
	 MaTehwZqOKTa42CN3YCHmDt4/y2iccWutlqeNvrp/ieG/4Yb/A/55TQWqpiDmgzUfH
	 DD8EnZn98Es6TBnbwoF46gEDIljEHMmZArX4c3lo=
X-QQ-mid: zesmtpip2t1752587098tca5493a2
X-QQ-Originating-IP: bz3FlVgOsDFMU4yP789akKxa0PSTuDy5vUHH1rKzucE=
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 17118280138594798834
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
Subject: [PATCH v2 4/8] net: mvneta: Fix typo "notifer"
Date: Tue, 15 Jul 2025 21:44:03 +0800
Message-ID: <41013AF60AF9B5BE+20250715134407.540483-4-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <BD5C52D2838AEA48+20250715134050.539234-1-wangyuli@uniontech.com>
References: <BD5C52D2838AEA48+20250715134050.539234-1-wangyuli@uniontech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NiWT7DR6HJ54mJ1VBC3jMGW+gWgt0C8dhP0AyYWvvST8eKznfdV/Lfdz
	v++9J5erimV3Hg95ho78glEpgHggpXVBaNI0r9P4j9JU7hC7Ocl5CpfLcx+HM+v6MjhUE/a
	pCypqKZTlsVe69aV9QBZsoQTWn033nnA0aJkBLfGdJRduPUhbWRmCx5L4zI6FhOkyyMftW3
	i+7B8Kjh48Z45Dtu0N8zhlza+JIJXEnFLeO/9ZYUMP36tosgvclEphE1XF/z4Wb7nNr/atd
	BNKIUcqTNGJDslU82izL4ZxtTGKhC0YTd+Hxt+jDzwdGLUuL/PGAbFfcd1I5oAIrFfZieOe
	iMdM2GQzipDQjVUp6cw5TkNxfkUWmtHRUHgVQRmLqL9Wv+49gV7/SV+cRoQuBWijBGzTuWe
	hHjxibI+E4+UxF2GfOlHwvT/lw3rxBUGosciPouqWqbkPn5fKIhmlJqnTGNLFTT5cLda4aL
	c//115ZRWUGJRsfSYQUNycoWbRisrCgn9cOkQ72n44w2OKZPmZREthbQDK+hCqIpkKqTuKv
	RLFMFNakVGuNwhwz9vasRAaWMkE3OEvX3nkvme90kRXb8ImmhViggGNUX8efuY0cXtWLmGI
	XYiQxVESPVMGHifm3tTSR9U4mm5pTzJmz36TJJSDBRR49EKOIfegNZXa9gHCmsV5p++J5x8
	LeMSj0nFUMWz3zawXSUVKiFGLP2IHmFG/S3Qu1Xd2uTR6qY+CPEXbYmhpzH4sz6pEiWmFPi
	RtisKqWCPyO0+atJBWIzv3Cm6M9RhEkeIQzq5ni9WxHHlkbLUyVHB+W+0gemCXb14ixD38x
	tH9VOnyI7ye2E5kj3ZQ7WELMzddWJPbzaT0P/jx+ZYySX3ZtckGYBBKdYYt8nk8hRT8wfHA
	UxoVHrVqdW/7BHRU3ctMg2aYqKbP8FmckbpjxJiPaBeaxWoWGo6yTyXc1UxA08mjs5I6XbT
	FQ2aSOxbtfHkE411/Yx3/wk6jnYNkzLIF6O/Fiz/IS6vtuDyTH5WSPB22T2VlouCEdL7oJl
	Bp10bWiZutwpS8pyWrA9UJS4oAZyP6j1/ZLXg/mHccUS91SS/T+ctc1exco77pARzBcvU6e
	WMBrEVE86LIKo2RgTXLpVZft/Fa6qXVzoDIVz4mX1L3BxlOltvlScw=
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0

There is a spelling mistake of 'notifer' in the comment which
should be 'notifier'.

Link: https://lore.kernel.org/all/B3C019B63C93846F+20250715071245.398846-1-wangyuli@uniontech.com/
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 drivers/net/ethernet/marvell/mvneta.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/mvneta.c b/drivers/net/ethernet/marvell/mvneta.c
index 147571fdada3..ee4696600146 100644
--- a/drivers/net/ethernet/marvell/mvneta.c
+++ b/drivers/net/ethernet/marvell/mvneta.c
@@ -4610,7 +4610,7 @@ static int mvneta_stop(struct net_device *dev)
 		/* Inform that we are stopping so we don't want to setup the
 		 * driver for new CPUs in the notifiers. The code of the
 		 * notifier for CPU online is protected by the same spinlock,
-		 * so when we get the lock, the notifer work is done.
+		 * so when we get the lock, the notifier work is done.
 		 */
 		spin_lock(&pp->lock);
 		pp->is_stopped = true;
-- 
2.50.0


