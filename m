Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9EE213743
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jul 2020 11:09:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrHga-0005Jc-5h; Fri, 03 Jul 2020 09:08:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rI2g=AO=virtuozzo.com=vsementsov@srs-us1.protection.inumbo.net>)
 id 1jrHgY-0005Ii-HI
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2020 09:08:42 +0000
X-Inumbo-ID: c4b43b69-bd0c-11ea-8952-12813bfff9fa
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.123]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c4b43b69-bd0c-11ea-8952-12813bfff9fa;
 Fri, 03 Jul 2020 09:08:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aee0vzM9qW6oADLGgvgy1bQl4F3f4D+nUPDWAKKGadm5xSQ8DvnFDlvzpSvzgjtOAfdYN2HBuXD49P4kKi1vDllWp/Wj+dNa25YVHCEKp0Y+g4KOsHXQz9Ca9DqltRa42xVJZb++tAMIl13juWdCN4in+2KuHCv3RxrbRUwLrFjel3i5T9dAgaoJyS/YSVPTULEaNIIVW9ya0iK1PfwbZQm+JRkgONMhKtW1GvXItHSjs1HcKXGAF1HfQISDXNwZXdX1dVsIDCLqjqMxt3ODc1QwuGYjk2W6cViWwAwGLTZag6Nsfnv6HFldgOgtVDOZt+onEJGnFJQa8Dc05h4mZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K2Xnopx5wQ6IFxisXOfZQRZb+CUoqixGaOMagDkzs8k=;
 b=JqQpHZPZh/u2hiYquILKKIstpLXUl0S0QHhg2DTjtKpJqKNLqYfQcQVc/5O3JHP4FE5kjf9UzjsQX01JL6w6uXDtPykOWaSK2W/aOjK1MsSZ6JVDTh2sKidti6Yx2IBIqxYzZ/TI5OIkPAdQ95O9IvODFIexSmiUfFttslAoUuR6BdbRRQdqvSFyQKE4ggmgut1/69dQ18MPe8/b5KDBt8g37YSRnSIpRY356K1n/89NnOR2+ba8Iff9QkDzi76fjrik1W/7lN+gNpj9LfmZDsMqgMJJkAI8adITZZOf+NCf6NluZ1N3P04ZgBPywdjSkp/xh68QM4JCbLwqzcphOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K2Xnopx5wQ6IFxisXOfZQRZb+CUoqixGaOMagDkzs8k=;
 b=md+O+2arOUa9XoG/Yt+SyHQ94kNuuCjf3ktcvmtk1UwttBoFiX1MR52DmxiGm5ztJyVoDnHnp5hkMYr8ihdn9hn5tLX7bU/C78na6yG7kNVxHvZ7wOV7siSh2CbOpKQzhxIsGqt1vS75xU30EXGc4HhGNjAYRV5mRdbKrfvyfnA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5448.eurprd08.prod.outlook.com (2603:10a6:20b:106::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.28; Fri, 3 Jul
 2020 09:08:32 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a408:2f0f:bc6c:d312]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a408:2f0f:bc6c:d312%4]) with mapi id 15.20.3131.028; Fri, 3 Jul 2020
 09:08:32 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 2/8] scripts: Coccinelle script to use
 ERRP_AUTO_PROPAGATE()
Date: Fri,  3 Jul 2020 12:08:10 +0300
Message-Id: <20200703090816.3295-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200703090816.3295-1-vsementsov@virtuozzo.com>
References: <20200703090816.3295-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR10CA0022.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::32) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.15) by
 AM0PR10CA0022.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23 via Frontend
 Transport; Fri, 3 Jul 2020 09:08:31 +0000
