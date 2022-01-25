Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4F749BAFF
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 19:10:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260518.450156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCQH4-0001Z1-8i; Tue, 25 Jan 2022 18:10:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260518.450156; Tue, 25 Jan 2022 18:10:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCQH4-0001WE-5O; Tue, 25 Jan 2022 18:10:34 +0000
Received: by outflank-mailman (input) for mailman id 260518;
 Tue, 25 Jan 2022 18:10:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nCQH2-0001W8-6N
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 18:10:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nCQH1-0003k5-FF; Tue, 25 Jan 2022 18:10:31 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.30.43]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nCQH1-0007hw-83; Tue, 25 Jan 2022 18:10:31 +0000
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
	bh=rGSiZPiKUmFc1SdH3MLipMVQEjaTsvvKzi5IvZqY+Dw=; b=vGnjZ3FHapxTlZY2WReMVMtxlz
	PSEQxZUGW+CPNztTGEO66A7eaCbdDqzKY8HDmxmpHtl5AoEVULZaPxh55cCPq/bx8AlGeGPh4aPUY
	Z2aFBo1fmFlqoQpEtFOFxv49H42stVEZH6dOWFD0Sn1OZFTrAdZsM8tzt+EIpPyCOdBU=;
Message-ID: <3611e815-b510-1847-9c13-eb61ec96e4b7@xen.org>
Date: Tue, 25 Jan 2022 18:10:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH] libxl: force netback to wait for hotplug execution before
 connecting
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 James Dingwall <james-xen@dingwall.me.uk>, Wei Liu <wei.liu@kernel.org>,
 Paul Durrant <paul@xen.org>
References: <20220124160248.37861-1-roger.pau@citrix.com>
 <8644d37a-49aa-8d9f-03ea-955d97a1cc28@xen.org>
 <YfAgsat9NY+I0WAA@Air-de-Roger>
From: Julien Grall <julien@xen.org>
In-Reply-To: <YfAgsat9NY+I0WAA@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Roger,

On 25/01/2022 16:09, Roger Pau Monné wrote:
> On Tue, Jan 25, 2022 at 03:32:16PM +0000, Julien Grall wrote:
>> Hi,
>>
>> On 24/01/2022 16:02, Roger Pau Monne wrote:
>>> By writing an empty "hotplug-status" xenstore node in the backend path
>>> libxl can force Linux netback to wait for hotplug script execution
>>> before proceeding to the 'connected' state.
>>
>> I was actually chasing the same issue today :).
>>
>>>
>>> This is required so that netback doesn't skip state 2 (InitWait) and
>>
>> Technically netback never skip state 2 (otherwise it would always be
>> reproducible). Instead, libxl may not be able to observe state 2 because
>> receive a watch is asynchronous and doesn't contain the value of the node.
>> So the backend may have moved to Connected before the state is read.
> 
> Right, might be more accurate to say it skips waiting for hotplug
> script execution, and thus jumps from state 2 into 4.

I would add the jump happens when the frontend decides to connect.

> Note I think
> it's also possible that by the time we setup the watch in libxl the
> state has already been set to 4.

Correct.

Cheers,

-- 
Julien Grall

