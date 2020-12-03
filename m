Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 047262CD9BA
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 16:00:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43716.78556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkq5O-00073c-38; Thu, 03 Dec 2020 14:59:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43716.78556; Thu, 03 Dec 2020 14:59:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkq5N-00073F-VJ; Thu, 03 Dec 2020 14:59:57 +0000
Received: by outflank-mailman (input) for mailman id 43716;
 Thu, 03 Dec 2020 14:59:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vSHx=FH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kkq5M-00072j-Ng
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 14:59:56 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 53321761-819b-4c81-981f-30f84b9f9c33;
 Thu, 03 Dec 2020 14:59:55 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D3822ABCE;
 Thu,  3 Dec 2020 14:59:54 +0000 (UTC)
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
X-Inumbo-ID: 53321761-819b-4c81-981f-30f84b9f9c33
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607007595; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pSg9rmsjxLjre1vdrJTkpLratowiaDvXfmL0E9g5R6s=;
	b=u5gI8699UbcKNvZ99xU2yxsZvbUrGYNbcf6PaNCCFTDfIZQ1isJllL+M2Kh2GpQQO3fzew
	SReP1jXyQsIFOnto2+bgY8pqyahAUYUaH3Ev3fEfM33CGgPQkEruwLYix2mu3J9sB5qbGe
	KHuwCI4uzzYd75zH1X2Fx2w6cP2xfLs=
Subject: Re: [PATCH v2 12/17] xen/hypfs: add new enter() and exit() per node
 callbacks
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-13-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0c57dd86-36d9-c378-6bdb-50221a7812b8@suse.com>
Date: Thu, 3 Dec 2020 15:59:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201201082128.15239-13-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01.12.2020 09:21, Juergen Gross wrote:
> In order to better support resource allocation and locking for dynamic
> hypfs nodes add enter() and exit() callbacks to struct hypfs_funcs.
> 
> The enter() callback is called when entering a node during hypfs user
> actions (traversing, reading or writing it), while the exit() callback
> is called when leaving a node (accessing another node at the same or a
> higher directory level, or when returning to the user).
> 
> For avoiding recursion this requires a parent pointer in each node.
> Let the enter() callback return the entry address which is stored as
> the last accessed node in order to be able to use a template entry for
> that purpose in case of dynamic entries.

I guess I'll learn in subsequent patches why this is necessary /
useful. Right now it looks odd for the function to simple return
the incoming argument, as this way it's clear the caller knows
the correct value already.

> @@ -100,11 +112,58 @@ static void hypfs_unlock(void)
>      }
>  }
>  
> +const struct hypfs_entry *hypfs_node_enter(const struct hypfs_entry *entry)
> +{
> +    return entry;
> +}
> +
> +void hypfs_node_exit(const struct hypfs_entry *entry)
> +{
> +}
> +
> +static int node_enter(const struct hypfs_entry *entry)
> +{
> +    const struct hypfs_entry **last = &this_cpu(hypfs_last_node_entered);
> +
> +    entry = entry->funcs->enter(entry);
> +    if ( IS_ERR(entry) )
> +        return PTR_ERR(entry);
> +
> +    ASSERT(!*last || *last == entry->parent);
> +
> +    *last = entry;
> +
> +    return 0;
> +}
> +
> +static void node_exit(const struct hypfs_entry *entry)
> +{
> +    const struct hypfs_entry **last = &this_cpu(hypfs_last_node_entered);
> +
> +    if ( !*last )
> +        return;

Under what conditions is this legitimate to happen? IOW shouldn't
there be an ASSERT_UNREACHABLE() here?

Jan

