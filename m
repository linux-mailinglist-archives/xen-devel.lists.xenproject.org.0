Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA484D3503
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 18:01:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288002.488389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRzgZ-0006T9-Hr; Wed, 09 Mar 2022 17:01:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288002.488389; Wed, 09 Mar 2022 17:01:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRzgZ-0006QK-E4; Wed, 09 Mar 2022 17:01:15 +0000
Received: by outflank-mailman (input) for mailman id 288002;
 Wed, 09 Mar 2022 17:01:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nRzgX-0006QE-BC
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 17:01:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nRzgW-0000t1-Rq; Wed, 09 Mar 2022 17:01:12 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=[10.95.155.231]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nRzgW-0007Ub-LH; Wed, 09 Mar 2022 17:01:12 +0000
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
	bh=noIoU5ZIRB0VLt2ZnmhXzB6H6I67yxMBK7DL/IkQdoc=; b=6ejO2nDNG+2ZIM85ugiYNllczP
	EznZr85yfkjjyjwAWBSLF6IiechCSjiNJHVGTfZ0ex6cBZXUJI6epxl2sqSo0ollj7oh/UHZt40zS
	iOdPO7MaSdJ2e36uZruPU6LbxpropvKRYUTrG9giOxOYsKgLMbHrRD0MS4MO1OvrS3fo=;
Message-ID: <a53b060a-fbf7-d1f2-d36c-5824668ae18d@xen.org>
Date: Wed, 9 Mar 2022 17:01:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v3 0/2] livepatch: enable -f{function,data}-sections
 compiler option
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <20220308134924.83616-1-roger.pau@citrix.com>
 <3dcefa20-829a-ca13-941b-ede25ef81813@xen.org>
 <YiiddqMEBtpI0W65@Air-de-Roger>
From: Julien Grall <julien@xen.org>
In-Reply-To: <YiiddqMEBtpI0W65@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Roger,

On 09/03/2022 12:28, Roger Pau Monné wrote:
> On Tue, Mar 08, 2022 at 02:52:55PM +0000, Julien Grall wrote:
>> Hi,
>>
>> On 08/03/2022 13:49, Roger Pau Monne wrote:
>>> Hello,
>>>
>>> The content in v3 has been split in two patches, but is still mostly the
>>> same. The main difference is that first patch does a bit of cleanup of
>>> the build logic now that the header object file doesn't need to be the
>>> first one passed to the linker script.
>>>
>>> Thanks, Roger.
>>>
>>> Roger Pau Monne (2):
>>>     xen/build: put image header into a separate section
>>>     livepatch: set -f{function,data}-sections compiler option
>>
>> For the Arm bits:
>>
>> Acked-by: Julien Grall <jgrall@amazon.com> # xen/arm
> 
> Thanks!
> 
> I don't think Acks require a scope tag, as you can only Ack changes to
> the code you are a maintainer for?

It is not required (same for reviewed-by). But it can be used to specify 
exactly which part you ack.

In this case, I am a maintainer for both common and Arm. I chose to ack 
Arm and leave someone else to confirm the change in common is fine.

Furthermore, with my committer hat on, I find handy to know which person 
acked what. This makes easier to check that the code is suitably acked.

Cheers,

[1] 
https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=docs/process/sending-patches.pandoc;h=7ff7826c992b68804b41cc4a8605329f7a10e44c;hb=refs/heads/staging#l241

-- 
Julien Grall

