Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28536A14148
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2025 18:53:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873677.1284662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYU31-0007EV-GB; Thu, 16 Jan 2025 17:52:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873677.1284662; Thu, 16 Jan 2025 17:52:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYU31-0007CF-D8; Thu, 16 Jan 2025 17:52:51 +0000
Received: by outflank-mailman (input) for mailman id 873677;
 Thu, 16 Jan 2025 17:52:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PV9y=UI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tYU30-0007C4-56
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2025 17:52:50 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b21fd5fd-d432-11ef-99a4-01e77a169b0f;
 Thu, 16 Jan 2025 18:52:47 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5d3f65844deso1973465a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jan 2025 09:52:47 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab384f22c6asm26516166b.106.2025.01.16.09.52.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 09:52:46 -0800 (PST)
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
X-Inumbo-ID: b21fd5fd-d432-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737049967; x=1737654767; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jwFdCUm+DIThbUpHUfjQvJ17doF3H9OpBArUoynYNPs=;
        b=cpv4sa/d48KpsYIHWolUD4P5kY4r2yNFTWDP6Hz6lh2Z6OI1zZSpm0pqvJCLyl6uYM
         u+a4Uq92UpyHg2lQGhz+MlEpfKK3En/HTuqMgv3ALhzdES/a2WFhZu/fU4xrHOPJb3FO
         rnXtIetND+18XMwj6++Q8oGlixg3n6C48yW80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737049967; x=1737654767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jwFdCUm+DIThbUpHUfjQvJ17doF3H9OpBArUoynYNPs=;
        b=pH9y+Jv0cqtn1d/TlbAISMgMzFdj8mZOplWLox0mzKzqcbnfUY+zjyn12R6XRD0NKw
         uaGE7b1ZK6cfiBc6TlWEQbj4nj3LHUgyxyR35eFUYaW6KfyndXttzzFIgfnMf6KhIAmQ
         Pk2RNWisr/jeoUsC9O0m3HRRL7ffIYGgKF4ivD+AIyCy4ZFIInoUIlCz7XzLfh34WCqu
         V6MLqfEK04hglarQm1YcHxYE9PJ5Yv+uHETfvUESVNU0HZ6CLgTTlnGkMaP50lyjGi3J
         J6D6Vc4HJU1BAADOYT945QvQE6tm4bqwIH35DVuCJz8vYMvJwPq5tCWVMXNfboGhxf9M
         KahQ==
X-Gm-Message-State: AOJu0YxARMYHUGNI2lN/jWjcZEULuEBxOqewkEl4o4WRBsRhOJ9/79Vk
	80JnWg03oqZ5lLHoBlUkwb3oOPaXpsMcMnfD4yFMVFaMZ7dY+2Z1/IraFeHVJf6R5cIBCKF/yqq
	0
X-Gm-Gg: ASbGncsoRLBo5CnYwmbrnebaYICUwNp3yycbZa3BmRLyU3Q22P3JJ/vkMNIUf3lvh7u
	vsp3dy4XQ+jVejIM4tBOfPl9TPM/mvLLr6KhB6uKSMQNMWVahx3SprSPoJIzEyKxtpyEf7PBSp4
	cLuddb7oZ4ZkDABcjFBeVgKCzohtfTtazaIev4J/64B4LGJcShexPev1uCDPyB+D+l1jjFsHgRA
	iBy5ZWsy+PM07WKnkHhS6p2KLj/XMG7FcZrvTBIKSYxmyQTdGfLn38MQfkmfw==
X-Google-Smtp-Source: AGHT+IGdPocoRdZ5HMXzl72k9uRHG5ZfNuKI52jDRlWS/PtTDuu3aX+jhUfP+RwTTNWdZQguGyPE8g==
X-Received: by 2002:a17:907:368c:b0:aa6:9624:78fd with SMTP id a640c23a62f3a-ab2abc78a71mr3378635366b.48.1737049966657;
        Thu, 16 Jan 2025 09:52:46 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: konrad.wilk@oracle.com,
	ross.lagerwall@citrix.com,
	Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 0/7] livepatch-build-tools: fixes for handling .cold and .hot sections
Date: Thu, 16 Jan 2025 18:52:07 +0100
Message-ID: <20250116175214.83742-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

Fixes picked from kpatch to deal with .cold and .hot sub-functions
sections generated by gcc.

Thanks, Roger.

Artem Savkov (7):
  create-diff-object: ignore .cold.* suffixes in is_bundleable()
  create-diff-object: add symbol relations
  create-diff-object: propagate child symbol changes
  create-diff-object: allow changing subsections
  create-diff-object: add .text.hot to the list of bundleable functions
  create-diff-object: propagate ignore.functions to children
  create-build-diff: support for .cold functions with no id suffix

 common.c             |  9 ++++-
 common.h             |  2 ++
 create-diff-object.c | 78 +++++++++++++++++++++++++++++++++++++++++---
 3 files changed, 84 insertions(+), 5 deletions(-)

-- 
2.46.0


