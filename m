Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBD841976C
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 17:12:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197067.350018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUsIg-0001HB-L4; Mon, 27 Sep 2021 15:12:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197067.350018; Mon, 27 Sep 2021 15:12:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUsIg-0001Eg-HE; Mon, 27 Sep 2021 15:12:14 +0000
Received: by outflank-mailman (input) for mailman id 197067;
 Mon, 27 Sep 2021 15:12:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mUsIe-0001Ea-Rr
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 15:12:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mUsIe-00024P-41
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 15:12:12 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mUsIe-0000NB-31
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 15:12:12 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mUsIZ-0000r5-AF; Mon, 27 Sep 2021 16:12:07 +0100
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
	bh=ZXOZy8ChzbHKuQbO2lzAzt/6jKad5k1rrr19sLbwr8U=; b=n48xGhdjLJmzuQv94o/aulkf0b
	85DcGIbv7vymYhkXylwfvsJVpvknpd9+Zfko0d5M9lroXpe/8RL/FPh5IKz6GIB/WANmqgD4NCFGv
	gvyjaB5TTCgCaDUHhHUeR7FMO+ySY05Bpr6BCGv++4SE77mb+zphxDM/dZnTYigkVyTc=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24913.57159.98506.99705@mariner.uk.xensource.com>
Date: Mon, 27 Sep 2021 16:12:07 +0100
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
    xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 2/2] tools/xenstore: set open file descriptor limit for
 xenstored
In-Reply-To: <20bd7f1f-f0fc-b7a6-c0e8-05192714d384@suse.com>
References: <20210927104813.19772-1-jgross@suse.com>
	<20210927104813.19772-3-jgross@suse.com>
	<f858dda9-b844-48e4-c079-75296cc36316@citrix.com>
	<20bd7f1f-f0fc-b7a6-c0e8-05192714d384@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Juergen Gross writes ("Re: [PATCH v4 2/2] tools/xenstore: set open file descriptor limit for xenstored"):
> On 27.09.21 16:13, Andrew Cooper wrote:
> > both work fine, and strace confirms they issue correct system calls.
> 
> Not on my test system:
> 
> # prlimit --pid 734 --nofile=unlimited
> prlimit: failed to set the NOFILE resource limit: Operation not permitted
> # prlimit --pid 734 --nofile=262144
> #
> 
> > Support for "unlimited" as a parameter has existed for the entire
> > lifetime of the utility,
> > https://github.com/karelzak/util-linux/commit/6bac2825af7216c5471148e219dbcf62ec5ede84
> 
> Yes, but not all systems seem to support raising the limit to
> "unlimited".

This is strange.  Are you running in some kind of restricted
environment ?  <strike>Or maybe prlimit is trying to adjust the soft
limit (only) but failing to remove the hard limit too ?  I confess
that I never use prlimit, just ulimit.</strike>

I just tried this on my laptop:

root(ian)@zealot:~> ulimit -Hn 1048577
bash: ulimit: open files: cannot modify limit: Operation not permitted
root(ian)@zealot:~> ulimit -Hn 1048576
root(ian)@zealot:~>

????

1048576 is 0x100000.
1048577 is 0x100001.

The intertubes caused me to check sysctl fs.file-max (1591013),
/etc/security/limits.conf (nothing uncommented).  Eventually a helpful
person pointed me to /proc/sys/fs/nr_open.

root(ian)@zealot:~> cat /proc/sys/fs/nr_open
1048576

This is completely deranged.  The internet is full of people working
around this (if you are unluckloy you try to set nofile unlimited in
some file in /etc/security and then you can't log in!).

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=60fd760fb9ff7034360bab7137c917c0330628c2
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0c2d64fb6cae9aae480f6a46cfe79f8d7d48b59f

^ that explains why things are like this.  Oh woe is us what madness
have we collectively perpetrated.

I suggest the following workaround for our scripts: try to read
/proc/sys/fs/nr_open and use the value from there if there is one;
otherwise use "unlimited".

I think that is better than sort-of-guessing 262144.  What you do you
think ?

Thanks,
Ian.

