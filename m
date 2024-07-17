Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0284E934039
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2024 18:14:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760074.1169787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sU7IN-0007U5-Jm; Wed, 17 Jul 2024 16:14:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760074.1169787; Wed, 17 Jul 2024 16:14:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sU7IN-0007Rn-Gl; Wed, 17 Jul 2024 16:14:23 +0000
Received: by outflank-mailman (input) for mailman id 760074;
 Wed, 17 Jul 2024 16:14:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9rux=OR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sU7IL-0007Rh-P7
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2024 16:14:21 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9fb4d943-4457-11ef-bbfd-fd08da9f4363;
 Wed, 17 Jul 2024 18:14:20 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2eec7e43229so83924811fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jul 2024 09:14:20 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-59ff76e9851sm2064067a12.46.2024.07.17.09.14.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jul 2024 09:14:18 -0700 (PDT)
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
X-Inumbo-ID: 9fb4d943-4457-11ef-bbfd-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721232859; x=1721837659; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UXA6QrD3xHjJtzIwncrDGn0PWAnlyvZ6x+VH3Zav/X0=;
        b=e5u6xKxAl5X7hvXYH2p7wBaxvVP3pY/SZJEY9P/XjgryXW0oQ63OFPl17alG18sYa3
         sqV/XdI8qKkH7zUUfiym+JBelY8YQa0Am90CjyNIreB4HwlE0J9VwSYMxjFrMgcAnA8E
         j4NgmQUr0Vq/mJZwF0YxdxITy72iY6y9RZg/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721232859; x=1721837659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UXA6QrD3xHjJtzIwncrDGn0PWAnlyvZ6x+VH3Zav/X0=;
        b=pRaz4vtqtlsSlolArce+y0QuMjVtqHS37ZXSzf2BZxAfbXk2Rbj/ywJxPZuOPkYeG6
         RsZ9735fqKsAkDTZpjZTc08hshUHkMNMze2zl4OmukfHCjqjFSJDU3l3bwbUTMqrh+yJ
         jLsRX5R04K0wBMneX1grjwMjCHxjRZFL+Omf0HpHjKzprBx8EZ0lvVfK1YDFwLy3l6or
         QyzW12YfsvX+Dr222bCkxxRvnNcpPrjZNX8VUVMmXw6VEXTSUMh1pOUg+7ls/rttVUtx
         +Ka5MkI254w4rz92AhMRq3NW13toJ1nF+zUzFZu0fgAmSPD37MGgdkorLyP1XlfHTttR
         Yurg==
X-Gm-Message-State: AOJu0YwK342aTbi1Gde/hbNCkqqVMUwAxl+EMukTEyVDCTrRExTtcffp
	8D6KKOigXlyYK3tBxAFyZwfeXn9EiBRWFoUP3vx3H5v1uRys0Pb0y6k4fDy+y0LrHETRKvGwhU8
	R
X-Google-Smtp-Source: AGHT+IHSDcckPhYQFs0fD4DFzuqezap2B2GW7+Hyd718d+M7vkDtkkPCOp4bXNh4axPoe0+B3nXPRw==
X-Received: by 2002:a2e:9281:0:b0:2ee:6cda:6380 with SMTP id 38308e7fff4ca-2eefd08f09fmr14801631fa.18.1721232859416;
        Wed, 17 Jul 2024 09:14:19 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH for-4.20 0/3] XSA-402 followup
Date: Wed, 17 Jul 2024 17:14:12 +0100
Message-Id: <20240717161415.3586195-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The start of the XSA-402 followup.  Better late than never.

Andrew Cooper (3):
  x86/mm: Drop duplicate l1_disallow_mask() calls
  x86/mm: Move base_disallow_mask into __ro_after_init
  x86/mm: Simplify/correct l1_disallow_mask()

 xen/arch/x86/mm.c | 36 +++++++++++++++++++++---------------
 1 file changed, 21 insertions(+), 15 deletions(-)

-- 
2.39.2


