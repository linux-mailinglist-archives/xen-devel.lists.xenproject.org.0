Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F72280418
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 18:39:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1486.4681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kO1bS-0003HU-Bt; Thu, 01 Oct 2020 16:38:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1486.4681; Thu, 01 Oct 2020 16:38:46 +0000
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
	id 1kO1bS-0003H5-8R; Thu, 01 Oct 2020 16:38:46 +0000
Received: by outflank-mailman (input) for mailman id 1486;
 Thu, 01 Oct 2020 16:38:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e2ni=DI=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kO1bQ-0003H0-QT
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 16:38:44 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7d00::608])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5c3e856f-c6fe-4619-8db5-2c049ffa6953;
 Thu, 01 Oct 2020 16:38:43 +0000 (UTC)
Received: from DB6PR0301CA0099.eurprd03.prod.outlook.com (2603:10a6:6:30::46)
 by AM6PR08MB3798.eurprd08.prod.outlook.com (2603:10a6:20b:82::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34; Thu, 1 Oct
 2020 16:38:41 +0000
Received: from DB5EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:30:cafe::be) by DB6PR0301CA0099.outlook.office365.com
 (2603:10a6:6:30::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32 via Frontend
 Transport; Thu, 1 Oct 2020 16:38:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT020.mail.protection.outlook.com (10.152.20.134) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Thu, 1 Oct 2020 16:38:40 +0000
Received: ("Tessian outbound 195a290eb161:v64");
 Thu, 01 Oct 2020 16:38:40 +0000
Received: from 1673e14c3b73.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3356F7C2-AE44-40E9-BD56-CDD3613DEF83.1; 
 Thu, 01 Oct 2020 16:38:03 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1673e14c3b73.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 01 Oct 2020 16:38:03 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3161.eurprd08.prod.outlook.com (2603:10a6:5:1d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15; Thu, 1 Oct
 2020 16:38:00 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e%6]) with mapi id 15.20.3412.029; Thu, 1 Oct 2020
 16:38:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=e2ni=DI=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kO1bQ-0003H0-QT
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 16:38:44 +0000
X-Inumbo-ID: 5c3e856f-c6fe-4619-8db5-2c049ffa6953
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown [2a01:111:f400:7d00::608])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 5c3e856f-c6fe-4619-8db5-2c049ffa6953;
	Thu, 01 Oct 2020 16:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WS/JUmBvufyqprbu3/XyDf6TeHR5WPzwrs0d6RgMQXU=;
 b=1KYgnpf6wMTYNF/9qsa52CKDVFcmKTkXtZI7CMNwxwAl/AYK7z8DwHZmbyqlkAMjvRqmM8WRbVNlres6Y8Xq6JjacL1J87stQKHw9XqwpNDqxOqtmVE9tWT64MoYR4aSrqc58n9fZzpQGiAlM/bFyq08Y6tK8XqJOcNtxLEzBdk=
Received: from DB6PR0301CA0099.eurprd03.prod.outlook.com (2603:10a6:6:30::46)
 by AM6PR08MB3798.eurprd08.prod.outlook.com (2603:10a6:20b:82::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34; Thu, 1 Oct
 2020 16:38:41 +0000
Received: from DB5EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:30:cafe::be) by DB6PR0301CA0099.outlook.office365.com
 (2603:10a6:6:30::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32 via Frontend
 Transport; Thu, 1 Oct 2020 16:38:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT020.mail.protection.outlook.com (10.152.20.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Thu, 1 Oct 2020 16:38:40 +0000
Received: ("Tessian outbound 195a290eb161:v64"); Thu, 01 Oct 2020 16:38:40 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 810c34f65d629049
X-CR-MTA-TID: 64aa7808
Received: from 1673e14c3b73.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3356F7C2-AE44-40E9-BD56-CDD3613DEF83.1;
	Thu, 01 Oct 2020 16:38:03 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1673e14c3b73.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 01 Oct 2020 16:38:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TPUC2N42dRJznP9mQ0Y4ORsTEujOGCTZONbqSZ2nrPghdKrBSq2ujVdOoZb/lvK7n/ycD8ArvSLBtQ68BTYPQvKA3caVaPerELeCg0LLzMjoOHwg2ji6bUTw/YgU7+iuLYpXFqDTvpx8ezzLDfiuBabPBoCm0n6xveXPGsWFE6TSEGlOFY2AD9oGkhWYE15Uk5ZQwhHS5qj5cjTFzwftIfKuNgmu7tn/yJrFqN6e4G/H+JwV1ciImf/aX8QwuyO39o7My2eXtxw1yY82eXF5Z++UcR9AHfsBUohZJGYNVmRA3TXLWS/YJ0SLtoVSbRUbPbQGBbQ3UZAAnb/EvZaQZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WS/JUmBvufyqprbu3/XyDf6TeHR5WPzwrs0d6RgMQXU=;
 b=ZUfWhZZ2K8LgLdpCCzY+gHKaFmxhrTQz0V3HeaSsnY99NSTEhWRsggJQsXTWvQNp60ruTzqVLLZVQz1RkxtMCe5Krs7AOz0Wbkd7WRV2LIj2eV51SAci44CEYXMGO+JxCt8ofmGht6PwU9D84+PorkSt78hZ+pbM6aFADGJESKe449ySOGSBTQlGy6qnSXKRQNuiFkz1Jl+Duazaxn2pY8PL2w7woqzfAeo2g44ihzbyTdUt95erCnBSrsUb2qo6myjAicRIhy02ZpVH6CRwdQFHmL61WeObMkBKsVs1ZlbAA6RbNJZ0rYnjURqqlBjcIu2krOM7jxNkpFkNFWHagg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WS/JUmBvufyqprbu3/XyDf6TeHR5WPzwrs0d6RgMQXU=;
 b=1KYgnpf6wMTYNF/9qsa52CKDVFcmKTkXtZI7CMNwxwAl/AYK7z8DwHZmbyqlkAMjvRqmM8WRbVNlres6Y8Xq6JjacL1J87stQKHw9XqwpNDqxOqtmVE9tWT64MoYR4aSrqc58n9fZzpQGiAlM/bFyq08Y6tK8XqJOcNtxLEzBdk=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3161.eurprd08.prod.outlook.com (2603:10a6:5:1d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15; Thu, 1 Oct
 2020 16:38:00 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e%6]) with mapi id 15.20.3412.029; Thu, 1 Oct 2020
 16:38:00 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Juergen Gross <jgross@suse.com>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3] tools/libs/stat: fix broken build
