Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE8A392855
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 09:16:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132842.247728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmAFL-0000Fy-Un; Thu, 27 May 2021 07:15:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132842.247728; Thu, 27 May 2021 07:15:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmAFL-0000Ct-R0; Thu, 27 May 2021 07:15:59 +0000
Received: by outflank-mailman (input) for mailman id 132842;
 Thu, 27 May 2021 07:15:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HjtO=KW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lmAFJ-0000Cn-Tz
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 07:15:57 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ba0f1b88-0bec-4086-b892-35dc8f9ff801;
 Thu, 27 May 2021 07:15:57 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3E5922190A;
 Thu, 27 May 2021 07:15:56 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 0380611A98;
 Thu, 27 May 2021 07:15:55 +0000 (UTC)
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
X-Inumbo-ID: ba0f1b88-0bec-4086-b892-35dc8f9ff801
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622099756; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GSFiw99vkDCfksJCNjMxSg92+xJbb+84PggazZo4UNQ=;
	b=UaStFBVOwTw2qcPAOAW7vraK2N7AzDnpdx9IlNm++93MrHbQnf7BhQmtxsysPkePL/Fd4p
	efP49B6rmJDSKSd0uLKSuwCZCExtu9P4/rs4Ht+3yjMLPmWL8b1SfdODyxxk2Vz4FXdgUi
	2dkOszpTLvUBOHRE/xqgTnTI3LAfxQ0=
Subject: Re: [PATCH v2] xen/page_alloc: Remove dead code in
 alloc_domheap_pages()
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210526161129.28572-1-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b449be48-cded-b1a2-5086-d4d6856ed5dc@suse.com>
Date: Thu, 27 May 2021 09:15:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210526161129.28572-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.05.2021 18:11, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Since commit 1aac966e24e9 "xen: support RAM at addresses 0 and 4096",
> bits_to_zone() will never return 0 and it is expected that we have
> minimum 2 zones.
> 
> Therefore the check in alloc_domheap_pages() is unnecessary and can
> be removed. However, for sanity, it is replaced with an ASSERT().
> 
> Also take the opportunity to switch from min_t() to min() as
> bits_to_zone() cannot return a negative value. The macro is tweaked
> to make it clearer.
> 
> This bug was discovered and resolved using Coverity Static Analysis
> Security Testing (SAST) by Synopsys, Inc.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ---
>     Changes in v2:
>         - Remove BUILD_BUG_ON()
>         - Switch from min_t() to min()

Since this fulfills the dependencies put in place at the time, the
Reviewed-by: Jan Beulich <jbeulich@suse.com>
continues to apply here. Thanks for making the adjustments.

Jan

