Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E88E1640557
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 11:57:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451790.709572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p13ip-0004Ac-0h; Fri, 02 Dec 2022 10:56:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451790.709572; Fri, 02 Dec 2022 10:56:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p13io-000478-Tn; Fri, 02 Dec 2022 10:56:46 +0000
Received: by outflank-mailman (input) for mailman id 451790;
 Fri, 02 Dec 2022 10:56:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Iy3=4A=citrix.com=prvs=3285f5271=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1p13im-0003rQ-RP
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 10:56:44 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ffb426cf-722f-11ed-91b6-6bf2151ebd3b;
 Fri, 02 Dec 2022 11:56:42 +0100 (CET)
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
X-Inumbo-ID: ffb426cf-722f-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669978602;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Kvmroc4UWt6I3gO1OX/SxhaVKAh4s5W8paVaKox+rwU=;
  b=dMxxnxDUCjAVTg1Cj8joz8HqRCzIc0D14BjacK8ijsDzblSTyUf8PuG9
   DrRyyM9iW0HmH5F7eX7L6ZpLjEw7Lwp0mAkTyRkdQo4SZpOJQIocajy0B
   3Js/s+r3TRngq5VsbjsmShdkGhqviFQ+jM181qnBRGeZZHGLFFUp+2jkC
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 86240592
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:lyG66qJ526X53XfKFE+R4pUlxSXFcZb7ZxGr2PjKsXjdYENS0DZTx
 zMZWj/TMvaCamOjcth2YNmx9hkGvJ+Ey4MyTQVlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPdwP9TlK6q4mlB5ARkPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c4nOzgWt
 q0iDwkUVRqlnvmWx7GqV/Zj05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpPE+ojx5nYz/7DLozkPmpgD/jdCdfq3qepLYt4niVxwt0uFToGIqLIIDSGJQP9qqej
 nn9p1/AXg8TDcC8mWSL3kqPn8HSuQquDer+E5Xnr6U30TV/3Fc7CgASVFa9iem0jAi5Qd03A
 1MQ0jojq+417kPDZsLmQxSyrXqAvxgdc9ldCes37EeK0KW8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq19L2ZsDezMig9NnIZaGkPSg5t3jX4iNht1FSVFI8lSfPryI2ucd3t/
 9yUhHgE3u1Q3PQs7ryA93bemBKrpYnUUQFgs207QVmZxg9+YYekYamh5l7a8etMIe6lc7WRg
 JQXs5PAtb5TVPlhgATIGbxQR+/xu55pJRWG2TZS848dGyNBEpJJVaRZ+3lAKUhgKa7okhe5M
 RaI6Wu9CHK+VUZGjJObgarrU6zGLoC6T7wJs8w4ifIQCqWdjCfdoElTibe4hggBanQEn6AlI
 ou8es2xF3scAqkP5GPoGbZMiO51n3tgnD67qXXHI/OPiOr2WZJoYe1dbAvmgh4Rs8toXzk5A
 /4AbpDXmn2zocX1YzXN8J57ELz5BSFTOHwCkOQOLrTrClM/SAkc5wr5netJl3pNw/4EyY8lP
 xiVBidl9bYIrSaYc1jaMC04NumHsFQWhStTABHA9G2AgxALCbtDJo9OKvPboZFPGDRf8MNJ
IronPort-HdrOrdr: A9a23:7IxO8qo6e8hvFRPCEtX1cZQaV5rveYIsimQD101hICG9Evb0qy
 nOpoV/6faQslwssR4b9uxoVJPvfZq+z+8W3WByB9eftWDd0QPFEGgL1+DfKlbbak7DH4BmtJ
 uJc8JFeafN5VoRt7eG3OFveexQvOVu88qT9JjjJ28Gd3APV0n5hT0JcjpyFCdNNW57LKt8Lr
 WwzOxdqQGtfHwGB/7LfUXsD4D41rv2fIuNW29+OyIa
X-IronPort-AV: E=Sophos;i="5.96,212,1665460800"; 
   d="scan'208";a="86240592"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v2 1/4] CODING-STYLE: add .editorconfig to clarify indentation uses spaces
Date: Fri, 2 Dec 2022 10:55:56 +0000
Message-ID: <01afbbbc15332aedcdccba75cb1f5edd538c4492.1669978356.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1669978356.git.edvin.torok@citrix.com>
References: <cover.1669978356.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Add an .editorconfig to make it easier to keep patches compatible with
Xen's coding style, and to reemphasize what Xen's coding style is.

I thought that Xen demands tabs rather than spaces (which is more
difficult with OCaml because indentation tools use spaces,
and the use of tabs requires changing editor settings),
however CODING-STYLE says it is spaces.

Document this explicitly by adding a .editorconfig file (see editorconfig.org),
which is an editor agnostic format for specifying basic style properties like
indentation, either with native support in editors or via plugins.

It is safer than modelines because it only supports controlling a
restricted set of editor properties and not arbitrary commands as Vim
modelines would have, and works with editors other than Vim too.
(Vim has a deny list for modeline sandboxing, which is error-prone
because every time a new command gets added it needs to be added to the
deny list, which has been the source of a few CVEs in the past
and I disable Vim modelines everywhere as a precaution).

This file is added as a convenience for those who might have an editor
that supports it, and its presence should have no impact on those that
do not (want to) use it.
It also won't cause re-indentation of existing files when edited, only
newly added lines would follow the convention.

No functional change.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 .editorconfig | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 .editorconfig

diff --git a/.editorconfig b/.editorconfig
new file mode 100644
index 0000000000..cb2f27c581
--- /dev/null
+++ b/.editorconfig
@@ -0,0 +1,20 @@
+# See ./CODING_STYLE
+root = true
+
+[*]
+end_of_line = lf
+indent_style = space
+charset = utf-8
+max_line_length = 79
+trim_trailing_whitespace = true
+insert_final_newline = true
+
+# Makefiles must use tabs, otherwise they don't work
+[{Makefile,*.mk,Makefile.rules}]
+indent_style = tabs
+
+[*.{c,h}]
+indent_size = 4
+
+[*.{ml,mli}]
+indent_size = 2
-- 
2.34.1


