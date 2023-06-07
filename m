Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26167725BAA
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 12:33:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544693.850648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6qTB-0007cr-OA; Wed, 07 Jun 2023 10:32:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544693.850648; Wed, 07 Jun 2023 10:32:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6qTB-0007bH-L1; Wed, 07 Jun 2023 10:32:49 +0000
Received: by outflank-mailman (input) for mailman id 544693;
 Wed, 07 Jun 2023 10:32:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q6qT9-0007bB-V7
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 10:32:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q6qT6-0000Nq-Sz; Wed, 07 Jun 2023 10:32:44 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[192.168.13.206]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q6qT6-00043G-Jx; Wed, 07 Jun 2023 10:32:44 +0000
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
	bh=VLKd6Z9vhuRniRTnClU+Y7JrViZSz8Pjgm+joPP6aeE=; b=s9smKEiKrLnpuehT1O33g/U1xG
	O8JthCjLoe6L2EEJgldonbeJP0tiRxFzEUcxiSJKL6I6nRPEaYcuadoUblODd0Jcw3d2SqbhbWKWO
	ItU+n5EO5Ez4wgwCNv6BEkC0z9Yj4Nme9dhQ2ufXTx3z9xlEDJV//fDasszASyGWKCeM=;
Message-ID: <53608ce9-bcf9-2b1f-5090-55bded317f40@xen.org>
Date: Wed, 7 Jun 2023 11:32:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v8 00/12] SVE feature for arm guests
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Henry Wang <Henry.Wang@arm.com>,
 Community Manager <community.manager@xenproject.org>
References: <20230531072413.868673-1-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230531072413.868673-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 31/05/2023 08:24, Luca Fancellu wrote:
> This serie is introducing the possibility for Dom0 and DomU guests to use
> sve/sve2 instructions.
> 
> SVE feature introduces new instruction and registers to improve performances on
> floating point operations.
> 
> The SVE feature is advertised using the ID_AA64PFR0_EL1 register, SVE field, and
> when available the ID_AA64ZFR0_EL1 register provides additional information
> about the implemented version and other SVE feature.
> 
> New registers added by the SVE feature are Z0-Z31, P0-P15, FFR, ZCR_ELx.
> 
> Z0-Z31 are scalable vector register whose size is implementation defined and
> goes from 128 bits to maximum 2048, the term vector length will be used to refer
> to this quantity.
> P0-P15 are predicate registers and the size is the vector length divided by 8,
> same size is the FFR (First Fault Register).
> ZCR_ELx is a register that can control and restrict the maximum vector length
> used by the <x> exception level and all the lower exception levels, so for
> example EL3 can restrict the vector length usable by EL3,2,1,0.
> 
> The platform has a maximum implemented vector length, so for every value
> written in ZCR register, if this value is above the implemented length, then the
> lower value will be used. The RDVL instruction can be used to check what vector
> length is the HW using after setting ZCR.
> 
> For an SVE guest, the V0-V31 registers are part of the Z0-Z31, so there is no
> need to save them separately, saving Z0-Z31 will save implicitly also V0-V31.
> 
> SVE usage can be trapped using a flag in CPTR_EL2, hence in this serie the
> register is added to the domain state, to be able to trap only the guests that
> are not allowed to use SVE.
> 
> This serie is introducing a command line parameter to enable Dom0 to use SVE and
> to set its maximum vector length that by default is 0 which means the guest is
> not allowed to use SVE. Values from 128 to 2048 mean the guest can use SVE with
> the selected value used as maximum allowed vector length (which could be lower
> if the implemented one is lower).
> For DomUs, an XL parameter with the same way of use is introduced and a dom0less
> DTB binding is created.
> 
> The context switch is the most critical part because there can be big registers
> to be saved, in this serie an easy approach is used and the context is
> saved/restored every time for the guests that are allowed to use SVE.
> 
> Luca Fancellu (12):
>    xen/arm: enable SVE extension for Xen
>    xen/arm: add SVE vector length field to the domain
>    xen/arm: Expose SVE feature to the guest
>    xen/arm: add SVE exception class handling
>    arm/sve: save/restore SVE context switch
>    xen/common: add dom0 xen command line argument for Arm
>    xen: enable Dom0 to use SVE feature
>    xen/physinfo: encode Arm SVE vector length in arch_capabilities
>    tools: add physinfo arch_capabilities handling for Arm
>    xen/tools: add sve parameter in XL configuration
>    xen/arm: add sve property for dom0less domUs
>    xen/changelog: Add SVE and "dom0" options to the changelog for Arm

The series is now committed. Note that I had to resolve a minor conflict 
in the CHANGELOG.

Cheers,

-- 
Julien Grall

