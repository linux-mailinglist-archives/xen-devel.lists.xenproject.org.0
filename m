Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A528332ECAE
	for <lists+xen-devel@lfdr.de>; Fri,  5 Mar 2021 14:58:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93730.176911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIAyb-0002Hn-OW; Fri, 05 Mar 2021 13:58:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93730.176911; Fri, 05 Mar 2021 13:58:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIAyb-0002HO-Ky; Fri, 05 Mar 2021 13:58:45 +0000
Received: by outflank-mailman (input) for mailman id 93730;
 Fri, 05 Mar 2021 13:58:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lIAya-0002HJ-E6
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 13:58:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lIAya-0007Ji-AH
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 13:58:44 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lIAya-0004Hx-9K
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 13:58:44 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lIAyO-0008WR-Ad; Fri, 05 Mar 2021 13:58:32 +0000
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
	bh=JbLIdJa8ltxCPlR7yJ6aaM9xgZFJx/500fdHj3QwQUg=; b=ITg8grlM+mLqyQSaXPjuuLIyDx
	AvEGVGSHKNEth/tIb3TGL2jBjnUaWIjlm2i49aV23PpJx0OW4iGpAKsuv2DCnlg33d4traLCDPEcd
	PwuFiS0yUa8Y1PsG0azP1SrpHYlUAaeccbj8st1YZFleeSHuXqEUNLYewdegb/X6Xx5k=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24642.14600.124181.19574@mariner.uk.xensource.com>
Date: Fri, 5 Mar 2021 13:58:32 +0000
To: Julien Grall <julien@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>,
    =?iso-8859-1?Q?J=FCrgen_Gro=DF?=  <jgross@suse.com>,
    raphning@amazon.co.uk,
    Julien Grall <jgrall@amazon.com>,
    Wei Liu <wl@xen.org>,
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.15 2/2] tools/xenstore: Check the format printf for
 xprintf() and barf{,_perror}()
In-Reply-To: <7eb12174-3268-ccdb-df9c-c4fe23d3a332@xen.org>
References: <20210305124003.13582-1-julien@xen.org>
	<20210305124003.13582-3-julien@xen.org>
	<0994b7a0-c537-b312-b134-caf54c79c87f@suse.com>
	<74568cd7-143b-48ad-b9be-bf4229655376@suse.com>
	<7eb12174-3268-ccdb-df9c-c4fe23d3a332@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("Re: [PATCH for-4.15 2/2] tools/xenstore: Check the format printf for xprintf() and barf{,_perror}()"):
> Urgh, you are right. Actually, the extern was added recently by Anthony:
> 
> dacdbf7088d6a3705a9831e73991c2b14c519a65 ("tools/xenstore: mark variable 
> in header as extern")
> 
> I completely forgot it despite I needed to backport the patch to our 
> downstream Xen.

How horrible.

Maybe we could add a comment to the code, next to the declaration,
about this crazy situation.

Ian.

