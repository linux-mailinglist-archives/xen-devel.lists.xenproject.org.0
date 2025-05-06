Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4144BAAC807
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 16:33:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977404.1364416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCJLX-0000SE-J7; Tue, 06 May 2025 14:32:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977404.1364416; Tue, 06 May 2025 14:32:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCJLX-0000Q5-Fe; Tue, 06 May 2025 14:32:35 +0000
Received: by outflank-mailman (input) for mailman id 977404;
 Tue, 06 May 2025 14:32:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bRWV=XW=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1uCJLW-0000Py-7u
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 14:32:34 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2488428-2a86-11f0-9eb4-5ba50f476ded;
 Tue, 06 May 2025 16:32:33 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5f6222c6c4cso8415912a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 07:32:32 -0700 (PDT)
Received: from rossla-pc.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1894c0356sm711598966b.100.2025.05.06.07.32.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 07:32:31 -0700 (PDT)
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
X-Inumbo-ID: f2488428-2a86-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746541952; x=1747146752; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wX47cjJ7Qc7j9RHMbIazl4f6pXIf8iTrEpBSSWuNjyQ=;
        b=Gg6jg/a6airJAXyxttPaHC4V0UrD0fDWuOlK7laBt7bd3qxRE6mVR2iVl56NIYHBix
         9nFOEIi5CUTem0LerNO9kQoS/wuEGOKz9xKva2VL2V6ucIGPNmFiB7Q86eIH0IINmecN
         ZrpqI6E5EpiKY3mnm39y8kDtk0Rj3twDvy11c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746541952; x=1747146752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wX47cjJ7Qc7j9RHMbIazl4f6pXIf8iTrEpBSSWuNjyQ=;
        b=hYkNY/1KQtktrziApZQbBcjTh6OIG0xNuCMRwOFU0WeqdAfUcnjjW2JBmQJ4El0UMk
         hklKhWh2Q7T2GufC1G0eggF4kN3pvG9AksHU1wPLFdizEN+VBZMfDyWvRoWWs/08lvow
         w29ScvNlLzKSawPqQKlLhA6YvssM62YXyqS/Jv9JtHHw/v52WwufkuDYtTidUjZN0CNc
         KSgIIR4MDV7BoPPns6Utu0QIkHHJLpC/1c5OYx8N4vMsFFNYoZQZ0gZUQRH2FvW+Y0m0
         sCl7EwAWFjZONqBmZGmBA+zS/ykQVeMLYjOOcnrV7l+uGc70/HQaaaAdDB5hIzex+/U8
         91Sg==
X-Forwarded-Encrypted: i=1; AJvYcCUaQe/YiBL3DahXjr3x11eXqBHGQOdpQoagVL6ouN32PfZnpugkeEUv6czE1EWZyUwPr/KWZCw35W0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxkZzTDiEyo3zh7Yu6h4tcKqdGyJYd1AXI5YBhk5ZTdhUe17jeR
	tPxN5F429l7Bk5PrQCDIBfVOf6C8zovA9PtSpEqOvUf5lragLuJGLHcCU5zMxuYPVJgM4BRGA6g
	=
X-Gm-Gg: ASbGncs7e9r8lchRgxucUeCGXmtjU9hemoCDmjR/Hwn+xk+xqg2PrmZi2yLPOkCvicV
	VoTxa0rRUzzM/j3uAbyPK4uaG3029rQkJA7DvyCfZOS4z7hZfRfUHmI4aLEEE5rXXZhQYNYl9pm
	aVI/QpsRtw95P/j9LzNu+gLY6AVs5nuQIDzzGoQ0uY4Eh+xP3+UbiTd5cVf8fPH6unr31ho5+HV
	ySWwt9GIFKPnizJUCSP+SiSmq8pbUfVIlgSFtLkrZvi/ifDET2W8gZOudiiRSZGZwzMmapHuwVF
	IpYPtqA7qK3nR8vSgfZ8m3fwpQR0wJfVGTDvwL9FYJgDRbRzq6CJpZlIBMqG+Dj8
X-Google-Smtp-Source: AGHT+IF5U0V92ig7lw9c/he+509NaNxI2WMMl0g29gIXl9BgdyW2TJtIJF3BQ3lf6MpdW9IKQX8Guw==
X-Received: by 2002:a17:907:2d07:b0:ac7:e815:6e12 with SMTP id a640c23a62f3a-ad1a4a09f38mr1091046466b.33.1746541952305;
        Tue, 06 May 2025 07:32:32 -0700 (PDT)
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: Xen-devel <xen-devel@lists.xen.org>,
	xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 0/4] LivePatch signing support
Date: Tue,  6 May 2025 15:32:12 +0100
Message-ID: <20250506143218.1782603-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Live patch signing support was mentioned as future work in the design
document several years ago. This series finally implements support for
it since it is a requirement of Secure Boot to prevent loading unsigned
code into Xen.

Note that this series depends on another patch that has not yet been
merged:
xen/lib: Export additional sha256 functions
https://lists.xenproject.org/archives/html/xen-devel/2025-05/msg00222.html

Jennifer Herbert (1):
  livepatch: Verify livepatch signatures

Kevin Lampis (1):
  livepatch: Embed public key in Xen

Ross Lagerwall (2):
  docs: Introduce live patch signing
  crypto: Add RSA support

 docs/misc/livepatch.pandoc      |  104 +-
 xen/common/Kconfig              |   18 +
 xen/common/Makefile             |    1 +
 xen/common/livepatch.c          |  175 ++++
 xen/common/livepatch_elf.c      |   55 +
 xen/common/mpi.c                | 1724 +++++++++++++++++++++++++++++++
 xen/crypto/Makefile             |   13 +
 xen/crypto/rsa.c                |  194 ++++
 xen/include/xen/livepatch.h     |    5 +
 xen/include/xen/livepatch_elf.h |   18 +
 xen/include/xen/mpi.h           |   63 ++
 xen/include/xen/rsa.h           |   72 ++
 xen/tools/extract-key.py        |   37 +
 13 files changed, 2427 insertions(+), 52 deletions(-)
 create mode 100644 xen/common/mpi.c
 create mode 100644 xen/crypto/rsa.c
 create mode 100644 xen/include/xen/mpi.h
 create mode 100644 xen/include/xen/rsa.h
 create mode 100755 xen/tools/extract-key.py

-- 
2.49.0


