Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 672A82B44EF
	for <lists+xen-devel@lfdr.de>; Mon, 16 Nov 2020 14:48:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.27945.56534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1keeqF-0000a6-Mx; Mon, 16 Nov 2020 13:46:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 27945.56534; Mon, 16 Nov 2020 13:46:47 +0000
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
	id 1keeqF-0000Zh-JN; Mon, 16 Nov 2020 13:46:47 +0000
Received: by outflank-mailman (input) for mailman id 27945;
 Mon, 16 Nov 2020 13:46:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nrw9=EW=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1keeqD-0000Zc-TU
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 13:46:46 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.41]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id beade9f6-ea71-4eeb-b1e6-b2b9a2d8a4ac;
 Mon, 16 Nov 2020 13:46:43 +0000 (UTC)
Received: from DB8PR06CA0048.eurprd06.prod.outlook.com (2603:10a6:10:120::22)
 by AM6PR08MB5256.eurprd08.prod.outlook.com (2603:10a6:20b:e7::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Mon, 16 Nov
 2020 13:46:41 +0000
Received: from DB5EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:120:cafe::fb) by DB8PR06CA0048.outlook.office365.com
 (2603:10a6:10:120::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28 via Frontend
 Transport; Mon, 16 Nov 2020 13:46:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT016.mail.protection.outlook.com (10.152.20.141) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.22 via Frontend Transport; Mon, 16 Nov 2020 13:46:41 +0000
Received: ("Tessian outbound 39167997cde8:v71");
 Mon, 16 Nov 2020 13:46:41 +0000
Received: from ee1655f6f992.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 28F89D29-DF87-469B-85D0-27F9659E5AFF.1; 
 Mon, 16 Nov 2020 13:46:33 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ee1655f6f992.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 16 Nov 2020 13:46:33 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB4678.eurprd08.prod.outlook.com (2603:10a6:10:dc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Mon, 16 Nov
 2020 13:46:29 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::39b7:6f9f:d046:e737]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::39b7:6f9f:d046:e737%7]) with mapi id 15.20.3564.028; Mon, 16 Nov 2020
 13:46:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nrw9=EW=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1keeqD-0000Zc-TU
	for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 13:46:46 +0000
X-Inumbo-ID: beade9f6-ea71-4eeb-b1e6-b2b9a2d8a4ac
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown [40.107.22.41])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id beade9f6-ea71-4eeb-b1e6-b2b9a2d8a4ac;
	Mon, 16 Nov 2020 13:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qAUC3bKQ8Do7oF1w8gRlc3YuQWW/wFuhcoOCQqtIVB0=;
 b=DxrZ23ggWTpxizT3CO9ppHf5+hzeq8n5wvdHsDWFNiTJQn5IxV9eyOy5TQV95gQqYm8UEAH/4aTKU+eBB8PvvSof3NUdE17jywNT3YS50onE3Smr81if2cPXfrWvfao0pa0EAVhoao0Fouv8VpV9JbXq4oUyAwYprDwRY4cNLhI=
