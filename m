Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F7941AE64
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 14:03:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197956.351219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVBos-0008R6-O6; Tue, 28 Sep 2021 12:02:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197956.351219; Tue, 28 Sep 2021 12:02:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVBos-0008Oz-L0; Tue, 28 Sep 2021 12:02:46 +0000
Received: by outflank-mailman (input) for mailman id 197956;
 Tue, 28 Sep 2021 12:02:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mVBor-0008Or-8w
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 12:02:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mVBor-000766-5D
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 12:02:45 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mVBor-0001cJ-4E
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 12:02:45 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mVBon-0003dw-HD; Tue, 28 Sep 2021 13:02:41 +0100
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
	bh=pB5F4F+2HGAVnLSMVF8dXjxc9fgS3AtcWQAVWtHyk2I=; b=DtFYUiYl/T4QJdtTb5DXVrfGWr
	DRD/TX9KCq5+MWr8zplM3Vi294ZEOLuvFVyoTV8gxdrtRgVyIFfMyPCiu7ypvrcwFZGIyfFxhZel9
	/YIx78lOW2CQFWnIeEC1jqEqXwxYMa9rkYKU+DMjcfl0WtY6DGDnzntWSFUgqSvAdWzE=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24915.1121.8356.288414@mariner.uk.xensource.com>
Date: Tue, 28 Sep 2021 13:02:41 +0100
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>
Subject: [PATCH v5 2/2] tools/xenstore: set open file descriptor limit for xenstored
In-Reply-To: <20210928091517.9761-3-jgross@suse.com>
References: <20210928091517.9761-1-jgross@suse.com>
	<20210928091517.9761-3-jgross@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Juergen Gross writes ("[PATCH v5 2/2] tools/xenstore: set open file descriptor limit for xenstored"):
> Add a configuration item for the maximum number of open file
> descriptors xenstored should be allowed to have.
> 
> The default should be "unlimited" in order not to restrict xenstored
> in the number of domains it can support, but unfortunately the kernel
> is normally limiting the maximum value via /proc/sys/fs/nr_open [1],
> [2]. So check that file to exist and if it does, limit the maximum
> value to the one specified by /proc/sys/fs/nr_open.
> 
> As an aid for the admin configuring the value add a comment specifying
> the common needs of xenstored for the different domain types.
...
>  	echo -n Starting $XENSTORED...
> @@ -70,6 +89,7 @@ test -f @CONFIG_DIR@/@CONFIG_LEAF_DIR@/xencommons && . @CONFIG_DIR@/@CONFIG_LEAF
>  	systemd-notify --booted 2>/dev/null || timeout_xenstore $XENSTORED || exit 1
>  	XS_PID=`cat @XEN_RUN_DIR@/xenstored.pid`
>  	echo $XS_OOM_SCORE >/proc/$XS_PID/oom_score_adj
> +	prlimit --pid $XS_PID --nofile=$XENSTORED_MAX_OPEN_FDS

Thanks for this.  I have one comment/question, which I regret making
rather late:

I am uncomfortable with the use of prlimit here, because identifying
processes by pid is typically inherently not 100% reliable.

AIUI you are using it here because perhaps otherwise you would have to
mess about with both systemd and non-systemd approaches.  But in fact
this script "launch-xenstore" is simply a parent of xenstore.  It is
run either by systemd or from the init script, and it runs $XENSTORED
directly (so not via systemd or another process supervisor).

fd limits are inherited, so I think you can use ulimit rather than
prlimit ?

If you use ulimit I think you must set the hard and soft limits,
which requires two calls.

If you can't use ulimit then we should try to make some argument that
the prlimit can't target the wrong process eg due to a
misconfiguration or stale pid file or soemthing.  I think I see a way
that such an argument could be construted but it would be better just
to use ulimit.

Ian.

