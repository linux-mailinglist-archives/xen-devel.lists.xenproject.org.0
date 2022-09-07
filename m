Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 015775AFB91
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 07:14:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400704.642399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVnNW-0004p7-OQ; Wed, 07 Sep 2022 05:13:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400704.642399; Wed, 07 Sep 2022 05:13:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVnNW-0004mn-Jv; Wed, 07 Sep 2022 05:13:34 +0000
Received: by outflank-mailman (input) for mailman id 400704;
 Wed, 07 Sep 2022 01:04:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IBV/=ZK=amd.com=Ruili.Ji@srs-se1.protection.inumbo.net>)
 id 1oVjU9-0000wQ-PU
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 01:04:10 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2084.outbound.protection.outlook.com [40.107.220.84])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f744562f-2e48-11ed-a016-b9edf5238543;
 Wed, 07 Sep 2022 03:04:07 +0200 (CEST)
Received: from BL1PR12MB5993.namprd12.prod.outlook.com (2603:10b6:208:399::9)
 by SA1PR12MB5616.namprd12.prod.outlook.com (2603:10b6:806:22a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Wed, 7 Sep
 2022 01:04:01 +0000
Received: from BL1PR12MB5993.namprd12.prod.outlook.com
 ([fe80::7927:cab5:fb94:1a50]) by BL1PR12MB5993.namprd12.prod.outlook.com
 ([fe80::7927:cab5:fb94:1a50%5]) with mapi id 15.20.5588.017; Wed, 7 Sep 2022
 01:04:00 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: f744562f-2e48-11ed-a016-b9edf5238543
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cfoAXYM/AccBBUZ2kvIQPbesPVs6Pqh5OEmy+ft0xDBTmw31UY9zoPPVRY+7deQuA3SbHzjZeOEzAx1mNdEGEiv2QZYtUD4uuBd/aduFUmciZOuT5VDz58SYkTiBAxy/sZqomQfn4ndcCx54yib/liahZPxUaKZzaLZcK+aZ+7hzcV9cJm8OSw8u/4Q/YsWuuh70JPv7/uAQYhhD0ZV9zgBZPJOp7FjOwdUvB+U48N98hBBGDU8MxrB0+lh8cwJ14khgrs2c2kIDbHxD+x1YgRB1hPp0hCVquKjehCocwn9ar8MrXMLH8fEsIpvkCxc2LYSdpnKQ2M/A0ZWCU1o8VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EfbaVcDF/+HgzY2EZTlGKVJ2eCb7mUtllno1jGHWAS8=;
 b=ZBA2IC+nWKZZsUNB+tNpDQNI2zuUA7DNY9ohZ6nRYzykkfjZJ5kWW89ZFFWeYI7CobB6pev969okj8G+biMljsba9NABsBSgPhM+yISniNohdCyfRtw950tUGJ+/REjbUeecxRuyZV68W5n3btKlUw+8oL3G2xyNqI9t8p1RtfNOKdcWlwWdun99ZI1GfBXvSMKKW55t4ZeJZmSJcd+XlsfLn4UjVL3bi3zaJX6fpxHvosAxN/1pUE+b6JixuGhDqUaikNDZV5Dhuhj91uh/92KEN1qhIDMhP3LHV6NhzQa3aoBVrNLax3adh31bpoUbL90N3tCp8GTyziX/OdxTaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EfbaVcDF/+HgzY2EZTlGKVJ2eCb7mUtllno1jGHWAS8=;
 b=GOya7h7Ehb4WLZI4Y4iYrVKshgjV4iBhGXc8buGu1oQ28ZnYDilzTPLAIA2NwrZN8wtM1S6zhz/WmiBYrrCtzKhkBwmYKTD6RW8TGjWGV9vsNuhUubKsfkhWiJb1KjB4uv0mR/61/rvFGwW3WVYDnbmlrvRaYVpzKVl882WwB9g=
From: "Ji, Ruili" <Ruili.Ji@amd.com>
To: Paul Durrant <paul@xen.org>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
CC: "Liu, Aaron" <Aaron.Liu@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH] hw/xen: set pci Atomic Ops requests for passthrough
 device
Thread-Topic: [PATCH] hw/xen: set pci Atomic Ops requests for passthrough
 device
Thread-Index: AdjBw9S5XjagBB9xT0W01YXm2Fq4yQAkLQ9g
Date: Wed, 7 Sep 2022 01:04:00 +0000
Message-ID:
 <BL1PR12MB5993C52DD9A881FACE6FA28D9B419@BL1PR12MB5993.namprd12.prod.outlook.com>
