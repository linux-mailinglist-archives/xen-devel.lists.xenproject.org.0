Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D64C47B9BF3
	for <lists+xen-devel@lfdr.de>; Thu,  5 Oct 2023 10:54:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612898.953057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoK7r-0004Zi-3p; Thu, 05 Oct 2023 08:54:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612898.953057; Thu, 05 Oct 2023 08:54:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoK7r-0004We-0e; Thu, 05 Oct 2023 08:54:31 +0000
Received: by outflank-mailman (input) for mailman id 612898;
 Thu, 05 Oct 2023 08:54:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qoK7p-0004WY-JB
 for xen-devel@lists.xenproject.org; Thu, 05 Oct 2023 08:54:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qoK7o-000765-5F; Thu, 05 Oct 2023 08:54:28 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qoK7n-0001W9-Ux; Thu, 05 Oct 2023 08:54:28 +0000
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
	bh=ojfqp12KWo82cHajhFCiUWMhKH9QWKEvENq+6a4GJzg=; b=p41JGdKwvWOvzpYgUhf2fZ/fq6
	Z+/8XVvMxUokoMSU1OrfRgotpGFO6fgfVVaU2GSwL+OUtVjoNvHzhhngj+Vq9QYjHuoN35Tl61fSG
	HvxteTISoVVwTNtS2b0b1eWBwXmi2H+IJgE9YrnCZs3FzibVU9pXbFDjGeVyNPIQ5124=;
Message-ID: <b740572e-df22-449b-8c90-a155292b2e69@xen.org>
Date: Thu, 5 Oct 2023 09:54:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Issue with shared information page on Xen/ARM 4.17
Content-Language: en-GB
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <ZRvQNKyYpLDVTs0i@MacBookPdeRoger>
 <ZRxpC7ukhiYvzz5m@mattapan.m5p.com> <ZR0erl_OSkNgIQjx@MacBookPdeRoger>
 <c0b67401-dfe5-475f-8640-b66ac32a80fb@xen.org>
 <ZR1gM19i6-vBaXh7@MacBookPdeRoger>
 <b00500ae-76b1-441c-8154-bcdd897734dc@xen.org>
 <ZR1rBP_49Y2V8VF6@MacBookPdeRoger>
 <fe94dcd2-4429-48df-8ebd-59563d43796a@xen.org>
 <ZR18dlMAbCwEOeH4@MacBookPdeRoger>
 <f8242725-7ee0-4fca-a608-d234f8f3b564@xen.org>
 <ZR3VidifMWdjDQcv@mattapan.m5p.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ZR3VidifMWdjDQcv@mattapan.m5p.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/10/2023 22:13, Elliott Mitchell wrote:
>>> I understand the situation is different on Arm vs x86, so if
>>> edk2 is not supported on arm I guess it doesn't matter much whether
>>> it's broken.  It would be a much worse issue on x86 where edk2 is
>>> supported.
>>
>> AFAIK, we have CI for x86 on EDK2 but we don't on Arm.
> 
> What is the current status of this?  I'm unsure whether it was an extra
> patch done by Debian, but "edk2-stable202211"/fff6d81270 doesn't work
> with Xen/Qemu.

I don't know what's the status for x86. But for Arm, there are nothing. 
And as I pointed out in my previous answer this is unlikely to change 
until someone invest time in EDK2 on Xen on Arm.

If there are patches sent on the ML, then I am happy to attempt to 
review them. But I am afraid, I am not going to have time to try to find 
and fix all the issues when using EDK2 in Arm guests.

Cheers,

-- 
Julien Grall

