Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BAFA7A19A
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 13:07:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936484.1337787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0IPW-0007M3-0p; Thu, 03 Apr 2025 11:07:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936484.1337787; Thu, 03 Apr 2025 11:07:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0IPV-0007HY-SJ; Thu, 03 Apr 2025 11:07:01 +0000
Received: by outflank-mailman (input) for mailman id 936484;
 Thu, 03 Apr 2025 11:07:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X4pi=WV=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u0IPU-0005Qy-BR
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 11:07:00 +0000
Received: from fout-a5-smtp.messagingengine.com
 (fout-a5-smtp.messagingengine.com [103.168.172.148])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2b67f71-107b-11f0-9ffb-bf95429c2676;
 Thu, 03 Apr 2025 13:06:58 +0200 (CEST)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfout.phl.internal (Postfix) with ESMTP id 1223B13801AD;
 Thu,  3 Apr 2025 07:06:58 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-11.internal (MEProxy); Thu, 03 Apr 2025 07:06:58 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Apr 2025 07:06:56 -0400 (EDT)
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
X-Inumbo-ID: c2b67f71-107b-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1743678418; x=1743764818; bh=KrMIkNcsW4
	7Spr5nyS0BqxsgMbL82nPdur/bMGMqzD4=; b=oimuvXJ+tZDKFivKoPdqtW/P34
	x2ik28wIjpVi5YJd1GdNSBsXkMOfgIDzWdCHPVJFlTdlbsVxfcmbsaf8MuBv5I8v
	ZjyZHeg4viCnYSo8C3KpAJHovdppzgy052di0nVqzY6HH61z+NTgDj3UQGhD9wbr
	RWrnyLUldRcz9cP1bo8CDU/Iw0q8pnF4LNLBXeNTGuC0bHwk8ywaRXR3SdkQfY/+
	7lHqSPHULdtdyyBSBhXwiyoo3FX71qQNH4jZr2gXibfML4kq28s84o5MuTlZuAkR
	eE8Yvf+IWTggfqGBggmnGHWHXpAlGWEoHb27N3dJ1GRQtf4JHtES8Ix+vIGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1743678418; x=
	1743764818; bh=KrMIkNcsW47Spr5nyS0BqxsgMbL82nPdur/bMGMqzD4=; b=d
	u+CAcQkErFKKQxxFBB/ZMyPyVp0JrfzG8aa+zY6LEZKHibG8hqAFce4ggsBfaQCi
	UAn9w7CIyjTxOCSyrtuBfSNzteP+8cooKD9nASGWL+42xVNeesyt7/WuGlMEZwBP
	oAzKJs7UyyUL9EOAQNmY7e2HoR42+PCwO3hWn3R100mKp7CMeApMGJabe7Flljeo
	sbjDfRNMeK0MDyaAOYHl0e4JXymH2YkdbGF4AKMFFgh4reN9HC4VikIa1S+dF/sg
	zZ2bPSLSIBhxqthseU3N2nJSn43zaaY9NJmwAhuKVMSIGpcq8I2VSV8hJZh5rEb+
	eOjWKR8BEoZy7Z9zvQPCA==
X-ME-Sender: <xms:0WvuZ8_8svdEPTMi8DQ17yUp1LYj3LgFlfvtTfyUbYWJELHJcLfjAQ>
    <xme:0WvuZ0u6IR_YcSUfZ0DSkuNuz96u8kB3s5xBA-iMmH6ZQtXnAvq2C4OM17oCeuNWB
    jDIANxLlIvDlQ>
X-ME-Received: <xmr:0WvuZyAMQE3J1g-87tBo46rlOlRu_tbYQdhIzAA2Rak6NMDCBzv7tBMzDjbSe8rMObCVkZOga2JS8SfmL-7ECl_-8xzkZyl-pI8dfbzztUcgQ9-yAAw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeekfeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertder
    tdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkih
    cuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeen
    ucggtffrrghtthgvrhhnpefgueduhefgvdefheehudejheefudevueeghfekhfehleegve
    duteeuiedugffgffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtoh
    hmpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeig
    vghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtth
    hopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpthhtohep
    mhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdprhgtph
    htthhopegtrghrughovgestggrrhguohgvrdgtohhmpdhrtghpthhtohepshhsthgrsggv
    lhhlihhniheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:0WvuZ8dVjaEo9lVpv6FkhFV9aIUPF0MdE_M51u7z0Cs5YnzXEbSuvA>
    <xmx:0WvuZxMU9qWDrLzbLmFvYYR1-iuV2lWSt3MVM2IpOhg1s3JQn93kQg>
    <xmx:0WvuZ2k6Ojzo2whvXTTSVJYgJXpKtGOX2M74yXOvGteffV8DRkzPrQ>
    <xmx:0WvuZzvGrk6phQ7aCPjEfaWRoZ5z5mwFS86tpQDxBfr53CesPFP0VQ>
    <xmx:0mvuZ2Vt4t1zwjz1sOLhbgG2_bmjD1JvzON5cCwf1VK4q861yN13F3mk>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 09/11] ci: adjust resolving network interface into PCI device
Date: Thu,  3 Apr 2025 13:04:44 +0200
Message-ID: <bc4788cfc6217be3b900e4ab4c019eb3b7e34f0a.1743678257.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.59b4d1e66776c1e577aa5dd5460605dc6c240613.1743678257.git-series.marmarek@invisiblethingslab.com>
References: <cover.59b4d1e66776c1e577aa5dd5460605dc6c240613.1743678257.git-series.marmarek@invisiblethingslab.com>
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
---
 automation/scripts/qubes-x86-64.sh | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index 6d2c170d1ee1..dc8013750f5f 100755
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

