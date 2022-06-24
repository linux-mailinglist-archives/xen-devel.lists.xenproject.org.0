Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7D455A219
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 21:51:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355885.583841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4pKB-0003F5-2z; Fri, 24 Jun 2022 19:50:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355885.583841; Fri, 24 Jun 2022 19:50:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4pKA-0003Bx-Vm; Fri, 24 Jun 2022 19:50:38 +0000
Received: by outflank-mailman (input) for mailman id 355885;
 Fri, 24 Jun 2022 19:50:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o4pK9-0003Br-7r
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 19:50:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4pK8-0006aX-OL; Fri, 24 Jun 2022 19:50:36 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238] helo=[192.168.4.76])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4pK8-0001q6-HS; Fri, 24 Jun 2022 19:50:36 +0000
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
	bh=tCMYDyGKBEyFr4nbKxbGiqy58oA2gpTKGvWP2roHCNY=; b=fW/kUOzTaAvMyV1nfLCS0pzkbS
	w3Q3UlyZByg8XMWXIlhfEtmNJAdlJN5UpTfGIBV6xf9Oucy3FIbQk+D6/h9OhR6ykgfGXKKTAn7xo
	VDslrcRB3SGrxis5xu/UAWSSSshQegAIvqz6FNpFCfaIt0rGa7evSoD1Y0Jc6N6ySsH0=;
Message-ID: <ae94da35-40d5-f65c-1df5-3ebde3aa86a3@xen.org>
Date: Fri, 24 Jun 2022 20:50:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH v7 9/9] xen: retrieve reserved pages on populate_physmap
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220620024408.203797-1-Penny.Zheng@arm.com>
 <20220620024408.203797-10-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220620024408.203797-10-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 20/06/2022 03:44, Penny Zheng wrote:
> When a static domain populates memory through populate_physmap at runtime,
> it shall retrieve reserved pages from resv_page_list to make sure that
> guest RAM is still restricted in statically configured memory regions.
> This commit also introduces a new helper acquire_reserved_page to make it work.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
> v7 changes:
> - remove the lock, since we add the page to rsv_page_list after it has
> been totally freed.

Hmmm... Adding the page after it has been totally freed doesn't mean you 
can get away with the lock. AFAICT you can still have concurrent 
free/allocate that could modify the list.

Therefore if you add/remove pages without the list, you would end up to 
corrupt the list.

If you disagree, then please point out which lock (or mechanism) will 
prevent concurrent access.

Cheers,

-- 
Julien Grall

