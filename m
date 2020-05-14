Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 124451D32E4
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 16:29:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZErV-0000NH-Ok; Thu, 14 May 2020 14:29:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a33M=64=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jZErU-0000NC-M6
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 14:29:24 +0000
X-Inumbo-ID: 4df6cd0e-95ef-11ea-ae69-bc764e2007e4
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.75]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4df6cd0e-95ef-11ea-ae69-bc764e2007e4;
 Thu, 14 May 2020 14:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2BZVsjf+c438uDvCdiV4xwfZF+wKN8GYiL936qBJPPI=;
 b=2IOTN84UexVXYzOBcb01rEEOuifu+SKto8y1p5NCBK6o4XPvdXKvbfbgb6bMzmhmH1DmiOpdx16qOGztjv3EqODO5yTtNzPakApShgy/joYYNpzRgXtX6d34Ms8fVKknl5SsSykwSe84hu7cVkGFBz3yuS6NRoMmjR1GQcO1+hM=
Received: from DB6PR0801CA0051.eurprd08.prod.outlook.com (2603:10a6:4:2b::19)
 by DB6PR0801MB1703.eurprd08.prod.outlook.com (2603:10a6:4:2e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.34; Thu, 14 May
 2020 14:29:21 +0000
Received: from DB5EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:2b:cafe::46) by DB6PR0801CA0051.outlook.office365.com
 (2603:10a6:4:2b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.25 via Frontend
 Transport; Thu, 14 May 2020 14:29:21 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT028.mail.protection.outlook.com (10.152.20.99) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.19 via Frontend Transport; Thu, 14 May 2020 14:29:21 +0000
Received: ("Tessian outbound fb9de21a7e90:v54");
 Thu, 14 May 2020 14:29:21 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6f67ce0d6b494af1
X-CR-MTA-TID: 64aa7808
Received: from 4ef0435808d9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A3512FBA-7077-4E9E-B016-38DFBE18D576.1; 
 Thu, 14 May 2020 14:28:15 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4ef0435808d9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 14 May 2020 14:28:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j+l8XD0dKrkplkqaxyZYOY1onvoVcj0IwCPbQFyEKVdyjUAmMcoAerqoUn5M31Q5RFnO10OZC400MzIhQ0F6zCJ8arVfFBCxk9889mqOR7tcjpCeWTwKwyfAkiiMF8DMdBdqpAIrE0l8NLYpE8Cj1c0AmwneM42lEmN3bu+IGqGmMNqJbq/RVDymSoGkB5ywqVpWCPj6HFymm6gxYvMA1UFb1ITaCiIYxFubSw295mz7ENf+EQYA+6Fh8yL86cL3q6fwXNN6Wbz3YhGjY3C3LI3x6UFkBPQgAQ/t0CrJNv9tnrbvwjXw2z25oc03/QNCGDT3q+whYCZ7Cvp9lZOsCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2BZVsjf+c438uDvCdiV4xwfZF+wKN8GYiL936qBJPPI=;
 b=mZkg2iRdHQJG1rcQLcz5HYKkCPELi/Gf9dETmDqkIgE+aiXRcv0IqmABB6FrHKnrruBbSNdG3T+3QeebuV+G7f7kohghJwtofBKgKzNtWHJTuhtvMHgPY9QqvvmCgi31RTvP3yk0r0HdDJ3yihJYvaanJnV4sa+u61kD7R7C+LfPqBEJyRzX22lXPf8w15Zy2YPYf+m+cWkaT48C4umDS4h2GfO33vf5PsHm3/L3lJQKLBixjNHjmbSXK1KUIDVCoN5zzjIWZvqeeI2zIQ6z3C1mbZVhEizy7+YjFfk9UB7UvKH3IHLxgmahRPu6xhHVspYGk3bkLT09Xoyw676AYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2BZVsjf+c438uDvCdiV4xwfZF+wKN8GYiL936qBJPPI=;
 b=2IOTN84UexVXYzOBcb01rEEOuifu+SKto8y1p5NCBK6o4XPvdXKvbfbgb6bMzmhmH1DmiOpdx16qOGztjv3EqODO5yTtNzPakApShgy/joYYNpzRgXtX6d34Ms8fVKknl5SsSykwSe84hu7cVkGFBz3yuS6NRoMmjR1GQcO1+hM=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3884.eurprd08.prod.outlook.com (2603:10a6:10:78::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.33; Thu, 14 May
 2020 14:28:13 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3000.022; Thu, 14 May 2020
 14:28:13 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Error during update_runstate_area with KPTI activated
Thread-Topic: Error during update_runstate_area with KPTI activated
Thread-Index: AQHWKfvm/FV2s2q8bUucgMUz0AtbkA==
Date: Thu, 14 May 2020 14:28:12 +0000
Message-ID: <C6B0E24F-60E6-4621-8448-C8DBAE3277A9@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.xenproject.org; dkim=none (message not
 signed) header.d=none; lists.xenproject.org;
 dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7310c15c-7a40-4031-a4f0-08d7f813317c
x-ms-traffictypediagnostic: DB7PR08MB3884:|DB6PR0801MB1703:
X-Microsoft-Antispam-PRVS: <DB6PR0801MB1703EAFBA446A7D218E028F09DBC0@DB6PR0801MB1703.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
x-forefront-prvs: 040359335D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: xKO6i00nogS3mvdqGV9zfVkvo27AlemkE6za7E80g0IF1WQPJir105Kf4DXYppmozCPg3VmIkJKHf6a25FCAqXPNscemJyhHYKqoMF7wdvwr0iezkdVQi523qAQNacsPNYKkTARrQciSHvQPl6neuXMOfzh/r0tploKaW9H/IwoazNrz1SHax2W6kiwPqn4Ww9XCBWlN1shUMw7heTrf8HLxCt7fZQF9cgYRZyhqom6gQ6tBZIG/8ZHioefcHf0OWidQfilb6eDuj8KM4uENgh0GLPC3eig6Dmch2Apg/nWpTLyiRSfr1LaiYPpT09GNHx6yVAUs7cUP+Ezk1uCgJY4v/m6pxdlnxXma9zEWYpBlWpNw9FyeAj9ETSow67NpBAv8JPwQOZsuPp5h39NqPTEF8838pCKEoweUUKgqtAVZxYKxuTfBEh/TTVseaeXzS8OKQpx8ZcDqPwPt1Zg98GT9LOhekAqIJ9BM8Ws5HaGFpB2kERmYP29YkySSK1Vh+9ujFrhT6DZ9C8NHvsF6Pg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(6486002)(6506007)(6512007)(6916009)(36756003)(66476007)(66556008)(64756008)(76116006)(33656002)(5660300002)(15650500001)(8936002)(66946007)(186003)(91956017)(8676002)(316002)(26005)(66446008)(71200400001)(54906003)(2906002)(4326008)(86362001)(966005)(2616005)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: mrOvKUmHaKWSYijGVtUdWcbKNLGh2szfEUj/mtAfearIFOjk6jiKtT1Db/8saL2/P14rPQg47wHl2ATgfXEXydQdwf4KGbHW9i4SWPFFh9Jb6wg2VZ5QxuMYSXjiCydoY2SW2zFPFNWva4W/OC14nDSdb7uE6aGlT9+Pst+tY36o1zipe4dpvU80ZRM5yQ+TLZ7R/xqIYsXxRRoCge3UmaFZ6UxQDTNpEfL+UIYnzeVNFej0jXmvX7wx1jGcODjwd8hVrpNR5ewZpwjcsXTSd3u5wTntprewFzAm3Hw8yzFyRIaG7h2Muh4LbTjw7E04eglclfKv4LxvqzVIgDBSdWxanFhYAyjPrkYMdaHZEuH2kK5V/9qOSNIRvI431vZy0ghTWfA3xqe56W8bjyywzf7qh62uqt63kQ+g3OejhoDKSqbeO8TxMcwIvA3+NjShCfsAtlWJICdlZwVRfN29l36zN49TKy9O+mSul+EkFemwMz0OjaMLX/E0IcFTbM5U
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4FE509AC1606E748A9D44279AAD27872@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3884
Original-Authentication-Results: lists.xenproject.org;
 dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(396003)(376002)(346002)(136003)(39860400002)(46966005)(82310400002)(15650500001)(33656002)(356005)(2906002)(47076004)(4326008)(336012)(966005)(70206006)(82740400003)(81166007)(6506007)(70586007)(6512007)(6486002)(478600001)(54906003)(316002)(8676002)(2616005)(5660300002)(6916009)(36756003)(26005)(107886003)(186003)(8936002)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3c16ffa8-07d8-47d2-c231-08d7f81308b9
X-Forefront-PRVS: 040359335D
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0jWVszHPg3qWYBEB3lZDcoYSm5aegcCK/GGHwB6HtEkVQZAAm0ut2GgntTBtEvKZXqWKIHCptTmFpWTUFJ8t+25cglV1ExzOK0YsOjFMXZUlkIq2dKzzfiwBH42BdhQCq0j4sHw/Fc0sTbywxUCzHFlFCRyNYgawLh5p6AWlz9POXY7TZRd18uaGGYRXh9beQuMHkn2j864y4N5BASmIMO/NyrKRa+Ap2NIOj58UWyj0go4ZjjnU7Pq3/UyvmEG8lco4Wcqbw2y5lEanf++Hn/x4xP/sFlg+0cAHIl1SZZ9FGA55oSEg1s1lnqY6cvEd+2QPBQFzoVIeEcYQ4NbA8yKeqB9YZgDVvf9tbg7c3jz1mlyiSU67UIUUN7EW+dIAYDkvfR2uogdELVnvOL2qo7N7ardzbn8XtXsyQmSJ6WYyulQnzIFIsFPLO256SK4B0gjaHAAJYHmJSSR2Mir1zEFKGWpehh8xTP2eI0WX9McdkZ8ySitRMbH2fxGZHN5hkcMEIs4Lvlqj/hOsXR6I4VtpSY0cdH6A5cuJcv3v+Tn7hnUdIO0mXp03H1N6B0zRkw4SsPKNb+0QDiHwL0cW+GsRjmqM8cnqHdXNi4FBOrA=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2020 14:29:21.4463 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7310c15c-7a40-4031-a4f0-08d7f813317c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1703
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
Cc: nd <nd@arm.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

When executing linux on arm64 with KPTI activated (in Dom0 or in a DomU), I=
 have a lot of walk page table errors like this:
(XEN) p2m.c:1890: d1v0: Failed to walk page-table va 0xffffff837ebe0cd0

After implementing a call trace, I found that the problem was coming from t=
he update_runstate_area when linux has KPTI activated.

I have the following call trace:
(XEN) p2m.c:1890: d1v0: Failed to walk page-table va 0xffffff837ebe0cd0
(XEN) backtrace.c:29: Stacktrace start at 0x8007638efbb0 depth 10
(XEN)    [<000000000027780c>] get_page_from_gva+0x180/0x35c
(XEN)    [<00000000002700c8>] guestcopy.c#copy_guest+0x1b0/0x2e4
(XEN)    [<0000000000270228>] raw_copy_to_guest+0x2c/0x34
(XEN)    [<0000000000268dd0>] domain.c#update_runstate_area+0x90/0xc8
(XEN)    [<000000000026909c>] domain.c#schedule_tail+0x294/0x2d8
(XEN)    [<0000000000269524>] context_switch+0x58/0x70
(XEN)    [<00000000002479c4>] core.c#sched_context_switch+0x88/0x1e4
(XEN)    [<000000000024845c>] core.c#schedule+0x224/0x2ec
(XEN)    [<0000000000224018>] softirq.c#__do_softirq+0xe4/0x128
(XEN)    [<00000000002240d4>] do_softirq+0x14/0x1c

Discussing this subject with Stefano, he pointed me to a discussion started=
 a year ago on this subject here:
https://lists.xenproject.org/archives/html/xen-devel/2018-11/msg03053.html

And a patch was submitted:
https://lists.xenproject.org/archives/html/xen-devel/2019-05/msg02320.html

I rebased this patch on current master and it is solving the problem I have=
 seen.

It sounds to me like a good solution to introduce a VCPUOP_register_runstat=
e_phys_memory_area to not depend on the area actually being mapped in the g=
uest when a context switch is being done (which is actually the problem hap=
pening when a context switch is trigger while a guest is running in EL0).

Is there any reason why this was not merged at the end ?

Thanks
Bertrand


