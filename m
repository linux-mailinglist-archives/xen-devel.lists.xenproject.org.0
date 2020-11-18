Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D76372B7F45
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 15:24:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29857.59559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfOMr-0003cj-9C; Wed, 18 Nov 2020 14:23:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29857.59559; Wed, 18 Nov 2020 14:23:29 +0000
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
	id 1kfOMr-0003cJ-50; Wed, 18 Nov 2020 14:23:29 +0000
Received: by outflank-mailman (input) for mailman id 29857;
 Wed, 18 Nov 2020 14:23:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1xcH=EY=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kfOMq-0003cE-2z
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 14:23:28 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.87]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f0364196-03d9-4835-98ff-06ffb9e2d702;
 Wed, 18 Nov 2020 14:23:25 +0000 (UTC)
Received: from DB6PR0301CA0055.eurprd03.prod.outlook.com (2603:10a6:4:54::23)
 by DB6PR0802MB2421.eurprd08.prod.outlook.com (2603:10a6:4:a2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Wed, 18 Nov
 2020 14:23:23 +0000
Received: from DB5EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:54:cafe::6) by DB6PR0301CA0055.outlook.office365.com
 (2603:10a6:4:54::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Wed, 18 Nov 2020 14:23:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT028.mail.protection.outlook.com (10.152.20.99) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Wed, 18 Nov 2020 14:23:23 +0000
Received: ("Tessian outbound fcd5bc555ddc:v71");
 Wed, 18 Nov 2020 14:23:23 +0000
Received: from 0dd4d22bc1b7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D28CB4B1-262F-4807-BF5D-CDC9D87B7EE1.1; 
 Wed, 18 Nov 2020 14:23:15 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0dd4d22bc1b7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 18 Nov 2020 14:23:15 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3163.eurprd08.prod.outlook.com (2603:10a6:5:1e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Wed, 18 Nov
 2020 14:23:14 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::39b7:6f9f:d046:e737]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::39b7:6f9f:d046:e737%7]) with mapi id 15.20.3564.028; Wed, 18 Nov 2020
 14:23:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1xcH=EY=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kfOMq-0003cE-2z
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 14:23:28 +0000
X-Inumbo-ID: f0364196-03d9-4835-98ff-06ffb9e2d702
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown [40.107.8.87])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f0364196-03d9-4835-98ff-06ffb9e2d702;
	Wed, 18 Nov 2020 14:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TbKTD9sVBqkPxVLzxguLKQJDfD3FEPyOPei7Fc1v9gA=;
 b=eB0WGzRNssG97bf3Ktyf8+we4oKnzQQkL81AzfxEjXxE/ngwMe+1gme1IqzAv1FEPMhByf/YIqCTl5sA6XHANuvgsDVJodGuGL6q/MZqXlCR7JpyN3ycrYIW9JO3P1YMz3tNo+ohtoHewwLdlVU8vsGVE3MajBOBLZdpFY8UxyA=
