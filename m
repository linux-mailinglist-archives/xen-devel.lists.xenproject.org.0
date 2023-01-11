Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDFD666244
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 18:49:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475683.737460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFfDb-0000sA-6p; Wed, 11 Jan 2023 17:48:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475683.737460; Wed, 11 Jan 2023 17:48:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFfDb-0000pa-3T; Wed, 11 Jan 2023 17:48:55 +0000
Received: by outflank-mailman (input) for mailman id 475683;
 Wed, 11 Jan 2023 17:48:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pFfDY-0000pQ-TV
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 17:48:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pFfDY-0006r9-5g; Wed, 11 Jan 2023 17:48:52 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.5.208]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pFfDX-0000TV-ND; Wed, 11 Jan 2023 17:48:51 +0000
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
	bh=hFdyGGRIGPGTdIo6+1cWsTsw+9Ohkpo48FAwiLTbEiM=; b=YX5IoEuFCotJcph4MvfYhCiTx6
	snYuEVlzWX1/2NaXSMJYGmgjfwjYWSetKGF49I+twJ7w1voQtD2QTmtlRXB88MoLzPAES5hIqhdqm
	aIvJLv467iv4y/HT/Ee323Ea4x/jXHdIfJ5owFPwbO5mpbRFb/hhkarr4xr6YL3sJagQ=;
Message-ID: <e9eeee72-ecd1-faaa-dc63-b57d50162bbf@xen.org>
Date: Wed, 11 Jan 2023 17:48:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 10/19] tools/xenstore: change per-domain node
 accounting interface
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20221213160045.28170-1-jgross@suse.com>
 <20221213160045.28170-11-jgross@suse.com>
 <da814fed-c177-b0ee-32be-ef0656692c82@xen.org>
 <05871696-1638-82d0-8d55-9088b4bb9a18@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <05871696-1638-82d0-8d55-9088b4bb9a18@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 11/01/2023 08:59, Juergen Gross wrote:
>> ... to make sure domain_nbentry_add() is not returning a negative 
>> value. Then it would not work.
>>
>> A good example imagine you have a transaction removing nodes from tree 
>> but not adding any. Then the "ret" would be negative.
>>
>> Meanwhile the nodes are also removed outside of the transaction. So 
>> the sum of "d->nbentry + ret" would be negative resulting to a failure 
>> here.
> 
> Thanks for catching this.
> 
> I think the correct way to handle this is to return max(d->nbentry + 
> ret, 0) in
> domain_nbentry_add(). The value might be imprecise, but always >= 0 and 
> never
> wrong outside of a transaction collision.

I am bit confused with your proposal. If the return value is imprecise, 
then what's the point of returning max(...) instead of simply 0?

Cheers,

-- 
Julien Grall

