Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E9E30E145
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 18:41:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81006.148857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7M98-0001VP-RA; Wed, 03 Feb 2021 17:40:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81006.148857; Wed, 03 Feb 2021 17:40:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7M98-0001V3-Nu; Wed, 03 Feb 2021 17:40:54 +0000
Received: by outflank-mailman (input) for mailman id 81006;
 Wed, 03 Feb 2021 17:40:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7M97-0001Uy-0A
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 17:40:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7M96-00054g-VX
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 17:40:52 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7M96-0001bU-Un
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 17:40:52 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l7M93-0005cv-ON; Wed, 03 Feb 2021 17:40:49 +0000
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
	bh=+pPG7fWcaxATMKgpOrR36TfBtaqoEQHGcUgT6kBeq6A=; b=IIHMTnrtd4B4U+fqcRI6PXl+11
	ZfW97+uwemjhHi9IorbRZZSK+BTYW4lEcqzzb6WAlPE1Hs8f4/cIakuziCazIDadH92m2FegqxtuW
	mzXyNmaMiEcsq5F+SQ5bdkFtzfhz23X+8GWFwTnL60/57dcknqMd94HxCqXvUETbny6U=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24602.57377.524847.811116@mariner.uk.xensource.com>
Date: Wed, 3 Feb 2021 17:40:49 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Edwin =?iso-8859-1?Q?T=F6r=F6k?= <edvin.torok@citrix.com>,
    "Christian  Lindig" <christian.lindig@citrix.com>,
    "Wei  Liu" <wl@xen.org>
Subject: Re: [PATCH 1/3] tools/oxenstored: Fix quota calculation for mkdir EEXIST
In-Reply-To: <20210203173549.21159-2-andrew.cooper3@citrix.com>
References: <20210203173549.21159-1-andrew.cooper3@citrix.com>
	<20210203173549.21159-2-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH 1/3] tools/oxenstored: Fix quota calculation for mkdir EEXIST"):
> From: Edwin Török <edvin.torok@citrix.com>
> 
> We increment the domain's quota on mkdir even when the node already exists.
> This results in a quota inconsistency after live update, where reconstructing
> the tree from scratch results in a different quota.
> 
> Not a security issue because the domain uses up quota faster, so it will only
> get a Quota error sooner than it should.
> 
> Found by the structured fuzzer.

Thanks for these.  They look like straightforward bugfixes, so they
don't need a release ack, but FTR

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

I don't feel qualified to give a maintainer-ack...

Ian.

