Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F37DE80EA94
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 12:40:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652967.1019170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD184-0000qj-HK; Tue, 12 Dec 2023 11:40:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652967.1019170; Tue, 12 Dec 2023 11:40:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD184-0000oI-CH; Tue, 12 Dec 2023 11:40:48 +0000
Received: by outflank-mailman (input) for mailman id 652967;
 Tue, 12 Dec 2023 11:40:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rD182-0000o8-TG
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 11:40:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rD182-0005MI-M1; Tue, 12 Dec 2023 11:40:46 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rD182-0006XD-EP; Tue, 12 Dec 2023 11:40:46 +0000
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
	bh=KykO3tlCCMmSZPtvJcGWxmVGOqrmWXFk37A4ESjIXJ4=; b=0FAJQTEjZ8gl/5wntTOW6W2C25
	9jGejJ4/ab9IMlwONwlSjqIgoCtfXx0+E6L1xXp/J+DOOac27g0dDNyXOF2FC71KKm/9ZuoDE59Ay
	N19sw0/ADDTseaWtrtGMPnQy5adGuNgipm+stREE93mFiX9POsJZr9A0RIMH5nFMAHzI=;
Message-ID: <e5d991d7-cfdb-4970-90e9-c43fc16cdba0@xen.org>
Date: Tue, 12 Dec 2023 11:40:44 +0000
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
From: Julien Grall <julien@xen.org>
In-Reply-To: <29a4894c-6a08-49cb-9567-c952eaaffa0f@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 12/12/2023 11:09, Juergen Gross wrote:
> On 12.12.23 11:10, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 12/12/2023 09:47, Juergen Gross wrote:
>>> Allow 16 bits per cpu number, which is the limit imposed by
>>> spinlock_tickets_t.
>>>
>>> This will allow up to 65535 cpus, while increasing only the size of
>>> recursive spinlocks in debug builds from 8 to 12 bytes.
>> Looking at arch/Kconfig, it looks like we are limiting NR_CPUS to 
>> maximum 4096. So can you outline why we need this?
> 
> The limit of 4096 cpus is dictated by the current limit of the spinlock
> implementation. So asking "why do we need to support more than 4096 cpus
> in spinlock_t when the current Xen limit is 4096" is kind of the wrong
> question. >
> The correct question would be: why is Xen limited to 4096 cpus? Answer:
> because of the limit in spinlock_t.

I thought there was also some lock contention issue in Xen. Hence why I 
asked the question because the commit message doesn't really give any 
clue why we are raising the limit... (This is a hint that it probably 
needs to be expanded a bit).

Cheers,

-- 
Julien Grall

