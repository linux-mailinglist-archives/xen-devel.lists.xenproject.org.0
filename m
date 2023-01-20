Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 483806753A1
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 12:47:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481701.746779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIpqb-0007bV-6L; Fri, 20 Jan 2023 11:46:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481701.746779; Fri, 20 Jan 2023 11:46:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIpqb-0007Ym-3C; Fri, 20 Jan 2023 11:46:17 +0000
Received: by outflank-mailman (input) for mailman id 481701;
 Fri, 20 Jan 2023 11:46:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vlkl=5R=citrix.com=prvs=3778cfab1=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pIpqZ-0007Ya-6T
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 11:46:15 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07552922-98b8-11ed-91b6-6bf2151ebd3b;
 Fri, 20 Jan 2023 12:46:10 +0100 (CET)
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
X-Inumbo-ID: 07552922-98b8-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674215169;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=D+VzVYIqRMT1OcuJ3nEGTwJU8x7YRjAtlbQsRrdWr3c=;
  b=QqBXVnF5rHxKzZFafi4/fWX3ZFnAJq1B8tWZvdx0lWOSe4q4bRAP9dOz
   2i6i9Kbg7ksAXlO/upAV6g0WyeGO01Lyy4IAc6+84LkPzjEb0G/3q5sJu
   OSdAg1JCaYypzz+i72OIExnJEM6mEpVw7j9daWdSvF3cndUQLKjq6wKRp
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 95949543
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:G0gsj6yBB4KOFGqTlb16t+c4xirEfRIJ4+MujC+fZmUNrF6WrkUBn
 WsYDG+OPPqDZmDxeth3OY7noBtQ7MSGytdmGwA4+yAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UwHUMja4mtC5QRnP6gT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KXxxy
 fsGITE0Vxu8pc+03rG6WMxdmst2eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+BgHXlfiIeg1WSvactuEDYzRBr0airO93QEjCPbZQIzxrJ+
 z6dl4j/Kg0oGIKw92Kozi+1r/XItBnjZrkoCITto5aGh3XMnzdOWXX6T2CTvv2RmkO4HdVFJ
 CQ85isrhbg/8gqsVNaVdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QOluU7WDgr3
 V+hhM7yCHpkt7j9dJ6G3u7K93XoY3FTdDJcI3ZeFmPp/uUPvqkusS7IUN9iKZe+sf/YGy/zw
 iKvnTQx0uB7YdEw60mrwbzWq2vy+cSQHlduvVW/snGNtV0gOtP8D2C8wR2CtKsbct7EJrWUl
 CJc8/Vy+tziGn1keMalZOwWVI+k6P+eWNE3qQ4+RsJxn9hBFpPKQGyx3N2dDB0zWir8UWW1C
 HI/QCsIjHOpAFOkbLVsf6W6ANkwwK7rGLzND66LMoMTOcIoKl7ZrUmCgHJ8OEi0wCARfVwXY
 8/HIa5A815EYUiY8NZGb7hEiuJ6rszP7WjSWYr633yaPUm2PRaopUM+GALWNIgRtfrUyDg5B
 v4Db6NmPT0DCryhCsQWmKZPRW03wY8TX8Gv+pwHKrTaSuekcUl4Y8LsLXoaU9QNt8xoei3gp
 xlRhmcwJILDuED6
IronPort-HdrOrdr: A9a23:cPdQ+KCIF0r6CHflHelA55DYdb4zR+YMi2TDtnoBNiC9F/byqy
 nAppomPHPP5Qr4dhkb+Oxoe5PwI080jKQFmbX5ZI3SJzUO21HYT72Kj7GSvwEIcheWnoRgPM
 FbAtVD4bbLYmSS4/yX3OD2KadE/PC3tI2lgOfAw2x8JDsaDJ2JiG9Ce3ym++BNNW97LIt8Pq
 C1ouBAoyOkeXwRZMj+PH8YROLOzueqqHujW29+Ozc3rA2Dlymh5rLZHwjw5GZ7bw9y
X-IronPort-AV: E=Sophos;i="5.97,232,1669093200"; 
   d="scan'208";a="95949543"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>
Subject: [PATCH] x86/shadow: Drop dubious lastpage diagnostic
Date: Fri, 20 Jan 2023 11:45:56 +0000
Message-ID: <20230120114556.14003-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This is a global variable (actually 3, one per GUEST_PAGING_LEVEL), operated
on using atomics only (with no regard to what else shares the same cacheline),
which emits a diagnostic (in debug builds only) without changing any program
behaviour.

Based on read-only p2m types including logdirty, this diagnostic can be
tripped by entirely legitimate guest behaviour.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: George Dunlap <george.dunlap@eu.citrix.com>
CC: Tim Deegan <tim@xen.org>
---
 xen/arch/x86/mm/shadow/multi.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/xen/arch/x86/mm/shadow/multi.c b/xen/arch/x86/mm/shadow/multi.c
index 8b3e678fa0fa..3b06cfaf9a5a 100644
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -2597,14 +2597,7 @@ static int cf_check sh_page_fault(
 
     /* Ignore attempts to write to read-only memory. */
     if ( p2m_is_readonly(p2mt) && (ft == ft_demand_write) )
-    {
-        static unsigned long lastpage;
-        if ( xchg(&lastpage, va & PAGE_MASK) != (va & PAGE_MASK) )
-            gdprintk(XENLOG_DEBUG, "guest attempted write to read-only memory"
-                     " page. va page=%#lx, mfn=%#lx\n",
-                     va & PAGE_MASK, mfn_x(gmfn));
         goto emulate_readonly; /* skip over the instruction */
-    }
 
     /* In HVM guests, we force CR0.WP always to be set, so that the
      * pagetables are always write-protected.  If the guest thinks
-- 
2.11.0


