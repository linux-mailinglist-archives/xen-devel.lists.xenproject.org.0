Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 300EF387AB2
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 16:09:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129261.242665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj0PS-000238-Vk; Tue, 18 May 2021 14:09:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129261.242665; Tue, 18 May 2021 14:09:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj0PS-00021D-SE; Tue, 18 May 2021 14:09:22 +0000
Received: by outflank-mailman (input) for mailman id 129261;
 Tue, 18 May 2021 14:09:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lj0PQ-000213-F9
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 14:09:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lj0PQ-0004HE-9Z; Tue, 18 May 2021 14:09:20 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lj0PQ-0002Uw-3m; Tue, 18 May 2021 14:09:20 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=8VzoNuSMnkdjcHIDa7TdMHySCUtujRo8+2Q4ZI57YSU=; b=GWeCIJBse188UdY5LN3vc66NDl
	NSGBTjrlPdjiUZzzauAUjKAeHGuELjsUSm264+K6wQsyX1QeRcpp//yUooaQEYEU+MBNYYFTiQDe0
	NkJdBbaK+H4IpDuFvgXcZRBQknh+I56iQMazFckfeXnDuh2kATpZo5Upz6m0voaYlM2U=;
Subject: Re: Discussion of Xenheap problems on AArch64
To: Henry Wang <Henry.Wang@arm.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Chen <Wei.Chen@arm.com>, Penny Zheng <Penny.Zheng@arm.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <PA4PR08MB6253F49C13ED56811BA5B64E92479@PA4PR08MB6253.eurprd08.prod.outlook.com>
 <cdde98ca-4183-c92b-adca-801330992fc5@xen.org>
 <PA4PR08MB62538BBA256E66A0415F0C7192479@PA4PR08MB6253.eurprd08.prod.outlook.com>
 <f14aa1d6-35d2-a9a3-0672-7f0d3ae3ec89@xen.org>
 <PA4PR08MB62534C4130B59CAA9A8A8BF792419@PA4PR08MB6253.eurprd08.prod.outlook.com>
 <PA4PR08MB6253FBC7F5E690DB74F2E11F92409@PA4PR08MB6253.eurprd08.prod.outlook.com>
 <2a65b8c0-fccc-2ccc-f736-7f3f666e84d1@xen.org>
 <PA4PR08MB62537A958107CD234831E0B892579@PA4PR08MB6253.eurprd08.prod.outlook.com>
 <ba649865-410b-e1be-39a3-c4cac802f464@xen.org>
 <PA4PR08MB6253F85E184CA51BDB99786992539@PA4PR08MB6253.eurprd08.prod.outlook.com>
 <ba1bc084-5a5b-1410-acba-33bfca7c4f6a@xen.org>
 <PA4PR08MB6253E95579D8277D7FD1BE9A92509@PA4PR08MB6253.eurprd08.prod.outlook.com>
 <7247122c-127d-705c-78a5-7f9460f5821a@xen.org>
 <PA4PR08MB6253AB1B1286086E4EDE60A2922D9@PA4PR08MB6253.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <5cebec6d-0e41-f47f-0a8d-9b96b886c53e@xen.org>
Date: Tue, 18 May 2021 15:09:18 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <PA4PR08MB6253AB1B1286086E4EDE60A2922D9@PA4PR08MB6253.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Henry,

On 17/05/2021 07:38, Henry Wang wrote:
> 
>> From: Julien Grall <julien@xen.org>
>> On a previous e-mail, you said you tweaked the FVP model to set those
>> regions. Were you trying to mimick the memory layout of a real HW
>> (either current or future)?
> 
> Not really, I was just trying to cover as many cases as possible and these
> regions were just picked for testing your patchset in different scenarios.

Thanks for the confirmation. It means we don't have to fix it right now. :).

Cheers,

-- 
Julien Grall

