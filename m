Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1F52346D8
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 15:27:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1V3Y-0005nY-H4; Fri, 31 Jul 2020 13:26:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wy6+=BK=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1k1V3X-0005nT-6q
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 13:26:39 +0000
X-Inumbo-ID: 75eb8af0-d331-11ea-8e37-bc764e2007e4
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.50]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 75eb8af0-d331-11ea-8e37-bc764e2007e4;
 Fri, 31 Jul 2020 13:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+e0TkPHd8LO8oqcEPGNyoRt32RlB9v9mzoALWvWj3fs=;
 b=AJkg8t8k1zVUi1BWrve7li9wtbwUb9r+W15u2JckcbNLWZy+yBd6xUdn4Je0S1nfLba7r9B+I2M8/CLnzRB1t+LdlgqTn1DAKLOv7J5NtF0BIEm4HNDhGCBQxVtjufq0Bv3prU5rRodXvaAnvi07RV2VKkeluerw5i4j0XI9OCg=
Received: from AM6P195CA0021.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::34)
 by AM0PR08MB3795.eurprd08.prod.outlook.com (2603:10a6:208:105::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Fri, 31 Jul
 2020 13:26:34 +0000
Received: from VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::7) by AM6P195CA0021.outlook.office365.com
 (2603:10a6:209:81::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17 via Frontend
 Transport; Fri, 31 Jul 2020 13:26:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT010.mail.protection.outlook.com (10.152.18.113) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.20 via Frontend Transport; Fri, 31 Jul 2020 13:26:34 +0000
Received: ("Tessian outbound 1c27ecaec3d6:v62");
 Fri, 31 Jul 2020 13:26:34 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0e1060d1bee04075
X-CR-MTA-TID: 64aa7808
Received: from ba640e12fa39.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 46445FB1-5B50-44DC-A7F1-F4152961CFF8.1; 
 Fri, 31 Jul 2020 13:26:28 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ba640e12fa39.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 31 Jul 2020 13:26:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MATKNvGfuKl3sUUFmEAFi3iAac0WsGC5BgQTdQc8NROU1rFoh4DTbfrUAhqzeu0QW8LHRwuIHMGKdjeY2DYRpe8zFWClddSDeNu65yLdhePNW3ksAvneiduj4wYGcAvnVxFCgomyFAYllVwkCSFtkbRN0OI74PwARsGpEvILLccow6dmH01Nu3jbCz4RSbI8Z4t7d7LY3DbQiqKQsR32rtUFuWEtnHBwdtHU9H9K2qVE7JMbk7KiByG5AlOFehwJHyod3LdDfoz3dxF0Ecrk022zzojIcONSu9PvRlQCUkhN9RUsoG63yf3M3dpU6xjYGZ03XHJN1p4rMFt2zSyWiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+e0TkPHd8LO8oqcEPGNyoRt32RlB9v9mzoALWvWj3fs=;
 b=QeqR9geuF2xySfF3LAH6EhR2STv8/Qk8u81lwCIaozW4bF4zBpFyMSJhtbP5dz4RHr6ebrhLjfM6Dj2AhGae+FzDKrv0lJC2cyD9c6tqc6yM6GFl/znsfx+b8MYIJYYSSUXKk5qeLRcXLfimwGbCu+bXTVy/y0pURQ14/28tuS+K/P+YJ5cH8ZPn12vfKbF4LNw/o77aAbRxot3OI/TauqDw/K0KJ6BMe1doSREo1T8cO9O0c0ArLSdoL6Rq3jaLO2ITWrMEGr1mB9l4bKdP9ZHKE06O6UhGlzPlOhQrueaY+2xWjwGMRkHMayoCosl07zAGO57N0u6gVRIsGS71KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+e0TkPHd8LO8oqcEPGNyoRt32RlB9v9mzoALWvWj3fs=;
 b=AJkg8t8k1zVUi1BWrve7li9wtbwUb9r+W15u2JckcbNLWZy+yBd6xUdn4Je0S1nfLba7r9B+I2M8/CLnzRB1t+LdlgqTn1DAKLOv7J5NtF0BIEm4HNDhGCBQxVtjufq0Bv3prU5rRodXvaAnvi07RV2VKkeluerw5i4j0XI9OCg=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB4363.eurprd08.prod.outlook.com (2603:10a6:10:ce::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Fri, 31 Jul
 2020 13:26:25 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3239.020; Fri, 31 Jul 2020
 13:26:25 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3] xen/arm: Convert runstate address during hypcall
Thread-Topic: [PATCH v3] xen/arm: Convert runstate address during hypcall
Thread-Index: AQHWZluWPRKsKyuZRkCQVDwO60tsvakgmVkAgAEWTwA=
Date: Fri, 31 Jul 2020 13:26:24 +0000
Message-ID: <CB9F22FE-BEFF-4A36-BC81-A18F9E0F9D7C@arm.com>
References: <3911d221ce9ed73611b93aa437b9ca227d6aa201.1596099067.git.bertrand.marquis@arm.com>
 <f48f81d5-589e-3f75-1044-583114bf497e@xen.org>
In-Reply-To: <f48f81d5-589e-3f75-1044-583114bf497e@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [90.126.203.125]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 385c49d8-459b-4151-c366-08d83555585e
x-ms-traffictypediagnostic: DBBPR08MB4363:|AM0PR08MB3795:
X-Microsoft-Antispam-PRVS: <AM0PR08MB3795FF18A2B5608B7EBEA6959D4E0@AM0PR08MB3795.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: csBgYatQGLrPMwRkqp0FUudkOgiavZu2hDuM+88LG9CLsAHWwxb/8H59i6WUi+pL8hvsOA1EIkyUPZ3gJhUnNsrKr2HTnSpRAAMTotJg7v6PqsxzHxE9kH09kgJpFCSt4GOuQwLRg6HrT/Vv8T1CBf8HyOoTzfo5Jwx0ZKYvIWCzKG+j5sD8QoWm+fcjbJRwiEXquvKlBC8fDtW94Npd7rIdgGMMumaPHPb7UzkV6KjcevQ5cdpo00QKJ2nof7QRZRwhJqUuC7dTfywKzGGp2o9kqG4MkBy/zNrA+tlgr7ZkM2trjZmzJxf9XoUAPgw/FWfdiPX0vST94q9bam47dQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(366004)(396003)(376002)(136003)(346002)(39860400002)(71200400001)(4326008)(33656002)(30864003)(6486002)(5660300002)(6512007)(8936002)(54906003)(316002)(2616005)(478600001)(66556008)(66446008)(186003)(2906002)(91956017)(76116006)(66946007)(86362001)(8676002)(66476007)(64756008)(53546011)(26005)(6506007)(7416002)(6916009)(36756003)(83380400001)(579004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: l3be3GSadfM40A/O7G4ca1rxYdqDj3uNrftyYnitJiYyTQvd1BhssonHGujA8RBNinI55eZwjwTTDzjarAzsnpWZhEOFCyqetXYy/E8a9xvV7675SML/q/iAIgOpHWd8MBKAbJSBCgqmAAfPpKq0IVpomn3Trnkzpz5Rfg/ett5tAlX967u8C/bwD8hivhL0iyiriwbajafJFChAvhA2HJQkNs9m0P5moFOMORSmmOZgCFpHY1Wv8UYvG1x4IXElWT4UvN8/TAgBgVqYzS1LthJ8rrkyzvFTG+uQUW/eSwcmWDR9KBSk/avMBjCSQ2g+giHTqMMkUM1oIFdX1rgRjBv/mYYgpGe6oS1waGj/pEhM/0Bans+XFl4JTyWa3sUHkdtAODpd5ug7uOGwOaBnvJuPVPKZGgzE2PGLp1tXBptGiSgGmATWjjiy42fsDvjMgFTDA6BqBSe6/rTViPmq67OqKQq9bF5w/4WwJqRUYWpF86Y4g400VIymRVdpw6OJTlq+4qDOClskNZ75hpRQF7VBewruZSVLIhHho4ruKSbk/mNvz4szoAjnMCH5FzyX/jNZR/zoL6riE6O5W+9JxXzShILG1ruEI5gz9s+x5qlI38KgwTe4MciVUxtWUuYz8wGuwFb/ZFlgroCREMzcZA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <D0E0AC33E056DA469B4840D44543D6E0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4363
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3fe3aebe-a196-4cb5-ab2a-08d8355552cb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0OR3hb3hUI6rNUf3swFdRDALDgGtaLP22SfxVJ6ZrSInyB/4iOvVIS10cT08181OnlchWnRGxbXMlrFFYOQrDAqlZAa39MrEMna+rsz/4C0K9eyiyZ28d8lwvYaPm4JDLCw8tgXyGlKhqypyTpQ9W24L5l6Ep6d80BgXsNyMMYCOCAGXHGdwHY/GiJR67P3aDisKo/A3derjpPBiVPaFnhiyBbLL9WtnyhKf2pXEPHtMnO9ptzXJuvcmzjnaTI5q7K91u9DQhuQR2zXHgbwtrYRsa/5etBhKUNN4yBfS4B5TcrZjqwY1lmLQPTwh77+ZZBRtv2NilUO6NixUYD/qFEvCCQgksIjVS85tOA53SMhquzXmBgvXYsNvdj374fxEClUASK5grVsjuc1YdQYu9g==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(346002)(376002)(136003)(39860400002)(396003)(46966005)(8936002)(107886003)(316002)(33656002)(83380400001)(4326008)(54906003)(70586007)(6862004)(86362001)(478600001)(8676002)(36756003)(30864003)(336012)(82740400003)(47076004)(6486002)(70206006)(6512007)(36906005)(2616005)(53546011)(5660300002)(356005)(26005)(2906002)(6506007)(186003)(81166007)(82310400002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2020 13:26:34.2513 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 385c49d8-459b-4151-c366-08d83555585e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3795
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Sorry missed some points in my previous answer.

> On 30 Jul 2020, at 22:50, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> To avoid extra work on your side, I would recommend to wait a bit before =
sending a new version. It would be good to at least settle the conversation=
 in v2 regarding the approach taken.
>=20
> On 30/07/2020 11:24, Bertrand Marquis wrote:
>> At the moment on Arm, a Linux guest running with KTPI enabled will
>> cause the following error when a context switch happens in user mode:
>> (XEN) p2m.c:1890: d1v0: Failed to walk page-table va 0xffffff837ebe0cd0
>> The error is caused by the virtual address for the runstate area
>> registered by the guest only being accessible when the guest is running
>> in kernel space when KPTI is enabled.
>> To solve this issue, this patch is doing the translation from virtual
>> address to physical address during the hypercall and mapping the
>> required pages using vmap. This is removing the conversion from virtual
>> to physical address during the context switch which is solving the
>> problem with KPTI.
>=20
> To echo what Jan said on the previous version, this is a change in a stab=
le ABI and therefore may break existing guest. FAOD, I agree in principle w=
ith the idea. However, we want to explain why breaking the ABI is the *only=
* viable solution.
>=20
> From my understanding, it is not possible to fix without an ABI breakage =
because the hypervisor doesn't know when the guest will switch back from us=
erspace to kernel space. The risk is the information provided by the runsta=
te wouldn't contain accurate information and could affect how the guest han=
dle stolen time.
>=20
> Additionally there are a few issues with the current interface:
>   1) It is assuming the virtual address cannot be re-used by the userspac=
e. Thanksfully Linux have a split address space. But this may change with K=
PTI in place.
>   2) When update the page-tables, the guest has to go through an invalid =
mapping. So the translation may fail at any point.
>=20
> IOW, the existing interface can lead to random memory corruption and inac=
urracy of the stolen time.
>=20
>> This is done only on arm architecture, the behaviour on x86 is not
>> modified by this patch and the address conversion is done as before
>> during each context switch.
>> This is introducing several limitations in comparison to the previous
>> behaviour (on arm only):
>> - if the guest is remapping the area at a different physical address Xen
>> will continue to update the area at the previous physical address. As
>> the area is in kernel space and usually defined as a global variable thi=
s
>> is something which is believed not to happen. If this is required by a
>> guest, it will have to call the hypercall with the new area (even if it
>> is at the same virtual address).
>> - the area needs to be mapped during the hypercall. For the same reasons
>> as for the previous case, even if the area is registered for a different
>> vcpu. It is believed that registering an area using a virtual address
>> unmapped is not something done.
>=20
> This is not clear whether the virtual address refer to the current vCPU o=
r the vCPU you register the runstate for. From the past discussion, I think=
 you refer to the former. It would be good to clarify.
>=20
> Additionally, all the new restrictions should be documented in the public=
 interface. So an OS developper can find the differences between the archit=
ectures.
>=20
> To answer Jan's concern, we certainly don't know all the guest OSes exist=
ing, however we also need to balance the benefit for a large majority of th=
e users.
>=20
> From previous discussion, the current approach was deemed to be acceptabl=
e on Arm and, AFAICT, also x86 (see [1]).
>=20
> TBH, I would rather see the approach to be common. For that, we would an =
agreement from Andrew and Jan in the approach here. Meanwhile, I think this=
 is the best approach to address the concern from Arm users.
>=20
>> inline functions in headers could not be used as the architecture
>> domain.h is included before the global domain.h making it impossible
>> to use the struct vcpu inside the architecture header.
>> This should not have any performance impact as the hypercall is only
>> called once per vcpu usually.
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>>   Changes in v2
>>     - use vmap to map the pages during the hypercall.
>>     - reintroduce initial copy during hypercall.
>>   Changes in v3
>>     - Fix Coding style
>>     - Fix vaddr printing on arm32
>>     - use write_atomic to modify state_entry_time update bit (only
>>     in guest structure as the bit is not used inside Xen copy)
>> ---
>>  xen/arch/arm/domain.c        | 161 ++++++++++++++++++++++++++++++-----
>>  xen/arch/x86/domain.c        |  29 ++++++-
>>  xen/arch/x86/x86_64/domain.c |   4 +-
>>  xen/common/domain.c          |  19 ++---
>>  xen/include/asm-arm/domain.h |   9 ++
>>  xen/include/asm-x86/domain.h |  16 ++++
>>  xen/include/xen/domain.h     |   5 ++
>>  xen/include/xen/sched.h      |  16 +---
>>  8 files changed, 206 insertions(+), 53 deletions(-)
>> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
>> index 31169326b2..8b36946017 100644
>> --- a/xen/arch/arm/domain.c
>> +++ b/xen/arch/arm/domain.c
>> @@ -19,6 +19,7 @@
>>  #include <xen/sched.h>
>>  #include <xen/softirq.h>
>>  #include <xen/wait.h>
>> +#include <xen/vmap.h>
>>    #include <asm/alternative.h>
>>  #include <asm/cpuerrata.h>
>> @@ -275,36 +276,156 @@ static void ctxt_switch_to(struct vcpu *n)
>>      virt_timer_restore(n);
>>  }
>>  -/* Update per-VCPU guest runstate shared memory area (if registered). =
*/
>> -static void update_runstate_area(struct vcpu *v)
>> +static void cleanup_runstate_vcpu_locked(struct vcpu *v)
>>  {
>> -    void __user *guest_handle =3D NULL;
>> +    if ( v->arch.runstate_guest )
>> +    {
>> +        vunmap((void *)((unsigned long)v->arch.runstate_guest & PAGE_MA=
SK));
>> +
>> +        put_page(v->arch.runstate_guest_page[0]);
>> +
>> +        if ( v->arch.runstate_guest_page[1] )
>> +            put_page(v->arch.runstate_guest_page[1]);
>> +
>> +        v->arch.runstate_guest =3D NULL;
>> +    }
>> +}
>> +
>> +void arch_vcpu_cleanup_runstate(struct vcpu *v)
>> +{
>> +    spin_lock(&v->arch.runstate_guest_lock);
>> +
>> +    cleanup_runstate_vcpu_locked(v);
>> +
>> +    spin_unlock(&v->arch.runstate_guest_lock);
>> +}
>> +
>> +static int setup_runstate_vcpu_locked(struct vcpu *v, vaddr_t vaddr)
>> +{
>> +    unsigned int offset;
>> +    mfn_t mfn[2];
>> +    struct page_info *page;
>> +    unsigned int numpages;
>>      struct vcpu_runstate_info runstate;
>> +    void *p;
>>  -    if ( guest_handle_is_null(runstate_guest(v)) )
>> -        return;
>> +    /* user can pass a NULL address to unregister a previous area */
>> +    if ( vaddr =3D=3D 0 )
>> +        return 0;
>> +
>> +    offset =3D vaddr & ~PAGE_MASK;
>> +
>> +    /* provided address must be aligned to a 64bit */
>> +    if ( offset % alignof(struct vcpu_runstate_info) )
>=20
> This new restriction wants to be explained in the commit message and publ=
ic header.

ok

>=20
>> +    {
>> +        gprintk(XENLOG_WARNING, "Cannot map runstate pointer at 0x%"PRI=
vaddr
>> +                ": Invalid offset\n", vaddr);
>=20
> We usually enforce 80 character per lines except for format string. So it=
 is easier to grep them in the code.

Ok i will fix this one and the following ones.
But here PRIvaddr would break any attempt to grep something in fact.

>=20
>> +        return -EINVAL;
>> +    }
>> +
>> +    page =3D get_page_from_gva(v, vaddr, GV2M_WRITE);
>> +    if ( !page )
>> +    {
>> +        gprintk(XENLOG_WARNING, "Cannot map runstate pointer at 0x%"PRI=
vaddr
>> +                ": Page is not mapped\n", vaddr);
>> +        return -EINVAL;
>> +    }
>> +
>> +    mfn[0] =3D page_to_mfn(page);
>> +    v->arch.runstate_guest_page[0] =3D page;
>> +
>> +    if ( offset > (PAGE_SIZE - sizeof(struct vcpu_runstate_info)) )
>> +    {
>> +        /* guest area is crossing pages */
>> +        page =3D get_page_from_gva(v, vaddr + PAGE_SIZE, GV2M_WRITE);
>> +        if ( !page )
>> +        {
>> +            put_page(v->arch.runstate_guest_page[0]);
>> +            gprintk(XENLOG_WARNING,
>> +                    "Cannot map runstate pointer at 0x%"PRIvaddr
>> +                    ": 2nd Page is not mapped\n", vaddr);
>> +            return -EINVAL;
>> +        }
>> +        mfn[1] =3D page_to_mfn(page);
>> +        v->arch.runstate_guest_page[1] =3D page;
>> +        numpages =3D 2;
>> +    }
>> +    else
>> +    {
>> +        v->arch.runstate_guest_page[1] =3D NULL;
>> +        numpages =3D 1;
>> +    }
>>  -    memcpy(&runstate, &v->runstate, sizeof(runstate));
>> +    p =3D vmap(mfn, numpages);
>> +    if ( !p )
>> +    {
>> +        put_page(v->arch.runstate_guest_page[0]);
>> +        if ( numpages =3D=3D 2 )
>> +            put_page(v->arch.runstate_guest_page[1]);
>>  -    if ( VM_ASSIST(v->domain, runstate_update_flag) )
>> +        gprintk(XENLOG_WARNING, "Cannot map runstate pointer at 0x%"PRI=
vaddr
>> +                ": vmap error\n", vaddr);
>> +        return -EINVAL;
>> +    }
>> +
>> +    v->arch.runstate_guest =3D p + offset;
>> +
>> +    if (v =3D=3D current)
>> +        memcpy(v->arch.runstate_guest, &v->runstate, sizeof(v->runstate=
));
>> +    else
>>      {
>> -        guest_handle =3D &v->runstate_guest.p->state_entry_time + 1;
>> -        guest_handle--;
>> -        runstate.state_entry_time |=3D XEN_RUNSTATE_UPDATE;
>> -        __raw_copy_to_guest(guest_handle,
>> -                            (void *)(&runstate.state_entry_time + 1) - =
1, 1);
>> -        smp_wmb();
>> +        vcpu_runstate_get(v, &runstate);
>> +        memcpy(v->arch.runstate_guest, &runstate, sizeof(v->runstate));
>>      }
>>  -    __copy_to_guest(runstate_guest(v), &runstate, 1);
>> +    return 0;
>> +}
>> +
>> +int arch_vcpu_setup_runstate(struct vcpu *v,
>> +                             struct vcpu_register_runstate_memory_area =
area)
>> +{
>> +    int rc;
>> +
>> +    spin_lock(&v->arch.runstate_guest_lock);
>> +
>> +    /* cleanup if we are recalled */
>> +    cleanup_runstate_vcpu_locked(v);
>> +
>> +    rc =3D setup_runstate_vcpu_locked(v, (vaddr_t)area.addr.v);
>> +
>> +    spin_unlock(&v->arch.runstate_guest_lock);
>>  -    if ( guest_handle )
>> +    return rc;
>> +}
>> +
>> +
>> +/* Update per-VCPU guest runstate shared memory area (if registered). *=
/
>> +static void update_runstate_area(struct vcpu *v)
>> +{
>> +    spin_lock(&v->arch.runstate_guest_lock);
>> +
>> +    if ( v->arch.runstate_guest )
>>      {
>> -        runstate.state_entry_time &=3D ~XEN_RUNSTATE_UPDATE;
>> -        smp_wmb();
>> -        __raw_copy_to_guest(guest_handle,
>> -                            (void *)(&runstate.state_entry_time + 1) - =
1, 1);
>> +        if ( VM_ASSIST(v->domain, runstate_update_flag) )
>> +        {
>> +            v->runstate.state_entry_time |=3D XEN_RUNSTATE_UPDATE;
>> +            write_atomic(&(v->arch.runstate_guest->state_entry_time),
>> +                    v->runstate.state_entry_time);
>=20
> NIT: You want to indent v-> at the same level as the argument from the fi=
rst line.

Ok

>=20
> Also, I think you are missing a smp_wmb() here.

The atomic operation itself would not need a barrier.
I do not see why you think a barrier is needed here.
For the internal structure ?

>=20
>> +        }
>> +
>> +        memcpy(v->arch.runstate_guest, &v->runstate, sizeof(v->runstate=
));
>> +
>> +        if ( VM_ASSIST(v->domain, runstate_update_flag) )
>> +        {
>> +            /* copy must be done before switching the bit */
>> +            smp_wmb();
>> +            v->runstate.state_entry_time &=3D ~XEN_RUNSTATE_UPDATE;
>> +            write_atomic(&(v->arch.runstate_guest->state_entry_time),
>> +                    v->runstate.state_entry_time);
>=20
> Same remark for the indentation.
Ok

