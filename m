Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE4B3684F7
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 18:36:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115740.220857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZcJ5-00032F-IX; Thu, 22 Apr 2021 16:35:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115740.220857; Thu, 22 Apr 2021 16:35:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZcJ5-00031t-FV; Thu, 22 Apr 2021 16:35:59 +0000
Received: by outflank-mailman (input) for mailman id 115740;
 Thu, 22 Apr 2021 16:35:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>) id 1lZcJ3-00031o-8z
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 16:35:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1lZcJ3-0002Gm-1N; Thu, 22 Apr 2021 16:35:57 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=edge-m3-r2-133.e-iad51.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1lZcJ2-0001ZW-K1; Thu, 22 Apr 2021 16:35:56 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Mime-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID;
	bh=yrcQV+90vwjvlrYogL9INP7v7DopINZvrcEoOXdgfLI=; b=OG38H2HCTJK93yyEoTjr97ghRu
	z30Snx4YnJkUWVhfgWCIl6KWUnURvZlTsGNSxMpoB8nVPSGs4Bf5eVVi+OIDiq/NbjIPokDjFtz/x
	FwvJ2bw+kd/OOBJ7X+CG0m7hdriHTdK/B2YP+99VMvF62xD+r739fYIdX5Dztz45WEX8=;
Message-ID: <8aa8fe1b78a50e69ad1bc4afdd315eb254266162.camel@xen.org>
Subject: Re: [PATCH v10 00/13] switch to domheap for Xen page tables
From: Hongyan Xia <hx242@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: jgrall@amazon.com, Jan Beulich <jbeulich@suse.com>, Roger Pau
	=?ISO-8859-1?Q?Monn=E9?=
	 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Date: Thu, 22 Apr 2021 17:35:54 +0100
In-Reply-To: <ff54b35e-bcf7-3343-4704-417aeb53865a@citrix.com>
References: <cover.1619014052.git.hongyxia@amazon.com>
	 <ff54b35e-bcf7-3343-4704-417aeb53865a@citrix.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit

Please see my reply in 03/13. Can you check this diff and see if you
can still trigger this issue:

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 50229e38d384..84e3ccf47e2a 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5532,7 +5532,6 @@ int map_pages_to_xen(
 
  out:
     L3T_UNLOCK(current_l3page);
-    unmap_domain_page(pl2e);
     unmap_domain_page(pl3e);
     unmap_domain_page(pl2e);
     return rc;
@@ -5830,6 +5829,7 @@ int modify_xen_mappings(unsigned long s, unsigned
long e, unsigned int nf)
  out:
     L3T_UNLOCK(current_l3page);
     unmap_domain_page(pl3e);
+    unmap_domain_page(pl2e);
     return rc;
 }

Hongyan
 
