Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0874289B3
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 11:31:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205585.360936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZreh-0001Ms-VZ; Mon, 11 Oct 2021 09:31:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205585.360936; Mon, 11 Oct 2021 09:31:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZreh-0001Ju-Rl; Mon, 11 Oct 2021 09:31:35 +0000
Received: by outflank-mailman (input) for mailman id 205585;
 Mon, 11 Oct 2021 09:31:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mZreg-0001Jo-H8
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 09:31:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mZreg-0001kF-EH
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 09:31:34 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mZreg-0007Qq-DD
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 09:31:34 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mZrec-0000bi-Kx; Mon, 11 Oct 2021 10:31:30 +0100
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
	bh=LCEE4Kq9JCbxBO61BV8+TG13UiFDXQBp/HiMEDmUvZw=; b=smYtYZxawfwkDTxtO+y4sAwhiW
	UZzEMAJhy6Xg4fljWAUFudVk/9js3Qr4lHfnxNwlyMdU/n27kuyKs67yFxq/luyC4aJYxg3qEkSEP
	qXSLXADOWzaugEwz4B7KJJbfePUIkOvu0ltfEbFjrfXV3CCMolWGQNeEOXp2CdECN1o8=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24932.1138.187067.478819@mariner.uk.xensource.com>
Date: Mon, 11 Oct 2021 10:31:30 +0100
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH v5 2/2] tools/xenstore: set open file descriptor limit for
 xenstored
In-Reply-To: <3c9bfe5d-c471-c771-d6a7-a15cca466cb6@suse.com>
References: <20210928091517.9761-1-jgross@suse.com>
	<20210928091517.9761-3-jgross@suse.com>
	<24915.1121.8356.288414@mariner.uk.xensource.com>
	<0bd81ff3-a7ac-4000-4c0c-d7127b1c1985@suse.com>
	<24915.13356.139165.259646@mariner.uk.xensource.com>
	<3c9bfe5d-c471-c771-d6a7-a15cca466cb6@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Juergen Gross writes ("Re: [PATCH v5 2/2] tools/xenstore: set open file descriptor limit for xenstored"):
> On 28.09.21 17:26, Ian Jackson wrote:
> > Juergen Gross writes ("Re: [PATCH v5 2/2] tools/xenstore: set open file descriptor limit for xenstored"):
> >> Hmm, maybe I should just use:
> >>
> >> prlimit --nofile=$XENSTORED_MAX_OPEN_FDS \
> >>      $XENSTORED --pid-file @XEN_RUN_DIR@/xenstored.pid $XENSTORED_ARGS
> > 
> > I guess that would probably work (although it involves another
> > exec) but I don't understand what's wrong with ulimit, which is a
> > shell builtin.
> 
> My main concern with ulimit is that this would set the open file limit
> for _all_ children of the script. I don't think right now this is a real
> problem, but it feels wrong to me (systemd-notify ought to be fine, but
> you never know ...).

Oh, I see.  Yes, that is a good point.

So, I think your suggest (quoted above) is good.

Thanks,
Ian.

