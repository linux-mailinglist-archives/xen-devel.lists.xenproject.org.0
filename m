Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE6E42D653
	for <lists+xen-devel@lfdr.de>; Thu, 14 Oct 2021 11:43:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209199.365579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maxGM-0005My-Ph; Thu, 14 Oct 2021 09:42:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209199.365579; Thu, 14 Oct 2021 09:42:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maxGM-0005KC-MM; Thu, 14 Oct 2021 09:42:58 +0000
Received: by outflank-mailman (input) for mailman id 209199;
 Thu, 14 Oct 2021 09:42:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PYUk=PC=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1maxGL-0005K6-L5
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 09:42:57 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 58e02220-d3f8-4e12-9610-8eef4e082e6a;
 Thu, 14 Oct 2021 09:42:55 +0000 (UTC)
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
X-Inumbo-ID: 58e02220-d3f8-4e12-9610-8eef4e082e6a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634204575;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=yAMoMvCk/cp04il8oTNSW2uU/i394SMSgVAijOKhQUA=;
  b=Lzq6zX++yX73DNfPpCt+D3NFmjN6oPHeJFZ3szx5bJoxATUjKg+UgN4D
   k7H815hBoTLNFWaXDp6WdhmvA6vO6f4J/WoSCASHFoamsc5KPq5zptiZP
   OjAXY8qX5/3L0tRNhYdDFRnpiQTM1w3q/D0Ni9o2RPe4e224hqhG7GNFD
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Xxy3rW54EEPtpAO4VTckU6L7ipttINo5xrYHDGN1wK6cyFoCiJdW1b8R3gelmVVPPev5FxYJx+
 BNH2W0UQ41bc9Hav7s7WFRY83AsW7NM5Uzfibnv0fUcahYrnISGiXbw+0HDo+LpVsQ6bhA6ZO4
 L8lH98GEBSGOYATA7sDt1GBxEYzHEfE/KrJCCOEhgv7spcNevy3hHtqVNV29loxo0mc34om1NT
 yCXWmmRIMBPWUowSbGn/wV93HGamKrCkbdsmIPKuR9o/NjpC9RXHI/4C/ckPfANkb4MMdwlx8x
 y6emjdHr+sqBbmsBICsVn6kJ
