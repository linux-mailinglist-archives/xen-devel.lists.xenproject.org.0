Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 101C72812D4
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 14:35:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2050.6165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOKHE-0003on-Gx; Fri, 02 Oct 2020 12:35:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2050.6165; Fri, 02 Oct 2020 12:35:08 +0000
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
	id 1kOKHE-0003oO-DC; Fri, 02 Oct 2020 12:35:08 +0000
Received: by outflank-mailman (input) for mailman id 2050;
 Fri, 02 Oct 2020 12:35:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3+am=DJ=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kOKHC-0003oE-Jw
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 12:35:06 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.73]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c7507b35-dce9-4d55-9331-634770fffe8a;
 Fri, 02 Oct 2020 12:35:04 +0000 (UTC)
Received: from AM5PR1001CA0047.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::24) by DB7PR08MB3913.eurprd08.prod.outlook.com
 (2603:10a6:10:7c::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35; Fri, 2 Oct
 2020 12:35:02 +0000
Received: from AM5EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:15:cafe::8a) by AM5PR1001CA0047.outlook.office365.com
 (2603:10a6:206:15::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34 via Frontend
 Transport; Fri, 2 Oct 2020 12:35:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT017.mail.protection.outlook.com (10.152.16.89) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Fri, 2 Oct 2020 12:35:02 +0000
Received: ("Tessian outbound 7161e0c2a082:v64");
 Fri, 02 Oct 2020 12:35:01 +0000
Received: from ad437ae59b25.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7233D458-06F5-4CB8-9D87-28A6EC470D32.1; 
 Fri, 02 Oct 2020 12:34:56 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ad437ae59b25.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 02 Oct 2020 12:34:56 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB8PR08MB5372.eurprd08.prod.outlook.com (2603:10a6:10:f9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.38; Fri, 2 Oct
 2020 12:34:54 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e%6]) with mapi id 15.20.3412.029; Fri, 2 Oct 2020
 12:34:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=3+am=DJ=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kOKHC-0003oE-Jw
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 12:35:06 +0000
X-Inumbo-ID: c7507b35-dce9-4d55-9331-634770fffe8a
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown [40.107.22.73])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c7507b35-dce9-4d55-9331-634770fffe8a;
	Fri, 02 Oct 2020 12:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T6oIfde5Tuosez1/RFkRLH/eRHMbDK4rxnVpTtiuz/0=;
 b=zAG6fkP0mvjWR73PclkdS9E4ETD1uW7oZIuv2E3TRsjr9eYSWZID1y9uNBuM6BU14A7Gf42oJNgJttrCweqDyhooun9a/yNzTmjAkuqlP87k8Wq8NKz7obW0vSMtT+XCoZg/bjMJJ/c7gfmY/LEA/UlRKz1wApAMK0murdWRpLo=
