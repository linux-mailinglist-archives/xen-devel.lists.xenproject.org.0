Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8362453857
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 18:13:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226462.391388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn20d-000191-7R; Tue, 16 Nov 2021 17:12:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226462.391388; Tue, 16 Nov 2021 17:12:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn20d-00016O-4D; Tue, 16 Nov 2021 17:12:39 +0000
Received: by outflank-mailman (input) for mailman id 226462;
 Tue, 16 Nov 2021 17:12:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mn20c-00016I-3J
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 17:12:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mn20c-0000O4-2E
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 17:12:38 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mn20c-00089V-0m
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 17:12:38 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mn20O-0000nr-L5; Tue, 16 Nov 2021 17:12:24 +0000
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
	bh=4UF8BTUsNb5lVRkgim5z53VVEfvYxZ02EiNWg3/E4dk=; b=zYh+4nIM6+6u4Xvx2d2u8kNqXh
	EIkluhqyTJ92/Y4HAxS/L2w2yxQtytT+bBFkbcZDEU92JArYG/uj2SZCMNRXICrRvNcaRyY7sYia9
	yE7Wme88vLEkrb2zJhiHzCRUycjkMBzIs8Uz6LPr9dzHKTidiCYmAor1IAxGyOKq1Fic=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24979.58990.409475.7896@mariner.uk.xensource.com>
Date: Tue, 16 Nov 2021 17:12:14 +0000
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH for-4.16 4/4] tools/python: fix python libxc bindings to pass a max grant version
In-Reply-To: <20211115121741.3719-5-roger.pau@citrix.com>
References: <20211115121741.3719-1-roger.pau@citrix.com>
	<20211115121741.3719-5-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monne writes ("[PATCH for-4.16 4/4] tools/python: fix python libxc bindings to pass a max grant version"):
> Such max version should be provided by the caller, otherwise the
> bindings will default to specifying a max version of 2, which is
> inline with the current defaults in the hypervisor.
> 
> Fixes: 7379f9e10a ('gnttab: allow setting max version per-domain')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Cc: Ian Jackson <iwj@xenproject.org>
> 
> Without this fix the python bindings won't be usable, as they will
> attempt to pass a max version of 0 which will be refused by the
> hypervisor. The main risk would be breaking the bindings, but given
> the current state it's unlikely to result in a worse outcome.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