Thread-Topic: [PATCH v3] tools/libs/stat: fix broken build
Thread-Index: AQHWiQYtlvZlYAgRJ0WaZGJ4HThwo6ln+foAgBsWa4A=
Date: Thu, 1 Oct 2020 16:38:00 +0000
Message-ID: <87CA2B55-B372-458C-82CC-2423B8AC3EEE@arm.com>
References: <20200912130836.11024-1-jgross@suse.com>
 <5232FD74-9636-4EF4-81F8-2EF7EE21D326@arm.com>
In-Reply-To: <5232FD74-9636-4EF4-81F8-2EF7EE21D326@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c46c8f6e-36b9-4b4f-f896-08d86628744e
x-ms-traffictypediagnostic: DB7PR08MB3161:|AM6PR08MB3798:
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB37980C1274C81AB85FCB26B39D300@AM6PR08MB3798.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6430;OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 cRhr/vm0+ut4EXp8fk5MGNsyMqs5lX6vxdP2Gy+7l4ZR2SfdyVzH84CzvoiOLjXCF+BAaeJLhhk1YZcdAKt+PfBRdZHe4hrhqtpgorWr38lmNMQSKGXowwbKFhTPmExhmk2NwyH/C/kDs/VrhuxyUqGlY/itIwYYkMCkKpzlDoGGTc4LaoNPwfrunSglRP7qGDTxmGg+pABJMs04j0w2UgnqisZblt+VWLl6YQ04UJ77D72g0Xh2ISu6dH4mg3m89ebQMZ65vpWOJOli/6h96vraKuNVo46KWUqW86I/Kv4TS6wE1ii0d8I9M41pozyPuceiwVvaPG+bHRodNQIJynSXEphXdoTG7Mf/kRvls1EtNIIsyklsOU0wvydn8Vzr
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(376002)(136003)(366004)(346002)(8936002)(66446008)(76116006)(83380400001)(66946007)(86362001)(6512007)(6916009)(71200400001)(6486002)(33656002)(8676002)(64756008)(91956017)(66476007)(2906002)(4326008)(54906003)(478600001)(66556008)(6506007)(53546011)(5660300002)(2616005)(316002)(26005)(36756003)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 ulUtT8mIOWoqQncAxUz55tbbIY0V+hWl84ZplcltvdhmEgK2XcXYrInNpjqaU6cr+tSMKZDQiAJCoQCicNPKbDukOU3rzqoUMWbeatyYibw6V+ESGvyfiMayTDZqWnFP0gY8itZe690qIuMhpbYFdkrKWV4Tz3bhl05FGrWOZSUE7bQgZSoFyjz46QJwixZtGOLT9NWtth7/0mVqpm4FHpOk41YCJOtHD9rwM1joLtSJZm+3IVHP+I66Laq99j9zeoSDmSUr5ldWtQNjpnp0ibcU/N/W+7jCYyIVmSFiz0npBN5/dOhcLp1FVVAGiRMLRAguZaxMJ/VzXiVF+gVRaNNouTX3ximN8NBf2AMm6lMzYkFxCHDjFAj9c4nFP8da3PFMHqcW9bBvQ/2li9OWWiDiBhGUynZGr4XDn68/Yrfb5ZSqk+C6kdmoAZKLDft8PFuhfJglpPTsktLp7ihluODHdQoyzq1T47cHPeIujadugjLztaDIyouNoPkpfib/EpBHeg+4/E00X2+zhDQ2+yMXSI8HQQKDRNqORuIK51nFEzCFk9lFm1D7YuvheAtE+z1mcjzW0jiyTq91GsNO8jCK5mOE9fxAtkxbccDmm9J/mBIRs4Ru1NPMu/YvphXUPrm7ZNSEFRZZCzGr1F9V4A==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <82D960DD67D6B04F9C874057903DFD08@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3161
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dcbf303e-1277-4b1e-c573-08d866285c3f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ttn+VNeCisZImfRxTXgadcjNsuwmmVJOBdSz/9KI6v/B4purM4yY1FryqkznXCOksc9Ec71Rf+Xw5NPA26xy6i09BTk3c+xAn4r1GSUCqZd3+VADVvQ9ILCOGmP3q5/RhuWQVQKNY8AsnQvGR+0hkbg9GWZ7g1Ic4lXH8GiwdT5ttWAXhyhjJMVhi5uzCJnT7q/fXisTXUrzv6tPn16NK3khqSq6tuls/4i0bu+qkv6XoKEBUfZ+LSN0+1LiSXJTHDkGZe/J5srqpxy2e4vFQi55DALs5ZjU9j069c9sbU80rElw140TqhvToZpCK7adqLJE0qyOLD8diE/r99XUagXjZl7S1IJJa3CDRzGZK/uLiD2VOg2qrWvAzXkT/wYfVe60Z+F778AowoLUL31LfQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(396003)(346002)(376002)(136003)(46966005)(6506007)(186003)(36756003)(70586007)(33656002)(54906003)(70206006)(316002)(8676002)(86362001)(82310400003)(6512007)(2906002)(26005)(4326008)(8936002)(6862004)(5660300002)(81166007)(6486002)(53546011)(2616005)(356005)(47076004)(83380400001)(82740400003)(478600001)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2020 16:38:40.8922
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c46c8f6e-36b9-4b4f-f896-08d86628744e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3798

