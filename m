Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9B973B13E
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jun 2023 09:22:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554245.865339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCb7H-0003z4-LL; Fri, 23 Jun 2023 07:21:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554245.865339; Fri, 23 Jun 2023 07:21:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCb7H-0003wA-He; Fri, 23 Jun 2023 07:21:59 +0000
Received: by outflank-mailman (input) for mailman id 554245;
 Fri, 23 Jun 2023 07:21:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qCb7F-0003uL-Ua
 for xen-devel@lists.xenproject.org; Fri, 23 Jun 2023 07:21:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qCb7F-0000RD-AO; Fri, 23 Jun 2023 07:21:57 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qCb7F-0005lA-5K; Fri, 23 Jun 2023 07:21:57 +0000
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
	bh=9tMmR3IdR8Ac5LA9mOGvIuyBClL/757uKvu655rDFls=; b=p4jX2zz8ODkjgl+uXgO8iDs+QI
	vvS3SV/ZGLPrpLsF/DZldHEOvNEAycPzKOgXGwDIljUdTie4zqpjE9duaXfHkz3WLoeRzEVgoCLJ8
	HQ0YOKbWHVT9eQ+f4/wZ2b9YnQlhQBR5uXdylqMRdPQ+kTgVUlPobkUhJv97J8DZM/f0=;
Message-ID: <347cbd51-b2e7-2991-76c7-82a0f8beb373@xen.org>
Date: Fri, 23 Jun 2023 08:21:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 3/4] xen/ppc: Implement early serial printk on pseries
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com
References: <cover.1687366665.git.sanastasio@raptorengineering.com>
 <259298cdadf7cf1eba08cd35c636e9aca9e2182a.1687366665.git.sanastasio@raptorengineering.com>
 <4fc1fcee-e210-fe16-f762-3f23700d51b9@xen.org>
 <eb810a53-ee10-d8a1-b983-ee8dcf02f07a@raptorengineering.com>
 <e4f061df-2479-3441-a811-5379ea5ae52b@xen.org>
 <8fdb87a3-7ae6-6435-0988-1ea1926d2a2b@raptorengineering.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <8fdb87a3-7ae6-6435-0988-1ea1926d2a2b@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 22/06/2023 19:54, Shawn Anastasio wrote:
> On 6/22/23 11:43 AM, Julien Grall wrote:
>> Hi,
> 
> Thanks for the response. I had one more question with regards to the
> emacs footer.
> 
>> All files usually have an emacs magic block. E.g.:
>>
>> /*
>> * Local variables:
>> * mode: C
>> * c-file-style: "BSD"
>> * c-basic-offset: 4
>> * indent-tabs-mode: nil
>> * End:
>> */
> 
> Is this absolutely necessary to include? The CODING_STYLE document seems
> to imply that it's optional and a quick peek at other architectures'
> code suggests that this is the case.

Interesting, I thought the coding style would impose it because from 
past discussion it seemed that we wanted to use it everywhere but it 
tends to be forgotten.

> 
> If it is required, should it also be included in assembly files, or only
> .c/.h ones?

I think it shold be everywhere. But given the CODING_STYLE is more laxed 
than I remembered, then feel this to ignore this comment :).

Cheers,

-- 
Julien Grall