X-SBRS: 5.1
X-MesageID: 55157498
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:CxlUJ61qQM26cZwcD/bD5ah3kn2cJEfYwER7XKvMYLTBsI5bpz0Gz
 2pNX27QPP7ZZWb1fYggOozlpk1Tu8fUy9c2SFA5pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan0ZqTNMEn970Es7wrJh2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhgcBqz
 slGmJeJEyAvDI79hacbChZJHHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1EjcQ5LdL3PYoZ/HVhyz3YAt4tQIzZQrWM7thdtNs1rp0TRKuBO
 5tJAdZpRC6cPUEXFn0nMrE7vqSjhFLZI2Naml3A8MLb5ECMlVcsgdABKuH9eNaHWMFUlUawv
 X/d8iLyBRRyHMOb4SqI9DSrnOCntTjgRIsYGbm89/hrqF6e3GoeDFsRT1TTifO0kFKkUtRTb
 Ukd4DMzrLMa/VauCNL6WnWQnnmAuRINXstKJMcz4gqN16n87h6QAy4PSTspQNknv88/QXotz
 E2Em/vgHzkpu7qQIVqf67OVoDWaKSUTa2gYakcsXQYDptXuvow3phbOVcp4Vr64iMXvHjP9y
 CzMqzIx750Skswjx6i95UrAgT+nut7OVAFdzgneQG+N9A5yY4+hIYuy5jDmAe1oddjDCAPb5
 T5dxpbYvLtm4YyxeDKlXvUWGq2iyv28ahras31eAtonrju89Cv2FWxP2w1WKEBsO8cCXDbmZ
 k7PpA9cjKNu0GuWgbxfON3pVZx7pUT0PZG8DKqMN4sRCnRkXFbfpHkGWKKG44z6fKHAe4kEM
 pCHbd3kM38eDal2pNZdb7ZAieF1rszSKGW6eHwa8/hF+ebBDJJ2Ye1cWLdrUgzfxPjZyOky2
 4wOX/ZmMz0FDIXDjtD/qOb/12wiI3khHozRoMdKbOOFKQcOMDh/UKOInOt/JN07wfw9egL0E
 peVARIwJL3X3yyvFOl3Qio7NOOHsWhX/BrXwhDAzX73giN+MO5DHY8UdoctfKlPyQCQ5aUcc
 hXxQO3ZWq4nYm2eo1w1NMChxKQ/JEXDrV/fZEKNPWlgF6OMsiSUo7cIiCO0r3JQZsd23ONjy
 4CdOvTzGsFaHF44UpaIOJpCDTqZ5BAgpQ67ZGORSvF7c0Tw6ol6bSv3i/48OcYXLhvfgDCd0
 m6r7d0w/4Eheqc5r4vEg76qtYCsH7csF0ZWBTCDv723KTPb7iyoxooZCLSEejXUVWXV/qS+Z
 LoKk6GgYaNfxFsa4ZBhF7tLzL4l44e9rbFt0Qk5Tm7AaE6mC+08LyDej9VPrKBE2pRQpRCyB
 hCU4tBfNLjQYJHlHVcdKRALdOOG0f1IyDDe4e5seBfx5TNt/arBWkJXZkHehCtYJbpzEYUk3
 eZ+55JGt13h0kIna4/UgDpV+mKAKm07f58m7pxKUpX2jgcLy01ZZcCOACHB/5zSOc5HNVMnI
 2HIifOa1ahc3EfLb1E6CWPJgbhGnZ0LtR1HkA0CKlCOloaXj/M7xkQMozE+TwATxRRbyeNjf
 GNsMhQtd6mJ+j5pgulFXnytRF4dVEHIpBSpxgtbjnDdQmmpSnfJfT80Nuu69UwE935RI2pA9
 7aCxWe5CTvncakdBMfptZKJfxA7ceFMyw==
IronPort-HdrOrdr: A9a23:hmUI5KGI7PJpkvBBpLqE7MeALOsnbusQ8zAXPidKOHtom62j5q
 STdZEgviMc5wx8ZJhNo7+90cq7IU80l6Qa3WB5B97LNmTbUQCTTb1K3M/PxCDhBj271sM179
 YET0GmMqySMbGtt7eZ3DWF
X-IronPort-AV: E=Sophos;i="5.85,372,1624334400"; 
   d="scan'208,217";a="55157498"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bqMgwYihwfc7A4AxzvmfpfcJZ4GnbdgWI3HyVPT4ttR+WdfzhQbU6QtZxwqw7eg0UvEqwmO4F8Ju4kgDtr56Avgr6HvrS04Dzjqt5FgupBNdtqxK+l96m5CAx7pYqHktQE0TSV2dbyxaPMK5NmnhDk5tWAvj2tz7y6aOVkWLT+8LstNHqphidv9ynR0GWTNOYI97TF8wPN1DV9qQIbx4c825+dzBYNJbVdelaMt9eWcceqeI072z8XzLqLIbWlyKVsHaaFrcvqG7hF1B5XOw+BLTmZItNF7hy+m1Yh7FFqGn7PoR5+WnaAwvzjmVSyariqEeWUPpL97DiWe39/ovIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=buiBblhjlh+8I1QqTkz3NZo9EzlJNOtGiEbAjKuWzfs=;
 b=L7+mJzamXBXvKXaJ93VPElAJq19NOLsgiQptUg5yi3d6cR3xYvVjOapjdySvVjci0EE8MZDN8swOE5KZFNPnv6k3dgtetcHXO8QUyScY2s0KhY9vcFQtOvgJ02zc1uEPzarycofet3cidosQB9oyuhKkzJALgetcTJnr9bcWsmP3DR6g2JYYQGa2fKYOY98xL8GDSMOOFXUjScMkRN7tuE7uNuEHIix6HDxbHPitSuSpcGx/pUsb8IsgtpJo8m/q+ZNXt3I2h0FNH+EdfSAfsrxSuS++2mhz7HZ/7iR+bfGUj18fRJEOBQQS8CrUSb/egPcTbH4wk3TtGx5LBOpzQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=buiBblhjlh+8I1QqTkz3NZo9EzlJNOtGiEbAjKuWzfs=;
 b=ItoCEfz/TWh4IHw6jUcFyhzu9bH48YBdtpwAt2oKcu0Bh4eCfWFLVIvVAdZL9Pmtnh6bKYYwa2I8UIVN5njBLqr/ELSQ9ksjjRSw8t3o3i8Qepbie+W7ZferLaTyf0AvM2xyhnTHPgS7OpdUdCs8vh89x+J+ud5QZnOmhbJpS1c=
