Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC822212FB
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 18:51:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvkbw-0005ph-P7; Wed, 15 Jul 2020 16:50:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cSQs=A2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jvkbv-0005pc-OO
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 16:50:23 +0000
X-Inumbo-ID: 45c2e292-c6bb-11ea-9421-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 45c2e292-c6bb-11ea-9421-12813bfff9fa;
 Wed, 15 Jul 2020 16:50:22 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 92EA020663;
 Wed, 15 Jul 2020 16:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594831821;
 bh=MsnVDJvH5tGqYJ73GYPExLOKOnGhVsOzCRRS2prv6qE=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=iXhnZldnLaOlvUXB59a0CIHvgBFHcScVxFSaP3tyQG3ufL0QxzRcLoST9StJWX3Di
 ocda536tl0fZuzmUmNSDuiUneCezmx4W4m3Ejgt2wrpfwuxZGZp3/b1t/OqACt1YKd
 HUSpZk0icpuIDdfQxUe/V+JEat/3q/GQkp7NHZEY=
Date: Wed, 15 Jul 2020 09:50:20 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: incoming+61544a64d0c2dc4555813e58f3810dd7@incoming.gitlab.com, 
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH 00/12] tools: move more libraries into tools/libs
In-Reply-To: <20200715162511.5941-1-ian.jackson@eu.citrix.com>
Message-ID: <alpine.DEB.2.21.2007150945230.4124@sstabellini-ThinkPad-T480s>
References: <20200715162511.5941-1-ian.jackson@eu.citrix.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@dornerworks.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, ian.jackson@eu.citrix.com,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, 15 Jul 2020, Ian Jackson wrote:
> [ NB: this patch series is actually from Juergen Gross.
> 
>   It is being experiemntally handled as a Merge Reqeust in gitlab, in
>   part to see what problems there are with that workflow that will
>   need extra tooling or whatever.
> 
>   I have manually generated this series using git-format-patch,
>   scripts/add_maintainers.pl, and git-send-email.  I expect that if we
>   adopt this as a real workflow, we will want to make a robot do some
>   of that.
> 
>   I have set replies to go to the Gitlab comment thread and to
>   xen-devel.  Again this is experimental.  We are likely to need
>   something to automatically collect acks, at the very least.
> 
>   Reviewers: for now, please review this series as normal.  You may
>   reply to the messages by email.  Please, for now, send your replies
>   to gitlab and to the mailing list.  I think I have set the reply-to
>   appropriately.
> 
>   Alternatively you may review the code in the gitlab web UI.  But
>   please do not use the line-by-line comment system: write only to the
>   main MR discussion thread.

Thanks for doing this Ian.

I am curious about this: why not the line-by-line comment system? It
looks like it would be the most similar to emails comments. Is it
because comments done that way cannot be sent via email while the main
MR discussion thread can?

