Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1435FED2E
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 13:26:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422815.669106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojIpI-0003Wq-EG; Fri, 14 Oct 2022 11:26:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422815.669106; Fri, 14 Oct 2022 11:26:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojIpI-0003TX-Ac; Fri, 14 Oct 2022 11:26:04 +0000
Received: by outflank-mailman (input) for mailman id 422815;
 Fri, 14 Oct 2022 11:26:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mVin=2P=citrix.com=prvs=2797e9ea4=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1ojIpG-0003TQ-VK
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 11:26:02 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id faa07eec-4bb2-11ed-91b4-6bf2151ebd3b;
 Fri, 14 Oct 2022 13:26:01 +0200 (CEST)
Received: from mail-mw2nam12lp2044.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Oct 2022 07:25:59 -0400
Received: from PH0PR03MB5669.namprd03.prod.outlook.com (2603:10b6:510:33::16)
 by PH0PR03MB5864.namprd03.prod.outlook.com (2603:10b6:510:38::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Fri, 14 Oct
 2022 11:25:57 +0000
Received: from PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::7131:3804:744b:d7cc]) by PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::7131:3804:744b:d7cc%6]) with mapi id 15.20.5723.029; Fri, 14 Oct 2022
 11:25:56 +0000
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
X-Inumbo-ID: faa07eec-4bb2-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665746761;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=v9/uOs5FfQ+wACWRofrVrFNQyLNEmwuWfPW4jCmCjKI=;
  b=SknF2SBieOArB+YluF6tSKtIZRh50njNDKRZ5/nGsaWEC/6KG//+Oi1l
   R8+2kNyaGgCRex/myZe58w7doBzxI+NhOTHyTGAoQSkCT/6r6FFAOqO2x
   ZqpursvlPx3hFGfdcGuQItjtQ0CHn9Xn8HhKDxX0/hzBaAtvR1I7kTd9U
   c=;
X-IronPort-RemoteIP: 104.47.66.44
X-IronPort-MID: 82722802
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:D3DOKK1z0BUEcQsoOfbD5XFwkn2cJEfYwER7XKvMYbSIYQITYwd3j
 TtIBzjCf73ffDO2KOnCW/2x8hkGuJaAn4JkTQZuqS4wEi1B8sGcVIWVc0uvMn3IJ8bJFks55
 ckXOoWRIppvRyPW+Bn1brS88CEn2KvUH+ukYAKo1lidYCc9IMt2oU4zy4bV+7JVvOVVIz9hm
 Pujr5WAZAf8hDV+OTpFsv3T8E5itqr/tm5G7wY0PqgU4g6CmyEZAqxEKPDqJRMUYGX28s2SH
 L+fke7jrgs12z93V7tJR56iKhVirob6ZFTI0DwOM0SbqkAqjjQo1aomP+YrZ05SijGY9/h80
 9wIvpGrIesTFvSkdN81Dl8JTkmSAYUcoOWdeCDm7ZTJp6H7WyCEL8tGXRle0bIwoo6bMUkWn
 dQEJTYEaAy0hu7e6NpXncE126zPhOGyVG8ukikIIQPxVJ7KcriaK0n+3vdK3S9Yuyx7Na22i
 /z1y9ZYRE+ojxVnYj/7AX+l9QuiriGXnzZw8Dp5qUerioR6IcMYPLXFabLoltK2qcp9wEOTo
 0+f5G7AOCpBM8OEkxrG0Hedv7qa9c/7cNp6+LyQ0NdP2QfW41NJTRocWB28vOWzjVO4V5RHM
 UsI9yEyrK80sku2Ut36WB7+q3mB1vIec4MIT6tmt0fTlOyIv251BUBdJtJFQPMrs9U5SHoGy
 1mNlsvBDj1zqryFD3ma8994qBviY3dPdz9aP0foSyMqyP38p6AajiufEOhIP6K/i9HPBWzvl
 mXiQC8Wwu97YdQw/7W2+xXLjiyhorDNTxUp/UPHU2S99AR7aYW5IYuy5jDzzftGNpffcVCHs
 1ANgc3Y5+cLZbmXkzeHWuIKH7eB6POMMTmaillqd7E+8xy99njleppfiAySP29sO8cAPDr2O
 knavFoL4IcJZCf2K6hqf4i2FsImi7D6EsjoXezVadwIZYVtcAiA/2dlYkv4M33RrXXAWJoXY
 f+zGftAx15AYUi75FJan9sg7II=
