Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A63C6415CBA
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 13:20:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193757.345161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTMmB-0003ak-4J; Thu, 23 Sep 2021 11:20:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193757.345161; Thu, 23 Sep 2021 11:20:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTMmB-0003XX-0o; Thu, 23 Sep 2021 11:20:27 +0000
Received: by outflank-mailman (input) for mailman id 193757;
 Thu, 23 Sep 2021 11:20:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y7SS=ON=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mTMm8-0003Qq-LL
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 11:20:24 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0d::60d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 916ab67a-bcb6-4f4c-9e93-14184f5cbd2a;
 Thu, 23 Sep 2021 11:20:18 +0000 (UTC)
Received: from AM5PR0201CA0002.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::12) by VI1PR08MB4301.eurprd08.prod.outlook.com
 (2603:10a6:803:f7::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Thu, 23 Sep
 2021 11:20:00 +0000
Received: from AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::a) by AM5PR0201CA0002.outlook.office365.com
 (2603:10a6:203:3d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 11:20:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT062.mail.protection.outlook.com (10.152.17.120) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 11:20:00 +0000
Received: ("Tessian outbound 010023020eef:v103");
 Thu, 23 Sep 2021 11:19:58 +0000
Received: from 3195baacd5a9.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 713CBD3E-6E15-47F2-AA04-266BDB8E2876.1; 
 Thu, 23 Sep 2021 11:19:42 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3195baacd5a9.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 11:19:42 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM5PR0801MB1939.eurprd08.prod.outlook.com (2603:10a6:203:4c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Thu, 23 Sep
 2021 11:19:30 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0%7]) with mapi id 15.20.4544.014; Thu, 23 Sep 2021
 11:19:30 +0000
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
X-Inumbo-ID: 916ab67a-bcb6-4f4c-9e93-14184f5cbd2a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lj1GC+tv5scfGOtQDJe05RRjCb7Emx137fY9thBEOkU=;
 b=v2cN8SwNLER6mQ50fMVQIvJn6rLZaRzzazk3IWdzqGPQn9uR/bGhCJisHXZxjprQ5L/SFIyCUTE40Lp6OdyGdAqXaBW36ueeBCy04For9GtYbLj1J7+FTqx3Ebrwi9j4EtIERqt/m6YH6kNoqa14No0oqYAmomF14eGCZYjZWPE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: e8861d3b3784b02b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kmBIiDDaMiUWRQCd6cISu4L0yI+u1DVtbVfSd76XeTFh+ApwNnPMgNdgMXjOxqQCK2xmfPh9kuCcS5omwutph1BUYkI92xfFMky6NmqAFb60og3DO6JXy9GymH3stg0aNU26Wlpxnlv/UTWpSh9sfx29U4t8ghl55n0zssIc7FGUYzcKQBhEblmOuHxeGAwpmz6Hz1I+Dadfk5fQnNumCW5EEWgyv6mh8IvX5WS+k9iGkLB5SbdJunEpW8ATclUBaqBbEwHwvmGJf46y6Dn8rpQQ2I/aZRKC8QQqtH7Z+ZiL2rOL/XbWQACiRGJw6buWvN/7filwlGE8FHo62bSOEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Lj1GC+tv5scfGOtQDJe05RRjCb7Emx137fY9thBEOkU=;
 b=LG9pCO9Nqk7rIxNLKdUPKr6dgjj/fpvEy2Q3uIy+s2AupdJCp4jKQRU50M+9bL1Gtsj52KkGJga6QBFI9KpCXNSRyt/oaN4kKtzh7k0gPc0Ckj46DOZ2mZJj34/yFHQH0nP7M/2npg94W1y4W8xsYjU9YiD4lxRB5N9DKrW930TdpdCNo1yyQH2XaK13P1xDJ1Mei0t0YVaa3RMbQSY8EfHMKgWjpm1iTFS+p5tXCkL5582K7tPVH8jXA4JmakDMn72VFP3SmRfts+Vb+vkohACGGNXGImjdAmrJXM/H2ZJR94Kxkvif0xm7vCLDADi8JwNQ4QDV8BIdYWUZp68yew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lj1GC+tv5scfGOtQDJe05RRjCb7Emx137fY9thBEOkU=;
 b=v2cN8SwNLER6mQ50fMVQIvJn6rLZaRzzazk3IWdzqGPQn9uR/bGhCJisHXZxjprQ5L/SFIyCUTE40Lp6OdyGdAqXaBW36ueeBCy04For9GtYbLj1J7+FTqx3Ebrwi9j4EtIERqt/m6YH6kNoqa14No0oqYAmomF14eGCZYjZWPE=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Andre Przywara <Andre.Przywara@arm.com>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Wei Liu <wl@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH v2 05/17] xen/arm: Add PHYSDEVOP_pci_device_* support for
 ARM
