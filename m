Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LMUAYhTj2lUQQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 17:38:32 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C83521383E0
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 17:38:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1231469.1536664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqwBT-0007ju-24; Fri, 13 Feb 2026 16:38:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1231469.1536664; Fri, 13 Feb 2026 16:38:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqwBS-0007hy-VR; Fri, 13 Feb 2026 16:38:22 +0000
Received: by outflank-mailman (input) for mailman id 1231469;
 Fri, 13 Feb 2026 16:38:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HtAj=AR=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vqw2r-0005Ws-ED
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 16:29:29 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b0d0c2d-08f9-11f1-b163-2bf370ae4941;
 Fri, 13 Feb 2026 17:29:28 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-48329eb96a7so6943105e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Feb 2026 08:29:28 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d5ebd1bsm303288185e9.6.2026.02.13.08.29.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 08:29:27 -0800 (PST)
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
X-Inumbo-ID: 2b0d0c2d-08f9-11f1-b163-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771000168; x=1771604968; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aS1nE3ehxrhnhvUQVu6uQ+BpfKhXXAT1M63On5oqAkY=;
        b=QquHo+ZOLXR7e6DaAfPCjwENioUnmhLDXbPCUCRaGERV+KCA2lyFfHGaykWsKpTm2r
         9pyXH1lfiOZG6GRENrkVdY1dJYUK/BCTV2rWFHeIzyNAO9mMCWqr/tHt1liQ8vH2kHjt
         JtkcNaWWP6+rsUKvONffV1WJZzVpDAnuofrRvzzmeHcZ4ITYOAdDSHr5wL0fwInYAIux
         ICwywbePxlQO8ypjgYSox1/ivDThJKoMTGmhBAaGj3rioZJXl+Cq0viPEe+NOAJ9DPn2
         1q6N/LuhFhcdzrnvJ20KmkB5CuEGOdSYFjcvaQ076ZU0s8/S+bn9IyXA6WYgze5+NLOA
         nehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771000168; x=1771604968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aS1nE3ehxrhnhvUQVu6uQ+BpfKhXXAT1M63On5oqAkY=;
        b=JtHKsf+1YrqABRiozdKk7bFHtIx8kbQRz1SCGAyTPzTo30Zq/PPJbh8tyv8raIkajB
         8VrNRWobXuAZF7lfuQezZdLgzpWCw4EHItsTMy8O+/mXQFS5wKIoLXMYqsBqbXJ/6Sfc
         C0BbPPWrswwe4n7ggzw3RG8QlkKDKy6P6i0nKv7waLQTViqRgxaj9j64BePFOZ6B1isH
         xbtRckgI2niAFRjItHWCy+EwZ2LiCNNAJOfoh1xdv8ynVP96nUX/SnFtP8zATHt6q4V5
         wWmNGGkHvfLu7AtAuku/+CzTF47fG9eeUyeUMpCona/Hrmo11HW7sHXJWnWRcKauvFMR
         9aHw==
X-Gm-Message-State: AOJu0YxvwGlgpI1c/7Cs25lQe+GsVb6+PwPjnbBgjbKPUW1NZJcOtXMB
	em0ulHltVZQpDEF8Cc7cFxexLAGej18S/YIa0BTScIW/tzpM4h6xiq4HV3lWu8N9
X-Gm-Gg: AZuq6aJM3TKxhtIBj2Iw8QUWwXozPR8s9EhUDYoFdRLrlGtN0kgRpW6yEEtJ4ci2ndm
	hXvXvIVW+/Xhcita3N4aXkQq+Kfv0nLjDY1+6mOkKEd/hwEBeIsS7rBidiABx5d2Wa88+g2B5R0
	5NNKaYeJtiYF0Nw4Da/pHQeZxXGsj1//1EDJ423PYqpEJrIF2y4wh6luRiqoV5VYDYvDU0HSq67
	eH531lvpxn5dwM9Li41jOply1AoYrCNO1rmkH+lpvM+JTPNmCf3v8A67WqjCRSgYwH90sr7nnM0
	HhEuoTYsinJ7yJIxlPa8DVNUlGgmCNpvDiny3SITt7OU8VJo6d/xccrXsKIeEflAj1AN0tfv1Le
	CODTuiF2SkEDzrMxC1ppgx3ZND8L/EPLcwpsLwayLForYHHBUbKIcofdKr7G3b/UhIo4Nc9cchd
	dAci/T2fK4MOaUlbRVCgtrXGX0HaSQ2tPQEue7JfX7KXyjpYozHTK9WREp4W06cOuqyg==
X-Received: by 2002:a05:600c:474d:b0:47e:e72b:1fce with SMTP id 5b1f17b1804b1-48373a59a59mr42787315e9.37.1771000168120;
        Fri, 13 Feb 2026 08:29:28 -0800 (PST)
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
Subject: [PATCH v4 16/16] xen/riscv: implement sync_vcpu_execstate()
Date: Fri, 13 Feb 2026 17:29:02 +0100
Message-ID: <b8aff2ee5ee02dece9a94e1140bea26fdb5b305d.1770999383.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770999383.git.oleksii.kurochko@gmail.com>
References: <cover.1770999383.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
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
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email];
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
X-Rspamd-Queue-Id: C83521383E0
X-Rspamd-Action: no action

The scheduler may call this function to force synchronization of given
vCPU's state. RISC-V does not support lazy context switching, so nothing
is done in sync_vcpu_execstate() and sync_local_execstate().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v4:
 - Drop footer as [PATCH] sched: move vCPU exec state barriers
   is merged to upstream/staging.
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
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
index 307da467c72e..6d3d7277bf8f 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -249,3 +249,13 @@ void vcpu_kick(struct vcpu *v)
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


