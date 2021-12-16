Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EB947712C
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 12:57:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247911.427551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxpNg-0005iX-GJ; Thu, 16 Dec 2021 11:57:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247911.427551; Thu, 16 Dec 2021 11:57:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxpNg-0005fY-DE; Thu, 16 Dec 2021 11:57:04 +0000
Received: by outflank-mailman (input) for mailman id 247911;
 Thu, 16 Dec 2021 11:57:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2y9W=RB=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mxpNf-0005Hf-2I
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 11:57:03 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46685283-5e67-11ec-9e60-abaf8a552007;
 Thu, 16 Dec 2021 12:57:01 +0100 (CET)
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
X-Inumbo-ID: 46685283-5e67-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639655821;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=TS9DeW0CdUisb2Wk49Zp6N9aFoSWkq05wyetL3iYFyk=;
  b=CO3XnesXpsWncaTtayB/ff72ZhUxFYT1q7Xa69aJJmG+OQlJGmLBKd9T
   sz+iiDqnrGdv9C0h1MNdQ6+lp6EjU1hNSDWmxSHGI1CeSTAR0voWjsgHn
   Wby5yR83MlMXSxGdJSczRV1rBjUOgQlmndWI3w8zbOUkNHpJH7GZSR/9o
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: YdpmVzQH6masygScM8zQm0FbxP628vEcNRd2xen9+kOKrPgxc9Alfe8f5F/UP99gv7SNB0ONNO
 YgjzSbr2Xe2JNJ3UEeanifeIGUDu+Tdl5eYvoFn8gXDlninLSlr3MfhHtPUJwq//BQbCusfUyS
 5Af8wdvfHF60G0fHh3X+hC8oRDR53G5hrJqGVZJqJs0jPjT8E2DSE4RpROxDpJeGU/E1M16dr2
 DtQ0y7lbnmGrHnrSd4zWxIDT+UB1A0DskLYl2+LumwHN9FmU+FJBXQL+eG7FQCsJMDY/O565DP
 yDD9WUJWWRgydTHbHAb3YKdR
X-SBRS: 5.1
X-MesageID: 59671004
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:fgOjuKMJLPkZm9vvrR01kMFynXyQoLVcMsEvi/4bfWQNrUoigTEHz
 GMbC2jQMq2Na2Shc98kbI/koRkOvJGAmtBkQAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En5400s9w7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYozG1huEuk
 PFPjrmXVT0PEavLoLwxYwYNRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YuBqmsQkKtitJI4Fs2ts5TrYEewnUdbIRKCiCdpwgWZu2ZkWRaq2i
 8wxaiEyaybncThzPGw0S5llsOuEhiC8fGgNwL6SjfVuuDWCpOBr65DvLd7Ud9qiVchT2EGCq
 Qru5H/lCxsXMNiezzut8X+2gOLL2yThV+o6C7mQ5vNsxlqJyQQ7ChcbSF+6qvmRkVOlVpRUL
 El80iMrpvls3FexRde7WRCkyFaUsxhZV9dOHukS7ACW1rGS8wufHnIDTDNKdJohrsBebT011
 HeZktXxHzttvbaJD3WH+d+pQSiaYHZPazVYPGldEFVDs4KLTJwPYgznSup6IfHtqt/OPBbs+
 Ralqi8G35kjkptev0mkxmzvjzWpr5nPawc64ATLQ26ohj9EiJ6Zi5+AsgaCs6sZRGqNZhzY5
 SVfxZDChAwbJcjVzHTlfQkbIF2+Cx9p2hX4iEUnIZQu/i/FF5WLLdEJu2EWyKuE3685ld7Vj
 K375VM5CHx7ZiLCgUpLj2SZUZ5CIU/IT4uNaxwsRoASCqWdjSfelM2UWWae3nr2jG8nmrwlN
 JGQfK6EVChBWPk2l2XmGr1FitfHIxzSI0uJH/gXKDz9jtKjiIO9E+9ZYDNikMhnhE97nOkl2
 4kGbJbbo/mueOb/fjPW4eYuwaMidhAG6WTNg5UPLIare1M+cEl4UqO56e5xKuRNwvUO/s+Vr
 y7VZ6Ot4Aem7ZExAV7RMS4LhXKGdcsXkE/XygRwZwv1gCZ6Pt70hErdHrNuFYQaGCVY5aYcZ
 5E4lw+oW60npu3v92tPYJ/jgpZlcRj31wuCMzD8OGo0foJ6RhyP8djhJ1O9+C4LByuxlM0/v
 7z/iV+LHctdH1xvXJTMdfai71KtpnxByuh8aFTFf4tIc0L2/Yk0dyGo1q0rI9sBIAnozyeB0
 1rEGg8RoOTA+tdn8NTAia2egZ2uFu9yQhhTE2XBtO7kPijG5Guzh4RHVb/QLzzaUWr1/oSkZ
 PlUkK6gYKFWwg4SvtMlQbhxzK8469/+nJNgz1xpTCfRclCmKrJ8OX3aj8NBgbJAm+1CsgysV
 0PRptQDYeeVONnoGUI6LRY+arjRzukdnzTf4KhnIEj+4yMrrrOLXV8LYkuJgS1ZarB0LJkk0
 aEqv8tPs16zjR8jM9CniCFI9jvTcixcAvt/7pxKUpX2jgcLy01ZZc2OAyD715iDdtFQPxR4O
 TSTnqfD2+xRy0eqn6DfzpQRMT6xXagzhS0=
