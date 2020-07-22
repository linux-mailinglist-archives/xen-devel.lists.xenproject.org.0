Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9D72299C6
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jul 2020 16:06:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyFOB-000687-Ev; Wed, 22 Jul 2020 14:06:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yOZ1=BB=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jyFOA-000682-D7
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2020 14:06:30 +0000
X-Inumbo-ID: 8980ed31-cc24-11ea-8662-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8980ed31-cc24-11ea-8662-bc764e2007e4;
 Wed, 22 Jul 2020 14:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595426790;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=guJF1F+4rB+qPBfIVu2s2bC2RICGjU9i+5xaE5Cxt7Y=;
 b=IsCAeyIg21ASFDmf3lR5iH7M0JKWJtTNv80IZEkSNlysmhjMGpXuTW2d
 5yjsA7Lqg/WiG3BnaWj43+jJkcqawHNBw/uu+YEZks9opiZK3ppW/hyRy
 qJUBUqvFMuFxfdPBFliFQ5zfHFa5GPmgUc3Ke4Mp5LH+zCqiDi4c68+1P A=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: kCbtd7R0hAsXKJ6IpOtosQ9p/g76VluJOGu0DdK/lXBejCl+tEYxya64RFUCiRI0AqmRrjh0I2
 kVbpA63cLKEoJcKnZAkY4jnC451b4E8N7wEstqebmCOGFo3ZYZHOLWKGl3EvEfKw2dpG08YuEH
 UQqOHOne28GFwQg57yUWCCHgKc7C3n28RObBOPbOEeODTeO7HbDXPCRtC1YGdRS5+AdlAClLqy
 4R83/Ja9CmI+KuQkAh7hErii5EarIuFQLokQjLuPu0A9e2HmPqf5f5OqyBSDV5NpjjX5JSG+cA
 sWs=
X-SBRS: 2.7
X-MesageID: 22961238
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,383,1589256000"; d="scan'208";a="22961238"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <24344.18400.375008.553022@mariner.uk.xensource.com>
Date: Wed, 22 Jul 2020 15:06:24 +0100
To: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [OSSTEST PATCH 05/14] sg-report-flight: Use WITH to use best
 index use for $flightsq
In-Reply-To: <12D6C675-582D-467A-A882-B779652AF635@citrix.com>
References: <20200721184205.15232-1-ian.jackson@eu.citrix.com>
 <20200721184205.15232-6-ian.jackson@eu.citrix.com>
 <12D6C675-582D-467A-A882-B779652AF635@citrix.com>
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
Cc: Ian Jackson <Ian.Jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

George Dunlap writes ("Re: [OSSTEST PATCH 05/14] sg-report-flight: Use WITH to use best index use for $flightsq"):
> On Jul 21, 2020, at 7:41 PM, Ian Jackson <ian.jackson@eu.citrix.com> wrote:
> > After:
> >      WITH sub AS (
> >        SELECT DISTINCT flight, blessing
> >             FROM flights
> >             JOIN runvars r1 USING (flight)
> > 
> >            WHERE (branch='xen-unstable')
> >              AND ( (TRUE AND flight <= 151903) AND (blessing='real') )
> >              AND r1.name LIKE 'built_revision_%'
> >              AND r1.name = ?
> >              AND r1.val= ?
> > 
> >            ORDER BY flight DESC
> >            LIMIT 1000
> >      )
> >      SELECT *
> >        FROM sub
> >        JOIN jobs USING (flight)
> > 
> >       WHERE (1=1)
> >                  AND jobs.job = ?
> > 
> >      ORDER BY blessing ASC, flight DESC
> 
> I was wondering if it would be useful converting this to a join would be useful. :-)
...
> The main thing I see here is that there’s nothing *in the query*
> that guarantees you won’t get multiple flights if there are multiple
> jobs for that flight whose ‘job’ value; but given the naming scheme
> so far, I’m guessing job is unique…?  As long as there’s something
> else preventing duplication I think it’s fine.

(flight,job) is the primary key for the jobs table.

I can probably produce a schema dump if that would make reading this
stuff easier.

Ian.

