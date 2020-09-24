Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBD8277386
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 16:03:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLRpl-0002qt-4U; Thu, 24 Sep 2020 14:02:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W6+g=DB=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kLRpj-0002qU-CD
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 14:02:51 +0000
X-Inumbo-ID: 6db94f6d-0505-4414-a757-286a3cfda850
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.75]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6db94f6d-0505-4414-a757-286a3cfda850;
 Thu, 24 Sep 2020 14:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EITgrlaxXCrf3TjnxUz2xAEc+4lktCe81bJ+u5lwoqQ=;
 b=PgoEFJk0R4MSD9xsSCvBPmDzG3j+echmwfNTT9/ba/yxWgWzq3QEFSR7NhyDKbMd8fljDxQcoiYnQB0q+v2s2SjMhcktOvI9Z0yC44R+v6ygM+GNigRoPSgOzmII+IVF67hfIYKL/jdFC66cm2jmsMcOXW2kH6clw6rQNJzQLS8=
Received: from DB8PR03CA0027.eurprd03.prod.outlook.com (2603:10a6:10:be::40)
 by AM5PR0801MB1635.eurprd08.prod.outlook.com (2603:10a6:203:3b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Thu, 24 Sep
 2020 14:02:49 +0000
Received: from DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:be:cafe::3c) by DB8PR03CA0027.outlook.office365.com
 (2603:10a6:10:be::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22 via Frontend
 Transport; Thu, 24 Sep 2020 14:02:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT031.mail.protection.outlook.com (10.152.20.142) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.21 via Frontend Transport; Thu, 24 Sep 2020 14:02:48 +0000
Received: ("Tessian outbound 7fc8f57bdedc:v64");
 Thu, 24 Sep 2020 14:02:48 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 15b5b353522057b1
X-CR-MTA-TID: 64aa7808
Received: from 00bb86dacad2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F93D291E-B7A8-4F80-88F8-B69947C05BFE.1; 
 Thu, 24 Sep 2020 14:02:34 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 00bb86dacad2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 24 Sep 2020 14:02:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J2q5RP676Qc9B/FWof212v8zbXFM/YyDCPgxouclA2P8w6AlZRFbQABoY6yJ5NMQi7VlYpi9u6JZ3xhyIblNBR00n1cZH2LNoqf7xK0easGns0y8lzMMg9yPkxJDmvb01RDAwqXnH1v7u+sHSRtRhsUDPtEcionaCSBBAKsd01v7vAZ87NVZzBHQtlTPC7VpdbAjITkjDuvk4BXThtVeLdpd1LeLNLxySSa4XK4i4JzrtTm4Um7b5cF28fLKj/RtCN4of+OYylZAZErav11jPmPSR1McbHFrRwoa25ryxl1U9BJ6cXe+RKrnYgRXYHLZNIX++pvlLgO0bxA3ejmrVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EITgrlaxXCrf3TjnxUz2xAEc+4lktCe81bJ+u5lwoqQ=;
 b=Ohf1qziLg+g1P8pPG6fk50pq54OFlTDpj3TKZsI24yG7s9hLBuqlESDQUqXNFMr+YfAXJbGRvRF6z/4VdHU0bAPE09zechxm2+Ub8rZdHRc6TFRUPNAqz264qOHAzrMEQFhMLR9sZzIKnPFEy/430lG8AA3tk4V8TinlUCaJ5CpNQCSyvDTL5ctswoQBu7+UOPCg9RyVNHww0IIEuQqqJCGbpcKAYnG0BI70TyF11LKH0JX/BZ0SDfKxmigS94o6M4QwsGKmmA3yDQCxBCLdUzqdQA6t7tBiLdqwfEhqSKcU3GNcv2QCn4LgJWjK4RneiI+xeB/ti2ymyi3KHwY4xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EITgrlaxXCrf3TjnxUz2xAEc+4lktCe81bJ+u5lwoqQ=;
 b=PgoEFJk0R4MSD9xsSCvBPmDzG3j+echmwfNTT9/ba/yxWgWzq3QEFSR7NhyDKbMd8fljDxQcoiYnQB0q+v2s2SjMhcktOvI9Z0yC44R+v6ygM+GNigRoPSgOzmII+IVF67hfIYKL/jdFC66cm2jmsMcOXW2kH6clw6rQNJzQLS8=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0802MB2296.eurprd08.prod.outlook.com (2603:10a6:4:87::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Thu, 24 Sep
 2020 14:02:33 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e%6]) with mapi id 15.20.3412.020; Thu, 24 Sep 2020
 14:02:33 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, "open list:X86"
 <xen-devel@lists.xenproject.org>, Julien Grall <jgrall@amazon.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
 Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Wei Liu
 <wl@xen.org>
