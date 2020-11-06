Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6018F2A93F9
	for <lists+xen-devel@lfdr.de>; Fri,  6 Nov 2020 11:19:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20593.46613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaypi-0005Uk-4T; Fri, 06 Nov 2020 10:19:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20593.46613; Fri, 06 Nov 2020 10:19:02 +0000
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
	id 1kaypi-0005UO-17; Fri, 06 Nov 2020 10:19:02 +0000
Received: by outflank-mailman (input) for mailman id 20593;
 Fri, 06 Nov 2020 10:19:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a9Kh=EM=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kaypg-0005UG-9x
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 10:19:00 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.4.69]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0db3e3ed-d3fe-4253-937f-02402044e255;
 Fri, 06 Nov 2020 10:18:57 +0000 (UTC)
Received: from AM5PR0201CA0023.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::33) by AM5PR0801MB1922.eurprd08.prod.outlook.com
 (2603:10a6:203:4b::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.22; Fri, 6 Nov
 2020 10:18:54 +0000
Received: from VE1EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::66) by AM5PR0201CA0023.outlook.office365.com
 (2603:10a6:203:3d::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Fri, 6 Nov 2020 10:18:54 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT019.mail.protection.outlook.com (10.152.18.153) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.17 via Frontend Transport; Fri, 6 Nov 2020 10:18:54 +0000
Received: ("Tessian outbound b03b78fa78b0:v64");
 Fri, 06 Nov 2020 10:18:54 +0000
Received: from 3fc5b060e8eb.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 612D9063-7939-4A28-A847-EED1648CC8CB.1; 
 Fri, 06 Nov 2020 10:18:16 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3fc5b060e8eb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 06 Nov 2020 10:18:16 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB8PR08MB5241.eurprd08.prod.outlook.com (2603:10a6:10:e2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 6 Nov
 2020 10:18:15 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::e089:1ed3:63a0:2f28]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::e089:1ed3:63a0:2f28%6]) with mapi id 15.20.3499.032; Fri, 6 Nov 2020
 10:18:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=a9Kh=EM=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1kaypg-0005UG-9x
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 10:19:00 +0000
X-Inumbo-ID: 0db3e3ed-d3fe-4253-937f-02402044e255
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown [40.107.4.69])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 0db3e3ed-d3fe-4253-937f-02402044e255;
	Fri, 06 Nov 2020 10:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4QplAv8KV3OlhzaqYEU5drAx9Np895aQ32gThNMgrlI=;
 b=f3lNSu22jqXLzC7m4kw3LMKkJ2y3cow2L2D7Md6Lq0zfLK5zjobJXKGQyBYN7DcIxVo2HXzaZS7jpuZMLg2fUbdtT7XzXKGJQ3v5dBAtaN9SKrUX2GfayAGiXDfULaj3ZJTqW7j792sP33D1dgsm2YX3YA2WljZEivRFv29j8TE=
