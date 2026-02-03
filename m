Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBZ+DXpAgWl6FAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 01:25:30 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF72D2F2D
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 01:25:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1219109.1528054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vn4EB-0007od-II; Tue, 03 Feb 2026 00:25:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219109.1528054; Tue, 03 Feb 2026 00:25:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vn4EB-0007nT-Ff; Tue, 03 Feb 2026 00:25:11 +0000
Received: by outflank-mailman (input) for mailman id 1219109;
 Tue, 03 Feb 2026 00:25:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bzM9=AH=sony.com=shashank.mahadasyam@srs-se1.protection.inumbo.net>)
 id 1vn4EA-0007nN-OY
 for xen-devel@lists.xenproject.org; Tue, 03 Feb 2026 00:25:10 +0000
Received: from jpms-ob01.noc.sony.co.jp (jpms-ob01.noc.sony.co.jp
 [2001:cf8:ace:41::4]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c848afe5-0096-11f1-b161-2bf370ae4941;
 Tue, 03 Feb 2026 01:25:06 +0100 (CET)
Received: from unknown (HELO jpmta-ob1.noc.sony.co.jp)
 ([IPv6:2001:cf8:0:6e7::6])
 by jpms-ob01.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 09:25:02 +0900
Received: from unknown (HELO JPC00244420)
 ([IPv6:2001:cf8:1:573:0:dddd:6b3e:119e])
 by jpmta-ob1.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 09:25:02 +0900
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
X-Inumbo-ID: c848afe5-0096-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1770078307; x=1801614307;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+mESz147mY99AmYLlTyE/1U+z38Cj71ObLjn1oYbbso=;
  b=lIZk9Nru1lYOyTYyZwlWz0K0m3na9f5DoSvqAWGz6qd+RByXd3XPx3QG
   7xJUg+BwJmNVO3flmDlLgzhVVayK0UeUqU17i3h6cP2ANauBhBe7+vCfy
   ghUhmjiYxIgXqcanDUJ3t3srGMyWbbK4QmQajdTVbSxgmkbKGxPm/JMkO
   Zg4fozLDhe1+FulAXVhQgNLM3/RFd9Lnl4G7Zu6sBWzEz8EeCB3KEEGBf
   b7LaCAn+Rr+t1CG+QBdfvSuSl2ome02HkrxMunrCIQ4WUaUJVJap6gFi9
   m8brJ8PFL6aOp3BIYw1YZnReUZ3Iisits6A1nGLAm8Rz1nxf1RXG0wdcI
   w==;
X-IronPort-AV: E=Sophos;i="6.21,269,1763391600"; 
   d="scan'208";a="607577797"
Date: Tue, 3 Feb 2026 09:24:56 +0900
From: Shashank Balaji <shashank.mahadasyam@sony.com>
To: kernel test robot <lkp@intel.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Suresh Siddha <suresh.b.siddha@intel.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
	jailhouse-dev@googlegroups.com, kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org, Rahul Bukte <rahul.bukte@sony.com>,
	Daniel Palmer <daniel.palmer@sony.com>,
	Tim Bird <tim.bird@sony.com>
Subject: Re: [PATCH 1/3] x86/x2apic: disable x2apic on resume if the kernel
 expects so
Message-ID: <aYFAWPRTx7RqZn32@JPC00244420>
References: <20260202-x2apic-fix-v1-1-71c8f488a88b@sony.com>
 <202602030600.jFhsJyEC-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202602030600.jFhsJyEC-lkp@intel.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[sony.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sony.com:s=s1jp];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[32];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[shashank.mahadasyam@sony.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lkp@intel.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:suresh.b.siddha@intel.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:jan.kiszka@siemens.com,m:pbonzini@redhat.com,m:vkuznets@redhat.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:llvm@lists.linux.dev,m:oe-kbuild-all@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-hyperv@vger.kernel.org,m:virtualization@lists.linux.dev,m:jailhouse-dev@googlegroups.com,m:kvm@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:rahul.bukte@sony.com,m:daniel.palmer@sony.com,m:tim.bird@sony.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,01.org:url,sony.com:dkim,intel.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shashank.mahadasyam@sony.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[sony.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: DAF72D2F2D
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 06:31:40AM +0800, kernel test robot wrote:
> Hi Shashank,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on 18f7fcd5e69a04df57b563360b88be72471d6b62]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Shashank-Balaji/x86-x2apic-disable-x2apic-on-resume-if-the-kernel-expects-so/20260202-181147
> base:   18f7fcd5e69a04df57b563360b88be72471d6b62
> patch link:    https://lore.kernel.org/r/20260202-x2apic-fix-v1-1-71c8f488a88b%40sony.com
> patch subject: [PATCH 1/3] x86/x2apic: disable x2apic on resume if the kernel expects so
> config: i386-randconfig-001-20260202 (https://download.01.org/0day-ci/archive/20260203/202602030600.jFhsJyEC-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260203/202602030600.jFhsJyEC-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602030600.jFhsJyEC-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> arch/x86/kernel/apic/apic.c:2463:3: error: call to undeclared function '__x2apic_disable'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>     2463 |                 __x2apic_disable();
>          |                 ^
>    arch/x86/kernel/apic/apic.c:2463:3: note: did you mean '__x2apic_enable'?
>    arch/x86/kernel/apic/apic.c:1896:20: note: '__x2apic_enable' declared here
>     1896 | static inline void __x2apic_enable(void) { }
>          |                    ^
>    1 error generated.

This happens when CONFIG_X86_X2APIC is disabled. This patch fixes it,
which I'll include in v2:

diff --git i/arch/x86/kernel/apic/apic.c w/arch/x86/kernel/apic/apic.c
index 8820b631f8a2..06cce23b89c1 100644
--- i/arch/x86/kernel/apic/apic.c
+++ w/arch/x86/kernel/apic/apic.c
@@ -1894,6 +1894,7 @@ void __init check_x2apic(void)

 static inline void try_to_enable_x2apic(int remap_mode) { }
 static inline void __x2apic_enable(void) { }
+static inline void __x2apic_disable(void) {}
 #endif /* !CONFIG_X86_X2APIC */

 void __init enable_IR_x2apic(void)

