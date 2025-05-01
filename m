Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1FBAA58F1
	for <lists+xen-devel@lfdr.de>; Thu,  1 May 2025 02:14:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973961.1361966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAHXy-0005vq-Qw; Thu, 01 May 2025 00:13:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973961.1361966; Thu, 01 May 2025 00:13:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAHXy-0005tR-Nf; Thu, 01 May 2025 00:13:02 +0000
Received: by outflank-mailman (input) for mailman id 973961;
 Thu, 01 May 2025 00:13:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iHxF=XR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uAHXw-0005t2-JK
 for xen-devel@lists.xenproject.org; Thu, 01 May 2025 00:13:00 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08b480a6-2621-11f0-9eb4-5ba50f476ded;
 Thu, 01 May 2025 02:12:58 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 07A264AEEF;
 Thu,  1 May 2025 00:12:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D316BC4CEE7;
 Thu,  1 May 2025 00:12:54 +0000 (UTC)
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
X-Inumbo-ID: 08b480a6-2621-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746058376;
	bh=qAh1F7E/uG4Z4fl1EhRuCTzv/ukLfE8zGutjIKfRzWo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bKmdc7Cv6iYM8sVyRVKZ52NeLFZ5UQte3vGFNKNqijyZZDW10/1g+wsr4wv+6DdQO
	 p4XgL+ECdlmrZgzInsfXJi8EVpOML+Mm3XeK/8zo9VOgzurC3SjhkYVc6IZU8Dc2V/
	 VBPFpK/RARfGuL9akKjeNmAFBqQT7cCocfBmXjhNKcj12v6wXZuLElyPJ7qvgHEERT
	 uaTkyMGjuJtJDiSANR9yUUYxE8Ga32cFzayMmyI8/ko3s1hkWVWHwOp0Thcm//wvZ5
	 ubzJOTxo3j09UhG+K8ANHjyduWcdC+BRvexvrhxPWb+4RDSMeKAlYZV1Dbsl17D+xA
	 3MI25sOoK9sRQ==
Date: Wed, 30 Apr 2025 17:12:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Jan Beulich <jbeulich@suse.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH] {hyper,multi}call: further limit arguments to just 5
In-Reply-To: <8d4451ee-7de7-4fc1-a231-b51871d145db@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2504301712480.3879245@ubuntu-linux-20-04-desktop>
References: <5020c491-2037-4955-99ce-e6ba02b44aef@suse.com> <8d4451ee-7de7-4fc1-a231-b51871d145db@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 28 Apr 2025, Andrew Cooper wrote:
> On 29/04/2025 9:16 am, Jan Beulich wrote:
> > Multicall compat translation and hypercall continuation handling can
> > also be shrunk to the processing of just (up to) 5 arguments.
> >
> > Take the opportunity to
> > - make exceeding the limit noisy in hypercall_create_continuation(),
> > - use speculation-safe array access in hypercall_create_continuation(),
> > - avoid a Misra C:2012 Rule 19.1 violation in xlat_multicall_entry(),
> > - further tidy xlat_multicall_entry() and __trace_multicall_call()
> >   style-wise.
> >
> > Amends: 2f531c122e95 ("x86: limit number of hypercall parameters to 5")
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Arm side:

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


