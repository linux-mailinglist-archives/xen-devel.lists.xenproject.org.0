Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF95F217474
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jul 2020 18:51:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsqo9-0000F3-DE; Tue, 07 Jul 2020 16:51:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gwtg=AS=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1jsqo8-0000Dr-22
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2020 16:51:00 +0000
X-Inumbo-ID: 05964c12-c072-11ea-8496-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 05964c12-c072-11ea-8496-bc764e2007e4;
 Tue, 07 Jul 2020 16:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594140653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tfYdRm061SMd4nDtfstsQpb4KLifF83vlL7jhH/NxAw=;
 b=aqalNxokzJJMU6DCOQCyRYjgpHSlmK50s1VzpXX9wESmQyGpiVezToCpdsr5mwB0InYXzg
 lYUHH+lnxohvdNYiWGg6CI2QZ5IzdAj+XuUiqyIAwP3bRxqtzY+yuSHvhd+4ZCzV1nODua
 09f+uAX4HDXOI+35FyrEQW6C5XyQYpo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-jgdjWGplOOuWAbWVG03AkQ-1; Tue, 07 Jul 2020 12:50:48 -0400
X-MC-Unique: jgdjWGplOOuWAbWVG03AkQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8A9191177;
 Tue,  7 Jul 2020 16:50:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C55160E1C;
 Tue,  7 Jul 2020 16:50:40 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 21DD71132922; Tue,  7 Jul 2020 18:50:37 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v12 2/8] scripts: Coccinelle script to use
 ERRP_AUTO_PROPAGATE()
Date: Tue,  7 Jul 2020 18:50:31 +0200
Message-Id: <20200707165037.1026246-3-armbru@redhat.com>
In-Reply-To: <20200707165037.1026246-1-armbru@redhat.com>
References: <20200707165037.1026246-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, vsementsov@virtuozzo.com,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Laszlo Ersek <lersek@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, groug@kaod.org,
 Max Reitz <mreitz@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Script adds ERRP_AUTO_PROPAGATE macro invocation where appropriate and
does corresponding changes in code (look for details in
include/qapi/error.h)

Usage example:
spatch --sp-file scripts/coccinelle/auto-propagated-errp.cocci \
 --macro-file scripts/cocci-macro-file.h --in-place --no-show-diff \
 --max-width 80 FILES...

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/coccinelle/auto-propagated-errp.cocci | 337 ++++++++++++++++++
 include/qapi/error.h                          |   3 +
 MAINTAINERS                                   |   1 +
 3 files changed, 341 insertions(+)
 create mode 100644 scripts/coccinelle/auto-propagated-errp.cocci

