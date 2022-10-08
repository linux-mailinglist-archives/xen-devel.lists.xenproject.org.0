Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E55DC5F8703
	for <lists+xen-devel@lfdr.de>; Sat,  8 Oct 2022 21:08:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.418734.663506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohFBB-0005YO-9M; Sat, 08 Oct 2022 19:08:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 418734.663506; Sat, 08 Oct 2022 19:08:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohFBB-0005VI-6P; Sat, 08 Oct 2022 19:08:09 +0000
Received: by outflank-mailman (input) for mailman id 418734;
 Sat, 08 Oct 2022 19:08:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ohFB9-0005VC-K3
 for xen-devel@lists.xenproject.org; Sat, 08 Oct 2022 19:08:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ohFB8-0008Co-4y; Sat, 08 Oct 2022 19:08:06 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ohFB7-0004Do-Ur; Sat, 08 Oct 2022 19:08:06 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=26SuXPiKmeQ6L1tCSaeCg0p0DSactkNxVy4Ub0DZ92g=; b=H2l4WrT42499PKwQITuQem4xur
	FEN8WuaVwTsx/zmejHffh/9q9SEp2ZWv1dNSheUUVUCY0A9gxRI1za006e8UKmpwx+anNaiLAvCT6
	fe9DBPm3pirAL0D8bvLDbTtWvSGl8mpZAhgQ3fT/Ru3iqUbOqgT4tLJlgdUFYPTYmEHE=;
Message-ID: <a957dfbe-c4c4-c8cc-93c5-616a44fe1797@xen.org>
Date: Sat, 8 Oct 2022 20:08:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.2
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Henry Wang <Henry.Wang@arm.com>, Bertrand Marquis
 <Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <cc0fbcb4-5ea3-178c-e691-9acb7cc9a3a7@suse.com>
 <9C12552C-0A64-433D-9F0C-5672281DD45D@arm.com>
 <73faf43d-56e2-2bbf-6336-f6420a1aa0c0@suse.com>
 <f1a71d28-ed04-0936-47e3-aa7a9f8c6dbc@xen.org>
 <0d33ecc6-898a-9379-f934-fe569cbdc8f9@suse.com>
 <3b3f6e1c-4f41-6b1e-b226-f0dd515d14ca@xen.org>
 <7d152954-4f5a-2833-f974-442c15f4e8b9@suse.com>
 <82963a1c-3301-72ff-e995-77c30ec5a64b@suse.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH][4.17] EFI: don't convert memory marked for runtime use to
 ordinary RAM
In-Reply-To: <82963a1c-3301-72ff-e995-77c30ec5a64b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 06/10/2022 15:11, Jan Beulich wrote:
>> ... the space cannot become ordinary RAM, then such a precaution
>> wouldn't be necessary. After all hiding EfiACPIReclaimMemory from
>> Dom0 just because it can't be mapped WB wouldn't be very nice
>> either. I guess I'll submit v2 with this part of the change left
>> as it was.
> 
> And while already in the process of committing the patch I came to
> realize that if the WB conditional isn't supposed to move, isn't
> the change done for Arm then wrong as well? Shouldn't it then be
> 
>          if ( !(desc_ptr->Attribute & EFI_MEMORY_RUNTIME) &&
>               (desc_ptr->Attribute & EFI_MEMORY_WB) &&
>               (desc_ptr->Type == EfiConventionalMemory ||
>               ...
> 
> leaving the EfiACPIReclaimMemory case entirely unaffected by the
> change?

IIUC, the concern is the region EfiACPIReclaimMemory could have the 
attribute EFI_MEMORY_RUNTIME. Is that correct?

Given that the memory is reclaimable, I am not sure why it can also have 
this atribute set (to me it means the opposite). But I guess for 
hardening purpose it would be better to use the version you just suggested.

Bertrand, Stefano, what do you think?

Cheers,

-- 
Julien Grall

