Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE403B420B
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jun 2021 13:00:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147110.270929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwjYj-0005HD-1t; Fri, 25 Jun 2021 10:59:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147110.270929; Fri, 25 Jun 2021 10:59:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwjYi-0005F1-Ul; Fri, 25 Jun 2021 10:59:40 +0000
Received: by outflank-mailman (input) for mailman id 147110;
 Fri, 25 Jun 2021 10:59:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lwjYh-0005Ev-QG
 for xen-devel@lists.xenproject.org; Fri, 25 Jun 2021 10:59:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lwjYh-0000bw-PS
 for xen-devel@lists.xenproject.org; Fri, 25 Jun 2021 10:59:39 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lwjYh-00009J-Oe
 for xen-devel@lists.xenproject.org; Fri, 25 Jun 2021 10:59:39 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lwjYb-0003ja-Bt; Fri, 25 Jun 2021 11:59:33 +0100
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
	bh=6Z2Z4kabWMAKspZ0lr5ZblTSxmGY+JwvsFhRSW82OdA=; b=UVjwBGyl0X6esdrmC3FZycrWoo
	PJxS/MOO30bMzpCjD3U2dYoxtOs4Ni0ViOWRuCnf0ZeVtGco8svakjtCi8fWcDsegwOz197wBMqNa
	4tUJMUEtqWRxWeJtgTNNnqoB/11peiUk6b03c29ghPusa19+ZDRIoeb/fPXTb0sU6QFw=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24789.46868.943149.770825@mariner.uk.xensource.com>
Date: Fri, 25 Jun 2021 11:59:32 +0100
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>,
    Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] libxencall: Bump SONAME following new functionality
In-Reply-To: <4b360f95-aec2-935b-ce95-73a01cae98be@suse.com>
References: <20210624175521.20843-1-andrew.cooper3@citrix.com>
	<6e103351-f3eb-39c8-441d-be926579f2ca@suse.com>
	<9c5cff0e-0ab6-7015-3667-bad2d9f5b31e@citrix.com>
	<4b360f95-aec2-935b-ce95-73a01cae98be@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH] libxencall: Bump SONAME following new functionality"):
> On 25.06.2021 11:17, Andrew Cooper wrote:
> > On 25/06/2021 07:31, Jan Beulich wrote:
> >> On 24.06.2021 19:55, Andrew Cooper wrote:
> >>> Fixes: bef64f2c00 ("libxencall: introduce variant of xencall2() returning long")
> >> Is this strictly necessary, i.e. is a Fixes: tag here warranted?
> > 
> > Yes - very much so.
> > 
> > andrewcoop@andrewcoop:/local/xen.git/xen$ readelf -Wa
> > ../tools/libs/call/libxencall.so.1.2 | grep 1\\.3
> >     33: 0000000000001496    59 FUNC    GLOBAL DEFAULT   13
> > xencall2L@@VERS_1.3
> >     39: 0000000000000000     0 OBJECT  GLOBAL DEFAULT  ABS VERS_1.3
> >     76: 0000000000000000     0 OBJECT  GLOBAL DEFAULT  ABS VERS_1.3
> >   020:   4 (VERS_1.2)      5 (VERS_1.3)      2 (VERS_1.0)      3
> > (VERS_1.1)  
> >   024:   3 (VERS_1.1)      2 (VERS_1.0)      4 (VERS_1.2)      5
> > (VERS_1.3)  
> >   0x0080: Rev: 1  Flags: none  Index: 5  Cnt: 2  Name: VERS_1.3
> > 
> > Without this, you create a library called .so.1.2 with 1.3's ABI in.
> 
> I'm aware of the change to file contents as well as the disagreement
> of file name / SONAME vs enumerated versions. So telling me this is
> not really an answer to my question. It may be by convention that
> the two should match up, but I don't see any functional issue (yet)
> if they don't. Plus of course you leave open altogether the
> backporting aspect of my question.

The patch, including the Fixes tag,

Reviewed-by: Ian Jackson <iwj@xenproject.org>

Changing minor version in the filename as well as the .so is not an
impediment to backporting.  The actual soname remains the same so
there is no compatibility problem and the change is still suitable for
including in eg distro stsable releases.

Not changing the filename is quite strange.  I havne't thought through
all of the implications but I'm sure it will confuse people, and it
seems like to confuse at least some computer programs that handle this
kind of thing.

Ian.

