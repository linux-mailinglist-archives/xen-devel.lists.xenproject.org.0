Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2A62C270D
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 14:25:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.35972.67654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khYKD-0000EY-3s; Tue, 24 Nov 2020 13:25:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 35972.67654; Tue, 24 Nov 2020 13:25:41 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khYKD-0000E9-01; Tue, 24 Nov 2020 13:25:41 +0000
Received: by outflank-mailman (input) for mailman id 35972;
 Tue, 24 Nov 2020 13:25:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tuHM=E6=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1khYKB-0000E4-8q
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 13:25:39 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.55]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 639e6375-9945-40d2-a893-011a86837155;
 Tue, 24 Nov 2020 13:25:34 +0000 (UTC)
Received: from AM5PR0601CA0081.eurprd06.prod.outlook.com (2603:10a6:206::46)
 by HE1PR0802MB2140.eurprd08.prod.outlook.com (2603:10a6:3:c2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Tue, 24 Nov
 2020 13:25:28 +0000
Received: from VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:0:cafe::ef) by AM5PR0601CA0081.outlook.office365.com
 (2603:10a6:206::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Tue, 24 Nov 2020 13:25:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT061.mail.protection.outlook.com (10.152.19.220) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Tue, 24 Nov 2020 13:25:27 +0000
Received: ("Tessian outbound e0cdfd2b0406:v71");
 Tue, 24 Nov 2020 13:25:27 +0000
Received: from ea14c71aca94.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A60FD409-6F1B-4F55-8E04-BC6E5D2A7C65.1; 
 Tue, 24 Nov 2020 13:25:21 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ea14c71aca94.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Nov 2020 13:25:21 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB4775.eurprd08.prod.outlook.com (2603:10a6:10:da::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.29; Tue, 24 Nov
 2020 13:25:18 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::8567:dffb:80c1:bc0]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::8567:dffb:80c1:bc0%7]) with mapi id 15.20.3589.030; Tue, 24 Nov 2020
 13:25:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=tuHM=E6=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1khYKB-0000E4-8q
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 13:25:39 +0000
X-Inumbo-ID: 639e6375-9945-40d2-a893-011a86837155
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown [40.107.5.55])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 639e6375-9945-40d2-a893-011a86837155;
	Tue, 24 Nov 2020 13:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UVbzaMWJSPUqrJbAHs5E5esD8fonsBvUNk2PUepUqrg=;
 b=HzYX0qo5saOwFrksSm4fj99M1e3vjK8TnSE77GR5GBq1p06NZsCe0nMfaHGUmz6uYiVjVJ06CSmoxFCP9uuknaPMadMQI/FmPbwYolYc3MuIuTvKOrqa4nZwqJlf59KjIW+CL8xWIZWUQ+jgxAl5y9TsdcIXbmvgnmgMZqMEASs=
