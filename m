Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B37723480E
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 16:55:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1WRo-0007nf-V7; Fri, 31 Jul 2020 14:55:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RrDm=BK=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k1WRn-0007nK-4b
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 14:55:47 +0000
X-Inumbo-ID: e9cc33dc-d33d-11ea-abc9-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e9cc33dc-d33d-11ea-abc9-12813bfff9fa;
 Fri, 31 Jul 2020 14:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596207345;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=aHHPVD0dLbX3i8fEpJSmc/8YKtmbngH0igI0RVS0cZw=;
 b=TBN/KxTWdkZibVpIPT7T4DzWKirYOyxpzrt9tJsq8bz0ZixVt+4jW2U9
 DSVFEqoUI7Ow9YXZOCi56FTybJBXHwlyd6OWQrzAB37Z2Zt+MHBFfm885
 WMyVmH4OvtPVFa8HzmhDhl7Uz6s9E1NL2ZPLkHv1Ehz+isAfNc1f9pYtI k=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: gpR/ISQ8ds6LbISq4cCnf58nJBgwEhMtH8axr28zq/D7hbUqsHSLA6pcCajURCbg6K+dEcQQEN
 wB8WdN8WOq+QW1yqUXqN37SkXBc50Nm7mdrYgnFXF3f75p54pyHD+2hFlJVkf+l87CesQYP7TL
 ugGJDbuGmy5cWLqyP7GMMeuv0q8MKuFKrAVZa8zV2bmZohhJaGy4Mdj+bEkHOJRhnaA83uN0AU
 tIT7Ar4ZuacdWUYZ+r4bNUnK1YzEaUaEYfOUynZZySCt+9jPP+AbP1XgkGHkVdG9hMUMjnceAi
 cOs=
X-SBRS: 3.7
X-MesageID: 23957421
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,418,1589256000"; d="scan'208";a="23957421"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24356.12524.794794.651517@mariner.uk.xensource.com>
Date: Fri, 31 Jul 2020 15:55:40 +0100
To: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [OSSTEST PATCH v2 07/41] schema: Provide indices for
 sg-report-flight
In-Reply-To: <05461545-D39A-4B98-BC27-3560C367FE25@citrix.com>
References: <20200731113820.5765-1-ian.jackson@eu.citrix.com>
 <20200731113820.5765-8-ian.jackson@eu.citrix.com>
 <05461545-D39A-4B98-BC27-3560C367FE25@citrix.com>
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

George Dunlap writes ("Re: [OSSTEST PATCH v2 07/41] schema: Provide indices for sg-report-flight"):
> 
> 
> > On Jul 31, 2020, at 12:37 PM, Ian Jackson <ian.jackson@eu.citrix.com> wrote:
> > 
> > These indexes allow very fast lookup of "relevant" flights eg when
> > trying to justify failures.
> > 
> > In my ad-hoc test case, these indices (along with the subsequent
> > changes to sg-report-flight and Executive.pm, reduce the runtime of
> > sg-report-flight from 2-3ks (unacceptably long!) to as little as
> > 5-7s seconds - a speedup of about 500x.
> > 
> > (Getting the database snapshot may take a while first, but deploying
> > this code should help with that too by reducing long-running
> > transactions.  Quoted perf timings are from snapshot acquisition.)
> > 
> > Without these new indexes there may be a performance change from the
> > query changes.  I haven't benchmarked this so I am setting the schema
> > updates to be Preparatory/Needed (ie, "Schema first" as
> > schema/README.updates has it), to say that the index should be created
> > before the new code is deployed.
> > 
> > Testing: I have tested this series by creating experimental indices
> > "trial_..." in the actual production instance.  (Transactional DDL was
> > very helpful with this.)  I have verified with \d that schema update
> > instructions in this commit generate indexes which are equivalent to
> > the trial indices.
> > 
> > Deployment: AFter these schema updates are applied, the trial indices
> > are redundant duplicates and should be deleted.
...
> 
> I have no idea if building an index on a LIKE is a good idea or not, but it certainly seems to be useful, so:
> 
> Reviewed-by: George Dunlap <george.dunlap@citrix.com>

Thanks.

This is a thing called a "partial index", where the index only covers
some subset of the rows.  The subset is determined a condition on the
row contents.

Such an index can be a lot smaller than an index on the whole table
and also avoids slowing down updates that don't match the index
condition.

The idea is that when the query contains a condition that matches the
index condition, the query planner can use this small on-topic index
instead of wading through something large and irrelevant.

The query planner is not always very bright about what conditions are
subsets of what other conditions, and it runs without seeing the
contents of bind variables.  So with LIKE, for example, it's generally
necessary to precisely replicate the index condition in the queries.
That's why some of the queries in this series have things like this:

              AND r$ri.name LIKE 'built\_revision\_%'
              AND r$ri.name = ?

where the Perl code passes in 'built_revison_something'.

I hope this explanation was interesting :-).

Ian.

