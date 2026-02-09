Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2E6eIV0SimlrGAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 17:59:09 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 369AF112CAD
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 17:59:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225910.1532529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpUbB-0000DW-85; Mon, 09 Feb 2026 16:58:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225910.1532529; Mon, 09 Feb 2026 16:58:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpUbB-0000Ac-53; Mon, 09 Feb 2026 16:58:57 +0000
Received: by outflank-mailman (input) for mailman id 1225910;
 Mon, 09 Feb 2026 16:58:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zC3u=AN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vpUVM-0007Zo-Bh
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 16:52:56 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c801b671-05d7-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 17:52:55 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-65808bb859cso6855045a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 08:52:55 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8edacf1564sm415776866b.52.2026.02.09.08.52.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Feb 2026 08:52:54 -0800 (PST)
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
X-Inumbo-ID: c801b671-05d7-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770655975; x=1771260775; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HyJML4Sv6DfhXqyacLnIQ1gC+Bl4EUOQWOcTO9rdOdc=;
        b=f+EzXHzvTB6FHiyAY4+Jl2ixgu0bvHz0eloTerMjrqkHoybxObTysCkpnvCBsXTfSx
         hUxJQ8neBo2lHw3TrkpmMkvwY8NtGQbJ5qAV7AC/hplIA9KHRMzRCblskooj7rjHa9Ae
         uhei3rDtVw8WGYIetkknlnBbqtxc8EnFJhLQ7tUfLqYjm/PjXyZh0i2Xf3qYVhZYA0PH
         7pbNL0968h5C8n85H5bwAKwmFVPm29HTGLJbl2GtyY9JH4JBYV1RJxpEpsG0Y5x9+8MR
         B00Ph04BR/dKSSKtb+mzI06anrH0ZGqf93krNMFt66IzM1afNvSFrLTv3KW6svvZ5L9e
         CIkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770655975; x=1771260775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HyJML4Sv6DfhXqyacLnIQ1gC+Bl4EUOQWOcTO9rdOdc=;
        b=TbffzPfQN/4vrRWBNPtzqCpQxaVn8JitH/+lvuR2a1B7Lyr2PvkZofsNOnJ3N57s8p
         41CVb4vZUo6AuowcOLg/BUHBHkf4AG//W8R+ba3/fJiF8J7Nw/2ZpcYiRfd7krU2SoO8
         5qK9Ee4ZKCqUggXULBr949l5sz9xc6S+3Y8o0Yr9w/BRPfTqdeTu3D1wmX898gUTj84J
         +08o09lrTd5+FxXHZHwAEaEzdTmMTth5CAYrxubhTl39iRJ+OBLLZkPufUfhfxeg1bbE
         RKyhAuEGeu4f0hwderr0hZSDiT4ZUzEWRk7SxYiushDhWqPwqJeFwdZPIZnhywsUkede
         TU+g==
X-Gm-Message-State: AOJu0YzrGb3wvDfNQm5lrnLaOoJ0LYWwXP9sVggqoWCf+zA36HR7m4OX
	X+2dHfz3zEjQ4LgAsBpT5PEYHzG6fYHdJA4E44MHbKQGB7i1vfVwWicweTQDKdBD
X-Gm-Gg: AZuq6aJ9Y62KokdIu1dXVkLc3JzHI0s/Eg5XHfABmHbYy8ekM7+3HwkuSckZ9TaCaOO
	l0qW0Yk8bT9nLGm6J86WDTB7BoHzU99oybR0ZY9QwOqH+1l/FeDBvgSVlipeWpzwZj464Ac5L7l
	iq3RYHXdNuqRCkC67GlrPrrVzmDCE3zXc5ToI6JhM0XAuSjCZQCmVNc6wCYVebyNHczlxC6ceW/
	buGmYYkmpp9evLFfNV69NJ36T8rE35oUbdBSjAg80AtTmdhXrPyVfQehJqb6KQBIkxIu+AKw96Y
	zLRj6VlOzZMWocOVGslliETcYqUnSWkE2VVE7FOgk+fUUQVxRzl1oTApkKBBiQ8PJS8Ec0rURzu
	4G7JFhwTXDHijxGc27CUe72IDu7ZESYQz8221T9ibVdUcfmenEsSg9KQWrnu2q7Dyuqp0rwKtZy
	syC+QpPXCfG8QwAVeOYyFYAPB6lU+roF+0DC88Vq6pcprWmDX6VWexcFc+vw==
X-Received: by 2002:a17:906:6a18:b0:b8d:f859:d228 with SMTP id a640c23a62f3a-b8edf1a942amr632341966b.17.1770655974628;
        Mon, 09 Feb 2026 08:52:54 -0800 (PST)
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
Subject: [PATCH v3 16/16] xen/riscv: implement sync_vcpu_execstate()
Date: Mon,  9 Feb 2026 17:52:29 +0100
Message-ID: <b6df040691dcec56cd2f91699f0fa444cc0ef7ea.1770650552.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770650552.git.oleksii.kurochko@gmail.com>
References: <cover.1770650552.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
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
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 369AF112CAD
X-Rspamd-Action: no action

The scheduler may call this function to force synchronization of given
vCPU's state. RISC-V does not support lazy context switching, so nothing
is done in sync_vcpu_execstate() and sync_local_execstate().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
This patch is dependent on patch from ML:
  [PATCH] sched: move vCPU exec state barriers
---
Changes in v3:
 - Align sync_vcpu_execstate() with patch:
     [PATCH] sched: move vCPU exec state barriers
---
Changes in v2:
 - New patch.
---
 xen/arch/riscv/domain.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index 30a966f53c1d..ecb4ef8d0c89 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -245,3 +245,13 @@ void vcpu_kick(struct vcpu *v)
         smp_send_event_check_mask(cpumask_of(v->processor));
     }
 }
+
+void sync_local_execstate(void)
+{
+    /* Nothing to do -- no lazy switching */
+}
+
+void sync_vcpu_execstate(struct vcpu *v)
+{
+    /* Nothing to do -- no lazy switching */
+}
-- 
2.52.0


