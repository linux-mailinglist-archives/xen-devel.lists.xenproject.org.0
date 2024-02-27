Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 868BC868EBA
	for <lists+xen-devel@lfdr.de>; Tue, 27 Feb 2024 12:25:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686017.1067540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1revaf-0007YW-Cs; Tue, 27 Feb 2024 11:25:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686017.1067540; Tue, 27 Feb 2024 11:25:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1revaf-0007WM-A9; Tue, 27 Feb 2024 11:25:41 +0000
Received: by outflank-mailman (input) for mailman id 686017;
 Tue, 27 Feb 2024 11:25:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7gEZ=KE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1revae-0007WG-MM
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2024 11:25:40 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef19acba-d562-11ee-afd6-a90da7624cb6;
 Tue, 27 Feb 2024 12:25:39 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5101cd91017so6097244e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 27 Feb 2024 03:25:39 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 t19-20020a05622a181300b0042e56fb8e0bsm3451425qtc.93.2024.02.27.03.25.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Feb 2024 03:25:37 -0800 (PST)
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
X-Inumbo-ID: ef19acba-d562-11ee-afd6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709033138; x=1709637938; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S+zlHOY3NrHjR8jd8VF14b6wXZRMhCsLjnfVmMAKV4Y=;
        b=QiF3t8uTt3ZnA930rxKmRnMMXVWl15EsCVnpGyUo0ZYXN1kKW0b+rxbXZ0BTXbg9I5
         oY+uouKkUj6xOhpFuEiwM8e/LlyNRYISr9faCzqF4Em1cWgQCXd5RxsHTfLSMSq2eEji
         TMAWUJGwijoWQ/ThNzc+D8L3LMvI0vqABu2zU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709033138; x=1709637938;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S+zlHOY3NrHjR8jd8VF14b6wXZRMhCsLjnfVmMAKV4Y=;
        b=wk1WmakoZXmh+6u4jiBr9+F0wPpeMk40rVl48o9zxlTg8Yzu6or8XjXzNWkV5lcZoM
         8rE9UktlvMNhb25rAS4zLxDgSS/mmnScxe8yaKL2Ull6GgJ4OvRvFob/xUzIhkU120LE
         1/KQWgsYCb7aUJjXZL9yrHbAiPblyfRlS4uZ+QEf2DzyeU/CXOOU4+iqjg+PHXAXcobt
         n77f1PlmDxdNmKU9euCAmrk0eqyl4d2Fi7H3LCNOitIQz9wj2hMC1yTA1rQL1RJaiUF/
         21J0lEUD8SqhYZ83+ARuAxhBHJQ4vbRLzx0MJgaMefiEOiOj19Xn85hYzUvMxnfYQygJ
         QlPA==
X-Gm-Message-State: AOJu0YykxeV1SwlGVREIHL3+Q2CGIXJh6zXoq/93vZlc8kS3ldFxeimB
	9fReUODlOZZzuIiWVw6+8OiMsU4eO4HjzohbwbjFQZoM0/pZ7Qx07kBKwFGQbhJRVMxKb4hqotH
	m
X-Google-Smtp-Source: AGHT+IGF2bw8FPDMYaFcjGbBwmbWyrti/TTWBrM5mh/itTDXZZJVI/edUAjEpi3mtT6h0loWW2VS+w==
X-Received: by 2002:a05:6512:acf:b0:512:ec7d:7831 with SMTP id n15-20020a0565120acf00b00512ec7d7831mr6753187lfu.26.1709033138410;
        Tue, 27 Feb 2024 03:25:38 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 0/5] xen/livepatch: fixes for the pre-apply / post-revert hooks
Date: Tue, 27 Feb 2024 12:25:23 +0100
Message-ID: <20240227112528.4540-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

The follow series contain a misc of fixes mostly related to the usage of
the pre-apply / post-revert hooks.  The norevert test is also fixed to
work as I think was expected.  Finally both the no{apply,revert}
tests are fixed to build properly, as the files where previously
unhooked from the build system completely.

I'm unsure how useful the apply and revert hooks really are, as without
calling the internal apply/revert functions the state of the payload
structure is quite likely inconsistent with the code expectations.

Thanks, Roger.

Roger Pau Monne (5):
  xen/livepatch: register livepatch regions when loaded
  xen/livepatch: search for symbols in all loaded payloads
  xen/livepatch: fix norevert test attempt to open-code revert
  xen/livepatch: properly build the noapply and norevert tests
  xen/livepatch: group and document payload hooks

 xen/common/livepatch.c                        | 94 +++++++++++--------
 xen/common/virtual_region.c                   | 42 ++++-----
 xen/include/xen/livepatch.h                   | 32 +------
 xen/include/xen/livepatch_payload.h           | 37 ++++++--
 xen/test/livepatch/Makefile                   |  4 +-
 .../livepatch/xen_action_hooks_norevert.c     | 22 +----
 6 files changed, 112 insertions(+), 119 deletions(-)

-- 
2.44.0


