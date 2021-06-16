Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 522AB3A9B12
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 14:51:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142938.263625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltV1I-0008BQ-2H; Wed, 16 Jun 2021 12:51:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142938.263625; Wed, 16 Jun 2021 12:51:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltV1H-00087k-Pp; Wed, 16 Jun 2021 12:51:47 +0000
Received: by outflank-mailman (input) for mailman id 142938;
 Wed, 16 Jun 2021 12:51:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qy3q=LK=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1ltV1G-0006lZ-0K
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 12:51:46 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [85.215.255.53])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d1943abb-3cfd-4d03-9314-0c71412d5751;
 Wed, 16 Jun 2021 12:51:41 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx5GCpYtlq
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 16 Jun 2021 14:51:34 +0200 (CEST)
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
X-Inumbo-ID: d1943abb-3cfd-4d03-9314-0c71412d5751
ARC-Seal: i=1; a=rsa-sha256; t=1623847894; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=soFrmfUzg9UNLI8yVxGJmyKafXyp1k0pP6Tz7C6qrjRjIjjInvmcIq7NDWzoXEpYpa
    is5J4weSbVdhj+Zv+exqhxzn9JCh70HsxVuioyvtd3/icKwIxal2s1iOhU6IiAqeshN4
    GE5cuALgLBx29/FjVhUoAtIn17oRmmHc9ygwS581gl/kQ3KK8otGIGOjZeyH+g1lf0Mf
    wM4lwrrI/6tKseCltsc33Y2MpZNXO/SNS6sdL7AazagYfsUSCfQMy1Rbv4tjcU0Fj6sO
    o0EsWuYJzd1QLdrcqzgL/jozmedbbylz7MjX5SaezjDDFoHX4XOh3T8nyMx6jn/333eg
    eoTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847894;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=WwrXv/hX+8hePyd4mOYFfrU0MUgrTtUZ8Gjzx55scrs=;
    b=CumTvA1YqjZBixzbp99+/N+2MDfv6RVYWAZjCKD6Rf5H1R1lNbsSY6YZObLLUE5Owt
    32biwzycgSL2YhhRgHJ8y1+pMc2ek0NExN0ijFfLlNqajcTRu1fINPOMMPCoW+4BSuJP
    GQnDgF9MWrzopCxL4ZfOuCwsZ4DOvxkHlt4PmuNoeOozH4WT/mrIzH2etYic/7of6/Gq
    TL8WTiBGP0mT6fz/Of+0rZJr2y0W6svOguW22N+B7dYQ/+JjX7kvrgdZTVk/pCGIlaQS
    cCJkTCU26Y1hbQZEZ3Xe3PF2xycaGsuyLBJ7EJVSBJJXLNkF16Hf/z5ZQE2XTRl0HZU/
    1cWw==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847894;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=WwrXv/hX+8hePyd4mOYFfrU0MUgrTtUZ8Gjzx55scrs=;
    b=Hdyru/O388OBCl1cJ0YWnVg/2XeuMH7WAZa6zCOYBj2Y0mqdK1mO+sA1FldUjL2AL0
    b0snEqEad8XYecbuLL55rwYjFhNs5PeRbVqPttbvjWLEmb7JjURaPEvNMiVFVLuhnDYy
    kAv6XnK34DIhKUwixo5hwHPBdgrfMA//xNS2j7t+SxN0HEpP1Tlg2TS9g6RJPJAolpxg
    gzu14toyeV8UqfP8LLUhmnzfvLHgrzSRTvSIYdhpLMhjEHt2il73AVt63UUAQ4GHw8jc
    Bd28M4cLNrCzsnrkfRKdaoRXblmkSeQ8afmaRpQsF9ZgkaDy6XFOhDfSkIdXEWAw8FRd
    QY7Q==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg5l+Vz7FJgt8+TgOd9sTrMwXjWWExsBKQCrpnqhqg=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v20210616 03/36] xl: fix description of migrate --debug
Date: Wed, 16 Jun 2021 14:50:56 +0200
Message-Id: <20210616125129.26563-4-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210616125129.26563-1-olaf@aepfle.de>
References: <20210616125129.26563-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xl migrate --debug used to track every pfn in every batch of pages.
But these times are gone. The code in xc_domain_save is the consumer
of this knob, but it considers it only for the remus and colo case.

Adjust the help text to tell what --debug does today: Nothing.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
Reviewed-by: Juergen Gross <jgross@suse.com>

v02:
- the option has no effect anymore
---
 docs/man/xl.1.pod.in   | 2 +-
 tools/xl/xl_cmdtable.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
index e2176bd696..70a6ebf438 100644
--- a/docs/man/xl.1.pod.in
+++ b/docs/man/xl.1.pod.in
@@ -481,7 +481,7 @@ domain.
 
 =item B<--debug>
 
-Display huge (!) amount of debug information during the migration process.
+This option has no effect. It is preserved for compatibility reasons.
 
 =item B<-p>
 
diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index 661323d488..ca1dfa3525 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -172,7 +172,7 @@ const struct cmd_spec cmd_table[] = {
       "                migrate-receive [-d -e]\n"
       "-e              Do not wait in the background (on <host>) for the death\n"
       "                of the domain.\n"
-      "--debug         Print huge (!) amount of debug during the migration process.\n"
+      "--debug         Ignored.\n"
       "-p              Do not unpause domain after migrating it.\n"
       "-D              Preserve the domain id"
     },