Subject: Re: [PATCH] SUPPORT.MD: Clarify the support state for the Arm
 SMMUv{1, 2} drivers
Thread-Topic: [PATCH] SUPPORT.MD: Clarify the support state for the Arm
 SMMUv{1, 2} drivers
Thread-Index: AQHWkYOU18uuLvRXIEaUzkgFl/gQ5Kl2C72AgAAHeICAACwkAIAAPxGAgAFVQAA=
Date: Thu, 24 Sep 2020 14:02:33 +0000
Message-ID: <E53A88E5-87E1-4239-85BA-99D585272AB3@arm.com>
References: <20200923082832.20038-1-julien@xen.org>
 <1D6392F2-F4EC-4025-A793-22EABF85AA0E@arm.com>
 <3c64f36f-6b43-6f73-e344-70b084f1f505@xen.org>
 <C14129BD-09F3-4297-BBD6-9F3C5AA82FA7@arm.com>
 <alpine.DEB.2.21.2009231034510.1495@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2009231034510.1495@sstabellini-ThinkPad-T480s>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 25ecfe52-702e-4692-6582-08d860928537
x-ms-traffictypediagnostic: DB6PR0802MB2296:|AM5PR0801MB1635:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1635DFDA6E4E39422C9D4F729D390@AM5PR0801MB1635.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Ygfa0YxtBHKPBZdm5WuHCFUPuy8aelDO4vQaZVD+B4/ilHyO5uOlT3EDlPzv7eVgYXe6k7Lf01mfopPqw+UACumCuoYDlfmkEa6bAF14hTkxaqCfzERcZwcK3TNW7tr6fQ99DbMn86NlQ856YhUYgFXku2qXWJphnK9DCIlnKVg41Yyl05APuxrr+4TdHJJNawQNET2J/m5az3uCuhx0+6jOGBZ74lPDO8/C6pE/KzL+AD+GRGg/lwxH1grxXRlEl65as+oe35MfmIQOXvIS3CLmULlaHcVa3pt30cOtJy5g/ptY3yVHM0HxsDTyhZfKV/nB8XjkscINcwDnPkC+Ug==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(396003)(136003)(346002)(376002)(8676002)(316002)(6512007)(26005)(186003)(33656002)(36756003)(2616005)(478600001)(8936002)(91956017)(66556008)(53546011)(64756008)(5660300002)(66446008)(54906003)(66946007)(86362001)(6506007)(6916009)(2906002)(83380400001)(6486002)(71200400001)(4326008)(76116006)(66476007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 3RP85Gm2gm1AKzU0e3SzNoCzL0iuMtCDEqABT5uGea1/ultdlxOjhnZKCWocfnX9mGEt8b7iFjcC+rQ0DLXn/ZYIRlXQw1H5X7Jo7DRi1cH6YEdeYwhU+p/EFETHDCq2NiPYgMogfmUv3V7BBO6BkMLMwrEf33FttOuTZ1mxvH3DdHNPsIt+HlVOJsfe+nm9oQTD/Qkg311D1kdqbTl1u0zd0019zn3bBqUfRo/cpYCpw+B4bcJcyFrdt8zGf1+OKXl4OmxkdAVwQIAUlQs4wjTRbJpdKrMWKDD7iyP9InUvDFI155g35G0BcZb1YL2wXk42KBrmxfRyeVp1mfCT/gNeGxxYmeQYq08o51dgGwzcibGk/T6fKHPGjvj4yMjULJ2uR/tj6sGMVVPZV9EigPUtG1Rhnv34w5Cqb4NHb7wEYdv/UcHVYXVYz2Av+G/oyScLKDisKKszGgEm0prSI7SGXXpVcOUetotJ/an/r0zIT/XE3zfhRlwoWq3OoLYCL9g4qvNW6a33HSobAhe0+lW7d3dH7FvK2b2rlH9t2bGtV/+RLDJg4VAphLXX3EVFjAxgfL9dMQvKW9nnjbEebGlAyEVJRV1+Gcmceb4vLX91oyca3VBhMxpgtp2kQrC+utOn4NYH30Glwip9dTcn0w==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EFD08BDE1F47984D9036B24B9AFD25B2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2296
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7eb07417-252e-4f5c-845f-08d860927c07
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IjVbdVj+rCx6a7eWbdlTRs3x4bcCns0wAr2iWiliSz1/WQKScQjIiYSuH0yIcYhlRYmFADrA6d8vvA5kto5Q4kUMNStFSbmLsQ0uK4f3aN/fAphVJP7Ed1NKL+Y0M0poNb6X36paVzBdor4+EUNLBJdsPdHDCvW5krMOtyRsGYufZhD686dNH0Vrj/exNENFsQSc/dOBOp+PVHjj7XQg1UoGsJ+UMGaO8j7rVL9PXKIOZHILe0nGGw3ZGKsiduFD+5mA3oOZml+mI2zoBgVsqtcJjZuo2ZNp/8IdMJap0fT9t9B9h2SUvV1STsvJd994EOFli1uNEyparFCyIOt6uG5ZkTa+2vohLcx7yHZ2lsInkXFw2eK2pNBtccSwyUi0BcxnZOvTzMdXr04QMNv1xZHziOvLbGhdzN6PRkFYndUvy4lA5XsJzXM1M3InXIWw
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(396003)(39850400004)(346002)(376002)(136003)(46966005)(316002)(6862004)(36756003)(47076004)(81166007)(82740400003)(86362001)(356005)(478600001)(4326008)(6512007)(33656002)(83380400001)(70206006)(26005)(8676002)(53546011)(6506007)(5660300002)(70586007)(2616005)(2906002)(82310400003)(6486002)(54906003)(8936002)(186003)(336012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2020 14:02:48.9337 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25ecfe52-702e-4692-6582-08d860928537
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1635
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

Hi Stefano,

> On 23 Sep 2020, at 18:41, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Wed, 23 Sep 2020, Bertrand Marquis wrote:
>>> On 23 Sep 2020, at 12:17, Julien Grall <julien@xen.org> wrote:
>>> On 23/09/2020 11:50, Bertrand Marquis wrote:
>>>> Hi,
>>>>> On 23 Sep 2020, at 09:28, Julien Grall <julien@xen.org> wrote:
>>>>>=20
>>>>> From: Julien Grall <jgrall@amazon.com>
>>>>>=20
>>>>> SMMUv{1, 2} are both marked as security supported, so we would
>>>>> technically have to issue an XSA for any IOMMU security bug.
>>>>>=20
>>>>> However, at the moment, device passthrough is not security supported
>>>>> on Arm and there is no plan to change that in the next few months.
>>>>>=20
>>>>> Therefore, mark Arm SMMUv{1, 2} as supported but not security support=
ed.
>>>>>=20
>>>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>>=20
>>> Thanks!
>>>=20
>>>> We will publish in the next week a first implementation of SMMUv3 supp=
ort which might make sense to have fully Supported.
>>>=20
>>> I am not sure whether you include security supported in your "fully sup=
ported"
>>=20
>> If we something is missing we will be happy to fix it to reach this goal=
.
>>=20
>>>=20
>>> However, I would consider to follow the same model as we did with the I=
PMMU. The driver would first be marked as a technical preview to allow more=
 testing in the community.
>>=20
>> I was not meaning to have this at the very beginning.
>> More that it make more sense in general to have SMMUv3 with 2 level of p=
age table supporting this then old SMMU versions.
>=20
> Just as a clarification, the distinction that we are making here is not
> to "downgrade" SMMUv1/2, but to clarify that it is not security
> supported. SMMUv1/2 is still fully supported.
>=20
> Security support means that the security team will attempt to fix under
> closed door any bugs affecting it, and pre-disclose the fix at the
> appropriate time before making it fully public. It is a pretty heavy
> process in comparison to normal bug fixing and in the case of the SMMU
> doesn't make a lot of sense because device assignment in general is
> currently not security supported.

Thanks for the clarification.
Of course i never wanted to remove or downgrade SMMUv1/2 support,.

>=20
> For SMMUv3, I think it makes sense for it to possibly start as "tech
> preview" for one release or two, then become "supported, not security
> supported".

Ok.

>=20
> Of course if one day we make the decision to turn device assignment
> security supported, then it makes sense to also change one or more SMMU
> drivers to security supported.

Make sense yes, one does not go with the other.

Regards
Bertrand



