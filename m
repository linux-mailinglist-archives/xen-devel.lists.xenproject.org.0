Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0743FC9A9
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 16:23:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175827.320177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL4fI-0008JC-Ds; Tue, 31 Aug 2021 14:23:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175827.320177; Tue, 31 Aug 2021 14:23:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL4fI-0008GV-AZ; Tue, 31 Aug 2021 14:23:04 +0000
Received: by outflank-mailman (input) for mailman id 175827;
 Tue, 31 Aug 2021 14:23:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mL4fH-0008GN-Ml
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 14:23:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mL4fH-0007dN-M4
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 14:23:03 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mL4fH-0006fJ-K8
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 14:23:03 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mL4fB-0005UC-82; Tue, 31 Aug 2021 15:22:57 +0100
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
	bh=CG/7Y2lTvQyp/HOiyvzDrrJP0UEvnQuhxgt4gdeQuWo=; b=rGFYQ82uLXeKzrTpOvMEq6NdQp
	VzSrld35Pu8g7uDgPnGUIjBvo0hurGxhYFaUiE1luLI41Ycfqhf943uf1eZEXt9cQ+QKxjdH5htVX
	LxFwSxVt00jhAr1M2KdfSm3ZjAFjoccYuITK6zfYevU9O4zrITrj2sy9MEuVMxiv9hrs=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24878.15168.981558.748531@mariner.uk.xensource.com>
Date: Tue, 31 Aug 2021 15:22:56 +0100
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>,
    Juergen Gross <jgross@suse.com>,
    <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 2/2] tools/xenstore: set open file descriptor limit for
 xenstored
In-Reply-To: <9352f82a-1b43-4bf6-8b0a-5916627b7537@citrix.com>
References: <20210730122643.2043-1-jgross@suse.com>
	<20210730122643.2043-3-jgross@suse.com>
	<24836.28.655841.510063@mariner.uk.xensource.com>
	<81a39ab5-5588-65ad-f1a1-7bfe0379b394@xen.org>
	<6ced9858-d425-887c-0045-1aad8521b826@suse.com>
	<c0a6bb5a-3bd8-b1cf-9973-7a95b347befc@xen.org>
	<9352f82a-1b43-4bf6-8b0a-5916627b7537@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("Re: [PATCH v3 2/2] tools/xenstore: set open file descriptor limit for xenstored"):
> xenstored is TCB.  It needs a large number of FDs, and can be trusted
> with unlimited.

I baseically agree with this.

> Also, like xenconsoled, we can calculate an upper bound, which is
> derived from the ABI limit of 32k domids.

IMO the default should support at leaat this much.

However, I don't think you are right, because xenstored offers console
connections to (possibly arbitrarily many) local socket connections.

> All you're haggling over is the error semantics in the case of:
> 1) the upper bound calculation is wrong, or
> 2) there is an fd leak
> 
> Personally, I think a fixed calculation is right, so fd leaks can be
> spotted more obviously.
> 
> An admin knob is not helpful - higher than the upper bound is just
> wasteful, while lower will cause malfunctions.

I don't agree.  Firstly, on a technical level, your statement is true
only if the admin does not know they will be running a much smaller
number of domains.  Secondly, we have had several people saying they
want this to be configurable.  I think if several people say they want
something to be configurable, we should respect that, even if we think
the use cases for it are marginal.  If there are hazards in bad
settings of such a know, that can be dealt with in the docs.

Julien's point about not having the limit set by xenstored itself is
very well taken.

ISTM that the following scheme is in the intersection of everyone's
requirements:

 * The limit will be adjusted/imposed in the startup script.
 * An /etc/{default,sysconfig} parameter will be provided to
   adjust the setting.
 * The default should be `unlimtied` since we cannot calculate
   a safe upper bound for all configurations.
 * Systems like Citrix Hypervisor (XenServer) which can calculate
   a safe upper bound can do so, and adjust the default, enabling
   them to spot fd leaks.

Ian.