Received: from DB6PR0301CA0055.eurprd03.prod.outlook.com (2603:10a6:4:54::23)
 by DB6PR0802MB2421.eurprd08.prod.outlook.com (2603:10a6:4:a2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Wed, 18 Nov
 2020 14:23:23 +0000
Received: from DB5EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:54:cafe::6) by DB6PR0301CA0055.outlook.office365.com
 (2603:10a6:4:54::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Wed, 18 Nov 2020 14:23:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT028.mail.protection.outlook.com (10.152.20.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Wed, 18 Nov 2020 14:23:23 +0000
Received: ("Tessian outbound fcd5bc555ddc:v71"); Wed, 18 Nov 2020 14:23:23 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0792166cbeb9e29d
X-CR-MTA-TID: 64aa7808
Received: from 0dd4d22bc1b7.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D28CB4B1-262F-4807-BF5D-CDC9D87B7EE1.1;
	Wed, 18 Nov 2020 14:23:15 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0dd4d22bc1b7.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 18 Nov 2020 14:23:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=docvWPS8rDYILzDjYUB13Jp8pDFE1RNr4VPC0fHOEolXe22Ohizbe29ZdDYQxxjqgk4PIimBe3VzNELV5ZLZ+v6HqGmdEsafrKDJBgbQr7T1PbJrpGIbrm0O/brcw1DhijefHl/fRKAlebZXM8pKbvi1g4qL6KZnHwd49en9km9OSWdD3S9AQQ8XpLprfvmfyXH4v+KLX36OUly4IMib7kWT57MpdN+d0NsqJ51sVKiNrCwkY1y0gEeC8BiLh0NaMRtQYtWv72aN/Nrk5f4eMc6UfJ32Ldcp9XGcQOFBk82jXDWU4K9eqFppuEUcEM8nEbA6PjbByshOBC7LpZcQ0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TbKTD9sVBqkPxVLzxguLKQJDfD3FEPyOPei7Fc1v9gA=;
 b=GX0tvQIxgqyzYjmp6U9F+esTMfQ06EGpRK8uJLIoiqGGFCkVzpDWAD/SWP/V8fk4CcrwO0JiEo7vIVagis+b3WN04Xo2wibSodA/v1nqCJAoIcm2P22pRJMRDz7X3izXPNJsoqYYJUSDh3N0QA+0dL/yXk14qmAwKb5BrfizkJVcmRQ/R+G5/g/JbRSysc4tRWEIpJCvM5bq+6aqc7odv6Q3Xvdt+oLD5mzuyczhu77RE7qcelNIlK8FzVOJPt2b7fk6vNUYjvW6C1VTNahEzUkOQhvxU7VrWcfxGanOb653iis8W8O+JQ5wpYy0YZzysUjsS+vdZZBdSvUJrLX2AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TbKTD9sVBqkPxVLzxguLKQJDfD3FEPyOPei7Fc1v9gA=;
 b=eB0WGzRNssG97bf3Ktyf8+we4oKnzQQkL81AzfxEjXxE/ngwMe+1gme1IqzAv1FEPMhByf/YIqCTl5sA6XHANuvgsDVJodGuGL6q/MZqXlCR7JpyN3ycrYIW9JO3P1YMz3tNo+ohtoHewwLdlVU8vsGVE3MajBOBLZdpFY8UxyA=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3163.eurprd08.prod.outlook.com (2603:10a6:5:1e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Wed, 18 Nov
 2020 14:23:14 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::39b7:6f9f:d046:e737]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::39b7:6f9f:d046:e737%7]) with mapi id 15.20.3564.028; Wed, 18 Nov 2020
 14:23:14 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>, "iwj@xenproject.org" <iwj@xenproject.org>,
	"julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] xen: EXPERT clean-up and introduce UNSUPPORTED
Thread-Topic: [PATCH v2] xen: EXPERT clean-up and introduce UNSUPPORTED
Thread-Index: AQHWvUT1dGbwa+YaakuAH1PIoRpzaanNk7GAgAABYYCAAF0WgA==
Date: Wed, 18 Nov 2020 14:23:13 +0000
Message-ID: <B35C22E2-FA6C-4F89-B364-35AFB2096E7C@arm.com>
References: <20201118005051.26115-1-sstabellini@kernel.org>
 <0A50C952-B9D8-44C3-9326-A0555B435693@arm.com>
 <c59a1540-2dd0-2813-9fe5-d5be2335fe9b@suse.com>