diff --git a/scripts/coccinelle/auto-propagated-errp.cocci b/scripts/coccinelle/auto-propagated-errp.cocci
new file mode 100644
index 0000000000..c29f695adf
--- /dev/null
+++ b/scripts/coccinelle/auto-propagated-errp.cocci
@@ -0,0 +1,337 @@
+// Use ERRP_AUTO_PROPAGATE (see include/qapi/error.h)
+//
+// Copyright (c) 2020 Virtuozzo International GmbH.
+//
+// This program is free software; you can redistribute it and/or
+// modify it under the terms of the GNU General Public License as
+// published by the Free Software Foundation; either version 2 of the
+// License, or (at your option) any later version.
+//
+// This program is distributed in the hope that it will be useful,
+// but WITHOUT ANY WARRANTY; without even the implied warranty of
+// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+// GNU General Public License for more details.
+//
+// You should have received a copy of the GNU General Public License
+// along with this program.  If not, see
+// <http://www.gnu.org/licenses/>.
+//
+// Usage example:
+// spatch --sp-file scripts/coccinelle/auto-propagated-errp.cocci \
+//  --macro-file scripts/cocci-macro-file.h --in-place \
+//  --no-show-diff --max-width 80 FILES...
+//
+// Note: --max-width 80 is needed because coccinelle default is less
+// than 80, and without this parameter coccinelle may reindent some
+// lines which fit into 80 characters but not to coccinelle default,
+// which in turn produces extra patch hunks for no reason.
+
+// Switch unusual Error ** parameter names to errp
+// (this is necessary to use ERRP_AUTO_PROPAGATE).
+//
+// Disable optional_qualifier to skip functions with
+// "Error *const *errp" parameter.
+//
+// Skip functions with "assert(_errp && *_errp)" statement, because
+// that signals unusual semantics, and the parameter name may well
+// serve a purpose. (like nbd_iter_channel_error()).
+//
+// Skip util/error.c to not touch, for example, error_propagate() and
+// error_propagate_prepend().
+@ depends on !(file in "util/error.c") disable optional_qualifier@
+identifier fn;
+identifier _errp != errp;
+@@
+
+ fn(...,
+-   Error **_errp
++   Error **errp
+    ,...)
+ {
+(
+     ... when != assert(_errp && *_errp)
+&
+     <...
+-    _errp
++    errp
+     ...>
+)
+ }
+
+// Add invocation of ERRP_AUTO_PROPAGATE to errp-functions where
+// necessary
+//
+// Note, that without "when any" the final "..." does not mach
+// something matched by previous pattern, i.e. the rule will not match
+// double error_prepend in control flow like in
+// vfio_set_irq_signaling().
+//
+// Note, "exists" says that we want apply rule even if it does not
+// match on all possible control flows (otherwise, it will not match
+// standard pattern when error_propagate() call is in if branch).
+@ disable optional_qualifier exists@
+identifier fn, local_err;
+symbol errp;
+@@
+
+ fn(..., Error **errp, ...)
+ {
++   ERRP_AUTO_PROPAGATE();
+    ...  when != ERRP_AUTO_PROPAGATE();
+(
+(
+    error_append_hint(errp, ...);
+|
+    error_prepend(errp, ...);
+|
+    error_vprepend(errp, ...);
+)
+    ... when any
+|
+    Error *local_err = NULL;
+    ...
+(
+    error_propagate_prepend(errp, local_err, ...);
+|
+    error_propagate(errp, local_err);
+)
+    ...
+)
+ }
+
+// Warn when several Error * definitions are in the control flow.
+// This rule is not chained to rule1 and less restrictive, to cover more
+// functions to warn (even those we are not going to convert).
+//
+// Note, that even with one (or zero) Error * definition in the each
+// control flow we may have several (in total) Error * definitions in
+// the function. This case deserves attention too, but I don't see
+// simple way to match with help of coccinelle.
+@check1 disable optional_qualifier exists@
+identifier fn, _errp, local_err, local_err2;
+position p1, p2;
+@@
+
+ fn(..., Error **_errp, ...)
+ {
+     ...
+     Error *local_err = NULL;@p1
+     ... when any
+     Error *local_err2 = NULL;@p2
+     ... when any
+ }
+
+@ script:python @
+fn << check1.fn;
+p1 << check1.p1;
+p2 << check1.p2;
+@@
+
+print('Warning: function {} has several definitions of '
+      'Error * local variable: at {}:{} and then at {}:{}'.format(
+          fn, p1[0].file, p1[0].line, p2[0].file, p2[0].line))
+
+// Warn when several propagations are in the control flow.
+@check2 disable optional_qualifier exists@
+identifier fn, _errp;
+position p1, p2;
+@@
+
+ fn(..., Error **_errp, ...)
+ {
+     ...
+(
+     error_propagate_prepend(_errp, ...);@p1
+|
+     error_propagate(_errp, ...);@p1
+)
+     ...
+(
+     error_propagate_prepend(_errp, ...);@p2
+|
+     error_propagate(_errp, ...);@p2
+)
+     ... when any
+ }
+
+@ script:python @
+fn << check2.fn;
+p1 << check2.p1;
+p2 << check2.p2;
+@@
+
+print('Warning: function {} propagates to errp several times in '
+      'one control flow: at {}:{} and then at {}:{}'.format(
+          fn, p1[0].file, p1[0].line, p2[0].file, p2[0].line))
+
+// Match functions with propagation of local error to errp.
+// We want to refer these functions in several following rules, but I
+// don't know a proper way to inherit a function, not just its name
+// (to not match another functions with same name in following rules).
+// Not-proper way is as follows: rename errp parameter in functions
+// header and match it in following rules. Rename it back after all
+// transformations.
+//
+// The common case is a single definition of local_err with at most one
+// error_propagate_prepend() or error_propagate() on each control-flow
+// path. Functions with multiple definitions or propagates we want to
+// examine manually. Rules check1 and check2 emit warnings to guide us
+// to them.
+//
+// Note that we match not only this "common case", but any function,
+// which has the "common case" on at least one control-flow path.
+@rule1 disable optional_qualifier exists@
+identifier fn, local_err;
+symbol errp;
+@@
+
+ fn(..., Error **
+-    errp
++    ____
+    , ...)
+ {
+     ...
+     Error *local_err = NULL;
+     ...
+(
+     error_propagate_prepend(errp, local_err, ...);
+|
+     error_propagate(errp, local_err);
+)
+     ...
+ }
+
+// Convert special case with goto separately.
+// I tried merging this into the following rule the obvious way, but
+// it made Coccinelle hang on block.c
+//
+// Note interesting thing: if we don't do it here, and try to fixup
+// "out: }" things later after all transformations (the rule will be
+// the same, just without error_propagate() call), coccinelle fails to
+// match this "out: }".
+@ disable optional_qualifier@
+identifier rule1.fn, rule1.local_err, out;
+symbol errp;
+@@
+
+ fn(..., Error ** ____, ...)
+ {
+     <...
+-    goto out;
++    return;
+     ...>
+- out:
+-    error_propagate(errp, local_err);
+ }
+
+// Convert most of local_err related stuff.
+//
+// Note, that we inherit rule1.fn and rule1.local_err names, not
+// objects themselves. We may match something not related to the
+// pattern matched by rule1. For example, local_err may be defined with
+// the same name in different blocks inside one function, and in one
+// block follow the propagation pattern and in other block doesn't.
+//
+// Note also that errp-cleaning functions
+//   error_free_errp
+//   error_report_errp
+//   error_reportf_errp
+//   warn_report_errp
+//   warn_reportf_errp
+// are not yet implemented. They must call corresponding Error* -
+// freeing function and then set *errp to NULL, to avoid further
+// propagation to original errp (consider ERRP_AUTO_PROPAGATE in use).
+// For example, error_free_errp may look like this:
+//
+//    void error_free_errp(Error **errp)
+//    {
+//        error_free(*errp);
+//        *errp = NULL;
+//    }
+@ disable optional_qualifier exists@
+identifier rule1.fn, rule1.local_err;
+expression list args;
+symbol errp;
+@@
+
+ fn(..., Error ** ____, ...)
+ {
+     <...
+(
+-    Error *local_err = NULL;
+|
+
+// Convert error clearing functions
+(
+-    error_free(local_err);
++    error_free_errp(errp);
+|
+-    error_report_err(local_err);
++    error_report_errp(errp);
+|
+-    error_reportf_err(local_err, args);
++    error_reportf_errp(errp, args);
+|
+-    warn_report_err(local_err);
++    warn_report_errp(errp);
+|
+-    warn_reportf_err(local_err, args);
++    warn_reportf_errp(errp, args);
+)
+?-    local_err = NULL;
+
+|
+-    error_propagate_prepend(errp, local_err, args);
++    error_prepend(errp, args);
+|
+-    error_propagate(errp, local_err);
+|
+-    &local_err
++    errp
+)
+     ...>
+ }
+
+// Convert remaining local_err usage. For example, different kinds of
+// error checking in if conditionals. We can't merge this into
+// previous hunk, as this conflicts with other substitutions in it (at
+// least with "- local_err = NULL").
+@ disable optional_qualifier@
+identifier rule1.fn, rule1.local_err;
+symbol errp;
+@@
+
+ fn(..., Error ** ____, ...)
+ {
+     <...
+-    local_err
++    *errp
+     ...>
+ }
+
+// Always use the same pattern for checking error
+@ disable optional_qualifier@
+identifier rule1.fn;
+symbol errp;
+@@
+
+ fn(..., Error ** ____, ...)
+ {
+     <...
+-    *errp != NULL
++    *errp
+     ...>
+ }
+
+// Revert temporary ___ identifier.
+@ disable optional_qualifier@
+identifier rule1.fn;
+@@
+
+ fn(..., Error **
+-   ____
++   errp
+    , ...)
+ {
+     ...
+ }
diff --git a/include/qapi/error.h b/include/qapi/error.h
index c865a7d2f1..91547fe4ea 100644
--- a/include/qapi/error.h
+++ b/include/qapi/error.h
@@ -264,6 +264,9 @@
  *         }
  *         ...
  *     }
+ *
+ * For mass-conversion, use script
+ *   scripts/coccinelle/auto-propagated-errp.cocci
  */
 
 #ifndef ERROR_H
diff --git a/MAINTAINERS b/MAINTAINERS
index c31c878c63..121953b24d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2166,6 +2166,7 @@ F: scripts/coccinelle/error-use-after-free.cocci
 F: scripts/coccinelle/error_propagate_null.cocci
 F: scripts/coccinelle/remove_local_err.cocci
 F: scripts/coccinelle/use-error_fatal.cocci
+F: scripts/coccinelle/auto-propagated-errp.cocci
 
 GDB stub
 M: Alex Bennée <alex.bennee@linaro.org>
-- 
2.26.2


