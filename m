Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B56E4419CC
	for <lists+xen-devel@lfdr.de>; Mon,  1 Nov 2021 11:25:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219087.379731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhUVe-0005WX-LM; Mon, 01 Nov 2021 10:25:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219087.379731; Mon, 01 Nov 2021 10:25:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhUVe-0005U1-I5; Mon, 01 Nov 2021 10:25:46 +0000
Received: by outflank-mailman (input) for mailman id 219087;
 Mon, 01 Nov 2021 10:25:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mhUVd-0005Tv-Iw
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 10:25:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mhUVd-0005M4-IG
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 10:25:45 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mhUVd-0005dG-HK
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 10:25:45 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mhUVW-0004eC-QJ; Mon, 01 Nov 2021 10:25:38 +0000
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:CC:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=klPRxQC5wAKP9DcnwRGu1wZSa/yz5tGiI9VDXmMFkF4=; b=TTh9r5hUJskAU41XnnB35vtcDd
	NCp3n6waIoG7U+yiDoJQszPyRw7V0WA1wVxYYMBN0+Ub7tNgvRBhEbJltCpSyNroi0oKCgp7j8W5i
	LznlXsmrGINGNd8seg50AN/fAM/HXyU76k08C0tO282VeijnlKyKQjPAc7K87KfJexfo=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24959.49313.936961.936820@mariner.uk.xensource.com>
Date: Mon, 1 Nov 2021 10:25:37 +0000
To: Julien Grall <julien@xen.org>,
    Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    "sstabellini@kernel.org" <sstabellini@kernel.org>,
    Bertrand  Marquis <bertrand.marquis@arm.com>,
    Rahul Singh <rahul.singh@arm.com>
Subject: Re: [PATCH] xen/arm: fix SBDF calculation for vPCI MMIO handlers [and 2 more messages]
In-Reply-To: <24953.34635.645112.279110@mariner.uk.xensource.com>,
	<24954.51153.588540.850154@mariner.uk.xensource.com>,
	<d7e4ae66-f648-e18e-79c8-fae6eb896f00@xen.org>
References: <20211027082533.1406015-1-andr2000@gmail.com>
	<cb7e9ef7-476e-93c3-d3c9-9a9ebc61003d@xen.org>
	<d63c6e0b-8aa3-9ba3-893c-5e464638a8db@epam.com>
	<65886734-7333-4469-fcc1-6916db708f13@xen.org>
	<b6bb02b6-6358-b5e0-1b80-7819aadabe10@epam.com>
	<6d8f1061-7aec-2c1a-aaf4-c30440c2797a@xen.org>
	<38da2edd-06a2-63d0-51ad-1284272c8da5@epam.com>
	<a74b52fb-6514-4187-17fe-b63236efa0ce@xen.org>
	<24954.51153.588540.850154@mariner.uk.xensource.com>
	<d7e4ae66-f648-e18e-79c8-fae6eb896f00@xen.org>
	<YXkU+DKYmvwo+kak@Air-de-Roger>
	<0bbe4d1d-421d-e816-42aa-f43581902a02@epam.com>
	<24953.34635.645112.279110@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("Re: [PATCH] xen/arm: fix SBDF calculation for vPCI MMIO handlers"):
> On 28/10/2021 16:54, Ian Jackson wrote:
> > There are a number of patches that I'm getting CC'd on related to ARM
> > and vpci (according to the Subject).  Are these targeted for 4.16 ?
> > Most of them don't have 4.16 Subject tags.
> 
> Oleksandr wants this patch to be included for 4.16 but forgot to tag it 
> properly.

Oh yes.  However,

1. I also wrote this:

> > I am finding it difficult to see the wood for the trees.
> > It would be really helpful if these vpci fixes were collected
> > together into a series.

Can someone please confirm whether this is the only vpci-related patch
that ought to be on my radar for 4.16 ?

2. I have not had a reply to my question on Wednesday in
<24953.34635.645112.279110@mariner.uk.xensource.com>:

  Um, can you explain what the practical impact is of not taking this
  patch for 4.16 ?  As I understand it vpci for ARM is non-functional in
  4.16 and this is not expected to change ?  So there would be no
  benefit to users, and taking the patch would add small but nonzero
  risk ?

I need this information to decide whether a release-ack is
appropriate.

Note that we are in code freeze so all patches, including bugfixes,
need my ack.

Thanks,
Ian.

