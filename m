Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C55B072AD95
	for <lists+xen-devel@lfdr.de>; Sat, 10 Jun 2023 19:08:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546552.853506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q824F-0007rj-77; Sat, 10 Jun 2023 17:07:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546552.853506; Sat, 10 Jun 2023 17:07:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q824F-0007pU-3W; Sat, 10 Jun 2023 17:07:59 +0000
Received: by outflank-mailman (input) for mailman id 546552;
 Sat, 10 Jun 2023 17:07:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ujxR=B6=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1q824D-0007pL-9y
 for xen-devel@lists.xenproject.org; Sat, 10 Jun 2023 17:07:57 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 560a04d1-07b1-11ee-8611-37d641c3527e;
 Sat, 10 Jun 2023 19:07:53 +0200 (CEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 76A435C00BA;
 Sat, 10 Jun 2023 13:07:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Sat, 10 Jun 2023 13:07:52 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 10 Jun 2023 13:07:50 -0400 (EDT)
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
X-Inumbo-ID: 560a04d1-07b1-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm1; t=1686416872; x=1686503272; bh=CFxrsTHk2WZ2bHj5E7HOWzGC2
	M6TbCCvBJcoVes5ASQ=; b=HO0vJtT77+rZndOX90RQX40x6vq642GbuMdxU55Ca
	zeVatV2LwToz78+BK08NzP769skVN+z1oFdl8bU5R0yZdNJ9jpkOcn2Q/JfzDTQQ
	Ynz3V4ag043lIML+1y895NbuI+eXWQM+vf0q7tIEhg3Y1irGvhk1r/GeSqC26ceX
	hATz9XyCucDSV/zhLfdkBcBO/QulWpjU9VY8T2Ehu9xXxtrv56Samma8R/JICMc0
	d3uE+rvdtv1Nm19G4eocL0vTbxmsjOc5ljGXADTU7zOnwI41Ii+7deQXrNPM4CJA
	hLDYENmpLE0N/5ccHG1kBTmUUASAmZ0Vha3NaQ0oDXffw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1686416872; x=1686503272; bh=C
	FxrsTHk2WZ2bHj5E7HOWzGC2M6TbCCvBJcoVes5ASQ=; b=NjIw4pICWS+wOmKQm
	1JvFxSVOo56p+oLMbtOx+kbeeI6t01RsLM8kprlB/zc679knq1dlFrOL+wE8FEME
	mmAFpuvGIGrP49cxKoc9kqWhPlX0wpzo6RsFb5N3R67UJ2dptFmLg06xx4lcCyZ7
	UlXREv/EdYUaSjvsbWGWYqUgABLfxE9j7iDOgeBiovjD/HzfPodvq+g029XHvUfh
	6R7pVnLpqOA8rK5qepvydgnq7z/Y5Rmn8VRt5rket3TftfDCvOD0oT8URRDlfhgR
	YWiRqygOUFRunE901x96yp3zyPNkOwHDuYirhZkoe6fFfxT2NBDPynKznM6S/HYa
	zNNsA==
X-ME-Sender: <xms:562EZIHNmIhVynvm4xE89UT3qDlPgrSIbHlL_DhLNY3MF9ozhD153w>
    <xme:562EZBWCkwrOhRchGamiG1LC4POJ4DW7-7uWHjkIJge4DAfzB5BA8hm4kbmQ3i3Vr
    tmAOoZRv1_hGUo>
X-ME-Received: <xmr:562EZCKZaSApRloWyugsw47u4f85dZw7icN334m9xVu8tWsQHWZ0pkfwNKljG6gO9g9ZDNGnfEw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgedutddgudduudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhephfeggfeiiedtieejgedutdekgfet
    geehheegteekvefhfefgudehtdevleegueegnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:562EZKErxpgl5N_se3kC8U37cL5hz2WlqsADlcD4GKe7rtwn3Zrp1g>
    <xmx:562EZOX9QiqhLuzoWJ93E4yM6dzrE0GxOw99lLBSC620PpT0gMQ12g>
    <xmx:562EZNN0pFTENofYZ29lVzLhPTdxbAtlN0V5TwFhFWiRgfiFnT4dMg>
    <xmx:6K2EZFOg-xqiLURhcCMM0Nouy_Ve5GKyKJqvBV2aCAS2z947YwW29w>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Lee Jones <lee@kernel.org>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 0/3] Make sscanf() stricter
Date: Sat, 10 Jun 2023 13:07:40 -0400
Message-Id: <20230610170743.2510-1-demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Roger Pau Monné suggested making xenbus_scanf() stricter instead of
using a custom parser.  Christoph Hellwig asked why the normal vsscanf()
cannot be made stricter.  Richard Weinberger mentioned Linus Torvalds’s
suggestion of using ! to allow overflow.

Changes since v1:

- Better commit messages.
- Use ! to explicitly opt-in to allowing overflow.
- Treat overflow as a conversion failure instead of returning ERANGE.
- Drop the first patch (removal of simple_strtoll()) as it breaks
  bcache.
- Stop skipping spaces in vsscanf() instead of adding a separate
  vsscanf_strict() function.

Demi Marie Obenour (3):
  vsscanf(): Integer overflow is a conversion failure
  vsscanf(): do not skip spaces
  Strict XenStore entry parsing

 .../hive_isp_css_include/platform_support.h   |  1 -
 drivers/xen/xenbus/xenbus_xs.c                | 17 ++--
 include/linux/limits.h                        |  1 +
 include/linux/mfd/wl1273-core.h               |  3 -
 include/vdso/limits.h                         |  3 +
 lib/vsprintf.c                                | 90 +++++++++++++------
 6 files changed, 80 insertions(+), 35 deletions(-)

-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


