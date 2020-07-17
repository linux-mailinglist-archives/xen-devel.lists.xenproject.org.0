Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF648223C4A
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jul 2020 15:22:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwQJL-0000ab-Jy; Fri, 17 Jul 2020 13:21:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zdYj=A4=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jwQJK-0000aW-EQ
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2020 13:21:58 +0000
X-Inumbo-ID: 7ceb49e6-c830-11ea-95fc-12813bfff9fa
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.50]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7ceb49e6-c830-11ea-95fc-12813bfff9fa;
 Fri, 17 Jul 2020 13:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+4HPXVczpd//tOGvgos9oXwkWTw2F29F1hkpbXCE9uo=;
 b=Q7rwXYI6+TBrPsQelz8uZk+S19FNpayB4Q2IDsSWZF4PKuk4c3xihOkpIBKfhzvZX2SnLwS+FCwmdwai0ganxR2LGZhiHm0gGqAnalvmtCsFW9wdLQkehBmxmOOQgEy1rqPr0xPIgWp1O9GB6hrqh0NR95Od5dEa7NdsfrNvnW0=
Received: from DB6PR0201CA0017.eurprd02.prod.outlook.com (2603:10a6:4:3f::27)
 by AM0PR08MB4499.eurprd08.prod.outlook.com (2603:10a6:208:140::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Fri, 17 Jul
 2020 13:21:55 +0000
Received: from DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3f:cafe::fe) by DB6PR0201CA0017.outlook.office365.com
 (2603:10a6:4:3f::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18 via Frontend
 Transport; Fri, 17 Jul 2020 13:21:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT043.mail.protection.outlook.com (10.152.20.236) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.18 via Frontend Transport; Fri, 17 Jul 2020 13:21:55 +0000
Received: ("Tessian outbound 73b502bf693a:v62");
 Fri, 17 Jul 2020 13:21:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a3085b6a01fdfa74
X-CR-MTA-TID: 64aa7808
Received: from f0792d98ed35.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C7694120-DBD6-4863-9265-6EA85CA1E2B8.1; 
 Fri, 17 Jul 2020 13:21:49 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f0792d98ed35.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 17 Jul 2020 13:21:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b6rDlskKZyyWWsWOWMsQo172apwC8LGcbZnkr2bduWp42N2oJyDjm4Ijad4IPfbni1cI9WZCmqwtfb6DBPhJJS3XIfH84b62oFnkU+sIuVpfQ08PsSMuRmlF3JAqf6LyKWvNXkwkH0FZY06/oqzm7m3WMjAOA8/rEl51mBITNBmU2AaZ2fRX4v8nmUld8jZjf9yHJnmDo/+ssOyIvrD0OzIdV6se4Yr4vZ3IavprjPU8ZXWV0A7PJJWo76QZKETdLdrF53j9x96IgDCKXMs6KxA35aJOuMlR7XON/dquICx+o2skTJnvIPW614px/sfPt5FNMy0SaeTrThETB6WT9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+4HPXVczpd//tOGvgos9oXwkWTw2F29F1hkpbXCE9uo=;
 b=jfu4zUTA/hGtyA6aGz7hWhP/ZF0D7vhMf5gL8qXNTIbmw8eAJlGCyjIJiEnIhhel6Zl+5JyM97j0tkvoDrr0C6cbX/tEyJWIbdnb5hMOQ8AqI+Iev3sXUyYHcLPvVb3wjY2Hx4qzMcge5m4iAA4WYStR2KcLG2T6czejkOkGNg/QU2iofF+bOeEXIeEzcsFcM7dU82D6DAMNiWmksZIQWyKmJ9gDvb+ZYw8o4IBlKbiaKVrVv2Wf+8FhMwjxf71UEPrYT3bbXE3fsMNRrMtjsIjgPORGPUTBwKZsFGktVWk8lZCh8ORX+2s372oSpYJUOkluFjN7E+6XSOxpxcVfnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+4HPXVczpd//tOGvgos9oXwkWTw2F29F1hkpbXCE9uo=;
 b=Q7rwXYI6+TBrPsQelz8uZk+S19FNpayB4Q2IDsSWZF4PKuk4c3xihOkpIBKfhzvZX2SnLwS+FCwmdwai0ganxR2LGZhiHm0gGqAnalvmtCsFW9wdLQkehBmxmOOQgEy1rqPr0xPIgWp1O9GB6hrqh0NR95Od5dEa7NdsfrNvnW0=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB8PR08MB4138.eurprd08.prod.outlook.com (2603:10a6:10:a4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Fri, 17 Jul
 2020 13:21:47 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3174.028; Fri, 17 Jul 2020
 13:21:47 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: RFC: PCI devices passthrough on Arm design proposal
Thread-Topic: RFC: PCI devices passthrough on Arm design proposal
Thread-Index: AQHWW4kYTVU0hTDyYEitKlUuU5vZlKkKf2uAgAACLICAAC0rgIAAqC0AgAANcgCAAD7ogIAABC2AgAAb6YA=
Date: Fri, 17 Jul 2020 13:21:47 +0000
Message-ID: <0EB29B08-E36F-4577-9140-30B70834D5D4@arm.com>
References: <3F6E40FB-79C5-4AE8-81CA-E16CA37BB298@arm.com>
 <BD475825-10F6-4538-8294-931E370A602C@arm.com>
 <E9CBAA57-5EF3-47F9-8A40-F5D7816DB2A4@arm.com>
 <alpine.DEB.2.21.2007161258160.3886@sstabellini-ThinkPad-T480s>
 <BB4645DF-A040-4912-AC35-C98105917FD5@arm.com>
 <f69f86dc-7a8c-4c25-c059-0e391de51d7f@epam.com>
 <547d91e8-a6fe-6430-b020-f9c550bfc22b@xen.org>
 <0cfe750e-2213-d6d3-80c5-494ede727304@epam.com>
In-Reply-To: <0cfe750e-2213-d6d3-80c5-494ede727304@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [2a01:e0a:13:6f10:d5e3:98:5df0:fb15]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 07d7b76f-96b3-4ad3-975f-08d82a54600f
x-ms-traffictypediagnostic: DB8PR08MB4138:|AM0PR08MB4499:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB4499ED8C01626E14B0C8D6669D7C0@AM0PR08MB4499.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: YqpVEQNiQ81Z4vgs1ZqkTp0bqmr+jtwpVwx0uoatlxhXxjKIp4LinluZVpjE+c6rE4KajYtHVSsoNO+orwC83o0PTLzsxB1JurlD5432DU9ZEcJp5guHdlFlXN2sqO+/02m7kWmoqNXkWDBqv+rVwyFQQKwHXn3mqglvWkbzsEuNbEhggmK3+yPL6sBg3J9VGpGNR91p7MHzdNwKdGK22+ZJGo7u4G+JY0O+JiYCuBMtmO53B0om9UpWb9qLUO36yod5kMTNac6yXfWq8pAh/vPhqC1+ysz8bu/zGHch9VNUz3VtTELTjILg0oN1xSs99u7UNS2BFfwv4aephOwWvg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(376002)(39860400002)(136003)(366004)(396003)(346002)(186003)(83380400001)(2906002)(316002)(6916009)(6512007)(71200400001)(36756003)(66476007)(66946007)(76116006)(5660300002)(66446008)(66556008)(64756008)(91956017)(6486002)(54906003)(478600001)(86362001)(2616005)(53546011)(4326008)(6506007)(8936002)(33656002)(8676002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: vPNRC9oVAOs4CnjS9nLYNKGvHDjPmc0MfI73yYSBXqrpMw1Sa04StZ+vMPj/s64TnACgtsv3wTlCdpw5PRp/zIu1xW3iQ4zcGcAsQ5cxYfu90E8+FEj1Sy7fxXNKndJqo01ojAEL+//661Ao2QO3ERO9em2r5hkvdYucEkWVTSFoil1nrWhycPrKcvHE15UBX7sSDG4YZabvO9agwsr/8SzDPMDccwX7WKlCeb41jaisiGEJO5gX/l3011ivtjxCeXO41Gw+ZCWU+1KXzdlHl2uz0DEe2kgROMcIy0mwS+Ygv3TJ7Seb6yQbLZushl91ykthl5uF3r3zwTX+5QBCIlQaMFv4+77WQ2m9t+E/dMjHvA36x7807xkVYiYTryz92aa70kDxPXFp+aOMzATa2AI1rhEtf9aVcIOWElPPXgjCwrngxK9ulJMCKQMRwQMC9mhGc5daHQexJUpe/ur/ImkFauCQWwEpPC+6kOcLLnGG1oSaoXGwbSbG6RFdzMyATYzWOU5TLDIuC7oU+d7KGrrBIekxXsd+D4k8HJPXnwc=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <22D716B97F15E34A933CB9B1F04585E3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4138
Original-Authentication-Results: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(39860400002)(376002)(396003)(346002)(46966005)(8936002)(4326008)(8676002)(36756003)(81166007)(6862004)(5660300002)(70586007)(6486002)(82740400003)(70206006)(47076004)(316002)(2616005)(107886003)(6512007)(82310400002)(86362001)(53546011)(336012)(26005)(2906002)(6506007)(356005)(33656002)(83380400001)(54906003)(478600001)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 51841fd9-f0c3-4543-f493-08d82a545bd1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C20OgalB2wAuVyJVWTbcl6LofdjEr3ctJ1gmnTLJ32UejPRzMRsQOi7WpOvN9Oy38k2b7V8slhMxy/VfdKc0JNayI2yIQDeLQmiiUu5wMo0Yws4wLRk8U0BEFtUqra4GG27uU++e89OyXRFoFRzYIog2b+waK64vCVDYjtMaXgIxZHHDU0JuuncqyLMgCSc2wMZ85CiCrUQB6HbuaSEGVyoSyWGRwURAMM5B3xJjdwKzCWWRcmDgNpmKNq3+AxiHc0g3OeVPHSAEB+S+P+imKsvhIuFTiXcR0QRjY/sfMbfwJaC7JdPz8ewLW42I3q+F9wIOIxMxh62GxHCV5+L8NxUqCjaxTc9tyXapF0Mt4wqb3EsbxApFUMxMu7U4zPmEp1mAHeBE/9ozxnGRl1aslg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2020 13:21:55.0119 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07d7b76f-96b3-4ad3-975f-08d82a54600f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4499
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Julien Grall <julien.grall.oss@gmail.com>, Rahul Singh <Rahul.Singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



> On 17 Jul 2020, at 13:41, Oleksandr Andrushchenko <Oleksandr_Andrushchenk=
o@epam.com> wrote:
>=20
>=20
> On 7/17/20 2:26 PM, Julien Grall wrote:
>>=20
>>=20
>> On 17/07/2020 08:41, Oleksandr Andrushchenko wrote:
>>>>> We need to come up with something similar for dom0less too. It could =
be
>>>>> exactly the same thing (a list of BDFs as strings as a device tree
>>>>> property) or something else if we can come up with a better idea.
>>>> Fully agree.
>>>> Maybe a tree topology could allow more possibilities (like giving BAR =
values) in the future.
>>>>>=20
>>>>>> # Emulated PCI device tree node in libxl:
>>>>>>=20
>>>>>> Libxl is creating a virtual PCI device tree node in the device tree =
to enable the guest OS to discover the virtual PCI during guest boot. We in=
troduced the new config option [vpci=3D"pci_ecam"] for guests. When this co=
nfig option is enabled in a guest configuration, a PCI device tree node wil=
l be created in the guest device tree.
>>>>>>=20
>>>>>> A new area has been reserved in the arm guest physical map at which =
the VPCI bus is declared in the device tree (reg and ranges parameters of t=
he node). A trap handler for the PCI ECAM access from guest has been regist=
ered at the defined address and redirects requests to the VPCI driver in Xe=
n.
>>>>>>=20
>>>>>> Limitation:
>>>>>> * Only one PCI device tree node is supported as of now.
>>>>> I think vpci=3D"pci_ecam" should be optional: if pci=3D[ "PCI_SPEC_ST=
RING",
>>>>> ...] is specififed, then vpci=3D"pci_ecam" is implied.
>>>>>=20
>>>>> vpci=3D"pci_ecam" is only useful one day in the future when we want t=
o be
>>>>> able to emulate other non-ecam host bridges. For now we could even sk=
ip
>>>>> it.
>>>> This would create a problem if xl is used to add a PCI device as we ne=
ed the PCI node to be in the DTB when the guest is created.
>>>> I agree this is not needed but removing it might create more complexit=
y in the code.
>>>=20
>>> I would suggest we have it from day 0 as there are plenty of HW availab=
le which is not ECAM.
>>>=20
>>> Having vpci allows other bridges to be supported
>>=20
>> So I can understand why you would want to have a driver for non-ECAM hos=
t PCI controller. However, why would you want to emulate a non-ECAM PCI con=
troller to a guest?
> Indeed. No need to emulate non-ECAM

If someone wants to implement something else then ECAM in the future, there=
 will be nothing preventing it to be done.
But indeed I do not really see a need for that.

Cheers
Bertrand

>>=20
>> Cheers,


