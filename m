Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EC7B1C3CD
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 11:50:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071503.1434942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujamK-0008VN-9P; Wed, 06 Aug 2025 09:49:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071503.1434942; Wed, 06 Aug 2025 09:49:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujamK-0008Sg-5m; Wed, 06 Aug 2025 09:49:48 +0000
Received: by outflank-mailman (input) for mailman id 1071503;
 Wed, 06 Aug 2025 09:49:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i5Mu=2S=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1ujamI-0008SI-IB
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 09:49:46 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae5ff1fd-72aa-11f0-b898-0df219b8e170;
 Wed, 06 Aug 2025 11:49:44 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DB9PR03MB8421.eurprd03.prod.outlook.com (2603:10a6:10:398::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Wed, 6 Aug
 2025 09:49:41 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8989.018; Wed, 6 Aug 2025
 09:49:41 +0000
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
X-Inumbo-ID: ae5ff1fd-72aa-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vK8B5R1/5GnP4xTXvenuvpjbYutMwKhV20zD5aFl1tytDOiB1aTOsX+7MkX1O5O+Y+F/g2jQ5YBKRX/ta/wdiJ/x1HQJDq+p7kE7dG/suY3U1byCPyiZZs1kIba1D5LGw8PKlX3Kk9MBBtrGRs0bIx6jqVg598Q5bksVO70RbazrLAPrpwfUMnMLLB0IrbxVBhRg+0H+1EIoppz32regHAPcryBGEsid4jGuP1NCqNJRz06H3Pv7IbOCQuQ8AuV3kOhfZ2yNPoJ4d9ul5ypYalNpa4fr+q4IkRwPXLBTL7vKFK7AcZ0zI6HUNjWqRYkVNEWI9mnuyqKLfrBNRL7Pyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x/DkJcmUnfCRX1pRLKDV40YvkBUE0LdwizOENRxNnwU=;
 b=UIIC4b/sP7Szte6LnTbbdHzqK826bVVl4gIY3TbnyywyBsRBQ7pRN6MrcJxIpvBzz5djYTWxY2JX+pV369ESLy6jppyjFCIfJLTMoMKJTUho35HRgfRbHCPU0nYsetF2lODkPKVDi3BRxZ8O0CHg04IiTjnNxV6s2F4Uw2SqPLaDSs5xpz5DSdCxoIRjnJ7S6BT+sTKgGAkYjcvP6jybC8XVEDsWzkeYgAN+hY4udWdJMqx5dPRanAwr8FLP9gMox0fM7Cg6lIBNj+iGhVRJw+qmKSz/4/8c9u8JXrL4H05LQX+maBr7eEzATzNKd4W0zyTLObBV5uzHZLORwzug/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x/DkJcmUnfCRX1pRLKDV40YvkBUE0LdwizOENRxNnwU=;
 b=d7rxVNmpfukO81DDK+1wrUJVF+pIabhJdT7SI+thnzcsxpfJWqNlFu33MRYH08c3kABpXBtb/x+YDLMzWrQvKb7LlKgCKUt78c6cbz3obfLB8e3WXtHJFFE51WpXrPL7XNvISByJ+kN7pfYGVu/VAyAR+BiLzyyr2HJPH+cehnMSaOHArW75kH24uxmTp9Je1QaSoyZ86NUKGgEPO3NadX1IUIF+IT73Iu43/0nAUhMFqCHoSQuTGUzOhAdgm4XVLJWItWloGe+nZknM/tUKc1dsqQ/4dyNVaw97IX59FhntjmmORNI1OTn7NxkIyigjSmPwb4O3PX8n02qtYIqWHg==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: [PATCH v2 0/4] xen/arm64: allow to make aarch32 support optional
Thread-Topic: [PATCH v2 0/4] xen/arm64: allow to make aarch32 support optional
Thread-Index: AQHcBrdu96cBfWFQe0S15iKWA0R9bg==
Date: Wed, 6 Aug 2025 09:49:41 +0000
Message-ID: <20250806094929.293658-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|DB9PR03MB8421:EE_
x-ms-office365-filtering-correlation-id: ae3fde9e-f313-43b8-e666-08ddd4ce90d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?wEt/tj3G3XlT/kHWH4cUabq0Ggp5zu/5UHFVUuqYwGZ6t6wTMQ4wokqnMY?=
 =?iso-8859-1?Q?tRwyfUTXokT733pU3VR7DIcSvlg6CvpW8c9qMJi6jZkYdEXzwJwLo/dCRX?=
 =?iso-8859-1?Q?my1l13Oyv1kkYj0Mvklf4o1+CKDDcCyb+7p6WawD1PwE6k9erQF2a6k5uo?=
 =?iso-8859-1?Q?ccbPetMhpURcBotCHg845rg9sLB76SAFTlhYh6cYWdNDSx92UBJq40voMF?=
 =?iso-8859-1?Q?f6Da91YzgIRStj4mOzo0tSzH9fjMGbtJGchBMDLpFttYtKMfIrXHV/UR4k?=
 =?iso-8859-1?Q?F/XjmhCsTP4GoQnVaAWGJaBUTZHwmYi5+Tn74nIs14OBucwC7Q3GdnP/Qj?=
 =?iso-8859-1?Q?IUrA2KiTDE37TxnJqNeAEf7FYXAYxwf6+tzYjL72G6XG+0MRqllEPeawy+?=
 =?iso-8859-1?Q?j+ZOAju+YKpPFkEmQqVZkEmwSPp+NKCOMZe3n9TG7/EO+2gFBYef+F1/JR?=
 =?iso-8859-1?Q?r79r9CUXREcfVcqBHO54VxD4CLvGLbxEZdbDa3cB427Q1iSE9UWS1taWQn?=
 =?iso-8859-1?Q?YGuWnX3My/ldFZVJDkIo5xXg8iLZCk2hmbPds9QBDRhAJfIzFW/CTV8K8X?=
 =?iso-8859-1?Q?/A4jnw8OB5qCoR5uAoiV1nEBq7dE922rhsqfuaBlwiqapUKl7MfujdF4Ss?=
 =?iso-8859-1?Q?32ejlDaNe+J6PKEJ5oj4LozP5U33RbWPAoiSiA0XHlR6JIvCP/x1hrOG6B?=
 =?iso-8859-1?Q?s0PraUHE0VQ09b1gai+d+LGdqUmMNamdzT90ULfvQK97uT/+31Ns6W9vVH?=
 =?iso-8859-1?Q?L0tZD0gD+o0wdgS3T50XBTbQgiQmei/rvDgXYNx/uk469+P+g8vkdrFOWz?=
 =?iso-8859-1?Q?j3v7b00/tJP+r2vLtd5boNggD2iqei/UtU8HIMVvy0kyRuTnwFu5vcZqZB?=
 =?iso-8859-1?Q?wUGlbAPJHUJIs4/hggt5yEDTEyMSLNrWukrcwCQdGJJIX0DYcMagC+r18a?=
 =?iso-8859-1?Q?cRBaOTC2YIRpLCpKNQx7xSIjaFDN19qYkg+VuyqGpfwkuL1K2uSS9wEIF4?=
 =?iso-8859-1?Q?VMXA1Ads4DJmhbsMoG0a5xFdwLPQoFOK9+mO0M5J3UY1YuK8Saw2E+Yxx0?=
 =?iso-8859-1?Q?Pz1KhTrhlWxZMihOT3c1NmTv0hjenTEZ+OwZmUiBHc+aynzKoft9Xk+M0c?=
 =?iso-8859-1?Q?aVBcQV6nm/LUr5LW6DBrzJ+DnJFMIpEIUeb2W0Sd3qtTKPRF8iws+DGyEq?=
 =?iso-8859-1?Q?7htRtIYDglMXZDmk7JLE/fE7Eh5UHTl8aUnRPUBBmVkhkSHkOJKM6bZFKD?=
 =?iso-8859-1?Q?DxL/y75PFosdIPjhCKHXpjdsIjzzN9ohvptoOL6veco4Y0rAmCbWUsawF1?=
 =?iso-8859-1?Q?m6gi2xCazAZvfEzqjT1ibOsDc7xq8TLF/P/t+Ny/c6LlBCtR1xrH1Fw659?=
 =?iso-8859-1?Q?MyE/Tru1xRZIg+BZOe1EcrwEwFWKMz7uSi+muVoOM+EHb9FGbeJzS/jlHd?=
 =?iso-8859-1?Q?+SXBEGeLhTtRpBU0JoYLhQxHBxQ9b3aoH/GLJJHNw8t6QUQlj9L45lGFqr?=
 =?iso-8859-1?Q?wbqje6wuiHIYNBH/UWW+7cPOpEC8PrV8aewpIRdudtjyVCXwEpzvBmufiQ?=
 =?iso-8859-1?Q?yZCZfsI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?yqLh6GFn6GylEnbhX4Qpg3ILg+iPhEPdH/GjLw4hezvsvmoGkBy4QdH0Tm?=
 =?iso-8859-1?Q?RHvSmgP+Uh4Ik8/vR4bMpLteATuK/sgfrpQv9XsvpnkMppBmhMqr7UwmKX?=
 =?iso-8859-1?Q?fM64fqhIk1qSMEf2/723rfXmPpASV2ZJFxcT3S9Rh+qXnoD2nAdRmJJJVa?=
 =?iso-8859-1?Q?tCQ3ke1ixo/3vt35Rmzw9Lw4f5I8R12mx4yilW856+eNev8TiaNJXOEFnr?=
 =?iso-8859-1?Q?jtaFDdVbIDVsk/q3+H1CwUrv/2aWhbW6BK2K3WtPi1sHAZ2XJkjDGK8Bxh?=
 =?iso-8859-1?Q?mV6cPGDh8jOMmKMA2CdzAhX637Ua65cutOoVoayaF+cviM9PTRdk+/mlgJ?=
 =?iso-8859-1?Q?JYVx/2Ni5JaTjgjVVjGVG2+Rxvl+yMDR+xR9vdJF1ZbT0fx6XXRudDxY0G?=
 =?iso-8859-1?Q?rZeOh4tf1wFQqVnnti8ji1GRKAKf6/vN8D7rtaPss2p7mkAR+3Zrjv9KD0?=
 =?iso-8859-1?Q?bkj9zp4iKtOuNfC4Kj0nkYHWPQI5m75zT3sJC6WaZdXqip/Jyyyv8HCQuU?=
 =?iso-8859-1?Q?I3z0IZoOueQphlhBIOrCKZbrQ4S3arz0M3er1qEeHwns/xe9ACzuyTeB0E?=
 =?iso-8859-1?Q?Dmk/L0wW/PYiwZa1fXpsWX+axX4wOL9dpU9G/zwQSiP3liuZ1AHiTnOEKK?=
 =?iso-8859-1?Q?I3+b3DXsKY4dME/Bteix1yyaG3ZTrCQM1Advpyxtr8U4D9JMkZRxmr1O/6?=
 =?iso-8859-1?Q?4QkRJdPp99Zvyk7DhN4ShOsiz4UANOtLq9qUYCW/k+WzPOmUJ5N3VKNkZY?=
 =?iso-8859-1?Q?Qij1gs8GicNM0hbew5Ku5cPgInJ+LG4WcOs8gYHxdZ0K8Y/1hiofEozcjz?=
 =?iso-8859-1?Q?lfgj8cCsBJKgHsMc1KMxPuqCnjKEWj5isfwleiFxquVgCi3yLZ5HCZCMcT?=
 =?iso-8859-1?Q?W5bSTgF2r+8WYCOcu78yE5zcu4n05C/trAEYLZksRihBc0RiWYByHHc+Dg?=
 =?iso-8859-1?Q?rHJBUj9XbD3mAvuLSKJAICNcykCqJnXKed/TSQAg91d2/UyeklPBBRypBx?=
 =?iso-8859-1?Q?nPLq1n3NM3VqPPZkGyDmmrPmDCuobEzgfZTWZz5ShM9+8BdDxFQhsa6a2E?=
 =?iso-8859-1?Q?E6kHWVWqN5ilt7eI1PEMuTF/oSdkVyYyDPPrwHgChNIU5XgUMb43z5lxhT?=
 =?iso-8859-1?Q?V+cmh//badyovEe+CKn0nEAvuZbVaE82HzR8sr+lR9xXyxHgZFVdnWAW74?=
 =?iso-8859-1?Q?YPQFAb2tdvHMhUzv4bMyPIYQPdw2ZJ1p6vf9XXt/YXZ/as3pw2fD5iS3sq?=
 =?iso-8859-1?Q?rzWK+9iMQv9xU8w7X5UFVC/k6ApRyuvtjruLCryLJOUtoiQGCUm4xNS1qq?=
 =?iso-8859-1?Q?L4KDqj9GJNRISqHZdF3YpA5AO7Vf8Hk2YWP5E50TdJuT7lWAIsLwSQ+QL3?=
 =?iso-8859-1?Q?oJgUIWru3fOp1KZJ17syKwAA3hUaltpX09eK1gO48HVRGDb4+u+wRtvDTk?=
 =?iso-8859-1?Q?fCursxjvAgz3TZTSyO0g5BZdo650G5w38hpG1tw6n7EIs21bzmFv816uUF?=
 =?iso-8859-1?Q?LDapEEKQjVvu5DkrmeLev9ps9cS8zKWGDMulSODkll77eIlFwXudOqgAYC?=
 =?iso-8859-1?Q?Uy23maAOvklVl595smJrcRAS20R81QerTJ1LCslznbImpXoIYnKObXPm0V?=
 =?iso-8859-1?Q?uOVjjLBl6aWXZFagFUcvYnGvSzg82q5umyKQh07JMAOQN3bNnjEVrcoA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae3fde9e-f313-43b8-e666-08ddd4ce90d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2025 09:49:41.4406
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 26c0S55bxFXW4hCuYd/JjRi1g2doeJSMTNBB0x/uJj+qEFl7cFCFS4PQgdxP3mHIPjndyHoPzm2k3VOTX/SabAndQuWUwrtS3Qz8hHHHL2c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB8421

From: Grygorii Strashko <grygorii_strashko@epam.com>

Hi,

During review of v1 [1] of this series Julien Grall raised concern that=20
"If the desire is to make 32-bit domain optional on Arm64.=20
Then I think it would be better to pass the domain type when the domain is
created (IOW add an extra flags to XEN_DOMCTL_createdomain)." for which
I've sent patches attempting to start solving the problem [2] and try to
probe guest kernels before creating domains. While proposed changes [2] is
under review and hence there are definitely more work is required I'd
appreciated if current series can be considered as it's Arm specific only
and working (and tested) with current Xen in its current state.

Now Arm64 AArch32 guest support is always enabled and built-in while not
all Arm64 platforms supports AArch32 (for exmaple on Armv9A) or this
support might not be needed (Arm64 AArch32 is used quite rarely in embedded
systems). More over, when focusing on safety certification, AArch32 related
code in Xen leaves a gap in terms of coverage that cannot really be
justified in words. This leaves two options: either support it (lots of
additional testing, requirements and documents would be needed) or compile
it out.

Patches 1-2 Prerequisite patches
Patch 3 - allows to make aarch32 support optional by introducing Kconfig op=
tion
          CONFIG_ARM64_AARCH32
Patch 4 - enables build-time optimization of AArch32 specific code by redef=
ining some
          is_32/64bit_domain() macro as constants

Tested (CONFIG_ARM64_AARCH32=3Dy/n):
- dom0 with AArch32/64 kernel
- toolstack create domain with AArch32/64 kernel
- dom0less domains with AArch32/64 kernel
- creating domain with AArch64 kernel and AArch32 EL0 rootfs

Changes in v2:
- dropped patches
  - (licensing issue) "xen/arm: move vcpu_switch_to_aarch64_mode() in arch_=
vcpu_create()"
  - (problematic change) "xen/arm: move vcpu_switch_to_aarch64_mode() in ar=
m64"
  - constifying is_32/64bit_domain() macro gives most of results in terms o=
f coverage,
    drop regs changes for now (can be added latter):
    "xen/arm: regs.h split subarch definitions between arm64/arm32"
    "xen/arm64: constify regs_mode_is_32bit macro for CONFIG_ARM64_AARCH32=
=3Dn"
- use Arm64 "cpu_has_el1_32" in all places to check if HW has AArch32 suppo=
rt
- rework Arm64 XEN_DOMCTL_set_address_size hypercall handling to work with =
any initial domain type
  set (32bit or 64 bit)
- fix comments related to macro parameters evaluation issues
- do not expose EL1 AArch32 support to guest in ID_AA64PFR0_EL1 reg if
  AArch32 is disabled

Link on v1:
[1] https://lore.kernel.org/xen-devel/20250723075835.3993182-1-grygorii_str=
ashko@epam.com/

[2] https://patchwork.kernel.org/project/xen-devel/cover/20250731094234.996=
684-1-grygorii_strashko@epam.com/

Grygorii Strashko (4):
  xen/arm: split set_domain_type() between arm64/arm32
  xen/arm: split is_32bit/64bit_domain() between arm64/arm32
  xen/arm64: allow to make aarch32 support optional
  xen/arm64: constify is_32/64bit_domain() macro for
    CONFIG_ARM64_AARCH32=3Dn

 xen/arch/arm/Kconfig                    |  7 +++
 xen/arch/arm/arm32/Makefile             |  1 +
 xen/arch/arm/arm32/domain-build.c       | 22 +++++++++
 xen/arch/arm/arm64/Makefile             |  1 +
 xen/arch/arm/arm64/domain-build.c       | 66 +++++++++++++++++++++++++
 xen/arch/arm/arm64/domctl.c             | 16 +++---
 xen/arch/arm/arm64/vsysreg.c            |  9 ++++
 xen/arch/arm/dom0less-build.c           | 14 ------
 xen/arch/arm/domain.c                   |  9 ++++
 xen/arch/arm/domain_build.c             | 21 ++------
 xen/arch/arm/include/asm/arm32/domain.h | 32 ++++++++++++
 xen/arch/arm/include/asm/arm64/domain.h | 54 ++++++++++++++++++++
 xen/arch/arm/include/asm/domain.h       |  7 ++-
 xen/arch/arm/setup.c                    |  2 +-
 xen/include/xen/dom0less-build.h        |  8 +++
 15 files changed, 227 insertions(+), 42 deletions(-)
 create mode 100644 xen/arch/arm/arm32/domain-build.c
 create mode 100644 xen/arch/arm/arm64/domain-build.c
 create mode 100644 xen/arch/arm/include/asm/arm32/domain.h
 create mode 100644 xen/arch/arm/include/asm/arm64/domain.h

--=20
2.34.1

