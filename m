Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFC123469F
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 15:10:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1Unb-0004P4-1d; Fri, 31 Jul 2020 13:10:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wy6+=BK=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1k1UnZ-0004Oz-N9
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 13:10:09 +0000
X-Inumbo-ID: 283b3154-d32f-11ea-8e33-bc764e2007e4
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.50]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 283b3154-d32f-11ea-8e33-bc764e2007e4;
 Fri, 31 Jul 2020 13:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y89ZBDd7zijBTKMXLvfE7XpuXPY7VUTkWAkQV7hDA88=;
 b=xXomj5dLhp7fdPvW11cYojVv2suWEhAX1VoYOD8+I/HmC2cFZX3laTkFrFqZt/5YEIcdPIxZky0PRlIDsj+EAIMsbvgzkRiXsIkiK3pJpS/gHnR47N/qesxI0mOuusdRxN6NBXr0dshsLj0c0zq7NzVAcDhNk1kGRAsZoAhdiTo=
Received: from DB7PR03CA0091.eurprd03.prod.outlook.com (2603:10a6:10:72::32)
 by DBBPR08MB4853.eurprd08.prod.outlook.com (2603:10a6:10:d5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16; Fri, 31 Jul
 2020 13:10:06 +0000
Received: from DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:72:cafe::35) by DB7PR03CA0091.outlook.office365.com
 (2603:10a6:10:72::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17 via Frontend
 Transport; Fri, 31 Jul 2020 13:10:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT009.mail.protection.outlook.com (10.152.20.117) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.20 via Frontend Transport; Fri, 31 Jul 2020 13:10:06 +0000
Received: ("Tessian outbound 1dc58800d5dd:v62");
 Fri, 31 Jul 2020 13:10:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2d869e824ba11d01
X-CR-MTA-TID: 64aa7808
Received: from 73fabe25d96c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9CEA4803-572D-4A12-A296-6B9A9A1B1DFC.1; 
 Fri, 31 Jul 2020 13:10:01 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 73fabe25d96c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 31 Jul 2020 13:10:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SyMB5dleEJz+St0wItmjUdD3PXtOI/4YypKTO/Ueie+roJRubismBNeDnkmYwPmYmlg/Ioi+grRc52N8f7UF71KlOWIxenMfgkzvk9a3sjoR+dnZ3WyBvqOF8GYa1IQEXdpo2jg9LcoDKhS4c9zk+LzosXGdJpwAuH1kPv+wqQgq29hShE3op7Cs9pTbARHUCzbiJQMdZemws5YFS2zyS9z0T5/dasmk2wR6jS/Fo2/EwhpRF2kAUx3fxyqAkX6vXchaGfzAk2y8S/cJzWSfEW6JSsFLRpL8udKKC37DjYDKf18O5IfI1ZGupAlzHcHaSeDMtAZ5J9be7/hbQCgfJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y89ZBDd7zijBTKMXLvfE7XpuXPY7VUTkWAkQV7hDA88=;
 b=ag/Tj64MrlQqVjql5r2Gd8yGQWWB82SkmGnRIetA1K7pL4G+G0PIREHGJGygxJZ4BwJXWCNJ+6aSo5zQHOsxCOak0d3sv0uVcQavzcKTEIVYjnEqz+em73gbPeySNdNTOexcZDIY+Y+K/4QllC2g2ZJ7J7UGAbAlo22mHnuXiFd8UoadjJ8Ky/Forg4qc4ghB8zJDdDd+cPUjMObSJBlMQb3UKOej69G4L5kSwJlcDBJLVc7COyz1ZRXoAZQD0d3i3KmT/hDuzUWnJwhbNMHThD+mo4o5BJigze/pdOwrG86rgIF9E3++WTescUiadNur0jjSkYqtruj9G4jKdBL/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y89ZBDd7zijBTKMXLvfE7XpuXPY7VUTkWAkQV7hDA88=;
 b=xXomj5dLhp7fdPvW11cYojVv2suWEhAX1VoYOD8+I/HmC2cFZX3laTkFrFqZt/5YEIcdPIxZky0PRlIDsj+EAIMsbvgzkRiXsIkiK3pJpS/gHnR47N/qesxI0mOuusdRxN6NBXr0dshsLj0c0zq7NzVAcDhNk1kGRAsZoAhdiTo=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB8PR08MB5082.eurprd08.prod.outlook.com (2603:10a6:10:ec::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Fri, 31 Jul
 2020 13:09:59 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3239.020; Fri, 31 Jul 2020
 13:09:59 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v3] xen/arm: Convert runstate address during hypcall
Thread-Topic: [PATCH v3] xen/arm: Convert runstate address during hypcall
Thread-Index: AQHWZluWPRKsKyuZRkCQVDwO60tsvakgmVkAgAEDsoCAAA4FAA==
Date: Fri, 31 Jul 2020 13:09:58 +0000
Message-ID: <5301A49B-3404-4AC2-B04E-2BB969BABEED@arm.com>
References: <3911d221ce9ed73611b93aa437b9ca227d6aa201.1596099067.git.bertrand.marquis@arm.com>
 <f48f81d5-589e-3f75-1044-583114bf497e@xen.org>
 <d8eb8052-6370-7484-1c9a-f90d83396fa1@suse.com>
In-Reply-To: <d8eb8052-6370-7484-1c9a-f90d83396fa1@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [90.126.203.125]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c523a70b-8190-4b9c-f022-08d835530ba8
x-ms-traffictypediagnostic: DB8PR08MB5082:|DBBPR08MB4853:
X-Microsoft-Antispam-PRVS: <DBBPR08MB4853CBD9639BD7B888BF40309D4E0@DBBPR08MB4853.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 3euiRBXiMJ1tzx6xdm3ZXv3GDHOrbnW6YdIefaMx/QJbb61PzN3n7src51I7vSxkf7DSnsMOyKkExSjNBsgsjxn0Sra+C1JOFw7aE9w57SnRVDaY7RNAq39iaMnKWn9j0WbW23Od+VlbcDlK4U1WA/fYUZZiWB6cnk8cP1h1xmhSYlmW1lhXqJgyxc+ewsCOh5HDO8ERvO7xM9m8NsYEq8AiAjEjUGu3LpjCzPAiGlTqTfulY0X/raD/EvZumNg9mdsfBe0za+lLfUtlf1pg2bGicXttY0nixCZ61Pse2rUUt/XEiHqWwOxXXWLmWDXMvukevp3XRmMmuI4GkNlS0A==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(366004)(346002)(396003)(376002)(136003)(6486002)(83380400001)(66556008)(2616005)(64756008)(66446008)(316002)(36756003)(86362001)(6916009)(54906003)(8936002)(478600001)(2906002)(91956017)(6506007)(8676002)(53546011)(66946007)(186003)(76116006)(4326008)(6512007)(5660300002)(7416002)(66476007)(26005)(71200400001)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: xF6MQzWEhesuPZQdY55f/cBJQtGeGZ7aG6y8Evvb52MSO6PCYUqkOB8t61dJ4ZqEa1oCkQc0HUOs9h5KYGlv5PnP+J2xqmGU7aaotgbpArNmpwUQW52i/TVkbIHFrDAbgyLILo/z0n0usy7dBfX7PshONovgF5pr8NgxCOICQP4edAedc2PDlooSPRwpnvcWnKzUAgNlXQKyEy4sy5NxtaiPKkrOZW+DwXrQGYBpBE02zmliHIi7tELLwoVT/4DbVMD15AI+29DZuZYrRG8K2TFdhBGPLR7jgGOTDN/dCQ2PqAJtVb+zxHdDDdwKWzOkW6IjGyGEDxJdi8G43k6ID9iW/ZNm+h/JOD6kpbZ4B+fd0rAAn4flxZ4zeoArdtd+YBCTZq8IoTPHesf9tik9QgOVjoXNOuSgkAy2DwCafBdfUFfk2gT9bEF3Pfx4MBWGSGJcCkAVlVL5W2yxE2b7crXJX6RdVhqpIZPlezwqKbkcby4Y51AEWestJ/giaViVa3yi4aPvs0hR/I1qsqTMFjF2hcsRnC6+8Ed6lLd9uKo+lL2lfxv3xYhnHkzL4OtLUtn/k1xd9cg57xyafFAnFNh9Fmm1EaulSScwvrFSnZintj0UTKh+8qDPepel7EcRJj7GPVpigFKzr5e27jpprw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <95DA35772808D34E98AA6B01EFFC0FC9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5082
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6b39c16a-7b89-49f1-41a3-08d835530715
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PUBTaVF0MbmyjSIT2Vg7Kb/O9rN/bapTmA5ak05d+MmTP9ViCIONNxRgPGwgjpb/KBCeCntLodYu8FQzdLH52GJigycFUwDEKm67s1gy8PghlqGwgbltHZS9ibPBMZ7RXLEH+Rf4QCNjFItSUR6ylAbpgN3bYielgwPc0+JBw/5rbArVVsMjdNf7mdZzwrL7hML1SqOA1fD1njL9AXDyhO6xpbn/7U6aAsQuRwHAAyXKaERveL9Ujag3o4nQ208gHwCUwh0QAOe5/u3dh1oznrvmuuYwmRtt8u3xMek6TSW7wpiqHVaROy0+aA0yi98W01rIUOvC1VZP6iDQhGqqx0h7Jo/xVjYLi8cINo8n2cCtS2byXvhZE+5S1qtm1M6035lWoBvEd/rNLKqfd/yy2w==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(376002)(396003)(346002)(39860400002)(46966005)(54906003)(5660300002)(26005)(6512007)(70586007)(36756003)(86362001)(2616005)(70206006)(336012)(316002)(186003)(8676002)(8936002)(478600001)(6862004)(4326008)(6486002)(82740400003)(82310400002)(2906002)(107886003)(6506007)(53546011)(33656002)(47076004)(356005)(81166007)(83380400001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2020 13:10:06.7033 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c523a70b-8190-4b9c-f022-08d835530ba8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4853
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



> On 31 Jul 2020, at 14:19, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 30.07.2020 22:50, Julien Grall wrote:
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
>> To echo what Jan said on the previous version, this is a change in a=20
>> stable ABI and therefore may break existing guest. FAOD, I agree in=20
>> principle with the idea. However, we want to explain why breaking the=20
>> ABI is the *only* viable solution.
>>=20
>> From my understanding, it is not possible to fix without an ABI=20
>> breakage because the hypervisor doesn't know when the guest will switch=
=20
>> back from userspace to kernel space.
>=20
> And there's also no way to know on Arm, by e.g. enabling a suitable
> intercept?

An intercept would mean that Xen gets a notice whenever a guest is switchin=
g
from kernel mode to user mode.
There is nothing in this process which could be intercepted by Xen, appart =
from
maybe trapping all access to MMU registers which would be very complex and
slow.

>=20
>> The risk is the information=20
>> provided by the runstate wouldn't contain accurate information and could=
=20
>> affect how the guest handle stolen time.
>>=20
>> Additionally there are a few issues with the current interface:
>>    1) It is assuming the virtual address cannot be re-used by the=20
>> userspace. Thanksfully Linux have a split address space. But this may=20
>> change with KPTI in place.
>>    2) When update the page-tables, the guest has to go through an=20
>> invalid mapping. So the translation may fail at any point.
>>=20
>> IOW, the existing interface can lead to random memory corruption and=20
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
>> This is not clear whether the virtual address refer to the current vCPU=
=20
>> or the vCPU you register the runstate for. From the past discussion, I=20
>> think you refer to the former. It would be good to clarify.
>>=20
>> Additionally, all the new restrictions should be documented in the=20
>> public interface. So an OS developper can find the differences between=20
>> the architectures.
>>=20
>> To answer Jan's concern, we certainly don't know all the guest OSes=20
>> existing, however we also need to balance the benefit for a large=20
>> majority of the users.
>>=20
>> From previous discussion, the current approach was deemed to be=20
>> acceptable on Arm and, AFAICT, also x86 (see [1]).
>>=20
>> TBH, I would rather see the approach to be common. For that, we would an=
=20
>> agreement from Andrew and Jan in the approach here. Meanwhile, I think=20
>> this is the best approach to address the concern from Arm users.
>=20
> Just FTR: If x86 was to also change, VCPUOP_register_vcpu_time_memory_are=
a
> would need taking care of as well, as it's using the same underlying mode=
l
> (including recovery logic when, while the guest is in user mode, the
> update has failed).
>=20
>>> @@ -275,36 +276,156 @@ static void ctxt_switch_to(struct vcpu *n)
>>>      virt_timer_restore(n);
>>>  }
>>>=20
>>> -/* Update per-VCPU guest runstate shared memory area (if registered). =
*/
>>> -static void update_runstate_area(struct vcpu *v)
>>> +static void cleanup_runstate_vcpu_locked(struct vcpu *v)
>>>  {
>>> -    void __user *guest_handle =3D NULL;
>>> +    if ( v->arch.runstate_guest )
>>> +    {
>>> +        vunmap((void *)((unsigned long)v->arch.runstate_guest & PAGE_M=
ASK));
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
>>>=20
>>> -    if ( guest_handle_is_null(runstate_guest(v)) )
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
>> This new restriction wants to be explained in the commit message and=20
>> public header.
>=20
> And the expression would imo also better use alignof(runstate).

ok i will fix that.

Bertrand


