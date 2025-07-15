Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F38DBB05EAA
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 15:55:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044417.1414510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubg8C-0005NJ-Be; Tue, 15 Jul 2025 13:55:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044417.1414510; Tue, 15 Jul 2025 13:55:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubg8C-0005Ls-8D; Tue, 15 Jul 2025 13:55:40 +0000
Received: by outflank-mailman (input) for mailman id 1044417;
 Tue, 15 Jul 2025 13:55:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QMY+=Z4=uniontech.com=wangyuli@srs-se1.protection.inumbo.net>)
 id 1ubfzL-0005C8-AQ
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 13:46:31 +0000
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a72d63b-6182-11f0-a319-13f23c93f187;
 Tue, 15 Jul 2025 15:46:30 +0200 (CEST)
Received: from avenger-e500 ( [localhost]) by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 15 Jul 2025 21:45:25 +0800 (CST)
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
X-Inumbo-ID: 1a72d63b-6182-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1752587152;
	bh=NWDrOIeUTkfMgeyG9DirCptVDnqPmotqOLDK+VZpCcc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=L7T2ccFhTmKG3T6mh99/NWel04UXnbnWQG6H0UsAuRVoyzg0rSWMDQ6CfsGkWl33k
	 +qzhfTCd+IfyTEwSQEhSnfW2Nu6TBzcLfzdaXYa89VWv40tRLzf/axMm3ldWw220cL
	 97y04t2d1nAvgy4g4V5utln46rvikis/m/9sdMs0=
X-QQ-mid: zesmtpip2t1752587129tb54538eb
X-QQ-Originating-IP: PsIrTfnu37O5BQpc09CPKOeWtbwmOWY2B4qF0spybKw=
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 9443703254596192763
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
Subject: [PATCH v2 8/8] scripts/spelling.txt: Add notifer||notifier to spelling.txt
Date: Tue, 15 Jul 2025 21:44:07 +0800
Message-ID: <A205796B545C4241+20250715134407.540483-8-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <BD5C52D2838AEA48+20250715134050.539234-1-wangyuli@uniontech.com>
References: <BD5C52D2838AEA48+20250715134050.539234-1-wangyuli@uniontech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NfZ1G3mfsVwmGGfmgJkLyMvl+VoDzXXq2IYtJWnKuWo9l1qkey4A26Hv
	SvTEwKhn6on76DtphpKDmnp2WJC9f2R3CDWC5laPHEPT/iOJA+2/pv/COPzFg6M0QTwvf+D
	6ttVN9VDRkD8+zvL3VCyoPUHl7z73gjejIf/ZS5VVanhM9+31ucc7w43aOiU6lFiOjLulW7
	Rr567Y28DdcRkaB6sa9mPRFZZBRu3p+FN/bDbYSIf3gpu3WpwmfkwXpBmhJVdQItsAzAWbb
	fhbcuJjtFMUUwV0uevVM+8jQTvCqoklXnwQDkGQ3xCW9Rvf3JdqzfjOj8C49Of6ebzL+PGN
	335BovIcz/ABfWYTwC107g4rwWYNu4r6nOoLFYbYpmYWygKfcoOQBiBibJTbIRw284jwJIg
	rNJytL+dtSOMFAv3uCsMgDyN6GOuEj9vP8GsAbkTYzl1zM026u6566/OnrXTWhuAQZqQzq4
	jTbbWRgbgqHZABH0r99LHELaQQQUXu0rYb+WFPCYcj/FpokvDuwS2zkvT/4HhsQWG9eIPLj
	/d2WHb65dpLtMvqvBime6RBUNRZvpBRrT6GUjfhJO4HceuerfXJ8QUw/bLNECBsBskU0Yp8
	1Ug3J5ggzGnRCvxFQJWKxdkHDWxb3Jw492fNdsvrdAJWNhv6nO4tuGWgbcWiMiiPdwXkNmn
	o2cHF5Jj+289BRT3rDSw9hiBrQ7/0RGpqA5G1fMy8iGvQdpvK0aeqwsOSwRb5TKaTgZMZRr
	G0p81zwr/E1K7Mn/2p2wfPpniCL4LrOrSSLo4Gb3p08WIM69mdvanMKFsHXmd0/fXZfpmUm
	rgPVOA2r/NwFBE9h8n1ey7xQ0RJk8akgFJXQIMxf8yGwtepIngU3xFtEPC9EQ6jZyu7iwfe
	xQUP3jG+j7xTUXHl3wogbx23sk7NyZGueojSPbb2CGbqUpnQSvaZG56gBZ7jVWEhppQaZjR
	PWmBCLtR52wESklVmJo8+EPR7fTjC4ZZwrqfHy6nKCJmW5uKAX4AfUJr969cB1pvvMXf5X3
	IOXqWGfFbBBbYGXmkAQFEo3C2IgrFRWzNp3h9jUoNNtKIDzj+9KCfRcqMCfWRCzpRMpdMrV
	PhpUXh8Je5z
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0

This typo was not listed in scripts/spelling.txt, thus it was more
difficult to detect. Add it for convenience.

Link: https://lore.kernel.org/all/B3C019B63C93846F+20250715071245.398846-1-wangyuli@uniontech.com/
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 scripts/spelling.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/spelling.txt b/scripts/spelling.txt
index c9a6df5be281..d824c4b17390 100644
--- a/scripts/spelling.txt
+++ b/scripts/spelling.txt
@@ -1099,6 +1099,7 @@ notication||notification
 notications||notifications
 notifcations||notifications
 notifed||notified
+notifer||notifier
 notity||notify
 notfify||notify
 nubmer||number
-- 
2.50.0


