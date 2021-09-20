Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB50411331
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 12:57:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.190760.340546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSGzR-0005IO-EJ; Mon, 20 Sep 2021 10:57:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 190760.340546; Mon, 20 Sep 2021 10:57:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSGzR-0005FD-BE; Mon, 20 Sep 2021 10:57:37 +0000
Received: by outflank-mailman (input) for mailman id 190760;
 Mon, 20 Sep 2021 10:57:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mSGzP-0005Eq-QE
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 10:57:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mSGzP-00059v-PT
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 10:57:35 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mSGzP-0000Qo-Oh
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 10:57:35 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mSGzL-0005ao-0w; Mon, 20 Sep 2021 11:57:31 +0100
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
	bh=00zV4tK66LUBzcj89z3S80Eid7EFag8wE6U1xr8Zs5g=; b=UDBpHhqk4IkGG8Tyw4PJU0iY3Q
	A/U+Y+R3sNyUKqDZVXQH5yQg/OEPX76K6f7qhgZ3KXeItlPZTu5VQdM2lqSkG+jQE3vrLnG3ttx79
	C40UciiYdAfhVottGv2FWZqgG3abWhh2Gu1SSGjkW2oMwp/FbIyz4Vm8qT//lgf842X4=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24904.26906.715083.732081@mariner.uk.xensource.com>
Date: Mon, 20 Sep 2021 11:57:30 +0100
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Juergen Gross <jgross@suse.com>,
    <xen-devel@lists.xenproject.org>,
    "Wei  Liu" <wl@xen.org>,
    Julien Grall <julien@xen.org>
Subject: Re: [PATCH 4/6] tools/xenstored: use atexit to close interfaces
In-Reply-To: <YUhoLnpv+Dq/dFBR@MacBook-Air-de-Roger.local>
References: <20210917154625.89315-1-roger.pau@citrix.com>
	<20210917154625.89315-5-roger.pau@citrix.com>
	<90f64a21-d5fc-fab3-2f3c-73de00421cb3@suse.com>
	<YUhoLnpv+Dq/dFBR@MacBook-Air-de-Roger.local>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monné writes ("Re: [PATCH 4/6] tools/xenstored: use atexit to close interfaces"):
> On Mon, Sep 20, 2021 at 11:22:15AM +0200, Juergen Gross wrote:
> > Could you please add closing of xce_handle(), too?
> 
> Sure, I somehow assumed there was a reason for not closing it related
> to live update, but I see that's not the case as you use exec to
> launch the new image and atexit handlers are not called in that case.

Are these fds marked CLOEXEC ?  I don't think they are BICBW.
It would probably be good idea to make them so.  An fd leak might
result in one fd being consumed per live update operation.

Ian.

