Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 397BBD2D67D
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jan 2026 08:44:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1206264.1519930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgeVf-0006zU-13; Fri, 16 Jan 2026 07:44:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1206264.1519930; Fri, 16 Jan 2026 07:44:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgeVe-0006xx-UM; Fri, 16 Jan 2026 07:44:42 +0000
Received: by outflank-mailman (input) for mailman id 1206264;
 Fri, 16 Jan 2026 07:44:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XdZn=7V=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vgeVe-0006xr-4s
 for xen-devel@lists.xenproject.org; Fri, 16 Jan 2026 07:44:42 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36ee59fc-f2af-11f0-b15e-2bf370ae4941;
 Fri, 16 Jan 2026 08:44:40 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 SN7PR12MB8792.namprd12.prod.outlook.com (2603:10b6:806:341::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 07:44:37 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2%2]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 07:44:37 +0000
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
X-Inumbo-ID: 36ee59fc-f2af-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f3QCkdot+IMRDqd5PQhJUq7IIOMDQ/Vd68CzeQoeXoWjibOuxnZMsyxL7yzYbrp6r8gi6bIv8OJK9PEQTKtGS3sd0b/BXDSzSqS+taYUznfi4LwNnbxQQRVAPuAgScnwcJAdjTTWGxweEF1RfRes3w9HcTsEwsFE0RGrzVbJy2ADkPxPvM7nsLGD9a4cEn1aNY90v4AKGJLIieHAeQJnfJ4oP8KTRrio/p3mye7R/uPKLS/owwzzC4OYU6ZUEWm66xYBALzkqBCc02jNfi5Dj8g9BeJKmEpuapXCduR1t+692Pm3O3TQgUye+Y3D5Sxud20UbDvodZBgOa2BqLbSvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O0qMULjR5iUcnvMlfl+mMRmygHqA3d8qIBtZu1FHGgg=;
 b=xRYW1N0qBdLfnKgtxYMeS/iNF7Q+sAZk+qQ/4Obv886pMeZpvo5w8h2UwZqNvJ0qi6dtzXgHUUDFKnCq6NMXGCIiieuCTAtVDoORFDx3hRVInEKQvpFt1x4D9ui5n3bSAlnBotDG0/iQXB33H6mXIlloCS2zgvf12ocPAcbYeyTvVBgthJojhB0TixZWJd6DLTLq0WnVcmxbG3y1GtN6Lsgd1MOLyshZHHTqNe3MgxmWYtXI9PE9DW+6NJk0caWzI0bpapz3MLOgTxLVtgGXHaCifdZW5yZmmCXm30ed/Ys1F49W0J5Rz95KQ/6gn0B6nyt7MwFN4itdHasBUK1ySg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O0qMULjR5iUcnvMlfl+mMRmygHqA3d8qIBtZu1FHGgg=;
 b=nb/cq53KBKW2C4zInejNn6iqokhkV8Xxnmg6SuMo6VPg7qXpWgPTpnpnxWI3ueKG7PpqFmArYIAuuDSnJ71SqDXDoy2Iquu3BgFIYFB2IRHMLUEHeJyIt4NIGOJ9mRP2qb1A5rtG32UOnMk7EITWbJb/y361IRDBYkqf/tSSDEI=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Tamas K
 Lengyel <tamas@tklengyel.com>
Subject: RE: [PATCH v4 5/6] xen/mem_access: wrap memory access when VM_EVENT=n
Thread-Topic: [PATCH v4 5/6] xen/mem_access: wrap memory access when
 VM_EVENT=n
Thread-Index: AQHchgFz7GhZy9MFSkqKuUrhU5ZbzrVUa57Q
Date: Fri, 16 Jan 2026 07:44:37 +0000
Message-ID:
 <DM4PR12MB845165677B332BBE0C2B9DCFE18DA@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20260115092841.2651224-1-Penny.Zheng@amd.com>
 <20260115092841.2651224-6-Penny.Zheng@amd.com>
