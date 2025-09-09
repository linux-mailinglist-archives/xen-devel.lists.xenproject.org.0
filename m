Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9A4B4A8EA
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 11:55:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1116082.1462494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvv48-0005Az-9v; Tue, 09 Sep 2025 09:55:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1116082.1462494; Tue, 09 Sep 2025 09:55:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvv48-00058S-77; Tue, 09 Sep 2025 09:55:08 +0000
Received: by outflank-mailman (input) for mailman id 1116082;
 Tue, 09 Sep 2025 09:55:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uvv46-00058M-OW
 for xen-devel@lists.xenproject.org; Tue, 09 Sep 2025 09:55:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uvv46-001ca5-0J;
 Tue, 09 Sep 2025 09:55:06 +0000
Received: from [209.198.129.181] (helo=[10.1.3.247])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uvv46-001LdI-04;
 Tue, 09 Sep 2025 09:55:05 +0000
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
	bh=4SujrD6ZKDF9UPrtlsdWHGcCQTkfGbtTnGMd/vGAlYs=; b=LhhqRHWoOjeV9IZ6i2x0zRFcmD
	LOP0aL867ThOoYy4neBqomFniY5Vb6HsqN410+9QmedDgS4hyBqL19dkuB9GDwQjdOifIkrk9sFJH
	RXwdA2sqVmPxuzax7XnectWyGuW4XWb9+QEJgMLx/qWBeSThwg0Wj93TdKwcz/xPjUoo=;
Message-ID: <c68f1d0e-8a0d-4d8e-a98e-7617c548337a@xen.org>
Date: Tue, 9 Sep 2025 10:55:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/4] xen/arm: add generic SCI subsystem
Content-Language: en-GB
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
References: <cover.1756995595.git.oleksii_moisieiev@epam.com>
 <3e237c5256054a88b1c099d85d8bd1a602bba230.1756995595.git.oleksii_moisieiev@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3e237c5256054a88b1c099d85d8bd1a602bba230.1756995595.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

While going through the list of recently committed patches, I noticed 
some changes in the relinquish code.


On 04/09/2025 15:21, Oleksii Moisieiev wrote:
> @@ -1103,6 +1109,10 @@ int domain_relinquish_resources(struct domain *d)
>           ret = relinquish_p2m_mapping(d);
>           if ( ret )
>               return ret;

Style: There is a missing newline.

> +    PROGRESS(sci):

I don't quite understand why the sci relinquish was added right in the 
middle of the P2M relinquish logic. At least to me, it makes more sense 
to be closer to TEE (because this is firmware subsystem) and possibly 
even before releasing any devices.

Can you clarify why you chose this placement?

Cheers,

-- 
Julien Grall


