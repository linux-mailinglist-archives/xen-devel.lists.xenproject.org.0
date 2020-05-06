Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D591C69CF
	for <lists+xen-devel@lfdr.de>; Wed,  6 May 2020 09:09:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWEB0-00037c-8s; Wed, 06 May 2020 07:09:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=raAm=6U=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jWEAy-00037X-NM
 for xen-devel@lists.xenproject.org; Wed, 06 May 2020 07:09:04 +0000
X-Inumbo-ID: 7733b64c-8f68-11ea-9e1f-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7733b64c-8f68-11ea-9e1f-12813bfff9fa;
 Wed, 06 May 2020 07:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588748943;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=1mvcrLmH/R/bgzMfV8ZlI0HANXQ1/5k5Kq3wxVMcWZc=;
 b=EnS1UHSq8Q/qfCNj6w7XV+le2R+mQmruCs+r2svIS92cErmZhkADtvv/
 zCcRzkcknwKxbxx4UQ+1mCUv15gq8YnMY71dlACK/2q2koDIQ2qyHTYky
 ojY741cP+MAUINUGBfBOrHbMXjXM4k//9NaOhG+VU3lsaHdMCVolTzu2S o=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 8Lq6aG8/yWSZuXBMccfeU/gD7OsL6KqCiFrUa6LlHklnpqH2yeqFTJjfVFNpwp5TQdEmxdk6eD
 lclFMFelQEPyGbaEtku8M6zAYw/uVeS6HXzPWVC0BF9mby1dGPNbeiXiR5yaZB4p/Ev2dYceV4
 VdPKMn2kft02F+123SHPNKLYjhdfmxxSJgVksOwHHl0bVXB2Bnd39EoUwTpYjnR39EUVOkTEOX
 MGQpWoz9Dt6jxkr9fWAII/5zusL+E4u7pybc5lJGtefYQ47IYAMfViSIQ6qCDg9ZD4Xjp1oZ/i
 0XM=
X-SBRS: 2.7
X-MesageID: 17105430
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,358,1583211600"; d="scan'208";a="17105430"
Date: Wed, 6 May 2020 09:08:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/svm: Use flush-by-asid when available
Message-ID: <20200506070852.GE1353@Air-de-Roger>
References: <20200505182539.12247-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200505182539.12247-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, May 05, 2020 at 07:25:39PM +0100, Andrew Cooper wrote:
> AMD Fam15h processors introduced the flush-by-asid feature, for more fine
> grain flushing purposes.
> 
> Flushing everything including ASID 0 (i.e. Xen context) is an an unnecesserily
> large hammer, and never necessary in the context of guest TLBs needing
> invalidating.
> 
> When available, use TLB_CTRL_FLUSH_ASID in preference to TLB_CTRL_FLUSH_ALL.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

I should also look into restricting the usage of FLUSH_HVM_ASID_CORE
and instead perform more fine grained per-vCPU flushes when possible,
since FLUSH_HVM_ASID_CORE resets the pCPU ASID generation forcing a
new ASID to be allocated for all vCPUs running on that pCPU.

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Wei Liu <wl@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> The APM currently describes tlb_control encoding 1 as "Flush entire
> TLB (Should be used only by legacy hypervisors.)".  AMD have agreed that this
> is misleading and should say "legacy hardware" instead.

AFAICT using TLB_CTRL_FLUSH_ASID on hardware not supporting the
feature has not been found to be safe? Ie: TLB_CTRL_FLUSH_ALL is a
subset of TLB_CTRL_FLUSH_ASID from a bitmap PoV, so if those bits
where ignored on older hardware it should be safe to unconditionally
use it.

> This change does come with a minor observed perf improvement on Fam17h
> hardware, of ~0.6s over ~22s for my XTF pagewalk test.  This test will spot
> TLB flushing issues, but isn't optimal for spotting the perf increase from
> better flushing.  There were no observed differences for Fam15h, but this
> could simply mean that the measured code footprint was larger than the TLB on
> this CPU.
> ---
>  xen/arch/x86/hvm/svm/asid.c       | 9 ++++++---
>  xen/include/asm-x86/hvm/svm/svm.h | 1 +
>  2 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/svm/asid.c b/xen/arch/x86/hvm/svm/asid.c
> index 9be90058c7..ab06dd3f3a 100644
> --- a/xen/arch/x86/hvm/svm/asid.c
> +++ b/xen/arch/x86/hvm/svm/asid.c
> @@ -18,6 +18,7 @@
>  #include <asm/amd.h>
>  #include <asm/hvm/nestedhvm.h>
>  #include <asm/hvm/svm/asid.h>
> +#include <asm/hvm/svm/svm.h>
>  
>  void svm_asid_init(const struct cpuinfo_x86 *c)
>  {
> @@ -47,15 +48,17 @@ void svm_asid_handle_vmrun(void)
>      if ( p_asid->asid == 0 )
>      {
>          vmcb_set_guest_asid(vmcb, 1);
> -        /* TODO: investigate using TLB_CTRL_FLUSH_ASID here instead. */
> -        vmcb->tlb_control = TLB_CTRL_FLUSH_ALL;
> +        vmcb->tlb_control =
> +            cpu_has_svm_flushbyasid ? TLB_CTRL_FLUSH_ASID : TLB_CTRL_FLUSH_ALL;
>          return;
>      }
>  
>      if ( vmcb_get_guest_asid(vmcb) != p_asid->asid )
>          vmcb_set_guest_asid(vmcb, p_asid->asid);
>  
> -    vmcb->tlb_control = need_flush ? TLB_CTRL_FLUSH_ALL : TLB_CTRL_NO_FLUSH;
> +    vmcb->tlb_control =
> +        !need_flush ? TLB_CTRL_NO_FLUSH :
> +        cpu_has_svm_flushbyasid ? TLB_CTRL_FLUSH_ASID : TLB_CTRL_FLUSH_ALL;

Since this code structure is used in two places I would consider
locally introducing something like:

#define TLB_CTRL_FLUSH_CMD (cpu_has_svm_flushbyasid ? TLB_CTRL_FLUSH_ASID \
                                                    : TLB_CTRL_FLUSH_ALL)

To abstract it away.

Thanks, Roger.

