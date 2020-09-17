Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A9D26D9D9
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 13:07:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIrl6-0002Qe-P0; Thu, 17 Sep 2020 11:07:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5H3S=C2=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kIrl5-0002QV-1P
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 11:07:23 +0000
X-Inumbo-ID: 23c63ebb-2df6-421d-b9d0-44a4980ec75e
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe1e::60a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 23c63ebb-2df6-421d-b9d0-44a4980ec75e;
 Thu, 17 Sep 2020 11:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xg17D55AajEUSMUyAXVdE2j6eUr38UOkRxqs/wHTaH4=;
 b=STDXrG/KH11sLXEYsnFhBDjGHGyqnGAnEXfxp+gUFdEsdKQhMiVJ1PLL2rvKoWm91f4CuP5HJJF64N2+d8qMHYbDeubR0K2FZ+ADnCqs1YntU15BbI67AziiJ9isui37h1fbE3TiXLvKaggaymfH1htNXJ0VAkJ1/V0R6XA+unY=
Received: from AM7PR04CA0004.eurprd04.prod.outlook.com (2603:10a6:20b:110::14)
 by AM5PR0801MB1700.eurprd08.prod.outlook.com (2603:10a6:203:36::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Thu, 17 Sep
 2020 11:07:18 +0000
Received: from VE1EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::d5) by AM7PR04CA0004.outlook.office365.com
 (2603:10a6:20b:110::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14 via Frontend
 Transport; Thu, 17 Sep 2020 11:07:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT024.mail.protection.outlook.com (10.152.18.87) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.15 via Frontend Transport; Thu, 17 Sep 2020 11:07:18 +0000
Received: ("Tessian outbound bac899b43a54:v64");
 Thu, 17 Sep 2020 11:07:18 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e26bf0be1cef4a38
X-CR-MTA-TID: 64aa7808
Received: from 17e88f7d10f2.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E7AC7505-5769-4561-92AF-D32194A9169E.1; 
 Thu, 17 Sep 2020 11:07:12 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 17e88f7d10f2.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 17 Sep 2020 11:07:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IbI6PhY6VTevWeKmqa3d+0CohAVpR9KNq9hO7ofvKCT3FbOKNK+fwEPfpGqD3xST7dUGQeDokDGaNT6KKjG8wYC5gthhFBW/fDlgXOYOvldjQOX5aMrvOQ06re1W+zGmICQvr6u0FEemH/1pHBr9jWa8QYemBZkixU813c8WgCxrMYVJyiw5KDcmvFkqa7uUd6PwYrnawVuhN3EMQMqNIOn18ngITHLa5T9V3bRZIj5u8oqQUdmBpLv5rDgWgNQflcdZUzJ7Giz/SM+VD4pGIKxb5P9084Kfb7+EZVZUvwd8Yh1AJbOcPFSKj63tF6oTSVokDwNI3TqNU7dLzfG3kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xg17D55AajEUSMUyAXVdE2j6eUr38UOkRxqs/wHTaH4=;
 b=dEy704/YeYGfoR3LOoryLuPwuvu4lCIFuRTn4+mnKQYCBwCVWLYlmqal6CQOqG/BTMpA/6NnxOfJtdGKpiO8BOiplFY56OSak/tezgJkrDEv7TL8reWoVCzxHI6ET0yJJZ40sPO4OBHpeXde2ZcevRQuTG8JBPspJt/hFDHbg+nIyw9wjcknlC48D/dmxflsIRNh/dn+3TOLtYAJIXwuZR/AXJzgzETPQsVfUxU3UcvnF+NsxuHinVE8Em7PFwXyPHmwDQe+0Ye8g7mYTC/BYWqd4kKlqVMDcvyxSgcRLyh5NhogJKU5GVNyb3/MP6ATVpawlUEONDIoQdpL4qUymQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xg17D55AajEUSMUyAXVdE2j6eUr38UOkRxqs/wHTaH4=;
 b=STDXrG/KH11sLXEYsnFhBDjGHGyqnGAnEXfxp+gUFdEsdKQhMiVJ1PLL2rvKoWm91f4CuP5HJJF64N2+d8qMHYbDeubR0K2FZ+ADnCqs1YntU15BbI67AziiJ9isui37h1fbE3TiXLvKaggaymfH1htNXJ0VAkJ1/V0R6XA+unY=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0801MB2006.eurprd08.prod.outlook.com (2603:10a6:4:79::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.13; Thu, 17 Sep
 2020 11:07:08 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e%6]) with mapi id 15.20.3391.015; Thu, 17 Sep 2020
 11:07:08 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Daniel Wagner2 <Daniel.Wagner2@itk-engineering.de>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Andre Przywara <Andre.Przywara@arm.com>
