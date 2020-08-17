Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4861A24642A
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 12:12:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7c7t-0000mk-CH; Mon, 17 Aug 2020 10:12:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wKSP=B3=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1k7c7r-0000ma-JA
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 10:12:23 +0000
X-Inumbo-ID: 162194db-47ae-41c3-b278-b46a598990b4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 162194db-47ae-41c3-b278-b46a598990b4;
 Mon, 17 Aug 2020 10:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597659142;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MDo4ar+XyavsU4q0q8sKTQYrIRnwTRFHiFxJuFoNWRc=;
 b=CIJYeHX1f4BJs7Qhd8iGU2bnzzjwlLWfDcTRewbzps/eLOLevI30NcKl
 1U8pa8AnjqVyPbJyWt/+37bnY4wZm6AzqvVrjwU+YN7+MYktbuSTIUB6B
 HZHwD5juodvCO0T2o0txtQUNoJavDf6hEX8tvcZcb/Yj/63hF475xNjRr 4=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: qAHlwhaUfYgfHTwRvdvQJAZ1Cnzk+NAW4cis+xZgI1ZnLpOpSNPGLp47Who8DrYpfvPLaWFbKm
 BWsyu6Ka+KSlwyI/B730/Ey2PDY7P3jTL7L5IGmsV3zYptApwUeip/UV2W0CmKFCe7rGCCM6m1
 e9CihVRJHsCzZLDU3xDZNfdEgE/Ew49fXzQKKJs3T453hhsZgRwbKTiiaN1mq8Urjw1zt8NmZO
 escPUggDXG9rXdrFtsvQI5ee7vl1gi88FKWHyVz+wYacEKseUJBYSstudEAyiL2IkxCbzEZWEc
 f7c=
X-SBRS: 2.7
X-MesageID: 25584448
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,322,1592884800"; d="scan'208";a="25584448"
From: Christian Lindig <christian.lindig@citrix.com>
To: Edwin Torok <edvin.torok@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
CC: David Scott <dave@recoil.org>, Ian Jackson <Ian.Jackson@citrix.com>, "Wei
 Liu" <wl@xen.org>
Subject: Re: [PATCH v1 0/6] tools/ocaml/xenstored: simplify code
Thread-Topic: [PATCH v1 0/6] tools/ocaml/xenstored: simplify code
Thread-Index: AQHWcof9CyuGFmlmrU+YP676eBh39Kk8Fvp3
Date: Mon, 17 Aug 2020 10:12:14 +0000
Message-ID: <1597659134063.85409@citrix.com>
References: <cover.1597439193.git.edvin.torok@citrix.com>
In-Reply-To: <cover.1597439193.git.edvin.torok@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="iso-8859-1"
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

I am going to look at this in more detail. In general, all of this are welc=
ome changes. The main problem with select/poll is emulation of select behav=
iour which creates a lot of lists and consequently memory garbage at high f=
requency. This change is not yet addressing that but by dropping select pav=
es the way to a more efficient implementation.=0A=
=0A=
________________________________________=0A=
From: Edwin Torok=0A=
Sent: 14 August 2020 23:11=0A=
To: xen-devel@lists.xenproject.org=0A=
Cc: Edwin Torok; Christian Lindig; David Scott; Ian Jackson; Wei Liu=0A=
Subject: [PATCH v1 0/6] tools/ocaml/xenstored: simplify code=0A=
=0A=
Fix warnings, and delete some obsolete code.=0A=
oxenstored contained a hand-rolled GC to perform hash-consing:=0A=
this can be done with a lot fewer lines of code by using the built-in Weak =
module.=0A=
=0A=
The choice of data structures for trees/tries is not very efficient: they a=
re just=0A=
lists. Using a map improves lookup and deletion complexity, and replaces ha=
nd-rolled=0A=
recursion with higher-level library calls.=0A=
=0A=
There is a lot more that could be done to optimize socket polling:=0A=
an epoll backend with a poll fallback,but API structured around event-based=
 polling=0A=
would be better. But first lets drop the legacy select based code: I think =
every=0A=
modern *nix should have a working poll(3) by now.=0A=
=0A=
This is a draft series, in need of more testing.=0A=
=0A=
Edwin T=F6r=F6k (6):=0A=
  tools/ocaml/libs/xc: Fix ambiguous documentation comment=0A=
  tools/ocaml/xenstored: fix deprecation warning=0A=
  tools/ocaml/xenstored: replace hand rolled GC with weak GC references=0A=
  tools/ocaml/xenstored: drop select based=0A=
  tools/ocaml/xenstored: use more efficient node trees=0A=
  tools/ocaml/xenstored: use more efficient tries=0A=
=0A=
 tools/ocaml/libs/xc/xenctrl.mli               |  2 +=0A=
 tools/ocaml/xenstored/connection.ml           |  3 -=0A=
 tools/ocaml/xenstored/connections.ml          |  2 +-=0A=
 tools/ocaml/xenstored/disk.ml                 |  2 +-=0A=
 tools/ocaml/xenstored/history.ml              | 14 ----=0A=
 tools/ocaml/xenstored/parse_arg.ml            |  7 +-=0A=
 tools/ocaml/xenstored/{select.ml =3D> poll.ml}  | 14 +---=0A=
 .../ocaml/xenstored/{select.mli =3D> poll.mli}  | 12 +---=0A=
 tools/ocaml/xenstored/store.ml                | 49 ++++++-------=0A=
 tools/ocaml/xenstored/symbol.ml               | 70 +++++--------------=0A=
 tools/ocaml/xenstored/symbol.mli              | 22 ++----=0A=
 tools/ocaml/xenstored/trie.ml                 | 61 +++++++---------=0A=
 tools/ocaml/xenstored/trie.mli                | 26 +++----=0A=
 tools/ocaml/xenstored/xenstored.ml            | 20 +-----=0A=
 14 files changed, 98 insertions(+), 206 deletions(-)=0A=
 rename tools/ocaml/xenstored/{select.ml =3D> poll.ml} (85%)=0A=
 rename tools/ocaml/xenstored/{select.mli =3D> poll.mli} (58%)=0A=
=0A=
--=0A=
2.25.1=0A=
=0A=

