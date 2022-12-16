Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C0B64F0EC
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 19:26:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464883.723420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6FP1-0006wb-RI; Fri, 16 Dec 2022 18:25:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464883.723420; Fri, 16 Dec 2022 18:25:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6FP1-0006u6-Nr; Fri, 16 Dec 2022 18:25:47 +0000
Received: by outflank-mailman (input) for mailman id 464883;
 Fri, 16 Dec 2022 18:25:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CdjE=4O=citrix.com=prvs=342889366=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1p6FP0-0006tv-Ep
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 18:25:46 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0cacc7ac-7d6f-11ed-8fd4-01056ac49cbb;
 Fri, 16 Dec 2022 19:25:44 +0100 (CET)
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
X-Inumbo-ID: 0cacc7ac-7d6f-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671215144;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SK6xSKqseYAyljVhQuyH2yP+rYs8EJtjkFWvFQgviSY=;
  b=cZe3nr4fy40GAQc2XOkQykNfjSzEfS1tMT/4b/Z63lNHcgK10Z8eEYpK
   +KyHf82OhCftcy+a0ul58YTB1EKBxpcj5UQbfdS2Vt58JW5Xcvk5mLxvw
   E6mRH7CcxL4LhW9bPG5cmm+mBGfW/S/i7R5oJ8GKx/zwFqBjUgNLJgu8e
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 88800464
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:eD6EAa8M3DOeBEqwWNGHDrUDjn6TJUtcMsCJ2f8bNWPcYEJGY0x3x
 mNKDGCOOffbYGGgL9wgPtixph8DvMTdnNNgHgRrrCs8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIx1BjOkGlA5AZnP6kV5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklC6
 6VGch8OaCml2cSf0LaGGvkro9kaeZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGM0Yn1lQ/UfrSmM+limf+dXtEr0iSpoI84nTJzRw327/oWDbQUozaFZ0NwhjEz
 o7A13bYWTwGFNW28Dii/nOyvOGVrCOqfLtHQdVU8dY12QbOlwT/EiY+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFaItwARc8BdGOo77EeK0KW8yxmdLngJSHhGctNOiSMtbWV0j
 BnTxYqvXGEx9u3OIZ6AyluKhT+sYHZPAmwEXAlaayIV5+SzsMYWkyuaG76PD5WJptHyHDjxx
 RWDoy4/m6gfgKY36kmrwbzUq2ny/8aUF2bZ8i2SBzv4tV0hOOZJcqTysTDmAeB8wJF1p7Vrl
 FwNgICg4e8HFvlhfwTdEbxWTNlFCxtoWQAwYGKD/bF7r1xBGFb5J+i8BQ2Sw283WvvogRezP
 CfuVfp5vfe/xkeCY65teJ6WAM8316XmHtmNfqmKMYMXOMkoJV/foH8GiausM4fFyRhErE3CE
 c3DLZbE4YgyV8yLMwZat89CiOR2l0jSNEvYRIzhzgTP7FZtTCf9dFvxC3PXNrpRxPrd8G3oH
 yN3a5PiJ+N3DLevPUE6MOc7cTg3EJTMLcyu+pEKKrPdfVoO9aNII6a5/I7NsrdNx8x9/tokN
 FnnMqOE4DITXUH6FDg=
IronPort-HdrOrdr: A9a23:dyk33q81/gVqBaMH6zpuk+A/I+orL9Y04lQ7vn2ZHyYlFPBw9v
 rAoB1/73XJYVkqNE3I9erwQ5VoBEmsjaKdgrN+AV7BZniAhILyFvAB0WKK+VSJJ8S9zJ8/6U
 4HSdkaNDSaNykCsS+V2mSFOudl6MSDtJi1ifvT71oFd3ARV4hQqy9lDw6ACE1/Q01jDZo9UL
 6R/NBOqTblWXl/VKWGL0hAd/XHr8fQlJrgJToPBxti1RKHiimh4qP7FR/d/hp2aVNyKblLyx
 mgr+Wo3M6ej80=
X-IronPort-AV: E=Sophos;i="5.96,249,1665460800"; 
   d="scan'208";a="88800464"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, Christian
 Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v4 06/11] tools/ocaml: add .clang-format
Date: Fri, 16 Dec 2022 18:25:15 +0000
Message-ID: <a3af11ec979d7559ba8db2d185bd51454858739d.1671214525.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1671214525.git.edwin.torok@cloud.com>
References: <cover.1671214525.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Add a .clang-format configuration that tries to match CODING_STYLE where
possible.

I was not able to express the special casing of braces after 'do'
though, this can only be controlled generally for all control
statements.
It is imperfect, but should be better than the existing bindings, which
do not follow Xen coding style.

Add this to tools/ocaml first because:
* there are relatively few C files here, and it is a good place to start with
* it'd be useful to make these follow Xen's CODING_STYLE
(which they currently do not because they use tabs for example)
* they change relatively infrequently, so shouldn't cause issues with
  backporting security fixes (could either backport the reindentation
  patch too, or use git cherry-pick with `-Xignore-space-change`)

Does not yet reformat any code.

No functional change.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
Acked-by: Christian Lindig <christian.lindig@citrix.com>
---
Changes since v1:
* change commit title to reflect this is for OCaml subtree only
* don't mention stdint.h here, that may be fixed in a different way elsewhere
* add Acked-by line
---
 tools/ocaml/.clang-format | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 tools/ocaml/.clang-format

diff --git a/tools/ocaml/.clang-format b/tools/ocaml/.clang-format
new file mode 100644
index 0000000000..7ff88ee043
--- /dev/null
+++ b/tools/ocaml/.clang-format
@@ -0,0 +1,9 @@
+BasedOnStyle: GNU
+IndentWidth: 4
+
+# override GNU to match Xen ../../CODING_STYLE more closely
+AlwaysBreakAfterDefinitionReturnType: None
+AlwaysBreakAfterReturnType: None
+SpacesInConditionalStatement: true
+SpaceBeforeParens: ControlStatements
+BreakBeforeBraces: Allman
-- 
2.34.1


