Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BADAD2D5E3
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jan 2026 08:42:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1206252.1519920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgeTI-0006ON-JC; Fri, 16 Jan 2026 07:42:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1206252.1519920; Fri, 16 Jan 2026 07:42:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgeTI-0006Lo-Et; Fri, 16 Jan 2026 07:42:16 +0000
Received: by outflank-mailman (input) for mailman id 1206252;
 Fri, 16 Jan 2026 07:42:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XdZn=7V=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vgeTG-0006Ld-KC
 for xen-devel@lists.xenproject.org; Fri, 16 Jan 2026 07:42:14 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de429829-f2ae-11f0-b15e-2bf370ae4941;
 Fri, 16 Jan 2026 08:42:12 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 SN7PR12MB8792.namprd12.prod.outlook.com (2603:10b6:806:341::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 07:42:08 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2%2]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 07:42:08 +0000
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
X-Inumbo-ID: de429829-f2ae-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RK0JkdYpqEZJAGfTO+TI18Up7XKX2DmTOaYtZ913XIGm2bwC7+gUFeTPbz/K//T9AWSkUjz7lumAr3OmJAPSWl4xkcX7X1NK6PH1RKN+CjbOpkAhd9NmL3qA85N37GGgvxE8M01l95rUzrwuyyqn+xD32TEWuQoh5xTM9aDFK22S/odGAYe8hcLCT60RP/LDyp/rGsrLWDHQ/zHUcejCknuWGgbbZ9zQ7dxAeHMxILmAi1nTlU5PHb4rfzCfMcBIwwCapmd19MRGRUAC6OhPeCIBx+OVBwNrTnHuLMYpWEOv5d9h8tNI7Dkq/Y7m2F9ggk66u+b5Y6M1SnZe05m5Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eJS348ba2ktTQRfLWuR45oJBcnYOw/S44GCld14Abts=;
 b=HYGUWCgg/NzwuZ1IUU+6QtfXrZz2tMvr8dNpUrB4CqyiBjfuHuJqrtG0Z5mrFTIw8pYS+AWGy8D+SNJL+smXFFGr98/TZAW+SX1HWF+FN5YH9bEN2fe8ytO+HwRhwdYnkvlhw7OtkpCmJPtjVE/0R6aeenKO1IJqbf0SeqPwmPqmpvWWnW686U3wxDDxNFcdNIjoh9hUs+/fZcjZsujGpJHNHTwMGgdWFwgRT0qCd3jdLSGvptdXw/N1uFQhKQ7CWc7ce7hkIpQVw+OFaM7xsG1k9vwsvG4rw3Pu8enhWZdnAY30V40heB7n3Xj6RFnHzOHAiIeFuo5KFVIYUzDRGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eJS348ba2ktTQRfLWuR45oJBcnYOw/S44GCld14Abts=;
 b=kVABG1kKyV4K0BnO861TmOMBBaqWVYY3gImFw1jK30RZ6O3spZ85pWdED72aelLPJKnWrnHm1XLFhAo9/WVoVLcNrvNVCGiAHSRuc2ZjDS8h4cIHhw6MfsV6i3EYqJuwExiSBnm87jjIOfza8dZ8uXxZuZvnlsCyFk3WJlje2q8=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Tamas K
 Lengyel <tamas@tklengyel.com>
Subject: RE: [PATCH v4 6/6] xen/vm_event: consolidate CONFIG_VM_EVENT
Thread-Topic: [PATCH v4 6/6] xen/vm_event: consolidate CONFIG_VM_EVENT
Thread-Index: AQHchgF0sy5e5KAUF0uytoTLl3dvgbVUar7Q
Date: Fri, 16 Jan 2026 07:42:08 +0000
Message-ID:
 <DM4PR12MB8451102EC502E61DD089DDAAE18DA@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20260115092841.2651224-1-Penny.Zheng@amd.com>
 <20260115092841.2651224-7-Penny.Zheng@amd.com>
