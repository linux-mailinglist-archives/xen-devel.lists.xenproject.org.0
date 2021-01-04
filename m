Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7892E96E0
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 15:11:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61241.107578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwQZX-0006BU-LT; Mon, 04 Jan 2021 14:10:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61241.107578; Mon, 04 Jan 2021 14:10:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwQZX-0006B5-IS; Mon, 04 Jan 2021 14:10:59 +0000
Received: by outflank-mailman (input) for mailman id 61241;
 Mon, 04 Jan 2021 14:10:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rSMI=GH=infradead.org=peterz@srs-us1.protection.inumbo.net>)
 id 1kwQZW-0006Az-5I
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 14:10:58 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7639fb07-2f47-4a72-8478-1cb2a1a78b31;
 Mon, 04 Jan 2021 14:10:53 +0000 (UTC)
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1kwQYV-000ARY-9e; Mon, 04 Jan 2021 14:10:12 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 053F8306E0D;
 Mon,  4 Jan 2021 15:09:52 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id C30E8201B21B4; Mon,  4 Jan 2021 15:09:52 +0100 (CET)
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
X-Inumbo-ID: 7639fb07-2f47-4a72-8478-1cb2a1a78b31
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=a4nIuOPB7NGZ8PdC9/3vOs28zwMGea0v4ptxyiU4XUk=; b=JvBOTXsKEet40RlLCqk0Dc8kgX
	ozYvYdLqZof0hpKyyrYcTRocsOd+Y2Lzs8l2xMrrErXIybL7aVUu1C7RmJQEO37SBDyYbFULcf3yp
	aj7PGM1hnAzOx16RtPw47PAp01p5i+03GnvxPc15afuuAu1HcrspRVBLyuMrWpvOamrKCoDSCsUea
	TYz7qXg1E9gJo06MaKwCdVuayJP8z3AZMnlQdhmYLg/hdBzddGm+FrhSkRn2BJYxTQMkdKym8PonT
	fOj+9vFrulHq8RF3uN7deLHBxiRNE/9fJEK0YlbpQb5ONhBgqg0LF7roNm6x4itMwGa3UDOdsHnbl
	e7AvWcDg==;
Date: Mon, 4 Jan 2021 15:09:52 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org, Miroslav Benes <mbenes@suse.cz>,
	Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Subject: Re: [PATCH 3/3] objtool: Support stack layout changes in alternatives
Message-ID: <20210104140952.GQ3021@hirez.programming.kicks-ass.net>
References: <cover.1608700338.git.jpoimboe@redhat.com>
 <9f78604e49b400eb3b2ca613591f8c357474ed4e.1608700338.git.jpoimboe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f78604e49b400eb3b2ca613591f8c357474ed4e.1608700338.git.jpoimboe@redhat.com>

On Tue, Dec 22, 2020 at 11:18:10PM -0600, Josh Poimboeuf wrote:

> For example, this scenario is allowed:
> 
>           Alt1                    Alt2                    Alt3
> 
>    0x00   CALL *pv_ops.save_fl    CALL xen_save_fl        PUSHF
>    0x01                                                   POP %RAX
>    0x02                                                   NOP
>    ...
>    0x05                           NOP
>    ...
>    0x07   <insn>
> 

> This scenario is NOT allowed:
> 
>           Alt1                    Alt2
> 
>    0x00   CALL *pv_ops.save_fl    PUSHF
>    0x01                           NOP6
>    ...
>    0x07   NOP                     POP %RAX
> 

> The problem here is that offset-0x7, which is an instruction boundary in
> both possible instruction patch streams, has two conflicting stack
> layouts.

There's another fun scenario:

  0x00	CALL *pv_ops.save_fl		PUSHF
  0x01					NOP2
  ..
  0x03					NOP5
  ..
  0x07	NOP2
  0x08					POP %RAX
  0x09	<insn>

No conflicting boundary at 0x07, but still buggered.

Let me go read the actual patch to see if this is handled.

