Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EB128042C
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 18:45:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1497.4693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kO1hC-0004CA-1v; Thu, 01 Oct 2020 16:44:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1497.4693; Thu, 01 Oct 2020 16:44:42 +0000
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
	id 1kO1hB-0004Bk-Ur; Thu, 01 Oct 2020 16:44:41 +0000
Received: by outflank-mailman (input) for mailman id 1497;
 Thu, 01 Oct 2020 16:44:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e2ni=DI=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kO1hA-0004Ba-CO
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 16:44:40 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe09::61e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2071d726-3cb5-4dd9-b120-ff122ce20b7c;
 Thu, 01 Oct 2020 16:44:38 +0000 (UTC)
Received: from DB8PR06CA0011.eurprd06.prod.outlook.com (2603:10a6:10:100::24)
 by HE1PR0802MB2553.eurprd08.prod.outlook.com (2603:10a6:3:df::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Thu, 1 Oct
 2020 16:44:36 +0000
Received: from DB5EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:100:cafe::98) by DB8PR06CA0011.outlook.office365.com
 (2603:10a6:10:100::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32 via Frontend
 Transport; Thu, 1 Oct 2020 16:44:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT032.mail.protection.outlook.com (10.152.20.162) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Thu, 1 Oct 2020 16:44:35 +0000
Received: ("Tessian outbound a0bffebca527:v64");
 Thu, 01 Oct 2020 16:44:35 +0000
Received: from d293b38433e3.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4D25FE3E-4A3B-4DA2-8C17-EAF98402597B.1; 
 Thu, 01 Oct 2020 16:43:57 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d293b38433e3.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 01 Oct 2020 16:43:57 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB4539.eurprd08.prod.outlook.com (2603:10a6:10:cf::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.37; Thu, 1 Oct
 2020 16:43:56 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e%6]) with mapi id 15.20.3412.029; Thu, 1 Oct 2020
 16:43:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=e2ni=DI=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kO1hA-0004Ba-CO
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 16:44:40 +0000
X-Inumbo-ID: 2071d726-3cb5-4dd9-b120-ff122ce20b7c
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown [2a01:111:f400:fe09::61e])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 2071d726-3cb5-4dd9-b120-ff122ce20b7c;
	Thu, 01 Oct 2020 16:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SrbNnulJmbLMPf40lFql3k8274MNQgxPLPCyIdAU0FA=;
 b=XelxDLBJ/wR6pYJ9LljxcPZbxCTxEr/z3VT9tBNGE23Tn8djfXis9T2snpwHemZBhaIId3c9GpYfU+bkQ3c2nBTN3s9jPJdckByRv1yfHxl8udCJasqrOwszB/uAtUMJTs0Jvy8FIokClBojo4oSUDxeNtVyrxX/uOvu0lfPlwQ=
