Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F41897EEE56
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 10:20:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634943.990578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3v0h-0000j3-Bg; Fri, 17 Nov 2023 09:19:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634943.990578; Fri, 17 Nov 2023 09:19:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3v0h-0000ga-8b; Fri, 17 Nov 2023 09:19:35 +0000
Received: by outflank-mailman (input) for mailman id 634943;
 Fri, 17 Nov 2023 09:19:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PCf8=G6=dingwall.me.uk=james@srs-se1.protection.inumbo.net>)
 id 1r3v0g-0000gU-9g
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 09:19:34 +0000
Received: from smarthost01a.ixn.mail.zen.net.uk
 (smarthost01a.ixn.mail.zen.net.uk [212.23.1.20])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 695a804a-852a-11ee-9b0e-b553b5be7939;
 Fri, 17 Nov 2023 10:19:30 +0100 (CET)
Received: from [217.155.64.189] (helo=mail0.xen.dingwall.me.uk)
 by smarthost01a.ixn.mail.zen.net.uk with esmtpsa (TLS1.0) tls
 TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA (Exim 4.95)
 (envelope-from <james@dingwall.me.uk>) id 1r3v0b-009Zth-Cd;
 Fri, 17 Nov 2023 09:19:29 +0000
Received: from localhost (localhost [IPv6:::1])
 by mail0.xen.dingwall.me.uk (Postfix) with ESMTP id 24FA48A41A1;
 Fri, 17 Nov 2023 09:19:29 +0000 (GMT)
Received: from mail0.xen.dingwall.me.uk ([IPv6:::1])
 by localhost (mail0.xen.dingwall.me.uk [IPv6:::1]) (amavisd-new, port 10024)
 with ESMTP id TnKB_RCThori; Fri, 17 Nov 2023 09:18:41 +0000 (GMT)
Received: from ghoul.dingwall.me.uk (ghoul.dingwall.me.uk
 [IPv6:2a02:8010:698e:302::c0a8:1c8])
 by dingwall.me.uk (Postfix) with ESMTP id 86F218A419E;
 Fri, 17 Nov 2023 09:18:40 +0000 (GMT)
Received: by ghoul.dingwall.me.uk (Postfix, from userid 1000)
 id 7583CAE; Fri, 17 Nov 2023 09:18:39 +0000 (GMT)
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
X-Inumbo-ID: 695a804a-852a-11ee-9b0e-b553b5be7939
X-Virus-Scanned: Debian amavisd-new at dingwall.me.uk
Date: Fri, 17 Nov 2023 09:18:39 +0000
From: James Dingwall <james@dingwall.me.uk>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: James Dingwall <james-xen@dingwall.me.uk>,
	xen-devel@lists.xenproject.org
Subject: Re: xen 4.15.5: msr_relaxed required for MSR 0x1a2
Message-ID: <ZVcv7259slJF4wBh@dingwall.me.uk>
References: <ZVZAO/W0m/h+IPbi@dingwall.me.uk>
 <aa13be5e-d90c-4074-a16c-d3b051da754d@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aa13be5e-d90c-4074-a16c-d3b051da754d@citrix.com>
X-Originating-smarthost01a-IP: [217.155.64.189]
Feedback-ID: 217.155.64.189

On Thu, Nov 16, 2023 at 04:32:47PM +0000, Andrew Cooper wrote:
> On 16/11/2023 4:15 pm, James Dingwall wrote:
> > Hi,
> >
> > Per the msr_relaxed documentation:
> >
> >    "If using this option is necessary to fix an issue, please report a bug."
> >
> > After recently upgrading an environment from Xen 4.14.5 to Xen 4.15.5 we
> > started experiencing a BSOD at boot with one of our Windows guests.  We found
> > that enabling `msr_relaxed = 1` in the guest configuration has resolved the
> > problem.  With a debug build of Xen and `hvm_debug=2048` on the command line
> > the following messages were caught as the BSOD happened:
> >
> > (XEN) [HVM:11.0] <vmx_msr_read_intercept> ecx=0x1a2
> > (XEN) vmx.c:3298:d11v0 RDMSR 0x000001a2 unimplemented
> > (XEN) d11v0 VIRIDIAN CRASH: 1e ffffffffc0000096 fffff80b8de81eb5 0 0
> >
> > I found that MSR 0x1a2 is MSR_TEMPERATURE_TARGET and from that this patch
> > series from last month:
> >
> > https://patchwork.kernel.org/project/xen-devel/list/?series=796550
> >
> > Picking out just a small part of that fixes the problem for us. Although the
> > the patch is against 4.15.5 I think it would be relevant to more recent
> > releases too.
> 
> Which version of Windows, and what hardware?
> 
> The Viridian Crash isn't about the RDMSR itself - it's presumably
> collateral damage shortly thereafter.
> 
> Does filling in 0 for that MSR also resolve the issue?  It's model
> specific and we absolutely cannot pass it through from real hardware
> like that.
> 

Hi Andrew,

Thanks for your response.  The guest is running Windows 10 and the crash
happens in a proprietary hardware driver.  A little bit of knowledge as
they say was enough to stop the crash but I don't understand the impact
of what I've actually done...

To rework the patch I'd need a bit of guidance, if I understand your
suggestion I set the MSR to 0 with this change in emul-priv-op.c:

diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index ed97b1d6fcc..66f5e417df6 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -976,6 +976,10 @@ static int read_msr(unsigned int reg, uint64_t *val,
         *val = 0;
         return X86EMUL_OKAY;
 
+    case MSR_TEMPERATURE_TARGET:
+        *val = 0;
+        return X86EMUL_OKAY;
+
     case MSR_P6_PERFCTR(0) ... MSR_P6_PERFCTR(7):
     case MSR_P6_EVNTSEL(0) ... MSR_P6_EVNTSEL(3):
     case MSR_CORE_PERF_FIXED_CTR0 ... MSR_CORE_PERF_FIXED_CTR2:

and this in vmx.c:

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 54023a92587..bbf37b7f272 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3259,6 +3259,11 @@ static int vmx_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
         if ( !nvmx_msr_read_intercept(msr, msr_content) )
             goto gp_fault;
         break;
+
+    case MSR_TEMPERATURE_TARGET:
+        *msr_content = 0;
+        break;
+
     case MSR_IA32_MISC_ENABLE:
         rdmsrl(MSR_IA32_MISC_ENABLE, *msr_content);
         /* Debug Trace Store is not supported. */


Thanks,
James

