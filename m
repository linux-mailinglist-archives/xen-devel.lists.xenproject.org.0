Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 084992993BB
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 18:26:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12498.32537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX6Ff-0004MO-Lo; Mon, 26 Oct 2020 17:25:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12498.32537; Mon, 26 Oct 2020 17:25:47 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX6Ff-0004M2-IU; Mon, 26 Oct 2020 17:25:47 +0000
Received: by outflank-mailman (input) for mailman id 12498;
 Mon, 26 Oct 2020 17:25:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dsar=EB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kX6Fd-0004Lx-Pv
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 17:25:45 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 609cec39-727e-4727-a084-f8d167bc9837;
 Mon, 26 Oct 2020 17:25:44 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Dsar=EB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kX6Fd-0004Lx-Pv
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 17:25:45 +0000
X-Inumbo-ID: 609cec39-727e-4727-a084-f8d167bc9837
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 609cec39-727e-4727-a084-f8d167bc9837;
	Mon, 26 Oct 2020 17:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603733144;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BNGySlpj4rUM3cAeZCyEmyQZGXtupDnrUOOIgEyp9+g=;
  b=baC84Xktvre9C8SO77o78oFWABTCVT5eE5UgSQ0oN/afc4i3XZQd9Sxx
   nn95UP/9bAKGTxnPSDMO/+sTwtQvzuZGHdAO/0xOHO+YYeeeeyqiYEYug
   lhaFPvolhvG1SOm248MhJ0uYbOxHGztKJ5SwnoV7Girpl6Mcdr5d+harq
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 2ewJXry9Xx/diuVR5Sl+G9+bNuOdIRrkYAUVLYtOB+A98fcAiCVBn6iAUCyqsAlzFhUNM7UU6J
 cd+jMA2rXVVJm0GAwVBKgA7t1m49de5AkVHXcyZZweQ5CGSdHSIVCFBMhyzbqD1gxKbtRg9kCW
 VouadEYINwmcVIRFGNFvy3PDv2iFLeaeW3bYggXu7oRK8E0MWwt5M5VneK/6UJ//d5LsXy9BZ2
 8R3h5F3epuSkjpj2FkpW1GYDwLYP8jwqLpuVCPPr9VBK19NdHtQQVTfPP8pWaZjIoI0ki7wyQ6
 Suw=
X-SBRS: None
X-MesageID: 29805557
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,420,1596513600"; 
   d="scan'208";a="29805557"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Igor Druzhinin <igor.druzhinin@citrix.com>
Subject: [PATCH 0/3] x86/ucode: Fixes and improvements to ucode revision handling
Date: Mon, 26 Oct 2020 17:25:16 +0000
Message-ID: <20201026172519.17881-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Patch 2 fixes a bug with the Intel revision handling, which is causing
problems on IceLake SDPs.

Patch 3 adds ucode=allow-same to allow for sensible testing of the late
microcode loading path.

Andrew Cooper (3):
  x86/ucode: Break out compare_revisions() from existing infrastructure
  x86/ucode/intel: Fix handling of microcode revision
  x86/ucode: Introduce ucode=allow-same for testing purposes

 docs/misc/xen-command-line.pandoc    |  7 ++++++-
 xen/arch/x86/cpu/microcode/amd.c     | 25 ++++++++++++++-----------
 xen/arch/x86/cpu/microcode/core.c    |  4 ++++
 xen/arch/x86/cpu/microcode/intel.c   | 31 +++++++++++++++++++++++++++----
 xen/arch/x86/cpu/microcode/private.h |  2 ++
 5 files changed, 53 insertions(+), 16 deletions(-)

-- 
2.11.0


