Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NyoJxA/tGlljgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:45:04 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBDD28754C
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:45:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1254116.1550093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15d4-0004BM-55; Fri, 13 Mar 2026 16:44:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1254116.1550093; Fri, 13 Mar 2026 16:44:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15d4-00048H-2V; Fri, 13 Mar 2026 16:44:50 +0000
Received: by outflank-mailman (input) for mailman id 1254116;
 Fri, 13 Mar 2026 16:44:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p3qR=BN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1w15d2-00048B-Kb
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 16:44:48 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f20268b9-1efb-11f1-b164-2bf370ae4941;
 Fri, 13 Mar 2026 17:44:47 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-6611f41eebcso3200281a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2026 09:44:47 -0700 (PDT)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-66350b86008sm1394733a12.28.2026.03.13.09.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2026 09:44:45 -0700 (PDT)
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
X-Inumbo-ID: f20268b9-1efb-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773420286; x=1774025086; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nvusB8amxANk2/hw0DyBVCpoKjQxhuOgDtnr4JFcqBM=;
        b=L1BY/W0e2Vctn0m3KQzKHUug6kxYCCMGIOQNRjWuw+hhBH2KAsuGOJZI7XjTdIQF+o
         17h7Qzgx+Rrq7MejimTCOAdCaIe488/LxBccIhNQ+0oHRD0WtSWirTtGmeDMhmM+7+7L
         V/VALccSHfceTR/kQwFpzM20G9x3E6AuWokfa6L4AEPJBsE9Sp5WwBBzu+3TFD2+nKgZ
         DLXDjfPIgoeZaT/RZ9QKpvUh7MuNQnJkaG17a0yAW/yctM/Ql4rBQcVKdxq8B2c4I5Vp
         0CoTmqJN0+O+vNoy7JP3JE9HKkkWq60gfbX4cZ33oyB+zFzcWb+kJx/nKTsDtWtXAp47
         hVRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773420286; x=1774025086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nvusB8amxANk2/hw0DyBVCpoKjQxhuOgDtnr4JFcqBM=;
        b=CAh3+z5Y1cNu8I2WJMDqN+0EkkYxRaLhWiZ7bV48X9sF/a89YGlXdaFmRDlMkZjLcr
         4miFFUv7wX3IGrX5RbfQp815DTpp2CZ+3YWUJDzYxR3L2MgEr9R3MAAyxPPL6LbX6/XA
         DZw84Q5bCy7pidpGjNA8oUcbCQisFJofFvJKRgv/t4sLOID/Ovnyu2J1JH9FQMreV+JF
         dPN3jtBHDhpZrOKpX4qe4VMaSKoO1EKYl8TgIUnWFwQ7kaK6vYiYDSeZbcMRsEBOv6Gz
         j0HJMGJ0hYZia2OPpGh4lqbZ/5yfmsYfM6VRS2BUFnd/7TJenOnucPQNdHZ4uJDU90ZH
         1yUw==
X-Gm-Message-State: AOJu0YzkYfCyJK27imm6kl4xasoq+s5jOKawMLez+BwPQwfV6shgjGil
	YqYuKCl02ydsf3PLm/JhyzPLP0zdEA4nqD7UfL74SbdJy8ZYKf5o9gzhVhpfyQ==
X-Gm-Gg: ATEYQzxnKr5IvAdDJDBU+llx4Dsa7awaKT+4hplTB4Gc3jf9KuoeTqEMxtPzyD4jbLr
	6Z4KyY2GHvWZnyQHjV+UBGl6xf6Jtr6ifyPNKcbcvzhmi5OITMZDCipIqaM0zUEUCD4jybvjiC5
	B1aSCcLCBS969Jb7nCgaSvKSm+GM2WTKDLUD9qWwfn22KRT+TaQHM3Frjnxg8CT/KCTqXPKf8Y7
	/IxTD9m6bGkulIW9ensP09NgtqVJ/ybbfHj44WyV6/ketlDx2daeaAO8MvetnSDPUl8YJAkp3v0
	9HC8LwheK8yX2FHQ+4R8gCn6EnGjUgrdvjIR0Gdgz+aOTelPj0CAWhWt/aX5EVELqMI5yjl3d6W
	T6UXzrMBVgLBYvWBHdBwx7NfQIxhJeiCF6d1ku3j0ApGqUlK/aYsiaJewr03gMyDpD+i29ZtD9e
	CWCBw8qkWQ9d9X9jsqPZ7+B7f+4bTA0HNM6kZeOFK/L8eOEQdk/El/Bp3yfP0CSb5Kow==
X-Received: by 2002:a17:907:da07:b0:b94:1224:c605 with SMTP id a640c23a62f3a-b976500fa5bmr219134666b.19.1773420286041;
        Fri, 13 Mar 2026 09:44:46 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 0/4] RISCV: Intrdouce SSTC support in Xen
Date: Fri, 13 Mar 2026 17:44:34 +0100
Message-ID: <cover.1773419622.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 4EBDD28754C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch series is created based on [1] and the aim is to make Xen properly
works when SSTC extension is available.

It is needed to do in this way as OpenSBI doesn't pass that it supports SSTC
by DTS to Xen and there is no easy way to turn off support of SSTC support.

Also, as a part of this patch series intrdouce suggested [2] by Jan B.
improvements of init_csr_masks().

[1] https://lore.kernel.org/xen-devel/cover.1772814110.git.oleksii.kurochko@gmail.com/T/#mc14576ef43a83b344c5f31626005b995e2ccbeaa
[2] https://lore.kernel.org/xen-devel/cover.1772814110.git.oleksii.kurochko@gmail.com/T/#m9c18d2d7a98958befec16419f5deccc40f6c8c3e

Oleksii Kurochko (4):
  xen/riscv: add exception table support
  xen/riscv: add csr_allowed_read() helper
  xen/riscv: allow Xen to use SSTC while hiding it from guests
  xen/riscv: init_csr_masks()-related improvements

 xen/arch/riscv/Kconfig                      |  1 +
 xen/arch/riscv/Makefile                     |  1 +
 xen/arch/riscv/cpufeature.c                 | 33 ++++++++
 xen/arch/riscv/domain.c                     | 32 ++++----
 xen/arch/riscv/extables.c                   | 85 +++++++++++++++++++++
 xen/arch/riscv/include/asm/cpufeature.h     |  1 +
 xen/arch/riscv/include/asm/csr.h            | 34 ++++++++-
 xen/arch/riscv/include/asm/extables.h       | 72 +++++++++++++++++
 xen/arch/riscv/include/asm/riscv_encoding.h |  2 +
 xen/arch/riscv/setup.c                      |  3 +
 xen/arch/riscv/time.c                       | 36 +++++----
 xen/arch/riscv/traps.c                      |  3 +
 xen/arch/riscv/vtimer.c                     |  7 +-
 xen/arch/riscv/xen.lds.S                    |  3 +
 xen/arch/x86/xen.lds.S                      |  6 +-
 xen/include/xen/xen.lds.h                   | 10 +++
 16 files changed, 294 insertions(+), 35 deletions(-)
 create mode 100644 xen/arch/riscv/extables.c
 create mode 100644 xen/arch/riscv/include/asm/extables.h

-- 
2.53.0


