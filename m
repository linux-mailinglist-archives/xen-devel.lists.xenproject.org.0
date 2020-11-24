Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1502C2213
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 10:50:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.35634.67276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khUxu-0003m6-73; Tue, 24 Nov 2020 09:50:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 35634.67276; Tue, 24 Nov 2020 09:50:26 +0000
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
	id 1khUxu-0003lg-3b; Tue, 24 Nov 2020 09:50:26 +0000
Received: by outflank-mailman (input) for mailman id 35634;
 Tue, 24 Nov 2020 09:50:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lBCh=E6=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1khUxs-0003la-02
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 09:50:24 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.55]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f3f87a1b-3114-4d3f-a3c2-c707d606b104;
 Tue, 24 Nov 2020 09:50:20 +0000 (UTC)
Received: from AM4PR0302CA0019.eurprd03.prod.outlook.com (2603:10a6:205:2::32)
 by AM0PR08MB5057.eurprd08.prod.outlook.com (2603:10a6:208:165::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20; Tue, 24 Nov
 2020 09:50:17 +0000
Received: from AM5EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:205:2:cafe::35) by AM4PR0302CA0019.outlook.office365.com
 (2603:10a6:205:2::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Tue, 24 Nov 2020 09:50:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT060.mail.protection.outlook.com (10.152.16.160) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Tue, 24 Nov 2020 09:50:17 +0000
Received: ("Tessian outbound 797fb8e1da56:v71");
 Tue, 24 Nov 2020 09:50:16 +0000
Received: from 2b530c0ba4b7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 57BA6EBA-9362-4334-859D-3F4069318E72.1; 
 Tue, 24 Nov 2020 09:50:11 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2b530c0ba4b7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Nov 2020 09:50:11 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB6PR0802MB2375.eurprd08.prod.outlook.com (2603:10a6:4:87::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Tue, 24 Nov
 2020 09:50:08 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::21f3:34c:8f7e:42ef]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::21f3:34c:8f7e:42ef%2]) with mapi id 15.20.3589.030; Tue, 24 Nov 2020
 09:50:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=lBCh=E6=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1khUxs-0003la-02
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 09:50:24 +0000
X-Inumbo-ID: f3f87a1b-3114-4d3f-a3c2-c707d606b104
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown [40.107.7.55])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f3f87a1b-3114-4d3f-a3c2-c707d606b104;
	Tue, 24 Nov 2020 09:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jl0Ru8BJej6YPTGhMZzE9SUlbtQpcsPBo2Wl/+Qb/IA=;
 b=6j4EpSUTtENGV4uPcSemDRYl1ujxX+5z/9ryHtgGDJQcoDpJGYRyvC11EFTISyn9R0QXHgEC7GmYdgrPfEyUq5ky2c5sgeN0f5ZsvpgDFzs1GmifQK/NbD8hkCCloIQ7OJCr0Am0B0SQ4X2dY06UsQCwSTmK2SkW99M+EZ9Wwzg=
