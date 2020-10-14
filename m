Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DB628E026
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 13:59:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6678.17627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSfQJ-0003ol-Cd; Wed, 14 Oct 2020 11:58:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6678.17627; Wed, 14 Oct 2020 11:58:27 +0000
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
	id 1kSfQJ-0003oM-9R; Wed, 14 Oct 2020 11:58:27 +0000
Received: by outflank-mailman (input) for mailman id 6678;
 Wed, 14 Oct 2020 11:58:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JG+m=DV=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kSfQH-0003oH-AB
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 11:58:25 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.49]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 81cb6f32-f4d8-41ca-8a95-5de3b6ee41d0;
 Wed, 14 Oct 2020 11:58:24 +0000 (UTC)
Received: from MR2P264CA0015.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:1::27) by
 AM0PR08MB4241.eurprd08.prod.outlook.com (2603:10a6:208:140::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.24; Wed, 14 Oct
 2020 11:58:22 +0000
Received: from VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:1:cafe::d9) by MR2P264CA0015.outlook.office365.com
 (2603:10a6:500:1::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21 via Frontend
 Transport; Wed, 14 Oct 2020 11:58:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT054.mail.protection.outlook.com (10.152.19.64) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.21 via Frontend Transport; Wed, 14 Oct 2020 11:58:21 +0000
Received: ("Tessian outbound e6c55a0b9ba9:v64");
 Wed, 14 Oct 2020 11:58:20 +0000
Received: from 3086894c57e0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DA500688-6C45-434D-B3E8-3DBB84B5BA40.1; 
 Wed, 14 Oct 2020 11:58:15 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3086894c57e0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 14 Oct 2020 11:58:15 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0801MB1910.eurprd08.prod.outlook.com (2603:10a6:4:75::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Wed, 14 Oct
 2020 11:58:14 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3477.021; Wed, 14 Oct 2020
 11:58:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=JG+m=DV=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kSfQH-0003oH-AB
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 11:58:25 +0000
X-Inumbo-ID: 81cb6f32-f4d8-41ca-8a95-5de3b6ee41d0
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown [40.107.22.49])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 81cb6f32-f4d8-41ca-8a95-5de3b6ee41d0;
	Wed, 14 Oct 2020 11:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXDvGh9JfxV1PiZF6bms5+G/a1l1NrVGtErsneUHUUs=;
 b=vrOWViof/DjkMJGQHxiNSHc/YzXK5x2ftCEO4lFjpIKHI7L3knGfXtBl5O+QIMniylzuBHW/86NNHGKeT+srYlmjbqT0yXXueVlPnpSdBpgy++uMzMtwXB/G743yyA9jxu8izYNzpXXjdFutSLhc37rfrwH0OxrAwwsMA5LMAkM=
Received: from MR2P264CA0015.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:1::27) by
 AM0PR08MB4241.eurprd08.prod.outlook.com (2603:10a6:208:140::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.24; Wed, 14 Oct
 2020 11:58:22 +0000
Received: from VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:1:cafe::d9) by MR2P264CA0015.outlook.office365.com
 (2603:10a6:500:1::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21 via Frontend
 Transport; Wed, 14 Oct 2020 11:58:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT054.mail.protection.outlook.com (10.152.19.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.21 via Frontend Transport; Wed, 14 Oct 2020 11:58:21 +0000
Received: ("Tessian outbound e6c55a0b9ba9:v64"); Wed, 14 Oct 2020 11:58:20 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 81ddd6b24c47d92e
X-CR-MTA-TID: 64aa7808
Received: from 3086894c57e0.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id DA500688-6C45-434D-B3E8-3DBB84B5BA40.1;
	Wed, 14 Oct 2020 11:58:15 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3086894c57e0.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 14 Oct 2020 11:58:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lELGnCdbQfB583zZp3Abo5qj0z7qT7k9wuhKuaxc5Pws5GUpmDoI0F7+GjesBfxSdiB0pANigyQ5/GKz5N+dSdpejnA0x8QKVV4Vyn+958Mq2TBaSGeeKyth2eNyChhKXRdOe4E3jp4m9beZztdkhJ26UWE47PJg6NsdrIgXt0S8plW5ALiHoBKFjbMA7Q81/Vf29y74vDS0Gc3hsiS6EsaeLmQDMszdKUwViikLBWtS5cOywT5prL/bXr6OI5IgTuI15M8GmXy56hVKIS5FDPhix7PZfC7OoRtQd8P9jOE1O54zm4m+uasrbTMziNZ/erRi9eXAJLzuEPymXvclNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXDvGh9JfxV1PiZF6bms5+G/a1l1NrVGtErsneUHUUs=;
 b=IQl7/H2BBklCEUQb31ltTNoW7O8bQPM6/AIOSDkFI+dze8nXtmWtbnVEKgSrUK8JAZAsVg66lkvX0P4Ql867hZyaTcoEPWqWdhsjiyFVtscNe89tIluWPHEn59pU2T3P8TNU0NXrHgR/JrneoHVeS1ljoqZcfwvrZ/6a2nvk6A24wD5ZYm9zVJicP5VahdUVu8KBim0ixHh+pets898yAEvfvpfiBXTOeNvrvu9mki66Mhe2xWh4pWSi0ulEK/5poLbfVf9Z0AYZHtfgxCiV1V/d9eFEQcXk2f63q/kH0yWgD4rA3hfg4Nse3mHOhZ+OlJNHankk3KLstvw0gV17/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXDvGh9JfxV1PiZF6bms5+G/a1l1NrVGtErsneUHUUs=;
 b=vrOWViof/DjkMJGQHxiNSHc/YzXK5x2ftCEO4lFjpIKHI7L3knGfXtBl5O+QIMniylzuBHW/86NNHGKeT+srYlmjbqT0yXXueVlPnpSdBpgy++uMzMtwXB/G743yyA9jxu8izYNzpXXjdFutSLhc37rfrwH0OxrAwwsMA5LMAkM=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0801MB1910.eurprd08.prod.outlook.com (2603:10a6:4:75::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Wed, 14 Oct
 2020 11:58:14 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3477.021; Wed, 14 Oct 2020
 11:58:13 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] tools/xenmpd: Fix gcc10 snprintf warning
Thread-Topic: [PATCH] tools/xenmpd: Fix gcc10 snprintf warning
Thread-Index: AQHWoheQbJERqQUoxES88omBLvhPP6mW73mAgAAO7YA=
Date: Wed, 14 Oct 2020 11:58:13 +0000
Message-ID: <23791043-A851-4DF2-A3B7-23D89EEDCE41@arm.com>
References:
 <0ade4264c537819c3dd45179fcea2723df66b045.1602672245.git.bertrand.marquis@arm.com>
 <74625fd9-f2a3-14be-714a-3cfb705434cc@xen.org>
In-Reply-To: <74625fd9-f2a3-14be-714a-3cfb705434cc@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 83df29aa-bdcb-4a12-b3b0-08d8703872b0
x-ms-traffictypediagnostic: DB6PR0801MB1910:|AM0PR08MB4241:
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB424194F3A7A5F3411AF24D7D9D050@AM0PR08MB4241.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 aO4nZAR5JfXQn0BCdEvkCtWfofxfZusZaS7pM3+CEDgJfcORpHpnlaHLSubqAQ3l02vbKbYiFXBBiD9aJHrm3ab4hvRPeuFgpx7eSil/+Z25/9uuqAQpCo1lV/n6L7nWcNqJGq8gjnsMDD8Ud3eOtu7MvALOA8aJBDUBC01Dsq0rFpN/TN1lPLtvowCzpKtohUByOv58WYyUrpNXRboSD3RmYbou0GhCOZbH/s5QeSewtTv4/hcnOBvL8Gf1VsumGCF0JMoHM2m13uaf/6rnPaH/ySUiTDfXBFYORBmRWN7s63/DID9unqfoQnQPlh7zUZqv3mxuiiCI/Ie3HvQU4g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(396003)(376002)(39860400002)(6486002)(186003)(316002)(54906003)(6916009)(2616005)(64756008)(2906002)(4326008)(66446008)(66476007)(66556008)(6512007)(33656002)(76116006)(91956017)(83380400001)(66946007)(86362001)(71200400001)(478600001)(36756003)(5660300002)(8936002)(26005)(53546011)(6506007)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 4sqiHFjI6YOCdWwFlZCnYDOcIdsRB8JI2ktG9bHwzAF4MH1LDaR5LmvlJBC2ZN+Qche0bph4fdF5WxribbhckT8NYFQEJrvGMUiKSDL/YjZh/Y5Mr0F0pCpl57rJI5vDzaCOxinCwc/0iS/hKO3L3JYKiGVCEsQrogsl8pwoCBJSs4zPnHaGPC20GIGHYH7vaf7vf9yxE1yip+To8bpqmDDLtCn554NBLatLi4wORQVoVUu6CXAesggOW/8HIlWHWGz2o8zRcP6/nupBgLi51YBl2rekNIoxQvrr5dggv9/DksZMg3EMMOijfyFx8SxmrGEEyJ+z/BGGRzFT0nejf5xvAUsytAAmvC96Ij3FqVuFC9rjTh4TsharkcRbiJ8CZaYF1AcWxy1oi462v5x2Owb63HvzaKic1Lh1IeqwfVoMeIKDNPtrlyffD0b2shTKCbs9TNY00dUHZqcX/ddOjGLn5RFhxJFw4z8HzQkKtS0AOpUL8W2XiU28yZbZJlzVMqLjRdTsLbuZ2HKYP6KSQvdbkiobekWK6YVYsSyiIK8j1KZV9QMPPn9znoYnmHtuFzPthEQdALpw/Hb/A9dZ+fUEBFSlKiE4UmC6FZlR7OJXKOM1jksmCheUU1i+WRHKz88Qe6/DPtsGTCaaoYoa+w==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <45AC6BD786DE984EAD4848443DC7ABBB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1910
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d5918a61-fd7d-4f14-1c08-08d870386e01
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Kbp7e0Vq+uy2bLpvXRfaNMT+gBI9HZ8P6MePgrA1EqCnsGvhNelhC4CU+LFBEyBZB+UV/NM9PD4F/RVZJ5vbxgYDiCwrDzUen3w8BXNSyEMoywbatEgOmHUWojxRuqZuNrB/aahrRzOXJs8jmxd6LCjG/2iP1yjp7pg8Ql8odVZWrmEoBuHlZ8KREkYuaSA4K+hkwr79QvdTF1WFZHhSXxBjBFSv9IA4lOdWP6LrXxeV/BEM1qVmtJhQ1kry/QOoBnLmQILcJBYhG75pOBfi0dTBn3tmqWrvKNkB2ccLxMf4fI+Qc6J2jZ9h2E6FQOILWW0MZloR6qVpXpRCc1VxL2YXNQIDA9sx9MtH7SEkFwdLJJVkWYt5nHkAqFu/6icD3O9jQCMIvocd+gj2Kqd0uA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(39860400002)(346002)(46966005)(2616005)(4326008)(336012)(2906002)(6512007)(70206006)(478600001)(6862004)(356005)(186003)(6486002)(70586007)(36756003)(33656002)(81166007)(26005)(86362001)(6506007)(53546011)(82310400003)(8936002)(5660300002)(54906003)(47076004)(8676002)(83380400001)(316002)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2020 11:58:21.6468
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83df29aa-bdcb-4a12-b3b0-08d8703872b0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4241

Hi Julien,

> On 14 Oct 2020, at 12:04, Julien Grall <julien@xen.org> wrote:
>=20
> Hi,
>=20
> On 14/10/2020 11:47, Bertrand Marquis wrote:
>> Add a check for snprintf return code and ignore the entry if we get an
>> error. This should in fact never happen and is more a trick to make gcc
>> happy and prevent compilation errors.
>> This is solving the gcc warning:
>> xenpmd.c:92:37: error: '%s' directive output may be truncated writing
>> between 4 and 2147483645 bytes into a region of size 271
>> [-Werror=3Dformat-truncation=3D]
>=20
> IIRC, this is only affecting GCC when building for Arm32 *and* when the o=
ptimizer is enabled. If so, it would be good to add more details in the com=
mit message.

I can confirm this is the only build catching it on my side.

I will modify the commit message to say that the problem was encountered on=
 arm32 build with the optimizer enabled.

>=20
> I would also suggest to link to the bug reported on Debian.

I will add it to the commit message.

Cheers
Bertrand

>=20
> Cheers,
>=20
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>>  tools/xenpmd/xenpmd.c | 9 +++++++--
>>  1 file changed, 7 insertions(+), 2 deletions(-)
>> diff --git a/tools/xenpmd/xenpmd.c b/tools/xenpmd/xenpmd.c
>> index 35fd1c931a..12b82cf43e 100644
>> --- a/tools/xenpmd/xenpmd.c
>> +++ b/tools/xenpmd/xenpmd.c
>> @@ -102,6 +102,7 @@ FILE *get_next_battery_file(DIR *battery_dir,
>>      FILE *file =3D 0;
>>      struct dirent *dir_entries;
>>      char file_name[284];
>> +    int ret;
>>            do
>>      {
>> @@ -111,11 +112,15 @@ FILE *get_next_battery_file(DIR *battery_dir,
>>          if ( strlen(dir_entries->d_name) < 4 )
>>              continue;
>>          if ( battery_info_type =3D=3D BIF )
>> -            snprintf(file_name, sizeof(file_name), BATTERY_INFO_FILE_PA=
TH,
>> +            ret =3D snprintf(file_name, sizeof(file_name), BATTERY_INFO=
_FILE_PATH,
>>                       dir_entries->d_name);
>>          else
>> -            snprintf(file_name, sizeof(file_name), BATTERY_STATE_FILE_P=
ATH,
>> +            ret =3D snprintf(file_name, sizeof(file_name), BATTERY_STAT=
E_FILE_PATH,
>>                       dir_entries->d_name);
>> +        /* This should not happen but is needed to pass gcc checks */
>> +        if (ret < 0)
>> +            continue;
>> +        file_name[sizeof(file_name) - 1] =3D '\0';
>>          file =3D fopen(file_name, "r");
>>      } while ( !file );
>> =20
>=20
> Cheers,
>=20
> --=20
> Julien Grall


