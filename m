Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EED27FBC8F
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 15:17:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643225.1003208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7yu1-0005vu-0G; Tue, 28 Nov 2023 14:17:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643225.1003208; Tue, 28 Nov 2023 14:17:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7yu0-0005sj-Ti; Tue, 28 Nov 2023 14:17:28 +0000
Received: by outflank-mailman (input) for mailman id 643225;
 Tue, 28 Nov 2023 14:17:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PT6c=HJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r7ytz-0005rc-AE
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 14:17:27 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da70b49a-8df8-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 15:17:25 +0100 (CET)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2c9b88cf626so4866651fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Nov 2023 06:17:25 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 24-20020a05600c231800b0040b36050f1bsm17325619wmo.44.2023.11.28.06.17.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Nov 2023 06:17:24 -0800 (PST)
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
X-Inumbo-ID: da70b49a-8df8-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701181045; x=1701785845; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VsMkPMJah0sshQqUAObhpuJvuKhX90P2yhCTBHvAGbQ=;
        b=mM7wHdjUXp3ouCmshgO9xNkSL5Dcv9gOiD9PXD07TIJCMUsWXzSZdj56mHvDPoba9c
         O3+GXhMgQF4nTHNCuLcBC4YqQd9wnjfG6yKX08x7CSO3BTPuLOa1XkKxWDnJrODWRxre
         +W6LkXhLzpOfN95EIS+N/NoIf9SlpfFzUQdcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701181045; x=1701785845;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VsMkPMJah0sshQqUAObhpuJvuKhX90P2yhCTBHvAGbQ=;
        b=UMm9wyHdgQDriSKnns+E5CN8QtFgaXPdPKf1d1jUphdqAGC/2XbCPlXdpNc+xZk3HG
         Nlt16/bHmY18eF2EEKO1rZmBtoJ4IyoLpHjua2+bk4LHGdsW3zOg6JF6VxItRbAWcVFi
         LrKyDdDMAE+/cg2KFowX3zaEA24t7Kw8eQ86jj/qLQ73JWb8hjbuigidRU2ITrlIATcO
         uGokO6aJMqNLd11IU+P/Gh8pkpemZhTeMGF6NiohPoSS7EHf0284THZAO/0yB9Wm4ZSB
         WjmVgd1TUkCntIZwtZjp4oHrc4CDxj2ERxTkWazOOkuCh1bSoteIMY2InBgKunrwzdLG
         bnqA==
X-Gm-Message-State: AOJu0YxJ3n9AWAAFMVTyuPmu0AMB/5jw1cVot2+g9bAZxFYWz0zP78f6
	b1TvDRKlDQ6nCScZJPtPDiUpow==
X-Google-Smtp-Source: AGHT+IE2VidwYduX3+IUWzCNWkz7fH0MJcFoy+9n6bs9SgisPO6hvJgpWGU9CHGg3fgT+xIjWSxO2A==
X-Received: by 2002:ac2:4a91:0:b0:50b:b9f4:b9e3 with SMTP id l17-20020ac24a91000000b0050bb9f4b9e3mr1265253lfp.53.1701181044692;
        Tue, 28 Nov 2023 06:17:24 -0800 (PST)
Date: Tue, 28 Nov 2023 15:17:23 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
	Alex Deucher <Alexander.Deucher@amd.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>,
	Huang Rui <Ray.Huang@amd.com>,
	Honglei Huang <Honglei1.Huang@amd.com>,
	Julia Zhang <Julia.Zhang@amd.com>
Subject: Re: [RFC XEN PATCH v2 2/3] x86/pvh: Open PHYSDEVOP_map_pirq for PVH
 dom0
Message-ID: <ZWX2c7oQfeZxrpEF@macbook>
References: <20231124104136.3263722-1-Jiqian.Chen@amd.com>
 <20231124104136.3263722-3-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231124104136.3263722-3-Jiqian.Chen@amd.com>

On Fri, Nov 24, 2023 at 06:41:35PM +0800, Jiqian Chen wrote:
> If we run Xen with PVH dom0 and hvm domU, hvm will map a pirq for
> a passthrough device by using gsi, see xen_pt_realize->xc_physdev_map_pirq
> and pci_add_dm_done->xc_physdev_map_pirq. Then xc_physdev_map_pirq will
> call into Xen, but in hvm_physdev_op, PHYSDEVOP_map_pirq is not allowed
> because currd is PVH dom0 and PVH has no X86_EMU_USE_PIRQ flag, it will
> fail at has_pirq check.
> 
> So, I think we may need to allow PHYSDEVOP_map_pirq when currd is dom0 (at

And PHYSDEVOP_unmap_pirq also?

> present dom0 is PVH).

IMO it would be better to implement a new set of DMOP hypercalls that
handle the setup of interrupts from physical devices that are assigned
to a guest.  That should allow us to get rid of the awkward PHYSDEVOP
+ XEN_DOMCTL_{,un}bind_pt_irq hypercall interface, which currently
prevents QEMU from being hypervisor version agnostic (since the domctl
interface is not stable).

I understand this might be too much to ask for, but something to take
into account.

Thanks, Roger.

