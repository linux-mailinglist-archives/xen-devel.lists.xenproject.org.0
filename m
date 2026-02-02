Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id m39FEY2fgGni/wIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 13:58:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A15CC8AB
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 13:58:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218571.1527385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmtVQ-0005PB-9v; Mon, 02 Feb 2026 12:58:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218571.1527385; Mon, 02 Feb 2026 12:58:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmtVQ-0005Ng-6x; Mon, 02 Feb 2026 12:58:16 +0000
Received: by outflank-mailman (input) for mailman id 1218571;
 Mon, 02 Feb 2026 12:58:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lssc=AG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vmtVO-0005NS-L9
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 12:58:14 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3eab34f-0036-11f1-9ccf-f158ae23cfc8;
 Mon, 02 Feb 2026 13:58:11 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-48069a48629so45946015e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Feb 2026 04:58:11 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-482dbd0f043sm107954345e9.7.2026.02.02.04.58.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 04:58:09 -0800 (PST)
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
X-Inumbo-ID: d3eab34f-0036-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770037090; x=1770641890; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oRi0W9WCTHZh0EUHjEztjHxY/SjKN0eElI1BDWfPzFU=;
        b=npuzwMEHLNWEx94U2z5KjeyE+xABKWCkgxihk94YCUQnGl7C7P5RZA4MVcFpnL2bWX
         ggMVuVWKyo4wNcOuluF4lkTFvj2RXNLiNPl1sV0J787RC8E0WmQ5BmWwj2NQB+jAdQct
         SU16tRlo0osf43/AfS3am+LKsMpYvfTABRLSSF8UHFfwWj8XQ6s38KRe57GUbevE4nPQ
         lm8ylP4y2Z1wSVYCKfK5ge2UN7OAq6vpvQ8EbxZE972IjAgTorMFXSypYgHmZwjMuQCg
         48kS1/8YOZ42QqYUeBRhbw4XNadkvHTZZ4M/gb6K3geGFJyFlHEr8OoVU6rg7VR2zcMK
         1qpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770037090; x=1770641890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oRi0W9WCTHZh0EUHjEztjHxY/SjKN0eElI1BDWfPzFU=;
        b=oQvBtorlBqrkZRB6vsirp+3D4ebuOUAKmSZ8BQuVXsqhdkLDDOWbgh5yZcx9lqB2OZ
         84R0UoRz5wdiNn28JVTFj27McGRvuh63tHpqxs8xxB649RMcQfSStyiq6Sk4b+KW5Ors
         wzB4ZLaFEh8H5VN5OabdI1uaSjfOIAHP0iBIGNIMwJiNd4yBjtvblM5ZCTyYwNw5R13B
         mIB+Q/e80zsi4cmsoTZd1oxaEYBXqGz/cPvcZonWgMtDcnmzIKIt5TRnUZMUMTEsckOZ
         NmCdOWcaVGVwMLieIlmLhRV+g6UZkY000SDqZQqKdnB+HFk0Uuihp/3z6q2mhplVouNn
         dRNA==
X-Gm-Message-State: AOJu0YzfrEHe1XoRWcfjcCHExf3zMsZprM6PD9KH+cD4qeThqJTP9Kba
	Gw1Ett4ynYquZTjzTBOIWkpRbQVz9YnMT1qaWRhlj4TaJF/7e1wbqaCUCexalg==
X-Gm-Gg: AZuq6aIVlexvpAUlrycINQU7BCfdtR/MvhMEuZFj01mSRnDX8jlwHFbmA/rrO0Z/WMe
	J9QA57rJDYySaUGftgMsMI4yJVBiqGBtj0lBMRzGZ0QOkzSopghMhG2kB/6l8fPm5R17oZa6Yzs
	nhUiXVKDeHivIZ6GtAuz40k1cxZqJM5RNe41YuJE7TkxhRveUZ+Z3mMyWTt4DfHNZktFNNeSPms
	0gZHJbFAlURrk4C73hulirbEB/VdnO8ILdxWdiCY2GiaV1+KxakVryXI0bZnSPJOGW4a8gAZDPM
	pOP3Fn+Jqa8llC28fIQhIUhFeqzCYmIbR1EyHtk4eF1OtSZp3c48zv/FOXiVLYKIkVW+3dViGSF
	FM09gxJ/utl09o2sWVojCfz27z5sFgCnFcwY44eRg+86llsGk3xYoZhypc+qM3clu1lPIRUXOgG
	HgMz8BNi9jCMTTCl3uDm/g+asAONPJD6vgitSMlweBO5dJuG5MHGU7e0S1SrZV3IwT
X-Received: by 2002:a05:600c:c0cd:b0:47d:6856:9bd9 with SMTP id 5b1f17b1804b1-482db623c40mr95336455e9.23.1770037090066;
        Mon, 02 Feb 2026 04:58:10 -0800 (PST)
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
Subject: [PATCH v1 0/3] RISC-V: p2m context switch
Date: Mon,  2 Feb 2026 13:57:56 +0100
Message-ID: <cover.1770036584.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C9A15CC8AB
X-Rspamd-Action: no action

Introduce functions required to perform a p2m context switch during a vCPU
context switch.

This patch series originally depended on a single patch (Patch 1) from [1].
To avoid introducing a dependency on the larger patch series [1],
that patch was cherry-picked into the current series, since it is the
only true dependency.

Patch 2 is fully independent.

Patch 3 depends on Patch 1.

[1] https://lore.kernel.org/xen-devel/cover.1769099883.git.oleksii.kurochko@gmail.com/T/#t

Oleksii Kurochko (3):
  xen/riscv: introduce struct arch_vcpu
  xen/riscv: add support for local guest TLB flush using HFENCE.VVMA
  xen/riscv: implement p2m_ctx_switch_{to,from}_state()

 xen/arch/riscv/include/asm/domain.h    | 49 ++++++++++++++++
 xen/arch/riscv/include/asm/flushtlb.h  |  7 +++
 xen/arch/riscv/include/asm/insn-defs.h | 10 ++++
 xen/arch/riscv/include/asm/p2m.h       |  4 ++
 xen/arch/riscv/p2m.c                   | 81 ++++++++++++++++++++++++++
 5 files changed, 151 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/insn-defs.h

-- 
2.52.0


