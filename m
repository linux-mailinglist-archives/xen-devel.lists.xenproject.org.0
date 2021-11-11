Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B82E44DB61
	for <lists+xen-devel@lfdr.de>; Thu, 11 Nov 2021 18:58:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224833.388379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlEKz-0006bu-3F; Thu, 11 Nov 2021 17:58:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224833.388379; Thu, 11 Nov 2021 17:58:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlEKy-0006Qp-Rm; Thu, 11 Nov 2021 17:58:12 +0000
Received: by outflank-mailman (input) for mailman id 224833;
 Thu, 11 Nov 2021 17:58:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GOKj=P6=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mlEKw-00061G-Ud
 for xen-devel@lists.xenproject.org; Thu, 11 Nov 2021 17:58:11 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec3cd976-4318-11ec-a9d2-d9f7a1cc8784;
 Thu, 11 Nov 2021 18:58:07 +0100 (CET)
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
X-Inumbo-ID: ec3cd976-4318-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636653488;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BOyeLIFh4rsbQLKjP5QzMq6nEVwvgaszHY0AXnaE+IU=;
  b=N2g/3SaZvv5DjmeVy8NxFzkPednHXpIHNlUHSvc3ttFqwcEr9gdI/arj
   cXEWWl0dV+VuY/rJKaxu9mmtvD1pMQnpiZ6Hbm3ETdkjkyavpr0qapvmX
   vg7zvQkw+SsEbPRPW3OI8R2h541bHIpQzrImwcXvG7yAzt3UV/eARkZGv
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: w13Pw8TY4dJoxaddBmkr3J6m6XtotdrUvv/s2bNwiIEv/5ZM6JVmDVeAINbdwtkAn6OysjK3Mi
 4R366D0XszuQjldBMD8IyPgHjcbwd/Lgtr68JkQTOxKSF9BPJnLl9uxgm49YrFeIma9PqIhCys
 cKWJp9gvkgjgaE6mrUQaKpk1BAfmIK85T3Uo3eTSVYfSUEATe5I6Veu7qsagbbcCcg7WvjN7cw
 AVEqucuIrdb+Qz34wqFKP7Vblm+lHCydQUs6ffXj/DueFa62Wb1EkvGZ0rnC/TSiqX6/eVTzhm
 wLZ2Vqg5VRXMg/2n9EUKO8aa
X-SBRS: 5.1
X-MesageID: 57155535
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Q81pzq0ErvkVCPfP4/bD5XB2kn2cJEfYwER7XKvMYLTBsI5bpzIHz
 jYbXT3QO6zfamGhLd12PYu28ksPv5PQnIQxTwBlpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan8ZqTNMEn970Es6wrdh2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhm/N9+
 epdt6aKSho2MLb8o71eShJbOnQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Er8IvNsT0eqgYvWlt12rxBvc6W5HTBa7N4Le02R9t2ZkTQKuFO
 qL1bxJ0UCjZbEFDG247VogOxfikql2ucGBx/Qf9Sa0fvDGIkV0ZPKLWGNjIft2HQ+1Fk0Deo
 XjJl0zHBRUdOM2a2CCy2Humje/Sngv2QIsXUra/85ZCilCJ2nYaDhFQUFKhuOS4kWa3QdcZI
 EsRkgIxqYAi+UrtScPyNzWorXjBshMCVt54F+wh9BrL2qfS+xyeBGUPUnhGctNOnO0cSCEu1
 1SJt8j0HjEpu7qQIVqG7audpz62PSkTLEcBaDUCQA9D5MPsyLzflTqWEIwlSvTsyISoR3egm
 FhmsRTSmZ0XrsI66LW5x2rEni2ivajyF00s7Qb+CzfNAhxCWKapYImh6F7+5PlGLZqEQlTpg
 EXoi/Ry/8hVU8jTyXXlrPElWejwuq3baGG0bUtHRsF5r1yQF2ifkZe8Cd2UDGNgKY46dDDge
 yc/UisBtcYIbBNGgUKaCr9d6vjGL4C8SrwJtdiON7Kih6SdkiferUmCgmbKjwjQfLAEy/1XB
 HtiWZ/E4YwmIapm1iGqYOwWzKUmwCszrUuKG8ulkkr2jurDOyHKIVvgDLdoRrlohE9jiF+Fm
 +uzyuPQk0kPOAEASnW/HXEvwaAiciFgWMGeRz1/fe+fOAt2cFzN+NeKqY7Nj7dNxvwP/s+Rp
 ynVchYBlDLX2C2WQS3XOysLQO6+Av5CQYcTYHVE0aCAgCN4P+5CLc43KvMKQFXQ3LA5kKMvE
 aBaI57o7zYmYm2vxgnxpKLV9ORKHClHTyrXV8Z8SDRgLZNmWSLT/droIlnm+CUUV3Llvsoiu
 bywkAjcRMNbFQhlCc/XbtOpzk+w4idByL4jAROQL4kBYljo/ahrNzf10q09LfYTJEiR3TCdz
 QuXX0sV/LGfv48v/dDVrqmYtIP1QfBmF09XEjCDv7a7PCXX5ES5xopEXLradDzRTjqsqq6je
 f9U37f3N/hexARGtI91ErBKy6Mi5oSw++8Gn1o8RHiSNgalELJtJHWCzPJjjKwVy+8LoxayV
 2KO5sJeZeeDNvT6HQNDPwEidOmCi60Zw2GA8fQvLUzmzyZr577bA15KNhyBhSEBfrt4NIQpn
 bUotMIMslHtjxMrNpCNjzxO9nTKJXsFCv11upYfCY7tqwwq1lAdPsCMVn6ouMmCO4dWL00nA
 j6In66T1b1Ty33Lf2c3CXWQj/FWgo4DuUwSwVIPT7hTdgEpWhPjMMVtzAkK
IronPort-HdrOrdr: A9a23:85efoqpPWoWe3BKEdNhY+XcaV5oneYIsimQD101hICG8cqSj+f
 xG+85rsiMc6QxhPE3I9urhBEDtex/hHP1OkOws1NWZLWrbUQKTRekIh+bfKlXbakvDH4VmtJ
 uIHZIQNDSJNykZsfrH
X-IronPort-AV: E=Sophos;i="5.87,226,1631592000"; 
   d="scan'208";a="57155535"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH 0/5] xen: various function pointer cleanups
Date: Thu, 11 Nov 2021 17:57:35 +0000
Message-ID: <20211111175740.23480-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Passing CI runs:
  https://cirrus-ci.com/build/6095362789212160
  https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/407123417

Andrew Cooper (5):
  xen/domain: Remove function pointers from domain pause helpers
  xen/domain: Improve pirq handling
  xen/sort: Switch to an extern inline implementation
  xen/wait: Remove indirect jump
  x86/ioapic: Drop function pointers from __ioapic_{read,write}_entry()

 xen/arch/arm/bootfdt.c   |  9 ++++-
 xen/arch/arm/io.c        |  9 ++++-
 xen/arch/x86/io_apic.c   | 30 +++++++++++-----
 xen/common/domain.c      | 93 ++++++++++++++++++++++++++++--------------------
 xen/common/wait.c        | 19 +++++-----
 xen/include/xen/domain.h |  1 -
 xen/include/xen/sched.h  | 15 +++-----
 xen/include/xen/sort.h   | 55 +++++++++++++++++++++++++++-
 xen/lib/sort.c           | 80 ++---------------------------------------
 9 files changed, 162 insertions(+), 149 deletions(-)

-- 
2.11.0


