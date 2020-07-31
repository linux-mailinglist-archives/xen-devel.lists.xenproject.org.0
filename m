Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C15D234895
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 17:44:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1XCH-00044X-TW; Fri, 31 Jul 2020 15:43:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RrDm=BK=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k1XCG-00044S-DZ
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 15:43:48 +0000
X-Inumbo-ID: 9e27f1f0-d344-11ea-abdc-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9e27f1f0-d344-11ea-abdc-12813bfff9fa;
 Fri, 31 Jul 2020 15:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596210226;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=ju2I/12vZhDvJEYkrAvMnqF4YhBzZ/juOIuVKzFJITc=;
 b=cGH4Cwezuzu2445bVl9kOkKNYCW4Ww1goWCyRBEFqQvLxqyrHjWHVu08
 R434/QZc3DU5MJherO9JDtEc4dZr2/rVjsAmdRnfbQtwUY4DNlX8KkDUh
 Z4Ez5qKDPnDLGSz+m4d9F5SpSBAplOQSU0yZV7FTOHVn88V5oa3Rz4ROg g=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: wPtrGNpzJe90TRtXKcvePH2T7zpctB+mpZoXOMyU4AgL7niD4giJ6WlNMjpUbkHL7R+5Qw/c/Y
 nbeUnsUt9DlufPzjPLDhogIJ6vHta/VrWKX+Kgq3o51HoAe+BRNX/aiHu22/jbC21xbUoAVtjC
 H24FS1bhKInRDIHEHpdPT3o1NSVzB+AmpsvrN1F2pvjx8cqoWaozm0q5EKyJyJL9prLaMF6qrK
 urpWk/iEIJLSWS5ZVC0jFp1s2r9tdaIL32h3JinuPVyioIMqeBApZDJxU/feSC3jc3ZHzDuKAA
 Vec=
X-SBRS: 3.7
X-MesageID: 24517364
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,418,1589256000"; d="scan'208";a="24517364"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <24356.15406.68578.77965@mariner.uk.xensource.com>
Date: Fri, 31 Jul 2020 16:43:42 +0100
To: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [OSSTEST PATCH v2 08/41] sg-report-flight: Ask the db for flights
 of interest
In-Reply-To: <391CB71B-3587-40C1-BE6E-F01A6473141D@citrix.com>
References: <20200731113820.5765-1-ian.jackson@eu.citrix.com>
 <20200731113820.5765-9-ian.jackson@eu.citrix.com>
 <391CB71B-3587-40C1-BE6E-F01A6473141D@citrix.com>
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

George Dunlap writes ("Re: [OSSTEST PATCH v2 08/41] sg-report-flight: Ask the db for flights of interest"):
> > On Jul 31, 2020, at 12:37 PM, Ian Jackson <ian.jackson@eu.citrix.com> wrote:
> > Specifically, we narrow the initial query to flights which have at
> > least some job with the built_revision_foo we are looking for.
> > 
> > This condition is strictly broader than that implemented inside the
> > flight search loop, so there is no functional change.
> 
> Assuming this is true, that job / runvar is filtered after extracting this information, then...
...
> …I agree that this shoud introduce no other changes.
> 
> Reviewed-by: George Dunlap <george.dunlap@citrix.com>

Thanks.

Just to convince myself, I ran through the argument based on the perl
code.  I found a lacuna.

1. The job of findaflight is to find a flight, and it doesn't have
   significant side effects - just a return value.

2. If it returns a flight from the loop, $whynot must have been
   undef.  $whynot is never unset.

Consider some tree in %{ $specver{$thisthat} }.

3. If @revisions is 0 for that tree, $whynot is set.  So one of the
   two queries $revisionsq or $revisionsosstestq must have returned
   some rows.

4. Furthermore, none of those rows must have passed the $wronginfo
   grep.  If they had, $whynot would have been set.  Any row
   whose val doesn't contain a colon, and which doesn't end up
   in $wronginfo, had a val equal to the requested specver.

5. Colons in this field appear only in mercurial revisions.  These are
   now obsoelete - we have no mercurial trees.  A consequence of this
   commit is actually that we should explicitly abolish mercurial
   support, at least pending a change to osstest to arrange for the
   val column to contain only the hash part and not the number part.

6. Together, these conditons means that if $whynot wasn't set,
   there must have been some row whose val matched the specver.

7. Both the $revisionsq and $revisionsosstestq queries take a flight
   bound variable condition.  This is bound by a value that came out
   of @binfos.  @binfos is made from %binfos, where the flight number
   is the key.  %binfos is populated by the @binfos_todo loop, where
   it gets the flight number from a @binfos_todos entry - but it
   filters them for $bflight == $tflight.

8. So some row must have matched the flight, and the specver, and
   of course the name.  This is precisely the new condition.

I think this means I should put a commit earlier in this series which
disables mercurial support until the colon version situation is
rationalised.

Ian.

