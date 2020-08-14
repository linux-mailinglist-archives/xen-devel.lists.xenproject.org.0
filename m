Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D76052446CC
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 11:14:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6Vmb-0000ak-Qv; Fri, 14 Aug 2020 09:13:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ruf4=BY=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1k6Vmb-0000ad-03
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 09:13:53 +0000
X-Inumbo-ID: 6eb1c74c-baad-4886-ba2e-87aeb0cf6774
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.70]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6eb1c74c-baad-4886-ba2e-87aeb0cf6774;
 Fri, 14 Aug 2020 09:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNVUvGeqL65h8hoc3SNuFA9F1wP7HAY0b/e9pmSGbEI=;
 b=vHRyd5gP2byNIQtnkXtz2TSaqeQJDRkxMjoDmUo4YS6pCg8/XspyN8gb/GOX/dsXiqSJAyljMJiQAcE6xYXuymtz6dBO6r0ncC6pQ0fB61seyFKStYJjodLFQe9X9hwSUGvzT/iejukrDe4pv/w1Gs5jR6suzdwkadwIyHxIaf8=
Received: from AM0PR01CA0127.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::32) by DBAPR08MB5799.eurprd08.prod.outlook.com
 (2603:10a6:10:1b2::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Fri, 14 Aug
 2020 09:13:49 +0000
Received: from AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:168:cafe::11) by AM0PR01CA0127.outlook.office365.com
 (2603:10a6:208:168::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16 via Frontend
 Transport; Fri, 14 Aug 2020 09:13:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT056.mail.protection.outlook.com (10.152.17.224) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.16 via Frontend Transport; Fri, 14 Aug 2020 09:13:49 +0000
Received: ("Tessian outbound 195a290eb161:v64");
 Fri, 14 Aug 2020 09:13:01 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f3754c189b67494e
X-CR-MTA-TID: 64aa7808
Received: from d3d4a66fe849.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CBCC16F8-7562-4AD8-A03D-3B4D85C90D2D.1; 
 Fri, 14 Aug 2020 09:12:56 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d3d4a66fe849.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 14 Aug 2020 09:12:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SYJ33kFu91RHA/IsWk2sOnQuDmcB+EuCXpYhWtz+KddtClwZ0NgwykZo79CunW1Z8lZqbzRcFrgzWuyceYZtjNxybWvI7f93qybnnJ6YOAMOePtMjADnssQBmz+7VQqw7KeklOYlWVBSGyv+k3AIPyw0gaCMBbjL4nf4RJLi7KVwmkUeF3mLdd4O5nXt+2Ptq+GTfep5sKrEIWejR/Xn2cqRGjbN/EyUFpQ3iBoIJLVNa0Y/KP2HIy5P3a47a68uvNkjMhSKjA70hfyDAVWTdJU07lkVDzLEzSf/ztmvZJeLZdzfbJxOf1lrfjMhJ9ZO3FrQSkKEqSQh78fhPKCpIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNVUvGeqL65h8hoc3SNuFA9F1wP7HAY0b/e9pmSGbEI=;
 b=j4Cw5Qi4/mf/ZcNabsHZKMTsgyUXutstAbnCJWTn4gDKTxSDtEm1MxF9RteDniW7tPeooEBNOUHuJ214/PGE+qs7hzZbjUaCRCMvBGhJHmSxVCR+maYNTIePksPaDP0KCUXfD9R5D9pY6KNMGSCRCK6z2J6mqhmXm/TfJB8J3ufX6OljDFSxQPgjdzzEKaPF0RSKBpFeDPiXISLtzp3mtsrdf1ZPmFkWQe1QLoMks5bxNyedbc0fBRn38pMgwaCVo5WdZA4uBZhBMsr6j4xsrQcX/SV5XSxjserXzkw1VbU/THcnM3Bad4UZdWhAEZAIZPqvAWe/ZY/gJG6eO0K7cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNVUvGeqL65h8hoc3SNuFA9F1wP7HAY0b/e9pmSGbEI=;
 b=vHRyd5gP2byNIQtnkXtz2TSaqeQJDRkxMjoDmUo4YS6pCg8/XspyN8gb/GOX/dsXiqSJAyljMJiQAcE6xYXuymtz6dBO6r0ncC6pQ0fB61seyFKStYJjodLFQe9X9hwSUGvzT/iejukrDe4pv/w1Gs5jR6suzdwkadwIyHxIaf8=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0801MB1655.eurprd08.prod.outlook.com (2603:10a6:4:38::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.17; Fri, 14 Aug
 2020 09:12:52 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3261.026; Fri, 14 Aug 2020
 09:12:52 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>, 
 nd <nd@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei
 Liu <wl@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3] xen/arm: Convert runstate address during hypcall
Thread-Topic: [PATCH v3] xen/arm: Convert runstate address during hypcall
Thread-Index: AQHWZluWPRKsKyuZRkCQVDwO60tsvakgmVkAgAEWTwCAAKE8gIAVGJCA
Date: Fri, 14 Aug 2020 09:12:52 +0000
Message-ID: <F903D6AC-0987-4DCF-A6E2-BDCD459FE81F@arm.com>
References: <3911d221ce9ed73611b93aa437b9ca227d6aa201.1596099067.git.bertrand.marquis@arm.com>
 <f48f81d5-589e-3f75-1044-583114bf497e@xen.org>
 <CB9F22FE-BEFF-4A36-BC81-A18F9E0F9D7C@arm.com>
 <alpine.DEB.2.21.2007311018330.1767@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2007311018330.1767@sstabellini-ThinkPad-T480s>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3819486e-d6e8-416d-9c9d-08d840325b04
x-ms-traffictypediagnostic: DB6PR0801MB1655:|DBAPR08MB5799:
X-Microsoft-Antispam-PRVS: <DBAPR08MB5799CEDE86787A2679BA4D059D400@DBAPR08MB5799.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: g8XJ7pzilFHVu2xxvicJufYT0f3fMcOWBX+v10/5bPqXtHlLJVYdBYsZ4h6xvukl0Izy+9soFXLV/oFLoz0Dk2H1TlELbzTl9YboDiAx+IpxsGAxfwAOmjcFkP3hhjJZh9rafPATcGZQwdjU8fRGzbT6OrV5JT8ebqPzh+HraomM+z7QctuL6xid32JGyaY4U9BOmGqHKbFKKjAsKI1Bn9cR5LVlcn9mxVq1CWuFd9ZsZMrO7gZGOSn8FICNuueRfC0oXLmssB5t2TmI8QrQ4IuIpcHtqkO6N5q76etViIB0ZoDBT/XDHI/7wAyu+TGzrajeNcXN2scJ82OXR3vQ1Q==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(366004)(396003)(136003)(346002)(376002)(39860400002)(6486002)(8676002)(66946007)(26005)(54906003)(4326008)(33656002)(71200400001)(8936002)(83380400001)(76116006)(30864003)(6916009)(53546011)(66446008)(86362001)(186003)(6512007)(91956017)(7416002)(2906002)(64756008)(66556008)(66476007)(36756003)(6506007)(316002)(5660300002)(478600001)(2616005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: gMoadUk9LbGwPBzHWZAhec2w6mDz48/vp4ukxSZSidUUjFthTIwYbQ71vMZDmnIE2QR9xIJdrqDntUr3o8jEd05zjviLyM7RPyBWCY64u3t7UvA1CHMYXoJ2kr4/H+TyT2U0/GgrtfywTJa/yJWc+rYprpCqlv246X9W+1WS5nm96LPBpyzpmOonF/VYMy8rihaF+Nx7iaMethHnYpprielqEOO88sGj75jOg1BWGlNKKr45Gp7g1iL1BzFF42sdmm7EuiL58xLJ4aYuTwANe/kLCwhtUZRiwdgz/S/lx8cRzHZimgkFExEXrBKv4brwIDLskLTxOyeCG8AT1c0jUpelHemYuwujk+/JERMePtkkN0uT4SJD5Y1gwRdO+K6UMsqhmsk0ufQWmbxx9GXUEcF3QuE7G0O2I752BUmMWS2V40PyBfX6VEVkmdOuw3YlCZ/s9MV6amL8xiEQ7wcZzTnLgQscQ5Nx+z7oGlB3CR0K3B8mI3nrQ4xYkvUIPSpZEpfVzsQh/DP/Xpy7ZwSXahiMM4347lUR4M45dUR7C+ypSribT6tFlVH7fNuUjcnujvs4a3wNVUvZ66CbM813bgGUZvyLPhkQ/ZRW/iKRBkUVG/eyYu+KwLZ6WTcfK9RvPUCyNPxE1uD0GE0dw548dw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <323AE001FAECE348B095FA2C1443372F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1655
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: a75f250b-973f-4488-fbc0-08d840323928
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DbuEVvz+0IvL3UDvqh63eE1uGNWeVXwFfRou3G8OL9EuEy05FUKRSbklpoGgCcgyyB58vCiG9i+ETknkEdnQ8XXljaoMjoBZDzoTYqkkHY4mn38i5INbFPK3NXvHh3cs0o8HLHMKtVhtpAFvo4rVPmSGYXt8WxbS9/KT079TuKyCLTHr1kfYzXua7fkvD0COC9Kb2Wc3yUM0QvaP2M3+OtBuATDQbPO4qqfHzilrsdKOZ7OPN2oFAWq7Stgh6Nf85yc4XLvQd8k4k8ebM+hzwA7L/ydr5m0uq98W+0/C3N8XplPQw+JKM+vJ9jtLzDVLc/Szzs0iQ26KCw7ad7JIw8jv4r9mn0ygakU2OwgCQa3cJhVtCZP4femSaQ6DgPIglOScgmO7KNe6zSC0+0QTvg==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39860400002)(376002)(136003)(46966005)(86362001)(54906003)(6512007)(47076004)(5660300002)(81166007)(6506007)(82740400003)(8936002)(2616005)(83380400001)(356005)(186003)(30864003)(53546011)(36756003)(26005)(107886003)(82310400002)(316002)(36906005)(2906002)(8676002)(478600001)(70586007)(33656002)(4326008)(6486002)(336012)(6862004)(70206006);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2020 09:13:49.1716 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3819486e-d6e8-416d-9c9d-08d840325b04
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5799
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



> On 1 Aug 2020, at 00:03, Stefano Stabellini <sstabellini@kernel.org> wrot=
e:
>=20
> On Fri, 31 Jul 2020, Bertrand Marquis wrote:
>> Sorry missed some points in my previous answer.
>>=20
>>> On 30 Jul 2020, at 22:50, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> Hi Bertrand,
>>>=20
>>> To avoid extra work on your side, I would recommend to wait a bit befor=
e sending a new version. It would be good to at least settle the conversati=
on in v2 regarding the approach taken.
>>>=20
>>> On 30/07/2020 11:24, Bertrand Marquis wrote:
>>>> At the moment on Arm, a Linux guest running with KTPI enabled will
>>>> cause the following error when a context switch happens in user mode:
>>>> (XEN) p2m.c:1890: d1v0: Failed to walk page-table va 0xffffff837ebe0cd=
0
>>>> The error is caused by the virtual address for the runstate area
>>>> registered by the guest only being accessible when the guest is runnin=
g
>>>> in kernel space when KPTI is enabled.
>>>> To solve this issue, this patch is doing the translation from virtual
>>>> address to physical address during the hypercall and mapping the
>>>> required pages using vmap. This is removing the conversion from virtua=
l
>>>> to physical address during the context switch which is solving the
>>>> problem with KPTI.
>>>=20
>>> To echo what Jan said on the previous version, this is a change in a st=
able ABI and therefore may break existing guest. FAOD, I agree in principle=
 with the idea. However, we want to explain why breaking the ABI is the *on=
ly* viable solution.
>>>=20
>>> From my understanding, it is not possible to fix without an ABI breakag=
e because the hypervisor doesn't know when the guest will switch back from =
userspace to kernel space. The risk is the information provided by the runs=
tate wouldn't contain accurate information and could affect how the guest h=
andle stolen time.
>>>=20
>>> Additionally there are a few issues with the current interface:
>>>  1) It is assuming the virtual address cannot be re-used by the userspa=
ce. Thanksfully Linux have a split address space. But this may change with =
KPTI in place.
>>>  2) When update the page-tables, the guest has to go through an invalid=
 mapping. So the translation may fail at any point.
