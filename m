Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF4983CAA6
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 19:16:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671697.1045174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT4G7-0004Kj-W5; Thu, 25 Jan 2024 18:15:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671697.1045174; Thu, 25 Jan 2024 18:15:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT4G7-0004HX-TN; Thu, 25 Jan 2024 18:15:27 +0000
Received: by outflank-mailman (input) for mailman id 671697;
 Thu, 25 Jan 2024 18:15:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KpLG=JD=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rT4G6-0004GD-15
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 18:15:26 +0000
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [2607:f8b0:4864:20::736])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5929adf-bbad-11ee-8a42-1f161083a0e0;
 Thu, 25 Jan 2024 19:15:25 +0100 (CET)
Received: by mail-qk1-x736.google.com with SMTP id
 af79cd13be357-783c919d9f2so2321185a.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jan 2024 10:15:25 -0800 (PST)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 wg8-20020a05620a568800b00781b8f4c89asm5265899qkn.43.2024.01.25.10.15.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jan 2024 10:15:22 -0800 (PST)
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
X-Inumbo-ID: b5929adf-bbad-11ee-8a42-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706206523; x=1706811323; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZezEyUSDnqquRJb9HB6UmZ+I34K2f3fyhppolYsTpgs=;
        b=Oo4E5FPSvrBHjy+gbAodl4DxoNsqnBdRyzhBDL2fe58/foadhqhs2cCPhStKb6Er+V
         05U04Z2kTpHT6JRkd/B3RXWhXkmgZMgKdIVfoCPzSIFXe95iQYNe6Sd8SFkgs3ykqsHE
         A1NMkXoBmxOzz/nhJ37+c3v8oQ1kjlX2LJdIWeN6us8auSAGThUVIj/KTigMR1kXjRYh
         JBYvcRUABrGJezyshDOLP8s0P9SppPZYTNO8nxFi2FsaNL7jrEzNPNglR9WupyKqnezT
         29MPrh3YYrsJ0eTVSqMXFeyZVFS0Y30cdrbDDJnDZqT5nB+15LdRYnG2v6fOf3D1gKeb
         LvuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706206523; x=1706811323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZezEyUSDnqquRJb9HB6UmZ+I34K2f3fyhppolYsTpgs=;
        b=qXTsKujvUETy16kp8bYhxK3ZqUqE6HSc52O9aeDLEEM8/RrTf5+rN/fqHC3hf08+ah
         yoRDYDhcrmG8k/gIgSqVhi5a6UqKdam47AVt+xBbPXyCBkJ2SgPciFrEVtUw9KcuE0Vp
         4vy6nm/aEjajqCynKkZgqXKELMrwL/vI1mG4LxbBCSB9L0SQat6ilGbUljN8mIYuy0wS
         dTt9CoQoYr187lWLsSMr/iw9TW4gcji4TH6VNl4p3k+EnbUMBN2E+83v6t31lwUmci6l
         qRmtVG0duypHYfW3NGB84BZwyZTu9IEbP6BhzRm7Ft0w/IrHSMQOM7x9CCKH8OfwQ6K7
         wMFA==
X-Gm-Message-State: AOJu0YwaCD4UnY70MqXD+ZABF5reaL2TbKBOjLBS2hujvgeiDg5ChLlo
	jdm8lyw8TQjqS40FyZ6ZQ7ntK7vSgOk548Z/9E/zap7DV5xYqBBvA1magzNR
X-Google-Smtp-Source: AGHT+IGlceR/5cNScSUxO5c/ILPwA3lLUY+Fe7+hruScZ1dnxzQarqVPwtrrBvP+LZ+De0ulvw/Zxw==
X-Received: by 2002:a05:620a:4383:b0:783:a973:f9a1 with SMTP id a3-20020a05620a438300b00783a973f9a1mr127468qkp.104.1706206523142;
        Thu, 25 Jan 2024 10:15:23 -0800 (PST)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 0/2] Improve xenpm output under HWP
Date: Thu, 25 Jan 2024 13:14:52 -0500
Message-ID: <20240125181454.50534-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Have xen return -EOPNOTSUPP for more pmstat hypercalls instead of
returning misleading data under HWP.  Enhance xenpm to handle
-EOPNOTSUPP and provide more informative messages.

Jason Andryuk (2):
  pmstat: Limit hypercalls under HWP
  xenpm: Print message for disabled commands

 tools/misc/xenpm.c        | 19 ++++++++++++++++---
 xen/drivers/acpi/pmstat.c |  5 +++++
 2 files changed, 21 insertions(+), 3 deletions(-)

-- 
2.43.0


