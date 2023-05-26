Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC06E7120F5
	for <lists+xen-devel@lfdr.de>; Fri, 26 May 2023 09:30:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539981.841379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2RtE-0003FQ-4e; Fri, 26 May 2023 07:29:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539981.841379; Fri, 26 May 2023 07:29:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2RtE-0003Co-11; Fri, 26 May 2023 07:29:32 +0000
Received: by outflank-mailman (input) for mailman id 539981;
 Fri, 26 May 2023 07:29:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xc68=BP=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1q2RtC-0003Ci-Cb
 for xen-devel@lists.xenproject.org; Fri, 26 May 2023 07:29:30 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.217]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b9c4b39-fb97-11ed-8611-37d641c3527e;
 Fri, 26 May 2023 09:29:27 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz4Q7TQ64S
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate)
 for <xen-devel@lists.xenproject.org>;
 Fri, 26 May 2023 09:29:26 +0200 (CEST)
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
X-Inumbo-ID: 0b9c4b39-fb97-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1685086166; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Ur1znmznv/irok7EsjxiiCamUSWWrFTLgNz8u5VernbZYGN0Okl9C1gnIrlnkiBvVn
    fdoW2F2efsmHLD4RaFY5sJRhSQ1Q4goxHqTEv/hoo5ANm1rcRU6iziVWNxPKPk269Auc
    5t9SGupCrLNTIDQkBdg2KQqMvjQ6YSME8RkPg81h3jTAzD0DUAu+0PjvTYSdsdFd2zaI
    0FMBegg9rx6tYr8MUS0WckRflEYbChV5MofZMJR5IaSWzId+Qc8sVVSGfkRR9WUC+keO
    BWEVDRvGBg6IAnDc+oiM7ymsQyds2j/zPlc6wcDvyoEfBozsBKCey3XAM5aIigRw4ysz
    2Hqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1685086166;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:To:From:Cc:Date:From:Subject:Sender;
    bh=3EQ+rt5wqtPkqaK/u6suMbJJzkne6HyzF1i/T5IWaN8=;
    b=tKAYbzVxa/B3dlH8WooR0I+9XgQfd9zk5p4IigHpl0o0LT2DvMJdmIvHWOvj8tbKgf
    JPvViO3N6ZV99qUSiwHhkW5qoUKEbGfUb5lM/jLJ3S9nfHZL4IZ1m3wOFZr3PMnVrDb4
    IHmE7iKTNNrO9JPi84ONBtUI7EIFuQqeRXaasKgHGjtZF/ukEb5vI4sQtq9v8xwIuZaQ
    10MhcnZajeLzk95tKgfVpgH3epxIbxa2dCFo93KdjjEhUT3sz3q5mw198PUb13ib5H8W
    xHVP/npHiNFBDSm8qNDd/kSObSMamQy0/ZYY/1ttDo0Yy2ByVxZ3jX4v+7+AM0rc0ban
    R4ug==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1685086166;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:To:From:Cc:Date:From:Subject:Sender;
    bh=3EQ+rt5wqtPkqaK/u6suMbJJzkne6HyzF1i/T5IWaN8=;
    b=QKj6/ZFxYIRP1AyrInjOzRMyeqi2DyUWRVkTYD5FLny6TFZSILXyDNun12TULb7Utf
    XT2QLc7AN4ftN9nN9+a1M/zbNcqLc1mfPUZypm+C2kXLsrimfcOxL0+2T5dAKz6i7aAG
    B/VyBaVd9LhkLDAPHkmPWXysdEpH9Zbeuy3Ua1IGiHfdfXx6hyuGQJdXUrZ2I6YuXoL2
    O12YEM533cxGqp+1rkhDnJE1GbEQTYU2bYnkmsgIalNT8sZkUQseis0P8ksq3wOMSZUJ
    eGIouxVnw0y2pEAXMPehzcsIiq/YfQ7X/TMGEkehWGs+Jsa6vkyD5QOrH0yTrZ5Xnswi
    TGRg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1685086166;
    s=strato-dkim-0003; d=aepfle.de;
    h=Message-Id:Date:Subject:To:From:Cc:Date:From:Subject:Sender;
    bh=3EQ+rt5wqtPkqaK/u6suMbJJzkne6HyzF1i/T5IWaN8=;
    b=+R0vIN9palNWZjNGJtfDK42C7uco48jXQmslcFq71DvX0Z7hZwqHOwYnKVQE+ccu5D
    MJWPZezXNrF/oOdkroDA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg4xqFv7EJ0tgRX/vKfT/e8Ig6v0dNw4QAWpzMWrRQ=="
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v1 0/3] xentrace changes
Date: Fri, 26 May 2023 09:29:13 +0200
Message-Id: <20230526072916.7424-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

Olaf Hering (3):
  xentrace: allow xentrace to write to stdout
  xentrace: remove return value from monitor_tbufs
  xentrace: close output file in the function which opened it

 tools/xentrace/xentrace.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)


