Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C09842C67A3
	for <lists+xen-devel@lfdr.de>; Fri, 27 Nov 2020 15:16:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.39455.72380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kieY4-0006FH-UR; Fri, 27 Nov 2020 14:16:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39455.72380; Fri, 27 Nov 2020 14:16:32 +0000
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
	id 1kieY4-0006Es-QQ; Fri, 27 Nov 2020 14:16:32 +0000
Received: by outflank-mailman (input) for mailman id 39455;
 Fri, 27 Nov 2020 14:16:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4e3U=FB=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kieY2-0006El-Ow
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 14:16:30 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0c::629])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 03b2ded8-b195-4968-962f-f50f5cb89304;
 Fri, 27 Nov 2020 14:16:28 +0000 (UTC)
Received: from DB6P192CA0020.EURP192.PROD.OUTLOOK.COM (2603:10a6:4:b8::30) by
 DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.30; Fri, 27 Nov 2020 14:16:26 +0000
Received: from DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b8:cafe::95) by DB6P192CA0020.outlook.office365.com
 (2603:10a6:4:b8::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Fri, 27 Nov 2020 14:16:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT023.mail.protection.outlook.com (10.152.20.68) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.26 via Frontend Transport; Fri, 27 Nov 2020 14:16:25 +0000
Received: ("Tessian outbound d6c201accd3c:v71");
 Fri, 27 Nov 2020 14:16:25 +0000
Received: from 9db9305aa0c5.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E599E4C9-2682-4465-B3E7-38381134B81A.1; 
 Fri, 27 Nov 2020 14:16:08 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9db9305aa0c5.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 27 Nov 2020 14:16:08 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3386.eurprd08.prod.outlook.com (2603:10a6:10:46::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Fri, 27 Nov
 2020 14:16:07 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::8567:dffb:80c1:bc0]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::8567:dffb:80c1:bc0%7]) with mapi id 15.20.3589.031; Fri, 27 Nov 2020
 14:16:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=4e3U=FB=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kieY2-0006El-Ow
	for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 14:16:30 +0000
X-Inumbo-ID: 03b2ded8-b195-4968-962f-f50f5cb89304
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown [2a01:111:f400:fe0c::629])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 03b2ded8-b195-4968-962f-f50f5cb89304;
	Fri, 27 Nov 2020 14:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W0lKqdAxGV52KUnfN/GqFWuaEaMQkLORmFiAeJApcIQ=;
 b=eQrirgNQTZCdugX6/wtQMGbkPqYJSELONm1xogfD1qDCA4oDDofSiX9g/keGdo4hIZNwqMmZJOw7P5WA6Y99/Kir9xR0DIPdhOL5BhAx9nis9HR+0guntmc49tDfBaOEaHZUJNXkB2/GEuOMt6kn2tPTceLrhfkZ0NVecHJCF2g=
Received: from DB6P192CA0020.EURP192.PROD.OUTLOOK.COM (2603:10a6:4:b8::30) by
 DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.30; Fri, 27 Nov 2020 14:16:26 +0000
Received: from DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b8:cafe::95) by DB6P192CA0020.outlook.office365.com
 (2603:10a6:4:b8::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Fri, 27 Nov 2020 14:16:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT023.mail.protection.outlook.com (10.152.20.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.26 via Frontend Transport; Fri, 27 Nov 2020 14:16:25 +0000
Received: ("Tessian outbound d6c201accd3c:v71"); Fri, 27 Nov 2020 14:16:25 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 77f8d2eac79d42e1
X-CR-MTA-TID: 64aa7808
Received: from 9db9305aa0c5.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E599E4C9-2682-4465-B3E7-38381134B81A.1;
	Fri, 27 Nov 2020 14:16:08 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9db9305aa0c5.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 27 Nov 2020 14:16:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q3Ojk0qwf0TjDwXTritXeAoQsb9dnHqwh0S0d1hXLc/sBh2Zz2R54nmape5DmbzvCUkbU7qKuGm5WDIF0CRkVAPFqIYtCO/a8TtTMk2Aa16gQ8aIuYJ756NyTp3Wcr6aOas3BT47YZD3o98io6vQKZ9XpQ0sFyQDOAvUwSkKiUOcwKPE0RuQtCm/8RtXG7BtqK11vxdADoqEfUgWsTvWiJO2GoNzOWwHC29kygudl7uCt0XCWhwgx+SUJJoFJbewkeHdVIhGD7IzQn7rZV0GQmDd4WeCBrdqC7wgy2HqNCN2wD9PpB/65yGKHJshS6gyqjy429gBc1FeAmPzizPN8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W0lKqdAxGV52KUnfN/GqFWuaEaMQkLORmFiAeJApcIQ=;
 b=nD4rlL53D1vCW9mkwPmjKwojUXt+yyE/dxYJGOZFHnjeTz7aFylK88NmSZsiuvVkS4BlM530Z1RI9x6hoUDlZJFtJC9fNQGXLo6Cn4GYw8PsVQ9Ld5ygqYs0tzXVA6ACuv/nAvDK92rMgNDfEvh8Q/Lf/N6YuRWYCJqLIjoYUCi/eDYXMOcKc+7jt77kidn2v3EHCBiXuSKeuuXdOMXRIZ0ceyRvL8FVNmXrmies8W8x4gm5CS0y6RcChp3GUzPRYbyrL+mHRRzl6xZ71oV+ImgGpTIKjlWBJnuZG8Km7wZBDrEHlfdGrJr6IfyKUkeQjBPTz7RNJbgF6xdkHHjXww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W0lKqdAxGV52KUnfN/GqFWuaEaMQkLORmFiAeJApcIQ=;
 b=eQrirgNQTZCdugX6/wtQMGbkPqYJSELONm1xogfD1qDCA4oDDofSiX9g/keGdo4hIZNwqMmZJOw7P5WA6Y99/Kir9xR0DIPdhOL5BhAx9nis9HR+0guntmc49tDfBaOEaHZUJNXkB2/GEuOMt6kn2tPTceLrhfkZ0NVecHJCF2g=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3386.eurprd08.prod.outlook.com (2603:10a6:10:46::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Fri, 27 Nov
 2020 14:16:07 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::8567:dffb:80c1:bc0]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::8567:dffb:80c1:bc0%7]) with mapi id 15.20.3589.031; Fri, 27 Nov 2020
 14:16:07 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Rahul Singh <Rahul.Singh@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 3/3] ns16550: Gate all PCI code with CONFIG_X86