>>>=20
>>> IOW, the existing interface can lead to random memory corruption and in=
acurracy of the stolen time.
>>>=20
>>>> This is done only on arm architecture, the behaviour on x86 is not
>>>> modified by this patch and the address conversion is done as before
>>>> during each context switch.
>>>> This is introducing several limitations in comparison to the previous
>>>> behaviour (on arm only):
>>>> - if the guest is remapping the area at a different physical address X=
en
>>>> will continue to update the area at the previous physical address. As
>>>> the area is in kernel space and usually defined as a global variable t=
his
>>>> is something which is believed not to happen. If this is required by a
>>>> guest, it will have to call the hypercall with the new area (even if i=
t
>>>> is at the same virtual address).
>>>> - the area needs to be mapped during the hypercall. For the same reaso=
ns
>>>> as for the previous case, even if the area is registered for a differe=
nt
>>>> vcpu. It is believed that registering an area using a virtual address
>>>> unmapped is not something done.
>>>=20
>>> This is not clear whether the virtual address refer to the current vCPU=
 or the vCPU you register the runstate for. From the past discussion, I thi=
nk you refer to the former. It would be good to clarify.
>>>=20
>>> Additionally, all the new restrictions should be documented in the publ=
ic interface. So an OS developper can find the differences between the arch=
itectures.
>>>=20
>>> To answer Jan's concern, we certainly don't know all the guest OSes exi=
sting, however we also need to balance the benefit for a large majority of =
the users.
>>>=20
>>> From previous discussion, the current approach was deemed to be accepta=
ble on Arm and, AFAICT, also x86 (see [1]).
>>>=20
>>> TBH, I would rather see the approach to be common. For that, we would a=
n agreement from Andrew and Jan in the approach here. Meanwhile, I think th=
is is the best approach to address the concern from Arm users.
>>>=20
>>>> inline functions in headers could not be used as the architecture
>>>> domain.h is included before the global domain.h making it impossible
>>>> to use the struct vcpu inside the architecture header.
>>>> This should not have any performance impact as the hypercall is only
>>>> called once per vcpu usually.
>>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>>> ---
>>>>  Changes in v2
>>>>    - use vmap to map the pages during the hypercall.
>>>>    - reintroduce initial copy during hypercall.
>>>>  Changes in v3
>>>>    - Fix Coding style
>>>>    - Fix vaddr printing on arm32
>>>>    - use write_atomic to modify state_entry_time update bit (only
>>>>    in guest structure as the bit is not used inside Xen copy)
>>>> ---
>>>> xen/arch/arm/domain.c        | 161 ++++++++++++++++++++++++++++++-----
>>>> xen/arch/x86/domain.c        |  29 ++++++-
>>>> xen/arch/x86/x86_64/domain.c |   4 +-
>>>> xen/common/domain.c          |  19 ++---
>>>> xen/include/asm-arm/domain.h |   9 ++
>>>> xen/include/asm-x86/domain.h |  16 ++++
>>>> xen/include/xen/domain.h     |   5 ++
>>>> xen/include/xen/sched.h      |  16 +---
>>>> 8 files changed, 206 insertions(+), 53 deletions(-)
>>>> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
>>>> index 31169326b2..8b36946017 100644
>>>> --- a/xen/arch/arm/domain.c
>>>> +++ b/xen/arch/arm/domain.c
>>>> @@ -19,6 +19,7 @@
>>>> #include <xen/sched.h>
>>>> #include <xen/softirq.h>
>>>> #include <xen/wait.h>
>>>> +#include <xen/vmap.h>
>>>>   #include <asm/alternative.h>
>>>> #include <asm/cpuerrata.h>
>>>> @@ -275,36 +276,156 @@ static void ctxt_switch_to(struct vcpu *n)
>>>>     virt_timer_restore(n);
>>>> }
>>>> -/* Update per-VCPU guest runstate shared memory area (if registered).=
 */
