Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63107950E30
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 22:55:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776619.1186782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdyXm-0006bX-O7; Tue, 13 Aug 2024 20:55:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776619.1186782; Tue, 13 Aug 2024 20:55:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdyXm-0006Zu-L9; Tue, 13 Aug 2024 20:55:02 +0000
Received: by outflank-mailman (input) for mailman id 776619;
 Tue, 13 Aug 2024 20:55:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sdyXk-0006Zo-Vy
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 20:55:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sdyXk-0006xI-Jx; Tue, 13 Aug 2024 20:55:00 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sdyXk-0007Fz-Ej; Tue, 13 Aug 2024 20:55:00 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=BTSkmmXoHpxz587FYUrWx6H+rO+zEqa/nSDJfmmGTvI=; b=MXMWFTEyxpMdLuJL/cuZaVIXcT
	ydgggFBFAuffOBuayH213EWqziuUw9aRN4WlKwBr1KG/bWsAWxZL3ybVqQRfxG0b94AYfPHtPKLwz
	ozYp7X8Vxg4CtLsrqyemJ2JoiAhT54GoRWESltWMKbyHSaBAiyS9r08VToxuX20eU1Y4=;
Message-ID: <a5df7b93-71dc-451d-ae9f-6afd4649a954@xen.org>
Date: Tue, 13 Aug 2024 21:54:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] xen/arm: smmuv3: Mark more init-only functions
 with __init
Content-Language: en-GB
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Rahul Singh <Rahul.Singh@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "michal.orzel@amd.com" <michal.orzel@amd.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 "edgar.iglesias@amd.com" <edgar.iglesias@amd.com>
References: <20240522132829.1278625-1-edgar.iglesias@gmail.com>
 <20240522132829.1278625-2-edgar.iglesias@gmail.com>
 <7AA016AF-03B0-4321-B0B9-FBDD60B24557@arm.com>
 <CAJy5ezqz8oHfv_an9DtoGwJK2M6d_HO_QhUVvwd7k8wdmibG4w@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CAJy5ezqz8oHfv_an9DtoGwJK2M6d_HO_QhUVvwd7k8wdmibG4w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Edgar,

On 09/08/2024 11:23, Edgar E. Iglesias wrote:
> On Wed, Jun 5, 2024 at 11:55 AM Rahul Singh <Rahul.Singh@arm.com 
> <mailto:Rahul.Singh@arm.com>> wrote:
> 
>     Hi Edgar,
> 
>      > On 22 May 2024, at 2:28 PM, Edgar E. Iglesias
>     <edgar.iglesias@gmail.com <mailto:edgar.iglesias@gmail.com>> wrote:
>      >
>      > From: "Edgar E. Iglesias" <edgar.iglesias@amd.com
>     <mailto:edgar.iglesias@amd.com>>
>      >
>      > Move more functions that are only called at init to
>      > the .init.text section.
>      >
>      > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com
>     <mailto:edgar.iglesias@amd.com>>
> 
>     Acked-by: Rahul Singh <rahul.singh@arm.com <mailto:rahul.singh@arm.com>>
>     Tested-by: Rahul Singh <rahul.singh@arm.com
>     <mailto:rahul.singh@arm.com>>
> 
>     Regards,
>     Rahul
> 
> 
> Ping!

Thanks for the ping and sorry this fell through the cracks.

> 
> This still rebases cleanly on top of master but let me know if I should 
> resend.


This is now committed.

Cheers,

-- 
Julien Grall

