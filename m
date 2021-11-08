Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 422C044821B
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 15:47:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223402.386097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk5v4-0002Q3-Py; Mon, 08 Nov 2021 14:46:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223402.386097; Mon, 08 Nov 2021 14:46:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk5v4-0002O9-Ml; Mon, 08 Nov 2021 14:46:46 +0000
Received: by outflank-mailman (input) for mailman id 223402;
 Mon, 08 Nov 2021 14:46:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mk5v3-0002O3-On
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 14:46:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mk5v3-0006C6-Ni
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 14:46:45 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mk5v3-0003FB-N0
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 14:46:45 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mk5uy-00015b-CE; Mon, 08 Nov 2021 14:46:40 +0000
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
	bh=valNkcBpZZCxToSciyUCrcUArWYfJZR+re/qqKWo2Ek=; b=TeBpHJugL+hS82VvNhTxjnDk+U
	CcLDpk+MEu8F2QAAwJsmOC9TXekn+VaCEBD0VNj07Ah95aDj/PXKuhBURcRGUBTIHW/y9Ypt2o/D8
	UZDNOTQ8mCnqgedStdiiRxwvIkNdkFCVCi+aMx94NgCn23eHouARd1+n/iheNoTbknSM=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24969.14415.979563.323346@mariner.uk.xensource.com>
Date: Mon, 8 Nov 2021 14:46:39 +0000
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
    <xen-devel@lists.xenproject.org>,
    "Wei  Liu" <wl@xen.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Anthony PERARD <anthony.perard@citrix.com>,
    "Juergen Gross" <jgross@suse.com>,
    Christian Lindig <christian.lindig@citrix.com>,
    David Scott <dave@recoil.org>,
    Volodymyr  Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH for-4.16 v6] gnttab: allow setting max version per-domain
In-Reply-To: <YYPkx7148Ive/352@Air-de-Roger>
References: <20211104104834.10977-1-roger.pau@citrix.com>
	<24963.52610.316896.770905@mariner.uk.xensource.com>
	<8ae2c1ac-b220-a5ab-920b-244590ae3ef0@suse.com>
	<YYPkx7148Ive/352@Air-de-Roger>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monné writes ("Re: [PATCH for-4.16 v6] gnttab: allow setting max version per-domain"):
>  Overall I think it's best to
> express supported grant versions independently, and we might wish to
> also allow to select a discrete set of grant versions that a domain
> supports. IMO it might be sensible in the future if a new grant
> version appears (v3), to select to expose grant v1 and v3 only to the
> domain, and avoid v2. This would require some changes here, but we can
> see about those when the time comes.

I'm not sure what layer we're talking about here.  The patch
introduces a max version into the libxl api.  Is there any significant
chance of a v3 (and hence, wanting to change the api) any time soon ?

Ian.