Received: from AM4PR0302CA0019.eurprd03.prod.outlook.com (2603:10a6:205:2::32)
 by AM0PR08MB5057.eurprd08.prod.outlook.com (2603:10a6:208:165::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20; Tue, 24 Nov
 2020 09:50:17 +0000
Received: from AM5EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:205:2:cafe::35) by AM4PR0302CA0019.outlook.office365.com
 (2603:10a6:205:2::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Tue, 24 Nov 2020 09:50:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT060.mail.protection.outlook.com (10.152.16.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Tue, 24 Nov 2020 09:50:17 +0000
Received: ("Tessian outbound 797fb8e1da56:v71"); Tue, 24 Nov 2020 09:50:16 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0fdd33d8015c53fb
X-CR-MTA-TID: 64aa7808
Received: from 2b530c0ba4b7.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 57BA6EBA-9362-4334-859D-3F4069318E72.1;
	Tue, 24 Nov 2020 09:50:11 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2b530c0ba4b7.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 24 Nov 2020 09:50:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jg/24ergYWeAByg2LQB5pt8Hd7LbcSPv9zT+M6XtDMrgDPYqfJl6G1m1e3gfdK1YOKHFsIyE45Kt+4t5N6D7QbHO4jWiqv/VDNPLxd1gAiBrk/DAS/l7E9+Iv1nNULO5H3ZPV2lv3AheREaaRWfPNLbw+1GRP1AFJbcP7rNyzymIAwKbBj4NtG0TikflJxXdeAwVfUdI7ZhX/NHR5NrMsfSwtAS53aGFR/8ZJpdtzSiF3QmXjvnLlemCcZrnDv4cOcndRuG01fcTw5Y6Ag/3XwEWmGjpcJBvutlj5S+Scy6RlfZ2YRWW2uBwH+LsiB6+kI+T7EBTio8ijWUc180d1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jl0Ru8BJej6YPTGhMZzE9SUlbtQpcsPBo2Wl/+Qb/IA=;
 b=ekLsG88iUfc7auaz9L6z7Wsrgszcw1jajkhX8H+5cl5GxkxqngBJLKsAtkdeRI/QKNjVbz3L0J9bZVzehmxeL4h9Nv261cUMw6YZ5vGiE3AAS09lpdsv2LI3Zg8KUYAYDDB00eZh8bAgDtskY37YuE5IpJxGW61P1TDaj4IV1JutGMX5ewet7CrKM3675xqIY48XxNiWG7T5XcaJqO0K9ycfsfuWiT+X6XzAJgiRbe5gqJQdMlW1OXrZuY94KQvophBBaAO0rB8+emfZdeGLJZLAQE8LgtL3paeO9bLbu+gDVqDizHSiRahZ5XPYeuOoph5r4wS9oP26UR5WyFf4OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jl0Ru8BJej6YPTGhMZzE9SUlbtQpcsPBo2Wl/+Qb/IA=;
 b=6j4EpSUTtENGV4uPcSemDRYl1ujxX+5z/9ryHtgGDJQcoDpJGYRyvC11EFTISyn9R0QXHgEC7GmYdgrPfEyUq5ky2c5sgeN0f5ZsvpgDFzs1GmifQK/NbD8hkCCloIQ7OJCr0Am0B0SQ4X2dY06UsQCwSTmK2SkW99M+EZ9Wwzg=
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB6PR0802MB2375.eurprd08.prod.outlook.com (2603:10a6:4:87::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Tue, 24 Nov
 2020 09:50:08 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::21f3:34c:8f7e:42ef]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::21f3:34c:8f7e:42ef%2]) with mapi id 15.20.3589.030; Tue, 24 Nov 2020
 09:50:08 +0000
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 1/3] ns16550: move PCI arrays next to the function
 using them
Thread-Topic: [PATCH v2 1/3] ns16550: move PCI arrays next to the function
 using them
Thread-Index: AQHWwZqgfCAQQ/ir8kuoacesfXkcZKnWZvIAgACkOoA=
Date: Tue, 24 Nov 2020 09:50:08 +0000
Message-ID: <C8F87C4F-C907-40C8-B774-BB1483944A34@arm.com>
References: <96115b2b-c104-e566-2368-6a2439d2c988@suse.com>
 <b47b5557-ad67-5bf4-45ce-c305ee5da977@suse.com>
 <alpine.DEB.2.21.2011231602071.7979@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2011231602071.7979@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bc356e9f-7850-4ff6-cc7f-08d8905e594b
