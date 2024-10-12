Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F15799B160
	for <lists+xen-devel@lfdr.de>; Sat, 12 Oct 2024 08:51:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.817501.1231495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szVxF-0005yt-Ur; Sat, 12 Oct 2024 06:50:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 817501.1231495; Sat, 12 Oct 2024 06:50:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szVxF-0005x9-Qz; Sat, 12 Oct 2024 06:50:21 +0000
Received: by outflank-mailman (input) for mailman id 817501;
 Sat, 12 Oct 2024 06:50:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A068=RI=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1szVxE-0005x3-N0
 for xen-devel@lists.xenproject.org; Sat, 12 Oct 2024 06:50:20 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20610.outbound.protection.outlook.com
 [2a01:111:f403:2408::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e15d297-8866-11ef-a0be-8be0dac302b0;
 Sat, 12 Oct 2024 08:50:19 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by CYXPR12MB9443.namprd12.prod.outlook.com (2603:10b6:930:db::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.20; Sat, 12 Oct
 2024 06:50:15 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8048.017; Sat, 12 Oct 2024
 06:50:14 +0000
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
X-Inumbo-ID: 3e15d297-8866-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s0Dat6gOX8REbKCzn9DdhYAYLYK6LfqSk1goePuGNJMuBu9r7O37UIxYRSruxRDumF31GjOPDymF+XpNjl//b55JHjqXNSvK931kZwRF8hA06QqaTc32zQFSwxX9ILoo05vZZznFFfbuTtGRmRnuIQ0ufNu4FtGJMHTqwmZ5HnRkQ5qz7Nwam4801Lr2CfwFneMGCT5o42GKnFtyACRMcMbM6lpXn5SwrZ16ObIt497aQoicuHKihXWQdhGPgchpRlrbuNZDx6LDiy6Mv6BktKtMfhAyRlsEtrZkXzZ2G9WH3OCsmuDIdZxNZdfdU5MLCCIWF1ti6JTh8a9QdOusvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gTh8SS8fwzptYw7MXhoR0ymyla8OilaDJl9vy/dzxDE=;
 b=jpmcw7wn193hKETF528K53ecC4vO0mwn/m5ZgjvDb+eyiHWIYcJ+42IqO5/CPUbocmL52qmTaqg0ah9oeDIC9oh5QCFXhs94jT7SqlYB+BiBLRrzK/pizu3u49gQlW/n7XrSGslTjEXjqxFj6j9MUW39EXBuF+/GGZGllfjEGlybPeOfZeLlmdk7+9kU6oPTd1/kYPZjoxOpj+1f4fH3ST+zCucMVJyYEsfBUHKkZwckSxZnvvlsPx3z9em6oRsZAldTFc05HJ0/XdDixjS3ZdzJkvDtSK+sfafPykYheOwI3xqbMM1WCDSFxcSmqULgYArnz9bS7ZUB+dOJnZ+P8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gTh8SS8fwzptYw7MXhoR0ymyla8OilaDJl9vy/dzxDE=;
 b=Qp9o8a7cNEWsk/lk7qhzsuyA5kURDxSauMVxYcmkXI5Bzas2N5z2pgAq/U0vA0U+L6LkdUZ7hZuKOtG1B5nm0sm0+i5N4soPi8q1sLw5mYUP7ooKfG0QQPu1ADS3G40AsEw4mxKb2O2wWSxETBPV1PSGOdTws7zJ41J6g2RMV5Q=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, =?iso-8859-1?Q?Marek_Marczykowski-G=F3recki?=
	<marmarek@invisiblethingslab.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v3] xen: Remove dependency between pciback and privcmd
Thread-Topic: [PATCH v3] xen: Remove dependency between pciback and privcmd
Thread-Index: AQHbG4+3Lfp3cJlJ4UuqoaLQId+ES7KBdNAAgAF0qICAAAQHAP//sCgAgACWhQA=
Date: Sat, 12 Oct 2024 06:50:14 +0000
Message-ID:
 <BL1PR12MB5849B929E9D01076059C739DE77A2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20241011034227.1278144-1-Jiqian.Chen@amd.com>
 <e6938fd7-2cb8-412f-b3e3-1943eeb271d8@suse.com>
 <BL1PR12MB58499172314E76D9A9278746E77A2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <BL1PR12MB5849C20650902FE3935BEC2AE77A2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <075ce655-e871-4a3d-a550-7363bc4a165f@suse.com>
In-Reply-To: <075ce655-e871-4a3d-a550-7363bc4a165f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8048.017)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|CYXPR12MB9443:EE_
x-ms-office365-filtering-correlation-id: 5e51b349-0e8c-419f-4285-08dcea8a203c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?YsWHwxaP82jIHjY779JfDuJiLbIrKVf0G+q6AI7BZk1zDeQlrp/f8+TBej?=
 =?iso-8859-1?Q?y4Sr2NaVCTxvMqsnYHzcEY2k2WlwOeqrAY37LyYflv5pDsrrfo0xvYor1X?=
 =?iso-8859-1?Q?MAkFli4/dOeakSokLoJowSS9+ZeWDYVxpAP4ELfAK6UKfVN5FxN66+9yJy?=
 =?iso-8859-1?Q?qdnrsOkLagL1xPhHNu59guMQ5n0Rd0r0QyWBk1+5OXWABzWrfb/5gqe2TL?=
 =?iso-8859-1?Q?UfHVHN46f+zzJ5GdPMQ8+sA/B3Y2y1HzAwCnE7sHi5L0QILCEmQIG0Nb9t?=
 =?iso-8859-1?Q?dIs8nghnAR9cIorS6sCq7kzE10lNp3i325Uny6OQeRidteCJlJ4OGEM7+x?=
 =?iso-8859-1?Q?PY1uooXfVR/NNbyzaBMzKVdXy+O+JEh8BdF4btnIFjoLi3FUDjvLIFCewR?=
 =?iso-8859-1?Q?53X2GqjszVdJEljlQEWsLhigLHwN8KBmAIaEYSgdDqRVi2T1Jh03+rnGHN?=
 =?iso-8859-1?Q?eYoe6ycGXuAV67XI3linJpYr6Dm/aPhUUBxCCnGUrJf6gKkuilycaeO5FT?=
 =?iso-8859-1?Q?DcJ7Z9kbjw33anmreTrFp3KXEup32CQCTwBvR1Jx36Nil3ha53aGPSc+JN?=
 =?iso-8859-1?Q?3qAMrlI+oiW2kdg9SEh43tAsLldlhgYg9Ly4TsrVYk5Kc5SAkyu4BbnTLF?=
 =?iso-8859-1?Q?JIzWrEfdqA94OcYDNtSfd4DpxgsS9ztxgGUusRmkFZWjVuiAptvOEUCyP4?=
 =?iso-8859-1?Q?Z7mNCAtzKDZODwCkxfoY62qz3/xkzgic2CgOTBFSdNWQzcNKNzweC8XVBY?=
 =?iso-8859-1?Q?WLYrIwWGiqkt07/2hmA8pAl3jkjLB07inU631mgDXUUHTzhFwENabfnV9Y?=
 =?iso-8859-1?Q?ApghTEnfAOu3mW/A/rZuPFjPgSK8Mk/bVblgtc9W5sqCG/7dMOS4IoNMM6?=
 =?iso-8859-1?Q?Mfrgsz0afOGGO/i5zomtvXGozHtCEN6m/8TlP0ymKQ1G3mLRn5raWvAy8V?=
 =?iso-8859-1?Q?UW1WL9TrvFvCFBMO7Hb4uk4aybmNVT70RlQaNsqNVHBaKjBWanK3gfaUDq?=
 =?iso-8859-1?Q?YDp3dJKKRQbmhWpTsBADDj/pB03w/LPTTYZcmrRaMCfsuraGjSQ6cuOKnB?=
 =?iso-8859-1?Q?2yqnF2LQZBabbJ5B3/dhC28YEGQZk+RMKMx+WVTM/w6+iXsSc9REwVcAbo?=
 =?iso-8859-1?Q?3SDlcVhi68Y4QOK/LCQY1Wo2WiJHEKJMUu0/YQktJA9p2IWYueLiesKSaJ?=
 =?iso-8859-1?Q?rMpkXgdi8GV27dz0HpELVE+8fVoNlNxseP3a5iQGLkeWjkbeYjN2ov4HfQ?=
 =?iso-8859-1?Q?8mtzXCB/4O+JLLnqvHJdtaF0RwWd85xqmtZGVqco4bhnwVV9Gnk+JwQgm9?=
 =?iso-8859-1?Q?EEJISx/7z2KdhxTuOEJTUd1mwC91QgALO43uiTqUVJKKSwfDd0l5jw8F3v?=
 =?iso-8859-1?Q?qNmMi/qwXBopPlQyw3H8KcwBPxM0lgPw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?VX1vupIfhpRYYMjKp5r4Vh5IstaCqM67YSnCDg2mzMIPesoVkOYrohdvve?=
 =?iso-8859-1?Q?lt+N0uveo3635RJsuFrhFcT34n1lfBUkZ5zC846TPAKk8iJKqxshPP2Q/k?=
 =?iso-8859-1?Q?ea1ozZu1Zk4tywUilIjYf/bijmEJ8LiXL4Jj0oJH9o8Ttr/zhE0TkdkULD?=
 =?iso-8859-1?Q?S/cfuElewaAa+beGtwh2fFtU8HXoIjz8DmxDX4jXCNfqxIV/0gQxMhjfrE?=
 =?iso-8859-1?Q?xbkyOL2nkOCH7yPY1MMr/1KcGWo7XWY973oYx9iUz+Y2lc5NOaX8Lr4epE?=
 =?iso-8859-1?Q?/n4xVdjJZv0Lkz3avdIWMiH1NKqsSTM6QHxlENgajaWoa3qma5Js6mL1fm?=
 =?iso-8859-1?Q?JaUyhbwiFEfQUOTMCJRmC3G1pjn4xeIrwcSNq2JQgkQgcHkVmCcw+XpVLC?=
 =?iso-8859-1?Q?3vmec7qjOhycepcVzB9urwg+N4rtr95HoXiph2wqtUyalgJvJKdLnsi6S7?=
 =?iso-8859-1?Q?6OM2d92MWW+k9APBXVRuaHF+6mW044/mIRoFzIqKT6G62YUdsFHkzPUvmZ?=
 =?iso-8859-1?Q?zYfLz95+jQMBjVG7crqec3G+89+dA744+Chpq5qvVPpZxlLaXiJ2a0zVRU?=
 =?iso-8859-1?Q?UZoVqTAcI68BlUe6Iuc80e4W7JaH4DxmQe9UPGs8L6rZUI0vdS/KYB340C?=
 =?iso-8859-1?Q?bK4RTjHwupJJOY0AvymPg2W4cQFaKSnHPz806gN1QHGtZidCcoaUyOc5IO?=
 =?iso-8859-1?Q?ry14IvfI7QkH/ghk5Yc1nvp6Gk/Pa5eqNTVcU/QCy5CJtXJI6LDgzucgcx?=
 =?iso-8859-1?Q?3dJjEbcnNXYz2zG8FYo26yvWNVaZ7n5/SGZjL8EJ1yiezHQWPU+HyYKbUe?=
 =?iso-8859-1?Q?rxrl5OPEClRp1dxIzQsa53M780EkFEK3b42sahypIh1SPuj0QJEQDEcxBy?=
 =?iso-8859-1?Q?d7xeMV2Q4+9XiwTFS6yA0isecA11apVOqr2u49rzcRbCuvjybPvmslVedb?=
 =?iso-8859-1?Q?x/LN/k/V0k8jBV4sM2CC/sSB8Qus+Tzl5oDNVORHud+dYuRyNjQOU0IQAu?=
 =?iso-8859-1?Q?KiI+8PVba+GbbsvxAmT4VwI/hoKjk+3+7KWaCpyze62ufJDCaBvvpgp2rI?=
 =?iso-8859-1?Q?JVFUDtkmaQsl4CQzX15ryoa7PkHMZHZhi4bT7FglVNOxFjjAOhwHnz46yv?=
 =?iso-8859-1?Q?PPl82X8OfzDI7MqQhw7IKOca2k99cBQmmpoysluuCF02sZbdFSbVLKfbbK?=
 =?iso-8859-1?Q?Yxu26YBGl5u1JdCzApjDZCxZxa1FFppi14MIxj9mfc6TUpVb3A4uwoLQzw?=
 =?iso-8859-1?Q?WP1/N36vmWDiSrsPEpjF8YEQ2k12ZPHl7H/FHgVbrJsrAvOy6WYHicVQkd?=
 =?iso-8859-1?Q?BpN6HGFW32JgkpYvm8tw6qQ3Kc00aHaOGWkBahcEpiuP3zHd8t8sWEGuyc?=
 =?iso-8859-1?Q?FgJijXz4pP9Yi5PY6Xc9dr1ELQd9gJernfhchMU0lQr8pkbfCktD+AWxGp?=
 =?iso-8859-1?Q?fbkHShjpw2dhNe+xuD59nUZ2laokWXpfYyDQT9/hpGCs4b0YLC5smXqzB7?=
 =?iso-8859-1?Q?bG4mF4Sg7XTiFTavp+STcHiDDyL5aWhf55lrAdyEAerQihQ8qNZZg4s8m2?=
 =?iso-8859-1?Q?7yj5LQIeHUKttU/frZ59C04YerkRVfLZSdgvLE0AniZPTfp+Tuvb5j/Yko?=
 =?iso-8859-1?Q?+Q9tZAzrv+Dqs=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <F3F3C7E2CCE3BB44BC405472FE8BE796@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e51b349-0e8c-419f-4285-08dcea8a203c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2024 06:50:14.6936
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WQ2x5NC4Om4+S4ACwOwzuliIPmFx56XKU4fvD7CrfDIaVsQER8Shp78QMVRXjiADWwWHBIRVt529cu8yLdK0Kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9443

