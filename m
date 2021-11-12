Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1D444E6C8
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 13:51:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225223.388945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlW10-00038W-L1; Fri, 12 Nov 2021 12:50:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225223.388945; Fri, 12 Nov 2021 12:50:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlW10-00036U-Hx; Fri, 12 Nov 2021 12:50:46 +0000
Received: by outflank-mailman (input) for mailman id 225223;
 Fri, 12 Nov 2021 12:50:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mlW0y-00036O-D7
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 12:50:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mlW0y-0008TW-Bb
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 12:50:44 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mlW0y-0008IN-Aj
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 12:50:44 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mlW0u-0000yk-OV; Fri, 12 Nov 2021 12:50:40 +0000
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
	bh=DYtDG1yVCW9tiow4RKPDcUbIEt4U4yOf/ArPomqQ5KY=; b=kxLkcYtfZQ++0NITdNiwrK20yp
	oXmoy5ghPD7XHKTA1OH3p6oN7wCISgSUUUXP41VvhogShtenSpK9z2wQ6YFechaGtyKbBdxPbr7fY
	lXWtluBfWyt7QX+GU1Eoz5ALoAso0JABXHq2HQpshYS/LOmIGhCtbN+8y8sZyGRTmeSs=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24974.25376.234860.64997@mariner.uk.xensource.com>
Date: Fri, 12 Nov 2021 12:50:40 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Kevin Tian <kevin.tian@intel.com>,
    Paul Durrant <paul@xen.org>
Subject: Re: [PATCH RESEND 0/3][4.16?] VT-d: misc (regression) fixes [and 2 more messages]
In-Reply-To: <c809727f-f21a-d6f2-1fb7-4c3dfc150747@suse.com>,
	<c180ff67-f109-fbe9-d34a-b28d8f46bfcd@suse.com>,
	<0ca809cb-1768-639c-3f58-c5e2c343b1e8@suse.com>
References: <c809727f-f21a-d6f2-1fb7-4c3dfc150747@suse.com>
	<0ca809cb-1768-639c-3f58-c5e2c343b1e8@suse.com>
	<c180ff67-f109-fbe9-d34a-b28d8f46bfcd@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("[PATCH RESEND 0/3][4.16?] VT-d: misc (regression) fixes"):
> (re-sending upon Ian's request with his address adjusted, including
> Kevin's R-b at this occasion)
> 
> 1: per-domain IOMMU bitmap needs to have dynamic size
...
> As to patch 1: Without the earlier change, systems with more than 32
> IOMMUs simply would fail to enable use of the IOMMUs altogether. Now
> systems with more than 64 IOMMUs would observe memory corruption
> (with unclear knock-on effects). Whether systems with this many IOMMUs
> actually exist I can't tell; I know of ones with 40, which isn't all
> that far away from 64.

Right.  I have given my R-A provided we can commit it today.

Obviously potentail corruption, even on machines we don't know exist,
is an RC bug.  But if this patch can't go in very soon (or turns out
to be troublesome) I think we could downgrade this bug from
by detecting systems with many IOMMUs and refusing to boot ?
That's not great but if we don't know of actual affected systems, it
might be better than risking introducing bugs for everyone else.

> 2: fix reduced page table levels support when sharing tables
> 3: don't needlessly engage the untrusted-MSI workaround
> 
> As to 4.16 considerations: Only patch 1 addresses a regression
> introduced after 4.15, the others are older. Patch 3 additionally
> only addresses an inefficiency; the code we have is correct from
> a functional pov.

I don't understand the impact of patch 2 at all.

I doubt an inefficiency would warrant a release ack at this stage,
unless the benefit of the patch is very substantial.

Thanks,
Ian.

