Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA895295CB3
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 12:29:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10351.27546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVXq6-00018P-I4; Thu, 22 Oct 2020 10:28:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10351.27546; Thu, 22 Oct 2020 10:28:58 +0000
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
	id 1kVXq6-000180-Eg; Thu, 22 Oct 2020 10:28:58 +0000
Received: by outflank-mailman (input) for mailman id 10351;
 Thu, 22 Oct 2020 10:28:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mO8V=D5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kVXq4-00017v-Ri
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 10:28:57 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aa5974d7-4c6f-4323-9f56-0e707f91ed8b;
 Thu, 22 Oct 2020 10:28:54 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=mO8V=D5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kVXq4-00017v-Ri
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 10:28:57 +0000
X-Inumbo-ID: aa5974d7-4c6f-4323-9f56-0e707f91ed8b
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id aa5974d7-4c6f-4323-9f56-0e707f91ed8b;
	Thu, 22 Oct 2020 10:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603362535;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=OS9n6tbKBjphGjZrT8RrDGb83is9TdWWEG1i638Wfvs=;
  b=cGXvTgB+HLUe2M+EuMaePZY4vZSh/0D/TccvCijUDAJytA9cGpLx4bpy
   oCbIDIGFTnQe0nkYdaETzLyc2cSeqSnRk/FHiSPTfeDkphdd9QC6eX9yl
   t3L8GGecTBS4EmZ2rY2k/5OuS50wAPlFE4mjwSQRRs7jQ8u2wtCvHWOc7
   g=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 55AJ6+kyIihsC+u4pev7e4wPeP4uv9dDBkfwOfvA1Yi1n9JNQNm1Nwp8DUCsimgcLLJ92hF1bl
 vkulAOM+rweziuTb6vTPalq9EuMUtFAjsOiFkfEsiw6ah3z3ICmbGsJ+ZRCUcWDIgcLeNygsIT
 pum0q8X/ENPk6aBXrR0PmOoRgB6IKl7TT6K4/OFxgZnYgGsNDiq10i25kL9YgVFLhoXpDc/qCa
 Ez0BcslaJnHF4957ZAtqN6Lxxn/DvjFqwQEyWeqgdRoAGRWTBhDMsFcRBkWWW6+2R6XtNT6iD4
 M+g=
X-SBRS: None
X-MesageID: 29559715
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,404,1596513600"; 
   d="scan'208";a="29559715"
Date: Thu, 22 Oct 2020 12:28:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH v2 3/8] evtchn: rename and adjust guest_enabled_event()
Message-ID: <20201022102844.4ijjwihdwzhuzqjt@Air-de-Roger>
References: <19babf20-3649-5c63-44a9-7edfa81835aa@suse.com>
 <119ad32e-91f0-5c1d-c400-de78ab816839@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <119ad32e-91f0-5c1d-c400-de78ab816839@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL06.citrite.net (10.13.108.179)

On Tue, Oct 20, 2020 at 04:09:16PM +0200, Jan Beulich wrote:
> The function isn't about an "event" in general, but about a vIRQ. The
> function also failed to honor global vIRQ-s, instead assuming the caller
> would pass vCPU 0 in such a case.
> 
> While at it also adjust the
> - types the function uses,
> - single user to make use of domain_vcpu().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> v2: New.
> 
> --- a/xen/arch/x86/cpu/mcheck/vmce.h
> +++ b/xen/arch/x86/cpu/mcheck/vmce.h
> @@ -5,9 +5,9 @@
>  
>  int vmce_init(struct cpuinfo_x86 *c);
>  
> -#define dom0_vmce_enabled() (hardware_domain && hardware_domain->max_vcpus \
> -        && hardware_domain->vcpu[0] \
> -        && guest_enabled_event(hardware_domain->vcpu[0], VIRQ_MCA))
> +#define dom0_vmce_enabled() \
> +    (hardware_domain && \
> +     evtchn_virq_enabled(domain_vcpu(hardware_domain, 0), VIRQ_MCA))
>  
>  int unmmap_broken_page(struct domain *d, mfn_t mfn, unsigned long gfn);
>  
> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -778,9 +778,15 @@ out:
>      return ret;
>  }
>  
> -int guest_enabled_event(struct vcpu *v, uint32_t virq)
> +bool evtchn_virq_enabled(const struct vcpu *v, unsigned int virq)
>  {
> -    return ((v != NULL) && (v->virq_to_evtchn[virq] != 0));
> +    if ( !v )

Not sure it's worth adding a check that virq < NR_VIRQS here just to
be on the safe side...

> +        return false;
> +
> +    if ( virq_is_global(virq) && v->vcpu_id )

...as virq_is_global has an ASSERT to that extend (but that would be a
nop on release builds).

Thanks, Roger.

