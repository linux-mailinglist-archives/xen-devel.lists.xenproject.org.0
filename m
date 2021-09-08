Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50859403511
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 09:16:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181526.328680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNro5-0001fC-Sq; Wed, 08 Sep 2021 07:15:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181526.328680; Wed, 08 Sep 2021 07:15:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNro5-0001cv-Pj; Wed, 08 Sep 2021 07:15:41 +0000
Received: by outflank-mailman (input) for mailman id 181526;
 Wed, 08 Sep 2021 07:15:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bk/O=N6=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1mNro4-0001cp-0O
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 07:15:40 +0000
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5270bb18-20b0-4a0e-84d0-487559756e76;
 Wed, 08 Sep 2021 07:15:37 +0000 (UTC)
Received: from 76-24-144-85.ftth.glasoperator.nl ([85.144.24.76]:59650
 helo=[172.16.1.50]) by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <linux@eikelenboom.it>)
 id 1mNrnq-0003D7-Vf; Wed, 08 Sep 2021 09:15:27 +0200
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
X-Inumbo-ID: 5270bb18-20b0-4a0e-84d0-487559756e76
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:References:To:From:Subject:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bqLBZYZf+OGSwmIWDrkm11xoKqUhXHfSvj8/ddCAhHY=; b=f+l7brMEK28eKiSLveWpl+GucP
	KwotBj40F1WcwLc34Kyaj+9/tr19Gu+v1hWtzJpIpA9ffFj9P+fivlaGcF4cBrxIndrefuz2FvspB
	ZOI5n0APGJAAfHPLkTij9pEJJ+zUHLgJWGv+kLPG8VjzCrmqFoP9nYikM7eSRR/RfBos=;
Subject: Re: xen-unstable linux-5.14: 1 of 2 multicall(s) failed: cpu 0
From: Sander Eikelenboom <linux@eikelenboom.it>
To: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9c36205e-cc37-ed9a-3408-0cccc4a83115@eikelenboom.it>
 <955da8ce-40f2-32c5-ee78-6801ce18afe5@suse.com>
 <b0854555-01fd-cbd8-6e6a-c793109b2972@eikelenboom.it>
Message-ID: <f38766b1-9b6b-e301-93e4-12f3cce618b0@eikelenboom.it>
Date: Wed, 8 Sep 2021 09:15:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <b0854555-01fd-cbd8-6e6a-c793109b2972@eikelenboom.it>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: nl-NL
Content-Transfer-Encoding: 8bit

On 07/09/2021 21:52, Sander Eikelenboom wrote:
> On 07/09/2021 15:53, Juergen Gross wrote:
>> On 06.09.21 23:35, Sander Eikelenboom wrote:
>>> L.S.,
>>>
>>> On my AMD box running:
>>>        xen-unstable changeset: Fri Sep 3 15:10:43 2021 +0200 git:2d4978ead4
>>>        linux kernel: 5.14.1
>>>
>>> With this setup I'm encountering some issues in dom0, see below.
>>
>> Could you test whether the attached patch (only compile tested)
>> fixes the issue for you?
>>
>>
>> Juergen
>>
> 
> Sure, running it now.
> Since I haven't got a clear trigger, will report tomorrow if the logs stay clean :)
> 
> Thanks so far !
> 
> --
> Sander
> 
> 

Hi Juergen,

So far so good, it survived the night without issues.
So I think you can add a Tested-By.

Thanks for the swift fix !

--
Sander

