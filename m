Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B00FD266053
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 15:33:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGjAy-0004FG-5l; Fri, 11 Sep 2020 13:33:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G+bd=CU=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kGjAx-0004FA-9B
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 13:33:15 +0000
X-Inumbo-ID: e88b3419-7b3d-4891-bb17-f3b9adb8112b
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (unknown
 [40.107.9.81]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e88b3419-7b3d-4891-bb17-f3b9adb8112b;
 Fri, 11 Sep 2020 13:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FpR8XB9u8V09c7q7FW5ogsRRUVCo04Kwfmbl7u327Zo=;
 b=Akq521OxCBsGy5KsCnPP++OLBOAIRUotc53JbGR1T6/vg1eTgI3ghO+t58zIoQPSEqr2IxlxdMJkvmDHC1ph002q4e6odh9QrPh0J0e0sQ87MNS/p/Vx9Qa5W3N4d2es9kCowjNX2NtZZyaJWZneT5irUcsWqWZCUBLxBHC5xb8=
Received: from MR2P264CA0091.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:32::31)
 by PR2PR08MB4921.eurprd08.prod.outlook.com (2603:10a6:101:22::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Fri, 11 Sep
 2020 13:33:12 +0000
Received: from VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:32:cafe::70) by MR2P264CA0091.outlook.office365.com
 (2603:10a6:500:32::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend
 Transport; Fri, 11 Sep 2020 13:33:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT053.mail.protection.outlook.com (10.152.19.198) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.16 via Frontend Transport; Fri, 11 Sep 2020 13:33:11 +0000
Received: ("Tessian outbound 34b830c8a0ef:v64");
 Fri, 11 Sep 2020 13:33:11 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3b91e458c522e92a
X-CR-MTA-TID: 64aa7808
Received: from 0406d7a730a6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5738E237-0606-4B00-8426-0EDC443B0433.1; 
 Fri, 11 Sep 2020 13:32:33 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0406d7a730a6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 11 Sep 2020 13:32:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QjYviKnUgm5n64duQZJi2k35yfQYmFuMeA+if3G7uotAc571ZzI5oiWpJTujjv1XVGco32ftIHZi0HFzjnjnJzbrC1nfGbqjqLEobnxThQJwRSnQHNZQ+Rr8YEDpcRBt2yiZGD+HpZu1dZVq4X8jQp32akMncAPQjyNWxmFYNZrwtlS5GG8awtDdbq5PDAwF+ZkypsXGzsqFFEcZ/eNb6uEbMaayCAL2WuLslPLyCV86XSN4zxRpwe5klIz5Hk/MoLSNfxseGSYVAk4hwXu9mVCRpiOOe+RniWM7aVw7r5pEw0XOrCIo077WDtdT38DWdllVspfPCcwyuMV+t5XSfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FpR8XB9u8V09c7q7FW5ogsRRUVCo04Kwfmbl7u327Zo=;
 b=i13/8ayBgoPx2l2TXa8EsFgNlRTC1FfW88b1zGoe7pwCWnL1xNyFYGSbEPucFOn1shgGInDH/sIA/nkc6SNYiycP+cyPLfxA/TXlqhsItRjbR1g75VbyFhc3czFBJ7uOTI4hIuz//d34QRvUSv82bmQzHJCbsbB5GZaoW3aK3h8OsfanCtwQuMOPz95AVACvX5v2bH27RLwQenRddrPYfDgXDju1P4XhCu65AtDxTKqiJK9pM5EQXIvVyn3fI3nR4G8ov/AhzlBP6AG91q8jmRWSO1TNwc2ux9iEq67XQi5za6lVMF5mRugrZFS27tfezlz3A3nuDQ23YvuhOvnAaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FpR8XB9u8V09c7q7FW5ogsRRUVCo04Kwfmbl7u327Zo=;
 b=Akq521OxCBsGy5KsCnPP++OLBOAIRUotc53JbGR1T6/vg1eTgI3ghO+t58zIoQPSEqr2IxlxdMJkvmDHC1ph002q4e6odh9QrPh0J0e0sQ87MNS/p/Vx9Qa5W3N4d2es9kCowjNX2NtZZyaJWZneT5irUcsWqWZCUBLxBHC5xb8=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3850.eurprd08.prod.outlook.com (2603:10a6:10:7b::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Fri, 11 Sep
 2020 13:32:31 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3370.016; Fri, 11 Sep 2020
 13:32:31 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, George
 Dunlap <george.dunlap@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Ian Jackson <ian.jackson@citrix.com>, Wei Liu
 <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>, Julien Grall
 <julien@xen.org>
Subject: Re: preparations for 4.13.2 and 4.12.4
Thread-Topic: preparations for 4.13.2 and 4.12.4
Thread-Index: AQHWiD10WcdFT9qIdEquGSa2/T2AM6ljb4MA
Date: Fri, 11 Sep 2020 13:32:31 +0000
Message-ID: <A526A238-AEE2-4A8D-960C-AA15E75786C0@arm.com>
References: <427c2293-366d-2ab3-cfbb-b41db35bd8b6@suse.com>
In-Reply-To: <427c2293-366d-2ab3-cfbb-b41db35bd8b6@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 842ed77e-ac0d-40b6-977a-08d856573a7f
x-ms-traffictypediagnostic: DB7PR08MB3850:|PR2PR08MB4921:
X-Microsoft-Antispam-PRVS: <PR2PR08MB4921F764678F4A9D0544AE739D240@PR2PR08MB4921.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: pS2qtsPyVFksq/WKYuekklCO64J8gT6SvIcq9EHtQIb4lH8HVlUEy6Id0HXXnu8ju7tX9k31ktnSkjb3Iares37AZfiDcn5+AtEAmX9X/x7pcbeHM4N74cbi/VWj0Kl9v0fG7Xsoc5+PW330jlJaqpyd/aDv8p2HWwkw7ArLpbM9Adl9Sc75aEz3gwXLbWrUrLxJdjc5DRVfB0UBKCCCGr5FlnawFsBdbVdA+7cE0g/1rlcsgL+0AD6TQNFHCXU22jq1LAsBEe77BrUrV0wRhcrqI+AGYhmhRPucDF5DckO4jCFO8FjnsLWMeZT3M+J4iFlKyQGE9Z67a2yk6/ImYA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(39860400002)(376002)(346002)(53546011)(6916009)(26005)(186003)(2906002)(36756003)(6512007)(6506007)(478600001)(86362001)(4326008)(54906003)(6486002)(8676002)(76116006)(91956017)(83380400001)(66946007)(66446008)(33656002)(64756008)(66476007)(8936002)(71200400001)(66556008)(2616005)(5660300002)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: m4oxP07Ij2/VgNLWZ4bcvwxNZCLi3oZyChbgYaZW2tLr2Z8YqAItrmJS+zh2WTWEO31YJ3/jn89wMo/pjxGr6vsfMIC1JPDsc9rNiaVhZKqSnOqGZ+Yfo8MRzBaF1tsoDxytwnfwxlhYsTImE6peTxDkNBBrSzMim6eMyIULsSpmoUTq1Xn8bEFzlv3oN0jlyAXw2wsVMLblmakimOYw1wNFVACveF8VhRlnNzRVgRGjuk9jcPszFvCqjLDoeq99QqHo7KtTSpSRImtVlu2YdJFewmy5ploV/iiblkyZxPrc+3OW4Uub0zeaHaCVEwnRvf8RsvKonShohoqEWt5y8IoQRrkms9PrywQxS0WNdMEM+vEmt+1tqyOAqwthn7XnyK4lN1rIVgZzMBVEm+PIRVIEv4Wwbit4LmMEdTB+xmvwTD+xeUMyX4EygOd1bv0o7L2N2Wkqtn9H59dI1LcUQV0x03eKKX6tSzMG1+dsjKnErwAiWYjhWy3T88YkBt5gk74t2OdxVM9MM38EtYgsWdE+8RLQ1XLObuisfzJCAmtkzaOT9J+1CvYEnzpg/Pcj8Fdo3C9XgeAvI8pI/07/p9Xw58DX5luloaRVOdOgV50ewxThCii4DYwShUVbdRuOFQirl7eBq2N3vTRsoiQX0g==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DDDD80E38B7E9C48AD20A139D23F5793@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3850
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5793132f-f3e1-4e74-d13c-08d856572284
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G1bpmczSfokcakUh4JULeQlkVdAW4yRD3TeGaVbDXvVRqaHpXeSqAvIGZ6z7f8oVQIg9zq9nrzqqLc6R5b0wAQ3Eoo2PH4V/YZhb6RS4iPTPyWqQ8/7qOt80qf5dYS1pdKsmVFSti9J8H/Po/aqK0OpVDAlOq/7dfO+OWhFbKKhW3H9GZ7CkGxo2k0n0hfPgNZinzxx9tSHWhJW7JteEbajNJOT3Tb9TXJrRCnrdZPiyE4azykChz9vBlUdBAjjeqFHUxEcpaYEY7O/fBgEZ+MLuPq5oXb2C7W/5pqjl0MEbhU2J+dWv6NUHJ8Wgpwy2ig8cvOk16FbJMkwGnxDM8qRBZHB/l0vnEVmPD+VVwLD7K2cZWsU/iKGd281iLOI4M/MsHX2/EN7kMXtdQC6YgQ==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(136003)(346002)(396003)(39860400002)(376002)(46966005)(6506007)(478600001)(8936002)(70206006)(70586007)(6486002)(336012)(8676002)(186003)(26005)(5660300002)(36756003)(6512007)(2906002)(53546011)(86362001)(47076004)(36906005)(4326008)(2616005)(6862004)(33656002)(82740400003)(316002)(83380400001)(54906003)(82310400003)(81166007)(356005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2020 13:33:11.5379 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 842ed77e-ac0d-40b6-977a-08d856573a7f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4921
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



> On 11 Sep 2020, at 14:11, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> All,
>=20
> the releases are about due, but will of course want to wait for the
> XSA fixes going public on the 22nd. Please point out backports
> you find missing from the respective staging branches, but which
> you consider relevant. (Ian, Julien, Stefano: I notice there once
> again haven't been any tools or Arm side backports at all so far
> since the most recent stable releases from these branches. But
> maybe there simply aren't any.)
>=20
> One that I have queued already, but which first need to at least
> pass the push gate to master, are
>=20
> 8efa46516c5f hvmloader: indicate ACPI tables with "ACPI data" type in e82=
0
> e5a1b6f0d207 x86/mm: do not mark IO regions as Xen heap
> b4e41b1750d5 b4e41b1750d5 [4.14 only]
>=20
> On the Arm side I'd also like to ask for
>=20
> 5d45ecabe3c0 xen/arm64: force gcc 10+ to always inline generic atomics he=
lpers
+1

Could those fixes also be considered:
3b418b3326 arm: Add Neoverse N1 processor identification
858c0be8c2 xen/arm: Enable CPU Erratum 1165522 for Neoverse
1814a626fb xen/arm: Update silicon-errata.txt with the Neovers AT erratum
968bb86d04 xen/arm: Missing N1/A76/A75 FP registers in vCPU context switch
f4c1a541fa xen/arm: Throw messages for unknown FP/SIMD implement ID

Those are erratas and bug fixes.

Bertrand