Received: from AM5PR0201CA0023.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::33) by AM5PR0801MB1922.eurprd08.prod.outlook.com
 (2603:10a6:203:4b::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.22; Fri, 6 Nov
 2020 10:18:54 +0000
Received: from VE1EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::66) by AM5PR0201CA0023.outlook.office365.com
 (2603:10a6:203:3d::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Fri, 6 Nov 2020 10:18:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT019.mail.protection.outlook.com (10.152.18.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.17 via Frontend Transport; Fri, 6 Nov 2020 10:18:54 +0000
Received: ("Tessian outbound b03b78fa78b0:v64"); Fri, 06 Nov 2020 10:18:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9e476fe4602b0054
X-CR-MTA-TID: 64aa7808
Received: from 3fc5b060e8eb.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 612D9063-7939-4A28-A847-EED1648CC8CB.1;
	Fri, 06 Nov 2020 10:18:16 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3fc5b060e8eb.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 06 Nov 2020 10:18:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fYqDlyHFu9hUA3rLJ3aPDTBa8n1qEcWBx2B2Wt/jeToAmBMY54lzeG5Xotp0ru1cGLd/CiS1keiY9Mt6J33vSo68bUnPm8n4fcNOsJjwuBzZqB4urCn2m8GhRRprpsBTibQnwQgMJMD7btJjF+xpbo4HrYkrU0B9GmIjZOBh7+24um6Q/7YmutfMP7/djy+4Wy7JQtpMrFE6Vq/USnvOHhsa23AAqb3SkEWHqEavcBnBrrZ5iQt+r4cqt0DcXpAV9na2ti3t2s3CsP/QdC/t81Pm1BbfQjhjO9ppOPbKuEbt/T7g9u8El0uaV+Uil+4m5o5dMZHMPJw14DxgBOKY0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4QplAv8KV3OlhzaqYEU5drAx9Np895aQ32gThNMgrlI=;
 b=EfMy0ppIixsu0xzqhlhTLtVmKKG1MKKNBVYBZkNudvOJjyemD0eNf+qehYsECkgWwxBSKrpogb2v6yHMOtNy26CFNnk+TCqHam3uG8BvcjqY+PVcldA6/Ornr1ft961h3k0c4/36ojVOVZuDQrb3XBr59YY42AifyiNDqffN0bF2u8a9c1/vmhyzjFGLkm1QgA6JcXLIV2bhRqSJAvXRRkQPSl2bdeAp4aHbFaStwG84+LhlPh7i+up0upcFNGGazdnvYNXICzv9VsG7B3gw1HcxpDuEbHf7RESNHAHxVFKxrT5r56Oo7pJtDRLJMZOzVmn0477zHaRtf/CB+VoUgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4QplAv8KV3OlhzaqYEU5drAx9Np895aQ32gThNMgrlI=;
 b=f3lNSu22jqXLzC7m4kw3LMKkJ2y3cow2L2D7Md6Lq0zfLK5zjobJXKGQyBYN7DcIxVo2HXzaZS7jpuZMLg2fUbdtT7XzXKGJQ3v5dBAtaN9SKrUX2GfayAGiXDfULaj3ZJTqW7j792sP33D1dgsm2YX3YA2WljZEivRFv29j8TE=
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB8PR08MB5241.eurprd08.prod.outlook.com (2603:10a6:10:e2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 6 Nov
 2020 10:18:15 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::e089:1ed3:63a0:2f28]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::e089:1ed3:63a0:2f28%6]) with mapi id 15.20.3499.032; Fri, 6 Nov 2020
 10:18:15 +0000
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Paul Durrant <paul@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 3/4] xen/pci: Move x86 specific code to x86 directory.
Thread-Topic: [PATCH v2 3/4] xen/pci: Move x86 specific code to x86 directory.
Thread-Index: AQHWsfsnaWR/2G+0X0OcOTmzAzUqaqm61PiAgAATVwA=
Date: Fri, 6 Nov 2020 10:18:15 +0000
Message-ID: <B9DBAE21-C7A2-46A6-AD9F-19C4008A6F1A@arm.com>
References: <cover.1604417224.git.rahul.singh@arm.com>
 <687101e7e0e6feb64dd8ea63c8cf1aacf1684049.1604417224.git.rahul.singh@arm.com>
 <c49bf07f-3d39-b8e8-a3ed-a620aa5de5df@suse.com>
