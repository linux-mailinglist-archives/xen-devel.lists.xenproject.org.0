Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA45D22F462
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jul 2020 18:11:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k05iM-0002M0-0b; Mon, 27 Jul 2020 16:10:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s7zT=BG=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1k05iK-0002Lv-VI
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2020 16:10:56 +0000
X-Inumbo-ID: bf8457f3-d023-11ea-8ad3-bc764e2007e4
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.85]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bf8457f3-d023-11ea-8ad3-bc764e2007e4;
 Mon, 27 Jul 2020 16:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DsZfFnXMBRM0Wk5LaTsic24+555RRDHubAUAxa2ZpbA=;
 b=2+vbZejYWvFZOcgkYO+ErdY0xyHEbBiLkVW9Tr27UoDLJcPJ6pFT57lnVmmp5NBvakuSzTb3Yvx6UCCmmbTtf6HigUotymRZ3RtmQ8N14nmddkoKA4/zRaRwx1dTES5cxPX6tV/ZNOi0KsRTBiNXAJnUgHFNBfSCSEY9hRXaXVY=
Received: from AM7PR04CA0025.eurprd04.prod.outlook.com (2603:10a6:20b:110::35)
 by DB7PR08MB3513.eurprd08.prod.outlook.com (2603:10a6:10:4a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Mon, 27 Jul
 2020 16:10:52 +0000
Received: from AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::a3) by AM7PR04CA0025.outlook.office365.com
 (2603:10a6:20b:110::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20 via Frontend
 Transport; Mon, 27 Jul 2020 16:10:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT059.mail.protection.outlook.com (10.152.17.193) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.10 via Frontend Transport; Mon, 27 Jul 2020 16:10:52 +0000
Received: ("Tessian outbound c4059ed8d7bf:v62");
 Mon, 27 Jul 2020 16:10:51 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: cdaea35e16563ff3
X-CR-MTA-TID: 64aa7808
Received: from 181a67bb8d82.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 81696E7E-C31B-4935-AAA8-969C4584F439.1; 
 Mon, 27 Jul 2020 16:10:46 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 181a67bb8d82.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 27 Jul 2020 16:10:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CBWen2b6x+bgchYoolsrUjRQICMDO1AvRr1284W8nZlDIDLEYsUvNY1XpM6bW0kIo+Y/K4cm2DiNcrg35BgvY4kcnHb9iufhggQ9cg2O8VnbvMIM5CTHFx6NjveNYBh4DieC+EqnL3Rwt3c6Gas4S8HVS+UT+V0mv5kgNd83UQNGv5LuLhmOtK4lXquhsMWk0lvfMYMc3+Xf2X2hWAMdbfPXtK2xX/7mE7onEQCeNPzZZKv31ohamxkAbo4hBiydno31jeTsf7O2mPCO1DoGboGzHsruL0ioFa5eu4WbwwcX6rHbshVZgZxVcwGiRkm5a6eNVLQGuAJO6/FquqVtBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DsZfFnXMBRM0Wk5LaTsic24+555RRDHubAUAxa2ZpbA=;
 b=jwXG1jRNpGLw51g79OMCZQMhn5yXHvAOsn8OZXGPgm3XKrXyqfbIC08ANpYv+dbjJ0BQNnpZJLLKHz8AWT1EnU3K4cdIXrSsExhZDKWC7WTYTFrDRgNk0FnRpHwacyedb9ASFKuHThwQz+qWo6kDxmckwfLNNyE7jqMS4AoiUclH/VfH1fiiGM9IU8MCQh8qu0UR+3+ZjNzyCaYqIY4c/K6Gr2oIV8/HgnUDVcBK4kgfuGWCvZxJy4WgNGNt9vuYH4rornFBBKIyYAvjKfTwTpOA8dxrd8nJK9p/9eUgF5ue8OcYaUSRT+KmrdwNbjPxy/a6/NsmFkoJj/orn+eQWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DsZfFnXMBRM0Wk5LaTsic24+555RRDHubAUAxa2ZpbA=;
 b=2+vbZejYWvFZOcgkYO+ErdY0xyHEbBiLkVW9Tr27UoDLJcPJ6pFT57lnVmmp5NBvakuSzTb3Yvx6UCCmmbTtf6HigUotymRZ3RtmQ8N14nmddkoKA4/zRaRwx1dTES5cxPX6tV/ZNOi0KsRTBiNXAJnUgHFNBfSCSEY9hRXaXVY=
Received: from AM6PR08MB3560.eurprd08.prod.outlook.com (2603:10a6:20b:4c::19)
 by AM6PR08MB5240.eurprd08.prod.outlook.com (2603:10a6:20b:ec::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Mon, 27 Jul
 2020 16:10:45 +0000
Received: from AM6PR08MB3560.eurprd08.prod.outlook.com
 ([fe80::e891:3b33:766:cad5]) by AM6PR08MB3560.eurprd08.prod.outlook.com
 ([fe80::e891:3b33:766:cad5%6]) with mapi id 15.20.3216.033; Mon, 27 Jul 2020
 16:10:45 +0000
From: Rahul Singh <Rahul.Singh@arm.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [RFC PATCH v1 2/4] xen/arm: Discovering PCI devices and add the
 PCI devices in XEN.
Thread-Topic: [RFC PATCH v1 2/4] xen/arm: Discovering PCI devices and add the
 PCI devices in XEN.
Thread-Index: AQHWYPbP4iMQjZDQ906szkp+TjbuPqkVohKAgACwKACABUzOAA==
Date: Mon, 27 Jul 2020 16:10:44 +0000
Message-ID: <E01D4585-F28B-421A-8B6B-3B46BA9D804C@arm.com>
References: <cover.1595511416.git.rahul.singh@arm.com>
 <666df0147054dda8af13ae74a89be44c69984295.1595511416.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2007231337140.17562@sstabellini-ThinkPad-T480s>
 <81cad0cd-731d-e1d5-cacd-d64f2c0781b6@epam.com>
In-Reply-To: <81cad0cd-731d-e1d5-cacd-d64f2c0781b6@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.38.125]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 55e8ad16-d9eb-4be8-c2a6-08d83247a25e
x-ms-traffictypediagnostic: AM6PR08MB5240:|DB7PR08MB3513:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB7PR08MB351399C9AE4E788A6D958690FC720@DB7PR08MB3513.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: hPTSieqt+a2MN7sjPWuO78tkiJC2hdtAZvKZEucWOoIx/JRB7eYwTrGIrZ8u5dHaeMpz3iXlcE5nuVz9ubsSPk1wS5DlsOZCUCl2PKOjmh0cgp7Hdw59ECSNRrmKZq3AHlIyNMISU6uaiIwQXAjfGl6YilepWatKktNC6saO6qDwVVVTW57E4wRyaARDn3Nf/vNuFa1w0s0nThy2ACyV+y0uuvbKf983u4ccJBrxxZKttVqJ+W7Sko4VL0Qvvdnuvxfu6WT6FwOIhvAK08Nf9x59ZIMzo7+mxGXGoaWSjsDGcWciWY2SIwhacC+urCYgXI4mOIjS8XdCSY+zZtZWcFms92crJWSlaOLin7hBDf3447Xgivc1KoNjsknla+oy+MwmyvnEv5/nwagva6avvg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM6PR08MB3560.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(396003)(366004)(346002)(376002)(136003)(76116006)(966005)(91956017)(5660300002)(55236004)(33656002)(53546011)(36756003)(26005)(2906002)(478600001)(4326008)(66946007)(66556008)(66476007)(8936002)(64756008)(66446008)(83380400001)(54906003)(6916009)(6512007)(316002)(6486002)(6506007)(86362001)(8676002)(71200400001)(186003)(2616005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: edEsyjGDboljEFItozBbFZJYc8wHmWoRY/asqEoFRXfjXsf4gHOKyUBa2x3tzRNnm20A23RVz8GUW8EBAw6Dislqd8S6tNpVmMBGrHk/tDg0Qth3AxwqWhualP1N2DBAPRpebEdffV5oIv0/e+jQ6D4FTA0sTuAO1fVlmQW2RaGMe5oZEfVD38KDXol8H38W5lcz5O/RreHEyMPPr3z2TOF9gxcmcM1lSsvf+o1IKu4sFnMXaM7ZG+X6GO2XJgErfAqYX9KaD7gqj7g01qN6RsladiF/641l/c7PlhH1XDGRP22SVIi+xODUUoezLbDKtbjLTHz9SQUG1KyjjG1y7TJ5ANfA2HXvKjC81qNmHVwEIGGYfOxF3t6CN1+c+AYio2AR5z9edusaucDe1v9BzCU3CbuDyjiWDOGEi67tYULsHBwJHfkBRui+KtBnekm7dRdvRNo1nYkBC6knr4VfvcRyk6i6QkXoxH2JjYly64c=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AF325F7B3FE8634CA0422900B2F34C5F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5240
Original-Authentication-Results: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: f5f9a7bd-4689-4350-0f3e-08d832479e30
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eVbU+2do6VZtzMSK8jT3tlzCT/jL1DtW+UAuqoIRuuTXkYuHu47vY/te6KZPl6CN5Y/mheijz60tMI0I/x53HysJGa8DMvmb17FbxaYDaxcJ+/LAdcPc7kKg5EGKHzbstg04CGK87/CmmV50OOTE59rYfjHHkGLY7/cJyg1M5i6XniAIxE+1kgYVWuaNiv8ZzrgUoH1ISGPc/ceZiq86IXUege6F5FazlfiPLOrUagiJnHVSMXQzMyNPz/DD/+cDI967IzK2IgmXDouO7EDUi8DmMde79tZv8AxInQfQHLaXAZNxh8DvtvIfGBjwOk9n6dwXYWj4O3uYuCHV9mjvl+mChb9SXgFrDGr/IuxSc7QB3aBtdUz9l2S5DvcK3hv1pCsDQ6K8eXGhTAnWq9Frtujy/5DDsqe7eIO3O8g+layyWUijlDBs3ujpD0e50K3BRn0CVUQl3+GQLHm9pFxvokclr31YWbxs09O833KwI3w=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(346002)(376002)(396003)(136003)(39860400002)(46966005)(81166007)(26005)(5660300002)(33656002)(86362001)(966005)(2906002)(36756003)(70206006)(70586007)(356005)(82310400002)(36906005)(6862004)(478600001)(54906003)(82740400003)(4326008)(186003)(2616005)(6506007)(6512007)(47076004)(53546011)(83380400001)(107886003)(8936002)(336012)(6486002)(8676002)(316002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2020 16:10:52.0461 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55e8ad16-d9eb-4be8-c2a6-08d83247a25e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3513
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
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



> On 24 Jul 2020, at 8:14 am, Oleksandr Andrushchenko <Oleksandr_Andrushche=
nko@epam.com> wrote:
>=20
>=20
> On 7/23/20 11:44 PM, Stefano Stabellini wrote:
>> On Thu, 23 Jul 2020, Rahul Singh wrote:
>>> Hardware domain is in charge of doing the PCI enumeration and will
>>> discover the PCI devices and then will communicate to XEN via hyper
>>> call PHYSDEVOP_pci_device_add to add the PCI devices in XEN.
>>>=20
>>> Change-Id: Ie87e19741689503b4b62da911c8dc2ee318584ac
>> Same question about Change-Id
>>=20
>>=20
>>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>>> ---
>>>  xen/arch/arm/physdev.c | 42 +++++++++++++++++++++++++++++++++++++++---
>>>  1 file changed, 39 insertions(+), 3 deletions(-)
>>>=20
>>> diff --git a/xen/arch/arm/physdev.c b/xen/arch/arm/physdev.c
>>> index e91355fe22..274720f98a 100644
>>> --- a/xen/arch/arm/physdev.c
>>> +++ b/xen/arch/arm/physdev.c
>>> @@ -9,12 +9,48 @@
>>>  #include <xen/errno.h>
>>>  #include <xen/sched.h>
>>>  #include <asm/hypercall.h>
>>> -
>>> +#include <xen/guest_access.h>
>>> +#include <xsm/xsm.h>
>>>=20
>>>  int do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>  {
>>> -    gdprintk(XENLOG_DEBUG, "PHYSDEVOP cmd=3D%d: not implemented\n", cm=
d);
>>> -    return -ENOSYS;
>>> +    int ret =3D 0;
>>> +
>>> +    switch ( cmd )
>>> +    {
>>> +#ifdef CONFIG_HAS_PCI
>=20
> In the cover letter you were saying "we are not enabling the HAS_PCI and =
HAS_VPCI flags for ARM".
>=20
> Is this still valid?

Yes right we are not enabling it because full support of PCI passthrough is=
 not implemented and tested.=20
>=20
>>> +        case PHYSDEVOP_pci_device_add:
>>> +            {
>>> +                struct physdev_pci_device_add add;
>>> +                struct pci_dev_info pdev_info;
>>> +                nodeid_t node =3D NUMA_NO_NODE;
>>> +
>>> +                ret =3D -EFAULT;
>>> +                if ( copy_from_guest(&add, arg, 1) !=3D 0 )
>>> +                    break;
>>> +
>>> +                pdev_info.is_extfn =3D !!(add.flags & XEN_PCI_DEV_EXTF=
N);
>>> +                if ( add.flags & XEN_PCI_DEV_VIRTFN )
>>> +                {
>>> +                    pdev_info.is_virtfn =3D 1;
>>> +                    pdev_info.physfn.bus =3D add.physfn.bus;
>>> +                    pdev_info.physfn.devfn =3D add.physfn.devfn;
>>> +                }
>>> +                else
>>> +                    pdev_info.is_virtfn =3D 0;
>>> +
>>> +                ret =3D pci_add_device(add.seg, add.bus, add.devfn,
>>> +                                &pdev_info, node);
>>> +
>>> +                break;
>>> +            }
>>> +#endif
>>> +        default:
>>> +            gdprintk(XENLOG_DEBUG, "PHYSDEVOP cmd=3D%d: not implemente=
d\n", cmd);
>>> +            ret =3D -ENOSYS;
>>> +    }
>> I think we should make the implementation common between arm and x86 by
>> creating xen/common/physdev.c:do_physdev_op as a shared entry point for
>> PHYSDEVOP hypercalls implementations. See for instance:
>>=20
>> xen/common/sysctl.c:do_sysctl
>>=20
>> and
>>=20
>> xen/arch/arm/sysctl.c:arch_do_sysctl
>> xen/arch/x86/sysctl.c:arch_do_sysctl
>>=20
>>=20
>> Jan, Andrew, Roger, any opinions?
>>=20
>>=20
> I think we can also have a look at [1] by Julien. That implementation,
>=20
> IMO, had some thoughts on making Arm/x86 code common where possible

Ok. Thanks for the pointer. We will have a look.
>=20
>=20
> [1] https://xenbits.xen.org/gitweb/?p=3Dpeople/julieng/xen-unstable.git;a=
=3Dshortlog;h=3Drefs/heads/dev-pci


