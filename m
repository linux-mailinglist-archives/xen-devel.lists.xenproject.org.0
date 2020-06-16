Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEA91FAAAE
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 10:04:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jl6Zp-0003AB-8Q; Tue, 16 Jun 2020 08:04:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dfkc=75=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jl6Zn-0003A6-W8
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 08:04:12 +0000
X-Inumbo-ID: f577b468-afa7-11ea-8496-bc764e2007e4
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (unknown
 [40.107.12.59]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f577b468-afa7-11ea-8496-bc764e2007e4;
 Tue, 16 Jun 2020 08:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eINlkI8XYulyl2J0Z2VMQ3PQ9YyXQUUYugIAai6Btis=;
 b=Mt6TnnCISNgVMW4fwwL4rxjTMlRk1xByB7lo2LtdLQr8okvLs1gWO+pG1HQk2ViUcjYf1Z/UTpEpYcbephqRnfGjmoNUGdw1yXeSVghYf4gR5s96umZKKFl79KZt0ZOQhAu+Jt+YoK8DI8YuPsx2YdrRXtP6vIZVJcVI/EiXuZY=
Received: from DB6PR07CA0097.eurprd07.prod.outlook.com (2603:10a6:6:2c::11) by
 PR2PR08MB4761.eurprd08.prod.outlook.com (2603:10a6:101:17::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.25; Tue, 16 Jun 2020 08:04:08 +0000
Received: from DB5EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2c:cafe::4c) by DB6PR07CA0097.outlook.office365.com
 (2603:10a6:6:2c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.10 via Frontend
 Transport; Tue, 16 Jun 2020 08:04:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT017.mail.protection.outlook.com (10.152.20.114) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.18 via Frontend Transport; Tue, 16 Jun 2020 08:04:08 +0000
Received: ("Tessian outbound 0dafac4cedb7:v59");
 Tue, 16 Jun 2020 08:04:08 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8bff545eda6cd084
X-CR-MTA-TID: 64aa7808
Received: from e0357805048d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DD1E6462-4E88-4C78-B001-5399A71EB4B9.1; 
 Tue, 16 Jun 2020 08:04:02 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e0357805048d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 16 Jun 2020 08:04:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nxcpfhDwgvzUwbImqfhYm20OFC5Unbk4olPwqhzdfuQeVOZ0gnioZYFHZe/Himp3bkiLGuhF6jub7TdrZwqnASNENFji4Pdgl9stvPi93A3jylEy+EKeerGQroDG/wiNkF+P81A/3n//T7eYVRtFC55XLB3n/U6/NiVTYSYdIt7M+YZjpmc2+zOcXal2jpBsxW6kn+JnkGqhgrUlHbQOT+hN6oHSuIw3b8WAPUKVxAftwsEDkB8yRQaKxKfttH0vo9ZojOCGJAa/I+2wHRFQuF0AUaw1bSicmr7H9vrSnG3FroEiTOu5DMDEp2t3OBixpCvK55EI6Fhmz2U0PwXPhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eINlkI8XYulyl2J0Z2VMQ3PQ9YyXQUUYugIAai6Btis=;
 b=oBIUyMScTD3yAY/+HU2ziPLCM3ulRLI2IjX94CLN9CZ1A6VWQWHiQU3U3zsLerwU5vWlnJ7qLWu7aoBbCBWE2dTOLHugwC1PoCQdaZPRaN6f1Iv4pu6jjeucKAxe5iqzx8PnVtp7kWwEKm0rOf3PvjdNDr+XXfndPy2VcMvzlIe/rirzEgMg0Rc/kDu9XwbDsOrFopH3XvlMnat6lRZ3L1Cu4Q2HBccOqeVANMMQoFsdH+XPNqkrMURexvBkjn6wq/VGubr7mp1aHlmTZLK29GgHjJu6oRLMj6qTPTHZlzH5uoC2ZgFCV9qxdxiqGKSQwGJq/zBIW7yAmJj91y68iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eINlkI8XYulyl2J0Z2VMQ3PQ9YyXQUUYugIAai6Btis=;
 b=Mt6TnnCISNgVMW4fwwL4rxjTMlRk1xByB7lo2LtdLQr8okvLs1gWO+pG1HQk2ViUcjYf1Z/UTpEpYcbephqRnfGjmoNUGdw1yXeSVghYf4gR5s96umZKKFl79KZt0ZOQhAu+Jt+YoK8DI8YuPsx2YdrRXtP6vIZVJcVI/EiXuZY=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3179.eurprd08.prod.outlook.com (2603:10a6:5:25::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.23; Tue, 16 Jun
 2020 08:04:00 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3088.028; Tue, 16 Jun 2020
 08:04:00 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Richard Simpson <xen@huskydog.org.uk>
Subject: Re: ARM - Successful install on RockPro64
Thread-Topic: ARM - Successful install on RockPro64
Thread-Index: AQHWQ2ShrK3tkdZjw0a1QQM7WjbXL6ja4peA
Date: Tue, 16 Jun 2020 08:03:59 +0000
Message-ID: <6AB44468-BD6A-4140-B0EF-3D2E5EDC99A0@arm.com>
References: <46497134-fb7c-3d1f-6414-539138856480@huskydog.org.uk>
In-Reply-To: <46497134-fb7c-3d1f-6414-539138856480@huskydog.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: huskydog.org.uk; dkim=none (message not
 signed) header.d=none;huskydog.org.uk; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 857c4306-1060-40ed-02e7-08d811cbd882
x-ms-traffictypediagnostic: DB7PR08MB3179:|PR2PR08MB4761:
X-Microsoft-Antispam-PRVS: <PR2PR08MB4761841BC1F70A1B87C017299D9D0@PR2PR08MB4761.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
x-forefront-prvs: 04362AC73B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: T/yLF0MAdWCmSxLNAHaakxxR52c0nrYwb7IPdhN5C9VE/HILo+c1/oq1XrH1SCdDQudLv89YyjdyY6awP5SiXfln+s2kBLv672qTRebp0J6bscan4JXOWbYzjEzy4MShptNQfgb4tbA+AL4LcEGFkvBQEl3SZrXn0HinKN+gFDoCUlETaik8kFz4I7MkWC2xYkXBb8qd5eYKGOpET1ftqUE68hqrOyyU6b6/OV9V7YALozGDBLKaIUPXbOeFVrYWcF49EhW0TKd2ry4shnAH8tkwWKO8wDwf2yLQfPTjIZQcAfbB78WGkvAwnbbGRIC4iwEMupVF2Q4QwfopLWIuuw==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(366004)(136003)(346002)(396003)(376002)(39860400002)(66446008)(64756008)(71200400001)(83380400001)(4744005)(91956017)(26005)(478600001)(6486002)(86362001)(33656002)(2906002)(316002)(66476007)(76116006)(66556008)(8676002)(2616005)(5660300002)(6916009)(8936002)(54906003)(53546011)(6512007)(6506007)(186003)(36756003)(66946007)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: yHJM7g7gLM8PyMIQoJgOoun3rL6ceoNiuuvda/W2EgwRJa4jb49LQZ9YjKiWMFPjzVDDGKHF8683xE5ZfywT6a5SafF/vOAvoXATl3fbHeQNCByap7cOSmJqZt7iahoyvGLvhAyNGHJNJYDJbKEAGvOdvJsyIbhylWhrod9ZVBEd2LEQpPi9o/FUsVd9hSee8YlhwzptKrxlVcZ8YTYmNJtjsfXqbK6jqXWtrH/WCHtgty1HGQITVDRdWs3NjOR3g94tZopEqmN0Kv4X5bpIVEqx+4IIlW2SiqwElw7a0bTFkLuAMq1cGOvaz4pIrokGdD/61IA9/mm12VA6Zty3xJg4nZNgRmJxloHFgXsJNNqOinBCeSh56iNe0r4/QEimUPnrkWQwxY7Xugw3nTFfmebGU8xJYcuZKIOQRTXBNN/1YY8WMViQQFpLdC9bwLKoedHjaP0KqAVXTXjReIKZfyscTh3EDfN2U+UOTvxFqEBvvQ/xKwUWmw+1IRpwIEUP
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C76C552709925D4E9F6CB3FA69795BE1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3179
Original-Authentication-Results: huskydog.org.uk;
 dkim=none (message not signed)
 header.d=none;huskydog.org.uk; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(376002)(346002)(396003)(39860400002)(136003)(46966005)(54906003)(70206006)(316002)(82310400002)(70586007)(5660300002)(33656002)(356005)(81166007)(86362001)(8676002)(6512007)(82740400003)(2616005)(36756003)(26005)(478600001)(4744005)(186003)(47076004)(6506007)(53546011)(4326008)(83380400001)(8936002)(336012)(6486002)(6862004)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: a240e052-8f4f-45ce-8d65-08d811cbd3ae
X-Forefront-PRVS: 04362AC73B
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dwVnWkFPmeBzDqOM0MLrYnVkeGaVD1uT6CNZ9d1bGeopeSte6Hery5OMZXamZgJohLkmqd+bxDQfe/ERpSStcERTEPMWz+4DxaRJaYiDqmBn7ulbRUfeeYfzgwo9rmQgl9Toe3J0bXcUd35Hi8gA6rmQl48Ugl2UOMwI/dWh8BpJIrQHjiREfz8DYULQ6g8VFlFPfxQhBFb8xq16LELRkwr42EyGPn3qJL5udg6mx33TYG741nBQUBMRFfXTJdtKRg3LZ9mschWcJBnNjHagJL1k51lNVn5GN3kgB9lK5X9PhhZhxhUtP22EpJQmxiYusC2KNJnMKYC0XV4tqHE6+3OszJ4HMSWq982MrVCgwn6nOPMPFniFVoPNAxq/cnxIks2ic5zpseXMCRKW5yECMg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2020 08:04:08.1287 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 857c4306-1060-40ed-02e7-08d811cbd882
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4761
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Richard,

+ Julien and Stefano

> On 15 Jun 2020, at 23:29, Richard Simpson <xen@huskydog.org.uk> wrote:
>=20
> Hello,
>=20
> Just to report that I have successfully installed Xen on a Pine RockPro64=
 ARM SBC.

Very nice :-)

>=20
> I am using Xen 4.13 booting directly from u-boot on an SD card and my dom=
0 distribution is Gentoo.
>=20
> I haven't tried to create a domU yet and I am doing everything via the se=
rial console so I can't say anything about the graphics.
>=20
> My biggest hurdle (apart from understanding u-boot) was needing to apply =
the vgic-v3: fix GICD_ISACTIVER patch.

What version of Linux are you running ?
I added Julien and Stefano so that we reactivate the discussion on this pat=
ch.

>=20
> I will be happy to provide more details when I have got a bit further, bu=
t after two weeks of effort I was so delighted to finally be able to log in=
to dom0 that I thought I'd better let somebody know.

Thanks a lot for the notice, and congrats again :-)

Cheers
Bertrand