In-Reply-To: <20260115092841.2651224-7-Penny.Zheng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2026-01-16T07:41:52.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|SN7PR12MB8792:EE_
x-ms-office365-filtering-correlation-id: ffcc1843-51a4-4695-301b-08de54d2c0ca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|7053199007;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Iq0VzKcz6sWaUA6FNxLa8dsuMaAn+z05NtN5croowjPHGnO9TN/6dhhd5M?=
 =?iso-8859-1?Q?dL/mE84fJ3sYPP7HST26aN3FN+BjA6TuqYYxixi3yZOxfIwjDh3qpEkPXo?=
 =?iso-8859-1?Q?UnDQsC+t/URkQE2GMuZhXh1ZhbpsCzI/mULqb2vE7mCzUGNlpnD/1UrITf?=
 =?iso-8859-1?Q?kmhGCoZ1BIgsgMBmNOxK9flDZwGImr8BhfQxaRmhkIrBnvuDrLrFXBXTTi?=
 =?iso-8859-1?Q?13qd+Knbj/ltBDzT5RlvdC01cPwW0AFFz/PLQWMeL2HYosiopJbW/QJYfL?=
 =?iso-8859-1?Q?4anKk5+mrovwy6Lc8R2L+TZk5D8uEYpoj5VTsWJk6NmHkp4yex6TMcWB/1?=
 =?iso-8859-1?Q?j0AXLmhFl8lLNbbL5TUoovBxf2KQ2CQyBAnaSa4r+hHy9t31vShSNjso82?=
 =?iso-8859-1?Q?Sp0pS6eopqWMbYj/6bV9bLU8BbCM15Q8K0nKO7TMtvIe9ckKo+7PHmu8HV?=
 =?iso-8859-1?Q?eZKZnm4/mDTDHeKTvDPPKWvXeEfCHBFkgEu2DP9YQPvRz+jTojEtBAZQTc?=
 =?iso-8859-1?Q?qhzyT080zHifwD75x/tEw2g1iWdT7d9FH+USMgWxLmdbt8dNlAbeiQX272?=
 =?iso-8859-1?Q?l+cHhAY+8m9uWv+8cgBwoD+vlYvOUNmQtVIwXDv4yCLnniFwW8WswFPdLd?=
 =?iso-8859-1?Q?OrvrCaWrLu2pg4sqN5wdT3E1bm7QIFRxvBIkLB4ZkwRZ9TYRmBp4cgnnbI?=
 =?iso-8859-1?Q?lsyGg9qWK9+sOB2/wnkpf5ujYOZ6eQZm6FV27WZJ7EDlFsq4UCDz9uXPcS?=
 =?iso-8859-1?Q?Ffisr2yBEwKXR7sreM1mr1xDaoS+hWtdt4cWKZVJlhehELB3spLS/ITQAw?=
 =?iso-8859-1?Q?eq8B2c/v51TOyVgz4x8+fctbTXcIpNVa+bwMf47eoNbvoqrh54lierNwWV?=
 =?iso-8859-1?Q?ISnJhBGPzjN3+MV7G8DwbZc1JFH3wv3PRTbQPz3jRMy1OJq5MaNNKlzTaI?=
 =?iso-8859-1?Q?e6/sF8a7j/m2Rop9hqro/YOpF37pwn+M72KKo8Wd3izkLs+vw1NDw9yGDK?=
 =?iso-8859-1?Q?1ORDuN/z9QQkfMQ6CGZ/TtSz6R5o703apGgZjkSvSTOoPrAZQTTg0o5T4N?=
 =?iso-8859-1?Q?OTvll59mAfoei4pEUNRm8RpmLSLYrJ8XHjdl8HVbQ/KzwPfHM+Te85/e4+?=
 =?iso-8859-1?Q?GqCotmgmUPbbzu8M6eTY1opCg+D1FRMuI4KXs3H9YULt3ybEZdWDpe1eiE?=
 =?iso-8859-1?Q?oj7txSeDIgemaRManob4/tQ25+f5ttz/ZSy4QcaGVwNjwVOTlHCCaxAPKT?=
 =?iso-8859-1?Q?GG6/4zIOlJOEFMbGFCLA57Xv6Zt/Z2E2Kl41D73rR387VX0Ech4IyhnBKH?=
 =?iso-8859-1?Q?0Tb4kvRW3CieNsa78hbJnhd83wTHsv0DCKPjuwkGH03bzokgG6tD3bxf+I?=
 =?iso-8859-1?Q?nThZEWTKdMDuko1t7eZWNyV5j6nxg9lJEpQuUukrd6EuvqVE7BqW7lPJ5y?=
 =?iso-8859-1?Q?HhfaPSgC2Y7EcLTvFO6ESp87UA7eKQvqOhCT6IRaXIxaCS1pFSsuRxSjsZ?=
 =?iso-8859-1?Q?vogYF6gkDgtXprqVGTbogvdoSfnQ16tP7HShnmTB6AsSjI+APm0Zvb9Kxl?=
 =?iso-8859-1?Q?YMhjQFhWsV7ewoxwi98hkyGOZS33Nme9lbEYgXwFUJpCv92k2Hf6y0AVv/?=
 =?iso-8859-1?Q?EAVcTgqSMk4+WfojNxk2vkYdlblHvoDQQo7bjjY75sMN8Su2l/U/7EW2fj?=
 =?iso-8859-1?Q?tDyarDmc72srp4ptrkU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?a0pzoduSzCKUldN71csWkIOhxtavtRioOLyVzMtG8QTnshbOohnOvgtAMA?=
 =?iso-8859-1?Q?6v3KClIA3p6ZRArHQ2X6r+nHYR8+M1czqyGGdDp08E0UCeituG2xJ1PggX?=
 =?iso-8859-1?Q?f72UmWOvtvaiszULxoSu4oFiCW4MquJx8mPx5kB7gvq3k0Bk5nAN8vZEbt?=
 =?iso-8859-1?Q?lSo6FTcGUlP+NL4NaPV0g4IjmfhNte9aK59r2T4ceo/W7bBX8SDvxypOB1?=
 =?iso-8859-1?Q?ukCWDlTG/aqSneJtLHYGMnRDB0kfvlLvQj7OiOiXKZ6xZgdsxPyoCqOpzU?=
 =?iso-8859-1?Q?DmrS+3mZXxcB7qPr2h28x/ZbBFyaiyVgF2K/IRkzWyy2yoPULBUvDSIstJ?=
 =?iso-8859-1?Q?P4Hm2lMVDF4bTdL0cxbAln9/jsxKgNK9zEKvEsN3IWRsjY6Gr3R+DDssJr?=
 =?iso-8859-1?Q?EYrjgI+IYnUWPfQlqT2jwxfNtqOVzPjXL2MnYC6Gplu1F4oIGOuHluaQvv?=
 =?iso-8859-1?Q?yO2vExdY7cO3LU1g1M+2ruBz2eTcrLuNOt9C0CXVh1WSt3WrmZgpfEPszt?=
 =?iso-8859-1?Q?5DBORPmdeoOWduRx3Rq8BAxp84SwvuZHZjmXnPBzpFZZBnOWyJJsSc3ghy?=
 =?iso-8859-1?Q?ZIBoL6YKkfLw62K2hygQPPgvSc1kz0AgOHpDxtQ4ue3Cc+5Hn+em8qSHKR?=
 =?iso-8859-1?Q?ylZzpi6Ji5JrRoeU35gr94mPEpRxnnEz2n+a4iK+4qdXooNOR2NVlEnG5t?=
 =?iso-8859-1?Q?iOoRlMayaIiMstek9QO9gTDjAvQZCjgILmsj16ew3pSCn4FT7Kn87hKsj/?=
 =?iso-8859-1?Q?Gh7mbCbVTCbBwlknZXQDMPMNlQAzeoqVDK/d1RiQjdwBYcT321v+r4ULaa?=
 =?iso-8859-1?Q?RnRYUrXJEZqq992not2V67Z3Hm/tdlMI7F+XXzwQkBW6t6OjD3fdfiNtT0?=
 =?iso-8859-1?Q?9aU1oaWqXDZA5lg85I9NVfh6Zn6FXgwzaPOb5XP4hk3DbJj+F5Lr0DCfks?=
 =?iso-8859-1?Q?LRYaJrTDk7UbXKrKXA274RZB3Dq8xG6TxV+Sz1pmoB6m7PegSIHT71Q/fv?=
 =?iso-8859-1?Q?wkZI/XKtcN8tcNpGtJwppMHXv3mBIXcyUCk2re8Fk5R/HWVIVJ3+hqQ20l?=
 =?iso-8859-1?Q?Rkj81gdA7VTMkVw9sJe6d8YdrajqyT21G5eBxNZGe6rp2lTwMMXS52GKSU?=
 =?iso-8859-1?Q?i8Zt3DEKddo7YAdV0UjYAA/Aylkykix8rrqFunze0DEtVbHR5gMjxwYk4R?=
 =?iso-8859-1?Q?sysr8O5pi1RC+COP500So76C4ULxdbDpgoIQo3zVay2dEkuoXi/arSXL7C?=
 =?iso-8859-1?Q?YxmxyHMdtEHcy/LTtWTLA3eQCzF9ctXlwCCLv+wLUAEf9OKVGxfe2C8b8P?=
 =?iso-8859-1?Q?jNJ/EIRIm51DigHva/1s1KGZCHcoawk564AgRVajA3Xaqm95U1kADcvmCb?=
 =?iso-8859-1?Q?0qMpSJ9EOheGix2GT0fsVQnt6l7qGP06u8OTnDZN5ZSbP6S8NnMI1wfb+p?=
 =?iso-8859-1?Q?1GHtd/1Nd0wlFz6H1wqjQLXoHntoxe+Vr84+qOEA5kkoGa+d/ZrCdq4K5S?=
 =?iso-8859-1?Q?14onvDI/h5rnzgLFzd03YmsdU5Cp1RPvG7lteRwMqGTkU0bGyVROjeNZvW?=
 =?iso-8859-1?Q?XfYzRr2FEXZYHll6KM8VoxRv0Ww3Njbn3nkwcMCcq0BQh+o8qZ+WCrhuqi?=
 =?iso-8859-1?Q?Y9LCN3jJLHXLcjqssD5qB9N2SDFH9OaKMDJ4G0s9kB34tMii2DntPBZY1H?=
 =?iso-8859-1?Q?/lRYn3+FXJJgJQ1KNyeXnC52MeCeshm2OaL0zKrSEGuOp9/eo6IkQrj7ww?=
 =?iso-8859-1?Q?8bZmqUBb27YptewXmk7qs2QPGHmAQSS/GgQ8JYM2ZHPpMS?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffcc1843-51a4-4695-301b-08de54d2c0ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2026 07:42:08.6967
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0NvxEyi5zHBshaAOAXWXAbBQSCryLobHMOsdgUUfwoShfHReyt7zEFbCpunvxeOaaK/mieyedevBP9fZcMnzng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8792

