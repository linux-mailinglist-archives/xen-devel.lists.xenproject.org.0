Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA080520470
	for <lists+xen-devel@lfdr.de>; Mon,  9 May 2022 20:22:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324728.546908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no81Y-0005Kf-Uq; Mon, 09 May 2022 18:22:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324728.546908; Mon, 09 May 2022 18:22:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no81Y-0005Hm-Rf; Mon, 09 May 2022 18:22:24 +0000
Received: by outflank-mailman (input) for mailman id 324728;
 Mon, 09 May 2022 18:22:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1no81W-0005Hc-C4
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 18:22:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1no81R-00038u-0S; Mon, 09 May 2022 18:22:17 +0000
Received: from [54.239.6.187] (helo=[192.168.22.23])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1no81Q-0005WR-QJ; Mon, 09 May 2022 18:22:16 +0000
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
	bh=rzTlxfHjWXtIR41vc5Crw3Am92UuoLpRph9ARsoN050=; b=cLP4TZjh/G4y27HmQNsGUZCHbg
	Xc0GUIGBUP4W1LmYMSizDRpIS7RneT/fi85uUhdjtuMLJT0+XNly1L/wt8U25QoMNW2FMk/Q4iZn7
	E38JVtn6e0IXygl6eFludmbDhO009eUNYTDKCtyRaC4E+wCMpDRX5R77pVJO+xyHJZos=;
Message-ID: <dd0d090d-24fd-bab5-7a30-598710bc04e5@xen.org>
Date: Mon, 9 May 2022 19:22:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v3] xen/build: Add cppcheck and cppcheck-html make rules
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Michal Orzel <michal.orzel@arm.com>
References: <8a8ffce11591efb284c93214b77534fa4e4134b2.1650976647.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <8a8ffce11591efb284c93214b77534fa4e4134b2.1650976647.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 26/04/2022 13:38, Bertrand Marquis wrote:
> diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
> index 852b5f3c24..ef37cfa16f 100644
> --- a/xen/arch/arm/include/asm/processor.h
> +++ b/xen/arch/arm/include/asm/processor.h
> @@ -219,9 +219,11 @@
>                            SCTLR_Axx_ELx_A    | SCTLR_Axx_ELx_C   |\
>                            SCTLR_Axx_ELx_WXN  | SCTLR_Axx_ELx_EE)
>   
> +#ifndef CPPCHECK

Can you add a comment explaining why you need this check?

With that:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

