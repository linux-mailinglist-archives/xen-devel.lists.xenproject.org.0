Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA98960199E
	for <lists+xen-devel@lfdr.de>; Mon, 17 Oct 2022 22:26:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424586.672119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okWfS-0003Ec-Pn; Mon, 17 Oct 2022 20:24:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424586.672119; Mon, 17 Oct 2022 20:24:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okWfS-0003Bb-MD; Mon, 17 Oct 2022 20:24:58 +0000
Received: by outflank-mailman (input) for mailman id 424586;
 Mon, 17 Oct 2022 20:24:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1okWfR-0003BV-Sz
 for xen-devel@lists.xenproject.org; Mon, 17 Oct 2022 20:24:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1okWfR-0007ap-HS; Mon, 17 Oct 2022 20:24:57 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1okWfR-0006rZ-A6; Mon, 17 Oct 2022 20:24:57 +0000
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
	bh=GNKtICVhLR/BEOpNfwnGX3ujSH6r7CPVHqIBmsq5yGQ=; b=V3L3XOptCVxIkxb85AlYWTdhaj
	zKoc3TVNRvsgAANK7obu5njTYjK+c1VvuyD6zFHCk1HB5Dv6QiNfHTm3WskxylfZyNUzmLEZi99yJ
	OAaVXQ61ulR3azAWLkmR3zTBzwzntjil6s00qkuISIA9BZh983j2+Qdr7v38ZA5kVIao=;
Message-ID: <3cd9f882-090a-b4ba-df87-663a9a375737@xen.org>
Date: Mon, 17 Oct 2022 21:24:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: [PATCH 1/2] arm/p2m: Rework p2m_init()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Henry Wang <Henry.Wang@arm.com>
References: <20221017191237.11079-1-andrew.cooper3@citrix.com>
 <20221017191237.11079-2-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221017191237.11079-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 17/10/2022 20:12, Andrew Cooper wrote:
> p2m_init() is mostly trivial initialisation, but has two failable operations
> which are on either side of the backpointer trigger for teardown to take
> actions.
> 
> p2m_free_vmid() is idempotent with a failed p2m_alloc_vmid(), so rearrange
> p2m_init() to perform all trivial setup, then set the backpointer, then
> perform all failable setup.
> 
> This will simplify a future bugfix which needs to add a third failabile

Typo:  s/failabile/fallible?

> operation.
> 
> No practical change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

