Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2972B11500C
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2019 12:51:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idC6N-0003ER-Rq; Fri, 06 Dec 2019 11:48:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cnnL=Z4=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1idC6L-0003EM-HG
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2019 11:48:49 +0000
X-Inumbo-ID: 5c5d62ef-181e-11ea-8253-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5c5d62ef-181e-11ea-8253-12813bfff9fa;
 Fri, 06 Dec 2019 11:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575632928;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nleLpKa28dKt5tonO64UeswOpIC1n0cAOxgrn87IPUU=;
 b=Ds/itOAsdt9lRZUSaaeft8kbyu9Prdwe+eYMUg2bXfYiPKymkyZcdSag
 oLbs4e0MuN3ESZPQyrsTL9gV/UUhkF7Ozhp+6ItSQ2ru7qq1DWUaPWz8G
 6E+S7V6muYzTnCMFabN0t1G0i3SGQ32bIXzk7I9uhVsTrZpxVUqlPPgeE A=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 9Pqft2IVYvIeKsf9Sffew5VHggkfvzXswXLqGo5a6vp+EsQDPlUesMv7VfDRfJ8k+AHGgMp7kZ
 WWoDO0ctBMntrI0Pyak2eNbOr2m15hW6kx1f2VBGV4Fzulf1WKy/ftYLOZ/oZMsK2J76/Xsxif
 MeHAN+mDTUbwVwYqxVM4ZFF0DIVIlcPsm3ztMzYCyZYRzIHTmq/XsDKtsNXlwI/iJAK7DuPoez
 Mz/gY7F/9ODY5Z/ES5KksQNePKXEFqQHQHVhE/OGt9wQjk1RMQiwz08QHGdQ74BYzUdxw0JnbA
 z2c=
X-SBRS: 2.7
X-MesageID: 9658387
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,284,1571716800"; 
   d="scan'208";a="9658387"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 6 Dec 2019 11:48:43 +0000
Message-ID: <20191206114843.4028617-1-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2] CODING_STYLE: Document how to handle
 unexpected conditions
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
Content-Type: multipart/mixed; boundary="===============0255363738504089334=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============0255363738504089334==
Content-Type: text/plain; charset="true"
Content-Transfer-Encoding: 8bit

It's not always clear what the best way is to handle unexpected
conditions: whether with ASSERT(), domain_crash(), BUG_ON(), or some
other method.  All methods have a risk of introducing security
vulnerabilities and unnecessary instabilities to production systems.

Provide guidelines for different options and when to use them.

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---
v2:
- Clarify meaning of "or" clause
- Add domain_crash as an option
- Make it clear that ASSERT() is not an error handling mechanism.

CC: Ian Jackson <ian.jackson@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Konrad Wilk <konrad.wilk@oracle.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien.grall@arm.com>
---
 CODING_STYLE | 83 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/CODING_STYLE b/CODING_STYLE
index 810b71c16d..a205e4f5f5 100644
--- a/CODING_STYLE
+++ b/CODING_STYLE
@@ -133,3 +133,86 @@ the end of files.  It should be:
  * indent-tabs-mode: nil
  * End:
  */
+
+Handling unexpected conditions
+------------------------------
+
+GUIDELINES:
+
+Passing errors up the stack should be used when the caller is already
+expecting to handle errors, and the state when the error was
+discovered isn’t broken, or too isn't hard to fix.
+
+domain_crash() should be used when passing errors up the stack is too
+difficult, and/or when fixing up state of a guest is impractical, but
+where fixing up the state of Xen will allow Xen to continue running.
+
+BUG_ON() should be used when you can’t pass errors up the stack, and
+either continuing or crashing the guest would likely cause an
+information leak or privilege escalation vulnerability.
+
+ASSERT() IT IS NOT AN ERROR HANDLING MECHANISM.  ASSERT is a way to
+move detection of a bug earlier in the programming cycle.  It should
+only added after one of the other three error-handling mechanisms has
+been evaluated for reliability and security.
+
+RATIONALE:
+
+It's frequently the case that code is writen with the assumption that
+certain conditions can never happen.  There are several possible
+actions programmers can take in these situations:
+
+* Programmers can simply not handle those cases in any way, other than
+perhaps to write a comment documenting what the assumption is.
+
+* Programmers can try to handle the case gracefully -- fixing up
+in-progress state and returning an error to the user.
+
+* Programmers can crash the guest.
+
+* Programmers can use ASSERT(), which will cause the check to be
+executed in DEBUG builds, and cause the hypervisor to crash if it's
+violated
+
+* Programmers can use BUG_ON(), which will cause the check to be
+executed in both DEBUG and non-DEBUG builds, and cause the hypervisor
+to crash if it's violated.
+
+In selecting which response to use, we want to achieve several goals:
+
+- To minimize risk of introducing security vulnerabilities,
+  particularly as the code evolves over time
+
+- To efficiently spend programmer time
+
+- To detect violations of assumptions as early as possible
+
+- To minimize the impact of bugs on production use cases
+
+The guidelines above attempt to balance these:
+
+- When the caller is expecting to handle errors, and there are no
+broken state at the time the unexpected condition is discovered, or
+when fixing the state is straightforward, then fixing up the state and
+returning an error is the most robust thing to do.  However, if the
+caller isn't expecting to handle errors, or if the state is difficult
+to fix, then returning an error may require extensive refactoring,
+which is not a good use of programmer time when they're certain that
+this condition cannot occur.
+
+- BUG_ON() will stop all hypervisor action immediately.  In situations
+where continuing might allow an attacker to escalate privilege, a
+BUG_ON() can change a privilege escalation or information leak into a
+denial-of-service (an improvement).  But in situations where
+continuing (say, returning an error) might be safe, then BUG_ON() can
+change a benign failure into denial-of-service (a degradation)
+
+- ASSERT() will stop the hypervisor during development, but allow
+hypervisor action to continue during production.  In situations where
+continuing will at worst result in a denial-of-service, and at best
+may have little effect other than perhaps quirky behavior, using an
+ASSERT() will allow violation of assumptions to be detected as soon as
+possible, while not causing undue degradation in production
+hypervisors.  However, in situations where continuing could cause
+privilege escalation or information leaks, using an ASSERT() can
+introduce security vulnerabilities.
-- 
2.24.0



--===============0255363738504089334==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0255363738504089334==--
