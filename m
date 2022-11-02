Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 023CC615E33
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 09:46:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435641.689284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oq9OF-00068F-Dp; Wed, 02 Nov 2022 08:46:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435641.689284; Wed, 02 Nov 2022 08:46:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oq9OF-00065O-9g; Wed, 02 Nov 2022 08:46:27 +0000
Received: by outflank-mailman (input) for mailman id 435641;
 Wed, 02 Nov 2022 08:46:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oq9OE-00064w-6n
 for xen-devel@lists.xenproject.org; Wed, 02 Nov 2022 08:46:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oq9OD-0005cu-O6; Wed, 02 Nov 2022 08:46:25 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.26.173]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oq9OD-0007u5-HJ; Wed, 02 Nov 2022 08:46:25 +0000
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
	bh=Z2WmQRsotChnU/nRWRYRy7OWhReR/3JRoqgEymUUs6M=; b=I+WKVu6Bag8iSZewQN4afW/DJZ
	XOdGlSRIFAkzG+6IF7DAtuHAnTJo6DcUGRrni6bZIo68ggM8MusYQUqfmk3xqlkDjJZAwuCRJXwVj
	Uc6ti9wY3P4Qvtg+PBsai2zB3VCWRVhJcHHpgnsG0k9bsKVBrlAuXeu6fXGbgkjPeglE=;
Message-ID: <d791158a-4f1b-9d6a-6bd4-8792da2217b2@xen.org>
Date: Wed, 2 Nov 2022 08:46:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [XEN v2 02/12] xen/Arm: GICv3: Move the macros to compute the
 affnity level to arm64/arm32
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, burzalodowa@gmail.com
References: <20221031151326.22634-1-ayankuma@amd.com>
 <20221031151326.22634-3-ayankuma@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221031151326.22634-3-ayankuma@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Title: The macros you are moving are not GICv3 specific.

On 31/10/2022 15:13, Ayan Kumar Halder wrote:
> Refer https://elixir.bootlin.com/linux/v6.1-rc1/source/arch/arm64/ \
> include/asm/cputype.h#L14 , for the macros specific for arm64.
> 
> Refer https://elixir.bootlin.com/linux/v6.1-rc1/source/arch/arm/include/ \
> asm/cputype.h#L54  , for the macros specific for arm32.
> 
> MPIDR_LEVEL_SHIFT() differs between 64 and 32 bit. > For 64 bit :-
> 
>   aff_lev3          aff_lev2 aff_lev1 aff_lev0
> |________|________|________|________|________|
> 40       32       24       16       8        0
> 
> For 32 bit :-
> 
>   aff_lev3 aff_lev2 aff_lev1 aff_lev0
> |________|________|________|________|
> 32       24       16       8        0

As discussed with Michal, AFF3 doesn't exist for 32-bit. So it is not 
clear to me what we are gaining by moving the macros.

Cheers,

-- 
Julien Grall

