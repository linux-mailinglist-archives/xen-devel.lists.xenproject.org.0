Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 994FB355057
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 11:51:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.105739.202231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTiLv-0005Sk-Ql; Tue, 06 Apr 2021 09:50:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105739.202231; Tue, 06 Apr 2021 09:50:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTiLv-0005SL-Na; Tue, 06 Apr 2021 09:50:31 +0000
Received: by outflank-mailman (input) for mailman id 105739;
 Tue, 06 Apr 2021 09:50:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lTiLu-0005SG-Aq
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 09:50:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lTiLu-0003hG-7T
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 09:50:30 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lTiLu-0004f9-6Q
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 09:50:30 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lTiLp-00073N-G3; Tue, 06 Apr 2021 10:50:25 +0100
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
	bh=3mDWDMDObA83DoZTUHamCtYJHXFJGuO9l2nxbUqTg9I=; b=eQE1yYuPd1vd1L1a9EIQcBtsSd
	/NIerKE306ReqAaxfUx/mHaJHozINYml87sJejKsvFKz7bhVsegBkIdu89ONTdyeg/I18iX+XAUrb
	GND4GOBvzKWZKlRmE0XmOeNVDL8VbYdnWTxTMfCoUYNUg1yqDwpKR7gvUidSEKYDdwoM=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24684.12001.296614.926923@mariner.uk.xensource.com>
Date: Tue, 6 Apr 2021 10:50:25 +0100
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew  Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>,
    Dario Faggioli <dfaggioli@suse.com>
Subject: Revert NR_CPUS=1 fix from 4.15 (was: Re: [PATCH] fix for_each_cpu()
 again for NR_CPUS=1)
In-Reply-To: <YGWLxey5nZeafUbB@Air-de-Roger>
References: <4d993e67-2bdf-9ac3-f78e-daf279642de1@suse.com>
	<YGWLxey5nZeafUbB@Air-de-Roger>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monné writes ("Revert NR_CPUS=1 fix from 4.15 (was: Re: [PATCH] fix for_each_cpu() again for NR_CPUS=1)"):
> At this point, should be consider reverting the original fix from the
> 4.15 branch, so that we don't release something that's build broken
> with gcc 10?

Yes.  I think so.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

But please leave it to me to commit it.  I will do so at or after
around 14:00 UK time (13:00 UTC) today unless someone objects.

Thanks,
Ian.

