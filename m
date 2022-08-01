Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6135866EA
	for <lists+xen-devel@lfdr.de>; Mon,  1 Aug 2022 11:39:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.378635.611931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIRt0-0003GK-6b; Mon, 01 Aug 2022 09:38:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 378635.611931; Mon, 01 Aug 2022 09:38:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIRt0-0003DP-3M; Mon, 01 Aug 2022 09:38:54 +0000
Received: by outflank-mailman (input) for mailman id 378635;
 Mon, 01 Aug 2022 09:38:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oIRsy-0003DE-4e
 for xen-devel@lists.xenproject.org; Mon, 01 Aug 2022 09:38:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oIRss-0007CV-Dx; Mon, 01 Aug 2022 09:38:46 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.0.187])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oIRss-0002tO-7t; Mon, 01 Aug 2022 09:38:46 +0000
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
	bh=qOlPD6f9eDKHdEA9sWvBfhAyfbriKuSdKhUJ16Rvd78=; b=z2Z1UttMa7D7lVEFRl0g2bnKiO
	VocAnM9tNH7Li6y2//kTnoPFsvexPpB6GaWp3H49lD9kBONWkEVL4IRgN2/xYPTpa9n/YHLotWXlo
	D5u30BOH0P9jOzRFDUKAx8xtiW6PCWQOjQbES8KqCh2Hz3JHTLn5mRrYIFt/P64ET4Z0=;
Message-ID: <b9b3a07d-a24d-deac-c812-7393554407e4@xen.org>
Date: Mon, 1 Aug 2022 10:38:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.0
Subject: Re: [xen-unstable-smoke bisection] complete build-amd64-libvirt
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Henry Wang <Henry.Wang@arm.com>
References: <E1oHEQO-0008GA-Uo@osstest.test-lab.xenproject.org>
 <08606914-f5f4-8415-51a2-f6a5e1c54d20@suse.com>
 <db39670c-7e36-2cf5-a87b-92d10d3aac18@xen.org>
 <7bcf8fac-df56-2032-0057-2b7c671e59be@suse.com>
 <16b1c490-1d8f-1c35-496a-a60fb1404fc3@xen.org>
 <230338bf-b709-f2dd-bc8f-80052e98233b@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <230338bf-b709-f2dd-bc8f-80052e98233b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 01/08/2022 10:06, Jan Beulich wrote:
> On 01.08.2022 10:43, Julien Grall wrote:
>> If we don't force push, we have two solutions:
>>     1) Revert Oleksandr's series
>>     2) Leave it until we have Osstest fixed *and* Oleksandr's patch
>> reached libvirt.
>>
>> The former is not an option for me, because Oleksandr's series is not at
>> fault. So this leave us to 2).
>>
>> So what's your proposal?
> 
> It's still 1), no matter that I agree that Oleksandr's series is not
> directly at fault.

My worry is while we have a plan to address the libvirt issues, I am not 
confident this could be addressed by Xen 4.17. In particular, Osstest 
has to be fixed and we need a push.

I think this is a bit unfair to block the virtio series on the recent 
lack of investment in libvirt testing.

So if we end up to revert it, this will need to be a block for Xen 4.17.

Cheers,

-- 
Julien Grall

