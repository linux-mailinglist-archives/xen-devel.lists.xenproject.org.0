Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 102EA7DCDAE
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 14:20:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625699.975257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxofF-0002QJ-Lj; Tue, 31 Oct 2023 13:20:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625699.975257; Tue, 31 Oct 2023 13:20:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxofF-0002Nj-J5; Tue, 31 Oct 2023 13:20:13 +0000
Received: by outflank-mailman (input) for mailman id 625699;
 Tue, 31 Oct 2023 13:20:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N8KE=GN=citrix.com=prvs=661c0debb=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qxofD-0001bo-I6
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 13:20:11 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 361c5d0f-77f0-11ee-9b0e-b553b5be7939;
 Tue, 31 Oct 2023 14:20:09 +0100 (CET)
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
X-Inumbo-ID: 361c5d0f-77f0-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1698758409;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=H+Q30HMrWjJaZC00sLj+OmZFAlKnx4f9E66ZOhOBbQQ=;
  b=CpJcJoue0UK9cPQSM3y4NHZON9Kc2SeEyYlIkpWjD2fdCl2JpMpIrDAC
   7FxwHa2G3N1C0jNbjaJ+feyVNWJVg5NGEZx5ZQGymYgO6xPE2MYqSg00s
   1BUK7XyIHVuQpmV1Hg0o0ByGC0CZxtHmLUIA6pPwUpE4iPx72aHwURjVp
   g=;
X-CSE-ConnectionGUID: 6pNHE+2jTxipSSOO/9v0tA==
X-CSE-MsgGUID: E3PqqUTuQKqVsIwXMsxBuA==
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 127136997
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:pH9dy6JWbTUWkDmaFE+R4pUlxSXFcZb7ZxGr2PjKsXjdYENShjdVz
 WAbDG2FafnfMGGgeo1yYI+z80tSsJ7WmNBhTwJlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAhk/nOHvylULKs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrYwP9TlK6q4mhB5gdnPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c4pGUdu2
 L9CKgwdbwi4vMWRh+OlEvVF05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGspM0yojx5nYz/7DLoXmuuyi2a5WDpfsF+P/oI84nTJzRw327/oWDbQUoXQGpwOwBfJ+
 Qoq+UzUWSkDLeGj1AOm60y3p/D/uDjrcp87QejQGvlC3wTImz175ActfUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxasnDQRRt5RGO0S8xyWx+zf5APxLnMfUjdLZdgitck3bT8nz
 FmEm5XuHzMHmKKRYWKQ8PGTtzzaESoIKW4PYwcUQA1D5MPsyKkTgxTVX5BcGai6ptTvHHf7x
 DXikcQlr+xN14hRjfz9pA2WxW30znTUcuIrzlvPeEKIrVl7WJ6kf7eTzn+cvOgYMK/MGzFto
 0M4d9iiAPEmVM/cxHPXG7hcR9lF9N7fbmeA3wQH840JsmT1oSD+J+i89RkkfC9U3tA4lSgFi
 aM5kShW/pZXdECyd65xbJnZ5y8ClvO4So2Nuhw5dLNzjnlNmOyvpnoGiba4hTyFraTVufhX1
 W2nWcitF20GLq9s0SC7QewQuZdymHFumzKLFc+klE76uVZ7WJJyYe5aWGZik8hgsfjayOkr2
 4032zS2J+V3D7SlP3i/HX87JlEWN3krba3LRzhsXrfbeGJOQThxY8I9NJt9I+SJaYwJzLaXl
 px8M2cEoGfCaYrvcFzTOyg4M+u+NXu9xFpiVRER0Z+T8yBLSe6SAG03K/PboZFPGDRf8MNJ
IronPort-HdrOrdr: A9a23:Xwo54q7mEvTygqkR8gPXwP7XdLJyesId70hD6qkXc20vTiX4rb
 HXoB1/73XJYVkqOU3I5urwXpVoLUmyyXcN2/h3AV7AZniFhILLFvAH0WK4+UyYJ8SWzIc0uZ
 uIFZIOa+EYZWIQsS+Q2meF+rgboOVvoJrEuQ+dp00dKD1XVw==
X-Talos-CUID: 9a23:9g9VH2A3zE2ZAV36E3d/0m45WZonTm3c1EzrBGj/WHgxVJTAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3ABQa+2Q/zDXMP0vxDR6/WHiiQf+oz2723NXwQqLY?=
 =?us-ascii?q?fhdKlKhxVICe3kR3iFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.03,265,1694750400"; 
   d="scan'208";a="127136997"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH for-4.19 3/3] CHANGELOG: Keep unstable section
Date: Tue, 31 Oct 2023 13:19:54 +0000
Message-ID: <20231031131954.3310725-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231031131954.3310725-1-andrew.cooper3@citrix.com>
References: <20231031131954.3310725-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Henry Wang <Henry.Wang@arm.com>
---
 CHANGELOG.md | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index a827054cf27d..cf0c9c3f8cb9 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -4,6 +4,8 @@ Notable changes to Xen will be documented in this file.
 
 The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 
+## [unstable UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
+
 ## [4.18.0](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.18.0) - 2023-XX-XX
 
 ### Changed
-- 
2.30.2


