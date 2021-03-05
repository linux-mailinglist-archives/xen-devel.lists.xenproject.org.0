Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E47FB32EBFE
	for <lists+xen-devel@lfdr.de>; Fri,  5 Mar 2021 14:24:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93691.176767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIAR5-0006V2-6R; Fri, 05 Mar 2021 13:24:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93691.176767; Fri, 05 Mar 2021 13:24:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIAR5-0006Ud-3H; Fri, 05 Mar 2021 13:24:07 +0000
Received: by outflank-mailman (input) for mailman id 93691;
 Fri, 05 Mar 2021 13:24:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lIAR3-0006UW-MS
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 13:24:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lIAR3-0006h5-G8
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 13:24:05 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lIAR3-0001kA-El
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 13:24:05 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lIAR0-0008Nz-3O; Fri, 05 Mar 2021 13:24:02 +0000
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
	bh=v8BwmWVXumSpTnT5yALGy/i+hc30fZFIsTozBDrd3RA=; b=VmJUv5lPXCiIVUPX1JUAkBK+G6
	Uq+uxth/eNdGz2JvqmLKnSNP/6RTEHfXGpSPoFHH9VxRwHOl1sLeaeyviFeTYQ6fZokLDnY+ywRRb
	wls8qPTN/gdmW3nQ0VdPcvXrHA98gdi5jo2+qWXkc4cJF2Y4DMY/dhUCcFOr0YeIBRLg=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24642.12529.753822.114284@mariner.uk.xensource.com>
Date: Fri, 5 Mar 2021 13:24:01 +0000
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
    raphning@amazon.co.uk,
    Julien Grall <jgrall@amazon.com>,
    Wei Liu <wl@xen.org>,
    Juergen Gross <jgross@suse.com>
Subject: [PATCH for-4.15 1/2] tools/xenstore: Consolidate PRINTF_ATTRIBUTE() in utils.h
In-Reply-To: <20210305124003.13582-2-julien@xen.org>
References: <20210305124003.13582-1-julien@xen.org>
	<20210305124003.13582-2-julien@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("[PATCH for-4.15 1/2] tools/xenstore: Consolidate PRINTF_ATTRIBUTE() in utils.h"):
> From: Julien Grall <jgrall@amazon.com>
> 
> At the moment PRINTF_ATTRIBUTE() is defined in two places:
>     - tdb.h: Defined as a NOP
>     - talloc.h: Defined as a NOP for GCC older than 3.0 otherwise will
>     add the attribute to check the printf format
> 
> Xen requires to build with minimum GCC 4.1 and we want to check the
> printf format for all the printf-like functions.
> 
> Only implement PRINTF_ATTRIBUTE() once in utils.h and drop the
> conditional check for GCC < 3.0.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