IronPort-HdrOrdr: A9a23:fw5vn6vc4jln8uO0P80aIIRb7skDTtV00zEX/kB9WHVpmszxra
 GTddAgpHjJYVEqKRcdcLG7Sc29qBznmaKdjbN/AV7mZniehILKFvAG0WKB+UyCJ8SWzIc0vs
 0MT0E9MqyTMbETt7eD3ODSKbYdKbe8npyVuQ==
X-IronPort-AV: E=Sophos;i="5.88,211,1635220800"; 
   d="scan'208";a="59671004"
Date: Thu, 16 Dec 2021 11:56:36 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <amc96@srcf.net>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [XEN PATCH v8 34/47] build: add %.E targets
Message-ID: <YbspdIfG8P9FK99W@perard>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-35-anthony.perard@citrix.com>
 <f8709d9b-cda0-323d-4e06-dc21ee3093c5@srcf.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f8709d9b-cda0-323d-4e06-dc21ee3093c5@srcf.net>

On Thu, Dec 16, 2021 at 11:18:08AM +0000, Andrew Cooper wrote:
> On 25/11/2021 13:39, Anthony PERARD wrote:
> > I guess it's easier to remember that %.E does "$(CC) -E" or "$(CPP)".
> >
> > -%.o %.i %.s: %.c tools_fixdep FORCE
> > +%.o %.i %.s %.E: %.c tools_fixdep FORCE
> >  	$(Q)$(MAKE) $(build)=$(*D) $(*D)/$(@F)
> 
> So what I hadn't realised when asking was that Linux calls this .i and
> we've already got support for what I wanted.  Sorry :)
> 
> Thus, I suspect we probably don't want to take an extra %.E alias to the
> existing %.i, although...
> 
> >  
> > -%.o %.s: %.S tools_fixdep FORCE
> > +%.o %.s %.E: %.S tools_fixdep FORCE

> > +$(obj)/%.E: $(src)/%.c FORCE
> > +	$(call if_changed_dep,cpp_i_c)
> > +$(obj)/%.E: $(src)/%.S FORCE
> > +	$(call if_changed_dep,cpp_s_S)
> 
> ... I don't currently see support for %.i from %.S in the tree.  That
> one probably would be useful to introduce.

It's %.s for %.S, easy ;-)

Yep, %.s may run `gcc -S` or `gcc -E`.
And %.i may run `gcc -E` or may not run at all.

It seems that Linux have the same rules.

So, I guess to run gcc -E, one have to run `make dir/target.i || make
dir/target.s` currently, :-).

Another thing, %.s:%.S was broken for a while, and no one complained.

Cheers,

-- 
Anthony PERARD

