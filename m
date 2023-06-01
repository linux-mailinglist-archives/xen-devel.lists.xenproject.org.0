Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A985719FEC
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 16:28:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542542.846516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4jHL-00068i-FB; Thu, 01 Jun 2023 14:27:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542542.846516; Thu, 01 Jun 2023 14:27:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4jHL-00066x-C2; Thu, 01 Jun 2023 14:27:51 +0000
Received: by outflank-mailman (input) for mailman id 542542;
 Thu, 01 Jun 2023 14:27:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2Xwn=BV=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1q4jHJ-00066T-8u
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 14:27:49 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.161]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7af4ff6a-0088-11ee-b231-6b7b168915f2;
 Thu, 01 Jun 2023 16:27:47 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.5.3 AUTH)
 with ESMTPSA id L38909z51ERk1Sj
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate)
 for <xen-devel@lists.xenproject.org>;
 Thu, 1 Jun 2023 16:27:46 +0200 (CEST)
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
X-Inumbo-ID: 7af4ff6a-0088-11ee-b231-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1685629666; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=kLRbnXb4ukrcOwOt6BFcZsx17WvG5KlRSOkeRO4Z9wYN9vbqdn8jPyreg7rA6kHC/J
    8Sz5kh51Wa69QcQZbqrzUh6eCvI8iZ/eKL+pCpCPzNK0q2zu+g38coMSTtOemg3PNmpt
    BpRSsM4Csf4CUwgF9rO2vqICdfE+SQl9Ds7YEl89wAKa0SFSLuiUJpqkCV9kEntFqG6/
    ly2jHsgdIpMm3xs2D87cMkPV6+ylRn4ZY6Yg3NNEIgMUz60J/gHCwbFnglaA7JgnUR9p
    nMaloIrn/+qsPAUYm5Vn3tS+GYegnLrP0XS+mV4ZLn0GkeUhW+lu6xpmgEKy4nFm1nM3
    gWQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1685629666;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:To:From:Cc:Date:From:Subject:Sender;
    bh=lWE44nLJoiGIiT9RDeVM4y1K+t+GFD3SlXFMd8iQ6wE=;
    b=aHdrjI5ky9lUh3axojeqZhVUI9eQEvTUwnpKpHjW6TSKmWBAvLc/fjGCi/65Ps4DnL
    ZBK8gOtB4rNjlyX8GpmaoIFWFRzlggcrhJzIhboJkifXfrE1T+v2i1PYvK7Flgy9xnpb
    NDly7xDJMAJRRrqbqVTzrVUhJWRhNhnwL13A1fnnI2UpL6sBRC9LmzejVsFbJ9X25fvZ
    cobx4JbBViTlppMV9CmgHCGC5w3BN3LW4wcurPD8Sph9eUUIFs8oyvlV+p30gFhJjiLm
    9x80GfxyTuufZzmkUbn5V32dDGnJErbLGTv4PTWouEt99J2/rYfSBtHNg58Ca3M73Yb0
    2QyA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1685629666;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:To:From:Cc:Date:From:Subject:Sender;
    bh=lWE44nLJoiGIiT9RDeVM4y1K+t+GFD3SlXFMd8iQ6wE=;
    b=eAtVVnZTGxYVkhi8DopcR2nsO6MdeeQ7mCcUpzkgezkHVI8YM3w+Ur1PgUJGuP7DN6
    8zT5E3ETrd6DODAzZXFYnDCoagz1PfIcWHhoL+q9yDClO5eYuVBCqMZPYDyk7aXvahhy
    yz9mSw4iyQ4XTLL9Whhq/tG0Z9ggMkML8liLPkkX1fm+1c2Gd76db0P42WTSqcEoFNSx
    wX9+kL1IMEoErgm0GQoumitJZPpf5zfso8RgsDlSbrq4yEZvhniHGFA4S3Q7rkHEz00i
    dBzJdrWOtXIFpW12O1vvrAxDGLf6v7S4XfFVWPyX/HqtJwaFEvmwhkgCQNZyK7VzMrxO
    ybPQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1685629666;
    s=strato-dkim-0003; d=aepfle.de;
    h=Message-Id:Date:Subject:To:From:Cc:Date:From:Subject:Sender;
    bh=lWE44nLJoiGIiT9RDeVM4y1K+t+GFD3SlXFMd8iQ6wE=;
    b=O9Blas3s2oBWoKMCDrtmVccs2JW/0uC9IjVgtDFlhFQXuEF299sZodS6t1DLeonOLk
    IuO/fF7tYpJ0BTHsFfBw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg4xqFv7EJ0tgRX/vKfT/e8Ig6v0dNw4QAWpzMWrRQ=="
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v1 0/7] xentrace changes
Date: Thu,  1 Jun 2023 16:27:35 +0200
Message-Id: <20230601142742.15489-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

Olaf Hering (7):
  xentrace: remove unimplemented option from man page
  xentrace: use correct output format for pit and rtc
  xenalyze: sync with vmx.h, use EXIT_REASON_PENDING_VIRT_INTR
  xenalyze: sync with vmx.h, use EXIT_REASON_VMXOFF
  xenalyze: sync with vmx.h, use EXIT_REASON_VMXON
  xenalyze: sync with vmx.h, use EXIT_REASON_MCE_DURING_VMENTRY
  xenalyze: handle more potential exit reason values from vmx.h

 docs/man/xentrace.8.pod   |  4 ----
 tools/xentrace/formats    |  4 ++--
 tools/xentrace/xenalyze.c | 46 ++++++++++++++++++++++++++++-----------
 3 files changed, 35 insertions(+), 19 deletions(-)


