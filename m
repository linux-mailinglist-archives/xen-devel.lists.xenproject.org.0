Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6848AE7AA
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 15:13:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710597.1109881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzFxY-0001T5-44; Tue, 23 Apr 2024 13:13:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710597.1109881; Tue, 23 Apr 2024 13:13:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzFxY-0001Qr-10; Tue, 23 Apr 2024 13:13:20 +0000
Received: by outflank-mailman (input) for mailman id 710597;
 Tue, 23 Apr 2024 13:13:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nc7B=L4=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rzFxW-0001Ql-Fz
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 13:13:18 +0000
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [2607:f8b0:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f6dc09e-0173-11ef-909a-e314d9c70b13;
 Tue, 23 Apr 2024 15:13:17 +0200 (CEST)
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-3c749aa444fso2428552b6e.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 06:13:17 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 fp29-20020a05622a509d00b004364fd7a9d9sm5175578qtb.58.2024.04.23.06.13.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Apr 2024 06:13:15 -0700 (PDT)
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
X-Inumbo-ID: 3f6dc09e-0173-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713877995; x=1714482795; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5fQ3V5m3BXitveyTx5JgYokFkwajR8qNfhkyRASExvQ=;
        b=VxA/JNGv2xDzgqZ/QE6keRFy2TC6wu/gZokJWck3b/8WZVlt2cVJH03By1qEiBMs9B
         shDnPj1Yuok/k2kiHGkV6xWYKS8sWlbWMgX/WEMaEIkzuF6hsL+yxYJDu5163Aqcsbvh
         8Orpo1dJ7X3lU+NAwQt6NizpJdGYj3pf/YLoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713877995; x=1714482795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5fQ3V5m3BXitveyTx5JgYokFkwajR8qNfhkyRASExvQ=;
        b=FRC/xkg2I5z379V3jDjwukAESbWsTbt02C/ZRPdNbMBIhrvo1cno9iX5LH1OWJ94Ox
         KJUlx1ckLycEoR0VJpCC8goWDrPnMckrEjqNNJiqMobBnowrHY9CjJTKJeHppfjeodd6
         enC8BWlFIW/HdSey1Tq73qR0cQk0kdqqYMuviowDufjhNYCSwpfSCIA0Nuz/I28KaWvd
         mWWng4gU6VrBKPgof8lLZ/OQYONxYzVCA/FWTuHzE8O/ooxccGwTW/xj89mL1TgA3z7V
         mknEfbePRMQrVLI5n1tsEQ/zucx7E2SZGAc1HF8yRH8CU506ahgJz5+dLKZ4YoSeYqZR
         QO0g==
X-Gm-Message-State: AOJu0YzaoG19ON9I4bHo5HnAguN+Iiru3lcFkK59QMgknCcl2/cKktl3
	OE3FWBSQ7B/WPL2jaKBPZPJtj+1B0rX+GjN0aK5pFy7FWAB2bTZWu9AhZy8WbnkWqE8LzNN03Tk
	z
X-Google-Smtp-Source: AGHT+IEWLRPDKvoT0RUdgAwrehlmrwonvSD27AsiGGMOjRtVYr/Z0sHimA3ZUkcTtwvLydaUU65crw==
X-Received: by 2002:a05:6808:2125:b0:3c8:329d:e557 with SMTP id r37-20020a056808212500b003c8329de557mr5613992oiw.14.1713877995618;
        Tue, 23 Apr 2024 06:13:15 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 0/4] livepatch: minor bug fixes and improvements
Date: Tue, 23 Apr 2024 15:12:45 +0200
Message-ID: <20240423131249.29825-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

Following series contain some minor bugfixes and improvements for
livepatch logic, both inside the hypervisor and on the command line
tool.

Thanks, Roger.

Roger Pau Monne (4):
  xen-livepatch: fix parameter name parsing
  livepatch: introduce --force option
  livepatch: refuse to resolve symbols that belong to init sections
  x86/livepatch: perform sanity checks on the payload exception table
    contents

 tools/include/xenctrl.h            |  3 ++-
 tools/libs/ctrl/xc_misc.c          |  7 +++----
 tools/misc/xen-livepatch.c         | 27 +++++++++++++++++++++++----
 xen/arch/x86/extable.c             | 18 ++++++++++++++++++
 xen/arch/x86/include/asm/uaccess.h |  4 ++++
 xen/common/livepatch.c             | 25 +++++++++++++++++++------
 xen/common/livepatch_elf.c         | 18 +++++++++++++++++-
 xen/include/public/sysctl.h        |  4 +++-
 xen/include/xen/livepatch_elf.h    |  2 +-
 9 files changed, 90 insertions(+), 18 deletions(-)

-- 
2.44.0


