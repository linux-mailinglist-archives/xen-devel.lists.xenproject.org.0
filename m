Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC3C2C2219
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 10:52:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.35659.67300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khUzm-00042r-2N; Tue, 24 Nov 2020 09:52:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 35659.67300; Tue, 24 Nov 2020 09:52:22 +0000
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
	id 1khUzl-00042R-UF; Tue, 24 Nov 2020 09:52:21 +0000
Received: by outflank-mailman (input) for mailman id 35659;
 Tue, 24 Nov 2020 09:52:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lBCh=E6=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1khUzk-00042K-9H
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 09:52:20 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.55]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ce8ca9d7-6457-47b1-8dcc-c3eecf4b5176;
 Tue, 24 Nov 2020 09:52:19 +0000 (UTC)
Received: from AM5PR0201CA0001.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::11) by AM0PR08MB3634.eurprd08.prod.outlook.com
 (2603:10a6:208:d6::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.24; Tue, 24 Nov
 2020 09:52:16 +0000
Received: from AM5EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::d2) by AM5PR0201CA0001.outlook.office365.com
 (2603:10a6:203:3d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Tue, 24 Nov 2020 09:52:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT004.mail.protection.outlook.com (10.152.16.163) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Tue, 24 Nov 2020 09:52:16 +0000
Received: ("Tessian outbound 082214a64d39:v71");
 Tue, 24 Nov 2020 09:52:16 +0000
Received: from 2e9b45130cab.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1C56E1D7-2A1C-44AA-B574-C98B8747D074.1; 
 Tue, 24 Nov 2020 09:52:10 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2e9b45130cab.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Nov 2020 09:52:10 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB6PR0802MB2375.eurprd08.prod.outlook.com (2603:10a6:4:87::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Tue, 24 Nov
 2020 09:52:08 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::21f3:34c:8f7e:42ef]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::21f3:34c:8f7e:42ef%2]) with mapi id 15.20.3589.030; Tue, 24 Nov 2020
 09:52:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=lBCh=E6=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1khUzk-00042K-9H
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 09:52:20 +0000
X-Inumbo-ID: ce8ca9d7-6457-47b1-8dcc-c3eecf4b5176
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown [40.107.1.55])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ce8ca9d7-6457-47b1-8dcc-c3eecf4b5176;
	Tue, 24 Nov 2020 09:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OYMspa/OlGi/l4ukMEcDAxi0KoqVji6ybi+Ak4X8Tuo=;
 b=zzSyWNRgSBMWAbJFNwvb0Qj8o+1l/vx6LFtPE1ml44rFfBb5H5T7pvOP9Sa2Xc8gknlRhZnORW2osJxvx47tJHhXDm1tYrslDmcO9a4LIcgjDJObA2dy9LnCJozMQAGHulN/r1e3u65gjhj+tMO3d/mtQiUMQHGD8ItNMOsaHw0=
