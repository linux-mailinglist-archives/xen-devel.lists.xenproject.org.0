Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AA23494ED
	for <lists+xen-devel@lfdr.de>; Thu, 25 Mar 2021 16:08:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101419.193986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPRZq-0003J7-Po; Thu, 25 Mar 2021 15:07:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101419.193986; Thu, 25 Mar 2021 15:07:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPRZq-0003Ii-Mb; Thu, 25 Mar 2021 15:07:14 +0000
Received: by outflank-mailman (input) for mailman id 101419;
 Thu, 25 Mar 2021 15:07:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gSM8=IX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lPRZp-0003IN-1Z
 for xen-devel@lists.xenproject.org; Thu, 25 Mar 2021 15:07:13 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 11f84eb4-e3bf-4ebe-9f7b-a8e7b1b50e52;
 Thu, 25 Mar 2021 15:07:11 +0000 (UTC)
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
X-Inumbo-ID: 11f84eb4-e3bf-4ebe-9f7b-a8e7b1b50e52
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616684831;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sf4Auicmds1fUQbk3KFvdJd2F/zuUn0aFuSvA8OcGwg=;
  b=WrvaWAI+ASju1AymthaDgNn9LyvyqBtHVVlSbfG1jXkZ827QQ3kqMMyq
   Uyq+dYtN7+8G356Mn0LGsx+mhmbG08DO4c//UGQ+KbIzo4AQ46J98Kefl
   EVWcnbpaBQkZ3tja754DzEJu4DoyZ93MbEU+8dbccz3l7OUx5HCX0ZSPD
   M=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: sEZW6+nMsb9zTCl4Zq46vMkCce9XQ4lh7sakvMhk1/8I2HiJeA7q92L7VJhflcP1Uu4znQcjh9
 6LlAuX5NRKv1bS7EwcEHYV4RPUgqpqtJagZ/47jWbki4pyXXSP9G0dQaCirMxyd039DdntwHgr
 APtl/dChnemoVjqi9bkSJjq3v1RBz4DopzNlo30VjMAliWWB9wdG22ATNMBVQgOfMmtxSnpIkk
 LKqA+iomKOejc39gVtlEbwjfvw5JuDT1QEncRFDZcjeTo6ciwTb2pjieCPnbkgAKmHn06rXy3d
 Zr0=
X-SBRS: 5.1
X-MesageID: 40286511
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:hpklwKp6+avSTkTGTVlFxYIaV5uiKtV00zAX/kB9WHVpW+SivY
 SHgOkb2RjoiDwYRXEnnpS6NLOdRG7HnKQZ3aA4Bp3neAX9omOnIMVZ7YXkyyD9ACGWzIRg/I
 9aWexFBNX0ZGIQse/T6gO1Cstl5dGB/ryhi+u29QYXcShBQchbnmREIyycFVB7QxQDIJI/Go
 aV6MYvnUvbRV08aMOnCn4ZG9XSvtGjruOtXTcqJT4CrDOPgzSh9aLgH3Gjsis2fjtTzd4ZgA
 /4uiPj4KHLiZCG4z/ak1Te9pFH3Obmo+EzfPCkrugwBnHShh2zZIJnMofy8QwdhO208l4lnJ
 3tjn4bTqJOwkjcdG20vhfhsjOIuFlB11bYxVCVmnflq8DiLQhKcvZpv55TcRfS9iMbzbNB+Z
 9LxG6Qut52Ch7NjU3Glrz1fixqjUa9rD4el/cShRVkIO4jQYJWxLZ+wGplVLM7WA7q4oEuF+
 djSOvG4uxNTF+cZ3fF+kFy3d2FRB0Ib1i7a3lHnvbQ/yldnXh/wUdd7tcYhG08+JU0TIQBz/
 jYM55viKpFQqYtHOxALdZEZfHyJn3GQBrKPm7XC0/gDrs7N3XErIOyx7kp+uewetgtwIEpkJ
 rMFHNU3FRCOn7GOImr5tlm4xrNSGKyUXDG0cdF/aV0vbX6Wf7lKiuGRFcyk9axovkWD8HBMs
 zDe65+MrvGFy/DCIxJ1wrxV915Mn8FSvAYvd49RhaPr6vwW8/Xn92eVMyWCKvmED4iVG+6KG
 AERiLPKMJJ6V3uXnf5hRPWSm78Y0CXx+M0LIHqu8wojKQdPIxFtQYYzX6j4NuQFDFEuqsqOE
 1kIL3mlau/rXKs/XnB6nhoPhY1NDcU3JzQF1dx4SMaOUL9drgO//+Ff3pJ4XeBLhhjC9/NHB
 VHvFRx86KvJ5mWzSQvYujXdl6yvj82njanXp0ckqqM6YPZYZs+FI8hQ7E0Px7MDQZJlQFjr3
 pjZAcISlTELC7njbyogfUvdabiXug5pD3uAMZP7VrDqE2XpKgUNwYmdg/rdfTSvCEDaH5/gE
 Zr/6oWnbya8AzfVVcXsaAfK11DaGOeHbRcKh+KDb8k1ozDcB1sTGuMmDyRgwwyfG2v7EkJmm
 n9N0SvCI72K0sYtXZC3qnw9lRoMm2bYkJrc3h/9ZZwDGLcpx9IoKa2T7v212uacV0ZxO4BdD
 nDfDsJOwtrrurHoyK9iXKHFX88wI8pMfGYBLM/c6vL0nfoLIGTj6kJE7tV+5liXeqexNMjQK
 aaewWPKin/BP5s0wuJpmw9MC0xsWI6i5rTqW/YxXn92GR6DevZIVxgSb1eK9aA73L8T/LN1J
 lil9o6sea5L22ZUK/P9YjHKzpYbh/Dq2+/SO8l7YpZuq8/r7N/FZjWWzmg7gAy4DwuaMPv0E
 8OSqVy577MfpJ1d8sJYiRD4x4nks+MIEZDiH28PsYuOVU2y3nVMNOC7+CW9f4hAkidqBDxPl
 fa+StH5PvBVzaC07lfC69YGxUnVGEsrHB5uOWFfMnMDQ/vcedJ9l+zKGW8f79QU7LtI8Rkkj
 9qp9WT2/aKfC/50h3KtTR1IqhS43+qKPnCcT6kCKpN6ZimIlyCjauh/d6rgDr2QTW9bV4EhY
 ctTz1iUu1Tzj84jIM21SCuSqv45kI9+mEunw1aqg==
X-IronPort-AV: E=Sophos;i="5.81,277,1610427600"; 
   d="scan'208";a="40286511"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen: Drop "-rc" suffix from XEN_EXTRAVERSION
Date: Thu, 25 Mar 2021 15:07:02 +0000
Message-ID: <20210325150702.7582-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Fixes: a04509d34d ("Branching: Update version files etc. for newly unstable")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
---
 xen/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/Makefile b/xen/Makefile
index ab7d86d226..9f3be7766d 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -2,7 +2,7 @@
 # All other places this is stored (eg. compile.h) should be autogenerated.
 export XEN_VERSION       = 4
 export XEN_SUBVERSION    = 16
-export XEN_EXTRAVERSION ?= -unstable-rc$(XEN_VENDORVERSION)
+export XEN_EXTRAVERSION ?= -unstable$(XEN_VENDORVERSION)
 export XEN_FULLVERSION   = $(XEN_VERSION).$(XEN_SUBVERSION)$(XEN_EXTRAVERSION)
 -include xen-version
 
-- 
2.11.0


