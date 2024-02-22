Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A4585F695
	for <lists+xen-devel@lfdr.de>; Thu, 22 Feb 2024 12:13:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684361.1064182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rd70Y-0001A5-Fs; Thu, 22 Feb 2024 11:12:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684361.1064182; Thu, 22 Feb 2024 11:12:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rd70Y-00016v-Cq; Thu, 22 Feb 2024 11:12:54 +0000
Received: by outflank-mailman (input) for mailman id 684361;
 Thu, 22 Feb 2024 11:12:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rd70W-00016p-5D
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2024 11:12:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rd70V-0004yE-PP; Thu, 22 Feb 2024 11:12:51 +0000
Received: from [15.248.2.233] (helo=[10.24.67.33])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rd70V-0003JO-HD; Thu, 22 Feb 2024 11:12:51 +0000
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
	bh=kuIMoXlm/WIgCgAjrPoiKKWqVYCqvNK25pngRZV6Ntk=; b=cuuzIGStbGcTCXEtdYqWv6ubCU
	st6reHUg1xr+KT2kcyiZnHHvjtE1OpP6Bx0rhaOIHcvxCoZ8LYVxP8MCVsXCYv7m1ehZHejUs+dKc
	kFQmur6eHIAq2MYhAhvDzeGjraZp5Rm0rRKsRo57FWhnfXvcD23qJgm+Y++I1ZDnRbE0=;
Message-ID: <b8e39e0e-213f-436a-ad8e-65679be2a3b6@xen.org>
Date: Thu, 22 Feb 2024 11:12:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/memsharing: use an atomic add instead of a
 cmpxchg loop
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
References: <20240222090530.62530-1-roger.pau@citrix.com>
 <20240222090530.62530-2-roger.pau@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240222090530.62530-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Roger,

On 22/02/2024 09:05, Roger Pau Monne wrote:
> The usage of a cmpxchg loop in get_next_handle() is unnecessary, as the same
> can be achieved with an atomic increment, which is both simpler to read, and
> avoid any need for a loop.
> 
> The cmpxchg usage is likely a remnant of 32bit support, which didn't have an
> instruction to do an atomic 64bit add, and instead a cmpxchg had to be used.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-of-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