>>>> -static void update_runstate_area(struct vcpu *v)
>>>> +static void cleanup_runstate_vcpu_locked(struct vcpu *v)
>>>> {
>>>> -    void __user *guest_handle =3D NULL;
>>>> +    if ( v->arch.runstate_guest )
>>>> +    {
>>>> +        vunmap((void *)((unsigned long)v->arch.runstate_guest & PAGE_=
MASK));
>>>> +
>>>> +        put_page(v->arch.runstate_guest_page[0]);
>>>> +
>>>> +        if ( v->arch.runstate_guest_page[1] )
>>>> +            put_page(v->arch.runstate_guest_page[1]);
>>>> +
>>>> +        v->arch.runstate_guest =3D NULL;
>>>> +    }
>>>> +}
>>>> +
>>>> +void arch_vcpu_cleanup_runstate(struct vcpu *v)
>>>> +{
>>>> +    spin_lock(&v->arch.runstate_guest_lock);
>>>> +
>>>> +    cleanup_runstate_vcpu_locked(v);
>>>> +
>>>> +    spin_unlock(&v->arch.runstate_guest_lock);
>>>> +}
>>>> +
>>>> +static int setup_runstate_vcpu_locked(struct vcpu *v, vaddr_t vaddr)
>>>> +{
>>>> +    unsigned int offset;
>>>> +    mfn_t mfn[2];
>>>> +    struct page_info *page;
>>>> +    unsigned int numpages;
>>>>     struct vcpu_runstate_info runstate;
>>>> +    void *p;
>>>> -    if ( guest_handle_is_null(runstate_guest(v)) )
>>>> -        return;
>>>> +    /* user can pass a NULL address to unregister a previous area */
>>>> +    if ( vaddr =3D=3D 0 )
>>>> +        return 0;
>>>> +
>>>> +    offset =3D vaddr & ~PAGE_MASK;
>>>> +
>>>> +    /* provided address must be aligned to a 64bit */
>>>> +    if ( offset % alignof(struct vcpu_runstate_info) )
>>>=20
>>> This new restriction wants to be explained in the commit message and pu=
blic header.
>>=20
>> ok
>>=20
>>>=20
>>>> +    {
>>>> +        gprintk(XENLOG_WARNING, "Cannot map runstate pointer at 0x%"P=
RIvaddr
>>>> +                ": Invalid offset\n", vaddr);
>>>=20
>>> We usually enforce 80 character per lines except for format string. So =
it is easier to grep them in the code.
>>=20
>> Ok i will fix this one and the following ones.
>> But here PRIvaddr would break any attempt to grep something in fact.
>>=20
>>>=20
>>>> +        return -EINVAL;
>>>> +    }
>>>> +
>>>> +    page =3D get_page_from_gva(v, vaddr, GV2M_WRITE);
>>>> +    if ( !page )
>>>> +    {
>>>> +        gprintk(XENLOG_WARNING, "Cannot map runstate pointer at 0x%"P=
RIvaddr
>>>> +                ": Page is not mapped\n", vaddr);
>>>> +        return -EINVAL;
>>>> +    }
>>>> +
>>>> +    mfn[0] =3D page_to_mfn(page);
>>>> +    v->arch.runstate_guest_page[0] =3D page;
>>>> +
>>>> +    if ( offset > (PAGE_SIZE - sizeof(struct vcpu_runstate_info)) )
>>>> +    {
>>>> +        /* guest area is crossing pages */
>>>> +        page =3D get_page_from_gva(v, vaddr + PAGE_SIZE, GV2M_WRITE);
>>>> +        if ( !page )
>>>> +        {
>>>> +            put_page(v->arch.runstate_guest_page[0]);
>>>> +            gprintk(XENLOG_WARNING,
>>>> +                    "Cannot map runstate pointer at 0x%"PRIvaddr
>>>> +                    ": 2nd Page is not mapped\n", vaddr);
>>>> +            return -EINVAL;
>>>> +        }
>>>> +        mfn[1] =3D page_to_mfn(page);
>>>> +        v->arch.runstate_guest_page[1] =3D page;
>>>> +        numpages =3D 2;
>>>> +    }
>>>> +    else
>>>> +    {
>>>> +        v->arch.runstate_guest_page[1] =3D NULL;
>>>> +        numpages =3D 1;
>>>> +    }
>>>> -    memcpy(&runstate, &v->runstate, sizeof(runstate));
>>>> +    p =3D vmap(mfn, numpages);
>>>> +    if ( !p )
>>>> +    {
>>>> +        put_page(v->arch.runstate_guest_page[0]);
>>>> +        if ( numpages =3D=3D 2 )
>>>> +            put_page(v->arch.runstate_guest_page[1]);
>>>> -    if ( VM_ASSIST(v->domain, runstate_update_flag) )
>>>> +        gprintk(XENLOG_WARNING, "Cannot map runstate pointer at 0x%"P=
RIvaddr
>>>> +                ": vmap error\n", vaddr);
>>>> +        return -EINVAL;
>>>> +    }
>>>> +
>>>> +    v->arch.runstate_guest =3D p + offset;
>>>> +
>>>> +    if (v =3D=3D current)
>>>> +        memcpy(v->arch.runstate_guest, &v->runstate, sizeof(v->runsta=
te));
>>>> +    else
>>>>     {
>>>> -        guest_handle =3D &v->runstate_guest.p->state_entry_time + 1;
>>>> -        guest_handle--;
>>>> -        runstate.state_entry_time |=3D XEN_RUNSTATE_UPDATE;
>>>> -        __raw_copy_to_guest(guest_handle,
>>>> -                            (void *)(&runstate.state_entry_time + 1) =
- 1, 1);
>>>> -        smp_wmb();
>>>> +        vcpu_runstate_get(v, &runstate);
>>>> +        memcpy(v->arch.runstate_guest, &runstate, sizeof(v->runstate)=
);
>>>>     }
>>>> -    __copy_to_guest(runstate_guest(v), &runstate, 1);
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +int arch_vcpu_setup_runstate(struct vcpu *v,
>>>> +                             struct vcpu_register_runstate_memory_are=
a area)
>>>> +{
>>>> +    int rc;
>>>> +
>>>> +    spin_lock(&v->arch.runstate_guest_lock);
>>>> +
>>>> +    /* cleanup if we are recalled */
>>>> +    cleanup_runstate_vcpu_locked(v);
>>>> +
>>>> +    rc =3D setup_runstate_vcpu_locked(v, (vaddr_t)area.addr.v);
>>>> +
>>>> +    spin_unlock(&v->arch.runstate_guest_lock);
>>>> -    if ( guest_handle )
>>>> +    return rc;
>>>> +}
>>>> +
>>>> +
>>>> +/* Update per-VCPU guest runstate shared memory area (if registered).=
 */
>>>> +static void update_runstate_area(struct vcpu *v)
>>>> +{
>>>> +    spin_lock(&v->arch.runstate_guest_lock);
>>>> +
>>>> +    if ( v->arch.runstate_guest )
>>>>     {
>>>> -        runstate.state_entry_time &=3D ~XEN_RUNSTATE_UPDATE;
>>>> -        smp_wmb();
>>>> -        __raw_copy_to_guest(guest_handle,
>>>> -                            (void *)(&runstate.state_entry_time + 1) =
- 1, 1);
>>>> +        if ( VM_ASSIST(v->domain, runstate_update_flag) )
>>>> +        {
>>>> +            v->runstate.state_entry_time |=3D XEN_RUNSTATE_UPDATE;
>>>> +            write_atomic(&(v->arch.runstate_guest->state_entry_time),
>>>> +                    v->runstate.state_entry_time);
>>>=20
>>> NIT: You want to indent v-> at the same level as the argument from the =
first line.
>>=20
>> Ok
>>=20
>>>=20
>>> Also, I think you are missing a smp_wmb() here.
>>=20
>> The atomic operation itself would not need a barrier.
>> I do not see why you think a barrier is needed here.
>> For the internal structure ?
>=20
> We need to make sure the other-end sees the XEN_RUNSTATE_UPDATE change
> before other changes. Otherwise, due to cpu reordering, the writes could
> be seen in reverse order. (Technically the reader would have to use a
> read-barrier but that's a separate topic.)

I will add a barrier before the atomic.

Cheers
Bertrand