From: Christian Lindig <christian.lindig@citrix.com>
To: Julien Grall <julien@xen.org>
CC: Michal Orzel <michal.orzel@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, David Scott <dave@recoil.org>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Roger Pau Monne
	<roger.pau@citrix.com>, "bertrand.marquis@arm.com" <bertrand.marquis@arm.com>
Subject: Re: [PATCH] Revert "xen/domctl: Introduce XEN_DOMCTL_CDF_vpci flag"
Thread-Topic: [PATCH] Revert "xen/domctl: Introduce XEN_DOMCTL_CDF_vpci flag"
Thread-Index: AQHXwNg3UVaE90Gwpk2gRfKr74wLf6vSO2MAgAACmQA=
Date: Thu, 14 Oct 2021 09:42:45 +0000
Message-ID: <5C594BB0-FDF2-47B0-8E54-CEB154579F47@citrix.com>
References: <20211014084718.21733-1-michal.orzel@arm.com>
 <26a54c0f-7177-20d6-9186-08df5ebe852a@xen.org>
In-Reply-To: <26a54c0f-7177-20d6-9186-08df5ebe852a@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 04d7ed69-f34d-4eb3-f644-08d98ef6f9b8
x-ms-traffictypediagnostic: MWHPR03MB2526:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR03MB25261A82C9CF721CAC8F77C9F6B89@MWHPR03MB2526.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TahUvf+w/u8+SAE7j71UyKJJ7ko2IzfUTkuyO9GHhmhMiCbukl3JlIrGXAIybKDP9jEZUb7jZcwZEdUsf0HbsjEPYUhrAdM9YjoT2sE4h1iNxGmsH8x3Tq8D8vkro19FOEX3vSHolWSPnazmDuUiRLLdkY6yTu0gp1rdBIH8J7x9vm8aQGdJddo/h/L7FOmDmkre1hkeg0Kzup2Da/S0xOs96G8XiXCb6XgRmEaHjBt6ed3pKYPqMkJKY1GNtfI7H3p0Jcp/YZTNCyznxoofA64L1JaXs3gH3xX7ruUcLOQ3s8X/TESf04F08CVyFIhwa8cyO8EXtu8v8+pWAxiCKMtlYQpLuAJK1f4JFzSr6Tjo4z8pE9p0d/TuuOY77vcu/d3iHTmjv6hbqWOUfsvevscwz7TTMvvtSFkB/7pdzCp5NExk7CupEk/jfbWSZIyfloduuGLEoZomYXwyFzQZmlq5xoVupOCXv8h+HbXxMhexme04+lWNOUT8q58MZ3pFbWXlMtTkqNkq6Ir+sLKE2CNEHMIpaOCWMfb8VEGb7QlRX667rhke3YB3Vgi741g4P+nsjUXtSdIAlKM+RYeBiLMx5xp19AGmPQweLZwDQaC25AVZrjQAmuDvp5wYVd6Zkh5S/FMKUm21D0nxeOOEZ2giJcut2bx0W7d2hNb1emkhPE/47zAE44nd0AxAK7UIQXbgRf9ezeHtf1s2BeAKeHOaRY0y1xz7ImISwQJE4bKmGVmZDrOUjkU/+HUiD3RR
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6380.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(38070700005)(122000001)(66946007)(91956017)(71200400001)(26005)(53546011)(186003)(33656002)(5660300002)(508600001)(38100700002)(6506007)(316002)(66446008)(66556008)(66476007)(54906003)(7416002)(76116006)(8676002)(6916009)(2616005)(64756008)(86362001)(4326008)(44832011)(82960400001)(36756003)(2906002)(6512007)(6486002)(558084003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pol9ZoPnW07XEIfz/v1I6cvBhn8NkX4kFlc/iS2jwOKRdRTfX5zZw1j9nz7b?=
 =?us-ascii?Q?F/luqbSzBpy9z95iZaxEnE54/9BYCTIJkS2SZC9cr+9rcfKl/Sl8HcuNG3X+?=
 =?us-ascii?Q?cefgL6wknOYc68l7BwURSzl5t41eNPjmD1v2LY4rrb9iiRBVENE2ylId5kaz?=
 =?us-ascii?Q?KgNNMeJpSSv3OhV2GYtDA8EkLAqDwZDTigV2QeRbevKW9g9WVXgx0kGijDHt?=
 =?us-ascii?Q?iTcd+d9T25lix3+tNAYfQ0+R2W58w9pIxEUZa+jEin6E0Y1BY7KqhMxlYDXL?=
 =?us-ascii?Q?HpYImx6FmWGRk/VsDVIKSgx+fUGWd8hp5oiUvzzbju/t8YmpWHeTCPbdhTSv?=
 =?us-ascii?Q?J/QrVO7/fortRnIlkrsmMgLWPOcc0PeZ3fPmAstCOXJY7xJa7FkDrVLmREvd?=
 =?us-ascii?Q?Rgmgz6knG4dSx+uxdmP+XUVz4FJ8/WH9N428RdNAiKzK5Gl9ylQlGKqH0NUX?=
 =?us-ascii?Q?5KeqgdT8qwBnthyeYtC3Rsdq2I18LybOGBMyZXFyUys76u/5mnFIp6SUtoPp?=
 =?us-ascii?Q?nJD9yvnny1JMCnCRgLQjh6iq4H7BlSZU/NH6i+s4i8t/sbwUpfM8CDhUC0X0?=
 =?us-ascii?Q?UGl2rkwloFK5469MuKJ5j3lcbf6u5qepfLKzaswXDKEhgt2/e6SCEwj2mBZt?=
 =?us-ascii?Q?LUnbKxBAHOhEYtihoxlo7YK8X9FZ61JJKLmPzObBoBGonDombvV8jFtRIgMg?=
 =?us-ascii?Q?K3z3J/NX9lMvYY4qm/Sg1KG+ec/GVyzgUl3/PdrsjlhidySuTjOktdOmSLnl?=
 =?us-ascii?Q?JSxOfCt6kY8FQZ7Fh44R2wLhOAHBZ1skqMqVtJ70OgiShkn91xMPdzwrTPNI?=
 =?us-ascii?Q?ea+fT92s/bDIIfIC6CWgR7eVFlt0dVSM0VlsgW7t201m02EoP7SVwRqrQVEi?=
 =?us-ascii?Q?+11SE0Q9cAv3Du3q0d94VB8mPUk75Zd6glUZHhEByYoj9Zi95USCxI4pUXLh?=
 =?us-ascii?Q?ICc6KLHZ3qePNj6ylpxp+IOMz7XIXfzoNY5efHHV5d01VD9r/gxXl2IX/J8X?=
 =?us-ascii?Q?z0xx8+ahXtkSpNo6ajUJes0TcFwjeGiz8Z3Zoni8JmaRpMZqhcCyNmlE3oYs?=
 =?us-ascii?Q?W5Ebk+b2jaPqGnnPeJ10JgRkrSJp9zrBJBT/Gq8XwRdsKSH0i+fm77+LFbma?=
 =?us-ascii?Q?jgzQbh7UQKeiyZ/1EB0G1ooTPG/YcgIe061bC/N5A++n1vTuk9f2HiTPFv04?=
 =?us-ascii?Q?jWqpU/wkhikqwCRN/HngMM+aU7/zvixQR6ZCgtqvqsQ5nNUd6+UL3zXd6qDF?=
 =?us-ascii?Q?OS9bhq4jJa/xEntTtlZTJ33s5FcHWUpHlkShOrRcUhuT8FG8cCcDiiVQ1B7F?=
 =?us-ascii?Q?DN8M/liePaqup+I5C6XU2j7QcG5BzligQFQfrJQiahPS3w=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_5C594BB0FDF247B08E54CEB154579F47citrixcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6380.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04d7ed69-f34d-4eb3-f644-08d98ef6f9b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2021 09:42:45.1437
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iACiqq7GwyIl+dHO8oP3ghKDL3fzzXw6Ziz4J3jI2as67tR07Ut0IaXHV3WdGSY+oZK03Rts1p9f3zRBbfj52HM9wimwsFu/m8unsB9vY5w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2526
X-OriginatorOrg: citrix.com

--_000_5C594BB0FDF247B08E54CEB154579F47citrixcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



On 14 Oct 2021, at 10:33, Julien Grall <julien@xen.org<mailto:julien@xen.or=
g>> wrote:

Looking at the thread, we are only missing an ack for...

---
 tools/ocaml/libs/xc/xenctrl.ml  | 1 - >   tools/ocaml/libs/xc/xenctrl.mli =
| 1 -

Acked-by: Christian Lindig <christian.lindig@citrix.com<mailto:christian.li=
ndig@citrix.com>>

--_000_5C594BB0FDF247B08E54CEB154579F47citrixcom_
Content-Type: text/html; charset="us-ascii"
Content-ID: <AD11CCD166969A47B3C138F0E6CC38EA@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; line-break:=
 after-white-space;" class=3D"">
<br class=3D"">
<div><br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D"">On 14 Oct 2021, at 10:33, Julien Grall &lt;<a href=3D"mailt=
o:julien@xen.org" class=3D"">julien@xen.org</a>&gt; wrote:</div>
<br class=3D"Apple-interchange-newline">
<div class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helv=
etica; font-size: 12px; font-style: normal; font-variant-caps: normal; font=
-weight: normal; letter-spacing: normal; text-align: start; text-indent: 0p=
x; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-te=
xt-stroke-width: 0px; text-decoration: none; float: none; display: inline !=
important;" class=3D"">Looking
 at the thread, we are only missing an ack for...</span><br style=3D"caret-=
color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: n=
ormal; font-variant-caps: normal; font-weight: normal; letter-spacing: norm=
al; text-align: start; text-indent: 0px; text-transform: none; white-space:=
 normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration=
: none;" class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: normal; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none;" class=3D"">
<blockquote type=3D"cite" style=3D"font-family: Helvetica; font-size: 12px;=
 font-style: normal; font-variant-caps: normal; font-weight: normal; letter=
-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-=
transform: none; white-space: normal; widows: auto; word-spacing: 0px; -web=
kit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration=
: none;" class=3D"">
---<br class=3D"">
&nbsp;tools/ocaml/libs/xc/xenctrl.ml &nbsp;| 1 - &gt; &nbsp;&nbsp;tools/oca=
ml/libs/xc/xenctrl.mli | 1 -</blockquote>
</div>
</blockquote>
</div>
<br class=3D"">
<div class=3D"">Acked-by: Christian Lindig &lt;<a href=3D"mailto:christian.=
lindig@citrix.com" class=3D"">christian.lindig@citrix.com</a>&gt;</div>
</body>
</html>

--_000_5C594BB0FDF247B08E54CEB154579F47citrixcom_--

