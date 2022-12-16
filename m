Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7C364F0EF
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 19:26:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464889.723485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6FPC-0000GZ-Qp; Fri, 16 Dec 2022 18:25:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464889.723485; Fri, 16 Dec 2022 18:25:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6FPC-0000Bm-Mb; Fri, 16 Dec 2022 18:25:58 +0000
Received: by outflank-mailman (input) for mailman id 464889;
 Fri, 16 Dec 2022 18:25:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CdjE=4O=citrix.com=prvs=342889366=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1p6FPA-0008JE-Go
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 18:25:56 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14374b3e-7d6f-11ed-91b6-6bf2151ebd3b;
 Fri, 16 Dec 2022 19:25:55 +0100 (CET)
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
X-Inumbo-ID: 14374b3e-7d6f-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671215155;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=671yWeRPfk0fUsd0ZZw8sPwYTi3Pa9dmLi7mGVUNfHg=;
  b=WyVKpnfLT6VZcv0O1X5oiswfAYtjVFq+qNShSsIi2P1eergdTIjF9mq2
   w0BG/pfYZrTrWAGOIL3OGb1LB0UIgfhoxUQiMo2o6NXmHZViu45nbRVhY
   3kUR6Xf9ty2vjkIY7wiCXg1YmqBCgGyafo2l+tnV+pUqs6dzsAnv98R+J
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 91288387
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:L181mqLfMTS7DoSlFE+R35UlxSXFcZb7ZxGr2PjKsXjdYENS12ZRz
 zcbWj2Pb/aDM2D0c91yOY+y8E0C7ZPcn4RiTgZlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPdwP9TlK6q4mlB5AVgPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5pIEMe6
 K0ALAwXRRHend+6z5G2TdtF05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpPE+ojx5nYz/7DLozkPmpgD/jdCdfq3qepLYt4niVxwt0uFToGIuMIIzaHpUK9qqej
 kec7k3rAxtDDdOwl2Ci3G+Pu/bkxAquDer+E5Xnr6U30TV/3Fc7GBAQEFe2v/S9okq/QM5Eb
 VwZ/DI0qqo//1DtScPyNzW0qWCJlgQRUN1RF6s98g7l4rXQyxaUAC4DVDEpVTA9nJZoH3pwj
 AbPxo63Q2w02FGIdZ6D3qm1j2OvaDAREXUpZHIecAcKwNTkkqhm23ojUe1fOKKyi9T0HxT5z
 DaLsDUyit0vsCIb60mo1QuZ2mzx//AlWiZwv1yKBTz9smuVcab/P+SVBU7nAeGsxWpzZn2Ip
 zA6lseX94ji5rndxXXWEI3h8FxEjstp0QEwY3Y1R/HNFBz3oRZPmLy8BxkgTHqFyu5eJVfUj
 Lb74Gu9HqN7MnqwdrNQaImsEcksxqWIPY27CamNNIsXM8gpKFHvEMRSiam4hjCFraTRuftnZ
 cfznTiEUx729piLPBLpHrxAgNfHNwg1xH/JRICT8vhU+eP2WZJhcp9caAHmRrlgvMu5TPD9r
 4432z2il08OD4UTo0D/reYuELz9BSRjVM2r95EJKb7rz8gPMDhJNsI9CIgJI+RN95m5XM+Rl
 p1hcie0EGbCuEA=
IronPort-HdrOrdr: A9a23:cE5k8amlqTf1MuUs0MvLeLX20dDpDfLL3DAbv31ZSRFFG/Fwwf
 re+sjztCWatN91YhsdcL+7VJVoLUmsjqKdpLNhRYtKPzOJhILLFvAE0WK4+UyDJ8SWzIc06U
 4jSdkcNDSXNykesS+Q2njALz9P+rS62ZHtrfrai09wQR1nS4wI1XYCNi+rVmVqQQFdH5owE9
 657spD4x6tY24eYMj+JnRtZYn+juyOvI/iaQQdBxYhrC2HjTbt1aXzFAKR1AofVTQK4bpKyw
 j4ewKQ3NTGjxjq8HTh61M=
X-IronPort-AV: E=Sophos;i="5.96,249,1665460800"; 
   d="scan'208";a="91288387"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, David Scott
	<dave@recoil.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Christian Lindig <christian.lindig@citrix.com>
Subject: [PATCH v4 03/11] CODING_STYLE(tools/ocaml): add 'make format' and remove tabs
Date: Fri, 16 Dec 2022 18:25:12 +0000
Message-ID: <81d621cea5975fdd9698992b968dcd7528c637af.1671214525.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1671214525.git.edwin.torok@cloud.com>
References: <cover.1671214525.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

See CODING_STYLE: Xen uses spaces, not tabs.

* OCaml code:

Using `ocp-indent` for now to just make minimal modifications in
tabs vs spaces and get the right indentation.
We can introduce `ocamlformat` later.

* C stubs:

just replace tabs with spaces now, using `indent` or `clang-format`
would change code too much for 4.17.

This avoids perpetuating a formatting style that is inconsistent with
the rest of Xen, and that makes preparing and submitting patches more
difficult (OCaml indentation tools usually only support spaces, not tabs).

No functional change.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>

--
Reason for inclusion:
- avoid perpetuating a different coding style (I thought tabs were
  mandated by Xen, and was about to fix up my editor config to match
  when I realized Xen already mandates the use of spaces)
- should make submitting patches for OCaml easier (OCaml indentation
  tools know only about spaces, so I either can't use them, or have to
  manually adjust indentation every time I submit a patch)
- it can be verified that the only change here is the Makefile change
  for the new rule, 'git log -p -1 -w' should be otherwise empty

Changes since v3:
- this didn't make it into 4.17.0, we'll reconsider for 4.17.1, for now
  apply just to master which is open again
- separate introducing the rule from actual reformatting

Cc: Christian Lindig <christian.lindig@citrix.com>
---
 tools/ocaml/Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/ocaml/Makefile b/tools/ocaml/Makefile
index a7c04b6546..274ba15d75 100644
--- a/tools/ocaml/Makefile
+++ b/tools/ocaml/Makefile
@@ -34,3 +34,8 @@ build-tools-oxenstored:
 	$(MAKE) -s -C libs/xb
 	$(MAKE) -s -C libs/xc
 	$(MAKE) -C xenstored
+
+.PHONY: format
+format:
+	git ls-files '*.ml' '*.mli' | xargs -n1 ocp-indent -i
+	git ls-files '*.c' '*.h' | xargs -n1 sed -ie 's/\t/    /g'
-- 
2.34.1


