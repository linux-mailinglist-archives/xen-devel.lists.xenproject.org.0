Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C0D1C0460
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 20:10:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUDcj-0006E4-Bx; Thu, 30 Apr 2020 18:09:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/gX9=6O=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jUDch-0006Dz-RK
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 18:09:23 +0000
X-Inumbo-ID: b693c0fd-8b0d-11ea-9a8d-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b693c0fd-8b0d-11ea-9a8d-12813bfff9fa;
 Thu, 30 Apr 2020 18:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588270162;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=62PGdF+06MeHjzW7MjMajxK6hZQfjsamzxWU86mFF14=;
 b=BVBteh+tlxD1SXuKUjNh6kehV8nE6+9fWoxChu2EoR0jLcpG8+h2sKf+
 C3L67Y9D26wVK5rEIPjY2P/1M7dCYeOyegsFF3V/Qtv3TMgm+lw+vXZ+P
 rfPcH7ffsWi9Onw+kkPI0jxq6X5kU34Nu6LAGv0FFV+Ayz3EmIJeST9zM I=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: V2L/P/HuW5hvQ3CzJkAOPntko5E2GHA/rz/1nOcH3Z0P9UjrqnbJEUHhYJA53vQa6SwcVmP4Y0
 3IOgVVpRHrC1XlwVHc/PtEqDSu+/s5KePujTwDjOG9XBVSQeAV2PaNEFYBCnmVF4n1RGgLDwSg
 BbKoro1JEA4YlEpy260k6Xrp5mDX/gk7Cw9rwmoKmdSkSvP448VIVVyTcNCtvLc1uqzbDThAlp
 mFKPDg9uNKSk5n/ovc9CuuWTRK6r2SDhVz5rL5xLAjE6+MQstEaX21TESvyhKCjoU8aTwywbZg
 rCk=
X-SBRS: 2.7
X-MesageID: 16841389
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,336,1583211600"; d="scan'208";a="16841389"
Date: Thu, 30 Apr 2020 20:09:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/hap: be more selective with assisted TLB flush
Message-ID: <20200430180913.GF28601@Air-de-Roger>
References: <20200429173601.77605-1-roger.pau@citrix.com>
 <4257a323-d37f-4af0-bdc6-a3f65c19438a@suse.com>
 <20200430082844.GZ28601@Air-de-Roger>
 <d5a0308b-0ac3-21f5-9a07-e1402005b663@suse.com>
 <487fb08f-a9f5-7de9-54f0-f158fa687e6c@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <487fb08f-a9f5-7de9-54f0-f158fa687e6c@citrix.com>
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, George
 Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Apr 30, 2020 at 05:19:19PM +0100, Andrew Cooper wrote:
> On 30/04/2020 09:33, Jan Beulich wrote:
> > On 30.04.2020 10:28, Roger Pau Monné wrote:
> >> On Thu, Apr 30, 2020 at 09:20:58AM +0200, Jan Beulich wrote:
> >>> On 29.04.2020 19:36, Roger Pau Monne wrote:
> >>>> When doing an assisted flush on HAP the purpose of the
> >>>> on_selected_cpus is just to trigger a vmexit on remote CPUs that are
> >>>> in guest context, and hence just using is_vcpu_dirty_cpu is too lax,
> >>>> also check that the vCPU is running.
> >>> Am I right to understand that the change is relevant only to
> >>> cover the period of time between ->is_running becoming false
> >>> and ->dirty_cpu becoming VCPU_CPU_CLEAN? I.e. ...
> >>>
> >>>> --- a/xen/arch/x86/mm/hap/hap.c
> >>>> +++ b/xen/arch/x86/mm/hap/hap.c
> >>>> @@ -719,7 +719,7 @@ static bool flush_tlb(bool (*flush_vcpu)(void *ctxt, struct vcpu *v),
> >>>>          hvm_asid_flush_vcpu(v);
> >>>>  
> >>>>          cpu = read_atomic(&v->dirty_cpu);
> >>>> -        if ( cpu != this_cpu && is_vcpu_dirty_cpu(cpu) )
> >>>> +        if ( cpu != this_cpu && is_vcpu_dirty_cpu(cpu) && v->is_running )
> >>> ... the previous logic would have suitably covered the switch-to
> >>> path, but doesn't properly cover the switch-from one, due to our
> >>> lazy context switch approach?
> >> Yes. Also __context_switch is not called from context_switch when
> >> switching to the idle vcpu, and hence dirty_cpu is not cleared.
> >>
> >>> If so, I agree with the change:
> >>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> >>> It might be worth mentioning this detail in the description then,
> >>> though.
> >> Would you mind adding to the commit message if you agree:
> >>
> >> "Due to the lazy context switching done by Xen dirty_cpu won't always be
> >> cleared when the guest vCPU is not running, and hence relying on
> >> is_running allows more fine grained control of whether the vCPU is
> >> actually running."
> > Sure; I'll give it over the weekend though for others to comment, if
> > so desired.
> 
> I think it is worth pointing out that this fixes a large perf regression
> on Nehalem/Westmere systems, where L1 Shim using the enlightened
> hypercall is 8x slower than unenlightened way.

I might as well post the actual numbers I have.

I've measured the time of the non-local branch of flush_area_mask
inside the shim running with 32vCPUs over 100000 executions and
averaged the result on a large Westmere system (80 ways total). The
figures where fetched during the boot of a SLES 11 PV guest. The
results are as follow (less is better):

Non assisted flush with x2APIC:      112406ns
Assisted flush without this patch:   820450ns
Assisted flush with this patch:        8330ns

I can add the figures to the commit message if deemed interesting to
have in the repo. Or the above text can be appended to the commit
message if that's fine.

Roger.

