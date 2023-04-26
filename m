Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 240786EEB55
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 02:17:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526379.818078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prSpr-0008WC-TV; Wed, 26 Apr 2023 00:16:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526379.818078; Wed, 26 Apr 2023 00:16:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prSpr-0008TL-QN; Wed, 26 Apr 2023 00:16:39 +0000
Received: by outflank-mailman (input) for mailman id 526379;
 Wed, 26 Apr 2023 00:16:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y0jx=AR=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1prSpp-0008Sz-BG
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 00:16:37 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99451605-e3c7-11ed-8611-37d641c3527e;
 Wed, 26 Apr 2023 02:16:34 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 0DF89320093B;
 Tue, 25 Apr 2023 20:16:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 25 Apr 2023 20:16:32 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Apr 2023 20:16:30 -0400 (EDT)
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
X-Inumbo-ID: 99451605-e3c7-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1682468191; x=1682554591; bh=jf
	46EdUWhIamXc+NDEjQxcZWoeWhu8f3Oja5zY0DWbU=; b=VBh9tHhscu0+3/4fjX
	GOIeHRiwDv2DI7A+Ci0rxFlZm1mhH0lRp9PxtOjtMZhxDg5sQIa2mZI7mQ1Q06eC
	MUokEOVVV/ffLrFaytUysuiq4xqtaA1FIIsT1bpNZFuuSsodsfrCZZzVnWBUb9Gj
	8FsOpFTpqZK0ugYltqAIVNV6XvATjZWl7bE7Wn/IvC8F/ViEhxukjRJBkDMrCzDI
	R1//Jsdgb7SP0wLBRaORlfv7grGJSuaoJiW8QmsTPfGZrbiYhObBouaoxLMeNq56
	NLEmqQ1Et+/cboncFyWOaXi85kmxpaWHhzrbr0du+gLXPNYJL/SgzDkGdENs83Yn
	hh2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1682468191; x=1682554591; bh=jf46EdUWhIamXc+NDEjQxcZWoeWhu8f3Oja
	5zY0DWbU=; b=E7NHURS16ZEhpGlTujlvZJlQ3dxWyvqU/T9B064Eeq18G06cd+T
	UAXdu0nwTFDFuNa9hOWRpIeNRMz7VNqrwfbGB8KvP2HGo8agsyC2ggOqHvdK+jL7
	NUuWqaTPKSVeh9N2J/CKOS/p332qw2BwyL2TmLfGZZDG5V3Cyf5C0hJGbtAjjnHs
	KWemJM+4J6HjNfap+qVKrkAKirDdJ7RXOhlhaDpYn3BrXcLhbjzmRylgvEDM6bow
	vyhfrpGc0dft6t/4/7YT6hOgiD6CaA1x+8P9lSjuir1um3NltIO4w7J15geK3P7h
	JOVBeEuUmm/Bs/hCXMVZdbPXREjM761E3Cw==
X-ME-Sender: <xms:X21IZDFO56Elmh8pUpnRtP37faBfDmfvh5WyPD3tnXzpIoXAXmEZ3w>
    <xme:X21IZAVt3pqtEUejRglBm6iHh9YwDDaa-Bzn32pyzUxcIywFOIagsXXzS4oQLqU7J
    WsHTTsQbB1qNA>
X-ME-Received: <xmr:X21IZFJBo5R5YZCmQCqMBG_WeoT3Pi4xZKRZd_dz63O1Y-JE49ZBR0K0qRp-6XoTESX-AUo_iZWsH1aEiw0kGq-UeShcNGSzLSJxe4QlnoAz3ca5WO1G>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedufedgfeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:X21IZBHorY4FJrrlPc3vxwUEXwwhd3uKDEF1BhAGjf4U3YIzKLuGjg>
    <xmx:X21IZJXZeuiKva2wH6OzXwvjOnbbLIUUWtJbFKLq66deu3srmvXgWw>
    <xmx:X21IZMMeDaiXmkbRRHg4W3xEDTp9VnWeMTAXDiLievZIrujB20Nb2w>
    <xmx:X21IZIeEWZwQDKPncoiFG5BNAvbIQk3TqlIA2hAtXvLYMFd93spW-A>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v2 1/6] automation: specify explicit dom0 mem size for ADL tests
Date: Wed, 26 Apr 2023 02:16:11 +0200
Message-Id: <9e184123dab430fdf9cb6edf818805b15a4afbc8.1682468126.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.ddd9fded43b546af196bcfb4473b62e1fa3864b3.1682468126.git-series.marmarek@invisiblethingslab.com>
References: <cover.ddd9fded43b546af196bcfb4473b62e1fa3864b3.1682468126.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Avoid memory fragmentation that leads to:
(XEN) common/memory.c:277:d0v10 Could not allocate order=9 extent: id=1 memflags=0xc0 (0 of 4)

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
 automation/scripts/qubes-x86-64.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index 2d4cf2e2268c..916dbaae59c3 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -123,7 +123,7 @@ TFTP=/scratch/gitlab-runner/tftp
 CONTROLLER=control@thor.testnet
 
 echo '
-multiboot2 (http)/gitlab-ci/xen console=com1 com1=115200,8n1 loglvl=all guest_loglvl=all
+multiboot2 (http)/gitlab-ci/xen console=com1 com1=115200,8n1 loglvl=all guest_loglvl=all dom0_mem=4G
 module2 (http)/gitlab-ci/vmlinuz console=hvc0 root=/dev/ram0
 module2 (http)/gitlab-ci/initrd-dom0
 ' > $TFTP/grub.cfg
-- 
git-series 0.9.1

