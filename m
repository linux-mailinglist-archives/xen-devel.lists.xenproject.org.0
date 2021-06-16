Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67ACB3A9BB0
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 15:08:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143102.263950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltVHR-0002bB-LP; Wed, 16 Jun 2021 13:08:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143102.263950; Wed, 16 Jun 2021 13:08:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltVHR-0002Rg-FR; Wed, 16 Jun 2021 13:08:29 +0000
Received: by outflank-mailman (input) for mailman id 143102;
 Wed, 16 Jun 2021 13:08:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qy3q=LK=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1ltV24-0006lZ-1j
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 12:52:36 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [81.169.146.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fb714658-f09d-4355-abea-3ce246a2aade;
 Wed, 16 Jun 2021 12:51:46 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx5GCpZtlt
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 16 Jun 2021 14:51:35 +0200 (CEST)
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
X-Inumbo-ID: fb714658-f09d-4355-abea-3ce246a2aade
ARC-Seal: i=1; a=rsa-sha256; t=1623847895; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=qAkzC+afFgUE2AnwHG51nJsrR/LZDNYKYoEMoNM4kCUpKNtHmro7Np4B815L2h4/1g
    OeqgG/tiTpj2WQAwTgrLRBZ4aZZHL81XM36sgup0bRzZeKPPX8DUCTNMbRRpdJwDxEZV
    Nlq4v33jpLivhyAfEc7dSo+vrORLONwqD/s64oqCusBkrqhELfSZyqxm6gNjfsuRYpQA
    FDHjiup36JBAq4NKf3jC4muOjHk2qJKkyUDjwcKNc+4Lw7vnvxwhYXJI5bnEQ+NLyKaO
    0FFyjQJWuehqYfvIim9VPmTPIZF9XBngFkPKerw3Kl52eP4L/duQz/bnZy2rNRE+Ccz3
    wUAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847895;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=5OMdhD/BLm6v061HzJKSHTlMezBek4cccWDJ4F+kDME=;
    b=PQ+LkxJnNdz6yZBR0CqNxUAh4SuxdOqYH1yC8YUESK0EbnzPzPjltUA7pNeWvMb8Iy
    L/dNpzTQGTCxLOHxPxNhQuDB2xCQthIFsmIa3kcfzSW45uqVUZStGTdiCRZI0QXJbmTg
    QQplmIyAnaww8FUQj8YoqgsweJ1GLHxZ3Vi+xBE47BTIVBxMXlBSvyIcwgHs7oZWyt+i
    zkO2sHjYW3tMhgZujijdPkRsYe8AIsoJbLGTbA0j5YkODZ8hU9DJu+//1YLTgssHHW13
    YH4K0+TCQJF591Vie2PXeyijbabry8ZuSmBEfEPE2JRIiMSrqaDRs60/l61Ejbv0ZeMw
    Qz/w==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847895;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=5OMdhD/BLm6v061HzJKSHTlMezBek4cccWDJ4F+kDME=;
    b=PbR5bZJ6nLqe9xCJmbIqduxFqGtJHgwz3s6xQG465ikfrxnVkdMmkbIAo8PvIuH6IL
    92LHUy9u0lYUp9FYSpTefqPdLKQa+1THa/qtlfu0PGlN95RBe3jeZZ2CCKlAInHG4bt+
    EwxrdqvSugw1uIKvr502hcjlfCsanzoDY8m/GzvsXASx+e7Y9Et0oSxZi4NY1jkmi4e2
    QS26aZNyMSpwiCnzztnDTVbtYorO3O0IaYvRJqAtum+qYXjKdmzgdDC2rEAq5YJlTB/g
    B078TaGMtHuw3Ffvb9gHtHKzFdV1aMmBxaR2nKLR3KQnWsLkc3EQFxgaPJJJ8iI/3btw
    84uw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg5l+Vz7FJgt8+TgOd9sTrMwXjWWExsBKQCrpnqhqg=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v20210616 05/36] MAINTAINERS: add myself as saverestore maintainer
Date: Wed, 16 Jun 2021 14:50:58 +0200
Message-Id: <20210616125129.26563-6-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210616125129.26563-1-olaf@aepfle.de>
References: <20210616125129.26563-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I touched it last.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 39750bb75d..dbb8f56ab3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -381,6 +381,12 @@ R:	Juergen Gross <jgross@suse.com>
 S:	Supported
 F:	tools/libs/
 
+LIBSAVERESTORE:
+M:	Olaf Hering <olaf@aepfle.de>
+S:	Supported
+F:	tools/include/xensaverestore.h
+F:	tools/libs/saverestore/
+
 LIBXENLIGHT
 M:	Ian Jackson <iwj@xenproject.org>
 M:	Wei Liu <wl@xen.org>

