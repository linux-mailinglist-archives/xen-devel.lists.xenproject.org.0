Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F051988DC7F
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 12:28:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698436.1090071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpRRe-0007Qg-DW; Wed, 27 Mar 2024 11:27:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698436.1090071; Wed, 27 Mar 2024 11:27:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpRRe-0007O9-A5; Wed, 27 Mar 2024 11:27:50 +0000
Received: by outflank-mailman (input) for mailman id 698436;
 Wed, 27 Mar 2024 11:27:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0gLn=LB=kernel.org=hawk@srs-se1.protection.inumbo.net>)
 id 1rpRRc-0007O3-VB
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 11:27:48 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0931044f-ec2d-11ee-afe3-a90da7624cb6;
 Wed, 27 Mar 2024 12:27:47 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4B20161511;
 Wed, 27 Mar 2024 11:27:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 350A4C433C7;
 Wed, 27 Mar 2024 11:27:44 +0000 (UTC)
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
X-Inumbo-ID: 0931044f-ec2d-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711538866;
	bh=oaApo/srU9FnnVLasNCPU6Vc3zmFm7lgY/ipcvsqNPY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=H4E0GlH9HUEweYrzsTAO2HPHRXXGBEpZs6yN6KVA3hT8kwEw+Ubf+Ljq5UQJPX37Y
	 FlPwaJVTKU2NW1xFHlwVRbskKd5mGgy2icPiOAZ+1U1kUuUAh8ZSFYC9y4+pIC+dU1
	 Ym9Xukbk8XELkNE78cJicLOiYBCc5oZEBrhtmx8Iaswogyd2wMEnssPxjMEPzm5c/h
	 2dKu5vngwLbAW+CqR6W1XdjJjyZgqkGdVfIO4ASqGzzPWgivqliMmaBOg3yx9dNvR6
	 AhQY2/Sq3ce2spg/yt0GB8rlJPMlw3X6bkgHhhKYMkvr5hjZ1J+UMNYdwjbxbNhkdB
	 L7itUDvOgcGWw==
Message-ID: <ba4ac0f4-7a95-4fb2-b128-d7b248e4137a@kernel.org>
Date: Wed, 27 Mar 2024 12:27:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen NIC driver have page_pool memory leaks
To: paul@xen.org, Arthur Borsboom <arthurborsboom@gmail.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc: Netdev <netdev@vger.kernel.org>, Wei Liu <wei.liu@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 kda@linux-powerpc.org
References: <CALUcmUncphE8v8j1Xme0BcX4JRhqd+gB0UUzS-U=3XXw_3iUiw@mail.gmail.com>
 <1cde0059-d319-4a4f-a68d-3b3ffeb3da20@kernel.org>
 <857282f5-5df6-4ed7-b17e-92aae0cf484a@xen.org>
Content-Language: en-US
From: Jesper Dangaard Brouer <hawk@kernel.org>
In-Reply-To: <857282f5-5df6-4ed7-b17e-92aae0cf484a@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 25/03/2024 13.33, Paul Durrant wrote:
> On 25/03/2024 12:21, Jesper Dangaard Brouer wrote:
>> Hi Arthur,
>>
>> (Answer inlined below, which is custom on this mailing list)
>>
>> On 23/03/2024 14.23, Arthur Borsboom wrote:
>>> Hi Jesper,
>>>
>>> After a recent kernel upgrade 6.7.6 > 6.8.1 all my Xen guests on Arch
>>> Linux are dumping kernel traces.
>>> It seems to be indirectly caused by the page pool memory leak
>>> mechanism, which is probably a good thing.
>>>
>>> I have created a bug report, but there is no response.
>>>
>>> https://bugzilla.kernel.org/show_bug.cgi?id=218618
>>>
>>> I am uncertain where and to whom I need to report this page leak.
>>> Can you help me get this issue fixed?
>>
>> I'm the page_pool maintainer, but as you say yourself in comment 2 then
>> since dba1b8a7ab68 ("mm/page_pool: catch page_pool memory leaks") this
>> indicated there is a problem in the xen_netfront driver, which was
>> previously not visible.
>>
>> Cc'ing the "XEN NETWORK BACKEND DRIVER" maintainers, as this is a driver
>> bug.  What confuses me it that I cannot find any modules named
>> "xen_netfront" in the upstream tree.
>>
> 
> You should have tried '-' rather than '_' :-)
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/xen-netfront.c
> 

Looking at this driver, I think it is missing a call to 
skb_mark_for_recycle().

I'll will submit at patch for this, with details for stable maintainers.

As I think it dates back to v5.9 via commit 6c5aa6fc4def ("xen
networking: add basic XDP support for xen-netfront"). I think this
commit is missing a call to page_pool_release_page()
between v5.9 to v5.14, after which is should have used
skb_mark_for_recycle().

Since v6.6 the call page_pool_release_page() were removed (in
535b9c61bdef ("net: page_pool: hide page_pool_release_page()") and
remaining callers converted (in commit 6bfef2ec0172 ("Merge branch
'net-page_pool-remove-page_pool_release_page'")).

This leak became visible in v6.8 via commit dba1b8a7ab68 ("mm/page_pool:
catch page_pool memory leaks").

--Jesper

