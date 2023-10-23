Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0A07D2FD7
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 12:28:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621268.967566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qusAD-0000zc-Dl; Mon, 23 Oct 2023 10:28:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621268.967566; Mon, 23 Oct 2023 10:28:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qusAD-0000yR-Aj; Mon, 23 Oct 2023 10:28:01 +0000
Received: by outflank-mailman (input) for mailman id 621268;
 Mon, 23 Oct 2023 10:28:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LY3q=GF=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qusAC-0000yL-9K
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 10:28:00 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d59a5ed7-718e-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 12:27:58 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2c16757987fso45201501fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Oct 2023 03:27:58 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 q12-20020a05600c2e4c00b0040648217f4fsm13756857wmf.39.2023.10.23.03.27.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 03:27:57 -0700 (PDT)
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
X-Inumbo-ID: d59a5ed7-718e-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1698056877; x=1698661677; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UZmbjVzzMKO72cSsR0W19LdbV+l1QtuSV4JiINRSlqk=;
        b=HZoV1ujxqWVgfVVOmubuUgrP4tl4JsluXH7/lXBe1zWcHEk/yej8AHBAI277sSGyNn
         Q/bJLlgK9trkAGhGibYHIzOYh2tJtZAp1IUec072fM5tvYx0p93bh3IN4Szj1Z6kIe2X
         UjeAR0FgEiCurCxim1AMHGjBlSN/AhhReXYa8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698056877; x=1698661677;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZmbjVzzMKO72cSsR0W19LdbV+l1QtuSV4JiINRSlqk=;
        b=Qo9P5Bf8t87hu69vhH3sLeyVKFCwBtqWpFYNZNA/WpH1672Hkvv5qfDiGw/gIJMbHm
         HCBCS2AsHCVmQewKunEW9hLD+bxtFwnonOP74k3Ghkd1ATkXoGw9jbldRbYcNnv0lBX3
         WRuIi/iFHh9DvlPCtzr9tc9e6bWgcLlaopUAviIu4vnpa6CPCEcCe2A/lS2TpyFOezQf
         NJBqYlIHuiBHCBj16isIjWog18cwJ1GCdY0yYoaPs/urnzJjX19jkdMoI5GWfLavTp5Y
         QVQNVmBVw00Mdzql7yUWuJs1Nti6DiZqLDcDjF6ZRns/KT03nmrdopUTN4hoJzgVs+h5
         12ww==
X-Gm-Message-State: AOJu0YyrNVnSmDv98HodDJYqXWlEei8+eQTU2wpIT9rZWe7m8N83uArR
	C8ApA7toxpZHzQEb04FkvEDlZg==
X-Google-Smtp-Source: AGHT+IFQwhyeTY3I891TwKcSl+0zAhh5eCJXNVLFLmbLCcEI4G26orj0GvSFswHxu1iVRbUU88aJ/w==
X-Received: by 2002:a2e:9210:0:b0:2bf:f7ea:884a with SMTP id k16-20020a2e9210000000b002bff7ea884amr6211685ljg.30.1698056877438;
        Mon, 23 Oct 2023 03:27:57 -0700 (PDT)
Date: Mon, 23 Oct 2023 11:27:56 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 5/5] [FUTURE] xen/arm: enable vPCI for domUs
Message-ID: <3e1d47e7-4f69-4402-9136-1dee0511915f@perard>
References: <20231009195747.889326-1-stewart.hildebrand@amd.com>
 <20231009195747.889326-6-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009195747.889326-6-stewart.hildebrand@amd.com>

On Mon, Oct 09, 2023 at 03:57:44PM -0400, Stewart Hildebrand wrote:
> Select HAS_VPCI_GUEST_SUPPORT in Kconfig for enabling vPCI in domUs.
> 
> Set the pci flags in xen_arch_domainconfig to enable vPCI if a pci device has
> been specified in the xl domain config file.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
> As the tag implies, this patch is not intended to be merged (yet).
> 
> Note that CONFIG_HAS_VPCI_GUEST_SUPPORT is not currently used in the upstream
> code base. It will be used by the vPCI series [1]. This patch is intended to be
> merged as part of the vPCI series. I'll coordinate with Volodymyr to include
> this in the vPCI series or resend afterwards. Meanwhile, I'll include it here
> until the Kconfig and xen_arch_domainconfig prerequisites have been committed.
> 
> v2->v3:
> * set pci flags in toolstack
> 
> v1->v2:
> * new patch
> 
> [1] https://lists.xenproject.org/archives/html/xen-devel/2023-08/msg02361.html
> ---
>  tools/libs/light/libxl_arm.c | 3 +++
>  xen/arch/arm/Kconfig         | 1 +

Can we have two different patch? One for the hypervisor, one for the
tools. Or does the both depends on each other, somehow?

Is guest creation going to fails if we set XEN_DOMCTL_CONFIG_PCI_VPCI
without HAS_VPCI_GUEST_SUPPORT ?

Is the guest is going to fail to run, or fail at creation if the
hypervisor HAS_VPCI_GUEST_SUPPORT, but we didn't set
XEN_DOMCTL_CONFIG_PCI_VPCI?

Thanks,

-- 
Anthony PERARD