IronPort-HdrOrdr: A9a23:gzjc6KGbxIpNqpjxpLqFXpHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdrZJkh8erwW5VoMkmsj6KdgLNhd4tKOTOLhILGFvAE0WKP+Vzd8mjFh5ZgPM
 RbAuVD4b/LfD5HZK/BiWHWferIguP3iZxA7t2urUuFODsaD52ImD0JbzpzfHcXeCB2Qb4CUL
 aM7MtOoDStPV4NaN6gO3UDV+/f4/XWiZPPe3c9dlEawTjLqQntxK/xEhCe0BtbeShI260e/W
 /MlBG8zrm/ssu81gTX2wbontprcZrau5p+7f63+4sowwbX+0SVjUNaKvi/VQUO0aGSAZAR4Z
 3xSlkbToNOAjjqDxyISFPWqnXdOXAVmjPfIBaj8AXeiN28SzQgB8Vbg4VFNhPf9ko7pdl5lL
 lGxmSDqvNsfFr9dLSU3am2a/hGrDvCnZMZq59ks1VPFY8FLLNBp40W+01YVJ8GASLh8YgiVO
 1jFtvV6vpaeU6TKymxhBgl/PW8GnAoWhuWSEkLvcKYlzBQgXBi1kMdgMgShG0J+p4xQ4RNo+
 7ELqNrnrdTSdJ+V9M0OM4RBc+sTmDdSxPFN2yfZVzhCaEcInrI74X65b0kjdvaDKDgDKFC7a
 gpfGkoxlLaIXieePFm9Kc7gizlUSG6QSnnzN1Y6txwpqD8LYCbQxG+dA==
X-IronPort-AV: E=Sophos;i="5.95,184,1661832000"; 
   d="asc'?scan'208";a="82722802"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Soajgz6PGK4cCF5GQ9pZvEIoC2ojycIbNt5yBVSv9pvyi4o4p+nrbt8jUeSNlLEO9qE8TAQox4qlONVoCbQ3Du6Yl1dqrzlpzL9FwEMN/tdlH7ya0NQWxfOLyYLWKbo/lY9j5LKXsh9SKD4OZq1IUzQtP1EzQH7dAOWP1Ano7PGx5TzrAaAah6dvXPBt5GdIdBq/whwr/PE8Wp9O2kjAmDAWYlKz+HNryRWNDiSW+Q0cL8dFaAVEVYtWBJET40CdGzVxJfADJd452dfBxYrWFuTq+KREK8TWgpcPKRFSL6eK4Tw81mZbuSIgf2/R9XeoczChZIznDJa5CUyYbrBNtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xREnVDX/284KzvnVRT5d00Z3GCtm2zmaxAyQa1BmCSA=;
 b=BMO+9fl66hTXsaU6tuKWqDYu9cQiGGfmELQkFKM3kDJLPKL2a3EonIjqn9HOrZGpPwXI4rYbL0OzTblGW99eirskEaQJ7GIdevmhOtbMdDzPoG3MUF0cyw1zCMiEiX2aXulGzhY5PEK297gTEUaTSq8vr20jQj+lDpAm5y3Svd7d0NwvGjW7hqhTKKxjd9GPAJJxN/KIQKZiuSXu77433thFcB6yNYCDxnr3VT5qy9XGtVPwvyzEGHf8S8RdUdlDvH4Mnmu/fsm1D2rwlIhbvx25l4y/anPtnZKSXvnbLf3PIN/JLa53J4OWrYhPOomOWcXV6b011pfpESp1YlKeaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xREnVDX/284KzvnVRT5d00Z3GCtm2zmaxAyQa1BmCSA=;
 b=D2jeEWeK8Ux2R66ZwkGB9uZguJMDzYan7ewbaEJXoHdrwt+AcyKZMqjuXxY7Qv0NmhzRy8Wfvyzg+Kkp3u+1NXaFqaaiTk65Rc4a+zuIX6RIwbIsP2A58bg0VAwjTbj9t8V/BuRQOQCziaiXcsg3awwMKN51cRIGmO1VfcZIHtk=
