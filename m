Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 114A13A9BC6
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 15:15:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143211.264013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltVNX-0008LH-CL; Wed, 16 Jun 2021 13:14:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143211.264013; Wed, 16 Jun 2021 13:14:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltVNX-0008Ih-9D; Wed, 16 Jun 2021 13:14:47 +0000
Received: by outflank-mailman (input) for mailman id 143211;
 Wed, 16 Jun 2021 13:14:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qy3q=LK=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1ltVNW-0008Ib-0S
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 13:14:46 +0000
Received: from mo4-p04-ob.smtp.rzone.de (unknown [81.169.146.178])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f9836156-07ff-4cd5-bf62-a6d58cf66d39;
 Wed, 16 Jun 2021 13:14:44 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx5GDEctur
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 16 Jun 2021 15:14:38 +0200 (CEST)
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
X-Inumbo-ID: f9836156-07ff-4cd5-bf62-a6d58cf66d39
ARC-Seal: i=1; a=rsa-sha256; t=1623849279; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=KGsZWre7/Ghq+S+monVzGitmSNTADGrv3qFYc5MWCUctVeQXFOVGSlPItqHHDG7UAc
    M3+ohYJnFzSL+qZ5qY1kEuv2ip2WXpSFtrjHAxBcAXJHnZwJGJzkSXxrBIgwG9vVgLFp
    z1qKniM7FN4Rj+EOrZZa+duDhfe2uu0ftcArPcdeeP4xaYROniKuFhbMZRQ+zQiFFKWg
    MSaA27B/NOJwjBKhf0DR1+7aNdmb0QJ0H+eduTmJQoOQEA0VTqkAmtyGSaW68JpJkbdt
    JL6PL0OgHz4CgKm/Z9+AXXVB2F5ecY4e6faCDnQwQ8JpYlw34xh/S5Bg2H6UJTSN+pF/
    5o7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1623849279;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=jApK5xhguXgItxZ5f/1GTBckGrTPVB37W+HmDgfW5pk=;
    b=cCPYCTYcfX7Z2A8LOcSroHp5d5Wo3+3RZMXJboBEY4eYSA103uFCsjnu/p6FEZxQ7a
    0ANB0TtUYG+HZ6c6Ze1mmn+/vo6mWjhXef9EdqQifVhcrWoO8RW/ZkQLgEZuKuD0a6ug
    5ikwmuB6dnoRsLeHdyHZ3rQW/SvZcUKGNqRdmHD8aH1ID4QpdK0d3zbTn+b8aUXNsQjD
    ZwdKkoIkfsKc5MXOLxOTXLWOyHzhi0kqQb5YYWDofK2fkDOAYp2bjmOMJ47uD8TaMxYd
    5+VpdL+429VizPrhuSkU9E91WSSMJ4jResQtb3mJF42lKeLkq+xudK3NkIlSL9MlY1GM
    wJRA==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1623849279;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=jApK5xhguXgItxZ5f/1GTBckGrTPVB37W+HmDgfW5pk=;
    b=Wqnv0lCQAUfFAcLO3ibwmNP8zalMB8Jj/LPH6kmWMJeVXimGLFHRSsY8Pbf0/XNQbC
    i7rIzTftAZuZVu+/qejzlsWlzaEi9G9l2ea3E+4X/G/f0kP+XvaJl0+aVrdXyOqOSaQ2
    Rgyr3xiy7XRomba1KbQu9YagOl5V4ExYvPoGhxshz2V/5apBKiuIjmfHxkZvVGd6o93+
    Av9XOJO7THaDNdH+nE/qoUHeZSALfhYITsJGdn2tpssuo2jPH5ebEeRtTT3ZBIGpuEKn
    9j0X9TMxKiJRR8YpSf3f4huFXi1khrxPAPG/MQwUn2of/8+fyqvqi56sHhxpDUROcuGj
    m9Zw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg5l+Vz7FJgt8+TgOd9sTrMwXjWWExsBKQCrpnqhqg=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2] tools: ipxe: update for fixing build with GCC11
Date: Wed, 16 Jun 2021 15:14:35 +0200
Message-Id: <20210616131435.27770-1-olaf@aepfle.de>
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

v02:
- use parent of bf4ccd4265ac to allow build with CentOS 7

diff --git a/tools/firmware/etherboot/Makefile b/tools/firmware/etherboot/Makefile
index ed9e11305f..4bc3633ba3 100644
--- a/tools/firmware/etherboot/Makefile
+++ b/tools/firmware/etherboot/Makefile
@@ -10,7 +10,8 @@ else
 IPXE_GIT_URL ?= git://git.ipxe.org/ipxe.git
 endif
 
-IPXE_GIT_TAG := 988d2c13cdf0f0b4140685af35ced70ac5b3283c
+# put an updated tar.gz on xenbits after changes to this variable
+IPXE_GIT_TAG := 3c040ad387099483102708bb1839110bc788cefb
 
 IPXE_TARBALL_URL ?= $(XEN_EXTFILES_URL)/ipxe-git-$(IPXE_GIT_TAG).tar.gz
 

