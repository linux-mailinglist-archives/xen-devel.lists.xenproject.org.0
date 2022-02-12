Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 253CE4B3500
	for <lists+xen-devel@lfdr.de>; Sat, 12 Feb 2022 13:44:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270781.465100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIrkw-0004mC-9y; Sat, 12 Feb 2022 12:44:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270781.465100; Sat, 12 Feb 2022 12:44:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIrkw-0004je-5l; Sat, 12 Feb 2022 12:44:02 +0000
Received: by outflank-mailman (input) for mailman id 270781;
 Sat, 12 Feb 2022 12:44:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nIrku-0004jY-Fp
 for xen-devel@lists.xenproject.org; Sat, 12 Feb 2022 12:44:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nIrkt-00040P-AI; Sat, 12 Feb 2022 12:43:59 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nIrkt-0004Gn-4n; Sat, 12 Feb 2022 12:43:59 +0000
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
	bh=8RDYz19e6hQ6eQ6Xx8thMUZgK+ZufT++G8O6jPEqbnw=; b=SzOAenoeQ0rAwSz9m1v6dwtjfq
	VUm7mba5jpcx1drAW64qPXAiltmbN15/Msh3zi1hk1XaHkcIMHvNCaUs2qs25XSBr0IngcZyx3dEP
	0a4ppC1EQy24X7eNCfyQI+5Hs4dbM66m3SS69XszQy4XV5an/Q9VxRWq1NNlwiH9xahg=;
Message-ID: <c13f6312-3922-4504-3248-e2e4701b1a10@xen.org>
Date: Sat, 12 Feb 2022 12:43:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [RFC v2 5/8] xen/arm: introduce SCMI-SMC mediator driver
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1644341635.git.oleksii_moisieiev@epam.com>
 <cb1493f5d9b5c3437268054b4a8e345cb35c8708.1644341635.git.oleksii_moisieiev@epam.com>
 <F9811680-C6EC-4372-A451-5C1DA279E35E@arm.com>
 <20220211104403.GA2291814@EPUAKYIW015D>
 <A9FF3FBC-C29D-4A17-8737-EBABEF240BA2@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <A9FF3FBC-C29D-4A17-8737-EBABEF240BA2@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/02/2022 11:18, Bertrand Marquis wrote:
> Do you plan to add support for other boards ?
> 
> Did you discuss more in general with the linux kernel guys to see if this
> approach was agreed and will be adopted by other manufacturers ?
> 
> All in all I think this is a good idea but I fear that all this will actually only
> be used by one board or one manufacturer and other might use a different
> strategy, I would like to unrisk this before merging this in Xen.

In the past we merged code that would only benefits one vendor (i.e. 
EEMI). That said, this was a vendor specific protocol. I believe the 
situation is different here because the spec is meant to be generic.

> @julien and Stefano: what is your view here ?

I share the same concerns as you. I think we need to make sure all the 
pieces we rely on (e.g. firmware, DT bindings) have been agreed before 
we can merge such code in Xen.

The first step is to have all the pieces available in public so they can 
be reviewed and tested together.

Oleksii, on a separate e-mail, you said you made change for ATF. How 
much of those changes was related to support for Xen? If they are some, 
then I think they should be upstreamed first.

Cheers,

-- 
Julien Grall

