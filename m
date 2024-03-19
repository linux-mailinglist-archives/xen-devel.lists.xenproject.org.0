Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7083287FFE1
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 15:48:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695420.1085130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmal5-0006BM-Ju; Tue, 19 Mar 2024 14:48:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695420.1085130; Tue, 19 Mar 2024 14:48:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmal5-00068l-Gt; Tue, 19 Mar 2024 14:48:07 +0000
Received: by outflank-mailman (input) for mailman id 695420;
 Tue, 19 Mar 2024 14:48:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CQvM=KZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rmal4-0005fD-8s
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 14:48:06 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1b4686c-e5ff-11ee-afdd-a90da7624cb6;
 Tue, 19 Mar 2024 15:48:05 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a3fb8b0b7acso553897766b.2
 for <xen-devel@lists.xenproject.org>; Tue, 19 Mar 2024 07:48:05 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 xi8-20020a170906dac800b00a46af0fbe83sm3335059ejb.76.2024.03.19.07.48.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Mar 2024 07:48:04 -0700 (PDT)
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
X-Inumbo-ID: b1b4686c-e5ff-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710859685; x=1711464485; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NHqVyHLUrPDfT7mviOp2ST2s9iKsUHLn9cXgoLEhrV0=;
        b=Rf2EQYzXqUNloTGGeA1luTlDeiNejudanWunuCe0Ew+nMTb4opjGhRmPfUBnziqTXl
         WpoHBg+TNJ7eM7Eib9DYht/QOIBuq5BkIdq8mUoFUqKd4IyqxiHRMTZqI/wqZh6XJBvw
         EhCJz/dcGT9Je7JcZN5kC21ccgKgEHDU/l55Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710859685; x=1711464485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NHqVyHLUrPDfT7mviOp2ST2s9iKsUHLn9cXgoLEhrV0=;
        b=VT9k+KG3zdO5UQzohShNMygTUGsUyCcnroftY0qNkPQxZYWstEe6ONZoSRy0IK8Md8
         /Vbsb1c0JW0UhkbpA3bUs6rLUxRwQDwi2JxtyB6mZGwByjPmmGGmwOGlipSmKQx+j2+C
         vzEBH4pIgauHAZP2B42BvpCFt+JsiAPK6pEpqCiuKN0wpDqZB8CMCzsDt0mkfPJFSg4Z
         LU/ppIkKe01vjBolcc32umCV5qI14bLTtSGkhFH2DTGW38ed3v3pJxx4OpZ65nb2GoDi
         gJQD9IfyfODRnnQkewh/3Ypro/TL+WC6XFz2htX2POXY9NO5oOiGshJsKgeHSntOVvdf
         9kog==
X-Gm-Message-State: AOJu0YyhCsJ62X3C48uo9IEI6itYJXAr/6V2Xd9vjhtClnR44FUtn5Zg
	/mlds1PwSm7lzX0K3Z9ghlatj4IpUypWvrsTQjJqxi+LPVWjJlLcrtTkrhmHO/f25aDRcV4ndI6
	v
X-Google-Smtp-Source: AGHT+IGF6onu9JpmMF67TiMpmEBXGcf/E25UVSF0RvOGq0Alon/sCKeCdIoM5MhRUjkXRUoP/69CCg==
X-Received: by 2002:a17:906:1b03:b0:a46:d913:bb7d with SMTP id o3-20020a1709061b0300b00a46d913bb7dmr1754912ejg.56.1710859684812;
        Tue, 19 Mar 2024 07:48:04 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 0/2] x86/boot: More watchdog fixes
Date: Tue, 19 Mar 2024 14:48:00 +0000
Message-Id: <20240319144802.3894710-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Andrew Cooper (2):
  x86/boot: Fix setup_apic_nmi_watchdog() to fail more cleanly
  x86/boot: Support the watchdog on newer AMD systems

 xen/arch/x86/nmi.c | 36 ++++++++++++++++--------------------
 1 file changed, 16 insertions(+), 20 deletions(-)


base-commit: d2276b86e5eb8dd2617d917f7b49cdd1f29ac299
prerequisite-patch-id: 9595e30e0dde42b57dbad93a40db2cd338b26a58
-- 
2.30.2


