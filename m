Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D84339D68
	for <lists+xen-devel@lfdr.de>; Sat, 13 Mar 2021 10:43:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97485.185220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lL0ml-0002Bx-6d; Sat, 13 Mar 2021 09:42:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97485.185220; Sat, 13 Mar 2021 09:42:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lL0ml-0002BY-31; Sat, 13 Mar 2021 09:42:15 +0000
Received: by outflank-mailman (input) for mailman id 97485;
 Sat, 13 Mar 2021 09:42:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lL0mi-0002BT-SH
 for xen-devel@lists.xenproject.org; Sat, 13 Mar 2021 09:42:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lL0mg-0007tg-6d; Sat, 13 Mar 2021 09:42:10 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lL0mf-00032u-UA; Sat, 13 Mar 2021 09:42:10 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=EI6jRllVztx1sEsLt3SeOq/NfAZsBEPAvZ/UsXhhhJA=; b=3Wm8GInonj1aUeLP5Pkg9Yt/TU
	Uq8+blfi6wc2daOTRB9BzBtTrYCcJQqsmMHKd7EzJOR+FR3trkcaJj8gpQKpKbPHd/bd2cYlwFH0x
	A/7GHs2xX2fky+gDFDXXxTmxZgR20SPffT4SGSbevgH9m0HC93FIKHyz7lGWz8TOKA7Y=;
Subject: Re: [PATCH v3] xen: introduce XENFEAT_direct_mapped and
 XENFEAT_not_direct_mapped
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, Bertrand.Marquis@arm.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20210312231632.5666-1-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
Message-ID: <57520732-e033-774f-4341-be19a07f5745@xen.org>
Date: Sat, 13 Mar 2021 09:42:07 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210312231632.5666-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 12/03/2021 23:16, Stefano Stabellini wrote:
> Introduce two feature flags to tell the domain whether it is
> direct-mapped or not. It allows the guest kernel to make informed
> decisions on things such as swiotlb-xen enablement.
> 
> The introduction of both flags (XENFEAT_direct_mapped and
> XENFEAT_not_direct_mapped) allows the guest kernel to avoid any
> guesswork if one of the two is present, or fallback to the current
> checks if neither of them is present.
> 
> XENFEAT_direct_mapped is always set for not auto-translated guests.
> 
> For auto-translated guests, only Dom0 on ARM is direct-mapped. Also,
> see is_domain_direct_mapped() which refers to auto-translated guests:
> xen/include/asm-arm/domain.h:is_domain_direct_mapped
> xen/include/asm-x86/domain.h:is_domain_direct_mapped
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

