Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCQ2MgOe6GlNNQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 12:08:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FFA4446E6
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 12:08:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290138.1569820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFU8I-0005gY-Ak; Wed, 22 Apr 2026 09:44:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290138.1569820; Wed, 22 Apr 2026 09:44:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFU8I-0005eI-7Z; Wed, 22 Apr 2026 09:44:34 +0000
Received: by outflank-mailman (input) for mailman id 1290138;
 Wed, 22 Apr 2026 09:44:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wFU8G-0005e6-Bz
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 09:44:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFU8F-00E7y7-Ox
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 11:44:31 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e89879-5cb7-0a2a0a5109dd-0a2a4503bf1a-32
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 11:44:31 +0200
Received: from [209.85.208.174] (helo=mail-lj1-f174.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e8987f-672d-0a2a45030019-d155d0aef1cd-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 11:44:31 +0200
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-38be5e86918so60322231fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 02:44:31 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a41cc7f832sm3494193e87.28.2026.04.22.02.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2026 02:44:29 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776851070; x=1777455870; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=59nOSJ/eSpPdRp/1SigW9kXTuYhnBN61vpESbRh4HAI=;
        b=Tw10reV76rQJnSXc8ck+jIiTDAWjO8K/dNe2JcEDb8s+V2V3hFtA1XMjs2ygvHyZ2a
         3BkSf+42IJ8+SD6Zu835ciUQVq1zOpeUAMawr88scXBRR/ZVFjNpRNPPWD9e0vJYcn3m
         FHkR15rCZVS3PL/yyDzoV0WNaS5sYXA5ZTAyvPbyZvdQ3KaEtZtJrz/7lcaMHRO2WeiK
         b14GFVJ7kcu7M5glF98QKMJG3UalkWlZ0PYP5MI4u6YnP+oBfgyDYC5OARYajI7SUGwD
         Wwu9dxGyJQaEYoMV8S6mMtmiY47E6NqN7hlKsSXCdky2ZNBnAmngXHAOIfCjOubGzq6k
         AJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776851070; x=1777455870;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=59nOSJ/eSpPdRp/1SigW9kXTuYhnBN61vpESbRh4HAI=;
        b=BbEVYnRfHKeiKK2I87jXBv20IuRVNLXBg4pD9Ew3HXSHTadB2OxfNBrTJG/0ySWBXH
         qM0g0hEHKwpCvgg+ZXoL6BNGL9PqlJmMjTVjEOsr4TR2dz6CBoafKu2a0T6+mjQNJoDD
         KVhssOTVGab2GdBz9BJpzRq7S/bxDD02pKMu7sGUUquEdv1JCNhKhgYaGrJyrVhAHNUp
         lXmsz75qe1wfIoWCSONUinL0Jskyg68/iwtLXOfZfbBaZlegsTDCJqbyb0JDnB5xvpt7
         DrLmpwpgB0mt+kYWaab4/QmLvlHczF6udw3rStnF1LJCP/xTPCpwWA9esfiqBo2lERnY
         VrVw==
X-Gm-Message-State: AOJu0YxNXRjmL1AXYnk1ZjpNXQU9x5Isf+ovTq65DYCAyfX3JAlkTy0v
	0XxBOQSmoaeI7gXTGtWs6DeJY4YsEDYxXqif4eKcMxz6iqJ2o989/ltGSspMLQ==
X-Gm-Gg: AeBDievNW/lyBqRUXWcpWBgTayvVW5fqdyd1VoyJ4/CImMGswwKdTDpUCv+XyX+fy1G
	4vynSTaf7GKsOTzErOdfUagANsO7urr4rr/2W88ho87S97aK+INwyfkcCllwPZkZtyDGOIgkEhX
	MEDeekqvUe+3Z+cZYBomRuIMngpIQ5a02gKHsdiOVzq3hsWkQxBdeBBuKz0I5PuIs71LHAVIAWR
	KJYjwB+8FQWTHzBpGBezeHmDQGCVqZiKP4v5DFiTNNdriLI0TM9+minl9sH+YSbYLDnDg2ZW0Jd
	haTig58KMcwA0RoyUNxkgNb2Z5TFhGEOwCeFrbgsZxyP2xW0a8PwRLWQVODgfdYlwUCB3KyFEHp
	Il5fFQfS3gSIAIiBg5zPOvtiJbq4kJDG8L3ZpANXuD9D8a9U/RyRFf9HsznDYaJ7csCGafeRh9W
	Muy75kyA/vEXlpuUer8qsAV2VYHf/Gty8LLUjz1qn8fkoxekB/eeDxlRNpDepqlCmi/rhmhKy3A
	kj/
X-Received: by 2002:a05:6512:3090:b0:5a4:10b5:624c with SMTP id 2adb3069b0e04-5a4172f63f6mr6945395e87.23.1776851070148;
        Wed, 22 Apr 2026 02:44:30 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 0/3]  dom0less: various updates
