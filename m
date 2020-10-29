Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCAD29EEF3
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 15:58:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14248.35335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kY9NO-0004Vs-AO; Thu, 29 Oct 2020 14:58:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14248.35335; Thu, 29 Oct 2020 14:58:06 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kY9NO-0004VT-7M; Thu, 29 Oct 2020 14:58:06 +0000
Received: by outflank-mailman (input) for mailman id 14248;
 Thu, 29 Oct 2020 14:58:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o7xP=EE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kY9NN-0004VO-K2
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 14:58:05 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3d658816-b8f8-4ab3-9c98-c373480a6ad4;
 Thu, 29 Oct 2020 14:58:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 03EB5AC1F;
 Thu, 29 Oct 2020 14:58:04 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=o7xP=EE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kY9NN-0004VO-K2
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 14:58:05 +0000
X-Inumbo-ID: 3d658816-b8f8-4ab3-9c98-c373480a6ad4
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 3d658816-b8f8-4ab3-9c98-c373480a6ad4;
	Thu, 29 Oct 2020 14:58:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603983484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L3YiefnC/CQma9gjKaC1uS383M6pQmnClZZjwUeKzuc=;
	b=kUx9JMth1tmSQ0eWpKUEhCRwD6Pdt+GaHONo2BxZWFd7qXfl742bo/PttazrVaK5LzJ3vl
	q99JVwIP4eiMrFToSP6lzPM/fMFuNhs07aMcXPi4H3z0Rml7ZvB2VwaPvhWaUh7FS5LoY6
	m4/8E8YuiM9jMvtOnO71/B2KcPPDch4=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 03EB5AC1F;
	Thu, 29 Oct 2020 14:58:04 +0000 (UTC)
Subject: Re: [PATCH 12/12] xen/cpupool: make per-cpupool sched-gran hypfs node
 writable
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Dario Faggioli <dfaggioli@suse.com>,
 xen-devel@lists.xenproject.org
References: <20201026091316.25680-1-jgross@suse.com>
 <20201026091316.25680-13-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <18acae1b-eebc-26db-e11c-1847e4221e69@suse.com>
Date: Thu, 29 Oct 2020 15:58:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201026091316.25680-13-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.10.2020 10:13, Juergen Gross wrote:
> @@ -1088,13 +1098,58 @@ static int cpupool_gran_read(const struct hypfs_entry *entry,
>      return copy_to_guest(uaddr, name, strlen(name) + 1) ? -EFAULT : 0;
>  }
>  
> +static int cpupool_gran_write(struct hypfs_entry_leaf *leaf,
> +                              XEN_GUEST_HANDLE_PARAM(void) uaddr,
> +                              unsigned int ulen)
> +{
> +    const struct hypfs_dyndir_id *data;
> +    struct cpupool *cpupool;
> +    enum sched_gran gran;
> +    unsigned int sched_gran;
> +    char name[SCHED_GRAN_NAME_LEN];
> +    int ret = 0;
> +
> +    if ( ulen > SCHED_GRAN_NAME_LEN )
> +        return -ENOSPC;
> +
> +    if ( copy_from_guest(name, uaddr, ulen) )
> +        return -EFAULT;
> +
> +    sched_gran = sched_gran_get(name, &gran) ? 0
> +                                             : cpupool_check_granularity(gran);
> +    if ( memchr(name, 0, ulen) != (name + ulen - 1) || sched_gran == 0 )
> +        return -EINVAL;

I guess the memchr() check wants to happen before the call to
sched_gran_get()?

Jan

