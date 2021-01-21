Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 528552FE87F
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 12:15:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72010.129401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Xw5-0003fB-Kw; Thu, 21 Jan 2021 11:15:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72010.129401; Thu, 21 Jan 2021 11:15:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Xw5-0003el-Hd; Thu, 21 Jan 2021 11:15:33 +0000
Received: by outflank-mailman (input) for mailman id 72010;
 Thu, 21 Jan 2021 11:15:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lDH0=GY=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1l2Xw4-0003ef-3G
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 11:15:32 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 50802ec8-ef50-4b7a-86f3-a537d2d171b3;
 Thu, 21 Jan 2021 11:15:30 +0000 (UTC)
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
X-Inumbo-ID: 50802ec8-ef50-4b7a-86f3-a537d2d171b3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611227730;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Dhd/36tQNnP5tY/NH2hEuJiNMNjQjyAoU7Ul4uWia2M=;
  b=OxiB8DeobM1SLkel3JIHPyJgncl4pZshee0CcRKF0DNmaledal3HZ741
   tyruytnzwsVjCcBAKO5Koj+x8fbNwOCei47SjccWI/kpndp2ePUlg2+Hn
   +auKA6SoGiLbtnXiytT2rFXge5NW6uMmEPptBnh+z/84fU5zAk1nuOmKM
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: VOR7wacn6m986+btaG5/k9eLpOKgxAAMNEWJWwSvfMZMj1oetY62gkAf00jf27I2mGZ7NBoBn4
 9NAofmqaWU2yzinQdfy4/xvQM664FSc5m/o3ofhDSOd6okzdmC9jtGWQHt1fUsRDox2Tzq48sy
 KBA1T3ilq8bVoLxA/nZIB3ydTKOJ7MQZdlz9bhKqMCmcc8Cx/ZQDVX1aiu8yFSML8q3o91d8yu
 bO6Ymf8CrPoIGyIRUHz+S3wCGLR8HqTnrhzXf/iRJQ2QhfHIh0j1SI2dftXAMk5M7gQYXAq/y+
 ptA=
X-SBRS: 5.2
X-MesageID: 36847473
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,363,1602561600"; 
   d="scan'208";a="36847473"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iwsfF6MThnce9VQtGcVFkj75uwnF+DaK011fIbSA18KCPAsSvS2HFqaJ7w7oO7B1mA641noWvJUsR0eHZKekOEcAkgEm4opTk24Pr+GzXBOcamgd/0mJdYot/bck3jBoyZWiX8jDMCy8xqug00weTb/fs3K9Y9TallhxNELsX/tUEE2xhZjvDvK1IRfjiBX4XnJNWvfFoWCR86CJww122E5uSXd4Vr4xDrHOAEGH/ncGfq5rsflSn+XT3RPnaGqJ8ZP0o5sPOLKVGk3au9hom4XFZKix0kurAs874/CiAvvXGpi/e6ijyODrP2HnFTP2Cqc8+E1pwX/nKbG0/zoJ+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Qap24hRtVLwU/2aMRelJiJFTt/M3yixOdwiWj6whmE=;
 b=KzgB9cp7f5ndnVA7VR3JLJiN7L7mQdqo3HxaX5Ff8sK/w1zH/IwFdVieY6NjZ0JpPQcqKvqmi29TU1SuRW0uxS+AdwkOruzRbULs81gxGfMeJiWNMiGeBYj7ziYQ0FOVVtUIKLMt0Fvd4dbkqAis8gJcXJsrhS06ibuF9DiU9d6Y9wcOq/lT1Qyhxc5zLFH0vS4VXhAHHf/tCBqDtjnjoPit/doCd5uxlsnbZT2P4yFG2/9PYMm5tmM3HASWQRhTI/kAFkgOXJ6Qx7Aml/BS6vp3FSGXFGmquZwAbZmwp924zkGx9DhuXnKPBLgtWqQ53lcbUk7XSeUrh8FJOxiOOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Qap24hRtVLwU/2aMRelJiJFTt/M3yixOdwiWj6whmE=;
 b=xhEtSQCTHUfp6BUVBwyzAPTkrv/upDOacNe8mHdOdcUPyWajX2aFsx9/pH8OX6KZIrrPRWLEE8z3Ms+/PRMnRZXjdhcWcXEIFfsnU2o/yntEvYFmHpDDcb68JevorNMS+rhv+uzQpvxGB8w7QSQ78n78ZPAoWa54p52v67wVnB4=
