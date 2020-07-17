Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 060E0223D8D
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jul 2020 16:01:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwQvV-0004qw-M2; Fri, 17 Jul 2020 14:01:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zdYj=A4=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jwQvU-0004qo-9T
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2020 14:01:24 +0000
X-Inumbo-ID: fe92d900-c835-11ea-bb8b-bc764e2007e4
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe05::627])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fe92d900-c835-11ea-bb8b-bc764e2007e4;
 Fri, 17 Jul 2020 14:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jd4/aGJDD35zQ9lqOJnGsuQzghd404qhES6bmDZNbso=;
 b=naMW1CjBG/znuJ+LKypYLvEgIV5opilE4aOTr63iy5XyTb4D0inMg2y9aEI28zHkcrCaqa7BptZGTUlfYQqV7mEOnLidzlZqs61C2N7tmt9A+KnLQLj738WaGLDIndtG6YM2MvqamUuaugR8AiOC/TfizsI/P//JHKqH9v6kbKU=
Received: from AM6PR04CA0011.eurprd04.prod.outlook.com (2603:10a6:20b:92::24)
 by VE1PR08MB4781.eurprd08.prod.outlook.com (2603:10a6:802:ab::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Fri, 17 Jul
 2020 14:01:18 +0000
Received: from AM5EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:92:cafe::df) by AM6PR04CA0011.outlook.office365.com
 (2603:10a6:20b:92::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17 via Frontend
 Transport; Fri, 17 Jul 2020 14:01:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT004.mail.protection.outlook.com (10.152.16.163) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.18 via Frontend Transport; Fri, 17 Jul 2020 14:01:18 +0000
Received: ("Tessian outbound 2ae7cfbcc26c:v62");
 Fri, 17 Jul 2020 14:01:18 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1002281a3852c0af
X-CR-MTA-TID: 64aa7808
Received: from bde09bfd03ea.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7253E12D-E095-4A7D-914A-3E34F5783049.1; 
 Fri, 17 Jul 2020 14:01:13 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bde09bfd03ea.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 17 Jul 2020 14:01:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RqmBcRvehMDdVFh76iDZ5lHz/cemaMmeONnIGKJDxpG/ymRWcIcGB8N6MQ45P63xqGN3ueENxfsoDlt3VPa1m1hwsu18IzakXgW5g7Df7D4yFJrL7fHSGBuJMnekLdJNRR/dZ0fe9wtuYGmOZcZUYIjf16ySjIFzgkYaQsoOoBBV9r8wngiHRMyAM41Ylmwf9gyYqngoW8Okn5AiEzjGWw2D5YyJPLtDWpNYBDdBmetgFMqVIJ97cde5XZ4WB1+V/eHbTuf4a1xxpleQIvdJd9HaDFxPebJlCROiJecrcP9IV2uNA6l715+T7YLNJ20yekPwLi8KWy4iKXJg6GaWcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jd4/aGJDD35zQ9lqOJnGsuQzghd404qhES6bmDZNbso=;
 b=AoqVoLvwhzFTfbC4SlhoIKvfsnNDALIEg/FNN16Ljr6Tg6EEybl2N8BSV0JXe3wBeukCXRaDKOZr2JOUQP7G6RWTLtIFKYry0xYyaPqEHT+h26ENNZCwnTkFUtEtumr0z+/pVtognJSh3azKv7A5K5fjEYxXGNOPIU/nWRIqkgcptDqjvoM11JNOjiJ/F8OkhvaGiB6TLkAWnQIut3o9axELGq3G6A7DKXGfAWjSPbqNVYxaLVwOftb3PjFBMjSA8hrXxhfzwzQONnYLiJ2ufPxE9NVX2KxWzRf9dpSyPHuPlM/UrWiNywFDmC62rBz0O1jLd5kAO/L6PfBro4It2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jd4/aGJDD35zQ9lqOJnGsuQzghd404qhES6bmDZNbso=;
 b=naMW1CjBG/znuJ+LKypYLvEgIV5opilE4aOTr63iy5XyTb4D0inMg2y9aEI28zHkcrCaqa7BptZGTUlfYQqV7mEOnLidzlZqs61C2N7tmt9A+KnLQLj738WaGLDIndtG6YM2MvqamUuaugR8AiOC/TfizsI/P//JHKqH9v6kbKU=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3386.eurprd08.prod.outlook.com (2603:10a6:10:46::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Fri, 17 Jul
 2020 14:01:10 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3174.028; Fri, 17 Jul 2020
 14:01:10 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
Subject: Re: RFC: PCI devices passthrough on Arm design proposal
Thread-Topic: RFC: PCI devices passthrough on Arm design proposal
Thread-Index: AQHWW4kYTVU0hTDyYEitKlUuU5vZlKkKf2uAgAACLICAAR7YAIAAIxaAgAAB34CAAARBAIAAAV+AgAADXAA=
Date: Fri, 17 Jul 2020 14:01:10 +0000
Message-ID: <73106C3C-E7BD-4692-943F-BE3CAB9CCEC9@arm.com>
References: <3F6E40FB-79C5-4AE8-81CA-E16CA37BB298@arm.com>
 <BD475825-10F6-4538-8294-931E370A602C@arm.com>
 <E9CBAA57-5EF3-47F9-8A40-F5D7816DB2A4@arm.com>
 <20200717111644.GS7191@Air-de-Roger>
 <3B8A1B9D-A101-4937-AC42-4F62BE7E677C@arm.com>
 <339df023-7844-b998-81bd-8c00baad3b04@xen.org>
 <F91FCC13-D591-4A57-9840-220614174F02@arm.com>
 <239b5114-9e23-ab55-41b9-c02a2018e4ab@xen.org>
In-Reply-To: <239b5114-9e23-ab55-41b9-c02a2018e4ab@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 53a7ef17-d37f-4e7a-dc7d-08d82a59e0c1
x-ms-traffictypediagnostic: DB7PR08MB3386:|VE1PR08MB4781:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VE1PR08MB47811DA98810BD6A5F4B2F129D7C0@VE1PR08MB4781.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: XHig5CNJ5U4MNfI04aJeFyPD0yqKkiLPVFv/+TmwvE3Z5jPelbBqTOwK5zh8RdGlD8w9YKP5LHUGPREws0e3mCmkEXFU1GkUTSKAgF12N3yOS128IUahXuA7RTLP0n/vtNfOAaXlpJu5/a/13pKv2ATWuA5EoVZWrooPM9vyLOK7hx72SGrUfMAUbShHI9q64TLn0ZasXBD9j04ylG2ujOor6WFcMWV7vE2e8Ev2n73SKl8dgyihE3ev2ZedH4OPsPR3TOpu77hOUaEa+sDFV3Nu4gG1YcNJkB4qWMOeVzIDZNOLTBB1LO7BFh8eJHRj
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(366004)(346002)(376002)(396003)(39860400002)(2616005)(186003)(2906002)(33656002)(54906003)(26005)(66556008)(71200400001)(66446008)(76116006)(91956017)(316002)(66476007)(86362001)(6506007)(53546011)(64756008)(66946007)(4326008)(6916009)(8936002)(83380400001)(478600001)(5660300002)(6512007)(6486002)(36756003)(8676002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: nLrbSDDUzIKrumcQf5HrR1ZRdQGJFW+nsME6r4++uVR3tTWsW65QKr9lNxkbmtPFx/a5eRgueaOLbCpKgIMCqC3hRM6ymJpurTLmJj7JLA1HrA/HI/xb1J6CssB8eJkgnPRMv3o/fSLcj+57BWG5/Dquh2r7IIGPpp+RfrF8ceeiBf3VPuZhuqc/SI+zYrNJEZbiFXWVsMRMpXOIBmAnEV+VB5T2+0iGm1sgO/baqujNXmEacccu+OO942vOCT8XSWs57nZXQD46k72t1gMUD7ea9m/BlSL0wxDMB0GffqMhrbf4w7N6s5SGbjQeYY6ZUB1TZFYs0QyFjWir+oV1CLU5xF4mNb3+DYmDmtNvd060LiiQAfKIJthn0T3z5V/mFdUBESHFiHXxGDm/LnPXOdkapVIVzN0wVOh23g6VyShcT+a9QLwGqM67b9lxpEW9GORsqBrbQjXVvTdZXFyFoOFkt6N8be8cP/xD6ZQ8p/ux3oEamJ0TZGJ4kU/98UpD
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <57C38B24F6C3B7489CA11E1F57153DA3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3386
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(346002)(39860400002)(376002)(396003)(136003)(46966005)(316002)(356005)(2906002)(54906003)(82740400003)(86362001)(8676002)(6862004)(81166007)(83380400001)(47076004)(5660300002)(82310400002)(4326008)(36756003)(2616005)(53546011)(6486002)(478600001)(6506007)(6512007)(107886003)(26005)(70586007)(70206006)(336012)(36906005)(8936002)(186003)(33656002);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1af5859c-ed7e-489f-59a7-08d82a59dc45
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3VCLZaymK1cnf8ibSGCUqm6QhtAo7n8pgVDrG/72nDR5VZux1JKeJEiCm70XLkKAnphQsKJgMhcrRpgBW0llvGQASmRlH/oqQ4BfZjzP0RfhX+/kVjAgtTmF3gCF/lSS87IO3TMEmZxJ8AdYw0dHmzP2Tr2jwVrHTRJJUEvj77QpLxi4EhV9S0hMpWDMm/wFdTkt+OdCKbwFVguJkdIyk7AZoKWqSPCJWnMF0RVLxjnWWnNsno0iXWK49sVOafamMFuWEA38JOZYqMHJ1zzXEkxOri7dgqDD0ZXSMmETHC/+lN49VIMJ9rnHo63nF/p4q9Uk7WegIf4HsMOQ5H6riq8IN9Dnb2WIM+SwwmzffGzYX2hNsQ/r0WD9Cyh11UR3Wxss6VjIc+dUKJ7xzHYsdw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2020 14:01:18.3383 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53a7ef17-d37f-4e7a-dc7d-08d82a59e0c1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4781
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



> On 17 Jul 2020, at 15:49, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 17/07/2020 14:44, Bertrand Marquis wrote:
>>> On 17 Jul 2020, at 15:29, Julien Grall <julien@xen.org> wrote:
>>>=20
>>>=20
>>>=20
>>> On 17/07/2020 14:22, Bertrand Marquis wrote:
>>>>>> # Emulated PCI device tree node in libxl:
>>>>>>=20
>>>>>> Libxl is creating a virtual PCI device tree node in the device tree
>>>>>> to enable the guest OS to discover the virtual PCI during guest
>>>>>> boot. We introduced the new config option [vpci=3D"pci_ecam"] for
>>>>>> guests. When this config option is enabled in a guest configuration,
>>>>>> a PCI device tree node will be created in the guest device tree.
>>>>>>=20
>>>>>> A new area has been reserved in the arm guest physical map at which
>>>>>> the VPCI bus is declared in the device tree (reg and ranges
>>>>>> parameters of the node). A trap handler for the PCI ECAM access from
>>>>>> guest has been registered at the defined address and redirects
>>>>>> requests to the VPCI driver in Xen.
>>>>>=20
>>>>> Can't you deduce the requirement of such DT node based on the presenc=
e
>>>>> of a 'pci=3D' option in the same config file?
>>>>>=20
>>>>> Also I wouldn't discard that in the future you might want to use
>>>>> different emulators for different devices, so it might be helpful to
>>>>> introduce something like:
>>>>>=20
>>>>> pci =3D [ '08:00.0,backend=3Dvpci', '09:00.0,backend=3Dxenpt', '0a:00=
.0,backend=3Dqemu', ... ]
>>>=20
>>> I like this idea :).
>>>=20
>>>>>=20
>>>>> For the time being Arm will require backend=3Dvpci for all the passed
>>>>> through devices, but I wouldn't rule out this changing in the future.
>>>> We need it for the case where no device is declared in the config file=
 and the user
>>>> wants to add devices using xl later. In this case we must have the DT =
node for it
>>>> to work.
>>>=20
>>> Are you suggesting that you plan to implement PCI hotplug?
>> No this is not in the current plan but we should not prevent this to be =
supported some day :-)
>=20
> I agree that we don't want to prevent extension. But I fail to see why th=
is would be an issue if we don't introduce the option "vcpi" today.

I answered that in parallel while answering to Jan.
This is needed to have no PCI device assigned when starting the guest and a=
ssign them later using xl pci-attach

Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


