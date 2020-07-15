Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA65A22106C
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 17:11:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvj47-0003cz-Sn; Wed, 15 Jul 2020 15:11:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wXN5=A2=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1jvj46-0003cu-Pg
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 15:11:22 +0000
X-Inumbo-ID: 70d5109e-c6ad-11ea-9401-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 70d5109e-c6ad-11ea-9401-12813bfff9fa;
 Wed, 15 Jul 2020 15:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594825881;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gz7UzHeVSBo2HbZIQ5cfhOZSE7lzjmWWU60xaJUfS2k=;
 b=CTY0KCKbbaRias51RQDxRoibowKX8btB1TLLwF6i8ECTISEL7Y+2Rivp
 lOj+BYgdVT+Y8XM6ky/84Ccql3+Hm79z0/RJAhqjEmCIiWDVsIv32BSjO
 WdxQdmFZ0V8gROZmjq/z0cpLx3ulwqoxo0L3kbuaeQsSplADw2czL+H6K k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Y/G9YdrDIqr9DUYl2LIfwsu7cZxfhN3Woz9oKYDES7hhR8kuittwv5WzjbpLVpdvKoX0+FgyJL
 US7FBC4ou2bLqxyVOl2MiKjf9VwOTraUe50Cz+343LgNOEuxy8cwrTr9ygy7uTPsf5L0UiZZ/k
 6qNTqeyf2LP2XCtdqSUgBGxZZSPChNZkkda9jHcSUR9prFOmEy8iII4x4nqwxZYyyReqE6xJ+u
 +uQdCgbjG5nOqEqDBD8HJABMJ/bCo3MSUhW9wYB0A1UAiB4XCciUxBk1GJjq7ZCVaSZpj4P54C
 OfI=
X-SBRS: 2.7
X-MesageID: 22642331
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,355,1589256000"; d="scan'208";a="22642331"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH v1 0/1] oxenstored: fix ABI breakage in reset watches
Date: Wed, 15 Jul 2020 16:10:55 +0100
Message-ID: <cover.1594825512.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
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
Cc: David Scott <dave@recoil.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>,
 Wei Liu <wl@xen.org>, Christian Lindig <christian.lindig@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

dbc84d2983969bb47d294131ed9e6bbbdc2aec49 (Xen >= 4.9.0) deleted XS_RESTRICT
from oxenstored, which caused all the following opcodes to be shifted by 1,
breaking the ABI compared to the C version and guests.

The affected opcode is 'reset watches', e.g. Linux uses this during kexec if a suitable
control/platform-feature-xs_reset_watches  field is present in xenstore.

Edwin Török (1):
  oxenstored: fix ABI breakage introduced in Xen 4.9.0

 tools/ocaml/libs/xb/op.ml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.25.1


