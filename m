Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 636D52A0ABB
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 17:09:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.16016.39275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYWxD-0002gM-5u; Fri, 30 Oct 2020 16:08:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 16016.39275; Fri, 30 Oct 2020 16:08:39 +0000
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
	id 1kYWxD-0002fx-2j; Fri, 30 Oct 2020 16:08:39 +0000
Received: by outflank-mailman (input) for mailman id 16016;
 Fri, 30 Oct 2020 16:08:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CFCO=EF=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kYWxC-0002fs-0m
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 16:08:38 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.70]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8fb4790f-0582-4d36-a2f4-0a3e539b4685;
 Fri, 30 Oct 2020 16:08:36 +0000 (UTC)
Received: from AM6P191CA0004.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::17)
 by VI1PR0802MB2493.eurprd08.prod.outlook.com (2603:10a6:800:b3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.28; Fri, 30 Oct
 2020 16:08:34 +0000
Received: from AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8b:cafe::b4) by AM6P191CA0004.outlook.office365.com
 (2603:10a6:209:8b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Fri, 30 Oct 2020 16:08:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT009.mail.protection.outlook.com (10.152.16.110) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Fri, 30 Oct 2020 16:08:34 +0000
Received: ("Tessian outbound c189680f801b:v64");
 Fri, 30 Oct 2020 16:08:33 +0000
Received: from 740202d60fa8.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DAAFDF4A-1FEC-487A-B75D-235418EF3387.1; 
 Fri, 30 Oct 2020 16:08:28 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 740202d60fa8.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 30 Oct 2020 16:08:28 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0801MB1989.eurprd08.prod.outlook.com (2603:10a6:4:75::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Fri, 30 Oct
 2020 16:08:27 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3499.029; Fri, 30 Oct 2020
 16:08:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=CFCO=EF=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kYWxC-0002fs-0m
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 16:08:38 +0000
X-Inumbo-ID: 8fb4790f-0582-4d36-a2f4-0a3e539b4685
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown [40.107.21.70])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 8fb4790f-0582-4d36-a2f4-0a3e539b4685;
	Fri, 30 Oct 2020 16:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RjezaDM00I+46WbgQ4e7+hY68YD3206+DCBkgdUK+3o=;
 b=laXtd6NORx0DdsU7goHswxbi4EMS4OGeazfJlMNiH+/zPMnaAhncPEfwmNdSnV0XY4XJ+auq48QN67F1HL3uhm0dDtcUqA3PKtfvE8zE9tU5jziNAO23HYb4je90OHaIrPyW5XqupGqwjPLSFhJl2pTlCDratcm3XWfDdsLBKUM=
Received: from AM6P191CA0004.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::17)
 by VI1PR0802MB2493.eurprd08.prod.outlook.com (2603:10a6:800:b3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.28; Fri, 30 Oct
 2020 16:08:34 +0000
Received: from AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8b:cafe::b4) by AM6P191CA0004.outlook.office365.com
 (2603:10a6:209:8b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Fri, 30 Oct 2020 16:08:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT009.mail.protection.outlook.com (10.152.16.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Fri, 30 Oct 2020 16:08:34 +0000
Received: ("Tessian outbound c189680f801b:v64"); Fri, 30 Oct 2020 16:08:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ae9f11cd77450740
X-CR-MTA-TID: 64aa7808
Received: from 740202d60fa8.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id DAAFDF4A-1FEC-487A-B75D-235418EF3387.1;
	Fri, 30 Oct 2020 16:08:28 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 740202d60fa8.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 30 Oct 2020 16:08:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cbPlOoEOMMS30jZZA6DlNBSt1sIK0kN8DfYLd2wZ/3R9WUTq36UGI4R5Q/2HHnnQ9Ne7gXRAFv3wOUzvRgcP0xCHd5DmooZylHPg5KovA4qh8PygmABgXzeKaG3d+2XGGrGgcdy9vByp3Eh/W6dS0A8mu9Ceg2Sc8PAomjL2zgM/Uo4fLcBD1AsveDy8jmzpYlBqbGLvBg3apG8PzyzlvnBEFn2zmn8TEP8Apon2a/8r0rp4OtV+iCzkT17HJuYtHH3FqMaZN4pt+yITeNcjqjfTPHVlhir3kEeF0eIszqW0v+YrchyAjsblKDkdQhAkX4R73FLQABEjbqI514uA3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RjezaDM00I+46WbgQ4e7+hY68YD3206+DCBkgdUK+3o=;
 b=SRhiPAojAQDWCNhcDP6gX3txoL6PtWdSuq2TKGc1hddwQ7gKgHWewv8L117i2Y+DgNYuAfvJj+vt1IbPGHjs1SL1taIfIi82N+6VGKgf41zYFVPgphzPMoDR0aCM5aWkRfK+sbaV5iqTfIa+ac31W0Ij5AZqyYqB/w4LXcl42+fjQXkOHLuSuxwGZpzW3GYMyo5mVdMYNQP92xruYm/iqyGS9QX6/fqprHubUdttjKPEgYKI1WmECPdEfuR+bq9KvEL0E2YVXKSsLlip8+K5K8DbJVkqgZXJYDogQ8udg8bB6lLCZ6xCQJRVr7bs3BBIreVXEWcdLJUbe6tJ9yga7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RjezaDM00I+46WbgQ4e7+hY68YD3206+DCBkgdUK+3o=;
 b=laXtd6NORx0DdsU7goHswxbi4EMS4OGeazfJlMNiH+/zPMnaAhncPEfwmNdSnV0XY4XJ+auq48QN67F1HL3uhm0dDtcUqA3PKtfvE8zE9tU5jziNAO23HYb4je90OHaIrPyW5XqupGqwjPLSFhJl2pTlCDratcm3XWfDdsLBKUM=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0801MB1989.eurprd08.prod.outlook.com (2603:10a6:4:75::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Fri, 30 Oct
 2020 16:08:27 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3499.029; Fri, 30 Oct 2020
 16:08:27 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: Rahul Singh <Rahul.Singh@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Paul
 Durrant <paul@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
Thread-Topic: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
Thread-Index: AQHWoVvyGh0jWzCHpk6w/U7XN+08x6mwEIWAgABD5gCAAAQ9AIAAEmwA
Date: Fri, 30 Oct 2020 16:08:26 +0000
Message-ID: <E1137D39-EDF2-4663-A990-7628B7057B45@arm.com>
References:
 <b085e894773842ac320b818aa6f84289d0a128ed.1602591365.git.rahul.singh@arm.com>
 <09cfc160-3490-0aeb-f872-04fb4ce04364@epam.com>
 <2AB3A125-D530-4627-A877-EC2BCDCD63DC@arm.com>
 <da9d0192-7431-83ab-be1a-cc107ee1ac4c@epam.com>
In-Reply-To: <da9d0192-7431-83ab-be1a-cc107ee1ac4c@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6e4480c3-d6cd-447f-b6fc-08d87cee0d55
x-ms-traffictypediagnostic: DB6PR0801MB1989:|VI1PR0802MB2493:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0802MB2493FD6E5F8C32B16FD083999D150@VI1PR0802MB2493.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 nmTWQNbHkNwi1WmQTWvmsh4gBgwLK7eCU6sNm14hlp2qcXRHwKt2a00m9Vt2Rch/jYNqsWJlMtIHh/NP/6r6V84V+xV82Jf7f1te7MWggW5QIUpyG+VpOVmwh/RjJnCcUKEd6lDbsHEvO6tos3/n41DjdWTJYmq4+HeYIldxBXBzw0J+86kpMMe2Wm2cT1xJuqjRsI5Ccs0WfOIP4euYPT1DRgYCJVroEqoj4nRp41+4Ih1h7Sl5OhEm8JTnnqAG294AUzsx8OO/1vUiBQFW+7A//7+XEjHNlpwi7OMT4z4+4kGewJhTvXW98C4p59gc8HiTgPM8BSOpAJqp0ZzF6eQ7baB+siU4hUN5Sjd7fhVV87oCDR0iQVlu6GBCDPEu+DseUJRjv1WomJhSGGXS4A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(396003)(136003)(366004)(376002)(316002)(26005)(86362001)(71200400001)(6916009)(186003)(6486002)(33656002)(54906003)(5660300002)(4326008)(36756003)(478600001)(91956017)(966005)(2616005)(6512007)(76116006)(8676002)(64756008)(66946007)(53546011)(6506007)(8936002)(66556008)(66476007)(66446008)(2906002)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 uniEXVqtrgGx0OEQHAugj14uNPjUxEJuVT/8XzEbjvwnuz+t23KOuSiDNv6QMgPt7IbAYksVlYwZICPSmK0Zw/mYYgPTuthof72sqE9sQgQmFcKkTqW5jBH6HTJOd7RKY5gvpWBw3Wqs18+7iNeTe92MpKYQiAMj0PxZJ5qsECbUkuLp3pZIgqsC+R/pat3C2CORQH9H/lkkZ1H3GaiqO0+6GNVb99IvE0+VhSoVkL7jr+tef6qe/Cng/8Y1IQ7/Cm5a5sERocJEqfnq5zJIQotYH8HOIsOzwTxHcJ7j1lmSWkn7yRP5RTK70j9P2WfZ26nDqTlXslXGMgsJx3iVTGwkEGmg4eyW1Hf3p/WLQ094AvUtjuDGR+CYJPXrH9bxTJMTFBwxyuKV59bYOJxMzffJ8OQ8gDuxLPdAtV+30i6NiFrbqvNfANuHP/PdeVrsfJI1eQHbsl+K2JNa1U928nychFcMhVqddS9Ot08fZr95Npy127Hhz0M+DitifZ8bHZUIyd71l3PcV3u6tuoK1VdG5lmiLikvV8EOf87pJszOZuExU9IjOF1PFjBozk3ib0foVlg6mHpNP4XZm3oXQieSIBv4jxyh6K/Gmvc26P0smik+Fs5oXV/C8XMYsSr21/We3+L4kfd1qxM1HH9t8A==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D00FED731FBE094FACB8197851601B03@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1989
Original-Authentication-Results: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d472815f-232c-4ff7-7789-08d87cee0932
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FHUgliiUiK31HgGGC2h/SqBTZgRHOMx5wUhkUWEEKl6sWIs71JCDhcrUtkPmKZTFbsuJ7fAKVBrqICawaRyf4VEZeQu3xUY9jq4ySEAmyCNIFjz0hM7k5bMDrZLqfyM+M33LUV4sIOjlQQcn11SqwNYxF8Ee6KbNDou3cX5qzZweNLQU7TzswoP7DpaGioiVk+od6V0vxZBgRYSGgxHr0wYoBINH094ILk1M61en5Q09MOAOFPEr+GrlpuW8lThmN/1rVmgrMi4K8BsTxbrrSkWMjI7qOFRCNCgw+L0nhZV8fVJ1WFVH5kCJRT54uCGohcCFeaM8WP7tPIharRjhJXzmZSl1+rhI9ZEBE+HR2eVfT127Hu4yz1W+8asz41+P8KkAP4/eKSBPG+glguw2g9IhihzjHZ8iv5VBO46D4mubWx39Fzbm8IKvWex4vX3mDNbJMJZSx427n5MXJxQILXGxXfyfb269PyPdJOOG09Y=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(346002)(376002)(46966005)(8676002)(26005)(5660300002)(82310400003)(8936002)(47076004)(2616005)(2906002)(336012)(966005)(83380400001)(33656002)(478600001)(4326008)(107886003)(6862004)(36906005)(186003)(316002)(81166007)(36756003)(356005)(86362001)(70586007)(6486002)(70206006)(6512007)(6506007)(53546011)(82740400003)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2020 16:08:34.0137
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e4480c3-d6cd-447f-b6fc-08d87cee0d55
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2493

Hi Oleksandr,

> On 30 Oct 2020, at 15:02, Oleksandr Andrushchenko <Oleksandr_Andrushchenk=
o@epam.com> wrote:
>=20
> Hi,
>=20
> On 10/30/20 4:47 PM, Rahul Singh wrote:
>> Hello Oleksandr,
>>=20
>>> On 30 Oct 2020, at 10:44 am, Oleksandr Andrushchenko <Oleksandr_Andrush=
chenko@epam.com> wrote:
>>>=20
>>> Hi, Rahul!
>>>=20
>>> On 10/20/20 6:25 PM, Rahul Singh wrote:
>>>> Add support for ARM architected SMMUv3 implementations. It is based on
>>>> the Linux SMMUv3 driver.
>>>>=20
>>>> Major differences between the Linux driver are as follows:
>>>> 1. Only Stage-2 translation is supported as compared to the Linux driv=
er
>>>>    that supports both Stage-1 and Stage-2 translations.
>>> First of all thank you for the efforts!
>>>=20
>>> I tried the patch with QEMU and would like to know if my understanding =
correct
>>>=20
>>> that this combination will not work as of now:
>>>=20
>>> (XEN) SMMUv3: /smmuv3@9050000: SMMUv3: DT value =3D eventq
>> I have limited knowledge about QEMU internals.As what I see from the log=
s, fault is occurred at early driver initialisation when SMMU driver is try=
ing to probe the HW.
>>=20
>>> (XEN) Data Abort Trap. Syndrome=3D0x1940010
>>> (XEN) Walking Hypervisor VA 0x40031000 on CPU0 via TTBR 0x00000000b8469=
000
>>> (XEN) 0TH[0x0] =3D 0x00000000b8468f7f
>>>=20
>>> [snip]
>>>=20
>>> If this is expected then is there any plan to make QEMU work as well?
>>>=20
>>> I see [1] says that "Only stage 1 and AArch64 PTW are supported." on QE=
MU side.
>> Yes as of now only Stage-2 is supported in XEN.If we have any requiremen=
t or use case that depends on Stage-1 translation we can support that also =
in XEN.
> The use case is below: PCI passthrough and various configurations includi=
ng SR-IOV which is possible with QEMU...

This is currently not in the list of configuration supported or that we hav=
e planned on our side to support.

But we would be more then happy to review any changes to enable this :-)

Regards
Bertrand

>>=20
>>>=20
>>> We are interested in QEMU/SMMUv3 as a flexible platform for PCI passthr=
ough
>>>=20
>>> implementation, so it could allow testing different setups and configur=
ations with QEMU.
>>>=20
>>>=20
>>> Thank you in advance,
>>>=20
>>> Oleksandr
>>>=20
>>> [1] https://urldefense.com/v3/__https://patchwork.ozlabs.org/project/qe=
mu-devel/cover/1524665762-31355-1-git-send-email-eric.auger@redhat.com/__;!=
!GF_29dbcQIUBPA!h-EaE0OnSbXtLBSwIS311alDl7pn8sH7sihgIYqilM5-r-8kCH6USNNlLB3=
xhbzc6eczUOrhcw$ [patchwork[.]ozlabs[.]org]
>> Regards,
>> Rahul
>=20
> Thank you,
>=20
> Oleksandr


