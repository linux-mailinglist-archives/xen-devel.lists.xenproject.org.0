Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DACAE3B2CB9
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jun 2021 12:44:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146662.269984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwMpQ-0002KX-9Q; Thu, 24 Jun 2021 10:43:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146662.269984; Thu, 24 Jun 2021 10:43:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwMpQ-0002IE-4e; Thu, 24 Jun 2021 10:43:24 +0000
Received: by outflank-mailman (input) for mailman id 146662;
 Thu, 24 Jun 2021 10:43:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lwMpO-0002I8-Pa
 for xen-devel@lists.xenproject.org; Thu, 24 Jun 2021 10:43:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lwMpK-0006SJ-C4; Thu, 24 Jun 2021 10:43:18 +0000
Received: from [54.239.6.182] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lwMpK-0008UQ-3Y; Thu, 24 Jun 2021 10:43:18 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=o1/nsgPR9iJ5Xj/zIhK2HyHOQYdK66thWYsF9hwLSyU=; b=BXOINeH++6cJliMHL9hMn1rptn
	2iGuKZgTUe5mHCPsR/RgbI1dzY36jOghuWKiKXf7Y6c1cVbXyfhOJ1mfVM9Hwx3lGwkO2QE4JglyN
	UYrnyKwtFAnNihq9xY+GdrTo71jWEVGaj8hNYF5azh1yoOOvgGTcm3tnvwmR43+Ygbc0=;
Subject: Re: [PATCH 00/10] tools/xenstored: Bug fixes + Improve Live-Update
To: xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk, doebel@amazon.de, Julien Grall
 <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
References: <20210616144324.31652-1-julien@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <a3b28a06-92e7-0bd5-0951-2db51a0bee46@xen.org>
Date: Thu, 24 Jun 2021 12:43:15 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210616144324.31652-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 16/06/2021 16:43, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Hi all,
> 
> At the moment, Live-Update will, by default, not proceed if there are
> in-flight transactions. It is possible force it by passing -F but this
> will break any connection with in-flight transactions.
> 
> There are PV drivers out that may never terminate some transaction. On
> host running such guest, we would need to use -F. Unfortunately, this
> also risks to break well-behaving guests (and even dom0) because
> Live-Update will happen as soon as the timeout is hit.
> 
> This series aims to allow to Live-Update more safely even when the option
> -F is used.
> 
> The first part of the series contains a few fixes for bug found while
> testing Live-Update.
> 
> Cheers,
> 
> Julien Grall (10):
>    MAINTAINERS: Add myself as reviewers for tools/xenstore
>    tools/xenstored: Introduce lu_get_connection() and use it
>    tools/xenstore: Don't assume conn->in points to the LU request
>    tools/xenstored: Limit the number of requests a connection can delay
>    tools/xenstored: xenstored_core.h should include fcntl.h
>    tools/xenstored: Introduce a wrapper for conn->funcs->can_{read,
>      write}
>    tools/xenstored: delay_request: don't assume conn->in == in
>    tools/xenstored: Extend restore code to handle multiple input buffer

I have committed the first 8 patches.

>    tools/xenstored: Dump delayed requests
>    tools/xenstored: Delay new transaction while Live-Update is pending

Cheers,

-- 
Julien Grall

