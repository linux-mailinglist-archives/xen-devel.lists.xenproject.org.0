Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2AA871EA8
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 13:12:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688768.1073323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhTdo-0007NI-Fv; Tue, 05 Mar 2024 12:11:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688768.1073323; Tue, 05 Mar 2024 12:11:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhTdo-0007Lk-BU; Tue, 05 Mar 2024 12:11:28 +0000
Received: by outflank-mailman (input) for mailman id 688768;
 Tue, 05 Mar 2024 12:11:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mb5t=KL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rhTdm-0007LZ-NU
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 12:11:26 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c7236b5-dae9-11ee-a1ee-f123f15fe8a2;
 Tue, 05 Mar 2024 13:11:24 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-565c6cf4819so11057987a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Mar 2024 04:11:24 -0800 (PST)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 gg4-20020a170906e28400b00a45b1194dacsm11429ejb.126.2024.03.05.04.11.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 04:11:23 -0800 (PST)
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
X-Inumbo-ID: 7c7236b5-dae9-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709640684; x=1710245484; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f2ZND4JB6JB7qPw7eT3278I+2BCpLYACdoJCu9lm2BY=;
        b=p+bRHPQhZSm7fhLtGTQ0ejCkCuTHMrQKIg3B7m4M7RftdD4Ncpgh5X/RSbTsLZzTBH
         2Ba1IbL3YP2ePt0VQx0iUrcRh4abuuG2jtmGa8NnMFKXGnjUeZTWGiwbfI9slQHIyju6
         aLM8AeZ5xej3wp5XeqY9sUVPdSkIncDhij+R0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709640684; x=1710245484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f2ZND4JB6JB7qPw7eT3278I+2BCpLYACdoJCu9lm2BY=;
        b=cl9lm5bdBfgs4TgodOtQWhkiwGZH1NjmqDpk1hABPoukoc8l71oBBXffyI4/eYpHjR
         vlP/jYLf8U4EXyhuKbm/jSQuOuhlHrkvCU7tIiJqpFVPVLDzZdMQ4aiImrW0NpQiA+oh
         ZILicidaWwsHtmEpKGMvmI6tVQ0blYvUHIRm/Hrhz9l8WCQF5dmJCTWhoggO3npsaZLj
         WXgKtk5+ddROq6S2aB8DMBOcgN5r5t883ilUZlM8Zof/esWaEqhF7UMgpQqnJE2onKZP
         QFGiajBw6WP4Zzn28Oq4xOptMLpQ+7CryyjAwjjjyeuBG3lmRLrw+F6b6KG35H1JhuCu
         yqhg==
X-Gm-Message-State: AOJu0YzD7chlMknGjbYhku+7pONlNsTrQWvLBkbxwm9/hVvai626eFzD
	q+J4fkb3vZhue1LzZo5LQW0KAqSwh8CqQ3dEgNAczZVZqD6C7dAbskkObgajLHcAV0dy4QeSosE
	c
X-Google-Smtp-Source: AGHT+IGc4cZT9A/xbWBeAKYKw2cx50WBdiu4NFhYnOjLmHXlvdj0/HnWU/d+1FKwLzn+VrnzAj3BVA==
X-Received: by 2002:a17:906:4ac4:b0:a44:52ec:b9e7 with SMTP id u4-20020a1709064ac400b00a4452ecb9e7mr2260939ejt.16.1709640683789;
        Tue, 05 Mar 2024 04:11:23 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 0/3] x86/livepatch: Reinstate the ability to patch .rodata
Date: Tue,  5 Mar 2024 12:11:18 +0000
Message-Id: <20240305121121.3527944-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This capability was lost when fixing liveaptching vs CET, with a TODO to
fix...

Testing (In progress):
  https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1201429148
  https://cirrus-ci.com/build/5510098735333376

Andrew Cooper (3):
  xen/virtual-region: Rename start/end fields
  xen/virtual-region: Include rodata pointers
  x86/livepatch: Relax permissions on rodata too

 xen/arch/x86/livepatch.c         |  4 ++--
 xen/common/livepatch.c           | 10 ++++++++--
 xen/common/virtual_region.c      | 33 +++++++++++++++++++++++---------
 xen/include/xen/virtual_region.h |  8 ++++++--
 4 files changed, 40 insertions(+), 15 deletions(-)


base-commit: fc84b4a5a37b9250d87ef63983b48e1953bba6d1
-- 
2.30.2