[Public]

Hi, Tamas,

May I ask a review on this commit?

Many thanks
Penny Zheng

> -----Original Message-----
> From: Penny, Zheng <penny.zheng@amd.com>
> Sent: Thursday, January 15, 2026 5:29 PM
> To: xen-devel@lists.xenproject.org; Andryuk, Jason <Jason.Andryuk@amd.com=
>
> Cc: Huang, Ray <Ray.Huang@amd.com>; Penny, Zheng
> <penny.zheng@amd.com>; Jan Beulich <jbeulich@suse.com>; Andrew Cooper
> <andrew.cooper3@citrix.com>; Roger Pau Monn=E9 <roger.pau@citrix.com>;
> Anthony PERARD <anthony.perard@vates.tech>; Orzel, Michal
> <Michal.Orzel@amd.com>; Julien Grall <julien@xen.org>; Stefano Stabellini
> <sstabellini@kernel.org>; Tamas K Lengyel <tamas@tklengyel.com>; Alexandr=
u
> Isaila <aisaila@bitdefender.com>; Petre Pircalabu <ppircalabu@bitdefender=
.com>
> Subject: [PATCH v4 6/6] xen/vm_event: consolidate CONFIG_VM_EVENT
>
> File hvm/vm_event.c and x86/vm_event.c are the extend to vm_event handlin=
g
> routines, and its compilation shall be guarded by CONFIG_VM_EVENT too.
>
> Although CONFIG_VM_EVENT is right now forcibly enabled on x86 via
> MEM_ACCESS_ALWAYS_ON, we could disable it through disabling
> CONFIG_MGMT_HYPERCALLS later. So we remove
> MEM_ACCESS_ALWAYS_ON and make VM_EVENT=3Dy on default only on x86 to
> retain the same.
>
> The following functions are developed on the basis of vm event framework,=
 or only
