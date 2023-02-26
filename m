Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E235B6A2F1B
	for <lists+xen-devel@lfdr.de>; Sun, 26 Feb 2023 11:31:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501992.773794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWEHd-00076W-8U; Sun, 26 Feb 2023 10:29:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501992.773794; Sun, 26 Feb 2023 10:29:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWEHd-00074Z-5b; Sun, 26 Feb 2023 10:29:33 +0000
Received: by outflank-mailman (input) for mailman id 501992;
 Sun, 26 Feb 2023 10:29:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pWEHb-00074T-GB
 for xen-devel@lists.xenproject.org; Sun, 26 Feb 2023 10:29:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pWEHb-000406-1W; Sun, 26 Feb 2023 10:29:31 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pWEHa-0000NN-QR; Sun, 26 Feb 2023 10:29:30 +0000
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
	bh=7v/OfU/FvMoHcl2tSrE1Us0M0HisqmSs/LOs3Z2N6tE=; b=1dh4kpqvo/m3GCw7up7N3Ys2Sv
	D51m79QAHP0wbx6inezWQiMP8dsIx+3C75tAzhLeYhLZcU3lgLQEcuieD6l0IQ03w8p41GQA0Jfit
	Penu4wcCyMct8U4aCaE4q/lfyf+4pFC36kItYpM3Ta4fioXmqA3aCAFZkbY/UFTXncKI=;
Message-ID: <fa3eb972-bd9e-2732-8f51-ddea055e4f54@xen.org>
Date: Sun, 26 Feb 2023 10:29:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v5 3/5] xen/arm64: mm: Introduce helpers to
 prepare/enable/disable the identity mapping
To: Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Luca Fancellu <Luca.Fancellu@arm.com>,
 "michal.orzel@amd.com" <michal.orzel@amd.com>,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230127195508.2786-1-julien@xen.org>
 <20230127195508.2786-4-julien@xen.org>
 <AS8PR08MB7991FBCB731CC548C98ECA2792CD9@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AS8PR08MB7991FBCB731CC548C98ECA2792CD9@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 28/01/2023 04:54, Henry Wang wrote:
>> -----Original Message-----
>> Subject: [PATCH v5 3/5] xen/arm64: mm: Introduce helpers to
>> prepare/enable/disable the identity mapping
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> In follow-up patches we will need to have part of Xen identity mapped in
>> order to safely switch the TTBR.
>>
>> On some platform, the identity mapping may have to start at 0. If we always
>> keep the identity region mapped, NULL pointer dereference would lead to
>> access to valid mapping.
>>
>> It would be possible to relocate Xen to avoid clashing with address 0.
>> However the identity mapping is only meant to be used in very limited
>> places. Therefore it would be better to keep the identity region invalid
>> for most of the time.
>>
>> Two new external helpers are introduced:
>>      - arch_setup_page_tables() will setup the page-tables so it is
>>        easy to create the mapping afterwards.
>>      - update_identity_mapping() will create/remove the identity mapping
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Reviewed-by: Henry Wang <Henry.Wang@arm.com>
> With some nits below that can definitely be fixed on commit.

I need to resend a new version of this patch. So I will fix them at the 
same time and...

> 
> Tested on FVP in Arm64 mode, so:
> Tested-by: Henry Wang <Henry.Wang@arm.com>

.. didn't keep these tags.

Cheers,

-- 
Julien Grall