On Thu, 2021-04-22 at 17:21 +0100, Andrew Cooper wrote:
> On 21/04/2021 15:15, Hongyan Xia wrote:
> > From: Hongyan Xia <hongyxia@amazon.com>
> > 
> > This series rewrites all the remaining functions and finally makes
> > the
> > switch from xenheap to domheap for Xen page tables, so that they no
> > longer need to rely on the direct map, which is a big step towards
> > removing the direct map.
> 
> Staging is broken.  Xen hits an assertion just after dom0 starts.
> 
> (XEN) Freed 616kB init memory
> mapping kernel into physical memory
> about to get started...
> (XEN) Assertion 'hashent->refcnt' failed at domain_page.c:204
> (XEN) ----[ Xen-4.16-unstable  x86_64  debug=y  Not tainted ]----
> (XEN) CPU:    0
> (XEN) RIP:    e008:[<ffff82d040316f80>] unmap_domain_page+0x2af/0x2e0
> (XEN) RFLAGS: 0000000000010046   CONTEXT: hypervisor (d0v0)
> (XEN) rax: 0000000000000000   rbx: ffff831c47bf9040   rcx:
> ffff831c47c1a000
> (XEN) rdx: 0000000000000092   rsi: 0000000000000092   rdi:
> 0000000000000206
> (XEN) rbp: ffff8300a5ca7c88   rsp: ffff8300a5ca7c78   r8: 
> 0000000001c4f2fc
> (XEN) r9:  0000000000000000   r10: 0000000000000000   r11:
> 0000000000000000
> (XEN) r12: 0000000000092018   r13: 0000000000800163   r14:
> fff0000000000000
> (XEN) r15: 0000000000000001   cr0: 0000000080050033   cr4:
> 00000000003406e0
> (XEN) cr3: 0000001c42008000   cr2: ffffc9000133d000
> (XEN) fsb: 0000000000000000   gsb: ffff888266a00000   gss:
> 0000000000000000
> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e010   cs: e008
> (XEN) Xen code around <ffff82d040316f80>
> (unmap_domain_page+0x2af/0x2e0):
> (XEN)  14 04 00 00 eb 19 0f 0b <0f> 0b 0f 0b ba 00 00 00 00 48 89 10
> 48
> 8b 81 d0
> (XEN) Xen stack trace from rsp=ffff8300a5ca7c78:
> (XEN)    ffff820040092018 0000000000000000 ffff8300a5ca7d58
> ffff82d040327e20
> (XEN)    a000000000000000 0000000000000000 ffff82d0405dbd40
> 008001e300000000
> (XEN)    8000000000000000 8000000000000000 00000000000001e3
> 00000000000001e3
> (XEN)    8000000000000000 0000000000000000 8000000000000163
> 0000000001440000
> (XEN)    ffff82e0014b92e0 0000000301c1a000 0000000000000000
> ffff820040090800
> (XEN)    00000000026c10d8 0000000001c4f2fc 8010001c4240f067
> ffff8300a5ca7df0
> (XEN)    ffff82c00071c000 0000000000000001 0000000000001000
> ffff8300a5ca7df8
> (XEN)    ffff8300a5ca7dc8 ffff82d040232c08 ffff8300a5ca7db8
> 0000000140088078
> (XEN)    ffff8300a5ca7df0 0080016300000001 ffffffff00000000
> ffff82c00071c000
> (XEN)    ffff82d0405b1300 ffff831c47bf9000 ffff82e04d821ae0
> 00000000026c10d7
> (XEN)    ffff831c47c1a000 0000000000000100 ffff8300a5ca7dd8
> ffff82d040232cdb
> (XEN)    ffff8300a5ca7df8 ffff82d04031718b ffff8300a5ca7df8
> 00000000026c10d7
> (XEN)    ffff8300a5ca7e38 ffff82d040209cb6 ffff831c47c1a018
> 0000000000000000
> (XEN)    ffffffff82003e90 ffff831c47c1a018 ffff831c47bf9000
> fffffffffffffff2
> (XEN)    ffff8300a5ca7eb8 ffff82d04020a69a ffff82d04038a228
> ffff82d04038a21c
> (XEN)    00000000026c10d7 0000000000000100 ffff82d04038a228
> ffff82d04038a21c
> (XEN)    ffff82d04038a228 ffff82d04038a21c ffff82d04038a228
> ffff8300a5ca7ef8
> (XEN)    ffff831c47bf9000 0000000000000003 0000000000000000
> 0000000000000000
> (XEN)    ffff8300a5ca7ee8 ffff82d040306e14 ffff82d04038a228
> ffff831c47bf9000
> (XEN)    0000000000000000 0000000000000000 00007cff5a3580e7
> ffff82d04038a29d
> (XEN) Xen call trace:
> (XEN)    [<ffff82d040316f80>] R unmap_domain_page+0x2af/0x2e0
> (XEN)    [<ffff82d040327e20>] F map_pages_to_xen+0x101a/0x1166
> (XEN)    [<ffff82d040232c08>] F __vmap+0x332/0x3cd
> (XEN)    [<ffff82d040232cdb>] F vmap+0x38/0x3a
> (XEN)    [<ffff82d04031718b>] F map_domain_page_global+0x46/0x51
> (XEN)    [<ffff82d040209cb6>] F map_vcpu_info+0x129/0x2c5
> (XEN)    [<ffff82d04020a69a>] F do_vcpu_op+0x1eb/0x681
> (XEN)    [<ffff82d040306e14>] F pv_hypercall+0x4e6/0x53d
> (XEN)    [<ffff82d04038a29d>] F lstar_enter+0x12d/0x140
> (XEN)
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 0:
> (XEN) Assertion 'hashent->refcnt' failed at domain_page.c:204
> (XEN) ****************************************
> (XEN)
> (XEN) Reboot in five seconds...
> 
> I don't see an obvious candidate for the breakage.  Unless someone
> can
> point one out quickly, I'll revert the lot to unblock staging.
> 
> ~Andrew


