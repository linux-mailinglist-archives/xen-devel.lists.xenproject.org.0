Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCF22B3F11
	for <lists+xen-devel@lfdr.de>; Mon, 16 Nov 2020 09:49:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.27739.56320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1keaBJ-0006rU-3X; Mon, 16 Nov 2020 08:48:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 27739.56320; Mon, 16 Nov 2020 08:48:13 +0000
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
	id 1keaBI-0006r5-WE; Mon, 16 Nov 2020 08:48:13 +0000
Received: by outflank-mailman (input) for mailman id 27739;
 Mon, 16 Nov 2020 08:48:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nrw9=EW=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1keaBH-0006r0-BP
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 08:48:11 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.41]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d67c097b-12df-4a98-9292-0fab4f576bb8;
 Mon, 16 Nov 2020 08:48:10 +0000 (UTC)
Received: from AM5PR0601CA0031.eurprd06.prod.outlook.com
 (2603:10a6:203:68::17) by VI1PR08MB5534.eurprd08.prod.outlook.com
 (2603:10a6:803:135::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Mon, 16 Nov
 2020 08:48:08 +0000
Received: from VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:68:cafe::38) by AM5PR0601CA0031.outlook.office365.com
 (2603:10a6:203:68::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25 via Frontend
 Transport; Mon, 16 Nov 2020 08:48:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT012.mail.protection.outlook.com (10.152.18.211) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.22 via Frontend Transport; Mon, 16 Nov 2020 08:48:07 +0000
Received: ("Tessian outbound 814be617737e:v71");
 Mon, 16 Nov 2020 08:48:06 +0000
Received: from fb9e285bbda2.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 46C855DF-D961-4F55-B67A-CEB6F7A4E77D.1; 
 Mon, 16 Nov 2020 08:48:00 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fb9e285bbda2.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 16 Nov 2020 08:48:00 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBAPR08MB5767.eurprd08.prod.outlook.com (2603:10a6:10:1a7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Mon, 16 Nov
 2020 08:47:59 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::39b7:6f9f:d046:e737]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::39b7:6f9f:d046:e737%7]) with mapi id 15.20.3564.028; Mon, 16 Nov 2020
 08:47:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nrw9=EW=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1keaBH-0006r0-BP
	for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 08:48:11 +0000
X-Inumbo-ID: d67c097b-12df-4a98-9292-0fab4f576bb8
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown [40.107.7.41])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d67c097b-12df-4a98-9292-0fab4f576bb8;
	Mon, 16 Nov 2020 08:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Gouvb/TiqibQiepFYvSlq32AB6Bh8msCECOWlSjvHI=;
 b=BavnVzr1MDmQgiuaeCDG/7L/ZA1qmE0XbM4nXN/fk+u3Iar3Z09DBPvRGU0k0CWi0TqQBdUrayL/u9C4B6DTe6rXK/Cv2inKFoje7R0q5wUnAOd9oDmDfw7FNggNcLJnr/oxc0LUxRmHYN0EkmYJRBvqNx4QrbLBpJrUPefMeig=
Received: from AM5PR0601CA0031.eurprd06.prod.outlook.com
 (2603:10a6:203:68::17) by VI1PR08MB5534.eurprd08.prod.outlook.com
 (2603:10a6:803:135::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Mon, 16 Nov
 2020 08:48:08 +0000
Received: from VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:68:cafe::38) by AM5PR0601CA0031.outlook.office365.com
 (2603:10a6:203:68::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25 via Frontend
 Transport; Mon, 16 Nov 2020 08:48:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT012.mail.protection.outlook.com (10.152.18.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.22 via Frontend Transport; Mon, 16 Nov 2020 08:48:07 +0000
Received: ("Tessian outbound 814be617737e:v71"); Mon, 16 Nov 2020 08:48:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a68edf1f17d8bda7
X-CR-MTA-TID: 64aa7808
Received: from fb9e285bbda2.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 46C855DF-D961-4F55-B67A-CEB6F7A4E77D.1;
	Mon, 16 Nov 2020 08:48:00 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fb9e285bbda2.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 16 Nov 2020 08:48:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SZ/CA9ppXitjEy1/5kKP4SKbFsyNIyhQ/ytLhQYDXN97V9jC/UAfPhYNTx821WomqT+n/ECFu9rvxYcu3GKHliL3gdWCsp57WELXdktLdsqLp31RFsEWJesvWEk6pJz8Ja4aJ+mi2T2hU1gWyDld8PdN6+B4SaMni42kQnDwAR2p7h0AI2U3NlIvJeZEOE69+uBhk+rKkdMFOKo5Pax4BbAP1WN57MRkfTvhweqVqVrZb2EwewuQ+TFB0ptvGiw5XFHOZRkkAtdOBxdCcG6rWGwKu/hDCfd5uGNdc/t3XmtQ/zK4U4ROfwt7OlyBoH4SbhNrNWdSGDLdkh6/1zzgcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Gouvb/TiqibQiepFYvSlq32AB6Bh8msCECOWlSjvHI=;
 b=Q8WXFsdwP6FsdhLW+QChgbU4irr0XwUxRrqJhMgRa1cE21E+BWbh99CFC9X+GdiYP/urYWObpBY0dnNCjc5EDA2mNHbZ+vLDyb6fHqckzkEXRwLJMCp4x59YyC3F+gONUtpbtCgVdOfUu3sWVynImxkl21cuOfAHqPxjhoI6gEXrZkr4JzOAVZPwxKLxWAd8m4riYdYBgltJ9h+hSa/Uxj0eo6quYC0B9BKdl+ul4YL74JyH/n38eDu6O5up2SPGgia32RQ5G20DLN0HLVzgQCv9sgNRCsrZIWfPCX7ze7Z5pLqNynG7iG3ksvAyoBtVRu7Q2fLbT66AXC/3D37fAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Gouvb/TiqibQiepFYvSlq32AB6Bh8msCECOWlSjvHI=;
 b=BavnVzr1MDmQgiuaeCDG/7L/ZA1qmE0XbM4nXN/fk+u3Iar3Z09DBPvRGU0k0CWi0TqQBdUrayL/u9C4B6DTe6rXK/Cv2inKFoje7R0q5wUnAOd9oDmDfw7FNggNcLJnr/oxc0LUxRmHYN0EkmYJRBvqNx4QrbLBpJrUPefMeig=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBAPR08MB5767.eurprd08.prod.outlook.com (2603:10a6:10:1a7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Mon, 16 Nov
 2020 08:47:59 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::39b7:6f9f:d046:e737]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::39b7:6f9f:d046:e737%7]) with mapi id 15.20.3564.028; Mon, 16 Nov 2020
 08:47:59 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <Michal.Orzel@arm.com>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Add workaround for Cortex-A76/Neoverse-N1
 erratum #1286807
