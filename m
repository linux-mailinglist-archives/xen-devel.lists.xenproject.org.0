Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CF933910A
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 16:19:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97187.184479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKjZJ-0006Wn-Sd; Fri, 12 Mar 2021 15:19:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97187.184479; Fri, 12 Mar 2021 15:19:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKjZJ-0006WQ-P6; Fri, 12 Mar 2021 15:19:13 +0000
Received: by outflank-mailman (input) for mailman id 97187;
 Fri, 12 Mar 2021 15:19:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kXEp=IK=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lKjZI-0006WH-Jf
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 15:19:12 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 24b8dbff-6922-4624-ba44-773dc70c82a8;
 Fri, 12 Mar 2021 15:19:11 +0000 (UTC)
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
X-Inumbo-ID: 24b8dbff-6922-4624-ba44-773dc70c82a8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615562350;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=b7HBZQMO8XAMdeHGp9TbhzybQ0kHpW9eiaccNXupzIo=;
  b=NvSkaDHfuqS7qEUdP1qQJS68a3XMJkYNcU/3WaRCvdwJ+52ISQzJFyuA
   X2Uj8Vn0IYZ3jMm+TCqn7KIluMy1cdeTysyQbgqnTwWY2L6WjpRc1yu06
   dPsAHRz3XOQ5jMTK62n/KOeH52OVfS79OBSxgaeWRCfZUJ9qhwuMILozW
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: qdtduvpfk/WyA1athWJ8e/PAzkQNsm6u3DI3H6EVoBw4gm5v041i7MNOVpSt8ogWETVSlWgUlQ
 /BQINfHWDhEVQV8X8DfRrQGbkpLXRvQHDMDHhSG1e1KPaGN2IUVpgkwKXyogA6T8KIDRgo8w+t
 rqO29dkmnfuddO8vfmjrdfl7Cty0ybhdxCyZmSRT++skDO40Z3PRUXyT0xfARQfpnQrOgajBhT
 IjtUmANLKiio62GhU4jXvX6eFIqAILAH4F2c8FpNlziJAkuUjE75VHD+BQPvV7VfOfJK8BRRwl
 Zs0=
