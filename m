Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FFD7FEE44
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 12:52:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644575.1005750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8faP-00080g-Di; Thu, 30 Nov 2023 11:52:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644575.1005750; Thu, 30 Nov 2023 11:52:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8faP-0007yq-B7; Thu, 30 Nov 2023 11:52:05 +0000
Received: by outflank-mailman (input) for mailman id 644575;
 Thu, 30 Nov 2023 11:52:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Jom=HL=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r8faO-0007yk-K6
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 11:52:04 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0ca87b7-8f76-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 12:52:03 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40b538d5c4eso5408485e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 30 Nov 2023 03:52:03 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 fm19-20020a05600c0c1300b004060f0a0fd5sm1777899wmb.13.2023.11.30.03.52.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 03:52:02 -0800 (PST)
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
X-Inumbo-ID: e0ca87b7-8f76-11ee-98e4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701345123; x=1701949923; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yhKhuM6K+WUMGusYiCIZLjuseJwfxJSVh0QDOSMrX5Q=;
        b=q1G2IMsivtDtK6uTSMvRZkBLs2IlrH9/Ueb6L5gvjmB7NrK8dqc+TS633yVaNM/Vgs
         5ATTO4Pw0wk3lAu127JdDoiC8xlyzqGg2TAS23eYbi3A2eKLJU4m7Al9N6aKYmeW/kgh
         98Ehl8AqL0WaTpFbp9K8GW94urrw/u7QfQ8EE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701345123; x=1701949923;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yhKhuM6K+WUMGusYiCIZLjuseJwfxJSVh0QDOSMrX5Q=;
        b=aErqd9KNMxslLuryMGqlBze0uIfnCGCoFsbEltBqckpKOgrNlQ2HXyiBpjGD4q1gFp
         7gFXSlv4gcP6CNAL6BY8O1hqerRCUAtBKw5qL7IpXrPV1/kEm2Q5ebV9pp3SvdOtKy8S
         RGNcphvovp8S1Ao+bYbNnTSyjTDrsaO5QT/p6SZZWHtW/RWb1tjNwee3ttzfbFbxIRnw
         tYyJ84jK7TJuf1rSz94Seg22GjKspWiEzIYeBi11oNzFsWn64am2cBg9hcOwEqTqxBKE
         6N88eOJ4q21at8FoySN3pl8WvzboPUP5m8J9yQUJLnTMrc0S67fhqUaaaUb5wnu1ZQe0
         37CA==
X-Gm-Message-State: AOJu0YwpP568WLhojarUICwUbM45aDm5RfqqyHD5viZTEqAsfMjxyUdr
	dAZRbGIBVCDNzualrf2J3ZiTIg==
X-Google-Smtp-Source: AGHT+IHPRZ74ahEzz6B1r7VgpXaMdnglYeb8ynwDAvy1sAXeSDP6UQU+dOqquBdEMbO9sqeGs/jyvg==
X-Received: by 2002:a05:600c:1382:b0:408:3d91:8251 with SMTP id u2-20020a05600c138200b004083d918251mr13057525wmf.5.1701345123132;
        Thu, 30 Nov 2023 03:52:03 -0800 (PST)
Date: Thu, 30 Nov 2023 12:52:02 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
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
Subject: Re: [RFC XEN PATCH v2 1/3] xen/vpci: Clear all vpci status of device
Message-ID: <ZWh3Yl1bOnxczQbe@macbook>
References: <20231124104136.3263722-1-Jiqian.Chen@amd.com>
 <20231124104136.3263722-2-Jiqian.Chen@amd.com>
 <ZWX0U1tYooY70UJo@macbook>
 <BL1PR12MB58493CC28A32E3C9B3A1767FE782A@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB58493CC28A32E3C9B3A1767FE782A@BL1PR12MB5849.namprd12.prod.outlook.com>

On Thu, Nov 30, 2023 at 06:22:28AM +0000, Chen, Jiqian wrote:
> Hi Roger and Daniel P. Smith,
> 
> On 2023/11/28 22:08, Roger Pau Monné wrote:
> > On Fri, Nov 24, 2023 at 06:41:34PM +0800, Jiqian Chen wrote:
> >> When a device has been reset on dom0 side, the vpci on Xen
> >> side won't get notification, so the cached state in vpci is
> >> all out of date compare with the real device state.
> >> To solve that problem, this patch add new hypercall to clear
> >> all vpci device state. And when reset device happens on dom0
> >> side, dom0 can call this hypercall to notify vpci.
> >>
> >> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> >> Signed-off-by: Huang Rui <ray.huang@amd.com>
> >> ---
> >>  xen/arch/x86/hvm/hypercall.c  |  1 +
> >>  xen/drivers/passthrough/pci.c | 21 +++++++++++++++++++++
> >>  xen/drivers/pci/physdev.c     | 14 ++++++++++++++
> >>  xen/drivers/vpci/vpci.c       |  9 +++++++++
> >>  xen/include/public/physdev.h  |  2 ++
> >>  xen/include/xen/pci.h         |  1 +
> >>  xen/include/xen/vpci.h        |  6 ++++++
> >>  7 files changed, 54 insertions(+)
> >>
> >> diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
> >> index eeb73e1aa5..6ad5b4d5f1 100644
> >> --- a/xen/arch/x86/hvm/hypercall.c
> >> +++ b/xen/arch/x86/hvm/hypercall.c
> >> @@ -84,6 +84,7 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
> >>      case PHYSDEVOP_pci_mmcfg_reserved:
> >>      case PHYSDEVOP_pci_device_add:
> >>      case PHYSDEVOP_pci_device_remove:
> >> +    case PHYSDEVOP_pci_device_state_reset:
> >>      case PHYSDEVOP_dbgp_op:
> >>          if ( !is_hardware_domain(currd) )
> >>              return -ENOSYS;
> >> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> >> index 04d00c7c37..f871715585 100644
> >> --- a/xen/drivers/passthrough/pci.c
> >> +++ b/xen/drivers/passthrough/pci.c
> >> @@ -824,6 +824,27 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
> >>      return ret;
> >>  }
> >>  
> >> +int pci_reset_device_state(u16 seg, u8 bus, u8 devfn)
> > 
> > You could use pci_sbdf_t here instead of 3 parameters.
> Will change in next version, thank you.
> 
> > 
> > I'm however unsure whether we really need this helper just to fetch
> > the pdev and call vpci_reset_device_state(), I think you could place
> > this logic directly in pci_physdev_op().  Unless there are plans to
> > use such logic outside of pci_physdev_op().
> If I place the logic of pci_reset_device_state directly in pci_physdev_op. I think I need to declare vpci_reset_device_state in pci.h? If it is suitable, I will change in next version.

Just include xen/vpci.h in drivers/pci/physdev.c AFAICT.

Thanks, Roger.