References:
 <BL1PR12MB599341DC55BA53FE588DE14E9B7E9@BL1PR12MB5993.namprd12.prod.outlook.com>
In-Reply-To:
 <BL1PR12MB599341DC55BA53FE588DE14E9B7E9@BL1PR12MB5993.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=149f7e60-4d0f-4975-8ab3-8497009eb09c;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-09-06T07:36:17Z;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 61751dce-687e-483a-9f93-08da906cd9a0
x-ms-traffictypediagnostic: SA1PR12MB5616:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ke1UyxEBtHyBg9EOnYYHA8ZrLreqPqczERLgez4hAsNj4B2ApcN/ltpQCKDkDZJcpaA8tBisN/jXkN4UhUYtpsTi75f7cIb89HWB4ocWjt7yohqc4qpYFF9a4vxdCqakYT1gAvKc90nOewfDfVmH0rvDjXyKUJAISaRSJNjZnqVYkGgo77IHY9ltvbT8OkAnFtH40NBmliIpEr3TJJuO2p1B/PNfyd7EZgoFhpkHpxtapKauAAHRn0oyJEvuwq1OulfhiDjlvkStuQls/q0s61EBOcHiQOPL1paWUyNmw3dixs80H/w+XB/QID4TYg8UtuklVaVnnoldzXxHP6mbuPh+IILXmzHhiOhti+hG7zcWhalXxN7TRuvtoj2/n2xlB1dqIU/A9VZ8yGAEgr8EeY4RRWLr3zD9DVs5UUuOcmsqBcI6zTpHH48Tbr8eb2sN2IxzMEUMv1ZNTxurHWlDlETgQ3wkjMcrOwBM/CsJEtZpLqS0wZgRQOzabD3wUYP+nQtTK4W2tAPHhBaPXy+kyomJvz3qQei1f1X/AyvkK4Uu9mBbrBbL2D1PQQ2Rhu7WYQGmF4uI9tp9SZUNXVbpF/eEhaLIEmBPKsgQvbQ9/Iae7b9kzVn2h/Y7oJOm6c/qSduX3DyD/JHR+CXkD22HbQXQBFMBZEFPIEptHhk+gpmvmzj32AyYzfozHvHFoyc6Fw8tDbqmkjOKjAeJuJ4iZyFKPx8woXnjDn83BZSi0OOmd7NiPr8rVcZb3DmEbn2HfxOtcByPBoGwad8cdTItLsgq5hEOiM+dkiARAHmTo04=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5993.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(376002)(396003)(346002)(39860400002)(66556008)(122000001)(966005)(38100700002)(38070700005)(55016003)(71200400001)(316002)(110136005)(64756008)(8676002)(4326008)(66446008)(478600001)(66946007)(54906003)(66476007)(76116006)(83380400001)(166002)(41300700001)(8936002)(86362001)(52536014)(186003)(33656002)(5660300002)(6506007)(53546011)(7696005)(26005)(9686003)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-2022-jp?B?MGdvVWFiaXFXV1NYTVJOYTVuZisrc3RsZmttdldEc3J0NXFEM09yZXkx?=
 =?iso-2022-jp?B?ODllVjVOYWdYanhLS3U4ZHBrRmwyeWxIdElodzY2d1BxYlJjd2ZFRktQ?=
 =?iso-2022-jp?B?ek82MjVNRUtBRVMxWk40aTVxdWtGaVBOSEUzSGhVeUxDT0hrcWdmL1ZY?=
 =?iso-2022-jp?B?ZmpnWlFJYTR0RlZIcVBEOUZUUDJUWW9TM2JmTHRxQ09RSUMwVkZkYWJ2?=
 =?iso-2022-jp?B?L1J1M1Q1d2szQ3VXQ1JBQVMyYWg5bTRQbEFuY3ZLQkZvRUZZcTJxZ2dZ?=
 =?iso-2022-jp?B?akUrVUpxVHNVSUtiYSs4ZWZsSzB4VXBVTzBoZUxuUlR5Vm1RNUdxVW5Q?=
 =?iso-2022-jp?B?NlRyMGRDZTNMZXRrRmRyNTBuOWM4TmZQZmx0TFh5YTZ2aGFzMFI1L3lk?=
 =?iso-2022-jp?B?LzQxTE9RdmwrblplOUdNa0pTYkhyaTZiUURCUk5GeE9EdlVxelhMeFlp?=
 =?iso-2022-jp?B?L3hUTjZFYzROODUyNHZnK211YkJiWElzWHNjS2RSRXRyQVRJVU12YzJT?=
 =?iso-2022-jp?B?WWk0RVZnOEIvZTl3U1FMQklFdHN5d2hoRTdvZkROYTRIczgzK1FtQmhB?=
 =?iso-2022-jp?B?N3ArUmlZZ1BJMnIwUEtibUo0UlJCMURqSXlFRkhPaTBoYkdvejNjRzJk?=
 =?iso-2022-jp?B?dzE2VWY2TGQwRDZLK1BnQUxxTnZINC83VmxoS25EYTJoSU5ldFE2ZDNk?=
 =?iso-2022-jp?B?WFZNcHdiVThyL3JOMGhLVFFSdW1zSUNuMXNaaUczZGFZby9acHpzWkg2?=
 =?iso-2022-jp?B?MkRjbkpUNXJlS3JFRzJiaktzeE1LV3NHTEZGVmpFNGZ2NVlFUVNNV1Vs?=
 =?iso-2022-jp?B?SUdnNWtwLzh2aTZYdnMwS1p5QUFJYmZkMmVzelNGblJENjVRVE5BMTd0?=
 =?iso-2022-jp?B?Ri8zTE5TWnBzNUc5emJxaGluTmNHUXluNUg2VnRyRjZsdEtLZUFxbnk2?=
 =?iso-2022-jp?B?ZFZVMzJrWkhYZzdmQmdEbUFSU1FxRkU3ajhoNTg3bTM4MHZPWEFldzZF?=
 =?iso-2022-jp?B?aS9YYUJtWXNkaWoyaHIySWNkMUNuVUFCR2grQm9mMk5zTVlkc0h4M1d2?=
 =?iso-2022-jp?B?cFo4WXlkQ3BXbWFsMmdiUjFKOXFlcStEMzM2bVN1T1ZKMTYxL1RUUW5n?=
 =?iso-2022-jp?B?UXZRVzdZVEp5VTk1THNYbm5xd1VKd1J6Vi9hU1pFOEc5M00wM2V1OVBl?=
 =?iso-2022-jp?B?VVZRUXcxSHhtSW9UTTc3Ym9WeGpDRk5KSWY0SG45UHA3MUtIdy80eUFq?=
 =?iso-2022-jp?B?WUlPRzR1ZFMwL24wekdGMHhuL3NXTUZialJkdlZhR1dmRXp3Q3Jub2Rk?=
 =?iso-2022-jp?B?aHhkWHpONldtRGxlUlJnRjR0VTc2WnRVQlFDcWppbEJ3d1ROVm5mSWpU?=
 =?iso-2022-jp?B?K3R5Q0o0RnFRRmRNdU1mc2c2Q3JHMW04bVlPNnpMV0UzU04wWnJGWTBC?=
 =?iso-2022-jp?B?S0JtT25SVkhkMVJzWnhaeDVQc3NsTlBZbjk1U0tvRUdHSkRLVGYvekZz?=
 =?iso-2022-jp?B?WnJBZ0kzV3g4c2RoTHphbzc5MHdMMmczZlZQWmpIOWQyUG1KY1hUZzQy?=
 =?iso-2022-jp?B?ZTZZMDlsL3JNeXJjNzIvY1NRZmc3d3BzMmtuTU1IVWd3akh2dTNWY1Mx?=
 =?iso-2022-jp?B?QU1YVFd6RjdHWGRJY3E2VDRZcXh1TEtqQVNPbUFKcmtpUTRzcjE2VGU5?=
 =?iso-2022-jp?B?WHhwTC9hZ0tDSlN2Yi92OHZWZlNnSTVHbFA5V2E0cGk5Q2xwejFZUm5i?=
 =?iso-2022-jp?B?WU1NTGxpb1AzbStSWlhmbDBpQjh5UjJ4VDZ4RXBWeHNKVnkxQjM0R1dw?=
 =?iso-2022-jp?B?QWdSWHlSN09QY20raGFaU1hHcWNGNXVFbVA2dEJsM2NWZmRtQ0s1MENw?=
 =?iso-2022-jp?B?bGhhSndLQ3MyRHRlTGZmSnBUUFE3cjMwbDBaRDlSMzdTajV1YXJPTUx1?=
 =?iso-2022-jp?B?a0ZZVTJ6ck91SEhTc3UrcWx2YnJqRC9sQ0FUT0o5eHUwSUZ6anBYbEth?=
 =?iso-2022-jp?B?WTEvVzVGZWllNEZTTVArSEZwbTE0T1gvYVZVbXlxTU9uYkNnN1N0UVJa?=
 =?iso-2022-jp?B?a2gvdXVabE1KZm9KQWVJd0ZLOUdnbkE1OWVNejlWN01yd0pnVHRiVmJ0?=
 =?iso-2022-jp?B?RUppUDQ0QlRsbkMrdDRaUVhDODRyU1V5M1QzQ2xCNEpuK3VNeEswaFdu?=
 =?iso-2022-jp?B?Q0hkZ2xQSkZEeTI5MzhLZWVpbnF1SXdFai9sTU11YWVuaFV5NzZqb3hp?=
 =?iso-2022-jp?B?MC8rSTlVYzZEMkkrSUs3Z01BQnc0Y2RQTHZWN0RJWTl6U3V2UGVVSTV6?=
 =?iso-2022-jp?B?ZlhVRQ==?=