X-SBRS: 5.2
X-MesageID: 39523313
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:aJWVgKATBL8Av0flHejXtceALOonbusQ8zAX/mhLY1h8btGYm8
 eynP4SyB/zj3IrVGs9nM2bUZPufVr1zrQwxYUKJ7+tUE3duGWuJJx/9oeK+VHdMgXE3Kpm2a
 9kGpISNPTZB1J3lNu/xQG+HcopztXvytHUuc715R5WPGRXQotn6Bp0DRveMmAefngJObMSEp
 2A6s1b4x+pfnoKZsq2b0N1I9TrjdvNiZ7gfFo6HBYh8gaDlneF77T9Hhie0H4lInJy6J0l9n
 XIlBG827W7v5iAu1Dh/kLwz7ATotvuzdNfGNeB4/J6FhzAghulDb4RIoGqkysypIiUmTUXuf
 nK5ywtJsFir07WF1vF2yfF/ynF/HIQ52T5yVme6EGT4fDRYD4hEcJOicZ4X3LimjIdlepx2q
 5KwG6V3qA/ZXir/UTAzuPFWB1wmk2/rWBKq59ps1VlXZYDc7gUlIQD/SpuYc09NRjn44MqGv
 QGNrC52N9qcEiXZ32cnm5jzM3EZAVUIj66Q1MPssHQ7j5OnHoR9Tp++OUjmB47hfAAYqgBw9
 6BHrVjlblIQMNTR7l6Hv09Tcy+DXGIaQ7QMUqJSG6XV50vCjbokdra8b817OaldNgj150pgq
 nMV1teqCobZ1/uM8uTx5dGmyq9AlmVbHDI8IVz9pJ5srrzSP7AKiuYUm0jlMOmvrE5DtDEXe
 2wfLZbGeXqI2erOYsh5Xy6Z7BibV0lFOEFsNcyXFyD5ujRLJfxi+DdePHPYLX3FzIpXX7+H2
 sDUDD/KN4o1DHtZlbIxDzqH1/9cE32+px9VILA+fII9YQLPopQ9ggZ4G7JoP2jGHlniOgbbU
 F+KLTonueQvm+t51vF6G1vJ15YBkZR67PwTmNSqWYxQhrJWIdGn+/aVXFZ3XOBKBM6ZdjRCh
 Rjq1N+/r/yKYeRyyAkA9euKXmbkHMXuXKPQ/4n6+m+zPagXql9IoctWaR3GwmOPQdygxxWpG
 BKbxJBWlXSDSr0iaKujIUdAebWc9UUunbyHedk7Vbk8WmMr8AmQXUWGwO0WcmMmAA0Wn5/nV
 tq6ZISh7KGhBeiIWYym/4DLVVJcWibaYg2VzitVcFxoPTLcBs1ZXqWjTaa4itDBVbCxgE3vC
 jdCgG6PdvMGUFQv3hE1L2CyiILSkytO2Rqan57toVhE3/hoXgb657XWoO6z3aRZlwewusULT
 HCZn8ILhlzws2svSTl6AqqBDEowI4jMffaC6lme7bP2mm1IInNjq0eGeRIlawVeezGo6sOWe
 KbdxT9FkKIN8o5nwiUrG0iIi96tT0tlu7pwgTs6AGDrTUCKOuXJFRtXLcAJd6Aq2DiWvaTyZ
 18ydY4p/G5PGm0atmIz8jsHnR+AwKWpW69VOczr59I+ao0qbtoBpHeFSLSy2sv5mRJEO7k0E
 cFBKhr6rHIPYFiO8QUZiJC51Is0NCCNlEivAD6CvI3FGtdw0PzLpeM+f7FuLAvCkqOqE/rNV
 6T/zZU8v3FUyGAvIRqQ54YMCBTcgwx+X5i9OSNe8nMEw2sbfhE50f/PXmncrNRIZL1bok4v1
 J/+ZWPkOCWfSajh1yVsjt/P65U82GoBcm1GxmBHOZU89q8fVSA65HalfKbnXPyU3+8bU9dmI
 hOMUoXZc5HgiM5jII23jOpI5aH634Ngh9b+3V/ilXp2oK6+2/VEkFNLB3BjvxtLEtuG2nNid
 6A7POR23v86iVUwJXPFE9feddVBtgbJ7KHWxtGOIwXp76n/60mnyRFblMvFgcH+UPA498=
X-IronPort-AV: E=Sophos;i="5.81,243,1610427600"; 
   d="scan'208";a="39523313"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eu4X+uSrxBij32YTECcF4rXP8es3nhuF7yJItzn2P01Zw1q2UDmP+s4X0v08SR5NSrOlFkDzxs1WLx7e+2Zj+dcxun+4gRtAwXA7tNWfC0OoN5adHPuLzqTJBFCFERFJzoL5wj5SwPCfrrtHX99cl/A3pGkj3U3HejnWTzKkQK4wrKf3GHi9nEB2DmTSZb7fGkaEPAdUYPNJmjtUT5UiPMBkLBPAvHGEChnq+8KsGV8NEMHrgG2dUeLsLJkVJeAgtBr6xYMPzpr2p0a+FZBv4ouJFgOlT520VZDyImefHJD1FCFK77P6mVeHxcEjVJe0poBTb5OfqP1qd4bKAhZGlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b7HBZQMO8XAMdeHGp9TbhzybQ0kHpW9eiaccNXupzIo=;
 b=H7fDhLYE2mmdKblzWd5qc73QsRY3pnzFBENpTRSUX7+dPbJV1CratHB8N7XCkuRE0sKp01z/Xq1/Zz+ATuzVpn5gf/3ZZuUE96dwxNvazGznhQXRbiP8oQ7mLDOKVj8trWsktxI/KPcioYuEBdWe3bO/qqAMitdAYW4vcvPoA+wORUzbNC4ard3v4Tfot7rlZztdmt3XYDsb1eoXBrS3fOUgQKsMrJf08kRwZ1WBFv2iSDpN8h0ExX4V2fIJFUjteCoSCbzI7qkSwy96+mUpkPiS1wT2iosqGIA7OvhZBklhPgrvdv8izGPB7c9b9A5rwoyrfWwoeJuNSeoznyjMMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b7HBZQMO8XAMdeHGp9TbhzybQ0kHpW9eiaccNXupzIo=;
 b=CdZh8fFyZlk5+so9rEbxjXIYH0ptZAozhpavvWm7bpuLWRy7tFrFl9FoNrJgSPeyHiu3PjoQzLUAMnbqcQrORYpVRrxvZjmKPIfIa6mAoc7lZXwJaW3iRfLVtE2ZTJzNOgFeYH8sQB4nSAEIYxVK7Ra+YO0u61vgzo7ZwJdpa1w=
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
CC: Andrew Cooper <Andrew.Cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH DO NOT APPLY] docs: Document allocator properties and the
 rubric for using them
