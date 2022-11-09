Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D34622D51
	for <lists+xen-devel@lfdr.de>; Wed,  9 Nov 2022 15:19:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.441052.695305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osluK-0007rM-VN; Wed, 09 Nov 2022 14:18:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 441052.695305; Wed, 09 Nov 2022 14:18:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osluK-0007pd-Sa; Wed, 09 Nov 2022 14:18:24 +0000
Received: by outflank-mailman (input) for mailman id 441052;
 Wed, 09 Nov 2022 14:18:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=opqx=3J=citrix.com=prvs=305fc5d8a=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1osluI-0007pW-V8
 for xen-devel@lists.xenproject.org; Wed, 09 Nov 2022 14:18:23 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c4b88a0-6039-11ed-91b5-6bf2151ebd3b;
 Wed, 09 Nov 2022 15:18:21 +0100 (CET)
Received: from mail-dm6nam04lp2047.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Nov 2022 09:18:18 -0500
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com (2603:10b6:a03:2d6::7)
 by BL1PR03MB6197.namprd03.prod.outlook.com (2603:10b6:208:30b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Wed, 9 Nov
 2022 14:18:16 +0000
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::fc0e:731b:b539:94b]) by SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::fc0e:731b:b539:94b%5]) with mapi id 15.20.5791.027; Wed, 9 Nov 2022
 14:18:15 +0000
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
X-Inumbo-ID: 5c4b88a0-6039-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668003501;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=EPqjE7d14wyVWB/3xn2R/Nitu2V1hfAAWa7Ozp9AkEk=;
  b=aNi6ups4NKdDUuORKToCMY5dfeEzqPvrZxVaBPK+0yGYL2SLEXkK9Oc9
   4AcBdSTwaf7OxZr1JH/Vx3kyn19U9bjSYDz/5Hg49YAw9VlcRz9OswGB7
   yer9C6o7vJ4SvIed22eQyAcdzgVk1bNmKV4Je5f7xgbSBiKk7uRg9DM/t
   w=;
X-IronPort-RemoteIP: 104.47.73.47
X-IronPort-MID: 83552163
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:sTYhRaJ96fL0D2KYFE+REZQlxSXFcZb7ZxGr2PjKsXjdYENSgTFSy
 GocXDqObKyKMzCke413ad609k0CsZGHydJnTFFlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPdwP9TlK6q4mlB5wRvPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c4qJWxHy
 aACJAk3dx6kpLiXmIyRRs5V05FLwMnDZOvzu1lG5BSBUbMKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/VspTSMpOBy+OGF3N79d9CURMMTgkGCo
 WHu9GXlGBAKcteYzFJp91r83bKSx3qlA+r+EpXnrsYzjgSDz1UOSzwnTUHrjqm0oAmHDoc3x
 0s8v3BGQbIJ3GymSMPsGSKxpnGstwQZHdFXFoUS6hyJy6fSyxaUAC4DVDEpQMwrsoo6SCIn0
 neNnsj1Hnp/vbuNU3Wf+7yI6zSoNkA9IWYcaAceQAAC4t2lp5s85jrQSv5zHajzicf6cQwc2
 BiPpSk6wrkW08gC0v3n+Uid227z4J/UUgQy+wPbGHq/6R90b5KkYIru7kXH6fFHL8CSSVzpU
 GU4pvVyJdsmVfml/BFhis1RdF11z55p6AHhvGM=
