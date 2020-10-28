Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 795A329CF59
	for <lists+xen-devel@lfdr.de>; Wed, 28 Oct 2020 10:57:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13460.34143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXiCy-0000MR-Jn; Wed, 28 Oct 2020 09:57:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13460.34143; Wed, 28 Oct 2020 09:57:32 +0000
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
	id 1kXiCy-0000M2-Gj; Wed, 28 Oct 2020 09:57:32 +0000
Received: by outflank-mailman (input) for mailman id 13460;
 Wed, 28 Oct 2020 09:57:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zOlM=ED=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kXiCx-0000Lx-5e
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 09:57:31 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.73]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2b12adf0-e10d-4fa6-8cdd-612d78a23aca;
 Wed, 28 Oct 2020 09:57:29 +0000 (UTC)
Received: from AM7PR04CA0019.eurprd04.prod.outlook.com (2603:10a6:20b:110::29)
 by AM0PR08MB4178.eurprd08.prod.outlook.com (2603:10a6:208:133::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.27; Wed, 28 Oct
 2020 09:57:27 +0000
Received: from AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::a0) by AM7PR04CA0019.outlook.office365.com
 (2603:10a6:20b:110::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Wed, 28 Oct 2020 09:57:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT007.mail.protection.outlook.com (10.152.16.145) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Wed, 28 Oct 2020 09:57:26 +0000
Received: ("Tessian outbound 7c188528bfe0:v64");
 Wed, 28 Oct 2020 09:57:26 +0000
Received: from 13da28b2a5bc.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 19F5A326-F0B6-4255-AEF3-8C0C07130426.1; 
 Wed, 28 Oct 2020 09:56:49 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 13da28b2a5bc.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 28 Oct 2020 09:56:49 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3260.eurprd08.prod.outlook.com (2603:10a6:5:21::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.28; Wed, 28 Oct
 2020 09:56:45 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3477.028; Wed, 28 Oct 2020
 09:56:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=zOlM=ED=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kXiCx-0000Lx-5e
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 09:57:31 +0000
X-Inumbo-ID: 2b12adf0-e10d-4fa6-8cdd-612d78a23aca
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown [40.107.5.73])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 2b12adf0-e10d-4fa6-8cdd-612d78a23aca;
	Wed, 28 Oct 2020 09:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQy8RBFw2JBcBUXvdwM4B3SFU81pp2y+IG4/qPH+uOU=;
 b=K3thq3oFJoPiKFU+B+wP1tjlbld1UPlQ4fyYcX9auYaaFUKAneb4Bjsf+siLbFKm/wkvjS11y/8qF1W+Y24gjGeLy1G1d8xVqNgQB08mRoie8efM6G/BzzsMDq9Ht8NqQ6hl5DSuYjUO1KZXQZY2tmVAX/dCe6NRSe5RQIgL3q4=
Received: from AM7PR04CA0019.eurprd04.prod.outlook.com (2603:10a6:20b:110::29)
 by AM0PR08MB4178.eurprd08.prod.outlook.com (2603:10a6:208:133::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.27; Wed, 28 Oct
 2020 09:57:27 +0000
Received: from AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::a0) by AM7PR04CA0019.outlook.office365.com
 (2603:10a6:20b:110::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Wed, 28 Oct 2020 09:57:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT007.mail.protection.outlook.com (10.152.16.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Wed, 28 Oct 2020 09:57:26 +0000
Received: ("Tessian outbound 7c188528bfe0:v64"); Wed, 28 Oct 2020 09:57:26 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 892a95f7c33f02b4
X-CR-MTA-TID: 64aa7808
Received: from 13da28b2a5bc.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 19F5A326-F0B6-4255-AEF3-8C0C07130426.1;
	Wed, 28 Oct 2020 09:56:49 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 13da28b2a5bc.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 28 Oct 2020 09:56:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X0qmTShFtRd0YTFv1O/quisql4IgNUlMgqRucPvO0TUueebusQJAGAeGxzAWeKWlwHAC6AD/EVmLZjluvvMQWcIGnDBSuqNQplfPQWFUNix+KP4ofUCVtm/eusOYL9yQI7E8+lRnhfkWDCrTQ4Q4JA23bbl/mK7CSMhWPuiixvZLep34cBidFwObbX8noexoos5x20iQEQiD+hFxTg/yYMseNpfdFjpxXSxZYMKKv9KEu+ttksfNJvwhULucX//dM2BdWtjhkHzPDbj+ni8jgeRTRbJGUOdU2Wjqpb7CXfCpddkfzxIuFdx7/4K3peUSKQk7UrMHJlwQIqvqApSwWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQy8RBFw2JBcBUXvdwM4B3SFU81pp2y+IG4/qPH+uOU=;
 b=kB20Ar0r5DNQNnV2jvmQW41el3l5FyEQxXVXt/AQ4KYRc063pQU+Au5DHzA7Chkq8oYiQQScOrX4BKxRtHKMTrIxd1b8TpFs0SSjVNHLyUwwNWmg9T30eIaexO+SGbxiYXHBiqhse0LkbiDf/p45o3ss9FfK6wV6BhBWFTlUvnO64I+UwW4s3biJoDX9oRU/8U865YQpgppBk5fw+4TzJoHODgq+3B1OtXCena4rhs8+s5W+D0ZyYZr3C4s3a7bCU3Vq6uh0+T9rFjz0IP/wpeo7i1b6tqsSioknoGm28WhI8FNHi+Oj1zGrmLGcfaTmCfMyFqGS2B96DKZ5ecy0XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQy8RBFw2JBcBUXvdwM4B3SFU81pp2y+IG4/qPH+uOU=;
 b=K3thq3oFJoPiKFU+B+wP1tjlbld1UPlQ4fyYcX9auYaaFUKAneb4Bjsf+siLbFKm/wkvjS11y/8qF1W+Y24gjGeLy1G1d8xVqNgQB08mRoie8efM6G/BzzsMDq9Ht8NqQ6hl5DSuYjUO1KZXQZY2tmVAX/dCe6NRSe5RQIgL3q4=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3260.eurprd08.prod.outlook.com (2603:10a6:5:21::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.28; Wed, 28 Oct
 2020 09:56:45 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3477.028; Wed, 28 Oct 2020
 09:56:45 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: George Dunlap <george.dunlap@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, "open list:X86"
	<xen-devel@lists.xenproject.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 3/3] xen/arm: Warn user on cpu errata 832075
Thread-Topic: [PATCH v2 3/3] xen/arm: Warn user on cpu errata 832075
Thread-Index: AQHWq7RKM3lRt4XRXUWYGPT9/eCkOKmsDfmAgACnfwCAABCqgIAAA70A
Date: Wed, 28 Oct 2020 09:56:45 +0000
Message-ID: <F216109E-83E1-418E-8802-249003415BA2@arm.com>
References:
 <a6fc6cfd71d6d53cf89bf533a348bda799b25d7d.1603728729.git.bertrand.marquis@arm.com>
 <4d62bc0844576b80e00ea48e318be238a4d73eae.1603728729.git.bertrand.marquis@arm.com>
 <alpine.DEB.2.21.2010271540110.12247@sstabellini-ThinkPad-T480s>
 <759F39C4-F834-4BFC-B897-714612AEACD8@arm.com>
 <80E82B52-EE04-440D-8AC7-8B0E7E833FE4@citrix.com>
In-Reply-To: <80E82B52-EE04-440D-8AC7-8B0E7E833FE4@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f84e5679-388b-4dca-4e9c-08d87b27e035
x-ms-traffictypediagnostic: DB7PR08MB3260:|AM0PR08MB4178:
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB417842D51D5FF7724C1F30409D170@AM0PR08MB4178.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 oWCVw9KOoPxPrnAKfb8JdNMT14TJ2d74ZXmDsPaw1Vn0jFiaHI+62nB1UYzbg6wr5htG8QWpmW1waTaTkuAl8VDvVSypoblAd68Rxs/0LKLt/r8t+Jg8Kxziv2H6VIm4Fhmaqo+ufBjLyBPinHsS7BqPqm6HJvyBU5QCtnwgopMilckEXnd8UePVVOAYz/GOSEVi/whCmuBrQzQK6ycbuq/DoobNruEroOxzqCcg+Cl3xe38e/89Mg29fh/C1KPyyALxn+/i47C3iZeVI/ezJzctkz/cDwLzecATvnSQMZOkXPsKjZo7BOxo9GRLJ7Kcr5IcdZmlr2DHWOTRR42TWw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(396003)(39860400002)(346002)(83380400001)(5660300002)(8936002)(6506007)(478600001)(53546011)(4326008)(36756003)(54906003)(186003)(2616005)(86362001)(33656002)(66476007)(66556008)(66946007)(71200400001)(91956017)(6512007)(26005)(76116006)(64756008)(66446008)(6916009)(316002)(6486002)(2906002)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 kC5Svj2a8AbLVKLL4ojgMdykOLpUHwkefB7OAIaqPfucc91K0oIpooMXAibXoQgboPgSdlmvMm64t8yhQTRtvw6k+a9rigkaRPVJC0miNyXHJd0OWlAvX/7jpAwMA9JwyYmxrRxh7H14656lWPQ8UUgMAo1n1jZ0UBn+972K5PCbek/YjL4Sop0tsUoX0gpr40n4u/uRdFrjN46uPiyrjIk0RgRU1Q6n2M0BGsaYLer/at1gG+02flS/tyX0TiqA6K3yRbtpVpRArV1WEF4y7N9YeUbRH1p+XDoS0CFl3B9qDYy6AKUuuH79FdassXr3kQtbwlgYBekXFM2CsLSsPCn8kFORCBsSELFaCK7JsnSLysKJkJs0TakN2wmSyI6rMNbwGRf/iDwPrd/PYFlrgBzgw17BE7kHMupDMzO6ilD5DZbzPeXOLA56oDK77LVfB+gN+PjLtpc9ahRzA5tHefoT8RlW8ozX3iNV2i4aJXMXBlwwvOlDFwy9cJCAPBcDOeMMfwSxPwXFZvLoNz5+sUaYBVe2B0+SnE3bZzepX6sFIAipz/W3kNRKydneGjaqfJUlp//swZzX7wVV840N2paP7XponZwEkqBYM/El8f0tW9qZLfb03QuhDCvCewpdUrNYfFiuSbgJzqWV2+HXLg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <490CBF1E5A65BA4A806A217C1C58BB87@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3260
Original-Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a49d7326-072a-4bf4-072e-08d87b27c7be
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Q8MRThr9gTmqq4ECTUsWdnIjNq/8WdlB57K4dyj8H2tHvs8aV3l1IkzsjiQfbfT4rlsuQJcxviqmXR5yY+eKrhK4Y4RnsD+h1TLLQh91GZZyIUQs2PZqtAWi+sOboILxVW9dHDeCEWxwUX0nNSh2SoiA+gR8ygDmBaTvpW3o05mK7n3my7QDFK1aORHOI3rFIsBaVlrexVktymackFdUb7p8Zh8M2/PA4yTYhkcZKvclMX34Dk0J81ui2sXjQP8dfh5g7e6a/0lcwVc72/3rhiuS5KcO1THvQDFxDtxlGIPNyc97W8sdFzGgajJFUKx9NzrOxXuiMgvkWfTPg9XvK1Eer8OZpRqzk55qVxhF06XZLDwcpp3qIoAIGNS0vJRHa/invn29KCbn1tko9oePRg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(376002)(39860400002)(46966005)(6486002)(4326008)(478600001)(26005)(53546011)(33656002)(6506007)(5660300002)(82310400003)(186003)(336012)(2616005)(6862004)(107886003)(86362001)(356005)(36756003)(82740400003)(47076004)(36906005)(83380400001)(8676002)(316002)(54906003)(81166007)(70586007)(70206006)(8936002)(2906002)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2020 09:57:26.7762
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f84e5679-388b-4dca-4e9c-08d87b27e035
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4178

SGkgR2VvcmdlLA0KDQo+IE9uIDI4IE9jdCAyMDIwLCBhdCAwOTo0MywgR2VvcmdlIER1bmxhcCA8
Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IA0KPiANCj4+IE9uIE9jdCAy
OCwgMjAyMCwgYXQgODo0MyBBTSwgQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bh
cm0uY29tPiB3cm90ZToNCj4+IA0KPj4gDQo+PiANCj4+PiBPbiAyNyBPY3QgMjAyMCwgYXQgMjI6
NDQsIFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6DQo+
Pj4gDQo+Pj4gT24gTW9uLCAyNiBPY3QgMjAyMCwgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+
Pj4gV2hlbiBhIENvcnRleCBBNTcgcHJvY2Vzc29yIGlzIGFmZmVjdGVkIGJ5IENQVSBlcnJhdGEg
ODMyMDc1LCBhIGd1ZXN0DQo+Pj4+IG5vdCBpbXBsZW1lbnRpbmcgdGhlIHdvcmthcm91bmQgZm9y
IGl0IGNvdWxkIGRlYWRsb2NrIHRoZSBzeXN0ZW0uDQo+Pj4+IEFkZCBhIHdhcm5pbmcgZHVyaW5n
IGJvb3QgaW5mb3JtaW5nIHRoZSB1c2VyIHRoYXQgb25seSB0cnVzdGVkIGd1ZXN0cw0KPj4+PiBz
aG91bGQgYmUgZXhlY3V0ZWQgb24gdGhlIHN5c3RlbS4NCj4+Pj4gQW4gZXF1aXZhbGVudCB3YXJu
aW5nIGlzIGFscmVhZHkgZ2l2ZW4gdG8gdGhlIHVzZXIgYnkgS1ZNIG9uIGNvcmVzDQo+Pj4+IGFm
ZmVjdGVkIGJ5IHRoaXMgZXJyYXRhLg0KPj4+PiANCj4+Pj4gQWxzbyB0YWludCB0aGUgaHlwZXJ2
aXNvciBhcyB1bnNlY3VyZSB3aGVuIHRoaXMgZXJyYXRhIGFwcGxpZXMgYW5kDQo+Pj4+IG1lbnRp
b24gQ29ydGV4IEE1NyByMHAwIC0gcjFwMiBhcyBub3Qgc2VjdXJpdHkgc3VwcG9ydGVkIGluIFNV
UFBPUlQubWQNCj4+Pj4gDQo+Pj4+IFNpZ25lZC1vZmYtYnk6IEJlcnRyYW5kIE1hcnF1aXMgPGJl
cnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4NCj4+Pj4gLS0tDQo+Pj4+IFNVUFBPUlQubWQgICAgICAg
ICAgICAgICB8ICAxICsNCj4+Pj4geGVuL2FyY2gvYXJtL2NwdWVycmF0YS5jIHwgMTMgKysrKysr
KysrKysrKw0KPj4+PiAyIGZpbGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykNCj4+Pj4gDQo+
Pj4+IGRpZmYgLS1naXQgYS9TVVBQT1JULm1kIGIvU1VQUE9SVC5tZA0KPj4+PiBpbmRleCA1ZmJl
NWZjNDQ0Li5mN2EzYjA0NmIwIDEwMDY0NA0KPj4+PiAtLS0gYS9TVVBQT1JULm1kDQo+Pj4+ICsr
KyBiL1NVUFBPUlQubWQNCj4+Pj4gQEAgLTM4LDYgKzM4LDcgQEAgc3VwcG9ydGVkIGluIHRoaXMg
ZG9jdW1lbnQuDQo+Pj4+ICMjIyBBUk0gdjgNCj4+Pj4gDQo+Pj4+ICAgU3RhdHVzOiBTdXBwb3J0
ZWQNCj4+Pj4gKyAgICBTdGF0dXMsIENvcnRleCBBNTcgcjBwMCAtIHIxcDIsIG5vdCBzZWN1cml0
eSBzdXBwb3J0ZWQgKEVycmF0YSA4MzIwNzUpDQo+IA0KPiBJIHRoaW5rIHRoaXMgc2hvdWxkIGJl
Og0KPiANCj4gODzigJQNCj4gDQo+ICAgIFN0YXR1cywgQ29ydGV4IEE1NyByMHAwLXIxcDE6IFN1
cHBvcnRlZCwgbm90IHNlY3VyaXR5IHN1cHBvcnRlZA0KPiANCj4gRm9yIHRoZSBDb3J0ZXggQTU3
IHIwcDAgLSByMXAxLCBzZWUgRXJyYXRhIDgzMjA3NS4NCj4gDQo+IOKAlD44DQo+IA0KDQpPayBJ
IHdpbGwgZml4IHRoYXQuDQoNClRoYW5rcyBmb3IgdGhlIHJldmlldw0KDQpDaGVlcnMNCkJlcnRy
YW5kDQoNCj4gLUdlb3JnZQ0KDQo=