> invoked by vm_event.c, so they all shall be wrapped with CONFIG_VM_EVENT
> (otherwise they will become unreachable and violate Misra rule 2.1 when
> VM_EVENT=3Dn):
> - hvm_toggle_singlestep
> - hvm_fast_singlestep
> - hvm_emulate_one_vm_event
>     -
> hvmemul_write{,cmpxchg,rep_ins,rep_outs,rep_movs,rep_stos,read_io,write_i=
o}_dis
> card
> And Function vm_event_check_ring() needs stub to pass compilation when
> VM_EVENT=3Dn.
>
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> As the last commit, plz be commited either in the last, or shall be commi=
ted
> together with prereq commit 8d708e98ad, 8b4147009f, dbfccb5918, ae931f63a=
0,
> 37ec0e2b75.
> ---
>  xen/arch/x86/Makefile      |  2 +-
>  xen/arch/x86/hvm/Kconfig   |  1 -
>  xen/arch/x86/hvm/Makefile  |  2 +-
>  xen/arch/x86/hvm/emulate.c | 58 ++++++++++++++++++++------------------
>  xen/arch/x86/hvm/hvm.c     |  2 ++
>  xen/common/Kconfig         |  7 ++---
>  xen/include/xen/vm_event.h |  7 +++++
>  7 files changed, 44 insertions(+), 35 deletions(-)
>
> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile index
> d8b41cec16..5bf3578983 100644
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -69,7 +69,7 @@ obj-$(CONFIG_INTEL) +=3D tsx.o  obj-y +=3D x86_emulate.=
o
>  obj-$(CONFIG_TBOOT) +=3D tboot.o
>  obj-y +=3D hpet.o
> -obj-y +=3D vm_event.o
> +obj-$(CONFIG_VM_EVENT) +=3D vm_event.o
>  obj-y +=3D xstate.o
>
>  ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
> diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig index
> c1a131d185..25eb3e374f 100644
> --- a/xen/arch/x86/hvm/Kconfig
> +++ b/xen/arch/x86/hvm/Kconfig
> @@ -4,7 +4,6 @@ menuconfig HVM
>       default !PV_SHIM
>       select COMPAT
>       select IOREQ_SERVER
> -     select MEM_ACCESS_ALWAYS_ON
>       help
>         Interfaces to support HVM domains.  HVM domains require hardware
>         virtualisation extensions (e.g. Intel VT-x, AMD SVM), but can boo=
t diff --git
> a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile index
> ee4b45a4ee..f34fb03934 100644
> --- a/xen/arch/x86/hvm/Makefile
> +++ b/xen/arch/x86/hvm/Makefile
> @@ -26,7 +26,7 @@ obj-y +=3D save.o
>  obj-y +=3D stdvga.o
>  obj-y +=3D vioapic.o
>  obj-y +=3D vlapic.o
> -obj-y +=3D vm_event.o
> +obj-$(CONFIG_VM_EVENT) +=3D vm_event.o
>  obj-y +=3D vmsi.o
>  obj-y +=3D vpic.o
>  obj-y +=3D vpt.o
> diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c inde=
x
> fe75b0516d..d56ef02baf 100644
> --- a/xen/arch/x86/hvm/emulate.c
> +++ b/xen/arch/x86/hvm/emulate.c
> @@ -1615,6 +1615,7 @@ static int cf_check hvmemul_blk(
>      return rc;
>  }
>
> +#ifdef CONFIG_VM_EVENT
>  static int cf_check hvmemul_write_discard(
>      enum x86_segment seg,
>      unsigned long offset,
> @@ -1717,6 +1718,7 @@ static int cf_check hvmemul_cache_op_discard(  {
>      return X86EMUL_OKAY;
>  }
> +#endif /* CONFIG_VM_EVENT */
>
>  static int cf_check hvmemul_cmpxchg(
>      enum x86_segment seg,
> @@ -2750,33 +2752,6 @@ static const struct x86_emulate_ops hvm_emulate_op=
s
> =3D {
>      .vmfunc        =3D hvmemul_vmfunc,
>  };
>
> -static const struct x86_emulate_ops hvm_emulate_ops_no_write =3D {
> -    .read          =3D hvmemul_read,
> -    .insn_fetch    =3D hvmemul_insn_fetch,
> -    .write         =3D hvmemul_write_discard,
> -    .cmpxchg       =3D hvmemul_cmpxchg_discard,
> -    .rep_ins       =3D hvmemul_rep_ins_discard,
> -    .rep_outs      =3D hvmemul_rep_outs_discard,
> -    .rep_movs      =3D hvmemul_rep_movs_discard,
> -    .rep_stos      =3D hvmemul_rep_stos_discard,
> -    .read_segment  =3D hvmemul_read_segment,
> -    .write_segment =3D hvmemul_write_segment,
> -    .read_io       =3D hvmemul_read_io_discard,
> -    .write_io      =3D hvmemul_write_io_discard,
> -    .read_cr       =3D hvmemul_read_cr,
> -    .write_cr      =3D hvmemul_write_cr,
> -    .read_xcr      =3D hvmemul_read_xcr,
> -    .write_xcr     =3D hvmemul_write_xcr,
> -    .read_msr      =3D hvmemul_read_msr,
> -    .write_msr     =3D hvmemul_write_msr_discard,
> -    .cache_op      =3D hvmemul_cache_op_discard,
> -    .tlb_op        =3D hvmemul_tlb_op,
> -    .cpuid         =3D x86emul_cpuid,
> -    .get_fpu       =3D hvmemul_get_fpu,
> -    .put_fpu       =3D hvmemul_put_fpu,
> -    .vmfunc        =3D hvmemul_vmfunc,
> -};
> -
>  /*
>   * Note that passing VIO_no_completion into this function serves as kind
>   * of (but not fully) an "auto select completion" indicator.  When there=
's @@ -
> 2887,6 +2862,34 @@ int hvm_emulate_one(
>      return _hvm_emulate_one(hvmemul_ctxt, &hvm_emulate_ops, completion);=
  }
>
> +#ifdef CONFIG_VM_EVENT
> +static const struct x86_emulate_ops hvm_emulate_ops_no_write =3D {
> +    .read          =3D hvmemul_read,
> +    .insn_fetch    =3D hvmemul_insn_fetch,
> +    .write         =3D hvmemul_write_discard,
> +    .cmpxchg       =3D hvmemul_cmpxchg_discard,
> +    .rep_ins       =3D hvmemul_rep_ins_discard,
> +    .rep_outs      =3D hvmemul_rep_outs_discard,
> +    .rep_movs      =3D hvmemul_rep_movs_discard,
> +    .rep_stos      =3D hvmemul_rep_stos_discard,
> +    .read_segment  =3D hvmemul_read_segment,
> +    .write_segment =3D hvmemul_write_segment,
> +    .read_io       =3D hvmemul_read_io_discard,
> +    .write_io      =3D hvmemul_write_io_discard,
> +    .read_cr       =3D hvmemul_read_cr,
> +    .write_cr      =3D hvmemul_write_cr,
> +    .read_xcr      =3D hvmemul_read_xcr,
> +    .write_xcr     =3D hvmemul_write_xcr,
> +    .read_msr      =3D hvmemul_read_msr,
> +    .write_msr     =3D hvmemul_write_msr_discard,
> +    .cache_op      =3D hvmemul_cache_op_discard,
> +    .tlb_op        =3D hvmemul_tlb_op,
> +    .cpuid         =3D x86emul_cpuid,
> +    .get_fpu       =3D hvmemul_get_fpu,
> +    .put_fpu       =3D hvmemul_put_fpu,
> +    .vmfunc        =3D hvmemul_vmfunc,
> +};
> +
>  void hvm_emulate_one_vm_event(enum emul_kind kind, unsigned int trapnr,
>      unsigned int errcode)
>  {
> @@ -2949,6 +2952,7 @@ void hvm_emulate_one_vm_event(enum emul_kind
> kind, unsigned int trapnr,
>
>      hvm_emulate_writeback(&ctx);
>  }
> +#endif /* CONFIG_VM_EVENT */
>
>  void hvm_emulate_init_once(
>      struct hvm_emulate_ctxt *hvmemul_ctxt, diff --git a/xen/arch/x86/hvm=
/hvm.c
> b/xen/arch/x86/hvm/hvm.c index b34cd29629..4d37a93c57 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -5250,6 +5250,7 @@ int hvm_debug_op(struct vcpu *v, int32_t op)
>      return rc;
>  }
>
> +#ifdef CONFIG_VM_EVENT
>  void hvm_toggle_singlestep(struct vcpu *v)  {
>      ASSERT(atomic_read(&v->pause_count));
> @@ -5276,6 +5277,7 @@ void hvm_fast_singlestep(struct vcpu *v, uint16_t
> p2midx)
>      v->arch.hvm.fast_single_step.p2midx =3D p2midx;  }  #endif
> +#endif /* CONFIG_VM_EVENT */
>
>  /*
>   * Segment caches in VMCB/VMCS are inconsistent about which bits are che=
cked,
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig index
> 38320b248a..d7e79e752a 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -173,13 +173,10 @@ config HAS_VMAP
>  config LIBFDT
>       bool
>
> -config MEM_ACCESS_ALWAYS_ON
> -     bool
> -
>  config VM_EVENT
> -     def_bool MEM_ACCESS_ALWAYS_ON
> -     prompt "Memory Access and VM events" if !MEM_ACCESS_ALWAYS_ON
> +     bool "Memory Access and VM events"
>       depends on HVM
> +     default X86
>       help
>
>         Framework to configure memory access types for guests and receive=
 diff --
> git a/xen/include/xen/vm_event.h b/xen/include/xen/vm_event.h index
> 27d0c74216..1b76ce632e 100644
> --- a/xen/include/xen/vm_event.h
> +++ b/xen/include/xen/vm_event.h
> @@ -51,7 +51,14 @@ struct vm_event_domain  };
>
>  /* Returns whether a ring has been set up */
> +#ifdef CONFIG_VM_EVENT
>  bool vm_event_check_ring(struct vm_event_domain *ved);
> +#else
> +static inline bool vm_event_check_ring(struct vm_event_domain *ved) {
> +    return false;
> +}
> +#endif /* CONFIG_VM_EVENT */
>
>  /* Returns 0 on success, -ENOSYS if there is no ring, -EBUSY if there is=
 no
>   * available space and the caller is a foreign domain. If the guest itse=
lf
> --
> 2.34.1


