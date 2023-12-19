Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD30818698
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 12:48:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656739.1025154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFYZy-0003bB-2D; Tue, 19 Dec 2023 11:48:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656739.1025154; Tue, 19 Dec 2023 11:48:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFYZx-0003Yi-Vh; Tue, 19 Dec 2023 11:48:05 +0000
Received: by outflank-mailman (input) for mailman id 656739;
 Tue, 19 Dec 2023 11:48:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rom3=H6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rFYZv-0003Yc-Vr
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 11:48:03 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 768a5127-9e64-11ee-9b0f-b553b5be7939;
 Tue, 19 Dec 2023 12:48:01 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-50e3845abdaso2991123e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 03:48:01 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 j8-20020a05600c190800b0040c11fbe581sm2480647wmq.27.2023.12.19.03.48.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 03:48:00 -0800 (PST)
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
X-Inumbo-ID: 768a5127-9e64-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702986481; x=1703591281; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3qbonqnvg7zUldYIjudgCtR/x7N2u9KaUvDTkLAuP6Q=;
        b=jodo0OSfSXruBa9Hf++FcPqokTSedlSPQ/qor6mW9Dqj8czVyjgkngFGUee0KTO87p
         RVzdxLOXsFWkMCYzSMRDmQbDU7ED6GIEgrDF14P5r1eYCokbTZ4jrgnOTXsqbtuVc2Bz
         1BoQI9fbu+SOXLWnyJdJ3n9ZjJIA1o3XGy0UA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702986481; x=1703591281;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3qbonqnvg7zUldYIjudgCtR/x7N2u9KaUvDTkLAuP6Q=;
        b=GDjk2mzirxurovjCnQ3FmBzt6VOtNDli7fw+5w/P8DKj73W/x5OSGTPvj3UPG5T4ga
         IQmikZAlZ27LjxtQ+EcGYhonBpu7UcnZ+9SLmY/HKEcnNtP4U5ePYLhiMtxEcvfwhEAb
         uMtrfif8CyXj7JjaJYHKCH01eVTjzuaR8u3D2m0ofk8tPt0GfTkxyhla7sbNjg58Vli3
         Olj0E0Amfxjd7RJUYBdeHS42MKEmjsQbnqsCBjMR3zsDd63p9O3kutdx0lITrlzQT+st
         R5mekY/ytFb4/dDChLyVyucGZF5N6vlxF8VjPPEV/RadcIAPppq20ocnSGZdECDAPTAH
         LveQ==
X-Gm-Message-State: AOJu0Yxwqh5CBQRMJb3EqdBa9f2aJ5kWh7UdHW4Hu6Ogi2zozHSVFNyd
	fYZYiixZkAik3CIv/7Aj01lu0g==
X-Google-Smtp-Source: AGHT+IE5hM3jAYEshvl23mUJUnKrhWSPh3DhjijhSGtfSLNzaQ1wfVzv+N5ARDRrUOSONwrAMg9JRA==
X-Received: by 2002:a05:6512:1095:b0:50e:4b94:61b0 with SMTP id j21-20020a056512109500b0050e4b9461b0mr397353lfg.56.1702986481247;
        Tue, 19 Dec 2023 03:48:01 -0800 (PST)
Date: Tue, 19 Dec 2023 12:48:00 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 4/4] x86/PV: issue branch prediction barrier when
 switching 64-bit guest to kernel mode
Message-ID: <ZYGC8JaJ45tkbqQC@macbook>
References: <06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com>
 <2863b0a9-ca7c-3cce-104d-0b6685b0b383@suse.com>
 <ZYCARJAxH9hBD0YQ@macbook>
 <6e022af1-d383-48be-ab54-6ec254aa1502@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6e022af1-d383-48be-ab54-6ec254aa1502@suse.com>

On Tue, Dec 19, 2023 at 10:56:16AM +0100, Jan Beulich wrote:
> On 18.12.2023 18:24, Roger Pau Monné wrote:
> > On Tue, Feb 14, 2023 at 05:12:08PM +0100, Jan Beulich wrote:
> >> Since both kernel and user mode run in ring 3, they run in the same
> >> "predictor mode".
> > 
> > That only true when IBRS is enabled, otherwise all CPU modes share the
> > same predictor mode?
> 
> But here we only care about ring 3 anyway?

Hm, yes, what I wanted to say is that this is not exclusive to 64bit
PV, as with IBRS disabled ring 3 and ring 0 share the same predictor
mode.  Anyway, not relevant.

