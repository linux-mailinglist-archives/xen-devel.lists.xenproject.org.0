Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FCF303E98
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 14:25:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75021.134954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4OLX-00005M-F1; Tue, 26 Jan 2021 13:25:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75021.134954; Tue, 26 Jan 2021 13:25:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4OLX-00004r-Bz; Tue, 26 Jan 2021 13:25:27 +0000
Received: by outflank-mailman (input) for mailman id 75021;
 Tue, 26 Jan 2021 13:25:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4OLV-0008WS-EP
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 13:25:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4OLV-0006jr-Dg
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 13:25:25 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4OLV-0007pe-Bz
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 13:25:25 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l4OLS-0006l7-1w; Tue, 26 Jan 2021 13:25:22 +0000
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
	bh=KKSOmj++8BoQrPFq0vlINL+fo6dpz0vfX7epP3dSvKs=; b=psOa6eNRaGCqjT5QWAZBjHqvUO
	/5KYxWYiepcS3j8kDgNJfsGqCdKs3DwbhPnJqqB5U6a1JmCs8uHSrXz5GvQh1nv6FRBZAW5b2rzk/
	s6a907ZRlcXgfkqvjIwYVHccxMnJsjrHPpimKMUhq8T6AqH5/zSerq2oenuS5SQv+4+c=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24592.6209.807340.13829@mariner.uk.xensource.com>
Date: Tue, 26 Jan 2021 13:25:21 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 00/15] zstd decompression for DomU-s + fallout /
 consolidation
In-Reply-To: <e47c3312-a815-286e-9c7c-8abc75800e0f@suse.com>
References: <2db91183-a7de-0c43-2fef-feb3523ed19b@suse.com>
	<24592.1425.471671.120897@mariner.uk.xensource.com>
	<e47c3312-a815-286e-9c7c-8abc75800e0f@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH v3 00/15] zstd decompression for DomU-s + fallout / consolidation"):
> On 26.01.2021 13:05, Ian Jackson wrote:
> > I approve of cleanups of course.  But:
> > 
> > Which of these cleanups were posted before the LPD ?  I'm not
> > currently aware of any reason for a freeze exception here, so I think
> > those patches which didn't meet the LPD should wait.  Ones which *did*
> > meet the LPD should be considered on their merits.
> > 
> > If you could direct me to which those are I would be happy to review
> > them.
> 
> All of them were posted after that date; only the Dom0 zstd
> decompression part was ready in time. I view this entire
> series as a logical extension to the earlier patches though.
> I'm unsure anyway how new patches in a previously submitted
> series would be treated in general; so far I've been under
> the impression that if in doubt the series as a whole would
> count, not every individual patch.

I think as a general rule, I don't think "logical extensions" to
things posted before the LPD count.  But bugfixes, and smallish
changes necessary to make the rest of a previously-posted series are
OK.

> As said (still visible above) I'm not meaning to insist on
> patches 3 and onwards to be taken. In fact it was you to
> ask whether patch 3 would possibly want a freeze exception.
> And you did give patch 4 a release ack already, based on it
> containing a bug fix. (The latter is true of patch 6 as
> well, btw.) Are you implying you withdraw that release ack
> now?

I'm afraid that I don't keep all this state in my head.  I rely on
written materials.  Where the written materials in front of me seem
self-sufficient and don't contain unresolved references or things that
are confusing, I rely on what is in front of me being sufficient.
ISTM that the point of a summary mail like yours is to save us going
and rereading all the background each time.

None of the subject lines in your mail mentioned that these were
bugfixes.  So I'm afraid I had forgotten that.

I'm not withdrawing my release ack for anything.  But whena commit is
being justified for 4.15 because it is (or contains) a bugfix then it
would be really good if the bugfix were mentioned in the summary line.

> While we're at this - how are bug fixes to be treated in
> this two week window? Do they need a release ack too if
> they did miss the LPD?

No.

>  I'm asking with specifically
> "xen/include: compat/xlat.h may change with .config
> changes" in mind, but there may be others, like Roger's
> 3-patch series posted today, which I intend to look at
> rather sooner than later.

Things that are just bugfixes do not need a release ack at this stage.
Things that are a mixture should either get a release ack, or be
separated out in which case the bugfix part does not need a release
ack.  I am happy to give out (or decline) acks in cases of doubt.

I appreciate your looking at bugfixes as a priority, so thanks.

> >> 07: gunzip: drop INIT{,DATA} and STATIC
> > 
> > I release-nacked this because I saw you posted it with this Subject
> >   Subject: [PATCH v3 01/15] gunzip: drop INIT{,DATA} and STATIC
> > which made me think you were targeting it for 4.15.  If not then fine.
> 
> FAOD - indeed it was a mistake of mine and was meant to
> be 07/15.

NP.

I hope this explanation makes some kind of sense and sorry for the
confusion.

Ian.