Subject: Re: DT with memory bank of size 0 (WAS: Re: AW: AW: Colibri imx8qxp:
 Missing kernel boot module)
Thread-Topic: DT with memory bank of size 0 (WAS: Re: AW: AW: Colibri imx8qxp:
 Missing kernel boot module)
Thread-Index: AQHWjE8+2zxAKVycEky1ngFx+VInBKlsrL8A
Date: Thu, 17 Sep 2020 11:07:08 +0000
Message-ID: <1649664D-6F04-4E3B-ACBE-CA89C9CE2858@arm.com>
References: <bdb15b12e6f345249ea8bc685ca88787@itk-engineering.de>
 <b97ddb1f-fa6c-b5ea-4fd8-1d0c09c7a693@xen.org>
 <e421d4214c8a4201a917a9aa833de939@itk-engineering.de>
 <45400b8b-6379-e00e-50de-941bb2ff423c@xen.org>
In-Reply-To: <45400b8b-6379-e00e-50de-941bb2ff423c@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b1bdf6cf-557a-4601-99c9-08d85af9d7a9
x-ms-traffictypediagnostic: DB6PR0801MB2006:|AM5PR0801MB1700:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB170011C6F524D09A2162E18E9D3E0@AM5PR0801MB1700.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: aoow1G4QRvKqtMPGaDnv9Cs8FOnkS2XBM1cSvNOJX3Qyc/1rzfU/tPDPR9IWylIrcltXjWYn7xNs2/eHB9M0Hjg+rMovNXaFMG9NkiTKacU9QjltjG34ACVqc0eoOCVoIHskXmXhmeYuF5gs3ezbS2RbNN+16ZDQMXKy4m5ONQW+N12nF1Sw/4D2YB6B8vRoyQLAZqDtBN944NOedOHi8YMl8PYPYpKffH9FHdtS0UAa308zuOTFbwVTogHXstY+Ji7+8PLW+eHpD4RjH9gmq29JI5WQfd07hW0yv/fMtoU7dExLlTn6l3F1dIfUqgiRAEsdHv/BUfb+zJtw4LIHZOuq+aBjx882pGqoRRiEPXbGrcqoMycv65avvXmynYR5bhnJ0VWicf/c1qyEXJLSq+bHyr+7ITRwjpuLrMzU6QmZlt+aNb9v6YnZvgjH/xbuFDKCe71HmPQW/NfMURLtunUVNhIElUB+6TkXs8kCBmA=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(346002)(376002)(366004)(2906002)(36756003)(53546011)(186003)(15650500001)(316002)(33656002)(26005)(478600001)(54906003)(6506007)(4326008)(83380400001)(8936002)(2616005)(6486002)(6916009)(86362001)(71200400001)(5660300002)(8676002)(66946007)(91956017)(76116006)(66446008)(6512007)(66556008)(66476007)(64756008)(966005)(10126625002)(32563001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: hnDeXP/vCSJJOX9AaHVrjwA6Y28SrsKeMBI2EibGddgZfr8CGdGHlecfCtEXOJwnQcYn8ve0mz0WMOAFX/jf/luH9fuDmZD2xxgAYP1ap9+wRgRnbXRLHvWTTby8xh5vA2mYh5WSvPPQp7HmPzCNcjZeFMEZpegtnG7mTCCjWTLMnOXEGqsyoZm3BEkKgp1xgPAQRUe6+27IGP6PFg8C4vGs7/9Ae6cW5S8EiwEcOz/1RNtSeu50zXetYVcE+C6pFpxZrfKKVyPkjrVwcL9J0zl9oKI0YnqQ9pSgokHEMldIaayNaoClUjJ2++pINPrvrfniehoVeTa2DCPPT9Jbv3h0/qTr2etRXxkqnEmQFEvxS2fXb8rplHnainObthsE53RBSOEL4ZiBqO8SrKBpoQcgrXZbIXvZ6acz4q2eGXFqCWkgH0lwwtsphm4QWvmm8rl5cz+jAAFnFomEE9YCy+AqdVXCvF/GSvARK5tLriJqSSQ4rE6PcZv8pA098aY9Y8rGyloVI1y6gTCVd+3bteG5qrHlzY4BUHCN+LzOOoVtFpYFoq6wa0K0rgnLjnPH3xe7jWUZ1/+Vjxw3mI6Q/zWnnoyB1X/LvcnimWonUc8bZ8MXHphf4gGyyPFs8PO5CdRvqBbUyMkge0PUZVbweg==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <33D07EBDEE57FF4C8D83E4FE02927125@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB2006
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8278dcb8-d513-4560-1bf4-08d85af9d1da
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /PpgTxla+qalGCYvy8UCv2KZrPo+XeC+6F6l3pI6IJ5/CB5fiIvfaBIgFDgz9KvS/KZjjk+PNDsC4ujLimQttjAi3+7AxE0e1KyKraGXuoTYiZpu3kRmEhvkoNUtbFHFgctitFAZafXyxB7iT6PEZr0s2kosm50+a8pfbynYsBzBDz+0MprdxKl6Le3w6LarVnuxw0kY2WW5YyZmT5SXllzd9b2eVFrmxYczJZC9hKQAZZm4kSueH8j7nKoTOihrFjPVbYJa7eRa3C2eUfmzhZGujyjFAzcmwODQOldVvkCXXnu0fdkKqlVN+ZFXBz4uOFZqqwhUxb44ee9zDnGpJ7KJj4ncQAtxJIJCq8mckMcqC9qCihkeukIJYOcEqKT7cfCpK7p7aVxky0xBZj+8LupBvc9jiQa1lESTf4JpWjsBgWJtQ5kMb4KqWvtOJZlOavY4JTLumFQJ6bwxjf9eEyuuF4yBviaAPqFjF5fyOTAui6lEv/Iem/u2xI7wAxT0iNlPpDOXiAGP0glCu0BdTXw4Vzs9ZDtbOsqBXUh8aEI=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(346002)(39860400002)(46966005)(83380400001)(966005)(6862004)(478600001)(6486002)(36756003)(8936002)(4326008)(81166007)(316002)(70206006)(82310400003)(70586007)(336012)(36906005)(186003)(47076004)(5660300002)(15650500001)(356005)(8676002)(33656002)(53546011)(54906003)(6512007)(2906002)(2616005)(86362001)(6506007)(26005)(82740400003)(10126625002)(32563001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2020 11:07:18.2599 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1bdf6cf-557a-4601-99c9-08d85af9d7a9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1700
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



> On 16 Sep 2020, at 18:30, Julien Grall <julien@xen.org> wrote:
>=20
> On 14/09/2020 15:26, Daniel Wagner2 wrote:
>> Hi Julien,
>=20
> Hi Daniel,
>=20
> I am moving the thread to xen-devel and adding a couple of more folks.
>=20
>>>=20
>>>>=20
>>>> this is the full version of the fdt that threw the error:
>>>> https://pastebin.com/63TZ9z3k
>>>> The problematic memory node appears in line 126
>>>=20
>>> Thanks! The output looks corrupted as some of the lines are not valid D=
TB:
>>>=20
>>> fsl,pins =3D * 0x000000009300184c [0x00000048];
>>>=20
>>> Although, I am not sure if it is just U-boot dumping the DTB differentl=
y.
>>>=20
>>> Anyway, after removing the "corrupted" line, I managed to get a compile
>> the
>>> DTB. I don't have a Colibri IMX8QXP. However, given this is an early
>> parsing
>>> error, I have just embed the DTB in Xen binary via CONFIG_DTB_FILE.
>>>=20
>>> Unfortunately I couldn't reproduce your error. This either suggests the
>> DTB gets
>>> corrupted or Xen doesn't access the DTB with the correct memory attribu=
te.
>>>=20
>>> Do you have the DTB in hand?
>> Sorry for the corrupted version, I've uploaded the DTB
>> (fsl-imx8qxp-colibri-eval-v3.dtb) to
>> https://drive.google.com/drive/folders/1jbpnz35sC0NbCyEjrkLqelBsKBztW1S6=
?usp
>> =3Dsharing
>> I have also uploaded my modified xen source files.
>> 1. arch/arm/bootfdt.c
>> where I have added the additional printk's seen in the log and
>> 2. arch/arm/setup.c
>> where I rerun the devicetree parser in line 935 to get the logs, since t=
he
>> console is not yet initialised when the function is called for the first
>> time and I
>> didn't manage to enable earlyprintk.
>> I think the breaking point is the second memory bank which appears in th=
e
>> logs (see the output line marked with "!!")  with start=3D0x8 8000 0000 =
and
>> size=3D0.
>> It isn't specified in the DTB, so I am not sure where this comes from.
>> It has size=3D0 so
>> if ( !size )
>>     {
>>         printk("invalid size, bank %d\n",i);
>>         return -EINVAL;
>>     }
>> In bootfdt.c makes the function stop.
>> Log:
>> (XEN) arch/arm/bootfdt.c: early_scan_node
>> (XEN) -> fdt: node `memory@80000000': parsing
>> (XEN) -> process_memory_node
>> (XEN)
>> (XEN) arch/arm/bootfdt.c: process_memory_node
>> (XEN) ->found memory:reg
>> (XEN) ->cell=3D
>> (XEN) ->banks=3D2
>> (XEN) ->mem->nr_banks=3D1
>> (XEN) ->NR_MEM_BANKS=3D128
>> (XEN) ->start=3D0x80200000 size=3D0x7fe00000
>> !! (XEN) ->start=3D0x880000000 size=3D0
>> (XEN) invalid size, bank 1
>> (XEN) END of arch/arm/bootfdt.c: process_memory_node
>=20
> When I tried to run it on the model I get:
>=20
> (XEN) device_tree_for_each_node: memory@80000000
> (XEN)
> (XEN) arch/arm/bootfdt.c: early_scan_node
> (XEN) -> fdt: node `memory@80000000': parsing
> (XEN) -> process_memory_node
> (XEN)
> (XEN) arch/arm/bootfdt.c: process_memory_node
> (XEN) ->found memory:reg
> (XEN) ->cell=3D
> (XEN) ->banks=3D1
> (XEN) ->mem->nr_banks=3D0
> (XEN) ->NR_MEM_BANKS=3D128
> (XEN) ->start=3D0x80000000 size=3D0x40000000
> (XEN) END of arch/arm/bootfdt.c: process_memory_node
>=20
>> Btw 8_8000_0000 is the start address of this systems DDR Main memory,
>> according to the Reference Manual of the i.MX8QXP.
> I couldn't find this value in the DT. It is possible that U-boot is modif=
ying the memory node before jumping to Xen (or Linux).
>=20
> Looking at Linux, they seem to ignore any bank with size =3D=3D 0. I am s=
tarting to wonder whether your DT is (ab)using it.
>=20
> Do you have Linux running on baremetal on this board? If so would you min=
d to dump the DT from the userspace (via /proc/device-tree) this time?
>=20
> In any case, we may want to relax the check in Xen. Any opinions?

It would make sense to ignore entries with size 0 even more if Linux is alr=
eady doing it.

Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


