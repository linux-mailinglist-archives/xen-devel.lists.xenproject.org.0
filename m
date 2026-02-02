Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LmUBSJ1gGnU8QIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 10:57:54 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBCFCA589
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 10:57:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218465.1527220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmqgU-0001nD-KP; Mon, 02 Feb 2026 09:57:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218465.1527220; Mon, 02 Feb 2026 09:57:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmqgU-0001hX-EV; Mon, 02 Feb 2026 09:57:30 +0000
Received: by outflank-mailman (input) for mailman id 1218465;
 Mon, 02 Feb 2026 09:52:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IGL7=AG=sony.com=shashank.mahadasyam@srs-se1.protection.inumbo.net>)
 id 1vmqbH-0001Jw-EQ
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 09:52:07 +0000
Received: from jpms-ob01.noc.sony.co.jp (jpms-ob01.noc.sony.co.jp
 [2001:cf8:ace:41::4]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d14876f9-001c-11f1-b161-2bf370ae4941;
 Mon, 02 Feb 2026 10:52:02 +0100 (CET)
Received: from unknown (HELO jpmta-ob1.noc.sony.co.jp)
 ([IPv6:2001:cf8:0:6e7::6])
 by jpms-ob01.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 18:51:38 +0900
Received: from unknown (HELO [127.0.1.1])
 ([IPv6:2001:cf8:1:573:0:dddd:6b3e:119e])
 by jpmta-ob1.noc.sony.co.jp with ESMTP; 02 Feb 2026 18:51:38 +0900
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
X-Inumbo-ID: d14876f9-001c-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1770025922; x=1801561922;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=GI9OPx+uxZW/9+u+5es0pePWKf46Zy6n4IWktANHhfk=;
  b=e0byH80zs8rrbQ+SG/yAl5pVranguTJiTv2KWDsjEGqSkO0OssSgf3fK
   xLzgSY2byQDmZEO4/gMmtjRIcIrv2X6uzjUHJw77nRIxKz6zZi3K55kuO
   38sboMnzWKGwEVC0Zp2KqjPEJLlHec1DN8AtGEPooANNGGJtI6coTmKye
   5hIKBQTElzNhrXwgQOfvEpHM1OIIwfjdq1yl7+F60z6UYNgiQVOQnwjXj
   TvdVB5woj9IHUULn1vhdFdW7zWl1CVTL6qjcg2C/PMXGBcbnYXMGpbUti
   HU5HUQYXh7YyUpPOeZeRJyOI/VdGYcQrYiwlb3Do/Hh/Ox5hYn8ib/1Vc
   w==;
X-IronPort-AV: E=Sophos;i="6.21,268,1763391600"; 
   d="scan'208";a="607384937"
From: Shashank Balaji <shashank.mahadasyam@sony.com>
Date: Mon, 02 Feb 2026 18:51:03 +0900
Subject: [PATCH 2/3] x86/defconfig: add CONFIG_IRQ_REMAP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-x2apic-fix-v1-2-71c8f488a88b@sony.com>
References: <20260202-x2apic-fix-v1-0-71c8f488a88b@sony.com>
In-Reply-To: <20260202-x2apic-fix-v1-0-71c8f488a88b@sony.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Suresh Siddha <suresh.b.siddha@intel.com>, 
 "K. Y. Srinivasan" <kys@microsoft.com>, 
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
 Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
 Ajay Kaher <ajay.kaher@broadcom.com>, 
 Alexey Makhalov <alexey.makhalov@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Jan Kiszka <jan.kiszka@siemens.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Ingo Molnar <mingo@elte.hu>, linux-kernel@vger.kernel.org, 
 linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev, 
 jailhouse-dev@googlegroups.com, kvm@vger.kernel.org, 
 xen-devel@lists.xenproject.org, Rahul Bukte <rahul.bukte@sony.com>, 
 Shashank Balaji <shashank.mahadasyam@sony.com>, 
 Daniel Palmer <daniel.palmer@sony.com>, Tim Bird <tim.bird@sony.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=897;
 i=shashank.mahadasyam@sony.com; h=from:subject:message-id;
 bh=WGBqeRf3m3q38dcFfIzoZC7KITAdIHJXG+fCWgOOD40=;
 b=owGbwMvMwCU2bX1+URVTXyjjabUkhsyG4hWJ5ZPesy10dLqdVPT13NLfdzYoem+Z+6FTrppr+
 3YRUxvJjlIWBjEuBlkxRZZSpepfe1cELek581oRZg4rE8gQBi5OAZiI71yG/3G5dneW7G7keJnx
 4Wd+z+9zOUtZjcKVjm+qm6rqVBCX9Jnhf+n3kx2OkYsNn+1Qe6/XFrn9pXSWzssdU98b3/BZ2S2
 XyAQA
X-Developer-Key: i=shashank.mahadasyam@sony.com; a=openpgp;
 fpr=75227BFABDA852A48CCCEB2196AF6F727A028E55
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[sony.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[sony.com:s=s1jp];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:suresh.b.siddha@intel.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:jan.kiszka@siemens.com,m:pbonzini@redhat.com,m:vkuznets@redhat.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:mingo@elte.hu,m:linux-kernel@vger.kernel.org,m:linux-hyperv@vger.kernel.org,m:virtualization@lists.linux.dev,m:jailhouse-dev@googlegroups.com,m:kvm@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:rahul.bukte@sony.com,m:shashank.mahadasyam@sony.com,m:daniel.palmer@sony.com,m:tim.bird@sony.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[shashank.mahadasyam@sony.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[sony.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shashank.mahadasyam@sony.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: BCBCFCA589
X-Rspamd-Action: no action

Interrupt remapping is an architectural dependency of x2apic, which is already
enabled in the defconfig. Enable CONFIG_IRQ_REMAP so that a defconfig kernel on
bare metal actually uses x2apic.

Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
---
 arch/x86/configs/x86_64_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/configs/x86_64_defconfig b/arch/x86/configs/x86_64_defconfig
index 7d7310cdf8b0..269f7d808be4 100644
--- a/arch/x86/configs/x86_64_defconfig
+++ b/arch/x86/configs/x86_64_defconfig
@@ -230,6 +230,7 @@ CONFIG_EEEPC_LAPTOP=y
 CONFIG_AMD_IOMMU=y
 CONFIG_INTEL_IOMMU=y
 # CONFIG_INTEL_IOMMU_DEFAULT_ON is not set
+CONFIG_IRQ_REMAP=y
 CONFIG_EXT4_FS=y
 CONFIG_EXT4_FS_POSIX_ACL=y
 CONFIG_EXT4_FS_SECURITY=y

-- 
2.43.0