In-Reply-To: <c59a1540-2dd0-2813-9fe5-d5be2335fe9b@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.9.225.195]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f91ef9f2-cc36-458e-1458-08d88bcd81f0
x-ms-traffictypediagnostic: DB7PR08MB3163:|DB6PR0802MB2421:
X-Microsoft-Antispam-PRVS:
	<DB6PR0802MB2421D2FFB8BB5E283EF56A4A9DE10@DB6PR0802MB2421.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 QeBw4ZharD67m5X3H3ALK7ff7mD9pOryLT3VAyx1mUiUSFV0JjMmRFD3yKmr6tkkbjWIH2swABc4eWHtb3ULU+tGWrq0NIoIvCcYveXMjf+TPubQNSRPsahEgzgCrYn3e3k1sMFqe9o2zq8bx+0xvsdx16p6w+gRZuYvM6L7YmjX2FHICimhfdTTDO454Sej0KtG2TjqAo+zGOSl5z02QLYfmCgim8wo3//td06VMAN0WRo2v3LQu1keSLzFVWWKqmTMlrXHrzi2qCLg/pWsPp5B2S4WgtNcj3N2QddEvxHlwHOv05hR+VQabHYh2b+hNC6ci38NqKRTOJXPKNeRrA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(366004)(136003)(376002)(346002)(53546011)(6506007)(86362001)(2616005)(54906003)(76116006)(186003)(91956017)(6916009)(5660300002)(26005)(33656002)(316002)(478600001)(2906002)(6512007)(66556008)(64756008)(66446008)(66476007)(8676002)(66946007)(6486002)(8936002)(4326008)(36756003)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 opP+MMtlVuxs+4zszsgDUba3f6P3K8OJL4pgkJPdsY0KvvzrMWi6XwDmikb3AWBnN18hk3HpYSc6CrCPCSvtN1UULE4TdSICS+KwwSbELccf/OH3HDCXigTdOtvPuoc+ASKInV+jPR/tmn4B4A7OZq+4UKcTsRoWtYAOcQciE/iHDtsBKpAF9+v1NdrZ4Bi+3uBAFBkiyjBiQxhL9J25i1HRug/9b/a5V5LwsZZTFvAVAkmXVs9fDWR9ZJneVlT2R0Z+WbcbBr4Martez1K5tmONFU1WLJhGrk1yaHIhmtiQG2E7iDuUCM8ZWDZuwmr6PgOjZ6wh3IGmRm8dZ+07d3UxH9NJ/7xi5s820dKiMOm6IO6oEZQcTyF75on4CdCKwF1tuEO3RKA89PtTailFcn2F93K1OBxwHo9lk7rUOI1rfmnu8JG14+y2oVNZvAhgfAgqcn0bYNqE8gCra73kwqsZjvVINUgcUC1O/lRgwBmdRLGRqbIyjnahB7FfUYfyjw4eP7BeNkqCBbT4kgZ/1L7dTW5VTziRtn1uDxCNcE8C29y8QjKz1HWelAhfIq5Bm5QoRg8I5Jx5R62VsfNit9Wv5t5iWAtfiKS2Mm2cCPvDGuJom+dgq6TOr8F2HTg3m2PCFk+NSZiRhfiyTZ7cTw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <E89C7DDC2429D2478F718558492EFC0B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3163
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	efb20239-1378-4fb9-f34f-08d88bcd7c2a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	459HeJAOkRt8XIRYA2a1ZpNh30mohOikwH1OTwchN7Ecqs+VVSoIfbPyMR5ekPenJwlJKtvORetGSyoT6vNJ99IAwxCC3tZKtm9rDJbsVloDt22brQlaNH3bjUfowgG5yaSKR5bIQdWBuR85bmgM56QFoMeELETahaW4i12ece/BQiMUiCXFjmp059Pe3HbyK9qy0BXjlwL33nYMdK/cua/IrdnISSOhEMlyYveBVP//hSBIHwWeGDjhQuB2gSaotThpYfcBGVgmySc03ND3SjQca8V2Iae3iLR6tbqtj0Fe9rVmrjwiEyb/Ao/qZKYpY8g/zwd+ZJx12pc0UGSGL2rxAZ1dJsBTNEQEW+I++AigheDTHcPXcwp8BRMLNfnV9u5XPXwrBxKEMoBMQxtsfg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(39860400002)(396003)(46966005)(336012)(8676002)(82310400003)(26005)(47076004)(82740400003)(8936002)(54906003)(6506007)(53546011)(2616005)(186003)(316002)(33656002)(5660300002)(6512007)(36756003)(478600001)(107886003)(70206006)(81166007)(4326008)(70586007)(6486002)(6862004)(356005)(86362001)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 14:23:23.7406
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f91ef9f2-cc36-458e-1458-08d88bcd81f0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2421

