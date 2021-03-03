Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9800F32B91E
	for <lists+xen-devel@lfdr.de>; Wed,  3 Mar 2021 17:13:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92911.175216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHU7u-0008Dj-OJ; Wed, 03 Mar 2021 16:13:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92911.175216; Wed, 03 Mar 2021 16:13:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHU7u-0008DK-L4; Wed, 03 Mar 2021 16:13:30 +0000
Received: by outflank-mailman (input) for mailman id 92911;
 Wed, 03 Mar 2021 16:13:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHU7t-0008DE-7e
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 16:13:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHU7t-00047G-6a
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 16:13:29 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHU7t-000671-4g
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 16:13:29 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lHU7p-0002XI-R3; Wed, 03 Mar 2021 16:13:25 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=t9zfV1xj2E20FwAy3XESBfB5/2UjYWjQDHlxNRG89NE=; b=Qtg5495PJx6mbn5b6lCkwSK8Rt
	dvbCXghdUBCvTF3+OkYLxPoG57+ND/TcBUcI6wX+m5aOE68kURFZkq8JyjXBc22tuXGGVg5+QKgkh
	bxDl/Mb8TghKLdXjqss0U+UbH+1+ksHfUtX3y1m4GisuvMoJMUV03D7kxXV0etdG6n4o=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24639.46501.489245.30690@mariner.uk.xensource.com>
Date: Wed, 3 Mar 2021 16:13:25 +0000
To: Norbert Manthey <nmanthey@amazon.de>
Cc: <xen-devel@lists.xenproject.org>,
    Juergen Gross <jgross@suse.com>,
    Wei Liu <wl@xen.org>,
    Julien Grall <jgrall@amazon.co.uk>,
    Michael Kurth <mku@amazon.de>
Subject: Re: [PATCH XENSTORE v1 09/10] xs: handle daemon socket error
In-Reply-To: <20210226144144.9252-10-nmanthey@amazon.de>
References: <20210226144144.9252-1-nmanthey@amazon.de>
	<20210226144144.9252-10-nmanthey@amazon.de>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Norbert Manthey writes ("[PATCH XENSTORE v1 09/10] xs: handle daemon socket error"):
> When starting the daemon, we might see a NULL pointer instead of the
> path to the socket.
> 
> Only relevant in case we start the process in a very deep directory
> path, with a length close to 4096 so that appending "/socket" would
> exceed the limit. Hence, such an error is unlikely, but should still be
> fixed to not result in a NULL pointer dereference.

This description talks about starting the daemon ...

> ---
>  tools/libs/store/xs.c | 3 +++
>  1 file changed, 3 insertions(+)

But I think ...

> +	if (!connect_to)
> +		return NULL;
> +

... this is client code ?

Apologies if I am confused.

Ian.

