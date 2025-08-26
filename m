Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11134B358D3
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 11:26:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094178.1449520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqpwj-0007Tc-Gx; Tue, 26 Aug 2025 09:26:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094178.1449520; Tue, 26 Aug 2025 09:26:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqpwj-0007R6-DI; Tue, 26 Aug 2025 09:26:29 +0000
Received: by outflank-mailman (input) for mailman id 1094178;
 Tue, 26 Aug 2025 09:26:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uqpwh-0007Qz-KG
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 09:26:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uqpwg-007UAz-1G;
 Tue, 26 Aug 2025 09:26:26 +0000
Received: from [2a02:8012:3a1:0:7d60:da5a:46e8:4212]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uqpwg-0020An-13;
 Tue, 26 Aug 2025 09:26:26 +0000
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
	bh=Xx72W0gjQ5Nnf4uyKucK7r/1cZkAMMPyamW0y+YnIaI=; b=04mqVx4S0t6Q4t+F5SKO/+4Hvr
	1OXneTBOJnf8xzlljXSv3ijvzUSaIqrNhObfv7QRBjoOKpfsGkY+z6woRNZsDZrh3H+Xg8Sqa6OjY
	so3Z7/3OkMYuDHRCOmbHh5drgs23sif3YHQlliCg+9ZtLw+kya60WgwAnMb+LHMmvY8g=;
Message-ID: <67d58304-146e-480e-a689-440afe7828aa@xen.org>
Date: Tue, 26 Aug 2025 10:26:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for
 guests
Content-Language: en-GB
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1755506449.git.mykola_kvach@epam.com>
 <205b2b354ff1d34d0e9ec4777ca3c94492f6d9d1.1755506449.git.mykola_kvach@epam.com>
 <9ab99307-9594-4cbc-9c7a-b1221575d41c@xen.org>
 <CAGeoDV-MC65TZ74BLVDzfggQoeKXTKB-eVaadUoDB9iuP7TW3Q@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CAGeoDV-MC65TZ74BLVDzfggQoeKXTKB-eVaadUoDB9iuP7TW3Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mykola,

On 26/08/2025 10:09, Mykola Kvach wrote:
>> Shouldn't this be removed so the check also apply for 32-bit domain on
>> 64-bit system?
> 
> AFAIK, this question was already addressed in a previous version of
> this patch series:
> https://patchew.org/Xen/cover.1751020456.git.mykola._5Fkvach@epam.com/072270e0940b6bcc2743d56a336363f4719ba60a.1751020456.git.mykola._5Fkvach@epam.com/#7070f416-119c-49f8-acd0-82c6e31f0fc6@xen.org

Sure. For 32-bit domain, in theory the top bits should be zeroed. But 
AFAIK, there is no harm to zero them again and it would avoid someone to 
wonder why this is protected by is_64bit_domain().

So unless there is a strong reason to keep, I would rather prefer if we 
remove the 64-bit.

Cheers,

-- 
Julien Grall