Thread-Topic: [PATCH v4 3/3] ns16550: Gate all PCI code with CONFIG_X86
Thread-Index: AQHWw1cvptOzj+DOhEKKe2XksTlGiKncBA0AgAAE9oA=
Date: Fri, 27 Nov 2020 14:16:07 +0000
Message-ID: <F1A3739A-D07C-429F-AC7B-47F7E2710377@arm.com>
References: <cover.1606326929.git.rahul.singh@arm.com>
 <6d64bb35a6ce247faaa3df2ebae27b6bfa1d969e.1606326929.git.rahul.singh@arm.com>
 <bacfe1c3-d86d-95b2-c52a-4bb86f1338ea@suse.com>
In-Reply-To: <bacfe1c3-d86d-95b2-c52a-4bb86f1338ea@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.9.225.195]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 168b1d40-4c00-494d-c6e0-08d892df0697
x-ms-traffictypediagnostic: DB7PR08MB3386:|DB7PR08MB3500:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB35009B0B89885D672CBF408F9DF80@DB7PR08MB3500.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 JkBjaAUY01kxYRk/RvQgtCEcpvatQ45yl3FGdkTCa8WBec0419NiT9nnXICP/1AAGJ82L5tuKycHPJq9j6NhuvP6bKjUnXJOqmLxVv+krWjg2i1vqEZRzXsPs09MFQL4mQStQDzY/TSeHufQecirDZiBgh+96EIWltXURDXQ79WJRl4irPgklmpwamYZqf+O7sxyGHSIaYlecLdUHqcKvcmCd9WnUrLzw2c6vR8i/cqSGMMHDiDS3kXBh/bdYxgudPFG9iXhjj7GF0Pvd8jdZ8zbZP9jRl4x9MLWlp+8/duY75JxCZrx+9aOtYq3rFdfdoCcWm/6LH4RGaQoWZDpcg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39860400002)(366004)(376002)(136003)(2906002)(5660300002)(8676002)(6512007)(6486002)(36756003)(8936002)(6916009)(86362001)(64756008)(66476007)(91956017)(76116006)(66556008)(66446008)(66946007)(4326008)(33656002)(54906003)(71200400001)(186003)(6506007)(53546011)(26005)(478600001)(2616005)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?M927DEbGUqAnGTiPl3WDg/SnxvLnwrCR6vfOgFFIxbOeaLIl5MIVIXhgTBAd?=
 =?us-ascii?Q?TA+QVixn4woItN1Ynn/FYZ0higInnF4spO12g2ntvxgzv/ELYDPrbQG2WGJ1?=
 =?us-ascii?Q?H6ROVfj45+7TEYFgo4/ttOb7+msTRJxcoTJHhLTULAryoBFm6xrJFhlz4O52?=
 =?us-ascii?Q?4otn2fsVwHF2gcO60B1fuL/svhjw6yOlP2l2YG3bEePVohlRWmj/v2EGj485?=
 =?us-ascii?Q?b3xls5b7tJnzxrkU4csH9UxQ6d0cCk3UMvoxxPBDcRHR+pdsLsaoq1hA4QCL?=
 =?us-ascii?Q?ag5IwxnsBF4c7/epqNPtoKVlaZV4CjT5IzyXeFN7FmfwwAfAWOP4yrP9KmDX?=
 =?us-ascii?Q?DUwuILy8DhC3zgwbzc2P26kje2qrbu1+4FWr5prNGkUDpTwV5XBk9WcfOj/Z?=
 =?us-ascii?Q?lNoJ4xMLFnubrvAZIhpbbs8KqOYIekKEcoBN8x3s43s3uCn/+7DTNdvHG6h3?=
 =?us-ascii?Q?7fF/m9xA6NBmK5B4wjAL1YZPEWydCrE3z/wVtiW7ZVZxqPKnzb4e5pbiwL3e?=
 =?us-ascii?Q?Y7uDL0vET1DOUyB4UUfC7mbR5ytN7lehVycVmwDxefHaLMnhbG1C48r5rjHu?=
 =?us-ascii?Q?Wmlrgvcb7sbwdB2WOFM7hhUnCz00YcPtAvycCk8d5CmMSHHV1lczs3Mum+oI?=
 =?us-ascii?Q?Vul0TTLglIBb41LEdHG+Td+nJEgW3OmUKWZ65nkIXJXtD0+fB18+KdJvlsNN?=
 =?us-ascii?Q?Za0jLEq0J03jrzSdmj/J+A52HJumJeplPBzCRw42WQlAtfR8Se/FJXqGkLAG?=
 =?us-ascii?Q?YPM83yCW8svYW9Z9a3HwYGgib/RXQUlCS9994fF+vVnmM4PN8rDtBZ0lEmkZ?=
 =?us-ascii?Q?pEuRCHnDLOnXPT6DfO5vdgbktByRZ4yW+lrSOx1ivnr4HvJ7t1c/5uM/3Kfc?=
 =?us-ascii?Q?1bUQ67QvZzORMt4gXrsbbGeC4oRxO5D+IqRLBM9lRZFoW3lnUIDqiyF+2P11?=
 =?us-ascii?Q?kYd+NvGDsnmAC3L2tCZdjv7ytHC4YjZRmjYh+5uo8CaKbHmsMOnI28LWWw1r?=
 =?us-ascii?Q?hk5G?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DB27409D3E7E6341906AB6B2C9CD9D72@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3386
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	74b975c8-5e4d-4c3e-06a6-08d892defbaf
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qaBz0E+en1i06MR5HFWrtXquCMAnJLyBcPuLhzAUgibhb1tiwk3ClVUkFbcs6bTyLw4X2/67I05lFuWjyUJq4KGbI92CsbK6pZ8y+49Tt6QRwgNIBzxncBpxzgxRkm6z+FIWkDrFRapqfmcDICQoxNMN3MJf8zHArWMxNIky8FyeS6YUwvMaEHaoOwN7k7tEjO62L1Ugwi1PNRD9BCgaGf9ImdXjfFOoCZ5dXiYipzp9xtfKIoHL38cI7wvIR+1JBgNSbqewgTlRl+NJ7fNLNxi2numWA1xqG4EEDqOVqLRSnJFT1FdYqY3z5mRP9WXTl8N4avCK798BmvMPuorDToYorJv9DXsvqZSvrmYSTAllk+CsUnya7BAG6qbJw1ELZiy6hXLhH1UO5ny/Fdui+A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(376002)(136003)(46966005)(6512007)(2906002)(70206006)(82310400003)(336012)(81166007)(36756003)(6862004)(186003)(316002)(70586007)(2616005)(8676002)(53546011)(356005)(6506007)(5660300002)(26005)(54906003)(478600001)(47076004)(33656002)(82740400003)(8936002)(4326008)(6486002)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 14:16:25.8837
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 168b1d40-4c00-494d-c6e0-08d892df0697
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3500