In-Reply-To: <20260115092841.2651224-6-Penny.Zheng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2026-01-16T07:44:24.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|SN7PR12MB8792:EE_
x-ms-office365-filtering-correlation-id: e454ba37-e391-41dd-a8c4-08de54d3194e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|7053199007;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?WYF+35spRsgV/l7VWihpVWlkdKF28CHVX0Txq7fph0vaPn2dylUcGAbmqj?=
 =?iso-8859-1?Q?+U+z7jDEAqMhvPAxakU2LBO5bYPYn10BnTRlCWzTF0rl/dw7JfKvg5vtpB?=
 =?iso-8859-1?Q?ZSCGJiOhxd4qPBVpuDM1LBkz/tDCyIjjXfbCdQ4BkJfLVx2dNGbDoaVWcz?=
 =?iso-8859-1?Q?UvqBnXBf4gE3qBK/ZVEvy254/tZmsvhw7V4EfdJG/L04vgGLmCahsRpZ9z?=
 =?iso-8859-1?Q?Gb3suiR3IAloEyeWAkEjOlOjNhXsrfceLhD3wjW80jZNMhEvW3T4mKg3Ev?=
 =?iso-8859-1?Q?HhTjOhUpAotREd2Cld1jyrRxtbOl8Iz0h8ygqYTsD3pLZWt/L7k6Fj+5cs?=
 =?iso-8859-1?Q?+kYsg7Bc9Qd94Ay0exkVLa/XFuvbpNEW8wWGwse+Vs/8qGrDTYgwVtgzDj?=
 =?iso-8859-1?Q?9naeMqbMynDiRSLetdewUKz+Y00uBHRysW3hPB0E5JFyUOMagH2iWdBt4y?=
 =?iso-8859-1?Q?rasiWHF9jLyLS+RzYPvYlZNwpajJIkQou8IcHYYgEmauEt08aJYLGH312Y?=
 =?iso-8859-1?Q?KxD8QvHcE7HIrKgxcHF4NdU8f6BExKlv1dDNwmQmsR8NqGfeuvw4F+goBy?=
 =?iso-8859-1?Q?UBD8sUdqKkK8K9Q8sU8Jr3jds5L+UHHe6s7bgh+MO1ASnOR7y1E4DSVH51?=
 =?iso-8859-1?Q?rlo0xiknYWaugwDy8TxyC4hFU4s2YzMNvHrnYcqJDaAs3gJkzAxK+ihP3m?=
 =?iso-8859-1?Q?BKG3nL9fPJVqBr1eohyhl6rKDNqn3e7YU6OwyQmG+9jqtd1lsP/xMCSife?=
 =?iso-8859-1?Q?mPL8K7ju/9/kaflaIpqopPpvW9KXXL2IMsxhzgRQWB/wR0KwMVQB2NZg9G?=
 =?iso-8859-1?Q?mezjOmaP3A1ru0I8Paut9AI2OpZVkF47TubB6iguv+SwUQGBJEFOO09syV?=
 =?iso-8859-1?Q?0ZnXM470wMLjKRljAF7eAe3nXYg10DzKHRkU46E+sbMS8Hq1MwSo3hgaKd?=
 =?iso-8859-1?Q?+qxV2zWMoEXtmZ4z5LC+aJrQiIWuT/+wq2vBrgUGPEg86qkpME2QEwoH6Q?=
 =?iso-8859-1?Q?ie//fbphOo0s/OrFwncMBXelwTa6I5baP6cZivMpsHtwc95tJR/GAAg3CZ?=
 =?iso-8859-1?Q?Tf9MXXIfHIMORo08cEiIjlIyNFrd+KsM9wLjHokhnJN19C9NrTJAAHS68k?=
 =?iso-8859-1?Q?V1T47Gwazx/y5hyZJrjsl2EKcN9wNyOKoZjARD3CDRSjss2RbQClhPwve9?=
 =?iso-8859-1?Q?w777h9wmt1BrpDk0PcjS/FFvDaR68Xhh+Vci0RdOMne+IPZY+xDlP5ePlm?=
 =?iso-8859-1?Q?CVc11oGFNWl14n2HoKKSmvgwXvRnUlod0P7I/fiDoLadBZltifYgen2GUN?=
 =?iso-8859-1?Q?eE18Pi4Y1b3Z5Gvd31nOL6fXeKwbeqFWEwXKJ9dPbO0sUQhRRMQJs5IYye?=
 =?iso-8859-1?Q?MJ76Qejrf8Etganj/IVa4+svigJrmZk5opxUdEcYeqKpKw2//dYjsw7IgL?=
 =?iso-8859-1?Q?xcBs8rCD+8KQdGDamyQQ0NKZPVFioSrJT9k10BholN3JMmANcWGf50xTly?=
 =?iso-8859-1?Q?CahJJcsI8olXO5FdeT0+dVbnBEBYEPq9lBfDHiTMKp0ZylwERyxFSd1i+O?=
 =?iso-8859-1?Q?vXrSiu+NcLXH77CgfrDYn9xhKUXtqNcjCPNMdhR5sVDfcwaJuYhFssEw41?=
 =?iso-8859-1?Q?aKGf7XtsUnMOFiq3H1/oLOQfchMgy9D/TMdbWalnH/kGKbH6Tg+iSRN+87?=
 =?iso-8859-1?Q?lfryCLgHnn+25W/+sQU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?2El+j3KA4f1InO1XGt9T1BaUOceDKbGFlUCAK7WmztQHddXtXYHRiYoUHo?=
 =?iso-8859-1?Q?K0DMdNp9DAGrg6rTq8ZCQb47X1UXUu3ZIFIOnBmMx56cC4wmmlYpleavHf?=
 =?iso-8859-1?Q?sDUz8NDMR+kufdNXJcW7awX9qAQ0qZo8gZCGNIzX05Nj6r08olEQwSozFc?=
 =?iso-8859-1?Q?zDOYzGia7e5VXkJ5gkNLLGL+J036xyxDGpMieEE7Z0k+2X9V2w7Xhnd6GO?=
 =?iso-8859-1?Q?C7yn0iH0eOnP6xkdxfAD0j16MJcD5OfPrsc7cH1GC+dqS+6TiFWJE5RJKB?=
 =?iso-8859-1?Q?Oy9i3wZEpxGYx68niwYGs0oe3bFuQsFlqHcMkyFT1b0ar8G3jsRFjNo/K2?=
 =?iso-8859-1?Q?pYKYLjn0G5pdFjOwCn2mTUBf7bV+pVGPcp8o9Kn+y3B4Fx7P2XoMXAlWDk?=
 =?iso-8859-1?Q?8tqfD/UMmuOFtvFSnVV8PUCQjlt/ini9qbTghdrBRU2Lm7TjLhPb7/zzSz?=
 =?iso-8859-1?Q?QET7Z2r8sTqHev09zzH8E3mAeJriKHV2CGHOFZV1SQBXlIuxEBtkVFGceT?=
 =?iso-8859-1?Q?Mx+7K/BN/RJt6o+ErcsoTONBXAgkDxRrQlYsBdpPUDSFpS08+rQsRC5VZv?=
 =?iso-8859-1?Q?0ON6cedgh89G6hzJGQVwxKL0QlJi2Hrqs2uw9RkFeOMTSYhJ8oRV0LvVmg?=
 =?iso-8859-1?Q?pcnikzLCWIS+fzEc/waYjaxlm1+JK9ioOD/b2yA4LvFeHvWyhrCJcrj/Zs?=
 =?iso-8859-1?Q?vAwOnH+B61GeUlXCpxN9cSCLQWynFWfCHicUXt57NphBm78vsvTOpri1yB?=
 =?iso-8859-1?Q?zFcw+tW9x4Ttn9NDBTLC8et5LlNE/HMwAGArELawm/lz05EcNyk8MX53Br?=
 =?iso-8859-1?Q?dK8XqPV7cEmDPohdQP1lc/ugbgeFtUWK8US9bpPDp52aDsr3UQWedJKAbY?=
 =?iso-8859-1?Q?XKaRbr6KP54GV3pYk0RT5gOYG+gN3EHmW/kHpH8/TgibI1QGDFF146OWfz?=
 =?iso-8859-1?Q?DpW7MtYVf6I/qs5lAyuKuY/lFVOm0V0vqYmv6fUfaCZ/8gkVSHeDpTZ5JL?=
 =?iso-8859-1?Q?PEZGa9iViM7jtKTBFKOmunyA6o25S94UD4amSp9Ge1+dqbLVpPE/NhQCeq?=
 =?iso-8859-1?Q?EhGTwtnCfurw8UgX6LOIJV0danPlz40Pa/f/ArOQ+swB5EOOU+lw+4egK9?=
 =?iso-8859-1?Q?n20OgMqmYj6dO6eNRtEdrg708LyWmtLITwwWXpqnO4KBw+8qa2npABuO1f?=
 =?iso-8859-1?Q?pf+6BLjV4cj4hYTdKXi/1WO3gkRsCYY0jdKxtNn9N7xyckebWAka2sx2ZX?=
 =?iso-8859-1?Q?7n9HC63X/hMxJYBbe+KRvrmDOcADBC1rhLx4skqR36gVzOWah3MQDXc3rE?=
 =?iso-8859-1?Q?WmV+UBHOa2Z93KFer3Yfy4IT0bV5x8A/XHlVoPmt/bSVyoDkrVBTkojDEN?=
 =?iso-8859-1?Q?z/lDZjl42880PfvwGrDuVWXc0dScDzzi4pBm/iEd+JO0rsyM9MHUj5Bl+i?=
 =?iso-8859-1?Q?lbnl9Q+rxb267qs/z8wfhRPtl2uvtayekx8YO2zhrMbJek205nzwKNyVKs?=
 =?iso-8859-1?Q?bkofkRBagQOse0wOa3AZHv6wmS1WWRjpH+bcWJjezqPFH2ULEvKJcKeCEv?=
 =?iso-8859-1?Q?AaRdRGF4/S+nJZNOl+QttITeEB6t4eqIz1kyyDb2A2+lMaBgQ7vpzcwRfN?=
 =?iso-8859-1?Q?TGgBseKOFLEvAjio2nHf//PXrSNMWmEzTDa0ytYWLDLiIf3OjXRAJ3VCEN?=
 =?iso-8859-1?Q?fgUCuckbTvQglFn7jEcXCVOR5pmAfCeiL1Pbj1gTjQshQrd9O44671IdA/?=
 =?iso-8859-1?Q?X+KhmcYCyyJlCVZOOLwj2iepknVMojmMzSAlVx1tMajAfU?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e454ba37-e391-41dd-a8c4-08de54d3194e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2026 07:44:37.2395
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vIa7ZPcrYP25LGsVzUvbR+iw/2t1Cj9RUZGXTza5Jn1UWYsUr6RrWLjZPbsMp5Kz4mkX7ubTt2LL9a2GsaDgig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8792

