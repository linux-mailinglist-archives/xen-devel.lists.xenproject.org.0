Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A68B5F3219
	for <lists+xen-devel@lfdr.de>; Mon,  3 Oct 2022 16:42:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414901.659327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofMdr-0003F4-Vh; Mon, 03 Oct 2022 14:41:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414901.659327; Mon, 03 Oct 2022 14:41:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofMdr-0003DA-Sj; Mon, 03 Oct 2022 14:41:59 +0000
Received: by outflank-mailman (input) for mailman id 414901;
 Mon, 03 Oct 2022 14:41:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9qkJ=2E=arm.com=peter.hoyes@srs-se1.protection.inumbo.net>)
 id 1ofMdq-0003D4-Nx
 for xen-devel@lists.xenproject.org; Mon, 03 Oct 2022 14:41:58 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 8683f197-4329-11ed-964a-05401a9f4f97;
 Mon, 03 Oct 2022 16:41:56 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33F50176B;
 Mon,  3 Oct 2022 07:42:01 -0700 (PDT)
Received: from e125920.arm.com (unknown [10.57.80.219])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 38DCC3F73B;
 Mon,  3 Oct 2022 07:41:53 -0700 (PDT)
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
X-Inumbo-ID: 8683f197-4329-11ed-964a-05401a9f4f97
From: Peter Hoyes <peter.hoyes@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	diego.sueiro@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] tools/xendomains: Restrict domid pattern in LIST_GREP
Date: Mon,  3 Oct 2022 15:42:16 +0100
Message-Id: <20221003144216.2297632-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Hoyes <Peter.Hoyes@arm.com>

The xendomains script uses the output of `xl list -l` to collect the
id and name of each domain, which is used in the shutdown logic, amongst
other purposes.

The linked commit added a "domid" field to libxl_domain_create_info.
This causes the output of `xl list -l` to contain two "domid"s per
domain, which may not be equal. This in turn causes `xendomains stop` to
issue two shutdown commands per domain, one of which is to a duplicate
and/or invalid domid.

To work around this, make the LIST_GREP pattern more restrictive for
domid, so it only detects the domid at the top level and not the domid
inside c_info.

Fixes: 4a3a25678d92 ("libxl: allow creation of domains with a specified
or random domid")
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
---
 tools/hotplug/Linux/xendomains.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/hotplug/Linux/xendomains.in b/tools/hotplug/Linux/xendomains.in
index 334d244882..70f4129ef4 100644
--- a/tools/hotplug/Linux/xendomains.in
+++ b/tools/hotplug/Linux/xendomains.in
@@ -211,7 +211,7 @@ get_xsdomid()
     fi
 }
 
-LIST_GREP='(domain\|(domid\|(name\|^    {$\|"name":\|"domid":'
+LIST_GREP='(domain\|(domid\|(name\|^    {$\|"name":\|^        "domid":'
 parseln()
 {
     if [[ "$1" =~ '(domain' ]] || [[ "$1" = "{" ]]; then
-- 
2.25.1


