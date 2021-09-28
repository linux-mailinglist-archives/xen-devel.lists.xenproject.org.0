Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDB941B2A0
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 17:07:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198062.351373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVEhG-00010z-NY; Tue, 28 Sep 2021 15:07:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198062.351373; Tue, 28 Sep 2021 15:07:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVEhG-0000y0-JW; Tue, 28 Sep 2021 15:07:06 +0000
Received: by outflank-mailman (input) for mailman id 198062;
 Tue, 28 Sep 2021 15:07:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uYy3=OS=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mVEhE-0000so-TX
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 15:07:04 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2583176c-00d0-4706-b517-1191cbec5667;
 Tue, 28 Sep 2021 15:07:03 +0000 (UTC)
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
X-Inumbo-ID: 2583176c-00d0-4706-b517-1191cbec5667
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632841623;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=USxSn7DD6wpGToq+jqH/p+2Q4JiB0/26Ubd0hFYa9LA=;
  b=W/s9SRIcJaXfD+1av90AtqlhdTXr14yJQws6hxyjz3gkD6cKW7iPgYz4
   KmXJe04andWGQDI/ZEQG3FtoLjG+Gio669QOauPrVngc2YU5IjlGIzp4S
   HN5/Pj7bhmU0J9zTaxX9911L5SsWMME6UcTBz2m4r1zDpLzot01g9tMq1
   M=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: QJLeA7LiQ+cLlDzgZH4QFmps3txe7wsAMR/qdawHS3FkvwcFem9zD6i4jtqoZGVQeagYp+2Sgk
 dgviB1qwAsAgeqe5NUdAeViCAVkCOHsa9xJYUFbSJvhq3IpbQqrY1g8DQ6IK3DIzJr4hDEdrB/
 65Gv+EaAqznvtEXht4eS5QpAcMHPXGmBE/yDNS7rqlQ8M65TxpL45hw9cybg0dXW2plmlgkFZZ
 NZG8+wMmVkmKeVhmiY7cQUB4sW0PPWrsIStQdonz3vRGigp7eEpWO3c3t+igfegsz+cIa5Ww78
 erFR1W9pCz1OMX1qx5gFTzpP
X-SBRS: 5.1
X-MesageID: 53816312
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ZnxuFahOlxCGFB2/e47Yi7aSX1614hcKZh0ujC45NGQN5FlHY01je
 htvCGzUOv3fMWSmfY8gYI3n8EMGuJbXx9IyGwRtrCxhFSwb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0FU/NtTo5w7Rg2t8y0YDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1R6qapYzxqMJHXmf0SCB5iCyFbZvFJreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHiOp8fvXdxiynUF/88TbjIQrnQ5M8e1zA17ixLNauFN
 5NHMmM1BPjGS00TYHoXUYsQp82TxX/0SR9StmrFn7VitgA/yyQuieOwYbI5YOeiXt5Jl0yVo
 mbH+WXRARwAMtGbjz2f/RqEmevnjS79HoUIG9WQ5vNsxVGe2GEXIBkXTkeg5+m0jFakXNBSI
 FBS/TAhxYAw/kG2Stj2XzWjvWWJ+BUbXrJ4EvI4wBGAzLLO5ASUDXRCSSROAPQkqcs3SDoCx
 lKP2dTzClRSXKa9ECzHsO3O9HXrZHZTfTRqiTI4oRUt/4bZuasIzRzzVdd6H/WytMX1PGqsz
 GXfxMQhvIk7gckO3qS92FnIhTOwu5TEJjIIChXrsnGNtF0gO9/8D2C8wR2Lta8fcNbxokyp5
 iBspiSI0AwZ4XhhfgSjR/8RVJWg+vqIKjHVhVMH83IJrG/2oy/LkWy9+lhDyKZV3iQsJWOBj
 Kz741o5CHpv0J2CNvQfj2WZUZhC8EQYPY65Ps04l/IXCnSLSCeJ/Tt1eWmb1H33nU4nnMkXY
 MnAK5nyXSxDU/g+l1JaotvxN5dwnUjSIkuJGfjGI+mPi+LCNBZ5t59fWLdxUgzJxPzd+1iEm
 zquH8CL1w9eQIXDjtr/q+YuwaQxBSFjX/je8pUPHsbae1YOMDxxWpf5nOJ6E6Q4zvs9qws91
 izkMqOu4AGk3iOvxMTjQi0LVY4Dqr4l9i9kYXxwYwz4s5XhCK72hJoim1IMVeFP3IReITRcF
 ZHpou2MXaZCTCrp4TMYYcWvpYBubk3z1wmPIzCkcH40eJs5H17F/drtfw3O8igSD3Xo6Zti8
 uP4jg6LE4AeQwlCDdrNbK79xV2GonVAyvl5WFHFI4cPdRy0opRqMSH4ktQ+P9oIdUfY3jKf2
 gvPWUUYqODBrpUb6t7MgazY/Y6lH/EnRhhRHnXB7KbwPi7fpzLxzYhFWeeOXDbcSGKrp/nyO
 bQLl6nxaaRVkkxLvoxwF6dQ4Zg/v9a/9aVHyglEHWnQawj5AL1XPXTbj9JEsbdAx+EFtFLuC
 F6P4NRTJZ6AJNjhTAwKPAMgY+mOiaMUlz3V4ahnKUn2/nYqrr+OUEEUNBiQki1NarByNdp9k
 +smvccX7S25iwYrbYna3nwFqTzUIyxSSbgju7EbHJTv21gixVx1aJDBDjP7vcOUYNJWP0h2e
 jKZicIuXViHKpYup5brKUXw4A==
