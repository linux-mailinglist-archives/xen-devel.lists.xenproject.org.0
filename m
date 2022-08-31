Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A3D5A8681
	for <lists+xen-devel@lfdr.de>; Wed, 31 Aug 2022 21:13:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396012.635953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTT8c-0004Dk-Jm; Wed, 31 Aug 2022 19:12:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396012.635953; Wed, 31 Aug 2022 19:12:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTT8c-0004B5-Fq; Wed, 31 Aug 2022 19:12:34 +0000
Received: by outflank-mailman (input) for mailman id 396012;
 Wed, 31 Aug 2022 19:12:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oTT8b-0004Az-HW
 for xen-devel@lists.xenproject.org; Wed, 31 Aug 2022 19:12:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oTT8b-0005K1-4Z; Wed, 31 Aug 2022 19:12:33 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oTT8a-0003z7-Uv; Wed, 31 Aug 2022 19:12:33 +0000
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
	bh=b0VV37p/m0/Xb6ug4BmezHXt+9vT8mTyUogv17NfPes=; b=JvkKdzDdjAFWhNqGy4p68NjiVT
	iHiI6doo6UV6l4F17nt5B59nlNwUHrxoVa1yY6YazY5/gBreTywrktmADAUcvdkTq7VjVqC/WkAm4
	RUQzbDxAV84ovxkZzdCBNsW2aV5Je46Hc9ISNqkcehdTQQTgATioBZhcwAnqfpf/vvns=;
Message-ID: <5bf088d6-6571-063d-6e33-dddb08309241@xen.org>
Date: Wed, 31 Aug 2022 20:12:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH 7/7] xen/arm32: traps: Dump more information for
 hypervisor data abort
To: Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220812192448.43016-1-julien@xen.org>
 <20220812192448.43016-9-julien@xen.org>
 <AS8PR08MB799170A0EF051DE12565D9D992689@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <15023215-6697-112b-2bc6-8ec7880a9704@xen.org>
 <AS8PR08MB79916319A3B57AE6D255A5C4926B9@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AS8PR08MB79916319A3B57AE6D255A5C4926B9@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/08/2022 04:29, Henry Wang wrote:
> Hi Julien,

Hi Henry,

Sorry for the late reply.

> 
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Subject: Re: [PATCH 7/7] xen/arm32: traps: Dump more information for
>> hypervisor data abort
>> Hmmm... I dropped a patch from the series and it looks like I didn't
>> properly clean the directory before doing that. Please ignore patch #8.
> 
> Sure, I guess the patch that you dropped is this one?
> https://patchwork.kernel.org/project/xen-devel/patch/20220812192448.43016-8-julien@xen.org/

That's correct.

Cheers,

-- 
Julien Grall