Thread-Topic: [PATCH] xen/arm: Add workaround for Cortex-A76/Neoverse-N1
 erratum #1286807
Thread-Index: AQHWu+mTw4Xbd+Lh7kKhbnNB05cIaqnKcooA
Date: Mon, 16 Nov 2020 08:47:59 +0000
Message-ID: <2F0882B0-7FBA-477C-88C2-FF0734E85F07@arm.com>
References: <20201116072422.17400-1-michal.orzel@arm.com>
In-Reply-To: <20201116072422.17400-1-michal.orzel@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7ba8db17-7bc6-414d-075c-08d88a0c56e8
x-ms-traffictypediagnostic: DBAPR08MB5767:|VI1PR08MB5534:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB5534751C15B4C671CA6C5A319DE30@VI1PR08MB5534.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 k4iWbMizVEsZ1xXPSUyCqPq308bm5ndjURljQXn9O23rWWwzFVsXDYTzNDxzXIXgzGNe0FFJFo0OWLQxbMs5uO2uls3D/synVb5B5hnCcjdxC/phlDpkcUItEcB3obFKYgarxZgbYiPBvQbFgrv518bcON3G0AUc/H23yE58Xofyj0vcfXSJXH3G7/mDAnzJmg7+3YTpxWyEouRp1aAcSkk+niiVN+yLi0Vu+ME9YemKBK/TS9wIrBfhcZYYSYm4rrYikxUMod+3oOT76jo77UbhVe76AZCPmEJ2qp3zYWEvhEKSCk/vLz4TZoRXNKTvIuD82whSTTRNTPgCiIzSNQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(376002)(366004)(136003)(6506007)(2616005)(37006003)(478600001)(316002)(4326008)(71200400001)(19627235002)(54906003)(6636002)(8936002)(8676002)(6862004)(6486002)(36756003)(83380400001)(33656002)(26005)(6512007)(5660300002)(2906002)(91956017)(66946007)(66446008)(64756008)(66556008)(66476007)(86362001)(76116006)(186003)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 rDvHEP+oxQxA9NkeYx6wNjtCni+mcFPWydRClzerrSpTydnjMgAajqajuFQfMsSFufCxm74sBef4ZgnnrRbss+MCR9zYXV93Cc4y+78NduFwlDcBqExQVfAHIdNQHsLiD5GjAABr3kNwzx2RSHwX7IjS9HrHrL6q5HeQmabTdwScn9lhSvv67dc6YHXNvGg8P0Zaka0FQdo0GmLZFetlgLR8CZN5bCg9k/BKk0IMBd9Vgwv5itq4kXINsXaFBzdWjtNyxNBeVrIT3VWSo2CFb4uHQ5jxkPtj1yqwvKbnVHGwUaKQ8IiSKfdXgT+DXZ2cF35IUfHvtmuFIJXLHCtLutEEQ9QQnAK6ZDOspgq5vVxrabzKu6SWABdczrN8lDI7Hmnz4dh+Gs9Us6obuDQUBnfw5gAnbFABjvbpQnj3LykWQjS78ebQ/x4qAb2DMY1wRqiXMHz9s1pOZa/CZf+mJ2p+sJ8Osu/Jrha1lOdNpsYLyWI4Gud3S5qsvsau4DkI0MUwBJw1I4DDuxcbrr2rudo3F1BPMgVMWBUwzUiLQ4G9MbPDcSCggGxN1rhtKOoHYBP4PbuDabDCAp6MbTkUeRTG+MoMqNmUEPZBQaYjOeGQhXwlRw2nABeckuyC54yrNjhy2ZVWU69im7q0W4zUOw==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C7D5C4C67E14334DA0B8721F793DDF7F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5767
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4ff170ef-bbb2-4680-5826-08d88a0c51f0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	w5g47aYLSZD6bWQyGV9V5521V8dGVAoDNvehJYTKwjzSQ5f1bZd+nQ/NmUvB32YigK0FiXs6q+2airLcDnzZDB4MP7TkLCx0ap3AHFWQiuanw1R26WjZWy5tusTLqeOToJfLM2zd5fuHfM9uGdSoryhE8iKaxsY+vDMBfqGSLRguY3O4Men3uZgGcV93g4vBgbhKysiGLWt0AtOHKlYfjMn7hqn1V8yN79OxHe6U34syCatmASZtHuUQwSpZ47Ydc1u65JxTo1zqEowObawHMuYwbPadjjGGA/VwLfFJfzOEkWCx14bkiFW7vNJ19cn1K2U0eE8cP8OVH/MCT5qeFlVD2DqpAIjiMDHE9zpEUPeulxrLl5/hyjErseClja0eL00GzrrhKwOuXe1c2KK8lQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(39860400002)(136003)(396003)(376002)(46966005)(5660300002)(2906002)(8936002)(8676002)(6506007)(2616005)(19627235002)(6512007)(186003)(26005)(53546011)(336012)(47076004)(33656002)(70206006)(70586007)(356005)(478600001)(4326008)(36756003)(37006003)(6636002)(6862004)(107886003)(54906003)(316002)(83380400001)(81166007)(82740400003)(36906005)(82310400003)(86362001)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2020 08:48:07.3923
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ba8db17-7bc6-414d-075c-08d88a0c56e8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5534