Date: Wed, 22 Apr 2026 11:44:16 +0200
Message-ID: <cover.1776780944.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1776851071-489A9938-D04BA2F6/10/73395122804
X-purgate-type: spam
X-purgate-size: 3897
X-Spamd-Result: default: False [5.32 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20251104];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:Volodymyr_Babchuk@epam.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,xen.org,arm.com,amd.com,citrix.com,vates.tech,suse.com,epam.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1.171.63.0:email,gitlab.com:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,d000000:email,0.0.0.0:email];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_SPAM(0.00)[1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 39FFA4446E6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch series introduces a new field to track not-yet-used phandles as there
are some use cases where RISC-V needs to know which phandle number could
be used for generating a device tree node.

For example, on the RISC-V side in make_cpus_node() [1] it is necessary to know
which phandle number is unused to use it for device tree node generation.

Here is an example of generated guest DTB:
    cpus {
    ...
      cpu@0 {
    ...
        interrupt-controller {
          compatible = "riscv,cpu-intc";
          #interrupt-cells = <0x1>;
          interrupt-controller;
          phandle = <0xfdea>;
        };
      };
    };

    /soc/imsics@28000000 {

      interrupts-extended = <0xfdea 0x9 >;

      phandle = <0xfdeb>;
    };

    /soc/aplic@d000000 {
    ...
      msi-parent = <0xfdeb>;
      phandle = <0x1>;
    };

Note that phandles for imsic and riscv,cpu-intc are generated in this example
not by get_next_free_phandle(), that is why they have such big numbers.

For non-RISC-V people, APLIC is an interrupt controller (something like GIC in
Arm), IMSIC is an interrupt controller that provides MSI and connects to
each CPU.

So (based on the DTS above) for APLIC, kinfo->phandle_intc is reused, which
will also be re-used for the device node's interrupt property. For all others, I
just introduced GUEST_PHANDLE_LAST [2] and used it for generation [3]. But I expect
that it could be useful for other architectures too so I just moved it to common
and re-use pfdt to understand what the maximum used phandle is.

[1] https://www.kernel.org/doc/Documentation/devicetree/bindings/interrupt-controller/riscv%2Ccpu-intc.txt
[2] https://lore.kernel.org/xen-devel/ccd6d21b224b478c88ca5f2fdd2d1dd507671510.1773157782.git.oleksii.kurochko@gmail.com/
[3] https://lore.kernel.org/xen-devel/fd64b8526a23e9d7775b9b48c5a933b0673c4fba.1773157782.git.oleksii.kurochko@gmail.com/
           *************************************

Another thing introduced in this patch series is moving domain type to common
code as several architectures (ARM and RISC-V for now) use them and it
looks pretty architecture-independent. Also, is_64bit_domain() is used by
dom0less common code, so I found it useful also to move is_{32,64}bit_domain
macros to common code.

           *************************************

And the last thing is changing the prototype of make_cpus_node() to be aligned
with other make_*_node() and since RISC-V will need access to the free_phandle field
(even if it will be moved to kinfo->arch.free_phandle) and for the reason that
this ->free_phandle is updated in make_*_node(), the kinfo argument is passed as
non-const.

CI: https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2468475835

---
Changes in v2:
 - Address the comments from ML.
---

Oleksii Kurochko (3):
  xen/dom0less: introduce next_phandle in struct kernel_info
  xen/dom0less: pass kernel_info struct instead of fdt to
    make_cpus_node()
  xen: introduce CONFIG_HAS_DOMAIN_TYPE

 xen/arch/arm/Kconfig                    |  1 +
 xen/arch/arm/arm64/domctl.c             |  4 +--
 xen/arch/arm/dom0less-build.c           | 14 --------
 xen/arch/arm/domain_build.c             | 17 +++++----
 xen/arch/arm/include/asm/domain.h       | 12 -------
 xen/arch/arm/include/asm/kernel.h       |  4 ---
 xen/arch/arm/kernel.c                   | 16 ++++-----
 xen/common/Kconfig                      |  3 ++
 xen/common/device-tree/dom0less-build.c | 46 ++++++++++++++++++-------
 xen/include/xen/dom0less-build.h        |  2 --
 xen/include/xen/domain.h                | 13 +++++++
 xen/include/xen/fdt-domain-build.h      | 17 ++++++++-
 xen/include/xen/fdt-kernel.h            |  8 +++++
 xen/include/xen/sched.h                 |  4 +++
 14 files changed, 96 insertions(+), 65 deletions(-)

-- 
2.53.0


