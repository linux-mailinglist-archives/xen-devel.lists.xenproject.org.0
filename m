Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB57281772
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 18:07:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2252.6696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kONaL-0001hh-N0; Fri, 02 Oct 2020 16:07:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2252.6696; Fri, 02 Oct 2020 16:07:05 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kONaL-0001hC-JP; Fri, 02 Oct 2020 16:07:05 +0000
Received: by outflank-mailman (input) for mailman id 2252;
 Fri, 02 Oct 2020 16:07:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=17n0=DJ=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1kONaK-0001gv-Gj
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 16:07:04 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8e88d9db-6cf0-44f0-a0de-a0f8054ffa4f;
 Fri, 02 Oct 2020 16:07:03 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=17n0=DJ=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
	id 1kONaK-0001gv-Gj
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 16:07:04 +0000
X-Inumbo-ID: 8e88d9db-6cf0-44f0-a0de-a0f8054ffa4f
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8e88d9db-6cf0-44f0-a0de-a0f8054ffa4f;
	Fri, 02 Oct 2020 16:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601654824;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YKOodhsXvB02Ask8P/bYJ7DcA/SCje8952finnXygN8=;
  b=Adfy8Q6QmhbZf6CeLc0aLeOqdzp69tYRUiaQMqdAnyGx+/2h2rK5uXao
   nB7myvu/W+LTVtsuPZMDBPOuXIAigLeSrrVNVh2XHWRb5IbYKqf7qY53A
   HpIj0YzTMDR+avBMaZL00WHm3ttMzswMGp24Hn8ab/aze7EPU/6JgwD3J
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: jkfLi41Mw6kXks3+zS3hBAiwUsO1vqRJcLQBt+TqcR9jcT9WbWHMf2rugUVKz8A6mfwvWKowMa
 DQdq15tAfMkBufQcT/NVcSharOn/gnOjXH+N6ofDWOnz5plbAJ3nBoYMZ0NfDNB6+0ZkHDdW/5
 GXjF67VG7+dZQxCUvxeFW7McAm1y8bnTY4j9Tjmf/LZv30mEsHkJywLuc6uCcJ/uK8G3vJSx0/
 jV8YEEDdWzRxrSMhOqw0UsYB65lykj5nDM/SoaXRlZjKaQiIH1P5Tpsx5b5NM/7DRSX6guZmn7
 xOs=
X-SBRS: None
X-MesageID: 28508078
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,328,1596513600"; 
   d="scan'208";a="28508078"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v1 0/1] drop RO socket from oxenstored
Date: Fri, 2 Oct 2020 17:06:31 +0100
Message-ID: <cover.1601654648.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

See https://lore.kernel.org/xen-devel/20201002154141.11677-6-jgross@suse.com/T/#u

Edwin Török (1):
  tools/ocaml/xenstored: drop the creation of the RO socket

 tools/ocaml/xenstored/connections.ml |  2 +-
 tools/ocaml/xenstored/define.ml      |  1 -
 tools/ocaml/xenstored/xenstored.ml   | 15 ++++++---------
 3 files changed, 7 insertions(+), 11 deletions(-)

-- 
2.25.1


