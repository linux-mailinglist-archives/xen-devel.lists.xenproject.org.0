Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6914EA2DF
	for <lists+xen-devel@lfdr.de>; Tue, 29 Mar 2022 00:26:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295601.503109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYxny-00084b-53; Mon, 28 Mar 2022 22:25:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295601.503109; Mon, 28 Mar 2022 22:25:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYxny-00082H-1S; Mon, 28 Mar 2022 22:25:42 +0000
Received: by outflank-mailman (input) for mailman id 295601;
 Mon, 28 Mar 2022 22:25:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9vXr=UH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nYxnw-00080g-25
 for xen-devel@lists.xenproject.org; Mon, 28 Mar 2022 22:25:40 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fdccb9c0-aee5-11ec-a405-831a346695d4;
 Tue, 29 Mar 2022 00:25:38 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id A016FCE1412;
 Mon, 28 Mar 2022 22:25:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D93E3C340F0;
 Mon, 28 Mar 2022 22:25:31 +0000 (UTC)
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
X-Inumbo-ID: fdccb9c0-aee5-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648506332;
	bh=HKNs+BPT0BTx0ydLHWPjNZmHlRPuW02CYMZrw1TQkF8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=W2UStj7ig350Brn3uSs8ouvlHwerHq9Jwiu9PnPeGjSRbmqLMnbrUTgp7V6auJxIe
	 q5/zQRTYsTpij8kFNup/89jXF9LT/Eo4BmCLrokmyMTgxZ0dYJPM8jaf64ifYfElpm
	 UJn0Xoq50T/x5GOHNbE+nH9sOO82k4/g2xT4iRXCQseWAcRjjiNuepRPn7f70nnHvL
	 3u9gqWIjrKKeMoQLJLKSuvcZF2POts6mKjrryP2Zo5JriVl+rLlaJctU0yl7EtKztp
	 9D9f7LBExfUfPyoWQVXcvT6PD+1D+soXO/9UUKxQSIXxyy68yC5OwEvVQroqklyaL1
	 3gMLYgXDTh38g==
Date: Mon, 28 Mar 2022 15:25:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Elliott Mitchell <ehem+xen@m5p.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org
Subject: Re: OS Headers hypercall.h/hypervisor.h
In-Reply-To: <Yj+ekdLdRa9U7dfa@mattapan.m5p.com>
Message-ID: <alpine.DEB.2.22.394.2203281523230.2910984@ubuntu-linux-20-04-desktop>
References: <Yj+ekdLdRa9U7dfa@mattapan.m5p.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 26 Mar 2022, Elliott Mitchell wrote:
> The hypercalls implementation for Linux and FreeBSD have two key headers,
> hypercall.h and hypervisor.h.  I'm curious why the implementations for
> x86 and ARM* are so distinct.
> 
> I found it fairly straightforward to implement ARM* versions of the x86
> _hypercall#() macros.  Once that is done, most of the wrappers in the x86
> hypercall.h can be moved to a shared hypervisor.h header.
> 
> Why does Xen/ARM on Linux still have hypercall.S when merging the
> headers should reduce maintainance?
> 
> Was GCC extended inline assembly language for ARM* thought too awful?
> 
> I'm also curious why these headers are part of the Linux kernel, instead
> of being maintained by the Xen Project?

I would have to dig through ancient archives to give you a full answer
but the reason was that the asm inline on ARM didn't provide enough
guarantees on ordering and registers it would use and clobber.

