Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2786A6F3C
	for <lists+xen-devel@lfdr.de>; Wed,  1 Mar 2023 16:21:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504100.776626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXOGa-0006KB-Hm; Wed, 01 Mar 2023 15:21:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504100.776626; Wed, 01 Mar 2023 15:21:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXOGa-0006H7-F0; Wed, 01 Mar 2023 15:21:16 +0000
Received: by outflank-mailman (input) for mailman id 504100;
 Wed, 01 Mar 2023 15:21:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pXOGZ-0006H1-TB
 for xen-devel@lists.xenproject.org; Wed, 01 Mar 2023 15:21:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pXOGZ-0001w8-8L; Wed, 01 Mar 2023 15:21:15 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=[192.168.13.48]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pXOGZ-0004gg-0z; Wed, 01 Mar 2023 15:21:15 +0000
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
	bh=N1p9UC7XCOx6iLTYUzJiSqn6DH20zT00dDaFvd4YArU=; b=qW2xcVB9wEacZxUgCRSEHd/PWK
	sfqC1A1UNJEthHpTplgohBTrPowEjtkRAHozlpOUZRMZcWXqO3veeZdumIZ4J9LqdrNNfDpw5ubdq
	nMlcIOVu4bwhikipcMFwuMsny6zGnEJJGmlRmsVBJFwgXBgP73njA20vWzo1Sa+8OyfU=;
Message-ID: <0fd10ac8-6110-8299-b2b1-5e46e0c7b14a@xen.org>
Date: Wed, 1 Mar 2023 15:21:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 3/4] xen/arm: switch ARM to use generic implementation
 of bug.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1677233393.git.oleksii.kurochko@gmail.com>
 <d80c136720c156d6ef83f27f1ce8dca5dba5b5a0.1677233393.git.oleksii.kurochko@gmail.com>
 <f82b8c50-47f2-d8b0-5a2c-60203e5d5e26@xen.org>
 <ae96eb36-aeba-86f0-3b72-a8b62f4dce60@xen.org>
 <6735859208c6dcb7320f89664ae298005f70827b.camel@gmail.com>
 <75df5a86-5d64-d219-c25c-644748a88302@xen.org>
 <3f108af54c7d824f59a7dc1daf7d4d0c23f617ec.camel@gmail.com>
 <297fb314-7752-fdf6-3003-f5bd1396c1e3@xen.org>
 <bb5105f462a79bc0136348302407574f1d9f792b.camel@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <bb5105f462a79bc0136348302407574f1d9f792b.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 01/03/2023 15:16, Oleksii wrote:
> On Wed, 2023-03-01 at 13:58 +0000, Julien Grall wrote:
>> On 01/03/2023 12:31, Oleksii wrote:
>> Given this is an alignment issue (Arm32 is more sensible to this than
>> the other architecture, but this is still a potential problem for the
>> other archs), I would really like to understand whether this is an
>> issue
>> in the common code or in the Arm linker script.
> I have a good news.
> 
> Alignment of "*(.proc.info)" helps but I checked only yocto-qemuarm:
> https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/792923264
> 
> I ran all tests here:
> https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/792953524
> 
> Should I create a separate patch with ALIGN if the tests are passed?

Yes please. But, to be honest, I am not entirely sure what is not 
aligned before hand. Do you know if it is possible to download the Xen 
binary from gitlab?

Cheers,

-- 
Julien Grall

