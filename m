Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF2280EB9B
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 13:22:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653047.1019285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD1m8-0002Ee-8m; Tue, 12 Dec 2023 12:22:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653047.1019285; Tue, 12 Dec 2023 12:22:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD1m8-0002Bq-5z; Tue, 12 Dec 2023 12:22:12 +0000
Received: by outflank-mailman (input) for mailman id 653047;
 Tue, 12 Dec 2023 12:22:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rD1m5-0002Aa-UI
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 12:22:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rD1m5-0006Fh-Ou; Tue, 12 Dec 2023 12:22:09 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rD1m5-0002MX-FQ; Tue, 12 Dec 2023 12:22:09 +0000
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
	bh=YfyG5cOvBKMc8x3GPmVNnaUzV+ObYlTiJStZdWZnFdM=; b=2D8EYKmR2IAhXUj+po8q/zGYD+
	5akRQt6B86DiPQat27rJ4nKRDLUlvQ36MYKMSYEY/GaGCZJ5izdp2WSbWvcqT89KD/xxAm2/qvN+G
	IqVx7kJrJ4Q/3zSM9t1goPIu+puNr/IdrODF0UxDYaQHct6EXKh4wZLmPWKIxB6EvDiA=;
Message-ID: <2056d029-99b0-4b6e-a83f-d3401c9828fe@xen.org>
Date: Tue, 12 Dec 2023 12:22:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/12] xen/spinlock: support higher number of cpus
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 javi.merino@cloud.com
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-13-jgross@suse.com>
 <2c2f8ee1-bf97-4e42-a1ef-74ed1997722c@xen.org>
 <29a4894c-6a08-49cb-9567-c952eaaffa0f@suse.com>
 <e5d991d7-cfdb-4970-90e9-c43fc16cdba0@xen.org>
 <a3a1b216-96d5-4ae0-a03e-e8ef7ee58a43@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a3a1b216-96d5-4ae0-a03e-e8ef7ee58a43@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 12/12/2023 12:11, Juergen Gross wrote:
> On 12.12.23 12:40, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 12/12/2023 11:09, Juergen Gross wrote:
>>> On 12.12.23 11:10, Julien Grall wrote:
>>>> Hi Juergen,
>>>>
>>>> On 12/12/2023 09:47, Juergen Gross wrote:
>>>>> Allow 16 bits per cpu number, which is the limit imposed by
>>>>> spinlock_tickets_t.
>>>>>
>>>>> This will allow up to 65535 cpus, while increasing only the size of
>>>>> recursive spinlocks in debug builds from 8 to 12 bytes.
>>>> Looking at arch/Kconfig, it looks like we are limiting NR_CPUS to 
>>>> maximum 4096. So can you outline why we need this?
>>>
>>> The limit of 4096 cpus is dictated by the current limit of the spinlock
>>> implementation. So asking "why do we need to support more than 4096 cpus
>>> in spinlock_t when the current Xen limit is 4096" is kind of the wrong
>>> question. >
>>> The correct question would be: why is Xen limited to 4096 cpus? Answer:
>>> because of the limit in spinlock_t.
>>
>> I thought there was also some lock contention issue in Xen. Hence why 
>> I asked the question because the commit message doesn't really give 
>> any clue why we are raising the limit... (This is a hint that it 
>> probably needs to be expanded a bit).
> 
> Okay, are you fine with the following addition:
> 
>    The current Xen limit of 4095 cpus is imposed by SPINLOCK_CPU_BITS
>    being 12. There are machines available with more cpus than the current
>    Xen limit, so it makes sense to have the possibility to use more cpus.

Yes. That makes clearer.

Cheers,

-- 
Julien Grall

