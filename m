Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5820F2DD4AC
	for <lists+xen-devel@lfdr.de>; Thu, 17 Dec 2020 16:57:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.56035.97791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpveT-0006Oj-A6; Thu, 17 Dec 2020 15:57:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56035.97791; Thu, 17 Dec 2020 15:57:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpveT-0006OJ-69; Thu, 17 Dec 2020 15:57:13 +0000
Received: by outflank-mailman (input) for mailman id 56035;
 Thu, 17 Dec 2020 15:57:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8YGc=FV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kpveR-0006OD-Dq
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 15:57:11 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c84f4168-ce21-4b98-8f7b-61f3252de7d0;
 Thu, 17 Dec 2020 15:57:10 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E494BAC7B;
 Thu, 17 Dec 2020 15:57:09 +0000 (UTC)
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
X-Inumbo-ID: c84f4168-ce21-4b98-8f7b-61f3252de7d0
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608220630; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TioOiW3tXkJRnbrvJbYYSVUNm2pWLcoihqS9C5v2D9o=;
	b=gmO961GS1gnDVWqUNeQXret7ivmTtr/z9ip7xxRy2SMxKypXX/20E5IUwwpTfKoUt9QRrI
	okcv/qa953HJVRZVJlkFRuZBagyW1DMisUHdTdj1Mi1gMX2GzrCy6cDNrru7oL6E3i0gHQ
	D2lXCh8ZKEDPhYitNkXPy2BydHvHUoI=
Subject: Re: [PATCH v3 7/8] xen/cpupool: add scheduling granularity entry to
 cpupool entries
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Dario Faggioli <dfaggioli@suse.com>,
 xen-devel@lists.xenproject.org
References: <20201209160956.32456-1-jgross@suse.com>
 <20201209160956.32456-8-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9cb6325b-09c2-29b7-1a78-09465bde9473@suse.com>
Date: Thu, 17 Dec 2020 16:57:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201209160956.32456-8-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09.12.2020 17:09, Juergen Gross wrote:
> @@ -1080,6 +1092,56 @@ static struct hypfs_entry *cpupool_dir_findentry(
>      return hypfs_gen_dyndir_id_entry(&cpupool_pooldir, id, cpupool);
>  }
>  
> +static int cpupool_gran_read(const struct hypfs_entry *entry,
> +                             XEN_GUEST_HANDLE_PARAM(void) uaddr)
> +{
> +    const struct hypfs_dyndir_id *data;
> +    const struct cpupool *cpupool;
> +    const char *gran;
> +
> +    data = hypfs_get_dyndata();
> +    cpupool = data->data;
> +    ASSERT(cpupool);

With this and ...

> +static unsigned int hypfs_gran_getsize(const struct hypfs_entry *entry)
> +{
> +    const struct hypfs_dyndir_id *data;
> +    const struct cpupool *cpupool;
> +    const char *gran;
> +
> +    data = hypfs_get_dyndata();
> +    cpupool = data->data;
> +    ASSERT(cpupool);

... this ASSERT() I'd like to first settle our earlier discussion,
before possibly giving my R-b here. No other remaining remarks from
my side.

Jan

