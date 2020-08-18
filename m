Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEBE248715
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 16:17:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k82QH-0003Tl-NG; Tue, 18 Aug 2020 14:17:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gypu=B4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k82QG-0003TY-8I
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 14:17:08 +0000
X-Inumbo-ID: 8d45e72c-0264-47c6-b7b3-a620bb01ac89
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8d45e72c-0264-47c6-b7b3-a620bb01ac89;
 Tue, 18 Aug 2020 14:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597760226;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=CFXd2CvIakbNxuTB+0gNsLh2la9XgsC9icxUxTtpFI4=;
 b=gbRDVJGpyP6GRDPyM/iNwOw9dDlCLojQBlLGvUa0z6U5evXlWgcG3Vjb
 6Jm4CqdhMi356qVQUXUaI4qViO40j+pseXxNgGZda+pqO0mpFTzINw7+E
 GsWLeMnVM4pdhlyVAseGyJdxHk6xPsagWWSw9NJtlDH26LumIrWpuFfAo Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: hpAGertOY6h96vFJosVsOxvjE0bEYT6EfR76DTDLDgwxTpzDGRhY+gFDsFRIwL4zvuYfutN2LI
 hF1petDBLX35qx2BwGXBaBRMAjhAbNzHkbNtjnzEI15vFJV2LRBcU/hrGsXnvdcoeDVYgCcu2z
 wS1Zt5J6Lf2qTXXrqvUgMfki8VENqzg58QWNzg56H/FQGOLrSR4jfJxk6VVwHNBObDfbeKVXf9
 IgK5H9lWB1+U2ooDyTl6vkXEmBvOVyrO8zAJo3dWHRscOKe/meBPNXDLoX5EL6NUDBa8Z+WlgO
 bCs=
X-SBRS: 2.7
X-MesageID: 25088134
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,327,1592884800"; d="scan'208";a="25088134"
Subject: Re: [PATCH 8/8] x86/hvm: Disallow access to unknown MSRs
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Jun Nakajima
 <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
References: <20200817155757.3372-1-roger.pau@citrix.com>
 <20200817155757.3372-9-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <7b1e5a12-d39d-4dce-f6a8-51e202887d61@citrix.com>
Date: Tue, 18 Aug 2020 15:17:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817155757.3372-9-roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 17/08/2020 16:57, Roger Pau Monne wrote:
> From: Andrew Cooper <andrew.cooper3@citrix.com>
>
> Change the catch-all behavior for MSR not explicitly handled. Instead
> of allow full read-access to the MSR space and silently dropping
> writes return an exception when the MSR is not explicitly handled.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

It occurs to me that this hunk should be folded.

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 7b056ccc05..fdfce4f665 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3294,11 +3294,6 @@ static int vmx_msr_write_intercept(unsigned int
msr, uint64_t msr_content)
         __vmwrite(GUEST_IA32_DEBUGCTL, msr_content);
         break;
 
-    case MSR_IA32_FEATURE_CONTROL:
-    case MSR_IA32_VMX_BASIC ... MSR_IA32_VMX_VMFUNC:
-        /* None of these MSRs are writeable. */
-        goto gp_fault;
-
     case MSR_IA32_MISC_ENABLE:
         /* Silently drop writes that don't change the reported value. */
         if ( vmx_msr_read_intercept(msr, &tmp) != X86EMUL_OKAY ||

now that the default: case does the right thing.

~Andrew