In-Reply-To: <c49bf07f-3d39-b8e8-a3ed-a620aa5de5df@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d0d53633-8a82-4b28-79d5-08d8823d5d6e
x-ms-traffictypediagnostic: DB8PR08MB5241:|AM5PR0801MB1922:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM5PR0801MB1922D0E4EF17590CB2A83287FCED0@AM5PR0801MB1922.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 jYvQiZ6d9ldRyo/09MhRwLgok0gliAgSmRQ6+ckJHdCwbo2koNvb4qfYcaBWnAAqMWnzc10mS2d1s3/GdNsZ5rtm8pnh7sDZKW+AkSiHF4s26idN3PeNaNjFkFMg0osv7z5vTa6DWJfiH6dvY3iIISeT/LmgHL+T9sPEe3MWNZhBYeqGTbG5UVzRnmnfaQk70YUYD1kSkn6cqnBtX3vSgdhKCfPLk0hWcXUDZ39xZaXSNMS5toAypH98HD2/TW91fFNMdvughLotRZgihw9fqzdKdyLzWWmVaXyRCIFkucwnJ+PnoJefe8JMnqHCA3PwjF2ck6OyNv0XdnDyy5PPvGdiUZUqMe1shmeXm/7AoCXXn56afb5de/fIBtUDrSboEW35dBsdSjB1R+NYX03Urw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(39860400002)(346002)(376002)(86362001)(6512007)(54906003)(6916009)(2616005)(478600001)(36756003)(33656002)(6486002)(91956017)(83380400001)(316002)(26005)(186003)(5660300002)(53546011)(6506007)(71200400001)(8936002)(2906002)(66476007)(64756008)(76116006)(66946007)(8676002)(66556008)(66446008)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 wC2s7e5muoH5nhEGAQ/r7B0x7YtrWG3Eciy3niV8Q6NkK4oSaiW05yRAcEQY6wegvQ2zokos0t9vhsutT1HLnmHdrn3CbtFfS9miFDvW4GIYiEIVvN6tr3kNGGiTtDqsaV0xAWAJQ9cTZDc7BV/ZyPajxWtSYpv3E8ZtVY0D03DfT640KTChY1wxnWX2Aj3MzO5OeCgxS3MxyD8/oF+9q6gRadTmC+7Va8WMFutQ8z/iBdf10KvlyAu9BbicdYsb9jK8+q3hTakLK75t5eEWKlE01uYdbTjH3gN0I7kccCHeNWRggUsYYOy514iTloevHQa0na/wfkWaxW+pRZgRL0Ld9lKif6ms52zKpYT0MXWSYYso9cxleCEQcsDag0H5Cf3PcdoJ6fgWDSHor/WCvZAucxX8J36BWG7Q9bjlCx6g5caUJ6OTEAQ8M+isZRTd4AEBrjJoeuSR7b7FdeNAGVoHZbPfIm+fKAKOR3SDGUQfW88aYz1zd7gW24ZXkAvpxOr3UIG/1YWTYDJIJ0sv/8Cjaymk/DyLZyYQmu8KTiO5/0tKYEjr0mkMbzsElJPrkr1AfaAuqxIBxe3NZpo/BOmNATGxFVeyLv9h/11c0vsiaylPwqv9zQnO6WTvaJz8XQUWe9Jhi3JMxg830AArKg==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0A05B1AAB694034DA89A1ABAC24879D2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5241
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6a6c2c8e-ab69-4875-0e93-08d8823d4622
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rf+v/sm6wTHF8zlqplbuh0owhnT57O6BdIYeQey1NeZx5HosJ6C4qzZNtzKsvPeZ4D97LUS4EcsXRQUibMZ6bidJZBp77Hw+zUfDr5tI4+CXFVFY1Gj7oCONBryht3vJHud9LeUEfgaQA3l5T0FkfUWM2sbq4kDu0kJdKknUVQknY2Nf85mQReOGf/LuS1SOjL71b3eJFrpzFAMVjlvFRhLHpVsRhDHWUYwNN7c6D9lEYlRyaNZEHlTXsJsZ+qHULTFSdkyTXqc4/grDCqXSHp4r7M93PfC03G4xVo38QK3xrfACoOvdJr7DK3cvtYYv2NLBIGAaDC7LOxxHHdrgSsk9s24RT8Lkpn+lVu6tsV7xDs/3WN7CSaEWO7NwyzC0Z5j6s2pLPdhKFRFZxx9X0QjjOL0/TR0YNzZMyMVh37FXRdq2Bcb7q+kKPcfJKzr86kBkW16oP1Nf4w2YZaAmZoJNvpdRSI0ybAqrT4W62ow=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(39860400002)(396003)(46966005)(36756003)(2906002)(8676002)(70586007)(6512007)(70206006)(6486002)(86362001)(6862004)(36906005)(4326008)(81166007)(47076004)(82740400003)(186003)(82310400003)(6506007)(54906003)(336012)(356005)(478600001)(53546011)(2616005)(8936002)(26005)(316002)(5660300002)(83380400001)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2020 10:18:54.3984
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0d53633-8a82-4b28-79d5-08d8823d5d6e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1922