Received: from AM5PR0601CA0081.eurprd06.prod.outlook.com (2603:10a6:206::46)
 by HE1PR0802MB2140.eurprd08.prod.outlook.com (2603:10a6:3:c2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Tue, 24 Nov
 2020 13:25:28 +0000
Received: from VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:0:cafe::ef) by AM5PR0601CA0081.outlook.office365.com
 (2603:10a6:206::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Tue, 24 Nov 2020 13:25:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT061.mail.protection.outlook.com (10.152.19.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Tue, 24 Nov 2020 13:25:27 +0000
Received: ("Tessian outbound e0cdfd2b0406:v71"); Tue, 24 Nov 2020 13:25:27 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5015fdd956e2b1db
X-CR-MTA-TID: 64aa7808
Received: from ea14c71aca94.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A60FD409-6F1B-4F55-8E04-BC6E5D2A7C65.1;
	Tue, 24 Nov 2020 13:25:21 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ea14c71aca94.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 24 Nov 2020 13:25:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ka0P/TM/BYr+JOI9gvGLjMTtQ+hK8l3vWU/w1ttQ3YIRIhbnKosgV7eMNcpMRu2VwvblCY78DsUttkou5OGc06stpR1zQaUb/IvAx0hhUxoctBjycYLVc2TTVLsFddteO4bFCIdpphYvgkJwWagiGYCdXdKopNslYCiqLy4R3T9GvhZzqZeN3pFliXZZutp01kIuAUyuIM2+0EO2XKPSdflh0MSInUKai3AqPV3nsJh/VlWBUGq7VphVt8G2zYoG66stAIavgjNnFTqV0sjcAMXVDBp5srBbXsCzRpi1pVOoLcDfuoWkGTkZUclyORLDg3twMxNEa6HiLUHvvSr9pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UVbzaMWJSPUqrJbAHs5E5esD8fonsBvUNk2PUepUqrg=;
 b=RXIrkgTFk3+BcuTNeQ2l+dZK2nGmAQ8MOf8VP96oI8DG3WKo2oKbxTNlBxjh30konw1mWAqe3YoPS851oUNR7jpMQaSvYolVn2maUn1GnD2gpi5faChuUB5NtKkYIqiez/U0OPRIQUIOtzMk6F5R5WlbnbAOWVD57dgmBbb/qNA1fyjiQz6MtBXy5uy3BzM3IPgZyPRP8X0l0A+wN5w1HrDX3F3v1lP/CkCg8D22PQakkFUQJ520o8C20C15Gt268JnBOrh9lJyNwLD8Dp8B/DvwA6jkrEFdIsFA6BJtk9cB1+ob9JKKGOH7pkkJbQPjLJKeAm2YB38jW112ZRashw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UVbzaMWJSPUqrJbAHs5E5esD8fonsBvUNk2PUepUqrg=;
 b=HzYX0qo5saOwFrksSm4fj99M1e3vjK8TnSE77GR5GBq1p06NZsCe0nMfaHGUmz6uYiVjVJ06CSmoxFCP9uuknaPMadMQI/FmPbwYolYc3MuIuTvKOrqa4nZwqJlf59KjIW+CL8xWIZWUQ+jgxAl5y9TsdcIXbmvgnmgMZqMEASs=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB4775.eurprd08.prod.outlook.com (2603:10a6:10:da::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.29; Tue, 24 Nov
 2020 13:25:18 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::8567:dffb:80c1:bc0]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::8567:dffb:80c1:bc0%7]) with mapi id 15.20.3589.030; Tue, 24 Nov 2020
 13:25:18 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH RFC 3/6] xen/arm: setup: Call
 unregister_init_virtual_region() after the last init function
Thread-Topic: [PATCH RFC 3/6] xen/arm: setup: Call
 unregister_init_virtual_region() after the last init function
Thread-Index: AQHWvqdS2mJLaroJgEqXj0ki52YbT6nXTTEA
Date: Tue, 24 Nov 2020 13:25:18 +0000
Message-ID: <18463E31-62DE-4859-8453-CF0DCD755103@arm.com>
References: <20201119190751.22345-1-julien@xen.org>
 <20201119190751.22345-4-julien@xen.org>