Hi Juergen,

> On 14 Sep 2020, at 11:58, Bertrand Marquis <bertrand.marquis@arm.com> wro=
te:
>=20
>=20
>=20
>> On 12 Sep 2020, at 14:08, Juergen Gross <jgross@suse.com> wrote:
>>=20
>> Making getBridge() static triggered a build error with some gcc versions=
:
>>=20
>> error: 'strncpy' output may be truncated copying 15 bytes from a string =
of
>> length 255 [-Werror=3Dstringop-truncation]
>>=20
>> Fix that by using a buffer with 256 bytes instead.
>>=20
>> Fixes: 6d0ec053907794 ("tools: split libxenstat into new tools/libs/stat=
 directory")
>> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Sorry i have to come back on this one.

I still see an error compiling with Yocto on this one:
|     inlined from 'xenstat_collect_networks' at xenstat_linux.c:306:2:
| xenstat_linux.c:81:6: error: 'strncpy' output may be truncated copying 25=
5 bytes from a string of length 255 [-Werror=3Dstringop-truncation]
|    81 |      strncpy(result, de->d_name, resultLen);
|       |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To solve it, I need to define devBridge[257] as devNoBrideg.

Regards
Bertrand

>=20
>> ---
>> tools/libs/stat/xenstat_linux.c | 4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/tools/libs/stat/xenstat_linux.c b/tools/libs/stat/xenstat_l=
inux.c
>> index 793263f2b6..d2ee6fda64 100644
>> --- a/tools/libs/stat/xenstat_linux.c
>> +++ b/tools/libs/stat/xenstat_linux.c
>> @@ -78,7 +78,7 @@ static void getBridge(char *excludeName, char *result,=
 size_t resultLen)
>> 				sprintf(tmp, "/sys/class/net/%s/bridge", de->d_name);
>>=20
>> 				if (access(tmp, F_OK) =3D=3D 0) {
>> -					strncpy(result, de->d_name, resultLen - 1);
>> +					strncpy(result, de->d_name, resultLen);
>> 					result[resultLen - 1] =3D 0;
>> 				}
>> 		}
>> @@ -264,7 +264,7 @@ int xenstat_collect_networks(xenstat_node * node)
>> {
>> 	/* Helper variables for parseNetDevLine() function defined above */
>> 	int i;
>> -	char line[512] =3D { 0 }, iface[16] =3D { 0 }, devBridge[16] =3D { 0 }=
, devNoBridge[17] =3D { 0 };
>> +	char line[512] =3D { 0 }, iface[16] =3D { 0 }, devBridge[256] =3D { 0 =
}, devNoBridge[257] =3D { 0 };
>> 	unsigned long long rxBytes, rxPackets, rxErrs, rxDrops, txBytes, txPack=
ets, txErrs, txDrops;
>>=20
>> 	struct priv_data *priv =3D get_priv_data(node->handle);
>> --=20
>> 2.26.2
>>=20
>>=20
>=20


