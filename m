Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2886B971D3F
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 16:55:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794626.1203634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snfnR-0003aZ-7e; Mon, 09 Sep 2024 14:55:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794626.1203634; Mon, 09 Sep 2024 14:55:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snfnR-0003YX-44; Mon, 09 Sep 2024 14:55:17 +0000
Received: by outflank-mailman (input) for mailman id 794626;
 Mon, 09 Sep 2024 14:55:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WnCw=QH=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1snfnP-0003YR-Or
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 14:55:15 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84bc4e78-6ebb-11ef-99a1-01e77a169b0f;
 Mon, 09 Sep 2024 16:55:13 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5c25f01879fso5547140a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 07:55:13 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25c7277bsm346887666b.102.2024.09.09.07.55.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 07:55:11 -0700 (PDT)
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
X-Inumbo-ID: 84bc4e78-6ebb-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725893712; x=1726498512; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UyE+ad1TEBh/iaYWJVdbhIA6jBbgzDB9YAuVJZS1BUw=;
        b=LUIzmsQVp+pzjggcNT5d71yBXqLpYxAGZOdvgTwkiCcpY0kzZpNGgS5m+YuwkyRYLz
         OMTb2aOg4mJH7b6XL1CDA9UaLA0T71F26TMwp5dr0TFrrwPHUsMioLd68wLWaFrSZC3O
         gRZR2FiPnb+8Qys0nUxPo8K6eynHUSBP4gPMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725893712; x=1726498512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UyE+ad1TEBh/iaYWJVdbhIA6jBbgzDB9YAuVJZS1BUw=;
        b=Q6vi4SWD6qajvmAyD40XO71YaN7Fi10ndfAF3Mrwcm+CXR4nK4TuMatpk5iJGtdpQE
         ncG7kIBZbHtzGM+DG98OmKO2a6Ogvtr8GSyYgTTAy+qLI29WYqx7fy1QulEA0Rqq7m0X
         /gSnGWxC3mMEkQtvZpCXKTWhIwjNtyiEzi3rhOqROUVwTG4/N1swe10KcAviCPOfMyi2
         uFECMRcqeapRNeK4NYMXxMHSudPe0ann3pAHxF3iBTQcRleAcgZKhd3EIgMnww/AQ9YZ
         3Z+8tD4PWoixoNXSHkNrc37W8XDO2cJem6unUwIIN69ilYzBhHfBfEhH5w9YnrPzzteW
         CAPA==
X-Gm-Message-State: AOJu0YxXIQTvyIk2YIioZFLv2S9Va1ARw3M8SI7lMx2SPQmkLGkAGFRA
	LoAJG4+/peM+0W11YaH5GPZmOmGnx4YWFG+flk/N0L2kat5NFF/wLW2pQ4pDw98TKptyLXcxn1Z
	X
X-Google-Smtp-Source: AGHT+IFrrpIO+Y5g5aw3o1nm9tkT0KoaqlazGyL08w8+S2nkrAMEZ+WazVqZghIHkOaOxcZLhm/jqw==
X-Received: by 2002:a17:906:730f:b0:a8d:40f9:afda with SMTP id a640c23a62f3a-a8d40f9b201mr448267466b.31.1725893711803;
        Mon, 09 Sep 2024 07:55:11 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5 0/4] x86/time: improvements to wallclock logic
Date: Mon,  9 Sep 2024 16:54:51 +0200
Message-ID: <20240909145455.7517-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

This series started as an attempt to change the default wallclock
preference from EFI_GET_TIME to CMOS RTC, but has grown quite a lot.

Thanks, Roger.

Roger Pau Monne (4):
  x86/time: pull cmos_rtc_probe outside of function and rename
  x86/time: introduce probing logic for the wallclock
  x86/time: introduce command line option to select wallclock
  x86/time: prefer CMOS over EFI_GET_TIME

 docs/misc/xen-command-line.pandoc |  19 ++++
 xen/arch/x86/time.c               | 152 ++++++++++++++++++++++++------
 2 files changed, 144 insertions(+), 27 deletions(-)

-- 
2.46.0


