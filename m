Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 401E0812C7C
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 11:07:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654387.1021253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDicQ-0002PC-KP; Thu, 14 Dec 2023 10:07:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654387.1021253; Thu, 14 Dec 2023 10:07:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDicQ-0002Mv-HZ; Thu, 14 Dec 2023 10:07:02 +0000
Received: by outflank-mailman (input) for mailman id 654387;
 Thu, 14 Dec 2023 10:07:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h5bz=HZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rDicP-0002Mp-LV
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 10:07:01 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84e5507e-9a68-11ee-9b0f-b553b5be7939;
 Thu, 14 Dec 2023 11:06:59 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40c46d6784eso39765495e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2023 02:06:59 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 c4-20020adffb44000000b003362d0eefd3sm6188070wrs.20.2023.12.14.02.06.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 02:06:58 -0800 (PST)
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
X-Inumbo-ID: 84e5507e-9a68-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702548419; x=1703153219; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+1HfsRUd8Prmx0GcggoXOnJOewe5y9f5zGo8xkJ3VdA=;
        b=HepdT3UvhNukSg2le/VuWbceEaBfbobeLaCl/vNp6E7SnfiMz5YJgH2+IIMzlbFVWJ
         k4NZwNE2ApBc9nQzRgN1m9GpUKwFTzdUIjmb9MeFbQt+QFEqMyuBknV0CpZZrZv264Mg
         0WUatoBugkaBbxlHYx4+yTx8uAy40UmQKMgIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702548419; x=1703153219;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+1HfsRUd8Prmx0GcggoXOnJOewe5y9f5zGo8xkJ3VdA=;
        b=S227U3OaK0ExRzkuGLccIdAte4uWipZ+n5lU+Ykoj6QAA30lw5Ov5QrR1JuGfpUg0g
         hyGn38krMZpF4tJMLVsgKUf00o86xi/ksa16gE4nSTUNr03zGq6IJg40XxPKspohCupr
         eMPGhfjL5VlP73ajgCS0H2/o5A4WHFzhdVdzQrnvU3xJUHisneTpxXkl3zvNmm8IdhwY
         IX6G+A+Ij9wFHqvep3oWIu0OdIhHRiLyQJ/mDx0KcryjYswa6kGNqB4P/05kmMTzqBuQ
         tWfVuylF6dQEwVoXdrYQa/C0k0AIufDlygFuiZ46AMb0DpGTefZ9rDYX+5CITFrq0gn6
         k4ZA==
X-Gm-Message-State: AOJu0YyrA+gioA2dGcU3FqVTjFEpAUu3pA6ka/G3RMMES5qNvpx5DCv6
	s3YkGwx1DihH0Yuf+2RoZaawrQ==
X-Google-Smtp-Source: AGHT+IGuRdZ7ZOM3LhI54JGFn40EHFe3C1vjED09meuTkRczIoo8X8AJMgt/dwdiZt9MtV0a5BdAlw==
X-Received: by 2002:a05:600c:468d:b0:40c:31f1:1468 with SMTP id p13-20020a05600c468d00b0040c31f11468mr5206625wmo.165.1702548418719;
        Thu, 14 Dec 2023 02:06:58 -0800 (PST)
Date: Thu, 14 Dec 2023 11:06:57 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P . Smith" <dpsmith@apertussolutions.com>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
	"Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
	"Huang, Ray" <Ray.Huang@amd.com>,
	"Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH v3 2/3] x86/pvh: Add (un)map_pirq and setup_gsi
 for PVH dom0
Message-ID: <ZXrTwfzedFQLhxiQ@macbook>
References: <20231210164009.1551147-1-Jiqian.Chen@amd.com>
 <20231210164009.1551147-3-Jiqian.Chen@amd.com>
 <ZXcrX44ceUjzjtDh@macbook>
 <BL1PR12MB5849B1BDCBECD73353413869E78EA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <704cc051-7362-4691-a120-4effaf8dd1fc@suse.com>
 <BL1PR12MB584993E317AF28E675814FC6E78DA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <917ef38b-5aec-4c6a-803c-c0b2dcc74454@suse.com>
 <BL1PR12MB58494259A9E37CD7133090D9E78CA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZXrRG8oc25Do0Dnv@macbook>
 <390368e2-5f13-4bbf-8c07-4a05c04e9939@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <390368e2-5f13-4bbf-8c07-4a05c04e9939@suse.com>

