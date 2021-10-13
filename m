Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1D042C4AF
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 17:18:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208637.364841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mag0x-0001m3-TS; Wed, 13 Oct 2021 15:17:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208637.364841; Wed, 13 Oct 2021 15:17:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mag0x-0001ju-QW; Wed, 13 Oct 2021 15:17:55 +0000
Received: by outflank-mailman (input) for mailman id 208637;
 Wed, 13 Oct 2021 15:17:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mag0x-0001jm-6G
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 15:17:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mag0u-0007gu-LL; Wed, 13 Oct 2021 15:17:52 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.17.188]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mag0u-0001X8-Ef; Wed, 13 Oct 2021 15:17:52 +0000
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
	bh=8J/91wewnMA2Y3fyhWSALq6PmEYIGfgdYNGNAeemffs=; b=wgKQTkPyPTz4VFIClYFp3a6OR9
	LkSBkCSy8VOE/25kROMCzE4Wx19gk2I6Qg3BOEEK4BI9gqSKFUAVrYtdCdl20ZZ7Ey992OaGCoYjM
	yfcMGPg4E2Lfs4kMUMhz4Kh3WnV+/f36OYg7wVKTqDLMhYZHOpMChFq6Bwi+AnkDYGHs=;
Message-ID: <e614a4a4-ec65-1bbc-4e25-c838b9ebeeb8@xen.org>
Date: Wed, 13 Oct 2021 16:17:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH V6 1/2] xen/arm: Introduce gpaddr_bits field to struct
 xen_domctl_getdomaininfo
To: Oleksandr <olekstysh@gmail.com>, Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <9e6e1378-7ee3-b692-b57d-29b597160661@gmail.com>
 <1634073720-27901-1-git-send-email-olekstysh@gmail.com>
 <f9b8b55b-cfe4-2bfa-44db-e898800def72@suse.com>
 <f51ec1a9-f265-cd18-792b-017224b8667c@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <f51ec1a9-f265-cd18-792b-017224b8667c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 13/10/2021 16:05, Oleksandr wrote:
> On 13.10.21 16:56, Jan Beulich wrote:
>> While this has meanwhile moved quite far from the original proposal,
>> I still wonder in how far Andrew may have remaining concerns. Did
>> you check with him, perhaps on irc?
>> But of course catching his
>> attention may be difficult, so no (further) feedback by him should
>> probably not keep this from getting committed (if no other open
>> issues remain).
> 
> If I remember correctly, I made several attempts to clarify in the 
> initial thread. But, I have to admit, not via IRC (I am expecting some 
> troubles with my IRC client last time and I haven't figured out yet 
> why). Of course, it would be correct to get a feedback to make sure that 
> there would be no remaining concerns (as the main concern to use domctl 
> was addressed) or otherwise.

I have pinged Andrew on IRC for you.

Cheers,

-- 
Julien Grall

