Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A78B0D343
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 09:36:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052016.1420510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue7Xz-0005cX-Ek; Tue, 22 Jul 2025 07:36:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052016.1420510; Tue, 22 Jul 2025 07:36:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue7Xz-0005aB-C4; Tue, 22 Jul 2025 07:36:23 +0000
Received: by outflank-mailman (input) for mailman id 1052016;
 Tue, 22 Jul 2025 07:36:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YR2v=2D=uniontech.com=wangyuli@srs-se1.protection.inumbo.net>)
 id 1ue7Xw-0005a5-Tn
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 07:36:21 +0000
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a077cb7-66ce-11f0-b894-0df219b8e170;
 Tue, 22 Jul 2025 09:36:14 +0200 (CEST)
Received: from avenger-e500 ( [localhost]) by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 22 Jul 2025 15:35:00 +0800 (CST)
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
X-Inumbo-ID: 8a077cb7-66ce-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1753169768;
	bh=JwyCRpM1FWaTLNFe5LSvBKJz+ZtIxups+3c5ci7f0O0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=MJFkxAG3TnOaoyZ4tzb12gT1fPu5yyG16H1Jl1iJ/oYnB9Kts6izQRSiY9a7OPcm7
	 WZleUri6Ry182mEzkPtL2iDmtU3MLCXxT/Vu/l1qM1DNsBuz5jKinRM3iFv1jNlTlK
	 Fc9kOnytqsgB5JVJNE2AOdrQsN15jb66+sxQDTV4=
X-QQ-mid: zesmtpip2t1753169705t5d8d5b17
X-QQ-Originating-IP: sO//PwrBzanzWIpX43hUjMW25ZeVM74q8qXSuUHVttA=
X-QQ-SSF: 0002000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 13053412534972424115
EX-QQ-RecipientCnt: 65
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
	wangyuli@deepin.org,
	x86@kernel.org,
	xen-devel@lists.xenproject.org,
	yujiaoliang@vivo.com,
	zhanjun@uniontech.com,
	Simon Horman <horms@kernel.org>
Subject: [PATCH v3 4/8] net: mvneta: Fix typo "notifer"
Date: Tue, 22 Jul 2025 15:34:27 +0800
Message-ID: <0CB4300CB6F49007+20250722073431.21983-4-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <576F0D85F6853074+20250722072734.19367-1-wangyuli@uniontech.com>
References: <576F0D85F6853074+20250722072734.19367-1-wangyuli@uniontech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MdoRYM9mYrydwdduVCl4xBUy3jA3n6Z9Bq7VUXD+yo1m6FZzDgOQUGgH
	CoA6lMwlMWw6vbXCWn8hUpW4lR7C1PL52AMY1IThY19ke4Z+MKYSVo+kZSUCRhQSwHQi+wz
	zkO4EhQ0byQ9rjBUGOHmHKur2HadKlptdg/aaOeodL1sqdIEviwoxSKmd2sbsDSgBq8YnJ4
	SVrlV6PHgWDLSF+BkB0LDuO/NOzUbOg1jPv6cCl9ezsxdCiM2ExD9UTKsRtbCunoYQ0QRCq
	pvxdZ7T44t786Lm6zMHxGvih17rp3do5ZWqhDfodUYnAL8k3g2e/4ykfOAL2sTU47aIvHID
	PgsF9iUkIBMa9vpUc+gCRtgxa7Gzsk/h5HWbZXs7W8b8j72iEeRSmafoUmMCmfgR2tdEocE
	DWL9o+lAA12pBHLWezwxsPjV/QbZASe4B+f4GPYhnQXIDlKQUOyjZdAHC8i+Xwqc19/94qH
	q5mrQXYDUGUzshz8+5TIGvxdLUW6thzjere/i49earpthGCcQM4ePZCIn6HfXsvAxIZNvef
	MV4PR1x8rXFjBHr5I+h1++B8msILYBYJxApxoXUxZol82JusqnU5ocskCDKEVKsxIlKcDS0
	x/Y+to5oCsLJPz6C1mZEGItCcci7vp6Vic7vKzCSafN1yubVLh27Avjab4rRHqj96p2fFXf
	jqICzQHgVYGThNkFMdsZD2M7tPhU2y3itbrsj1aZWahdxxhAu9Q7/V4gq+tcTaE+jZlIxwA
	ojtocDc7S7NLkvjl5zg+jnXxFJyNOcPTMopFCcTsLmcVOTfy5MDGzb4nIi3izprUpnx7YgQ
	Wh8We3argmAG22+fuEVJEF9TUJiTYJwXfvSLMJ5Vh5+O9wqkg6dq+MG3HqM3r1JVvZjNyq2
	Yo9oLbQ+IhHoNjMI/MtB07lYrYdtBlPqnCStBtKe6y7ygKLFoMZTR07R0WItV4lRBdiiTmG
	H6trlWPRaXmr9I5bLmtAK/GxJ8szYDwVY6eek7hBWVRctiCRNWm/i4kJy1HAsPeD2P4GqI8
	fmb8kDAyNLLZlgJA3n8m+r9gupXhKvz5EtpkGR92uLyUN1xgzV9QEZ0nfR++IIcFUSwDSEm
	xYJxYdRnJI/jmr7W4nTl31Eum5vdu8ofQ==
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0

There is a spelling mistake of 'notifer' in the comment which
should be 'notifier'.

Reviewed-by: Simon Horman <horms@kernel.org>
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


