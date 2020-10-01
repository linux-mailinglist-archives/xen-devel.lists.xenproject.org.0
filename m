Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0407D280394
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 18:10:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1423.4545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kO19j-0008Qh-Ij; Thu, 01 Oct 2020 16:10:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1423.4545; Thu, 01 Oct 2020 16:10:07 +0000
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
	id 1kO19j-0008O3-Ez; Thu, 01 Oct 2020 16:10:07 +0000
Received: by outflank-mailman (input) for mailman id 1423;
 Thu, 01 Oct 2020 16:10:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e2ni=DI=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kO19h-000885-K5
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 16:10:05 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.46]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5b12a177-f55d-4de2-b13d-9826d2160811;
 Thu, 01 Oct 2020 16:10:03 +0000 (UTC)
Received: from AM6P194CA0062.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::39)
 by VE1PR08MB5822.eurprd08.prod.outlook.com (2603:10a6:800:1a7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22; Thu, 1 Oct
 2020 16:10:01 +0000
Received: from AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:84:cafe::d9) by AM6P194CA0062.outlook.office365.com
 (2603:10a6:209:84::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35 via Frontend
 Transport; Thu, 1 Oct 2020 16:10:01 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT037.mail.protection.outlook.com (10.152.17.241) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Thu, 1 Oct 2020 16:10:01 +0000
Received: ("Tessian outbound 7161e0c2a082:v64");
 Thu, 01 Oct 2020 16:10:01 +0000
Received: from 79c45fb50dbd.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 ECC83E17-10DC-443A-8563-C8B2826F9F00.1; 
 Thu, 01 Oct 2020 16:09:23 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 79c45fb50dbd.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 01 Oct 2020 16:09:23 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3594.eurprd08.prod.outlook.com (2603:10a6:10:4e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34; Thu, 1 Oct
 2020 16:09:22 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e%6]) with mapi id 15.20.3412.029; Thu, 1 Oct 2020
 16:09:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=e2ni=DI=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kO19h-000885-K5
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 16:10:05 +0000
X-Inumbo-ID: 5b12a177-f55d-4de2-b13d-9826d2160811
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown [40.107.20.46])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 5b12a177-f55d-4de2-b13d-9826d2160811;
	Thu, 01 Oct 2020 16:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cE87yPdEd0Vb6O8VXh/1P4LZ63afPFJQdYv776+yqXE=;
 b=zCxltG1DpFkRlyij2ZDSk3rUdu1IkUao/ATiGVE7gWFnyA7tJcmEtOMrL+w8nUhXzaRdjDKoqX/Hwc7ZA88IEO0H55fTI/gBFA5sHLqAx7h6VIDojnhdg5qdZA3bmwc4UzpjyoXJGY7/C4zqVWUNC+n2WBdJql0syNto3g4+CNM=
