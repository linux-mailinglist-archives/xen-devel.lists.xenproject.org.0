Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4406F2446C9
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 11:12:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6Vks-0000Rq-E0; Fri, 14 Aug 2020 09:12:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ruf4=BY=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1k6Vkr-0000Rj-0Z
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 09:12:05 +0000
X-Inumbo-ID: eb9adacb-16de-4c57-8537-d27d8459e876
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.48]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eb9adacb-16de-4c57-8537-d27d8459e876;
 Fri, 14 Aug 2020 09:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ORBJRNcZ9neFw5chg44OVw+UFKUZ7NrEyp7bgytOloc=;
 b=056qnnXwYf7QidFGkR9IS7KHHltTXAsOf3qd/JwHuwo5hj/mgo1z+FHBLyOyI3InW/Bj/OV6iZrAcY4nbB7hjeS4ZwusnANBXWaPb2iilQel4zRRXgp+FU7qqVCAmIQe1q4ds4q+6gTqzCfCGV9wy2gu0xRvMVmUgy44dlkytEg=
Received: from DB6PR07CA0071.eurprd07.prod.outlook.com (2603:10a6:6:2a::33) by
 AM0PR08MB3700.eurprd08.prod.outlook.com (2603:10a6:208:fc::25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.16; Fri, 14 Aug 2020 09:11:58 +0000
Received: from DB5EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2a:cafe::39) by DB6PR07CA0071.outlook.office365.com
 (2603:10a6:6:2a::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.13 via Frontend
 Transport; Fri, 14 Aug 2020 09:11:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT025.mail.protection.outlook.com (10.152.20.104) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.16 via Frontend Transport; Fri, 14 Aug 2020 09:11:58 +0000
Received: ("Tessian outbound bac899b43a54:v64");
 Fri, 14 Aug 2020 09:11:58 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 880e0786d4274501
X-CR-MTA-TID: 64aa7808
Received: from 887a47343326.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9B797C5A-53FC-46D4-AC19-660107CDAF38.1; 
 Fri, 14 Aug 2020 09:11:36 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 887a47343326.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 14 Aug 2020 09:11:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OMb7o9bVUAjNg8UREe8osiOTVpqllkS54RozHlbcKeD2ImODpDpr0rkqYpXng+4mCasIR+pPcpjWvxAt5l//Cwx+/J+V3VlrpV1wOs2BkBsYQK5s+pnfK/ouhCew3mTP64BMpg6C0IlGvskjXqmU05ac52A7P6tHi3G4oLweNVtzdavPMij/FRQXYkAjIWLYyDSVQ0pNKJzwLxWTB1HW9AYo+MAjw6URhibLkmXWMCcC4Dhqbo4ObjjiyOqA5eUf13vhu77urak3AOBbsky2omn2Kh/R6H/nxY+wBxocpj7iG1QKBB7uGFQ+5ViXSqKKes1CqgoGLuHevR4Bl3J4Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ORBJRNcZ9neFw5chg44OVw+UFKUZ7NrEyp7bgytOloc=;
 b=Ay/jcleS8yXpVeXLeMJ+WWuNcFjr0IYZ5g+hqZb0FrH4HV4XYfDnhzt6gESFMkiWbVBrXeGajDJMr3Q/b3YWOffU+MiduypdAkuRDZFM1l5jOwtTdc+n3OwroR0o4RsJyyI7FE++Aro0FTq3O8sa2MNLiW8alCZgMWH/qnQAA0KsuEzVO1poeApCvZWIq798bmoVwx/V/5//2erKuaAZHICclzbAMY7WI5NOhGgKL/vOno6rOvlmAhbp+orVt3a/i4MzULvuK/uOiwVDJnBIQcYvoCyeSWOk/FIE3xI+X91db4xsJMobrjmIYVaH93IeWi8m3ZkjFmHf0/31fgbjrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ORBJRNcZ9neFw5chg44OVw+UFKUZ7NrEyp7bgytOloc=;
 b=056qnnXwYf7QidFGkR9IS7KHHltTXAsOf3qd/JwHuwo5hj/mgo1z+FHBLyOyI3InW/Bj/OV6iZrAcY4nbB7hjeS4ZwusnANBXWaPb2iilQel4zRRXgp+FU7qqVCAmIQe1q4ds4q+6gTqzCfCGV9wy2gu0xRvMVmUgy44dlkytEg=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR08MB2696.eurprd08.prod.outlook.com (2603:10a6:6:25::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.20; Fri, 14 Aug
 2020 09:11:35 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3261.026; Fri, 14 Aug 2020
 09:11:35 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
 <wl@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3] xen/arm: Convert runstate address during hypcall
Thread-Topic: [PATCH v3] xen/arm: Convert runstate address during hypcall
Thread-Index: AQHWZluWPRKsKyuZRkCQVDwO60tsvakgmVkAgAEWTwCAFLPWgIABBZoA
Date: Fri, 14 Aug 2020 09:11:35 +0000
Message-ID: <0C2FA898-52D1-4C4B-918C-E7500FEABD0E@arm.com>
References: <3911d221ce9ed73611b93aa437b9ca227d6aa201.1596099067.git.bertrand.marquis@arm.com>
 <f48f81d5-589e-3f75-1044-583114bf497e@xen.org>
 <CB9F22FE-BEFF-4A36-BC81-A18F9E0F9D7C@arm.com>
 <f45d3213-c785-4f62-5c3e-77093062d1b6@xen.org>
In-Reply-To: <f45d3213-c785-4f62-5c3e-77093062d1b6@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f8e2196b-9c6c-4777-b1c0-08d8403218f8
x-ms-traffictypediagnostic: DB6PR08MB2696:|AM0PR08MB3700:
X-Microsoft-Antispam-PRVS: <AM0PR08MB37009941BB46325FE446146F9D400@AM0PR08MB3700.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: aQwkV7v3SrXdZBncrtguww7oR48RfHA9MTxnX4F9Xnjlik0MIJiIY5vgrwXLQC0s8MsHiOMChbxQPMajqLEIDFcvXWPqueT4XgaubR+Orxf6Lr+ZzDj2I9+LMzWtci5j9p4HcGhH8qlx8EGUOSaTn7Hhe5QasfV1GLDFVWfcRwFR+eqTGpeokiI5iWBKVt0aiO6rek95oG9vkCCG/NnYSebweNikvEI+PzZbUcZk9DOdTpBUGU5uVCvsp2MJkFM55vYpUpAo3Stws59G6knXS4XVY4M08GMKUSL8PrIjDgn4xb5Qopo8+KSIAddUFMh+Qa8gkOq3Q1xBgEQc9xBhUg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(136003)(366004)(396003)(346002)(376002)(4326008)(6486002)(83380400001)(26005)(2906002)(86362001)(66946007)(76116006)(66446008)(36756003)(2616005)(4744005)(64756008)(66476007)(66556008)(6916009)(5660300002)(6512007)(186003)(8936002)(91956017)(71200400001)(8676002)(53546011)(33656002)(316002)(54906003)(7416002)(478600001)(6506007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: i4BKZViIsoPOCjT1R+shzctN12pe28c2bN5kxL1LkaVLggS6I2xEG52WAhNpXeGYKfYeUvZr1pELXP1IVJF1JDvEfi2s92q35Y59Q4eHmW+HXHkf7Yhph+WB054VO8iadSnOARBlIan0kbNL0yFhTQe21LG29v9ogS+OV/XMKcSO0+Wd2Txfmga7u8KndzHdvsysGqp1n/RldM0YMFeIbS9uHiZ3Wrzj2pnP/Sjoz54HYJngsSQwxlQwW8DtctSN0KiOPnMk1dkzukpZTBz+yi7+4aA3iu1Dr+fbnVCG99tuHCnDEXqpFzNg0O8ndZpf9MvX07RHCgOqEYU7dn6LsS4/E3zafwTD+ASRbJyRi3z0HKft+pT8qAcktO1lI2ZEpqLbFvHFbUeRLt4Umkgjxc8w/WBOu0cCAQPFaXZ7Hk4/Tv/zTKlQX3k0t6r3HAAguyEx2OVxCioOK97n9JD1j994dHqmnpbdKWOUyOJsSQAiMX4vSJuMPZJ8texwDy+WNIHBTlEkmPypOIZcyP6IfpGzG4I2h63/SzG10HalTurG8/mwjjrG1blD7QIA1KJ7p8uN4RaTWPonf+SpZc/iA9/nse08iARvnlIIOQlZir2kRribPFOPkeXf81kqwDDQha2cAAkxDeLlHM6lVE2L9w==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <DF6FFB5D35D34F4AA7F2D4AD8204EE90@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2696
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: a6c75e17-fc83-487e-e123-08d840320b35
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kpmscRGRVc7+1Niw0r/K7GjwB83cQiSnnBHGa6006dii55Dggp27qZEkTp5T2Dlxyinf5vDm8pbTRdZBcIV1j1gDdPOrNhq3B/hs6OnCAftIJ0RKbVTZeO/QUPBdG8OMIJsQvlKeC8lcDccN48hJgpG7trg/LJ+tmDEurgaNHBQQbjlc77dODq2npp5k1Jw9eaQafGOkHpDY4XoYjdxRftA8x19E/0J58QgR9TT701KVufnqsNBNUIWvFD/2+/lOzxvw46tXjDybwW6ampamUGJL4I3WdaAMKDHoLjI+Sq6qJkTxcn43u2InX1GFW5nNSDFXjnLkdJiuMxDWU/LqQdtmKsgsb0ur4Xarz8QIygCH/FHAU196QA/bmxQydTI59S/bKk40eMIn5y58LV2U6g==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(46966005)(70206006)(70586007)(6512007)(86362001)(83380400001)(336012)(8936002)(8676002)(6506007)(82310400002)(53546011)(26005)(2616005)(107886003)(4326008)(54906003)(316002)(356005)(186003)(4744005)(82740400003)(47076004)(33656002)(5660300002)(36756003)(2906002)(81166007)(6862004)(478600001)(6486002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2020 09:11:58.4279 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8e2196b-9c6c-4777-b1c0-08d8403218f8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3700
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



> On 13 Aug 2020, at 18:35, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> On 31/07/2020 14:26, Bertrand Marquis wrote:
>>>> +    {
>>>> +        gprintk(XENLOG_WARNING, "Cannot map runstate pointer at 0x%"P=
RIvaddr
>>>> +                ": Invalid offset\n", vaddr);
>>>=20
>>> We usually enforce 80 character per lines except for format string. So =
it is easier to grep them in the code.
>> Ok i will fix this one and the following ones.
>> But here PRIvaddr would break any attempt to grep something in fact.
>=20
> The idea is you can grep a few words on the message and then easily find =
the line.

Ok i will put everything back in one line.

Regards
Bertrand


