Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4697FF342
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 16:13:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644959.1006679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8ijC-0002ip-2Y; Thu, 30 Nov 2023 15:13:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644959.1006679; Thu, 30 Nov 2023 15:13:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8ijB-0002gd-UJ; Thu, 30 Nov 2023 15:13:21 +0000
Received: by outflank-mailman (input) for mailman id 644959;
 Thu, 30 Nov 2023 15:13:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Jom=HL=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r8ijB-0002MF-1p
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 15:13:21 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff25cda7-8f92-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 16:13:20 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40b54261442so8829885e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 30 Nov 2023 07:13:20 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 l8-20020a5d4bc8000000b003316b3d69b3sm1760620wrt.46.2023.11.30.07.13.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 07:13:19 -0800 (PST)
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
X-Inumbo-ID: ff25cda7-8f92-11ee-98e4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701357200; x=1701962000; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zHbIpqKppVrirWnuO8nHfLF6hK+LIbZb7v0QlMQXF8Q=;
        b=ECjywN+bgv5Rl30aVSDWNtbvj3TlnB75SfHrnGU6Z+rXPwPkmePxAhoEmPI8g0wNut
         CGuCRnRGZrTGnAPy4M3QDb9uPB1sSWoOv+GKM1QhsaS1tk+qa3Tjr2sSxYFplMxW7K8j
         iPefBDZSs1+3c+CFnscGI23avCpm+dFE4F8uI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701357200; x=1701962000;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zHbIpqKppVrirWnuO8nHfLF6hK+LIbZb7v0QlMQXF8Q=;
        b=oXzAgQCcGqJlD5vcxmitFi+dRhexQsG7tU1z1jQRcg+OOec3dA5wOTffmEbTVBK1w1
         h9hihlLZOgGypQC4Kn1sQTa0oCovpDgPuTVx/vhkR6i25EgC6xiyaHHwEsH70DWiVjAQ
         03O5wfDLDuyW8b3JC+OKxE6MwbyCGFGUuonEftPTI2v7z67lV3Wn97v25kfPn7U5NiG/
         N48iNK1yKzCivvniBpDNROTpA5UOKxC/IkH1aQSQzJ4iZ4HocGvEKLtsVfYJGMQDv3Yw
         xRTjGzKjCuoPhI+QxQKoBVCEaMLvv4Ewq0YrPSxBfLfz7WdgWipIXGg4+NzgCcQpSoPB
         XiAw==
X-Gm-Message-State: AOJu0Yx1ar55alxxGEOkFirtW4MBm1DV2zSm0LP9C9P+fbJBF76UQX0W
	HCKicLMYzBHoDdZ796injkAmEI00ZMJYPhSl8+w=
X-Google-Smtp-Source: AGHT+IEvGDWaS2xSJN5CO2xPYnnHJJ+5awRVwaMq+O0xpPyRzVLJIJ7UO7pc9Meccu3QUa3cZQ9coQ==
X-Received: by 2002:a05:600c:4b2a:b0:40b:4337:7cbf with SMTP id i42-20020a05600c4b2a00b0040b43377cbfmr10468364wmp.1.1701357200043;
        Thu, 30 Nov 2023 07:13:20 -0800 (PST)
Date: Thu, 30 Nov 2023 16:13:18 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
	"Deucher, Alexander" <Alexander.Deucher@amd.com>,
	"Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
	"Stabellini, Stefano" <stefano.stabellini@amd.com>,
	"Huang, Ray" <Ray.Huang@amd.com>,
	"Huang, Honglei1" <Honglei1.Huang@amd.com>,
	"Zhang, Julia" <Julia.Zhang@amd.com>
Subject: Re: [RFC XEN PATCH v2 2/3] x86/pvh: Open PHYSDEVOP_map_pirq for PVH
 dom0
Message-ID: <ZWimjreYPWvAtle5@macbook>
References: <20231124104136.3263722-1-Jiqian.Chen@amd.com>
 <20231124104136.3263722-3-Jiqian.Chen@amd.com>
 <ZWX2c7oQfeZxrpEF@macbook>
 <BL1PR12MB5849A2AB56BAC75D4558F873E782A@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB5849A2AB56BAC75D4558F873E782A@BL1PR12MB5849.namprd12.prod.outlook.com>

On Thu, Nov 30, 2023 at 06:32:00AM +0000, Chen, Jiqian wrote:
> 
> On 2023/11/28 22:17, Roger Pau Monné wrote:
> > On Fri, Nov 24, 2023 at 06:41:35PM +0800, Jiqian Chen wrote:
> >> If we run Xen with PVH dom0 and hvm domU, hvm will map a pirq for
> >> a passthrough device by using gsi, see xen_pt_realize->xc_physdev_map_pirq
> >> and pci_add_dm_done->xc_physdev_map_pirq. Then xc_physdev_map_pirq will
> >> call into Xen, but in hvm_physdev_op, PHYSDEVOP_map_pirq is not allowed
> >> because currd is PVH dom0 and PVH has no X86_EMU_USE_PIRQ flag, it will
> >> fail at has_pirq check.
> >>
> >> So, I think we may need to allow PHYSDEVOP_map_pirq when currd is dom0 (at
> > 
> > And PHYSDEVOP_unmap_pirq also?
> Yes, in the failed path, PHYSDEVOP_unmap_pirq will be called. I will add some descriptions about it into the commit message.
> 
> > 
> >> present dom0 is PVH).
> > 
> > IMO it would be better to implement a new set of DMOP hypercalls that
> > handle the setup of interrupts from physical devices that are assigned
> > to a guest.  That should allow us to get rid of the awkward PHYSDEVOP
> > + XEN_DOMCTL_{,un}bind_pt_irq hypercall interface, which currently
> > prevents QEMU from being hypervisor version agnostic (since the domctl
> > interface is not stable).
> > 
> > I understand this might be too much to ask for, but something to take
> > into account.
> Yes, that will be a complex project. I think current change can meet the needs. We can take DMOP into account in the future. Thank you.

The issue with this approach is that we always do things in a rush and
cut corners, and then never pay back the debt.  Anyway, I'm not going
to block this, and I'm not blaming you.

Sadly this is just focused on getting something working in the short
term rather than thinking long term in a maintainable interface.

Regards, Roger.