Received: from AM6P194CA0062.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::39)
 by VE1PR08MB5822.eurprd08.prod.outlook.com (2603:10a6:800:1a7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22; Thu, 1 Oct
 2020 16:10:01 +0000
Received: from AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:84:cafe::d9) by AM6P194CA0062.outlook.office365.com
 (2603:10a6:209:84::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35 via Frontend
 Transport; Thu, 1 Oct 2020 16:10:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT037.mail.protection.outlook.com (10.152.17.241) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Thu, 1 Oct 2020 16:10:01 +0000
Received: ("Tessian outbound 7161e0c2a082:v64"); Thu, 01 Oct 2020 16:10:01 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 72bda2ce2a8f91dc
X-CR-MTA-TID: 64aa7808
Received: from 79c45fb50dbd.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id ECC83E17-10DC-443A-8563-C8B2826F9F00.1;
	Thu, 01 Oct 2020 16:09:23 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 79c45fb50dbd.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 01 Oct 2020 16:09:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U7xoXCIL72sRraiEpM/Qjnh5qetlxUC0j1kHCoVw8/JZ3n0ZhYzKGFj5zgmdnccANM/d3ATJ5eQG71WrFMx211Dzig7Uff37oYMS23MVwcSBsUl2G//5TS5rqGapl0Iqt+FdXKFTTRD1MyPaOJPN1hXws0SaNkAKYf61l3Ua7sdqzVYudXY4g4UVmOoqh5ot9P1WpgbM++5bbJ/IbSUU6l6Pjpdaw67QuWVABlj4QrpRi4gyfRQK1GeKC3c0NuE9HUvhbsyXWqI78VwgTrpyi8QnhtVZzGztO8qFqw0JNgukn3A6m+n/XXRvfbkbbttPoRoPdSaSdMsuQePK6hWjuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cE87yPdEd0Vb6O8VXh/1P4LZ63afPFJQdYv776+yqXE=;
 b=D0842UJgdZ+NysDtJxGCXrLk2/uIcvKrvFqtIFCCFrW0+BO1Jk2i51sM5kpQ9tcJovmnEIogYYaLYFmkRfIjP+ezrpAi2t4962rXH7rAnwukCxtWiz2IcIOpBOd/04TmsFmH4Yx41brCgh/jN15tjoVSXia2tSp9onpxwz0gJxFN/7hr/5Tq91m1IgJ7saM0yqqHEUqSfoI+scpUmBjx00fmbKDo25zMS8SKqaKpti64BQIdb0XH3FErfBTlwov9hIbmXE++2kkWdB7nG7Jn0H6RE7ob/Aa8tEWxNAbhLtvOv6xnqiXpj9dvuN07aorXmM1cI06ZD3efwoz5OeASow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cE87yPdEd0Vb6O8VXh/1P4LZ63afPFJQdYv776+yqXE=;
 b=zCxltG1DpFkRlyij2ZDSk3rUdu1IkUao/ATiGVE7gWFnyA7tJcmEtOMrL+w8nUhXzaRdjDKoqX/Hwc7ZA88IEO0H55fTI/gBFA5sHLqAx7h6VIDojnhdg5qdZA3bmwc4UzpjyoXJGY7/C4zqVWUNC+n2WBdJql0syNto3g4+CNM=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3594.eurprd08.prod.outlook.com (2603:10a6:10:4e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34; Thu, 1 Oct
 2020 16:09:22 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e%6]) with mapi id 15.20.3412.029; Thu, 1 Oct 2020
 16:09:22 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Juergen Gross <jgross@suse.com>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Samuel Thibault
	<samuel.thibault@ens-lyon.org>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v2 3/3] tools/lixenguest: hide struct elf_dom_parms layout
 from users
Thread-Topic: [PATCH v2 3/3] tools/lixenguest: hide struct elf_dom_parms
 layout from users
Thread-Index: AQHWkwRX9mhuhJlLT02HG0+RUuXJnKmC9GmA
Date: Thu, 1 Oct 2020 16:09:22 +0000
Message-ID: <AFBA8F7E-D421-4BF3-A8F0-9204A0A9BB6A@arm.com>
References: <20200925062031.12200-1-jgross@suse.com>
 <20200925062031.12200-4-jgross@suse.com>
