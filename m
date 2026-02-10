Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCsINrNei2msUAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 17:37:07 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF2811D51B
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 17:37:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226684.1533192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpqjQ-00015L-00; Tue, 10 Feb 2026 16:36:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226684.1533192; Tue, 10 Feb 2026 16:36:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpqjP-00012v-Sh; Tue, 10 Feb 2026 16:36:55 +0000
Received: by outflank-mailman (input) for mailman id 1226684;
 Tue, 10 Feb 2026 16:36:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WUYk=AO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vpqjO-00012i-ID
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 16:36:54 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b448e335-069e-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Feb 2026 17:36:52 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-47edd6111b4so85424775e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Feb 2026 08:36:52 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d5e11f5sm64803255e9.4.2026.02.10.08.36.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Feb 2026 08:36:51 -0800 (PST)
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
X-Inumbo-ID: b448e335-069e-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770741412; x=1771346212; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ITsNzAFyOLMTMbt81OFpd5kCMwIAwHqAlWstam1L7pc=;
        b=k0/dkwoOBvrVVf4sgbRrLBLGpNU8VuTcMcKKS5yF/g2Pyg00XWl6vDsMHP7wHFu63M
         mprfBkV6Tc1LAoYLPIZKbI52/mnMwbmHqUCTkDwAOxyiaZ5EyccAcfeohKU5pT5n2p2L
         XMWt75ypSEuYN+Ie0ePyJvDNTo50H5zq6I/KgqlxI72nngKTlu59tBYJrXJ7tSyzem6p
         FUDkwgVDUaIBLXnIKie3kThxt+e7sGPBJFaxl1LCSojdvSlG89BJCTcPeA4bYlJbET6n
         xvJtpPhWeEbyctUebEUSSEKpXVQvUtCCswlu2RuvmatYnuBnT8VFXc9dKbx3Qxy9HGeC
         wdQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770741412; x=1771346212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ITsNzAFyOLMTMbt81OFpd5kCMwIAwHqAlWstam1L7pc=;
        b=B2l0rWOX3Iu4gctFg9BLySl/+nhmJJ3GWNyEMyIPmI+AJCXGBjlDDJUdNVCqgCyymC
         azjehiPptZbtfWM2LgRI/FFFSA52sPWNSDWOyXkihz5xqKt5fIC+1+SZP9E7xmfOSJvW
         SW9AOSIiqc7xIfeWsGs36rs340UYPhCFPL6LIUarlyxPmvEf+2EB3O2ZqQbSdE4BUNoK
         rhl2MGExDA2y/pipTsCMqGoAYRvvm6DdQaJd+IUAtrkhOuVAutC8ofuke9fCyH5fPimw
         IVzbonFV4StBrTKhmYjOTkbZ9Zbx6EWJ9nhHvvC5COUEQy9sMt1PMKJY6UFQjYrEKXVR
         E0JQ==
X-Gm-Message-State: AOJu0Yx9aeHVuNItov8BIPET27twIaWbxr7sQfkTmW4GJXQSK8YAaUOk
	/DNSkDGRrNd5UQzgfDHQjfPpvh8SEHt0UKghFHEAd6UTbfu1/LOiOSsDs2t5g5io
X-Gm-Gg: AZuq6aJ16O1i+I+X0SQGy0GIkj+HobUs3BFE1CoJyHr8OtiUMZYXDI6hazzNGSdmQsE
	A8Bp/bXMhq/6WWYk9umKt1GcOsPn/IY4Zs3WMcfxxG8hr6CcFkRAq5ywbAA2Ak/gZSonwgZYu+n
	zv3Vc2a0HIZBqS7isguBdQt23DM2mm+Pp+q4Sw3tillWbFDWMXSrE+uY7iEcDUALhQHu312UCmR
	ku9i2GJlhePzHsEWmS5edu3YeAl3nrK70182RiPwKzr+I2XwEAbevmoy7J/lsylyF5BgCfWAQzK
	nGCcUihxr+O1aILeYkjKmim6EEOeY9UDg2g9Zli/urcBUm1bra2grZUYRPcqgvBHdrr7ytIE+u5
	DAWSVOiM6fNYiy9QdEEQ0raxjBzjsEmFJf1X0KYwf85KZ1DLUywPzfFB2YbI2n6tOw5eYkQxun5
	gA4dWRXbFEnhlGZM9bfH1GJNeycYoCVoB4/YovevIbG2h9xHNkOa9YNVjpoGqcWcqCTDy1fw==
X-Received: by 2002:a05:600c:3487:b0:477:b0b9:3129 with SMTP id 5b1f17b1804b1-483507cff88mr40714345e9.3.1770741411577;
        Tue, 10 Feb 2026 08:36:51 -0800 (PST)
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
Subject: [PATCH v2 0/2] RISC-V: p2m context switch
Date: Tue, 10 Feb 2026 17:36:39 +0100
Message-ID: <cover.1770739000.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: BAF2811D51B
X-Rspamd-Action: no action

Introduce functions required to perform a p2m context switch during a vCPU
context switch.

Although this patch series is technically independent of [1], some merge
conflicts are still possible depending on which series is applied first.
For now, the series has been rebased on top of [1] but can go without [1].

[1] https://lore.kernel.org/xen-devel/cover.1770650552.git.oleksii.kurochko@gmail.com/T/#m5d8de24e5ee0eaf6f35f9f1437a00096e3574684

---
Changes in v2:
 - Drop patch "xen/riscv: introduce struct arch_vcpu", took only declaration of
   vsatp and squash it with the patch:
     xen/riscv: implement p2m_ctx_switch_{to,from}_state()
 - Other changes please look at specific patch.
 - CI tests: https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2317277592
---


Oleksii Kurochko (2):
  xen/riscv: add support for local guest TLB flush using HFENCE.VVMA
  xen/riscv: add p2m context switch handling for VSATP and HGATP

 xen/arch/riscv/include/asm/domain.h    |   1 +
 xen/arch/riscv/include/asm/flushtlb.h  |   7 ++
 xen/arch/riscv/include/asm/insn-defs.h |  10 ++
 xen/arch/riscv/include/asm/p2m.h       |  11 +++
 xen/arch/riscv/p2m.c                   | 123 +++++++++++++++++++++++++
 xen/arch/riscv/traps.c                 |   2 +
 6 files changed, 154 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/insn-defs.h

-- 
2.52.0


