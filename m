Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C97C22F3D1
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jul 2020 17:28:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k052S-0005rz-2I; Mon, 27 Jul 2020 15:27:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s7zT=BG=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1k052Q-0005ru-EB
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2020 15:27:38 +0000
X-Inumbo-ID: b2aa484e-d01d-11ea-8acf-bc764e2007e4
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe05::610])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b2aa484e-d01d-11ea-8acf-bc764e2007e4;
 Mon, 27 Jul 2020 15:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=abeDaZp8PSQysPOwTzxejPKX3OzNPTMntkedkWl94oI=;
 b=xdG9EsYVc2uvmxNqgLNUiAhuXLPnmE1eHhaJTULhHcmT7BTLaedmv0oAg9E7holr3Q5JDzE4sph+BabV5yPJ9Zsa/QXUAN7vkCWJV5IHOJ98jxPp4z7ZNa7mbFWVNldn8JJbmiqv/+pqAhicfxq8fashiKUwfi/6X5wVs2n1fH8=
Received: from AM6P195CA0019.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::32)
 by VI1PR08MB4334.eurprd08.prod.outlook.com (2603:10a6:803:f1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Mon, 27 Jul
 2020 15:27:33 +0000
Received: from VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::7c) by AM6P195CA0019.outlook.office365.com
 (2603:10a6:209:81::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23 via Frontend
 Transport; Mon, 27 Jul 2020 15:27:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT023.mail.protection.outlook.com (10.152.18.133) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.10 via Frontend Transport; Mon, 27 Jul 2020 15:27:32 +0000
Received: ("Tessian outbound 2ae7cfbcc26c:v62");
 Mon, 27 Jul 2020 15:27:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c4fbdf5884710f1b
X-CR-MTA-TID: 64aa7808
Received: from 10f074bb4d2c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E01B0C4A-986A-423F-A575-02543C929001.1; 
 Mon, 27 Jul 2020 15:27:26 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 10f074bb4d2c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 27 Jul 2020 15:27:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VGJXncQrcc2rL8cwgTJajPLX3v0fwsNSWwFBbkicWHb8tcyEMAjN9fnmUSoUGaRA+BdiiWfSzD+4QpbbQHC0+w78eKQfhNVn2rVM69HLTi3rELzfKv0poqIv7fHMHL9jCjN81ONVGnklF3w+w/xc5augBNwIMPIFbKsblGSjnXLf74Gedcn7snsa+VliG8Du5XzmjVdMaSmMVuufevgb0nI5UyNG7dfEW4hTGTK/SLM3W5Ck4gBh93PEh/r+N/PjGpGZfmZvSdOZw5tm1r8ublIPes4JsupiwGBRpJrAKk/N5du5M2NcZdoxLf+HAeeoCvOvC8pH7Njl51wAI1TxmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=abeDaZp8PSQysPOwTzxejPKX3OzNPTMntkedkWl94oI=;
 b=Cyt2b4obKmNf300HSiiDVFbpJq4K/DguRk79to4mF/x0Vr9pQu1qNgfKstwYjn0JSo6jRfchp7Iik1ql+ZITvW53VMqxKX1YMWkb0wpywAiD1R/qT8wIF6xJTcvhEIc3U2WOrXwx5CqrTnm23jjP+low8lUoxb4+reP9iEbEzKQg179eXt4V8XCMLH8zi8scSLoCXYZZrAJvbYLxs2beqcx+bK1lbSy17Jf4u9LkGvqGTEcfFH14hnnPbBJ4VIDDOGkRbWbonEgliA57zm2DyUfjBhtx7/sx6MQeShEhSkGj06EM84Nimm51OarBUWKGo0pLFxmABNZrOBsey0lWfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=abeDaZp8PSQysPOwTzxejPKX3OzNPTMntkedkWl94oI=;
 b=xdG9EsYVc2uvmxNqgLNUiAhuXLPnmE1eHhaJTULhHcmT7BTLaedmv0oAg9E7holr3Q5JDzE4sph+BabV5yPJ9Zsa/QXUAN7vkCWJV5IHOJ98jxPp4z7ZNa7mbFWVNldn8JJbmiqv/+pqAhicfxq8fashiKUwfi/6X5wVs2n1fH8=
Received: from AM6PR08MB3560.eurprd08.prod.outlook.com (2603:10a6:20b:4c::19)
 by AM6PR08MB3879.eurprd08.prod.outlook.com (2603:10a6:20b:8c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Mon, 27 Jul
 2020 15:27:22 +0000
Received: from AM6PR08MB3560.eurprd08.prod.outlook.com
 ([fe80::e891:3b33:766:cad5]) by AM6PR08MB3560.eurprd08.prod.outlook.com
 ([fe80::e891:3b33:766:cad5%6]) with mapi id 15.20.3216.033; Mon, 27 Jul 2020
 15:27:22 +0000
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [RFC PATCH v1 1/4] arm/pci: PCI setup and PCI host bridge
 discovery within XEN on ARM.
Thread-Topic: [RFC PATCH v1 1/4] arm/pci: PCI setup and PCI host bridge
 discovery within XEN on ARM.
Thread-Index: AQHWYPbO0TX+B10vbkuLRSjkBERSxqkV0u2AgAB8NICAABFdAIAFMmuA
Date: Mon, 27 Jul 2020 15:27:21 +0000
Message-ID: <53A27297-DC0A-4C2F-A978-885E1B9A7603@arm.com>
References: <cover.1595511416.git.rahul.singh@arm.com>
 <64ebd4ef614b36a5844c52426a4a6a4a23b1f087.1595511416.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2007231055230.17562@sstabellini-ThinkPad-T480s>
 <3ee41590-e8ca-84d6-3010-6e5dffe91df0@epam.com>
 <276d6b48-8cd7-7fb1-1d76-15cb6a95cad9@xen.org>
In-Reply-To: <276d6b48-8cd7-7fb1-1d76-15cb6a95cad9@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.38.125]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ff3b98ab-7c7a-4a98-ff7b-08d8324194cc
x-ms-traffictypediagnostic: AM6PR08MB3879:|VI1PR08MB4334:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB433415DA78E2DA4DA372C09BFC720@VI1PR08MB4334.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: MXp+SXQQUiOk92s/WkEN3q3xzXtz9H9v368q6XiAlATePXX+WOlOrF8l6H98t46cAPYc0uj+j0+9vQlAiZhm6+kZg/ihxFJLNGGa5ALI/IRfBFJiaQAI/shuIVsP6N4eFgpli7netN5VQ992zoDcitQb3hO9kl8trm5kPOEv+7r5P2UMF3M7CUyb89qD2E0M9wrHtsie4TQKE61hiwTUyY6w6BrJp2rcBrETFre2EkxO3oFulHCumfl9Zc6fP48CfMF92LR27EM0TBCzj9ZzfqNeyvuUrQskDkXkEPUNJF4laI7wu4hPGUVxDb+Xi49Kx4KMug6g9t/N6+qzH6B4iw==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM6PR08MB3560.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(136003)(366004)(346002)(396003)(376002)(478600001)(71200400001)(4326008)(54906003)(6916009)(2616005)(6486002)(8676002)(316002)(8936002)(55236004)(6512007)(53546011)(83380400001)(6506007)(186003)(86362001)(33656002)(5660300002)(64756008)(26005)(91956017)(66946007)(76116006)(2906002)(66446008)(66556008)(66476007)(36756003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: ditiIIPoZFTLVHS9HNqC7xVJoa7updy4FSZjdBXvPbxAY8hnbQPLAww91mIZT3ZKVOw3d+UYQOrfjcCbzGwLWEOq6RZ1cGyW04hPEWLCMDBRSUjCE8I46ri6dRX4wdQ9efHeHSyVuMFn1z5BHvmZkSyITCZtwkVCegSlqXJDbEd40GVIF7EFTWog83pD6kwYEfH/oRgi0FbBUxvJkun4fxbr/CR6ATkJfNzkuZ/Sbl8I0U58DZ0HYhPBqE9MsuMydvOoa6211IRKtdeSzi4xv9pSsV8RkpWarfBtCzDWbT3gUXitV+L/y4tjaMd30zhz7oiCpsIsRBW175vQp98XoyVG4ZP/aglfMhY2hHFCPb50UhFCj/1lSMr4NFeGZyhSyyTlhGouBV1wYnzYyKbF6FXbPsUvAdftnvzL1NjN2OU8vpqG+5kQWBUjyURF3epn5rl2CzD5eGiSlPhtfzpwsYdicuKEV+HY6bs94QdFKjw=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F9FA100E897C9F4AA804C4BB60373C25@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3879
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7bf6e424-482a-45da-a8f2-08d832418ea8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4ZnFl/TJFk6TgRh/DR2OXTZQFM6tp9uG7Et2IZkJj3PJBzABDy7sqaQPfYJWdb0ki94uYLq4ueOSsZwbhpIDv1lyRdEJjq5aGVMPo7tT5EOokcSBV0huBqqd/Qdko9vBTG8hEWzJcB8jhDAbI37HNldRQz5JESn6IfhIaavT2ldd7eQ8DahnQyOJHFuE+yGoXYw8Nrt9t20tYayMWiMsrLIXeGoROHFrS3OaRid3Sb++N6fJLcRrl2bkfM8JNh6AvYWNB4Nj/PaaH32FZ+0XSWB8ojX50qgsemjNSAdqmxnsXBe1Pm+7Ru6vNyX6laiPaN0DBBeDSgbL52p4UZv5RMSXZ86c/XSD4eeOa/v7J2wB1Am7ZMFuyTohBfIQaLX/vqfJHM9bJbkjTDKdqgFldw==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(346002)(376002)(39860400002)(396003)(46966005)(5660300002)(70586007)(36756003)(70206006)(26005)(8936002)(33656002)(478600001)(186003)(53546011)(336012)(83380400001)(6506007)(2906002)(2616005)(6486002)(356005)(86362001)(8676002)(82740400003)(82310400002)(6862004)(81166007)(47076004)(4326008)(6512007)(36906005)(316002)(107886003)(54906003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2020 15:27:32.2501 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff3b98ab-7c7a-4a98-ff7b-08d8324194cc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4334
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



> On 24 Jul 2020, at 9:05 am, Julien Grall <julien@xen.org> wrote:
>=20
> Hi,
>=20
> On 24/07/2020 08:03, Oleksandr Andrushchenko wrote:
>>>> diff --git a/xen/arch/arm/pci/pci-access.c b/xen/arch/arm/pci/pci-acce=
ss.c
>>>> new file mode 100644
>>>> index 0000000000..c53ef58336
>>>> --- /dev/null
>>>> +++ b/xen/arch/arm/pci/pci-access.c
>>>> @@ -0,0 +1,101 @@
>>>> +/*
>>>> + * Copyright (C) 2020 Arm Ltd.
>> I think SPDX will fit better in any new code.
>=20
> While I would love to use SPDX in Xen, there was some push back in the pa=
st to use it. So the new code should use the full-blown copyright until the=
re is an agreement to use it.

Ack. We will use the copyright until we will get the confirmation from the =
community to use the SPDX in XEN.
>=20
>>>=20
>>>> +    list_add_tail(&bridge->node, &pci_host_bridges);
>>> It looks like &pci_host_bridges should be an ordered list, ordered by
>>> segment number?
>> Why? Do you expect bridge access in some specific order so ordered
>> list will make it faster?
>=20
> Access to the configure space will be pretty random. So I don't think ord=
ering the list will make anything better.
>=20
> However, looking up for the bridge for every config spec access is pretty=
 slow. When I was working on the PCI passthrough, I wanted to look whether =
it would be possible to have a pointer to the PCI host bridge passed in arg=
ument to the helpers (rather than the segment).

Yes true every config space access has to scan the host-bridges list to fin=
d the corresponding host-bridge. I will try to find better solution so that=
 no need to scan the host-bridge every time for read/write access.


> Cheers,
>=20
> --=20
> Julien Grall


