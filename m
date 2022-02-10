Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EB04B1933
	for <lists+xen-devel@lfdr.de>; Fri, 11 Feb 2022 00:14:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269989.464149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIIcR-0006My-Q8; Thu, 10 Feb 2022 23:12:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269989.464149; Thu, 10 Feb 2022 23:12:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIIcR-0006Ki-N8; Thu, 10 Feb 2022 23:12:55 +0000
Received: by outflank-mailman (input) for mailman id 269989;
 Thu, 10 Feb 2022 23:12:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nIIcQ-0006Kc-Kw
 for xen-devel@lists.xenproject.org; Thu, 10 Feb 2022 23:12:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nIIcL-0005wI-SV; Thu, 10 Feb 2022 23:12:49 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nIIcL-0006wk-Ml; Thu, 10 Feb 2022 23:12:49 +0000
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
	bh=kQqTnLFxFmKrCvWR9XjNNihl5HPUUt9G/cRtNMEYEuA=; b=noJNi8LiOl0gux67Z3K2pPOZr7
	bC8/C8XarxUr5aN3MuIeS25w4mvvC8nUM3z3Eca9PDBqOJwUDnWE7u0AhqNLjE97MA7owEwqn2PbX
	ffMZLgO7SciLoX6Pg2eQb9FYgVd+9cmaYSWKSWh0L//nR4SL1KI9EGt0xgEM0x9G/hdE=;
Message-ID: <8706c283-80c0-5fea-2834-1bf574e75470@xen.org>
Date: Thu, 10 Feb 2022 23:12:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: PCI passthrough support for PVH mode
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 tosher 1 <akm2tosher@yahoo.com>
Cc: Jan Beulich <jbeulich@suse.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "xadimgnik@gmail.com" <xadimgnik@gmail.com>,
 "oleksandr_andrushchenko@epam.com" <oleksandr_andrushchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <709142925.628001.1644127197288.ref@mail.yahoo.com>
 <709142925.628001.1644127197288@mail.yahoo.com>
 <0e64c52c-1e9c-e89b-abb8-50171d885926@suse.com>
 <303292590.682317.1644477758255@mail.yahoo.com>
 <2CDAD7A1-A628-4491-9DE0-1F4D5D9FF1A7@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <2CDAD7A1-A628-4491-9DE0-1F4D5D9FF1A7@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 10/02/2022 08:32, Bertrand Marquis wrote:
>> On 10 Feb 2022, at 07:22, tosher 1 <akm2tosher@yahoo.com> wrote:
>>
>> Hi Jan,
>>
>> Thanks for letting me know this status.
>>
>> I am wondering if PCI passthrough is at least available in Arm for other virtualization modes like PV, HVM, or PVHVM. For example, is it possible for someone to attach a PCI device to a guest domain on an Arm machine and use that domain as a driver domain, like we can do with the Xen on x86?
> 
> On arm there is only one virtualization mode which is equivalent to x86 HVM.

I would like to correct this. Arm guests are more equivalent to x86 PVH 
than HVM. For more details, see:

https://wiki.xenproject.org/wiki/Understanding_the_Virtualization_Spectrum#PVH:

This is also why we need a brand new solution for PCI passthrough rather 
than piggying back on what was done on HVM in QEMU :).

Cheers,

-- 
Julien Grall