SGkgSmFuLA0KDQo+IE9uIDE4IE5vdiAyMDIwLCBhdCAwODo1MCwgSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPiB3cm90ZToNCj4gDQo+IE9uIDE4LjExLjIwMjAgMDk6NDUsIEJlcnRyYW5k
IE1hcnF1aXMgd3JvdGU6DQo+Pj4gT24gMTggTm92IDIwMjAsIGF0IDAwOjUwLCBTdGVmYW5vIFN0
YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOg0KPj4+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9LY29uZmlnDQo+Pj4gKysrIGIveGVuL2FyY2gveDg2L0tjb25maWcNCj4+PiBAQCAt
MTAyLDggKzEwMiw4IEBAIGNvbmZpZyBIVk0NCj4+PiAJICBJZiB1bnN1cmUsIHNheSBZLg0KPj4+
IA0KPj4+IGNvbmZpZyBYRU5fU0hTVEsNCj4+PiAtCWJvb2wgIlN1cGVydmlzb3IgU2hhZG93IFN0
YWNrcyINCj4+PiAtCWRlcGVuZHMgb24gSEFTX0FTX0NFVF9TUyAmJiBFWFBFUlQNCj4+PiArCWJv
b2wgIlN1cGVydmlzb3IgU2hhZG93IFN0YWNrcyAoVU5TVVBQT1JURUQpIg0KPj4+ICsJZGVwZW5k
cyBvbiBIQVNfQVNfQ0VUX1NTICYmIFVOU1VQUE9SVEVEDQo+PiANCj4+IFRoaXMgb25lIGlzIG5v
dCBmb2xsb3dpbmcgdGhlIHN0YW5kYXJkIHNjaGVtZSB3aXRoIOKAnGlmIFVOU1VQUE9SVEVEIg0K
PiANCj4gVGhlcmUncyBubyBzdGFuZGFyZCBzY2hlbWUgaGVyZTogVGhlcmUncyBvbmUgY2FzZSB3
aGVyZSB0aGUgZW50aXJlDQo+IG9wdGlvbiBkZXBlbmRzIG9uIHNvbWUgb3RoZXIgc2V0dGluZyAo
ZS5nLiBVTlNVUFBPUlRFRCkgYW5kIGFub3RoZXINCj4gd2hlcmUganVzdCB0aGUgcHJvbXB0IChp
LmUuIGdpdmluZyB0aGUgdXNlciBhIGNob2ljZSkgZG9lcy4gVGhlDQo+IGRpZmZlcmVuY2UgYmVj
b21lcyBvYnZpb3VzIHdoZW4gdGhlIG9wdGlvbiBoYXMgYSBkZWZhdWx0IG90aGVyIHRoYW4NCj4g
Im5vIjogRGVzcGl0ZSB0aGUgaW52aXNpYmxlIHByb21wdCwgaXQgbWF5IGdldCB0dXJuZWQgb24u
IEluIHRoZQ0KPiBjYXNlIGhlcmUgKHNlcnZpbmcgYXMgYSBnb29kIGV4YW1wbGUpLCAiZGVmYXVs
dCB5IiB3b3VsZCBtZWFuIHRoZQ0KPiBmZWF0dXJlIGdldHMgdHVybmVkIG9uIHdoZW4gImlmIFVO
U1VQUE9SVEVEIiB3b3VsZCBiZSBhZGRlZCB0byB0aGUNCj4gcHJvbXB0IGFuZCB3aGVuIFVOU1VQ
UE9SVEVEIGlzIGl0c2VsZiBvZmYuDQo+IA0KDQpJdCBtYWtlcyBzZW5zZSwgdGhhbmtzIGZvciB0
aGUgZXhwbGFuYXRpb24NCg0KQmVydHJhbmQNCg0K