>=20
>> +        }
>>      }
>> +
>> +    spin_unlock(&v->arch.runstate_guest_lock);
>>  }
>>    static void schedule_tail(struct vcpu *prev)
>> @@ -560,6 +681,8 @@ int arch_vcpu_create(struct vcpu *v)
>>      v->arch.saved_context.sp =3D (register_t)v->arch.cpu_info;
>>      v->arch.saved_context.pc =3D (register_t)continue_new_vcpu;
>>  +    spin_lock_init(&v->arch.runstate_guest_lock);
>> +
>>      /* Idle VCPUs don't need the rest of this setup */
>>      if ( is_idle_vcpu(v) )
>>          return rc;
>> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
>> index fee6c3931a..b9b81e94e5 100644
>> --- a/xen/arch/x86/domain.c
>> +++ b/xen/arch/x86/domain.c
>> @@ -1642,6 +1642,29 @@ void paravirt_ctxt_switch_to(struct vcpu *v)
>>          wrmsr_tsc_aux(v->arch.msrs->tsc_aux);
>>  }
>>  +int arch_vcpu_setup_runstate(struct vcpu *v,
>> +                             struct vcpu_register_runstate_memory_area =
area)
>> +{
>> +    struct vcpu_runstate_info runstate;
>> +
>> +    runstate_guest(v) =3D area.addr.h;
>> +
>> +    if ( v =3D=3D current )
>> +        __copy_to_guest(runstate_guest(v), &v->runstate, 1);
>> +    else
>> +    {
>> +        vcpu_runstate_get(v, &runstate);
>> +        __copy_to_guest(runstate_guest(v), &runstate, 1);
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +void arch_vcpu_cleanup_runstate(struct vcpu *v)
>> +{
>> +    set_xen_guest_handle(runstate_guest(v), NULL);
>> +}
>> +
>>  /* Update per-VCPU guest runstate shared memory area (if registered). *=
/
>>  bool update_runstate_area(struct vcpu *v)
>>  {
>> @@ -1660,8 +1683,8 @@ bool update_runstate_area(struct vcpu *v)
>>      if ( VM_ASSIST(v->domain, runstate_update_flag) )
>>      {
>>          guest_handle =3D has_32bit_shinfo(v->domain)
>> -            ? &v->runstate_guest.compat.p->state_entry_time + 1
>> -            : &v->runstate_guest.native.p->state_entry_time + 1;
>> +            ? &v->arch.runstate_guest.compat.p->state_entry_time + 1
>> +            : &v->arch.runstate_guest.native.p->state_entry_time + 1;
>>          guest_handle--;
>>          runstate.state_entry_time |=3D XEN_RUNSTATE_UPDATE;
>>          __raw_copy_to_guest(guest_handle,
>> @@ -1674,7 +1697,7 @@ bool update_runstate_area(struct vcpu *v)
>>          struct compat_vcpu_runstate_info info;
>>            XLAT_vcpu_runstate_info(&info, &runstate);
>> -        __copy_to_guest(v->runstate_guest.compat, &info, 1);
>> +        __copy_to_guest(v->arch.runstate_guest.compat, &info, 1);
>>          rc =3D true;
>>      }
>>      else
>> diff --git a/xen/arch/x86/x86_64/domain.c b/xen/arch/x86/x86_64/domain.c
>> index c46dccc25a..b879e8dd2c 100644
>> --- a/xen/arch/x86/x86_64/domain.c
>> +++ b/xen/arch/x86/x86_64/domain.c
>> @@ -36,7 +36,7 @@ arch_compat_vcpu_op(
>>              break;
>>            rc =3D 0;
>> -        guest_from_compat_handle(v->runstate_guest.compat, area.addr.h)=
;
>> +        guest_from_compat_handle(v->arch.runstate_guest.compat, area.ad=
dr.h);
>>            if ( v =3D=3D current )
>>          {
>> @@ -49,7 +49,7 @@ arch_compat_vcpu_op(
>>              vcpu_runstate_get(v, &runstate);
>>              XLAT_vcpu_runstate_info(&info, &runstate);
>>          }
>> -        __copy_to_guest(v->runstate_guest.compat, &info, 1);
>> +        __copy_to_guest(v->arch.runstate_guest.compat, &info, 1);
>>            break;
>>      }
>> diff --git a/xen/common/domain.c b/xen/common/domain.c
>> index f0f9c62feb..739c6b7b62 100644
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -727,7 +727,10 @@ int domain_kill(struct domain *d)
>>          if ( cpupool_move_domain(d, cpupool0) )
>>              return -ERESTART;
>>          for_each_vcpu ( d, v )
>> +        {
>> +            arch_vcpu_cleanup_runstate(v);
>>              unmap_vcpu_info(v);
>> +        }
>>          d->is_dying =3D DOMDYING_dead;
>>          /* Mem event cleanup has to go here because the rings
>>           * have to be put before we call put_domain. */
>> @@ -1167,7 +1170,7 @@ int domain_soft_reset(struct domain *d)
>>        for_each_vcpu ( d, v )
>>      {
>> -        set_xen_guest_handle(runstate_guest(v), NULL);
>> +        arch_vcpu_cleanup_runstate(v);
>>          unmap_vcpu_info(v);
>>      }
>>  @@ -1494,7 +1497,6 @@ long do_vcpu_op(int cmd, unsigned int vcpuid, XEN=
_GUEST_HANDLE_PARAM(void) arg)
>>      case VCPUOP_register_runstate_memory_area:
>>      {
>>          struct vcpu_register_runstate_memory_area area;
>> -        struct vcpu_runstate_info runstate;
>>            rc =3D -EFAULT;
>>          if ( copy_from_guest(&area, arg, 1) )
>> @@ -1503,18 +1505,7 @@ long do_vcpu_op(int cmd, unsigned int vcpuid, XEN=
_GUEST_HANDLE_PARAM(void) arg)
>>          if ( !guest_handle_okay(area.addr.h, 1) )
>>              break;
>>  -        rc =3D 0;
>> -        runstate_guest(v) =3D area.addr.h;
>> -
>> -        if ( v =3D=3D current )
>> -        {
>> -            __copy_to_guest(runstate_guest(v), &v->runstate, 1);
>> -        }
>> -        else
>> -        {
>> -            vcpu_runstate_get(v, &runstate);
>> -            __copy_to_guest(runstate_guest(v), &runstate, 1);
>> -        }
>> +        rc =3D arch_vcpu_setup_runstate(v, area);
>>            break;
>>      }
>> diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
>> index 6819a3bf38..2f62c3e8f5 100644
>> --- a/xen/include/asm-arm/domain.h
>> +++ b/xen/include/asm-arm/domain.h
>> @@ -204,6 +204,15 @@ struct arch_vcpu
>>       */
>>      bool need_flush_to_ram;
>>  +    /* runstate guest lock */
>> +    spinlock_t runstate_guest_lock;
>> +
>> +    /* runstate guest info */
>> +    struct vcpu_runstate_info *runstate_guest;
>> +
>> +    /* runstate pages mapped for runstate_guest */
>> +    struct page_info *runstate_guest_page[2];
>> +
>>  }  __cacheline_aligned;
>>    void vcpu_show_execution_state(struct vcpu *);
>> diff --git a/xen/include/asm-x86/domain.h b/xen/include/asm-x86/domain.h
>> index 635335634d..007ccfbf9f 100644
>> --- a/xen/include/asm-x86/domain.h
>> +++ b/xen/include/asm-x86/domain.h
>> @@ -11,6 +11,11 @@
>>  #include <asm/x86_emulate.h>
>>  #include <public/vcpu.h>
>>  #include <public/hvm/hvm_info_table.h>
>> +#ifdef CONFIG_COMPAT
>> +#include <compat/vcpu.h>
>> +DEFINE_XEN_GUEST_HANDLE(vcpu_runstate_info_compat_t);
>> +#endif
>> +
>>    #define has_32bit_shinfo(d)    ((d)->arch.has_32bit_shinfo)
>>  @@ -638,6 +643,17 @@ struct arch_vcpu
>>      struct {
>>          bool next_interrupt_enabled;
>>      } monitor;
>> +
>> +#ifndef CONFIG_COMPAT
>> +# define runstate_guest(v) ((v)->arch.runstate_guest)
>> +    XEN_GUEST_HANDLE(vcpu_runstate_info_t) runstate_guest; /* guest add=
ress */
>> +#else
>> +# define runstate_guest(v) ((v)->arch.runstate_guest.native)
>> +    union {
>> +        XEN_GUEST_HANDLE(vcpu_runstate_info_t) native;
>> +        XEN_GUEST_HANDLE(vcpu_runstate_info_compat_t) compat;
>> +    } runstate_guest;
>> +#endif
>>  };
>>    struct guest_memory_policy
>> diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
>> index 7e51d361de..5e8cbba31d 100644
>> --- a/xen/include/xen/domain.h
>> +++ b/xen/include/xen/domain.h
>> @@ -5,6 +5,7 @@
>>  #include <xen/types.h>
>>    #include <public/xen.h>
>> +#include <public/vcpu.h>
>>  #include <asm/domain.h>
>>  #include <asm/numa.h>
>>  @@ -63,6 +64,10 @@ void arch_vcpu_destroy(struct vcpu *v);
>>  int map_vcpu_info(struct vcpu *v, unsigned long gfn, unsigned offset);
>>  void unmap_vcpu_info(struct vcpu *v);
>>  +int arch_vcpu_setup_runstate(struct vcpu *v,
>> +                             struct vcpu_register_runstate_memory_area =
area);
>> +void arch_vcpu_cleanup_runstate(struct vcpu *v);
>> +
>>  int arch_domain_create(struct domain *d,
>>                         struct xen_domctl_createdomain *config);
>>  diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
>> index ac53519d7f..fac030fb83 100644
>> --- a/xen/include/xen/sched.h
>> +++ b/xen/include/xen/sched.h
>> @@ -29,11 +29,6 @@
>>  #include <public/vcpu.h>
>>  #include <public/event_channel.h>
>>  -#ifdef CONFIG_COMPAT
>> -#include <compat/vcpu.h>
>> -DEFINE_XEN_GUEST_HANDLE(vcpu_runstate_info_compat_t);
>> -#endif
>> -
>>  /*
>>   * Stats
>>   *
>> @@ -166,16 +161,7 @@ struct vcpu
>>      struct sched_unit *sched_unit;
>>        struct vcpu_runstate_info runstate;
>> -#ifndef CONFIG_COMPAT
>> -# define runstate_guest(v) ((v)->runstate_guest)
>> -    XEN_GUEST_HANDLE(vcpu_runstate_info_t) runstate_guest; /* guest add=
ress */
>> -#else
>> -# define runstate_guest(v) ((v)->runstate_guest.native)
>> -    union {
>> -        XEN_GUEST_HANDLE(vcpu_runstate_info_t) native;
>> -        XEN_GUEST_HANDLE(vcpu_runstate_info_compat_t) compat;
>> -    } runstate_guest; /* guest address */
>> -#endif
>> +
>>      unsigned int     new_state;
>>        /* Has the FPU been initialised? */
>=20
> [1] <b6511a29-35a4-a1d0-dd29-7de4103ec98e@citrix.com>
>=20
>=20
> --=20
> Julien Grall