Received: from AM5PR0201CA0001.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::11) by AM0PR08MB3634.eurprd08.prod.outlook.com
 (2603:10a6:208:d6::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.24; Tue, 24 Nov
 2020 09:52:16 +0000
Received: from AM5EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::d2) by AM5PR0201CA0001.outlook.office365.com
 (2603:10a6:203:3d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Tue, 24 Nov 2020 09:52:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT004.mail.protection.outlook.com (10.152.16.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Tue, 24 Nov 2020 09:52:16 +0000
Received: ("Tessian outbound 082214a64d39:v71"); Tue, 24 Nov 2020 09:52:16 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f21d1071c5ff9716
X-CR-MTA-TID: 64aa7808
Received: from 2e9b45130cab.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 1C56E1D7-2A1C-44AA-B574-C98B8747D074.1;
	Tue, 24 Nov 2020 09:52:10 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2e9b45130cab.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 24 Nov 2020 09:52:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SJEzzh+CIlMUSUZRVM1pjRBp5aEvBjMBBHnsnnSoIGhyTfNdJJ/vi2caJn0nypzV9eA771ZWyi72jfjL3H19I1okiVfjqj9uhXviNn2xravYPDN2CGxS7S/k7atpp6CjrpbJL/MwHB8xyKmv1bYpsjbkXh+NJGstJBP5sHT/GZJoR8pg/PM28vwJkwMbt1K8U43RNXyGupjIgbC2ohd4afQg/6w6BLAc/6t2pZfuLtjKsIdjrymPD0YG2goqslEAIIohx0QGiWffRhIF0zrENQy1xNvyzFuea/fwPaoc4kun8RDgyolZbF3F/zemoPnxU7D7MPyxflEEqOF0hj299w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OYMspa/OlGi/l4ukMEcDAxi0KoqVji6ybi+Ak4X8Tuo=;
 b=MwXHtgIzhxsOjUZt1FQ4NQAUR+a9vFyNLA8fa2pS2vdurL0ZBSxqgJJmk6KiZt1pLCDGgs+98uuKBvjjk/euKOvfshaOdCV2pR+cd4hXJ6NbFQ+5JUiqfqdnOj9BRjxOP/mXwra3kyr3p0hVV+wOnPndz7+Fradt9NtpSQjwuGw2HpG/FVJOSvnTKvwR9xL/KU3E9bSOEtUqhvnX5KRFfdIaUvt4zRwg2Lz0Byw4DQ0xN1lb111na9U965h3+sgH7oLN0hquid9zMnhPBCKcq3ITgz4XKQ8ZC1XD+3NydgXCV/rfHPoco1SJgRI4B4VSMX9/2zSVKnlXknh51PCgpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OYMspa/OlGi/l4ukMEcDAxi0KoqVji6ybi+Ak4X8Tuo=;
 b=zzSyWNRgSBMWAbJFNwvb0Qj8o+1l/vx6LFtPE1ml44rFfBb5H5T7pvOP9Sa2Xc8gknlRhZnORW2osJxvx47tJHhXDm1tYrslDmcO9a4LIcgjDJObA2dy9LnCJozMQAGHulN/r1e3u65gjhj+tMO3d/mtQiUMQHGD8ItNMOsaHw0=
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB6PR0802MB2375.eurprd08.prod.outlook.com (2603:10a6:4:87::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Tue, 24 Nov
 2020 09:52:08 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::21f3:34c:8f7e:42ef]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::21f3:34c:8f7e:42ef%2]) with mapi id 15.20.3589.030; Tue, 24 Nov 2020
 09:52:08 +0000
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 3/3] ns16550: drop stray "#ifdef CONFIG_HAS_PCI"
Thread-Topic: [PATCH v2 3/3] ns16550: drop stray "#ifdef CONFIG_HAS_PCI"
Thread-Index: AQHWwZq/qJpu10nDFkuzrG8rOtqGVanWaYOAgACiOQA=
Date: Tue, 24 Nov 2020 09:52:08 +0000
Message-ID: <C88DD0E4-47DC-4D20-8FA9-6ED4502EE47F@arm.com>
References: <96115b2b-c104-e566-2368-6a2439d2c988@suse.com>
 <c5cf7b83-9948-dd87-dfe0-40d36df0db70@suse.com>
 <alpine.DEB.2.21.2011231610110.7979@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2011231610110.7979@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9b6fc64e-54e6-43c2-2c1c-08d8905ea05b
