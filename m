Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 504DE28D0F5
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 17:05:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6264.16718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSLrP-0005bO-JR; Tue, 13 Oct 2020 15:05:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6264.16718; Tue, 13 Oct 2020 15:05:07 +0000
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
	id 1kSLrP-0005az-G2; Tue, 13 Oct 2020 15:05:07 +0000
Received: by outflank-mailman (input) for mailman id 6264;
 Tue, 13 Oct 2020 15:05:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CdNA=DU=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kSLrO-0005au-4k
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 15:05:06 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.4.77]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5be091c8-e712-47c5-99b1-fe827e1f074e;
 Tue, 13 Oct 2020 15:05:04 +0000 (UTC)
Received: from AM5PR1001CA0047.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::24) by VI1PR08MB2638.eurprd08.prod.outlook.com
 (2603:10a6:802:1f::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.26; Tue, 13 Oct
 2020 15:05:01 +0000
Received: from AM5EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:15:cafe::d2) by AM5PR1001CA0047.outlook.office365.com
 (2603:10a6:206:15::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20 via Frontend
 Transport; Tue, 13 Oct 2020 15:05:01 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT041.mail.protection.outlook.com (10.152.17.186) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.23 via Frontend Transport; Tue, 13 Oct 2020 15:05:01 +0000
Received: ("Tessian outbound 7161e0c2a082:v64");
 Tue, 13 Oct 2020 15:05:01 +0000
Received: from f6558cdb2a45.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0DCE99D7-C113-4D13-BD88-AC7F6B3D6EF7.1; 
 Tue, 13 Oct 2020 15:04:54 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f6558cdb2a45.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 13 Oct 2020 15:04:54 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0802MB2294.eurprd08.prod.outlook.com (2603:10a6:4:85::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22; Tue, 13 Oct
 2020 15:04:52 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3455.031; Tue, 13 Oct 2020
 15:04:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=CdNA=DU=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kSLrO-0005au-4k
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 15:05:06 +0000
X-Inumbo-ID: 5be091c8-e712-47c5-99b1-fe827e1f074e
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown [40.107.4.77])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 5be091c8-e712-47c5-99b1-fe827e1f074e;
	Tue, 13 Oct 2020 15:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BKVBFY/fJAo4yBB6RO4M6FqSawyOCSqPYmhV6hs/NM4=;
 b=1SWJGBoELitopM8HGnlXYG0xB43hPvKligNp7Q2itohoSSYFH2sSVNoCVuOBqKv8BBs53fWW2nZ0+2NJ7hLKL6yzL5T+FQYLX4lr0Invd/BwVip7pnp1hVxxwqXKo9sk/AHuGj9KuEaxXy7qYLkyW03qNZ+NrR7/ckvpEq25XOA=
Received: from AM5PR1001CA0047.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::24) by VI1PR08MB2638.eurprd08.prod.outlook.com
 (2603:10a6:802:1f::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.26; Tue, 13 Oct
 2020 15:05:01 +0000
Received: from AM5EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:15:cafe::d2) by AM5PR1001CA0047.outlook.office365.com
 (2603:10a6:206:15::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20 via Frontend
 Transport; Tue, 13 Oct 2020 15:05:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT041.mail.protection.outlook.com (10.152.17.186) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.23 via Frontend Transport; Tue, 13 Oct 2020 15:05:01 +0000
Received: ("Tessian outbound 7161e0c2a082:v64"); Tue, 13 Oct 2020 15:05:01 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 116cb439551fccfd
X-CR-MTA-TID: 64aa7808
Received: from f6558cdb2a45.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0DCE99D7-C113-4D13-BD88-AC7F6B3D6EF7.1;
	Tue, 13 Oct 2020 15:04:54 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f6558cdb2a45.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 13 Oct 2020 15:04:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dihJcuMHmjQxAVERod5fKoXuM+zSlnCms6AG2dshFaa99cp4JNYCQlJ4YVigKSx4jHnSHJ4O9LkOpHW6K52XZumlY1qtNsMrFxpOymigin8xrVpmhqaQAGxM5pX3yR6zwBm+EAhnsSls86ynipHIh523DdveuAaPuW2uOPjIY9x8aaXpVKusN0hjVe0EuiPHqKBy+2RoPuQsYNwO4aFEWMiU85BWZen2VjrupVlquUyjB0snkPoQP1z3/G3KTLA+z/L21ZAp8rwRvOlukTOtopkfPCIFXuM5ZjMi//22+Lot2NqXS/bQl+Cco69hpY/naqMyZEfAOEo2thXQANA3Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BKVBFY/fJAo4yBB6RO4M6FqSawyOCSqPYmhV6hs/NM4=;
 b=Nd59fCKHo6vVrIUEpnGf7E0LwXgKhQ+W4TFntIgQ8e6zvSmQSnnFAptTyoGRvU8+eMFsr2H7hZrsdcQMHrcRS6soMiJuWgFLN6rO2osPy67eeWjZARvBW7bKn/bQyQAs28FoTm05vfGtvIjYMAWl4GGk1gpIuNgJTWa10dlzifFTmcmjAPtyWFJVUjiPPytPyf+62vB+v4oxDbxGIdibaJ+xUZKHIbj1onOXtMqebl9BNlGT1kw83W2Zc2DlKucbl0oTgDh/PtLSisXi5juguJLnxNZ2W0hP0SEx+ehikhwpicLh3hm0tvQPUbS8FZ/6B5jY10OJOSi+kkFd+aqYeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BKVBFY/fJAo4yBB6RO4M6FqSawyOCSqPYmhV6hs/NM4=;
 b=1SWJGBoELitopM8HGnlXYG0xB43hPvKligNp7Q2itohoSSYFH2sSVNoCVuOBqKv8BBs53fWW2nZ0+2NJ7hLKL6yzL5T+FQYLX4lr0Invd/BwVip7pnp1hVxxwqXKo9sk/AHuGj9KuEaxXy7qYLkyW03qNZ+NrR7/ckvpEq25XOA=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0802MB2294.eurprd08.prod.outlook.com (2603:10a6:4:85::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22; Tue, 13 Oct
 2020 15:04:52 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3455.031; Tue, 13 Oct 2020
 15:04:52 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: Re: [PATCH v2] build: always use BASEDIR for xen sub-directory
Thread-Topic: [PATCH v2] build: always use BASEDIR for xen sub-directory
Thread-Index: AQHWnLpvdle2+5+TPkS9pkZxhCxslKmVmiUAgAAQzIA=
Date: Tue, 13 Oct 2020 15:04:52 +0000
Message-ID: <A82D6948-1A32-45EA-B8CC-E3F0FBCEAF1F@arm.com>
References:
 <df2fc83d3a84dd3fc2e58101ded22847fdbaa862.1602082503.git.bertrand.marquis@arm.com>
 <f492da43-4fd2-b798-7bb3-3810be5f4893@suse.com>
In-Reply-To: <f492da43-4fd2-b798-7bb3-3810be5f4893@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: db9b9dfd-ceb3-474d-e7ee-08d86f895bb9
x-ms-traffictypediagnostic: DB6PR0802MB2294:|VI1PR08MB2638:
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB263857802364BE9921D01CB99D040@VI1PR08MB2638.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3+1pfq0jxBSX/6XMvjVr/DeCnjrjhWz3c6EJVp1K5cD1mqt1Bb4IHkaBTLYH5HlMWy2qXfxRFsrJyv5JPnbYTfq1leHecFJpsc9K3bheQwouCLGK+n8Ses3lzFHur7u0Se7CEDrz9AEujEnbnjxxZ8INJygBhrYjOjiGOWU9M3GyVOYMgC3AFFfK30KSjaBiYgKNEyGV/mZ56E3gWXbuVWO221U+w+3k6Q0nHO57GOH4AfeEWDUvz+JiZSB+R9Zu8ItvBWjclANmjlVWkUyngICrS18v1r1FZYY61oe1fWxOzDDJ9tAB9B0s+DR2/MjzcWGkVUT6Rui8P2WzpGupeQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(136003)(39860400002)(396003)(8676002)(66946007)(91956017)(86362001)(76116006)(186003)(36756003)(8936002)(53546011)(6506007)(316002)(2616005)(64756008)(66556008)(66476007)(26005)(5660300002)(4744005)(2906002)(4326008)(6916009)(6512007)(71200400001)(54906003)(66446008)(7416002)(33656002)(6486002)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 6PY950/9JM+tmXuZ2GCfPkFJlFWQ6JJhIsq12hFbAP5ri6bbXyVdjlWB/BqaiQDA5U5acoLLcIA8mqkt3BoYKdDd/q2DPRSOD7bqzvGxVfh7SogHM3Ews1jrqX+RtVDJlqz2WNTwlcR0xLO2k/nrKqbvfc/nhqQe9Ze7rzXb9zvU9009QvElCtx8rQoUIpGpJQNQV0Fr6yjmgUfnxbx62i/V7yN8rpgSGOAdcPtpt0C3GLzNR7TXRupxe/gexA0c8o8qPRA3AB/otuySBJlejKCm2YX+m7Ytd/EBZlgGaX8pUkGNYmQE57deGCtTdODbiWDEXSEXjFKxUQKAHXSIaSpg0Zur0DRgaviTl/e97idgZ8u+tiQsGIeLGyzojDPgDpLQw2xxMWzJxWGipm5OsK7iXmDhKYOW680lrCO/6XoKoSX2teXEvZ6+4VRetuAUJYsRjNBSKV3kan6yDvBlkjn6umFNTnluyXPW+FezoZGXfVfSpa+Vj6xRcOyDRKMAhj6BDBzTzWHXotSAzcR4C6hgHL0f/QCJG7rgyn2xPS03YmdPmWdJoh1fEGjE2z8tpHCYKjovgd/2cHG8lJ2KzgIOVTIWWpGCWgbmXfAtoOJCTdmLIgXHJk4m0G/vmS/zVmSKcyJbIvx04rpD+ih0GQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <AD3A460FC5803F4D802977E4C866F7B8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2294
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c4b1bb70-e0fb-4e31-6593-08d86f895670
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/WPLmXVkFf/wscSH0FzIDF3+zZwzKKvzM4zGknHuCEfZU/owEv+U7unNu4v4C+a++lPPLCWYKM7SqMRpqyhaWmsuXT6sB/nLFNeTogpCusgRwppleBTJRwO35bjtXt5zXqL+gB3k0t3ZUMpcbKEkqKLNQE+KVpYn64bMZtOpqOOvN46TOGcbTvCOhREC6ZWJztoFc9Y+KI8vG3cQdgQD5jypeGHNvqy2TO2p8uFRgnLL0WREtCSO0AWP2CblmcdUtxx87kfk54JT6e+euMy/CnjnJUY9mHiH67Oas30OFscv3MPlsdO/MxMFT1KUEfGNxW8GTS+KjqyH9cB4WNURClpaDNcEpewgObgDAgLs0617p1kvbtjuHgJS5a7/ZPjq+Ld8Bw3sxExX+wcJBGNiSw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(39860400002)(376002)(46966005)(82310400003)(478600001)(2906002)(70206006)(4326008)(36756003)(336012)(53546011)(70586007)(6506007)(6486002)(2616005)(81166007)(54906003)(356005)(33656002)(4744005)(26005)(47076004)(82740400003)(186003)(8676002)(8936002)(36906005)(316002)(6512007)(5660300002)(86362001)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2020 15:05:01.2418
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db9b9dfd-ceb3-474d-e7ee-08d86f895bb9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2638



> On 13 Oct 2020, at 15:04, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 07.10.2020 16:57, Bertrand Marquis wrote:
>> Modify Makefiles using $(XEN_ROOT)/xen to use $(BASEDIR) instead.
>>=20
>> This is removing the dependency to xen subdirectory preventing using a
>> wrong configuration file when xen subdirectory is duplicated for
>> compilation tests.
>>=20
>> BASEDIR is set in xen/lib/x86/Makefile as this Makefile is directly
>> called from the tools build and install process and BASEDIR is not set
>> there.
>>=20
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>=20
> And once again
> Acked-by: Jan Beulich <jbeulich@suse.com>
>=20

And thanks :-)

Bertrand