Received: from DB8PR06CA0048.eurprd06.prod.outlook.com (2603:10a6:10:120::22)
 by AM6PR08MB5256.eurprd08.prod.outlook.com (2603:10a6:20b:e7::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Mon, 16 Nov
 2020 13:46:41 +0000
Received: from DB5EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:120:cafe::fb) by DB8PR06CA0048.outlook.office365.com
 (2603:10a6:10:120::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28 via Frontend
 Transport; Mon, 16 Nov 2020 13:46:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT016.mail.protection.outlook.com (10.152.20.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.22 via Frontend Transport; Mon, 16 Nov 2020 13:46:41 +0000
Received: ("Tessian outbound 39167997cde8:v71"); Mon, 16 Nov 2020 13:46:41 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d8206f6e5aad9bea
X-CR-MTA-TID: 64aa7808
Received: from ee1655f6f992.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 28F89D29-DF87-469B-85D0-27F9659E5AFF.1;
	Mon, 16 Nov 2020 13:46:33 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ee1655f6f992.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 16 Nov 2020 13:46:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Quh+ivx6wL1cspWDWN7QQK8IYNlAPABweJCC2nIUvxCBKWfFK+qHPa446En2ti565t2S4D+j2JTPIdwo5BRtuYTq6ah7yb+2CL7aoVubgbzjQ0v/rIdINl/j5sSoYsH0OK52At9a66N+afeJjRpZT+deylfIOiLHpNTPGCEcoraTBJF8zsxigWY8GqGURuSodfd3oxLSMAChhJT3BJw8TOytTVzoeOxdtYXPXWX9UlJygC2rVHj+cwPn2h1Gb+kLNkzL0Md4C67k9OJ3ik163CQ8rDd1Ro66k8BHLSWdHqhT2TmnijelaokMevZmwr3ggCpNHHy+d/RheaNc2fiq0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qAUC3bKQ8Do7oF1w8gRlc3YuQWW/wFuhcoOCQqtIVB0=;
 b=iFT54bawrOX8xw3sGNHgUEw9UkPz/aIPfVOUGeNeAxX+1ZOcFJmqK6C2PJ1XBbYod5jyWlTUgrfeAzqTFf8oSiWNmrRoKMnfNE9F1BP9EiYFi9SxlcqAqEk+nzaFgybK70iw8TeCe0OiSzNWfOzJ5pP4pz5AWPdWf832v0kvCE2/o2zCP1DTwS7dviyT6/c22ywiLqLQKl0t5UdnYAq3iQvJ/suCHufEeDYCiPiIT5NTT7m7NnvCzywQdB3uLjvYa2+Y5DGiz2Q1FIry/gPe3F4B4XeAY4o9pZ1w1rHN/FdSiGRbOshh2EIwGGhOZ7B2Rj0zgQb+v9MWzMEmBbuTsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qAUC3bKQ8Do7oF1w8gRlc3YuQWW/wFuhcoOCQqtIVB0=;
 b=DxrZ23ggWTpxizT3CO9ppHf5+hzeq8n5wvdHsDWFNiTJQn5IxV9eyOy5TQV95gQqYm8UEAH/4aTKU+eBB8PvvSof3NUdE17jywNT3YS50onE3Smr81if2cPXfrWvfao0pa0EAVhoao0Fouv8VpV9JbXq4oUyAwYprDwRY4cNLhI=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB4678.eurprd08.prod.outlook.com (2603:10a6:10:dc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Mon, 16 Nov
 2020 13:46:29 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::39b7:6f9f:d046:e737]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::39b7:6f9f:d046:e737%7]) with mapi id 15.20.3564.028; Mon, 16 Nov 2020
 13:46:29 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <Michal.Orzel@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2] xen/arm: Add workaround for Cortex-A76/Neoverse-N1
 erratum #1286807
Thread-Topic: [PATCH v2] xen/arm: Add workaround for Cortex-A76/Neoverse-N1
 erratum #1286807
