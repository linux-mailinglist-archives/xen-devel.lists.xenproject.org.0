Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 228FB1A9A6A
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 12:28:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOfGy-0002LT-A9; Wed, 15 Apr 2020 10:28:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UoJL=57=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jOfGw-0002LO-9W
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 10:27:58 +0000
X-Inumbo-ID: c577f2b6-7f03-11ea-9e09-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c577f2b6-7f03-11ea-9e09-bc764e2007e4;
 Wed, 15 Apr 2020 10:27:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BA6DBAC69;
 Wed, 15 Apr 2020 10:27:54 +0000 (UTC)
Subject: Re: [PATCH 02/12] xen/arm: introduce arch_xen_dom_flags and direct_map
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
 <20200415010255.10081-2-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4130f640-a664-a9e7-fcd7-85bbd58287e4@suse.com>
Date: Wed, 15 Apr 2020 12:27:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200415010255.10081-2-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: julien@xen.org, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>, andrew.cooper3@citrix.com,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, Volodymyr_Babchuk@epam.com,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15.04.2020 03:02, Stefano Stabellini wrote:
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -682,6 +682,7 @@ int arch_domain_create(struct domain *d,
>          return 0;
>  
>      ASSERT(config != NULL);
> +    d->arch.direct_map = flags != NULL ? flags->arch.is_direct_map : false;

Shouldn't "true" here imply ->disable_migrate also getting
set to true? Or is this already the case anyway for domains
created right at boot?

> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2527,6 +2527,7 @@ int __init construct_dom0(struct domain *d)
>  
>      iommu_hwdom_init(d);
>  
> +    d->arch.direct_map = true;

Shouldn't this get set via arch_domain_create() instead?

> --- a/xen/include/asm-x86/domain.h
> +++ b/xen/include/asm-x86/domain.h
> @@ -418,6 +418,8 @@ struct arch_domain
>      uint32_t emulation_flags;
>  } __cacheline_aligned;
>  
> +struct arch_xen_dom_flags {};

This trivial x86 change
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

