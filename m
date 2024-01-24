Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0ED83B377
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 22:00:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671237.1044491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSkLY-00070V-6w; Wed, 24 Jan 2024 20:59:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671237.1044491; Wed, 24 Jan 2024 20:59:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSkLY-0006ym-42; Wed, 24 Jan 2024 20:59:44 +0000
Received: by outflank-mailman (input) for mailman id 671237;
 Wed, 24 Jan 2024 20:59:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LRLw=JC=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rSkLX-0006yg-4g
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 20:59:43 +0000
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [2607:f8b0:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d1d86a6-bafb-11ee-9b0f-b553b5be7939;
 Wed, 24 Jan 2024 21:59:40 +0100 (CET)
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-3bd5c4cffefso5858916b6e.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2024 12:59:40 -0800 (PST)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 d3-20020ac80603000000b004260b65b4f7sm4643391qth.97.2024.01.24.12.59.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 12:59:37 -0800 (PST)
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
X-Inumbo-ID: 7d1d86a6-bafb-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706129978; x=1706734778; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rs+2M8KTyAKehsizBSzR0MS8R8OUBfDLhnXKxIq1CfM=;
        b=iTXCi5HTJTaveQ/7DNMqqwickQeqpLANlXZXvlOwulb3RfgYZhHjeZM5bxma7sw0qO
         mTk+vlKsmph+AoWgaIsNekLdncBivcIpPNFp/x1L1IPg9L3AAm47NJDzXEok8hkEqEyx
         ldiO4sgKQrB6bjCAtAUg6ExVHkm51K3swUJj0HAdHmq1s3iMlZaiDfX2Hk6GxfOz4uN9
         tRH0j9I3XYZjt98gNIjXmnc0uYGf6plVxs6fXOCxLPZEo1PpsMxTSd1ANvBJD7fRTRw5
         MyFhcS6wjPusrz3A3c9URGfNYPIhdJr05k6w2/W+5f8xOUCR+4J9fDuqVKO8+4dX5p5O
         /vUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706129978; x=1706734778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rs+2M8KTyAKehsizBSzR0MS8R8OUBfDLhnXKxIq1CfM=;
        b=Gvspvd3H49uZ4Q4DrpmldkXbHBTkBEhf5r5+/g+jFhiLTiC6XJPZ3NKwZdbAQbep2g
         Ss8F47jacOg2Ozv/hQ5ox2SoWbG9l6ZRANRZqqEpRe/pJ47ShfUrcEQW1pxsk1Mzdp9X
         5UorGEtNn7PP4zyPJ2/wD2jOJ5YHW69pS24X33CbJ9q0N92jJfMU9QETidwQeqNLc+6c
         m7XHwLyYOYDFvWfGnxpcC0pe+z43Ut92Mtk9370B/85R+OucWqPAM16sSLEL20ZWppSr
         LTFu5fExFCLcPk5jB+28IteAoCrYSTaPNQ0wf15DL/m01nc74DH76FT7pN1o5ibtNgoo
         ngIQ==
X-Gm-Message-State: AOJu0YwNQKCMQUEc37sf/ed5pAFUVVVhB93aj1c+Bf9XTbhuwIkv2hdm
	OF5VUX01MM2QnEQDNFu12utBuxgoNaa4/0Ah99iu4KjcVBQ4s4PfMJmStvad
X-Google-Smtp-Source: AGHT+IEJsVpIMEV0AcFvRbfw4fyAyzqUnAvQ6jKY6cjEygADi1rWYzfBl4f5VAsMKIakVpTPm8ktKg==
X-Received: by 2002:a05:6870:15c8:b0:210:9dda:f938 with SMTP id k8-20020a05687015c800b002109ddaf938mr3638523oad.107.1706129977968;
        Wed, 24 Jan 2024 12:59:37 -0800 (PST)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 0/2] Improve xenpm output under HWP
Date: Wed, 24 Jan 2024 15:59:20 -0500
Message-ID: <20240124205922.67266-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Have xen return -EOPNOTSUPP for more pmstat hypercalls instead of
returning misleading data under HWP.  Enhance xenpm to handle
-EOPNOTSUPP and provide more informative messages.

Jason Andryuk (2):
  pmstat: Limit hypercalls under HWP
  xenpm: Print message for disabled commands

 tools/misc/xenpm.c        | 19 +++++++++++++++----
 xen/drivers/acpi/pmstat.c |  5 +++++
 2 files changed, 20 insertions(+), 4 deletions(-)

-- 
2.43.0


