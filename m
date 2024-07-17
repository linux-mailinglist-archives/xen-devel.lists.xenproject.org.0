Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9859933B04
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2024 12:14:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759902.1169592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sU1ef-0005XC-Qu; Wed, 17 Jul 2024 10:13:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759902.1169592; Wed, 17 Jul 2024 10:13:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sU1ef-0005UV-NQ; Wed, 17 Jul 2024 10:13:01 +0000
Received: by outflank-mailman (input) for mailman id 759902;
 Wed, 17 Jul 2024 10:13:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Uy2s=OR=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1sU1ed-0005UP-Uu
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2024 10:13:00 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.23]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23c6015c-4425-11ef-bbfd-fd08da9f4363;
 Wed, 17 Jul 2024 12:12:58 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 50.5.0 AUTH)
 with ESMTPSA id Dbccd106HACiGcG
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 17 Jul 2024 12:12:44 +0200 (CEST)
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
X-Inumbo-ID: 23c6015c-4425-11ef-bbfd-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; t=1721211164; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=plqz9r/5nVWd0L+zi5grEklWOFuHC4rFi0q9z9V8hb/c9RwTtQugMO07aMbg/Jl+p2
    6diH+lXf2IRN7r8tAbYyXAJyX4iwFZHBwhWP1WjhkTM5+6tC39znSyEY5+2Idk4bKZAg
    M+jKfaUbi+ibEOFKYVNBFKKsHCk2+9fw2YvTaMYCFydP0PdSLLi/KwYjV6i5nZMLbxE7
    4WrW9qRaXUK7bvytgw42ovUXeHIXT4PkFjxE1tFiFdNlnclBiE2iux6gbJBxQ5uOTlk9
    ZWqBabgMSYbTCe2yIKqcN81BPMWLJiovixKg5R0CHesxeiA3j0bVTDjy6di8qYcvfA5Y
    JM0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1721211164;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=EcVTPx+ir7SxGMvWa9/83wVmxxJWzcuodxHkibifbas=;
    b=hZLyuFwo5jZXouU9jNeL/3bSyt0TJVz5WGvUkgWNNROhqJ+oY8AokRwQADqNqWWSyc
    thIn6unMHzIdxYKGce5p1umXr6OZBYQSQQBtsICnIvdqw6fBbz0DEoKQlDdmBp2jPDDQ
    FH7xzKJnHQKn8MyJ85VqsLTvW+EQ8Yz6DIAo4N0xYPLq7syA3K9THa2PWQjErGr9n3QD
    McU/UtqwYN6tNaeHCn4zspDV8/8g/S34FOyB/97GexFnq3fcRbsMQWm4Jw+KdZB1Nn20
    SeqQojWssKpnNuYZgML6EHw+pRNMmUglF3CcRYQ/hSXsUDPDUKx3JxiUirsASqiBxzSX
    reIA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1721211164;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=EcVTPx+ir7SxGMvWa9/83wVmxxJWzcuodxHkibifbas=;
    b=W4eQIKVyblECRe7bW6pWU88OpV3CyRdeH6IcdlpkIqv04qKTZxkx1yRxZtfAuZv1Nd
    kzy7u9fgCB3UR8asXLIpnHeRbEfhQzMl46fB5D+u9vydaRbLWjjTSweh/rpkimcmjft+
    ar/ITLnXOGakuyaLzt0vGP9Zcu67bFGVl3cXT7cUDnA26585v2QRZE0HM1yyvqcXVKNq
    SKLkMqcjFfJ35pl8e67rZyPKNuC2LzMR1WXCmZa03647FxQO6/6dHsFAkqAzh6472jZD
    Ky71tIg7m6RTDbIVv3/9MMBxNOKDndVuLGI/OBfcsICCufqKy6/r8bwZFvR8iN1rxI79
    wgYA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1721211164;
    s=strato-dkim-0003; d=aepfle.de;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=EcVTPx+ir7SxGMvWa9/83wVmxxJWzcuodxHkibifbas=;
    b=ZLFQPbaM0q5ZHVU0mrM+zQNzmDUHxyqiXNfht/94BI4mryqrLSVuMod+SCNelqgUkz
    p7U+RHF6JwBjg+LyvvCw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg4wqAr7QZotb7aUa81oo9UbOmDZ35aKGzKUlPKq5Q=="
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1] automation: adjust paths to docker files in documentation
Date: Wed, 17 Jul 2024 12:12:32 +0200
Message-ID: <20240717101239.21051-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

Use new location of dockerfiles.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 automation/build/README.md | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/automation/build/README.md b/automation/build/README.md
index 12a2b4af18..bd0c0e0418 100644
--- a/automation/build/README.md
+++ b/automation/build/README.md
@@ -100,12 +100,12 @@ such as openSUSE Tumbleweed. Login with the gitlab.com credentials.
 
 ```
 docker login registry.gitlab.com/xen-project/xen
-make -C automation/build suse/opensuse-tumbleweed
+make -C automation/build opensuse/tumbleweed-x86_64
 env CONTAINER_NO_PULL=1 \
   CONTAINER=tumbleweed \
   CONTAINER_ARGS='-e CC=gcc -e CXX=g++ -e debug=y' \
   automation/scripts/containerize automation/scripts/build < /dev/null
-make -C automation/build suse/opensuse-tumbleweed PUSH=1
+make -C automation/build opensuse/tumbleweed-x86_64 PUSH=1
 ```
 
 [BuildKit]: https://docs.docker.com/build/buildkit/

