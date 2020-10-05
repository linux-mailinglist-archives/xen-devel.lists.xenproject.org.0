Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B42128323B
	for <lists+xen-devel@lfdr.de>; Mon,  5 Oct 2020 10:38:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2881.8225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPM0q-0001NF-8h; Mon, 05 Oct 2020 08:38:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2881.8225; Mon, 05 Oct 2020 08:38:28 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPM0q-0001Mu-5P; Mon, 05 Oct 2020 08:38:28 +0000
Received: by outflank-mailman (input) for mailman id 2881;
 Mon, 05 Oct 2020 08:38:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xuOL=DM=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1kPM0p-0001Ml-CH
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 08:38:27 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7fab6de1-2a61-4374-a893-8e47797d6455;
 Mon, 05 Oct 2020 08:38:25 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xuOL=DM=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
	id 1kPM0p-0001Ml-CH
	for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 08:38:27 +0000
X-Inumbo-ID: 7fab6de1-2a61-4374-a893-8e47797d6455
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 7fab6de1-2a61-4374-a893-8e47797d6455;
	Mon, 05 Oct 2020 08:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601887106;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=tBvVHmIF2GIM2x9PCRwp2kyvhDrTNgt8GBG7kUlBSrk=;
  b=aU12GS/4cjyLIyoapzevpoZZMkebMkpXD4go17jU3ZjmRxXET5F8qvad
   FihXMqmm3GJH3A4iYwQvmLgP7NEqS4HCneYjZ8u2ODMU5B6CfcmpeoOar
   x9/h3yOQCkB6q8IZAgDChtPrSUWeV3Hy8f48Z0N9/exroF7rZ0ZO1xHJB
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: BWjk+RJ3oYM8yWG1+I6x0Jm01RO8rTtQ0dN0gPolIovZM9EwhA5loLzvf25aEjljqRSt00WHlp
 4YhntDWS+yKg6qsp2UVJeWGOi5gibT8FeEapLe2cDLjxU3WXW5vgMgkL9QOFBiwwpDesZ/uAMf
 vpNXDfG7yfEmXqzQV+bFBVACHUE2YtUIYEQIJoMRKlrQ5lO021/mC7I4x25V9nxDRb1JE0of7s
 nDzBKxKl51x8PDzV96YC5Xju4uSBjYjHNKxnUpqeiQN4ZfpMsUAlBb20gNyP7ol9FOkBrxXfB4
 13g=
X-SBRS: None
X-MesageID: 28604362
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,338,1596513600"; 
   d="scan'208";a="28604362"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jae9MzZU52FU9xvFPQW8uAo18BfTRWK65VI3z+5ZMRQdopxlLZ2tGN/UO2JzoI5zTroDSYqJIruRt/mpf6x2YDgqo8Z3mg37ZMu1egm5w6XO+f2+lCaOHCAHo//J3A68uBMhCSMXYvRDVXV/AXa4NlPCVthaxMTkmHR32LOeYgRAw17HITFroCAR7B8tz92CjCad4HNBD4oPNO7R7tnGrToT61SzxisEGQiJLh8By392hhq9I6tgRRfMWKPftSI2KqnKyakvKtvYA4K6+gDNEVsXLWbzdF2M0M3+Vd1B3eVJs6uJy0rnff8JdeYIMBJpANwFfKEuksw94jo/MAtYhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DwSU15XZe15isGxfsYaPjURkiPDmKzVN9Hq6/ps0fgA=;
 b=hLBZTMETG/EdZxWjqStXISeN8RZQ9VZHhfJXvs1a9NIQ3XacE9pK4i6N2eopWb4/Mw0Fo1BZFy+8kDFgYD5uj4WXNZ6XiRTbmvdTfuZW86dtI+WHw4Jm+osqUlTCjhlEXkEzBTACx2QQ9BKqL3qO87htI3vOqkq+joAYP/hJb0+dIts0eHwVa9/MWuz52RFGfdba0FijZEi2y6lJAezKxgZcVB5wFyJQrBCF5Wdh9fA4oOs07MnwY3CIKYnBHl7RwI0Vafo4YzRySDvb+3lPmOP7p/q7jtlUw/wIdkDpCQ0CKtltoV7FqrY5+NPcrNeO3VqiiNZYEs54Fb2xA2vVTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DwSU15XZe15isGxfsYaPjURkiPDmKzVN9Hq6/ps0fgA=;
 b=UmgZtKQYrYtTnqHGeD1V4cxhYlynHOLGX2vrBgJvJKO83oUIR+1clOKMK/7fAzxMtrKCQGoEsgrU1PcJIAqbPmh4QUOJJEZhkdXGfM+UtovN8Tz8C1lJ/P/x/YhTwi2Kp3RFBT6kxglRHNyq8D9CaN9kfBByHcgou7mBLvQXPAs=
From: Christian Lindig <christian.lindig@citrix.com>
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap
	<George.Dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Samuel Thibault
	<samuel.thibault@ens-lyon.org>, David Scott <dave@recoil.org>
