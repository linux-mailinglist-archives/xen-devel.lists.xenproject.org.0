Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDFC79A839
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 15:15:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599401.934801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfgk6-00025H-QI; Mon, 11 Sep 2023 13:14:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599401.934801; Mon, 11 Sep 2023 13:14:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfgk6-00023D-Nf; Mon, 11 Sep 2023 13:14:18 +0000
Received: by outflank-mailman (input) for mailman id 599401;
 Mon, 11 Sep 2023 13:14:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qfgk5-000237-0O
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 13:14:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qfgk4-0007SM-KI; Mon, 11 Sep 2023 13:14:16 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qfgk4-0004uH-Eq; Mon, 11 Sep 2023 13:14:16 +0000
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
	bh=wVlQNb4p+4Fgf6dTqeYFzYits+WM4vda9Q4/Bf5kGKo=; b=qWUAlOs6eUn+ZRRR9rhaO2XNmK
	oZ1ZZuQ+lti0EyXma8tFy9RNgNQ0zfJNhdbTDY5+8pham1ZUXLc5hhpUnxC2IXOUmr+xFKO6WWfvx
	TJ6/4DaEZ5yd3n5QuV2jB41qWpIQuF8OuhXe0l7C5niIxDVvkaTh9DBDLWTj1OXe3Jqw=;
Message-ID: <366e89e3-bc3d-4c54-b1ad-8147abbabdc7@xen.org>
Date: Mon, 11 Sep 2023 14:14:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Skip Xen specific nodes/properties from hwdom
 /chosen node
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230911123401.27659-1-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230911123401.27659-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/09/2023 13:34, Michal Orzel wrote:
> Host device tree nodes under /chosen with compatible string
> "xen,evtchn-v1", "xen,domain-shared-memory-v1" are Xen specific and not
> meant to be exposed to hardware domain.

So, how dom0 is meant to discover the static event channel, shared 
memory it can use?

> The same applies to
> "xen,static-heap" property. Skip them from being included into hwdom
> /chosen node.

I agree with hiding "xen,static-heap" property.

Cheers,

-- 
Julien Grall

