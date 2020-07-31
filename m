Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7382B23442E
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 12:40:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1SS6-00080V-HQ; Fri, 31 Jul 2020 10:39:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RrDm=BK=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k1SS5-00080Q-0J
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 10:39:49 +0000
X-Inumbo-ID: 274a646e-d31a-11ea-8e23-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 274a646e-d31a-11ea-8e23-bc764e2007e4;
 Fri, 31 Jul 2020 10:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596191987;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=zM6KH5wyqkh3s6YsZsewwZhKYOgVuv5Vsro5/IwWIe0=;
 b=PPJT1erLB3YiJVwbitKsA7xuojH7f0oj+AiAQKfZ1havkL2FW2pyi1dr
 1OLPc0kZWemQT7wB+H5EeVhcP6LxM6OMRK1p6icxZ9TXlQxYRLliUM7AK
 f7Ee2DkGRnoW5/eJCj142s3A2EdaPodBnP/xRzlk2tz+1D0rS62bxx3CA o=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: be2iGoBLgkqyAJLEhvLkfCPrVhm3b9ahX3h9weEFiIU2Rrrdn3oHsYJ5lwDk841nOpvNF+aSoV
 aED+Da3PknT51FkzpqQ1y36F0GP/Ylx+QR1SiRKFFcUf0ECT6rcLS+uGuz1Y5S1zIfcKzjdCbH
 BJJx+/CxYNnaz7nOzjvAuDm+H1ngQI2OKz+SNzEbawMSWUjey9VvR1okyyZslCV96XmguCAIRV
 T5u7GR2LIp+yfgAMKNY4xrqNv54vbs4Sjv/NP7yAQtFr3WZjSltvenSMFMOwiN5kXh/uOpWEm8
 F3k=
X-SBRS: 3.7
X-MesageID: 24493179
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,418,1589256000"; d="scan'208";a="24493179"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <24355.62702.194666.338534@mariner.uk.xensource.com>
Date: Fri, 31 Jul 2020 11:39:42 +0100
To: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [OSSTEST PATCH 14/14] duration_estimator: Move duration query
 loop into database
In-Reply-To: <7A4B6786-4456-44E4-A85D-9CC83B522FBB@citrix.com>
References: <20200721184205.15232-1-ian.jackson@eu.citrix.com>
 <20200721184205.15232-15-ian.jackson@eu.citrix.com>
 <7A4B6786-4456-44E4-A85D-9CC83B522FBB@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

George Dunlap writes ("Re: [OSSTEST PATCH 14/14] duration_estimator: Move duration query loop into database"):
> > On Jul 21, 2020, at 7:42 PM, Ian Jackson <ian.jackson@eu.citrix.com> wrote:
...
> > Example queries before (from the debugging output):
> > 
> > Query A part I:
> > 
> >            SELECT f.flight AS flight,
> >                   j.job AS job,
> >                   f.started AS started,
> >                   j.status AS status
> >                     FROM flights f
> >                     JOIN jobs j USING (flight)
> >                     JOIN runvars r
> >                             ON  f.flight=r.flight
> >                            AND  r.name=?
> >                    WHERE  j.job=r.job
> 
> Did these last two get mixed up?  My limited experience w/ JOIN ON
> and WHERE would lead me to expect we’re joining on
> `f.flight=r.flight and r.job = j.job`, and having `r.name = ?` as
> part of the WHERE clause.  I see it’s the same in the combined query
> as well.

Well spotted.  However, actually, this makes no difference: with an
inner join, ON clauses are the same as WHERE clauses.  It does seem
stylistically poor though, so I will add a commit to change it.

> > Query common part II:
> > 
> >        WITH tsteps AS
> >        (
> >            SELECT *
> >              FROM steps
> >             WHERE flight=? AND job=?
> >        )
> >        , tsteps2 AS
> >        (
> >            SELECT *
> >              FROM tsteps
> >             WHERE finished <=
> >                     (SELECT finished
> >                        FROM tsteps
> >                       WHERE tsteps.testid = ?)
> >        )
> >        SELECT (
> >            SELECT max(finished)-min(started)
> >              FROM tsteps2
> >          ) - (
> >            SELECT sum(finished-started)
> >              FROM tsteps2
> >             WHERE step = 'ts-hosts-allocate'
> >          )
> >                AS duration
> 
> Er, wait — you were doing a separate `duration` query for each row of the previous query?  Yeah, that sounds like it could be a lot of round trips. :-)

I was doing, yes.  This code was not really very optimised.

> I mean, in both queries (A and B), the transform should basically result in the same thing happening, as far as I can tell.

Good, thanks.

> I can try to analyze the duration query and see if I can come up with any suggestions, but that would be a different patch anyway.

It's fast enough now :-).

Thanks,
Ian.

