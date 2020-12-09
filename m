Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1532D44CC
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 15:52:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48365.85512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn0p0-0002Qp-BI; Wed, 09 Dec 2020 14:52:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48365.85512; Wed, 09 Dec 2020 14:52:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn0p0-0002QQ-8B; Wed, 09 Dec 2020 14:52:02 +0000
Received: by outflank-mailman (input) for mailman id 48365;
 Wed, 09 Dec 2020 14:52:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kn0oy-0002QJ-CG
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 14:52:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kn0ov-0001xh-7f; Wed, 09 Dec 2020 14:51:57 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kn0ou-0001Hq-VZ; Wed, 09 Dec 2020 14:51:57 +0000
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
	bh=+K/zvjpkueRPcqVCGHkSj5uY/mkKXh2WurdDiBo7FZA=; b=JcNfUb/UQ0kLzfBYmLWwU+onJ8
	Zoml+n1cxepyeT0S1QQ3AghPm+wDXpongSNNG8lQHSltrCCSND4BiCL9zFxZ0Uc3YCgwdEeiJ66EB
	nMtaYaU4JvP6kNNWHvG8KHeAJ4yLZUl/i/XusOVKjb0hII8LVy2Pkdkumtmq5NOxs8Nw=;
Subject: Re: [PATCH v3 0/8] xen: beginnings of moving library-like code into
 an archive
To: Jan Beulich <jbeulich@suse.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>
References: <1a6bac6a-7d83-f5b6-c5b9-8b3b39824d40@suse.com>
 <509B2BDB-A226-4328-A75E-33AAF74BE45B@arm.com>
 <41587b00-2899-65a6-3867-97664529fdab@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <6d56c227-2828-22fc-61a9-ae836ada805a@xen.org>
Date: Wed, 9 Dec 2020 14:51:54 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <41587b00-2899-65a6-3867-97664529fdab@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 09/12/2020 14:47, Jan Beulich wrote:
> On 09.12.2020 12:33, Bertrand Marquis wrote:
>> I will review this today, sorry for the delay.
> 
> Thanks for the reviews, and no problem at all. Since iirc it was
> you who asked on the last community call, I wanted to point out
> that despite your reviews and despite Wei's acks the series
> still won't be able to go in, because patches 2 and 3 are still
> lacking Arm maintainer acks.

I am waiting on Anthony's input before giving my ack on patch 2. I am 
not sure whether he is already on holidays.

Cheers,

-- 
Julien Grall

