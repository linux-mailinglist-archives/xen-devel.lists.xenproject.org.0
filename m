Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AADB728327C
	for <lists+xen-devel@lfdr.de>; Mon,  5 Oct 2020 10:49:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2888.8261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPMBE-0002ac-QZ; Mon, 05 Oct 2020 08:49:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2888.8261; Mon, 05 Oct 2020 08:49:12 +0000
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
	id 1kPMBE-0002aD-NL; Mon, 05 Oct 2020 08:49:12 +0000
Received: by outflank-mailman (input) for mailman id 2888;
 Mon, 05 Oct 2020 08:49:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fzGi=DM=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kPMBD-0002a7-66
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 08:49:11 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe09::62a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2edb2870-8f8b-4439-9546-c79c6e181c08;
 Mon, 05 Oct 2020 08:49:08 +0000 (UTC)
Received: from MRXP264CA0013.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:15::25)
 by DB7PR08MB3065.eurprd08.prod.outlook.com (2603:10a6:5:28::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34; Mon, 5 Oct
 2020 08:49:03 +0000
Received: from VE1EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:15:cafe::5e) by MRXP264CA0013.outlook.office365.com
 (2603:10a6:500:15::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34 via Frontend
 Transport; Mon, 5 Oct 2020 08:49:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT014.mail.protection.outlook.com (10.152.19.38) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Mon, 5 Oct 2020 08:49:02 +0000
Received: ("Tessian outbound 7fc8f57bdedc:v64");
 Mon, 05 Oct 2020 08:49:02 +0000
Received: from 314c705e3b39.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2F485FA1-CBC4-4964-B8CE-81028FD7F14A.1; 
 Mon, 05 Oct 2020 08:48:56 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 314c705e3b39.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 05 Oct 2020 08:48:56 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB4711.eurprd08.prod.outlook.com (2603:10a6:10:d6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34; Mon, 5 Oct
 2020 08:48:54 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3433.043; Mon, 5 Oct 2020
 08:48:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=fzGi=DM=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kPMBD-0002a7-66
	for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 08:49:11 +0000
X-Inumbo-ID: 2edb2870-8f8b-4439-9546-c79c6e181c08
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown [2a01:111:f400:fe09::62a])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 2edb2870-8f8b-4439-9546-c79c6e181c08;
	Mon, 05 Oct 2020 08:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l2XxiqR1T2MC0osvlsAIh0OwocGkyWNJII53DDb9xAU=;
 b=HN9aTpfu9NHPTmTwRpm/rzQVa2pktT5HL0eVxDvyOmCMBAEx/qAvFL/5IwzAM5LVpDJCQmV/bHoNwZZgjwRYH3T8G0RKXqBsMmkgQryADu+X4C/4zlPYMfp//v9ZgFGeEB4ONJ9tva6IXfh71vU4XlQZL0bNkdp07OOuwvgykGM=
Received: from MRXP264CA0013.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:15::25)
 by DB7PR08MB3065.eurprd08.prod.outlook.com (2603:10a6:5:28::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34; Mon, 5 Oct
 2020 08:49:03 +0000
Received: from VE1EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:15:cafe::5e) by MRXP264CA0013.outlook.office365.com
 (2603:10a6:500:15::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34 via Frontend
 Transport; Mon, 5 Oct 2020 08:49:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT014.mail.protection.outlook.com (10.152.19.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Mon, 5 Oct 2020 08:49:02 +0000
Received: ("Tessian outbound 7fc8f57bdedc:v64"); Mon, 05 Oct 2020 08:49:02 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8405f5b0a66a5fbe
X-CR-MTA-TID: 64aa7808
Received: from 314c705e3b39.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2F485FA1-CBC4-4964-B8CE-81028FD7F14A.1;
	Mon, 05 Oct 2020 08:48:56 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 314c705e3b39.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 05 Oct 2020 08:48:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jrr9ypSLCgGlwbFitOsArpJN7LMWiHYZZ8UYeeHp/r2az2vNXsmIZoH1D+jEy87G/74brxndBssyJVf9nDLbnmFjX3h7zIAzNsXtVyECTt2BGpTA5WkxRLZob/wI7Afncd4aE72pzUECNYc3hpGPf4rGnA8u84KAv8VivHVREL7qgtwE5qP6+SIVQOmrMsWDhhlQaN66AjBG831crN9YhgBDGaYGAj4YQhkUrDoDl8K411M+19sWNZmtFHdj51oOtygkcU8GJ8pyJ3wFHwKQ6PXinhqctLBJThu6XpOuM2tsyvhcHVOmJTe8eimPjXBsoN/6KYnYqId81h2pKm3SzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l2XxiqR1T2MC0osvlsAIh0OwocGkyWNJII53DDb9xAU=;
 b=oF4DTRBOg8vQ8kU5145OfWOhLwTqgDyZkSxO96RuoAqfkjqhLRaI1VKlk5FZ+LzE81sfyJ/B2/va1W+FopnycDl6CsHGcE6GC/8ihTqWnN5ouNyjCXM8WSbfrRVmh805Hkban7f7ud9p90AGpdgo3lQHMJogKxSOzc+7AE7cm7teXMA+yO6gLC2buYw2eDRQIZ0pXkmdfLXrKWo9Uj6OFhIURrwzYS9OHeTP8SFR3imKXb5rC87khfSpjr6JZtlgD45PUswFAR/TbAgrkcD+kmrgx+wSXFP0ld/M5t/w50+c7VWaI4Mk5EStn7o5+bKXy5vhEY7C7/pzXl1/Uh8ZQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l2XxiqR1T2MC0osvlsAIh0OwocGkyWNJII53DDb9xAU=;
 b=HN9aTpfu9NHPTmTwRpm/rzQVa2pktT5HL0eVxDvyOmCMBAEx/qAvFL/5IwzAM5LVpDJCQmV/bHoNwZZgjwRYH3T8G0RKXqBsMmkgQryADu+X4C/4zlPYMfp//v9ZgFGeEB4ONJ9tva6IXfh71vU4XlQZL0bNkdp07OOuwvgykGM=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB4711.eurprd08.prod.outlook.com (2603:10a6:10:d6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34; Mon, 5 Oct
 2020 08:48:54 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3433.043; Mon, 5 Oct 2020
 08:48:54 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Juergen Gross <jgross@suse.com>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Samuel Thibault <samuel.thibault@ens-lyon.org>, Christian
 Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>
Subject: Re: [PATCH 0/3] tools: avoid creating symbolic links during make
Thread-Topic: [PATCH 0/3] tools: avoid creating symbolic links during make
Thread-Index: AQHWmMeMo4lBJH2wYU2vgc/1Va9MY6mItyWA
Date: Mon, 5 Oct 2020 08:48:54 +0000
Message-ID: <9D05474D-F19D-406A-B5F5-44658F49C924@arm.com>
References: <20201002142214.3438-1-jgross@suse.com>
In-Reply-To: <20201002142214.3438-1-jgross@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b5a4f10e-fee3-4285-a157-08d8690b826c
x-ms-traffictypediagnostic: DBBPR08MB4711:|DB7PR08MB3065:
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB3065B681F03288AA35490C8A9D0C0@DB7PR08MB3065.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:5797;OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ok10P+S/7m06IcvGIzv400lQO0vFdKlYJChKZ5e7vI/Z/1oTj2KsI0Pft5CGRCmYVcBW1RLfJEIxPz3Rutwb4/VfQE+6qFjWHIax6FNh9bNnxCJyy4nRH5yGruiOS8kUEX3mxQfaP8cqyNN4fUgYvdT062xHX1Oy1xtZW7uRqG7ZWp6BGFfS7gLV9erNtACPR9FTRlkwUY6jVNXjes+1pfvAJDOAOjPTtu1FyxDQ58spgNB182Yl06vC4ZsGcaX6rdGjRb+kS6chOZfzp6e/NEwwKfs331aZ7XdmAJRVf7VrSJBDk1jwkHRw1o9TpyhvBEkFgR9BtedFgKp3drrmhA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(396003)(376002)(366004)(346002)(64756008)(66446008)(26005)(2906002)(66556008)(6506007)(66476007)(53546011)(2616005)(33656002)(66946007)(5660300002)(186003)(6916009)(36756003)(7416002)(6486002)(71200400001)(316002)(76116006)(6512007)(8936002)(8676002)(91956017)(478600001)(86362001)(83380400001)(54906003)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 ZH6N7FNb67PLPz7ngQeZ4sJpphF70ce9DtIyTHjE8WXNcvP4X94Lyz2cMBj8bcgRGO2amXP4a39KJM1pmjCHA3W4Opz76eJfeSQxu9LydX9FDXIhO2ey37mFREUC8zj/vbpjnKm+3CxWONajCRK4uWfwyGiccamCQ3yHHq/cl8aiaZ+1P0P4buuLi1XamroDwehGBnU+yVjGEs7jPAAK/aAGGcVYCM4HASslUUMZS7FQetwHzifjjdlJ1WexUr+vEfIVOUM9H1umAO6k7Ki4e4JN+AV9QFgFMxzjVG+uJhmPcvruhT0lOjQNdswPftvQtKNGEfx0VVx/dbp81u1PMqieoynUgZzaDDRFQHc5WYxWNniKF7oCFcnILQBBExq6AWed9bMxYvu7wpgT2xxlj0pQUNRdofw24rGPSGuktoIsiea/SbaCve99B8jQYcWwd+ZmF31nJZU0KXZpee4QKyY/pDAbKLW5uN1vKVn1DmdLxCUOiW4Yj/XacC+OeUK7jItT+N6yOow0H75xmtmNQ7IpMIe6A2q30BFm6gDe+aOPXB++ViIJWz+Lu9toKGOKlglrwx8WLSHi+ce1BZJPxxLKmIZ1wuxZ0TlhgSPQJwNQj/TQIwj+oBBMB4jp3xFArJszRmyTh/eSflV6AXkGDA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C216FC234041044582D5BDD005B95995@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4711
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1163d8b7-b162-483b-daf2-08d8690b7d9a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TShRSjHESBw9JzChCNpgcEoCK7vGxvTolH8PDse0u2mE+CjoP0KvtfXi+JS7xQ7ss+gzbGnJ5AIR/MtK9kgGGFvDu6D3e8xxLJBDmSyYsurooh+qCgO3Ou1deNWiukuxNb1QPQ72M0cbSf7wdo8ZYaLTnZjQ/7eMB2g6uPdQXtyYYXHDuCKehGIGjWsZG+UWfdJhhdRaK1wRYOKsqsv4XgmhDJo//IfslUsdc0usUUroGrLsZ47lKqhKUxoXVlEVXKKExttylZqhRqlh1HE/rB4Ewhm41D91OLJUUTnCDr5RLeRoOxOXrheHWHLSdJZNwbjL4v1VUi+Q/8xETOMcTEPW5ABaL4q32TS+LZZUk5eTnCwqCD6pmUBcQzO6ohrTTrXpNPNHRytJvWaAEVaRvA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(136003)(39860400002)(346002)(376002)(46966005)(82310400003)(478600001)(8676002)(316002)(356005)(36756003)(82740400003)(2616005)(47076004)(36906005)(5660300002)(6486002)(2906002)(107886003)(83380400001)(8936002)(6512007)(186003)(26005)(336012)(70586007)(6862004)(4326008)(70206006)(33656002)(81166007)(86362001)(54906003)(53546011)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2020 08:49:02.5519
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5a4f10e-fee3-4285-a157-08d8690b826c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3065

--
Tested-by: Bertrand Marquis <bertrand.marquis@arm.com>

Work on Yocto Gategarth (including qemu and tools compilation).

Cheers
Bertrand

> On 2 Oct 2020, at 15:22, Juergen Gross <jgross@suse.com> wrote:
>=20
> The rework of the Xen library build introduced creating some additional
> symbolic links during the build process.
>=20
> This series is undoing that by moving all official Xen library headers
> to tools/include and by using include paths and the vpath directive
> when access to some private headers of another directory is needed.
>=20
> Juergen Gross (3):
>  tools/libs: move official headers to common directory
>  tools/libs/guest: don't use symbolic links for xenctrl headers
>  tools/libs/store: don't use symbolic links for external files
>=20
> .gitignore                                    |  5 ++--
> stubdom/mini-os.mk                            |  2 +-
> tools/Rules.mk                                |  5 ++--
> tools/{libs/vchan =3D> }/include/libxenvchan.h  |  0
> tools/{libs/light =3D> }/include/libxl.h        |  0
> tools/{libs/light =3D> }/include/libxl_event.h  |  0
> tools/{libs/light =3D> }/include/libxl_json.h   |  0
> tools/{libs/light =3D> }/include/libxl_utils.h  |  0
> tools/{libs/light =3D> }/include/libxl_uuid.h   |  0
> tools/{libs/util =3D> }/include/libxlutil.h     |  0
> tools/{libs/call =3D> }/include/xencall.h       |  0
> tools/{libs/ctrl =3D> }/include/xenctrl.h       |  0
> .../{libs/ctrl =3D> }/include/xenctrl_compat.h  |  0
> .../devicemodel =3D> }/include/xendevicemodel.h |  0
> tools/{libs/evtchn =3D> }/include/xenevtchn.h   |  0
> .../include/xenforeignmemory.h                |  0
> tools/{libs/gnttab =3D> }/include/xengnttab.h   |  0
> tools/{libs/guest =3D> }/include/xenguest.h     |  0
> tools/{libs/hypfs =3D> }/include/xenhypfs.h     |  0
> tools/{libs/stat =3D> }/include/xenstat.h       |  0
> .../compat =3D> include/xenstore-compat}/xs.h   |  0
> .../xenstore-compat}/xs_lib.h                 |  0
> tools/{libs/store =3D> }/include/xenstore.h     |  0
> tools/{xenstore =3D> include}/xenstore_lib.h    |  0
> .../{libs/toolcore =3D> }/include/xentoolcore.h |  0
> .../include/xentoolcore_internal.h            |  0
> tools/{libs/toollog =3D> }/include/xentoollog.h |  0
> tools/libs/call/Makefile                      |  3 ---
> tools/libs/ctrl/Makefile                      |  3 ---
> tools/libs/devicemodel/Makefile               |  3 ---
> tools/libs/evtchn/Makefile                    |  2 --
> tools/libs/foreignmemory/Makefile             |  3 ---
> tools/libs/gnttab/Makefile                    |  3 ---
> tools/libs/guest/Makefile                     | 12 ++-------
> tools/libs/hypfs/Makefile                     |  3 ---
> tools/libs/libs.mk                            | 10 +++----
> tools/libs/light/Makefile                     | 27 +++++++++----------
> tools/libs/stat/Makefile                      |  2 --
> tools/libs/store/Makefile                     | 15 +++--------
> tools/libs/toolcore/Makefile                  |  9 +++----
> tools/libs/toollog/Makefile                   |  2 --
> tools/libs/util/Makefile                      |  3 ---
> tools/libs/vchan/Makefile                     |  3 ---
> tools/ocaml/libs/xentoollog/Makefile          |  2 +-
> tools/ocaml/libs/xentoollog/genlevels.py      |  2 +-
> 45 files changed, 32 insertions(+), 87 deletions(-)
> rename tools/{libs/vchan =3D> }/include/libxenvchan.h (100%)
> rename tools/{libs/light =3D> }/include/libxl.h (100%)
> rename tools/{libs/light =3D> }/include/libxl_event.h (100%)
> rename tools/{libs/light =3D> }/include/libxl_json.h (100%)
> rename tools/{libs/light =3D> }/include/libxl_utils.h (100%)
> rename tools/{libs/light =3D> }/include/libxl_uuid.h (100%)
> rename tools/{libs/util =3D> }/include/libxlutil.h (100%)
> rename tools/{libs/call =3D> }/include/xencall.h (100%)
> rename tools/{libs/ctrl =3D> }/include/xenctrl.h (100%)
> rename tools/{libs/ctrl =3D> }/include/xenctrl_compat.h (100%)
> rename tools/{libs/devicemodel =3D> }/include/xendevicemodel.h (100%)
> rename tools/{libs/evtchn =3D> }/include/xenevtchn.h (100%)
> rename tools/{libs/foreignmemory =3D> }/include/xenforeignmemory.h (100%)
> rename tools/{libs/gnttab =3D> }/include/xengnttab.h (100%)
> rename tools/{libs/guest =3D> }/include/xenguest.h (100%)
> rename tools/{libs/hypfs =3D> }/include/xenhypfs.h (100%)
> rename tools/{libs/stat =3D> }/include/xenstat.h (100%)
> rename tools/{libs/store/include/compat =3D> include/xenstore-compat}/xs.=
h (100%)
> rename tools/{libs/store/include/compat =3D> include/xenstore-compat}/xs_=
lib.h (100%)
> rename tools/{libs/store =3D> }/include/xenstore.h (100%)
> rename tools/{xenstore =3D> include}/xenstore_lib.h (100%)
> rename tools/{libs/toolcore =3D> }/include/xentoolcore.h (100%)
> rename tools/{libs/toolcore =3D> }/include/xentoolcore_internal.h (100%)
> rename tools/{libs/toollog =3D> }/include/xentoollog.h (100%)
>=20
> --=20
> 2.26.2
>=20
>=20


