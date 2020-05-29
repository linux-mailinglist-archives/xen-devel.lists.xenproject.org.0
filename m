Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B67341E801A
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 16:22:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeftX-00079L-Ek; Fri, 29 May 2020 14:21:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tYAP=7L=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jeftW-00079G-AH
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 14:21:58 +0000
X-Inumbo-ID: c091a2de-a1b7-11ea-81bc-bc764e2007e4
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe06::625])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c091a2de-a1b7-11ea-81bc-bc764e2007e4;
 Fri, 29 May 2020 14:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3TsrYCiHH609KhDx/UK9fcnT62zA0TBsXE68ACIzW60=;
 b=GIzOY2Bz0jP+Qn159r68kCfi1aVpMOKe/QnqhVIaoYTHsbdV2kBUojgFofepYblgvmtxGkZSS5gw+7iG5BzIucNGZpPLg8b+ThTKxwzY7ksMdFl6fESj9XOyvtZzF1vZt03TZqg8IJcTSEOkJaRm9/XeXZweMNbE3X0bO0SnULw=
Received: from AM5PR0701CA0071.eurprd07.prod.outlook.com (2603:10a6:203:2::33)
 by VI1PR08MB3712.eurprd08.prod.outlook.com (2603:10a6:803:b9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.18; Fri, 29 May
 2020 14:21:53 +0000
Received: from VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:2:cafe::87) by AM5PR0701CA0071.outlook.office365.com
 (2603:10a6:203:2::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.7 via Frontend
 Transport; Fri, 29 May 2020 14:21:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT026.mail.protection.outlook.com (10.152.18.148) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.23 via Frontend Transport; Fri, 29 May 2020 14:21:52 +0000
Received: ("Tessian outbound cff7dd4de28a:v57");
 Fri, 29 May 2020 14:21:52 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7a8e300d250247dc
X-CR-MTA-TID: 64aa7808
Received: from aa8dbfd4d248.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 64929208-47A5-4BE4-BEC5-C87A4C337905.1; 
 Fri, 29 May 2020 14:21:46 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id aa8dbfd4d248.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 29 May 2020 14:21:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mPwyidpa9RReWN5SVb+k6uWCND3ENVTxeNVJ3flSh/R5qqgA6GR9+IEv46KwWP+R9lM8tlDOlZ8mfRDjK+QpkUTsvbTBovBLyDtLy7p0sW1ODOzRzOPHi5D2gzdAYDtEy+M9HU7I57RafgbLl94yAlZs+MQh5ftJAcdXe4OTuALvUNFKgIHCXqNm6I9ipiZ54lsavmyBOrjMEG4v+hpRBymwlyh9ePLkMe3yNfeAqeZ/ZUBVPlTxynwFQyapNyNFw/E0CYi8Jk0TbYDonioBBXUMYdvaXLF97iqcyj+J9MhKmMFXoWTHW+AGXMfcA9F9Rxoes1B+4dhTtLT8HpaD4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3TsrYCiHH609KhDx/UK9fcnT62zA0TBsXE68ACIzW60=;
 b=FBq0fNO60wuEPHd1EQ48xiyKS9AZt3TMA2jx0CamCy/XYgkLbhF5N0OxGIuvO6A6CQky0Q47Z1Ytjc8tC9esS5EO9V9QvQBaHRT40nC5OcygkkoO7tDx+3pF7UzQAVnlpksr/UKzbFqbc5Quki+beJ/nReMLqPJt9v/MX2tbSDWQvb+TMnb+JyoGpMJrJLZ0x98hYMasH6pdTc0PB2+XZzGaq0CwTck+5kUGzXq0kZkjm0TmFqo4AEpbvy4Kutmys2QKaVdUo857qq5u5Q3uvvA6Ex21u7P/bIrAA8TU9S3YO3hpaZ65IBBLAIg4Ow+NpWjCrKJH2he2LVsCUojicA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3TsrYCiHH609KhDx/UK9fcnT62zA0TBsXE68ACIzW60=;
 b=GIzOY2Bz0jP+Qn159r68kCfi1aVpMOKe/QnqhVIaoYTHsbdV2kBUojgFofepYblgvmtxGkZSS5gw+7iG5BzIucNGZpPLg8b+ThTKxwzY7ksMdFl6fESj9XOyvtZzF1vZt03TZqg8IJcTSEOkJaRm9/XeXZweMNbE3X0bO0SnULw=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB4617.eurprd08.prod.outlook.com (2603:10a6:10:75::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Fri, 29 May
 2020 14:21:45 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3045.018; Fri, 29 May 2020
 14:21:44 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [RFC PATCH 1/1] xen: Use a global mapping for runstate
Thread-Topic: [RFC PATCH 1/1] xen: Use a global mapping for runstate
Thread-Index: AQHWNP6nIxIB/r3XC025DLnqIbmaJai92N6AgADfWQCAABkLAIAASFMAgAADiACAAAHaAA==
Date: Fri, 29 May 2020 14:21:44 +0000
Message-ID: <771AA834-1A13-44C6-B7B1-FCC09F1AEB18@arm.com>
References: <cover.1590675919.git.bertrand.marquis@arm.com>
 <03e7cd740922bfbaa479f22d81d9de06f718a305.1590675919.git.bertrand.marquis@arm.com>
 <e63a83a1-7d71-9cc5-517a-275e17880e2b@xen.org>
 <3B88C76B-6972-4A66-AFDC-0B5C27FBA740@arm.com>
 <07a1008d-1acb-aab6-ab10-176e7856a296@xen.org>
 <1CEE9707-3201-4218-ACF0-7829181A769C@arm.com>
 <38115dda-f6dc-c35d-fbaa-3735456d226f@xen.org>
In-Reply-To: <38115dda-f6dc-c35d-fbaa-3735456d226f@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d2150729-0bef-493c-d669-08d803dba219
x-ms-traffictypediagnostic: DB7PR08MB4617:|VI1PR08MB3712:
X-Microsoft-Antispam-PRVS: <VI1PR08MB3712CA552528C82AF4EC2C469D8F0@VI1PR08MB3712.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 04180B6720
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: EhCtR3iAPAp+pe8p88GGiiWGAq/JDu9P4G4IEUKyd5JZjteCcaGRC+OZM3kwTnq++DdgjFXaRvNyn6cUX3jieltgK+5C4wTdQMvBFZ3voUXPmW1SnQvzqhGYLrcQfZhjjMlHs/0RlE2WSWaMm/KOy5ko3xbhqys14BkFYDa4bO5ulvz7X/ccx7svDoXuq7ahImWPh9ATfzqGiELlNCCskTjGHNZ5d7TrcYdYIioVxf4xobE3aUwEV9IhieADWQ85R+iRYJCgMTI2R+YRCQ9pODhfRJ/OeiS+4VdyEDTmf51r0GsUoXSySA0h6l2WflLR3edCa0KM9Fh3eObACQZzpg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(346002)(366004)(396003)(136003)(376002)(64756008)(2616005)(8936002)(76116006)(2906002)(91956017)(6486002)(71200400001)(26005)(36756003)(6506007)(86362001)(53546011)(66446008)(5660300002)(4326008)(186003)(7416002)(478600001)(66556008)(6916009)(66946007)(66476007)(33656002)(316002)(83380400001)(54906003)(6512007)(8676002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: +QAsLXeaqQ2gk79Tt0AjXru/FlRxpyvLniI52KlYK16k4jfzvcgGSew3MPuEF9Xf8YkmuYH1J/pz5PDKodRPWG8jj9h4Mg02xy8xuF9iekofQPzbhMBkTLz3KojgmbBGsd8wEPLA3wgw3jtwmbP7rIR4HjIVaM6iIQhcUFk7gq+ECSQMJ6Je6PReUxQM3VPQso6yl+OJxR6Lpwce3S7AJZcRo2tC6o7po/5CKSlqzzhuMsE+Ofb2jbr2nRHVCEWEkXHFaVoV6He3ct/LjZenelxsFtuJZrsT187lkLLYhqQIroX2/WR7WpuriTyB5umngyCKb2FqD44tpih4bFnI/apt0X/rQl2emLCvGwdlCb0eJMtR2PZ+JRcbxYY8YB+1i6xJq4zQpWrsluNVT0ezlXlpNYSHmQwcSYVW6szPd5UKckYDFXgU5ZwwDGW/bIvQzRl+Z/B6j0v1zXjjaYLtb46Qz7aw7duZtnDNdwT8xNoLImDeHVUMHmQ9v5n2vqlj
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <44FF4C389C814B4EB6E462C10E9DAE40@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB4617
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(396003)(136003)(376002)(346002)(39860400002)(46966005)(36756003)(6512007)(186003)(2616005)(70586007)(6862004)(70206006)(336012)(5660300002)(2906002)(478600001)(6486002)(36906005)(6506007)(53546011)(26005)(316002)(54906003)(8676002)(81166007)(4326008)(82310400002)(33656002)(83380400001)(8936002)(82740400003)(86362001)(47076004)(356005);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: dcb77e59-2662-4466-e7c1-08d803db9d8b
X-Forefront-PRVS: 04180B6720
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j0a12E5DOJC/qIAkOG//K3BLyyeL/rYP/ZicYpCXLJYSvBLFJxwnFiKUBN3BLw+NMTO6J647vne5IPPzw/c43DtPI+3hlLd+YXc40vxVfU7KiEzvrLfxeNp/koDvLZSdbAyIf88XLBr+Lmw46BB5yJyfUIAtxq3hkdV5TB7BRqUvo4ehri5TY84+XajXFyekbA07libRx3rs5k6vPGQnx+aabSjKiSim9b/5ws2lw3DVtItGIDEJkAz22/q0WffKcq5I68i4MQff1q0TwRSVvFNtxkstxhbJHgiOf2/L+7A/CN+47YI1a9gg0/pgZZOTZgZsbFhphH+pQ2yz5bXHrbTvRDpGQoiZmqV96kq7oMFUsSBttYc6/wwRtXLmEgDo1qtaMHQu9mKNzXWPOgub8A==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2020 14:21:52.3329 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2150729-0bef-493c-d669-08d803dba219
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3712
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "paul@xen.org" <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, "Xia, Hongyan" <hongyxia@amazon.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



> On 29 May 2020, at 15:15, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 29/05/2020 15:02, Bertrand Marquis wrote:
>>> On 29 May 2020, at 10:43, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> Hi Bertrand,
>>>=20
>>> On 29/05/2020 09:13, Bertrand Marquis wrote:
>>>> Hi Julien,
>>>>> On 28 May 2020, at 19:54, Julien Grall <julien@xen.org> wrote:
>>>>>=20
>>>>> Hi Bertrand,
>>>>>=20
>>>>> Thank you for the patch.
>>>>>=20
>>>>> On 28/05/2020 16:25, Bertrand Marquis wrote:
>>>>>> At the moment on Arm, a Linux guest running with KTPI enabled will
>>>>>> cause the following error when a context switch happens in user mode=
:
>>>>>> (XEN) p2m.c:1890: d1v0: Failed to walk page-table va 0xffffff837ebe0=
cd0
>>>>>> This patch is modifying runstate handling to map the area given by t=
he
>>>>>> guest inside Xen during the hypercall.
>>>>>> This is removing the guest virtual to physical conversion during con=
text
>>>>>> switches which removes the bug
>>>>>=20
>>>>> It would be good to spell out that a virtual address is not stable. S=
o relying on it is wrong.
>>>>>=20
>>>>>> and improve performance by preventing to
>>>>>> walk page tables during context switches.
>>>>>=20
>>>>> With Secret free hypervisor in mind, I would like to suggest to map/u=
nmap the runstate during context switch.
>>>>>=20
>>>>> The cost should be minimal when there is a direct map (i.e on Arm64 a=
nd x86) and still provide better performance on Arm32.
>>>> Even with a minimal cost this is still adding some non real-time behav=
iour to the context switch.
>>>=20
>>> Just to be clear, by minimal I meant the mapping part is just a virt_to=
_mfn() call and the unmapping is a NOP.
>>>=20
>>> IHMO, if virt_to_mfn() ends up to add non-RT behavior then you have muc=
h bigger problem than just this call.
>>>=20
>>>> But definitely from the security point of view as we have to map a pag=
e from the guest, we could have accessible in Xen some data that should not=
 be there.
>>>> There is a trade here where:
>>>> - xen can protect by map/unmapping
>>>> - a guest which wants to secure his data should either not use it or m=
ake sure there is nothing else in the page
>>>=20
>>> Both are valid and depends on your setup. One may want to protect all t=
he existing guests, so modifying a guest may not be a solution.
>> The fact to map/unmap is increasing the protection but not removing the =
problem completely.
>=20
> I would be curious to understand why the problem is not completely remove=
d.
>=20
> From my perspective, this covers the case where Xen could leak the inform=
ation of one domain to another domain. When there is no direct mapping, tem=
porary mappings via domain_map_page() will be either per-pCPU (or per-vCPU)=
. So the content should never be (easily) accessible by another running dom=
ain while it is mapped.
>=20
> If the guest is concerned about exposing the data to Xen, then it is a co=
mpletely different issue and should be taken care by the guest iself.

Even temporarily mapped you still have access to more then you need so you =
could potentially modify something from the guest at that point (from an in=
terrupt handler for example).
The attack surface is reduced a lot I agree but if the guest does not make =
sure that nothing else is available in the page, you can potentially still =
get an access.

Cheers
Bertrand


