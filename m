Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F13303EC2
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 14:32:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75032.134981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4OSe-000191-LP; Tue, 26 Jan 2021 13:32:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75032.134981; Tue, 26 Jan 2021 13:32:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4OSe-00018c-I1; Tue, 26 Jan 2021 13:32:48 +0000
Received: by outflank-mailman (input) for mailman id 75032;
 Tue, 26 Jan 2021 13:32:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4OSc-00018X-W2
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 13:32:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4OSc-0006qn-UK
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 13:32:46 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4OSc-0008Dq-Rm
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 13:32:46 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l4OSZ-0006mY-Mq; Tue, 26 Jan 2021 13:32:43 +0000
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
	bh=u2LXUa+gsSUrvd/O1v+ldv+SSccPDQ5euyo7NsXTFSU=; b=LXMkIX83Y0xr9XvRiAxD1jz7vc
	mfxEzpD0U6CkgxwbsD3aqvEefEHClvcqyDWiQ1TfT32AP5c1XNryKwNwHs+V3EYOeox/+yLx8JaZC
	iAqYOii/2VYmIn3UEkIt2xNCYaGB2aWtrUVqCz8PJDEgaCDiorP93hshXmWkWLvYG2mo=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24592.6651.498517.334163@mariner.uk.xensource.com>
Date: Tue, 26 Jan 2021 13:32:43 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    =?iso-8859-2?Q?Micha=B3_Leszczy=F1ski?= <michal.leszczynski@cert.pl>,
    Wei  Liu <wl@xen.org>,
    Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v7 08/10] tools/misc: Add xen-vmtrace tool
In-Reply-To: <445bd883-3900-6a28-10e9-84251af43123@citrix.com>
References: <20210121212718.2441-1-andrew.cooper3@citrix.com>
	<20210121212718.2441-9-andrew.cooper3@citrix.com>
	<24586.61484.451595.44272@mariner.uk.xensource.com>
	<f8b43de9-03e8-a1ec-b60f-6bbc1691e928@citrix.com>
	<24592.1081.38318.522643@mariner.uk.xensource.com>
	<445bd883-3900-6a28-10e9-84251af43123@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("Re: [PATCH v7 08/10] tools/misc: Add xen-vmtrace tool"):
> On 26/01/2021 11:59, Ian Jackson wrote:
> >[Andrew:]
> >> This is example code, not a production utility.
> > Perhaps the utility could print some kind of health warning about it
> > possibly leaving this perf-impacting feature enabled, and how to clean
> > up ?
> 
> Why?  The theoretical fallout here is not conceptually different to
> libxl or qemu segfaulting, or any of the myriad other random utilities
> we have.
> 
> Printing "Warning - this program, just like everything else in the Xen
> tree, might in exceptional circumstances segfault and leave the domain
> in a weird state" is obvious, and doesn't need stating.
> 
> The domain is stuffed. `xl destroy` may or may not make the problem go away.

Firstly, I don't agree with this pessimistic analysis of our current
tooling.  Secondly, I would consider many such behaviours bugs;
certainly we have bugs but we shouldn't introduce more of them.

You are justifying the poor robustness of this tool on the grounds
that it's "example code, not a production utility".

But we are shipping it to bin/ and there is nothing telling anyone
that trying to use it (perhaps wrapped in something of their own
devising) is a bad idea.

Either this is code users might be expected to run in production in
which we need to make it at least have a minimal level of engineering
robustness (which is perhaps too difficult at this stage), or we need
to communicate to our users that it's a programming example, not a
useful utility.

Note that *even if it is a programming example*, we should highlight
its most important deficiencies.  Otherwise it is a hazardously
misleading example.

I hope that makes sense.

Thanks,
Ian.

