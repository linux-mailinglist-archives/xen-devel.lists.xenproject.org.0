Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 020D443CF77
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 19:08:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217142.377010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfmP0-0006Vb-6k; Wed, 27 Oct 2021 17:07:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217142.377010; Wed, 27 Oct 2021 17:07:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfmP0-0006TN-3G; Wed, 27 Oct 2021 17:07:50 +0000
Received: by outflank-mailman (input) for mailman id 217142;
 Wed, 27 Oct 2021 17:07:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mfmOy-0006ST-K2
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 17:07:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mfmOy-0000E5-J5
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 17:07:48 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mfmOy-0000Uc-IG
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 17:07:48 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mfmOj-0007zu-Rh; Wed, 27 Oct 2021 18:07:33 +0100
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
	bh=PAlChERQT9Splk172v3rgtHgay6giGcKCHV4DS1ABJ8=; b=36cZ3uepc1sjCeWx+WaTmUsJf3
	FSdfT3rmnCNJ8Si5K+LaFF03iIznMv3zAmHlYybzxHI0450QAV3xIAx0CaNRH5aDzSOCYTRxMqAZA
	fcRFaMWa8wZf63fjlCKHBmuKbJiFHbTqXwMHh3MAb2tL2xPTFGbbkeOnUSgwKc/qST0w=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24953.34635.645112.279110@mariner.uk.xensource.com>
Date: Wed, 27 Oct 2021 18:07:23 +0100
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    "julien\@xen.org" <julien@xen.org>,
    "sstabellini\@kernel.org" <sstabellini@kernel.org>,
    Bertrand  Marquis <bertrand.marquis@arm.com>,
    Rahul Singh <rahul.singh@arm.com>
Subject: Re: [PATCH] xen/arm: fix SBDF calculation for vPCI MMIO handlers
In-Reply-To: <0bbe4d1d-421d-e816-42aa-f43581902a02@epam.com>
References: <20211027082533.1406015-1-andr2000@gmail.com>
	<YXkU+DKYmvwo+kak@Air-de-Roger>
	<0bbe4d1d-421d-e816-42aa-f43581902a02@epam.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Oleksandr Andrushchenko writes ("Re: [PATCH] xen/arm: fix SBDF calculation for vPCI MMIO handlers"):
> P.S. Sorry I failed to mark this patch as a fix for 4.16 and explain why it is
> a good candidate for 4.16 inclusion

Hello :-).

Um, can you explain what the practical impact is of not taking this
patch for 4.16 ?  As I understand it vpci for ARM is non-functional in
4.16 and this is not expected to change ?  So there would be no
benefit to users, and taking the patch would add small but nonzero
risk ?

I think according to the freeze policy I set this can go in if the
maintainers feel it is a "straightforward bugfix", but provided it
goes in by the end of this coming Friday.

After that it will need a release-ack and right now, unless I am
mistaken (which may well be the case) it can just as well wait ?

Thanks,
Ian.

