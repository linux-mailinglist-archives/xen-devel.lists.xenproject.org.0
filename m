Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D8A666127
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 18:00:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475636.737383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFeRm-0000hO-WC; Wed, 11 Jan 2023 16:59:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475636.737383; Wed, 11 Jan 2023 16:59:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFeRm-0000fU-TP; Wed, 11 Jan 2023 16:59:30 +0000
Received: by outflank-mailman (input) for mailman id 475636;
 Wed, 11 Jan 2023 16:59:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pFeRl-0000fO-DN
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 16:59:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pFeRk-0005Kj-Kz; Wed, 11 Jan 2023 16:59:28 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.5.208]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pFeRk-0006fG-Et; Wed, 11 Jan 2023 16:59:28 +0000
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
	bh=8JyxsweNSjFnsgr9I+UrD3dI3IlDhE6PVGuCmTDcsBg=; b=TqLmaPnp7KDDR415D3LtoZxJJw
	0FOqiwID9R7GQsFIX4jYfdvPb203GecYn9CX+uZSmnCXXvHb4W8CUQH8cwkwU2EfgOL12zMBu4ON2
	3EqlxTlE3StQipJaJdz2z34+Rk9yOF8Acg6W6d5YRPLwKvaD2Qy5OfNg5snJ3rAf2bWE=;
Message-ID: <3e4ce6c0-9949-1312-f492-913b7dd2cf18@xen.org>
Date: Wed, 11 Jan 2023 16:59:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 0/8] SVE feature for arm guests
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Nick Rosbrook <rosbrookn@gmail.com>, Juergen Gross <jgross@suse.com>
References: <20230111143826.3224-1-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230111143826.3224-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 11/01/2023 14:38, Luca Fancellu wrote:
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

This would be OK for an initial approach. But I would be worry to 
officially support SVE because of the potential large impact on other users.

What's the long term plan?

Cheers,

-- 
Julien Grall

