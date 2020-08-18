Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3442248BC2
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 18:35:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k84aA-00009x-QZ; Tue, 18 Aug 2020 16:35:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KTNL=B4=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1k84a9-00009n-D5
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 16:35:29 +0000
X-Inumbo-ID: 6b4aecf9-661b-41d8-9f86-ee0249d736bb
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.59]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6b4aecf9-661b-41d8-9f86-ee0249d736bb;
 Tue, 18 Aug 2020 16:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=loys/ucTW1IcWq/F9SAe22Bhk89jMrw+8VqdiTcBRDw=;
 b=E/xeapgGhm3qLJImWg6R3npa9l0GoSJAcgrQRK6y1qS4VVRZChs1GR0JohZ7awQVZvaDCX14ivhMYuCGrKt+iVcpspUOJhVp+QT0S+tqNKcJP49s/MUDjWhm3Bb+obe+xPEdM3S3IvqpWbptHJm7JGR67Em1hdZB8Ez12mwZotE=
Received: from AM6P195CA0098.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::39)
 by DB8PR08MB5449.eurprd08.prod.outlook.com (2603:10a6:10:119::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Tue, 18 Aug
 2020 16:35:24 +0000
Received: from VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:86:cafe::df) by AM6P195CA0098.outlook.office365.com
 (2603:10a6:209:86::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend
 Transport; Tue, 18 Aug 2020 16:35:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT009.mail.protection.outlook.com (10.152.18.92) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.16 via Frontend Transport; Tue, 18 Aug 2020 16:35:23 +0000
Received: ("Tessian outbound 7a6fb63c1e64:v64");
 Tue, 18 Aug 2020 16:35:23 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 042dc5aec689b7e1
X-CR-MTA-TID: 64aa7808
Received: from 6438215e4281.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3FB8C245-34B9-4894-8125-3B9D82AED8D5.1; 
 Tue, 18 Aug 2020 16:35:04 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6438215e4281.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Aug 2020 16:35:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IWmmYKO/4Bk7qNunsU9D1hqKvVfSV19eysL5tkHfdjQ2MRBF6+tub1onmwd5BJiVun6gnXPQbMobYh7nawBRN2DRu77btNu1RdKBT8OPlf4KD2l2HeoPfYeVeruy/ZqZq7lNZzBmULLRPO8NxN90tzxYdKUHdZ9dyijppk56hNiVKE3DJfXBcDDbi3h5C9cnbi3JAooD9H5505X3hczFnDMzhC+b42n+eatUx7+BGsU6iX0NnwAfl0xR3M0jBrb1W/J4lwaAPeMDur3VNxInjAfYPsFetzIR0cyhcAl4wNh0PH0hlK+u5anWYWguH5XECXrgB11b2IQVG7fHwp0B+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=loys/ucTW1IcWq/F9SAe22Bhk89jMrw+8VqdiTcBRDw=;
 b=F3SJ9nlQQ15hvw47rAuABUaF8n0xCfwyGAeIaVKcmrXI1+R7jYQklTr2/s4f1ZW/QaJCrGufZKl/SVFOdn71hmmETGpFyl+CG/+OP4Wnd++slpAefYPXL8obQZ7TxLE0J7Kv+3I4UWh/3VrzPl+8QUwljD4neMCmUpOvLpfcECEjfKqpywUxPJMGyVlSXf2X7jB/TsKHsjozGDYjoecqJ5nfVND8biOg+HO38jShpOuKeQPSOXCZLbBw/10OthHyVejyxkyhQag7tJFSC155omJGXDOujvdo4ckeirzuJhxTLON9BtgYdPdgnLkGeV5H40IwUFN8KKb0wpF4xNPO6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=loys/ucTW1IcWq/F9SAe22Bhk89jMrw+8VqdiTcBRDw=;
 b=E/xeapgGhm3qLJImWg6R3npa9l0GoSJAcgrQRK6y1qS4VVRZChs1GR0JohZ7awQVZvaDCX14ivhMYuCGrKt+iVcpspUOJhVp+QT0S+tqNKcJP49s/MUDjWhm3Bb+obe+xPEdM3S3IvqpWbptHJm7JGR67Em1hdZB8Ez12mwZotE=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3385.eurprd08.prod.outlook.com (2603:10a6:10:4b::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.23; Tue, 18 Aug
 2020 16:35:02 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3283.028; Tue, 18 Aug 2020
 16:35:02 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, "security@xenproject.org"
 <security@xenproject.org>, Paul Durrant <paul@xen.org>, Xen-devel
 <xen-devel@lists.xenproject.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andre Przywara <Andre.Przywara@arm.com>, Julien
 Grall <jgrall@amazon.com>, nd <nd@arm.com>
Subject: Re: [PATCH 1/2] xen/arm: entry: Place a speculation barrier following
 an ret instruction
Thread-Topic: [PATCH 1/2] xen/arm: entry: Place a speculation barrier
 following an ret instruction
Thread-Index: AQHWRAfmStwU8wyN4kaMawtOMkuGS6jbwRUAgAE+BoCAGrNlgIBGwHmA
Date: Tue, 18 Aug 2020 16:35:01 +0000
Message-ID: <9DFF73C4-5141-47AF-A0DB-331787007F37@arm.com>
References: <20200616175913.7368-1-julien@xen.org>
 <20200616175913.7368-2-julien@xen.org>
 <alpine.DEB.2.21.2006161422240.24982@sstabellini-ThinkPad-T480s>
 <57696b4d-da83-a4d6-4d82-41a6f6c9174c@xen.org>
 <5c3a2407-3e76-3a30-7f93-036706e00f73@xen.org>
In-Reply-To: <5c3a2407-3e76-3a30-7f93-036706e00f73@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ee044267-3a6d-4258-00b7-08d84394b4c2
x-ms-traffictypediagnostic: DB7PR08MB3385:|DB8PR08MB5449:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB8PR08MB5449F497A7C90748D7D3DE759D5C0@DB8PR08MB5449.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: uq0MtgIC2A2jg6qIEvl4Q/bINIMENyk3KyQ5Qt/kx7zzf1AzCwHIgqnjdLisw+N5z+G7kEfzyn4jAZMXyXrto7+J2REI0h5qOOuY9OEcvEiGxY5fFBqrX1CSN1gkalO5XSzXstD8f4ZbYwHEzUheTP1ljn/AUPNcrAOwH4OMANoQi7bgcflQZwMxRhWFZp6t0G36xDsVfjMR80BJeadch0ePI7eQCLeoHalPEe9xEAShBS2D5EZZZ2uMlEZFM7A2lO7bumzwfB6hz0qpaInqodfMlORVXIQmqeB+YGRtds8Kdrr1SQXQOfkQzn+2O+Ve3PbgVan1Bh/sRZ6vC4hCLg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(396003)(346002)(376002)(136003)(8936002)(86362001)(83380400001)(4326008)(76116006)(33656002)(478600001)(6512007)(2906002)(36756003)(91956017)(186003)(53546011)(66946007)(64756008)(66476007)(66556008)(26005)(2616005)(316002)(6506007)(8676002)(5660300002)(54906003)(66446008)(6486002)(71200400001)(6916009);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: wdS9WCm1fcAznRiPrhYYJRBrw6JDjaO4adg5jKgyUCBxECJISDLMKKKbeEr+oPb5Oe3j/s/ArqcFH0BgDQODoAdWICRtITix20EbOSReKjNoeTaGTq1HZ2J2dXADhjIma0pM8dDnT7d5o+TxAZqw+ewhC9u+mK3bVtYrOWjGLwmYpRZILgDRlk9XQ40By40hwdONIImQ1ucrMv0ptfAxe9Iwv97+WUc7SFbXXk+2y8b4eAb7wFoNKyHcoaUkDqR5RUiTsJXDgm/Sbi2u6YWnEYO2yyKoAontKV+aDHVqlKbvdICxqBlb5LexMvkon2JEcTgWAfQkNh9xLvDDbx30lE+gByTTeWrxfdwMgviiozlAA4AibSwwEhbpb6Ya+j0e71jl3jQB1OysfrrTlNdIyPhLSZXa10jrBCYAVxqxwvPHQ7doesqpI4cZXsTnDR7ofkdtLE75x+m+Og8rMbtuQd0TJtVB9pERS4i4dv5+qHDf9oUcLj41WjDB0q6Gx0Lm0udJwFR630I3XeL2MwLTdQo+2/EMghhTVXMzfQbuaunugm3gQ23BLKMDupPAUNg8LSra6bMIfIHG5xVW1TLgEL5LMernPFBijmEvy5IFsUp3ItqIg+eK24/txb4CP+HiLVuBPKHVMJyEhaRDn/KFdg==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <22CB711A1AF7AD49843A1E935AE5E708@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3385
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: d410c502-76cc-47ac-c72c-08d84394a7b8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /DPm72gIC6SE/AU/KpZJfwqAQET7PvjXjvxNsN7TlJcp/KLXKPCbhwqwHOBQMPXE7vH2arynqcUGJaPkIXwPDBZnSz92tBSLwhk5w1BK5EB4sSGMoln7B91xeeFYNCpkb1Pk2OegOWRRyeyaP4cmNKR1VKAFP4BM+pk2Bnn5TMlkAUJFVnBc4S0bWK2vSpTvLbRfZhmNHNmNmzyhW+nzCzx0k8ZvoAXd11/NrFcDQBMqMXORuJlbz3mb1/fjknK72RXyT8WwWlBzxHa+THcYVXM+6CzyznpwK+VcNBdiloGmYqT1tY2IEsAxf1pGEu/KdoVaqFtkFQ5wuBdiqlJgFJb/IhVAOvAAhxDQ4adD3vezoKXOAFWB8VnW+ue6QpUU3bq5o7jD0ks3T53Il6vxMQ==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39860400002)(136003)(396003)(46966005)(4326008)(6862004)(54906003)(36756003)(2616005)(86362001)(6486002)(53546011)(6506007)(8676002)(26005)(186003)(478600001)(336012)(8936002)(36906005)(6512007)(70206006)(356005)(82310400002)(83380400001)(316002)(5660300002)(82740400003)(47076004)(70586007)(81166007)(2906002)(33656002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2020 16:35:23.8609 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee044267-3a6d-4258-00b7-08d84394b4c2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5449
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

Hi Julien,

Somehow we stopped on this thread and you did already most of the work so I=
 think we should try to finish what you started


> On 4 Jul 2020, at 17:07, Julien Grall <julien@xen.org> wrote:
>=20
> On 17/06/2020 17:23, Julien Grall wrote:
>> Hi,
>> On 16/06/2020 22:24, Stefano Stabellini wrote:
>>> On Tue, 16 Jun 2020, Julien Grall wrote:
>>>> From: Julien Grall <jgrall@amazon.com>
>>>>=20
>>>> Some CPUs can speculate past a RET instruction and potentially perform
>>>> speculative accesses to memory before processing the return.
>>>>=20
>>>> There is no known gadget available after the RET instruction today.
>>>> However some of the registers (such as in check_pending_guest_serror()=
)
>>>> may contain a value provided the guest.
>>>                                ^ by
>>>=20
>>>=20
>>>> In order to harden the code, it would be better to add a speculation
>>>> barrier after each RET instruction. The performance is meant to be
>>>> negligeable as the speculation barrier is not meant to be archicturall=
y
>>>> executed.
>>>>=20
>>>> Note that on arm32, the ldmia instruction will act as a return from th=
e
>>>> function __context_switch(). While the whitepaper doesn't suggest it i=
s
>>>> possible to speculate after the instruction, add preventively a
>>>> speculation barrier after it as well.
>>>>=20
>>>> This is part of the work to mitigate straight-line speculation.
>>>>=20
>>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>>=20
>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>>=20
>>> I did a compile-test on the patch too.
>>>=20
>>>=20
>>>> ---
>>>>=20
>>>> I am still unsure whether we preventively should add a speculation bar=
rier
>>>> preventively after all the RET instructions in arm*/lib/. The smc call=
 be
>>>> taken care in a follow-up patch.
>>>=20
>>> SMC is great to have but it seems to be overkill to do the ones under
>>> lib/.
>> From my understanding, the compiler will add a speculation barrier preve=
ntively after each 'ret' when the mitigation are turned on.So it feels to m=
e we want to follow the same approach.
>> Obviously, we can avoid them but I would like to have a justification fo=
r not adding them (nothing is overkilled against speculation ;)).
>=20
> I finally found some time to look at arm*/lib in more details. Some of th=
e helpers can definitely be called with guest inputs.
>=20
> For instance, memchr() is called from hypfs_get_path_user() with the 3rd =
argument controlled by the guest. In both 32-bit and 64-bit implementation,=
 you will reach the end of the function memchr() with r2/w2 and r3/w3 (it c=
ontains a character from the buffer) controlled by the guest.
>=20
> As this is the only function in the unit, we don't know what will be the =
instructions right after RET. So it would be safer to add a speculation bar=
rier there too.

How about adding a speculation barrier directly in the ENDPROC macro ?

>=20
> Note that hypfs is currently only accessibly by Dom0. Yet, I still think =
we should try to harden any code if we can :).

Agree with that.

Cheers (and sorry for the delay)
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


