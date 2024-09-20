Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F7B97D3BF
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2024 11:37:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801077.1211103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sra4X-0000QW-Sp; Fri, 20 Sep 2024 09:37:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801077.1211103; Fri, 20 Sep 2024 09:37:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sra4X-0000OO-Pa; Fri, 20 Sep 2024 09:37:05 +0000
Received: by outflank-mailman (input) for mailman id 801077;
 Fri, 20 Sep 2024 09:37:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wh1w=QS=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sra4V-0000OC-NU
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2024 09:37:03 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3e98b89-7733-11ef-a0b8-8be0dac302b0;
 Fri, 20 Sep 2024 11:37:02 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5c4146c7d5dso2399243a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Sep 2024 02:37:02 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c42bc88d82sm7030921a12.81.2024.09.20.02.37.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Sep 2024 02:37:00 -0700 (PDT)
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
X-Inumbo-ID: e3e98b89-7733-11ef-a0b8-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726825021; x=1727429821; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SIELB5IFnYt1OaK5gYb5qD4eQleLAnvXFgrDIsWDpAQ=;
        b=FrRfrXgtyF7L8qYUjZ5/ZNY0tdkSYyYavYqaPm+RtiqRdW0mP5q2lNdi9B3yMCG1AZ
         jPC5Rl/X9sZHCCqVQAPRhcflFv5sKj6h+Jv8mEpaHJcFW/1CAP9zgGr03ytYzQGajOpX
         MlovpWrY0ooUaw4i82Cud4IGfD6FS6C3r/+dc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726825021; x=1727429821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SIELB5IFnYt1OaK5gYb5qD4eQleLAnvXFgrDIsWDpAQ=;
        b=Gg8ySxzBhyxr9gh9l6NSu3EZPiop0c0YPUc447Q4Uaj7JpfVE6GdYNLUWS0qTvb79N
         00TEtYAWwXWKtKxJrGIa8hmHCdknfRKlA9o+poQ7tIz/1WYAGcOLocJthSTl/XsR7DwR
         QTVmHImjahrvVW45OIIw5ZJryb3Rh3bm0AbUR2dL0PRcHukk7zaHbQNGtQSa3uS8PbKi
         P2g991jP1uZImx9LAUer8HGgi1mwaAcxBc/CvBTEFNMStYDokIplil2gXgdD5mAWW82e
         dv+hafdEyHgFsezQ+tTB3GUQ3v923N20WtNoTj9vuFsuttgRfe7e0qyqVZkMqYfMugL0
         YkbQ==
X-Gm-Message-State: AOJu0Yz/Cj7pZw0bmyrHn5EqdQES7hU8fD+LqxvpQixkAQRboNdzrp93
	pdkeyzoA/j1kIp1eGfTqCewNepw7QDtmozK3jo9f0T5ldwkrbachL1sDsglyGxc4liaDx8PS3yb
	S
X-Google-Smtp-Source: AGHT+IEmdO1bE6RH81r6Sgb7+rV0anCZ8rfUGk+S8VaSCxOSTvI3pcNA8rmkieSLuG5/I9rQOPbfhQ==
X-Received: by 2002:a05:6402:2499:b0:5c2:4a98:7520 with SMTP id 4fb4d7f45d1cf-5c464a60ae0mr1547534a12.31.1726825021472;
        Fri, 20 Sep 2024 02:37:01 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 0/3] xen/livepatch: improvements to loading
Date: Fri, 20 Sep 2024 11:36:52 +0200
Message-ID: <20240920093656.48879-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

Following series attempts to improve the loading of livepatches,
specifically by doing the Xen build ID check ahead of processing any of
the sections in the livepatch payload (alternatives, bug frames...).

Thanks, Roger.

Roger Pau Monne (3):
  xen/livepatch: simplify and unify logic in prepare_payload()
  xen/livepatch: do build-id check earlier
  x86/alternatives: relax apply BUGs during runtime

 xen/arch/x86/alternative.c                 |  29 +++--
 xen/arch/x86/include/asm/alternative.h     |   3 +-
 xen/common/livepatch.c                     | 121 ++++++++++-----------
 xen/test/livepatch/Makefile                |   5 +
 xen/test/livepatch/xen_alternatives_fail.c |  29 +++++
 5 files changed, 114 insertions(+), 73 deletions(-)
 create mode 100644 xen/test/livepatch/xen_alternatives_fail.c

-- 
2.46.0