Thread-Topic: [PATCH DO NOT APPLY] docs: Document allocator properties and the
 rubric for using them
Thread-Index: AQHXBE6IzoDpW0Psi0SLnVWLvJvx9Kpa6FyAgCWn/QCAAA0bgA==
Date: Fri, 12 Mar 2021 15:19:04 +0000
Message-ID: <199F2B82-6172-4DB2-A747-182EC42C6E9C@citrix.com>
References: <20210216102839.1801667-1-george.dunlap@citrix.com>
 <b225be0f-3eed-426e-8829-6e7c57cd7635@suse.com>
 <63895FAD-B848-461D-8A31-E6C9973B6726@citrix.com>
In-Reply-To: <63895FAD-B848-461D-8A31-E6C9973B6726@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.20.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8120a6c7-a4cc-4739-9046-08d8e56a2cad
x-ms-traffictypediagnostic: PH0PR03MB5927:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PH0PR03MB5927A23A7CAD185CE6A1F189996F9@PH0PR03MB5927.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OaFfYCphA1ySX+xxgDTpvrOKDzRyGVf/84TZUG+RIeyei+Dm2DUYvPQrPIHh3XlevdqYVOOXKlns540VAIFwG6PCtWY+aHoVX0CaBUBl/iv8xCcK8IGWrHdX97khyCgCiWWIR2hVP2UOBpzZlAWEabjYMJBRaGxtDq6Ol7EfBfz36vMABZjBVAg5TUeL9lvqEotafKcgD5nIqZj9RAYzwZcLAUcbDvEOdx9ToRkmyxwNPg6fEEPrYgsEKCWgZiwadBFoTLenwpLgh7t2lNUfGteJVxNJNhuUo9oBqddbiFtEzS/t8bbdjYCrM39HGQubCRhhT29IEsv8wWDuDq2O3SMHFwBYb70lwOg+An63hVijDkHPiTHap312bkU4/q4sU0e/vyLZE8wVh1s8CNH+wN41XIftvCdk20uT0sggnOVQXbBqCdTzWxeLK3cEPOxUyoMTe4/9wPXZl9iXAx/LHTJNJu4LQLhhnAmf+K2ULpDax55+4toS3wwtOPTXD2VBbKy2ttA5IRoliH9QY0v7oewaAgt5b16d1gZ5sptCCXCqJgFI3XoBO6fDB7qPZrBS5brX7agLmKHeY2MPO+R8HJXYuDnUBBi4huEFfVO4z7IfGIcIC/bfD0wHbbL2xsZE
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(346002)(136003)(39860400002)(376002)(64756008)(66556008)(66946007)(66476007)(33656002)(91956017)(76116006)(83380400001)(66446008)(6506007)(53546011)(186003)(478600001)(316002)(54906003)(4326008)(8676002)(5660300002)(2616005)(8936002)(71200400001)(26005)(6486002)(6916009)(36756003)(86362001)(2906002)(6512007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?cFF2anZKY2dQcFRXUHpGTS92MXNsaXhWQkQwenhaaDdMczB6aWNwQ0thVWdk?=
 =?utf-8?B?RUlHejJQVmNTMTVBTWF3c2ljTm5JNTN5c01ITGhhZUhENWUwRENXUzI1ZkVo?=
 =?utf-8?B?OHgrdnlKY09id0owdUFZalRHQ1hvR3NqUG9ybTB0NXNuSm1od1NHNE1ocWFp?=
 =?utf-8?B?OGJkS1VjMVBGN2Rhdmx2WlM0aGFKQUEwZUhadnNMamxCekdnV0cvbkNtTVQy?=
 =?utf-8?B?TkR4VFY2YTI5ODhtTWR6aUZXSzdNajFYZWtNRjdzTVRnTE9xaVhJSDBVK2Jp?=
 =?utf-8?B?VERYY3pNSW10YkpOOEZib0lIaUNLcU9QbHoxMXRXdjA2R2o3cTJZYnhBR2lY?=
 =?utf-8?B?aDJLVDlEWFU5aXVvakxKcEI4ZExvM0dHQVB3dml0Nm10SFE0ZENvNGd5TzFp?=
 =?utf-8?B?eG5aaFVHMVR3dStGamM0SFVDMUk4WERUSTF1bVFodDlLL0NFbmpUamRYdkYw?=
 =?utf-8?B?K080dGlGWGlvVmUwMGkxVi9jZTVhN3MvM1JlZ2gwZUF5cjB0Q2hGTDdGSEI4?=
 =?utf-8?B?OGJDbEluODRGNUtWMFZYTFE2bGF2dmh2MU95YTRtN0FDaFI1NGpNSjVUZ0tq?=
 =?utf-8?B?cG95c285SDRDQTdRcXNjYjE3d2x6WmJXaDBxN202SFhGeDMrUE1HUmpQcjNl?=
 =?utf-8?B?VFU3Q01FUTMycDlUalgvZ0ZYVlpDNnlsRmhLb3Q0R3hsbWx1c1VRcjRmZzJm?=
 =?utf-8?B?UWNJVnQ4aDJ3VzAwL3ErU2g5OVFBTUxQWXl5WFAyMzhNRjZMd3NGekdtN25u?=
 =?utf-8?B?d3RJRUFKT3Vsd1VqRTRpZEF4UzB0djU2RXRNeVpXMWNFRWkwR1p1WWRpN1p2?=
 =?utf-8?B?NnhIMDYvNnFIZkdMdXlJdnNCcjBkNGF4K1U0ZnQ0dU5BMytIa3ZIeXBhKzFU?=
 =?utf-8?B?bncrRDk1U2Z1b0xjN3Rkb1NmUG9LNU9UelNaemJ0ajhCSHNTYjJmSkE1V1Fw?=
 =?utf-8?B?SURNRTNBa05SbTJHUDVkdER5VXgwaFRodlNGbmxLNnlZaklTM092R0NBMTRY?=
 =?utf-8?B?NmJWbXd2c3ZQbDJDaWdoeXkyaU5BV3VBVEs5WitjeDNLYU9LSHp0YjVLcG14?=
 =?utf-8?B?TnJzVk9paUQwL3pUM05HOUF2dWNQamR3ang0NkNkVCtpMVJOME1pV2gzWGov?=
 =?utf-8?B?Rm43NXB4THhvKytRV0F2c1NFcDExYUVXaVZJeStrUTUweWNybUFzK0o4Zlpr?=
 =?utf-8?B?K3lQS1cwVVVFN0Z5ZDdiMjcwNlVYdmxRdHA2aW9DNTk3Y3ZVSE0vdUl6Y1JM?=
 =?utf-8?B?Yi96R2RKaEZLeGw0bm5nZWFCM2NoUVhneFMwUXRXSEhNKzljeGFiMHVGbkpM?=
 =?utf-8?B?ODIzdk1qTVZ6ZnN5U0RmSUVMK3d1dVhUR1M1Z0NMWDNOQWF1a1ZQYzlWWUNY?=
 =?utf-8?B?d1hjdTczb0dQVU1zMndoeUY5RjJWdUhpdG45TzhTTFJJNUlMcTlDOXIzcUsy?=
 =?utf-8?B?cFNBcThMdUpIcUw5OFVVMk5QeWhnWlJOdTZUc1pDbG80ckc5Rk5LbzZiSVgv?=
 =?utf-8?B?NHNDSTlhVGNWSDNBclNNSE45RVc0dmlBRDhpTVJaUEZPY25wdGt2N0tHRGhJ?=
 =?utf-8?B?YVJ3VFA0SFR2cjVFVVNkNGowTVpkU1hlL2hDYnlsc043RlBWSEtnenVVNWlL?=
 =?utf-8?B?Y2wzWmo4TG92LzkrOVlrWUFJT2s2TFZxeHJOa0FxcjhiWDd0YWQ0Tkc5SmVx?=
 =?utf-8?B?UkozWHBxQzJZQnBEN0QyakJ1d1QyRjQrSVkxOFV2QjYxdG11U1NpVFdoT2cx?=
 =?utf-8?B?M3dqWXJZQXlueit6M09Edmc0bGt6ejJhSm5SKys1WnJwWFcxWjIrOGF1Vm5I?=
 =?utf-8?B?TXpLajNLOFhGS051c3Rtdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B38865BADC611D4F9ABDD4743557A988@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8120a6c7-a4cc-4739-9046-08d8e56a2cad
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2021 15:19:04.7331
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tCG3/Ynd1lO8EGc3IQCe2Y3ejLCyYvs01XjGSowoZxAno0N8EH2Yf9IFhvZLldGv6hshIzRkG7sfryMnnWTzCKnlr2jJa3dwSDjmYWv2cDY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5927
X-OriginatorOrg: citrix.com

DQoNCj4gT24gTWFyIDEyLCAyMDIxLCBhdCAyOjMyIFBNLCBHZW9yZ2UgRHVubGFwIDxnZW9yZ2Uu
ZHVubGFwQGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gDQo+IA0KPj4gT24gRmViIDE2LCAyMDIx
LCBhdCAzOjI5IFBNLCBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOg0KPj4g
DQo+PiBPbiAxNi4wMi4yMDIxIDExOjI4LCBHZW9yZ2UgRHVubGFwIHdyb3RlOg0KPj4+IC0tLSAv
ZGV2L251bGwNCj4+PiArKysgYi9kb2NzL2h5cGVydmlzb3ItZ3VpZGUvbWVtb3J5LWFsbG9jYXRp
b24tZnVuY3Rpb25zLnJzdA0KPj4+IEBAIC0wLDAgKzEsMTE4IEBADQo+Pj4gKy4uIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBDQy1CWS00LjANCj4+PiArDQo+Pj4gK1hlbmhlYXAgbWVtb3J5IGFs
bG9jYXRpb24gZnVuY3Rpb25zDQo+Pj4gKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09DQo+Pj4gKw0KPj4+ICtJbiBnZW5lcmFsIFhlbiBjb250YWlucyB0d28gcG9vbHMgKG9yICJo
ZWFwcyIpIG9mIG1lbW9yeTogdGhlICp4ZW4NCj4+PiAraGVhcCogYW5kIHRoZSAqZG9tIGhlYXAq
LiAgUGxlYXNlIHNlZSB0aGUgY29tbWVudCBhdCB0aGUgdG9wIG9mDQo+Pj4gK2BgeGVuL2NvbW1v
bi9wYWdlX2FsbG9jLmNgYCBmb3IgdGhlIGNhbm9uaWNhbCBleHBsYW5hdGlvbi4NCj4+PiArDQo+
Pj4gK1RoaXMgZG9jdW1lbnQgZGVzY3JpYmVzIHRoZSB2YXJpb3VzIGZ1bmN0aW9ucyBhdmFpbGFi
bGUgdG8gYWxsb2NhdGUNCj4+PiArbWVtb3J5IGZyb20gdGhlIHhlbiBoZWFwOiB0aGVpciBwcm9w
ZXJ0aWVzIGFuZCBydWxlcyBmb3Igd2hlbiB0aGV5IHNob3VsZCBiZQ0KPj4+ICt1c2VkLg0KPj4g
DQo+PiBJcnJlc3BlY3RpdmUgb2YgeW91ciBzdWJzZXF1ZW50IGluZGljYXRpb24gb2YgeW91IGRp
c2xpa2luZyB0aGUNCj4+IHByb3Bvc2FsICh3aGljaCBJIHVuZGVyc3RhbmQgb25seSBhZmZlY3Rz
IHRoZSBndWlkZWxpbmVzIGZ1cnRoZXINCj4+IGRvd24gYW55d2F5KSBJJ2QgbGlrZSB0byBwb2lu
dCBvdXQgdGhhdCB2bWFsbG9jKCkgZG9lcyBub3QNCj4+IGFsbG9jYXRlIGZyb20gdGhlIFhlbiBo
ZWFwLiBUaGVyZWZvcmUgYSBiZW5lZml0IG9mIGFsd2F5cw0KPj4gcmVjb21tZW5kaW5nIHVzZSBv
ZiB4dm1hbGxvYygpIHdvdWxkIGJlIHRoYXQgdGhlIGZ1bmN0aW9uIGNvdWxkDQo+PiBmYWxsIGJh
Y2sgdG8gdm1hbGxvYygpIChhbmQgaGVuY2UgdGhlIGxhcmdlciBkb21haW4gaGVhcCkgd2hlbg0K
Pj4geG1hbGxvYygpIGZhaWxlZC4NCj4gDQo+IE9LLCB0aGF04oCZcyBnb29kIHRvIGtub3cuDQo+
IA0KPiBTbyBqdXN0IHRyeWluZyB0byB0aGluayB0aGlzIHRocm91Z2g6IGFkZHJlc3Mgc3BhY2Ug
aXMgbGltaXRpbmcgZmFjdG9yIGZvciBob3cgYmlnIHRoZSB4ZW5oZWFwIGNhbiBiZSwgcmlnaHQ/
ICBQcmVzdW1hYmx5IOKAnHZtYXDigJ0gc3BhY2UgaXMgYWxzbyBsaW1pdGVkLCBhbmQgd2lsbCBi
ZSBtdWNoIHNtYWxsZXI/ICBTbyBpbiBhIHNlbnNlIHRoZSDigJxmYWxsYmFja+KAnSBpcyBsZXNz
IGFib3V0IGdldHRpbmcgbW9yZSBtZW1vcnksIGJ1dCBhYm91dCB1c2luZyB1cCB0aGF0IGV4dHJh
IGxpdHRsZSBiaXQgb2YgdmlydHVhbCBhZGRyZXNzIHNwYWNlPw0KPiANCj4gQW5vdGhlciBxdWVz
dGlvbiB0aGF0IHJhaXNlczogIEFyZSB0aGVyZSB0aW1lcyB3aGVuIGl04oCZcyBhZHZhbnRhZ2Vv
dXMgdG8gc3BlY2lmeSB3aGljaCBoZWFwIHRvIGFsbG9jYXRlIGZyb20/ICBJZiB0aGVyZSBhcmUg
Z29vZCByZWFzb25zIGZvciBhbGxvY2F0aW9ucyB0byBiZSBpbiB0aGUgeGVuaGVhcCBvciBpbiB0
aGUgZG9taGVhcCAvIHZtYXAgYXJlYSwgdGhlbiB0aGUgZ3VpZGVsaW5lcyBzaG91bGQgcHJvYmFi
bHkgc2F5IHRoYXQgYXMgd2VsbC4NCj4gDQo+IEFuZCwgb2YgY291cnNlLCB3aWxsIHRoZSB3aG9s
ZSBjb25jZXB0IG9mIHRoZSB4ZW5oZWFwIC8gZG9taGVhcCBzcGxpdCBnbyBhd2F5IGlmIHdlIGV2
ZXIgZ2V0IHJpZCBvZiB0aGUgMToxIG1hcD8NCj4gDQo+PiANCj4+PiArVExEUiBndWlkZWxpbmVz
DQo+Pj4gKy0tLS0tLS0tLS0tLS0tLQ0KPj4+ICsNCj4+PiArKiBCeSBkZWZhdWx0LCBgYHh2bWFs
bG9jYGAgKG9yIGl0cyBoZWxwZXIgY29nbmF0ZXMpIHNob3VsZCBiZSB1c2VkDQo+Pj4gKyAgdW5s
ZXNzIHlvdSBrbm93IHlvdSBoYXZlIHNwZWNpZmljIHByb3BlcnRpZXMgdGhhdCBuZWVkIHRvIGJl
IG1ldC4NCj4+PiArDQo+Pj4gKyogSWYgeW91IG5lZWQgbWVtb3J5IHdoaWNoIG5lZWRzIHRvIGJl
IHBoeXNpY2FsbHkgY29udGlndW91cywgYW5kIG1heQ0KPj4+ICsgIGJlIGxhcmdlciB0aGFuIGBg
UEFHRV9TSVpFYGAuLi4NCj4+PiArICANCj4+PiArICAtIC4uLmFuZCBpcyBvcmRlciAyLCB1c2Ug
YGBhbGxvY194ZW5oZWFwX3BhZ2VzYGAuDQo+Pj4gKyAgICANCj4+PiArICAtIC4uLmFuZCBpcyBu
b3Qgb3JkZXIgMiwgdXNlIGBgeG1hbGxvY2BgIChvciBpdHMgaGVscGVyIGNvZ25hdGVzKS4uDQo+
PiANCj4+IElUWU0gImFuIGV4YWN0IHBvd2VyIG9mIDIgbnVtYmVyIG9mIHBhZ2VzIj8NCj4gDQo+
IFllcywgSeKAmWxsIGZpeCB0aGF0Lg0KPiANCj4+IA0KPj4+ICsqIElmIHlvdSBkb24ndCBuZWVk
IG1lbW9yeSB0byBiZSBwaHlzaWNhbGx5IGNvbnRpZ3VvdXMsIGFuZCBrbm93IHRoZQ0KPj4+ICsg
IGFsbG9jYXRpb24gd2lsbCBhbHdheXMgYmUgbGFyZ2VyIHRoYW4gYGBQQUdFX1NJWkVgYCwgeW91
IG1heSB1c2UNCj4+PiArICBgYHZtYWxsb2NgYCAob3Igb25lIG9mIGl0cyBoZWxwZXIgY29nbmF0
ZXMpLg0KPj4+ICsNCj4+PiArKiBJZiB5b3Uga25vdyB0aGF0IGFsbG9jYXRpb24gd2lsbCBhbHdh
eXMgYmUgbGVzcyB0aGFuIGBgUEFHRV9TSVpFYGAsDQo+Pj4gKyAgeW91IG1heSB1c2UgYGB4bWFs
bG9jYGAuDQo+PiANCj4+IEFzIHBlciBKdWxpZW4ncyBhbmQgeW91ciBvd24gcmVwbGllcywgdGhp
cyB3YW50cyB0byBiZSAibWluaW11bQ0KPj4gcG9zc2libGUgcGFnZSBzaXplIiwgd2hpY2ggb2Yg
Y291cnNlIGRlcGVuZHMgb24gd2hlcmUgaW4gdGhlDQo+PiB0cmVlIHRoZSBwaWVjZSBvZiBjb2Rl
IGlzIHRvIGxpdmUuIChJdCB3b3VsZCBiZSAibWF4aW11bQ0KPj4gcG9zc2libGUgcGFnZSBzaXpl
IiBpbiB0aGUgZWFybGllciBwYXJhZ3JhcGguKQ0KPiANCj4gSeKAmWxsIHNlZSBpZiBJIGNhbiBj
bGFyaWZ5IHRoaXMuDQoNCkkgdGhpbmsgdGhlIG9ubHkgd2F5IHRvIGFjdHVhbGx5IG1ha2UgdGhp
cyBjbGVhciB3b3VsZCBiZSB0byBzZXQgc3BlY2lmaWMgdmFsdWVzIGZvciDigJxtaW5pbXVtIHBv
c3NpYmxlIFBBR0VfU0laReKAnSBhbmQg4oCcbWF4aW11bSBwb3NzaWJsZSBQQUdFX1NJWkXigJ0g
4oCUIHZhbHVlcyBwYXN0IHdoaWNoIHRoZSBtYWludGFpbmVycyBvZiB0aGUgYXJjaGl0ZWN0dXJl
IGFyZSBoYXBweSB0byBkbyBzb21lIHNvcnQgb2YgYXVkaXQgaWYgUEFHRV9TSVpFIGV2ZXIgZXhj
ZWVkcyB0aGVtLg0KDQogLUdlb3JnZQ0KDQo=

