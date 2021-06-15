Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6ADF3A8B16
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jun 2021 23:27:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142428.262800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltGZk-00051b-AT; Tue, 15 Jun 2021 21:26:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142428.262800; Tue, 15 Jun 2021 21:26:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltGZk-0004yM-6e; Tue, 15 Jun 2021 21:26:24 +0000
Received: by outflank-mailman (input) for mailman id 142428;
 Tue, 15 Jun 2021 21:26:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nfts=LJ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1ltGZj-0004yD-Fu
 for xen-devel@lists.xenproject.org; Tue, 15 Jun 2021 21:26:23 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.21])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 74e8cbc4-8f7d-451a-a1d5-6e848a20dcf8;
 Tue, 15 Jun 2021 21:26:21 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx5FLQFqdO
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 15 Jun 2021 23:26:15 +0200 (CEST)
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
X-Inumbo-ID: 74e8cbc4-8f7d-451a-a1d5-6e848a20dcf8
ARC-Seal: i=1; a=rsa-sha256; t=1623792375; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=YCj6V2bBvLybAgGly3kStX/G47iASckJmeoDFE0l14Jryi9T9YWS5gGHudtDH2j49O
    3f1R5TjIdwjzPWcWw3tEzEzc3EOAFBwCElBaoWk72PgVDSYqksmb3Xh+QwBbIfMtLCQa
    7B2zHboTBq9UgdG0i4Tge2MZeZnMhesaU8TQdPnBXCH4ILStRk0KGVJdNkAitGiiKlVM
    vFKly/lD7hlLsQqJWa6l/eIp+vrcxIMH4KmlzgIIs7ApPZpS3ZyXtk22xvS8dzRstoe+
    S5ZNfheA3akCX0MjYjX6EUTpP9cJZleKPfehoThIfOYD2eSJjKmCv/AGYfKRrHZhPvE+
    yOgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1623792375;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=0k8SVgqxgX6+F1SCHObvluVDx8AaoJl27Fziwhwu2Ig=;
    b=RS92+QSqFLrBnzswgKCnqL7Z8DodUma601iK1TamfX56pIEYQSRql3pMwu2mprfPA+
    SDyyVizTqVZBS7xqEgMAJhEfcz9R/BGTJZGMEOkEyILfBNdYf4soIuTvfMKvNpJMblY9
    T2k8wIgN86iDP47WJrvmYMlOxKNu1TLH9+nuLUJPyDUmFY1cH6YvZAP1TIxnH0TCa4/3
    32fWBmmOud7w3IN4cGKAG4Nae7eHyrNYqcRhV9qFizg5iIu0AqKye3SgjeKvkEZ7rIcf
    6eu2Jh+dQfOgBqr9UTQIJau3OXA2N4YJ4yOityJGAxc4k1JSpvTfPfSi/wWXwx4xMSBs
    Q+JA==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1623792375;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=0k8SVgqxgX6+F1SCHObvluVDx8AaoJl27Fziwhwu2Ig=;
    b=Djy5DLMQfV8yAkzlTiYKdrisy14Xf81pUjMCWaPlNk3+JIG0F8RjkOqt452PXHktMB
    NUwabTMLH9wJXNu5ddlZvyXaqfNCseC7+Old3pVXryoxgftbVMalbbM/1ARPW7cF8Ube
    9OlT6sdZBDvEI7AYhpQLfcdZWv3WVuQKhYHeEZSgE9cTqOEz6MRKmtoo2hEO2VAmzdN6
    Wd/1D+jM0wngxU6EwY8VfQMvzY1gArANiceU7ti3tCqCNt8mjvyJ8MPqXkEGM4F0/JuJ
    dNnFo3c7kZL55PBIqBm51zjoGoprYul7RJCu03SUB0CJNx273wlQCGbnhLmsB94JeLAE
    nC+g==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg5l+Vz7FJgt8+TgOd9sTrMwXjWWExsBKQCrpnqhqg=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1] tools: ipxe: update for fixing build with GCC11
Date: Tue, 15 Jun 2021 23:26:13 +0200
Message-Id: <20210615212613.6270-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a snapshot which includes commit
f3f568e382a5f19824b3bfc6081cde39eee661e8 ("[crypto] Add
memory output constraints for big-integer inline assembly"),
which fixes build with gcc11.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/firmware/etherboot/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/firmware/etherboot/Makefile b/tools/firmware/etherboot/Makefile
index ed9e11305f..23b3f6ca9d 100644
--- a/tools/firmware/etherboot/Makefile
+++ b/tools/firmware/etherboot/Makefile
@@ -10,7 +10,8 @@ else
 IPXE_GIT_URL ?= git://git.ipxe.org/ipxe.git
 endif
 
-IPXE_GIT_TAG := 988d2c13cdf0f0b4140685af35ced70ac5b3283c
+# put an updated tar.gz on xenbits after changes to this variable
+IPXE_GIT_TAG := bf4ccd4265ac614fbfa38bf168b6eeaf4c17d51e
 
 IPXE_TARBALL_URL ?= $(XEN_EXTFILES_URL)/ipxe-git-$(IPXE_GIT_TAG).tar.gz
 

