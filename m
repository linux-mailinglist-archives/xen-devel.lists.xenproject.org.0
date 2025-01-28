Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5672A20E8B
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 17:28:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878622.1288807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcoRk-0003Qd-0f; Tue, 28 Jan 2025 16:28:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878622.1288807; Tue, 28 Jan 2025 16:28:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcoRj-0003Ny-U1; Tue, 28 Jan 2025 16:28:15 +0000
Received: by outflank-mailman (input) for mailman id 878622;
 Tue, 28 Jan 2025 16:28:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=00fH=UU=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tcoRi-0003Nh-9n
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 16:28:14 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd5dbb0e-dd94-11ef-99a4-01e77a169b0f;
 Tue, 28 Jan 2025 17:28:11 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-436326dcb1cso40024185e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jan 2025 08:28:11 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd4900e2sm174050885e9.24.2025.01.28.08.28.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 08:28:09 -0800 (PST)
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
X-Inumbo-ID: dd5dbb0e-dd94-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738081690; x=1738686490; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bfGHCk6ylqGUI3xZCBhS9XoBD9F0iDbrjpTzeSrCs9k=;
        b=bJNzahERuM9jAcjTLkXwQvIROVaFDnExdDd2gW7jBcgQxHDfSAW+hhIvmU9OUocRoW
         DSqw9gxbqk5pVLWrqrbaw63Ujib9DmGbPajGhZ38Osr3z8m8B1q5Ax3H4k2iAQSGqkfr
         hy60yg+CoXlLiMM08hy7utBw7Y5Y4FGvDXmKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738081690; x=1738686490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bfGHCk6ylqGUI3xZCBhS9XoBD9F0iDbrjpTzeSrCs9k=;
        b=QkQCYdZsmcbRv6B92kWL7lY43WlScWqldqRXOSS+pl7JY+0kp+C8ZxYjcFPwTgR+ai
         AQIiHBBilfVJDwpbzFU7o8mDMs/c3Zqj+P46AMe2z+/62UpWI2Kd/VGiSDY1TtAyr79e
         9y20wJYHs/zLg1QirGNzrmOWfHVA6PfnO6F49YG7Tiu0dwObtVpmjjVCT3SoHce3voEA
         btSvyBGTQ8TeVWNqN+bWFFwAy5+L21pJGECQpmRAf4R5cxzKZyUdB/8D2XXnmjBDnPuY
         7ekcu9FkaUNfQPJLNomOB37YZhZu/Noqk+UUNk0PlwYVoH6Im1+RYo91Xp617v9yIt6I
         NptA==
X-Gm-Message-State: AOJu0YxRvWlTN5fbwIpzmbMpvyZjHx9r7MnJ6HVzINb2TAD6o2aEzpe6
	dCwUDyp3gJthiSf8trwXL5i1gQwZXSqLr3y8CTRQHJjjSokq9f+eJ4RdLNO9VNLii1Me4Y8laPW
	d
X-Gm-Gg: ASbGncuhHhrhobSyLMEtpPWmSHlHIcIOpZz7Q361AWGyvEZMO1qmJywlGpB1/hfQnOX
	Oc7Ew4+XMr5wdtpRT6GDSaWXTxzr7E1/UUn8fxneqYZt7ZnVoXk8knG5qsg4s99ei5PaYVMZvKi
	sxZ1qGN7bkR6Y+1DsmMIhsTmhl1rNo9qMHBLlzsrqN66Z6UdPj8/hkr8xYKrY1E8sCnG8mordCE
	uTrhQTfI7lRc12hekgtKrzc1amDf07j3Lbp1uwsEg3OtxePksaC3sHLGLdwLNrkeCpho8r+5bOk
	BPpARh3jA5RIB8l6al/J
X-Google-Smtp-Source: AGHT+IHH2eFbXY53zF4x9LgAzRtPh7a1FZtQWBbb4xMPa3oJK39nsHjbrHVv3z9wiW/gTyKn/ryZ6Q==
X-Received: by 2002:a05:600c:1d07:b0:436:488f:50a with SMTP id 5b1f17b1804b1-438913ef4b7mr431819065e9.17.1738081690282;
        Tue, 28 Jan 2025 08:28:10 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for-4.20 0/2] x86/shutdown: prevent lapic "Receive accept error" errors on AMD
Date: Tue, 28 Jan 2025 17:27:40 +0100
Message-ID: <20250128162742.90431-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

The following series aims to fix the issues seeing during shutdown on
AMD boxes related to "Receive accept error" local APIC messages.

Fix patch aims to fix the issue, while second patch adjust fixup_irqs()
given it now has a single caller.

I think at least patch 1 should be considered for 4.20, as it fixes a
real issue on AMD boxes that prevents rebooting them.

Thanks, Roger.

Roger Pau Monne (2):
  x86/shutdown: quiesce devices ahead of AP shutdown
  x86/irq: drop fixup_irqs() parameters

 xen/arch/x86/crash.c           |  1 +
 xen/arch/x86/include/asm/irq.h |  4 ++--
 xen/arch/x86/include/asm/msi.h |  1 +
 xen/arch/x86/irq.c             | 30 +++++++++++++-----------------
 xen/arch/x86/msi.c             | 14 ++++++++++++++
 xen/arch/x86/smp.c             | 10 +++++-----
 xen/arch/x86/smpboot.c         |  2 +-
 xen/drivers/passthrough/pci.c  | 32 ++++++++++++++++++++++++++++++++
 xen/include/xen/pci.h          |  2 ++
 9 files changed, 71 insertions(+), 25 deletions(-)

-- 
2.46.0


