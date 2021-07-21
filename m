Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDEA3D1083
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jul 2021 16:04:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159366.293144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6Coq-0002C0-So; Wed, 21 Jul 2021 14:03:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159366.293144; Wed, 21 Jul 2021 14:03:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6Coq-00029j-PB; Wed, 21 Jul 2021 14:03:28 +0000
Received: by outflank-mailman (input) for mailman id 159366;
 Wed, 21 Jul 2021 14:03:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m6Coo-00029d-Tv
 for xen-devel@lists.xenproject.org; Wed, 21 Jul 2021 14:03:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m6Coo-0003XB-F4
 for xen-devel@lists.xenproject.org; Wed, 21 Jul 2021 14:03:26 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m6Coo-0007Wk-EC
 for xen-devel@lists.xenproject.org; Wed, 21 Jul 2021 14:03:26 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1m6Coj-0001Ui-HQ; Wed, 21 Jul 2021 15:03:21 +0100
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
	bh=CW7zwAK/qcfVNqJmdIur31yUxgPn6nf6WmEcYPDzBzo=; b=UDMskzl51QBMD0wc798QltGcG+
	1GbWUYhXla+fOOz3fW6KUdZ+aVepKaKVW3j8iJr0H97bIJJG8G816TIA4S2FhKkLSn4jIwgkH1heq
	5L3uXzUH4SVBknMNkcuu8YfeLqgRbXB0Wh3gkS44aIpbFu0H2Pp/63su8OgPcAbOhOK4=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24824.10537.336687.898547@mariner.uk.xensource.com>
Date: Wed, 21 Jul 2021 15:03:21 +0100
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Scott Davis <scottwd@gmail.com>,
    xen-devel <xen-devel@lists.xenproject.org>,
    Scott Davis <scott.davis@starlab.io>,
    Wei Liu <wl@xen.org>,
    George Dunlap <george.dunlap@citrix.com>,
    Nick Rosbrook <rosbrookn@ainfosec.com>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] tools/xl: Add stubdomain_cmdline option to xl.cfg
In-Reply-To: <CAKf6xptO4mrZHxwr9mFPx-x=o5g_DbHLrEKMgwCpSDqHAUEgqw@mail.gmail.com>
References: <6562806d7430431dc154af2c6e4a5232725fc136.1626800539.git.scott.davis@starlab.io>
	<CAKf6xpucqRp5Db6z0J7PLbTVxBZThn7j2Mjvjn9z7nJ5Lf5F_g@mail.gmail.com>
	<24824.6179.909691.713305@mariner.uk.xensource.com>
	<CAKf6xptO4mrZHxwr9mFPx-x=o5g_DbHLrEKMgwCpSDqHAUEgqw@mail.gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jason Andryuk writes ("Re: [PATCH] tools/xl: Add stubdomain_cmdline option to xl.cfg"):
> Yes, they can both be useful.  Append is sufficient until you want to
> override or remove an option that is already included.  Set can be
> tedious since you have to copy the existing options before appending
> your new one.
> 
> Anyway, I just wanted the documentation to match the implementation.

Yes.  I am happy with either approach.  Given the name I think
override is probably better; then we can do append with _extra later
if we like.

So in summary I agree with your suggested change to this patch.

> Looks like xl.cfg.5.pod.in says Append for cmdline/root/extra, so
> Scott was repeating that.  Looking around, aside from concatenating
> root and extra in xl_parse.c:parse_cmdline(), libxl doesn't seem to
> calculate command lines.  If libxl is reserving the right to calculate
> cmdline in the future, then keeping Append is fine by me.

Thanks for the investigation.

Ian.

