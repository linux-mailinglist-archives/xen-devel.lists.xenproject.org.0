Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A060D116C4D
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 12:32:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieHEn-0006nw-GP; Mon, 09 Dec 2019 11:30:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4FL1=Z7=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1ieHEl-0006lS-NE
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 11:29:59 +0000
X-Inumbo-ID: 3b13e10c-1a77-11ea-a914-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b13e10c-1a77-11ea-a914-bc764e2007e4;
 Mon, 09 Dec 2019 11:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575890998;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FQshkam9mS9XLa7hgProPVgIouOsOQW2rhlRekxHIaY=;
 b=XQ3C/4pjwwJMn9d1nu6RclPnNA4SeIAnq/hxRKFWegr/fmE3Z4kBbkG4
 aAv2YYAQI7xEOJtm9luEnP9LEDxdzD7gjbE8DnQFAVd1akr95+e5hS60a
 epYOgyOak2TqNhaBH2flhkB75MLdvtlmiUpb4aF0DBdOd0GJ5ByBZtjf1 U=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: JaCJZNvZoJannIRkb4IT01Wgpfdr061QEgkHq9vQoG1OADtZwJvtOaYDiihs+57HTJICQ4/Qil
 RdmGye1/Rzd5VgJMRNz/IUFa2tKqRyd0S5bfUzJxqeynO82d7dc6nKvVpwQIqbVH5rX2D1j8tf
 /xxMPU7tbVpT6lVIu8VhcwGDs83ONw0sSCThWz0u/GlOTp+bKu1DlwzyVzMSWsyNtLhd5i1y5H
 z8a4hQFeZJub3WOa/lP7/tD3Y/u2HneN+qB7usyegYb3bg1yGa0PiofcepPg0Snnk0YZj2ARO7
 Leo=
X-SBRS: 2.7
X-MesageID: 9800053
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,294,1571716800"; 
   d="scan'208";a="9800053"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 9 Dec 2019 11:29:54 +0000
Message-ID: <20191209112954.124169-1-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3] CODING_STYLE: Document how to handle
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
Content-Type: multipart/mixed; boundary="===============1138839871565092309=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============1138839871565092309==
Content-Type: text/plain; charset="true"
Content-Transfer-Encoding: 8bit

It's not always clear what the best way is to handle unexpected
conditions: whether with ASSERT(), domain_crash(), BUG_ON(), or some
other method.  All methods have a risk of introducing security
vulnerabilities and unnecessary instabilities to production systems.

Provide guidelines for different options and when to use them.

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---
v3:
- A number of minor edits
- Expand on domain_crash a bit.
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
 CODING_STYLE | 94 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/CODING_STYLE b/CODING_STYLE
index 810b71c16d..5ff493224b 100644
--- a/CODING_STYLE
+++ b/CODING_STYLE
@@ -133,3 +133,97 @@ the end of files.  It should be:
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
+discovered isn’t broken, or isn't too hard to fix.
+
+domain_crash() should be used when passing errors up the stack is too
+difficult, and/or when fixing up state of a guest is impractical, but
+where fixing up the state of Xen will allow Xen to continue running.
+This is particularly appropriate when the guest is exhibiting behavior
+well-behaved guest should.
+
+BUG_ON() should be used when you can’t pass errors up the stack, and
+either continuing or crashing the guest would likely cause an
+information leak or privilege escalation vulnerability.
+
+ASSERT() IS NOT AN ERROR HANDLING MECHANISM.  ASSERT is a way to move
+detection of a bug earlier in the programming cycle; it is a
+more-noticeable printk.  It should only be added after one of the
+other three error-handling mechanisms has been evaluated for
+reliability and security.
+
+RATIONALE:
+
+It's frequently the case that code is written with the assumption that
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
+- When the caller is expecting to handle errors, and there is no
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
+change a benign failure into denial-of-service (a degradation).
+
+- domain_crash() is similar to BUG_ON(), but with a more limited
+effect: it stops that domain immediately.  In situations where
+continuing might cause guest or hypervisor corruption, but destroying
+the guest allows the hypervisor to continue, this can change a more
+serious bug into a guest denial-of-service.  But in situations where
+returning an error might be safe, then domain_crash() can change a
+benign failure into a guest denial-of-service.
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



--===============1138839871565092309==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1138839871565092309==--
