Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 555478BE32D
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2024 15:12:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718097.1120645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4KcT-0003Xz-LF; Tue, 07 May 2024 13:12:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718097.1120645; Tue, 07 May 2024 13:12:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4KcT-0003Va-IF; Tue, 07 May 2024 13:12:33 +0000
Received: by outflank-mailman (input) for mailman id 718097;
 Tue, 07 May 2024 13:12:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1s4KcR-0003UR-Oa
 for xen-devel@lists.xenproject.org; Tue, 07 May 2024 13:12:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s4KcO-0006ha-28; Tue, 07 May 2024 13:12:28 +0000
Received: from [15.248.2.31] (helo=[10.24.67.35])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s4KcN-0000q2-So; Tue, 07 May 2024 13:12:28 +0000
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
	bh=ALX2nUnpQGSejcJ0GbvP/TSWhy/TzTrDvkd6ybX/1CM=; b=FEsZkdH+QXqN2zb8TWzKKi3N2d
	VIdF4lkZOCkwqJlPG97bwmoJu/ODyLKR8j0aZ8Dn1lUF9JS1KZ1eAJ+e5czZIHw43NQcaCCkEXY68
	Iia7YoX3ppwFR5uGxMiZ9d302XvR+77x8lKssPrMWX812X9wugsEkqKwwXenelhs6sJs=;
Message-ID: <be1c1109-f814-4716-981f-1e926c655f3c@xen.org>
Date: Tue, 7 May 2024 14:12:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 8/8] xen: allow up to 16383 cpus
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20240327152229.25847-1-jgross@suse.com>
 <20240327152229.25847-9-jgross@suse.com>
 <da1662ac-70f1-4ae4-9737-e10e617c8036@suse.com>
 <637c755a-9f24-4b86-af12-7c7d50bf40c8@suse.com>
 <d0714064-c544-47d3-84c0-a19391ccf496@xen.org>
 <29296e11-8d21-4867-9d31-fc94af828214@suse.com>
 <146fbd43-d8b8-4d73-8650-c60024498324@xen.org>
 <alpine.DEB.2.22.394.2405021111540.624854@ubuntu-linux-20-04-desktop>
 <b3299df2-e726-49eb-a893-cbc547b2419c@xen.org>
 <alpine.DEB.2.22.394.2405031159240.1151289@ubuntu-linux-20-04-desktop>
 <ccd19870-d44b-44a7-9a5c-72a13d4f74a2@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ccd19870-d44b-44a7-9a5c-72a13d4f74a2@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 06/05/2024 07:42, Jan Beulich wrote:
> Of course those calculations depend on
> what people choose as actual values, but giving an upper bound being a
> power of 2 may at least serve as a hint to them.

This is rather a weak hint. If you want to encourage users to chose a 
power-of-2 value, then let's spell it out in the description.

Cheers,

-- 
Julien Grall