IronPort-HdrOrdr: A9a23:wrHWIa/cbd9gRP88Xchuk+F7db1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYW4qKQodcdDpAtjifZtFnaQFrLX5To3SJjUO31HYYL2KjLGSiQEIfheTygcz79
 YGT0ETMrzN5B1B/L7HCWqDYpkdKbu8gcaVbI7lph8DIz2CKZsQljuRYTzrcHGeMTM2YabRY6
 Dsg/avyQDBRV0nKuCAQlUVVenKoNPG0Lj8ZwQdOhIh4A6SyRu19b/TCXGjr1YjegIK5Y1n3X
 nOkgT/6Knmmeq80AXg22ja6IkTsMf9y+FEGNeHhqEuW3XRY0eTFcdcso+5zXUISdKUmRIXeR
 730lAd1vFImjHsl6eO0F3QMkfboW8TAjTZuCKlaDPY0LDErXQBeoR8bMtiA2Xkwltls9dm3K
 1R2WWF85JREBPbhSz4o8PFThdwiyOP0DMfeX56tQ0hbWIyUs4nkWUkxjIiLL4QWCbhrIw3Gu
 hnC8/RoP5QbFOBdnjc+m1i2salUHg/FgqPBhFqgL3f7xFG2HRii0cIzs0WmXkNsJo7Vplf/u
 zBdqBljqtHQMMaZb90QO0BXcy0AGrQRg+kChPbHX33UKUcf37doZ/+57s4oOmsZZwT1ZM33I
 /MVVtJ3FRCD34Gyff+qaGj3iq9M1lVBw6du/22z6IJyoHUVf7sLTCJTkwono+pv+gfa/erKc
 qOBA==
X-IronPort-AV: E=Sophos;i="5.96,150,1665460800"; 
   d="scan'208";a="83552163"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tw0Wh+PHwFenlJzaKo0SK7ICQnzjX3sOChVvpihciijRRSlVVTfq9B2X9c45SsYDCYRz5BB5ra5v/WQiq3yirrCBysTAe9oWSpuxNa491c8rmpC+yq+H1oq32Dl8ul06ufotCpGNaVU4u0aFMCU3GgMBF7HZqpLd8P5RY9O2cCkV3eQ0kdVfJ0ZlLS4FUkwSbwAh98euE1hqBHRuiyDd1JIM9ht2PN3ZemNinQGhyRvmd1TFaRf1iKmc0Bg6NHoO9Nby/LYqQQZmp2n7/vTjKW0/v/LJlXQB5PUKxKxF2azCZs+/TpHa3kVNraGgN6Ew5a0Ln+Zsr5S8zxnynhj2nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c8eKovsa9/zAjjj2eEXHy3G9ERh7s5T6IgK4RZzjVC4=;
 b=Ow+bAFDjkr1ZFQMAD9ulSXwtR0nGaipwXXhFP0GKpTldG1NcAyh8QeqvcRIjBfaS3ittaOow3WLFBmFwRoM0mI+2FCkBRwNj1mmIVj6bvIDPsfUTgYJSYTr4owk6B9lMWgHmxHqUHyOqzCf8zia923tZYGcp1SVjls/ZEgehp8CTxv3iTvq9KUXwfFKn0NgpvBoC0fUx35Jj8/rV7o4BbjVnFHScAhBJFwLTXWRuLxIlOTM+uYgAzKdku+AmI3ENodsbk+3J0XC3RL6+S3o0ja9TCtXoE/DNLCgmL3W0oogBKDtXy40kFIZ1WdiKiXSXwU7LRYeCwmHPKO63KzSWfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c8eKovsa9/zAjjj2eEXHy3G9ERh7s5T6IgK4RZzjVC4=;
 b=VxdPcWGXkaFbWySYoO5dlsinfUFFitfl74O9pELiZZOtckMkRxxWUsNL68fYrh3l9MuSvn2Ls3Xvf2/twudVatuGE5WMNGv8JwlV1uhm3gQLbfeUSxXX0A8kSRJ4HyL2ie0g1y3iOJzjm+xaEYW7ECtf8OyKjEU7ZEwpcvVzoO8=
From: Edwin Torok <edvin.torok@citrix.com>
To: Henry Wang <Henry.Wang@arm.com>
CC: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Wei Liu
	<wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH for-4.17 v3 07/15] CODING_STYLE(tools/ocaml): add 'make
 format' and remove tabs
Thread-Topic: [PATCH for-4.17 v3 07/15] CODING_STYLE(tools/ocaml): add 'make
 format' and remove tabs