Thread-Index: AQHWvBHCDA6RH0TW50yqO37dVM6f26nKxaGA
Date: Mon, 16 Nov 2020 13:46:29 +0000
Message-ID: <6F0BAEC1-E48C-4266-A967-2B7492F6C682@arm.com>
References: <20201116121140.26763-1-michal.orzel@arm.com>
In-Reply-To: <20201116121140.26763-1-michal.orzel@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.9.225.195]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 86fa029b-8b8a-4a55-74cb-08d88a360c6f
x-ms-traffictypediagnostic: DBBPR08MB4678:|AM6PR08MB5256:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB52560A93F74A073434C53EC49DE30@AM6PR08MB5256.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 l68d7Z4avy9GYpgMhD3h3wfEAejkzuVsuIsCJijf0h+gfsFP0ir0r7whbafJRBXaw6bH+kfWPlpjmDq/k82cbfIh3FPzL3kJfg444pA15CEipwS/NQMaltUURtBdrWmQXLt3kyOfB0rki9gz+D0OFZosvAg3iyFwbxo+eSZbwZ8bOvX13QTn6OV1bWWNWtY15S2b03JA4B2z5A3uPIPV+HG3vYsA74M5xph9G6flXxCbxEAay7VCBiG2nubnSnu05TP0GbBdRk4R+ikNF+EpoNPA/2AgPED6OiukyhWVMDL0PCPtnU1JnT/a4p1VPPS57dm6GvvB0W8Q4xLwn+dquQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(366004)(39860400002)(376002)(136003)(5660300002)(6862004)(2616005)(8676002)(4326008)(6636002)(53546011)(6506007)(86362001)(8936002)(186003)(26005)(316002)(76116006)(91956017)(19627235002)(66476007)(66946007)(6512007)(33656002)(6486002)(83380400001)(71200400001)(2906002)(36756003)(54906003)(66556008)(478600001)(37006003)(64756008)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 m46/oon/5mnGChTBT2ROMoOznG0E3rQAPW0NdlA7001oyhCBWsL9yiSus1WsgRK1Mbs0F6vrXRprFWSAQMyet8J3AlO4A5kwQjCoPRVn6L6q+iHF94QjtAGR40/VcwBmlNPmCPLoc0pIxY9WdQgAzb4Qr1pte+2fNiAQuStX6UO0JuhGvXvPc2MCyB8d60HTBKjaTpzZ9Qbsn93ueMLR5SVP6NoJ/zzNQ4eym91MWubUf9JYLVCOWjnb74Le1U4X27CKEQuDukkuJqzX/rhLY+lSuslcF5H8RhSX0omOGyZz+yQNDMwXbqHiZYzvXKGlBzqHd9NrzMo6XypoHCk3ah4LQI8M2ysOLcnvn08uVMbFGtZptbTUZ0oRIUAIddXhNqlo8ujWCZSdO6GsIygzigBrVvdyY5/R4KhdPxtEUmLGpDI1WIeccd3rwyNUDUYwmAOt8isEMa/Xrnx35DDEkL8zMYxBbSzd+z1Kg5rnLJfJmjHxqVl4PdfZ50k3Wg/ASRnB1njYbg9Yd0P5ErL396suaC+PD1UxiEoH5o2J9XaKyKoO1C7wV1DX2saqdu96bknyjAHmGE33XhcjCLv5i32TB3ZZPTsEi1O+dw9Iqk2MbCYAR0HOPiLBDjJm4grvur4jD9rPfo6FmLIE4LiBLg==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F8B36F934DFD734BABACB04BBBE948A6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4678
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ea2a82db-3193-433d-6089-08d88a360588
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	k4Lj+lZEH+18liDM1/t/v+vkDnTBNJpLFUsG62qgVR0dkvNxHuQfDwcFO4P1CQyYdek6iNj7cQzWMWXb2/bYVWPw2T+2HOKj0kEjZlbVJ3aukWHbXwhvxJcV7dwiqo1RW8LaTQ47e85Kz55KISydhWLT9Y33ybNk6hAiu3j1Q9skP5anud3cbLqP91EhBUYcKCMvw5AOk1fttmc5qmW6Re+lYn3/rf+tbmdYxgWzOTeY9Q99TEDxJFrRK/1tpxsjYC1C9pmmFYEMXiguddX96YwXDgIqd/7+yPZuMtlTrtowigQalgh5wY/lfuYwuEnPIXRFbfQxqcw8oc/z8xkAKhUCalMeF18ypuHTWfl/ThQeRh86Au05XY9rJjwCj1JSvYrUxAryXymNI+HPSouq8w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(376002)(396003)(346002)(46966005)(5660300002)(19627235002)(26005)(186003)(2616005)(107886003)(86362001)(6862004)(4326008)(70586007)(70206006)(6506007)(2906002)(53546011)(336012)(36756003)(33656002)(6636002)(6512007)(6486002)(8676002)(54906003)(316002)(37006003)(478600001)(8936002)(83380400001)(356005)(81166007)(82310400003)(82740400003)(47076004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2020 13:46:41.4353
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86fa029b-8b8a-4a55-74cb-08d88a360c6f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5256

Hi,

> On 16 Nov 2020, at 12:11, Michal Orzel <Michal.Orzel@arm.com> wrote:
>=20
> On the affected Cortex-A76/Neoverse-N1 cores (r0p0 to r3p0),
> if a virtual address for a cacheable mapping of a location is being
> accessed by a core while another core is remapping the virtual
> address to a new physical page using the recommended break-before-make
> sequence, then under very rare circumstances TLBI+DSB completes before
> a read using the translation being invalidated has been observed by
> other observers. The workaround repeats the TLBI+DSB operation
> for all the TLB flush operations on purpose.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> docs/misc/arm/silicon-errata.txt     |  2 ++
> xen/arch/arm/Kconfig                 | 23 +++++++++++++++++++++
> xen/arch/arm/cpuerrata.c             | 14 +++++++++++++
> xen/include/asm-arm/arm64/flushtlb.h | 30 +++++++++++++++++++---------
> xen/include/asm-arm/cpufeature.h     |  3 ++-
> 5 files changed, 62 insertions(+), 10 deletions(-)
>=20
> diff --git a/docs/misc/arm/silicon-errata.txt b/docs/misc/arm/silicon-err=
ata.txt
> index 552c4151d3..d183ba543f 100644
> --- a/docs/misc/arm/silicon-errata.txt
> +++ b/docs/misc/arm/silicon-errata.txt
> @@ -53,5 +53,7 @@ stable hypervisors.
> | ARM            | Cortex-A72      | #853709         | N/A               =
      |
> | ARM            | Cortex-A73      | #858921         | ARM_ERRATUM_858921=
      |
> | ARM            | Cortex-A76      | #1165522        | N/A               =
      |
> +| ARM            | Cortex-A76      | #1286807        | ARM64_ERRATUM_128=
6807   |
> | ARM            | Neoverse-N1     | #1165522        | N/A
> +| ARM            | Neoverse-N1     | #1286807        | ARM64_ERRATUM_128=
6807   |
> | ARM            | MMU-500         | #842869         | N/A               =
      |
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index f938dd21bd..8171b8d04a 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -244,6 +244,29 @@ config ARM_ERRATUM_858921
>=20
> 	  If unsure, say Y.
>=20
> +config ARM64_WORKAROUND_REPEAT_TLBI
> +	bool
> +
> +config ARM64_ERRATUM_1286807
> +	bool "Cortex-A76/Neoverse-N1: 1286807: Modification of the translation =
table for a virtual address might lead to read-after-read ordering violatio=
n"
> +	default y
> +	select ARM64_WORKAROUND_REPEAT_TLBI
> +	depends on ARM_64
> +	help
> +	  This option adds a workaround for ARM Cortex-A76/Neoverse-N1 erratum =
1286807.
> +
> +	  On the affected Cortex-A76/Neoverse-N1 cores (r0p0 to r3p0), if a vir=
tual
> +	  address for a cacheable mapping of a location is being
> +	  accessed by a core while another core is remapping the virtual
> +	  address to a new physical page using the recommended
> +	  break-before-make sequence, then under very rare circumstances
> +	  TLBI+DSB completes before a read using the translation being
> +	  invalidated has been observed by other observers. The
> +	  workaround repeats the TLBI+DSB operation for all the TLB flush
> +	  operations on purpose.
> +
> +	  If unsure, say Y.
> +
> endmenu
>=20
> config ARM64_HARDEN_BRANCH_PREDICTOR
> diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
> index 567911d380..cb4795beec 100644
> --- a/xen/arch/arm/cpuerrata.c
> +++ b/xen/arch/arm/cpuerrata.c
> @@ -424,6 +424,20 @@ static const struct arm_cpu_capabilities arm_errata[=
] =3D {
>                    (1 << MIDR_VARIANT_SHIFT) | 2),
>     },
> #endif
> +#ifdef CONFIG_ARM64_ERRATUM_1286807
> +    {
> +        /* Cortex-A76 r0p0 - r3p0 */
> +        .desc =3D "ARM erratum 1286807",
> +        .capability =3D ARM64_WORKAROUND_REPEAT_TLBI,
> +        MIDR_RANGE(MIDR_CORTEX_A76, 0, 3 << MIDR_VARIANT_SHIFT),
> +    },
> +    {
> +        /* Neoverse-N1 r0p0 - r3p0 */
> +        .desc =3D "ARM erratum 1286807",
> +        .capability =3D ARM64_WORKAROUND_REPEAT_TLBI,
> +        MIDR_RANGE(MIDR_NEOVERSE_N1, 0, 3 << MIDR_VARIANT_SHIFT),
> +    },
> +#endif
> #ifdef CONFIG_ARM64_HARDEN_BRANCH_PREDICTOR
>     {
>         .capability =3D ARM_HARDEN_BRANCH_PREDICTOR,
> diff --git a/xen/include/asm-arm/arm64/flushtlb.h b/xen/include/asm-arm/a=
rm64/flushtlb.h
> index ceec59542e..8f2abfaf1d 100644
> --- a/xen/include/asm-arm/arm64/flushtlb.h
> +++ b/xen/include/asm-arm/arm64/flushtlb.h
> @@ -9,6 +9,12 @@
>  * DSB ISH          // Ensure the TLB invalidation has completed
>  * ISB              // See explanation below
>  *
> + * ARM64_WORKAROUND_REPEAT_TLBI:
> + * Modification of the translation table for a virtual address might lea=
d to
> + * read-after-read ordering violation.
> + * The workaround repeats TLBI+DSB operation for all the TLB flush opera=
tions
> + * on purpose.
> + *
>  * For Xen page-tables the ISB will discard any instructions fetched
>  * from the old mappings.
>  *
> @@ -16,15 +22,21 @@
>  * (and therefore the TLB invalidation) before continuing. So we know
>  * the TLBs cannot contain an entry for a mapping we may have removed.
>  */
> -#define TLB_HELPER(name, tlbop) \
> -static inline void name(void)   \
> -{                               \
> -    asm volatile(               \
> -        "dsb  ishst;"           \
> -        "tlbi "  # tlbop  ";"   \
> -        "dsb  ish;"             \
> -        "isb;"                  \
> -        : : : "memory");        \
> +#define TLB_HELPER(name, tlbop)                  \
> +static inline void name(void)                    \
> +{                                                \
> +    asm volatile(                                \
> +        "dsb  ishst;"                            \
> +        "tlbi "  # tlbop  ";"                    \
> +        ALTERNATIVE(                             \
> +            "nop; nop;",                         \
> +            "dsb  ish;"                          \
> +            "tlbi "  # tlbop  ";",               \
> +            ARM64_WORKAROUND_REPEAT_TLBI,        \
> +            CONFIG_ARM64_WORKAROUND_REPEAT_TLBI) \
> +        "dsb  ish;"                              \
> +        "isb;"                                   \
> +        : : : "memory");                         \
> }
>=20
> /* Flush local TLBs, current VMID only. */
> diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufe=
ature.h
> index 016a9fe203..c7b5052992 100644
> --- a/xen/include/asm-arm/cpufeature.h
> +++ b/xen/include/asm-arm/cpufeature.h
> @@ -46,8 +46,9 @@
> #define ARM_SMCCC_1_1 8
> #define ARM64_WORKAROUND_AT_SPECULATE 9
> #define ARM_WORKAROUND_858921 10
> +#define ARM64_WORKAROUND_REPEAT_TLBI 11
>=20
> -#define ARM_NCAPS           11
> +#define ARM_NCAPS           12
>=20
> #ifndef __ASSEMBLY__
>=20
> --=20
> 2.28.0
>=20