Hi,

> On 16 Nov 2020, at 07:24, Michal Orzel <Michal.Orzel@arm.com> wrote:
>=20
> On the affected Cortex-A76/Neoverse-N1 cores (r0p0 to r3p0),
> if a virtual address for a cacheable mapping of a location is being
> accessed by a core while another core is remapping the virtual
> address to a new physical page using the recommended break-before-make
> sequence, then under very rare circumstances TLBI+DSB completes before
> a read using the translation being invalidated has been observed by
> other observers. The workaround repeats the TLBI+DSB operation.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> docs/misc/arm/silicon-errata.txt     |  2 ++
> xen/arch/arm/Kconfig                 | 18 +++++++++++++++++
> xen/arch/arm/cpuerrata.c             | 14 ++++++++++++++
> xen/include/asm-arm/arm64/flushtlb.h | 29 +++++++++++++++++++---------
> xen/include/asm-arm/cpufeature.h     |  3 ++-
> 5 files changed, 56 insertions(+), 10 deletions(-)
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
> index f938dd21bd..5d6d906d72 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -244,6 +244,24 @@ config ARM_ERRATUM_858921
>=20
> 	  If unsure, say Y.
>=20
> +config ARM64_ERRATUM_1286807
> +	bool "Cortex-A76/Neoverse-N1: 1286807: Modification of the translation =
table for a virtual address might lead to read-after-read ordering violatio=
n"
> +	default y
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
> +	  workaround repeats the TLBI+DSB operation.
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
> index ceec59542e..6726362211 100644
> --- a/xen/include/asm-arm/arm64/flushtlb.h
> +++ b/xen/include/asm-arm/arm64/flushtlb.h
> @@ -9,6 +9,11 @@
>  * DSB ISH          // Ensure the TLB invalidation has completed
>  * ISB              // See explanation below
>  *
> + * ARM64_WORKAROUND_REPEAT_TLBI:
> + * Modification of the translation table for a virtual address might lea=
d to
> + * read-after-read ordering violation.
> + * The workaround repeats TLBI+DSB operation.
> + *
>  * For Xen page-tables the ISB will discard any instructions fetched
>  * from the old mappings.
>  *
> @@ -16,15 +21,21 @@
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
> +#define TLB_HELPER(name, tlbop)       \
> +static inline void name(void)         \
> +{                                     \
> +    asm volatile(                     \
> +        "dsb  ishst;"                 \
> +        "tlbi "  # tlbop  ";"         \
> +        ALTERNATIVE(                  \
> +        "nop; nop;",                  \
> +        "dsb  ish;"                   \
> +        "tlbi "  # tlbop  ";",        \
> +        ARM64_WORKAROUND_REPEAT_TLBI, \
> +        CONFIG_ARM64_ERRATUM_1286807) \
> +        "dsb  ish;"                   \
> +        "isb;"                        \
> +        : : : "memory");              \
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


