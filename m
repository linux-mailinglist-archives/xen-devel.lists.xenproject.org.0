Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF84812C3F
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 10:56:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654374.1021224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDiRV-0006sO-2T; Thu, 14 Dec 2023 09:55:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654374.1021224; Thu, 14 Dec 2023 09:55:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDiRU-0006qD-Vx; Thu, 14 Dec 2023 09:55:44 +0000
Received: by outflank-mailman (input) for mailman id 654374;
 Thu, 14 Dec 2023 09:55:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h5bz=HZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rDiRT-0006q7-8l
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 09:55:43 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f10cb9a2-9a66-11ee-98e9-6d05b1d4d9a1;
 Thu, 14 Dec 2023 10:55:41 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3333b46f26aso7019115f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2023 01:55:41 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 g1-20020a5d5541000000b003364b530d1asm203781wrw.5.2023.12.14.01.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 01:55:40 -0800 (PST)
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
X-Inumbo-ID: f10cb9a2-9a66-11ee-98e9-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702547741; x=1703152541; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MWx9AXkB6QEkm0CprSo5mUcj9GG0LbtGule9EscnPsA=;
        b=NRqwJkfotQ/xdShXSZAR7VzsBPicBJDx5u61OM3aOFv2UzmfgAOjcyCqC0ZZ44vu14
         eaBu/hizbEDi+TMxr4rIAVXMWTavwKFGsP38XYXiNoeoI3lyZN378eP1xsWM8mjtYPlo
         3AMfBR5/3e0RaSQB7D5eA/NorjbkaP5+U4Nmw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702547741; x=1703152541;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MWx9AXkB6QEkm0CprSo5mUcj9GG0LbtGule9EscnPsA=;
        b=nLZkujZiozrpkI8gwIJdjWaG0fggWVNPIpeJ7CcF5EB/R5aLVVyH1SKJO/L7gv7aur
         qNOHWnyASyRKXrGbIaQ7gnNJffgYLgb/qN4OtK/lj4rdlTav7kODwXbl93AxUC3UWEL9
         1QZcDudPVkofLVzHtMhP1W8pATAHx8t/kLRDLfZ9pMryZIGinPfvh1zXJ/FdTARuNJmX
         LMnm12CaK+9EAfFmCKQkRk7Dm2p1TS4DYTqb3/l9zVO2q5Cdnmtsfucd61CHo8HsBcOW
         XTpiyurjxpLVpB5KQPXWCtZVYxDaXclEF+mDv8C/0khrTMrRUVVhyfFOPIuyssy1F5tL
         T4FA==
X-Gm-Message-State: AOJu0YxIO/DtGmhGXJuLBl7jnhTEkiNum53ZDGpUogVWQGbD8+MbUU7Y
	GtBL7fzT0NjiC/EivhuBP8G1FA==
X-Google-Smtp-Source: AGHT+IG33sWzXESS+u4sjx8IVnwHo70xlb/t9A5V94Hlpi2UpEPyiU+ZbqO7SuaZg2bxZCPOxbR3ZQ==
X-Received: by 2002:adf:fac9:0:b0:333:3a23:ff12 with SMTP id a9-20020adffac9000000b003333a23ff12mr4329244wrs.141.1702547741138;
        Thu, 14 Dec 2023 01:55:41 -0800 (PST)
Date: Thu, 14 Dec 2023 10:55:39 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
	"Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
	"Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [RFC XEN PATCH v3 2/3] x86/pvh: Add (un)map_pirq and setup_gsi
 for PVH dom0
Message-ID: <ZXrRG8oc25Do0Dnv@macbook>
References: <20231210164009.1551147-1-Jiqian.Chen@amd.com>
 <20231210164009.1551147-3-Jiqian.Chen@amd.com>
 <ZXcrX44ceUjzjtDh@macbook>
 <BL1PR12MB5849B1BDCBECD73353413869E78EA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <704cc051-7362-4691-a120-4effaf8dd1fc@suse.com>
 <BL1PR12MB584993E317AF28E675814FC6E78DA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <917ef38b-5aec-4c6a-803c-c0b2dcc74454@suse.com>
 <BL1PR12MB58494259A9E37CD7133090D9E78CA@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB58494259A9E37CD7133090D9E78CA@BL1PR12MB5849.namprd12.prod.outlook.com>

