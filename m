Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6BC433462
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 13:05:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213002.371083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcmvX-0005Zg-Gh; Tue, 19 Oct 2021 11:05:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213002.371083; Tue, 19 Oct 2021 11:05:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcmvX-0005XK-Db; Tue, 19 Oct 2021 11:05:03 +0000
Received: by outflank-mailman (input) for mailman id 213002;
 Tue, 19 Oct 2021 11:05:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mcmvV-0005XE-KW
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 11:05:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mcmvV-0008AP-Iv
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 11:05:01 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mcmvV-0004qB-Hn
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 11:05:01 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mcmvP-0000FM-0D; Tue, 19 Oct 2021 12:04:55 +0100
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
	bh=nnb2geRbcbSlLgx5UdzGDOidH9vfIgTEmDTEzYRrLh4=; b=bFWHsskyJYCiklS6BHMq8i+lxK
	s1HwetjJbecHc0QGHkoHb1hhkTRuTY9wUek4kvIdUP4IOMVG8vd6ShWmUzOzmhlIWo/6E5pXnfUFi
	Q1/st3Bp6SBkw2qNUN5FiKlIUNpm2gSOqrBgbsZubGkT93N0Y5sc0NvSUm3Tx0ozo3AQ=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24942.42582.584340.453247@mariner.uk.xensource.com>
Date: Tue, 19 Oct 2021 12:04:54 +0100
To: Jan Beulich <jbeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>,
    Wei Liu <wl@xen.org>,
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH] tools: fix oom setting of xenstored
In-Reply-To: <912b03a3-90df-e94e-77a9-5c673acfef04@suse.com>
References: <20211019044123.29648-1-jgross@suse.com>
	<0c93abe3-3908-009f-efca-08000092cd4d@suse.com>
	<c486ebb9-7cda-da67-7122-bceb291805b3@suse.com>
	<912b03a3-90df-e94e-77a9-5c673acfef04@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH] tools: fix oom setting of xenstored"):
> On 19.10.2021 09:31, Juergen Gross wrote:
> > I don't think set -e would have a negative effect on above line. The
> > bash man-page tells me that:
> > 
> >    The shell does not exit if the command that fails is part of the
> >    command list immediately following a while or until keyword, part of
> >    the test following the if, ...
> > 
> > And I believe that "[ ... ]" is treated like an "if".
> 
> I don't think so - "[ ... ]" is an equivalent of "test ...", i.e.
> unrelated to whether that's an operand of "if". The question is
> what effect && has, i.e. the behavior is due to what you've
> hidden by using ... in your quotation: "..., and is not a part of
> an AND or OR list, ...".

"[ ... ]" is precisely equivalent to "test ...".  But neither of these
is eqivalent to an "if".  When the docs say "part of the test
following the if" they are using the word "test" informally.

> I think I recall constructs like the one you use not working with
> "set -e" on at least some bash versions, though. Apparently this
> was due to a bash bug then (or I'm misremembering, but that's not
> overly likely since some of my long used scripts specifically
> avoid using && in such situations).

I agree that we should avoid this && construct.  Can we not just use
conditional assignment of a default value or an if statement ?

> >    ( set -e; [ -z "" ] && xx=okay; echo $xx; )
> > 
> > This will print "okay", so bash didn't exit.
> 
> Of course, because the left side of && succeeds. You'd need
> 
>    ( set -e; [ -z "xxx" ] && xx=okay; echo xx=$xx; )
> 
> and observe "xx=" getting printed. Which indeed I do observe on
> the one bash version I've tried to double check. But that one's
> surely newer than what I think I saw such problems on.

I think this particular && and || usage is not an idiomatic way of
spelling what would normally be a conditional in shell.

I think
  try_this || try_that
is fine but
  variable_nonempty || variable=value
is strange.

I would use ${param:=default_setting} or ${param:-default}
(or perhaps the colon-less variants).

Ian.

