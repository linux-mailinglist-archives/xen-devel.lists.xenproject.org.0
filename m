Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA46C3282EE
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 17:03:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91764.173085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGl11-0007kQ-5G; Mon, 01 Mar 2021 16:03:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91764.173085; Mon, 01 Mar 2021 16:03:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGl11-0007k1-25; Mon, 01 Mar 2021 16:03:23 +0000
Received: by outflank-mailman (input) for mailman id 91764;
 Mon, 01 Mar 2021 16:03:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGl0z-0007jw-UB
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 16:03:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGl0z-0003c4-QV
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 16:03:21 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGl0z-0000fU-OM
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 16:03:21 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lGl0v-0004lj-Li; Mon, 01 Mar 2021 16:03:17 +0000
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
	bh=ZxYWS+rnnb7blXjibjG9YU4SYx60p8jdQQGtcHnDqeQ=; b=Yy2H11I1wF603eb2Pxh7KPJFet
	NFTxZP9kUJ3c5KOu/b4S5DnXuzEnXwBS3Qsz/2XlH1sWhT7qRlaDsXlsXvp+ppPatwjnoPo4zJ8q7
	QojSICsTdUZV3dIKwYVAOB694VBY11S+LyOWJ54EmEV+yWtqb4zLFvG1dz6/BOAbLWX8=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24637.4165.400955.400473@mariner.uk.xensource.com>
Date: Mon, 1 Mar 2021 16:03:17 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 2/2][4.15?] x86: fix build when NR_CPUS == 1
In-Reply-To: <1d8d5089-32a9-9c42-5949-8f9cd20f33e0@suse.com>
References: <ad59eaf9-747c-f60e-16b7-121c9f86a1e0@suse.com>
	<1d8d5089-32a9-9c42-5949-8f9cd20f33e0@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("[PATCH 2/2][4.15?] x86: fix build when NR_CPUS == 1"):
> In this case the compiler is recognizing that no valid array indexes
> remain (in x2apic_cluster()'s access to per_cpu(cpu_2_logical_apicid,
> ...)), but oddly enough isn't really consistent about the checking it
> does (see the code comment).
...
> -        if (this_cpu == cpu || x2apic_cluster(this_cpu) != x2apic_cluster(cpu))
> +        if ( this_cpu == cpu )
> +            continue;
> +        /*
> +         * Guard in particular against the compiler suspecting out-of-bounds
> +         * array accesses below when NR_CPUS=1 (oddly enough with gcc 10 it
> +         * is the 1st of these alone which actually helps, not the 2nd, nor
> +         * are both required together there).
> +         */
> +        BUG_ON(this_cpu >= NR_CPUS);
> +        BUG_ON(cpu >= NR_CPUS);
> +        if ( x2apic_cluster(this_cpu) != x2apic_cluster(cpu) )
>              continue;

Is there some particular reason for not putting the BUG_ON before the
if test ?  That would avoid the refactoring.

Of course putting it in next to the array indexing would address that
too.

Ian.

