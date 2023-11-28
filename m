Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 401517FB594
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 10:23:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642823.1002562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7uIV-0005BI-Bh; Tue, 28 Nov 2023 09:22:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642823.1002562; Tue, 28 Nov 2023 09:22:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7uIV-00058p-7i; Tue, 28 Nov 2023 09:22:27 +0000
Received: by outflank-mailman (input) for mailman id 642823;
 Tue, 28 Nov 2023 09:22:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PT6c=HJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r7uIU-0004tr-31
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 09:22:26 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a298e996-8dcf-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 10:22:22 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40b4e35ecf1so2105775e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Nov 2023 01:22:23 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 e2-20020a5d4e82000000b0032d893d8dc8sm14402876wru.2.2023.11.28.01.22.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Nov 2023 01:22:21 -0800 (PST)
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
X-Inumbo-ID: a298e996-8dcf-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701163342; x=1701768142; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OVPVkZGrv+VUn3HtwR4TYYwB/Q4YpaApBmzFLnCcK1Y=;
        b=PUPRSiyRPatvWArvwpfsNEuU/kUWqNRet8UJs2nckGY1FEhOgOZjkhCZZp2OR93SEh
         Xv2b3smUOsRqQ2IfrOd4EqRGCaUvv02I73dnXZAXM6qWn+fkKMloIm5mkS8aNmPBtzNF
         7X+mGJ/7r0a9jfIYh5JXTtlTs+hCEJz9pQPcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701163342; x=1701768142;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OVPVkZGrv+VUn3HtwR4TYYwB/Q4YpaApBmzFLnCcK1Y=;
        b=Izjn5w2he/j2rs80QgMKaZrEMAbpIuLeiCF2Ec39+Pr0HNNlK8pAGmWhMfCUsW8Lw0
         ARVlggtcOGRBfy3+AvejE3bsAcCoHYGbjBIxpgbVD1XSz2eec35PDTtr5rhN7RMyrsCN
         ur3hpDB7/6vkkg37gLSBeGD2p7Cef6lCGyX8ztPU1vUfjV3DynZksTaigbypevur7e4O
         FFSSmS4mYBz/c6PJ9+yJoY1+gOv9h/7Rk62/v5LtdW1608XgqJAG76pK7unyTjh/vkL5
         QyD8RV7csAKQiWaMuth5pii2N4mF+xZ5lK/aQyW44Br7VJyDMV4pXRCKgt04ZtvkgG84
         xwyg==
X-Gm-Message-State: AOJu0Yys/yOqljc41VBJLqP4rq112bnWUKtxa6iNdP0FoxdKK6DwnVWH
	Qkghtgm8lcvB6l2IT5Puz0hbYOIJAtCNfcC1e4Y=
X-Google-Smtp-Source: AGHT+IFgqG6uz6XpkdKSy5uzjb6VIzryT1vCPg5oBEDNb9+R3vRxY4HVTvN69yuGTg7HwT39r6n61Q==
X-Received: by 2002:a05:6000:1802:b0:332:cc15:6bae with SMTP id m2-20020a056000180200b00332cc156baemr9559311wrh.20.1701163341651;
        Tue, 28 Nov 2023 01:22:21 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v2 0/3] livepatch-build-tools: fixes for non GNU tools and alignment
Date: Tue, 28 Nov 2023 10:21:49 +0100
Message-ID: <20231128092152.35039-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

The series contains two fixes for using the tools on non GNU
environments, plus one extra fix to account for section alignment when
calculating old function size.

Thanks, Roger.

Roger Pau Monne (3):
  livepatch-build-tools: do not use readlink -m option
  livepatch-build-tools: remove usage of gawk
  livepatch-build-tools: account for section alignment when calculating
    function size

 common.h             |  2 ++
 create-diff-object.c |  5 +++++
 livepatch-build      | 38 +++++++++++++++++++++-----------------
 3 files changed, 28 insertions(+), 17 deletions(-)


base-commit: e588b7914e7afa3abb64b15a32fc2fdb57ded341
-- 
2.43.0