x-ms-traffictypediagnostic: DB6PR0802MB2375:|AM0PR08MB5057:
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB505747C3AF9ADBF3AC708BB8FCFB0@AM0PR08MB5057.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 wDga62z4Aqo8SkT5+isf7Y5xV0QOBoTLZDlgP58yttZOHaWqapovTJgOvzgSq0WwkzCW9O9as6pBLh0jaqEW66eMiQXYGhijJK1puylJUnxW5eIKdx/zooVxzERaF+scqVbgMeLCzsLeUYfhQ14rYc3KVjYD9nmx1vv8j06R6eXVAlNVbVl9J3eGhkaYQBh8NIxZebA6LYM0Q1SaGw72Qu9/R5fL9oumJRDU7lo4mD1BmOoGBPC6UqwizgaBlh8ch/o/kll2UOYoNXcWA6lsF4YQX8PogqwLsZwazjHDtHsj73hiw2qHaWuZS7HS7HrPzo6+Fythgw9yZaFiHr2/mA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(346002)(39860400002)(376002)(71200400001)(83380400001)(4326008)(26005)(33656002)(6506007)(53546011)(186003)(6486002)(36756003)(5660300002)(2906002)(8676002)(6916009)(6512007)(8936002)(76116006)(2616005)(66446008)(66476007)(54906003)(316002)(86362001)(91956017)(66556008)(66946007)(30864003)(478600001)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?EsDRSZCdxCSb9bT80zHOA63R/DweMHmU4ceQll+2mUihhIqrGTU1kZtyA7RU?=
 =?us-ascii?Q?z1IWDJP0Hq/yobjgSIiHaxFlptFY3kjPlm8McIkSREvRCrS6jnCkiYOwvrSd?=
 =?us-ascii?Q?PkodHVPd45aENjh5oAFxpjZiK+SZSsgvFFbnESNRxALEbyjowSq8+flsw+jf?=
 =?us-ascii?Q?4S/U5clYYJUGCbjjLHjo0lKawLLBbhY1pquOdQr91/2FeLGOKkE+ER+BlLaM?=
 =?us-ascii?Q?EHdFknO+/JvfzMQt8FDabEnqLmW+cmeHyMhfz6WM0ZexdejeWx7Ui3C9wbUA?=
 =?us-ascii?Q?LG9FjUOMV0jOx3JhtP8nUrId1EaHeb9Ml33bpeyPGDfTDlvP+9lZwmPkDRHz?=
 =?us-ascii?Q?ccExciJs0Tso+6JtmCju63br122gL0TTellNzhtQMJP96bui9dL2MwbnVVd8?=
 =?us-ascii?Q?qBYq7fLVzJwBQZMaLJsxaWnuKFYKNyCg5OszgMn1TqanEPhaTh+efCdyRGE6?=
 =?us-ascii?Q?4UHmXSiC3W6pm3gNS0zaj3zqmvFV8cmHvIBVWf7xN+ysFTAa/BtnyihpFIOL?=
 =?us-ascii?Q?k/tHfCwNBvOdn1z3g1BbgR0WRZ32jLItsJpg2nOSaRNUedg34pPvYRBPWzu1?=
 =?us-ascii?Q?jMm7jqmUXSUbDtqfZfrbKmOH9jQGL2Qapiq8M+2wENx34oTmO2LEX/HkNb6c?=
 =?us-ascii?Q?tVe72f0loiuAvjxv4A37i9eK1AI1A/45qvV0DuxzaLQDRwuiieUeszazaYvQ?=
 =?us-ascii?Q?YNRPRBZHecSH0Lgt9p5Mk/JqD8RcikuB55apiTuZwKorPGYI0lfGl6J/v6LF?=
 =?us-ascii?Q?UKx3NPcOcZlzwruv+DlXitmPFn0KIqvjy+rwemFshXlbLfZiEiZBXPD3peHQ?=
 =?us-ascii?Q?10OmkgnBJ6ohfAUgEcypmTuwOaoHqMUFAlmwIcjAzXoB87JoxOYXC0u/O8MI?=
 =?us-ascii?Q?ndX8renUiByjGxHM1ywELpU1NtTkSHd7nLr/dJUHJR7ftX0zptoxktHqIV3C?=
 =?us-ascii?Q?JIRDPtePCgsQSzB09GZGRLXuxo08S/dNx9CdyjMkZdgZF9heSMw1darvbJGC?=
 =?us-ascii?Q?G2vD?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8422561C662AA748BD50BE481AD334C1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2375
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b059933c-b8ee-4a08-3531-08d8905e5436
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1ThCEjAO3cfgULi5WfD8N/GupLqicefbFv9NkUflhu61heFqkpvOzP5w1hn69gXd9KWQhgIKCteWOYM3K6svug2uEgv9wW1AVisy9iwsWmFAm2Bf0CGmZphGtrHz5h+z/WC1wTNI2wfVOBa3TFfKiRJi92gUrsiabusjTMiZvYgbpwlGB9Tn90jAT1eliethj2leGjaB0WC5mzgzPLlnNnNIzZ15DeGVRw5eu2GDF80J8rYS+mUR1LK5wJlS8xOpsqL2rSdzkuLDjEx/1RgIp/c1frzgZHIA9BzZpl/JCA2e1raT+SZZ0gg/9lWaF0qhZel7PhTNs0J1HDydfb/DYZeWH2BviR2+imejUNe/D5JjcAEsCWM6pLU+3OVpJduTYUDdbWV6hkqM8Y1MwnEc/g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(39860400002)(136003)(46966005)(26005)(6862004)(186003)(4326008)(53546011)(6506007)(8936002)(2906002)(6486002)(8676002)(33656002)(54906003)(6512007)(36906005)(316002)(5660300002)(70206006)(70586007)(2616005)(336012)(478600001)(30864003)(81166007)(356005)(36756003)(83380400001)(82310400003)(86362001)(47076004)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2020 09:50:17.1470
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc356e9f-7850-4ff6-cc7f-08d8905e594b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5057

Hello ,

> On 24 Nov 2020, at 12:02 am, Stefano Stabellini <sstabellini@kernel.org> =
wrote:
>=20
> On Mon, 23 Nov 2020, Jan Beulich wrote:
>> Pure code motion; no functional change intended.
>>=20
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>=20
Reviewed-by: Rahul Singh <rahul.singh@arm.com>

