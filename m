Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C56966DC6A
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 12:31:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479331.743119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHkAQ-0005ax-Kv; Tue, 17 Jan 2023 11:30:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479331.743119; Tue, 17 Jan 2023 11:30:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHkAQ-0005Y7-Ho; Tue, 17 Jan 2023 11:30:14 +0000
Received: by outflank-mailman (input) for mailman id 479331;
 Tue, 17 Jan 2023 11:30:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+MSG=5O=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1pHkAO-0005Xl-Gi
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 11:30:13 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d5e3275-965a-11ed-91b6-6bf2151ebd3b;
 Tue, 17 Jan 2023 12:30:11 +0100 (CET)
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pHk9l-005upc-23; Tue, 17 Jan 2023 11:29:35 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 064423005C9;
 Tue, 17 Jan 2023 12:29:40 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 808C2201C94A4; Tue, 17 Jan 2023 12:29:40 +0100 (CET)
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
X-Inumbo-ID: 4d5e3275-965a-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4dd1nPHSajeYfo138KPDTbRosWVLWxAJMDJHQavnKFE=; b=a6aKGxvXjkHxURoMeXnOaMqY7T
	JQ6hF/xzb92HYIEgt3cwLktllTNNk0uf/8i5bbNnySPTeuxsX6qpz/UwxLZp7ssM/Me7Rd7UePSoi
	1h5O0FpASKQtBAiJJliEUMPu7ESmw8EhriLJ28cKLTingDGX+rwJCIA+W1U32XJXDma/YhLvEProo
	KslYBSI+iHBVUUouKqpwqUsONdZeKX+M5hvTww6sI/hoPu3pmX/2/tdviLIXhf97GwM88MtqTuUVm
	8ovafHUDnVczSNpbj+BUM22p212dGl6S75mHVEVAsZij5E4QNhuosMnbeSbzHLOX56J0pzF2OZC7A
	whTdMhcw==;
Date: Tue, 17 Jan 2023 12:29:40 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: x86@kernel.org, Joan Bruguera <joanbrugueram@gmail.com>,
	linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Kees Cook <keescook@chromium.org>, mark.rutland@arm.com,
	Andrew Cooper <Andrew.Cooper3@citrix.com>,
	=?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v2 6/7] x86/power: Sprinkle some noinstr
Message-ID: <Y8aGpHgSOczqeEHf@hirez.programming.kicks-ass.net>
References: <20230116142533.905102512@infradead.org>
 <20230116143645.888786209@infradead.org>
 <Y8Zq2WaYmxnOjfk8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8Zq2WaYmxnOjfk8@gmail.com>

On Tue, Jan 17, 2023 at 10:31:05AM +0100, Ingo Molnar wrote:
> 
> * Peter Zijlstra <peterz@infradead.org> wrote:
> 
> > +	/*
> > +	 * Definitely wrong, but at this point we should have at least enough
> > +	 * to do CALL/RET (consider SKL callthunks) and this avoids having
> > +	 * to deal with the noinstr explosion for now :/
> > +	 */
> > +	instrumentation_begin();
> 
> BTW., readability side note: instrumentation_begin()/end() are the 
> misnomers of the century - they don't signal the start/end of instrumented 
> code areas like the name falsely & naively suggests, but the exact 
> opposite: start/end of *non-*instrumented code areas.

Nope, they do as they say on the tin.

noinstr void foo(void)
{
}

declares the whole function as non-instrumented.

Within such functions, we demark regions where instrumentation is
allowed by:

noinstr void foo(void)
{
	instrumentation_begin();
	/* code that calls non-noinstr functions goes here */
	instrumentation_end();
}

(note the double negative in the comment)

