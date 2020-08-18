Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 888D224815A
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 11:06:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7xZJ-0005Nf-8Q; Tue, 18 Aug 2020 09:06:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KTNL=B4=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1k7xZH-0005Na-8r
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 09:06:07 +0000
X-Inumbo-ID: 5bfb23c9-d6ca-4c4a-9d3c-5da02365844e
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe08::60e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5bfb23c9-d6ca-4c4a-9d3c-5da02365844e;
 Tue, 18 Aug 2020 09:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GknflXBGmfKn5n96GphkJm8FITAdcXzQjBtLA0rUEjM=;
 b=0K8CGL0mpk53PxV6oJP+0YadRKMeNhthcsO8Ik4XtDz9fUHARhoyKLdjMK+bFu6r35ksBZlN58urwlnpz/OOiotwtf57IUG1BVejoL0SP9M1wAUckxpmsSeyLZLdE8DTEcaYLKfc5F0XdgV5xT3a3Ys1ZIe58nNdCp8lMioovjE=
Received: from DB6PR0601CA0037.eurprd06.prod.outlook.com (2603:10a6:4:17::23)
 by VI1PR08MB4607.eurprd08.prod.outlook.com (2603:10a6:803:bf::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.20; Tue, 18 Aug
 2020 09:06:03 +0000
Received: from DB5EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:17:cafe::c2) by DB6PR0601CA0037.outlook.office365.com
 (2603:10a6:4:17::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16 via Frontend
 Transport; Tue, 18 Aug 2020 09:06:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT007.mail.protection.outlook.com (10.152.20.148) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.16 via Frontend Transport; Tue, 18 Aug 2020 09:06:02 +0000
Received: ("Tessian outbound e8cdb8c6f386:v64");
 Tue, 18 Aug 2020 09:06:02 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7d5c2a51754dd3c7
X-CR-MTA-TID: 64aa7808
Received: from a55971b583b0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 70976ACB-4A0E-49A4-8935-6DA9C00FB7BB.1; 
 Tue, 18 Aug 2020 09:05:57 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a55971b583b0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Aug 2020 09:05:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HhebYa4Mw5TuAyNIGLnNYx3JgP4F2a5ZPk/IRhVHi+Mwd92zO7epMDj1d69/Lrk8fpuoiiQIB9ZqEfdg9JmMuQdkfapMwInTf930VYxGOz1tpuNUQJs2TXyiLy9BEdDWJ2e671jtYRBYj9ULk3f01p0uzXdfdHkW3AKhckisj9L7tI+HG2/z+6JYbHmqLivi4bcmhV5lvSL0oe5u9I4wmRfy4BiMMtB5YmQlqKH9cPAujZQTKNXS0LBGpbkTeKvbDCpmKEMPCNMebIwyq8wn8Q9yGpEvkTAmbxPU9onMjY5hjY/HIzFw6+m1poqJjyZXLaVaqlGI8OqZGjUCCnTOzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GknflXBGmfKn5n96GphkJm8FITAdcXzQjBtLA0rUEjM=;
 b=RzcX4YSJGi4S54JDi/DxB837gK5ye+x6eHE2Fjw2XhAPds+3ZV4q+wAKBbbps8ByGh3otCp+3dGXR0Ti58WK9XS4CwhkjJjqDOkxJzwoAWLMCdah6NxmAapsw7Lry0cB9QJJyHvm79kJZ6YjOzScyD/XeRViGyZHeU+OkvZARzeMFGp2iLDuPZs47+mrRKPMmLGVlmJIrv58k6jTutH455FSKqOB6qGXtvWZH53OO+CQXcEAM9tVyPxo6U53u4s9fghzDWYw4ykRFLs7iHbuQlQXECF98Q4FjjIKQi2lq0sK/ANgrk5SGehAB4rvmyZOVrPoSz57PpyJbFurzlKFWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GknflXBGmfKn5n96GphkJm8FITAdcXzQjBtLA0rUEjM=;
 b=0K8CGL0mpk53PxV6oJP+0YadRKMeNhthcsO8Ik4XtDz9fUHARhoyKLdjMK+bFu6r35ksBZlN58urwlnpz/OOiotwtf57IUG1BVejoL0SP9M1wAUckxpmsSeyLZLdE8DTEcaYLKfc5F0XdgV5xT3a3Ys1ZIe58nNdCp8lMioovjE=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR08MB2695.eurprd08.prod.outlook.com (2603:10a6:6:19::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Tue, 18 Aug
 2020 09:05:49 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3283.028; Tue, 18 Aug 2020
 09:05:49 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Jan Beulich <jbeulich@suse.com>, Xen-devel
 <xen-devel@lists.xenproject.org>, Julien Grall <jgrall@amazon.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Paul Durrant
 <paul@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
 <kevin.tian@intel.com>, nd <nd@arm.com>
Subject: Re: [RESEND][PATCH v2 5/7] xen: include xen/guest_access.h rather
 than asm/guest_access.h
Thread-Topic: [RESEND][PATCH v2 5/7] xen: include xen/guest_access.h rather
 than asm/guest_access.h
Thread-Index: AQHWZp4X4KUogf6E0E+1j1OVzKuR+6khkG4AgBZ+qACABZ0DAIAAAkgAgAAB6QA=
Date: Tue, 18 Aug 2020 09:05:49 +0000
Message-ID: <2F8934A8-A334-4D11-A986-71E2081419B9@arm.com>
References: <20200730181827.1670-1-julien@xen.org>
 <20200730181827.1670-6-julien@xen.org>
 <0874b4c7-13d4-61c1-c076-c9d7cf3720c7@suse.com>
 <b2c77386-69a7-b6ee-8311-b2dd25e5ddcd@xen.org>
 <70f7a5c0-3f41-e3a7-00ea-0e620a5506e9@suse.com>
 <8e4685b1-157b-a7ce-72aa-75352c4985b9@xen.org>
In-Reply-To: <8e4685b1-157b-a7ce-72aa-75352c4985b9@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: aa72273f-51de-47f2-c4a7-08d84355ee9b
x-ms-traffictypediagnostic: DB6PR08MB2695:|VI1PR08MB4607:
X-Microsoft-Antispam-PRVS: <VI1PR08MB4607FBFF78CAB1A1B76D6CC39D5C0@VI1PR08MB4607.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: y9cjw/9Tfy2sbfT/K5174cX3k0s5qkK+MwGa0xJHeuu3lZLgK0cd2Fa3CJjzr2a/mUo7oNzo+eNAEKiI/pvhXGGueERak8iaLtaA7Yh78+XebvcrfkRVqTmB/dtgXnJa/GXQIqPf27KQvIDhIssBUjm3nmb3+GWflg8f5ck1iLEEJtKuoMQ481kDXCgQ/CBmnL2j1SNBW6F/cYtmhg9HWdb6uhEyphExYdjLVM/qqmmktPDLNkLfWsA+E8s3l4bGQj0wS259oPWA4+3AISSzwZtin+2jajZiXNfPlL19QkxwZGMiXCtIiAvdpC/pbwqP
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(136003)(39860400002)(366004)(316002)(86362001)(83380400001)(6512007)(6506007)(6486002)(53546011)(66946007)(76116006)(64756008)(66556008)(7416002)(66446008)(26005)(186003)(36756003)(91956017)(71200400001)(33656002)(6916009)(5660300002)(478600001)(66476007)(54906003)(2616005)(2906002)(8936002)(4326008)(8676002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: l3J2n6fEIVBhtZXIfxyD5oxi04ZpkrAV8hIe3D6M9PLQZoXPBULSZgzDQfRXCFvXmdheQ/N0zcZ6FoqHCmffQ+VEMWoiEdfBqrc7GcdMT4vn2bR4j4MFOjAOVmnDd9uZ85fZhuc0GLsAdvUXqJBQxTysX67Zaf+fd8Wufd6RWkKxJJvpvLu8gChq6dwE7vQsMDWiSttHGlZi5jjTC/FqpRigjWLh1AmAvrEHiTm/Of3iEX5W2UZFp1ZFYguScWD8rOGh3UjEeni50J8GoSR7xTaX/m5O3Ye7srlXdPQxTkZfcXahCIH6vt9R2tJZbBY68zY7ebYHrhwc5cNLFIssFk+UWM2BiJnMIPxvr6YbXZnAL2oJple3QAxWnUrH/5rDpGs3iCbpBYQ+f14eqvVfyIDSnkr0LaRYNRKR0NqJLMRzLVeCJ8CIl6L4EosWA+YBlHItPxjqeUngWk5wHbrAqFEZ1cfNSBoOUgng125ttPFRwmRtw3U5mMMC4w4lSaJrqqWdziybi26JzM2FD7AGNq986v7hZ/bR6SWw06CBaMir76ndpzmxB6OKBnS5RSM04OxOeMTwTvtx7WmIwVyjBpL1muspJGoIWHnKjytd2B9xM1FsqdCY7ulnl/oVMUxmAZiqEwZoizoHQlkK5R1VIQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <E0099588A9374F41AB7868F7ED933EAC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2695
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: ad568d5e-9b3e-40c2-8665-08d84355e686
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZiOomailEGt1iQYCrU5XyeTpuBHaQPrdbfHLkPIwJGpNVKc5klSD1GxlbzhO4Rz4TPtnqMZQiBQ1fTBLbS2OVG81H6AqWznW82PXAVUvspjB5J7LO0Nq0ymXKdFdAyOTuK3WObHJYCaWMyZLzzFV6/OjzAcAoSq2Uzoj+1hu3gZcaXGzTXMN4VlQKfSlr4w2S1EMdiHBXXD+JvUZW3le2PptyiynvUfwbQp+Nrwtn9B2DsWN5gn3UjbAMOgKkZS8ZkNAkHs/MbOf5jHtNd/Qm+DtzDteyGulRNgqIm/FxCnBwV6mgCqw2UY60XIWhtMD6Rvu/vvlzYjZnYTxqJmqn+dwzKvTRqpuj9pA9hPn+t67sUFox7LP5V5x193AfLd8umM6OK6kmmBiGQmS1+Wo4Q==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(396003)(136003)(376002)(46966005)(6512007)(4326008)(6486002)(81166007)(356005)(82310400002)(83380400001)(8936002)(2906002)(8676002)(82740400003)(6862004)(5660300002)(47076004)(86362001)(26005)(53546011)(70586007)(6506007)(70206006)(316002)(186003)(36756003)(33656002)(54906003)(2616005)(478600001)(336012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2020 09:06:02.7082 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa72273f-51de-47f2-c4a7-08d84355ee9b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4607
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



> On 18 Aug 2020, at 09:58, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 18/08/2020 09:50, Jan Beulich wrote:
>> On 14.08.2020 21:07, Julien Grall wrote:
>>> Hi Jan,
>>>=20
>>> On 31/07/2020 12:36, Jan Beulich wrote:
>>>> On 30.07.2020 20:18, Julien Grall wrote:
>>>>> From: Julien Grall <jgrall@amazon.com>
>>>>>=20
>>>>> Only a few places are actually including asm/guest_access.h. While th=
is
>>>>> is fine today, a follow-up patch will want to move most of the helper=
s
>>>>> from asm/guest_access.h to xen/guest_access.h.
>>>>>=20
>>>>> To prepare the move, everyone should include xen/guest_access.h rathe=
r
>>>>> than asm/guest_access.h.
>>>>>=20
>>>>> Interestingly, asm-arm/guest_access.h includes xen/guest_access.h. Th=
e
>>>>> inclusion is now removed as no-one but the latter should include the
>>>>> former.
>>>>>=20
>>>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>>>=20
>>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>>>=20
>>>> Is there any chance you could take measures to avoid new inclusions
>>>> of asm/guest_access.h to appear?
>>>=20
>>> It should be possible.
>>>=20
>>> How about this:
>>>=20
>>> diff --git a/xen/include/asm-arm/guest_access.h b/xen/include/asm-arm/g=
uest_access.h
>>> index b9a89c495527..d8dbc7c973b4 100644
>>> --- a/xen/include/asm-arm/guest_access.h
>>> +++ b/xen/include/asm-arm/guest_access.h
>>> @@ -1,3 +1,7 @@
>>> +#ifndef ALLOW_INCLUDE_ASM_GUEST_ACCESS_H
>>> +#error "asm/guest_access.h should not be included directly"
>>> +#endif
>>> +
>>>  #ifndef __ASM_ARM_GUEST_ACCESS_H__
>>>  #define __ASM_ARM_GUEST_ACCESS_H__
>>>=20
>>> diff --git a/xen/include/asm-x86/guest_access.h b/xen/include/asm-x86/g=
uest_access.h
>>> index 369676f31ac3..e665ca3a27af 100644
>>> --- a/xen/include/asm-x86/guest_access.h
>>> +++ b/xen/include/asm-x86/guest_access.h
>>> @@ -4,6 +4,10 @@
>>>   * Copyright (c) 2006, K A Fraser
>>>   */
>>>=20
>>> +#ifndef ALLOW_INCLUDE_ASM_GUEST_ACCESS_H
>>> +#error "asm/guest_access.h should not be included directly"
>>> +#endif
>>> +
>>>  #ifndef __ASM_X86_GUEST_ACCESS_H__
>>>  #define __ASM_X86_GUEST_ACCESS_H__
>>>=20
>>> diff --git a/xen/include/xen/guest_access.h b/xen/include/xen/guest_acc=
ess.h
>>> index 75103d30c8be..814e31329de9 100644
>>> --- a/xen/include/xen/guest_access.h
>>> +++ b/xen/include/xen/guest_access.h
>>> @@ -7,7 +7,9 @@
>>>  #ifndef __XEN_GUEST_ACCESS_H__
>>>  #define __XEN_GUEST_ACCESS_H__
>>>=20
>>> +#define ALLOW_INCLUDE_ASM_GUEST_ACCESS_H
>>>  #include <asm/guest_access.h>
>>> +#undef ALLOW_INCLUDE_ASM_GUEST_ACCESS_H
>>>  #include <xen/types.h>
>>>  #include <public/xen.h>
>> One option. Personally I'd prefer to avoid introduction of yet another
>> constant, by leveraging __XEN_GUEST_ACCESS_H__ instead.
>=20
> I thought about it but it doesn't prevent new inclusions of asm/guest_acc=
ess.h. For instance, the following would still compile:
>=20
> #include <xen/guest_access.h>
>=20
> [...]
>=20
> #include <asm/guest_access.h>
>=20
> If we want to completely prevent new inclusion, then we need a new tempor=
ary constant.

I would think that this would not handle all cases but would at least preve=
nt someone from including directly the asm header.

The solution with the define and undef does not look really nice and header=
s could become really ugly if we start doing that for
all asm headers that should not be included directly.

Cheers
Bertrand


