Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FEC221304
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 18:55:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvkgJ-00060P-A0; Wed, 15 Jul 2020 16:54:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cSQs=A2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jvkgI-00060K-17
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 16:54:54 +0000
X-Inumbo-ID: e73f0c9a-c6bb-11ea-9421-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e73f0c9a-c6bb-11ea-9421-12813bfff9fa;
 Wed, 15 Jul 2020 16:54:53 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 82FC620672;
 Wed, 15 Jul 2020 16:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594832092;
 bh=vIE56xHguh9oMOrReykdU+3lDSXsqRwrprk5pkM7Qq8=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=EYRa8hlmcmJjrPosothC9AU9Yq1muhce8TjFmOhQ27bNOWVe75q/fUiIMlT7NWiW2
 SC6b7jxXBNfDoE0SpKstnDLBoeI7S+FMvVNoIdvLWerKRndIbv0/OXCiR0rMYNjG6i
 m58e14AD5Xusv+q/X5aIzAqgDmC+DsQ0iKKxcTM0=
Date: Wed, 15 Jul 2020 09:54:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 4/8] Arm: prune #include-s needed by domain.h
In-Reply-To: <150525bb-1c48-c331-3212-eff18bc4c13d@suse.com>
Message-ID: <alpine.DEB.2.21.2007150954410.4124@sstabellini-ThinkPad-T480s>
References: <3375cacd-d3b7-9f06-44a7-4b684b6a77d6@suse.com>
 <150525bb-1c48-c331-3212-eff18bc4c13d@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, 15 Jul 2020, Jan Beulich wrote:
> asm/domain.h is a dependency of xen/sched.h, and hence should not itself
> include xen/sched.h. Nor should any of the other #include-s used by it.
> While at it, also drop two other #include-s that aren't needed by this
> particular header.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> --- a/xen/include/asm-arm/domain.h
> +++ b/xen/include/asm-arm/domain.h
> @@ -2,7 +2,7 @@
>  #define __ASM_DOMAIN_H__
>  
>  #include <xen/cache.h>
> -#include <xen/sched.h>
> +#include <xen/timer.h>
>  #include <asm/page.h>
>  #include <asm/p2m.h>
>  #include <asm/vfp.h>
> @@ -11,8 +11,6 @@
>  #include <asm/vgic.h>
>  #include <asm/vpl011.h>
>  #include <public/hvm/params.h>
> -#include <xen/serial.h>
> -#include <xen/rbtree.h>
>  
>  struct hvm_domain
>  {
> --- a/xen/include/asm-arm/vfp.h
> +++ b/xen/include/asm-arm/vfp.h
> @@ -1,7 +1,7 @@
>  #ifndef _ASM_VFP_H
>  #define _ASM_VFP_H
>  
> -#include <xen/sched.h>
> +struct vcpu;
>  
>  #if defined(CONFIG_ARM_32)
>  # include <asm/arm32/vfp.h>
> 

