Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69001379640
	for <lists+xen-devel@lfdr.de>; Mon, 10 May 2021 19:43:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125424.236115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg9w0-0006cH-60; Mon, 10 May 2021 17:43:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125424.236115; Mon, 10 May 2021 17:43:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg9w0-0006aN-32; Mon, 10 May 2021 17:43:12 +0000
Received: by outflank-mailman (input) for mailman id 125424;
 Mon, 10 May 2021 17:43:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lg9vy-0006aH-Ua
 for xen-devel@lists.xenproject.org; Mon, 10 May 2021 17:43:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lg9vx-0002Ok-OJ; Mon, 10 May 2021 17:43:09 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lg9vx-0001w3-HG; Mon, 10 May 2021 17:43:09 +0000
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
	bh=DpsR2dSQkKRVnlUx9iRVUmS8p5eDXvOcK08F/AJ/4Ug=; b=EELlmyci7XtaBoDDg2UchqtO07
	2HunXuh+3QZ0F1KOME2Q+Eqhm46xFJd5kHatGOKEdUlec4F5B8escXXRQZtVr6cfJFTF5u6zdcRoo
	EHKgZW9tu/qBkSVkmQtiDGwBx0mCmT9jCQcThiDrU2RltIhRy21Mjd5SMDtw4uJ5JqNQ=;
Subject: Re: Ping: [PATCH] build: centralize / unify asm-offsets generation
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
References: <fa340caa-4ee1-a302-fbf1-1df400493d6b@suse.com>
 <YH7zXpPz03+kLzEr@Air-de-Roger>
 <e9de883b-604b-1193-b748-5a59795a9f31@suse.com>
 <YH7/SvkrB2yGgRij@Air-de-Roger>
 <5170aa51-8e34-3a45-5bf6-c0a187b1c427@suse.com>
 <YIfTyT4rvD9yEqiM@Air-de-Roger>
 <5018479d-b566-a32b-9a01-5ccf01fe0880@suse.com>
 <YIgSNRq2w7KSSaiD@Air-de-Roger>
 <e9a7b3c5-db38-76d8-64ec-2cfd9f46f1fd@suse.com>
 <YIgb/Tz/ic6uVXWo@Air-de-Roger>
 <8c34d016-47fb-eb6a-2be5-9497094effa7@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <48b9a32b-acd3-d086-6ec9-18ee9ae3686d@xen.org>
Date: Mon, 10 May 2021 18:43:07 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <8c34d016-47fb-eb6a-2be5-9497094effa7@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Jan,

Sorry for the late answer.

On 29/04/2021 10:18, Jan Beulich wrote:
> On 27.04.2021 16:13, Roger Pau Monné wrote:
>> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks Roger.
> 
> Julien, Stefano, may I ask for an Arm side ack (or otherwise) here
> as well?

Acked-by: Julien Grall <jgrall@amazon.com>

I will let you commit the patch because I wasn't sure if there was some 
tweaks required based on the conversation between Roger and you.

Cheers,

-- 
Julien Grall

