Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id d15aBW3WmGl7NQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 22:47:25 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B91516B08A
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 22:47:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1237608.1539842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtYL4-0008HC-GK; Fri, 20 Feb 2026 21:47:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1237608.1539842; Fri, 20 Feb 2026 21:47:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtYL4-0008F2-Cx; Fri, 20 Feb 2026 21:47:06 +0000
Received: by outflank-mailman (input) for mailman id 1237608;
 Fri, 20 Feb 2026 21:47:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2tad=AY=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vtYL3-0008Ew-OW
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 21:47:05 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1f5e64b-0ea5-11f1-b164-2bf370ae4941;
 Fri, 20 Feb 2026 22:47:04 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-483a233819aso21422275e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Feb 2026 13:47:04 -0800 (PST)
Received: from localhost.localdomain (host-92-22-18-152.as13285.net.
 [92.22.18.152]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a8df83bcsm28940205e9.13.2026.02.20.13.47.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 13:47:02 -0800 (PST)
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
X-Inumbo-ID: b1f5e64b-0ea5-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1771624023; x=1772228823; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yGBm2Qu8JB9RHbibbfp7HlpdXgEWIgkhDqMgDac0Xk4=;
        b=Io9XjymCsQDDZDVoj5N1IhV5bPxuWzLKxe+ApAzm2HaWrhvW2ysmUYbgEPEePZWawu
         rmWAjio4Wa5E/EN7GAeuefHZlIl/mlZIoAZKxJqY4frXstJx0/n3a9KoC7z5tfuuZtIU
         1Z9tjknxuqOwhVAFgY5Ba8U3hVLYmqGsmZaw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771624023; x=1772228823;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yGBm2Qu8JB9RHbibbfp7HlpdXgEWIgkhDqMgDac0Xk4=;
        b=cqU6ga5SbmlKYp45B8M0R6Vgu/4j5IZljVXK27jKb2afftg0nU9C4nUipV7V1UZ26i
         nEMSYXQ+eUIdK9fQhW+XdNfQxtIB3AsW0NeA+SUuqjt5EzjgdQ73aljzsk+7DezoKC5I
         SjCCgIzD4QWPFDTnUOZgYg9HFM+GYuIa4Vnymz03iiyL8X9bn/8hNUiCeW+1gJoXnG4Y
         b7Ot2NDkRBrA2MikEQAWEmxcuIT1mryJPqS/8jd6eDwaCqZL5nFFaYR5sQzu6rBsUCeX
         6v6Q0HI3d2Vwvip99AxrHEFT1X9N1DoNRkGVMdmA1F5HIrpFaEg0YzpF7LewoPKn7xkt
         utMQ==
X-Gm-Message-State: AOJu0YzSn/qhp/fgzC0TAWfqPvIyFQoDwO37YbiG8mvTwPMQKGeT7Jyf
	gtvMH3yMQC3BQtiJu7VjEieuXFzmNN8uDAtM4G7Km5/4eFKIKBqIFy2yqRPouWnNmUVZdYA7GkX
	vaP2u
X-Gm-Gg: AZuq6aLMJFe+F+H3qcxNg9OdohtuDCbVPz0kZlUwwUh0ZZ8GpfV7+n8TIt5Q26hGYJQ
	+644TQTazBV/+Wo6l9MrbjiKpFjOEtj99xQXd1MUogVlhXt8L8Sxi0YyWNBi3rQ09liNlD/5AkE
	/WfmL7xQcvcqcc3dVAGvL6Ks0EGxA3blRHsse9fsg2wcAAv+MxzCmCNSn9AIyBrraW9R+h5lEVD
	irpL4EMeUnfkmye1AK3uHOZTfl7YhuNgWiETRuPepQFwTZauMwS2Os/DW5fqzp2bpH/zIz4meE7
	5MKqStYhFt3kkVA19ruyszL2avLUViRGXaZZaXiAMwn5UCwhBPxNV+5faZWjUSb/X4UByHbvU4g
	Ckc/kuCe1eiikJ6PU7g+j1SneQzoL7EysgcJPBae+UML4mcNbVfzUK3yBkdmgl1tzPO3hPyWNYA
	e2HgPhFl4vBIDiitvljj1a2Y+AlXHYnwtA4sq9EQCacjGME+PUlsjYaMvXORcrfiqjTARNPU8uS
	YlNW6wPdg==
X-Received: by 2002:a05:600c:5020:b0:483:71f7:2767 with SMTP id 5b1f17b1804b1-483a95fc0a9mr16791075e9.11.1771624022613;
        Fri, 20 Feb 2026 13:47:02 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH 00/12] xen: Misc MISRA fixes for *-allcode targets
