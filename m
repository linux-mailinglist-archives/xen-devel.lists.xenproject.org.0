Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAA1223D2C
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jul 2020 15:45:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwQf5-0002fQ-L3; Fri, 17 Jul 2020 13:44:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zdYj=A4=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jwQf4-0002fL-EV
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2020 13:44:26 +0000
X-Inumbo-ID: a07a96e8-c833-11ea-8496-bc764e2007e4
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe02::600])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a07a96e8-c833-11ea-8496-bc764e2007e4;
 Fri, 17 Jul 2020 13:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/hDwZuc88ZnW72NHkXZ6YZ87KsiakaGpEzK+53QjM/s=;
 b=zWLByuG9iP0vkpOGZF/9voEMV7LlSZkTSeegSQHV7E0yX7dveqcUGdnWpPsGaf0o9AVWoIHZZVvBCcnPB9KjQujhGuU7DluxdrBOtIAPAcwQQXbQmGB5hNKT7oO6tX02fkIOIrQqXg5aM/YtT2CZWtWWuIpseYvs5O+sETpoQDE=
Received: from DB6P18901CA0024.EURP189.PROD.OUTLOOK.COM (2603:10a6:4:16::34)
 by DB6PR08MB2885.eurprd08.prod.outlook.com (2603:10a6:6:1b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18; Fri, 17 Jul
 2020 13:44:23 +0000
Received: from DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:16:cafe::2f) by DB6P18901CA0024.outlook.office365.com
 (2603:10a6:4:16::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17 via Frontend
 Transport; Fri, 17 Jul 2020 13:44:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT042.mail.protection.outlook.com (10.152.21.123) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.18 via Frontend Transport; Fri, 17 Jul 2020 13:44:23 +0000
Received: ("Tessian outbound 1dc58800d5dd:v62");
 Fri, 17 Jul 2020 13:44:22 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c4a51dede70b03d3
X-CR-MTA-TID: 64aa7808
Received: from c7c72735cc33.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A408421E-D0BC-4CF7-92F0-7B84A9599CAD.1; 
 Fri, 17 Jul 2020 13:44:17 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c7c72735cc33.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 17 Jul 2020 13:44:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZVY6ZHoYX1kcy7iofNfLd/HqTmoQCOVrDKS4plgnwHEpS5OsnIdDhLPlkiAwofWmLzkXUmpU0DMR+dya/U47zOEMcj8zJxQ3xMQKd7RVlNQje9XZPdXSRtmFZFpTQ6EeMUVA6HVz6FtMfmFhJ7ROtsbe9HbqVS+q/hkIOXp02i6Loc690m3kVB6d/KJ0mmW55xH/jVX7eGYM3DjaLDbMN7QDaU0Ez38n1AzOKwX6Q7/p/bB4gVN0VW4p6OXnqGc2YtCagwN8FFNMtHpPIK5dyO7jba8Scn5KwU34/wtOe4hfKvTfasB/XFJwzui6omH+S5MkC7/pzRiFhG6FF1+F0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/hDwZuc88ZnW72NHkXZ6YZ87KsiakaGpEzK+53QjM/s=;
 b=dMyO4xFxHoWGEIaj7uoeJgGRcFNUpGIHcpaVHh4nqAnPU8mDHWje6Z4TEzu51eocyr124hSZ6o+JEYmGxrjOD3fWca86h1fvBrhwIblA+bC6qV+oDFokXzmPlFbw7frOHs2hSrBcezLCfowFpUdr7BDeKdUL8h7FhjFzanm4dPEyuYqX3yWyaBKRSJgzLkigyXIj5+O5/F1A810Z87793FyoLK08SlHPMjQNJZpFL8liQhRPCvpsZli9UEilVLRcoHi/1KPrIKOe9M4QftCM41MDcb5pVmgr/3InD16f5qNYgWUYMCTiGlYqG+JWc1PlDcAxJkf/LO3lJ9iVL0Brgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/hDwZuc88ZnW72NHkXZ6YZ87KsiakaGpEzK+53QjM/s=;
 b=zWLByuG9iP0vkpOGZF/9voEMV7LlSZkTSeegSQHV7E0yX7dveqcUGdnWpPsGaf0o9AVWoIHZZVvBCcnPB9KjQujhGuU7DluxdrBOtIAPAcwQQXbQmGB5hNKT7oO6tX02fkIOIrQqXg5aM/YtT2CZWtWWuIpseYvs5O+sETpoQDE=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR08MB2695.eurprd08.prod.outlook.com (2603:10a6:6:19::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Fri, 17 Jul
 2020 13:44:15 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3174.028; Fri, 17 Jul 2020
 13:44:15 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
Subject: Re: RFC: PCI devices passthrough on Arm design proposal
Thread-Topic: RFC: PCI devices passthrough on Arm design proposal
Thread-Index: AQHWW4kYTVU0hTDyYEitKlUuU5vZlKkKf2uAgAACLICAAR7YAIAAIxaAgAAB34CAAARBAA==
Date: Fri, 17 Jul 2020 13:44:15 +0000
Message-ID: <F91FCC13-D591-4A57-9840-220614174F02@arm.com>
References: <3F6E40FB-79C5-4AE8-81CA-E16CA37BB298@arm.com>
 <BD475825-10F6-4538-8294-931E370A602C@arm.com>
 <E9CBAA57-5EF3-47F9-8A40-F5D7816DB2A4@arm.com>
 <20200717111644.GS7191@Air-de-Roger>
 <3B8A1B9D-A101-4937-AC42-4F62BE7E677C@arm.com>
 <339df023-7844-b998-81bd-8c00baad3b04@xen.org>
In-Reply-To: <339df023-7844-b998-81bd-8c00baad3b04@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [91.160.77.188]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5a2bd711-ecd6-46b4-9317-08d82a578386
x-ms-traffictypediagnostic: DB6PR08MB2695:|DB6PR08MB2885:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB6PR08MB2885DB76FACF5326D976672A9D7C0@DB6PR08MB2885.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: U14cqmMP8AQfF7l8p3oWjLW5DMFkdxJyXT4+pK4BEvLCvjmog51jaztDWIRli6Oosodgsq5p1nOvfZKY5BlVqRh5ZJJoyNZVcHHQsgWrdB0MqLD6KFsC/cGsVcByEdC39X9NlLBJoBTPU7ZBwEn8i+N0TevXCraLRgtJAaR/mV5rEcmf+HGx0iH7dANcglqL+PBzaNvQ3VgaIqG1lkHCSkymmmYGzdiyZp/TFTWOeMeQ1EV6rIrs77Pg3Q+kvzSYrMhQrdCF+h+r7HdpU7u1ICLiVRmrPHtyeE+0i53KRurrusW9WIVnlQ11zWvKijxo
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(346002)(39860400002)(376002)(366004)(396003)(136003)(83380400001)(6512007)(71200400001)(36756003)(2906002)(33656002)(316002)(2616005)(86362001)(54906003)(8936002)(64756008)(53546011)(66556008)(66476007)(66446008)(4326008)(8676002)(66946007)(91956017)(76116006)(478600001)(6506007)(6916009)(5660300002)(26005)(6486002)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: OZddnMgcHzKe49ptOBbzy4hGFpwhI/ENJXDxsxLH0NDYSMAQzynVbWtTIzRM/LOXXWFtDbaLE9sNHwvquNRUddrty2ceWXtK6HOMBhacqb/Q4nX3GWfx0ywp3AYF87qbV/ab19NnBs2G1/5YtfzgsH0zr10UQ5EkF0dYv/uKsptXVNdVofVfzf5BSzB6Lrb1xL6LKtE6NnhAop3y/QIN0ANJf4s3pU7bJZY4yi6S8kTz9p+gOpnn2wDCfcITG3gCqVww78r9YL+nrvSgD31QD0Y4GqhG3BQp6I57wr7Qunnnrr58l5QPMEmN7Xx5HNA/QxyRJGviOQwKMFac3UdEMZeMMqPOCqUFB7I4TbiTe6H6zaQ4gdj8zzsqrM71UIX5EhCgZeCgJhtKjEIzxrMheQUFr/bBx9GPl7bbjZL38c/Lu6zTjy2poE4Efew7f0LhCF4+ss+nab3gVGFGvvyVkBQNjOB+GyIhop2XhwR7agQ=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <5C8ED09AAAD3204390376F1D62057FCD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2695
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(396003)(136003)(376002)(346002)(46966005)(478600001)(6506007)(53546011)(186003)(26005)(2906002)(336012)(4326008)(6862004)(316002)(70586007)(70206006)(54906003)(2616005)(33656002)(8936002)(47076004)(8676002)(83380400001)(5660300002)(6512007)(86362001)(81166007)(82310400002)(82740400003)(107886003)(36756003)(356005)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: fa069cd4-f8ad-402f-c5e6-08d82a577edd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QzMKv7lum8sTNfMtmWo8x4La/R5M7AfhXsGjQK2xAa2H9y3smCCqhoGcAkUOc3YZNNCQ7AsLfuq0/ts+yC1djtU+rm1n0fdkSO8XBHag+Yl0dGooMnC6mcl4iZzD5OP6EawMcIDF6m8i3e3SucjzfeEMOCpHYO59duUYfGXtcwbmWHd/EQvZwmCnUL1s+rmw+4Zebno+Nvpi1A4h8G55FFAdDGL7iBrhswZ8CB6wbayh/9T5czlmUuyVCZlN+21kXiuivGAQ/OtfJLCvwO9tKWHeEOgE1TiWoq8N52dARjLhHeYJd8WzE8CMV3oa5GEhK9Xf3WCHHHvR3UfyuOcZJFgCpabPYwT6CY0A4I8O0ftcx6x2aiagYPeE44IFi6tMQt92JVV460oC8P8vC81XMg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2020 13:44:23.0001 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a2bd711-ecd6-46b4-9317-08d82a578386
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2885
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
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



> On 17 Jul 2020, at 15:29, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 17/07/2020 14:22, Bertrand Marquis wrote:
>>>> # Emulated PCI device tree node in libxl:
>>>>=20
>>>> Libxl is creating a virtual PCI device tree node in the device tree
>>>> to enable the guest OS to discover the virtual PCI during guest
>>>> boot. We introduced the new config option [vpci=3D"pci_ecam"] for
>>>> guests. When this config option is enabled in a guest configuration,
>>>> a PCI device tree node will be created in the guest device tree.
>>>>=20
>>>> A new area has been reserved in the arm guest physical map at which
>>>> the VPCI bus is declared in the device tree (reg and ranges
>>>> parameters of the node). A trap handler for the PCI ECAM access from
>>>> guest has been registered at the defined address and redirects
>>>> requests to the VPCI driver in Xen.
>>>=20
>>> Can't you deduce the requirement of such DT node based on the presence
>>> of a 'pci=3D' option in the same config file?
>>>=20
>>> Also I wouldn't discard that in the future you might want to use
>>> different emulators for different devices, so it might be helpful to
>>> introduce something like:
>>>=20
>>> pci =3D [ '08:00.0,backend=3Dvpci', '09:00.0,backend=3Dxenpt', '0a:00.0=
,backend=3Dqemu', ... ]
>=20
> I like this idea :).
>=20
>>>=20
>>> For the time being Arm will require backend=3Dvpci for all the passed
>>> through devices, but I wouldn't rule out this changing in the future.
>> We need it for the case where no device is declared in the config file a=
nd the user
>> wants to add devices using xl later. In this case we must have the DT no=
de for it
>> to work.
>=20
> Are you suggesting that you plan to implement PCI hotplug?

No this is not in the current plan but we should not prevent this to be sup=
ported some day :-)

Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