In-Reply-To: <20200925062031.12200-4-jgross@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 86a842ba-227a-4e8a-480c-08d866247369
x-ms-traffictypediagnostic: DB7PR08MB3594:|VE1PR08MB5822:
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB58223F463C9AB153567952779D300@VE1PR08MB5822.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 9e/tnVrNcMTTNe6zRVGKp6a1xG050e5aciGKFZCgoGB8OCVkoLQhW4S1PDigXHsdHnR88j+OQcpMqNpLog9cYPgwkXXyAcImsQnSo97ZVV3o1xKvqpmN7FJNlsWLInxAKbrnmd0cuiXDbblpk+CIcC3jfKPP7RhLzHgtwfBE0j8L5hXViQMuOL+yPsvYWbW95IvKKT7miUeBgAnwx05r7013WU9a4PcWl0WKEEG0B4859jQ8oHaz/l/z3NyWH9krqJyhMwokeVUMjYEqv97jobapRBV39CPBfqqKtIDjWlSwZm93xQeReEuGwA2HR0KI7LwyJyzx7D4Xu83HYjoltxG6yzD/CXTFSZK7OSFITv5c5MOmIkLkJipoa5q18B1WqTiFxpVKHOA3nx8aITvNnZ3M8xHWMlXcfxUQnZk6W7Y=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(366004)(136003)(346002)(376002)(6506007)(186003)(66946007)(66446008)(54906003)(316002)(76116006)(33656002)(36756003)(64756008)(66556008)(66476007)(6486002)(86362001)(6916009)(30864003)(2906002)(6512007)(26005)(5660300002)(91956017)(8676002)(53546011)(2616005)(71200400001)(83380400001)(8936002)(478600001)(4326008)(26730200005)(19860200003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 XL6PQ4lFaAQ+wB5B0IxCul1bjT1kLwzCR9JesXzdN9dxqPeKc2P5meo7dpZnPT70ULyFj6Zue8hs1/BANO2qbEx6S8LCkmMDJWCJQJV9HoODGKo6BcEAET3teg0Ig7xMiEBW5I5wowYlyzob6eKOJCErvwml3upRPJuSt2TxEFSVtg3sd3aIQTk5Sv5+sIAL3UlioR2TmPUYAWaSUBKEyRNFvZynrAQ0L7k6Q1bXs730RqyGU5bacU+OZz9QEvFlbAOwUta8XCp5w6qCu6F6SbCenmlCDZuSMnAcwwFhdmD0LxFb/8ADJtvOAnY2B7ZX7+oFE+98FGArMgDFvBVpbKkBPk4B7oHKHZ+yfUIaX+/g0NSn1+iheRJBKHTBezdSFXsDPwtLEaacgU6D20BVG3aglUfJYgPZwkw0jus8GM1t4LYbwuNtck6JFV6i84zHaici/z6GsVMcPdN8uD3u3tZDm71Qv3d8H3hj7v5jjHy/UG+NM2r9qo2oQDTvg/TiB8/25YuJbBQ4I4GLt7Lfilb/p/IyNTwdvcKbOvsIiv/gi1DZXkePygFTp+hq30woaMvgxQQxJw3AiTPsdAvMdBWGVXp4wB6lXRv4+MqWhzS3wgZ33veUwHuWsTVXHevPLvaGimiGAJzu96g6s/eSAw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <37156746A6EBA84A92CDCC5BB2E67D1A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3594
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7c6cd08c-2abf-4856-9518-08d866245c66
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	F5F5lQYNMY2TdMydDFJMySG0DiiY9sX/OdPYK/pnTfKCs0qA+cc7e7okaY9SYwP8Yh2C0LyYz10PN608ii0h4S/5smBtywDYKH5RvwpNjXdMIBBr4YGGPw8qDf9kjFWjV0zTXofa1KbhNWMhz9r/kXM2VC9qa8P+ay4h7bCIL0iQ+vX5zBhJ1SYuM+H8tPJs46LsmvhWxSpguqOeKcxOCH2/XrWlsDhFHlbFtXDkdk+pr5lyGYG32zwLvMNbyibUxbEBMUZN22uUSC4tirJAxdcGQme0gQ4PUcnmKIr3sCYIXkW0lET7CBIImhUCZno/5nqcGbXj4vebMrsvxhlkuw9e3U0kZSLQwfIaVmV6xtJR/8qKArgBCFj37eVY79BS83QR7x+nsc5SmAvw+Xaw8tJWe68qTAKtvFPbhcXgpMC04noi6AGf9EH/Lzgr6Kh3sVQmrAQg/95cD9lZLFJGWCxV/O5x6syabWKv8U3qsjbccSu4Y/eWwRo5aV4zJ9//
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(39850400004)(346002)(46966005)(336012)(83380400001)(54906003)(6862004)(6486002)(356005)(8676002)(8936002)(6506007)(36756003)(53546011)(2616005)(4326008)(107886003)(82740400003)(81166007)(33656002)(70206006)(70586007)(30864003)(26005)(2906002)(478600001)(86362001)(5660300002)(316002)(47076004)(36906005)(186003)(82310400003)(6512007)(26730200005)(19860200003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2020 16:10:01.3340
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86a842ba-227a-4e8a-480c-08d866247369
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5822

Hi Juergen,

> On 25 Sep 2020, at 07:20, Juergen Gross <jgross@suse.com> wrote:
>=20
> Don't include struct elf_dom_parms in struct xc_dom_image, but rather
> use a pointer to reference it. Together with adding accessor functions
> for the externally needed elements this enables to drop including the
> Xen private header xen/libelf/libelf.h from xenguest.h.

There are several places in xg_dom_elfloader.c, xg_dom_arm.c and
xg_dom_armzimageloader.c which would need to be fixed as they are
using dom->parms.

Cheers
Bertrand

>=20
> Fixes: 7e0165c19387 ("tools/libxc: untangle libxenctrl from libxenguest")
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> stubdom/grub/kexec.c                | 18 +++---
> tools/libs/guest/include/xenguest.h | 29 +++-------
> tools/libs/guest/xg_dom_core.c      | 85 +++++++++++++++++++++++------
> tools/libs/guest/xg_private.h       |  1 +
> tools/libxl/libxl_x86_acpi.c        |  5 +-
> 5 files changed, 88 insertions(+), 50 deletions(-)
>=20
> diff --git a/stubdom/grub/kexec.c b/stubdom/grub/kexec.c
> index e9a69d2a32..3da80b5b4a 100644
> --- a/stubdom/grub/kexec.c
> +++ b/stubdom/grub/kexec.c
> @@ -222,6 +222,7 @@ void kexec(void *kernel, long kernel_size, void *modu=
le, long module_size, char
>     char features[] =3D "";
>     struct mmu_update *m2p_updates;
>     unsigned long nr_m2p_updates;
> +    uint64_t virt_base;
>=20
>     DEBUG("booting with cmdline %s\n", cmdline);
>     xc_handle =3D xc_interface_open(0,0,0);
> @@ -294,10 +295,11 @@ void kexec(void *kernel, long kernel_size, void *mo=
dule, long module_size, char
>         goto out;
>     }
>=20
> +    virt_base =3D xc_dom_virt_base(dom);
>     /* copy hypercall page */
>     /* TODO: domctl instead, but requires privileges */
> -    if (dom->parms.virt_hypercall !=3D -1) {
> -        pfn =3D PHYS_PFN(dom->parms.virt_hypercall - dom->parms.virt_bas=
e);
> +    if (xc_dom_virt_hypercall(dom) !=3D -1) {
> +        pfn =3D PHYS_PFN(xc_dom_virt_hypercall(dom) - virt_base);
>         memcpy((void *) pages[pfn], hypercall_page, PAGE_SIZE);
>     }
>=20
> @@ -313,11 +315,11 @@ void kexec(void *kernel, long kernel_size, void *mo=
dule, long module_size, char
>     /* Move current console, xenstore and boot MFNs to the allocated plac=
e */
>     do_exchange(dom, dom->console_pfn, start_info.console.domU.mfn);
>     do_exchange(dom, dom->xenstore_pfn, start_info.store_mfn);
> -    DEBUG("virt base at %llx\n", dom->parms.virt_base);
> +    DEBUG("virt base at %llx\n", virt_base);
>     DEBUG("bootstack_pfn %lx\n", dom->bootstack_pfn);
> -    _boot_target =3D dom->parms.virt_base + PFN_PHYS(dom->bootstack_pfn)=
;
> +    _boot_target =3D virt_base + PFN_PHYS(dom->bootstack_pfn);
>     DEBUG("_boot_target %lx\n", _boot_target);
> -    do_exchange(dom, PHYS_PFN(_boot_target - dom->parms.virt_base),
> +    do_exchange(dom, PHYS_PFN(_boot_target - virt_base),
>             virt_to_mfn(&_boot_page));
>=20
>     if ( dom->arch_hooks->setup_pgtables )
> @@ -373,13 +375,13 @@ void kexec(void *kernel, long kernel_size, void *mo=
dule, long module_size, char
>     _boot_oldpdmfn =3D virt_to_mfn(start_info.pt_base);
>     DEBUG("boot old pd mfn %lx\n", _boot_oldpdmfn);
>     DEBUG("boot pd virt %lx\n", dom->pgtables_seg.vstart);
> -    _boot_pdmfn =3D dom->pv_p2m[PHYS_PFN(dom->pgtables_seg.vstart - dom-=
>parms.virt_base)];
> +    _boot_pdmfn =3D dom->pv_p2m[PHYS_PFN(dom->pgtables_seg.vstart - virt=
_base)];
>     DEBUG("boot pd mfn %lx\n", _boot_pdmfn);
>     _boot_stack =3D _boot_target + PAGE_SIZE;
>     DEBUG("boot stack %lx\n", _boot_stack);
> -    _boot_start_info =3D dom->parms.virt_base + PFN_PHYS(dom->start_info=
_pfn);
> +    _boot_start_info =3D virt_base + PFN_PHYS(dom->start_info_pfn);
>     DEBUG("boot start info %lx\n", _boot_start_info);
> -    _boot_start =3D dom->parms.virt_entry;
> +    _boot_start =3D xc_dom_virt_entry(dom);
>     DEBUG("boot start %lx\n", _boot_start);
>=20
>     /* Keep only useful entries */
> diff --git a/tools/libs/guest/include/xenguest.h b/tools/libs/guest/inclu=
de/xenguest.h
> index dba6a21643..a9984dbea5 100644
> --- a/tools/libs/guest/include/xenguest.h
> +++ b/tools/libs/guest/include/xenguest.h
> @@ -22,8 +22,6 @@
> #ifndef XENGUEST_H
> #define XENGUEST_H
>=20
> -#include <xen/libelf/libelf.h>
> -
> #define XC_NUMA_NO_NODE   (~0U)
>=20
> #define XCFLAGS_LIVE      (1 << 0)
> @@ -109,7 +107,7 @@ struct xc_dom_image {
>     uint32_t f_requested[XENFEAT_NR_SUBMAPS];
>=20
>     /* info from (elf) kernel image */
> -    struct elf_dom_parms parms;
> +    struct elf_dom_parms *parms;
>     char *guest_type;
>=20
>     /* memory layout */
> @@ -390,6 +388,13 @@ void *xc_dom_pfn_to_ptr_retcount(struct xc_dom_image=
 *dom, xen_pfn_t first,
>                                  xen_pfn_t count, xen_pfn_t *count_out);
> void xc_dom_unmap_one(struct xc_dom_image *dom, xen_pfn_t pfn);
> void xc_dom_unmap_all(struct xc_dom_image *dom);
> +void *xc_dom_vaddr_to_ptr(struct xc_dom_image *dom,
> +                          xen_vaddr_t vaddr, size_t *safe_region_out);
> +uint64_t xc_dom_virt_base(struct xc_dom_image *dom);
> +uint64_t xc_dom_virt_entry(struct xc_dom_image *dom);
> +uint64_t xc_dom_virt_hypercall(struct xc_dom_image *dom);
> +char *xc_dom_guest_os(struct xc_dom_image *dom);
> +bool xc_dom_feature_get(struct xc_dom_image *dom, unsigned int nr);
>=20
> static inline void *xc_dom_seg_to_ptr_pages(struct xc_dom_image *dom,
>                                       struct xc_dom_seg *seg,
> @@ -411,24 +416,6 @@ static inline void *xc_dom_seg_to_ptr(struct xc_dom_=
image *dom,
>     return xc_dom_seg_to_ptr_pages(dom, seg, &dummy);
> }
>=20
> -static inline void *xc_dom_vaddr_to_ptr(struct xc_dom_image *dom,
> -                                        xen_vaddr_t vaddr,
> -                                        size_t *safe_region_out)
> -{
> -    unsigned int page_size =3D XC_DOM_PAGE_SIZE(dom);
> -    xen_pfn_t page =3D (vaddr - dom->parms.virt_base) / page_size;
> -    unsigned int offset =3D (vaddr - dom->parms.virt_base) % page_size;
> -    xen_pfn_t safe_region_count;
> -    void *ptr;
> -
> -    *safe_region_out =3D 0;
> -    ptr =3D xc_dom_pfn_to_ptr_retcount(dom, page, 0, &safe_region_count)=
;
> -    if ( ptr =3D=3D NULL )
> -        return ptr;
> -    *safe_region_out =3D (safe_region_count << XC_DOM_PAGE_SHIFT(dom)) -=
 offset;
> -    return ptr + offset;
> -}
> -
> static inline xen_pfn_t xc_dom_p2m(struct xc_dom_image *dom, xen_pfn_t pf=
n)
> {
>     if ( xc_dom_translated(dom) )
> diff --git a/tools/libs/guest/xg_dom_core.c b/tools/libs/guest/xg_dom_cor=
e.c
> index c0d4a0aa2f..f846d8e1ed 100644
> --- a/tools/libs/guest/xg_dom_core.c
> +++ b/tools/libs/guest/xg_dom_core.c
> @@ -735,6 +735,7 @@ void xc_dom_release(struct xc_dom_image *dom)
>         xc_dom_unmap_all(dom);
>     xc_dom_free_all(dom);
>     free(dom->arch_private);
> +    free(dom->parms);
>     free(dom);
> }
>=20
> @@ -753,6 +754,12 @@ struct xc_dom_image *xc_dom_allocate(xc_interface *x=
ch,
>     memset(dom, 0, sizeof(*dom));
>     dom->xch =3D xch;
>=20
> +    dom->parms =3D malloc(sizeof(*dom->parms));
> +    if (!dom->parms)
> +        goto err;
> +    memset(dom->parms, 0, sizeof(*dom->parms));
> +    dom->alloc_malloc +=3D sizeof(*dom->parms);
> +
>     dom->max_kernel_size =3D XC_DOM_DECOMPRESS_MAX;
>     dom->max_module_size =3D XC_DOM_DECOMPRESS_MAX;
>     dom->max_devicetree_size =3D XC_DOM_DECOMPRESS_MAX;
> @@ -762,12 +769,12 @@ struct xc_dom_image *xc_dom_allocate(xc_interface *=
xch,
>     if ( features )
>         elf_xen_parse_features(features, dom->f_requested, NULL);
>=20
> -    dom->parms.virt_base =3D UNSET_ADDR;
> -    dom->parms.virt_entry =3D UNSET_ADDR;
> -    dom->parms.virt_hypercall =3D UNSET_ADDR;
> -    dom->parms.virt_hv_start_low =3D UNSET_ADDR;
> -    dom->parms.elf_paddr_offset =3D UNSET_ADDR;
> -    dom->parms.p2m_base =3D UNSET_ADDR;
> +    dom->parms->virt_base =3D UNSET_ADDR;
> +    dom->parms->virt_entry =3D UNSET_ADDR;
> +    dom->parms->virt_hypercall =3D UNSET_ADDR;
> +    dom->parms->virt_hv_start_low =3D UNSET_ADDR;
> +    dom->parms->elf_paddr_offset =3D UNSET_ADDR;
> +    dom->parms->p2m_base =3D UNSET_ADDR;
>=20
>     dom->flags =3D SIF_VIRT_P2M_4TOOLS;
>=20
> @@ -920,8 +927,8 @@ int xc_dom_parse_image(struct xc_dom_image *dom)
>     for ( i =3D 0; i < XENFEAT_NR_SUBMAPS; i++ )
>     {
>         dom->f_active[i] |=3D dom->f_requested[i]; /* cmd line */
> -        dom->f_active[i] |=3D dom->parms.f_required[i]; /* kernel   */
> -        if ( (dom->f_active[i] & dom->parms.f_supported[i]) !=3D
> +        dom->f_active[i] |=3D dom->parms->f_required[i]; /* kernel   */
> +        if ( (dom->f_active[i] & dom->parms->f_supported[i]) !=3D
>              dom->f_active[i] )
>         {
>             xc_dom_panic(dom->xch, XC_INVALID_PARAM,
> @@ -1142,8 +1149,8 @@ int xc_dom_build_image(struct xc_dom_image *dom)
>         goto err;
>     }
>     page_size =3D XC_DOM_PAGE_SIZE(dom);
> -    if ( dom->parms.virt_base !=3D UNSET_ADDR )
> -        dom->virt_alloc_end =3D dom->parms.virt_base;
> +    if ( dom->parms->virt_base !=3D UNSET_ADDR )
> +        dom->virt_alloc_end =3D dom->parms->virt_base;
>=20
>     /* load kernel */
>     if ( xc_dom_alloc_segment(dom, &dom->kernel_seg, "kernel",
> @@ -1157,7 +1164,7 @@ int xc_dom_build_image(struct xc_dom_image *dom)
>     /* Don't load ramdisk / other modules now if no initial mapping requi=
red. */
>     for ( mod =3D 0; mod < dom->num_modules; mod++ )
>     {
> -        unmapped_initrd =3D (dom->parms.unmapped_initrd &&
> +        unmapped_initrd =3D (dom->parms->unmapped_initrd &&
>                            !dom->modules[mod].seg.vstart);
>=20
>         if ( dom->modules[mod].blob && !unmapped_initrd )
> @@ -1199,10 +1206,10 @@ int xc_dom_build_image(struct xc_dom_image *dom)
>=20
>     /* allocate other pages */
>     if ( !dom->arch_hooks->p2m_base_supported ||
> -         dom->parms.p2m_base >=3D dom->parms.virt_base ||
> -         (dom->parms.p2m_base & (XC_DOM_PAGE_SIZE(dom) - 1)) )
> -        dom->parms.p2m_base =3D UNSET_ADDR;
> -    if ( dom->arch_hooks->alloc_p2m_list && dom->parms.p2m_base =3D=3D U=
NSET_ADDR &&
> +         dom->parms->p2m_base >=3D dom->parms->virt_base ||
> +         (dom->parms->p2m_base & (XC_DOM_PAGE_SIZE(dom) - 1)) )
> +        dom->parms->p2m_base =3D UNSET_ADDR;
> +    if ( dom->arch_hooks->alloc_p2m_list && dom->parms->p2m_base =3D=3D =
UNSET_ADDR &&
>          dom->arch_hooks->alloc_p2m_list(dom) !=3D 0 )
>         goto err;
>     if ( dom->arch_hooks->alloc_magic_pages(dom) !=3D 0 )
> @@ -1228,7 +1235,7 @@ int xc_dom_build_image(struct xc_dom_image *dom)
>=20
>     for ( mod =3D 0; mod < dom->num_modules; mod++ )
>     {
> -        unmapped_initrd =3D (dom->parms.unmapped_initrd &&
> +        unmapped_initrd =3D (dom->parms->unmapped_initrd &&
>                            !dom->modules[mod].seg.vstart);
>=20
>         /* Load ramdisk / other modules if no initial mapping required. *=
/
> @@ -1247,11 +1254,11 @@ int xc_dom_build_image(struct xc_dom_image *dom)
>     }
>=20
>     /* Allocate p2m list if outside of initial kernel mapping. */
> -    if ( dom->arch_hooks->alloc_p2m_list && dom->parms.p2m_base !=3D UNS=
ET_ADDR )
> +    if ( dom->arch_hooks->alloc_p2m_list && dom->parms->p2m_base !=3D UN=
SET_ADDR )
>     {
>         if ( dom->arch_hooks->alloc_p2m_list(dom) !=3D 0 )
>             goto err;
> -        dom->p2m_seg.vstart =3D dom->parms.p2m_base;
> +        dom->p2m_seg.vstart =3D dom->parms->p2m_base;
>     }
>=20
>     return 0;
> @@ -1260,6 +1267,48 @@ int xc_dom_build_image(struct xc_dom_image *dom)
>     return -1;
> }
>=20
> +void *xc_dom_vaddr_to_ptr(struct xc_dom_image *dom,
> +                          xen_vaddr_t vaddr, size_t *safe_region_out)
> +{
> +    unsigned int page_size =3D XC_DOM_PAGE_SIZE(dom);
> +    xen_pfn_t page =3D (vaddr - dom->parms->virt_base) / page_size;
> +    unsigned int offset =3D (vaddr - dom->parms->virt_base) % page_size;
> +    xen_pfn_t safe_region_count;
> +    void *ptr;
> +
> +    *safe_region_out =3D 0;
> +    ptr =3D xc_dom_pfn_to_ptr_retcount(dom, page, 0, &safe_region_count)=
;
> +    if ( ptr =3D=3D NULL )
> +        return ptr;
> +    *safe_region_out =3D (safe_region_count << XC_DOM_PAGE_SHIFT(dom)) -=
 offset;
> +    return ptr + offset;
> +}
> +
> +uint64_t xc_dom_virt_base(struct xc_dom_image *dom)
> +{
> +    return dom->parms->virt_base;
> +}
> +
> +uint64_t xc_dom_virt_entry(struct xc_dom_image *dom)
> +{
> +    return dom->parms->virt_entry;
> +}
> +
> +uint64_t xc_dom_virt_hypercall(struct xc_dom_image *dom)
> +{
> +    return dom->parms->virt_hypercall;
> +}
> +
> +char *xc_dom_guest_os(struct xc_dom_image *dom)
> +{
> +    return dom->parms->guest_os;
> +}
> +
> +bool xc_dom_feature_get(struct xc_dom_image *dom, unsigned int nr)
> +{
> +    return elf_xen_feature_get(nr, dom->parms->f_supported);
> +}
> +
> /*
>  * Local variables:
>  * mode: C
> diff --git a/tools/libs/guest/xg_private.h b/tools/libs/guest/xg_private.=
h
> index 9940d554ef..fee3191cd4 100644
> --- a/tools/libs/guest/xg_private.h
> +++ b/tools/libs/guest/xg_private.h
> @@ -31,6 +31,7 @@
>=20
> #include <xen/memory.h>
> #include <xen/elfnote.h>
> +#include <xen/libelf/libelf.h>
>=20
> #ifndef ELFSIZE
> #include <limits.h>
> diff --git a/tools/libxl/libxl_x86_acpi.c b/tools/libxl/libxl_x86_acpi.c
> index 1a4e9e98de..3eca1c7a9f 100644
> --- a/tools/libxl/libxl_x86_acpi.c
> +++ b/tools/libxl/libxl_x86_acpi.c
> @@ -220,9 +220,8 @@ int libxl__dom_load_acpi(libxl__gc *gc,
>      * and so we need to put RSDP in location that can be discovered by A=
CPI's
>      * standard search method, in R-O BIOS memory (we chose last 64 bytes=
)
>      */
> -    if (strcmp(dom->parms.guest_os, "linux") ||
> -        elf_xen_feature_get(XENFEAT_linux_rsdp_unrestricted,
> -                            dom->parms.f_supported))
> +    if (strcmp(xc_dom_guest_os(dom), "linux") ||
> +        xc_dom_feature_get(dom, XENFEAT_linux_rsdp_unrestricted))
>         dom->acpi_modules[0].guest_addr_out =3D ACPI_INFO_PHYSICAL_ADDRES=
S +
>             (1 + acpi_pages_num) * libxl_ctxt.page_size;
>     else
> --=20
> 2.26.2
>=20
>=20