x-ms-traffictypediagnostic: DB6PR0802MB2375:|AM0PR08MB3634:
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB3634035A874821DA25C49135FCFB0@AM0PR08MB3634.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2803;OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 vZGBll6CZn2t8rXzlXU0iwhOuqM0Z1cwW2WJIumoVEtbgAqmS5QtwKNAnYLVJNwfKvfKJ3fC2fjvkTLUVi16v7m84nPOXyVTX1jhsDfN2xCUYF9SdnEue/LnbTkC5aCsSupOQg8HmXnEIhQVE4Mg/AgkRjqykSoI7ROC9ayRg9x17uQO/UPCPabp84mwqOQHRjy2Nia9PDXsl874Au6VmnFueWukyCdm+ruelICIoFIGc/KtivrrypwBvQATkLry73r8/uV59H64/RSLZTJHxD6U0E0HAyoB1q8fTobKJ6AZOyn9LQBwVP+WVyJWcile2M0tpsc1Y+3mCxXqoIbcHQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(346002)(39860400002)(376002)(71200400001)(4326008)(26005)(33656002)(6506007)(53546011)(186003)(6486002)(36756003)(5660300002)(2906002)(8676002)(6916009)(6512007)(8936002)(76116006)(2616005)(66446008)(4744005)(66476007)(54906003)(316002)(86362001)(91956017)(66556008)(66946007)(478600001)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?iPGa9WmDQBupjgHWza5Fh+DIBuDEpaaMGerjV+MMR/yV5HltVYkp5Y0lA5Jy?=
 =?us-ascii?Q?AMNS924ZwUi6smnb8QQS5FSoJboyTwKTxOUXEIWPhARUH9FQ0s0iob76rCu3?=
 =?us-ascii?Q?XO4o2qsXkQi1uMfRz3g588YWecg3A477f1J1hpyLjQUHfVeXA8e3YDLopbCJ?=
 =?us-ascii?Q?Kn8iKtif84ztuRgXRUm/b91HQBWQC4aoElutES4evRbfZX0e9lU08rAUbTL5?=
 =?us-ascii?Q?KlljvZPW5Ds3ScUvIW/2xX35VicKToP9NXT6jOp2JJMPcOgbG/g85iQVlCsG?=
 =?us-ascii?Q?AH8tVb5m0ITlVh7SIRaclq+tREo+bd3KEliRYqGh21W5661SKSI4Vt+ZwvWb?=
 =?us-ascii?Q?d3GBo6bI2r/+bPt10Z5HjXHkOo17WnjtQc50eC1NmnskAQP+plLu5aX9JyqD?=
 =?us-ascii?Q?odQgSmjRyXUIzwoNeR+iVyhUAIlcRD7dT+v9RM0ar++NCQiHEjZfxPm6MGrJ?=
 =?us-ascii?Q?w0Y0u7I6uBgcuSjaIDDFw8BL0tTP8BoNqjsSZXBcsjf5E3m9977lH9ebPS/I?=
 =?us-ascii?Q?5yyvv2ecFHI/ues185qh1I3cgtT2op7FgwIJEo0bQ/PYGqS5i66HlxDp+RG5?=
 =?us-ascii?Q?Q/Q4l/g6tn3Y8FBCA9TQ6XAuR/HY8slKkil9DyvNIwnz7gI/c7yNiVwR0sMP?=
 =?us-ascii?Q?v2fLbKcrMdQPkhP9KaJuGjCZAJT1JD/GXgZa0IPghZBP6icVgCEw8XS3nd6I?=
 =?us-ascii?Q?GEjTdoIDmzQErBC5C0TaZtWkV2xQD/5htomepP2weOplLltdJl598w+UnG+4?=
 =?us-ascii?Q?8XASp45ipXyVgISkBeCZiR5vAZMqcUZtgw6kOk5DbTdsoxF1BCONf1tgwuGo?=
 =?us-ascii?Q?5Hho1Ovzc2/zCqVMC+1eMAiuJaP7nUr4jKhj0nNQvBcs6b1MXgz3LGLI1pjJ?=
 =?us-ascii?Q?GqAYf1T5x0D2RgPxgwVTKeF33M/dCQIHIXX1Gt1JpXvGlQcQz7mSSAYJMN8e?=
 =?us-ascii?Q?824BhENi1sDLscNSQPa5KAfSBg2KddiOj7l32PUcn1ON9/wmzIxcYxyvk3eW?=
 =?us-ascii?Q?Lojk?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <06EB38CAE8B60B4494E4BF309FBCC8BE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2375
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3a50a609-a3fd-48c8-42bf-08d8905e9bad
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UzclhXNX2O+GVA7/PTX0bknlr1qn4hUzHK0q+wuKXcxORkq2G7k/QfDXUXuaFsI4xAHBJdbJRjCVFoPhMJ1VVwy9RcuME90fU9es3wxLdIzEWQyyIkpkVlZKUHS+3kY1pqS9tWe5K6bu9WwpTyfzmK9q3U1YqIbDFK5YCYn8/xFzAv2HV1LyQQHsX+QYkS2bTJTWRjQbMuXOau374BduQiCv4yzP4d0C6XMHcwzGf7j53Vz5+8GNv30zrmwxHWNvU6zsTky31RuN5QZuHruUxnjwgVPtOiJHJEbu8plWgxq7BkWg0gSGry1/DTovv+QJTmouhK10ue2Os+7XNhNq30EQPt/PM9WeZpymQUcLsEOnsgnyXhahYCjFBffdN5f6zjeMu17yTNttJYPSqjUhnQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(39860400002)(396003)(346002)(46966005)(478600001)(2616005)(2906002)(6862004)(5660300002)(4744005)(86362001)(82310400003)(33656002)(70586007)(70206006)(82740400003)(36906005)(47076004)(6512007)(356005)(336012)(36756003)(6506007)(54906003)(26005)(4326008)(81166007)(186003)(8676002)(8936002)(53546011)(316002)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2020 09:52:16.3850
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b6fc64e-54e6-43c2-2c1c-08d8905ea05b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3634

Hello ,

> On 24 Nov 2020, at 12:11 am, Stefano Stabellini <sstabellini@kernel.org> =
wrote:
>=20
> On Mon, 23 Nov 2020, Jan Beulich wrote:
>> There's no point wrapping the function invocation when
>> - the function body is already suitably wrapped,
>> - the function itself is unconditionally available.
>>=20
>> Reported-by: Julien Grall <julien@xen.org>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>=20
Reviewed-by: Rahul Singh <rahul.singh@arm.com>
>=20
>> --- a/xen/drivers/char/ns16550.c
>> +++ b/xen/drivers/char/ns16550.c
>> @@ -662,9 +662,7 @@ static int __init check_existence(struct
>>     return 1; /* Everything is MMIO */
>> #endif
>>=20
>> -#ifdef CONFIG_HAS_PCI
>>     pci_serial_early_init(uart);
>> -#endif
>>=20
>>     /*
>>      * Do a simple existence test first; if we fail this,
>>=20
>=20

Regards,
Rahul=