Received: from AM5PR1001CA0047.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::24) by DB7PR08MB3913.eurprd08.prod.outlook.com
 (2603:10a6:10:7c::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35; Fri, 2 Oct
 2020 12:35:02 +0000
Received: from AM5EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:15:cafe::8a) by AM5PR1001CA0047.outlook.office365.com
 (2603:10a6:206:15::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34 via Frontend
 Transport; Fri, 2 Oct 2020 12:35:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT017.mail.protection.outlook.com (10.152.16.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Fri, 2 Oct 2020 12:35:02 +0000
Received: ("Tessian outbound 7161e0c2a082:v64"); Fri, 02 Oct 2020 12:35:01 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 72989764b2f3f0ec
X-CR-MTA-TID: 64aa7808
Received: from ad437ae59b25.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 7233D458-06F5-4CB8-9D87-28A6EC470D32.1;
	Fri, 02 Oct 2020 12:34:56 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ad437ae59b25.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 02 Oct 2020 12:34:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e+hQlATvMvjoiLTeYkjX8REyrOsvcW/s2at4W2oJ6M0FnyjccyTajhXKFooDNhjVB7gkveOjxdrVbF5e0Y6utH1SED67nXEBInWzx2+57pA3r/De3lCtU0JFf4HAEj/Ck9MI0FrEdkuVO2Wkd5E8Aq7xQ/4pv89FSywI2mkIyVlVaPpdnCN/KOIAmnGngebOLfmx48JEElla+fF/j/pAUKRGMZa7lDBD5dMZ2UxXXz2aNdCn7U3g4Lnuyp+4ggBv68f7UIC8ZwjWwgGd4kHZcfBtKOXYpD9SGefozwdu9NfzxFSQP1olng0iwXiucPUVzIoIUDGUflqz+AXhOBOvMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T6oIfde5Tuosez1/RFkRLH/eRHMbDK4rxnVpTtiuz/0=;
 b=Vx8B4EEIrAJwerT/s25wqRQt6+Uk9vmko0KAAnFbnMtgWsLsKAp6qLZkceno3VeIINnN3fspKDRgrVGO6RKFuNusmUwicYIV0AvHgYD9jsfSvyQPhIkybGXho+InOU6BX2zuwZbGmaplAdqqeWcaSRnfilJM8fZv9+FLqGtKCEaedE4K75sBqHVpll59Hhglu1Yd/0y5bntzv8d9zlqrHKlK4iQ3fJEvd+raZAjdLOcLENJJQuItwzGruEcOdHy8ZDJYH9ShB5YfvFQcNv2za0Y1SKI+vccoyBO1GYoJ/OUUEJisKq/oia4Z9jPl8WgA4bt/0q1buRTb0fFcB6xfvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T6oIfde5Tuosez1/RFkRLH/eRHMbDK4rxnVpTtiuz/0=;
 b=zAG6fkP0mvjWR73PclkdS9E4ETD1uW7oZIuv2E3TRsjr9eYSWZID1y9uNBuM6BU14A7Gf42oJNgJttrCweqDyhooun9a/yNzTmjAkuqlP87k8Wq8NKz7obW0vSMtT+XCoZg/bjMJJ/c7gfmY/LEA/UlRKz1wApAMK0murdWRpLo=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB8PR08MB5372.eurprd08.prod.outlook.com (2603:10a6:10:f9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.38; Fri, 2 Oct
 2020 12:34:54 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e%6]) with mapi id 15.20.3412.029; Fri, 2 Oct 2020
 12:34:54 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "open list:X86" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] build: always use BASEDIR for xen sub-directory
Thread-Topic: [PATCH] build: always use BASEDIR for xen sub-directory
Thread-Index: AQHWmKjTj7VmlPYcLkSjqrrhNFG5S6mEOTwAgAAGTYA=
Date: Fri, 2 Oct 2020 12:34:54 +0000
Message-ID: <31FC9BB1-F4C4-4203-94C1-1134607E49C2@arm.com>
References:
 <556f6327acea2d0343c93da28f1fc17591afd402.1601564274.git.bertrand.marquis@arm.com>
 <706afc44-a414-33ff-da94-b92f7a96f1fc@suse.com>
