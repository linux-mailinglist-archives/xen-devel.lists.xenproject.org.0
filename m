Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6603B465290
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 17:14:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236119.409546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msSEp-0007m4-S9; Wed, 01 Dec 2021 16:13:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236119.409546; Wed, 01 Dec 2021 16:13:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msSEp-0007kH-P9; Wed, 01 Dec 2021 16:13:43 +0000
Received: by outflank-mailman (input) for mailman id 236119;
 Wed, 01 Dec 2021 16:13:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1msSEn-0007kB-Tw
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 16:13:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1msSEl-0007vO-HS; Wed, 01 Dec 2021 16:13:39 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.22.155]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1msSEl-0000Em-BD; Wed, 01 Dec 2021 16:13:39 +0000
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
	bh=ODZ3wX3gUKpBXwSTHsywzaY+em5RuIrZN/pOW8HuGao=; b=G1u+pZTFttfMlOj6fyEFedN//i
	H4Gop9sWpSzfDjxJQrlD6OTp2txQM768qivF8qeSgRcMhRe/0UleIjX90nFUvBvfdAUvxV+Cg/6GU
	2pq9jBo4/YltaVv6n0iEUSchztzJ6iiXEf3MnVm4NpNmni6Uy8lHxubQf3+KhM7gxtRM=;
Message-ID: <1754aeef-f028-0901-edac-09565a1e4956@xen.org>
Date: Wed, 1 Dec 2021 16:13:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH RFC] SUPPORT.md: limit security support for hosts with
 very much memory
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <fff23663-b114-0726-e37f-06461b5ea63d@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <fff23663-b114-0726-e37f-06461b5ea63d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 30/11/2021 16:14, Jan Beulich wrote:
> Sufficient and in particular regular testing on very large hosts cannot
> currently be guaranteed. Anyone wanting us to support larger hosts is
> free to propose so, but will need to supply not only test results, but
> also a test plan.
> 
> This is a follow-up to XSA-385.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> 
> --- unstable.orig/SUPPORT.md	2021-06-25 11:19:03.000000000 +0200
> +++ unstable/SUPPORT.md	2021-09-10 11:15:52.270364645 +0200
> @@ -48,6 +48,12 @@ For the Cortex A57 r0p0 - r1p1, see Erra
>   
>       Status, x86: Supported
>   
> +### Physical Memory
> +
> +    Status: Supported up to 8 TiB
> +
> +Hosts with more memory are supported, but not security supported.
> +
>   ### Physical Memory Hotplug
>   
>       Status, x86: Supported
> 

-- 
Julien Grall

