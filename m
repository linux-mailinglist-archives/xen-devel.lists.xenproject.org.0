Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCA05A9E4C
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 19:42:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396886.637262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oToCF-0001Cl-MK; Thu, 01 Sep 2022 17:41:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396886.637262; Thu, 01 Sep 2022 17:41:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oToCF-00019d-Jb; Thu, 01 Sep 2022 17:41:43 +0000
Received: by outflank-mailman (input) for mailman id 396886;
 Thu, 01 Sep 2022 17:41:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oToCE-00019X-HQ
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 17:41:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oToCE-0000wW-AX; Thu, 01 Sep 2022 17:41:42 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=[192.168.12.167]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oToCE-0002ZN-4V; Thu, 01 Sep 2022 17:41:42 +0000
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
	bh=Y0keqWveo3wRDP4YTCw6DOAAtgp5G+ZfabFLhzdiqTo=; b=5xzwdC4Jqz8soUVvVVrDXc8U1M
	YfdliA4KxUUBfnX1uPBoMLESfzha+sCv87ktNnoHyHr7NeC0m/GXBn1HhxRaUkMQFKOxVLbz66IG3
	vNu8rUgoM5vS/UIa9s4CG1WbK8h+CcjSkN0nuq3LZ4XdlWPPlooSY7nWPs9Ikj9wMaoU=;
Message-ID: <538c6b57-df40-8462-1dea-faa93d318774@xen.org>
Date: Thu, 1 Sep 2022 18:41:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.0
Subject: Re: [PATCH v3 3/7] xen/evtchn: restrict the maximum number of evtchn
 supported for domUs
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, Rahul Singh <rahul.singh@arm.com>,
 xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1662023183.git.rahul.singh@arm.com>
 <4ae16201df27aee274a3d740128812b118c252b3.1662023183.git.rahul.singh@arm.com>
 <99eff10e-6b7b-df74-5017-7628c0b0bd7a@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <99eff10e-6b7b-df74-5017-7628c0b0bd7a@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 01/09/2022 14:53, Michal Orzel wrote:
> On 01/09/2022 11:13, Rahul Singh wrote:
>>
>> Restrict the maximum number of evtchn supported for domUs to avoid
>> allocating a large amount of memory in Xen.
>>
>> Set the default value of max_evtchn_port to 1023. The value of 1023
>> should be sufficient for domUs guests because on ARM we don't bind
>> physical interrupts to event channels. The only use of the evtchn port
>> is inter-domain communications.
> Following the previous discussion, I think the only missing piece is
> an explanation that 1023 was chose to follow the default behavior of libxl.

+1. The current explanation only justify why we haven't added a 
device-tree property to change the default value.

> 
> Apart from that:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Cheers,

-- 
Julien Grall

