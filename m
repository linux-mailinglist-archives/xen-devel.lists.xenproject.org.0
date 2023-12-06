Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D15C807A9D
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 22:39:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649442.1013999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAzbm-00046z-Vj; Wed, 06 Dec 2023 21:39:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649442.1013999; Wed, 06 Dec 2023 21:39:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAzbm-00044r-T5; Wed, 06 Dec 2023 21:39:06 +0000
Received: by outflank-mailman (input) for mailman id 649442;
 Wed, 06 Dec 2023 21:39:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rAzbl-00044l-KY
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 21:39:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rAzbl-0002MM-04; Wed, 06 Dec 2023 21:39:05 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rAzbk-0004Vy-PA; Wed, 06 Dec 2023 21:39:04 +0000
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
	bh=tlVhUKoXOOZaJGLSJgs22StEDbno8zpfeSx22EjA2y4=; b=DFrcMHSXhxFS5pQ/yASFewHiie
	QLAXLQ2XQ2Oj1uESaeDcYCzT+15koQSub8wsJ3DBQfk46shz/iMt4xbTX6x8JQzxEbnHUPXUP4XkV
	pA18tWgzesJgK4ClU7jiWECSDesdIjoUhdDUOAFkft+vmbqsSVO7kVwy8pim1xoR32b0=;
Message-ID: <274e9e03-31fc-4838-9585-4ea2c9231203@xen.org>
Date: Wed, 6 Dec 2023 21:39:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: MiniOS build regressions
Content-Language: en-GB
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>
Cc: Jan Beulich <jbeulich@suse.com>, Julien Grall <jgrall@amazon.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jason Andryuk <jandryuk@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <0836857a-e9f7-41e9-9094-2833913e6485@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <0836857a-e9f7-41e9-9094-2833913e6485@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 06/12/2023 21:58, Andrew Cooper wrote:
> Following the chaos this morning and a scattering of fixes, I finally
> got back to a working Gitlab with:
> 
> https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1097843454
> 
> This contains a full revert of the DMI patch, and removal of the Xilinx
> hardware runner, both handled in other threads but noted here for anyone
> looking at the test results.
> 
> It also contains 3 MiniOS fixes, mixed between repos:
> 
> "tools/libs/evtchn: drop assert()s in stubdom" in xen [1]
> "Mini-OS: don't use objcopy --dump-section" in minios [2]
> "Mini-OS: export main_thread" [3]
> 
> and the result with all of these passes.
> 
> However, it is my understanding that we don't actually want to take
> patch 3, instead preferring patch 1 as an alternative.

Looking at patch 1, I feel that 3 is better temporarily until we have 
proper locking. With 1, we are just setting ourself for another failure.

> 
> But there is a concern which has been raised over patch 1.
> 
> 
> So what are we going to do?
> 
> If there isn't an answer promptly, I will revert the most recent bump to
> MINIOS_UPSTREAM_REVISION to unbreak Gitlab CI testing for everyone else.

I would say we should unblock gitlab CI ASAP. So whichever is the easiest.

Cheers,

-- 
Julien Grall

