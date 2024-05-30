Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 682E38D51E3
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 20:40:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732957.1139017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCkhW-0004eV-V6; Thu, 30 May 2024 18:40:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732957.1139017; Thu, 30 May 2024 18:40:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCkhW-0004bR-SS; Thu, 30 May 2024 18:40:34 +0000
Received: by outflank-mailman (input) for mailman id 732957;
 Thu, 30 May 2024 18:40:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8pxM=NB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sCkhV-0004bL-4Y
 for xen-devel@lists.xenproject.org; Thu, 30 May 2024 18:40:33 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1826dad5-1eb4-11ef-90a1-e314d9c70b13;
 Thu, 30 May 2024 20:40:32 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5789733769dso2315600a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 30 May 2024 11:40:32 -0700 (PDT)
Received: from andrew-laptop.citrite.net ([217.156.233.157])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a67e6f02d29sm4086666b.14.2024.05.30.11.40.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 11:40:30 -0700 (PDT)
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
X-Inumbo-ID: 1826dad5-1eb4-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1717094431; x=1717699231; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JJuNoSq0OuQqzdgRdtc7jFxhjSPmfyd/fXrf/kWjNhQ=;
        b=Sag8l9CZTqN8yLky+ThHtbuWbWuKheSZAG59ey80tQCGT+ZQ48u5QD+Rh3isGE8/2Z
         sM8jKYjqnj3ue2WfUC9BLI5BL+QFjGSrh4l0oM6uTX06veRE2qMZpENd5lXKjfh6Ps2q
         ycRD176PW3/w/VA5QZ3HnzmdYimxzS/V/cWfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717094431; x=1717699231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JJuNoSq0OuQqzdgRdtc7jFxhjSPmfyd/fXrf/kWjNhQ=;
        b=anMg3vf7i83lwoIx5PKYKIP/WwiuTot58QMOSgGkG3qikyZR5P9stZwm7Z58KQeq6C
         5eZj+SJXKSRHlWgPnDQkpXW16cHrG6GgOkii8Gy94+jzcEFZHOfJCJYFf464Fapry0L9
         1AGN+zgPEeWmX3mNPG1nbj2obrAi7m90KLf7kUemUQV989Nk0vi64W3PJfI/m/60++n2
         uOHbr9EqAARtRv7SApBlt7Xmg0DZjdZBm7y76/JTnMkQo2gbHlQmkSyOqIxQFM7j8aVR
         3Gxf1HToLNDzurywVPTMk8zJVdmUJ72Ra+P2aHcXVvz0Bq5qQUxngxPeyszgtOEBFDNB
         fbvw==
X-Gm-Message-State: AOJu0Yxbbq5DYw+WVeWREkGNPBpzjzZKUMi28VYa6oLsKqTv4NTnfAE/
	7RsVUCeuHavcEos4bjkeBNQPlMcB8eCnBtWbN/b/x7xKMSDaRjK0CFI3KTJDrC1nmtWF0TqlLsX
	i
X-Google-Smtp-Source: AGHT+IFM4sUCoWuD618J0Ddv1WsGtE5ssj5fZDr9xCzIqkDsGm94uJZcQrb+haYSG/2G2rsH7I82sQ==
X-Received: by 2002:a17:906:1c41:b0:a5a:8cc0:8c23 with SMTP id a640c23a62f3a-a65f0bd69cemr233518966b.27.1717094431322;
        Thu, 30 May 2024 11:40:31 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH for-4.19 0/2] arch/irq: Untangle no_irq_type
Date: Thu, 30 May 2024 19:40:25 +0100
Message-Id: <20240530184027.44609-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Found when reviewing Oleksii's series to enable the RISC-V build.

The way no_irq_type works is horrifying.  Make it less-so.

Andrew Cooper (2):
  arch/irq: Make irq_ack_none() mandatory
  arch/irq: Centralise no_irq_type

 xen/arch/arm/include/asm/irq.h |  3 +++
 xen/arch/arm/irq.c             | 14 ++------------
 xen/arch/ppc/stubs.c           | 11 ++++-------
 xen/arch/x86/irq.c             | 11 +----------
 xen/common/irq.c               | 13 +++++++++++++
 xen/include/xen/irq.h          |  8 +++++++-
 6 files changed, 30 insertions(+), 30 deletions(-)


base-commit: 9a905d7dc65883af082532b4dc91ce0131e54047
-- 
2.30.2


