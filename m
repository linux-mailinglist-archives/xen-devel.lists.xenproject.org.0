Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39535355058
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 11:52:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.105743.202242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTiNT-0005Zb-6E; Tue, 06 Apr 2021 09:52:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105743.202242; Tue, 06 Apr 2021 09:52:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTiNT-0005ZE-2z; Tue, 06 Apr 2021 09:52:07 +0000
Received: by outflank-mailman (input) for mailman id 105743;
 Tue, 06 Apr 2021 09:52:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lTiNS-0005Z9-0M
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 09:52:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lTiNR-0003j7-Vn
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 09:52:05 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lTiNR-0004ni-UB
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 09:52:05 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lTiNN-00074A-8N; Tue, 06 Apr 2021 10:52:01 +0100
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
	bh=xi0zxzD5z7v5EphnH1i0hhgeVLrYw7TsuSAgVsIt8kI=; b=dLCdCFOKjk342+r83iDPigZbdn
	fKZIT8ToW8nzvBvGaEYRcUbe+xTJRjk0TxwuwvtQ8iDlJWw7q1XNC2NSpy++mmRNs9fEnea0G87L7
	SItmEahEj51dFJBEfZsRLtlGz9Xnt9SbZ5b9oAzcDZPqSNEpFl9CCNniD28yccHvsarw=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24684.12097.5068.371887@mariner.uk.xensource.com>
Date: Tue, 6 Apr 2021 10:52:01 +0100
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>,
    Dario  Faggioli <dfaggioli@suse.com>
Subject: Re: Revert NR_CPUS=1 fix from 4.15 (was: Re: [PATCH] fix
 for_each_cpu() again for NR_CPUS=1)
In-Reply-To: <YGWXcFOLKHJnH39S@Air-de-Roger>
References: <4d993e67-2bdf-9ac3-f78e-daf279642de1@suse.com>
	<YGWLxey5nZeafUbB@Air-de-Roger>
	<59387a2d-e28d-4e12-6b91-5df464e8ab9a@suse.com>
	<YGWXcFOLKHJnH39S@Air-de-Roger>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monné writes ("Re: Revert NR_CPUS=1 fix from 4.15 (was: Re: [PATCH] fix for_each_cpu() again for NR_CPUS=1)"):
> On Thu, Apr 01, 2021 at 11:26:03AM +0200, Jan Beulich wrote:
> > Well, I didn't propose reverting (or taking this fix) because I think
> > build breakage is better than runtime breakage. But in the end, Ian,
> > it's up to you.
> 
> Oh, right, sorry. The build issue only happens with NR_CPUS=1, in
> which case I agree, there's no need to do anything in 4.15 IMO.

Oh.  Right.  I had the impression that the build breakage broke other
configurations too.

Since you're saying that's not the case, please disregard my earlier
mail.

Ian.

