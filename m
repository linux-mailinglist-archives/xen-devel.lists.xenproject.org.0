Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6B44F935C
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 12:55:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301373.514312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncmGh-0005DF-1C; Fri, 08 Apr 2022 10:55:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301373.514312; Fri, 08 Apr 2022 10:55:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncmGg-0005AI-Tn; Fri, 08 Apr 2022 10:55:06 +0000
Received: by outflank-mailman (input) for mailman id 301373;
 Fri, 08 Apr 2022 10:55:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ncmGe-0005AC-VM
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 10:55:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ncmGe-00008x-3m; Fri, 08 Apr 2022 10:55:04 +0000
Received: from [54.239.6.190] (helo=[192.168.16.176])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ncmGd-0001nQ-TI; Fri, 08 Apr 2022 10:55:04 +0000
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
	bh=wbyQUubja02MTYVxYT+xYePWDImUwKRn/G8jmpE1IRI=; b=VgJ2XqKwzHXf9a4SX9ALtLMM/4
	ETMSyM/Qc7kQ6YNaTM0bR2DXpegLbjdlzqjm7ugRXRpQqQ3cPKQVAIEG8+2j9btxjRm6q7uWs/BEm
	MZrzyT2EW0EJRccuKD5WOQmo/w9KMgfmq8Ui7RE5jkYRj3LP2pObtynq1QAHbhw0v4fw=;
Message-ID: <a2b530c7-7b20-df44-7935-9d448f617bf3@xen.org>
Date: Fri, 8 Apr 2022 11:55:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH RFC] evtchn: add early-out to evtchn_move_pirqs()
To: Luca Fancellu <Luca.Fancellu@arm.com>, Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>
References: <a0fbf06a-be3c-37bd-2abf-599912ad9bf5@suse.com>
 <920E9874-E720-4536-B5DE-5222948DB1EE@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <920E9874-E720-4536-B5DE-5222948DB1EE@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Luca,

On 08/04/2022 11:41, Luca Fancellu wrote:
> 
> 
>> On 8 Apr 2022, at 08:16, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> See the code comment. The higher the rate of vCPU-s migrating across
>> pCPU-s, the less useful this attempted optimization actually is. With
>> credit2 the migration rate looks to be unduly high even on mostly idle
>> systems, and hence on large systems lock contention here isn't very
>> difficult to observe.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> I’ve tested this patch on a Juno board, starting Dom0, creating/destroying few guests,
> doing some networking from guests of different cpu pool and everything worked.

FWIW, we don't support PIRQ on Arm (alloc_pirq_struct() will always 
return NULL). So evtchn_mode_pirqs() is basically a NOP.

This patch has the advantage for Arm to avoid taking the lock for 
nothing. I will comment on the x86 part separately.

Cheers,

-- 
Julien Grall