From: Christian Lindig <christian.lindig@citrix.com>
To: Edwin Torok <edvin.torok@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: David Scott <dave@recoil.org>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v4 0/4] tools/ocaml/xenstored: optimizations
Thread-Topic: [PATCH v4 0/4] tools/ocaml/xenstored: optimizations
Thread-Index: AQHW7+a3y41OidoK2EOhatnJNoAWvQ==
Date: Thu, 21 Jan 2021 11:15:25 +0000
Message-ID: <MWHPR03MB2445387F5259AAACB727B99CF6A19@MWHPR03MB2445.namprd03.prod.outlook.com>
References: <cover.1610748224.git.edvin.torok@citrix.com>,<cover.1610748224.git.edvin.torok@citrix.com>
In-Reply-To: <cover.1610748224.git.edvin.torok@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e8d93731-ed17-4431-9ad1-08d8bdfdd9f2
x-ms-traffictypediagnostic: CO2PR03MB2135:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO2PR03MB21358FF1E5DFA3575F39D19DF6A19@CO2PR03MB2135.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SKiusdPplopnMzAgg7n32pByi6uz6QJL+iOQCUs5J3HQJFMLwfHvnR2z1G6RQHzDQUVJSgjh1SGv2kip7qXlglJfx9EnXbvwvRCF2I+X/XBjMElx/4BW2sVlB5HGixLjhdcOTQHeJ2BvWGFbiLIcHhQHlAJf0AOidvq48MuP8S6WydbN19dDpRJGvvzM3/qK6yO6slCtRMLM/2dF8T171/nlhfZFIfWIkinEXyW4OX2JwIkael6kAhVRsJPsvdHK6zQJb8QicAZ0g9mmbE4ikIeFzr14Ks7wq9Xe1cKoyYHLJwb6kT2FArgVucOqXyoJv3pXIB7qChGX83r20UrXS1LkpgBZ2IZ8ecytwC0ZmGwibsKSwSEKvys9oTRB8Aqu3hwIEClT3x3oFu1LXHZmJfecF79tDlm2jaw9NfGcAlAJ+/Y43d0AqmAXfpCVym66dgamYwN4hO55v0q/pnLbXA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR03MB2445.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(39860400002)(396003)(376002)(366004)(83380400001)(66946007)(44832011)(8676002)(64756008)(4326008)(52536014)(6506007)(66574015)(53546011)(26005)(76116006)(66476007)(8936002)(186003)(91956017)(5660300002)(86362001)(7696005)(33656002)(478600001)(66556008)(966005)(54906003)(2906002)(71200400001)(316002)(55016002)(110136005)(66446008)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?PmdZrmmHYDQreaMhI0GzLqVoCSOBAyvSKjRGMtybWiGuRoQ2w5UGx2izdC?=
 =?iso-8859-1?Q?5xr65z2z/Zn7cq4oCc5rCkG5pHWzchB1rl0GtXgKGrbb1O5pEkPWJ0aBRd?=
 =?iso-8859-1?Q?ufd8GddAxnXGa2q3wdUlc4my7wrLRGZNVuhggrlBm/VFbwIaXe54PuRDAG?=
 =?iso-8859-1?Q?qcj8HZLAr2ELZivcoEv7D0cUuYtt0en9WgsTjRS7/2kw4B2+UyVYsIOL3s?=
 =?iso-8859-1?Q?FT/WNaeg6OmysK6q32N6HhiTE+LpNVVYnoCqk3vRa1DS4NJgCTGmf5VZYb?=
 =?iso-8859-1?Q?6jgvN4gR3WPniE9Q/u8NY4vCKyhjcLb+Z+JbuGldGTZkB3j+NDMUXZJvjc?=
 =?iso-8859-1?Q?58IRd+L0AjCVWbO0xo36AHj6qQG7a/k6xWuinfUKGJt0Xx1QIo3XwGIcH7?=
 =?iso-8859-1?Q?B0prg9F7xbczeFuT86g32f9wXeWYoHR2XG31gL6zD6O+AkDSq2MAAmFQU9?=
 =?iso-8859-1?Q?ZEkaSXye2ZWk5qIgSF5N3KtlMSzFJ7xGPO14oWSAbr11Kbd1fBS92UBnVk?=
 =?iso-8859-1?Q?0AuR6OUgcxPx+GaMLfs7niQ6Cz9GM9+TkS3VnsJ6Jk1vEyJrdktQSWazUv?=
 =?iso-8859-1?Q?w7Lj27g9z7TgDmNK2yNV1+Cvu4rIyAHjpXt8pS5upI2FJ1og9YamVNxlXD?=
 =?iso-8859-1?Q?sMecOZKW/1Os5PuBO5KTuZkhVp5JcG+GzfuMj6YHtY4Hz60ERWkw5XK9fL?=
 =?iso-8859-1?Q?ZkPSQawscRikWQjEVRpHSLZOsK3uTpvYI+cRw9ypIyc9VwAYwFOkwotlb1?=
 =?iso-8859-1?Q?gdjfJOb5Fk61HmN3U/mObHtWlx6YexUHszJzhh5qffJ3dpfTtw6l8Se9zR?=
 =?iso-8859-1?Q?bWDtKjbLiDQpW7zQsB9+RQO087rosyiComNF+Gj2b1qhPjIkSApICeQzuy?=
 =?iso-8859-1?Q?Xjt/XbJQGqx3oy6U0+PndkrvB4xd42azcMUbg92Hpm7s/6J3Jie1HDtaKD?=
 =?iso-8859-1?Q?5Oj4Ywc3ukBrLhPCO9r1xO5jU7DKx7d8vV+6SBaEiMa2S85N39H8r6tAXU?=
 =?iso-8859-1?Q?45C+8YfC3TAedQ+0k=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR03MB2445.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8d93731-ed17-4431-9ad1-08d8bdfdd9f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2021 11:15:25.3006
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IAAJOKWQCt+k6fdjLOK84nhNnvVi2AQHe4llPLD2PpWrnXn+7z6S+JxIT1nxNjAc/3568QdBUWRB8LFiPHBMINWrSFBeIQQXdpaYpFOeRPA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR03MB2135
X-OriginatorOrg: citrix.com