Hello Jan,

> On 6 Nov 2020, at 9:09 am, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 03.11.2020 16:59, Rahul Singh wrote:
>> --- a/xen/drivers/passthrough/pci.c
>> +++ b/xen/drivers/passthrough/pci.c
>> @@ -14,7 +14,6 @@
>>  * this program; If not, see <http://www.gnu.org/licenses/>.
>>  */
>>=20
>> -#include <xen/sched.h>

Removed in this patch series 3/4
>> #include <xen/pci.h>
>> #include <xen/pci_regs.h>

I will remove in next version.

>> #include <xen/pci_ids.h>

It is required for PCI_VENDOR_ID_INTEL that is referenced in apply_quirks f=
unction.

>=20
> I think this hunk wants dropping - struct domain continues to be used
> in this file, for example.
>=20
>> @@ -847,71 +845,6 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
>>     return ret;
>> }
>>=20
>> -static int pci_clean_dpci_irq(struct domain *d,
>> -                              struct hvm_pirq_dpci *pirq_dpci, void *ar=
g)
>> -{
>> -    struct dev_intx_gsi_link *digl, *tmp;
>> -
>> -    pirq_guest_unbind(d, dpci_pirq(pirq_dpci));
>> -
>> -    if ( pt_irq_need_timer(pirq_dpci->flags) )
>> -        kill_timer(&pirq_dpci->timer);
>> -
>> -    list_for_each_entry_safe ( digl, tmp, &pirq_dpci->digl_list, list )
>> -    {
>> -        list_del(&digl->list);
>> -        xfree(digl);
>> -    }
>> -
>> -    radix_tree_delete(&d->pirq_tree, dpci_pirq(pirq_dpci)->pirq);
>> -
>> -    if ( !pt_pirq_softirq_active(pirq_dpci) )
>> -        return 0;
>> -
>> -    domain_get_irq_dpci(d)->pending_pirq_dpci =3D pirq_dpci;
>> -
>> -    return -ERESTART;
>> -}
>> -
>> -static int pci_clean_dpci_irqs(struct domain *d)
>> -{
>> -    struct hvm_irq_dpci *hvm_irq_dpci =3D NULL;
>> -
>> -    if ( !is_iommu_enabled(d) )
>> -        return 0;
>> -
>> -    if ( !is_hvm_domain(d) )
>> -        return 0;
>> -
>> -    spin_lock(&d->event_lock);
>> -    hvm_irq_dpci =3D domain_get_irq_dpci(d);
>> -    if ( hvm_irq_dpci !=3D NULL )
>> -    {
>> -        int ret =3D 0;
>> -
>> -        if ( hvm_irq_dpci->pending_pirq_dpci )
>> -        {
>> -            if ( pt_pirq_softirq_active(hvm_irq_dpci->pending_pirq_dpci=
) )
>> -                 ret =3D -ERESTART;
>> -            else
>> -                 hvm_irq_dpci->pending_pirq_dpci =3D NULL;
>> -        }
>> -
>> -        if ( !ret )
>> -            ret =3D pt_pirq_iterate(d, pci_clean_dpci_irq, NULL);
>> -        if ( ret )
>> -        {
>> -            spin_unlock(&d->event_lock);
>> -            return ret;
>> -        }
>> -
>> -        hvm_domain_irq(d)->dpci =3D NULL;
>> -        free_hvm_irq_dpci(hvm_irq_dpci);
>> -    }
>> -    spin_unlock(&d->event_lock);
>> -    return 0;
>> -}
>=20
> If this code gets moved, I think it ought to move into
> xen/drivers/passthrough/io.c, as that's where all the companion code
> sits. (The file as a whole, getting built for x86/HVM only, may want
> moving to xen/drivers/passthrough/x86/ if the underlying model isn't
> suitable for Arm. Then it probably also would want to be named hvm.c,
> to express its limited purpose.)


Ok I will move the code to the file io.c and move that file to x86 director=
y and rename it hvm.c
>=20
> Jan

Regards,
Rahul=

