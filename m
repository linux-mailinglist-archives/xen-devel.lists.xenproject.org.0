Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91978AACD3B
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 20:27:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977942.1364856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCN0V-0003C3-Re; Tue, 06 May 2025 18:27:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977942.1364856; Tue, 06 May 2025 18:27:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCN0V-00038o-OO; Tue, 06 May 2025 18:27:07 +0000
Received: by outflank-mailman (input) for mailman id 977942;
 Tue, 06 May 2025 18:27:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7voa=XW=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1uCN0U-0002gj-N4
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 18:27:06 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1d1047c-2aa7-11f0-9eb4-5ba50f476ded;
 Tue, 06 May 2025 20:26:58 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-54addb5a139so6873808e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 11:26:58 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-320290171e8sm21858681fa.27.2025.05.06.11.26.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 11:26:56 -0700 (PDT)
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
X-Inumbo-ID: b1d1047c-2aa7-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746556017; x=1747160817; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZTjmb4CVzk7evFGnM7dnHZhUU6iWaPb1DdyvIUz9ueY=;
        b=Zvx7wUL6B/o9kYPFYnRC/yD5YkDV9nnlCWMPnMaYVUXdZF1o8OqC0ToYB/DLM5Y1v3
         buTrIQ66QWvxI0EnW1x2/4MO/9XDQIgsflS4tKGY+5Q0imxUKURL4PZd2gzd2D/YtXfK
         9lQHIkepXKlIhBkx+JIJeArakDNGamXf/b9DoRQU2O4lxB0E6vZgX57ambR4Wd0nz6lM
         /iWlb11WZ/ZZ9kEZhG58WmJpQbwU0oNeDPaSGfV4hmt+PHgKnzgPaBhWc0qvC1rqFMAx
         muAg/q9cO9lvx8KfLGDyJ0wG7d/D/egtbsIeYG5TEcekXnIY77C1JCiraCAZvBf/CYrz
         VaaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746556017; x=1747160817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZTjmb4CVzk7evFGnM7dnHZhUU6iWaPb1DdyvIUz9ueY=;
        b=RS7g2Pu8twwhTJkmzPAUjq7sp8iIcH3oXxirgfuYMAhKsY3L2d7ajR0a03GQuYqJZu
         avK5XEjwHHINeVTeeV+fbbwUbeeSWRwRXmnmL9l3UuJvvwxNcM6WprBpKAMI+MEeklWZ
         z5o77ESXBU0e6dso0w6P84+F8abEhOj1DspFhh2Yvc+0nH0Y5OxDKB/rdjq1oeHm0S6o
         dnXtGjbllgAuiQCSylavrR5D7YSkPoEUUDAX7KXMxAtmeAhqwHMlyqwflOB4N6Cuy6vi
         caaGGeGKVAuxN9LclTxe9EXzRO0Dh47fOlzzFhmm8/jqLKeCvW/7rwytthBPMpiFQuFF
         CmIw==
X-Forwarded-Encrypted: i=1; AJvYcCV31eEFSf1l8DdavIqnsKu1hBa2A+cj1dZwl5T7dC5fs1DNZchJXO3bs2+jLZy6zweH9R2pSmtMWb0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YweQV+ORx0imsVn5UG+CE59bZvbNCj1JsJfX6JpaNlJGJbRpjNO
	WLXb/w0RRIrKW4obtPMEqECLROMK0sCx9I5UAXMGlmwjmTvf6JbZ
X-Gm-Gg: ASbGncuaVAAoVbLvvG782E8xoHw96c5S0Lwu2AdrYrqOnVgQ0nlW10c4wmOvgpGEPdA
	+CdgHU5/rutdQpt/AqsGGYPF/sCpZaOOgZwjrXVxFmtvjADNdXzOeJoTkJ5nLWzO3dNkx/8UKR/
	Imfcj6YsPzWuxhQC5Q6sgVXrRDTf8dMkTomLJJeIHYBsarQY/MIqcp2cX1LhgXrAWpYpFS3aL8L
	Y7MQwfDCYznNenW6iz5nruUETonOiBSBMo78TX5+Uit9DJ3U9gpgEdf5PW4NVm41ngaTAVK1qRQ
	Wnu1PN5WbVV9qt/fSosN9R2yGu7KnvrcqFJ7dQEFRV70Mp+5/9Stan23gNZHPEv0601xIsdVCk6
	yPARZ6lTYDtvY
X-Google-Smtp-Source: AGHT+IG0QNxm2H52AYImFQ9/85BOn3rOqRXdlPtH5VEXNMZVVE3v32Bclj57hFQ5Eqpo6lHWEzQxZQ==
X-Received: by 2002:a05:6512:ba8:b0:54a:f757:f8b3 with SMTP id 2adb3069b0e04-54fb92a6b1fmr220316e87.0.1746556017245;
        Tue, 06 May 2025 11:26:57 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org,
	sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	alex.pentagrid@gmail.com,
	peter.maydell@linaro.org,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org
Subject: [PULL v1 0/2] xen: mapcache: Fixes
Date: Tue,  6 May 2025 20:26:45 +0200
Message-ID: <20250506182647.302961-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

The following changes since commit a9e0c9c0f14e19d23443ac24c8080b4708d2eab8:

  Merge tag 'pull-9p-20250505' of https://github.com/cschoenebeck/qemu into staging (2025-05-05 11:26:59 -0400)

are available in the Git repository at:

  https://gitlab.com/edgar.iglesias/qemu.git tags/edgar/xen-queue-2025-05-06.for-upstream

for you to fetch changes up to 88fb705600a3b612c571efc9f1a6aed923a18dcc:

  xen: mapcache: Split mapcache_grants by ro and rw (2025-05-06 18:39:44 +0200)

----------------------------------------------------------------
Edgars Xen queue

----------------------------------------------------------------
Aleksandr Partanen (1):
      xen: mapcache: Fix finding matching entry

Edgar E. Iglesias (1):
      xen: mapcache: Split mapcache_grants by ro and rw

 hw/xen/xen-mapcache.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

-- 
2.43.0