Regards,
Rahul
>=20
>> ---
>> v2: New.
>>=20
>> --- a/xen/drivers/char/ns16550.c
>> +++ b/xen/drivers/char/ns16550.c
>> @@ -153,312 +153,6 @@ struct ns16550_config_param {
>>     unsigned int uart_offset;
>>     unsigned int first_offset;
>> };
>> -
>> -/*
>> - * Create lookup tables for specific devices. It is assumed that if
>> - * the device found is MMIO, then you have indexed it here. Else, the
>> - * driver does nothing for MMIO based devices.
>> - */
>> -static const struct ns16550_config_param __initconst uart_param[] =3D {
>> -    [param_default] =3D {
>> -        .reg_width =3D 1,
>> -        .lsr_mask =3D UART_LSR_THRE,
>> -        .max_ports =3D 1,
>> -    },
>> -    [param_trumanage] =3D {
>> -        .reg_shift =3D 2,
>> -        .reg_width =3D 1,
>> -        .fifo_size =3D 16,
>> -        .lsr_mask =3D (UART_LSR_THRE | UART_LSR_TEMT),
>> -        .mmio =3D 1,
>> -        .max_ports =3D 1,
>> -    },
>> -    [param_oxford] =3D {
>> -        .base_baud =3D 4000000,
>> -        .uart_offset =3D 0x200,
>> -        .first_offset =3D 0x1000,
>> -        .reg_width =3D 1,
>> -        .fifo_size =3D 16,
>> -        .lsr_mask =3D UART_LSR_THRE,
>> -        .mmio =3D 1,
>> -        .max_ports =3D 1, /* It can do more, but we would need more cus=
tom code.*/
>> -    },
>> -    [param_oxford_2port] =3D {
>> -        .base_baud =3D 4000000,
>> -        .uart_offset =3D 0x200,
>> -        .first_offset =3D 0x1000,
>> -        .reg_width =3D 1,
>> -        .fifo_size =3D 16,
>> -        .lsr_mask =3D UART_LSR_THRE,
>> -        .mmio =3D 1,
>> -        .max_ports =3D 2,
>> -    },
>> -    [param_pericom_1port] =3D {
>> -        .base_baud =3D 921600,
>> -        .uart_offset =3D 8,
>> -        .reg_width =3D 1,
>> -        .fifo_size =3D 16,
>> -        .lsr_mask =3D UART_LSR_THRE,
>> -        .bar0 =3D 1,
>> -        .max_ports =3D 1,
>> -    },
>> -    [param_pericom_2port] =3D {
>> -        .base_baud =3D 921600,
>> -        .uart_offset =3D 8,
>> -        .reg_width =3D 1,
>> -        .fifo_size =3D 16,
>> -        .lsr_mask =3D UART_LSR_THRE,
>> -        .bar0 =3D 1,
>> -        .max_ports =3D 2,
>> -    },
>> -    /*
>> -     * Of the two following ones, we can't really use all of their port=
s,
>> -     * unless ns16550_com[] would get grown.
>> -     */
>> -    [param_pericom_4port] =3D {
>> -        .base_baud =3D 921600,
>> -        .uart_offset =3D 8,
>> -        .reg_width =3D 1,
>> -        .fifo_size =3D 16,
>> -        .lsr_mask =3D UART_LSR_THRE,
>> -        .bar0 =3D 1,
>> -        .max_ports =3D 4,
>> -    },
>> -    [param_pericom_8port] =3D {
>> -        .base_baud =3D 921600,
>> -        .uart_offset =3D 8,
>> -        .reg_width =3D 1,
>> -        .fifo_size =3D 16,
>> -        .lsr_mask =3D UART_LSR_THRE,
>> -        .bar0 =3D 1,
>> -        .max_ports =3D 8,
>> -    }
>> -};
>> -static const struct ns16550_config __initconst uart_config[] =3D
>> -{
>> -    /* Broadcom TruManage device */
>> -    {
>> -        .vendor_id =3D PCI_VENDOR_ID_BROADCOM,
>> -        .dev_id =3D 0x160a,
>> -        .param =3D param_trumanage,
>> -    },
>> -    /* OXPCIe952 1 Native UART  */
>> -    {
>> -        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> -        .dev_id =3D 0xc11b,
>> -        .param =3D param_oxford,
>> -    },
>> -    /* OXPCIe952 1 Native UART  */
>> -    {
>> -        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> -        .dev_id =3D 0xc11f,
>> -        .param =3D param_oxford,
>> -    },
>> -    /* OXPCIe952 1 Native UART  */
>> -    {
>> -        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> -        .dev_id =3D 0xc138,
>> -        .param =3D param_oxford,
>> -    },
>> -    /* OXPCIe952 2 Native UART  */
>> -    {
>> -        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> -        .dev_id =3D 0xc158,
>> -        .param =3D param_oxford_2port,
>> -    },
>> -    /* OXPCIe952 1 Native UART  */
>> -    {
>> -        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> -        .dev_id =3D 0xc13d,
>> -        .param =3D param_oxford,
>> -    },
>> -    /* OXPCIe952 2 Native UART  */
>> -    {
>> -        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> -        .dev_id =3D 0xc15d,
>> -        .param =3D param_oxford_2port,
>> -    },
>> -    /* OXPCIe952 1 Native UART  */
>> -    {
>> -        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> -        .dev_id =3D 0xc40b,
>> -        .param =3D param_oxford,
>> -    },
>> -    /* OXPCIe200 1 Native UART */
>> -    {
>> -        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> -        .dev_id =3D 0xc40f,
>> -        .param =3D param_oxford,
>> -    },
>> -    /* OXPCIe200 1 Native UART  */
>> -    {
>> -        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> -        .dev_id =3D 0xc41b,
>> -        .param =3D param_oxford,
>> -    },
>> -    /* OXPCIe200 1 Native UART  */
>> -    {
>> -        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> -        .dev_id =3D 0xc41f,
>> -        .param =3D param_oxford,
>> -    },
>> -    /* OXPCIe200 1 Native UART  */
>> -    {
>> -        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> -        .dev_id =3D 0xc42b,
>> -        .param =3D param_oxford,
>> -    },
>> -    /* OXPCIe200 1 Native UART  */
>> -    {
>> -        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> -        .dev_id =3D 0xc42f,
>> -        .param =3D param_oxford,
>> -    },
>> -    /* OXPCIe200 1 Native UART  */
>> -    {
>> -        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> -        .dev_id =3D 0xc43b,
>> -        .param =3D param_oxford,
>> -    },
>> -    /* OXPCIe200 1 Native UART  */
>> -    {
>> -        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> -        .dev_id =3D 0xc43f,
>> -        .param =3D param_oxford,
>> -    },
>> -    /* OXPCIe200 1 Native UART  */
>> -    {
>> -        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> -        .dev_id =3D 0xc44b,
>> -        .param =3D param_oxford,
>> -    },
>> -    /* OXPCIe200 1 Native UART  */
>> -    {
>> -        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> -        .dev_id =3D 0xc44f,
>> -        .param =3D param_oxford,
>> -    },
>> -    /* OXPCIe200 1 Native UART  */
>> -    {
>> -        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> -        .dev_id =3D 0xc45b,
>> -        .param =3D param_oxford,
>> -    },
>> -    /* OXPCIe200 1 Native UART  */
>> -    {
>> -        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> -        .dev_id =3D 0xc45f,
>> -        .param =3D param_oxford,
>> -    },
>> -    /* OXPCIe200 1 Native UART  */
>> -    {
>> -        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> -        .dev_id =3D 0xc46b,
>> -        .param =3D param_oxford,
>> -    },
>> -    /* OXPCIe200 1 Native UART  */
>> -    {
>> -        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> -        .dev_id =3D 0xc46f,
>> -        .param =3D param_oxford,
>> -    },
>> -    /* OXPCIe200 1 Native UART  */
>> -    {
>> -        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> -        .dev_id =3D 0xc47b,
>> -        .param =3D param_oxford,
>> -    },
>> -    /* OXPCIe200 1 Native UART  */
>> -    {
>> -        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> -        .dev_id =3D 0xc47f,
>> -        .param =3D param_oxford,
>> -    },
>> -    /* OXPCIe200 1 Native UART  */
>> -    {
>> -        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> -        .dev_id =3D 0xc48b,
>> -        .param =3D param_oxford,
>> -    },
>> -    /* OXPCIe200 1 Native UART  */
>> -    {
>> -        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> -        .dev_id =3D 0xc48f,
>> -        .param =3D param_oxford,
>> -    },
>> -    /* OXPCIe200 1 Native UART  */
>> -    {
>> -        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> -        .dev_id =3D 0xc49b,
>> -        .param =3D param_oxford,
>> -    },
>> -    /* OXPCIe200 1 Native UART  */
>> -    {
>> -        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> -        .dev_id =3D 0xc49f,
>> -        .param =3D param_oxford,
>> -    },
>> -    /* OXPCIe200 1 Native UART  */
>> -    {
>> -        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> -        .dev_id =3D 0xc4ab,
>> -        .param =3D param_oxford,
>> -    },
>> -    /* OXPCIe200 1 Native UART  */
>> -    {
>> -        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> -        .dev_id =3D 0xc4af,
>> -        .param =3D param_oxford,
>> -    },
>> -    /* OXPCIe200 1 Native UART  */
>> -    {
>> -        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> -        .dev_id =3D 0xc4bb,
>> -        .param =3D param_oxford,
>> -    },
>> -    /* OXPCIe200 1 Native UART  */
>> -    {
>> -        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> -        .dev_id =3D 0xc4bf,
>> -        .param =3D param_oxford,
>> -    },
>> -    /* OXPCIe200 1 Native UART  */
>> -    {
>> -        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> -        .dev_id =3D 0xc4cb,
>> -        .param =3D param_oxford,
>> -    },
>> -    /* OXPCIe200 1 Native UART  */
>> -    {
>> -        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> -        .dev_id =3D 0xc4cf,
>> -        .param =3D param_oxford,
>> -    },
>> -    /* Pericom PI7C9X7951 Uno UART */
>> -    {
>> -        .vendor_id =3D PCI_VENDOR_ID_PERICOM,
>> -        .dev_id =3D 0x7951,
>> -        .param =3D param_pericom_1port
>> -    },
>> -    /* Pericom PI7C9X7952 Duo UART */
>> -    {
>> -        .vendor_id =3D PCI_VENDOR_ID_PERICOM,
>> -        .dev_id =3D 0x7952,
>> -        .param =3D param_pericom_2port
>> -    },
>> -    /* Pericom PI7C9X7954 Quad UART */
>> -    {
>> -        .vendor_id =3D PCI_VENDOR_ID_PERICOM,
>> -        .dev_id =3D 0x7954,
>> -        .param =3D param_pericom_4port
>> -    },
>> -    /* Pericom PI7C9X7958 Octal UART */
>> -    {
>> -        .vendor_id =3D PCI_VENDOR_ID_PERICOM,
>> -        .dev_id =3D 0x7958,
>> -        .param =3D param_pericom_8port
>> -    }
>> -};
>> #endif
>>=20
>> static void ns16550_delayed_resume(void *data);
>> @@ -1045,6 +739,314 @@ static int __init check_existence(struct
>> }
>>=20
>> #ifdef CONFIG_HAS_PCI
>> +
>> +/*
>> + * Create lookup tables for specific devices. It is assumed that if
>> + * the device found is MMIO, then you have indexed it here. Else, the
>> + * driver does nothing for MMIO based devices.
>> + */
>> +static const struct ns16550_config_param __initconst uart_param[] =3D {
>> +    [param_default] =3D {
>> +        .reg_width =3D 1,
>> +        .lsr_mask =3D UART_LSR_THRE,
>> +        .max_ports =3D 1,
>> +    },
>> +    [param_trumanage] =3D {
>> +        .reg_shift =3D 2,
>> +        .reg_width =3D 1,
>> +        .fifo_size =3D 16,
>> +        .lsr_mask =3D (UART_LSR_THRE | UART_LSR_TEMT),
>> +        .mmio =3D 1,
>> +        .max_ports =3D 1,
>> +    },
>> +    [param_oxford] =3D {
>> +        .base_baud =3D 4000000,
>> +        .uart_offset =3D 0x200,
>> +        .first_offset =3D 0x1000,
>> +        .reg_width =3D 1,
>> +        .fifo_size =3D 16,
>> +        .lsr_mask =3D UART_LSR_THRE,
>> +        .mmio =3D 1,
>> +        .max_ports =3D 1, /* It can do more, but we would need more cus=
tom code.*/
>> +    },
>> +    [param_oxford_2port] =3D {
>> +        .base_baud =3D 4000000,
>> +        .uart_offset =3D 0x200,
>> +        .first_offset =3D 0x1000,
>> +        .reg_width =3D 1,
>> +        .fifo_size =3D 16,
>> +        .lsr_mask =3D UART_LSR_THRE,
>> +        .mmio =3D 1,
>> +        .max_ports =3D 2,
>> +    },
>> +    [param_pericom_1port] =3D {
>> +        .base_baud =3D 921600,
>> +        .uart_offset =3D 8,
>> +        .reg_width =3D 1,
>> +        .fifo_size =3D 16,
>> +        .lsr_mask =3D UART_LSR_THRE,
>> +        .bar0 =3D 1,
>> +        .max_ports =3D 1,
>> +    },
>> +    [param_pericom_2port] =3D {
>> +        .base_baud =3D 921600,
>> +        .uart_offset =3D 8,
>> +        .reg_width =3D 1,
>> +        .fifo_size =3D 16,
>> +        .lsr_mask =3D UART_LSR_THRE,
>> +        .bar0 =3D 1,
>> +        .max_ports =3D 2,
>> +    },
>> +    /*
>> +     * Of the two following ones, we can't really use all of their port=
s,
>> +     * unless ns16550_com[] would get grown.
>> +     */
>> +    [param_pericom_4port] =3D {
>> +        .base_baud =3D 921600,
>> +        .uart_offset =3D 8,
>> +        .reg_width =3D 1,
>> +        .fifo_size =3D 16,
>> +        .lsr_mask =3D UART_LSR_THRE,
>> +        .bar0 =3D 1,
>> +        .max_ports =3D 4,
>> +    },
>> +    [param_pericom_8port] =3D {
>> +        .base_baud =3D 921600,
>> +        .uart_offset =3D 8,
>> +        .reg_width =3D 1,
>> +        .fifo_size =3D 16,
>> +        .lsr_mask =3D UART_LSR_THRE,
>> +        .bar0 =3D 1,
>> +        .max_ports =3D 8,
>> +    }
>> +};
>> +
>> +static const struct ns16550_config __initconst uart_config[] =3D
>> +{
>> +    /* Broadcom TruManage device */
>> +    {
>> +        .vendor_id =3D PCI_VENDOR_ID_BROADCOM,
>> +        .dev_id =3D 0x160a,
>> +        .param =3D param_trumanage,
>> +    },
>> +    /* OXPCIe952 1 Native UART  */
>> +    {
>> +        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> +        .dev_id =3D 0xc11b,
>> +        .param =3D param_oxford,
>> +    },
>> +    /* OXPCIe952 1 Native UART  */
>> +    {
>> +        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> +        .dev_id =3D 0xc11f,
>> +        .param =3D param_oxford,
>> +    },
>> +    /* OXPCIe952 1 Native UART  */
>> +    {
>> +        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> +        .dev_id =3D 0xc138,
>> +        .param =3D param_oxford,
>> +    },
>> +    /* OXPCIe952 2 Native UART  */
>> +    {
>> +        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> +        .dev_id =3D 0xc158,
>> +        .param =3D param_oxford_2port,
>> +    },
>> +    /* OXPCIe952 1 Native UART  */
>> +    {
>> +        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> +        .dev_id =3D 0xc13d,
>> +        .param =3D param_oxford,
>> +    },
>> +    /* OXPCIe952 2 Native UART  */
>> +    {
>> +        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> +        .dev_id =3D 0xc15d,
>> +        .param =3D param_oxford_2port,
>> +    },
>> +    /* OXPCIe952 1 Native UART  */
>> +    {
>> +        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> +        .dev_id =3D 0xc40b,
>> +        .param =3D param_oxford,
>> +    },
>> +    /* OXPCIe200 1 Native UART */
>> +    {
>> +        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> +        .dev_id =3D 0xc40f,
>> +        .param =3D param_oxford,
>> +    },
>> +    /* OXPCIe200 1 Native UART  */
>> +    {
>> +        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> +        .dev_id =3D 0xc41b,
>> +        .param =3D param_oxford,
>> +    },
>> +    /* OXPCIe200 1 Native UART  */
>> +    {
>> +        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> +        .dev_id =3D 0xc41f,
>> +        .param =3D param_oxford,
>> +    },
>> +    /* OXPCIe200 1 Native UART  */
>> +    {
>> +        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> +        .dev_id =3D 0xc42b,
>> +        .param =3D param_oxford,
>> +    },
>> +    /* OXPCIe200 1 Native UART  */
>> +    {
>> +        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> +        .dev_id =3D 0xc42f,
>> +        .param =3D param_oxford,
>> +    },
>> +    /* OXPCIe200 1 Native UART  */
>> +    {
>> +        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> +        .dev_id =3D 0xc43b,
>> +        .param =3D param_oxford,
>> +    },
>> +    /* OXPCIe200 1 Native UART  */
>> +    {
>> +        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> +        .dev_id =3D 0xc43f,
>> +        .param =3D param_oxford,
>> +    },
>> +    /* OXPCIe200 1 Native UART  */
>> +    {
>> +        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> +        .dev_id =3D 0xc44b,
>> +        .param =3D param_oxford,
>> +    },
>> +    /* OXPCIe200 1 Native UART  */
>> +    {
>> +        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> +        .dev_id =3D 0xc44f,
>> +        .param =3D param_oxford,
>> +    },
>> +    /* OXPCIe200 1 Native UART  */
>> +    {
>> +        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> +        .dev_id =3D 0xc45b,
>> +        .param =3D param_oxford,
>> +    },
>> +    /* OXPCIe200 1 Native UART  */
>> +    {
>> +        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> +        .dev_id =3D 0xc45f,
>> +        .param =3D param_oxford,
>> +    },
>> +    /* OXPCIe200 1 Native UART  */
>> +    {
>> +        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> +        .dev_id =3D 0xc46b,
>> +        .param =3D param_oxford,
>> +    },
>> +    /* OXPCIe200 1 Native UART  */
>> +    {
>> +        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> +        .dev_id =3D 0xc46f,
>> +        .param =3D param_oxford,
>> +    },
>> +    /* OXPCIe200 1 Native UART  */
>> +    {
>> +        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> +        .dev_id =3D 0xc47b,
>> +        .param =3D param_oxford,
>> +    },
>> +    /* OXPCIe200 1 Native UART  */
>> +    {
>> +        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> +        .dev_id =3D 0xc47f,
>> +        .param =3D param_oxford,
>> +    },
>> +    /* OXPCIe200 1 Native UART  */
>> +    {
>> +        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> +        .dev_id =3D 0xc48b,
>> +        .param =3D param_oxford,
>> +    },
>> +    /* OXPCIe200 1 Native UART  */
>> +    {
>> +        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> +        .dev_id =3D 0xc48f,
>> +        .param =3D param_oxford,
>> +    },
>> +    /* OXPCIe200 1 Native UART  */
>> +    {
>> +        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> +        .dev_id =3D 0xc49b,
>> +        .param =3D param_oxford,
>> +    },
>> +    /* OXPCIe200 1 Native UART  */
>> +    {
>> +        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> +        .dev_id =3D 0xc49f,
>> +        .param =3D param_oxford,
>> +    },
>> +    /* OXPCIe200 1 Native UART  */
>> +    {
>> +        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> +        .dev_id =3D 0xc4ab,
>> +        .param =3D param_oxford,
>> +    },
>> +    /* OXPCIe200 1 Native UART  */
>> +    {
>> +        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> +        .dev_id =3D 0xc4af,
>> +        .param =3D param_oxford,
>> +    },
>> +    /* OXPCIe200 1 Native UART  */
>> +    {
>> +        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> +        .dev_id =3D 0xc4bb,
>> +        .param =3D param_oxford,
>> +    },
>> +    /* OXPCIe200 1 Native UART  */
>> +    {
>> +        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> +        .dev_id =3D 0xc4bf,
>> +        .param =3D param_oxford,
>> +    },
>> +    /* OXPCIe200 1 Native UART  */
>> +    {
>> +        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> +        .dev_id =3D 0xc4cb,
>> +        .param =3D param_oxford,
>> +    },
>> +    /* OXPCIe200 1 Native UART  */
>> +    {
>> +        .vendor_id =3D PCI_VENDOR_ID_OXSEMI,
>> +        .dev_id =3D 0xc4cf,
>> +        .param =3D param_oxford,
>> +    },
>> +    /* Pericom PI7C9X7951 Uno UART */
>> +    {
>> +        .vendor_id =3D PCI_VENDOR_ID_PERICOM,
>> +        .dev_id =3D 0x7951,
>> +        .param =3D param_pericom_1port
>> +    },
>> +    /* Pericom PI7C9X7952 Duo UART */
>> +    {
>> +        .vendor_id =3D PCI_VENDOR_ID_PERICOM,
>> +        .dev_id =3D 0x7952,
>> +        .param =3D param_pericom_2port
>> +    },
>> +    /* Pericom PI7C9X7954 Quad UART */
>> +    {
>> +        .vendor_id =3D PCI_VENDOR_ID_PERICOM,
>> +        .dev_id =3D 0x7954,
>> +        .param =3D param_pericom_4port
>> +    },
>> +    /* Pericom PI7C9X7958 Octal UART */
>> +    {
>> +        .vendor_id =3D PCI_VENDOR_ID_PERICOM,
>> +        .dev_id =3D 0x7958,
>> +        .param =3D param_pericom_8port
>> +    }
>> +};
>> +
>> static int __init
>> pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
>> {
>> @@ -1211,7 +1213,8 @@ pci_uart_config(struct ns16550 *uart, bo
>>=20
>>     return 0;
>> }
>> -#endif
>> +
>> +#endif /* CONFIG_HAS_PCI */
>>=20
>> /*
>>  * Used to parse name value pairs and return which value it is along wit=
h
>>=20


