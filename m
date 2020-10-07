Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F258F286026
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 15:30:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3508.10059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQ9WL-0007qY-Ru; Wed, 07 Oct 2020 13:30:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3508.10059; Wed, 07 Oct 2020 13:30:17 +0000
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
	id 1kQ9WL-0007q9-OR; Wed, 07 Oct 2020 13:30:17 +0000
Received: by outflank-mailman (input) for mailman id 3508;
 Wed, 07 Oct 2020 13:30:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gg45=DO=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kQ9WJ-0007q4-VW
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 13:30:15 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5771a15b-b98b-4cad-8cce-ad1e87e22a25;
 Wed, 07 Oct 2020 13:30:15 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 757FCB234;
 Wed,  7 Oct 2020 13:30:14 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Gg45=DO=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kQ9WJ-0007q4-VW
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 13:30:15 +0000
X-Inumbo-ID: 5771a15b-b98b-4cad-8cce-ad1e87e22a25
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 5771a15b-b98b-4cad-8cce-ad1e87e22a25;
	Wed, 07 Oct 2020 13:30:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602077414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A/ul8OKsqutALOib25CsZA6bXQqNHW0GneGeZqHG7q8=;
	b=TEdU2k071jf8kt1UTSAibopkjVoC1AFCBimdUlaguWnZ/OSyCXE/vMqE3ye6u+nlZBzIr3
	EJvc4PEbA7d4Sqakuk2YxQXNpdFyYtT3LrlEiIufiegDeKc0eap+JumxzHIcNhnCajiZt9
	eDofBqBFBltEK+umlJCJWiuwPpjk3v4=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 757FCB234;
	Wed,  7 Oct 2020 13:30:14 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 2/2] xen/oprofile: use set_nmi_continuation() for sending virq to guest
Date: Wed,  7 Oct 2020 15:30:11 +0200
Message-Id: <20201007133011.18871-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201007133011.18871-1-jgross@suse.com>
References: <20201007133011.18871-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of calling send_guest_vcpu_virq() from NMI context use the
NMI continuation framework for that purpose.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/arch/x86/oprofile/nmi_int.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/oprofile/nmi_int.c b/xen/arch/x86/oprofile/nmi_int.c
index 0f103d80a6..659e31fe19 100644
--- a/xen/arch/x86/oprofile/nmi_int.c
+++ b/xen/arch/x86/oprofile/nmi_int.c
@@ -83,6 +83,13 @@ void passive_domain_destroy(struct vcpu *v)
 		model->free_msr(v);
 }
 
+static void nmi_oprofile_send_virq(void *par)
+{
+	struct vcpu *v = par;
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


