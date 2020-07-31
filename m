Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA70B2346AF
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 15:17:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1UuW-0004od-IP; Fri, 31 Jul 2020 13:17:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wy6+=BK=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1k1UuV-0004oG-EL
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 13:17:19 +0000
X-Inumbo-ID: 289b6d98-d330-11ea-abaf-12813bfff9fa
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.4.43]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 289b6d98-d330-11ea-abaf-12813bfff9fa;
 Fri, 31 Jul 2020 13:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZrFKs3O/XEAAg4MrxELVagdkdAmjbsQjQzYOmGjsHz0=;
 b=EGSb+USpkFdLGJKot2svpSl8qcNpspPHUvYGkhh6MX9R5pGYocFvnnvTsfc88USyUuyRB3o2Xv7VRnyYH1iIs+0nnppe/6axKAwLlTiL1VulOJrUA1HlGD1RNQFm+/GGi19eENDg6M564tlCoqAlHau5NrDIIFX5upRyKF2xX2A=
Received: from AM7PR03CA0002.eurprd03.prod.outlook.com (2603:10a6:20b:130::12)
 by DBAPR08MB5701.eurprd08.prod.outlook.com (2603:10a6:10:1a6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.26; Fri, 31 Jul
 2020 13:17:17 +0000
Received: from AM5EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::78) by AM7PR03CA0002.outlook.office365.com
 (2603:10a6:20b:130::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend
 Transport; Fri, 31 Jul 2020 13:17:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT064.mail.protection.outlook.com (10.152.17.53) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.20 via Frontend Transport; Fri, 31 Jul 2020 13:17:16 +0000
Received: ("Tessian outbound c83312565ef4:v62");
 Fri, 31 Jul 2020 13:17:16 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 424f4b2185d02200
X-CR-MTA-TID: 64aa7808
Received: from 85bc4615d114.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0685CC8F-A154-448D-95A8-B72D737D8736.1; 
 Fri, 31 Jul 2020 13:17:10 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 85bc4615d114.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 31 Jul 2020 13:17:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kt2bbB3CI5HEWv53wYHdZVhvud799UPFB+MZ700S7+tTZb+oeOo/Ad5KNtcGIPMvIWxwjndD6UC9iU1WnfTwUKJm20qixH4mXES9m3kTrmVnSnVjYuVlW53PwPh6OAIMI8S87YIolUX4wqjlJTniEL4ThwQyAGHVZ7FapRCAMnvahNogN5AnUk8HQEb0Tyaulm1o4ih21qmsXWrvmZ0SQ7HZj8g4tar/N+Ilf9v9jpw9dPVWMXlWuGKjFWSlmZgLiThhZBRQM6emnxj9YUQ6aDw0nPhvDQTNewHr7qrAqhDfdTp6gFYxpNqvdFOqAX83T+fBbF5iOatryWd1KCwOrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZrFKs3O/XEAAg4MrxELVagdkdAmjbsQjQzYOmGjsHz0=;
 b=BYugdG1JT8K9XZO2dIC8p6LTYMPEUEdYyNnA6uYPLMqeQR/+/Yn8+CdY8JDoUvM3gFXsRcCK/MvMHD11C/kflMjfKI8a3IYt3VqjJpVQGXg3EhQ+hB3c862bN9u+maZGAIsEoRFZxarMpVUxncqHF4Ddy5re1x/VOwPEpev3Dpn/QMfKpr75gkHwTsTkUgXl4gSUrlJ5XyZhJ95LRxga+a040f54zb7er455zmLvJlD0P9Ahe7f/LwworxZkr559nyYK4znb+ipFYWHqAbZdZO3RcGn8JJ4SmiWgnVJaimu1ggH91d2ydFDdZGFAxG3yc0yrJcghexEV1Fy/w4exHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZrFKs3O/XEAAg4MrxELVagdkdAmjbsQjQzYOmGjsHz0=;
 b=EGSb+USpkFdLGJKot2svpSl8qcNpspPHUvYGkhh6MX9R5pGYocFvnnvTsfc88USyUuyRB3o2Xv7VRnyYH1iIs+0nnppe/6axKAwLlTiL1VulOJrUA1HlGD1RNQFm+/GGi19eENDg6M564tlCoqAlHau5NrDIIFX5upRyKF2xX2A=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB8PR08MB3996.eurprd08.prod.outlook.com (2603:10a6:10:a5::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Fri, 31 Jul
 2020 13:17:09 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3239.020; Fri, 31 Jul 2020
 13:17:09 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3] xen/arm: Convert runstate address during hypcall
Thread-Topic: [PATCH v3] xen/arm: Convert runstate address during hypcall
Thread-Index: AQHWZluWPRKsKyuZRkCQVDwO60tsvakgmVkAgABK7QCAAMjLAA==
Date: Fri, 31 Jul 2020 13:17:09 +0000
Message-ID: <91E1094A-C03D-4DD7-AC4B-0A01330A043F@arm.com>
References: <3911d221ce9ed73611b93aa437b9ca227d6aa201.1596099067.git.bertrand.marquis@arm.com>
 <f48f81d5-589e-3f75-1044-583114bf497e@xen.org>
 <alpine.DEB.2.21.2007301422030.1767@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2007301422030.1767@sstabellini-ThinkPad-T480s>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [90.126.203.125]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 08fded95-64dd-4069-6080-08d835540bf8
x-ms-traffictypediagnostic: DB8PR08MB3996:|DBAPR08MB5701:
X-Microsoft-Antispam-PRVS: <DBAPR08MB5701E5718031FE3674E76C689D4E0@DBAPR08MB5701.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: ozYMh+6RfzVVTT9W98d9TjK3UFW062LvZZwGaUjrayjDoit6GbNq/OlE6Hr+xl/lqoauN8igEKnK0ZqKLtl8UhmyxdbEtU/ybNrDmsqxCsyC/ToI92J+CPOEr0Q2ZCF35qV5yR39RKAFBqcsfJTptyTDE4kh8jLWKE3i6ud2fXSd8bQh2rf13YtLYRhjo7wdzjG5lvxZ86d80ybD6PI+odOe31c+m+lUzobUGdfftCVGWHMdd+9C5mEnVV+zIiW2KbILs1ydMgc5WcYXIL9pq5V/5CsadAIpI6Ih1r78jj0kfjczMckH+VFhuJhbpsPeDLbj5dfZmkVY7sDCf1nfYw==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(366004)(346002)(39860400002)(396003)(376002)(2906002)(478600001)(54906003)(6512007)(30864003)(71200400001)(316002)(4326008)(53546011)(26005)(6506007)(36756003)(7416002)(66946007)(83380400001)(6486002)(91956017)(2616005)(33656002)(8936002)(8676002)(186003)(66446008)(64756008)(66556008)(66476007)(76116006)(6916009)(86362001)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: HFudRaSra0vzrirgy7bTwzYQveZFd7z1LD/N63lF9X8iRYlRGRLH0RGblNp0Vr92GN/5ORu2OWZIcaseAG7bzbiSG3YGs301xUTf0iCIUH2IIoU72bvjoGs7/TWnm8vUF7GO1ZAa34wDWzoytKOuaUTQOK/4xO9Z34DINf7FdjHE6CDjGcOlnEBdQRC04cuSwJ0JqN4csSaEgFuIOWh1RxfX1fD/ii6WexCUA8T30jnDwNNvp6J1/vtMSzx10XyN7dbFrYbRLq1u47aXgH3AxOjg2xi8UvzG71iJAPyhIO/pnRO3baTb7uOxZwfmbWL0YQqI5qgYJj5IoiKbqQO9JHBuUJoddb6PGP881xZauDs8jl44ZW/3Eiqlq9t+e8rvc/12YcissBo1ROU65XnmlqSoh8y72M5NGw57YNXgqqX067z6WwKFHWSetEFmZSj5tvUG/c8s38VzeZvIYXEC79m7yys6cMjwQwtRudp32wM+yXY/RszG0OHdbNekmDyfmEbBgkN0Ieb4a08LInv1jZwLBX5tDf217V+zehxm4K/9NRnCeZ8cE+z+jiCZNYcUoV7knTVIhAQbMl+e+MPuQ60udXNNbkOgnHkdJeaVUtQByW3Q4X3kYUHsDgU/iYOh+U4uELgiLJkfsnF1+ivbFg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <84B27139DA7DC94D8ABFECC61B5DDE86@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB3996
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 03ca6c3f-6579-426e-17f0-08d8355407d4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pOrPxLxAigHmruF/ismgaXH3tQ/GZ9OJjDrsrAfq0nyxw843yIAgM29GOeXyuSZPSGFk375/a2pH3WYWklZNhWvs+fl8FYDDoFtcm9riO4ES7a4D3nsQFa/x0bWZkid6MVr1w09iWInQl4GHK8YtVxypzA+oqO041bny1rK7Cp+obeto4p9bFj83IclE+ManoeSi7qoCdrvXwXHosuiIdJLEQAhH4+e0/nmluNZo/p0AiMQtaSLP+8CibCLpLfww5gaPV4twUKU3MqM9jKdip6kGWRibNv1GligEHVGGZKXIR9UhFpjMkWfqWmM3FDH0uF4bBgGlgm/oPEDmHg5woSUuh2MEwX9pb9voamkhqY4++OyyjhC1ZjoeVozbznKliDOkdxfFlp5TCJUaIIRq6Q==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(396003)(136003)(346002)(376002)(46966005)(2906002)(82310400002)(30864003)(5660300002)(2616005)(26005)(6506007)(53546011)(478600001)(336012)(186003)(8936002)(4326008)(36756003)(81166007)(6862004)(6486002)(47076004)(86362001)(8676002)(82740400003)(36906005)(6512007)(83380400001)(356005)(33656002)(70586007)(316002)(70206006)(107886003)(54906003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2020 13:17:16.6507 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08fded95-64dd-4069-6080-08d835540bf8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5701
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
Cc: Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



> On 31 Jul 2020, at 03:18, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Thu, 30 Jul 2020, Julien Grall wrote:
>> Hi Bertrand,
>>=20
>> To avoid extra work on your side, I would recommend to wait a bit before
>> sending a new version. It would be good to at least settle the conversat=
ion in
>> v2 regarding the approach taken.
>>=20
>> On 30/07/2020 11:24, Bertrand Marquis wrote:
>>> At the moment on Arm, a Linux guest running with KTPI enabled will
>>> cause the following error when a context switch happens in user mode:
>>> (XEN) p2m.c:1890: d1v0: Failed to walk page-table va 0xffffff837ebe0cd0
>>>=20
>>> The error is caused by the virtual address for the runstate area
>>> registered by the guest only being accessible when the guest is running
>>> in kernel space when KPTI is enabled.
>>>=20
>>> To solve this issue, this patch is doing the translation from virtual
>>> address to physical address during the hypercall and mapping the
>>> required pages using vmap. This is removing the conversion from virtual
>>> to physical address during the context switch which is solving the
>>> problem with KPTI.
>>=20
>> To echo what Jan said on the previous version, this is a change in a sta=
ble
>> ABI and therefore may break existing guest. FAOD, I agree in principle w=
ith
>> the idea. However, we want to explain why breaking the ABI is the *only*
>> viable solution.
>>=20
>> From my understanding, it is not possible to fix without an ABI breakage
>> because the hypervisor doesn't know when the guest will switch back from
>> userspace to kernel space. The risk is the information provided by the
>> runstate wouldn't contain accurate information and could affect how the =
guest
>> handle stolen time.
>>=20
>> Additionally there are a few issues with the current interface:
>>   1) It is assuming the virtual address cannot be re-used by the userspa=
ce.
>> Thanksfully Linux have a split address space. But this may change with K=
PTI in
>> place.
>>   2) When update the page-tables, the guest has to go through an invalid
>> mapping. So the translation may fail at any point.
>>=20
>> IOW, the existing interface can lead to random memory corruption and
>> inacurracy of the stolen time.
>>=20
>>>=20
>>> This is done only on arm architecture, the behaviour on x86 is not
>>> modified by this patch and the address conversion is done as before
>>> during each context switch.
>>>=20
>>> This is introducing several limitations in comparison to the previous
>>> behaviour (on arm only):
>>> - if the guest is remapping the area at a different physical address Xe=
n
>>> will continue to update the area at the previous physical address. As
>>> the area is in kernel space and usually defined as a global variable th=
is
>>> is something which is believed not to happen. If this is required by a
>>> guest, it will have to call the hypercall with the new area (even if it
>>> is at the same virtual address).
>>> - the area needs to be mapped during the hypercall. For the same reason=
s
>>> as for the previous case, even if the area is registered for a differen=
t
>>> vcpu. It is believed that registering an area using a virtual address
>>> unmapped is not something done.
>>=20
>> This is not clear whether the virtual address refer to the current vCPU =
or the
>> vCPU you register the runstate for. From the past discussion, I think yo=
u
>> refer to the former. It would be good to clarify.
>>=20
>> Additionally, all the new restrictions should be documented in the publi=
c
>> interface. So an OS developper can find the differences between the
>> architectures.
>=20
> Just to paraphrase what Julien wrote, it would be good to improve the
> commit message with the points suggested and also write a note in the
> header file about the changes to the interface.

