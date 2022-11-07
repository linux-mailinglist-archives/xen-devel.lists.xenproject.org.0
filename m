Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD41661FDA3
	for <lists+xen-devel@lfdr.de>; Mon,  7 Nov 2022 19:34:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439577.693612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1os6vl-0005Nx-Hi; Mon, 07 Nov 2022 18:33:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439577.693612; Mon, 07 Nov 2022 18:33:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1os6vl-0005Km-Ey; Mon, 07 Nov 2022 18:33:09 +0000
Received: by outflank-mailman (input) for mailman id 439577;
 Mon, 07 Nov 2022 18:33:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1os6vk-0005Kg-CW
 for xen-devel@lists.xenproject.org; Mon, 07 Nov 2022 18:33:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1os6vj-0006Bq-MB; Mon, 07 Nov 2022 18:33:07 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.25.99]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1os6vj-0003et-Fi; Mon, 07 Nov 2022 18:33:07 +0000
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
	bh=Y96JbSM4Gk15Hb6YVWWY5bxC6V80qkCX+2mMpd9aWiw=; b=a7Kbs0Om37DK9Jx3aTJNt0aaJ1
	fH/mQteTLZFoCEdP6slKTRYGTly1ynxGutttEjzfyhKp0EDAkGIU0U24L/ogAXd2Mb/+iS9Nv75rk
	RqFd+u3nbbhJ/GynHXIjOE/BpUM+8D6xrbp/Hg29lFsSYss1bC/5//E50PDTb8h+dero=;
Message-ID: <5fe0a47c-66ca-9e0a-4742-1663c7761256@xen.org>
Date: Mon, 7 Nov 2022 18:33:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH 06/20] tools/xenstore: remove all watches when a domain
 has stopped
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-7-jgross@suse.com>
 <67cb3364-d5c1-28d8-4cda-8933de5cb9f7@xen.org>
 <703aa58c-1b7c-abb6-995d-5c5cdfcde878@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <703aa58c-1b7c-abb6-995d-5c5cdfcde878@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 07/11/2022 07:54, Juergen Gross wrote:
> On 06.11.22 22:18, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 01/11/2022 15:28, Juergen Gross wrote:
>>> When a domain has been recognized to have stopped, remove all its
>>> registered watches. This avoids sending watch events to the dead domain
>>> when all the nodes related to it are being removed by the Xen tools.
>>
>>  From my understanding, shutdown doesn't mean dead. It may be used 
>> during migration (or snapshotting), where we don't want to touch the 
>> state in case of a cancellation (or resume).
>>
>> For instance, see the command XS_RESUME which will clear 
>> domain->shutdown.
> 
> Oh, good catch!
> 
> I need to additionally check the "shutdown reason". I can remove the
> watches only in case of the reason not having been "suspend".

This is quite fragile because we may add new shutdown code in the future 
that could resume.

I think it would be better to only delete the watches if the domain is 
effectively dying (I don't think it can come back from that state)

Cheers,

-- 
Julien Grall

