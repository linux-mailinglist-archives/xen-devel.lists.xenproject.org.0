Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D256137D437
	for <lists+xen-devel@lfdr.de>; Wed, 12 May 2021 22:27:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126391.237945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgvRX-0008AV-Gt; Wed, 12 May 2021 20:26:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126391.237945; Wed, 12 May 2021 20:26:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgvRX-00087I-Dr; Wed, 12 May 2021 20:26:55 +0000
Received: by outflank-mailman (input) for mailman id 126391;
 Wed, 12 May 2021 20:26:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=codm=KH=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lgvRV-000879-U2
 for xen-devel@lists.xenproject.org; Wed, 12 May 2021 20:26:53 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1162508b-f1cf-4e75-9f1a-9517c003e146;
 Wed, 12 May 2021 20:26:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 244F3613B6;
 Wed, 12 May 2021 20:26:52 +0000 (UTC)
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
X-Inumbo-ID: 1162508b-f1cf-4e75-9f1a-9517c003e146
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1620851212;
	bh=IgmMSFZrOHgFCTc0Y6ImNI9GrSZkyuzsXekB3bIoVTo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Lah3w7DugpOAaDxV9Z8VTCFQrNMUKjNXbXOkRWkuoC3ThsrXBgKrREWJCEUwi4EYX
	 /xiOY8D38yQmD4dxYunyT1YAMSc0Rkdzzy2TX8gJxmH4WQJrjTOXhCo6xHxYyjqaKz
	 AzIRAHPrYmx1hVBXE8iq9zOKwG10x6Ykw1KTjwa1lpTcT4q4jh4uhVYIB1VD8j68lX
	 +VXoOHmmt8QRRadO13vX7ftf5OLsv2qVAywNeENBypFMLJ73ywIov4gTJ85Ce4+dPr
	 oLsDIcMaxRPFWiUQNtOvS2G5Ik5u7MxIte/K6BpQPS7D4fcTHPVfBZkDIhU/IyECGm
	 YXkeTvXydll9A==
Date: Wed, 12 May 2021 13:26:51 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, michal.orzel@arm.com, 
    Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: gic-v3: Add missing breaks gicv3_read_apr()
In-Reply-To: <20210512173548.27244-1-julien@xen.org>
Message-ID: <alpine.DEB.2.21.2105121326400.5018@sstabellini-ThinkPad-T480s>
References: <20210512173548.27244-1-julien@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 12 May 2021, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Commit 78e67c99eb3f "arm/gic: Get rid of READ/WRITE_SYSREG32"
> mistakenly converted all the cases in gicv3_read_apr() to fall-through.
> 
> Rather than re-instating a return per case, add the missing break and
> keep a single return at the end of the fucntion.
> 
> Fixes: 78e67c99eb3f ("arm/gic: Get rid of READ/WRITE_SYSREG32")
> Signed-off-by: Julien Grall <jgrall@amazon.com>

reviewed and committed


> ---
>  xen/arch/arm/gic-v3.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index b86f04058947..9a3a175ad7d2 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -1167,12 +1167,15 @@ static unsigned int gicv3_read_apr(int apr_reg)
>      case 0:
>          ASSERT(gicv3.nr_priorities > 4 && gicv3.nr_priorities < 8);
>          apr = READ_SYSREG(ICH_AP1R0_EL2);
> +        break;
>      case 1:
>          ASSERT(gicv3.nr_priorities > 5 && gicv3.nr_priorities < 8);
>          apr = READ_SYSREG(ICH_AP1R1_EL2);
> +        break;
>      case 2:
>          ASSERT(gicv3.nr_priorities > 6 && gicv3.nr_priorities < 8);
>          apr = READ_SYSREG(ICH_AP1R2_EL2);
> +        break;
>      default:
>          BUG();
>      }
> -- 
> 2.17.1
> 