On 2024/10/12 13:48, J=FCrgen Gro=DF wrote:
> On 12.10.24 04:36, Chen, Jiqian wrote:
>> On 2024/10/12 10:22, Chen, Jiqian wrote:
>>> On 2024/10/11 20:06, Juergen Gross wrote:
>>>> On 11.10.24 05:42, Jiqian Chen wrote:
>>>>> Commit 2fae6bb7be32 ("xen/privcmd: Add new syscall to get gsi from de=
v")
>>>>> adds a weak reverse dependency to the config XEN_PRIVCMD definition, =
that
>>>>> dependency causes xen-privcmd can't be loaded on domU, because depend=
ent
>>>>> xen-pciback isn't always be loaded successfully on domU.
>>>>>
>>>>> To solve above problem, remove that dependency, and do not call
>>>>> pcistub_get_gsi_from_sbdf() directly, instead add a hook in
>>>>> drivers/xen/apci.c, xen-pciback register the real call function, then=
 in
>>>>> privcmd_ioctl_pcidev_get_gsi call that hook.
>>>>>
>>>>> Fixes: 2fae6bb7be32 ("xen/privcmd: Add new syscall to get gsi from de=
v")
>>>>> Reported-by: Marek Marczykowski-G=F3recki <marmarek@invisiblethingsla=
b.com>
>>>>> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
>>>>
>>>> Unfortunately I'm seeing a build breakage for the 32-bit x86 build.
>> Could you please attach the link or steps?
>> Then I can reproduce it, and validate it locally with new changes.
>=20
> I'm using the attached kernel config.
Thanks, I can reproduce the 32-bit build error locally.
And this "Add stubs for xen_acpi_register_get_gsi_func and xen_acpi_get_gsi=
_from_sbdf when "!CONFIG_XEN_DOM0" in acpi.h, like the other functions in t=
hat file do." can fix it.
Is it okay?

>=20
>=20
> Juergen
>=20

--=20
Best regards,
Jiqian Chen.

