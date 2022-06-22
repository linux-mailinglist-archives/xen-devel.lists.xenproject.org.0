Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CBC554DED
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 16:52:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354078.581105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o41hy-0003lP-1S; Wed, 22 Jun 2022 14:51:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354078.581105; Wed, 22 Jun 2022 14:51:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o41hx-0003j0-Ug; Wed, 22 Jun 2022 14:51:53 +0000
Received: by outflank-mailman (input) for mailman id 354078;
 Wed, 22 Jun 2022 14:51:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o41hv-0003iu-UI
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 14:51:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o41hv-0006dn-HC; Wed, 22 Jun 2022 14:51:51 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.1.223]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o41hv-0002FW-Ar; Wed, 22 Jun 2022 14:51:51 +0000
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
	bh=vGgKW0gVOm12CZhxUySqbYVfpcHSXjAYjivITo6fojQ=; b=qPKs1VaXZyvnzTNjY+ndc+nxNJ
	AsAJqJTEzpcoXueRpsluPLPgbRUyoJ8BXVXrisozm+xG7lQLX4xegSVTLMEsExI8wproiJf5FyaQk
	pQIin2XTe6yYcb7fN49KXJbdj56JLfOfT7V22WM9hUmTUqLiXVEpqzW+QuL7kfgY8MTs=;
Message-ID: <2cdde2eb-33ac-568b-a0ae-b819b7b4161b@xen.org>
Date: Wed, 22 Jun 2022 15:51:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH 2/8] xen/evtchn: modify evtchn_alloc_unbound to allocate
 specified port
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <cover.1655903088.git.rahul.singh@arm.com>
 <5ea66595248c41a011ac465bfabd7a7a40dcd565.1655903088.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5ea66595248c41a011ac465bfabd7a7a40dcd565.1655903088.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 22/06/2022 15:37, Rahul Singh wrote:
> evtchn_alloc_unbound() always allocates the next available port. Static
> event channel support for dom0less domains requires allocating a
> specified port.
> 
> Modify the evtchn_alloc_unbound() to accept the port number as an
> argument and allocate the specified port if available. If the port
> number argument is zero, the next available port will be allocated.

I haven't yet fully reviewed this series. But I would like to point out 
that this opening a security hole (which I thought I had mention before) 
that could be exploited by a guest at runtime.

You would need [1] or similar in order to fix the issue. I am wrote 
"similar" because the patch could potentially be a problem if you allow 
a guest to use FIFO (you may need to allocate a lot of memory to fill 
the hole).

Cheers,

[1] 
https://xenbits.xen.org/gitweb/?p=people/julieng/xen-unstable.git;a=commit;h=2d89486fcf11216331e58a21b367b8a9be1af725

-- 
Julien Grall

