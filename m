Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4595B187E
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 11:23:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403000.644987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWDkT-0007hW-AM; Thu, 08 Sep 2022 09:23:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403000.644987; Thu, 08 Sep 2022 09:23:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWDkT-0007dT-6t; Thu, 08 Sep 2022 09:23:01 +0000
Received: by outflank-mailman (input) for mailman id 403000;
 Thu, 08 Sep 2022 09:22:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oWDkR-0007am-8V
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 09:22:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oWDkM-0003VG-Rf; Thu, 08 Sep 2022 09:22:54 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.18.179]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oWDkM-0007SO-Ky; Thu, 08 Sep 2022 09:22:54 +0000
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
	bh=DkZM9ZotacWR4WekOPMrFlZGSL+Yo1bxNgSekD9OXBw=; b=OFEymdo0DAa5PuCxMMjrDI7ekS
	cabB4g25PTDshTBZ7UVJbt5UWsGOI4SzgW4aM7UldJIkWH3Hk7P5hvVSpWEqeCAuoO6ZaWSi4AQWl
	0l33TZfGwVGL5ciU3OxIJRxDLlYKqa7E+xxBHluI+fnGuJTEB3QrD158ogCjOPJomdIs=;
Message-ID: <c7e03ea3-468e-ef97-d701-0f4a7f83a013@xen.org>
Date: Thu, 8 Sep 2022 10:22:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v2 2/2] live migration: use superpages for physmap
 population on restore when possible
Content-Language: en-US
To: Olaf Hering <olaf@aepfle.de>, Jan Beulich <jbeulich@suse.com>
Cc: Andrei Semenov <andrei.semenov@vates.fr>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1662457291.git.andrei.semenov@vates.fr>
 <657d6dad39f4ab87569470c94afb4cc6d005e829.1662457291.git.andrei.semenov@vates.fr>
 <c21d6f74-a05f-e121-3b3c-c8c7fd08bb58@suse.com>
 <20220907094517.218e8709.olaf@aepfle.de>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220907094517.218e8709.olaf@aepfle.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Olaf,

On 07/09/2022 08:45, Olaf Hering wrote:
> Wed, 7 Sep 2022 09:40:41 +0200 Jan Beulich <jbeulich@suse.com>:
> 
>> Olaf - I recall you've done some similar work before. Do you have any
>> thoughts here, perhaps going as far as merging your and Andrei's work?
> 
> > My variant is in the archives, for reference.

You are referring to [1], is that correct?

 > I have no hope that any such work will be merged.

Is this because it was lack of review or are there any technical 
difficulties/disagreements?

If the former, this is not unsolvable. Depending on which approach we 
go, one of you could review the series of the other.

With my AWS hat on, I would also be interested with the optimization in 
the LM code. So I would be willing to help reviewing it. That said, I 
can't promise any in-depth review before 4.17 is out.

Cheers,

[1] https://lore.kernel.org/xen-devel/20210713180605.12096-1-olaf@aepfle.de

-- 
Julien Grall