From: George Dunlap <George.Dunlap@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Henry Wang
	<Henry.Wang@arm.com>, Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [XEN PATCH for-4.17 v5 16/17] tools/golang/xenlight: Rework
 gengotypes.py and generation of *.gen.go
Thread-Topic: [XEN PATCH for-4.17 v5 16/17] tools/golang/xenlight: Rework
 gengotypes.py and generation of *.gen.go
Thread-Index: AQHY3wTwBw4XcUEnKkOCwbXR47HHg64NwWoA
Date: Fri, 14 Oct 2022 11:25:56 +0000
Message-ID: <6507371D-CE8B-4DD5-AFF3-9D99069BAD55@citrix.com>
References: <20221013130513.52440-1-anthony.perard@citrix.com>
 <20221013130513.52440-17-anthony.perard@citrix.com>
In-Reply-To: <20221013130513.52440-17-anthony.perard@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB5669:EE_|PH0PR03MB5864:EE_
x-ms-office365-filtering-correlation-id: bd45f0de-d4c8-4f75-d947-08daadd6dd08
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 K+KoOPkw6K2y41GpKaeeC45VVVp9QYq+Fri3Bg4/39jg5BF6SoPnp3oxsVNxa9zPdzh0RYDy+jTDuEEG5nh5QEWCBHQQKeKGxDFHagc7oIji/Fx2gmdiCdx+PsyrzsYcWj/J3Ne43arVZetXpzruauyfUZ1XtDyYAd9g8xtX38xLgcfx4HnpU4SdrrIZoA8twuIW54EwVpwx7OTi4p3QDixS2cmJNVO2pF7NmhW35HCZRdDcFbKHcWNprSbkv4nZoSAz7TGjxsSkMNT68HIJdD84XMR9mBaLnr3g5zl6MPeNWOROZetFl9mz86aXWZAPLuL1kLyIalwPfMrVhdFdMBNaV38DGT8qT8nToKJV+zwiFsENH8p1g7Eqm29u8MGe4uZwzIPoIkHB1Otq9MMOaXSyPpgJhazNvDtXE6A1JLo69RNHSn8yEZEVrPC5Ib7QysAC43+mu2gf+yBDxmq6K1qcX5t/1OFOzzNzvyyXu053jHcBmi4CjmxHyFlEjO17aPivgd6hd8Go2HKN0riVpuj8kUs11untge3qDigRLa9+2B+Z48z7DxaEUjC9SHDV4sA8Y+fjdzOajz1B7xYBWb3WCO6CqPzK9bsWGWfbFAGaiX9yf5dL/Fs7tXuGl5cqCXX8pZk7DTSkdWMqlwrXUfEzlpUzCbATGf2O5pn5PbkK2Kt+cuCStSWGf8PR3x3TpXR9mhU3LqBmi6YWVtMQ+xSQKJARlzjhWMTnrMiaZ1HWIpdSU8kwRIG1K19mLrFxKfsXUrhLmF05ySZ66chXPnhZpKr4qmjb7wC3aPA6sO+oguoXjHBXCb9Vd4hE3gPH
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(396003)(376002)(39860400002)(366004)(451199015)(2616005)(186003)(6506007)(122000001)(86362001)(4744005)(37006003)(26005)(99936003)(38100700002)(2906002)(82960400001)(5660300002)(8936002)(38070700005)(4326008)(6862004)(66946007)(41300700001)(8676002)(6512007)(53546011)(316002)(54906003)(91956017)(76116006)(66556008)(6636002)(64756008)(478600001)(66446008)(66476007)(71200400001)(6486002)(36756003)(33656002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?rx6C+P6nf5m1HrslhHyyxkSCTEr6LI8aoaj7GaSxmBv1ImucdRG9msHe1RmB?=
 =?us-ascii?Q?rvLdYcxOPMaFa7vJWurH2GArFCQqh8sGIgfQRoafHz+m9T6FDQxMfxEHcX3J?=
 =?us-ascii?Q?UEhfPTT4khkFKZBrHmRIicqXoFwNKvDj6G8gJBFhuYsXt+GwF7/MYbRx5XOb?=
 =?us-ascii?Q?eQ15rIeXxE0rfimrBaTX/c5gnX6imj408bBxa8EBgcw3S94C5mInYuL1FRzG?=
 =?us-ascii?Q?hEyvYjvjk49vtzF6N93L5Nfhw+eZkx/0JdJ2/UvFUM1Xj+k5dxeGadXq1iob?=
 =?us-ascii?Q?hBqTh0Dfni5elaIyGUlSyCzB28uBI3jNlgquC4Ny+PrtkFja44NEiA4Nc9xt?=
 =?us-ascii?Q?RJlnJ+MRNTFAR6zYg/t5zeHcU8Rp6y38HnbTyu7yHDsqaA9P6nzfSqXwLY5r?=
 =?us-ascii?Q?Viz8/bJGIyEcTcblG1QmUqqbMASH9a5s+ULheUb1QPnVGu65CiwoSdcD5TsT?=
 =?us-ascii?Q?o0tTlAZjvmIOWKP8WPGUZXo3S3ltV3t4rGTngkH0a/CYjNtZfEvvCs2o1MDq?=
 =?us-ascii?Q?tV4ycl7pctq5C7Kk4VZbHccjt6u5kdq3/MYifjTfiVl+y2dCwFEraYpvaJ96?=
 =?us-ascii?Q?EPVqzhM+DLfbRHkJ8PTLPHMlvQY+1TBKdmwyyWa65LtftQled9ipfk4oDMHt?=
 =?us-ascii?Q?LuG05dhhxp+tggkmPQFtIMH9rTvEXkEgPbL2jRtnXHlH46Vsjd41LiXt3uFN?=
 =?us-ascii?Q?+HV4Hc+ghzwBCn4Y0DEBM9weEBjx80SEc2lWpmCvSQ1lE2gRMuwwaaF1jht0?=
 =?us-ascii?Q?CFg7kpoOVw0749rNX5OgaBz8G2gNLv7nRUNA8vg+RVtd+4WLYtOtM+bcpc4/?=
 =?us-ascii?Q?pE7RubtfWrzycX7jYyIYOWPKJw2e2ObnsxSIlUv4zJMx76NmunuZiPbfkmGx?=
 =?us-ascii?Q?YZZoYwtb1wFH9M7Vk7f+Di2dXTFHqv9NC1/HN37SBjnk2zsqgFtSBaPeCPSQ?=
 =?us-ascii?Q?Fzqpo4Ed5awSwPDG52kCa/3QCGYlXjd7K19D+iAX98rZ7UeDp6CxIFp7BpIn?=
 =?us-ascii?Q?0H5I92NniqouHr1jmdXF+4Pmulf3Pj07y8EY5VtnrAv5lAXj8we1W2MWcTZ1?=
 =?us-ascii?Q?k42thegbHStDX1rrn3Erzuu9+C+7BEWpb9AXIXMUbjQHjgjiKFG21O3lX6PO?=
 =?us-ascii?Q?6vlb4xKAq7XKxuN/lygW7noUVXKcAe4t+ovmywtxlX2/toriJSC3XS+vy5rC?=
 =?us-ascii?Q?7SJEOj7sA1JdWFKI1kgWneY5pcF+DNicTK5zuUt/zzs53T+spRPYNn/xf8KW?=
 =?us-ascii?Q?7MhW3fYfZ56QV7ZwRhNvcVJ//vhX/wz49Pi4doIltqCDmoTu6re0PdakDCDl?=
 =?us-ascii?Q?AeWd0qpgkutjp0qX57Coxwa64qRhYVoG1V5THUFiLaxP1BHAPNnRFUfFfwn5?=
 =?us-ascii?Q?/TbOvSJ2zPL5bF7lZNFoLRPK1piwNhb3ToGSMPLDueVPDW8JazRKQGmYLCQd?=
 =?us-ascii?Q?ZAxPpAd8WDw6inVHoEssckvwZbMMEKMjE7yz/frsS3n+8/vVTzrSB7RFBVmI?=
 =?us-ascii?Q?R/mrGppBPb0dNDkhfD6by4S/t5IB6/axY7aDYxGfg3Lpmkk2rfbgj0oJDM8F?=
 =?us-ascii?Q?nhrYuGR1WqtgniL/arQ39HW+q9U/a73jXyWqVMWo4G6XsEjWUnGQBPnR2r5u?=
 =?us-ascii?Q?Hw=3D=3D?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_F57FA467-812F-469A-816A-B3715FD37ACA";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd45f0de-d4c8-4f75-d947-08daadd6dd08
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2022 11:25:56.8985
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0+IlTuCK4Ax8XfUY9yh5CKgdRFFTPJSdjUm1EigngOZuFT0rbRibzKyC8q8QbIIi8xuNcLuGcRqjF2Kcy+6ySUAlmUNCU9DvL7EnM7GfB7g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5864

--Apple-Mail=_F57FA467-812F-469A-816A-B3715FD37ACA
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii



> On 13 Oct 2022, at 14:05, Anthony PERARD <anthony.perard@citrix.com> wrote:
> 
> gengotypes.py creates both "types.gen.go" and "helpers.gen.go", but
> make can start gengotypes.py twice. Rework the rules so that
> gengotypes.py is executed only once.
> 
> Also, add the ability to provide a path to tell gengotypes.py where to
> put the files. This doesn't matter yet but it will when for example
> the script will be run from tools/ to generate the targets.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Acked-by: George Dunlap <george.dunlap@citrix.com>

And you can keep the ack when you address the Python 2.7 problem.

 -George


--Apple-Mail=_F57FA467-812F-469A-816A-B3715FD37ACA
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmNJR0QACgkQshXHp8eE
G+0gCAf+NM3R6ROSBG+Tv72aFTSqO9tAYm40VbRXlVTa4jKCNQq64cDu3Ot17hTK
mtUihsuIzSKsAFLA7kLzrQm5PhFDRbJZ45WiAKFJXvAmLcusu5rBaW8IycvVigRv
QxqD6oGJiJ3YwlDpgVUo6+208hRCbl1OWchGhDFqFLLrhVtE2hvp5i2OHkezMoqM
LZ0CAsNgPEPPZmK0elgzQlYQ/Nc4cGBRq0x4MOZpAyx2oz4Kqz/6MV5d1YEMU4As
aM9eIc8lyl6dd9/fPAlCYgwxRvbNd293pWtqSa7JPMXFkK6yjKW53liLFy0R6Gfe
1McT0qI2BWfHZH9A00eXH+cC9xrU5g==
=Ne8p
-----END PGP SIGNATURE-----

--Apple-Mail=_F57FA467-812F-469A-816A-B3715FD37ACA--

