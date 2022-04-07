Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 694114F81DC
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 16:36:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300832.513240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncTFH-0001zg-CR; Thu, 07 Apr 2022 14:36:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300832.513240; Thu, 07 Apr 2022 14:36:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncTFH-0001wx-8Y; Thu, 07 Apr 2022 14:36:23 +0000
Received: by outflank-mailman (input) for mailman id 300832;
 Thu, 07 Apr 2022 14:36:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ncTFF-0001wr-R0
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 14:36:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ncTFF-0001EB-8X; Thu, 07 Apr 2022 14:36:21 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228] helo=[10.7.236.16])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ncTFF-0005sV-1Q; Thu, 07 Apr 2022 14:36:21 +0000
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
	bh=YeW0jGxNfAQvhRV0IWYHpGIvN5Ik3amX7id+xeOHxv4=; b=sZ+kCCxE35AenEn3TVGx3MfPmQ
	0Z7gj5QwdfoHAZazS2Z6GyX4oi5yf+6O3uL+RSId5Gf2OrIvPayf9I4xHuU0NPBTK82cM6ETTQP0l
	vOz1Gy2jkq/SaPidEHPtUBtuCkVTHFHcEEfcouT/o4zapI9CeZa4TwJzf8x4WSjpS3Qo=;
Message-ID: <f4d76d05-fc42-f417-3704-1b7608954028@xen.org>
Date: Thu, 7 Apr 2022 15:36:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v5 4/6] xen/cpupool: Create different cpupools at boot
 time
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>
References: <20220405085741.18336-1-luca.fancellu@arm.com>
 <20220405085741.18336-5-luca.fancellu@arm.com>
 <deffb58a-984a-1016-4ac8-c3badc946ea0@xen.org>
 <475D681D-9D0C-4302-B1CD-B8BD2E7D95AE@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <475D681D-9D0C-4302-B1CD-B8BD2E7D95AE@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 07/04/2022 10:52, Luca Fancellu wrote:
>>> +void __init btcpupools_dtb_parse(void)
>>> +{
>>> +    const struct dt_device_node *chosen, *node;
>>> +
>>> +    chosen = dt_find_node_by_path("/chosen");
>>> +    if ( !chosen )
>>> +        return;
>> Aside when using ACPI, the chosen node should always be there. So I think we should throw/print an error if chosen is not present.
> 
> When you say error, do you mean like a panic or just a printk XENLOG_ERR and return?

You seem to use panic() below. So I would also use panic() here as this 
shouldn't be expected.

Cheers,

-- 
Julien Grall