X-Mailer: git-send-email 2.21.0
X-Originating-IP: [185.215.60.15]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e38ec337-f427-4449-3adb-08d81f30a8a1
X-MS-TrafficTypeDiagnostic: AM7PR08MB5448:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5448A7243A56B1F8E4E6C4A9C16A0@AM7PR08MB5448.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 045315E1EE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h5sY4DE22is+KkVW2xhGJgYCnSmbwjfRe54bVqenzzNLI/nvcYjnK32MjFGEld073ZqJpYt+0lBP4U/7e68ohd4pM5rxjeioAgSlMsEeg6P6Gr4kR05jds/wgG2tCK80ZTNbk0JYjCpQUr497CUBdLsl0+8rB3avOt/hjRNjrvU5CWsEGmxC/xZkIwXIKW92OqECyogUCQ++hG3wMv9QF/EI+DtIEB7qyuBJcnlty0l/6AyzBt1oBGuLXVbfDAUM2euDJzLhSW0aFxNzW2FdcDTL7JxjSLRxmKhCJ/XscBA8ShfxuykYXJsKc7j3X8VfMNUzdbW0mPuTmdLF/7huWEFZqzkUZSKhzrA2/uZ/Oc6q+qPn845/Fxq58xya8FHDNwAITBvbYg57ovtfWzUrFy8H4dZvqYAGTdRIuJ9RdJHxKx6sd9h/qAPdi19jl1SIQCjxQ7eS7nHzODZzu/s7nQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39840400004)(366004)(376002)(136003)(396003)(346002)(66946007)(66574015)(66476007)(66556008)(2906002)(86362001)(1076003)(30864003)(8676002)(83380400001)(6512007)(5660300002)(8936002)(6666004)(186003)(36756003)(4326008)(6506007)(16526019)(6486002)(6916009)(7416002)(26005)(478600001)(956004)(52116002)(316002)(54906003)(2616005)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: RxI44ijiYMVR+1jW9160MkdbBj1H/rZCJSXVctIdK7dfez5j+6HHG71kztX4gQNOQpE+xeYPzFEj3ppq02ie2rMGH9RpHYNHvEpGC92hzwNXHDpOT6XUrls9H0McfBGubxUCi1KmzrVR8jibnHqkgTmpyzKWexZFhnXzlZW1d55ld4967E2UZxnNWlBgPDGuC9mIJ0qqyxJn2WoadpJjH/H8ZimcD+ZOL0bmi2SWUUoAG2/pIe3dvslu7REM/+UoWVPIKrUv0fJidSWtpHzp1NaLnEXLlI5QQ8m7LGXgfvTlD7aGjBUHdjU6p9UA2n3sh5J+gwnxjW0tdglHYtOwMC1RYYHKp+D0Tiv/GvchbeYVOXJSqPTFZZZZ7Mx+6qZ/zqkGpmgdzJS0meXnHoIe2cS6geGDoyEbADFLfl0KCITsmdL3ZEm0PxwWoBLe949oRiHExMYPd/X9AN++nNAQatFXADJ2Iu9Fe/H3Qo7tkKM=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e38ec337-f427-4449-3adb-08d81f30a8a1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2020 09:08:32.2737 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mjQssyVwna8Ik+GmhHwP+KSo6lgTqmMFdjhS+XRJHNQmSpEZwtIMRm5umulFRcf4QMb5UTvZ1y+Wj9hJfPN/queTfuMcgOYx54c84P4L/FI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5448
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
 Laszlo Ersek <lersek@redhat.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, armbru@redhat.com,
 Max Reitz <mreitz@redhat.com>, groug@kaod.org,
 Stefano Stabellini <sstabellini@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 eblake@redhat.com, Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Script adds ERRP_AUTO_PROPAGATE macro invocation where appropriate and
does corresponding changes in code (look for details in
include/qapi/error.h)

Usage example:
spatch --sp-file scripts/coccinelle/auto-propagated-errp.cocci \
 --macro-file scripts/cocci-macro-file.h --in-place --no-show-diff \
 --max-width 80 FILES...

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---

Cc: Eric Blake <eblake@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Max Reitz <mreitz@redhat.com>
Cc: Greg Kurz <groug@kaod.org>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony Perard <anthony.perard@citrix.com>
Cc: Paul Durrant <paul@xen.org>
Cc: "Philippe Mathieu-Daudé" <philmd@redhat.com>
Cc: Laszlo Ersek <lersek@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>
Cc: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org
Cc: xen-devel@lists.xenproject.org

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
index b54aedbfd7..514cd1f5ae 100644
--- a/include/qapi/error.h
+++ b/include/qapi/error.h
@@ -249,6 +249,9 @@
  *         }
  *         ...
  *     }
+ *
+ * For mass-conversion use script
+ *   scripts/coccinelle/auto-propagated-errp.cocci
  */
 
 #ifndef ERROR_H
diff --git a/MAINTAINERS b/MAINTAINERS
index dec252f38b..65ce440217 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2165,6 +2165,7 @@ F: scripts/coccinelle/error-use-after-free.cocci
 F: scripts/coccinelle/error_propagate_null.cocci
 F: scripts/coccinelle/remove_local_err.cocci
 F: scripts/coccinelle/use-error_fatal.cocci
+F: scripts/coccinelle/auto-propagated-errp.cocci
 
 GDB stub
 M: Alex Bennée <alex.bennee@linaro.org>
-- 
2.21.0


