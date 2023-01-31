Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 431616838BB
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 22:34:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487876.755648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMyGv-0005oG-NS; Tue, 31 Jan 2023 21:34:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487876.755648; Tue, 31 Jan 2023 21:34:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMyGv-0005ls-Js; Tue, 31 Jan 2023 21:34:33 +0000
Received: by outflank-mailman (input) for mailman id 487876;
 Tue, 31 Jan 2023 21:34:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pMyGu-0005lm-MG
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 21:34:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMyGr-0006KB-O1; Tue, 31 Jan 2023 21:34:29 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMyGr-0005tz-Hv; Tue, 31 Jan 2023 21:34:29 +0000
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
	bh=zx0GRjSnpNH7/j7W/En1PLZ3/bIiWZCovpNh5+xXDMg=; b=JqKoyaf92H6NKfjFn5H3VwJYtS
	HoA/5sSSIJ4tOuBFnJ1mtphtHN+gAxUUcR0drt5YU22PqDg37xGNBtSu6w/8PItp6dDhk9zT14uJJ
	DbD3q1pEub9/oAbozMxZvdMRAkPw+jc1bE4KYAl+H1uuxP62CLp8b4CQXm7mZkJhKvi0=;
Message-ID: <c68840af-0173-1408-a9a9-ac5ebacee4e9@xen.org>
Date: Tue, 31 Jan 2023 21:34:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] xen/common: rwlock: Constify the parameter of
 _rw_is{,_write}_locked()
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230130182858.86886-1-julien@xen.org>
 <9dc52d71-4148-0c16-d153-3ebcd1a9c754@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <9dc52d71-4148-0c16-d153-3ebcd1a9c754@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 31/01/2023 09:34, Jan Beulich wrote:
> On 30.01.2023 19:28, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> The lock is not meant to be modified by _rw_is{,_write}_locked(). So
>> constify it.
>>
>> This is helpful to be able to assert if the lock is taken when the
>> underlying structure is const.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> (maybe also Requested-by)

I will add a requested-by while committing (waiting for a push before 
doing it).

Cheers,

-- 
Julien Grall

