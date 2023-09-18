Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A157A4606
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 11:33:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603857.940961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiAcd-0005gZ-29; Mon, 18 Sep 2023 09:32:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603857.940961; Mon, 18 Sep 2023 09:32:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiAcc-0005ev-Po; Mon, 18 Sep 2023 09:32:50 +0000
Received: by outflank-mailman (input) for mailman id 603857;
 Mon, 18 Sep 2023 09:32:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qiAcb-0005en-BI
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 09:32:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qiAcU-0003wN-Ga; Mon, 18 Sep 2023 09:32:42 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qiAcU-0000mj-8G; Mon, 18 Sep 2023 09:32:42 +0000
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
	bh=qmuohTcA4kaQzqVrGbwTyAY5x1G9mjRk5v29EmTQm/c=; b=PH2sfm7I9aRM0ge1eTZ1hxgCis
	GBZp68tczAzQCmVRGOJAFK9M0WUGC/3kdm2QmNkDbPZ1Lq/d39rnwcqmgmDquOxHvLjq5uI1yh//k
	Vy2GzFLCA5nZOUlF/p5ZnnEmnVUS6xQTalW0xnqAiB+4LFtjR4qS9R8udxb1KuZQI+2A=;
Message-ID: <c8e3595f-62e6-4d49-9602-577391f203e9@xen.org>
Date: Mon, 18 Sep 2023 10:32:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 00/29] Introduce stub headers necessary for full Xen
 build
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
 <da588ba7-f22f-9aa2-4346-de75783bd65e@suse.com>
 <9036713e5a5e67199b78b25ad1607be605b4a812.camel@gmail.com>
 <3b7ef926-ed06-609f-d443-544bd9125bec@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3b7ef926-ed06-609f-d443-544bd9125bec@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jan,

On 18/09/2023 10:29, Jan Beulich wrote:
> On 18.09.2023 10:51, Oleksii wrote:
>> On Thu, 2023-09-14 at 17:08 +0200, Jan Beulich wrote:
>>> On 14.09.2023 16:56, Oleksii Kurochko wrote:
>>>> Based on two patch series [1] and [2], the idea of which is to
>>>> provide minimal
>>>> amount of things for a complete Xen build, a large amount of
>>>> headers are the same
>>>> or almost the same, so it makes sense to move them to asm-generic.
>>>>
>>>> Also, providing such stub headers should help future architectures
>>>> to add
>>>> a full Xen build.
>>>>
>>>> [1]
>>>> https://lore.kernel.org/xen-devel/cover.1694543103.git.sanastasio@raptorengineering.com/
>>>> [2]
>>>> https://lore.kernel.org/xen-devel/cover.1692181079.git.oleksii.kurochko@gmail.com/
>>>>
>>>> Oleksii Kurochko (29):
>>>>    xen/asm-generic: introduce stub header spinlock.h
>>>
>>> At the example of this, personally I think this goes too far. Headers
>>> in
>>> asm-generic should be for the case where an arch elects to not
>>> implement
>>> certain functionality. Clearly spinlocks are required uniformly.
>> It makes sense. Then I will back to the option [2] where I introduced
>> all this headers as part of RISC-V architecture.
> 
> You did see though that in a reply to my own mail I said I take back the
> comment,

I can't find a reply to our own mail in my inbox. Do you have a message-id?

? at least as far as this header (and perhaps several others) are
> concerned.

Do you have a list where you think they should be kept? Or are you 
planning to answer to all you disagree/agree one by one?

Cheers,

-- 
Julien Grall