Received: from DB8PR06CA0011.eurprd06.prod.outlook.com (2603:10a6:10:100::24)
 by HE1PR0802MB2553.eurprd08.prod.outlook.com (2603:10a6:3:df::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Thu, 1 Oct
 2020 16:44:36 +0000
Received: from DB5EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:100:cafe::98) by DB8PR06CA0011.outlook.office365.com
 (2603:10a6:10:100::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32 via Frontend
 Transport; Thu, 1 Oct 2020 16:44:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT032.mail.protection.outlook.com (10.152.20.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Thu, 1 Oct 2020 16:44:35 +0000
Received: ("Tessian outbound a0bffebca527:v64"); Thu, 01 Oct 2020 16:44:35 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 52b8647ebbecfdd7
X-CR-MTA-TID: 64aa7808
Received: from d293b38433e3.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 4D25FE3E-4A3B-4DA2-8C17-EAF98402597B.1;
	Thu, 01 Oct 2020 16:43:57 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d293b38433e3.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 01 Oct 2020 16:43:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=itZ9GW0SvQR3N2PAsLOLnF66d1G6BFiZ66ARddBaR0z6Q1e7vugDmV6wewD+xudBjkfDmWGXxggNJKhf9OdJXWY6r2wjDel529PCK86KshPoPvQhg+5ZHbuskugUYXjVNfLzs6EhiwUyUqFGdvS81ZwkWeduH9K2nw4MhIcYDxtsNo2WgrWsm/frtnrfqPqI90VTE7DLMsbd0Ns23kNcWQ5fhOalXwoN7flVDL/HKvIjTxf793YaOrGqPrwPe73giIC4Om4VLBhUzpnLhV4uMFNo5yFZ+EIJme7btIhRNDm5a+8rOS60bnUfXNZN/VeDl3iSx4x+vyWR2xNmQE7Ncg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SrbNnulJmbLMPf40lFql3k8274MNQgxPLPCyIdAU0FA=;
 b=EHFQraqYwLXj8ewX9pzpMJFGIyzY7tSDIDZGhpNptagAcYouUJHTitfP/lVTAh96rb0/oLG5h8Uk8vOhkJqdyT8SwnrX3x2EzEBpFnDOje+VcIqGoHX5dB4VgTgh8Teu5asWBiHT6GOLOV5AjkcSIt70yv25Q40zv5WAtWTEXJCrRFqgyQRfH6yBez7E6R+dLVoRNUpQuLlQ8TcJ6I3SdRKTvw+A8JJcG+ebgaLJe4x2WDWqvjyiZG0TsFmpZHgHOMIB4KgitH8JCpY36E+wk/AeR/13xnIsKp6XgD4CgNqO1sQq32icP2bM64MBYkWMZmxX4q4cRYFp7+/ZnXbzkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SrbNnulJmbLMPf40lFql3k8274MNQgxPLPCyIdAU0FA=;
 b=XelxDLBJ/wR6pYJ9LljxcPZbxCTxEr/z3VT9tBNGE23Tn8djfXis9T2snpwHemZBhaIId3c9GpYfU+bkQ3c2nBTN3s9jPJdckByRv1yfHxl8udCJasqrOwszB/uAtUMJTs0Jvy8FIokClBojo4oSUDxeNtVyrxX/uOvu0lfPlwQ=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB4539.eurprd08.prod.outlook.com (2603:10a6:10:cf::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.37; Thu, 1 Oct
 2020 16:43:56 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e%6]) with mapi id 15.20.3412.029; Thu, 1 Oct 2020
 16:43:56 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Ping: [PATCH 0/6] tools/include: adjustments to the population of
 xen/
Thread-Topic: Ping: [PATCH 0/6] tools/include: adjustments to the population
 of xen/
Thread-Index: AQHWh2uA51KvLc+DNUCjQhMwaVDUdqmDCd+AgAAHWYCAAAQLgA==
Date: Thu, 1 Oct 2020 16:43:55 +0000
Message-ID: <6B9403A3-66DC-4A69-8006-096420649768@arm.com>
References: <2a9f86aa-9104-8a45-cd21-72acd693f924@suse.com>
 <673fdaf3-e770-67c8-0a6c-6cdec79df38a@suse.com>
 <9F53B61A-5A50-46DD-BF5B-75F48C91FCFC@arm.com>
In-Reply-To: <9F53B61A-5A50-46DD-BF5B-75F48C91FCFC@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f9174eec-a764-4833-1833-08d8662947c2
x-ms-traffictypediagnostic: DBBPR08MB4539:|HE1PR0802MB2553:
X-Microsoft-Antispam-PRVS:
	<HE1PR0802MB25539A4614543F9B8553DF439D300@HE1PR0802MB2553.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 4DGUnJQN2E9DaXkkVoVxcOzGRCbuy4giyChDqvujakDR6pseJ2z0b387ZkjYDhzY/RpLEz7vR7RNuWUw1zXtFE/Eb7eJw3V0utBJx/XVgPISg4o+0a+jwd8bInk7tVVQ0FciIwvfCcmGwUPJHt9GECVZFFKhJwvj40SrFX4abAgFfd9yfC1oja0VYrNOrBH6xfyehPZiTn3eynMRiYzSSvKRuCuj8HUHX+dkjWRRRXXycqMPXOJnjV29Pu4NLgXtShNQfMnCr/6J3nnKPAvxfVGz/Wq7gIKO0L6Wo94dQs2SGq0ZiMFymYoI6TvO3uNT
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(366004)(346002)(376002)(136003)(186003)(8936002)(4326008)(6486002)(36756003)(86362001)(66556008)(64756008)(71200400001)(54906003)(8676002)(478600001)(5660300002)(316002)(26005)(76116006)(2906002)(2616005)(66476007)(66946007)(53546011)(66446008)(91956017)(6506007)(6916009)(33656002)(6512007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 KOAFfol02fgDeblrR+kzGMkKtyRSZ7ddE4jsH5riMvP793/HhB9gzR4RRBsaLPjuF+lDVCF6XcteqI33HiRpvtUUD3v34n7bULysfN7s4fQ1j+nelwzO2qP7+FNIj8SKazsWS0ymLC1M5pdUAjrSLXp+GZVo1QB1TyOnTmZsm8JGP59FxON9KYbhHsxw6HnkMgr79jDDfCBpUv1Jfnz8cYlXxSqh/mWRmFPBhTP6hH/ChSY0UNg6p0pFNbXOLTvTWSqIiGuaJF8e9vaPUcI1P/Numw+FriNB17m6FIXKYV2NOvw2KpHj4W8mFJOtsAUb0YdVaWv1zuqTQNjdD741pK0MNHBrwVxeQxJBo6H+R0m9W2rpxwaenyqW8c31Una1UkLmM1VywTBX7T8YyCIi0i/s5r3jbh/1xwdEWKTdNgUTg0pbug+J9YqJMRDVTSWIT385dg6y7merYMfhQuyHW0bYGmjPqhWrD6fjeRgssKoEOS+V/2izE5YKlIZEw6jfqTSNupcEU1aY9Ig1n4DgHTfGyemIo+3Fio0btNSpWlFVVbUotrgb8Y0Ld0/RMxQw2HNhfheWXThLRDI2gUacTH/7ELpFwO02u/upK2wvQzyWBP4zNcsydg/tYPLwMl79ns7oF6GN3hvDQ7ZeRZEEiA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <027263E1EA339B44A92D54784E09208B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4539
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	93b4e7f8-95ad-4be8-3f2c-08d866293032
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	G1ivB3ETCJuxSo1zILCYS7YQ+OIZyRzE+vXHZ0sdhdy35qA0VK6ClTdG0ozJHlvsX9zzTkZsXQp2FRKnR3nMOvnWhOQNdriG3K79AMNJ1fhReK/mzcKt4MdBHur7oy3fc6NPILbgYqc2dU1nRSQYdjeAdt/R/NfhVL+elcNmE3D0ExXshB2OecI6rWalnoB2/YfKcA3HFhcNO+rGQouY9xuesD8uv+tE3+hZloWbIBDxMmAbW2mbvQgWXyqzm40Qlg56wDMXup+9ZfsIAq8QZ35aEZ9IOHWzJ2f3qNNxFcXZaan5LlQSfeFA9KN23iNulehYuQ3mqgT9l7H66VlZX+HZs5/4Cbxggxc2+WDQvnynCmPmTzaay51l+lBgJOGCJdLUuuwZ8d1Y5IGa8Z/nUw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(39850400004)(136003)(396003)(376002)(46966005)(4326008)(6862004)(8936002)(6506007)(5660300002)(82310400003)(356005)(81166007)(478600001)(53546011)(6512007)(70206006)(316002)(6486002)(2616005)(336012)(47076004)(36756003)(33656002)(8676002)(86362001)(70586007)(54906003)(26005)(186003)(82740400003)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2020 16:44:35.6450
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9174eec-a764-4833-1833-08d8662947c2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2553

SGksDQoNCj4gT24gMSBPY3QgMjAyMCwgYXQgMTc6MjksIEJlcnRyYW5kIE1hcnF1aXMgPGJlcnRy
YW5kLm1hcnF1aXNAYXJtLmNvbT4gd3JvdGU6DQo+IA0KPiBIaSBKYW4sDQo+IA0KPj4gT24gMSBP
Y3QgMjAyMCwgYXQgMTc6MDMsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6
DQo+PiANCj4+IE9uIDEwLjA5LjIwMjAgMTQ6MDksIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IFdo
aWxlIGxvb2tpbmcgYXQgd2hhdCBpdCB3b3VsZCB0YWtlIHRvIG1vdmUgYXJvdW5kIGxpYmVsZi8N
Cj4+PiBpbiB0aGUgaHlwZXJ2aXNvciBzdWJ0cmVlLCBJJ3ZlIHJ1biBpbnRvIHRoaXMgcnVsZSwg
d2hpY2ggSQ0KPj4+IHRoaW5rIGNhbiBkbyB3aXRoIGEgZmV3IGltcHJvdmVtZW50cyBhbmQgc29t
ZSBzaW1wbGlmaWNhdGlvbi4NCj4+PiANCj4+PiAxOiBhZGp1c3QgcG9wdWxhdGlvbiBvZiBhY3Bp
Lw0KPj4+IDI6IGZpeCAoZHJvcCkgZGVwZW5kZW5jaWVzIG9mIHdoZW4gdG8gcG9wdWxhdGUgeGVu
Lw0KPj4+IDM6IGFkanVzdCBwb3B1bGF0aW9uIG9mIHB1YmxpYyBoZWFkZXJzIGludG8geGVuLw0K
Pj4+IDQ6IHByb3Blcmx5IGluc3RhbGwgQXJtIHB1YmxpYyBoZWFkZXJzDQo+Pj4gNTogYWRqdXN0
IHg4Ni1zcGVjaWZpYyBwb3B1bGF0aW9uIG9mIHhlbi8NCj4+PiA2OiBkcm9wIHJlbWFpbmluZyAt
ZiBmcm9tIGxuIGludm9jYXRpb25zDQo+PiANCj4+IE1heSBJIGFzayBmb3IgYW4gYWNrIG9yIG90
aGVyd2lzZSBoZXJlPw0KPiANCj4gVGhpcyBpcyBnb2luZyB0aGUgcmlnaHQgd2F5IGJ1dCB3aXRo
IHRoaXMgc2VyaWUgKG9uIHRvcCBvZiBjdXJyZW50IHN0YWdpbmcNCj4gc3RhdHVzKSwgSSBoYXZl
IGEgY29tcGlsYXRpb24gZXJyb3IgaW4gWW9jdG8gd2hpbGUgY29tcGlsaW5nIHFlbXU6DQo+IElu
IGZpbGUgaW5jbHVkZWQgZnJvbSAvbWVkaWEvZXh0ZW5kLWRyaXZlL2Jlcm1hcjAxL0RldmVsb3Bt
ZW50L3hlbi1kZXYveW9jdG8tYnVpbGQvYnVpbGQvZG9tMC1mdnAucHJqL3RtcC93b3JrL2FybXY4
YS1wb2t5LWxpbnV4L3FlbXUvNS4xLjAtcjAvcmVjaXBlLXN5c3Jvb3QvdXNyL2luY2x1ZGUveGVu
Z3Vlc3QuaDoyNSwNCj4gfCAgICAgICAgICAgICAgICAgIGZyb20gL21lZGlhL2V4dGVuZC1kcml2
ZS9iZXJtYXIwMS9EZXZlbG9wbWVudC94ZW4tZGV2L3lvY3RvLWJ1aWxkL2J1aWxkL2RvbTAtZnZw
LnByai90bXAvd29yay9hcm12OGEtcG9reS1saW51eC9xZW11LzUuMS4wLXIwL3FlbXUtNS4xLjAv
aHcvaTM4Ni94ZW4veGVuX3BsYXRmb3JtLmM6NDE6DQo+IHwgL21lZGlhL2V4dGVuZC1kcml2ZS9i
ZXJtYXIwMS9EZXZlbG9wbWVudC94ZW4tZGV2L3lvY3RvLWJ1aWxkL2J1aWxkL2RvbTAtZnZwLnBy
ai90bXAvd29yay9hcm12OGEtcG9reS1saW51eC9xZW11LzUuMS4wLXIwL3JlY2lwZS1zeXNyb290
L3Vzci9pbmNsdWRlL3hlbmN0cmxfZG9tLmg6MTk6MTA6IGZhdGFsIGVycm9yOiB4ZW4vbGliZWxm
L2xpYmVsZi5oOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5DQo+IHwgICAgMTkgfCAjaW5jbHVk
ZSA8eGVuL2xpYmVsZi9saWJlbGYuaD4NCj4gfCAgICAgICB8ICAgICAgICAgIF5+fn5+fn5+fn5+
fn5+fn5+fn5+fg0KPiB8IGNvbXBpbGF0aW9uIHRlcm1pbmF0ZWQuDQo+IHwgL21lZGlhL2V4dGVu
ZC1kcml2ZS9iZXJtYXIwMS9EZXZlbG9wbWVudC94ZW4tZGV2L3lvY3RvLWJ1aWxkL2J1aWxkL2Rv
bTAtZnZwLnByai90bXAvd29yay9hcm12OGEtcG9reS1saW51eC9xZW11LzUuMS4wLXIwL3FlbXUt
NS4xLjAvcnVsZXMubWFrOjY5OiByZWNpcGUgZm9yIHRhcmdldCAnaHcvaTM4Ni94ZW4veGVuX3Bs
YXRmb3JtLm/igJkgZmFpbGVkDQo+IA0KPiBYZW4gaXMgdXNpbmcgeGVuY3RybF9kb20uaCB3aGlj
aCBuZWVkIHRoZSBsaWJlbGYuaCBoZWFkZXIgZnJvbSB4ZW4uDQoNCkFjdHVhbGx5IHRoaXMgaXMg
bm90IGNvbWluZyBmcm9tIHlvdXIgc2VyaWUgYW5kIHRoaXMgaXMgYWN0dWFsbHkgYSBwcm9ibGVt
IGFscmVhZHkgcHJlc2VudCBvbiBtYXN0ZXIuDQoNClJlZ2FyZHMNCkJlcnRyYW5kDQoNCg==