On Thu, Dec 14, 2023 at 08:55:45AM +0000, Chen, Jiqian wrote:
> On 2023/12/13 15:03, Jan Beulich wrote:
> > On 13.12.2023 03:47, Chen, Jiqian wrote:
> >> On 2023/12/12 17:30, Jan Beulich wrote:
> >>> On 12.12.2023 07:49, Chen, Jiqian wrote:
> >>>> On 2023/12/11 23:31, Roger Pau Monné wrote:
> >>>>> On Mon, Dec 11, 2023 at 12:40:08AM +0800, Jiqian Chen wrote:
> >>>>>> --- a/xen/arch/x86/hvm/hypercall.c
> >>>>>> +++ b/xen/arch/x86/hvm/hypercall.c
> >>>>>> @@ -72,8 +72,11 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
> >>>>>>  
> >>>>>>      switch ( cmd )
> >>>>>>      {
> >>>>>> +    case PHYSDEVOP_setup_gsi:
> >>>>>
> >>>>> I think given the new approach on the Linux side patches, where
> >>>>> pciback will configure the interrupt, there's no need to expose
> >>>>> setup_gsi anymore?
> >>>> The latest patch(the second patch of v3 on kernel side) does setup_gsi and map_pirq for passthrough device in pciback, so we need this and below.
> >>>>
> >>>>>
> >>>>>>      case PHYSDEVOP_map_pirq:
> >>>>>>      case PHYSDEVOP_unmap_pirq:
> >>>>>> +        if ( is_hardware_domain(currd) )
> >>>>>> +            break;
> >>>>>
> >>>>> Also Jan already pointed this out in v2: this hypercall needs to be
> >>>>> limited so a PVH dom0 cannot execute it against itself.  IOW: refuse
> >>>>> the hypercall if DOMID_SELF or the passed domid matches the current
> >>>>> domain domid.
> >>>> Yes, I remember Jan's suggestion, but since the latest patch(the second patch of v3 on kernel side) has change the implementation, it does setup_gsi and map_pirq for dom0 itself, so I didn't add the DOMID_SELF check.
> >>>
> >>> And why exactly would it do specifically the map_pirq? (Even the setup_gsi
> >>> looks questionable to me, but there might be reasons there.)
> >> Map_pirq is to solve the check failure problem. (pci_add_dm_done-> xc_domain_irq_permission-> XEN_DOMCTL_irq_permission-> pirq_access_permitted->domain_pirq_to_irq->return irq is 0)
> >> Setup_gsi is because the gsi is never be unmasked, so the gsi is never be registered( vioapic_hwdom_map_gsi-> mp_register_gsi is never be called).
> > 
> > And it was previously made pretty clear by Roger, I think, that doing a "map"
> > just for the purpose of granting permission is, well, at best a temporary
> > workaround in the early development phase. If there's presently no hypercall
> > to _only_ grant permission to IRQ, we need to add one.
> Could you please describe it in detail? Do you mean to add a new hypercall to grant irq access for dom0 or domU?
> It seems XEN_DOMCTL_irq_permission is the hypercall to grant irq access from dom0 to domU(see XEN_DOMCTL_irq_permission-> irq_permit_access). There is no need to add hypercall to grant irq access.
> We failed here (XEN_DOMCTL_irq_permission-> pirq_access_permitted->domain_pirq_to_irq->return irq is 0) is because the PVH dom0 didn't use PIRQ, so we can't get irq from pirq if "current" is PVH dom0.

One way to bodge this would be to detect whether the caller of
XEN_DOMCTL_irq_permission is a PV or an HVM domain, and in case of HVM
assume the pirq field is a GSI.  I'm unsure however how that will work
with non-x86 architectures.

It would  be better to introduce a new XEN_DOMCTL_gsi_permission, or
maybe XEN_DOMCTL_intr_permission that can take a struct we can use to
accommodate GSIs and other arch specific interrupt identifiers.

I'm also wondering whether the hypercall should be in a stable
interface so it could be easily used from QEMU if needed.

> So, it seems the logic of XEN_DOMCTL_irq_permission is not suitable when PVH dom0? Maybe it directly needs to get irq from the caller(domU) instead of "current" if the "current" has no PIRQ flag?

Hm, I'm kind of confused by this last sentence, as you mention "the
caller(domU)".  The caller of XEN_DOMCTL_irq_permission will always be
dom0 or the hardware domain.

Thanks, Roger.

