Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D117DCDAC
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 14:20:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625696.975228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxofB-0001eQ-Re; Tue, 31 Oct 2023 13:20:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625696.975228; Tue, 31 Oct 2023 13:20:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxofB-0001bw-Op; Tue, 31 Oct 2023 13:20:09 +0000
Received: by outflank-mailman (input) for mailman id 625696;
 Tue, 31 Oct 2023 13:20:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N8KE=GN=citrix.com=prvs=661c0debb=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qxofB-0001bo-2m
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 13:20:09 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32e3e4db-77f0-11ee-9b0e-b553b5be7939;
 Tue, 31 Oct 2023 14:20:05 +0100 (CET)
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
X-Inumbo-ID: 32e3e4db-77f0-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1698758405;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iq6Ef0VbOyxMfbzxYV9RIs6IsM8djngVbv9hMgg7cXk=;
  b=W/RAlETqNzwmZPi9zjSn2jhHZUGu5xF/0U7cCyW6EzTnl4FphOWNzBfn
   j505NJyHNsFNBfsxNgE1w9AgfBt+eYfeT/7f6XDoNAxAllgI6JZBUPPov
   i5wX0ccbRfEgXUAygM+JhFjc94DT+VP+6gp2w0j5G3AFJ1aTDCHvanwow
   w=;
X-CSE-ConnectionGUID: doa3TLBmT+eQnMIwQ1ipjg==
X-CSE-MsgGUID: gMz08l38RQ+NiWK4aaJ1eQ==
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 127580571
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:sOAC06IIEbYTEVGqFE+R45UlxSXFcZb7ZxGr2PjKsXjdYENS1jNWn
 WsfXjrSb/yIZ2X8KIskbonnpB8BusSBxtdlHgBlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAhk/nOHvylULKs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrYwP9TlK6q4mhB5gdnPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c57BmgVy
 dgyLQxOYymFosOp+eu6Uutj05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGspM0yojx5nYz/7DLoXmuuyi2a5WDpfsF+P/oI84nTJzRw327/oWDbQUoXQGpgFxhvH/
 woq+Uz2JwNCZNjEmQC8sVStucyTlCrZAY8rQejQGvlC3wTImz175ActfUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxasnDQRRt5RGO0S8xyWx+zf5APxLnMfUjdLZdgitck3bT8nz
 FmEm5XuHzMHmKKRYWKQ8PGTtzzaESoIKW4PYwcUQA1D5MPsyKkTgxTVX5BcGai6ptTvHHf7x
 DXikcQlr+xN14hRjfz9pA2WxW30znTUcuIrzgnQVzmZyil8WM2oXoqNyEfitPdYLonMGzFto
 0M4d9iiAPEmVM/cxHPXG7hcR9lF9N7fbmeA3wQH840JsmT1oSD+J+i89RkkfC9U3tA4lSgFi
 aM5kShW/pZXdECyd65xbJnZ5y8ClvO4So2Nuhw5dLNzjnlNmOyvpnoGiba4hTyFraTVufhX1
 W2nWcitF20GLq9s0SC7QewQuZdymHFumzKLFc+klE76uVZ7WJJyYe5aWGZik8hgsfjayOkr2
 4032zS2J+V3D7SlP3i/HX87JlEWN3krba3LRzhsXrfbeGJOQThxY8I9NJt9I+SJaYwJzLaXl
 px8M2cEoGfCaYrvcFzTOyg4M+u+NXu9xFpiVRER0Z+T8yBLSe6SAG03LcJfkWUPnAC78cNJc
 g==
IronPort-HdrOrdr: A9a23:WI1NuqlBT1y1r8/64k6OvyRgv8HpDfLW3DAbv31ZSRFFG/Fw9/
 rCoB3U73/JYVcqKRUdcLW7UpVoLkmyyXcY2+cs1NSZLWzbUQmTXeJfBOLZqlWNJ8SXzIVgPM
 xbAspD4bPLbGSTjazBkXSF+9RL+qj6zEh/792usEuETmtRGt9dBx8SMHf9LqXvLjM2fqbQEv
 Cnl6x6jgvlQ1s7ROKhCEIIWuDSzue77q4PMXY9dmcaABDlt0LR1ILH
X-Talos-CUID: 9a23:3MtP2m/UA7K+qKIFQbGVv0ITE5sZVlfY8DTdGkmdKHlQEbyNS1DFrQ==
X-Talos-MUID: 9a23:q85KjgkUZAWgVI44HDGVdnptEdUws6D1WHo00rMHhOrYPCVSYjqk2WE=
X-IronPort-AV: E=Sophos;i="6.03,265,1694750400"; 
   d="scan'208";a="127580571"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH for-4.18 0/3] CHANGELOG: More 4.18 content
Date: Tue, 31 Oct 2023 13:19:51 +0000
Message-ID: <20231031131954.3310725-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Andrew Cooper (3):
  CHANGELOG: Reformat
  CHANGELOG: More 4.18 content
  CHANGELOG: Keep unstable section

 CHANGELOG.md | 44 ++++++++++++++++++++++++++++----------------
 1 file changed, 28 insertions(+), 16 deletions(-)


base-commit: 9659b2a6d73b14620e187f9c626a09323853c459
-- 
2.30.2


