Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4DDAE9FB5
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 16:02:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1026455.1401654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUnAp-0000zc-Bb; Thu, 26 Jun 2025 14:01:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1026455.1401654; Thu, 26 Jun 2025 14:01:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUnAp-0000yC-7z; Thu, 26 Jun 2025 14:01:55 +0000
Received: by outflank-mailman (input) for mailman id 1026455;
 Thu, 26 Jun 2025 14:01:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F+79=ZJ=bounce.vates.tech=bounce-md_30504962.685d52d0.v1-1e65ae06e1504cd5bff887064f71c6f6@srs-se1.protection.inumbo.net>)
 id 1uUnAo-0000k0-F0
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 14:01:54 +0000
Received: from mail187-29.suw11.mandrillapp.com
 (mail187-29.suw11.mandrillapp.com [198.2.187.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1cd261f3-5296-11f0-a30f-13f23c93f187;
 Thu, 26 Jun 2025 16:01:53 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-29.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4bSgNJ2FDMz7lmc0K
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jun 2025 14:01:52 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 1e65ae06e1504cd5bff887064f71c6f6; Thu, 26 Jun 2025 14:01:52 +0000
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
X-Inumbo-ID: 1cd261f3-5296-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1750946512; x=1751216512;
	bh=vYNfbUgiAlXIcQwc14Rgxl0bPeXHRh2iS+BzaTbjWWg=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=D9GcbzrObh7seVpnRikE8+f93RPKH1DnjzwsdOMmlOaPR8PRZR4/eA9nsxoquok+z
	 4s20EOJ1NjB8jjZpD1DoMhSo35SF7Pr5N4TNqwQgDujefqfBDpGN6FWvKD0DNjJdiX
	 7xiG9156s/fcKQI7Gf6XDjWJrpb+BUzQ26yslUFDcl944vsrj8eH4DHWmGZtpd8t7i
	 CRYAeQBlOfFN2Mw6nZKls9JDGCrwCrRMho57+uvpiItXDBadiwWXUx6W+xLDWfGMiY
	 bGm6BVfdR5PhbI5BUk7MoQeXePEIKC6cZ44yCXcpM612vRrZp0BVNP6Hpc9n7Y0nyc
	 yvpf+APYPxa5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1750946512; x=1751207012; i=teddy.astie@vates.tech;
	bh=vYNfbUgiAlXIcQwc14Rgxl0bPeXHRh2iS+BzaTbjWWg=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=G4TpTOaTQM9XBp0xxTempTFrHaYENTUmNgRMYSRaPol/Z82gW4TsbFGt0FobWk5P6
	 20fbW9ozSVjziY1MYMe/rubswo0JtpfsbKoCoJajgivmnVxyhUTNoyWkaRRe/Iu8n4
	 7dp4qFHEpXt2wGj+bhJGKUGY1WBEYp0iMzIXEuXMZOfHFF6FX7mqEbnncIg0I/1QyH
	 bhtzO4UlGfUari/g2SxjZ8A/fVDFd+PLzvU6Rp2fpUzvxZcciDlPEnMN/ddXPSPqDw
	 Jo7/now34Z2eWMsR+LZr9xbyx/go45RF5Vdofc3Ap5VMp1N0WynwWl+vg0t+OMJ8RZ
	 HylAL2qteTIuA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=20v3=202/3]=20vmx:=20Introduce=20vcpu=20single=20context=20VPID=20invalidation?=
X-Mailer: git-send-email 2.50.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1750946509336
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <5aa649e122401c627d4560f68d156ead470ef6d6.1750770621.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1750770621.git.teddy.astie@vates.tech>
References: <cover.1750770621.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.1e65ae06e1504cd5bff887064f71c6f6?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250626:md
Date: Thu, 26 Jun 2025 14:01:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Introduce vpid_sync_vcpu_context to do a single-context invalidation
on the vpid attached to the vcpu as a alternative to per-gva and all-context
invlidations.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/include/asm/hvm/vmx/vmx.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
index 8559343857..173311bfbb 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -452,6 +452,19 @@ static inline void ept_sync_all(void)
 
 void ept_sync_domain(struct p2m_domain *p2m);
 
+static inline void vpid_sync_vcpu_context(struct vcpu *v)
+{
+    unsigned long type;
+
+    /* Use the most precise invalidation type available. */
+    if ( likely(cpu_has_vmx_vpid_invvpid_single_context) )
+        type = INVVPID_SINGLE_CONTEXT;
+    else
+        type = INVVPID_ALL_CONTEXT;
+
+    __invvpid(type, v->arch.hvm.n1asid.asid, 0);
+}
+
 static inline void vpid_sync_vcpu_gva(struct vcpu *v, unsigned long gva)
 {
     unsigned long type;
-- 
2.50.0



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