Content-Type: multipart/alternative;
	boundary="_000_BL1PR12MB5993C52DD9A881FACE6FA28D9B419BL1PR12MB5993namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5993.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61751dce-687e-483a-9f93-08da906cd9a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2022 01:04:00.7928
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OqHcRt+3gpquEjOvu2LsYl2bHWcBrwhzkuzrfELO//YqIIb7KHkO+BRNdeGW6QBapzP5J0iOfMBgohFFa3X6Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5616

--_000_BL1PR12MB5993C52DD9A881FACE6FA28D9B419BL1PR12MB5993namp_
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - General]

FYI

From: Ji, Ruili
Sent: 2022=1B$BG/=1B(B9=1B$B7n=1B(B6=1B$BF|=1B(B 15:40
To: qemu-devel@nongnu.org
Cc: Liu, Aaron <Aaron.Liu@amd.com>
Subject: [PATCH] hw/xen: set pci Atomic Ops requests for passthrough device

From c54e0714a1e1cac7dc416bd843b9ec7162bcfc47 Mon Sep 17 00:00:00 2001
From: Ruili Ji ruili.ji@amd.com<mailto:ruili.ji@amd.com>
Date: Tue, 6 Sep 2022 14:09:41 +0800
Subject: [PATCH] hw/xen: set pci Atomic Ops requests for passthrough device

Make guest os access pci device control 2 reg for passthrough device
as struct XenPTRegInfo described in the file hw/xen/xen_pt.h.
/* reg read only field mask (ON:RO/ROS, OFF:other) */
uint32_t ro_mask;
/* reg emulate field mask (ON:emu, OFF:passthrough) */
uint32_t emu_mask;

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1196
Signed-off-by: Aaron.Liu@amd.com<mailto:Aaron.Liu@amd.com>
Signed-off-by: ruili.ji@amd.com<mailto:ruili.ji@amd.com>
---
hw/xen/xen_pt_config_init.c | 4 ++--
1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
index c5c4e943a8..adc565a00a 100644
--- a/hw/xen/xen_pt_config_init.c
+++ b/hw/xen/xen_pt_config_init.c
@@ -985,8 +985,8 @@ static XenPTRegInfo xen_pt_emu_reg_pcie[] =3D {
         .offset     =3D 0x28,
         .size       =3D 2,
         .init_val   =3D 0x0000,
-        .ro_mask    =3D 0xFFE0,
-        .emu_mask   =3D 0xFFFF,
+        .ro_mask    =3D 0xFFA0,
+        .emu_mask   =3D 0xFFBF,
         .init       =3D xen_pt_devctrl2_reg_init,
         .u.w.read   =3D xen_pt_word_reg_read,
         .u.w.write  =3D xen_pt_word_reg_write,
--
2.34.1


--_000_BL1PR12MB5993C52DD9A881FACE6FA28D9B419BL1PR12MB5993namp_
Content-Type: text/html; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-2022-=
jp">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Microsoft YaHei";
	panose-1:2 11 5 3 2 2 4 2 2 4;}
@font-face
	{font-family:"\@Microsoft YaHei";}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<p style=3D"font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;" ali=
gn=3D"Left">
[AMD Official Use Only - General]<br>
</p>
<br>
<div>
<div class=3D"WordSection1">
<p class=3D"MsoNormal">FYI<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b>From:</b> Ji, Ruili <br>
<b>Sent:</b> 2022<span lang=3D"ZH-CN" style=3D"font-family:&quot;Microsoft =
YaHei&quot;,sans-serif">=1B$BG/=1B(B</span>9<span lang=3D"ZH-CN" style=3D"f=
ont-family:&quot;Microsoft YaHei&quot;,sans-serif">=1B$B7n=1B(B</span>6<spa=
n lang=3D"ZH-CN" style=3D"font-family:&quot;Microsoft YaHei&quot;,sans-seri=
f">=1B$BF|=1B(B</span> 15:40<br>
<b>To:</b> qemu-devel@nongnu.org<br>
<b>Cc:</b> Liu, Aaron &lt;Aaron.Liu@amd.com&gt;<br>
<b>Subject:</b> [PATCH] hw/xen: set pci Atomic Ops requests for passthrough=
 device<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">From c54e0714a1e1cac7dc416bd843b9ec7162bcfc47 Mon Se=
p 17 00:00:00 2001<o:p></o:p></p>
<p class=3D"MsoNormal">From: Ruili Ji <a href=3D"mailto:ruili.ji@amd.com">r=
uili.ji@amd.com</a><o:p></o:p></p>
<p class=3D"MsoNormal">Date: Tue, 6 Sep 2022 14:09:41 +0800<o:p></o:p></p>
<p class=3D"MsoNormal">Subject: [PATCH] hw/xen: set pci Atomic Ops requests=
 for passthrough device<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Make guest os access pci device control 2 reg for pa=
ssthrough device<o:p></o:p></p>
<p class=3D"MsoNormal">as struct XenPTRegInfo described in the file hw/xen/=
xen_pt.h.<o:p></o:p></p>
<p class=3D"MsoNormal">/* reg read only field mask (ON:RO/ROS, OFF:other) *=
/<o:p></o:p></p>
<p class=3D"MsoNormal">uint32_t ro_mask;<o:p></o:p></p>
<p class=3D"MsoNormal">/* reg emulate field mask (ON:emu, OFF:passthrough) =
*/<o:p></o:p></p>
<p class=3D"MsoNormal">uint32_t emu_mask;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Resolves: <a href=3D"https://gitlab.com/qemu-project=
/qemu/-/issues/1196">
https://gitlab.com/qemu-project/qemu/-/issues/1196</a><o:p></o:p></p>
<p class=3D"MsoNormal">Signed-off-by: <a href=3D"mailto:Aaron.Liu@amd.com">=
Aaron.Liu@amd.com</a><o:p></o:p></p>
<p class=3D"MsoNormal">Signed-off-by: <a href=3D"mailto:ruili.ji@amd.com">r=
uili.ji@amd.com</a><o:p></o:p></p>
<p class=3D"MsoNormal">---<o:p></o:p></p>
<p class=3D"MsoNormal">hw/xen/xen_pt_config_init.c | 4 ++--<o:p></o:p></p>
<p class=3D"MsoNormal">1 file changed, 2 insertions(+), 2 deletions(-)<o:p>=
</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xe=
n_pt_config_init.c<o:p></o:p></p>
<p class=3D"MsoNormal">index c5c4e943a8..adc565a00a 100644<o:p></o:p></p>
<p class=3D"MsoNormal">--- a/hw/xen/xen_pt_config_init.c<o:p></o:p></p>
<p class=3D"MsoNormal">+++ b/hw/xen/xen_pt_config_init.c<o:p></o:p></p>
<p class=3D"MsoNormal">@@ -985,8 +985,8 @@ static XenPTRegInfo xen_pt_emu_r=
eg_pcie[] =3D {<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .of=
fset&nbsp;&nbsp;&nbsp;&nbsp; =3D 0x28,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .si=
ze&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D 2,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .in=
it_val&nbsp;&nbsp; =3D 0x0000,<o:p></o:p></p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .ro_mask=
&nbsp;&nbsp;&nbsp; =3D 0xFFE0,<o:p></o:p></p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .emu_mas=
k&nbsp;&nbsp; =3D 0xFFFF,<o:p></o:p></p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .ro_mask=
&nbsp;&nbsp;&nbsp; =3D 0xFFA0,<o:p></o:p></p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .emu_mas=
k&nbsp;&nbsp; =3D 0xFFBF,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .in=
it&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D xen_pt_devctrl2_reg_init,<o:p></=
o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .u.=
w.read&nbsp;&nbsp; =3D xen_pt_word_reg_read,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .u.=
w.write&nbsp; =3D xen_pt_word_reg_write,<o:p></o:p></p>
<p class=3D"MsoNormal">-- <o:p></o:p></p>
<p class=3D"MsoNormal">2.34.1<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</div>
</body>
</html>

--_000_BL1PR12MB5993C52DD9A881FACE6FA28D9B419BL1PR12MB5993namp_--