Subject: Re: [PATCH 0/3] tools: avoid creating symbolic links during make
Thread-Topic: [PATCH 0/3] tools: avoid creating symbolic links during make
Thread-Index: AQHWmMdzMWgM7QI3dEeJGaSzpEsf9qmItC1q
Date: Mon, 5 Oct 2020 08:38:21 +0000
Message-ID: <DS7PR03MB5655DE94A4B952B2FAD9C81EF60C0@DS7PR03MB5655.namprd03.prod.outlook.com>
References: <20201002142214.3438-1-jgross@suse.com>
In-Reply-To: <20201002142214.3438-1-jgross@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4c7b82d3-f6d9-4086-36e9-08d8690a0469
x-ms-traffictypediagnostic: DM5PR03MB3355:
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR03MB33559AC5A84F6F762886FAF0F60C0@DM5PR03MB3355.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vEmQgMQ6rZKHkmJmiMiwSBEdom6T9O4b0qeLZpTji7vR9A1WTERPu9zw9+iQEFjw5Yc08rkpoQlD8k9+oQHELnzZVTdQqFuCW1+stnF0gCZqE3RQ8P/AygbHOpEkaA3M6bkojz4LFipR/lE8Ix//zSBMWV7YjAB2tm3akNojjczr0vx+grGDih4bGNWluFPCosD1AE5mF3CIM8RfibSp8q9m14Xa08Y3VGzQqM/dsPdwvV1DAn8vyZByHDmv3/JLEUuylLaMzoeiUpW6w9rKsh8ws8lpwZI8VhsiJYlamBQfOHkkqke/hYldxZ5sHHxI4tPE6XZ54pfahhyU9tkfaQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5655.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(396003)(39850400004)(136003)(55016002)(52536014)(66476007)(9686003)(8936002)(66946007)(8676002)(316002)(4326008)(2906002)(5660300002)(478600001)(83380400001)(110136005)(54906003)(33656002)(6506007)(53546011)(76116006)(91956017)(26005)(7696005)(186003)(55236004)(44832011)(64756008)(66556008)(71200400001)(86362001)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: zmhOzbMg3hq7JLn9p/zL5V6KwCGnQlxuL14Hf+ApmO0Ef6qxuaZhMUSia3HPsvF4qPLLAxyodz+8/lBdUewE0BtJxjHymNWqr7pBtsYVkmHcU6QwLjMrqQkJToh8+qDHeKSDr/bQ5zBGj1/GyN/Z3UO2G29pkehpI5VGwN0XsWWG2r0Rh1XxT4HCaXIdFdG4HkNYJ1pFsxxeeyidgWQQBPtZ6U8C5xuPNXpB2juv0gLeLqMCDD8RfG5IokJDKR7wV66fdnO71p9k85LJeOM1wO9ihND3WPxJ95407w0VAlyFkqWSlRWTXPE0pUYUc4xOoiAG6G8jFYRSgQPXGWvSpnETOSPAo1tzXKBbJqRlZr6BZV0k9iD01Omj99iKpxlrr5ZtxS0feveSGlLs5/ImGAnzobyPKDzIZaZXUXgIEZX2+vfcZTAmJQxNye4KBG5CEqlRpaLnke1PZ9+mYVLw5Kzu86U6Rm5MykX4lTtj/ftZXjDawFg2hZWvHdslwzIZgp7p5t+JUa4xs8xBb66HiXNxOjE1Y0yQ+xAI565focFEUxi0t9L6tw+z1XYxT7FIORjSVfHesN3xXAFqFnAyCIBKK56X/V2Bw6dXhoNqv9BYFH/C/UctEo540TNB/ADZFQeEbsBcvLBJMUBGptI2hQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5655.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c7b82d3-f6d9-4086-36e9-08d8690a0469
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2020 08:38:21.5886
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DEgkGDoJ7BzUHwv7vQl9Ppq1drS6CO+jSYgj/0J1akAMkmUHRUWnn9B+3HG2FccPGWTpbx6+raQMgrN51W9TkAtJvYYqDmo0V2GfHzxwQn8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3355
X-OriginatorOrg: citrix.com

--
Acked-by: Christian Lindig <christian.lindig@citrix.com>

________________________________________
From: Juergen Gross <jgross@suse.com>
Sent: 02 October 2020 15:22
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross; Andrew Cooper; George Dunlap; Ian Jackson; Jan Beulich; =
Julien Grall; Stefano Stabellini; Wei Liu; Samuel Thibault; Christian Lindi=
g; David Scott
Subject: [PATCH 0/3] tools: avoid creating symbolic links during make

The rework of the Xen library build introduced creating some additional
symbolic links during the build process.

This series is undoing that by moving all official Xen library headers
to tools/include and by using include paths and the vpath directive
when access to some private headers of another directory is needed.

