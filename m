Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 621464E58D5
	for <lists+xen-devel@lfdr.de>; Wed, 23 Mar 2022 20:03:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294059.499837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX6G2-0000N1-RS; Wed, 23 Mar 2022 19:02:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294059.499837; Wed, 23 Mar 2022 19:02:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX6G2-0000K8-OS; Wed, 23 Mar 2022 19:02:58 +0000
Received: by outflank-mailman (input) for mailman id 294059;
 Wed, 23 Mar 2022 19:02:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nX6G1-0000K2-JR
 for xen-devel@lists.xenproject.org; Wed, 23 Mar 2022 19:02:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nX6G0-0003Xk-HB; Wed, 23 Mar 2022 19:02:56 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.10.149]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nX6G0-0005DS-AI; Wed, 23 Mar 2022 19:02:56 +0000
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
	bh=c4lUWOXExKcKYFVl+7V0s7r/mL3hh2MczVnPOpq0ePQ=; b=hSUp3/ao/lQmUtxnUFr4jqyGO3
	kvHfEyC3hwTbJQnwgkAic0lc/8k3YDpYKvrPhvZNOOVeBG8kNEXECzX0GLcoeAIaihvw6jSA2TvC7
	0LI5bj/mYQ8hlLa2IAsXFQJVS0Xog34hs83q64Cp2pLx7zS5cDgH5Z8ZhvVGXNmVrElk=;
Message-ID: <5a37216a-666e-fa45-e4eb-332656d4670b@xen.org>
Date: Wed, 23 Mar 2022 19:02:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 04/36] xen/arm: add parsing function for cache coloring
 configuration
To: Luca Miccio <lucmiccio@gmail.com>
Cc: Marco Solieri <marco.solieri@minervasys.tech>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@unimore.it>,
 Andrea Bastoni <andrea.bastoni@minervasys.tech>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
 <20220304174701.1453977-5-marco.solieri@minervasys.tech>
 <2f357e1a-df8e-6326-267e-4d12e82e1a5f@xen.org>
 <CANdhDbCZrtcju-=1qgAOt1v=dFFDQwZ4eqfQWj41Pvhcofz=FQ@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CANdhDbCZrtcju-=1qgAOt1v=dFFDQwZ4eqfQWj41Pvhcofz=FQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 22/03/2022 09:17, Luca Miccio wrote:
> Hi Julien,

Hi Luca,

>>> - way_size: The size of a LLC way in bytes. This value is mainly used
>>>     to calculate the maximum available colors on the platform.
>>
>> We should only add command line option when they are a strong use case.
>> In documentation, you wrote that someone may want to overwrite the way
>> size for "specific needs".
>>
>> Can you explain what would be those needs?
> 
>> - dom0_colors: The coloring configuration for Dom0, which also acts as
>>>     default configuration for any DomU without an explicit configuration.
>>> - xen_colors: The coloring configuration for the Xen hypervisor itself.
>>>
>>> A cache coloring configuration consists of a selection of colors to be
>>> assigned to a VM or to the hypervisor. It is represented by a set of
>>> ranges. Add a common function that parses a string with a
>>> comma-separated set of hyphen-separated ranges like "0-7,15-16" and
>>> returns both: the number of chosen colors, and an array containing their
>>> ids.
>>> Currently we support platforms with up to 128 colors.
>>
>> Is there any reason this value is hardcoded in Xen rather than part of
>> the Kconfig?
>>
>>
> Not really at the time when this patch was created. But as we notify in
> patch 32,
> there is an assert that fails if we use a certain amount of colors. Maybe
> we should
> find a better way to store the color information.

You could use a bitmap. Xen already provide facilities to use them in 
the public interface (see xenctl_bitmap) and convert the Xen internal 
bitmap (see DECLARE_BITMAP).

Cheers,

-- 
Julien Grall

