Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D285E5B35CD
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 13:00:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404213.646580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWbk0-0003RJ-1j; Fri, 09 Sep 2022 11:00:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404213.646580; Fri, 09 Sep 2022 11:00:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWbjz-0003P6-Tu; Fri, 09 Sep 2022 11:00:07 +0000
Received: by outflank-mailman (input) for mailman id 404213;
 Fri, 09 Sep 2022 11:00:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oWbjy-0003KY-Jg
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 11:00:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oWbjy-00081J-1l; Fri, 09 Sep 2022 11:00:06 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.11.73]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oWbjx-0005BL-Rb; Fri, 09 Sep 2022 11:00:05 +0000
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
	bh=vONcpvCt8FH8pTM386Fsz6zmUszxoK6BEBQCMfwSZGc=; b=hBU4gBKV/vw3VVK9DVaAtJpY9E
	SCbG9Gh3K5JntP9SOrYdMKpPUuYYlI9PpJ4Id/5dG4RJZW8QrSzXKJAom4vGy2RkpB6O5RD0MQgDu
	ypdmst2LPcv/2S9oOorA/9Bf8YwskQIKciR+uDEh3hWLzVWAeQ78KGm63XxPz5NB0afc=;
Message-ID: <bf0d5470-efce-c7f7-d429-78d7fb9517d1@xen.org>
Date: Fri, 9 Sep 2022 12:00:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH] core-parking: fix build with gcc12 and NR_CPUS=1
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <1c23930f-e809-d623-18ec-599a0e983b7a@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1c23930f-e809-d623-18ec-599a0e983b7a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 09/09/2022 11:18, Jan Beulich wrote:
> Gcc12 takes issue with core_parking_remove()'s
> 
>      for ( ; i < cur_idle_nums; ++i )
>          core_parking_cpunum[i] = core_parking_cpunum[i + 1];
> 
> complaining that the right hand side array access is past the bounds of
> 1. Clearly the compiler can't know that cur_idle_nums can only ever be
> zero in this case (as the sole CPU cannot be parked).
> 
> Beyond addressing the immediate issue also adjust core_parking_init():
> There's no point registering any policy when there's no CPU to park.
> Since this still doesn't result in the compiler spotting that
> core_parking_policy is never written (and hence is continuously NULL),
> also amend core_parking_helper() to avoid eventual similar issues there
> (minimizing generated code at the same time).

Given that CONFIG_NR_CPUS is a build time option. Wouldn't it be better
to set CONFIG_CORE_PARKING=n and provide dummy helper for any function 
that may be called unconditionally?

Cheers,

-- 
Julien Grall

