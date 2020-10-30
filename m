Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FEF2A0034
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 09:41:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.15462.38482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYPxW-00085z-Ns; Fri, 30 Oct 2020 08:40:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15462.38482; Fri, 30 Oct 2020 08:40:30 +0000
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
	id 1kYPxW-00085Z-KZ; Fri, 30 Oct 2020 08:40:30 +0000
Received: by outflank-mailman (input) for mailman id 15462;
 Fri, 30 Oct 2020 08:40:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CFCO=EF=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kYPxU-00085U-Tw
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 08:40:29 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.52]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 30063103-a2f2-4a20-9ed7-fac822e2202a;
 Fri, 30 Oct 2020 08:40:27 +0000 (UTC)
Received: from MRXP264CA0014.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:15::26)
 by DB7PR08MB4618.eurprd08.prod.outlook.com (2603:10a6:10:78::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Fri, 30 Oct
 2020 08:40:25 +0000
Received: from VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:15:cafe::cc) by MRXP264CA0014.outlook.office365.com
 (2603:10a6:500:15::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend
 Transport; Fri, 30 Oct 2020 08:40:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT036.mail.protection.outlook.com (10.152.19.204) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Fri, 30 Oct 2020 08:40:23 +0000
Received: ("Tessian outbound e6c55a0b9ba9:v64");
 Fri, 30 Oct 2020 08:40:22 +0000
Received: from 84d36ca888bb.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AD963B37-A3EE-4B5A-BC5F-18EE5C75027D.1; 
 Fri, 30 Oct 2020 08:40:16 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 84d36ca888bb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 30 Oct 2020 08:40:16 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0801MB1989.eurprd08.prod.outlook.com (2603:10a6:4:75::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Fri, 30 Oct
 2020 08:40:11 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3499.029; Fri, 30 Oct 2020
 08:40:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=CFCO=EF=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kYPxU-00085U-Tw
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 08:40:29 +0000
X-Inumbo-ID: 30063103-a2f2-4a20-9ed7-fac822e2202a
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown [40.107.20.52])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 30063103-a2f2-4a20-9ed7-fac822e2202a;
	Fri, 30 Oct 2020 08:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CmKpdbIhxEmml/pXgr/joDp7FIh++K/fjT2Nx/u2Oig=;
 b=XeMFQvLU+Rg4DKuuhux3t8LckkInS/95vuD6sBEQRRffGorSrJRTZoMRMjScNO/UNZNYc6S1PH+yNpvlWeebF/uXck8OGM39NlmRgVG/EFOQHeSeLmrQgF8a1RUK9r1ACUcWRSI7L4mieIoniRM6c0yT5NuT3oyZh3mP9wUEA/8=
Received: from MRXP264CA0014.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:15::26)
 by DB7PR08MB4618.eurprd08.prod.outlook.com (2603:10a6:10:78::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Fri, 30 Oct
 2020 08:40:25 +0000
Received: from VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:15:cafe::cc) by MRXP264CA0014.outlook.office365.com
 (2603:10a6:500:15::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend
 Transport; Fri, 30 Oct 2020 08:40:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT036.mail.protection.outlook.com (10.152.19.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Fri, 30 Oct 2020 08:40:23 +0000
Received: ("Tessian outbound e6c55a0b9ba9:v64"); Fri, 30 Oct 2020 08:40:22 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5ac2bc20b691bf81
X-CR-MTA-TID: 64aa7808
Received: from 84d36ca888bb.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id AD963B37-A3EE-4B5A-BC5F-18EE5C75027D.1;
	Fri, 30 Oct 2020 08:40:16 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 84d36ca888bb.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 30 Oct 2020 08:40:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BSSJ+jIYq7m9Sm4bXrVCkYh7gCXOpgA1k7VwCWvUkhoRUBY182Stezyhp2i2TG4DA+wgxXcP1vZre9L1lChoVRoxHHSLsFjaPJt1e3Ccx+BrdFMK6Tg8FMLhyOiQF/T5ci6O7JBjXk37MFmLEgKZ0DpxsleykmygssxiRbhIyYmr3ArJmhAKO2aUaRDnFxWJcZHQUx1miXiF5vKL4jkvswBI6OIwKf6M0ROBNzq4q5n1jjT9JEgIXZOJI7Im4EC1KEl/xjdgctiAKcd9E/oVvAbehPQvRSYkiDhBmfjmEIRO1+efeW/JUZ84PA0LsJoC5MLe4CdUufN6PptHsuy4uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CmKpdbIhxEmml/pXgr/joDp7FIh++K/fjT2Nx/u2Oig=;
 b=N5CTm7sw8T47ZtUcTZvfkghYvrzWwhH5Xz6uPGzle2iuSAbbxfryYinZmSLLB2wB+Nx7d+MuMac7+Rx3oRLlmnrnF+9p22E9BL3GlpkUGBt3TzuPCgJT9f4z81y9DKgNw64YB7WNJkCJXTOgwfpBc+s4GzVlShL3ZYSWdsRLNZcNg0+GOK5uvsn5N0MIdD0UyddCKsAd/RH07maWWdg51ONo9WjyKtgZdJ3fAiJRAcP1IgaPHOnto1Mu5V7Oi2rHh/56QnvphdgsYbU6vSxbknge+q5xFyyUx4h67Nn/qd//ZPGnYXF0G3/eM7IkmACB0u1cwmL9e1EhyneKXbmCuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CmKpdbIhxEmml/pXgr/joDp7FIh++K/fjT2Nx/u2Oig=;
 b=XeMFQvLU+Rg4DKuuhux3t8LckkInS/95vuD6sBEQRRffGorSrJRTZoMRMjScNO/UNZNYc6S1PH+yNpvlWeebF/uXck8OGM39NlmRgVG/EFOQHeSeLmrQgF8a1RUK9r1ACUcWRSI7L4mieIoniRM6c0yT5NuT3oyZh3mP9wUEA/8=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0801MB1989.eurprd08.prod.outlook.com (2603:10a6:4:75::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Fri, 30 Oct
 2020 08:40:11 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3499.029; Fri, 30 Oct 2020
 08:40:11 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, "open list:X86"
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 3/3] xen/arm: Warn user on cpu errata 832075
Thread-Topic: [PATCH v2 3/3] xen/arm: Warn user on cpu errata 832075
Thread-Index: AQHWq7RKM3lRt4XRXUWYGPT9/eCkOKmtW9sAgAD/7gCAAORhAIAAmPsA
Date: Fri, 30 Oct 2020 08:40:11 +0000
Message-ID: <10730DC0-C52B-453D-B5C3-044CE8997825@arm.com>
References:
 <a6fc6cfd71d6d53cf89bf533a348bda799b25d7d.1603728729.git.bertrand.marquis@arm.com>
 <4d62bc0844576b80e00ea48e318be238a4d73eae.1603728729.git.bertrand.marquis@arm.com>
 <c6790d34-2893-78c4-d49f-7ef4acfceb96@xen.org>
 <DFD994CA-C456-468C-8442-0F63CE661E78@arm.com>
 <alpine.DEB.2.21.2010291632130.12247@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2010291632130.12247@sstabellini-ThinkPad-T480s>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: af993d2c-b309-4b1d-bd5b-08d87caf711b
x-ms-traffictypediagnostic: DB6PR0801MB1989:|DB7PR08MB4618:
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB461874B4CBA54BA33AD5981D9D150@DB7PR08MB4618.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3faNI77TWyTbRwxtXdtJjr2C1972BrWP8MY8mLciVDSylfQnK6k5kq5Df3kij5GwFSthbEu9MN2xUoHjRSGuguIrphDoOqvhQvNq265my7IIIcfuWIHcAnj4q2OeyQu21SkLAlkSep5oZv4xAf+efSLYGB/vmEQWfb/Braa7yqtdsNkOnJtU+BK4oW3F0uxuS1UJcxGRtOiqmrUgn1mm44ceN6uIL2GHmk3/TXkv9ASf445AQMv6pP3YdhMov+k1+0HJlXE47iTuqMzC8kJpnqyWd/kY7pqsk6MFVV49wVjdCGEAMsC+MkyeYJxX1mrAuuqbjPjcTBqzLi41Ru/0Zw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(346002)(396003)(376002)(136003)(366004)(316002)(26005)(86362001)(71200400001)(6916009)(36756003)(186003)(6486002)(33656002)(54906003)(5660300002)(4326008)(478600001)(91956017)(6512007)(2616005)(76116006)(8676002)(64756008)(66946007)(53546011)(6506007)(8936002)(66556008)(66476007)(66446008)(2906002)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 HG3eh85OewByATTai2lak5/jHgCEv1lt89kK4R7zqRgRZSIMiXLSn6v7frc9jIfI0glPFCxC5DzUOT/uHGc1xrlBI+s+c9o6/4J8+LcWyv1e/G+eKYwWliKCvhmqVY09vF5HBwxhttc1GNW1jhUU4yFQ56+Lk1V4HToQdl7wOhyrqFx0jhdnxc4Rz5Uupf+I2YcspLcWn4R2QyyzRXfW/uM3tsGcfGwx+IXKwQEDM1IljJX81QoTGGnSLPBjdyC/xtd7RIOQ9FmJ2z84eS1DDP/WbPZ9sMSZslN+dJ5TEJdDg/Q0NnHhnGQ9H2yG9HiJNFNaBSDQpWI1P9MmKWs9NvDMMnIGiEtUvV1X8zTxG+PQlbRbZdiYSEp/l2eNV1oCvRH8Dfg4q/6mMpp02eKdLpiSjZMWJz/NbeRVZ56TqLsIBhfZc/sGXdzu7XhVMZzemOuek27XnDeOX+8SeHu+Unx6j4KYDsdQ6cPIpCR0JDeTBTaUWTtA2H7/5A7K4eyh0vsQFB0AYoSh+04SUQ8KFfVvHxU3NreJQgyYmFmTJ8h7XbZvP9oWaAj1SJ2un7UrdN2GfeD5EcKq/Lg0DlgtlsFOajGv6maGWALATa8cfsPEAmKeSTg5PmqE+CO1qlEHxy/Sy4k8SlQgeboqJtX3hg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <04A1A4CF9F5C1E4081E8BE9DC11F24EB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1989
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bdcfd7ed-e5fb-43a7-f8ac-08d87caf6a0a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yn3JceVKXVsDHbCRAMOrBgnpDgxHva7UZOsYsWnZamt2porgodG0yEIptsoaLABecw1+Ed4PBn5WhwvPnzmLHG7rRgxUCgKj9rB7Uoaycr2VayZx0riYwZSNbhUWq1ksL3QE0y14SlW8/BeBGaz/L70H5/HTgpRmPUr6+AmIm8xZj/zMMKjsnhgivqfOkv7dydbM/7BJCMW9NcQtDCwnB++pIPKuv7m3tGb3lDeyvXaPkENpOBAqRr0H8WZ6Y6ttlomeRYlHiQ1yyXIV0h33bcEypGatPxI1vfdB7ddVTf9pFyIK7PBSh+kbPrrI8vEwDtCbNnLs+ZVkvq0+inD0Jwz7atwGGpWi1mI0lZXUecAF7W1sYcrgQHvjgwVGoWRZdqH1ythlbToKlxCLNFxCAg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39840400004)(136003)(376002)(346002)(46966005)(82310400003)(81166007)(8676002)(54906003)(6486002)(36906005)(47076004)(36756003)(26005)(186003)(4326008)(6512007)(2906002)(33656002)(83380400001)(356005)(5660300002)(316002)(70206006)(6862004)(86362001)(336012)(2616005)(53546011)(478600001)(8936002)(6506007)(107886003)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2020 08:40:23.0640
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af993d2c-b309-4b1d-bd5b-08d87caf711b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB4618



> On 29 Oct 2020, at 23:32, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Thu, 29 Oct 2020, Bertrand Marquis wrote:
>> Hi Julien,
>>=20
>>> On 28 Oct 2020, at 18:39, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> Hi Bertrand,
>>>=20
>>> On 26/10/2020 16:21, Bertrand Marquis wrote:
>>>> When a Cortex A57 processor is affected by CPU errata 832075, a guest
>>>> not implementing the workaround for it could deadlock the system.
>>>> Add a warning during boot informing the user that only trusted guests
>>>> should be executed on the system.
>>>> An equivalent warning is already given to the user by KVM on cores
>>>> affected by this errata.
>>>> Also taint the hypervisor as unsecure when this errata applies and
>>>> mention Cortex A57 r0p0 - r1p2 as not security supported in SUPPORT.md
>>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>>=20
>>> Reviewed-by: Julien Grall <jgrall@amazon.com>
>>=20
>> Thanks
>>=20
>>>=20
>>> If you don't need to resend the series, then I would be happy to fix th=
e typo pointed out by George on commit.
>>=20
>> There is only the condensing from Stefano.
>> If you can handle that on commit to great but if you need me to send a v=
3 to make your life easier do not hesitate to tell me
>=20
> I have just done the committing

Thanks a lot :-)

Cheers
Bertrand


