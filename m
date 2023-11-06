Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C6B7E2753
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 15:43:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628094.979197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r00pL-0000Vx-Rb; Mon, 06 Nov 2023 14:43:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628094.979197; Mon, 06 Nov 2023 14:43:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r00pL-0000R1-Op; Mon, 06 Nov 2023 14:43:43 +0000
Received: by outflank-mailman (input) for mailman id 628094;
 Mon, 06 Nov 2023 14:43:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wwoJ=GT=infradead.org=prvs=667a8cc2a=dwmw2@srs-se1.protection.inumbo.net>)
 id 1r00i9-0008Lv-3N
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 14:36:17 +0000
Received: from smtp-fw-52002.amazon.com (smtp-fw-52002.amazon.com
 [52.119.213.150]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7123974-7cb1-11ee-98da-6d05b1d4d9a1;
 Mon, 06 Nov 2023 15:36:16 +0100 (CET)
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-pdx-2a-m6i4x-1197e3af.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-52002.iad7.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 14:36:13 +0000
Received: from smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev
 (pdx2-ws-svc-p26-lb5-vlan2.pdx.amazon.com [10.39.38.66])
 by email-inbound-relay-pdx-2a-m6i4x-1197e3af.us-west-2.amazon.com (Postfix)
 with ESMTPS id 1D23922B010; Mon,  6 Nov 2023 14:36:09 +0000 (UTC)
Received: from EX19MTAUWA002.ant.amazon.com [10.0.38.20:26365]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.37.121:2525]
 with esmtp (Farcaster)
 id e345a6ca-52b1-4100-bbdc-3568478e064d; Mon, 6 Nov 2023 14:36:09 +0000 (UTC)
Received: from EX19MTAUWB001.ant.amazon.com (10.250.64.248) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Mon, 6 Nov 2023 14:36:04 +0000
Received: from u3832b3a9db3152.ant.amazon.com (10.106.83.6) by
 mail-relay.amazon.com (10.250.64.254) with Microsoft SMTP Server id
 15.2.1118.39 via Frontend Transport; Mon, 6 Nov 2023 14:36:01 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: d7123974-7cb1-11ee-98da-6d05b1d4d9a1
X-IronPort-AV: E=Sophos;i="6.03,281,1694736000"; 
   d="scan'208";a="593337518"
X-Farcaster-Flow-ID: e345a6ca-52b1-4100-bbdc-3568478e064d
From: David Woodhouse <dwmw2@infradead.org>
To: <qemu-devel@nongnu.org>
CC: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, Paul
 Durrant <paul@xen.org>, =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?=
	<marcandre.lureau@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Eduardo Habkost
	<eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Jason Wang <jasowang@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>, <qemu-block@nongnu.org>,
	<xen-devel@lists.xenproject.org>, <kvm@vger.kernel.org>
Subject: [PATCH v4 16/17] doc/sphinx/hxtool.py: add optional label argument to SRST directive
Date: Mon, 6 Nov 2023 14:35:06 +0000
Message-ID: <20231106143507.1060610-17-dwmw2@infradead.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231106143507.1060610-1-dwmw2@infradead.org>
References: <20231106143507.1060610-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: Bulk

From: David Woodhouse <dwmw@amazon.co.uk>

We can't just embed labels directly into files like qemu-options.hx which
are included from multiple top-level RST files, because Sphinx sees the
labels as duplicate: https://github.com/sphinx-doc/sphinx/issues/9707

So add an 'emitrefs' option to the Sphinx hxtool-doc directive, which is
set only in invocation.rst and not from the HTML rendition of the man
page. Along with an argument to the SRST directive which causes a label
of the form '.. _LABEL-reference-label:' to be emitted when the emitrefs
option is set.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 docs/sphinx/hxtool.py      | 18 +++++++++++++++++-
 docs/system/invocation.rst |  1 +
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/docs/sphinx/hxtool.py b/docs/sphinx/hxtool.py
index 9f6b9d87dc..bfb0929573 100644
--- a/docs/sphinx/hxtool.py
+++ b/docs/sphinx/hxtool.py
@@ -78,18 +78,28 @@ def parse_archheading(file, lnum, line):
         serror(file, lnum, "Invalid ARCHHEADING line")
     return match.group(1)
 
+def parse_srst(file, lnum, line):
+    """Handle an SRST directive"""
+    # The input should be "SRST(label)".
+    match = re.match(r'SRST\((.*?)\)', line)
+    if match is None:
+        serror(file, lnum, "Invalid SRST line")
+    return match.group(1)
+
 class HxtoolDocDirective(Directive):
     """Extract rST fragments from the specified .hx file"""
     required_argument = 1
     optional_arguments = 1
     option_spec = {
-        'hxfile': directives.unchanged_required
+        'hxfile': directives.unchanged_required,
+        'emitrefs': directives.flag
     }
     has_content = False
 
     def run(self):
         env = self.state.document.settings.env
         hxfile = env.config.hxtool_srctree + '/' + self.arguments[0]
+        emitrefs = "emitrefs" in self.options
 
         # Tell sphinx of the dependency
         env.note_dependency(os.path.abspath(hxfile))
@@ -113,6 +123,12 @@ def run(self):
                         serror(hxfile, lnum, 'expected ERST, found SRST')
                     else:
                         state = HxState.RST
+                        if emitrefs and line != "SRST":
+                            label = parse_srst(hxfile, lnum, line)
+                            if label != "":
+                                rstlist.append("", hxfile, lnum - 1)
+                                refline = ".. _" + label + "-reference-label:"
+                                rstlist.append(refline, hxfile, lnum - 1)
                 elif directive == 'ERST':
                     if state == HxState.CTEXT:
                         serror(hxfile, lnum, 'expected SRST, found ERST')
diff --git a/docs/system/invocation.rst b/docs/system/invocation.rst
index 4ba38fc23d..ef75dad2e2 100644
--- a/docs/system/invocation.rst
+++ b/docs/system/invocation.rst
@@ -11,6 +11,7 @@ disk_image is a raw hard disk image for IDE hard disk 0. Some targets do
 not need a disk image.
 
 .. hxtool-doc:: qemu-options.hx
+    :emitrefs:
 
 Device URL Syntax
 ~~~~~~~~~~~~~~~~~
-- 
2.34.1


