Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B043223D86
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jul 2020 16:00:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwQu4-00040E-A7; Fri, 17 Jul 2020 13:59:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zdYj=A4=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jwQu2-000402-K9
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2020 13:59:54 +0000
X-Inumbo-ID: c9951bfa-c835-11ea-bca7-bc764e2007e4
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe05::620])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c9951bfa-c835-11ea-bca7-bc764e2007e4;
 Fri, 17 Jul 2020 13:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQ2gZHMn6LDSz8tivzsrNZKbVKpPQrWz0pNWuRqzEKo=;
 b=4e3hYZDdgwxLuiLwSWBEJpm+NBjPe1xDtPbU08hM0NDKe1UDhjJ/CBuQvv0ytrsvAmA68Hc34nc1DLg1cdc3G0dk3Gam4m5ryr10WEbRxDP2Dn0lby1Dw5G6aKNcgCUI+4xbXEQDQV1rph+vI//OSGbNjIVLle5vP4XbXdeNojc=
Received: from DB3PR06CA0013.eurprd06.prod.outlook.com (2603:10a6:8:1::26) by
 VI1PR08MB3885.eurprd08.prod.outlook.com (2603:10a6:803:c1::32) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.18; Fri, 17 Jul 2020 13:59:51 +0000
Received: from DB5EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:1:cafe::ae) by DB3PR06CA0013.outlook.office365.com
 (2603:10a6:8:1::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17 via Frontend
 Transport; Fri, 17 Jul 2020 13:59:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT062.mail.protection.outlook.com (10.152.20.197) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.18 via Frontend Transport; Fri, 17 Jul 2020 13:59:50 +0000
Received: ("Tessian outbound 8f45de5545d6:v62");
 Fri, 17 Jul 2020 13:59:50 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0c33ac93980ba219
X-CR-MTA-TID: 64aa7808
Received: from 9d394a7510c8.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E80E0610-9462-438E-97AD-2E8442A848C0.1; 
 Fri, 17 Jul 2020 13:59:44 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9d394a7510c8.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 17 Jul 2020 13:59:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V31tpZc6kUIqiNi8plSIlwnSmCurepjLZvOY8Dx/uLNBWrxyeGsoyU1FrEIf5MUc//KNAROUBQfgIfsay5J0A/C8YAm0cURAkEqMeTdGUbpHn2/b2Jl14eDYS6Tmeh9QKoE20GmYMNsXMhPFJI4smzxGQbU/Eoh1zirPO5XL+G+H7X1G1QQQ04OFb6PqvnfoznrTcobFz2srNLzY9cZumpJYG1cJ3MJoOtxjq/z8K+CR5lSIIvnXR/YSrflT50Y5stQESz3ZRnQK665BosBwwhyj2E7d2EetWeNzQ9IkV9hf8Dubq1FZzWLJdY75XuWcIFs/M4Z/zXiuHBTIUUsF8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQ2gZHMn6LDSz8tivzsrNZKbVKpPQrWz0pNWuRqzEKo=;
 b=JcGEkXDz2FtOZqOJWgCr0iqpFZIwObPLAjqGtSjhCCI8bfz3yTjD6VXZydZFwybB/NUZi+gjcx1s5AAHNhBndvAJFWrdlhtohmLHYCK0Vdz+adBz2rLLz83Fw3g4sME8y6ADQ0/kAbIOP2Wxfvj1mdd3uW60pbrZ7EOylQhT1xPcvWD5NQCxXtB6TSoSxANgaCawwKAk52HQStW+V7V3tqnU9vjysHaTNVi1wouHNYIjU4dXgoFK2zoxus7etME+QNNDALFzPXJD2LI/VuGuRU4ZE1YrSjzUSwhNRT2QNnikIspiz9Y9mtzV9J1t5+UkTp9FYruFCPtc3DzSbGBxaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQ2gZHMn6LDSz8tivzsrNZKbVKpPQrWz0pNWuRqzEKo=;
 b=4e3hYZDdgwxLuiLwSWBEJpm+NBjPe1xDtPbU08hM0NDKe1UDhjJ/CBuQvv0ytrsvAmA68Hc34nc1DLg1cdc3G0dk3Gam4m5ryr10WEbRxDP2Dn0lby1Dw5G6aKNcgCUI+4xbXEQDQV1rph+vI//OSGbNjIVLle5vP4XbXdeNojc=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3386.eurprd08.prod.outlook.com (2603:10a6:10:46::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Fri, 17 Jul
 2020 13:59:41 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3174.028; Fri, 17 Jul 2020
 13:59:41 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: RFC: PCI devices passthrough on Arm design proposal
Thread-Topic: RFC: PCI devices passthrough on Arm design proposal
Thread-Index: AQHWW4kYTVU0hTDyYEitKlUuU5vZlKkKf2uAgAACLICAAOrEgIAAVPWAgAABeYCAAAssAA==
Date: Fri, 17 Jul 2020 13:59:41 +0000
Message-ID: <F09F9354-EC9B-4D76-809B-A25AF4F7D863@arm.com>
References: <3F6E40FB-79C5-4AE8-81CA-E16CA37BB298@arm.com>
 <BD475825-10F6-4538-8294-931E370A602C@arm.com>
 <E9CBAA57-5EF3-47F9-8A40-F5D7816DB2A4@arm.com>
 <a50c714c-1642-0354-3f19-5a6f7278d8aa@suse.com>
 <28899FEF-9DA7-4513-8283-1AC5EFFC6E92@arm.com>
 <1dd5db2d-98c7-7738-c3d4-d3f098dfe674@suse.com>
In-Reply-To: <1dd5db2d-98c7-7738-c3d4-d3f098dfe674@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [91.160.77.188]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d0082458-0c83-442a-ec5a-08d82a59ac7a
x-ms-traffictypediagnostic: DB7PR08MB3386:|VI1PR08MB3885:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB388503CAFA2054F7D881CA6E9D7C0@VI1PR08MB3885.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: EiSsMR+TvxAIJ3lGvV5BqYGa0I2UyKwQK3SUsZlvpFmc1lqlcYnKYLPA4vF6lTpeTEBDtYBjV8e8yB0M8S4O+KhpSiAzWCAMkUHS1i2AIfKslCZqPgWysuSFuKYWUGswY2lV4puIdcuAk/sGxmM7MYpoVG3UXBIlVOXZZNSkCWEo2LuKJXKAM6WuLElhUeI8a0fP+f8Hvp6aOTZTaHgtIfN2U9Memb2Vgj83/K1YO0b05yGp8P7mZb969Vc72w50wUMQV5hWhZCMPXIrwrOXMyzhclP2WMXLDaXbYt6u+yaZBT2iAqCX8BwTNqPlDeQXCQP32kfviXsHk7z9jYVaog==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(366004)(346002)(376002)(396003)(39860400002)(2616005)(186003)(2906002)(33656002)(54906003)(26005)(66556008)(71200400001)(66446008)(76116006)(91956017)(316002)(66476007)(86362001)(6506007)(53546011)(64756008)(66946007)(4326008)(6916009)(8936002)(478600001)(5660300002)(6512007)(6486002)(36756003)(8676002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: RG4u1ZJ/ZtFrRp4sFRgv6X7RAIGMUd+pVo1CtEvlvvmmNkTL+mSqYfICza0TeggqYxkJMhg0yOzBYVNp3o2k1vTRSJjTtxgaC95rF5DGiz+CZ3tSaSMxiKnAPXMU3G91btezLwa6P22rXBcFanpcV3fgWz/NTTQ04GmTDR7K9Rhy8VxEL1Ad7xW+0aZ/08rrkUHTX+HAXiS87fzvyeyBhNu3BaXc66i1EYLF5ydiNGfzZQLD6srWuvd/kamW5DDjuNyTLoxcgwa6hkdJE1fUz7O2PKLkIvYFsATbtd76J/iORf8311ByRWvmbhWrz2reS8tQJS2xg63dsH5FM1ZXzHOt4NxSvgrfR8YXrB9NlZVJ7cPw6v3t6EAjvafvgxiRZ3Q+JBa3tQyYlaKC85jat053G8Yjp4GdqhohnuPIgaH/7KL543hwWeWNTitFJkx7p2wwXa6qaLoaAoKBCDaARVNKr+jIpBog4xjk6v3ixNo=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <B927026E51A75345896C176F13B61140@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3386
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(396003)(376002)(346002)(39860400002)(136003)(46966005)(4326008)(33656002)(54906003)(86362001)(5660300002)(26005)(2906002)(6486002)(186003)(8936002)(70586007)(47076004)(36756003)(70206006)(336012)(8676002)(316002)(6512007)(82740400003)(6862004)(356005)(478600001)(82310400002)(81166007)(6506007)(53546011)(2616005)(107886003);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: f10a04d7-4169-4fed-3bd8-08d82a59a6ef
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pBQlrthjhgIeiKkqjujJe+qnh7mlEDZysMkJxfFCcvHjFuY+LHgCr1dYHxmIvYYXmsi1VG3tCPDOEH7cY7Oo6NWTT9XmaK5lJxRKvaXcBaT+gXZdDEYntlxdKPaG13lFo4vjoWecW8BSM47a3kU+cXyMGHSoCTNXcvpednFSUiQc9Z6ZbtOFfPUxGOjUBXWJZLMC4fp0W7uRPiRyfoez/+kmiGIdE3BsAxD2ByyGX1vlrzj4zfTeW+U0/sZlQ/5A6hUoJZrDC6HmlAaCNIdeC/VQWGkSDXEfV1w0R5w3+PS2vUeufSvAAGPyVvInKThGbIGOAKmorG2D4fc4tGMBdb3L9HL82vW2NSaeUtdYup/aZn+UfJtrpCmr4+sL2l+a1iONoChEjgV6G8gB8o6k+g==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2020 13:59:50.7048 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0082458-0c83-442a-ec5a-08d82a59ac7a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3885
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
Cc: Rahul Singh <Rahul.Singh@arm.com>,
 Julien Grall <julien.grall.oss@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



> On 17 Jul 2020, at 15:19, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 17.07.2020 15:14, Bertrand Marquis wrote:
>>> On 17 Jul 2020, at 10:10, Jan Beulich <jbeulich@suse.com> wrote:
>>> On 16.07.2020 19:10, Rahul Singh wrote:
>>>> # Emulated PCI device tree node in libxl:
>>>>=20
>>>> Libxl is creating a virtual PCI device tree node in the device tree to=
 enable the guest OS to discover the virtual PCI during guest boot. We intr=
oduced the new config option [vpci=3D"pci_ecam"] for guests. When this conf=
ig option is enabled in a guest configuration, a PCI device tree node will =
be created in the guest device tree.
>>>=20
>>> I support Stefano's suggestion for this to be an optional thing, i.e.
>>> there to be no need for it when there are PCI devices assigned to the
>>> guest anyway. I also wonder about the pci_ prefix here - isn't
>>> vpci=3D"ecam" as unambiguous?
>>=20
>> This could be a problem as we need to know that this is required for a g=
uest upfront so that PCI devices can be assigned after using xl.=20
>=20
> I'm afraid I don't understand: When there are no PCI device that get
> handed to a guest when it gets created, but it is supposed to be able
> to have some assigned while already running, then we agree the option
> is needed (afaict). When PCI devices get handed to the guest while it
> gets constructed, where's the problem to infer this option from the
> presence of PCI devices in the guest configuration?

If the user wants to use xl pci-attach to attach in runtime a device to a g=
uest, this guest must have a VPCI bus (even with no devices).
If we do not have the vpci parameter in the configuration this use case wil=
l not work anymore.

@julien: in fact this can be considered as hotplug from guest point of view=
 and we do support this :-)
We will not support PCI hotplug for hardware hotplug definitely (ie adding =
in runtime a new device on PCI).

Bertrand

>=20
> Jan


