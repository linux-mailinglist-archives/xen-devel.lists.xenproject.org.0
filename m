Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 664C872A28A
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 20:47:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546294.853061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7h7p-0001Ht-Ry; Fri, 09 Jun 2023 18:46:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546294.853061; Fri, 09 Jun 2023 18:46:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7h7p-0001EZ-Ob; Fri, 09 Jun 2023 18:46:17 +0000
Received: by outflank-mailman (input) for mailman id 546294;
 Fri, 09 Jun 2023 18:46:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q7h7n-0001ET-Um
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 18:46:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q7h7n-00048p-Eq; Fri, 09 Jun 2023 18:46:15 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.17.204]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q7h7n-0003vy-8C; Fri, 09 Jun 2023 18:46:15 +0000
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
	bh=D89afbTZBWaNMZq0FgmPiv6CruPjk7cTEJJN5aw6kw8=; b=F6yfGleMd3GOabxPPWczGtsVg9
	LBpB7mg70bZ8Ioy/q4Fh/djhzXVLdCynwDUFuqN+IfBhSoZmqBjoPTcvAGEOG7pXbd0SL2Rj9uEgs
	vdzBM6nb8O4TzlxJKEdh83lYO4NRPeeY6QPAHrxeCF+t1REimLGOvLxE6we+recWlUjs=;
Message-ID: <8c2e1f6e-5b13-bb62-3778-9b69f070e2de@xen.org>
Date: Fri, 9 Jun 2023 19:46:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [PATCH v3 00/16] tools/xenstore: more cleanups
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230530085418.5417-1-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230530085418.5417-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 30/05/2023 09:54, Juergen Gross wrote:
> Some more cleanups of Xenstore.
> 
> Based on top of the previous Xenstore series "tools/xenstore: rework
> internal accounting".
> 
> Changes in V2:
> - rebase
> - one small modification of patch 10
> - added patches 11-13
> 
> Changes in V3:
> - rebase
> - modified patch 4
> - added patches 10, 11 and 13
> 
> Juergen Gross (16):
>    tools/xenstore: verify command line parameters better
>    tools/xenstore: do some cleanup of hashtable.c
>    tools/xenstore: modify interface of create_hashtable()
>    tools/xenstore: rename hashtable_insert() and let it return 0 on
>      success
>    tools/xenstore: make some write limit functions static
>    tools/xenstore: switch write limiting to use millisecond time base
>    tools/xenstore: remove stale TODO file
>    tools/xenstore: remove unused events list
>    tools/xenstore: remove support of file backed data base

I have committed up to here. I still need to review the rest.

Cheers,

-- 
Julien Grall

