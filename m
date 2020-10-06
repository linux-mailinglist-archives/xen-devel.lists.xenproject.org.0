Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 996CE284F3A
	for <lists+xen-devel@lfdr.de>; Tue,  6 Oct 2020 17:47:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3259.9497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPpBE-0007Gi-FA; Tue, 06 Oct 2020 15:47:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3259.9497; Tue, 06 Oct 2020 15:47:08 +0000
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
	id 1kPpBE-0007GJ-Bi; Tue, 06 Oct 2020 15:47:08 +0000
Received: by outflank-mailman (input) for mailman id 3259;
 Tue, 06 Oct 2020 15:47:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ivvU=DN=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kPpBC-0007Fa-Ka
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2020 15:47:06 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.42]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ca1153e5-e93b-4e64-af8c-7523f09e957b;
 Tue, 06 Oct 2020 15:47:04 +0000 (UTC)
Received: from AM7PR04CA0026.eurprd04.prod.outlook.com (2603:10a6:20b:110::36)
 by AM6PR08MB5077.eurprd08.prod.outlook.com (2603:10a6:20b:e6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.38; Tue, 6 Oct
 2020 15:47:03 +0000
Received: from AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::28) by AM7PR04CA0026.outlook.office365.com
 (2603:10a6:20b:110::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.37 via Frontend
 Transport; Tue, 6 Oct 2020 15:47:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT025.mail.protection.outlook.com (10.152.16.157) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Tue, 6 Oct 2020 15:47:02 +0000
Received: ("Tessian outbound a0bffebca527:v64");
 Tue, 06 Oct 2020 15:47:02 +0000
Received: from a58f2633d65b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 71A84ACF-D9B0-4BD7-B76F-1C1B67705918.1; 
 Tue, 06 Oct 2020 15:46:50 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a58f2633d65b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 06 Oct 2020 15:46:50 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBAPR08MB5752.eurprd08.prod.outlook.com (2603:10a6:10:1ac::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34; Tue, 6 Oct
 2020 15:46:49 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3433.045; Tue, 6 Oct 2020
 15:46:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ivvU=DN=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kPpBC-0007Fa-Ka
	for xen-devel@lists.xenproject.org; Tue, 06 Oct 2020 15:47:06 +0000
X-Inumbo-ID: ca1153e5-e93b-4e64-af8c-7523f09e957b
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown [40.107.22.42])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ca1153e5-e93b-4e64-af8c-7523f09e957b;
	Tue, 06 Oct 2020 15:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H1ePMpoFGvhxROigwQPGp/4mYvJqM2Wup7VEwVmLkik=;
 b=Ad4c9nQzUUmpRWhdCUuwIk3OtPCpxRWmCqB58CebCoZQLt+Oi0/tD1HR20fR4MHhZra0t0aco2KDe5F2gGbcfM8VPxow5JnCK+kJJ1UV8KQn+zSfWJ7Wh4yCQOPsq0KDeIYdPld7+7RuBS0ARXGXSU1rBg+W8qws5J4BxlTLBJ8=
Received: from AM7PR04CA0026.eurprd04.prod.outlook.com (2603:10a6:20b:110::36)
 by AM6PR08MB5077.eurprd08.prod.outlook.com (2603:10a6:20b:e6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.38; Tue, 6 Oct
 2020 15:47:03 +0000
Received: from AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::28) by AM7PR04CA0026.outlook.office365.com
 (2603:10a6:20b:110::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.37 via Frontend
 Transport; Tue, 6 Oct 2020 15:47:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT025.mail.protection.outlook.com (10.152.16.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Tue, 6 Oct 2020 15:47:02 +0000
Received: ("Tessian outbound a0bffebca527:v64"); Tue, 06 Oct 2020 15:47:02 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e502637991c059a4
X-CR-MTA-TID: 64aa7808
Received: from a58f2633d65b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 71A84ACF-D9B0-4BD7-B76F-1C1B67705918.1;
	Tue, 06 Oct 2020 15:46:50 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a58f2633d65b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 06 Oct 2020 15:46:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ca0AxA83QuCRR0eEAWVwNm+lPbMKENGQoJPT8JT37GZnTxaW8wU9f6ehuTfNjUzooep3sQwrEXjP11pu24DayXNX8Fi+ALi7tJ56bDiLK48JCLP5y/fRK16/CBTiZoWn8MLM8y+7o3FWcvuogvYFZVCZch7kDRI78AeV04b365wiyij2Vk6CsQYdX5IxPjQszIHtX2I3woULBAj2M/ALBfsvBG6muNarImwfhXMU9NEz+eqkBHmN9jMA7fY9X8K8ZefP2fYzfY/RqbvCtixK1rAuT9aO3rBrOK4cVeaalYm4XS4g/7Vy7LxYKKRephp6CoIOiMule8Bw/XuFbEPoWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H1ePMpoFGvhxROigwQPGp/4mYvJqM2Wup7VEwVmLkik=;
 b=Re+LWVBknpTHsUgHZh49cCQISpYnUtmZEP/B8G9MDA2kho8W1+rZpTbPcBtx+RhE3WOEohBzNKo9XtTVYWoEjn/OR2uMb/Cj2cdQXtrcabveWJi8Q1S+UMreZiCBJ64zcz5y1XDBmWvOaXL/NGydvhYNnEs+xcvrdrOL2HdgZgRZdQbKCYhMfoqKYK0is5344TQO4B0xgCBt7XPaXtV3fmCEn8otYVkn2HJtYRVXEqPk5S3q+EJ9cU0peiw7yUwB/xCxrDAxWLObgcybkSuMnToD7MXjgMqMqlmHcEjjOh2wye66EUwvePwYdk2Oq6U5dkQL3rN0j3yjkmWJu6FWyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H1ePMpoFGvhxROigwQPGp/4mYvJqM2Wup7VEwVmLkik=;
 b=Ad4c9nQzUUmpRWhdCUuwIk3OtPCpxRWmCqB58CebCoZQLt+Oi0/tD1HR20fR4MHhZra0t0aco2KDe5F2gGbcfM8VPxow5JnCK+kJJ1UV8KQn+zSfWJ7Wh4yCQOPsq0KDeIYdPld7+7RuBS0ARXGXSU1rBg+W8qws5J4BxlTLBJ8=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBAPR08MB5752.eurprd08.prod.outlook.com (2603:10a6:10:1ac::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34; Tue, 6 Oct
 2020 15:46:49 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3433.045; Tue, 6 Oct 2020
 15:46:49 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/2] tools: use memcpy instead of strncpy in getBridge
Thread-Topic: [PATCH 1/2] tools: use memcpy instead of strncpy in getBridge
Thread-Index: AQHWmzF2iz7tdPrAmU+VUEf6Gggal6mJ/YIAgAA3CACAAAfxgIAAfPCA
Date: Tue, 6 Oct 2020 15:46:49 +0000
Message-ID: <D645DDC5-1EA3-4780-AD3C-081A0971BCA2@arm.com>
References: <cover.1601913536.git.bertrand.marquis@arm.com>
 <3de58159c6fde0cdfa4d0f292fa55fdb931cb3aa.1601913536.git.bertrand.marquis@arm.com>
 <95b2a6f9-e063-8276-db62-ddaac06f4b7b@suse.com>
 <F313E5EA-DF1A-4AC2-885B-75FD1B1D8211@arm.com>
 <58c4b793-e093-ca49-a6a1-1a5073013831@suse.com>
In-Reply-To: <58c4b793-e093-ca49-a6a1-1a5073013831@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 70fe1248-6f14-4489-ea6a-08d86a0f11eb
x-ms-traffictypediagnostic: DBAPR08MB5752:|AM6PR08MB5077:
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB5077920EEF35524841DAF9CE9D0D0@AM6PR08MB5077.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 /V0OyVc9xf4ZkrWSbI+5SWRKgDJ0pTGTvv3ifLFk98+nbg0tdn+P8K39mA2UgK86Fe6ws3aLwbxecejzlzOL0wkLgXVSmmBI3AJzSiL8JQPHdttSdYgiskQgRImJoeNHimNQLZL6xEhHNSdSz/aDt+6SnS+9PoP8c7uWWykpDebrpjba1vfS9sjoJZ5iARueFLJMBptN8S2sRE13urqV5q4ZZ8jhufiREp3S+Hr8jK5TU8rE/OzXbS1g6QXDfMKnFGga3aZMPdB3wQwcNmHDMLxzgI0J+NCrXHEwpFBQc6zaNhcjXoJGAuL7y8WQv/WEszx6dNhH6Vhbivw7b+Cojg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(39860400002)(136003)(346002)(396003)(66574015)(83380400001)(66476007)(66946007)(66446008)(91956017)(5660300002)(54906003)(316002)(26005)(66556008)(186003)(53546011)(76116006)(6506007)(2616005)(86362001)(6916009)(64756008)(4326008)(6486002)(71200400001)(8676002)(33656002)(478600001)(36756003)(6512007)(2906002)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 PYqgru1/1n9i9BxfrJpFxAC/2XT6xM9aq32Ncb1qkWitEfyi+XpoTnMsmp08C4510j3IWCuAX6CliFNl+xN1+uH453fSNw6dQOHkVBIUl1G5TiarL4UuhVjxKQyLQ2OEGymcRi15usFTZE63s8i1O3uxgjnse1uw1MVJ2Wm8xe5O80iIopZHrIhPKGx8pzyFYkfz9L6Y9Qyf3PFcK2hAm7etYVYwkEGaGYfsK5WpboXXv31PSesxoqL4yzjbXpNckEqF66xQxnjSn2z57omkfpeNqLO14C0stozUWKrd30/Wf7E4B4Zvu30h7mCUsbZpNL7obQjFQ+iCCp8ufJ/SRhKAvJuLrhP4vapP+qY8b9Jk5Wcvzf4DEQwKNHSpmt1bsf+h1FBycCP9umOr8nnUVjvUcmbwQQSKT/z9/NokOcKvD9WPQGEkNTd5YZnC4xxyhFSO1kFbomaHaE2yUcEbSAhxb/9GvmK7Rgs4qHJta7jYdKs2f/kf+92UF3ZoiuRRV5MjF3QiKXArQtwqDMhmaVZvhN3Fpz2muL44scwqPPdjLvtDykpdd+WQuQmWplySvWD/5wYAz1p82/8EcrrqCdwnIlLLDSIqd5YIN/tKZgnf2Q5Oov/x7bL/qCvA991vAI2I32FVyLEg6ZzLVAAXNA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <A8E494F3E4CCF94CAAD6286708F31050@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5752
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	51af93bd-32ad-432e-ea4f-08d86a0f09f2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VOh1BOr3fTsAG6zxzc4i8VWmz5fb64nIymCRn0GGm+dg9i4phQOTJ9jt7ApB2dDBCj2Ur4UMrvm60y+LBe9JPxIridTQnXvk507Uy1502U+fI28hXDm21uVshzGcuqPbMRPZBrTfAP5+Swduc5YvTOPERqp+DKulsQmEfKMvnIKAZPPZFyaINHhS7w1O0obm40yiggF3305S0w7yLeq++rpHzdTLL5qXrmZhj0ACS2PwYpV0m8hkdz8psbRMwEnK2gtjGYTAjwrfV+RmXttIm6NpnxiNfaB+y52Dv9jK5th9n7U6QRAAbxJr8xip4G2xY5C0ODCxMkSJyVWsV3tpabN1LgIk66yu2EasO80oX70oIGzJLKljnlZPMtejaip7Xp3/EXoFlrS1pYVAftVmXQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(396003)(39860400002)(46966005)(70586007)(2906002)(82310400003)(6512007)(6862004)(4326008)(356005)(86362001)(6486002)(83380400001)(66574015)(8936002)(70206006)(33656002)(5660300002)(81166007)(47076004)(26005)(53546011)(2616005)(8676002)(82740400003)(36756003)(54906003)(6506007)(316002)(478600001)(36906005)(186003)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2020 15:47:02.9872
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70fe1248-6f14-4489-ea6a-08d86a0f11eb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5077

SGkgSnVyZ2VuLA0KDQo+IE9uIDYgT2N0IDIwMjAsIGF0IDA5OjE5LCBKw7xyZ2VuIEdyb8OfIDxq
Z3Jvc3NAc3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMDYuMTAuMjAgMDk6NTEsIEJlcnRyYW5k
IE1hcnF1aXMgd3JvdGU6DQo+Pj4gT24gNiBPY3QgMjAyMCwgYXQgMDU6MzQsIErDvHJnZW4gR3Jv
w58gPGpncm9zc0BzdXNlLmNvbT4gd3JvdGU6DQo+Pj4gDQo+Pj4gT24gMDUuMTAuMjAgMTg6MDIs
IEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+Pj4+IFVzZSBtZW1jcHkgaW4gZ2V0QnJpZGdlIHRv
IHByZXZlbnQgZ2NjIHdhcm5pbmdzIGFib3V0IHRydW5jYXRlZA0KPj4+PiBzdHJpbmdzLiBXZSBr
bm93IHRoYXQgd2UgbWlnaHQgdHJ1bmNhdGUgaXQsIHNvIHRoZSBnY2Mgd2FybmluZw0KPj4+PiBo
ZXJlIGlzIHdyb25nLg0KPj4+PiBSZXZlcnQgcHJldmlvdXMgY2hhbmdlIGNoYW5naW5nIGJ1ZmZl
ciBzaXplcyBhcyBiaWdnZXIgYnVmZmVycw0KPj4+PiBhcmUgbm90IG5lZWRlZC4NCj4+Pj4gU2ln
bmVkLW9mZi1ieTogQmVydHJhbmQgTWFycXVpcyA8YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPg0K
Pj4+PiAtLS0NCj4+Pj4gIHRvb2xzL2xpYnMvc3RhdC94ZW5zdGF0X2xpbnV4LmMgfCA5ICsrKysr
KystLQ0KPj4+PiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkNCj4+Pj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnMvc3RhdC94ZW5zdGF0X2xpbnV4LmMgYi90
b29scy9saWJzL3N0YXQveGVuc3RhdF9saW51eC5jDQo+Pj4+IGluZGV4IGQyZWU2ZmRhNjQuLjFk
YjM1YzYwNGMgMTAwNjQ0DQo+Pj4+IC0tLSBhL3Rvb2xzL2xpYnMvc3RhdC94ZW5zdGF0X2xpbnV4
LmMNCj4+Pj4gKysrIGIvdG9vbHMvbGlicy9zdGF0L3hlbnN0YXRfbGludXguYw0KPj4+PiBAQCAt
NzgsNyArNzgsMTIgQEAgc3RhdGljIHZvaWQgZ2V0QnJpZGdlKGNoYXIgKmV4Y2x1ZGVOYW1lLCBj
aGFyICpyZXN1bHQsIHNpemVfdCByZXN1bHRMZW4pDQo+Pj4+ICAJCQkJc3ByaW50Zih0bXAsICIv
c3lzL2NsYXNzL25ldC8lcy9icmlkZ2UiLCBkZS0+ZF9uYW1lKTsNCj4+Pj4gICAgCQkJCWlmIChh
Y2Nlc3ModG1wLCBGX09LKSA9PSAwKSB7DQo+Pj4+IC0JCQkJCXN0cm5jcHkocmVzdWx0LCBkZS0+
ZF9uYW1lLCByZXN1bHRMZW4pOw0KPj4+PiArCQkJCQkvKg0KPj4+PiArCQkJCQkgKiBEbyBub3Qg
dXNlIHN0cm5jcHkgdG8gcHJldmVudCBjb21waWxlciB3YXJuaW5nIHdpdGgNCj4+Pj4gKwkJCQkJ
ICogZ2NjID49IDEwLjANCj4+Pj4gKwkJCQkJICogSWYgZGUtPmRfbmFtZSBpcyBsb25nZXIgdGhl
biByZXN1bHRMZW4gd2UgdHJ1bmNhdGUgaXQNCj4+Pj4gKwkJCQkJICovDQo+Pj4+ICsJCQkJCW1l
bWNweShyZXN1bHQsIGRlLT5kX25hbWUsIHJlc3VsdExlbiAtIDEpOw0KPj4+IA0KPj4+IEkgdGhp
bmsgeW91IHdhbnQgbWluKE5BTUVfTUFYLCByZXN1bHRMZW4gLSAxKSBmb3IgdGhlIGxlbmd0aC4N
Cj4+IHRydWUsIEkgd2lsbCBmaXggdGhhdCBhbmQgc2VuZCBhIHYyLg0KPiANCj4gSG1tLCBtYXli
ZSB5b3Ugc2hvdWxkIHVzZQ0KPiANCj4gbWluKHN0cm5sZW4oZGUtPmRfbmFtZSwgTkFNRV9NQVgp
LCByZXN1bHRMZW4gLSAxKQ0KPiANCj4gZm9yIHRoZSBjYXNlIHRoYXQgZGUtPmRfbmFtZSBpcyBu
ZWFyIHRoZSBlbmQgb2YgYSBwYWdlLCBhcyBvdGhlcndpc2UNCj4geW91IGNvdWxkIHRyeSB0byBj
b3B5IHVuYWxsb2NhdGVkIHNwYWNlLg0KPiANCg0KQWdyZWUsIEkgd2lsbCBkbyB0aGF0Lg0KDQpD
aGVlcnMNCkJlcnRyYW5kDQoNCg==

