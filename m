Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F07D7BDCDB
	for <lists+xen-devel@lfdr.de>; Mon,  9 Oct 2023 14:52:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614359.955369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qppjh-0007An-D2; Mon, 09 Oct 2023 12:51:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614359.955369; Mon, 09 Oct 2023 12:51:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qppjh-00078w-92; Mon, 09 Oct 2023 12:51:49 +0000
Received: by outflank-mailman (input) for mailman id 614359;
 Mon, 09 Oct 2023 12:51:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nTJG=FX=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1qppjf-00078l-Tm
 for xen-devel@lists.xenproject.org; Mon, 09 Oct 2023 12:51:47 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9adc7897-66a2-11ee-98d3-6d05b1d4d9a1;
 Mon, 09 Oct 2023 14:51:46 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-313e742a787so2652804f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Oct 2023 05:51:46 -0700 (PDT)
Received: from georged-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a5d4f10000000b00324ae863ac1sm9589576wru.35.2023.10.09.05.51.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 05:51:45 -0700 (PDT)
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
X-Inumbo-ID: 9adc7897-66a2-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1696855905; x=1697460705; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WP8vXvNB2nz+9RrTuxTPylfUNyGiJI34/c05e47LP0Q=;
        b=DaXpOcXIMrmriEtb6+fCAgRWlyl9d3XW6866MWeKTm6WYXK2+D1rs+VPaD+hXWqgzf
         qBI+ohXUo85sa60QpYSAfIrvctF9ScRSgiKYN5s4PCYDCR+b34L/dp0vQrpJ82xSbslA
         8POObYE9wZ/9sYUtnbK6RZVDq9luNGieDGFe4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696855905; x=1697460705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WP8vXvNB2nz+9RrTuxTPylfUNyGiJI34/c05e47LP0Q=;
        b=Q2/Knv7qUx/StnBfLCDr3kWqZmNJ+L0xymz503QOIhX4s+pgQ0HzXoUFNSKkHGAxen
         7FsOEH6E5IB7w4Wt47SP+pi2/6T1gptfdRAIfutxRzBoCzooqmNma6pNZBH5Z3L6YVU4
         FQx+/j8NgjqBuOYWuIH1pS6GMVwhWTsZkuaSbeTVIFYSSE8EugemxfEUzdzYkyVTo0ET
         AI1M8ePevDRmFEpvOfrEv9Rml9fI6wsPOsk4bOs2yzLQvCX5lg13SaGC2TByxSRn6e74
         7vABQzltaWgB7Ghjbq0tstqAYSMb8w4ayoSwP9zAXhOgdOxvlwBhA29nTQRrK0PJQWGD
         gMqw==
X-Gm-Message-State: AOJu0YynuxKLsSqacMUmpySDy3ENyVoJqxMs8cFdR88gEBwAIF0cYChR
	8GpA81hub7AGL+MQZQrRXaEr3oLefyQIsHpUm5c=
X-Google-Smtp-Source: AGHT+IHifaENnhwP4o8Lwd6f6H2t+N+EjdW8I/OAgl92qyJPbDMNBUEMdUqtmx1tFRzPjiU/NC9ZNQ==
X-Received: by 2002:a5d:658e:0:b0:329:6b53:2c82 with SMTP id q14-20020a5d658e000000b003296b532c82mr7243303wru.31.1696855905626;
        Mon, 09 Oct 2023 05:51:45 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH for-4.18 0/5] xenalyze: Miscellaneous fixes
Date: Mon,  9 Oct 2023 13:51:32 +0100
Message-Id: <20231009125137.1329146-1-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

None of these are critical; but they're also in a fairly low
criticality part of the code.  I'd be fine with either putting them in
now or waiting until 4.19.