[Public]

Hi, Tamas

May I ask a review on this commit?

Many thanks,
Penny Zheng

> -----Original Message-----
> From: Penny, Zheng <penny.zheng@amd.com>
> Sent: Thursday, January 15, 2026 5:29 PM
> To: xen-devel@lists.xenproject.org; Andryuk, Jason <Jason.Andryuk@amd.com=
>
> Cc: Huang, Ray <Ray.Huang@amd.com>; Penny, Zheng
> <penny.zheng@amd.com>; Jan Beulich <jbeulich@suse.com>; Andrew Cooper
> <andrew.cooper3@citrix.com>; Roger Pau Monn=E9 <roger.pau@citrix.com>; Ta=
mas
> K Lengyel <tamas@tklengyel.com>; Alexandru Isaila <aisaila@bitdefender.co=
m>;
> Petre Pircalabu <ppircalabu@bitdefender.com>
> Subject: [PATCH v4 5/6] xen/mem_access: wrap memory access when
> VM_EVENT=3Dn
>
> Feature memory access is based on vm event subsystem, and it could be dis=
abled
> in the future. So a few switch-blocks in do_altp2m_op() need
> vm_event_is_enabled() condition check to pass compilation when ALTP2M=3Dy=
 and
> VM_EVENT=3Dn(, hence MEM_ACCESS=3Dn), like
> HVMOP_altp2m_set_mem_access, etc.
> Function p2m_mem_access_check() still needs stub when VM_EVENT=3Dn to pas=
s
> compilation.
> Although local variable "req_ptr" still remains NULL throughout its lifet=
ime, with the
> change of NULL assignment, we will face runtime undefined error only when
> CONFIG_USBAN is on. So we strengthen the condition check via adding
> vm_event_is_enabled() for the special case.
>
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> ---
> v1 -> v3:
> - a comment next to the excessive condition
> - use vm_event_is_enabled() instead
> - avoid heavy churn by using the inverted condition plus break
> ---
> v3 - v4:
> - refine comment
> ---
>  xen/arch/x86/hvm/hvm.c                | 26 +++++++++++++++++++++++++-
>  xen/arch/x86/include/asm/mem_access.h | 10 ++++++++++
>  2 files changed, 35 insertions(+), 1 deletion(-)
>
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c index
> 07e54890d9..b34cd29629 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -52,6 +52,7 @@
>  #include <asm/i387.h>
>  #include <asm/mc146818rtc.h>
>  #include <asm/mce.h>
> +#include <asm/mem_access.h>
>  #include <asm/monitor.h>
>  #include <asm/msr.h>
>  #include <asm/mtrr.h>
> @@ -2082,7 +2083,12 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigne=
d
> long gla,  #endif
>      }
>
> -    if ( req_ptr )
> +    /*
> +     * req_ptr being constant NULL when !CONFIG_VM_EVENT,
> CONFIG_UBSAN=3Dy
> +     * builds have been observed to still hit undefined-ness at runtime.
> +     * Hence do a seemingly redundant vm_event_is_enabled() check here.
> +     */
> +    if ( req_ptr && vm_event_is_enabled(curr) )
>      {
>          if ( monitor_traps(curr, sync, req_ptr) < 0 )
>              rc =3D 0;
> @@ -4804,6 +4810,12 @@ static int do_altp2m_op(
>          break;
>
>      case HVMOP_altp2m_set_mem_access:
> +        if ( !vm_event_is_enabled(current) )
> +        {
> +            rc =3D -EOPNOTSUPP;
> +            break;
> +        }
> +
>          if ( a.u.mem_access.pad )
>              rc =3D -EINVAL;
>          else
> @@ -4813,6 +4825,12 @@ static int do_altp2m_op(
>          break;
>
>      case HVMOP_altp2m_set_mem_access_multi:
> +        if ( !vm_event_is_enabled(current) )
> +        {
> +            rc =3D -EOPNOTSUPP;
> +            break;
> +        }
> +
>          if ( a.u.set_mem_access_multi.pad ||
>               a.u.set_mem_access_multi.opaque > a.u.set_mem_access_multi.=
nr )
>          {
> @@ -4844,6 +4862,12 @@ static int do_altp2m_op(
>          break;
>
>      case HVMOP_altp2m_get_mem_access:
> +        if ( !vm_event_is_enabled(current) )
> +        {
> +            rc =3D -EOPNOTSUPP;
> +            break;
> +        }
> +
>          if ( a.u.mem_access.pad )
>              rc =3D -EINVAL;
>          else
> diff --git a/xen/arch/x86/include/asm/mem_access.h
> b/xen/arch/x86/include/asm/mem_access.h
> index 257ed33de1..790bed81e8 100644
> --- a/xen/arch/x86/include/asm/mem_access.h
> +++ b/xen/arch/x86/include/asm/mem_access.h
> @@ -14,6 +14,7 @@
>  #ifndef __ASM_X86_MEM_ACCESS_H__
>  #define __ASM_X86_MEM_ACCESS_H__
>
> +#ifdef CONFIG_VM_EVENT
>  /*
>   * Setup vm_event request based on the access (gla is -1ull if not avail=
able).
>   * Handles the rw2rx conversion. Boolean return value indicates if event=
 type @@ -
> 25,6 +26,15 @@  bool p2m_mem_access_check(paddr_t gpa, unsigned long gla,
>                            struct npfec npfec,
>                            struct vm_event_st **req_ptr);
> +#else
> +static inline bool p2m_mem_access_check(paddr_t gpa, unsigned long gla,
> +                                        struct npfec npfec,
> +                                        struct vm_event_st **req_ptr) {
> +    *req_ptr =3D NULL;
> +    return false;
> +}
> +#endif /* CONFIG_VM_EVENT */
>
>  /* Check for emulation and mark vcpu for skipping one instruction
>   * upon rescheduling if required. */
> --
> 2.34.1