IronPort-HdrOrdr: A9a23:a3qokaFRkZXYm9EppLqE6seALOsnbusQ8zAXP0AYc31om+ij5q
 eTdZUgpHvJYVkqNE3I9eruBEDEewK7yXcX2/h1AV7BZniEhILAFugLhuGO/9SjIVydygc079
 YYT0EUMr3N5DZB4/rH3A==
X-IronPort-AV: E=Sophos;i="5.85,329,1624334400"; 
   d="scan'208";a="53816312"
Date: Tue, 28 Sep 2021 16:06:40 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v4] xen: rework `checkpolicy` detection when using
 "randconfig"
Message-ID: <YVMvgGxlcoD1ceB/@perard>
References: <20210928083944.780398-1-anthony.perard@citrix.com>
 <bdd68129-0415-2018-c0bf-98687094dab4@suse.com>
 <YVMn1TW8mKpAwImA@perard>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YVMn1TW8mKpAwImA@perard>

On Tue, Sep 28, 2021 at 03:34:00PM +0100, Anthony PERARD wrote:
> On Tue, Sep 28, 2021 at 03:46:01PM +0200, Jan Beulich wrote:
> > On 28.09.2021 10:39, Anthony PERARD wrote:
> > > This will help prevent the CI loop from having build failures when
> > > `checkpolicy` isn't available when doing "randconfig" jobs.
> > > 
> > > To prevent "randconfig" from selecting XSM_FLASK_POLICY when
> > > `checkpolicy` isn't available, we will actually override the config
> > > output with the use of KCONFIG_ALLCONFIG.
> > > 
> > > Doing this way still allow a user/developer to set XSM_FLASK_POLICY
> > > even when "checkpolicy" isn't available. It also prevent the build
> > > system from reset the config when "checkpolicy" isn't available
> > > anymore. And XSM_FLASK_POLICY is still selected automatically when
> > > `checkpolicy` is available.
> > > But this also work well for "randconfig", as it will not select
> > > XSM_FLASK_POLICY when "checkpolicy" is missing.
> > > 
> > > This patch allows to easily add more override which depends on the
> > > environment.
> > > 
> > > Also, move the check out of Config.mk and into xen/ build system.
> > > Nothing in tools/ is using that information as it's done by
> > > ./configure.
> > > 
> > > We named the new file ".allconfig.tmp" as ".*.tmp" are already ignored
> > > via .gitignore.
> > > 
> > > Remove '= y' in Kconfig as it isn't needed, only a value "y" is true,
> > > anything else is considered false.
> > 
> > Seeing you say this explicitly makes me wonder - is this actually true?
> 
> I've check that this was true by empirical testing before sending the
> patch. But the documentation isn't clear to me about the meaning of
> 'default y if "m"'. So would you rather keep '= y' just to stay on the
> safe side?

I've sent v5 with this change to the Kconfig file removed.

-- 
Anthony PERARD