Acked-by: Christian Lindig <christian.lindig@citrix.com>

I am providing feedback on https://github.com/edwintorok/xen/pull/1.

In general: this is a large patch and therefore difficult to review for cor=
rectness. However:

* It comes with a lot of testing and was fuzz-tested
* It improves building OCaml xenstore
* It improves functional and performance problems

I welcome this work and think it ends a period of stagnation of this code b=
ase. This applies not just to this patch but the other patches sent out by =
Edwin in the context of this.


________________________________________
From: Edwin T=F6r=F6k <edvin.torok@citrix.com>
Sent: 15 January 2021 22:28
To: xen-devel@lists.xenproject.org
Cc: Edwin Torok; Christian Lindig; David Scott; Ian Jackson; Wei Liu
Subject: [PATCH v4 0/4] tools/ocaml/xenstored: optimizations

Various speed optimizations that have already been posted,
but committing them was delayed to avoid conflicts with XSAs.
The XSAs are out, so these are ready to go now.

The switch to Maps may expose bugs in certain xenstored clients,
which previously relied on iteration order of the DIRECTORY response.

In our testing we found one such case, which turned out to be a bug
in a testsuite (it always dropped the 1st xenstore key).

For convenience here is a tree with all patch series applied:
https://github.com/edwintorok/xen/pull/1

Edwin T=F6r=F6k (4):
  tools/ocaml/xenstored: replace hand rolled GC with weak GC references
  tools/ocaml/xenstored: backport find_opt/update from 4.06
  tools/ocaml/xenstored: use more efficient node trees
  tools/ocaml/xenstored: use more efficient tries

 tools/ocaml/xenstored/connection.ml  |  3 --
 tools/ocaml/xenstored/connections.ml |  2 +-
 tools/ocaml/xenstored/history.ml     | 14 ------
 tools/ocaml/xenstored/stdext.ml      | 19 ++++++++
 tools/ocaml/xenstored/store.ml       | 51 +++++++++-----------
 tools/ocaml/xenstored/symbol.ml      | 70 +++++++---------------------
 tools/ocaml/xenstored/symbol.mli     | 22 +++------
 tools/ocaml/xenstored/trie.ml        | 61 +++++++++++-------------
 tools/ocaml/xenstored/trie.mli       | 26 +++++------
 tools/ocaml/xenstored/xenstored.ml   | 16 +------
 10 files changed, 109 insertions(+), 175 deletions(-)

--
2.29.2