Ok i wil do that.

>=20
>=20
>> To answer Jan's concern, we certainly don't know all the guest OSes exis=
ting,
>> however we also need to balance the benefit for a large majority of the =
users.
>>=20
>> From previous discussion, the current approach was deemed to be acceptab=
le on
>> Arm and, AFAICT, also x86 (see [1]).
>>=20
>> TBH, I would rather see the approach to be common. For that, we would an
>> agreement from Andrew and Jan in the approach here. Meanwhile, I think t=
his is
>> the best approach to address the concern from Arm users.
>=20
> +1
>=20
>=20
>>> inline functions in headers could not be used as the architecture
>>> domain.h is included before the global domain.h making it impossible
>>> to use the struct vcpu inside the architecture header.
>>> This should not have any performance impact as the hypercall is only
>>> called once per vcpu usually.
>>>=20
>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>>=20
>>> ---
>>>   Changes in v2
>>>     - use vmap to map the pages during the hypercall.
>>>     - reintroduce initial copy during hypercall.
>>>=20
>>>   Changes in v3
>>>     - Fix Coding style
>>>     - Fix vaddr printing on arm32
>>>     - use write_atomic to modify state_entry_time update bit (only
>>>     in guest structure as the bit is not used inside Xen copy)
>>>=20
>>> ---
>>>  xen/arch/arm/domain.c        | 161 ++++++++++++++++++++++++++++++-----
>>>  xen/arch/x86/domain.c        |  29 ++++++-
>>>  xen/arch/x86/x86_64/domain.c |   4 +-
>>>  xen/common/domain.c          |  19 ++---
>>>  xen/include/asm-arm/domain.h |   9 ++
>>>  xen/include/asm-x86/domain.h |  16 ++++
>>>  xen/include/xen/domain.h     |   5 ++
>>>  xen/include/xen/sched.h      |  16 +---
>>>  8 files changed, 206 insertions(+), 53 deletions(-)
>>>=20
>>> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
>>> index 31169326b2..8b36946017 100644
>>> --- a/xen/arch/arm/domain.c
>>> +++ b/xen/arch/arm/domain.c
>>> @@ -19,6 +19,7 @@
>>>  #include <xen/sched.h>
>>>  #include <xen/softirq.h>
>>>  #include <xen/wait.h>
>>> +#include <xen/vmap.h>
>>>    #include <asm/alternative.h>
>>>  #include <asm/cpuerrata.h>
>>> @@ -275,36 +276,156 @@ static void ctxt_switch_to(struct vcpu *n)
>>>      virt_timer_restore(n);
>>>  }
>>>  -/* Update per-VCPU guest runstate shared memory area (if registered).=
 */
