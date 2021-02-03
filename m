Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B274030E129
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 18:36:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80997.148797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7M4Z-0008Uh-0p; Wed, 03 Feb 2021 17:36:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80997.148797; Wed, 03 Feb 2021 17:36:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7M4Y-0008UK-Tp; Wed, 03 Feb 2021 17:36:10 +0000
Received: by outflank-mailman (input) for mailman id 80997;
 Wed, 03 Feb 2021 17:36:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c0lb=HF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l7M4X-0008Tu-Jr
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 17:36:09 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 58c0bd68-f56d-4cab-82e4-e7127bb1aace;
 Wed, 03 Feb 2021 17:36:07 +0000 (UTC)
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
X-Inumbo-ID: 58c0bd68-f56d-4cab-82e4-e7127bb1aace
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612373767;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=889AXvG19V0DSakGW3KQHUHk1PEmlP7uNjR4YWM4jWA=;
  b=JPJkjgP1C0rWovARN0J3PoSLv3GHDmwG3eoFZ3pVgZiPhNTFqa4w3L7P
   C6nAFHSxvNHJASwj2WkWLYsd99tFF5JMa9EofSurPvGwKbTwVLna2npQI
   Gj4bJXjW2fWV4V/CPS4SsE/I9KKdLMydRk7Cgm7OhfsRrLaLkVagZ6f9q
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: GHlpCchcGiZaGyMFSLcqrjrMkMAx7YnISs1C2/f8fe3gDyooaOdOelMf6aFFDzwG8iadmKZNs8
 edjC4SEnD/fIPDmb6pWVjnHXl9bwREqYnNI3ghAepI7EHHhVlueIX9LlvooRxXZOo8Yz8+pNOF
 WlD4C1aRO0OaOl6X+tWv6tUdQ9UM8DHrt9zsgphtpUa0KYYImq6jFrsmmZ2pOwJoZPebOwU6sw
 nqqrc51lUpiQJ9nc/N0a7a5DshMrEWJ2lm4ekDbFu8zN7wRRanPskcnx6alPgLCrIoqqcE1z1R
 Nrk=
X-SBRS: 4.0
X-MesageID: 36863742
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,399,1602561600"; 
   d="scan'208";a="36863742"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, Ian Jackson <iwj@xenproject.org>, "Wei
 Liu" <wl@xen.org>
Subject: [PATCH 1/3] tools/oxenstored: Fix quota calculation for mkdir EEXIST
Date: Wed, 3 Feb 2021 17:35:47 +0000
Message-ID: <20210203173549.21159-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210203173549.21159-1-andrew.cooper3@citrix.com>
References: <20210203173549.21159-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Edwin Török <edvin.torok@citrix.com>

We increment the domain's quota on mkdir even when the node already exists.
This results in a quota inconsistency after live update, where reconstructing
the tree from scratch results in a different quota.

Not a security issue because the domain uses up quota faster, so it will only
get a Quota error sooner than it should.

Found by the structured fuzzer.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
CC: Christian Lindig <christian.lindig@citrix.com>
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
---
 tools/ocaml/xenstored/store.ml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/ocaml/xenstored/store.ml b/tools/ocaml/xenstored/store.ml
index 1bd0c81f6f..20e67b1427 100644
--- a/tools/ocaml/xenstored/store.ml
+++ b/tools/ocaml/xenstored/store.ml
@@ -419,6 +419,7 @@ let mkdir store perm path =
 	(* It's upt to the mkdir logic to decide what to do with existing path *)
 	if not (existing || (Perms.Connection.is_dom0 perm)) then Quota.check store.quota owner 0;
 	store.root <- path_mkdir store perm path;
+	if not existing then
 	Quota.add_entry store.quota owner
 
 let rm store perm path =
-- 
2.11.0


