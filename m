Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C20234C2EC1
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 15:57:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278349.475560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNFYc-0003Y7-Nn; Thu, 24 Feb 2022 14:57:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278349.475560; Thu, 24 Feb 2022 14:57:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNFYc-0003Vm-Kl; Thu, 24 Feb 2022 14:57:26 +0000
Received: by outflank-mailman (input) for mailman id 278349;
 Thu, 24 Feb 2022 14:57:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nNFYb-0003Va-Dw
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 14:57:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nNFYb-0007tE-4v; Thu, 24 Feb 2022 14:57:25 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225] helo=[10.7.239.15])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nNFYa-00009p-VO; Thu, 24 Feb 2022 14:57:25 +0000
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
	bh=xN44zTEGexWQoSVGQ2gdhImddspwnroyGtYceSVk6bk=; b=2S+SyKTmhNnB7WndeyfZTntLgG
	ESM654DtshuLE8aaaB0Lxfvk1iY9gFF/bzriH16/oLpF8BdmpvCKB6lS+R7y35tyGQ3rQCfi7b1aV
	KOk78/KQ4Zo/arwlYTjt1Rnphm+h1PubYFr85AuQE63oZfg5gXDizh89jYaFg635P16I=;
Message-ID: <79604328-4e3b-49f9-35ab-afe9afa40d64@xen.org>
Date: Thu, 24 Feb 2022 14:57:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH] xen/mm: Remove always true ASSERT() in free_heap_pages()
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <jgrall@amazon.com>, George Dunlap
 <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220223183831.5951-1-julien@xen.org>
 <a3f52f29-3280-89b6-5db5-de224dd037cc@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a3f52f29-3280-89b6-5db5-de224dd037cc@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 23/02/2022 19:30, Andrew Cooper wrote:
> On 23/02/2022 18:38, Julien Grall wrote:
>> From: Julien Grall<jgrall@amazon.com>
>>
>> free_heap_pages() has an ASSERT() checking that node is >= 0. However
>> node is defined as an unsigned int. So it cannot be negative.
>>
>> Therefore remove the check as it will always be true.
> 
> Coverity-ID: 1055631

I will add it while committing.

> 
>> Signed-off-by: Julien Grall<jgrall@amazon.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks!

Cheers,

-- 
Julien Grall