> 
> >> @@ -753,7 +755,9 @@ static inline void pv_inject_sw_interrup
> >>   * but we can't make such requests fail all of the sudden.
> >>   */
> >>  #define PV64_VM_ASSIST_MASK (PV32_VM_ASSIST_MASK                      | \
> >> -                             (1UL << VMASST_TYPE_m2p_strict))
> >> +                             (1UL << VMASST_TYPE_m2p_strict)          | \
> >> +                             ((opt_ibpb_mode_switch + 0UL) <<           \
> >> +                              VMASST_TYPE_mode_switch_no_ibpb))
> > 
> > I'm wondering that it's kind of weird to offer the option to PV domUs
> > if opt_ibpb_entry_pv is set, as then the guest mode switch will always
> > (implicitly) do a IBPB as requiring an hypercall and thus take an
> > entry point into Xen.
> > 
> > I guess it's worth having it just as a way to signal to Xen that the
> > hypervisor does perform an IBPB, even if the guest cannot disable it.
> 
> I'm afraid I'm confused by your reply. Not only, but also because the
> latter sentence looks partly backwards / non-logical to me.

Sorry, I think I didn't word that very well.  The remark is tied to
the one below about the vmassist 'possibly' allowing the guest to
disable IBPB on guest user -> kernel context switches, but Xen might
unconditionally do additional IBPBs that the guest cannot disable.

> >> --- a/xen/arch/x86/pv/domain.c
> >> +++ b/xen/arch/x86/pv/domain.c
> >> @@ -455,6 +455,7 @@ static void _toggle_guest_pt(struct vcpu
> >>  void toggle_guest_mode(struct vcpu *v)
> >>  {
> >>      const struct domain *d = v->domain;
> >> +    struct cpu_info *cpu_info = get_cpu_info();
> >>      unsigned long gs_base;
> >>  
> >>      ASSERT(!is_pv_32bit_vcpu(v));
> >> @@ -467,15 +468,21 @@ void toggle_guest_mode(struct vcpu *v)
> >>      if ( v->arch.flags & TF_kernel_mode )
> >>          v->arch.pv.gs_base_kernel = gs_base;
> >>      else
> >> +    {
> >>          v->arch.pv.gs_base_user = gs_base;
> >> +
> >> +        if ( opt_ibpb_mode_switch &&
> >> +             !(d->arch.spec_ctrl_flags & SCF_entry_ibpb) &&
> >> +             !VM_ASSIST(d, mode_switch_no_ibpb) )
> >> +            cpu_info->spec_ctrl_flags |= SCF_new_pred_ctxt;
> > 
> > Likewise similar to the remarks I've made before, if doing an IBPB on
> > entry is enough to cover for the case here, it must also be fine to
> > issue the IBPB right here, instead of deferring to return to guest
> > context?
> > 
> > The only concern would be (as you mentioned before) to avoid clearing
> > valid Xen predictions, but I would rather see some figures about what
> > effect the delaying to return to guest has vs issuing it right here.
> 
> Part of the reason (aiui) to do things on the exit path was to
> consolidate the context switch induced one and the user->kernel switch
> one into the same place and mechanism.

Isn't it kind of a very specific case that we end up doing a
user->kernel switch as part of a context switch?  IOW: would require
the vCPU to be scheduled out at that very specific point.

> >> + *
> >> + * By default (on affected and capable hardware) as a safety measure Xen,
> >> + * to cover for the fact that guest-kernel and guest-user modes are both
> >> + * running in ring 3 (and hence share prediction context), would issue a
> >> + * barrier for user->kernel mode switches of PV guests.
> >> + */
> >> +#define VMASST_TYPE_mode_switch_no_ibpb  33
> > 
> > Would it be possible to define the assist as
> > VMASST_TYPE_mode_switch_ibpb and have it on when enabled?  So that the
> > guest would disable it if unneeded?  IMO negated options are in
> > general harder to understand.
> 
> Negative options aren't nice, yes, but VM assists start out as all
> clear.

Are you sure?  I see VMASST_TYPE_pae_extended_cr3 getting set in
dom0_construct_pv() and that makes me wonder whether other bits
couldn't start set also.

Maybe there's some restriction I'm missing, but I don't see any
wording in the description of the interface that states that all
assists are supposed to start disabled.

Thanks, Roger.