In-Reply-To: <20201119190751.22345-4-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.9.225.195]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 29e7798a-e81a-460b-8740-08d8907c687e
x-ms-traffictypediagnostic: DBBPR08MB4775:|HE1PR0802MB2140:
X-Microsoft-Antispam-PRVS:
	<HE1PR0802MB2140F967DFCC6540C4DD18EF9DFB0@HE1PR0802MB2140.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:4502;OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 2iONf+4mtKnrmzBwZDzpGmExyQD82UYrgJ4Byh9F/efsKBLHUrKzRnm0sHauQJRVhZvWBom7BgdV0l14sZOf26d/sCnojmn9viBqGTB8KD4LWLVRK3EZzf4QDyKD9q7z+gx1MXiPnSTXe2grojUHHsmcKAkbSMorjYWUP3S4qAEZOnP5D+hn43byC6/2fTcAqVXLFmVznfrnij9mn95Jk3w8nbelyhitppso7sUaZB5Ri0s8vIumMh5vRERVM/ZzGkxE+x7OSBiLpUijq+SgeuQZ9wRC2W3d5I5nzFVdanlLBmxEMF1MN19mly++wEUj9Ct4jnnfeeSUtDerK/J5Ng==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(396003)(39860400002)(136003)(376002)(6486002)(76116006)(2616005)(26005)(71200400001)(186003)(478600001)(4326008)(8936002)(91956017)(64756008)(66556008)(86362001)(66446008)(66946007)(66476007)(8676002)(5660300002)(316002)(4744005)(53546011)(6506007)(83380400001)(2906002)(36756003)(54906003)(33656002)(6916009)(6512007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 /yrVEnu5gOeDj3TvwKOTptCdlH3/nnQzWIrVqt4DkYAYpJ/eGynC4MuW0bf3fbyI+D0QYXHNlyd2T07c7GggsJGYPPIozIm5Z9AkDZvA0DxfddeE66Ffyp4rbPf9sTekrx3z5nTTttt9Nh1TamXhcLWhBhtf8T3zbiGE6B0HuIAe67KMmgaxx41XwM1sOuNhkB1Zxu//EAHO8cAYwB8cDvJXBMUjRmxjpb70+FixpmWrBmAgJj5wVJaxQt+mMbW0cUZ32sQ6eK/0PScogRZsA7xZDSQUCWUHGRrftHIhMTpFkfccQEgMPkAA2E7lOx3mJxt7gdP7eOpXYcSB4IxC4rKBL8JaQlLbV/rljNh0NvEYQKdhWuUpWlKhQmM2gE3easwyiWveE+7AcSXzEFW85asK3evNWGQhlHtmqvI2U9th1WDxnrFvMB1my700QecWIETKbNfXqqyalThVr/1MB8jO2zYHCIqrnrBe+pi4Zau25bq9GHTCEhBt3UU+/83IMB+UQq/M58mbx2HP0Bm2M9fb4b63nsVNJPOduuuDXPcZPQjgsICnzdCxqgLpwab9UWeLsB8hcIEEFaEjAYhUbx66Fcao3+SBh03IesI4YoATXKOAQioCWijSs7nmTTlxvCgNaNWPImGqI3WBVdkw8+53iri1JgOuMEFvs1Pa1Didlic8dFeLKb1N+GTQl+OsS+Yvc7IrDCjNtz5mJqm8M4NTvjxEtuJkA9N1XAfv34AuZt/ujIPmMmX8ghKV+PVoJVlHLqHDch/R5oHaScrrvFfcIxtjG3zAqAnSc1ZLFwwBKSL2Vl+CRJT9gRlwORYb9rdvKKySaVTOvHRUOP3X+wx70GuKd0faq3q9KvMd4nxiQ31Gma77XN7Y26VamaPAues0RxqBqQjLc6gGvajb2g==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9F1C948EB92A684DA2FB0189813EC9DD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4775
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	707d9288-e614-4e77-e34a-08d8907c633c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TUP3NFl94caR/VE6nW8KYA/+kwTKAu/ElVs/jLdC39gafiEKt83ckGa1Vz5nWkUTLUYW+V61JrNhVOVQZorB2+3JS0a7fJRKSL5BGW/2CBa05hzVuKJ3FkYzXDZcmo0IN189/FOZYE5pQp1oaS1BMuCiLamQW1D79PGHk/TWLRPlRg3Yc3PtQ5sIVO+sqXIpP1m3+FknO1mU3IX1tDfNM0RG9D8N2WPzRDcIw3qi8weP8+lFGnXODrJU+WF2U4incgMJXMSKsGrsZi2J0OcKaqIXG2aFQ0Qe6/qL2rf8T86DlnLHm1tJtBVS74rdTp36KptgWGiczh0S6iJj4zQIEuS/XujoUlB42f0UYippCfYH+GyAqBI3sgSw6GaEbj0gQsSP2d8wSOnrpg8yclbx5w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(346002)(376002)(46966005)(5660300002)(83380400001)(70206006)(47076004)(70586007)(356005)(81166007)(82740400003)(6512007)(4326008)(33656002)(53546011)(6506007)(8676002)(26005)(186003)(6862004)(36756003)(478600001)(86362001)(2906002)(54906003)(316002)(2616005)(107886003)(8936002)(336012)(6486002)(82310400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2020 13:25:27.5102
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29e7798a-e81a-460b-8740-08d8907c687e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2140

Hi Julien,

> On 19 Nov 2020, at 19:07, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> discard_init_modules() is an init function, if the path contains a
> BUG() or WARN() we still want to get the full stack trace.
>=20
> The init virtual region is now kept after the last init function has
> been called.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/setup.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 7fcff9af2a7e..2532ec973913 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -72,10 +72,11 @@ domid_t __read_mostly max_init_domid;
>=20
> static __used void init_done(void)
> {
> +    discard_initial_modules();
> +
>     /* Must be done past setting system_state. */
>     unregister_init_virtual_region();
>=20
> -    discard_initial_modules();
>     free_init_memory();
>     startup_cpu_idle_loop();
> }
> --=20
> 2.17.1
>=20


