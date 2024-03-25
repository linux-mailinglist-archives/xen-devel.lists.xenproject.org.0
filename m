Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F2B88986C
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 10:39:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697646.1088602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rognQ-0001Bx-CS; Mon, 25 Mar 2024 09:39:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697646.1088602; Mon, 25 Mar 2024 09:39:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rognQ-0001AB-9a; Mon, 25 Mar 2024 09:39:12 +0000
Received: by outflank-mailman (input) for mailman id 697646;
 Mon, 25 Mar 2024 09:39:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lWJZ=K7=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1rognO-000193-Fn
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 09:39:10 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87a3be87-ea8b-11ee-afe3-a90da7624cb6;
 Mon, 25 Mar 2024 10:39:09 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a46ea03c2a5so711615366b.1
 for <xen-devel@lists.xenproject.org>; Mon, 25 Mar 2024 02:39:09 -0700 (PDT)
Received: from rayden.urgonet (h-217-31-164-171.A175.priv.bahnhof.se.
 [217.31.164.171]) by smtp.gmail.com with ESMTPSA id
 bw26-20020a170906c1da00b00a4650ec48d0sm2891067ejb.140.2024.03.25.02.39.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 02:39:08 -0700 (PDT)
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
X-Inumbo-ID: 87a3be87-ea8b-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711359549; x=1711964349; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m57OTQRG0PX7lRQkWmVOqph6CJkRf0tF8xNFRUpeNRA=;
        b=wkHWt12tv0Rel/mdM0vFn03w0ArgxSvswMIdeTzrQUZqM3Q5ajqC++H0f16S/8rxFV
         KTIiltYeea+TMm7/cjKo/c1a8pS9aRLzb3VLTJv+ppzh4XX/Sk3NOQLqXZLYS9N/2jFy
         B2NSvA/Z/z6FmXkNtQrgUv1Evq+kN7yjEHXfoMiaXYaQI0YripSBgFh3oaF57eWSnPdD
         dYir208Oo9Qfal5tH4LxXCaJLnnqTDqZO1dE2RYFDv4LjtQprjjsIhTmb27V38KUxIHz
         yb8kHywClF4ma/feUSiHLHq7Sy+OO6pt/y3wyNferUhSaEkd85zFD4GKY5CHhNqUCQFB
         wDlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711359549; x=1711964349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m57OTQRG0PX7lRQkWmVOqph6CJkRf0tF8xNFRUpeNRA=;
        b=FE9/gZx0/8SP1iBG86LD6zRt+zIvcNMvsAcUIxMuqQLZyzm+YN7eYZZKCmjxnDFv9S
         Q77zD/4ysL7cHzDazgEZk7lNqAiU9Y67raQmNM0NbjT0fYVols7szWI4WUIIcYLeRoEN
         9zRfeDa4uWn73ZypK1m+gHkHEUnGajd3eEWGFBAlfQTh/jr6QBrapKEaOI6fRDmV0X79
         7gLmh1YkjAHqUx3TZ0TSqhMxRA7KjWeJNEUumVeldMbHyWGGVe/+1jcT1RszJy8z3aoi
         i0Unucaq9fb8IzYRS04qjoEBthTiBdpj9nHztC6DTlw1iM9Mbg61AiYXxKuuRiNHA70/
         Jr1w==
X-Gm-Message-State: AOJu0YxVon8cQD8bVVa5zVXkF4X+MJAZI41A2HmDiO6niuM5QBT3+NSJ
	OjP/OjN5JkO/xti5noRXDvamXxkvvAdaz5cnXSQMSI4iZCbQr8bCDDr5/awALZBgIxWHCaYh/Lj
	f
X-Google-Smtp-Source: AGHT+IEjC/ZMHgNDj8fTanPQ+kmtnsMP+XVs9QDvGyc7Lvjva8mwLVFDIayMTvPeqJWU/EL5gxlnDQ==
X-Received: by 2002:a17:906:7817:b0:a47:35df:3d40 with SMTP id u23-20020a170906781700b00a4735df3d40mr5246479ejm.4.1711359548793;
        Mon, 25 Mar 2024 02:39:08 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: patches@linaro.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [XEN PATCH 0/6] FF-A mediator reorganisation
Date: Mon, 25 Mar 2024 10:38:58 +0100
Message-Id: <20240325093904.3466092-1-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

The FF-A mediator is reorganized into modules for easier maintenance and to
prepare for future changes. This patch set is not expected add any changed
behaviour, except for the "xen/arm: ffa: support FFA_FEATURES" patch.

Thanks,
Jens

Jens Wiklander (6):
  xen/arm: ffa: rename functions to use ffa_ prefix
  xen/arm: ffa: move common things to ffa_private.h
  xen/arm: ffa: separate memory sharing routines
  xen/arm: ffa: separate partition info get routines
  xen/arm: ffa: separate rxtx buffer routines
  xen/arm: ffa: support FFA_FEATURES

 xen/arch/arm/tee/Makefile       |    3 +
 xen/arch/arm/tee/ffa.c          | 1629 ++-----------------------------
 xen/arch/arm/tee/ffa_partinfo.c |  373 +++++++
 xen/arch/arm/tee/ffa_private.h  |  347 +++++++
 xen/arch/arm/tee/ffa_rxtx.c     |  216 ++++
 xen/arch/arm/tee/ffa_shm.c      |  708 ++++++++++++++
 6 files changed, 1750 insertions(+), 1526 deletions(-)
 create mode 100644 xen/arch/arm/tee/ffa_partinfo.c
 create mode 100644 xen/arch/arm/tee/ffa_private.h
 create mode 100644 xen/arch/arm/tee/ffa_rxtx.c
 create mode 100644 xen/arch/arm/tee/ffa_shm.c

-- 
2.34.1


