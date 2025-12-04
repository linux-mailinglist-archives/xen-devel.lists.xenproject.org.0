Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CEBCA49BA
	for <lists+xen-devel@lfdr.de>; Thu, 04 Dec 2025 17:54:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1178126.1502081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRCb8-0000EB-4m; Thu, 04 Dec 2025 16:54:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1178126.1502081; Thu, 04 Dec 2025 16:54:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRCb8-0000C4-1W; Thu, 04 Dec 2025 16:54:30 +0000
Received: by outflank-mailman (input) for mailman id 1178126;
 Thu, 04 Dec 2025 16:54:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ymfd=6K=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vRCb6-0000By-6g
 for xen-devel@lists.xenproject.org; Thu, 04 Dec 2025 16:54:28 +0000
Received: from fhigh-a1-smtp.messagingengine.com
 (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3d5a3b7-d131-11f0-9d1a-b5c5bf9af7f9;
 Thu, 04 Dec 2025 17:54:26 +0100 (CET)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 04EAE1400233;
 Thu,  4 Dec 2025 11:54:25 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Thu, 04 Dec 2025 11:54:25 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Dec 2025 11:54:23 -0500 (EST)
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
X-Inumbo-ID: e3d5a3b7-d131-11f0-9d1a-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm1;
	 t=1764867265; x=1764953665; bh=sxPFZ6c/Af/XGGn8DPMHc7H1iTXIaOB8
	tkvgGdgytYg=; b=GusMDLmvQH7dN6+dj5NW24zeKr2UweeBAzzXDnywhMO5FlQd
	9lhaLc2UamytaCr0gAuR9C2az10KIuYzTN7fIpKozJ29pxk9Pf7uhh159MzHaUXd
	3DFa6z7yuh8nmqDl8azTPcEtu8bOmpBIa0GkeZVimwGX85P3SDkL04MIQWbFfjD8
	3385jgt66u7C5duWfIinqMdl7ZGjTd93L4YKu6QGmydwjqHWm+yGFg/+c75X08ax
	AtRWWacZ3cLhKyehGquOj1WPx1AsW68447hDNFXtw+2OwqkQUJFTGS8n/847YiWt
	sXkoGlQif7nZBawt1/zZPTnrJEKaBeIpuc/27g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1764867265; x=1764953665; bh=sxPFZ6c/Af/XGGn8DPMHc7H1iTXI
	aOB8tkvgGdgytYg=; b=ozjaC5Va8tloA9NuQQjHlzCGvYFSSjzes3kOZZjDtk7j
	zhx4lQ5sRrCEJdHT84inF8t8+m/1yIBr4sWB2YU65eOjLxEj58eT5as+/gtURp+J
	Tj0wyRf9cPqte703uljJENdCObYBZWnCtSCtOLUqIRMP8aafvrpj28RTtbPZbxCm
	quWCmn4qVaB/k0PBLMjx1LenO3AtkSSco74Zl5knELbGD8XndYQ3/l8GsN0APrOB
	p5z1Bp6DOFHX6xNy6E6FGXlQPYQFFe/AWQboWW5XR4r+EQknV96ngs6XnTVKd4+g
	W9D9L06GB4UxT+mxDq+SqbUsTEUuWyyxw90AiKGtzQ==
X-ME-Sender: <xms:wLwxaQI4_cwK7xYTiizJGSqoV1ORaqcnTu8Xok5_TbEu55GzFcwMWA>
    <xme:wLwxaWJEjv5YJv8g5oMt7hcxXs9nWbuIP1Ip-eUV6ifjkQFszaEK50em3Q4uetjdL
    HRkVdC4A_lZe5M38ZGsqQwAvS0Erbt2GMoKXECBHnHx0y77UA>
X-ME-Received: <xmr:wLwxaeUfpG6QdeiemtzKz0mbX7k4sqkGWGs9KCo_dF8o-ODLvlkOmQhnKCFBP26tHQVSFIM9XIPXn28RemxYRR48CirtPEGk49UiuaroyY0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeiudduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffogggtgfesthekredtredtje
    enucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceo
    mhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecugg
    ftrfgrthhtvghrnhepjeeufefhleeikeegfedtgfeiueeghfduteejtefhfeevheffjefh
    ieeggfejkeelnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhi
    shhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopedvpdhmohguvg
    epshhmthhpohhuthdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghn
    phhrohhjvggtthdrohhrghdprhgtphhtthhopehmrghrmhgrrhgvkhesihhnvhhishhisg
    hlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:wLwxaYibf7Uo6pkqHwfhTb8XLh0BhN_9196jmLN8PBKN3rwLq9sYkw>
    <xmx:wLwxaZ_mNyic3HaEKgONppd2FfGFbOm_LKZM9dDrbrQhjv1rHQ6JVg>
    <xmx:wLwxaSD3K3N5vlVmwTK4zxgLJW0-HDRCY8v790ALGAWeqHvfAvnSIg>
    <xmx:wLwxaWKr0_Y1dY5HYgGfrdw1DIL2E8vmsdJ2UNSqvLOIGhmmVO1czg>
    <xmx:wbwxaUncmGaCBRn8pVaq7RsCUkStM0vX71RXiNaNGd4J3F8Wv1HZ2bTA>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v3 0/4] Add driver domains test
Date: Thu,  4 Dec 2025 17:53:47 +0100
Message-ID: <cover.1e7327573686b6fc1e161127e268e4042556d16e.1764867217.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is intended to detect issues like recent xl devd crash in domU.

Pipeline:
https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/2196576805

I did checked that indeed it fails with the fix reverted - that's why the
Debian patch - Alpine version did not detected that regression.

Requires debian in test-artifacts repo - patch series sent separately.

Marek Marczykowski-Górecki (4):
  automation: switch to alpine:3.22
  CI: Add driver domains tests
  CI: Add configure --enable-systemd for full build
  CI: Run driver domains test on Debian too

 automation/build/alpine/3.18-arm64v8.dockerfile |  51 +------
 automation/build/alpine/3.18.dockerfile         |  52 +------
 automation/build/alpine/3.22-arm64v8.dockerfile |  51 ++++++-
 automation/build/alpine/3.22.dockerfile         |  52 ++++++-
 automation/build/debian/13-x86_64.dockerfile    |   4 +-
 automation/gitlab-ci/build.yaml                 |  44 ++---
 automation/gitlab-ci/test.yaml                  | 125 ++++++++------
 automation/scripts/build                        |   3 +-
 automation/scripts/containerize                 |   4 +-
 automation/scripts/qemu-driverdomains-x86_64.sh | 152 +++++++++++++++++-
 10 files changed, 362 insertions(+), 176 deletions(-)
 delete mode 100644 automation/build/alpine/3.18-arm64v8.dockerfile
 delete mode 100644 automation/build/alpine/3.18.dockerfile
 create mode 100644 automation/build/alpine/3.22-arm64v8.dockerfile
 create mode 100644 automation/build/alpine/3.22.dockerfile
 create mode 100755 automation/scripts/qemu-driverdomains-x86_64.sh

base-commit: 62bd4c2a8ee809c181d47098583270dc9db9300e
-- 
git-series 0.9.1

