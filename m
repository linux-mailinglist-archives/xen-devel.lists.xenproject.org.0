Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0325F232AB6
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jul 2020 06:10:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0zt0-0001Gn-2Q; Thu, 30 Jul 2020 04:09:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4+cv=BI=euphon.net=fam@srs-us1.protection.inumbo.net>)
 id 1k0p1v-0007yt-OX
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2020 16:34:12 +0000
X-Inumbo-ID: 51ecf96e-d1b9-11ea-8c97-bc764e2007e4
Received: from sender2-op-o12.zoho.com.cn (unknown [163.53.93.243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 51ecf96e-d1b9-11ea-8c97-bc764e2007e4;
 Wed, 29 Jul 2020 16:34:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1596040431; cv=none; d=zoho.com.cn; s=zohoarc; 
 b=RAIS9PAY2Jt1iDjYHPgQ/6xupBEovUgXf1YflQUBodAexRxpbpob94u2bKHyOi5rG3H2EiVB7SdGqn7rm2rv3m6b1hrH97egxH428Ju7e9SFuX60Vti6/eee6SPmOt1nQX63m3xviOiTRNbr3Pjo92NuBKDc8ZrcQv5WMu1qXrg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn;
 s=zohoarc; 
 t=1596040431; h=Cc:Date:From:Message-ID:Subject:To; 
 bh=qf+v61LzDCqXASCfRuZXnlqCP79J34yOy7yE9dChAZs=; 
 b=NuvtotFev6VztUSwIBAF0o4NuXR+80lBwaIoF0LOTDVzE2roLqxtxXIvgc5deQcare8x0nrMnQSb54gJwtQotsPkczw6V5nviKlZo5kSBqo8L49a6Xx1A5O5k9Ozco7pb1uwFHdxfQf6e8h3VmzExsWmwOYZ5Hknn7yEqJOh+fU=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
 dkim=pass  header.i=euphon.net;
 spf=pass  smtp.mailfrom=fam@euphon.net;
 dmarc=pass header.from=<fam@euphon.net> header.from=<fam@euphon.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1596040431; 
 s=zoho; d=euphon.net; i=fam@euphon.net;
 h=From:To:Cc:Subject:Date:Message-Id;
 bh=qf+v61LzDCqXASCfRuZXnlqCP79J34yOy7yE9dChAZs=;
 b=GuHJN0yRWD2zqY0FZgjgjyKK639XfbijCxtFeopXgwFNVHYG9qwQgJNPsrtWwRj9
 QxMODejono5nNs+VZgoPKaDT7r/oAMbL0bpJB2swlcCjq6colmkyqS8Z+7b5+sgFpKB
 HdHQFhIi/4D0N/J4pExr3zgunbhnT18EW6nILx8s=
Received: from localhost (54.239.6.186 [54.239.6.186]) by mx.zoho.com.cn
 with SMTPS id 15960404289281017.0441578230091;
 Thu, 30 Jul 2020 00:33:48 +0800 (CST)
From: fam@euphon.net
To: xen-devel@lists.xenproject.org
Subject: [PATCH] x86/cpuid: Fix APIC bit clearing
Date: Wed, 29 Jul 2020 17:33:41 +0100
Message-Id: <20200729163341.5662-1-fam@euphon.net>
X-Mailer: git-send-email 2.17.1
X-ZohoCNMailClient: External
X-Mailman-Approved-At: Thu, 30 Jul 2020 04:09:41 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: fam@euphon.net, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 famzheng@amazon.com,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Fam Zheng <famzheng@amazon.com>

The bug is obvious here, other places in this function used
"cpufeat_mask" correctly.

Signed-off-by: Fam Zheng <famzheng@amazon.com>
Fixes: 46df8a65 ("x86/cpuid: Effectively remove pv_cpuid() and hvm_cpuid()")
---
 xen/arch/x86/cpuid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 6a4a787b68..63a03ef1e5 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -1057,7 +1057,7 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
         {
             /* Fast-forward MSR_APIC_BASE.EN. */
             if ( vlapic_hw_disabled(vcpu_vlapic(v)) )
-                res->d &= ~cpufeat_bit(X86_FEATURE_APIC);
+                res->d &= ~cpufeat_mask(X86_FEATURE_APIC);
 
             /*
              * PSE36 is not supported in shadow mode.  This bit should be
-- 
2.17.1