Date: Fri, 20 Feb 2026 21:46:41 +0000
Message-Id: <20260220214653.3497384-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Volodymyr_Babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:consulting@bugseng.com,m:nicola.vetrini@bugseng.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 5B91516B08A
X-Rspamd-Action: no action

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2340465777

This fixes some low hanging fruit.  There's still more work to do in both the
x86 and ARM -allcode targets

Andrew Cooper (12):
  arm: Use __func__ in acpi_boot_table_init()
  xen/treewide: Adjust suffixes on integer literals
  xen/argo: Fix MISRA violations around function parameters
  xen/treewide: Adjust parameter names and types
  x86: Adjust annotations of asm-used identifiers
  xen: Include suitable headers to make declarations visible
  xen/vmac: Const the key parameter of vmac_set_key()
  arm/pci-designware: Fix MISRA violations
  x86/shadow: Rework write_atomic() call in shadow_write_entries()
  xen: Adjust break/fallthrough statements
  xen: Bracket uses of macro parameters
  xen/vmac: Delete STDINT block in vmac.h

 xen/arch/arm/acpi/boot.c                 |  4 ++--
 xen/arch/arm/gic-v3-its.c                |  2 +-
 xen/arch/arm/include/asm/pci.h           |  2 +-
 xen/arch/arm/include/asm/tee/optee_msg.h | 16 +++++++--------
 xen/arch/arm/include/asm/tee/optee_smc.h |  8 ++++----
 xen/arch/arm/pci/pci-access.c            | 10 ++++++----
 xen/arch/arm/pci/pci-designware.c        |  4 +++-
 xen/arch/arm/pci/pci-designware.h        |  5 ++---
 xen/arch/arm/tee/optee.c                 |  7 ++++---
 xen/arch/x86/boot/cmdline.c              |  3 +--
 xen/arch/x86/boot/reloc.c                |  3 +--
 xen/arch/x86/guest/xen/pvh-boot.c        |  2 +-
 xen/arch/x86/guest/xen/xen.c             |  4 ++--
 xen/arch/x86/include/asm/bootinfo.h      |  2 +-
 xen/arch/x86/include/asm/compat.h        |  2 +-
 xen/arch/x86/include/asm/config.h        |  2 +-
 xen/arch/x86/include/asm/guest/hyperv.h  |  2 +-
 xen/arch/x86/include/asm/p2m.h           |  2 +-
 xen/arch/x86/include/asm/pv/mm.h         |  8 +++++++-
 xen/arch/x86/include/asm/pv/traps.h      |  6 ++----
 xen/arch/x86/mm/mem_paging.c             |  8 +++++---
 xen/arch/x86/mm/shadow/common.c          |  2 +-
 xen/arch/x86/mm/shadow/multi.c           |  2 +-
 xen/arch/x86/mm/shadow/set.c             |  4 ++--
 xen/arch/x86/pv/emul-gate-op.c           |  4 +++-
 xen/arch/x86/pv/emul-inv-op.c            |  1 +
 xen/arch/x86/pv/emul-priv-op.c           |  1 +
 xen/arch/x86/pv/emulate.c                |  1 +
 xen/arch/x86/pv/grant_table.c            |  1 +
 xen/arch/x86/pv/hypercall.c              |  2 +-
 xen/arch/x86/pv/mm.c                     |  1 +
 xen/arch/x86/pv/ro-page-fault.c          |  1 +
 xen/arch/x86/pv/traps.c                  |  1 +
 xen/arch/x86/tboot.c                     | 10 +++++-----
 xen/arch/x86/traps.c                     |  3 +--
 xen/arch/x86/x86_64/machine_kexec.c      |  3 ++-
 xen/common/argo.c                        | 12 ++++++------
 xen/common/kimage.c                      | 11 ++++++-----
 xen/common/livepatch.c                   | 11 ++++++-----
 xen/common/stack-protector.c             |  1 +
 xen/crypto/vmac.c                        | 12 ++++++------
 xen/drivers/char/xhci-dbc.c              | 14 ++++++-------
 xen/include/crypto/rijndael.h            | 16 +++++++--------
 xen/include/crypto/vmac.h                | 25 +-----------------------
 xen/include/xen/acpi.h                   |  2 +-
 xen/include/xen/libfdt/libfdt.h          |  6 +++---
 xen/include/xen/stack-protector.h        |  2 ++
 47 files changed, 125 insertions(+), 126 deletions(-)

-- 
2.39.5