In-Reply-To: <706afc44-a414-33ff-da94-b92f7a96f1fc@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: aa6c1eb1-0a6b-4039-f57b-08d866cf9545
x-ms-traffictypediagnostic: DB8PR08MB5372:|DB7PR08MB3913:
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB39130CFBA92499C8148A381E9D310@DB7PR08MB3913.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2089;OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 liFyhRZx5GRMB7NyuX0u/31WQgTVDmLxsUTBQYzwQHIpvPUmSPKCvraYBWsr+lzAfPz2AxmrIz4mZ1BehcJXkD6gFCaWNSWB3fUec0tjrPp5uEzuRnZ2T7JTY8FDKl8QCqhkQvaiO+wjGqRZ45HPoRpa46zrBaTiZXsos6P/9TPadr0QiGApovaoZ9H7sXjer53PblGY15Ll+t5JJk5pmEcFTzAAz/mQahpZuuESI7cO3JYEEWQ1q9BtLruo4eGfqCwctV8+0T6b4LCd8pZfnJ/XbpSQx7eqChv0HlVJ1pL80wxX4zKhgUFAHCX0H2P+Zuw0t6hhDDESavM5Z0Wl0w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(376002)(136003)(346002)(396003)(86362001)(36756003)(6916009)(8936002)(6486002)(6512007)(33656002)(316002)(186003)(2616005)(8676002)(71200400001)(26005)(2906002)(83380400001)(4744005)(5660300002)(478600001)(76116006)(66946007)(64756008)(53546011)(6506007)(66446008)(4326008)(66476007)(91956017)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 1hNQs71bYPySFiE58YKfiitK4h4bWIqj+oy4uDgv/DggO5grzJ/KQm8liqVJ+pxhIwloBEcLenlgsbLCCA0zsN9OwcGmGUGPvdXaFIBG18mP9W+SSR17zUmpnmAGVWdBUryzcbhr02zB2S1D3qocvNyXURWsAQkLVhG750HHbpMlzEcwHwvPCLxS9YvVVo5fEKcZRwngUuIfCdZB42omBB29YBrp3oNrY6hAlXfWoSe6z+Atuso5X2KGoncnMU4fbQmH52CzUgKUMo2zgDjwO1agnjgHL82BtJ4obuAUuVNHc0vdYFjJI0T5lJXkeF+dOgjeYi6NLb6Krstek/IHKE07bAqpBV+jKHTO6BBzDJNWUWocwSAqt1Rap1QceRI43WBmwRFFQnJUV9waZMt+zzc3W/9y7gZ9arDzvBR8dGsMpSliGli2qebLuqyn7eL+dyR+NV6EZ1G+CdytOlTqisrG4W5tfUaUQEqwxFmVM5fKs9xdH0uV5eGMrB+olWNdeFyQEXbUHo7hGJVyp1iTqcabpNsujEAKiGj51tp2eD3TeoFkkPz15IhQU/3J5O4i20E8HW1Rg4DkTLCQbjTS09QJu8dkw1zYnHU9NEkU2WMWnicb3EcqvHKXnnegzGTIPcVX0f8TnDSwll2JnV/obg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8C1D3F543177D34B977B752E39735A40@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5372
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	23074908-f3da-457c-de14-08d866cf90c1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BxYwFPQpzhgO5spRJuu9Z2voI6aFvslNx12sfT3XlDV/eRchiE6zpeitAwzUGA1AbkyJ2C/rE/K2XnDJvCXGAIzVACPESjnAT4qTvzrQXfjCTwnGA6/nM0c3AfD1ZkZWuqcFJbkGZ9bdtO48ZHiKOWMgTjD4vtEusj8NLcCkHCfJlnYwHUzOC3551mpn18wRWr4r6U2YxgDMNNlVfWqL1C92SJl+wpXv9XrTWWKKsz7eb5X5mxOaQnWtFQOD/cB6yjItFVYZ2a904eenLGax1tRasmFWYNrhSqqVUl85eqlxi1FMNPC098nRDLrSX63QtJU6dLNVR1kgtAlxqxfj2V3LGPY9+2n7Sk63kvYq0/7MGLKj/Rm24o0VKoFjt58w6L8scjME1JmLVnXyvtP59g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(136003)(39850400004)(376002)(346002)(46966005)(82310400003)(4326008)(33656002)(5660300002)(6862004)(8936002)(8676002)(83380400001)(36756003)(6486002)(2616005)(4744005)(53546011)(81166007)(6512007)(6506007)(70586007)(70206006)(316002)(478600001)(36906005)(356005)(86362001)(82740400003)(336012)(26005)(47076004)(186003)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2020 12:35:02.0958
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa6c1eb1-0a6b-4039-f57b-08d866cf9545
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3913



> On 2 Oct 2020, at 13:12, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 02.10.2020 12:42, Bertrand Marquis wrote:
>> Modify Makefiles using $(XEN_ROOT)/xen to use $(BASEDIR) instead.
>>=20
>> This is removing the dependency to xen subdirectory preventing using a
>> wrong configuration file when xen subdirectory is duplicated for
>> compilation tests.
>>=20
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>=20
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks :-)

>=20
> (but more for the slight tidying than the purpose you name)

Feel free to remove the justification from the commit message if
you think it is not usefull.

Cheers
Bertrand


