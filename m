Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8E422F46F
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jul 2020 18:16:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k05mx-0002Wj-JI; Mon, 27 Jul 2020 16:15:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qU+V=BG=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1k05mv-0002We-JU
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2020 16:15:41 +0000
X-Inumbo-ID: 69a87e66-d024-11ea-8ad3-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 69a87e66-d024-11ea-8ad3-bc764e2007e4;
 Mon, 27 Jul 2020 16:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595866540;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=xYD4y5LZG9bWdcQ4wHI/ketk1UinKIDQYh7dblPQgaA=;
 b=C8RUSahkYSYgC97mQceqxK9fTE1yGhXATjmDiLk7IK3DDpsmqFFf8klt
 kB/CLNdMWtsPIBv1hMMKHbmur/N4Ixtt/YldT9QhsmeQzturpNDAYh7Sa
 Crn/SzbW+PF2D7Eh9BpazcbwvePb8sqrCyB6vvn3xhpSjoFBWsRVv0D9K E=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: blYReVZ7jcnzuKuWDXWEqtriAH915lGvknKJaAFw2SYEgAHHaU9vrLn3JpnHPh1nWnF8SL+2gU
 yG87+gTaiEVUjfcBQMX0NZVWBuYM0vY4fYv/TodITVtcn+8RWZe2YWUF7nX3ghf6tToa5EawIa
 ZzERfsyABbIYxxYpouSgQCW9czUmi9o2IH7qIMHDQcZ55y0SUbt9irfzBYza0MkpgDSqxJb8mP
 ba7GuQFSSOj7y/6EX9nvgTZyybCm6TyTb17z1aaCxw1DEmzkcq9OUeBKfwrxqoboopkc84IIuR
 Iu4=
X-SBRS: 2.7
X-MesageID: 23463965
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,402,1589256000"; d="scan'208";a="23463965"
From: George Dunlap <George.Dunlap@citrix.com>
To: Ian Jackson <Ian.Jackson@citrix.com>
Subject: Re: [OSSTEST PATCH 06/14] sg-report-flight: Use WITH clause to use
 index for $anypassq
Thread-Topic: [OSSTEST PATCH 06/14] sg-report-flight: Use WITH clause to use
 index for $anypassq
Thread-Index: AQHWX46tFgmYVwZS+kmF2kdEj3oAf6kbga0A
Date: Mon, 27 Jul 2020 16:15:36 +0000
Message-ID: <E1356BFA-1FDF-42B8-A4E1-47C45F93D036@citrix.com>
References: <20200721184205.15232-1-ian.jackson@eu.citrix.com>
 <20200721184205.15232-7-ian.jackson@eu.citrix.com>
In-Reply-To: <20200721184205.15232-7-ian.jackson@eu.citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8654226DEB495D4D95881F479438D734@citrix.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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



> On Jul 21, 2020, at 7:41 PM, Ian Jackson <ian.jackson@eu.citrix.com> wrot=
e:
>=20
> Perf: runtime of my test case now ~11s
>=20
> Example query before (from the Perl DBI trace):
>=20
>        SELECT * FROM flights JOIN steps USING (flight)
>            WHERE (branch=3D'xen-unstable')
>              AND job=3D? and testid=3D? and status=3D'pass'
>              AND ( (TRUE AND flight <=3D 151903) AND (blessing=3D'real') =
)
>            LIMIT 1
>=20
> After:
>=20
>        WITH s AS
>        (
>        SELECT * FROM steps
>         WHERE job=3D? and testid=3D? and status=3D'pass'
>        )
>        SELECT * FROM flights JOIN s USING (flight)
>            WHERE (branch=3D'xen-unstable')
>              AND ( (TRUE AND flight <=3D 151903) AND (blessing=3D'real') =
)
>            LIMIT 1
>=20
> In both cases with bind vars:
>=20
>   "test-amd64-i386-xl-pvshim"
>   "guest-start"
>=20
> Diff to the query:
>=20
> -        SELECT * FROM flights JOIN steps USING (flight)
> +        WITH s AS
> +        (
> +        SELECT * FROM steps
> +         WHERE job=3D? and testid=3D? and status=3D'pass'
> +        )
> +        SELECT * FROM flights JOIN s USING (flight)
>             WHERE (branch=3D'xen-unstable')
> -              AND job=3D? and testid=3D? and status=3D'pass'
>               AND ( (TRUE AND flight <=3D 151903) AND (blessing=3D'real')=
 )
>             LIMIT 1
>=20
> CC: George Dunlap <George.Dunlap@citrix.com>
> Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
> ---
> schema/steps-job-index.sql |  2 +-
> sg-report-flight           | 14 ++++++++++++--
> 2 files changed, 13 insertions(+), 3 deletions(-)
>=20
> diff --git a/schema/steps-job-index.sql b/schema/steps-job-index.sql
> index 07dc5a30..2c33af72 100644
> --- a/schema/steps-job-index.sql
> +++ b/schema/steps-job-index.sql
> @@ -1,4 +1,4 @@
> --- ##OSSTEST## 006 Preparatory
> +-- ##OSSTEST## 006 Needed
> --
> -- This index helps sg-report-flight find if a test ever passed.
>=20
> diff --git a/sg-report-flight b/sg-report-flight
> index b5398573..b8d948da 100755
> --- a/sg-report-flight
> +++ b/sg-report-flight
> @@ -849,10 +849,20 @@ sub justifyfailures ($;$) {
>=20
>     my @failures=3D values %{ $fi->{Failures} };
>=20
> +    # In psql 9.6 this WITH clause makes postgresql do the steps query
> +    # first.  This is good because if this test never passed we can
> +    # determine that really quickly using the new index, without
> +    # having to scan the flights table.  (If the test passed we will
> +    # probably not have to look at many flights to find one, so in
> +    # that case this is not much worse.)

Seems a bit weird, but OK.  The SQL looks the same, so:

Reviewed-by: George Dunlap <george.dunlap@citrix.com>


