Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3884229EFAA
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 16:25:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14289.35413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kY9nE-0007kE-Uq; Thu, 29 Oct 2020 15:24:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14289.35413; Thu, 29 Oct 2020 15:24:48 +0000
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
	id 1kY9nE-0007jp-RQ; Thu, 29 Oct 2020 15:24:48 +0000
Received: by outflank-mailman (input) for mailman id 14289;
 Thu, 29 Oct 2020 15:24:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sh/s=EE=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kY9nD-0007jj-Cc
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 15:24:47 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0d::620])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 18d7b006-2ffe-4887-82c9-ac10440d2560;
 Thu, 29 Oct 2020 15:24:45 +0000 (UTC)
Received: from MRXP264CA0007.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:15::19)
 by VI1PR08MB3552.eurprd08.prod.outlook.com (2603:10a6:803:81::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19; Thu, 29 Oct
 2020 15:24:43 +0000
Received: from VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:15:cafe::1f) by MRXP264CA0007.outlook.office365.com
 (2603:10a6:500:15::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Thu, 29 Oct 2020 15:24:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT063.mail.protection.outlook.com (10.152.18.236) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Thu, 29 Oct 2020 15:24:42 +0000
Received: ("Tessian outbound 7c188528bfe0:v64");
 Thu, 29 Oct 2020 15:24:42 +0000
Received: from c89f5e344ddd.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EA7DA308-6565-48E5-AC33-791B81806C2B.1; 
 Thu, 29 Oct 2020 15:24:14 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c89f5e344ddd.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 29 Oct 2020 15:24:14 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB6090.eurprd08.prod.outlook.com (2603:10a6:10:208::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Thu, 29 Oct
 2020 15:24:10 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3477.028; Thu, 29 Oct 2020
 15:24:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=sh/s=EE=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kY9nD-0007jj-Cc
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 15:24:47 +0000
X-Inumbo-ID: 18d7b006-2ffe-4887-82c9-ac10440d2560
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown [2a01:111:f400:fe0d::620])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 18d7b006-2ffe-4887-82c9-ac10440d2560;
	Thu, 29 Oct 2020 15:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qa/pCWZFXD+sFV8cZRKbKmtTkBEMrqltU9AtHXXs1fs=;
 b=OCONyekbFsNnbaLl59gvtzRnZO4A7pF38lQ8ol+bBquRHkyy8RcESjPKmZHb0HEr2SEBw12g+z7rMjjKw661DLuMmrjyjVJ+8L0J3Xi3JBH/0R/xiWIjwbsgHDbNr4GvbfE0BjXcPgSARKZZXfDlACFaJnHKl0n/OV51uqqPjoA=
Received: from MRXP264CA0007.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:15::19)
 by VI1PR08MB3552.eurprd08.prod.outlook.com (2603:10a6:803:81::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19; Thu, 29 Oct
 2020 15:24:43 +0000
Received: from VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:15:cafe::1f) by MRXP264CA0007.outlook.office365.com
 (2603:10a6:500:15::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Thu, 29 Oct 2020 15:24:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT063.mail.protection.outlook.com (10.152.18.236) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Thu, 29 Oct 2020 15:24:42 +0000
Received: ("Tessian outbound 7c188528bfe0:v64"); Thu, 29 Oct 2020 15:24:42 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8cc10f7d42b108fa
X-CR-MTA-TID: 64aa7808
Received: from c89f5e344ddd.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id EA7DA308-6565-48E5-AC33-791B81806C2B.1;
	Thu, 29 Oct 2020 15:24:14 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c89f5e344ddd.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 29 Oct 2020 15:24:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kOMGVFiPMiaBeVPts20aQ9oPgSIDgg5LOJtJFMbBNBeoshi5RvycfpphHMkmgw4ip6sj/2MN4C1TnYQiMt3jJKOZMzkT1GqOqlBo8E8dZ/oVetlgqb0c8VTw4mF+cfz9cw1m4UZIv0/kguHI1hemmHUXKD0tjCM3578/f/sVm9XLLtg66iIrn90vZUO6jKYgwJoupJ80fMKX/IOR1cedatOzJLPF1M/0WEch9T3ZWyMlUOXlsLxiFJNPKnpN2BqxFU8ouMs1K2eiaxVX8ImzDAhN3WoJDlBXsKIwrWf/Re6b3+SjN6cNO/24NU8Hsem97YKntZN9tIjPTHwncW5YBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qa/pCWZFXD+sFV8cZRKbKmtTkBEMrqltU9AtHXXs1fs=;
 b=Av0QU7imBh8AfIvhHSjL74wYHswb4rDZs6Brfa7ERzNlNGuKP8gJP5s8VuwYu7EkA6NhxseX2yuKkm1qG0LVuY38PcK88JkclZKcvA6di9ca3cw2b4BV24ZCTNiUD3Mv53AY8NoBDwXslqTq83XruGUrYMdVjJ2PGuAKbw/Ol274/NVT/P9Y2w+m1PSgQ/pHz0FbwSWmvS8PV9698QZlopx946iUbTWVWzLl6xTwBWSmpx6hOb9Dm8sIi6FHt6awO5jZwiGP30XQMVusQAX8t71JzOEG5GDHS2imEPctTURAE11gV+AjYK+5nWe+S6Kt4wWDTjhjr/m2zvreo143xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qa/pCWZFXD+sFV8cZRKbKmtTkBEMrqltU9AtHXXs1fs=;
 b=OCONyekbFsNnbaLl59gvtzRnZO4A7pF38lQ8ol+bBquRHkyy8RcESjPKmZHb0HEr2SEBw12g+z7rMjjKw661DLuMmrjyjVJ+8L0J3Xi3JBH/0R/xiWIjwbsgHDbNr4GvbfE0BjXcPgSARKZZXfDlACFaJnHKl0n/OV51uqqPjoA=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB6090.eurprd08.prod.outlook.com (2603:10a6:10:208::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Thu, 29 Oct
 2020 15:24:10 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3477.028; Thu, 29 Oct 2020
 15:24:10 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Ian
 Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/2] tools/libs: fix uninstall rule for header files
Thread-Topic: [PATCH 2/2] tools/libs: fix uninstall rule for header files
Thread-Index: AQHWpeifIAHoNnN0LEeTc6ujCHuJAqmuw0aA
Date: Thu, 29 Oct 2020 15:24:10 +0000
Message-ID: <5495896C-2AD6-413E-A1A6-D9994F10D391@arm.com>
References: <2c9a0407-1bd1-6898-d1e3-9be4c869684b@suse.com>
 <74c629db-0f63-aba0-f294-9668c29b8f70@suse.com>
In-Reply-To: <74c629db-0f63-aba0-f294-9668c29b8f70@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b4238e84-25e6-499f-1d8d-08d87c1ec285
x-ms-traffictypediagnostic: DBBPR08MB6090:|VI1PR08MB3552:
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB3552207606DDF1900A5485669D140@VI1PR08MB3552.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 LZCfhW35j3xvFfKObpgK6f7+EjBvdyz4fkrLv069lHO48VYb+SKDkIBfrhjtoqIZOSoxrDh8GzBr1KubN10veOUIJbT24JMt8AltrrbUfPdXb6uT3KcqrtNhBrUb/MqHlzAvs4sqksWQkD7WIrOCxMxikP8hU8zVn7qRgIsmVgyK2AfkFsFonr5ZIH4jPoxibL4LchRasxSNxCSjhWqpLsAGjEskxk1MHGpvbyCzGBXxYlNmzmvyp93Kkf9zFT7tV/4HKa8jZQS2kvESLbVrQx0dAMTu7MQFKqfoEzOEFmtcfDvlZQYy+tuU+OuhOZ2RKjdnKC7eVZmgxRul3syBew==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(376002)(366004)(39860400002)(5660300002)(33656002)(2616005)(4744005)(54906003)(316002)(53546011)(6506007)(36756003)(8676002)(91956017)(66446008)(64756008)(66476007)(8936002)(66556008)(66946007)(71200400001)(76116006)(26005)(186003)(86362001)(2906002)(4326008)(478600001)(6916009)(6512007)(6486002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 y2sQMnQJVXh3PxF5Y9DHl2RR2v1o+t4Jycko4s1O+0Lf3qzTBtQs5bYJEHIei+nUuafS/k5kZxAfSITONjWbp2eIwngaHOILw+okvtbY6VMyzCf/Yeu/h/hiD1D2Mkve2wDRvkbJYMDx53NTWpzhcG3NhIP6amLwMaoH9T47vkjEPCwHE3RW1axcZ+BMnrywt09+bO8gWOPT/i7D96jUjBgFDOnbSun/+sQlSc130aiML8TnGz3MxJZ7RudoFJDyTGQBMOlSTdXs/NUsXVUVSHbTJp7EQbqWI4pu0GnYYI7Jl3meEduNjVUFykdnYoHbMfdMkYeMG9qDJRzL/Yo6vlEhLabFqvRc2vZ+NvyzTAZfnK4Q9tZ4JLeFCBHss41jB0hHdOmH6hctXHsqNn1IKnCE9ZeNw9W+o61d26ZBoLCbyTzhnNJfpsXT0P3QbYocCTfqpPEl25yg6WCrllSH+vYr/yE0uJDvu+0JP1yl5/FMSJu1nvnJisAl3Dw44KuYAJoAvf7gHVMMb4KXa9XpWUcwpa7bMib8ySd9eBPM3aKbmh5Eblod+k9T0nxJ+vw8SLUcXCzgIB+AJqLHfuETk/0bx8BMM10C5nqmr8AtrpEWd06twgJKuLfRnX/sADE396Zzy4CNd1PEG+fhbQct9g==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4DA6A219E03CFF49B741FC175285678B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6090
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	95490a88-963b-482f-472b-08d87c1eaf43
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wz4huWq7fwpM79T/g89hID0L21toDMYUB1D2XzRDIaSHp+Aytcf/c5SOp8DN5NmWEESz8prToBt1Y4qNquhEug9VWiiJnOpTimM7gRYghyeAv/0tcPttXD2IrXeflcOmqaitaq86pBxOA4bC6Lgd8/i5W5cyOnLJuE+53F/7wjihYE1sEkW3XGewm/OB3jHIq2NxB9DwryEdSj0dSnslGY/LRytuyLzs+SjgkOpDs++n/a6cCQnt9vNnM7YpGc+tBVUe2UTLYYtlxAoyGYyKHvXMb/YIYDu7ssD/qNQdVRTm6w2EEb3QL70Zqzrp+kfAXJMl1Z5dnxxopuJXZSmfMelM0l2Hw7hqfIjLACMOkXGgSBooC+LWVyjfUBOKArH0KjSwcp+C3i+y/PnqjptnwA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(376002)(136003)(46966005)(82310400003)(81166007)(4326008)(6486002)(356005)(6512007)(478600001)(2616005)(6862004)(4744005)(6506007)(33656002)(8676002)(53546011)(5660300002)(8936002)(82740400003)(70586007)(70206006)(86362001)(54906003)(2906002)(36756003)(26005)(36906005)(316002)(336012)(47076004)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2020 15:24:42.6232
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4238e84-25e6-499f-1d8d-08d87c1ec285
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3552



> On 19 Oct 2020, at 08:21, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> This again was working right only as long as $(LIBHEADER) consisted of
> just one entry.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

The change is obviously fixing a bug :-) and the double $ is required to pr=
otect from make.

Cheers
Bertrand


> ---
> An alternative would be to use $(addprefix ) without any shell loop.
>=20
> --- a/tools/libs/libs.mk
> +++ b/tools/libs/libs.mk
> @@ -107,7 +107,7 @@ install: build
> .PHONY: uninstall
> uninstall:
> 	rm -f $(DESTDIR)$(PKG_INSTALLDIR)/$(LIB_FILE_NAME).pc
> -	for i in $(LIBHEADER); do rm -f $(DESTDIR)$(includedir)/$(LIBHEADER); d=
one
> +	for i in $(LIBHEADER); do rm -f $(DESTDIR)$(includedir)/$$i; done
> 	rm -f $(DESTDIR)$(libdir)/lib$(LIB_FILE_NAME).so
> 	rm -f $(DESTDIR)$(libdir)/lib$(LIB_FILE_NAME).so.$(MAJOR)
> 	rm -f $(DESTDIR)$(libdir)/lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR)
>=20
>=20


