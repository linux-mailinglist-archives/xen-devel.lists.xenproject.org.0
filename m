Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 843E83402FC
	for <lists+xen-devel@lfdr.de>; Thu, 18 Mar 2021 11:15:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98879.187860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMpgS-0007h6-Fr; Thu, 18 Mar 2021 10:15:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98879.187860; Thu, 18 Mar 2021 10:15:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMpgS-0007gi-BY; Thu, 18 Mar 2021 10:15:16 +0000
Received: by outflank-mailman (input) for mailman id 98879;
 Thu, 18 Mar 2021 10:15:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lMpgQ-0007gF-ID
 for xen-devel@lists.xenproject.org; Thu, 18 Mar 2021 10:15:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lMpgN-000653-7b; Thu, 18 Mar 2021 10:15:11 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lMpgN-000822-0k; Thu, 18 Mar 2021 10:15:11 +0000
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
	bh=IpuP7dYuP8jYNJNMRhy+8iDIGI0O1skuE4Btb5+dgvo=; b=O0Bn7qmLJnv65MWGP7ZGvHyMLa
	oWNHzJYJZ79BqjQcQ0XI9m3cEd3LfbU4EmiazxZHNS51lJKib7eeVDBs1Y0bBcECKEwpDMQQ1e89x
	6Ck7LA9P6BxLFKnWm5svwbiR2/L462q0oS6AHSSMa8PKYlojtYFwc1b9L2dzwlWL5BvM=;
Subject: Re: [PATCH v7] arm: Add Kconfig entry to select CONFIG_DTB_FILE
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 bertrand.marquis@arm.com
References: <20210315092342.26533-1-michal.orzel@arm.com>
 <3473f8d3-c42a-9182-b4fa-c3eacb44338f@xen.org>
 <75800277-4107-0060-aece-d01cf29d3086@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <29b3ca45-8e84-4997-5e97-c31030d246d3@xen.org>
Date: Thu, 18 Mar 2021 10:15:08 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <75800277-4107-0060-aece-d01cf29d3086@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 18/03/2021 07:21, Michal Orzel wrote:
> Hi Julien,
> 
> On 16.03.2021 15:54, Julien Grall wrote:
>> Hi Michal,
>>
>> On 15/03/2021 09:23, Michal Orzel wrote:
>>> Currently in order to link existing DTB into Xen image
>>> we need to either specify option CONFIG_DTB_FILE on the
>>> command line or manually add it into .config.
>>> Add Kconfig entry: CONFIG_DTB_FILE
>>> to be able to provide the path to DTB we want to embed
>>> into Xen image. If no path provided - the dtb will not
>>> be embedded.
>>>
>>> Remove the line: AFLAGS-y += -DCONFIG_DTB_FILE=\"$(CONFIG_DTB_FILE)\"
>>> as it is not needed since Kconfig will define it in a header
>>> with all the other config options.
>>>
>>> Make a change in the linker script from:
>>> _sdtb = .;
>>> to:
>>> PROVIDE(_sdtb = .);
>>> to avoid creation of _sdtb if there is no reference to it.
>>
>> This means that if someone is using #ifdef CONFIG_DTB_FILE rather than .ifnes, _sdtb will get defined.
> 
> Do we really want to overengineer something that simple?

Interesting, I would argue that using PROVIDE is over-engineered (and 
error-prone) when you likely can define _sdtb in .S.

> Why would someone use #ifdef CONFIG_DTB_FILE?
> In my opinion the rule of thumb is that you don't use #ifdef on configs of string type.
> Using #ifdef CONFIG_DTB_FILE means that someone modifying the code did not even spend 1 minute checking the Kconfig.
I'd like to point out that your first approach didn't replace #ifdef. 
This was fully reviewed and nearly committed. When I pointed out the 
issue, I had to argue that this was broken.

This is not quite the same as adding #ifdef but it shows that such 
mistake can be easily slipped in master.

Cheers,

-- 
Julien Grall

