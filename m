Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F293516A7
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 18:15:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104634.200381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRzyF-0008OS-HP; Thu, 01 Apr 2021 16:14:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104634.200381; Thu, 01 Apr 2021 16:14:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRzyF-0008O3-EF; Thu, 01 Apr 2021 16:14:59 +0000
Received: by outflank-mailman (input) for mailman id 104634;
 Thu, 01 Apr 2021 16:14:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lRzyE-0008Nv-1k
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 16:14:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lRzyD-0001aq-Su; Thu, 01 Apr 2021 16:14:57 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lRzyD-00015H-Ka; Thu, 01 Apr 2021 16:14:57 +0000
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
	bh=5qL28haLDRzebOuDwjl4n0DxnOE5PrUJOFsKvXYE9os=; b=dfhl3Byoj7EatGlpdlXjy4v0Fj
	mQR0yHNKMqX6GaZUNGXN+/lEeBgSUyN9HVRT2JvUn2uWhSoDTwrCufHMsgPxdquSZmcIuuloMYWsC
	TWx04UvNoOTvpjY8fcEG0aB4D0P1T5xkZSClnA0LPwR16dbbG5IDLyEuRCNTkG1soIAc=;
Subject: Re: [PATCH for-4.15 4/7] CHANGELOG.md: Mention various ARM errata
To: Jan Beulich <jbeulich@suse.com>, George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <ian.jackson@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20210401133827.362216-1-george.dunlap@citrix.com>
 <20210401133827.362216-4-george.dunlap@citrix.com>
 <330feed2-d601-8b79-3c1f-bd8be167b8eb@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <19cf79e4-f54b-874b-72a1-7fd6f2942c80@xen.org>
Date: Thu, 1 Apr 2021 17:14:55 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <330feed2-d601-8b79-3c1f-bd8be167b8eb@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 01/04/2021 15:13, Jan Beulich wrote:
> On 01.04.2021 15:38, George Dunlap wrote:
>> --- a/CHANGELOG.md
>> +++ b/CHANGELOG.md
>> @@ -26,6 +26,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>    - Added XEN_SCRIPT_DIR configuration option to specify location for Xen scripts, rather than hard-coding /etc/xen/scripts
>>    - xennet: Documented a way for the backend (or toolstack) to specify MTU to the frontend
>>    - Some additional affordances in various xl subcommands.
>> + - Added the following ARM errata: Cortex A53 #843419, Cortex A55 #1530923, Cortex A72 #853709, Cortex A73 #858921, Cortex A76 #1286807, Neoverse-N1 #1165522
> 
> May I suggest "Added workarounds for ..."?

+1

With that:

Acked-by: Julien Grall <jgrall@amazon.com>

> 
> Jan
> 

-- 
Julien Grall

