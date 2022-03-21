Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEE54E28A2
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 14:59:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293002.497653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWIYa-0006yr-AW; Mon, 21 Mar 2022 13:58:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293002.497653; Mon, 21 Mar 2022 13:58:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWIYa-0006wD-7c; Mon, 21 Mar 2022 13:58:48 +0000
Received: by outflank-mailman (input) for mailman id 293002;
 Mon, 21 Mar 2022 13:58:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ob4L=UA=citrix.com=prvs=0720edaad=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nWIYY-0006w7-TQ
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 13:58:46 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 050df988-a91f-11ec-a405-831a346695d4;
 Mon, 21 Mar 2022 14:58:45 +0100 (CET)
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
X-Inumbo-ID: 050df988-a91f-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647871125;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jmkQNDWcosXOqSXQLn083PGEuc8UXeujebveMtZy6dg=;
  b=I95l9ZlXqsQkpSShgFuehjhU5iIn9VPCPisgF3DZ6XhTJIPjEHRsjYPM
   f/pGw8N1aGUpXZy31eW1+odqFd8sry4x/Ud3X0XNQUiwL16y1PvLSqCQz
   eUZOK4LD1gLHee8tMTPUo1xYRKO5Lyp/svRJghn+0bOpBccLetX41ySDw
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 66764538
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:hfdPwa9od0PSx5qFfKAsDrUDmX6TJUtcMsCJ2f8bNWPcYEJGY0x3y
 mccXG+Gaf+IajbxLd5yOo7ipkIHscTdnYNmTwFo+SA8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ54f5fs7Rh2NQw2oLgW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnaXgTxs5FYzKosAySTtYTnBvGolGv7CSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFKoZtmtt0nfyCvE+TIqYa67L+cVZzHE7gcUm8fP2O
 ZRGN2YyN0SojxtnZ2ouUbcVlr2Si0buSx99lGzWhKgn2j2GpOB2+Oe0a4eEEjCQfu1Kmm6Iq
 2SA+H72ajkYKdiexDyt4n+qwOjVkkvTQ5kOHbe18vprhly7xWEJDhASE1yhrpGRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JyOeAn7ACGyoLP/h2UQGMDS1Z8hMcO7ZFsA2Zwj
 xnQwo2vVWcHXKCppWy1z+eSsSOZGC4vCUAYRy9ZHBoix9mkr9Rm5v7QdepLHKmwh9zzPDj/x
 TGWsSQz74kuYd43O7aTpg6e3W/1znTdZktsv1iMADr5hu9sTNT9D7FE/2Q3+hqpwGyxalCa9
 EYJlMGFhAzlJcHczXfdKAnh8VzA2hpkDNE+qQM0d3XC3270k5JGQWy3yGsiTHqFyu5eJVfUj
 Lb74Gu9HqN7MnqwdrNQaImsEcksxqWIPY27Cq+EN4IXO8goL17vEMRSiam4hT2FraTRuftnZ
 cfznTiEUx729piLPBLpHrxAgNfHNwg1xH/JRICT8vhU+eH2WZJhcp9caAHmRrlgtMus+VyJm
 /4CZ5ri40gOC4XWP3iImbP/2HhXdBDX87it8JcJHgNCSyI7cFwc5wj5mupwJdY6w/wLyo8lP
 BiVAydl9bY2vlWfQS3iV5ypQOqHsUpXxZ7jARERAA==
IronPort-HdrOrdr: A9a23:p9mreq1KB2aHdfhS+GM1awqjBL4kLtp133Aq2lEZdPRUGvb3qy
 nIpoV96faUskd0ZJhOo7C90cW7LU80lqQFhLX5X43SPzUO0VHAROoJgLcKqweQfREWndQ96U
 4PScdD4aXLfDpHsfo=
X-IronPort-AV: E=Sophos;i="5.90,198,1643691600"; 
   d="scan'208";a="66764538"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>
Subject: [PATCH] CI: Don't run Coverity on forks
Date: Mon, 21 Mar 2022 13:58:28 +0000
Message-ID: <20220321135828.3158-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

By default, workflows run in all forks, but the Coverity token is specific to
us, causing all other runs to fail.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
---
 .github/workflows/coverity.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.github/workflows/coverity.yml b/.github/workflows/coverity.yml
index 427fb86f947f..f613f9ed3652 100644
--- a/.github/workflows/coverity.yml
+++ b/.github/workflows/coverity.yml
@@ -8,6 +8,7 @@ on:
 
 jobs:
   coverity:
+    if: github.repository_owner == 'xen-project'
     runs-on: ubuntu-latest
     steps:
     - name: Install build dependencies
-- 
2.11.0


