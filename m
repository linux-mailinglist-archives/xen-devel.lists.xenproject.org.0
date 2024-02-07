Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A3384C195
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 01:57:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677211.1053671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXWF9-0002Hz-9y; Wed, 07 Feb 2024 00:56:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677211.1053671; Wed, 07 Feb 2024 00:56:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXWF9-0002GC-6u; Wed, 07 Feb 2024 00:56:51 +0000
Received: by outflank-mailman (input) for mailman id 677211;
 Wed, 07 Feb 2024 00:56:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aVye=JQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rXWF7-0002G4-47
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 00:56:49 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3885c07-c553-11ee-98f5-efadbce2ee36;
 Wed, 07 Feb 2024 01:56:46 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 30040CE0AD1;
 Wed,  7 Feb 2024 00:56:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40CA5C433F1;
 Wed,  7 Feb 2024 00:56:42 +0000 (UTC)
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
X-Inumbo-ID: c3885c07-c553-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707267403;
	bh=2qY4drNQqGRmpUWpSieyaKhSzukR+nwgPbenc7u9fnc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=G21ArrC73I926WzFlER8xrNjumJtFLJznI6lz8G4XlaRTxp69biEoQj8s91T37E4A
	 nG31w9+TSEtrxiT7jVX93iFeZsQuKHvvorH3s85K4qolnkOiE55HczRsp42/0BG0ju
	 oDOkM1CIQGWx1lXP5KDJjDuP1+QaedMxSpUBPm2i7fTSTXLqTl9RzZu1Ja0YFBiqqR
	 Xo/eqO3o91XTqt7NJS59bE1EckDe4LT3rf7tDp/lUxvvf7ugp+y6kXKLfa9rG5qg0K
	 p3iRoPgweja2c+I52vi4sfvOBpFoEX5XHQbaoXrOPuPPCpaZLdlmV10KeHHTi000yy
	 tTHIpvVHUaFpw==
Date: Tue, 6 Feb 2024 16:56:40 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Simone Ballarin <simone.ballarin@bugseng.com>, consulting@bugseng.com, 
    sstabellini@kernel.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v4 3/4] xen/x86: address violations of MISRA C:2012
 Rule 13.1
In-Reply-To: <b23ffbf2-e1b1-42f5-b0ea-9f0889a5a7af@suse.com>
Message-ID: <alpine.DEB.2.22.394.2402061656080.1925432@ubuntu-linux-20-04-desktop>
References: <cover.1706886631.git.simone.ballarin@bugseng.com> <16bb514ac0a5fe0d6e9a2c95279a8200ff4495c6.1706886631.git.simone.ballarin@bugseng.com> <b23ffbf2-e1b1-42f5-b0ea-9f0889a5a7af@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 6 Feb 2024, Jan Beulich wrote:
> On 02.02.2024 16:16, Simone Ballarin wrote:
> > Rule 13.1: Initializer lists shall not contain persistent side effects
> > 
> > This patch moves expressions with side-effects into new variables before
> > the initializer lists.
> > 
> > No functional changes.
> > 
> > Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> 
> To be honest, I don't like this. It's more code for no gain. Really its
> hampering clarity imo. I'm willing to be convinced otherwise, but for
> now this gets a nack from me.

Which part of the patch you don't like? The changes to
bad_ioapic_register?



> As an aside, ...
> 
> > --- a/xen/arch/x86/io_apic.c
> > +++ b/xen/arch/x86/io_apic.c
> > @@ -2559,9 +2559,12 @@ integer_param("max_gsi_irqs", max_gsi_irqs);
> >  
> >  static __init bool bad_ioapic_register(unsigned int idx)
> >  {
> > -    union IO_APIC_reg_00 reg_00 = { .raw = io_apic_read(idx, 0) };
> > -    union IO_APIC_reg_01 reg_01 = { .raw = io_apic_read(idx, 1) };
> > -    union IO_APIC_reg_02 reg_02 = { .raw = io_apic_read(idx, 2) };
> > +    uint32_t reg_00_raw = io_apic_read(idx, 0);
> > +    uint32_t reg_01_raw = io_apic_read(idx, 1);
> > +    uint32_t reg_02_raw = io_apic_read(idx, 2);
> 
> ... while you properly use uint32_t here, ...
> 
> > +    union IO_APIC_reg_00 reg_00 = { .raw = reg_00_raw };
> > +    union IO_APIC_reg_01 reg_01 = { .raw = reg_01_raw };
> > +    union IO_APIC_reg_02 reg_02 = { .raw = reg_02_raw };
> >  
> >      if ( reg_00.raw == -1 && reg_01.raw == -1 && reg_02.raw == -1 )
> >      {
> > --- a/xen/arch/x86/mpparse.c
> > +++ b/xen/arch/x86/mpparse.c
> > @@ -798,11 +798,12 @@ void __init mp_register_lapic_address (
> >  
> >  int mp_register_lapic(u32 id, bool enabled, bool hotplug)
> >  {
> > +	u32 apic = apic_read(APIC_LVR);
> 
> ... why the being-phased-out u32 here?
> 
> Jan
> 
> >  	struct mpc_config_processor processor = {
> >  		.mpc_type = MP_PROCESSOR,
> >  		/* Note: We don't fill in fields not consumed anywhere. */
> >  		.mpc_apicid = id,
> > -		.mpc_apicver = GET_APIC_VERSION(apic_read(APIC_LVR)),
> > +		.mpc_apicver = GET_APIC_VERSION(apic),
> >  		.mpc_cpuflag = (enabled ? CPU_ENABLED : 0) |
> >  			       (id == boot_cpu_physical_apicid ?
> >  				CPU_BOOTPROCESSOR : 0),
> > --- a/xen/arch/x86/setup.c
> > +++ b/xen/arch/x86/setup.c
> > @@ -885,13 +885,14 @@ static struct domain *__init create_dom0(const module_t *image,
> >  {
> >      static char __initdata cmdline[MAX_GUEST_CMDLINE];
> >  
> > +    unsigned int max_vcpus = dom0_max_vcpus();
> >      struct xen_domctl_createdomain dom0_cfg = {
> >          .flags = IS_ENABLED(CONFIG_TBOOT) ? XEN_DOMCTL_CDF_s3_integrity : 0,
> >          .max_evtchn_port = -1,
> >          .max_grant_frames = -1,
> >          .max_maptrack_frames = -1,
> >          .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
> > -        .max_vcpus = dom0_max_vcpus(),
> > +        .max_vcpus = max_vcpus,
> >          .arch = {
> >              .misc_flags = opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXED : 0,
> >          },
> 

