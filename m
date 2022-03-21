Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDD74E2F50
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 18:45:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293167.497926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWM5Y-0000Jy-H0; Mon, 21 Mar 2022 17:45:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293167.497926; Mon, 21 Mar 2022 17:45:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWM5Y-0000Hp-Dy; Mon, 21 Mar 2022 17:45:04 +0000
Received: by outflank-mailman (input) for mailman id 293167;
 Mon, 21 Mar 2022 17:45:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nWM5X-0000Hi-7B
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 17:45:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nWM5W-00044H-9c; Mon, 21 Mar 2022 17:45:02 +0000
Received: from [54.239.6.185] (helo=[192.168.25.135])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nWM5W-0007po-2V; Mon, 21 Mar 2022 17:45:02 +0000
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
	bh=lijRk9/U9soX0YbANxtCVtCbbVpgEjftleHspy9y3Hc=; b=a5hYeSgmg/3jnCHKXfE1+MiCco
	X+kHHPmY7rISLyy1jvYWunOd5IaYT0mHkAqfoHg9Zv+UTQbcjLeBNNoVnvkWiM95bjsZJlS2iAHBl
	QTAhIy6BESnG5Z3nE9SJf36Re2bmdSeOhXpuSeNGd09y3sqIpQfi+/haaN1ejsIpQXbQ=;
Message-ID: <108443e0-c7d7-af6d-2183-b1bd48b0f288@xen.org>
Date: Mon, 21 Mar 2022 17:44:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v3 4/6] xen/cpupool: Create different cpupools at boot
 time
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Luca Fancellu <Luca.Fancellu@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>
References: <20220318152541.7460-1-luca.fancellu@arm.com>
 <20220318152541.7460-5-luca.fancellu@arm.com>
 <274f81b0-c164-4437-3d05-243e147330a9@xen.org>
 <0FA7F6D7-0B40-4B75-9752-7FE48D0FCA5C@arm.com>
 <9f3d7713-4e4b-58f8-d7a1-b42ef152a7ab@xen.org>
 <05E14D52-831A-438F-9F90-99F590A5A15F@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <05E14D52-831A-438F-9F90-99F590A5A15F@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Bertrand,

On 21/03/2022 17:19, Bertrand Marquis wrote:
>> On 21 Mar 2022, at 17:36, Julien Grall <julien@xen.org> wrote:
>>> So I don’t know why on x86 we must have cpu0 in cpupool0, maybe x86 maintainer have more knowledge about that and
>>> I can put a comment here.
>>
>> On Arm, we are not yet supporting all the CPU features that x86 supports (e.g. CPU hotplug, suspend/resume...). So I a am bit concerned that the restriction is just not there yet (or possibly hidden).
>>
>> Therefore, before lifting the restriction on Arm (and other arch), I would like us to understand why it is necessary on x86.
>>
>> We may not have the answer quickly, so is it going to be a problem to keep the restriction on Arm?
> 
> I am ok to keep the limitation to have dom0 always running on cpu0.
> Only limitation I can see is that on a big little system, dom0 needs to stay on the type of core of the first booted core.

Where does this limitation come from?

Cheers,

-- 
Julien Grall

