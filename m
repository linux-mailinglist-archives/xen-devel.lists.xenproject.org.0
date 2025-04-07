Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1234BA7DDC0
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 14:34:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.939848.1339880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1lge-0008Qc-Lr; Mon, 07 Apr 2025 12:34:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 939848.1339880; Mon, 07 Apr 2025 12:34:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1lge-0008MW-GP; Mon, 07 Apr 2025 12:34:48 +0000
Received: by outflank-mailman (input) for mailman id 939848;
 Mon, 07 Apr 2025 12:34:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uyK1=WZ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u1lgd-0006u9-4T
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 12:34:47 +0000
Received: from fhigh-a4-smtp.messagingengine.com
 (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af574415-13ac-11f0-9ffb-bf95429c2676;
 Mon, 07 Apr 2025 14:34:45 +0200 (CEST)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal
 [10.202.2.52])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 63843114021F;
 Mon,  7 Apr 2025 08:34:44 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-12.internal (MEProxy); Mon, 07 Apr 2025 08:34:44 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Apr 2025 08:34:43 -0400 (EDT)
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
X-Inumbo-ID: af574415-13ac-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1744029284; x=1744115684; bh=JBSgp/43ku
	/IG4uH7Ko3Z77z4MQ5/Hj6l9vUJjfz2kg=; b=BAc4354YtgcI0neHhcavWgtaUF
	ynYy2UNeqj+vvMt7K1AebjZm+rJDf3t0fyEQZNeId2POvgU17Q8nmoj9GwZtjtku
	5mWBMsbfsMfh/v5CofaGvRNzmjkOu1cq6++TTL4hOgLMltxJDc57a9n3lj94VA0X
	ETOnowRi6n0LTPqoffwcHyg9tDGMo3DtmNiwBLFuR1uwT6nohusVvHDFgkngQzF5
	BxvAhHJWbwFKzAD4m4l3Feu2oeM5u4OcCGonRCj9i5AiYo5k0Cgv02NekUird0hh
	lbZ9Z+/Llw+ox9cOcL1B8he6A8dmEOrTCv/VIO1iGfHho2fXcxX0CWksRtXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744029284; x=
	1744115684; bh=JBSgp/43ku/IG4uH7Ko3Z77z4MQ5/Hj6l9vUJjfz2kg=; b=f
	X6h5KuNaa+xuT0oZuexUpmMEw+gt95Zpg6yfbtyVn7vV1Nrp1STDhmLbAuJTxP0W
	g3uZol9F60qlBFFdffQ2JteFp5BJY9uHoAo3W1EZg4VWFFHQ4UPmgf8XqJ+0ZZdU
	g5A8VE6Hz5x0YEc95SThXk7uXimm5vcA69qhx+t294MfXQEeXzU3PRHJgiefgIEO
	FNFFkbfIiOtji1G2I0L+LuinmKWDgCo6CJ0QxuCwKTfek0tevVJhvy7QDLlHns3Q
	SZBN8GLP7G8Ip/WP409ZpuN3oIkyrV8D7G8XBGdYRv3haUZEvwCxGAx2arJ0JyK6
	H1jMs0qcXUjEMNflOA/ag==
X-ME-Sender: <xms:ZMbzZ_5QbHEiXnY4cGrY6MNMXlYa1GBz1M4mt-vsIn_58wjf2-cplw>
    <xme:ZMbzZ07MANKgzQ3mFbw3PSoeUIxEujZSerK-rwgINQcIjJsPfzk8pypoJ8u10IEyk
    6o0E-omjvBr4A>
X-ME-Received: <xmr:ZMbzZ2dpLRXrrrURMnTny6C7c__Ob7_pBIWxNLmOqdO0DxMG5ftabaSf-mclaok9VMfMOyj4p909Cz6Gqw_3V8cd-hfS7ZBVqMCgeL8VaYWiLqjeVfM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtvddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertder
    tdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkih
    cuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeen
    ucggtffrrghtthgvrhhnpefgueduhefgvdefheehudejheefudevueeghfekhfehleegve
    duteeuiedugffgffenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtoh
    hmpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeig
    vghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtth
    hopehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhr
    tghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eptggrrhguohgvsegtrghrughovgdrtghomh
X-ME-Proxy: <xmx:ZMbzZwLX35IO02Z1fxQn0fZMc-yzwMV7-_qpkcF_-wKZZh8HgBN6mQ>
    <xmx:ZMbzZzIcltLfn6SW58tgX7hk9YCTPdiFkBwnERP6f02LMVyuQrn3Nw>
    <xmx:ZMbzZ5yJPWLcGKrOsPMxfp4ZcoFK2X-FmdPRB_m5oIsGMBhPd0eXNw>
    <xmx:ZMbzZ_JQQ7S9nRU_dI7-eYzXBkmKbW0c14gXQAdQfl4BvMjqAOppNw>
    <xmx:ZMbzZ5S74PmWT44sOLeVdaGBKRHloxtGhwnZ1NIWiXBDPj7Z1DpB2hsX>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v2 09/12] CI: adjust resolving network interface into PCI device
Date: Mon,  7 Apr 2025 14:31:09 +0200
Message-ID: <691ab03ad2b1a327a8b2559facec668ab4ce6986.1744028549.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.7da1777882774486a13e6f39ff4a2096f6b7901e.1744028549.git-series.marmarek@invisiblethingslab.com>
References: <cover.7da1777882774486a13e6f39ff4a2096f6b7901e.1744028549.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Change how PCI device lookup is done to handle also USB devices, in
which case get the USB controller. Instead of taking basename of the
'device' symlink, resolve the full path (example:
/sys/devices/pci0000:00/0000:00:09.0/usb4/4-7/4-7:1.0) and take the
first part after pci0000:00. Theoretically it could be a bridge, but VM
has flat PCI topology.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 automation/scripts/qubes-x86-64.sh | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index 9359e8914fb2..861e302d845b 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -110,7 +110,8 @@ timeout 30s udhcpc -i \"\$interface\"
 pingip=\$(ip -o -4 r show default|cut -f 3 -d ' ')
 ping -c 10 \"\$pingip\"
 echo domU started
-pcidevice=\$(basename \$(readlink /sys/class/net/\$interface/device))
+pcidevice=\$(realpath /sys/class/net/\$interface/device |
+             sed 's#.*pci0000:00/\\([^/]*\\).*#\\1#')
 lspci -vs \$pcidevice
 "
         if [ -n "$PCIDEV_INTR" ]; then
-- 
git-series 0.9.1

