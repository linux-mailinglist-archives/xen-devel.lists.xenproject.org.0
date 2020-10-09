Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6B72883E9
	for <lists+xen-devel@lfdr.de>; Fri,  9 Oct 2020 09:49:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.4703.12449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQn8V-0005bX-K8; Fri, 09 Oct 2020 07:48:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4703.12449; Fri, 09 Oct 2020 07:48:19 +0000
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
	id 1kQn8V-0005b8-Gh; Fri, 09 Oct 2020 07:48:19 +0000
Received: by outflank-mailman (input) for mailman id 4703;
 Fri, 09 Oct 2020 07:48:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XHyC=DQ=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kQn8U-0005b3-Az
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 07:48:18 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.56]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cfe4ce1a-9937-4103-b2a9-4623c9adbdce;
 Fri, 09 Oct 2020 07:48:16 +0000 (UTC)
Received: from MR2P264CA0154.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1::17) by
 AM6PR08MB4534.eurprd08.prod.outlook.com (2603:10a6:20b:ba::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34; Fri, 9 Oct 2020 07:48:14 +0000
Received: from VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:501:1:cafe::16) by MR2P264CA0154.outlook.office365.com
 (2603:10a6:501:1::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21 via Frontend
 Transport; Fri, 9 Oct 2020 07:48:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT058.mail.protection.outlook.com (10.152.19.86) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.23 via Frontend Transport; Fri, 9 Oct 2020 07:48:13 +0000
Received: ("Tessian outbound 7161e0c2a082:v64");
 Fri, 09 Oct 2020 07:48:12 +0000
Received: from 5e6667de145c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D870A6AD-D3B1-4859-AF33-6F97E4A246C2.1; 
 Fri, 09 Oct 2020 07:48:07 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5e6667de145c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 09 Oct 2020 07:48:07 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB8PR08MB5324.eurprd08.prod.outlook.com (2603:10a6:10:11e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23; Fri, 9 Oct
 2020 07:48:06 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3455.026; Fri, 9 Oct 2020
 07:48:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=XHyC=DQ=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kQn8U-0005b3-Az
	for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 07:48:18 +0000
X-Inumbo-ID: cfe4ce1a-9937-4103-b2a9-4623c9adbdce
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown [40.107.2.56])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id cfe4ce1a-9937-4103-b2a9-4623c9adbdce;
	Fri, 09 Oct 2020 07:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VSph6GES7caMfjI+9zAybban9hXyWMX1td9tdi8K7RM=;
 b=XYLFcjiECZUXnvxrXjrZqetbA5KvN5ehSp0QQ/Guyz8Z7CgPyU2rae0goU5T4rtBuUolL5LT2NA905OC+PaEyrWY7rTgHv8r1HSXrGQnvg/m4siiQx/T8Np3HsIKK/leo1bzuMvXxaWQDuigWuBe0jdGFgVAAIcbFXcxAfhZ3Rs=
Received: from MR2P264CA0154.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1::17) by
 AM6PR08MB4534.eurprd08.prod.outlook.com (2603:10a6:20b:ba::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34; Fri, 9 Oct 2020 07:48:14 +0000
Received: from VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:501:1:cafe::16) by MR2P264CA0154.outlook.office365.com
 (2603:10a6:501:1::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21 via Frontend
 Transport; Fri, 9 Oct 2020 07:48:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT058.mail.protection.outlook.com (10.152.19.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.23 via Frontend Transport; Fri, 9 Oct 2020 07:48:13 +0000
Received: ("Tessian outbound 7161e0c2a082:v64"); Fri, 09 Oct 2020 07:48:12 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2883794f510aa1c4
X-CR-MTA-TID: 64aa7808
Received: from 5e6667de145c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D870A6AD-D3B1-4859-AF33-6F97E4A246C2.1;
	Fri, 09 Oct 2020 07:48:07 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5e6667de145c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 09 Oct 2020 07:48:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nYZU/DsjQNWu/ZGeGmmrHXc7EGat12RP3zIpEU3yp9yjF/8D5/6EEKvO13EhpL5NDdQVzVtK+1d70nbG8zRU+NabOUGCGVjRysGlvINdTo9eWv0EIuSMhr+pglS0fNB1W4bN1ntK7toGrN5akv3j3OfQI/x1wicYbMkR/9R9U7p5vCIl4d5ok882050TgcxtS5882OLEC7/Ew+acc7xXucZVJlNYvJ9/A6f3x2Io3QkDadl/tE5XANHbsGMR5eJZsPkJleIIIhlNc6gB1hyJxw4IM2ujFlAk283GT1GkQY03tquoIwQb3WXNJbpgkKAkCdiJMDto3boB+FJKbei2RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VSph6GES7caMfjI+9zAybban9hXyWMX1td9tdi8K7RM=;
 b=Dx7wbKDIlFYT6I/JovbHAZMSU7hnpT0P+pgbpEU8Q/TcaDvjbFTtvj/1Z+L9OS3qLC3U8VVIX9mVqAJIQdC7FNvRoVh14pM8F4RbjKKc31w7VFZN3GUKmk3ufjy886KKOX8xivE7mCY6cBslbVo/npBJNT38Fb5b1VopUrq6Rgd9QiStINzHxH99XuEgJPfaXMqawAnteJs9/TX7TvDRnWOi43vwSNo6ooedPVzHY/Z+4IAbq72vgKeWxI9DNytSByYef7lojxj0X0NHI++gUOBJl7NVUweCdF8qJZfGQBzq788VVvyfWZLXnmEtGMZsyO20oJEI+WvEgDvBD8gn5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VSph6GES7caMfjI+9zAybban9hXyWMX1td9tdi8K7RM=;
 b=XYLFcjiECZUXnvxrXjrZqetbA5KvN5ehSp0QQ/Guyz8Z7CgPyU2rae0goU5T4rtBuUolL5LT2NA905OC+PaEyrWY7rTgHv8r1HSXrGQnvg/m4siiQx/T8Np3HsIKK/leo1bzuMvXxaWQDuigWuBe0jdGFgVAAIcbFXcxAfhZ3Rs=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB8PR08MB5324.eurprd08.prod.outlook.com (2603:10a6:10:11e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23; Fri, 9 Oct
 2020 07:48:06 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3455.026; Fri, 9 Oct 2020
 07:48:06 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, "julien@xen.org"
	<julien@xen.org>, Stefano Stabellini <stefano.stabellini@xilinx.com>,
	"roman@zededa.com" <roman@zededa.com>
Subject: Re: [PATCH v3] xen/rpi4: implement watchdog-based reset
Thread-Topic: [PATCH v3] xen/rpi4: implement watchdog-based reset
Thread-Index: AQHWnPqc7v70BAMN4EaAQA/1huLhsamNV4yAgACv0gCAAN+3gA==
Date: Fri, 9 Oct 2020 07:48:05 +0000
Message-ID: <B196761E-78D7-4891-A28E-E04E0B85A202@arm.com>
References: <20201007223813.1638-1-sstabellini@kernel.org>
 <1A694341-33AC-41E1-B216-2D3E1A6C45B4@arm.com>
 <alpine.DEB.2.21.2010081103110.23978@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2010081103110.23978@sstabellini-ThinkPad-T480s>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b94155c2-5ca2-4c4e-70d8-08d86c27ad15
x-ms-traffictypediagnostic: DB8PR08MB5324:|AM6PR08MB4534:
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB453440BD54507753FB6B9CC49D080@AM6PR08MB4534.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6108;OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 S8W4SQ8Q7e7AEmOIqgteDYt7RDCgrk39tmmTlnVzpN3iz2gPxihEddQgzCfiKYRxpwtfbejpS+Q2VPOqaqZsTqa4jMMZ8qX1OPKLmEKAGZAB1TQw8tEvYp/WDoAUlGOqC0Is5vgDX+FAVJJ04K9UTwpDRdTTHG327PVFwMqiqBaK6JjBKGjegGqdrMDt0k1CZMF1bJwGBcLIiIm+QHr9jkPGCw2v/BGBy2Os/QIAycn8+WL98zTK0fOVblt8he2ugWFbAnXtVTwMOQgxPAJ2raP5aw0E/X21lwycKndR8SBwmNE0d3VQfuyNBgQf6Vq+0lenjXEcgOF6QiszktWYug==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(39860400002)(366004)(376002)(316002)(6512007)(83380400001)(186003)(6506007)(26005)(4326008)(36756003)(53546011)(6916009)(6486002)(54906003)(478600001)(71200400001)(86362001)(2616005)(64756008)(76116006)(91956017)(5660300002)(66476007)(8936002)(8676002)(66946007)(2906002)(33656002)(66446008)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 TeJjUlC5H3LzA7dgoyCksbvXJdIsJagBf0g5qxiA19Op/VfIdkAX5786Q1k2zcCs987irR3iikVY+a2Cj3Ekt2y0UMI9qO3GuPFKWlXL402appsYX36CMELLhbyiJSYXuJE90XJehoyAkWEZIb5pVXBQV/3u5M9KBliNA0tg1KIOU/2jH3RAHe85Fq6EBwquOxEt31HzoJVVWqIZCpvYB63NHHXGmHrSr+vGOPhQdqpAyT3pUU3es3+QVYqUakXpcFmImYbllxoHw0ngReKSqjSUsWSPQ/3GiBVGnQGeLi4J39ifIOcADU2ek7wHj59Ni89va3mIiR3v8qe4PLWawNvuq8H+3YQTVtV7YCd2E3+c4iRDpSal/u2THjC316T66ao1ak8NTrC/gOIG0OajdOHIW46/moE6r4AprpIMSbIRQ/c+qrZ8WEvBT3PFubp+fGdd4+veL8xnhIq6hFNXmZZqO7uCf9HpV5HJ2MsbYjdbEHoRctPNH2diLjdN8si7gJyRoHtOotUsq5+EUDBqGD8mmUxkDS5DVLmhZfd+J7u/NdkH0ZnsnqoqYS3ubN4tmlyt5FKhczoXvWRCxS4CxibDOnnhnJ2+h3s0ww+d1x/gry2YpxUC5pt20yEzqikqb5hVF6QCnVLlouAtQBhysw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B7DB6FD66C8704468D0E9AC83F340C83@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5324
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c5f7effc-4538-408c-0b24-08d86c27a88e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pHVDUsZGJK8DrS8KYDfC5B6BOuKBDgceiLomSGetTFWrQ0tfovk5kBWO7dfbJak1y/8XvGukNzCShojWgDId0vHk2uKQ4V2fHUYcA/gtYWO2vLns7iHZCEw78nLSU756SDlANIUea/+EhSDgQodhQjWDUithPWaoZLxm2wNBtnCcojNDE66bbRnxlr5jdiSKjl13620gzw9wRFYPQOsK8KU2GgEarlBrUprLmR5ZcrwSYZRwjNbNglawPW+SdCPmKaHfAM3GCnxXgvelHiSUgtTEMOIr8wqX1A6U/S0wVSMcIHSCf9/V5wvIRP7pLW4xK/FahyjzX1K+lsUYpOXCiZz9XtkkgG/rK9oZwzcqCWfC7lU48xiKqWbRNY2EddQwIRFPRT2ET4HBbRYswQcZDA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(396003)(346002)(136003)(46966005)(186003)(4326008)(6506007)(6862004)(81166007)(54906003)(356005)(6486002)(53546011)(6512007)(82740400003)(36756003)(26005)(47076004)(107886003)(33656002)(83380400001)(336012)(82310400003)(2616005)(478600001)(5660300002)(8676002)(316002)(70206006)(86362001)(70586007)(8936002)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2020 07:48:13.5203
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b94155c2-5ca2-4c4e-70d8-08d86c27ad15
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4534



> On 8 Oct 2020, at 19:27, Stefano Stabellini <sstabellini@kernel.org> wrot=
e:
>=20
> On Thu, 8 Oct 2020, Bertrand Marquis wrote:
>>> On 7 Oct 2020, at 23:38, Stefano Stabellini <sstabellini@kernel.org> wr=
ote:
>>>=20
>>> The preferred method to reboot RPi4 is PSCI. If it is not available,
>>> touching the watchdog is required to be able to reboot the board.
>>>=20
>>> The implementation is based on
>>> drivers/watchdog/bcm2835_wdt.c:__bcm2835_restart in Linux v5.9-rc7.
>>>=20
>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>>> Acked-by: Julien Grall <jgrall@amazon.com>
>>=20
>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>=20
>> Maybe a printk if reset was not successful ?
>=20
> That not quite platform specific but we could add a printk to
> xen/arch/arm/shutdown.c:machine_restart if we are still alive after
> 100ms.

Even nicer :-)
Definitely usefull to see something if for one reason reset/restart did
not succeed for whatever reason.

>=20
> I'll commit this patch as is and maybe send another one for
> machine_restart.

Please tell me if you want me to handle that one (at the end I did request
that so not really fare to ask you to do it:-) ).

Cheers
Bertrand