Juergen Gross (3):
  tools/libs: move official headers to common directory
  tools/libs/guest: don't use symbolic links for xenctrl headers
  tools/libs/store: don't use symbolic links for external files

 .gitignore                                    |  5 ++--
 stubdom/mini-os.mk                            |  2 +-
 tools/Rules.mk                                |  5 ++--
 tools/{libs/vchan =3D> }/include/libxenvchan.h  |  0
 tools/{libs/light =3D> }/include/libxl.h        |  0
 tools/{libs/light =3D> }/include/libxl_event.h  |  0
 tools/{libs/light =3D> }/include/libxl_json.h   |  0
 tools/{libs/light =3D> }/include/libxl_utils.h  |  0
 tools/{libs/light =3D> }/include/libxl_uuid.h   |  0
 tools/{libs/util =3D> }/include/libxlutil.h     |  0
 tools/{libs/call =3D> }/include/xencall.h       |  0
 tools/{libs/ctrl =3D> }/include/xenctrl.h       |  0
 .../{libs/ctrl =3D> }/include/xenctrl_compat.h  |  0
 .../devicemodel =3D> }/include/xendevicemodel.h |  0
 tools/{libs/evtchn =3D> }/include/xenevtchn.h   |  0
 .../include/xenforeignmemory.h                |  0
 tools/{libs/gnttab =3D> }/include/xengnttab.h   |  0
 tools/{libs/guest =3D> }/include/xenguest.h     |  0
 tools/{libs/hypfs =3D> }/include/xenhypfs.h     |  0
 tools/{libs/stat =3D> }/include/xenstat.h       |  0
 .../compat =3D> include/xenstore-compat}/xs.h   |  0
 .../xenstore-compat}/xs_lib.h                 |  0
 tools/{libs/store =3D> }/include/xenstore.h     |  0
 tools/{xenstore =3D> include}/xenstore_lib.h    |  0
 .../{libs/toolcore =3D> }/include/xentoolcore.h |  0
 .../include/xentoolcore_internal.h            |  0
 tools/{libs/toollog =3D> }/include/xentoollog.h |  0
 tools/libs/call/Makefile                      |  3 ---
 tools/libs/ctrl/Makefile                      |  3 ---
 tools/libs/devicemodel/Makefile               |  3 ---
 tools/libs/evtchn/Makefile                    |  2 --
 tools/libs/foreignmemory/Makefile             |  3 ---
 tools/libs/gnttab/Makefile                    |  3 ---
 tools/libs/guest/Makefile                     | 12 ++-------
 tools/libs/hypfs/Makefile                     |  3 ---
 tools/libs/libs.mk                            | 10 +++----
 tools/libs/light/Makefile                     | 27 +++++++++----------
 tools/libs/stat/Makefile                      |  2 --
 tools/libs/store/Makefile                     | 15 +++--------
 tools/libs/toolcore/Makefile                  |  9 +++----
 tools/libs/toollog/Makefile                   |  2 --
 tools/libs/util/Makefile                      |  3 ---
 tools/libs/vchan/Makefile                     |  3 ---
 tools/ocaml/libs/xentoollog/Makefile          |  2 +-
 tools/ocaml/libs/xentoollog/genlevels.py      |  2 +-
 45 files changed, 32 insertions(+), 87 deletions(-)
 rename tools/{libs/vchan =3D> }/include/libxenvchan.h (100%)
 rename tools/{libs/light =3D> }/include/libxl.h (100%)
 rename tools/{libs/light =3D> }/include/libxl_event.h (100%)
 rename tools/{libs/light =3D> }/include/libxl_json.h (100%)
 rename tools/{libs/light =3D> }/include/libxl_utils.h (100%)
 rename tools/{libs/light =3D> }/include/libxl_uuid.h (100%)
 rename tools/{libs/util =3D> }/include/libxlutil.h (100%)
 rename tools/{libs/call =3D> }/include/xencall.h (100%)
 rename tools/{libs/ctrl =3D> }/include/xenctrl.h (100%)
 rename tools/{libs/ctrl =3D> }/include/xenctrl_compat.h (100%)
 rename tools/{libs/devicemodel =3D> }/include/xendevicemodel.h (100%)
 rename tools/{libs/evtchn =3D> }/include/xenevtchn.h (100%)
 rename tools/{libs/foreignmemory =3D> }/include/xenforeignmemory.h (100%)
 rename tools/{libs/gnttab =3D> }/include/xengnttab.h (100%)
 rename tools/{libs/guest =3D> }/include/xenguest.h (100%)
 rename tools/{libs/hypfs =3D> }/include/xenhypfs.h (100%)
 rename tools/{libs/stat =3D> }/include/xenstat.h (100%)
 rename tools/{libs/store/include/compat =3D> include/xenstore-compat}/xs.h=
 (100%)
 rename tools/{libs/store/include/compat =3D> include/xenstore-compat}/xs_l=
ib.h (100%)
 rename tools/{libs/store =3D> }/include/xenstore.h (100%)
 rename tools/{xenstore =3D> include}/xenstore_lib.h (100%)
 rename tools/{libs/toolcore =3D> }/include/xentoolcore.h (100%)
 rename tools/{libs/toolcore =3D> }/include/xentoolcore_internal.h (100%)
 rename tools/{libs/toollog =3D> }/include/xentoollog.h (100%)

--
2.26.2