>>> -static void update_runstate_area(struct vcpu *v)
>>> +static void cleanup_runstate_vcpu_locked(struct vcpu *v)
>>>  {
>>> -    void __user *guest_handle =3D NULL;
>>> +    if ( v->arch.runstate_guest )
>>> +    {
>>> +        vunmap((void *)((unsigned long)v->arch.runstate_guest &
>>> PAGE_MASK));
>>> +
>>> +        put_page(v->arch.runstate_guest_page[0]);
>>> +
>>> +        if ( v->arch.runstate_guest_page[1] )
>>> +            put_page(v->arch.runstate_guest_page[1]);
>>> +
>>> +        v->arch.runstate_guest =3D NULL;
>>> +    }
>>> +}
>>> +
>>> +void arch_vcpu_cleanup_runstate(struct vcpu *v)
>>> +{
>>> +    spin_lock(&v->arch.runstate_guest_lock);
>>> +
>>> +    cleanup_runstate_vcpu_locked(v);
>>> +
>>> +    spin_unlock(&v->arch.runstate_guest_lock);
>>> +}
>>> +
>>> +static int setup_runstate_vcpu_locked(struct vcpu *v, vaddr_t vaddr)
>>> +{
>>> +    unsigned int offset;
>>> +    mfn_t mfn[2];
>>> +    struct page_info *page;
>>> +    unsigned int numpages;
>>>      struct vcpu_runstate_info runstate;
>>> +    void *p;
>>>  -    if ( guest_handle_is_null(runstate_guest(v)) )
>>> -        return;
>>> +    /* user can pass a NULL address to unregister a previous area */
>>> +    if ( vaddr =3D=3D 0 )
>>> +        return 0;
>>> +
>>> +    offset =3D vaddr & ~PAGE_MASK;
>>> +
>>> +    /* provided address must be aligned to a 64bit */
>>> +    if ( offset % alignof(struct vcpu_runstate_info) )
>>=20
>> This new restriction wants to be explained in the commit message and pub=
lic
>> header.
>>=20
>>> +    {
>>> +        gprintk(XENLOG_WARNING, "Cannot map runstate pointer at
>>> 0x%"PRIvaddr
>>> +                ": Invalid offset\n", vaddr);
>>=20
>> We usually enforce 80 character per lines except for format string. So i=
t is
>> easier to grep them in the code.
>>=20
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    page =3D get_page_from_gva(v, vaddr, GV2M_WRITE);
>>> +    if ( !page )
>>> +    {
>>> +        gprintk(XENLOG_WARNING, "Cannot map runstate pointer at
>>> 0x%"PRIvaddr
>>> +                ": Page is not mapped\n", vaddr);
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    mfn[0] =3D page_to_mfn(page);
>>> +    v->arch.runstate_guest_page[0] =3D page;
>>> +
>>> +    if ( offset > (PAGE_SIZE - sizeof(struct vcpu_runstate_info)) )
>>> +    {
>>> +        /* guest area is crossing pages */
>>> +        page =3D get_page_from_gva(v, vaddr + PAGE_SIZE, GV2M_WRITE);
>>> +        if ( !page )
>>> +        {
>>> +            put_page(v->arch.runstate_guest_page[0]);
>>> +            gprintk(XENLOG_WARNING,
>>> +                    "Cannot map runstate pointer at 0x%"PRIvaddr
>>> +                    ": 2nd Page is not mapped\n", vaddr);
>>> +            return -EINVAL;
>>> +        }
>>> +        mfn[1] =3D page_to_mfn(page);
>>> +        v->arch.runstate_guest_page[1] =3D page;
>>> +        numpages =3D 2;
>>> +    }
>>> +    else
>>> +    {
>>> +        v->arch.runstate_guest_page[1] =3D NULL;
>>> +        numpages =3D 1;
>>> +    }
>>>  -    memcpy(&runstate, &v->runstate, sizeof(runstate));
>>> +    p =3D vmap(mfn, numpages);
>>> +    if ( !p )
>>> +    {
>>> +        put_page(v->arch.runstate_guest_page[0]);
>>> +        if ( numpages =3D=3D 2 )
>>> +            put_page(v->arch.runstate_guest_page[1]);
>>>  -    if ( VM_ASSIST(v->domain, runstate_update_flag) )
>>> +        gprintk(XENLOG_WARNING, "Cannot map runstate pointer at
>>> 0x%"PRIvaddr
>>> +                ": vmap error\n", vaddr);
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    v->arch.runstate_guest =3D p + offset;
>>> +
>>> +    if (v =3D=3D current)
>>> +        memcpy(v->arch.runstate_guest, &v->runstate, sizeof(v->runstat=
e));
>>> +    else
>>>      {
>>> -        guest_handle =3D &v->runstate_guest.p->state_entry_time + 1;
>>> -        guest_handle--;
>>> -        runstate.state_entry_time |=3D XEN_RUNSTATE_UPDATE;
>>> -        __raw_copy_to_guest(guest_handle,
>>> -                            (void *)(&runstate.state_entry_time + 1) -=
 1,
>>> 1);
>>> -        smp_wmb();
>>> +        vcpu_runstate_get(v, &runstate);
>>> +        memcpy(v->arch.runstate_guest, &runstate, sizeof(v->runstate))=
;
>>>      }
>>>  -    __copy_to_guest(runstate_guest(v), &runstate, 1);
>>> +    return 0;
>>> +}
>>> +
>>> +int arch_vcpu_setup_runstate(struct vcpu *v,
>>> +                             struct vcpu_register_runstate_memory_area
>>> area)
>>> +{
>>> +    int rc;
>>> +
>>> +    spin_lock(&v->arch.runstate_guest_lock);
>>> +
>>> +    /* cleanup if we are recalled */
>>> +    cleanup_runstate_vcpu_locked(v);
>>> +
>>> +    rc =3D setup_runstate_vcpu_locked(v, (vaddr_t)area.addr.v);
>>> +
>>> +    spin_unlock(&v->arch.runstate_guest_lock);
>>>  -    if ( guest_handle )
>>> +    return rc;
>>> +}
>>> +
>>> +
>>> +/* Update per-VCPU guest runstate shared memory area (if registered). =
*/
>>> +static void update_runstate_area(struct vcpu *v)
>>> +{
>>> +    spin_lock(&v->arch.runstate_guest_lock);
>>> +
>>> +    if ( v->arch.runstate_guest )
>>>      {
>>> -        runstate.state_entry_time &=3D ~XEN_RUNSTATE_UPDATE;
>>> -        smp_wmb();
>>> -        __raw_copy_to_guest(guest_handle,
>>> -                            (void *)(&runstate.state_entry_time + 1) -=
 1,
>>> 1);
>>> +        if ( VM_ASSIST(v->domain, runstate_update_flag) )
>>> +        {
>>> +            v->runstate.state_entry_time |=3D XEN_RUNSTATE_UPDATE;
>>> +            write_atomic(&(v->arch.runstate_guest->state_entry_time),
>>> +                    v->runstate.state_entry_time);
>>=20
>> NIT: You want to indent v-> at the same level as the argument from the f=
irst
>> line.
>>=20
>> Also, I think you are missing a smp_wmb() here.
>=20
> I just wanted to add that I reviewed the patch and aside from the
> smp_wmb (and the couple of code style NITs), there is no other issue in
> the patch that I could find. No further comments from my side.
>=20
>=20
>>> +        }
>>> +
>>> +        memcpy(v->arch.runstate_guest, &v->runstate, sizeof(v->runstat=
e));
>>> +
>>> +        if ( VM_ASSIST(v->domain, runstate_update_flag) )
>>> +        {
>>> +            /* copy must be done before switching the bit */
>>> +            smp_wmb();
>>> +            v->runstate.state_entry_time &=3D ~XEN_RUNSTATE_UPDATE;
>>> +            write_atomic(&(v->arch.runstate_guest->state_entry_time),
>>> +                    v->runstate.state_entry_time);
>>=20
>> Same remark for the indentation.


