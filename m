Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1F122E7F4
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jul 2020 10:42:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jzyh3-0001X2-Fh; Mon, 27 Jul 2020 08:41:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s7zT=BG=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1jzyh1-0001Wx-NX
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2020 08:41:07 +0000
X-Inumbo-ID: e7b2d1c0-cfe4-11ea-a774-12813bfff9fa
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.83]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e7b2d1c0-cfe4-11ea-a774-12813bfff9fa;
 Mon, 27 Jul 2020 08:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ME4pLc+Ysu5/OH8Oha0+sOISh6/ilN3IU5jCigmE1Pc=;
 b=NGG71uNg2R2x9MtOICQplFeo9ceL0fbtIpOisrqPpiXZeUC5a/PdQ3L6zhOff2TZ86/h04fNFwnDm+HOiXCnhpunT4F/qajjdHwGZX9z647aJPfampuMoMbfiV5FGLHvOzlosrymuvY9ZqEgD5aDmzK5338jhKOZ/AfS8zbnMts=
Received: from AM5PR0502CA0014.eurprd05.prod.outlook.com
 (2603:10a6:203:91::24) by DB6PR0801MB1943.eurprd08.prod.outlook.com
 (2603:10a6:4:74::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Mon, 27 Jul
 2020 08:41:01 +0000
Received: from VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:91:cafe::90) by AM5PR0502CA0014.outlook.office365.com
 (2603:10a6:203:91::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21 via Frontend
 Transport; Mon, 27 Jul 2020 08:41:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT063.mail.protection.outlook.com (10.152.18.236) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.10 via Frontend Transport; Mon, 27 Jul 2020 08:41:01 +0000
Received: ("Tessian outbound 1dc58800d5dd:v62");
 Mon, 27 Jul 2020 08:41:00 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 415a75d793a330cd
X-CR-MTA-TID: 64aa7808
Received: from 0e83c39b836b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9B36A31B-E6D7-491F-B966-9916AC6FCD64.1; 
 Mon, 27 Jul 2020 08:40:55 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0e83c39b836b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 27 Jul 2020 08:40:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hVN17U3Psqs9Cr69d7PsKz3EBFLWi0GWjMUISIL+FXFPcREHC06DMMsQXnRq/T/zSEnHRO++ZbNvQxnF5iqqA2YYvfRnzjxUsbUnJubrf6pLR72z+qzBmna5gQ1BZBfWtI0ND/wO0RGzBk7EsvgmTlP73uRmFUkD/AJA4W1ZHOdp8lnb5sxdMk1qenYZ+lja/R5gvBoCFI3nHrs9huQM3Rh/gURVYydttu90yP8hcfDttJCCOf0R0rkpDIuone8bwpYmKPLN1u3axSFg+VxQxzw+2xcSCDC28Ni5DjhWm0uwifXs7rbkgUhKW+36uhG6Usn7Wq1PB3bCR7iVwj+kEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ME4pLc+Ysu5/OH8Oha0+sOISh6/ilN3IU5jCigmE1Pc=;
 b=M2cwFzxR0RX/tl7GtYESdK6gYfLTttc5Zuf+iD9ZmiCG9Jqe1yV+OcxKNa346hEfXcpV46eF0yM3R0fuZ3/xnR/bC+gsseOAQkap1cGXWW3113mF7fX1hbgePQIbJElnoUu/7aK074OaCr9M7heNn1nHLaEDJvvJKTiq4PX9IQRQ3mKaq7nKctD78sJiB/tFGT4WMyTMdbfIINWIAIs5NFR1Tu+ihhpXwY9ivTvWLtsx66XjuFUBWkGm1Gfs5ceVcdmrvfuo7UkTvwkSNoC6+vmG41ZHecquwBW8rFm6aVQfvRziUaMyLcbN84eGmiE6UDp6j1SkR+8V4UgnAKhp9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ME4pLc+Ysu5/OH8Oha0+sOISh6/ilN3IU5jCigmE1Pc=;
 b=NGG71uNg2R2x9MtOICQplFeo9ceL0fbtIpOisrqPpiXZeUC5a/PdQ3L6zhOff2TZ86/h04fNFwnDm+HOiXCnhpunT4F/qajjdHwGZX9z647aJPfampuMoMbfiV5FGLHvOzlosrymuvY9ZqEgD5aDmzK5338jhKOZ/AfS8zbnMts=
Received: from AM6PR08MB3560.eurprd08.prod.outlook.com (2603:10a6:20b:4c::19)
 by AM6PR08MB4501.eurprd08.prod.outlook.com (2603:10a6:20b:b5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23; Mon, 27 Jul
 2020 08:40:53 +0000
Received: from AM6PR08MB3560.eurprd08.prod.outlook.com
 ([fe80::e891:3b33:766:cad5]) by AM6PR08MB3560.eurprd08.prod.outlook.com
 ([fe80::e891:3b33:766:cad5%6]) with mapi id 15.20.3216.033; Mon, 27 Jul 2020
 08:40:53 +0000
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [RFC PATCH v1 2/4] xen/arm: Discovering PCI devices and add the
 PCI devices in XEN.
Thread-Topic: [RFC PATCH v1 2/4] xen/arm: Discovering PCI devices and add the
 PCI devices in XEN.
Thread-Index: AQHWYPbP4iMQjZDQ906szkp+TjbuPqkVohKAgAV/RoA=
Date: Mon, 27 Jul 2020 08:40:53 +0000
Message-ID: <AB1FC4E2-288F-4A1F-87BC-B24E552301F8@arm.com>
References: <cover.1595511416.git.rahul.singh@arm.com>
 <666df0147054dda8af13ae74a89be44c69984295.1595511416.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2007231337140.17562@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2007231337140.17562@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.38.125]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c3b26bc4-33f8-4fb7-5e69-08d83208caa1
x-ms-traffictypediagnostic: AM6PR08MB4501:|DB6PR0801MB1943:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0801MB19434E88D37E4E0AF46DEE97FC720@DB6PR0801MB1943.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: IrdYC7cy6/46wvrWvPdaQ/iuSDPTjI78VFrsPpjK2XE6bi7Lpq6cLG12radAqEyUK+k6dAOxpTxSP04UWTt6jjPn4jIeUfasdVNMElf4c7lHedKLrgGhZ7Z6OB16hk6sN6o04vHMbsBqbMiaK+3z3KcBSLQILwp2fZSXsIMc5oBimiNvMLlFJPwIgvy34m8gR8/lGFDd2KzZIp/n2QDYwe6cvJb+KRrQ5bfsc8Dfd7TODX6LRzPu/w5RC42yt2k/SroxdpeGLFzmVGJCraEgUhFe9SP72L0jvrJIEW1iNAIXE5pRi6bWrh19vkYWsw8DstVNjox5YYXWnojk508M0w==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM6PR08MB3560.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(346002)(39860400002)(366004)(396003)(376002)(136003)(91956017)(76116006)(36756003)(478600001)(66946007)(6916009)(54906003)(86362001)(316002)(8936002)(8676002)(26005)(186003)(6512007)(2906002)(33656002)(2616005)(83380400001)(55236004)(66476007)(6486002)(64756008)(6506007)(66446008)(66556008)(53546011)(4326008)(71200400001)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: yVLYsmE4RvLjlA3iybaS4sxQF43C5jJ3nXKKI7fdvc8GND8BQ/P+BVYDu32U840yXxwFqIWUUpH41S75tamAkJFAPOmrrar2+WlHkKuJEDNloU+qOK20w3gOmfk627IQm/27mKmmxD56NVtk1Rwo/5Pjvw2pT0N7lvC9wbSNI3ji7j/GEHt8bu3/IcWAPMl8SPEiZW8Ks1d2nresw7Y2pM9oS+bduKGNJb2AmiPCBUO9aSRApWmAPRIgZsTXGxmmsmY/l8Xx/Ge9rkofprDMKbCxXLnY0k46tDOE11mdxSOpebihWdex2WmwVLhDgehOeK6jHxKwe+gfIAUV7q15QlUSG+jyOCalhILq5wW862Zi0GrhAmEdoCuxnndvLCTC/RhWbC5IXfhfBmfLpy/Yfjux/uNlmSYdwESH4xnmhHqNHnW61WTjjaM92rqmasZHxFgiUsNq+/6uu2uuLiwBDFfoha2RtoOSRngkVCOj4vw=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BC3314D6D3EC324DA519EF59C6A6E5E9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4501
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 479dd7ad-4671-482d-2110-08d83208c5f9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ezxm3jz6eoNO1gfacpde05ClsowaYff0zSqT4LRTn8hG/PdcTmCGvU3giHdWLpD5ENqR+DbWjwvr076KZwMh/CR6przBeusbW04vV4jKCY7FVJAAHmw6toffTj88nxci86uF5GnsF7H45Aj+ghtXSKhwx5b31hcf3EHrBgmgvEw3LcqUn25waqN1EGatptbnf6lRheR1IAS6tfVQNzlibOD2m2rDbGmbT9O/DZRSyCbKhRk6vSnqK8O/NfFst5SdJb9dT/3U/9L1AD81X8Hp6JTruYZVs0GramcRjwlE7PzyfqUAkQEW7K+AxYYbZfzcBbg4hlXPhwA+5z9jt87ILoyWtCJ6Fht3eP/YvZ+oZiaMeDYyZ2Lusltlv7jdZG9QgdkV5shkXlkxdC+g5Iz3Bg==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(136003)(346002)(396003)(376002)(46966005)(478600001)(82740400003)(4326008)(54906003)(6862004)(6486002)(107886003)(8676002)(316002)(2616005)(186003)(8936002)(336012)(6512007)(6506007)(47076004)(53546011)(83380400001)(26005)(86362001)(81166007)(5660300002)(33656002)(70206006)(70586007)(82310400002)(356005)(2906002)(36906005)(36756003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2020 08:41:01.2535 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3b26bc4-33f8-4fb7-5e69-08d83208caa1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1943
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
Cc: Julien Grall <julien@xen.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Sorry for the late reply.

> On 23 Jul 2020, at 9:44 pm, Stefano Stabellini <sstabellini@kernel.org> w=
rote:
>=20
> On Thu, 23 Jul 2020, Rahul Singh wrote:
>> Hardware domain is in charge of doing the PCI enumeration and will
>> discover the PCI devices and then will communicate to XEN via hyper
>> call PHYSDEVOP_pci_device_add to add the PCI devices in XEN.
>>=20
>> Change-Id: Ie87e19741689503b4b62da911c8dc2ee318584ac
>=20
> Same question about Change-Id

I think by-mistake Gerrit Change-id is added in the patch series. I will re=
move the Change-Id in next version of the patch.
>=20
>=20
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> ---
>> xen/arch/arm/physdev.c | 42 +++++++++++++++++++++++++++++++++++++++---
>> 1 file changed, 39 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/xen/arch/arm/physdev.c b/xen/arch/arm/physdev.c
>> index e91355fe22..274720f98a 100644
>> --- a/xen/arch/arm/physdev.c
>> +++ b/xen/arch/arm/physdev.c
>> @@ -9,12 +9,48 @@
>> #include <xen/errno.h>
>> #include <xen/sched.h>
>> #include <asm/hypercall.h>
>> -
>> +#include <xen/guest_access.h>
>> +#include <xsm/xsm.h>
>>=20
>> int do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>> {
>> -    gdprintk(XENLOG_DEBUG, "PHYSDEVOP cmd=3D%d: not implemented\n", cmd=
);
>> -    return -ENOSYS;
>> +    int ret =3D 0;
>> +
>> +    switch ( cmd )
>> +    {
>> +#ifdef CONFIG_HAS_PCI
>> +        case PHYSDEVOP_pci_device_add:
>> +            {
>> +                struct physdev_pci_device_add add;
>> +                struct pci_dev_info pdev_info;
>> +                nodeid_t node =3D NUMA_NO_NODE;
>> +
>> +                ret =3D -EFAULT;
>> +                if ( copy_from_guest(&add, arg, 1) !=3D 0 )
>> +                    break;
>> +
>> +                pdev_info.is_extfn =3D !!(add.flags & XEN_PCI_DEV_EXTFN=
);
>> +                if ( add.flags & XEN_PCI_DEV_VIRTFN )
>> +                {
>> +                    pdev_info.is_virtfn =3D 1;
>> +                    pdev_info.physfn.bus =3D add.physfn.bus;
>> +                    pdev_info.physfn.devfn =3D add.physfn.devfn;
>> +                }
>> +                else
>> +                    pdev_info.is_virtfn =3D 0;
>> +
>> +                ret =3D pci_add_device(add.seg, add.bus, add.devfn,
>> +                                &pdev_info, node);
>> +
>> +                break;
>> +            }
>> +#endif
>> +        default:
>> +            gdprintk(XENLOG_DEBUG, "PHYSDEVOP cmd=3D%d: not implemented=
\n", cmd);
>> +            ret =3D -ENOSYS;
>> +    }
>=20
> I think we should make the implementation common between arm and x86 by
> creating xen/common/physdev.c:do_physdev_op as a shared entry point for
> PHYSDEVOP hypercalls implementations. See for instance:
>=20
> xen/common/sysctl.c:do_sysctl
>=20
> and
>=20
> xen/arch/arm/sysctl.c:arch_do_sysctl
> xen/arch/x86/sysctl.c:arch_do_sysctl
>=20

Ok sure I will check if we can create a common entry for ARM and x86 for do=
_physdev_op().=20

> Jan, Andrew, Roger, any opinions?


