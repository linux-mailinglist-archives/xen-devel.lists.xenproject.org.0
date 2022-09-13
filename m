Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD675B67D5
	for <lists+xen-devel@lfdr.de>; Tue, 13 Sep 2022 08:23:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.406161.648564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXzJY-0007iA-BL; Tue, 13 Sep 2022 06:22:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 406161.648564; Tue, 13 Sep 2022 06:22:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXzJY-0007fY-87; Tue, 13 Sep 2022 06:22:32 +0000
Received: by outflank-mailman (input) for mailman id 406161;
 Tue, 13 Sep 2022 06:22:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b6O5=ZQ=amd.com=JESHWANTHKUMAR.NK@srs-se1.protection.inumbo.net>)
 id 1oXzJW-0007fS-LC
 for xen-devel@lists.xenproject.org; Tue, 13 Sep 2022 06:22:30 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2042.outbound.protection.outlook.com [40.107.96.42])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7086b4e7-332c-11ed-a31c-8f8a9ae3403f;
 Tue, 13 Sep 2022 08:22:28 +0200 (CEST)
Received: from DM6PR12MB4564.namprd12.prod.outlook.com (2603:10b6:5:2a9::18)
 by SJ0PR12MB5612.namprd12.prod.outlook.com (2603:10b6:a03:427::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Tue, 13 Sep
 2022 06:22:23 +0000
Received: from DM6PR12MB4564.namprd12.prod.outlook.com
 ([fe80::d0bb:4d4d:7767:19fd]) by DM6PR12MB4564.namprd12.prod.outlook.com
 ([fe80::d0bb:4d4d:7767:19fd%7]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 06:22:23 +0000
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
X-Inumbo-ID: 7086b4e7-332c-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FW2Ggso/t2NevcsLRnbP8gLOBz0PzGzpQAH9D+V5UfOtZtee/fgpgfwPfekCEub91I+ATvlJBs/SNQV6pXxrYdZusGG5QCvT0MGlJ3Ft7BsBchvWtIgzWy6AQko1HgswCtZCH3JU//2OZ82+EOjaToiktydCGViNsiXzU+BPnIJaK431cg9m1E4wnt8LYD82CDbBTSQ9zJcNNkL4H/b7wYMylKXrVJI07vtoregw5dwGv7UKrj7IC9W2goP02nuwQFjgj0Fz8Xl98Jk1Gp9VW9B8ecXkWxPC45VFNHidv0pYN5xVAsDQ5v5SUDA8be9JtQCPTnFnntY1b2hM040RnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eeI2GHQoSQJ/z4bhyVAn5nh3VxtQLjdiG+MncCbq/GQ=;
 b=b6zpixlotxnTfy4cOdBBx+ViFGv13oKZXskU1cy/bztK3sFqF/1nLuKX9oBajhW2AabSNI6lMrHARwNZw9DqYqCYTCK3uRHXmcdOlyqBWzrizEu9pRhwUw8ts0h21gnewT1c2QMB78vqljoEB3XIlrNmRrmJn5wlYpguoVSbK0SzAoRgc11n7VUTtenuzCTavacWc/bObXRz4Jo/awv/iviS3QZ1RmVBdHsVDuzA8wJuYgUzPPPJ/YUV44+pMVdhH3tOg5QZbMquhxFsnFUSu6VKgHp409UA9ZN9Y3xe3Qw9QVYOTb23X8JXynb1/otXiByJ1nRzbhJV9cxNgNBPxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eeI2GHQoSQJ/z4bhyVAn5nh3VxtQLjdiG+MncCbq/GQ=;
 b=zERWJeCN2BdHNIPmx53q6k7NuRGGpf/EIBp4oEMRw48uwLMTlG8EU/+8Nh9if/cWLaAne0eTrcVnN/Cg4TCH6MfHSNyj3c58NbxIV4zVuHLK6vNmYtogvZHZEjLhkNa8rpBBTNTi2tGQaZC1YT03J1DeNHQ0HCviKIl+WNUMe/s=
From: "NK, JESHWANTHKUMAR (JESHWANTH KUMAR)" <JESHWANTHKUMAR.NK@amd.com>
To: "Stabellini, Stefano" <stefano.stabellini@amd.com>
CC: "Stabellini, Stefano" <stefano.stabellini@amd.com>,
	"boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Rangasamy, Devaraj" <Devaraj.Rangasamy@amd.com>, "Pandeshwara krishna,
 Mythri" <Mythri.Pandeshwarakrishna@amd.com>, "SK, SivaSangeetha (Siva
 Sangeetha)" <SivaSangeetha.SK@amd.com>, "Thomas, Rijo-john"
	<Rijo-john.Thomas@amd.com>, "jgross@suse.com" <jgross@suse.com>
Subject: RE: Linux pin_user_pages_fast fails on Xen
Thread-Topic: Linux pin_user_pages_fast fails on Xen
Thread-Index:
 AQHYw/FtbHk6dXjix0qU8E4gYrQhY63WppaAgADmKYCAAIgNAIAEgvEAgABFGKCAAA00AA==
Date: Tue, 13 Sep 2022 06:22:23 +0000
Message-ID:
 <DM6PR12MB4564E946E0E08F71B1CC125CE6479@DM6PR12MB4564.namprd12.prod.outlook.com>
References:
 <alpine.DEB.2.22.394.2209081905010.157835@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2209081910340.157835@ubuntu-linux-20-04-desktop>
 <017b8061-110b-a77f-6f0c-9f5679b7df13@suse.com>
 <alpine.DEB.2.22.394.2209091314430.157835@ubuntu-linux-20-04-desktop>
 <9f11a181-75cb-aadf-2ce8-8bb6737af9ac@suse.com>
 <alpine.DEB.2.22.394.2209121819430.157835@ubuntu-linux-20-04-desktop>
 <DM6PR12MB4564760C66FFA15ADAE2B014E6479@DM6PR12MB4564.namprd12.prod.outlook.com>
In-Reply-To:
 <DM6PR12MB4564760C66FFA15ADAE2B014E6479@DM6PR12MB4564.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-09-13T05:35:20Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=ac6f7c04-2fd4-4892-9f5a-0d147769eed1;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_enabled: true
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_setdate: 2022-09-13T06:22:21Z
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_method: Standard
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_name: General
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_siteid:
 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_actionid:
 fe0e37e6-7c22-4e1c-9278-1114ea80da6d
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB4564:EE_|SJ0PR12MB5612:EE_
x-ms-office365-filtering-correlation-id: 57af4fc0-7c8f-4d97-7ee8-08da95505251
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 jDb1dRHoJCV1Kg4+n1HSjQqp0gHDkztox7zwxTmVDyKA+0IAXewhU9Igs506OBziQnbiK1nr3/OZAXJ/Lp7ITu59N5wu1qdXC5H5Ym7NMqU3yeWpmF84KX4+pnMc/UHHOyPXeCmL0Pk2vUzXqbKTYkUyUXu4URs0DDmgkVFyJxaoo6E/9A6IzryIuXwteEpceJC4Vd1o9NUPohTr8mzY5ZUT6Cnz9PUzh1vLpyLRI2OqnhB8wsFbIsTbHEaYNQO2BSUu8jU13AVinxpVJ3mwM8srYvKnGw1TVX/nVF6k9OCbNsD4O+hJUW96I9BNdn1kc64V5JkzCjBFVMYBNwNo6ei3ewDlnveQ1H2WDmen2xzfVLscoSn6QiZajf/0GxhOZmVErBdq+8VgQ9UL6XaScV/0Vg1lMkIf2J/0jdHOGaBqZqZDnLaDZ6FebYu+MWPUxLjK861VYSx9aoMZmA0ZQp29FLjY1o+3okZckUNH9SIFKh6LyKQ2/oeYnmwqPxlHW2AFXdFI2ENyu4lGiS9QxKyl+3Oa2owQJwwd7Pi21VFJu+Q9YmpwQ8cd01SXq8ZPtzZReRgET9R2AqAtsb4fF8GUc7gKsD6IY9/oxJtVv1lymxVLeCmQ36tD9SyXxD55YfM2+hMRf5YPoixdPKS0vjbBPCypR/uBbAiZ6bDR3rkBHQOMqNIArgqD20o8lzoxm8WMaFj+kAcqorkr2F8++8owKUHBNrHNIYXKadlOdAHzfONWBa3o2858OiyVNuDSOD3jlE1coJHbRHLJr8X7ywt5GypbsykI9vGnz8FgG5Y=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4564.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(396003)(346002)(136003)(366004)(451199015)(4326008)(66556008)(66446008)(66946007)(8676002)(76116006)(66476007)(64756008)(5660300002)(6862004)(9686003)(966005)(38070700005)(6636002)(316002)(26005)(86362001)(54906003)(38100700002)(71200400001)(52536014)(33656002)(186003)(55016003)(6506007)(122000001)(7696005)(41300700001)(83380400001)(2940100002)(478600001)(2906002)(8936002)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?7ewNgkvPqtJrvI3f6qnmoNkLgALgdUQJkb85P4SzUtCVG2eBA3AYRgPu2O9b?=
 =?us-ascii?Q?qpNDQyWYdz9UvF/mCzwQ9bDxLmq5dbHjFrS627/KuJop+63gTU2ShfVq4ebL?=
 =?us-ascii?Q?lWnODDG3O6xyjKUr5AnzfkoL2o1GEn8AIHNMqfEUtZhFAzs6O7C/PJVA0zJX?=
 =?us-ascii?Q?jZckVDRVTYQh/3YpIYINR5IBOK4HqhfHlq6huajNqWfxYhCQX0FRbPKTTrne?=
 =?us-ascii?Q?Awo8A4kCgBLWvsFOFHYqr+jbmIK7rAW6YfGE5GO0tuZBJjUVqq6x0AOtmMyr?=
 =?us-ascii?Q?hFZ18wpMuZfezykg3zR7xk9LSZCnfajVtswqcTQdnX5kYb59VTwK84iiXNXh?=
 =?us-ascii?Q?tHA0B3iK9fq9ltMySZnx1Qqvew+xO4ybEVl8szjLN3XeU1gEhf71yezUnDvT?=
 =?us-ascii?Q?Ywpnxu4G1P91SDyce0wdS3cpsOPzps01wWYwUsWs/Ufe/wgHj3ScyIYg6WBR?=
 =?us-ascii?Q?pMj1z65OtDmDGBAwlYpBc/z8Fp1bD/XezzJr/8V5wjhlPXo+PfGrtPxiiEd5?=
 =?us-ascii?Q?T7Oma0Db41ZG1LYLU1ESYcbU/4Rp6FSkfAG3Y6jjSV3CYrkbjEnKrpzSnbzD?=
 =?us-ascii?Q?KzCS+eFGsUIofkuAyEc17wjr/ZT55B5TTPV2MLGg7L78oO7ibMNnAGtMsRWt?=
 =?us-ascii?Q?3mj2Qw8kgNSK1DPFW+QIVO81BkpAs1eWmbxrxVEOm5yORqVmeWGGpO4//0iu?=
 =?us-ascii?Q?WxRsb4RggQ6zpctgsRezoG0kQ8Gk7yVo1fa8D1SetZTtekTPYX3C97sNySQv?=
 =?us-ascii?Q?mcTOs7x3Fj0txYGlz9fgzMyLICRI/ebne5tsWgEu5xNLH7CBMxLWu+mrse+2?=
 =?us-ascii?Q?S3SDwRo9uxIilh8nckpZ6ZklHcHlocJaZ0i2rpNNyvdJ2Nzg/IqXlF5nH1LC?=
 =?us-ascii?Q?ELHiouDOZfVmAQKGiZ44Uf8wfxA8pcnOJhcn5498xB4RtmgxeoPDg74qxkC/?=
 =?us-ascii?Q?ctGtWkuqPv8U3nZzcAAEAnFpT0qN8hw2/6g1sEx0wi0AYzld23egLa5gfsXq?=
 =?us-ascii?Q?IaIZiEzYfHxfx0/GJzlivqy7h41cq/MWN/GHmy+rZiuGzKO7KJw3oxs9yHNQ?=
 =?us-ascii?Q?S4jcrHtfQO0unpqg6AW3V2HJVdOJaRpBs7KGUnvXiFyQTc8TUGNak9UgfLGy?=
 =?us-ascii?Q?IcHD8Bv8vihfVAuTaBN3E8oOKwKPToCRCQ20g09nMsTq0nnC3zq81x78fyls?=
 =?us-ascii?Q?hwpokJBJRzJIuD+7q7J8It6F39neGEQyxyogT+mixmQQhx181A3QcDyG5+EE?=
 =?us-ascii?Q?XVbbNs5bX5CJ8mr3UKSDhJxkvznV9sazVq2mAFaUZpw4Yu1pyiS0G5Rdi1Gd?=
 =?us-ascii?Q?BZGRzLrzYgHFJA5w0v4rG/AvwQVHkfiYThqOwBTRZcM4KMWiemIMQBXJp6oE?=
 =?us-ascii?Q?tIPwa8ZAjePm2m1znvXJ/lIJkyHEULdDSyvFqDCZxtGPbbFz/MLnPF5LwZzU?=
 =?us-ascii?Q?WkwwXlIL1spb6N208S4Yjf9iHKgwau+KnsX8clQX2Ym9h7D+CXxdkyvl7DN7?=
 =?us-ascii?Q?Ztd1BMcn13GnTRY9M9GAuERNLSl0wlQNhY5jqfMH4o1B7JMYfT/5wANODU5a?=
 =?us-ascii?Q?M4zQp5VxloBjoKA6Gpo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4564.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57af4fc0-7c8f-4d97-7ee8-08da95505251
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2022 06:22:23.7185
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mrDYBMjIuDlr0SWmJWmnErHkY9z/oi0YsqJrhAWT2Ahb9VQichtTWVjhXVP7zhP/g7+cqK/fa0BT0KkxyDRtRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5612

[AMD Official Use Only - General]

Missed to update the Flag details:

Flag for DMA Mapped VA - 0x0C0644BB
Flag for Local VA 	   -  0x08100073


VM_IO and VM_PFNMAP  - Set in DMA mapped VA but not in local VA.

Regards,
Jeshwanth

-----Original Message-----
From: NK, JESHWANTHKUMAR (JESHWANTH KUMAR)=20
Sent: Tuesday, September 13, 2022 11:05 AM
To: 'Stefano Stabellini' <stefano.stabellini@amd.com>
Cc: Stabellini, Stefano <stefano.stabellini@amd.com>; boris.ostrovsky@oracl=
e.com; xen-devel@lists.xenproject.org; Rangasamy, Devaraj <Devaraj.Rangasam=
y@amd.com>; Pandeshwara krishna, Mythri <Mythri.Pandeshwarakrishna@amd.com>=
; SK, SivaSangeetha (Siva Sangeetha) <SivaSangeetha.SK@amd.com>; Thomas, Ri=
jo-john <Rijo-john.Thomas@amd.com>; jgross@suse.com
Subject: RE: Linux pin_user_pages_fast fails on Xen

[AMD Official Use Only - General]

Hi Stefano,

https://elixir.bootlin.com/linux/v5.16/source/mm/gup.c#L975 is the -EFAULT =
returning for our current use case.

access_ok is fine.

Regards,
Jeshwanth

-----Original Message-----
From: Stefano Stabellini <stefano.stabellini@amd.com>
Sent: Tuesday, September 13, 2022 6:56 AM
To: NK, JESHWANTHKUMAR (JESHWANTH KUMAR) <JESHWANTHKUMAR.NK@amd.com>
Cc: Stabellini, Stefano <stefano.stabellini@amd.com>; boris.ostrovsky@oracl=
e.com; xen-devel@lists.xenproject.org; NK, JESHWANTHKUMAR (JESHWANTH KUMAR)=
 <JESHWANTHKUMAR.NK@amd.com>; Rangasamy, Devaraj <Devaraj.Rangasamy@amd.com=
>; Pandeshwara krishna, Mythri <Mythri.Pandeshwarakrishna@amd.com>; SK, Siv=
aSangeetha (Siva Sangeetha) <SivaSangeetha.SK@amd.com>; Thomas, Rijo-john <=
Rijo-john.Thomas@amd.com>; jgross@suse.com
Subject: Re: Linux pin_user_pages_fast fails on Xen

On Sat, 10 Sep 2022, Juergen Gross wrote:
> On 09.09.22 22:25, Stefano Stabellini wrote:
> > On Fri, 9 Sep 2022, Juergen Gross wrote:
> > > On 09.09.22 04:11, Stefano Stabellini wrote:
> > > > Adding more people in CC
> > > >=20
> > > > On Thu, 8 Sep 2022, Stefano Stabellini wrote:
> > > > > Hi Juergen,
> > > > >=20
> > > > > A colleague is seeing a failure on x86 in Linux Dom0. The=20
> > > > > failure is pin_user_pages_fast with addresses that correspond=20
> > > > > to foreign memory
> > > > > pages:
> > > > >=20
> > > > > - QEMU maps a domU address using dma_memory_map
> > > > > (xen_map_cache)
> > > > > - QEMU calls an IOCTL to the TEE subsystem with the Virtual Addre=
ss
> > > > >     returned by dma_memory_map
> > > > > - Linux tee_shm_register->pin_user_pages_fast Returns -14 -=20
> > > > > drivers/tee/tee_shm.c
> > > > >=20
> > > > > Once upon a time it used to be the case that=20
> > > > > get_user_pages_fast would fail on Xen because we didn't have a=20
> > > > > struct page corresponding to foreign memory mappings. But that ha=
sn't been the case for years now.
> > > > >=20
> > > > > Any other ideas why it would fail?
> > >=20
> > > I think we can expect that access_ok() isn't failing.
> > >=20
> > > I assume the mapping was done allowing writes (sorry for paranoia mod=
e)?
> >   I was told it was verified: QEMU could read and write to the VA=20
> > returned by dma_memory_map. From /proc/<qemu-pid>/maps, the VA=20
> > assigned after the mapping is pointing to /dev/xen/privcmd.
> >=20
> >=20
> > > Other than that I'm not having enough memory management skills. It=20
> > > might be related to mmap()-ed foreign pages having _PAGE_SPECIAL=20
> > > set, though.
> >=20
> > Do we still set PAGE_SPECIAL for foreign mapped pages? It looks like=20
> > it is not there anymore? If PAGE_SPECIAL is not there, then they=20
> > really should look like regular pages?
>=20
> See the call of pte_mkspecial() in remap_area_pfn_pte_fn() (mmu_pv.c).

The kernel version is 5.16 and the return code is -EFAULT. Is it the follow=
ing -EFAULT the one that triggers?

mm/gup.c:internal_get_user_pages_fast:

	if (unlikely(!access_ok((void __user *)start, len)))
		return -EFAULT;