On Thu, Dec 14, 2023 at 10:58:24AM +0100, Jan Beulich wrote:
> On 14.12.2023 10:55, Roger Pau Monné wrote:
> > On Thu, Dec 14, 2023 at 08:55:45AM +0000, Chen, Jiqian wrote:
> >> On 2023/12/13 15:03, Jan Beulich wrote:
> >>> On 13.12.2023 03:47, Chen, Jiqian wrote:
> >>>> On 2023/12/12 17:30, Jan Beulich wrote:
> >>>>> On 12.12.2023 07:49, Chen, Jiqian wrote:
> >>>>>> On 2023/12/11 23:31, Roger Pau Monné wrote:
> >>>>>>> On Mon, Dec 11, 2023 at 12:40:08AM +0800, Jiqian Chen wrote:
> >>>>>>>> --- a/xen/arch/x86/hvm/hypercall.c
> >>>>>>>> +++ b/xen/arch/x86/hvm/hypercall.c
> >>>>>>>> @@ -72,8 +72,11 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
> >>>>>>>>  
> >>>>>>>>      switch ( cmd )
> >>>>>>>>      {
> >>>>>>>> +    case PHYSDEVOP_setup_gsi:
> >>>>>>>
> >>>>>>> I think given the new approach on the Linux side patches, where
> >>>>>>> pciback will configure the interrupt, there's no need to expose
> >>>>>>> setup_gsi anymore?
> >>>>>> The latest patch(the second patch of v3 on kernel side) does setup_gsi and map_pirq for passthrough device in pciback, so we need this and below.
> >>>>>>
> >>>>>>>
> >>>>>>>>      case PHYSDEVOP_map_pirq:
> >>>>>>>>      case PHYSDEVOP_unmap_pirq:
> >>>>>>>> +        if ( is_hardware_domain(currd) )
> >>>>>>>> +            break;
> >>>>>>>
> >>>>>>> Also Jan already pointed this out in v2: this hypercall needs to be
> >>>>>>> limited so a PVH dom0 cannot execute it against itself.  IOW: refuse
> >>>>>>> the hypercall if DOMID_SELF or the passed domid matches the current
> >>>>>>> domain domid.
> >>>>>> Yes, I remember Jan's suggestion, but since the latest patch(the second patch of v3 on kernel side) has change the implementation, it does setup_gsi and map_pirq for dom0 itself, so I didn't add the DOMID_SELF check.
> >>>>>
> >>>>> And why exactly would it do specifically the map_pirq? (Even the setup_gsi
> >>>>> looks questionable to me, but there might be reasons there.)
> >>>> Map_pirq is to solve the check failure problem. (pci_add_dm_done-> xc_domain_irq_permission-> XEN_DOMCTL_irq_permission-> pirq_access_permitted->domain_pirq_to_irq->return irq is 0)
> >>>> Setup_gsi is because the gsi is never be unmasked, so the gsi is never be registered( vioapic_hwdom_map_gsi-> mp_register_gsi is never be called).
> >>>
> >>> And it was previously made pretty clear by Roger, I think, that doing a "map"
> >>> just for the purpose of granting permission is, well, at best a temporary
> >>> workaround in the early development phase. If there's presently no hypercall
> >>> to _only_ grant permission to IRQ, we need to add one.
> >> Could you please describe it in detail? Do you mean to add a new hypercall to grant irq access for dom0 or domU?
> >> It seems XEN_DOMCTL_irq_permission is the hypercall to grant irq access from dom0 to domU(see XEN_DOMCTL_irq_permission-> irq_permit_access). There is no need to add hypercall to grant irq access.
> >> We failed here (XEN_DOMCTL_irq_permission-> pirq_access_permitted->domain_pirq_to_irq->return irq is 0) is because the PVH dom0 didn't use PIRQ, so we can't get irq from pirq if "current" is PVH dom0.
> > 
> > One way to bodge this would be to detect whether the caller of
> > XEN_DOMCTL_irq_permission is a PV or an HVM domain, and in case of HVM
> > assume the pirq field is a GSI.  I'm unsure however how that will work
> > with non-x86 architectures.
> > 
> > It would  be better to introduce a new XEN_DOMCTL_gsi_permission, or
> > maybe XEN_DOMCTL_intr_permission that can take a struct we can use to
> > accommodate GSIs and other arch specific interrupt identifiers.
> 
> How would you see MSI being handled then?

I wasn't really accounting for MSI here, as MSI is not handled by
XEN_DOMCTL_irq_permission now either.  My plan long term was to
introduce a new hypercall (part of dm_ops possibly) in order to be
able to bind MSI directly without having to 'map' it first.

Roger.

