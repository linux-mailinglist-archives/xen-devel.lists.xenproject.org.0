Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F177039A5A3
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jun 2021 18:20:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136507.253053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loq4x-0004kV-G5; Thu, 03 Jun 2021 16:20:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136507.253053; Thu, 03 Jun 2021 16:20:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loq4x-0004iD-DA; Thu, 03 Jun 2021 16:20:19 +0000
Received: by outflank-mailman (input) for mailman id 136507;
 Thu, 03 Jun 2021 16:20:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1loq4w-0004i7-Ag
 for xen-devel@lists.xenproject.org; Thu, 03 Jun 2021 16:20:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1loq4w-0001Us-29
 for xen-devel@lists.xenproject.org; Thu, 03 Jun 2021 16:20:18 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1loq4w-0005es-0z
 for xen-devel@lists.xenproject.org; Thu, 03 Jun 2021 16:20:18 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1loq4s-0006Zd-L2; Thu, 03 Jun 2021 17:20:14 +0100
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
	bh=dj5r/43lJoGQdSDSc6b6HAMYHd+EFCRB/4PukVSBLZk=; b=eueJejZJQ/IJv00GxpXuhF11Yp
	paFHCJEduHEqyJm0Zan6G/xObj25QV59Hd8YwK82KIoPaDnUCSPugafcr8/eX0elcIeXwKT2WfEEx
	iygyEKYgQ7qNm9E97LEqusuqPtrzDD4pJ7+wpeD9js2Cee9306jwYc8SKrn1OH2tbmn8=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24761.318.185554.93009@mariner.uk.xensource.com>
Date: Thu, 3 Jun 2021 17:20:14 +0100
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>
Subject: [PATCH v4] tools/libs/store: cleanup libxenstore interface
In-Reply-To: <20210512144832.19026-1-jgross@suse.com>
References: <20210512144832.19026-1-jgross@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Juergen Gross writes ("[PATCH v4] tools/libs/store: cleanup libxenstore interface"):
> There are some internals in the libxenstore interface which should be
> removed.

Thanks.  And sorry for not reviewing this sooner.

> Move those functions into xs_lib.c and the related definitions into
> xs_lib.h. Remove the functions from the mapfile. Add xs_lib.o to
> xenstore_client as some of the internal functions are needed there.
> 
> Bump the libxenstore version to 4.0 as the change is incompatible.
> Note that the removed functions should not result in any problem as
> they ought to be used by xenstored or xenstore_client only.

I am happy with the API and ABI changes.

The situation with the expanding buffer functions (which I think is
the only thing you are moving?) is unfortunate.  We have some more of
similar code in libxl.  And probably elsewhere in the codebase.  It
would be nice to make them shared but I think that is a task for
another day.

The sanitise value functions should perhaps be exposed with more
enssible names ?

I think this was more difficult to review than it needed to be
particularly because of the mixture of code motion with other
changes.

Anyway, thanks for cleaning this up.  All evidence to the contrary, it
*is* appreciated.

Reviewed-by: Ian Jackson <iwj@xenproject.org>

Regards,
Ian.

