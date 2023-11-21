Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0251C7F3373
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 17:16:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637980.994174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5TQ3-0001QU-Gm; Tue, 21 Nov 2023 16:16:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637980.994174; Tue, 21 Nov 2023 16:16:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5TQ3-0001Nh-Dx; Tue, 21 Nov 2023 16:16:11 +0000
Received: by outflank-mailman (input) for mailman id 637980;
 Tue, 21 Nov 2023 16:16:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r5TQ1-0001Nb-Qn
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 16:16:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r5TQ1-0005rN-IB; Tue, 21 Nov 2023 16:16:09 +0000
Received: from [15.248.3.117] (helo=[10.24.67.37])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r5TQ1-0002Vw-CB; Tue, 21 Nov 2023 16:16:09 +0000
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
	bh=0k/dmhmxeKl5bd1+nyTbC5KvgF2oZrBPZBrurcD0JrQ=; b=SMdkE9aMZ5RFN1mI0hPO+TvKEf
	qXYC7Fnm3G/zwInFfvxp444owsaVsEfIhFzWd+gzlxmlkCyWrzJuACOf7niIFxaXimz5XrnG/0YSD
	WQWKL77aOy/HX7WBBVQM+PrwsXh1WfdM+8eNYgrT8J6Bu+jD0WnZ2vd5r+eofU71JLz8=;
Message-ID: <efbca156-948f-4fcb-98b9-05f13f8c076b@xen.org>
Date: Tue, 21 Nov 2023 16:16:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] xen/arm64: Move print_reg macro to asm/arm64/macros.h
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231121094516.24714-1-michal.orzel@amd.com>
 <20231121094516.24714-3-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231121094516.24714-3-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 21/11/2023 09:45, Michal Orzel wrote:
> Macro print_reg is used to print a value of a register passed as an
> argument. While today it is only used from within the common head.S,
> in the future we might want to make use of it from other files, just
> like PRINT(). It also serves as a great aid when debugging.
> 
> Expose print_reg macro by moving it to asm/arm64/macros.h and:
>   - rename putn to asm_putn to denote the usage from assembly only,
>   - use ENTRY() for asm_putn to make it globally visible,
>   - get rid of unneeded stubs for early_puts, init_uart and putn since
>     the calls to them are already protected by #ifdef CONFIG_EARLY_PRINTK.

NIT: The last one read as this is necessary to move print_reg() to 
asm/arm64/macros. But really, this is just a clean-up. So I would add 
something like "Take the opportunity to..." or similar to make it clearer.

Other than that:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

