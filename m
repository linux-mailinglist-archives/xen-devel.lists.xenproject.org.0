Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 007262EAC12
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 14:43:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62002.109468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwmcS-0005Ht-9p; Tue, 05 Jan 2021 13:43:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62002.109468; Tue, 05 Jan 2021 13:43:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwmcS-0005HU-6B; Tue, 05 Jan 2021 13:43:28 +0000
Received: by outflank-mailman (input) for mailman id 62002;
 Tue, 05 Jan 2021 13:43:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PMne=GI=arm.com=wei.chen@srs-us1.protection.inumbo.net>)
 id 1kwmcR-0005HP-3Z
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 13:43:27 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe08::61e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f19897f0-61f4-4200-9f44-c46e0419ea42;
 Tue, 05 Jan 2021 13:43:23 +0000 (UTC)
Received: from AM5PR0601CA0084.eurprd06.prod.outlook.com (2603:10a6:206::49)
 by VI1PR08MB3936.eurprd08.prod.outlook.com (2603:10a6:803:e4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 5 Jan
 2021 13:43:19 +0000
Received: from VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:0:cafe::fc) by AM5PR0601CA0084.outlook.office365.com
 (2603:10a6:206::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20 via Frontend
 Transport; Tue, 5 Jan 2021 13:43:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT004.mail.protection.outlook.com (10.152.18.106) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3721.21 via Frontend Transport; Tue, 5 Jan 2021 13:43:17 +0000
Received: ("Tessian outbound 6ec21dac9dd3:v71");
 Tue, 05 Jan 2021 13:43:17 +0000
Received: from 9674feb2c828.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 62821504-C864-4805-A6A3-14EF30A07D1A.1; 
 Tue, 05 Jan 2021 13:43:12 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9674feb2c828.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 05 Jan 2021 13:43:12 +0000
Received: from AM0PR08MB3747.eurprd08.prod.outlook.com (2603:10a6:208:105::24)
 by AM0PR08MB3588.eurprd08.prod.outlook.com (2603:10a6:208:d5::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Tue, 5 Jan
 2021 13:43:07 +0000
Received: from AM0PR08MB3747.eurprd08.prod.outlook.com
 ([fe80::61dc:45c4:eef0:c88f]) by AM0PR08MB3747.eurprd08.prod.outlook.com
 ([fe80::61dc:45c4:eef0:c88f%6]) with mapi id 15.20.3721.024; Tue, 5 Jan 2021
 13:43:07 +0000
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
X-Inumbo-ID: f19897f0-61f4-4200-9f44-c46e0419ea42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HZHpa2fQDbWt2ZP0/5uJu2qKD1SUpOIGJzflcBawjsE=;
 b=NJGkHNO7hcHvegQFLHc7XDgBoMzeywKR7ILtP0RilBYDCYDNnydrJd7uyzI5PQ3KWCctQ+fSd3rZVQPq7eOio/vuScrznYDq/Cv4CWz+7WuSCQJahMt+M7JbX4oQWXHkMMp8us1An2VeHaSY2fL9VjEUJHAF/BZS4udzeBDx+zk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B8P3q40BvtEM/vKZuDPM5HYFCyX2moWR+Di3k9UcfKpCWcjcpev9VekxGk07HtUEh2ElrUDUzPlFJN+3EUlh2Lc/hurXt07y1nuL4FR/l3Z5sI++j2dZ118GYj2SObxJumM3Vyv8N7bkc8qDTEeoS/ZzyKwiVnfNkRQSvFeMhIN5C3q2Ul7m17B5ynBjWg7n9zLi5jah8JcJOSlZ2YAUsT+xLgRQceweqG3A9yszs8CAThR/RHX5sSN4dM8JEPchoalMnAvmn3sl4RXXcATjw+Rw6lWocOca+RjMHrGuIukyjC8rvHbW89ais0iTSXx+JQO4WXudej2wpMo+Pvat9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HZHpa2fQDbWt2ZP0/5uJu2qKD1SUpOIGJzflcBawjsE=;
 b=YQaL9x3Qhm22sLO6HEMxfy8Kdu2JHjNsOe0zAVY/xz8q5UqxGoTKV7hw8zZnb9IrWxxZnUTfw76QSaLo8WlrCqJb7VmWu/mzPKLxzmbTTv7hmHM96rIzN8mnVDzYnVQtvDydMpKbS4R2udCWWeUCnQRlWAH/6mbovKxDkfPvTdW+AIU4jW6lzWJJ1oSP0oxzAj0sc4CqW6Jl9XYVcIPaQv+NE01yUlpyhA5Os2v+nMUfopJpTc5VrdysSFkllY/sIe4qPzWRK9VHpHCQC3qKVsp6Pl/XDkXKEV9/xndupr7ALQ3CffDFMp+fA91P0yWX/GDLSQu/c6VRzK07ZlK+MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HZHpa2fQDbWt2ZP0/5uJu2qKD1SUpOIGJzflcBawjsE=;
 b=NJGkHNO7hcHvegQFLHc7XDgBoMzeywKR7ILtP0RilBYDCYDNnydrJd7uyzI5PQ3KWCctQ+fSd3rZVQPq7eOio/vuScrznYDq/Cv4CWz+7WuSCQJahMt+M7JbX4oQWXHkMMp8us1An2VeHaSY2fL9VjEUJHAF/BZS4udzeBDx+zk=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Penny Zheng
	<Penny.Zheng@arm.com>, Jiamei Xie <Jiamei.Xie@arm.com>, nd <nd@arm.com>
Subject: RE: [PATCH] xen/arm: Using unsigned long for arm64 MPIDR mask
Thread-Topic: [PATCH] xen/arm: Using unsigned long for arm64 MPIDR mask
Thread-Index: AQHW40waNqMCY5G3LES5BgP4N5Uw3qoY3YEAgAAiAGA=
Date: Tue, 5 Jan 2021 13:43:07 +0000
Message-ID:
 <AM0PR08MB374702955D821E2F14A6BCE29ED10@AM0PR08MB3747.eurprd08.prod.outlook.com>
References: <20210105101751.1972883-1-wei.chen@arm.com>
 <c3896575-a256-add3-2603-71e627bceba7@xen.org>
In-Reply-To: <c3896575-a256-add3-2603-71e627bceba7@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: CAF5EDE32B7CC54EB209A48DCDAE519F.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [116.230.239.117]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ccac9e6c-ad30-431f-c1d7-08d8b17fdc8e
x-ms-traffictypediagnostic: AM0PR08MB3588:|VI1PR08MB3936:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB39362C3D9A3AC09027603A449ED10@VI1PR08MB3936.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 oShvQKkoudjJCBeHgagMhf/oOxJzJRdg6eCpmpmsEFuLmXnSJLGamK8jOfQnHjFrIxH0nWNn6+JbyuuRUDp2IGGntWcG4o0gys2cYaogPBxxpeCyrBPTvuf8KIqcZqZBsX2tnTDA9PaqfMDz8l/HBHjnPeTT3fB9J3DbmnPSRHs8GFA0pdzw2m/JnYcHU4gVZpN0q/5HjxeVF9NQWdMFB9+VXmteeeWVtGqn+6nlbZmyJESx3+ibYgH1PWo5mpbZbbPB2T9Q5HsurpSVriUQc58zosjWn52ogh3PmX+UfrMvQXB3WQHnNNpkynzXe83mUpl6X/wELFRg4tPIKtP3ATdkL9lX9wPdfs51hpyfuE2qK4cGf+QpEMc38mRwACikluxhSFmyNWuIxj6nAFcocA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3747.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(376002)(366004)(346002)(396003)(66556008)(64756008)(86362001)(66446008)(76116006)(52536014)(66476007)(26005)(53546011)(186003)(6506007)(5660300002)(66946007)(83380400001)(4326008)(478600001)(316002)(110136005)(9686003)(7696005)(71200400001)(55016002)(8936002)(33656002)(2906002)(54906003)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?VDBSQmxlaEgycHZxU2VuL0d0TWM1RzFBRkhQYjk4b1huUlowQnZRWmp6Y09r?=
 =?utf-8?B?NFhxMk5vek42QjBlYllwOFhjOWZ4eGJSUHdLZzRIOUdZc1lzQXpVSm5GVnhi?=
 =?utf-8?B?TWwwU2FmOEh1MFJrZTFNc1BZUzdORGpyRng4RjB4M2NJYUU2RTNWZ0JtMWRl?=
 =?utf-8?B?Z2xWNlBwcTFOUk96Z2dUMUN1QTNjaDRPSHlXLzB3UGEyb2RZbS94ZitaSlZN?=
 =?utf-8?B?Uzd1ZENDdWhqZlBGazloTktvbGdJZnVrQkkxb2RFOHd0OG12a0xGRklvRTVK?=
 =?utf-8?B?RzlQWU1TMkI0ZlI3Q3JjbE83UlNsLysrWXBJQXM4WUFJMUp5YTFQeGtXWG8z?=
 =?utf-8?B?c2d3MGNQVVVTNHVEdVFKZmcyY05HajhZVkJqWW1OYWdPNEVkSmw0bmMwVFRM?=
 =?utf-8?B?VEdNenQycVpRbUhFZWFFUXFFMldYbjRMN2ZBV3hhY1dPdnJCeGxsVHQvRHFz?=
 =?utf-8?B?UE5ic3dKa0pqa3pqZnJlZEhaT1VxYTlYd1VBdlR6U3dmaVQwa29sV1FnVVRa?=
 =?utf-8?B?c2hnb3I3U3NJTXYralQvMmR1Q1FqR2sxWmtMZVRGbXpaWGNDV1VJNTJ6bGhy?=
 =?utf-8?B?VkgrRXVlc2o3MmRvR2xiRzFMNU1xY25rUkdDbXhmSDVFZ2lZVGhiaUxNTkpx?=
 =?utf-8?B?TktqV2xhd1FNd2FYQXd0ZmNDWTBVcUZISnB0MGxkaGFTRGxlbEV5cVBDTzJz?=
 =?utf-8?B?cVR3YWNjNUQxMEp0bTNZTy9lWFJoZGwzOEJhbi9rc2Zab3hnbGVqYUFJTDQz?=
 =?utf-8?B?TjFVMDdtMVd0ZUpzUndRd0RoYVdaSzVhcC92SHdYTm1GTnNXK0I0L2p5WVZI?=
 =?utf-8?B?UFExNXh6RExSRDYxV1NLUUNUUVBqc0lNVWpKcTFwaDlURno1S0duZlRJYWlx?=
 =?utf-8?B?VjZqTktVczI2V29TNkdETjdubnlhZ0xYMHNOaDZlZkFabmtkaVFZaStucTQ1?=
 =?utf-8?B?WHJsOXlRV3puZzZ1Wk91NTdNMFhSbHRCYTFlMSsrWXlOWkVkQU11YXNja1l1?=
 =?utf-8?B?SlNkdVplbW9qNkp5SW5WdTBQSUo4a3hpWFlnLzZqRHJXUTlCSkVSSjZLR2tC?=
 =?utf-8?B?SS84TkxOcE0wcTZqVXgrMnFDTUw5cklxRmFCRnhSbGF2WXpqSmVVYXRlRHJy?=
 =?utf-8?B?c3JwaFlTc2toWlRkUXFYdGxVdkRNeTE5VlV4SHRnSXFQOWtwZ0paTFJMZElB?=
 =?utf-8?B?c0RpQW9tWXF4WXhmZmNjY29OODZPUUNLNjVkZWpxOTl0T0FDMUJQczZ3Q3JW?=
 =?utf-8?B?R1QxSjF3dTh4d1dGV0ZMOUtERkFCdjZ4WW11SElWTkd5SEVLU0U1enNTRlJm?=
 =?utf-8?Q?NggFz1/AmAiFk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3588
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	83c6872c-8f66-45c7-b1c7-08d8b17fd5b1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KRZkV5F3b+Lv6yGsy0hZs//5jb6QVRpIRwgCENC1tNlnXgIOKUrierodx/34fRBWcVqmFGDvLte8DphXxXXSKDR8NMXLXiJ+SaMCBOP8cP/zCL5GO7OKqBfJg5M6lTl+dJPfgx9YqX1YBMzciqzZ/JBdJ7Doje3RX7bZFrZgmD9QMrJDReOmqQm2nhVuLl/+fpvbP5FsKV4XiQw5T21J05/T8MpLa2iSfBSosB5blPVdra/pQfDNOrxiCXi6Z6WKJeruSuJkv4NjKp+/tEQh4LRxcfwwiV0gPxo6nf8YVEuCsNOn2gQIaZc3V+e49muu5zbvlGah0ooxiH8ERm5OpGWKoaVcxuiLsCGHPKJY8FFFUNP4sDkgGeu7mdsA1mttF+syvLCtvnabqCdT1n0htLJp4n6bk0BPwr4Uf350EtOsAlE9ji+7GDmQxGOWSRaNmAbEVrgqylmzVtEc9IlDBw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(39860400002)(346002)(396003)(46966006)(186003)(55016002)(47076005)(52536014)(2906002)(4326008)(82310400003)(26005)(336012)(7696005)(9686003)(86362001)(70586007)(8676002)(316002)(70206006)(478600001)(54906003)(110136005)(53546011)(6506007)(83380400001)(8936002)(81166007)(5660300002)(33656002)(82740400003)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2021 13:43:17.8758
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ccac9e6c-ad30-431f-c1d7-08d8b17fdc8e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3936

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjHlubQx5pyINeaXpSAxOTowMQ0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmc7DQo+IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmcNCj4gQ2M6IEJlcnRyYW5kIE1hcnF1
aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IFBlbm55IFpoZW5nDQo+IDxQZW5ueS5aaGVu
Z0Bhcm0uY29tPjsgSmlhbWVpIFhpZSA8SmlhbWVpLlhpZUBhcm0uY29tPjsgbmQNCj4gPG5kQGFy
bS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHhlbi9hcm06IFVzaW5nIHVuc2lnbmVkIGxv
bmcgZm9yIGFybTY0IE1QSURSIG1hc2sNCj4gDQo+IEhpIFdlaSwNCj4gDQo+IE9uIDA1LzAxLzIw
MjEgMTA6MTcsIFdlaSBDaGVuIHdyb3RlOg0KPiA+IEN1cnJldGx5LCBYZW4gaXMgdXNpbmcgVUlO
VDMyIGZvciBNUElEUiBtYXNrIHRvIHJldHJpZXZlDQo+IA0KPiBzL0N1cnJldGx5L0N1cnJlbnRs
eS8NCj4gDQoNCmdvdCBpdC4NCg0KPiA+IGFmZmluaXR5WzAsMSwyLDNdIHZhbHVlcyBmb3IgTVBJ
RFJfRUwxIHJlZ2lzdGVyLiBUaGUgdmFsdWUNCj4gPiBvZiBNUElEUl9FTDEgaXMgNjQtYml0IHVu
c2lnbmVkIGxvbmcuIFRoZSBvcGVyYXRpb24gb2YgNjQtYml0DQo+ID4gYW5kIDMyLWJpdCBpbnRl
Z2VycyBhcmUgY29tcGlsZXIgcmVsYXRlZC4gVGhpcyBtZWFucyB0aGUgdmFsdWUNCj4gPiBpcyB1
bnByZWRpY3RhYmxlLg0KPiANCj4gU28gSSBhZ3JlZSB0aGF0IH5NUElEUl9BRkYwX01BU0sgd2ls
bCBkbyB0aGUgbmVnYXRpb24gaW4gMzItYml0IHJhdGhlcg0KPiB0aGFuIDY0LWJpdC4gSG93ZXZl
ciwgSSBkaXNhZ3JlZSB0aGF0IHRoaXMgaXMgdW5wcmVkaWNhYmxlIG9yIGNvbXBpbGVyDQo+IHNw
ZWNpZmljLg0KPiANCg0KWWVhaCwgSSBhZ3JlZSB3aXRoIHlvdSwgbXkgY29tbWl0IG1lc3NhZ2Ug
aGVyZSBpcyBub3QgYWNjdXJhdGUuIFRoaXMNCnByb2JsZW0gaGFkbid0IGJlZW4gZm91bmQgc28g
ZmFyLCBzbyBJIGhhZCB0aG91Z2h0IG1heWJlIHNvbWVvbmUNCmNhbiB3b3JrIHdlbGwgd2l0aCBh
ZmYzLiBGcm9tIHRoZSBjb2RlLCBYZW4gaGFkIHVzZWQgJ1UnIGZvciBjb25zdGFudCBpbg0KTVBJ
RFJfQUZGMF9NQVNLLCBzbyBpdCB3b3VsZCBhbHdheXMgYmUgYSB1bnNpZ25lZCBleHRlbmQuIFRo
ZSBhZmYzDQp3aWxsIGJlIGRyb3BwZWQuIEkgd2lsbCB1cGRhdGUgbXkgY29tbWl0IG1lc3NhZ2Ug
aW4gbmV4dCB2ZXJzaW9uLg0KDQo+ID4NCj4gPiBGb3IgZXhhbXBsZSwgd2hlbiB3ZSBhcmUgdXNp
bmcgTVBJRFJfQUZGMF9NQVNLIHRvIGdldA0KPiA+IGNsdXN0ZXJfaWQgZnJvbSBhIDY0LWJpdCBp
bnRlZ2VyIGluIGdpYy12MyBkcml2ZXI6DQo+ID4gdWludDY0X3QgY2x1c3Rlcl9pZCA9IGNwdV9s
b2dpY2FsX21hcChjcHUpICYgfk1QSURSX0FGRjBfTUFTSzsNCj4gPg0KPiA+IFdoZW4gTVBJRFJf
QUZGMF9NQVNLIGlzIFVJTlQzMiwgY29tcGlsZXIgb3V0cHV0Og0KPiA+ICAgICAgZjdjOiA5Mjc4
NWMxNiBhbmQgeDIyLCB4MCwgIzB4ZmZmZmZmMDANCj4gPiBXaGVuIE1QSURSX0FGRjBfTUFTSyBp
cyB1bnNpZ25lZCBsb25nLCBjb21waWxlciBvdXRwdXQ6DQo+ID4gICAgICBmODg6IDkyNzhkYzc1
IGFuZCB4MjEsIHgzLCAjMHhmZmZmZmZmZmZmZmZmZjAwDQo+ID4NCj4gPiBJZiB3ZSBoYXZlIGEg
Y3B1X2xvZ2ljYWxfbWFwKGNwdSk9IDB4MSwwMDAwMDAwMC4gV2UgZXhjZXB0DQo+ID4gdG8gZ2V0
IGEgY2x1c3Rlcl9pZCAxLCBidXQgd2l0aCBVSU5UMzIgTVBJRFJfQUZGMF9NQVNLLCB3ZQ0KPiA+
IHdpbGwgZ2V0IDAuDQo+IA0KPiBTb21ldGhpbmcgZG9lc24ndCBtYXRjaCBoZXJlLiBJZiB0aGUg
Y2x1c3Rlcl9pZCB3ZXJlIDEsIHRoZW4gaXQgc2hvdWxkDQo+IHN1cmVseSBiZSAxIGFzIHdlbGwg
ZXZlbiB3aXRoIHRoZSAzMi1iaXQgbWFzayBiZWNhdXNlIHRoZXJlIGlzIG5vIHNoaWZ0Lg0KPiAN
Cj4gU28gZGlkIHlvdSBpbnRlbmQgdG8gc2F5IDB4MSwwMDAwMDAwMD8NCj4gDQoNClNvcnJ5LCBJ
IGNvcGllZCB0aGUgdmFsdWUgZnJvbSBkZXZpY2UgdHJlZSBub2RlIG5hbWUuIEkgaW50ZW5kIHRv
IHNheSB0aGUgDQpjcHVfbG9naWNhbF9tYXAoY3B1KT0gMHgxMDAwMDAwMDBVTCwgdGhlIGFmZjMg
KGJpdDMyIH4gMzkpIGlzIDEuDQoNCkkgYW0gbm90IHN1cmUgd2UgYXJlIGluIHRoZSBzYW1lIHBh
Z2Ugb2YgY2x1c3Rlcl9pZC4gVGhlIGNsdXN0ZXJfaWQgSSBtZW50aW9uZWQNCmFib3ZlIGlzIGEg
dmFyaWFibGUgaW4gZ2ljdjNfc2VuZF9zZ2lfbGlzdCBmdW5jdGlvbi4gVGhlIGNsdXN0ZXJfaWQg
eW91IGhhZA0KbWVudGlvbmVkIGlzIGFmZjI/DQoNCj4gPg0KPiA+IFNvLCBpbiB0aGlzIHBhdGNo
LCB3ZSBmb3JjZSBhYXJjaDY0IHRvIHVzZSB1bnNpZ25lZCBsb25nDQo+ID4gYXMgTVBJRFIgbWFz
ayB0byBhdm9pZCBzdWNoIHVucHJlZGljdGFibGUgb3BlcmF0aW9ucy4NCj4gDQo+IFBlciBhYm92
ZSwgSSBkb24ndCB0aGluayB0aGlzIGlzIHVucHJlZGljdGFibGUuDQoNCkkgd2lsbCByZW1vdmUg
dGhlIGxhc3QgcGFydCBvZiBhYm92ZSBzZW50ZW5jZS4NCg0KPiANCj4gPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IFdlaSBDaGVuIDx3ZWkuY2hlbkBhcm0uY29tPg0KPiA+IC0tLQ0KPiA+ICAgeGVuL2lu
Y2x1ZGUvYXNtLWFybS9wcm9jZXNzb3IuaCB8IDYgKysrLS0tDQo+ID4gICAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBh
L3hlbi9pbmNsdWRlL2FzbS1hcm0vcHJvY2Vzc29yLmggYi94ZW4vaW5jbHVkZS9hc20tDQo+IGFy
bS9wcm9jZXNzb3IuaA0KPiA+IGluZGV4IDg3YzgxMzYwMjIuLjVjMTc2OGNkZWMgMTAwNjQ0DQo+
ID4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9wcm9jZXNzb3IuaA0KPiA+ICsrKyBiL3hlbi9p
bmNsdWRlL2FzbS1hcm0vcHJvY2Vzc29yLmgNCj4gPiBAQCAtNzUsMTEgKzc1LDExIEBADQo+ID4N
Cj4gPiAgIC8qIE1QSURSIE11bHRpcHJvY2Vzc29yIEFmZmluaXR5IFJlZ2lzdGVyICovDQo+ID4g
ICAjZGVmaW5lIF9NUElEUl9VUCAgICAgICAgICAgKDMwKQ0KPiA+IC0jZGVmaW5lIE1QSURSX1VQ
ICAgICAgICAgICAgKF9BQygxLFUpIDw8IF9NUElEUl9VUCkNCj4gPiArI2RlZmluZSBNUElEUl9V
UCAgICAgICAgICAgIChfQUMoMSxVTCkgPDwgX01QSURSX1VQKQ0KPiA+ICAgI2RlZmluZSBfTVBJ
RFJfU01QICAgICAgICAgICgzMSkNCj4gPiAtI2RlZmluZSBNUElEUl9TTVAgICAgICAgICAgIChf
QUMoMSxVKSA8PCBfTVBJRFJfU01QKQ0KPiA+ICsjZGVmaW5lIE1QSURSX1NNUCAgICAgICAgICAg
KF9BQygxLFVMKSA8PCBfTVBJRFJfU01QKQ0KPiA+ICAgI2RlZmluZSBNUElEUl9BRkYwX1NISUZU
ICAgICgwKQ0KPiA+IC0jZGVmaW5lIE1QSURSX0FGRjBfTUFTSyAgICAgKF9BQygweGZmLFUpIDw8
IE1QSURSX0FGRjBfU0hJRlQpDQo+ID4gKyNkZWZpbmUgTVBJRFJfQUZGMF9NQVNLICAgICAoX0FD
KDB4ZmYsVUwpIDw8IE1QSURSX0FGRjBfU0hJRlQpDQo+ID4gICAjaWZkZWYgQ09ORklHX0FSTV82
NA0KPiA+ICAgI2RlZmluZSBNUElEUl9IV0lEX01BU0sgICAgIF9BQygweGZmMDBmZmZmZmYsVUwp
DQo+ID4gICAjZWxzZQ0KPiA+DQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg==