Thread-Topic: [PATCH v2 05/17] xen/arm: Add PHYSDEVOP_pci_device_* support for
 ARM
Thread-Index: AQHXr6Y8iuh9n6XE8kGpK3+HP56+I6uwpZaAgADU3YA=
Date: Thu, 23 Sep 2021 11:19:30 +0000
Message-ID: <59B54064-1DE0-44ED-9B50-F1709B77E56B@arm.com>
References: <cover.1632307952.git.rahul.singh@arm.com>
 <a1c447ced213f07797eebc9471c48df56a187033.1632307952.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2109221527510.17979@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109221527510.17979@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 65c2d1b8-0848-4cf2-0f79-08d97e84150f
x-ms-traffictypediagnostic: AM5PR0801MB1939:|VI1PR08MB4301:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB43018BFF16B762CBF7D90BD8FCA39@VI1PR08MB4301.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 rv09D2lp3+r8ELMn40Lj2Wew2Hp9P4WH9kWSLnFenKkxlamGq0UoekbB2UJ9rtl5XFGQ/k46n9XgoM1k+wugL7FCE4tgBZrAvQm+Ot3maSMbCLy68m6eSPIpESBXQBCdA12oxw1NTRgv9umtKAwpWXMeLXiQG7MxvGM4Ew2cPCvbm4VhJTLKWdGU9MX14kctzlx3qybXJJ5lwP00tDJDTGO/fGFI2f55RHe/cyuZWPoHLyUSt4hn76wG4MdqjPw5CJb75GqirwFrJsUdlsQjTNBo65gzaGCTeCWnm1js8f7XEEdGffZqhnFHSu/PXDpfwxU7/m5nCt90oFfI0FITjgpGIZE25CF6jBYs9G7JEr0Ed6oXGyGu91E5hYbqOZ0PG9+87a6nDAUTmuZ5pQQmAw3i8pBYYLXQBFQ/cLLXluq50XJNOwWL3NVvuzCZt6h3Xcd3F5h8MBwvgbVb6FoYOoZtr95vKcL8Ia7CJCLNIFUTH71+074XMDe58psc99pNtn3orAmcr908LJ5EoQIuoddUwWT5hRxSy14oAKbtN2ks7g7sMJlDMQjkULin7sVAFKTw6dOksv2n2j6ZJnE1T8oCHQo0TgUww7Jo+zCfeV7G/LJeUESrCuG/Pn1hyno3DG9AqL9XKd8bspDk9D8j45SR9Vmr7AhUGCMZkPfrfLJVCQVj0yWeHP4tKJ49lQD1/pgcUCt4i7y4BbvbP+FolMN+t48PiX27dHWBVvUpPOfSttlhsPTRLM1BhvfkzV7D
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(91956017)(83380400001)(38070700005)(6512007)(86362001)(6486002)(8936002)(71200400001)(64756008)(122000001)(6506007)(38100700002)(5660300002)(2906002)(186003)(8676002)(76116006)(53546011)(33656002)(66476007)(6916009)(36756003)(2616005)(54906003)(66446008)(316002)(66946007)(26005)(7416002)(4326008)(66556008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <695C343121B23B44BD2B70DB5FC4D837@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1939
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	91909f59-f5dc-4e7b-34b0-08d97e840319
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rWZ+g9J2vukW68WOas0KZsDEY4tBkTk1rfentweVabW5a9qcrUcOGkM2g3ul6Mfl/G/+mOBTz8iVXpWIVcqLZNLf1EPuDoRWQIKD/S9GDR8s2oph0kdrmOpUvR+DbuJt27U8F6M3HBRsSAD3eYx5irZZEaqhW0WRIqJjjLbLBq/3uWG8nhPKtzAj4/UvkDLM/nLycXN4EZCAIUsYFVlDNvLr30TFv40MOCeX/5DBA6jr1fvY0YQgB0ULjAASCvCxHJP/0l5Vkt0v80+XsJfGTIrReUzeDV1XT8rSRtSXlGEknZAgxSrnTQ7zUrscIOH3QobOeqLakSCQ32LgB7peM+lmCnJmheQkgopC4tWw7eNaLleV0f8ys8PpMWZrCO8zLnlNr/BDFpKuzALK0RZQupltaWkrEvKlE5+jiWiGF49Awpfb43OQlQ+X5D08mjGPdjYnHGHvvwbTTbPeMBveJztmwKqB6IYKMIB988SfNyc4eHdhjLhCeAzMoM8gEMnnbch5q2K8ybdCkFaqmRoq95G7r//Z62t8ipcxBje4m1vHv75LJUkkmhv5ExoUlGCr/ow8SbBcYnfmoZC8Ut/KhQmNM45ZopdxxFGLuCz51KwGNYiBz9zyJmFip8kQHXt1PqrTll1OB52udeDIlzkiAmT+CQtvA3QDIb5CwpXPpdVlgtthxHJvnsHvmQh0nitBQv4YIFhabdv+NXMyIVQ8VA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(70206006)(70586007)(81166007)(54906003)(508600001)(6512007)(83380400001)(336012)(316002)(8676002)(36756003)(82310400003)(5660300002)(2906002)(107886003)(26005)(33656002)(6506007)(36860700001)(4326008)(86362001)(6862004)(47076005)(53546011)(186003)(8936002)(356005)(2616005)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 11:20:00.1568
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65c2d1b8-0848-4cf2-0f79-08d97e84150f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4301

Hi Stefano,

> On 22 Sep 2021, at 11:37 pm, Stefano Stabellini <sstabellini@kernel.org> =
wrote:
>=20
> On Wed, 22 Sep 2021, Rahul Singh wrote:
>> Hardware domain is in charge of doing the PCI enumeration and will
>> discover the PCI devices and then will communicate to XEN via hyper
>> call PHYSDEVOP_pci_device_add(..) to add the PCI devices in XEN.
>>=20
>> Also implement PHYSDEVOP_pci_device_remove(..) to remove the PCI device.
>>=20
>> As most of the code for PHYSDEVOP_pci_device_* is the same between x86
>> and ARM, move the code to a common file to avoid duplication.
>>=20
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> ---
>> Change in v2:
>> - Add support for PHYSDEVOP_pci_device_remove()
>> - Move code to common code
>> ---
>> xen/arch/arm/physdev.c          |  5 +-
>> xen/arch/x86/physdev.c          | 50 +-------------------
>> xen/arch/x86/x86_64/physdev.c   |  4 +-
>> xen/common/Makefile             |  1 +
>> xen/common/physdev.c            | 81 +++++++++++++++++++++++++++++++++
>> xen/include/asm-arm/hypercall.h |  2 -
>> xen/include/asm-arm/numa.h      |  5 ++
>> xen/include/asm-x86/hypercall.h |  9 ++--
>> xen/include/xen/hypercall.h     |  8 ++++
>> 9 files changed, 106 insertions(+), 59 deletions(-)
>> create mode 100644 xen/common/physdev.c
>>=20
>> diff --git a/xen/arch/arm/physdev.c b/xen/arch/arm/physdev.c
>> index e91355fe22..4e00b03aab 100644
>> --- a/xen/arch/arm/physdev.c
>> +++ b/xen/arch/arm/physdev.c
>> @@ -8,10 +8,9 @@
>> #include <xen/lib.h>
>> #include <xen/errno.h>
>> #include <xen/sched.h>
>> -#include <asm/hypercall.h>
>> +#include <xen/hypercall.h>
>>=20
>> -
>> -int do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>> +long arch_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>> {
>>     gdprintk(XENLOG_DEBUG, "PHYSDEVOP cmd=3D%d: not implemented\n", cmd)=
;
>>     return -ENOSYS;
>> diff --git a/xen/arch/x86/physdev.c b/xen/arch/x86/physdev.c
>> index 23465bcd00..c00cc99404 100644
>> --- a/xen/arch/x86/physdev.c
>> +++ b/xen/arch/x86/physdev.c
>> @@ -174,7 +174,7 @@ int physdev_unmap_pirq(domid_t domid, int pirq)
>> }
>> #endif /* COMPAT */
>>=20
>> -ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>> +ret_t arch_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>> {
>>     int irq;
>>     ret_t ret;
>> @@ -480,54 +480,6 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM=
(void) arg)
>>         break;
>>     }
>>=20
>> -    case PHYSDEVOP_pci_device_add: {
>> -        struct physdev_pci_device_add add;
>> -        struct pci_dev_info pdev_info;
>> -        nodeid_t node;
>> -
>> -        ret =3D -EFAULT;
>> -        if ( copy_from_guest(&add, arg, 1) !=3D 0 )
>> -            break;
>> -
>> -        pdev_info.is_extfn =3D !!(add.flags & XEN_PCI_DEV_EXTFN);
>> -        if ( add.flags & XEN_PCI_DEV_VIRTFN )
>> -        {
>> -            pdev_info.is_virtfn =3D 1;
>> -            pdev_info.physfn.bus =3D add.physfn.bus;
>> -            pdev_info.physfn.devfn =3D add.physfn.devfn;
>> -        }
>> -        else
>> -            pdev_info.is_virtfn =3D 0;
>> -
>> -        if ( add.flags & XEN_PCI_DEV_PXM )
>> -        {
>> -            uint32_t pxm;
>> -            size_t optarr_off =3D offsetof(struct physdev_pci_device_ad=
d, optarr) /
>> -                                sizeof(add.optarr[0]);
>> -
>> -            if ( copy_from_guest_offset(&pxm, arg, optarr_off, 1) )
>> -                break;
>> -
>> -            node =3D pxm_to_node(pxm);
>> -        }
>> -        else
>> -            node =3D NUMA_NO_NODE;
>> -
>> -        ret =3D pci_add_device(add.seg, add.bus, add.devfn, &pdev_info,=
 node);
>> -        break;
>> -    }
>> -
>> -    case PHYSDEVOP_pci_device_remove: {
>> -        struct physdev_pci_device dev;
>> -
>> -        ret =3D -EFAULT;
>> -        if ( copy_from_guest(&dev, arg, 1) !=3D 0 )
>> -            break;
>> -
>> -        ret =3D pci_remove_device(dev.seg, dev.bus, dev.devfn);
>> -        break;
>> -    }
>> -
>>     case PHYSDEVOP_prepare_msix:
>>     case PHYSDEVOP_release_msix: {
>>         struct physdev_pci_device dev;
>> diff --git a/xen/arch/x86/x86_64/physdev.c b/xen/arch/x86/x86_64/physdev=
.c
>> index 0a50cbd4d8..5f72652ff7 100644
>> --- a/xen/arch/x86/x86_64/physdev.c
>> +++ b/xen/arch/x86/x86_64/physdev.c
>> @@ -9,9 +9,10 @@ EMIT_FILE;
>> #include <compat/xen.h>
>> #include <compat/event_channel.h>
>> #include <compat/physdev.h>
>> -#include <asm/hypercall.h>
>> +#include <xen/hypercall.h>
>>=20
>> #define do_physdev_op compat_physdev_op
>> +#define arch_physdev_op arch_compat_physdev_op
>>=20
>> #define physdev_apic               compat_physdev_apic
>> #define physdev_apic_t             physdev_apic_compat_t
>> @@ -82,6 +83,7 @@ CHECK_physdev_pci_device
>> typedef int ret_t;
>>=20
>> #include "../physdev.c"
>> +#include "../../../common/physdev.c"
>>=20
>> /*
>>  * Local variables:
>> diff --git a/xen/common/Makefile b/xen/common/Makefile
>> index 54de70d422..bcb1c8fb03 100644
>> --- a/xen/common/Makefile
>> +++ b/xen/common/Makefile
>> @@ -29,6 +29,7 @@ obj-y +=3D notifier.o
>> obj-y +=3D page_alloc.o
>> obj-$(CONFIG_HAS_PDX) +=3D pdx.o
>> obj-$(CONFIG_PERF_COUNTERS) +=3D perfc.o
>> +obj-y +=3D physdev.o
>> obj-y +=3D preempt.o
>> obj-y +=3D random.o
>> obj-y +=3D rangeset.o
>> diff --git a/xen/common/physdev.c b/xen/common/physdev.c
>> new file mode 100644
>> index 0000000000..8d44b20db8
>> --- /dev/null
>> +++ b/xen/common/physdev.c
>> @@ -0,0 +1,81 @@
>> +
>> +#include <xen/guest_access.h>
>> +#include <xen/hypercall.h>
>> +#include <xen/init.h>
>> +
>> +#ifndef COMPAT
>> +typedef long ret_t;
>> +#endif
>> +
>> +ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>> +{
>> +    ret_t ret;
>> +
>> +    switch ( cmd )
>> +    {
>> +#ifdef CONFIG_HAS_PCI
>> +    case PHYSDEVOP_pci_device_add: {
>> +        struct physdev_pci_device_add add;
>> +        struct pci_dev_info pdev_info;
>> +        nodeid_t node;
>> +
>> +        ret =3D -EFAULT;
>> +        if ( copy_from_guest(&add, arg, 1) !=3D 0 )
>> +            break;
>> +
>> +        pdev_info.is_extfn =3D !!(add.flags & XEN_PCI_DEV_EXTFN);
>> +        if ( add.flags & XEN_PCI_DEV_VIRTFN )
>> +        {
>> +            pdev_info.is_virtfn =3D 1;
>> +            pdev_info.physfn.bus =3D add.physfn.bus;
>> +            pdev_info.physfn.devfn =3D add.physfn.devfn;
>> +        }
>> +        else
>> +            pdev_info.is_virtfn =3D 0;
>> +
>> +        if ( add.flags & XEN_PCI_DEV_PXM )
>> +        {
>> +            uint32_t pxm;
>> +            size_t optarr_off =3D offsetof(struct physdev_pci_device_ad=
d, optarr) /
>> +                                sizeof(add.optarr[0]);
>> +
>> +            if ( copy_from_guest_offset(&pxm, arg, optarr_off, 1) )
>> +                break;
>> +
>> +            node =3D pxm_to_node(pxm);
>> +        }
>> +        else
>> +            node =3D NUMA_NO_NODE;
>> +
>> +        ret =3D pci_add_device(add.seg, add.bus, add.devfn, &pdev_info,=
 node);
>> +        break;
>> +    }
>> +
>> +    case PHYSDEVOP_pci_device_remove: {
>> +        struct physdev_pci_device dev;
>> +
>> +        ret =3D -EFAULT;
>> +        if ( copy_from_guest(&dev, arg, 1) !=3D 0 )
>> +            break;
>> +
>> +        ret =3D pci_remove_device(dev.seg, dev.bus, dev.devfn);
>> +        break;
>> +    }
>> +#endif
>> +    default:
>> +        ret =3D arch_physdev_op(cmd, arg);;
>                                           ^ a typo?
Ack.
>=20
> The ARM and common parts are fine. I am not well-versed in the x86
> compat stuff; we need one of the x86 maintainers to review the x86
> changes.

Yes. I need one of the x86 maintainers to review the code.
Regards,
Rahul


