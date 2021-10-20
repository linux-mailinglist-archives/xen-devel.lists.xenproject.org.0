Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E79434965
	for <lists+xen-devel@lfdr.de>; Wed, 20 Oct 2021 12:52:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213828.372170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md9Bs-0008Pl-93; Wed, 20 Oct 2021 10:51:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213828.372170; Wed, 20 Oct 2021 10:51:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md9Bs-0008Nj-5N; Wed, 20 Oct 2021 10:51:24 +0000
Received: by outflank-mailman (input) for mailman id 213828;
 Wed, 20 Oct 2021 10:51:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1md9Bq-0008Nd-T8
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 10:51:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1md9Bq-00038V-SJ
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 10:51:22 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1md9Bq-0004Bv-RQ
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 10:51:22 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1md9BZ-0003Ph-F7; Wed, 20 Oct 2021 11:51:05 +0100
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
	bh=B3hBcANhzvsjNP5kDNHVrt7uz138GVy1W5y7CdONARc=; b=TkjrROxKUcKuw8KfF6KP3Jt7Ol
	NmQ90aQL8NpKDBSwwHN6zRhVH65vVp6QX396SdWbMJBszsW5wKujzuVWr+/jBK/bJNLjkPPpAPAxX
	gAT0O30KORSZllZLSGsMTEr2LuY2hKXbBKoucwQF7XD+fqbr0sYO4FaymkLUClIbcLIk=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24943.62617.9207.158774@mariner.uk.xensource.com>
Date: Wed, 20 Oct 2021 11:51:05 +0100
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Jan Beulich <jbeulich@suse.com>,
    "Oleksandr_Andrushchenko\@epam.com" <Oleksandr_Andrushchenko@epam.com>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Julien Grall <julien@xen.org>,
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Wei Liu <wl@xen.org>,
    Paul Durrant <paul@xen.org>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 1/1] xen/pci: Install vpci handlers on x86 and fix exit
 path
In-Reply-To: <0FC6BD8A-1805-4C10-A95C-EA199D870F06@arm.com>
References: <cover.1634659471.git.bertrand.marquis@arm.com>
	<d788dcce9e344a39f6761633f0e96774ab42c2aa.1634659471.git.bertrand.marquis@arm.com>
	<9f77b70f-93b8-2b54-3aa1-5de677d858cc@suse.com>
	<0FC6BD8A-1805-4C10-A95C-EA199D870F06@arm.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Bertrand Marquis writes ("Re: [PATCH v2 1/1] xen/pci: Install vpci handlers on x86 and fix exit path"):
> > On 20 Oct 2021, at 08:16, Jan Beulich <jbeulich@suse.com> wrote:
> > I'm inclined to suggest s/exit/error/ in the title though (and maybe
> > also s/path/paths/), which would be easy enough to do while committing.
> 
> @Ian: Please tell me if this is ok to be fixed during commit.

It's academic now, since you need a respin anyway, but I would in any
case have preferred a new version.  I find that a much better
workflow.  Expecting to make changes on commit pushes work onto
committers from submitters, which is less scaleable.

And it also ends up with committer making changes without any further
human review of any kind.  The committer must do so during an activity
which is otherwise often shallow and administrative.  This is not the
best way to get good results.

I believe I have made these points before, but perhaps not so clearly
and explicitly.  They are IMO very general.  (FTAOD I'm not saying
that making changes on commit is never appropriate, but it ought to be
exceptional.)

Thanks,
Ian.