Hi Jan,

> On 27 Nov 2020, at 13:58, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 25.11.2020 19:16, Rahul Singh wrote:
>> --- a/xen/drivers/char/ns16550.c
>> +++ b/xen/drivers/char/ns16550.c
>> @@ -16,7 +16,7 @@
>> #include <xen/timer.h>
>> #include <xen/serial.h>
>> #include <xen/iocap.h>
>> -#ifdef CONFIG_HAS_PCI
>> +#if defined(CONFIG_X86) && defined(CONFIG_HAS_PCI)
>> #include <xen/pci.h>
>> #include <xen/pci_regs.h>
>> #include <xen/pci_ids.h>
>> @@ -51,7 +51,7 @@ static struct ns16550 {
>>     unsigned int timeout_ms;
>>     bool_t intr_works;
>>     bool_t dw_usr_bsy;
>> -#ifdef CONFIG_HAS_PCI
>> +#if defined(CONFIG_X86) && defined(CONFIG_HAS_PCI)
>=20
> I'm sorry to be picky, but this being a hack wants, imo, also calling
> it so, by way of a code comment. Clearly this should go at one of the
> first instances, yet neither of the two above are really suitable imo.
> Hence I'm coming back to my prior suggestion of introducing a
> consolidated #define without this becoming a Kconfig setting:
>=20
> /*
> * The PCI part of the code in this file currently is only known to
> * work on x86. Undo this hack once the logic has been suitably
> * abstracted.
> */
> #if defined(CONFIG_HAS_PCI) && defined(CONFIG_X86)
> # define NS16550_PCI
> #endif
>=20
> And then use NS16550_PCI everywhere. I'd be fine making this
> adjustment while committing, if I knew that (a) you're okay with it
> and (b) the R-b and A-b you've already got can be kept.
>=20

Sounds ok to me so you can keep my R-b if you go this way.

Cheers
Bertrand

> Jan
>=20


