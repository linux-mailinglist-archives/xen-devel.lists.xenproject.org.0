Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 893582647B6
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 16:05:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGNCS-0001lF-AL; Thu, 10 Sep 2020 14:05:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rBJY=CT=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kGNCQ-0001lA-Oz
 for xen-devel@lists.xen.org; Thu, 10 Sep 2020 14:05:18 +0000
X-Inumbo-ID: b86d3e5d-fe51-4b50-80d3-94a273086832
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.43]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b86d3e5d-fe51-4b50-80d3-94a273086832;
 Thu, 10 Sep 2020 14:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DFId9n0KjWKN09W0dXx3scDUe618TF6lqGZz8wAXGN8=;
 b=JE19qCcovAhieJHA6SZuBe/dsctfFmWX3f1f4yZQfrkoqvrzPkGpNpuJloSNcT6JP9r6TOfP4JaAmVzM7HEMPZaWoy1MzkwpsBl1xlY6YW5ocF7Qradg6LUH4XwQszTZ1OeIadaBpxOgsbn9nBiy/sLAT47afc/Hgt9t4APzEPI=
Received: from AM6PR0202CA0054.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::31) by VI1PR08MB3821.eurprd08.prod.outlook.com
 (2603:10a6:803:b7::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Thu, 10 Sep
 2020 14:05:14 +0000
Received: from VE1EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:3a:cafe::19) by AM6PR0202CA0054.outlook.office365.com
 (2603:10a6:20b:3a::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend
 Transport; Thu, 10 Sep 2020 14:05:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xen.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;lists.xen.org; dmarc=bestguesspass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT019.mail.protection.outlook.com (10.152.18.153) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.16 via Frontend Transport; Thu, 10 Sep 2020 14:05:09 +0000
Received: ("Tessian outbound e8cdb8c6f386:v64");
 Thu, 10 Sep 2020 14:05:05 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 311412ca99bce253
X-CR-MTA-TID: 64aa7808
Received: from df13bd18768c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5A591AD4-D1BF-4226-B51E-ABF876C8000C.1; 
 Thu, 10 Sep 2020 14:04:54 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id df13bd18768c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 10 Sep 2020 14:04:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OGHHEOhcGxyo5BPkfIozNPBlIUA5eeASEHWWflYxcwGWfOerK/5zjEDymWSJMsPZ9Ur02lAbgR/YcKuPXXceFRx+RQznUPzsFSee6sPkCwx3KzZEJN78z82HUkkL7iMwrVQIZ8cNd4CDKB+9iaOyFVZeJxd4atnL521a2Tr1xVNRn2zkfJzhQiLUdOZ32BABmG9ZejFvKm82YPPLTzioqhjMDA/uq4Xv8ZXX3AzhahIFnKqtIcb0yq3zF4fI5dosxdCxRUSn6IQZU5i6GGN7kvdUGPzrowpnlrWs3q0KAneewGiPLWdxVVze+YltQDoG2+w/HaSC3j+TpZzfpffQgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DFId9n0KjWKN09W0dXx3scDUe618TF6lqGZz8wAXGN8=;
 b=jXnC+sLVBMRy1CL+0Ihp762kB/f9cCTiq2Q2Gb3F6jd0vHVnHT4r8tj0GC7htd0ug9gQLHBX0RKnfCB7+nxjWI32FO1FRHd4Ck7K/FvUHdwE1u+5hXOtRdUZaxtEWopufKIgIyWIK5/mGeYClPPi4XI0BvcdyUoh9Ij/yRNlwgP8xk/119SFsfoY/50MRvMBlNdFUYArzGgBXQFqVNyfouE1XU92P0Gr0lPTxG8bJA0e+l/o9uaGHz/XCg6p7uJwev+9/6SlrRK6UoZfd9NabnvHs9uHNs0kY9BSmgVLAYAdxHGcJ9/JYpWA5LdmwxzJIUaOUlncFEMLnwJSL8aCKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DFId9n0KjWKN09W0dXx3scDUe618TF6lqGZz8wAXGN8=;
 b=JE19qCcovAhieJHA6SZuBe/dsctfFmWX3f1f4yZQfrkoqvrzPkGpNpuJloSNcT6JP9r6TOfP4JaAmVzM7HEMPZaWoy1MzkwpsBl1xlY6YW5ocF7Qradg6LUH4XwQszTZ1OeIadaBpxOgsbn9nBiy/sLAT47afc/Hgt9t4APzEPI=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB8PR08MB5179.eurprd08.prod.outlook.com (2603:10a6:10:e7::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Thu, 10 Sep
 2020 14:04:52 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3370.016; Thu, 10 Sep 2020
 14:04:52 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xen.org"
 <xen-devel@lists.xen.org>
CC: Julien Grall <julien@xen.org>, Stefano Stabellini <stefanos@xilinx.com>,
 George Dunlap <George.Dunlap@citrix.com>, nd <nd@arm.com>
Subject: Re: Runstate hypercall and Linux KPTI issues
Thread-Topic: Runstate hypercall and Linux KPTI issues
Thread-Index: AQHWh3jMy0NFQnBtL0aR33AwNuevPKlh5ViAgAABPYCAAAEuAA==
Date: Thu, 10 Sep 2020 14:04:52 +0000
Message-ID: <76160CF4-9F6C-4E42-9C6A-DF052459E4A7@arm.com>
References: <1844689F-814F-48AE-8179-95B0EE4E734C@arm.com>
 <8b9d8bc8-254e-01db-6ba3-ec41bc9cd2c7@suse.com>
 <2AD6A14F-AA25-464D-9E9E-6067F2F43F29@arm.com>
In-Reply-To: <2AD6A14F-AA25-464D-9E9E-6067F2F43F29@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e879b0a5-44e7-4e55-becb-08d855928a06
x-ms-traffictypediagnostic: DB8PR08MB5179:|VI1PR08MB3821:
X-Microsoft-Antispam-PRVS: <VI1PR08MB3821445D0CBB309419D529429D270@VI1PR08MB3821.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: ACe3g5UL7P5RDZXss7z2+NJNxN1+Xv6w+yuQpPxbLiDZA8yt5YgChrhI5siGyoYLLDn14Ravg9XMlGaDe3oIfunb7xqJTYjnnxGDI64BsRSZ5Z8Db2bciZRMfV5++owGs+vxbl4N71F3WNCO5ZVLk4B12XkoPa+IbG+4Go4UxGfsFYSVRBEWSkjZXTUN2svOKU5kE3uvhoe+tx14gTUyypNhqGX+0YTrZcZSb5kNs7Am17gRC0G/nsuWPlEa+sEhTx4ABhy43p6/Vk89yhqjZ47wQshKoAIkBHTemxRWjTC6/RsSSWiMzWrSp3i4u8P+qDWdd8TOg1bGhd9uxlETVg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(346002)(366004)(376002)(136003)(2616005)(5660300002)(6512007)(86362001)(4326008)(6486002)(8936002)(83380400001)(71200400001)(36756003)(26005)(2906002)(53546011)(66556008)(316002)(64756008)(91956017)(186003)(76116006)(66946007)(66446008)(66476007)(33656002)(110136005)(54906003)(8676002)(6506007)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: RrjPrFvDasiN8yBvC9kzlSFXh9rNBPrtUhlcVG3Dk+dIZ/L2P0fiyiMJKYP5hfHIjaET7QHzk/NNN9McIQ90rWcDFxmceHeQuPu/mZwMtWE54NxZ/hAp+gso88g48QRYPH3H1O5YkDUBzQb35rg/B6Q8VhOe1wdNhEtHZg9s0pRYPHjFvvQmjVPp5vr9szcLiLoTYA5qW7jo/kWtZTpDOr2zJLJTF/NTM4vFSArXJlpAXItUO4uNQFn2z2+TkvIHpUC0VIdRi9gLykEDf2LsCYOluu+cbqPTuAhQPFhInf8cDVigeC+16rD2GKNDfalrI+2iSVKfqHaJMxdaZ6K/ebVnrCcIeIGgbsmQHm4HppEuk+6yeMvzIph2ZK/kcpW8ch/W5u8byKJqywXUepSlz8PGcIwu/FPz72riajxWGo+f4JB38zuUVSbC/Z5BaYDKuYx1LgjZagob4RK4iZVfEdWTz/6AhVJnpq2U4MnNgHNcz/psgHpmc5JnhiWdQE+7X0Q8TnbleiaFVLw/NXVhMp3SV67QzXi/GZ6KUukGgqSyP8lk0l5RYYBY2IcT/fIEhKcKCJztgnYqnY+bvTDD6rBGMXpLVCa4+JQ3smvx9NEflsnWTAgwXY+mnoWOvN/A1JlnSp4a2zh6B5Q/E6SHMg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5A2CEF9FC92C2647AC0898DDDB99CF7B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5179
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: db2bbf65-9746-4f15-e38c-08d855927d55
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qnq83d6NTT/QLKdl95aMS6pH2QReNjhE6qbTzrurZXxKpi0rQryHxCV/lH8NMMhqpkV497dasraxafEOybDsPieuJX0MsY4xofE6qKwIsTVy6xDmjyC4jelX0hbVnVkGLpEP6bVscSMOn38uIlc/exK3thpkaX5LVYuZBy4nNYSvxF54/CdSTW+DCc2jQN6f+mKoZK8bQrMRWUp6LHUngRilmj02dMf62nKQ2KGKPGENVQs8dQ0LK2mCg0sqDzAjogGGiyrBjhr2SS3appXtCYAzJaHUnxaLIweiAXkq92cyW2UPcVAx5+onW60F6U0eAfwNb28hPOiYkhHzivXeMvxJG/Xr/fc1t/576t43kAq2Krwp/lsDpFzWFM/sTRdy4O17DIUagdqW4/hnvJnv6A==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(46966005)(6512007)(356005)(2616005)(54906003)(33656002)(47076004)(82740400003)(53546011)(81166007)(6506007)(8936002)(336012)(4326008)(36756003)(8676002)(83380400001)(36906005)(82310400003)(70206006)(478600001)(5660300002)(110136005)(316002)(186003)(6486002)(86362001)(2906002)(70586007)(26005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2020 14:05:09.5560 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e879b0a5-44e7-4e55-becb-08d855928a06
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3821
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



> On 10 Sep 2020, at 15:00, Bertrand Marquis <Bertrand.Marquis@arm.com> wro=
te:
>=20
>=20
>=20
>> On 10 Sep 2020, at 14:56, Jan Beulich <jbeulich@suse.com> wrote:
>>=20
>> On 10.09.2020 15:46, Bertrand Marquis wrote:
>>> Some open questions:
>>> - should we allow to register an area using both hypercalls or should i=
t be exclusive ?
>>=20
>> I thought it was already clarified that to a certain degree both need
>> to remain usable at least in sequence, to allow transitioning control
>> between entirely independent entities (bootloader -> kernel -> dump-
>> kernel, for example).
>=20
> Sorry my wording was not clear here
>=20
> Should we allow to register 2 areas at the same time using both hypercall=
s (one with
> virtual address and one with physical address) or should they be exclusiv=
e ie one or
> the other but not both at the same time
>=20
>>=20
>>> - should we backport the support for this hypercall in older kernel rel=
eases ?
>>=20
>> It's a bug fix to KPTI, and as such ought to be at least eligible for
>> considering doing so?
>=20
> That will mean also backport in Linux. What should be the scope ?
>=20
> Bertrand
>=20
>>=20
>> Jan
>=20
> IMPORTANT NOTICE: The contents of this email and any attachments are conf=
idential and may also be privileged. If you are not the intended recipient,=
 please notify the sender immediately and do not disclose the contents to a=
ny other person, use it for any purpose, or store or copy the information i=
n any medium. Thank you.

Sorry the disclaimer should not appear anymore, no idea what is going wrong=
 on our side here

Bertrand