Thread-Index: AQHY84fA+Ym2JRve3kKJcIO1APAKeK41MEgAgACx3ICAAML3gA==
Date: Wed, 9 Nov 2022 14:18:15 +0000
Message-ID: <0B9BA046-5FA5-42EC-9959-63F15B833E91@citrix.com>
References: <cover.1667920496.git.edvin.torok@citrix.com>
 <16f52592270e36670947fbcbe1e4d91f1daf9823.1667920496.git.edvin.torok@citrix.com>
 <4baa6580-a779-f1e4-b504-59895fa97309@xen.org>
 <AS8PR08MB79919C95C2B529B887D322CB923E9@AS8PR08MB7991.eurprd08.prod.outlook.com>
In-Reply-To:
 <AS8PR08MB79919C95C2B529B887D322CB923E9@AS8PR08MB7991.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.200.110.1.12)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5888:EE_|BL1PR03MB6197:EE_
x-ms-office365-filtering-correlation-id: c27708e0-5c85-4235-0ca6-08dac25d3e4b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 jDPvjs6BtuKH0+gf2k8Hhe4oc33lzmAWFnHIoX0RccVWcIZnjoiQ2RA+ZxRlfUNfx/8LnBX+KJZl8Hhl22dhvnG99PwwvmRX4XyizN38N+10BEYFS/aoPnzoyy2PTLvKsZLaBECwuORx8Dfl37dUuUq0PNKVOPi7up6+xkhimQ5IH1+j4A0pdnErr0+uQOpSJbMXQcIL8btPGbGU9IGQvPnzCDdgF4awoYBUk1I3GHtDry58AkIOV01Ko+Xi0nH299lCafXI4LiPXHFRWuQhxwEG+5dudI0qX9zwLqfQh8OKEW68xtBsL83/udrZ9BgW4WsDY5agY/K0/+CiYuQ7g2qKsujj2nWoyo2HNxNhOo0Cx3z26m2L+OqNkiDqiMIPg0HJvEAHUQhwj/nExMG/tEwdfW/kWR4qty31Ef/FzqOrJlXKqEIV2WXNO6p4NRtgvyt6/TQnpQHb4XCh8QvMV/nr8DXPzEopau5kwVFg1C9AVcJCOFWrsJbHjuhKJHhbAnfK91ez9marNduRAJlnUQPOwgoBasTaSTcJZ2cvJOw6/O2SlQJceFNRI5H5wb7fgcd75CHp+zs3YILsesmUdxf8B27a8qRSWzKGpOt/EFo395c6GUoqLgl9uDWWTDnsdW1fs5eTkdzQl1ZnFFJt9GJLV2qsHuMv3Iv8PF4URdWQfdt7qIFU3V/U6WX75NORV84DFwJRCFKrU+8kmhbt7I/VggB9+qRLLd1pIM0DamsadKQXrpwCAPLHHUYclRTgg2aKGO183NlTyT6dx9ZP8hggzJOrjBiIvnmaEVjJqa4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5888.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(136003)(346002)(396003)(39860400002)(451199015)(6512007)(107886003)(186003)(2616005)(53546011)(83380400001)(26005)(38100700002)(41300700001)(6916009)(122000001)(2906002)(6506007)(54906003)(478600001)(91956017)(5660300002)(71200400001)(6486002)(316002)(8936002)(4326008)(76116006)(66556008)(64756008)(66446008)(66476007)(8676002)(66946007)(38070700005)(33656002)(36756003)(86362001)(82960400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?34V4QFY6WNWhxejdbkDKBw+B+GS0dfHmzZHoYj0ztIUqcqQwaDFiV/HH+T2r?=
 =?us-ascii?Q?U2iJeGkLi9jAHI4J9YNmWRP63TaRJozx1+hmKLbRA05ytxUJBpPWM38FipEk?=
 =?us-ascii?Q?uB5mJZ1ESAWyHU7CYYjHDlHEtPu8+ljnJwd0qY1SRXVSolcGpOALb5hC5lsB?=
 =?us-ascii?Q?yrQWBMeonihu1fUOrWeMReByIxlMgpbSRy6QoIAzuGajni3XumIZ+d18Eysq?=
 =?us-ascii?Q?hdAFJ2ukkdA8xtytoCiiAKdlF/2wb8/6nz5lhCd3r6zj9Kv+kV4ieK/PDc0x?=
 =?us-ascii?Q?71esbKHPntgZIT1jfUH2chNe3x0tw8yf080HtZX3x8pvB7TtmjW6hMqmFuzJ?=
 =?us-ascii?Q?zi1ofZlrH1DlHjEd/ida75gz1T6HRgCXIrK9pA5tSkiwAVg/lGPwpJmLgrd1?=
 =?us-ascii?Q?tNEh6NldDXdmvNfyQtvpU1aFiV7FBAP87HuWU27nWEYURPHTyl170BwQOVeS?=
 =?us-ascii?Q?XG8RLkUVLHS92f7YMoOX+YE9JtkyYE3/HsB7L2Zj+sfK3oJNm3gxGccaEDZ3?=
 =?us-ascii?Q?rxjJGenrX6pxYuzS/CscUMtPACyS5KVxEHhUp5zYljiAqZsirJTH+jka2Hf2?=
 =?us-ascii?Q?ULMbzxYZzmcCfOS1B6HIs+e84iQnMb7IJ4bQvZa4ogKg1v0y/e7UYhpEFJfc?=
 =?us-ascii?Q?u2iPv7O8KaIX5Y7hFFWdKZQG8DjA9H6wdsLQz9OQgGjQDo6ThUzUGaq5e9Kk?=
 =?us-ascii?Q?OYB6ZGL/CHrcK1rix0y4DXfxUMTF85d/rh/axhygJEMJtdGuJFSRW+I+4aJd?=
 =?us-ascii?Q?LN+XfqHJhPagrJG0f4KSeYqOF6pMesi7dPARYDFrX21DAOHmXYBawhRc+9AK?=
 =?us-ascii?Q?Y0qC1Eax7KVxqiG9JDk9iEngTMfLjxiIFEehSshac8jOZGgfhenCE40gN0G2?=
 =?us-ascii?Q?WffY/o4qhucDIRKjrZ891yruENNUKzNGQHYjeZLbnz+ReIMhZP2Ew/vFEVm3?=
 =?us-ascii?Q?sKO9LzeedSuK6yHW+bTMs1tWuBPUbrljN5qD+oKfspuDQjMvhVdj/ef1IQ6q?=
 =?us-ascii?Q?iznRO0YCngSmlbQnM2zGu3ff4D4RDHgAlNGj0aHNiozMt2VQzuMUrCM1Cv84?=
 =?us-ascii?Q?3/VoJWUbEx39hON7P6rTXo2XdlRnD3N6/a4BPzR5LquW9jRO+3ihrbDSy2WE?=
 =?us-ascii?Q?MlANf45guWDpR2VCwAEcqsLiO2OZphhfRSgaCnDLuSG5JU84nwJ1zxIx2r9+?=
 =?us-ascii?Q?+UE3vn3csHkb4FuCKySjGq/PAJ5VqCSdlHV1oHfQ860W92B4bFzTu15Y2wHb?=
 =?us-ascii?Q?IVBlZHJukTSEc8qO92hypW6T6/YTbPVM2lHT/bygRGMNTlIcKW3MmZQDrC6L?=
 =?us-ascii?Q?gse9LS2Oaw/ENT21RipP+8Mk+mtdbpufJCSI3VxUq7tGbX/dCC7exnDZdegu?=
 =?us-ascii?Q?P2tE8l0HsUxXqSL1m+xVuWjdAqjTKolrxvR7Ejj6q3Kopezzde7BCQ8sw25p?=
 =?us-ascii?Q?IA4g7Sjwx5KkfDnxM64ci8NRL2szuEnJouDPnwsLrUkAac3uO2Mc0oRcw3uk?=
 =?us-ascii?Q?a7w1kaSxxMwFDQDT6jlhGRkslJg7tDr5zlcnwxGQDS5/u2INQd6Nf+8OTnEu?=
 =?us-ascii?Q?qnq25DJdPixlmmtM1CZ88KlmemrBerSnKWdW7sw5RTEdg5FPW/5dRf+dApzM?=
 =?us-ascii?Q?GQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0C8391960F24A94183EE0C8D2CD4EA93@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5888.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c27708e0-5c85-4235-0ca6-08dac25d3e4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2022 14:18:15.8886
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tFX+LUToiNd9JvqKMOdVyts/coaCnHkUA/Wy73wTUD967ZspRNlKySZKAwYzcyNo9lcSTtArX3UrJ05K22tSiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6197



> On 9 Nov 2022, at 02:40, Henry Wang <Henry.Wang@arm.com> wrote:
>=20
> Hi Julien,
>=20
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Subject: Re: [PATCH for-4.17 v3 07/15] CODING_STYLE(tools/ocaml): add
>> 'make format' and remove tabs
>> While I understand the goal and support, this seems to be a bit too late
>> to do it in Xen 4.17 (we are only a couple of weeks away). At this stage
>> of the release we should only do bug fix.
>>=20
>> This is clearly only a comesmetic change and there I would argue this
>> should be deferred to 4.18. That said the last call is from the RM.
>=20
> I agree with your point. I think maybe defer the patch to 4.18 is better,
> given the deep freeze state we are currently in.

On the other hand here is a bug I just spotted when looking at indentation =
changes (or rather reading the code after the indentation change),
and there are probably more:

```
        if not (Domain.get_io_credit dom > 0) then
            debug "Looking up domid %d" (Domain.get_id dom);
-           let con =3D Connections.find_domain cons (Domain.get_id dom) in
-           if not (Connection.has_more_work con) then (
-               Process.do_output store cons domains con;
-               Process.do_input store cons domains con;
-               if Connection.has_more_work con then
-                   (* Previously thought as no work, but detect some after=
 scan (as
-                      processing a new message involves multiple steps.) I=
t's very
-                      likely to be a "lazy" client, bump its credit. It co=
uld be false
-                      positive though (due to time window), but it's no ha=
rm to give a
-                      domain extra credit. *)
-                   let n =3D 32 + 2 * (Domains.number domains) in
-                   info "found lazy domain %d, credit %d" (Domain.get_id d=
om) n;
-                   Domain.set_io_credit ~n dom
-           ) in
+       let con =3D Connections.find_domain cons (Domain.get_id dom) in
+       if not (Connection.has_more_work con) then (
+           Process.do_output store cons domains con;
+           Process.do_input store cons domains con;
+           if Connection.has_more_work con then
+               (* Previously thought as no work, but detect some after sca=
n (as
+                  processing a new message involves multiple steps.) It's =
very
+                  likely to be a "lazy" client, bump its credit. It could =
be false
+                  positive though (due to time window), but it's no harm t=
o give a
+                  domain extra credit. *)
+               let n =3D 32 + 2 * (Domains.number domains) in
+               info "found lazy domain %d, credit %d" (Domain.get_id dom) =
n;
+               Domain.set_io_credit ~n dom
+       ) in
```

Notice how all that code "seems" to be inside the if unless you read really=
 closely, but in fact it isn't, just the debug statement is.
Which means whenever I reviewed this code (to look for performance or secur=
ity bugs) I've been reading it wrong the same way the original author got i=
t wrong when indenting it.
In this case the original author being me, as I've introduced this bug in 4=
2f0581a91d4340ae66768a29fd779f83415bdfe back in 2021, where prior to the ch=
ange in that commit indentation was correct,
but the patch added the 'debug' line in the wrong place (before the let ins=
tead of after it, and had I had my usual tools available to indent the file=
 correctly
this problem would've been detected and corrected before commiting the bug =
into the codebase...
And was probably a side-effect of trying not to reindent the code to reduce=
 the patch size for the security fix, and by doing so introducing an actual=
 functional bug
)
(And I've recently fixed a similar bug elsewhere in XAPI, in which case I w=
asn't the original author of such a bug)
Indentation can't really be trusted to humans :)

(It means that even if a domain already has IO credit we still scan its rin=
g for more work)

So some indentation changes will probably come in as bugfixes for 4.17.1 (w=
ell maybe not reindenting the whole file, just the problematic region of co=
de/function).

Best regards,
--Edwin=

