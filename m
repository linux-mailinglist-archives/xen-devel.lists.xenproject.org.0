Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8F8290039
	for <lists+xen-devel@lfdr.de>; Fri, 16 Oct 2020 10:54:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7829.20616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTLUq-0002DS-BY; Fri, 16 Oct 2020 08:53:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7829.20616; Fri, 16 Oct 2020 08:53:56 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTLUq-0002D1-5W; Fri, 16 Oct 2020 08:53:56 +0000
Received: by outflank-mailman (input) for mailman id 7829;
 Fri, 16 Oct 2020 08:53:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JQTg=DX=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kTLUo-0002Cr-Ah
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 08:53:54 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4e64d87c-f3c5-472e-95bc-a569bfb942e0;
 Fri, 16 Oct 2020 08:53:53 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B9C6BADFF;
 Fri, 16 Oct 2020 08:53:52 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=JQTg=DX=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kTLUo-0002Cr-Ah
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 08:53:54 +0000
X-Inumbo-ID: 4e64d87c-f3c5-472e-95bc-a569bfb942e0
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 4e64d87c-f3c5-472e-95bc-a569bfb942e0;
	Fri, 16 Oct 2020 08:53:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602838432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rSOB8WNkMaU2hnrfpEjv6May2yW7ubKae50ylsNLlyI=;
	b=JBkDJimAwG7YFhn7Tfy6L5waIaU2GINdyg3NuIpE1IGeZdYSB/vspy5e8BIWspmAs5R9KK
	zSmdkBkjXR5AKSqzZaSbrb4d20Xubf/XAsphoA/kBoflGHf2bdVSmHWlgJZBKJ7u2jhkII
	pMgSMsgPFhNapbRGP7k4epMyk3u/hmg=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B9C6BADFF;
	Fri, 16 Oct 2020 08:53:52 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 2/3] xen/oprofile: use set_nmi_continuation() for sending virq to guest
Date: Fri, 16 Oct 2020 10:53:49 +0200
Message-Id: <20201016085350.10233-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201016085350.10233-1-jgross@suse.com>
References: <20201016085350.10233-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of calling send_guest_vcpu_virq() from NMI context use the
NMI continuation framework for that purpose. This avoids taking locks
in NMI mode.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/arch/x86/oprofile/nmi_int.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/oprofile/nmi_int.c b/xen/arch/x86/oprofile/nmi_int.c
index 0f103d80a6..825f0aeef0 100644
--- a/xen/arch/x86/oprofile/nmi_int.c
+++ b/xen/arch/x86/oprofile/nmi_int.c
@@ -83,6 +83,13 @@ void passive_domain_destroy(struct vcpu *v)
 		model->free_msr(v);
 }
 
+static void nmi_oprofile_send_virq(void *arg)
+{
+	struct vcpu *v = arg;
+
+	send_guest_vcpu_virq(v, VIRQ_XENOPROF);
+}
+
 static int nmi_callback(const struct cpu_user_regs *regs, int cpu)
 {
 	int xen_mode, ovf;
@@ -90,7 +97,7 @@ static int nmi_callback(const struct cpu_user_regs *regs, int cpu)
 	ovf = model->check_ctrs(cpu, &cpu_msrs[cpu], regs);
 	xen_mode = ring_0(regs);
 	if ( ovf && is_active(current->domain) && !xen_mode )
-		send_guest_vcpu_virq(current, VIRQ_XENOPROF);
+		set_nmi_continuation(nmi_oprofile_send_virq, current);
 
 	if ( ovf == 2 )
 		current->arch.nmi_pending = true;
-- 
2.26.2


