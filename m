Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C6F28EF43
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 11:16:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7162.18795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSzMy-0006hU-Rc; Thu, 15 Oct 2020 09:16:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7162.18795; Thu, 15 Oct 2020 09:16:20 +0000
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
	id 1kSzMy-0006h5-O9; Thu, 15 Oct 2020 09:16:20 +0000
Received: by outflank-mailman (input) for mailman id 7162;
 Thu, 15 Oct 2020 09:16:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ehY9=DW=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kSzMx-0006h0-Jw
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 09:16:19 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.49]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c9ea3965-869c-4ab3-8184-2ab5ddb7156b;
 Thu, 15 Oct 2020 09:16:15 +0000 (UTC)
Received: from AM6PR02CA0033.eurprd02.prod.outlook.com (2603:10a6:20b:6e::46)
 by AM6PR08MB5095.eurprd08.prod.outlook.com (2603:10a6:20b:e1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.24; Thu, 15 Oct
 2020 09:16:12 +0000
Received: from AM5EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:6e:cafe::83) by AM6PR02CA0033.outlook.office365.com
 (2603:10a6:20b:6e::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.22 via Frontend
 Transport; Thu, 15 Oct 2020 09:16:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT053.mail.protection.outlook.com (10.152.16.210) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.21 via Frontend Transport; Thu, 15 Oct 2020 09:16:12 +0000
Received: ("Tessian outbound e6c55a0b9ba9:v64");
 Thu, 15 Oct 2020 09:16:12 +0000
Received: from 31dfee00bc8b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 27C496DE-782C-4F84-9FB0-DABEE7B679CD.1; 
 Thu, 15 Oct 2020 09:16:03 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 31dfee00bc8b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 15 Oct 2020 09:16:03 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBAPR08MB5686.eurprd08.prod.outlook.com (2603:10a6:10:1a1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.24; Thu, 15 Oct
 2020 09:16:03 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3477.021; Thu, 15 Oct 2020
 09:16:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ehY9=DW=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kSzMx-0006h0-Jw
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 09:16:19 +0000
X-Inumbo-ID: c9ea3965-869c-4ab3-8184-2ab5ddb7156b
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown [40.107.22.49])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c9ea3965-869c-4ab3-8184-2ab5ddb7156b;
	Thu, 15 Oct 2020 09:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CBezyFDMAZVTmGEBaNCHQVY0TkXGlydWSP2kyYgPJLU=;
 b=sdgj6ZTp512kv/lgGD2K4PxCt4YkBgBsa1vqYN8LrhYHB+dr8KVux4Wj4+6LYn2EfDhL8Bl028XWrXNRzkuf0y5hLo4Lxaari0/KhcEbmg4Yu7T59Jj9MZ6xlDMA+dQLMrG86DIOTdQ9rut4pwaZdYsgGa9qIhxLjZ+GRTOTmWc=
Received: from AM6PR02CA0033.eurprd02.prod.outlook.com (2603:10a6:20b:6e::46)
 by AM6PR08MB5095.eurprd08.prod.outlook.com (2603:10a6:20b:e1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.24; Thu, 15 Oct
 2020 09:16:12 +0000
Received: from AM5EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:6e:cafe::83) by AM6PR02CA0033.outlook.office365.com
 (2603:10a6:20b:6e::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.22 via Frontend
 Transport; Thu, 15 Oct 2020 09:16:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT053.mail.protection.outlook.com (10.152.16.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.21 via Frontend Transport; Thu, 15 Oct 2020 09:16:12 +0000
Received: ("Tessian outbound e6c55a0b9ba9:v64"); Thu, 15 Oct 2020 09:16:12 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e097600fb1cb1920
X-CR-MTA-TID: 64aa7808
Received: from 31dfee00bc8b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 27C496DE-782C-4F84-9FB0-DABEE7B679CD.1;
	Thu, 15 Oct 2020 09:16:03 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 31dfee00bc8b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 15 Oct 2020 09:16:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a6YKD/miVUBqsaYEPZyGM0gFgk+JVKzYidx63cSm2ZZAiiQhoah2wpIx/GIXawyFbqVmZUhJ12R5n380qeIQeM0dO3HREmMe+6R8ZoGXfWW/SCILV2QXFg2iIGSIXj72Df7AIZkfCpwnDd6w3y6ACZiwp9KBDR8eFQXJM2yIyazX3KUhLPUkb6E70QphzCD8gvLdC7iVEGI6NFxrBtWMw12bmEfOQrm+hjliQZaLvKXaIP0Rfhn7s9LMMpnBpINGhy/chzWcNHtQQRrIZ8V8NqM3Pemwt+a2qf61ucENsi4UruNo1H/EtCyBpqsImEKPey9GgxVJZ/t6OY7aWOc3Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CBezyFDMAZVTmGEBaNCHQVY0TkXGlydWSP2kyYgPJLU=;
 b=WJCOftNIHnPjkZAtkiRKOyqywlHEPa+YOTN0zwbiCEEE6txwNndwETsZMoWDBh3GNi1pKCXHOIFCaeomqvmBPHYeVxs4PH7RUjZA4WF9KomfWzwWr4jiIuoYmd1xmXyy8k0Ytfvf2vYGXx1xyZ2czJFBJpwYMzoU0toIBa3ARcJImaKdcmmdIzJDTtUT4Of+nAzdGi3Hx4XleamhYwwUTkVKsOc5QNHsdUQmNHf19l74oIqThqAGGjPf1xxKUJxmEQosluLP/mbrXcxxs3yYwyd0WCHA2Br5Y2uVMWcE4cIvaUqlzK2+bLhe6sirNO2rVQzr+PV8AIJ6UQgKTI1VLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CBezyFDMAZVTmGEBaNCHQVY0TkXGlydWSP2kyYgPJLU=;
 b=sdgj6ZTp512kv/lgGD2K4PxCt4YkBgBsa1vqYN8LrhYHB+dr8KVux4Wj4+6LYn2EfDhL8Bl028XWrXNRzkuf0y5hLo4Lxaari0/KhcEbmg4Yu7T59Jj9MZ6xlDMA+dQLMrG86DIOTdQ9rut4pwaZdYsgGa9qIhxLjZ+GRTOTmWc=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBAPR08MB5686.eurprd08.prod.outlook.com (2603:10a6:10:1a1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.24; Thu, 15 Oct
 2020 09:16:03 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3477.021; Thu, 15 Oct 2020
 09:16:03 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] tools/xenmpd: Fix gcc10 snprintf warning
Thread-Topic: [PATCH v2] tools/xenmpd: Fix gcc10 snprintf warning
Thread-Index: AQHWokU2+acqwbijJUavOAENd1LPUqmYVziAgAAL2AA=
Date: Thu, 15 Oct 2020 09:16:03 +0000
Message-ID: <F132913E-955F-44DA-8D57-3A27DF764D89@arm.com>
References:
 <005bd16161fe803e9c2805bddc440db31c46169b.1602692002.git.bertrand.marquis@arm.com>
 <470f6555-9935-f581-eae6-6b8b3ed4490d@suse.com>
In-Reply-To: <470f6555-9935-f581-eae6-6b8b3ed4490d@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1f4af322-d9c9-4d14-5298-08d870eaf607
x-ms-traffictypediagnostic: DBAPR08MB5686:|AM6PR08MB5095:
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB509510CB438A21B892EC01129D020@AM6PR08MB5095.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 wlpHTejlwY7k23cHbvnwFMe8j+F+h6h2RoO6ZqBscjyW8dh20ezjeA9vgjcE3zKqyyt3OSFwsyAJIiunFOdArVGDY7zlMkIQKbJ1DJbhvMKDCpRLsHjyLocd+H4KITEQ3TdIj0bBrbGw/Kd3/CYYnrDazO3IyjOKIFQ0MgAoGxPAm3GvNtF26F+7LR81zc6wqjOKLo51UFUCPvlTyxX79Wt1pbLWPgOtofI4e4XZCgxqDpufSbf2QyHFO1jGmfI+kotkmk9jLIzIRPiInM+yBDoCCkSkB2LGF5NQtxG6cRCZkfCXGRh6tlpuW2367s8NKaz3lWhomRZho1StgwwNzU1X0SJgA6wun4EHCmAd/hd3gzD7egWGtx9P8OInGxzSi40LEaowrUjo5Lte1eOW0g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(366004)(39860400002)(346002)(376002)(6916009)(2616005)(6486002)(54906003)(53546011)(478600001)(4744005)(33656002)(966005)(26005)(186003)(316002)(5660300002)(86362001)(6512007)(8676002)(2906002)(36756003)(83380400001)(64756008)(76116006)(91956017)(66556008)(66446008)(66476007)(66946007)(6506007)(83080400001)(8936002)(71200400001)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 w5WXXFPDL24rdJ8ycFiXenIw+BQZU4xO1QcxaZZO3Rf0X6cZch00vY5+atFvg0VkhGcB9n/UH6IURyqkux9sv3um9h6vy+qay0cKU1+QT+1Arp7TNQaXLBVwvUEi/wN225/oEfobvQGziT/VzrQFLS6k5iYzMmW6DgIMblcaxApHjHlQFzib8bzKpPcnyenE5stsfec30xnTaKqV30gBRYgRZxk3I1MhKK8PPg0o/MSH4SfgmbLozhP3uxR8NH6Dq/P9cts85t9Nuhrshm4BH8tApHIAJr8BqS2oMj8yJeyM141a7PUM1uPIhsUXZvH2MCg/Ylb4fE5kykfPARRt04ShMEaoe5Jfp6AFvQIt+J0TL+zeDuZhrT2WnQyjeC5ihBlLOBa7EKCT/4dB6Of84Lft/bQU7Fp8djAgKSLj4V11hzRhL6hsqaPyqiJaUGnO88rxiPIShJ6e39sj0z+0Ozd2hsw5jnkDa5FJcmJ6MYAD+BgTBpTQZSESPxm2JT0oCf5weHxCrRpIC9lnPKdxwAbKVZD0RfOmz4L730FLjEc1xnTtJm4CAc6XqYD+YArxEOEU8YmPCtKwBEGmCze7GJ2lqOaBS5qyCPStHJwB+OAQ1/z6pq3nIf4ElHUOjD+Jxws1VdxZtthhAlqx7+SjUw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <41118B39905B04469B30B5F11E140C61@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5686
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a182debb-e1ae-4666-293b-08d870eaf07c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WhO8pK9ueAvK9ubqN0k3mc8D0Ado1MzffbtxvGhwZ88JcYvF043wkCSlVRh9Y0ZsxyfUDo0QTovI2iLEhdw19we7dA4y8mczeVHs8373+K3iH8fM8HykMDstndvPAI47H4PLZuNaC7gp0dtlQSAuaXzTM8UahrTg8ykA9HzRdZ192iZYiaIEzV6zF4EcC7HDk45gFUmHbprL99D4Z9RsvsZOpGW6U2PZFzoSmYDNUsIgZ5ZA0CTOSO9qToYF5V6zLdLG5iFRyT22b+pU0dIU7Ov9jeCVXvLRG1hAF2q8Puw7A+Gmaaz3IsqsEKM37OviTR2KAN8psQAohPS/C0ar9zgL0w/fYRZpiKtNntLg0kA9JIMmkeZgVg1sOWoO/LPk0P//KgDbOY2yAloeIiPvUvi1rdOIhC3TCyKvzYg7Q4uoKX3mjUW/M9ubkAkFkZhDM6SPfehYOSc+wPweyLHJNzhV+vD5G0FSuSwcp8NGA1Q=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(346002)(376002)(46966005)(4744005)(356005)(5660300002)(83380400001)(83080400001)(316002)(8936002)(70586007)(70206006)(82310400003)(6486002)(82740400003)(81166007)(33656002)(47076004)(2906002)(86362001)(6512007)(2616005)(4326008)(966005)(478600001)(26005)(186003)(36756003)(8676002)(53546011)(6506007)(336012)(54906003)(6862004)(36906005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2020 09:16:12.4608
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f4af322-d9c9-4d14-5298-08d870eaf607
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5095

Hi,

> On 15 Oct 2020, at 09:33, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 14.10.2020 18:14, Bertrand Marquis wrote:
>> Add a check for snprintf return code and ignore the entry if we get an
>> error. This should in fact never happen and is more a trick to make gcc
>> happy and prevent compilation errors.
>>=20
>> This is solving the following gcc warning when compiling for arm32 host
>> platforms with optimization activated:
>> xenpmd.c:92:37: error: '%s' directive output may be truncated writing
>> between 4 and 2147483645 bytes into a region of size 271
>> [-Werror=3Dformat-truncation=3D]
>>=20
>> This is also solving the following Debian bug:
>> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D970802
>>=20
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>=20
> Just as a nit - could you fix the typo in the prefix of the patch
> subject, to correctly name the component?

oh right pmd not mpd.=20
v3 on the way.

Cheers
Bertrand


