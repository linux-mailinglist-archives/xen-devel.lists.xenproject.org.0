Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A23A945B1
	for <lists+xen-devel@lfdr.de>; Sun, 20 Apr 2025 00:10:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.960066.1352186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GOh-000241-8A; Sat, 19 Apr 2025 22:10:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 960066.1352186; Sat, 19 Apr 2025 22:10:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GOh-000201-0A; Sat, 19 Apr 2025 22:10:51 +0000
Received: by outflank-mailman (input) for mailman id 960066;
 Sat, 19 Apr 2025 22:10:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nqik=XF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1u6GNN-0004ik-Oj
 for xen-devel@lists.xenproject.org; Sat, 19 Apr 2025 22:09:29 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f48916eb-1d6a-11f0-9ffb-bf95429c2676;
 Sun, 20 Apr 2025 00:09:26 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1745100514143191.97463134767452;
 Sat, 19 Apr 2025 15:08:34 -0700 (PDT)
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
X-Inumbo-ID: f48916eb-1d6a-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; t=1745100516; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EnLesCv4QdHgS2G5laY0Pexlzv+GIkpcoOLjJ/mfBaFaA5Avm/8t04M/xMfrP9N4525LY9UDsy/knSSE7RHpYD12fl53fL3PFwjtoXdHk28J+PO+p0MI8bnWzMGRPhKI66cLqZ/F/UeP9teKYXYRyDRTfME2tYhu1EyuDPKL9ls=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745100516; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=joeZ5CWNCE6Z2Un/cJIOF/EP6nfinf+YaJF/l3mCceo=; 
	b=b6si5+cb73AugZitj+DILLZn4LOtZhVhoJSfqiJ8d3ugzsNecqa65SI9EbEwStYCKfu/jBF7+aIZaDZZwjlw/dByGFdYzwsJEWCo1OtLmObPfUqyDCc5feug/JQacpaF/AcLG2XKD73bPozCZkM+OUtfglAhYBpkcHZ4pdvSLrg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745100516;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=joeZ5CWNCE6Z2Un/cJIOF/EP6nfinf+YaJF/l3mCceo=;
	b=jwe/gSb1XnvZG0Pyu6cJi03zm/soy673yJ4TTvVGXRW7YP/J0nPzWhfFNzrTB5mK
	Qk/wzD5uq8u6DtPxq9/3HE77iq30UMOEmzRtg5FzVvdQfOh22vs4Hwic5MvInReNVjp
	SAiJ/0mVdL9gOpgwV6oI2r9nHK2OYWWFk9dkqbGM=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC 05/38] x86/hyperlaunch: move dom0 cpuid policy behind capability check
Date: Sat, 19 Apr 2025 18:07:47 -0400
Message-Id: <20250419220820.4234-6-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250419220820.4234-1-dpsmith@apertussolutions.com>
References: <20250419220820.4234-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

To incrementally convert create_dom0() into being a generalized domain
construction function, move the dom0 specific cpuid policy behind the control
domain capability.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/setup.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 8ba9d592ed5a..41e46f05a520 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1050,7 +1050,8 @@ static struct domain *__init create_dom0(struct boot_info *bi)
 
     bd->d = d;
 
-    init_dom0_cpuid_policy(d);
+    if ( bd->capabilities & BUILD_CAPS_CONTROL )
+        init_dom0_cpuid_policy(bd->d);
 
     if ( alloc_dom_vcpu0(bd) == NULL )
         panic("Error creating %pd vcpu 0\n", d);
-- 
2.30.2


