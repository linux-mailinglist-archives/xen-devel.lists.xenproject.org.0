Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4A785F69A
	for <lists+xen-devel@lfdr.de>; Thu, 22 Feb 2024 12:17:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684367.1064193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rd74M-0001lT-Vi; Thu, 22 Feb 2024 11:16:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684367.1064193; Thu, 22 Feb 2024 11:16:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rd74M-0001i9-Se; Thu, 22 Feb 2024 11:16:50 +0000
Received: by outflank-mailman (input) for mailman id 684367;
 Thu, 22 Feb 2024 11:16:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rd74L-0001i3-MD
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2024 11:16:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rd74L-00052w-JH; Thu, 22 Feb 2024 11:16:49 +0000
Received: from [15.248.2.233] (helo=[10.24.67.33])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rd74L-0003Oh-Dy; Thu, 22 Feb 2024 11:16:49 +0000
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
	bh=quvwbhyJIdAjkyDw7gtuYWlKsRRKpUE5bMg+BaPidSs=; b=qc9duCbeYWq6sUctDULNTLCqO6
	vqU8MyW12DKDY+fbSCf9cdZemK/8yqH3LhPRcaav4/bASPA7U1lO0gY9+qLMdhQiDFH7x3mQzpFK+
	Gc83z85J5CfWIzjWkgoG2K8bQi03ncepKrCdWEZLgYG7cGnySSp/NXBR7tnHjMnGED6A=;
Message-ID: <67314ab0-1c8f-4617-9b0f-94488e3f6d9c@xen.org>
Date: Thu, 22 Feb 2024 11:16:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/hpet: use an atomic add instead of a cmpxchg loop
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <20240222090530.62530-1-roger.pau@citrix.com>
 <20240222090530.62530-3-roger.pau@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240222090530.62530-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Roger,

On 22/02/2024 09:05, Roger Pau Monne wrote:
> The usage of a cmpxchg loop in hpet_get_channel() is unnecessary, as the same
> can be achieved with an atomic increment, which is both simpler to read, and
> avoid any need for a loop.
> 
> Note there can be a small divergence in the channel returned if next_channel
> overflows, but returned channel will always be in the [0, num_hpets_used)
> range, and that's fine for the purpose of balancing HPET channels across CPUs.
> This is also theoretical, as there's no system currently with 2^32 CPUs (as
> long as next_channel is 32bit width).

This would also happen if we decide to reduce the size next_channel.

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

