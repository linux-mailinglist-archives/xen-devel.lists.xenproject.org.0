Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7FA2299AB
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jul 2020 16:04:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyFLN-000614-Vj; Wed, 22 Jul 2020 14:03:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yOZ1=BB=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jyFLM-00060z-9Q
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2020 14:03:36 +0000
X-Inumbo-ID: 21161d39-cc24-11ea-865f-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 21161d39-cc24-11ea-865f-bc764e2007e4;
 Wed, 22 Jul 2020 14:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595426616;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=RoY830mZQUlGRogyZSkEZerSmwZ3DbZmjbLDb8s4x/A=;
 b=KWxlmMW6tHQ/EzdJ7nkhd5R07xzxYOeKIDixlD5lzlk/Hmj+EmvVe4Et
 uZ+KX1wHGT1GVluzrRMPG53M/PabzzqqMO2DHTqlT3EGbOzxNLLkUuJvd
 znVo1Kw7IwhfNEgvTZAXcBgPcJKH7Vfg/8clNznMOWw3KDf+NII8m7P8h c=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: LDmwW1axsGR/U/YiRxozgv66iZwJOmkzlfxs2AorzEl66aTvDhzBSSume0gTtRS6lbxh8CO197
 kkNAQEPBdhrYf4MWBQC4VJROfDjRlUdype5BOWFzPwEw36HO+QFuB4LP02kh1KmhA1LcOtKbAJ
 1uNs82T/O8+/Ol3tG9hIWd+JmgY9oShblK2s5iMRDC56bOrRrHx4WokGS7MZdL+ebSj8UdOins
 3c+cjBkw8jFSTMUXSv5hvv2oreWAoi4KDADYL0sth+lPKVtERxc9VnerfjLpvlzBqF2yP7c+2T
 Tog=
X-SBRS: 2.7
X-MesageID: 22960915
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,383,1589256000"; d="scan'208";a="22960915"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <24344.18220.286848.935081@mariner.uk.xensource.com>
Date: Wed, 22 Jul 2020 15:03:24 +0100
To: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [OSSTEST PATCH 04/14] sg-report-flight: Ask the db for flights of
 interest
In-Reply-To: <3966AFCB-7B7B-45BE-A3F1-7E04943EEEFA@citrix.com>
References: <20200721184205.15232-1-ian.jackson@eu.citrix.com>
 <20200721184205.15232-5-ian.jackson@eu.citrix.com>
 <3966AFCB-7B7B-45BE-A3F1-7E04943EEEFA@citrix.com>
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

George Dunlap writes ("Re: [OSSTEST PATCH 04/14] sg-report-flight: Ask the db for flights of interest"):
> > On Jul 21, 2020, at 7:41 PM, Ian Jackson <ian.jackson@eu.citrix.com> wrote:
> > Example query before (from the Perl DBI trace):
> > 
> >      SELECT * FROM (
> >        SELECT flight, blessing FROM flights
...
> >              AND ( (TRUE AND flight <= 151903) AND (blessing='real') )
...
> But why are we selecting ‘blessing’ from these, if we’ve specified that blessing = “real”? Isn’t that redundant?

That condition is programmatically constructed.  Sometimes it will ask
for multiple different blessings and then it wants to know which.

> > After:
...
> So this says:
> 
> Find me the most 1000 recent flights
> Where:
>   branch is “xen-unstable”
>   flight <= 15903
>   blessing is “real”
>   One of its jobs is $job
>   It has a runvar matching given $name and $val
> 
> And of course it uses the ’name LIKE ‘built_revision_%’ index.

Yes.

> Still don’t understand the ’TRUE AND’ and ‘AS sub’ bits, but it
> looks to me like it’s substantially the same query, with additional
> $name = $val runvar restriction.

That's my intent, ytes.

> And given that you say, "This condition is strictly broader than
> that implemented inside the flight search loop”, I take it that it’s
> again mainly to take advantage of the new index?

Right.  The previous approach was "iterate over recent flights,
figure out precisely what they built, and decide if they meet the
(complex) requirements".

Now we only iterate over a subset of recent flights: those which have
at least one such runvar.  The big commennt is meant to be a
demonstration that the "(complex) requirements" are a narrower
condition than the new condition on the initial flights query.

So I think the result is that it will look deeper into history, and be
faster, but not otherwise change its beaviour.

Ian.

