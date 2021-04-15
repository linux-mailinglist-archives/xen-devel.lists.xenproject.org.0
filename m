Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F2F360BBB
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 16:23:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111264.212791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX2tU-00088u-JS; Thu, 15 Apr 2021 14:22:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111264.212791; Thu, 15 Apr 2021 14:22:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX2tU-00088W-G5; Thu, 15 Apr 2021 14:22:56 +0000
Received: by outflank-mailman (input) for mailman id 111264;
 Thu, 15 Apr 2021 14:22:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lX2tT-00088H-4o
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 14:22:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lX2tS-0001QP-6e; Thu, 15 Apr 2021 14:22:54 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lX2tS-0006YT-0N; Thu, 15 Apr 2021 14:22:54 +0000
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
	bh=Ruvd+8zvkdIsMnH5VGmqt0lchqWBosqLUo+AkEVEfgE=; b=ON41oBqNX+yYWkoPF+bTBRdJyU
	O+qtfkrbhoSlQTJwO4buUjVH/ewsUFttIko2yKgCSn5TLixC8mS7EWLggiIGEzMO+ACDj+gtUv/zx
	2qb9g+a1qMkJF8Fyl022GF1czvBfyrEQ1G4Ye98C4OglBqi6XXw3ncUCsiYRYDjjFJKY=;
Subject: Re: [PATCH v3 13/15] unzstd: replace INIT{,DATA} and STATIC
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2db91183-a7de-0c43-2fef-feb3523ed19b@suse.com>
 <19f12930-df0e-5a00-9e5e-53edffcf51d7@suse.com>
 <467ed62e-e5c3-0a08-b9a7-5b4e913b3c90@xen.org>
 <e1d08ced-c2e8-22e3-2da3-8116b69cb627@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e861b617-7b9f-317d-9941-0fd7577147cb@xen.org>
Date: Thu, 15 Apr 2021 15:22:52 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <e1d08ced-c2e8-22e3-2da3-8116b69cb627@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 15/04/2021 15:21, Jan Beulich wrote:
> On 15.04.2021 13:59, Julien Grall wrote:
>> On 26/01/2021 09:52, Jan Beulich wrote:
>>> With xen/common/decompress.h now agreeing in both build modes about
>>> what STATIC expands to, there's no need for this abstraction anymore.
>>
>> Shouldn't you also mention "INIT" and "INITDATA" here?
> 
> Two parts: INITDATA was mistakenly mentioned in the title. I've
> dropped that. 

Ok.

And what I'm saying about STATIC does not apply to
> INIT - for it, we replace the extra level of abstraction by
> directly using __init, just like was done in the earlier patches.

This should be mention in the commit message.

Cheers,

-- 
Julien Grall

