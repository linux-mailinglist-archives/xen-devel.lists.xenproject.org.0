Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD197229993
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jul 2020 15:51:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyF8C-0004HG-K0; Wed, 22 Jul 2020 13:50:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yOZ1=BB=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jyF8B-0004HB-4O
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2020 13:49:59 +0000
X-Inumbo-ID: 39f47586-cc22-11ea-8656-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 39f47586-cc22-11ea-8656-bc764e2007e4;
 Wed, 22 Jul 2020 13:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595425797;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=qJsAsTIlOWPMJ2E3fyLul1sYHDh13bYAVNY5PRBa3Fs=;
 b=AWhl+d89WKRpT6Ab0zHBP6qwO75Edyxf8pHxge46ZXNEyzcAJ0zzMsC3
 en18AU9aaMhkpwVc2uxlAv3fnqSXMNtbSVreTF3a4A6Xv75BWB9CktaG6
 CM81VUkwi1xP7C6FG4zMpx2tEpputKn/an9TzvFxh6ELVLO/EFixcW1Pi c=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: ipHFvHi5QGu2VadyFS6Fyf4ZelRNo3p2OSndFaUhQiEatTRftXeMQdhJiOflKEh76lRNMFxMhg
 MJOcnAPKn0n0Puf+fTY5eUqPCYPYGTaw8vFfV4Uc/gLDMbPhbmmwWySX4V9arhXcZzca9SHOWd
 jibS2bJB64MTRWZ3ohS0kQekQfP60xneokZRWqbqlB/lb9QuFQdQ/RjXTtV91y+F1+YypeQj/R
 zTC/m7edZFQ4Nt9R4PJR/FT1a5NBPpfmwKQPN9NLjXn8zJ97UlkAv3Rhb+cwPPzVVJkoG1gIeO
 k/c=
X-SBRS: 2.7
X-MesageID: 23801730
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,383,1589256000"; d="scan'208";a="23801730"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <24344.17407.490315.888745@mariner.uk.xensource.com>
Date: Wed, 22 Jul 2020 14:49:51 +0100
To: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [OSSTEST PATCH 08/14] Executive: Use index for report__find_test
In-Reply-To: <3ACBEEA3-C17D-48AE-8AE5-52C9D92C8C46@citrix.com>
References: <20200721184205.15232-1-ian.jackson@eu.citrix.com>
 <20200721184205.15232-9-ian.jackson@eu.citrix.com>
 <3ACBEEA3-C17D-48AE-8AE5-52C9D92C8C46@citrix.com>
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

George Dunlap writes ("Re: [OSSTEST PATCH 08/14] Executive: Use index for report__find_test"):
> > On Jul 21, 2020, at 7:41 PM, Ian Jackson <ian.jackson@eu.citrix.com> wrote:
> > Example query before (from the Perl DBI trace):
...
> So this says:
> 
> Get me all the columns
> for the highest-numbered flight
> Where:
>   There is at least one runvar for that flight has the specified $name and $value
>   And the job is *not* like build-%-prev or build-%-freebsd
>   The flight number (?) is <= 151903, and blessing = real
>   For the specified $branch

Yes.

> What’s the “TRUE and flight <= 151903” for?

These queries are programmetically constructed.  In this case, the
flight condition is not always there.  My test case had a
--max-flight=151903 on the command line: this is a debugging option.
It avoids newly added stuff in the db confusing me and generally
disturbing things.  This is implemented with a condition variable
which contains either "" or "and flight <= 151903".  Doing it this way
simplifies the generation code.

> And this says (effectively)
> 
> Get me <flight, started, blessing, branch, intended>
> From the highest-numbered flight
> Where
>   That flight has a runvar with specified name and value
>   The job *doesn’t* look like “build-%-prev” or “build-%-freebsd”
>   flight & blessing as appropriate
>   branch as specified.

I think so, yes.

> Isn’t the r.flight = f.flight redundant if we’re joining on flight?

Indeed it is.  I guess I can add a patch at theend to delete that.

> Also, in spite of the paragraph attempting to explain it, I’m afraid
> I don’t understand what the “AS sub WHERE TRUE” is for.

The reason for the subquery is not evident in the SQL.  It's because
of the Perl code which generates this query.  The same code is used to
generate queries that start with things like
   SELECT * ...
   SELECT COUNT(*) AS count ...
The perl code gets told "*" or "COUNT(*) AS count".  The call sites
that pass "*" expect to see fields from flights.  It would be
possible to change "*" to the explicit field list everywhere, but
it was much easier to do it this way.

(The WHERE TRUE is another one of these stubs where a condition might
appear.)

> But it looks like the new query should do the same thing as the old
> query, assuming that the columns from the subquery are all the
> columns that you need in the correct order.

The subquery columns are precisely the columns currently existing in
he flights table.

Thanks,
Ian.

