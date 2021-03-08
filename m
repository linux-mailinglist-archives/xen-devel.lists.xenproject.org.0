Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F0B331360
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 17:28:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95020.179200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJIjQ-0005mn-PG; Mon, 08 Mar 2021 16:27:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95020.179200; Mon, 08 Mar 2021 16:27:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJIjQ-0005mO-Kt; Mon, 08 Mar 2021 16:27:44 +0000
Received: by outflank-mailman (input) for mailman id 95020;
 Mon, 08 Mar 2021 16:27:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jF2O=IG=infradead.org=peterz@srs-us1.protection.inumbo.net>)
 id 1lJIjM-0005mJ-Tr
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 16:27:43 +0000
Received: from desiato.infradead.org (unknown
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f9a78ac1-8076-4c5b-bcd8-0332c0badef2;
 Mon, 08 Mar 2021 16:27:34 +0000 (UTC)
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lJIj9-0010v4-3I; Mon, 08 Mar 2021 16:27:27 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id D9C88300238;
 Mon,  8 Mar 2021 17:27:25 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id AD72623662BE0; Mon,  8 Mar 2021 17:27:25 +0100 (CET)
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
X-Inumbo-ID: f9a78ac1-8076-4c5b-bcd8-0332c0badef2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VZ1ywut6hjotzCNJblmbhmr/ur93FTUuoN2sXgKzb0A=; b=f3apT4ncojFpFX4giPDwk/8u6j
	X/AOL90fouIeILOR/6POsveFPJ5niQtwspFjYFur87BAFnBTQT3m03vwoJ6R1fMibe6p7M43yIV5P
	xaBnhjZsII2w1XzP3CVmK82D+xsrU3RVDU3HQJSoBzeHLTUDE4NzfgJ5aWAuzLbA5aAwpZt7E0lbC
	DoFVg6zcPFd0YQYUk31AoI1nZ6fvXLBZiDdcr04hhmSynYz6rAzdnuWCNJDBr2KNc89Eh1jqa8bzm
	Zm2jfjJ8UOWDMl9S7+TcSU5Qo+o1KjKmjAeFiKZckIv9sa9HOuoT6VPwQOZ5F5WEKu5y3iy50fEEF
	SLMASU5w==;
Date: Mon, 8 Mar 2021 17:27:25 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Jason Baron <jbaron@akamai.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v5 01/12] staticcall: move struct static_call_key
 definition to static_call_types.h
Message-ID: <YEZQbTjQ3GD4KaGS@hirez.programming.kicks-ass.net>
References: <20210308122844.30488-1-jgross@suse.com>
 <20210308122844.30488-2-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210308122844.30488-2-jgross@suse.com>

On Mon, Mar 08, 2021 at 01:28:33PM +0100, Juergen Gross wrote:
> Having the definition of static_call() in static_call_types.h makes
> no sense as long struct static_call_key isn't defined there, as the
> generic implementation of static_call() is referencing this structure.
> 
> So move the definition of struct static_call_key to static_call_types.h.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

s/staticcall/static_call/ on $Subject

