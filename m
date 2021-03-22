Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40194344738
	for <lists+xen-devel@lfdr.de>; Mon, 22 Mar 2021 15:32:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100245.190897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOLbP-0007ov-A6; Mon, 22 Mar 2021 14:32:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100245.190897; Mon, 22 Mar 2021 14:32:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOLbP-0007oW-6l; Mon, 22 Mar 2021 14:32:19 +0000
Received: by outflank-mailman (input) for mailman id 100245;
 Mon, 22 Mar 2021 14:32:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lOLbN-0007oH-P5
 for xen-devel@lists.xenproject.org; Mon, 22 Mar 2021 14:32:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lOLbN-0005EU-Np
 for xen-devel@lists.xenproject.org; Mon, 22 Mar 2021 14:32:17 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lOLbN-0002Ba-Mn
 for xen-devel@lists.xenproject.org; Mon, 22 Mar 2021 14:32:17 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lOLbK-0000AQ-Bs; Mon, 22 Mar 2021 14:32:14 +0000
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
	bh=mmQETQBI35ScJsVnqDaaPgevsGpc2rmSd+HCoW5ptp4=; b=53Yk5vfoJ6kbcZwZnu5ze/huAR
	KSC6al/GJx9AnzrazCZMtVCO4GAgWCDr/B96fILZPahIgjOt2IRTNNf3UybUBxcVUKN5pI1af6wUo
	ZMtPAewROMgwFm3oah81fx8D6crKK4Z3P5UpRnLtfBQ+9zRBD9oeA2ltuN3heFuKoi7Y=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24664.43630.78608.264828@mariner.uk.xensource.com>
Date: Mon, 22 Mar 2021 14:32:14 +0000
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Daniel P. =?iso-8859-1?Q?Berrang=E9?= <berrange@redhat.com>
Subject: Re: [XEN PATCH for-4.15] libxl: Replace deprecated QMP command by "query-cpus-fast"
In-Reply-To: <20210322141744.522041-1-anthony.perard@citrix.com>
References: <20210322141744.522041-1-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

<Anthony PERARD writes ("[XEN PATCH for-4.15] libxl: Replace deprecated QMP command by "query-cpus-fast""):
> We use the deprecated QMP command "query-cpus" which will be remove in
> the upcoming QEMU 6.0 release. There's a replacement which is
> "query-cpus-fast", and have been available since QEMU 2.12 (April
> 2018).
> 
> In order to been able to keep using recent version of QEMU, this patch
> replace the deprecated command by the newer version. And because we
> are in the "feature freeze" period, this patch is kept simple without
> fallback (which could have been used when "query-cpus-fast" wasn't
> available).

Thank you.

I observe that Daniel Berrange also wrote a libxl patch to solve this
problem.

I read the interdiff and the only difference is that Anthony's patch
changes the internal function name to qmp_parse_query_cpus_fast
whereas Daniel's doesn't.

This gives me a fairly high confidence in the patch :-).

Acked-by: Ian Jackson <iwj@xenproject.org>
Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Ian.

