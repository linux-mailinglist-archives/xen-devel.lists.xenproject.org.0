Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5C5D175C2
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 09:46:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201206.1516903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfa24-0003iw-Ci; Tue, 13 Jan 2026 08:45:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201206.1516903; Tue, 13 Jan 2026 08:45:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfa24-0003g8-6o; Tue, 13 Jan 2026 08:45:44 +0000
Received: by outflank-mailman (input) for mailman id 1201206;
 Tue, 13 Jan 2026 08:45:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kCXa=7S=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vfa22-0003C7-MG
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 08:45:42 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d674ab5-f05c-11f0-9ccf-f158ae23cfc8;
 Tue, 13 Jan 2026 09:45:40 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by GVXPR03MB10705.eurprd03.prod.outlook.com
 (2603:10a6:150:21f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 08:45:37 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%7]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 08:45:37 +0000
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
X-Inumbo-ID: 3d674ab5-f05c-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vD08+DdqUTmdIoeU3gbIz/t6JWAO9aUQzknblf4QkQS7PpulRxCB5faGnh86d9EMCQ5xB+t8o5jma+zQlWR5kchxUUO/2IzfxzTOKrRIn5Vtac1h7m58naSbo2immhBnYmPaMT88MpcnrgruRYs1OVT7/qwFi6IMg0ostyXaMiYtk7SWCZRvUEtxubpFBq8OdP/nys9Y01nvhldnnYFGS5ClDAktP3mClNO6LglcZ5I4TQzy5CsaJ/MJnbxqJ6N151yVbJbda4Wx9ycPEFlzKnpU+0LkukuoqREhNXVPU8GGSNB1Geidm4Q35aEK/Bdp1hZ6PGENL02Sk1tHi+KE/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RBC+MU20Th/zS5Uxes6um30jksYuWzUOw6w+4COUtC8=;
 b=rdkn8Pn3fKbe09xflt1sCo/hsY+dYiOTwVrorOTl2bEYVYBQFN551AiOA3ciT5bkd6CJEt5Ei51c2fPOLYRQKN6bWbbqkkkuA0ww+xrhuEvKlH1oWZ73KAOFIRHMfUlpzQaPVzGF7xV5jkzIaSZZN+GoR9Uq08Lqv3J08B9XGGsjtMGNJnpLS9Irbn+qe80gW97W62LLTgE/QsYi+0S8yRQO6600H7YGhtif4mjgRZ1nAmYbOFIo5+jxiZ8cMySrIue5IZ7Fz8P1DyR6DnZ/OrDhh40mpYct+76szogmTEpGCgkWWg7Fc+XvV2NAr3IsF7FK+pCVBMBLHIDKk8AwMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RBC+MU20Th/zS5Uxes6um30jksYuWzUOw6w+4COUtC8=;
 b=uqMOO0roc6/qUZD1r6+2mmpxsbVYk2MlnaGsnjQbLhYzD97zgeA7TYihA1ckTBFEkqG0IVAvy7WZS8DaPgoc+o9iqkYIe6UO5dctHscM0wMwcbiCWiTP6QT00GRT4Iq+pugVxoKjSxqkhKhV2bgFvLnyeDkYoS+pegJndIe9CRLCQeNT2jKODBNuBho0Mmwi+CeEf6IMlwG5dlEeDA/pkjDIspTy0OzX9LLpsHK3cPyYJb7XxLweTU5hlAgz6nI8E4XHKCMBqx5qXpTSdwNzNF+blAT5PpIk8CUO9Jgol5h1dVcYppnkfmmPWCx6RpeOfpON69/+KLXuvVOw6WF0wg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5 5/5] docs: Document CPU hotplug
Thread-Topic: [PATCH v5 5/5] docs: Document CPU hotplug
Thread-Index: AQHchGj8vwoLQF87MUGoty+ABjFapg==
Date: Tue, 13 Jan 2026 08:45:36 +0000
Message-ID:
 <cd8c84ac9fbee5a290555f5dd2cb71a086a2bd89.1768293759.git.mykyta_poturai@epam.com>
References: <cover.1768293759.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1768293759.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|GVXPR03MB10705:EE_
x-ms-office365-filtering-correlation-id: a45c291b-3a10-4651-dd0f-08de52801fcd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?tIbk/NRak+OGlXTbGSTn3VhRJFH2+b8ft5noD3+J8aOJSw+zCj7na0PZKc?=
 =?iso-8859-1?Q?z/kLPPwt47/8oTiyC9DTe56yW0obxQ1cnzWrHHJyfsDbiJyWydG1xij8ps?=
 =?iso-8859-1?Q?DtmgT+nPYYwytg2s/DXWyVIKaeu/M5hnQZXfCYa0pSBWAG/vc/5KEoWUKH?=
 =?iso-8859-1?Q?Lu9qe4re1sMhkDYFASrk0id2BNhyadqMN/RnxDeqcRyF9eeC2ZZiuLZoV0?=
 =?iso-8859-1?Q?d92jJzcwAJc88rO+egZ2kz7kzjPM+NltHZ8IWlT9JjkGs2TawsHdTOhnjL?=
 =?iso-8859-1?Q?hKsgVXL02Hy4CPtqPd0cKMbfw11Co7htlZCbJtpHqLxTwWZ8QJvhuvHXvI?=
 =?iso-8859-1?Q?jTv6c/Tn5O3eGJ3q2Rc6A8ow0pZ1Q2PTxGB7BW217o6Xt/v6wO0ZmErBix?=
 =?iso-8859-1?Q?KklwK3KkQ4zTGnc519UUKJ/cvLL6/yLKF7jLijJf/dsbci10p2THeXFEeP?=
 =?iso-8859-1?Q?xqiYWmCCDXb2FxaToQIcmc2kh5F7uyloM5OicOOQWGkY4mtZ0WB11r0NCC?=
 =?iso-8859-1?Q?kGO+fdfoxUIOXhnTRCaBipi1M0lsrS11VnNY/aH+LY4nflnhXHkZGtzeCU?=
 =?iso-8859-1?Q?E8na+PyVDcHpfCWFM+SvRWdqAEVlwUjCn7xDZ2xRQBxzjUbBpXwXs+oLRE?=
 =?iso-8859-1?Q?jIDOrI0FR+pior28lx76hRmY2EOs+yNHVZm66Xnj8dZqBrWBjC8Abos2YP?=
 =?iso-8859-1?Q?uqk85ZsFuct/pNWrojS0BkudihbEPfNh1xPXcmTW0ksfrxlo34po5WSlEL?=
 =?iso-8859-1?Q?mSuUyR3tjmBZ1sndsIKWz0cUYELGYt38vXCtEUb5aM1YqSiiFDvZ4yaNJ0?=
 =?iso-8859-1?Q?bMppuGW38T500Kt9pqOrJYLkDd05ASjliRyuK3UQUPBRK5hYu2Qv0z0saK?=
 =?iso-8859-1?Q?J3cRvIjm7v2wmq/POrgAPNRxtpXvnQZLA5isay5c/ndQAeebdDsXkxVz8d?=
 =?iso-8859-1?Q?ygDIGnpq+QgLneRay04HiGAPG6GqBgACoWkoaDSQdAxREakoQwBSm4EBsa?=
 =?iso-8859-1?Q?Qh5wPNYNFhcKuTuEsEIppGkjCh+6qCVgHVWj9Mub8Z/EJS3S8E4OH+VpRY?=
 =?iso-8859-1?Q?uxpgmjAdTreqcm3prYbR7CL8Ijig4MYKENR2JdaK7Vpp/6sImvT5HgvrzF?=
 =?iso-8859-1?Q?T1mdtnMgyry0BdEAgT8maPDd0dF9WqngSp8FhZUpExHMtxFQJ/6FB192z6?=
 =?iso-8859-1?Q?J4CJXQUz8UFBKeNnQzOV/Cm680wbjt4AfBtuKa+q4uxvQyi0/IwEEiFlgL?=
 =?iso-8859-1?Q?g+nnPP5yUA2fGlxTSgQFsZLoi7ZEJ+n1qt/L2fucuxwlby0v5/dcDXGNqK?=
 =?iso-8859-1?Q?ESBheC7dVD6uuz3QhHMFWfP9VxrH/5FnuUHK67j2qT9T+FpUwmTdrwJvPH?=
 =?iso-8859-1?Q?6go71Sajgkw1N87QN9GF7XKZ8nGzcVBJQL0TfpN3RxqmAhpdraCkjH0xRw?=
 =?iso-8859-1?Q?j2qu++n0N4LEBiXtIujyTJ2RNbOJ2FuPkpw+ycsnAH6K9y4kF+UAzF4rvz?=
 =?iso-8859-1?Q?PMG78x7nBPM/pJuxbWpE+CLlMRlTmO6diVk1dvVLUB4xB90Gpup7k8sthc?=
 =?iso-8859-1?Q?NAUKY7AIB3/pY2IBASiEsIZ8eZ6M?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Xq9Hy0oNutWriZlYhe/SHrteH6pYAftnUl6CZ+b/TT8vawDiH7IO1ee095?=
 =?iso-8859-1?Q?Tif+8AkmJN1XmEEkAfMUJF3utowJAlkATc7CVavv5tnOrG2DE4OtTLTMoE?=
 =?iso-8859-1?Q?lYdZFM5/DHeCfvVgsA7LCXentlmHYMXF/HiWUY9l2kr7iWSZxXfuerKUls?=
 =?iso-8859-1?Q?a0ndsakhjai8QNHvKB1xTBaIv5GIbR74ZOMIypVrwUoFbJpA93Z3GfwTMg?=
 =?iso-8859-1?Q?Oc+1XWALl+PHzyqChxxyzerYpnbRsA8Gqpsos57Dz1OXJpSBd6f4kvpCqg?=
 =?iso-8859-1?Q?gcAxjkZW69mVBA2RZfQu7v6pRaUnoL9JyOM4FkGZzW31G4QV1JcklMIM8i?=
 =?iso-8859-1?Q?2ZB1DSWOnHvUsL9DnYxLEFvMi2cP6CreF+BIhvZZRcNQPFski12tci0w9A?=
 =?iso-8859-1?Q?6YUDFoAQcVxSoRClbq9QsRiKY6F2XJ9lDbAgsvRrGDrgGDwenM7ew7VWWr?=
 =?iso-8859-1?Q?0YMB3emGM2qFF3EJJvLRasOPh+y3Gd5uJ+g5mW4Pb05Ev+GM6WHOCNv5i7?=
 =?iso-8859-1?Q?CFfboSyhz5ZPGMjjbmwLbQ53ongzY2x6nrw3eo96RyZN//XfXG0GoP43qM?=
 =?iso-8859-1?Q?g/JWEuaC5UC4NWCJYAPcZmrKcsJmSjNJWFbmf7JusA/t700Bl+ckJzftdE?=
 =?iso-8859-1?Q?6QP9TZqCUs4IPVe8WJ/MTN6pjTjkFJr1S9NoYa7S+s1kb5ipmvMqWmLQq7?=
 =?iso-8859-1?Q?TeYFX22KsYWLdzP4sCucMno7JFY+mxIT9FSO1SFI9e525Yrvu9gjFjg9OC?=
 =?iso-8859-1?Q?/CIV4PeM/OHZEDSWWXQzygi2RNrQciJLyNgFPyDSw17NwfG6HBiMFYqy2Q?=
 =?iso-8859-1?Q?DRCFP7rmOnCw+9pxi7/wjE9tgk5lali/1bUqWnFYde5HidfVMNp1ZeHveX?=
 =?iso-8859-1?Q?z54VrzKvahUOyKDkL8OvGx8iOxgL4LnVOEQnH8x2MFJFw4sdJWD58f2syw?=
 =?iso-8859-1?Q?HZVfRfjrgVlfULsNJWsGL+Uh1wVwp2M6xZWuE9mtNcBCQjltlZBx9kFzIt?=
 =?iso-8859-1?Q?qRcCluHuBI9crQkEKB2xQtIrbv7Ub7kReUQFzsquDGdZavZ4qWZYy0M7C5?=
 =?iso-8859-1?Q?RHE9YlSc4ryAjBvNO74b9hSiojjLPqgGy/dXuVnx0GVlCpHfD0LCVwWmCt?=
 =?iso-8859-1?Q?L4B0GQfCr0iQNqhR1x0vgbC+QzQHcPZLiYFEXn2r38J6ufXsVP0CJVb+ZT?=
 =?iso-8859-1?Q?dPw1ifn4Vvs88+CcsB88Y1o7RmHCEk+WDBMpwefIt7DEuEzDLBIP8QQGBZ?=
 =?iso-8859-1?Q?KZSSBDRkfnsf7qaX9kFsB3dxnXDZDCGMQ0fumkmIP9aekNT8n9fjPod9Q0?=
 =?iso-8859-1?Q?RPgL2Yxw7M9L7xX3Qc7vfVyS7Bhor7nL6/fBJd7MMOYsIdaTHuPp/QqA1d?=
 =?iso-8859-1?Q?m+Ok1EcFvYeL9TE73SQhjju7fzAFW/CSrxC4+A91xVVu9mM6O4EYyGvfLt?=
 =?iso-8859-1?Q?7TbFs8VTtbQiT4VJfm6Fg8m/sIue2yeyF3KEqWImHA3k1HoFNn2M3hOGk5?=
 =?iso-8859-1?Q?ffHKs33OkzMaRL/WP+karxJFxkvdQoP/hEEG25o+8nStUgeCKGWX15J3a4?=
 =?iso-8859-1?Q?jKy7FRyxHpjTkl0QO3+nQDp9j1rwhWO//gS4xCMn/Cy9CCFo82VtxtinjO?=
 =?iso-8859-1?Q?FAc+nxKr81KtQbmCzUXsOqGHkSUVuYLQjDZao0W3/Ky6fgeelbK36nVoji?=
 =?iso-8859-1?Q?ReHwMqZ5zuhH/cPVvg49QKOwiZdwlzSnoHdgmp8/wQeV4QDYoJz4u6E3FM?=
 =?iso-8859-1?Q?2C4hSby77i36u0cXNKs7++FC7FIxlaIS7gIDJbgN9qXVbG9ouCrj4K0qGH?=
 =?iso-8859-1?Q?2wxBf6yvlwScoWH0f8Tge7r8vUe3rqQ=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a45c291b-3a10-4651-dd0f-08de52801fcd
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2026 08:45:36.4156
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iAg0xaEtr/onplm6aO/E8GaAo0NKnAtkqJmX15PYWQ3ZgogwVJimLZEAnWmloLvghr0bul1cieJdpSRmrzMDJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB10705

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---

v4->v5:
* s/supported/implemented/
* update SUPPORT.md

v3->v4:
* update configuration section

v2->v3:
* patch introduced
---
 SUPPORT.md                |  1 +
 docs/misc/cpu-hotplug.txt | 50 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 docs/misc/cpu-hotplug.txt

diff --git a/SUPPORT.md b/SUPPORT.md
index d441bccf37..7b93ae69e7 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -52,6 +52,7 @@ For the Cortex A77 r0p0 - r1p0, see Errata 1508412.
 ### ACPI CPU Hotplug
=20
     Status, x86: Experimental
+    Status, Arm64: Experimental
=20
 ### Physical Memory
=20
diff --git a/docs/misc/cpu-hotplug.txt b/docs/misc/cpu-hotplug.txt
new file mode 100644
index 0000000000..c34fc66361
--- /dev/null
+++ b/docs/misc/cpu-hotplug.txt
@@ -0,0 +1,50 @@
+CPU Hotplug
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+CPU hotplug is a feature that allows pCPU cores to be added to or removed =
from a
+running system without requiring a reboot. It is implemented on x86 and Ar=
m64
+architectures.
+
+Implementation Details
+----------------------
+
+CPU hotplug is implemented through the `XEN_SYSCTL_CPU_HOTPLUG_*` sysctl c=
alls.
+The specific calls are:
+
+- `XEN_SYSCTL_CPU_HOTPLUG_ONLINE`: Brings a pCPU online
+- `XEN_SYSCTL_CPU_HOTPLUG_OFFLINE`: Takes a pCPU offline
+- `XEN_SYSCTL_CPU_HOTPLUG_SMT_ENABLE`: Enables SMT threads (x86 only)
+- `XEN_SYSCTL_CPU_HOTPLUG_SMT_DISABLE`: Disables SMT threads (x86 only)
+
+All cores can be disabled, assuming hardware support, except for the boot =
core.
+Sysctl calls are routed to the boot core before doing any actual up/down
+operations on other cores.
+
+Configuration
+-------------
+
+The presence of the feature is controlled by CONFIG_CPU_HOTPLUG option. It=
 is
+enabled unconditionally on x86 architecture. On Arm64, the option is enabl=
ed by
+default when ITS, FFA, and TEE configs are disabled.
+xen-hptool userspace tool is built unconditionally.
+
+Usage
+-----
+
+Disable core:
+
+$ xen-hptool cpu-offline 2
+Prepare to offline CPU 2
+(XEN) Removing cpu 2 from runqueue 0
+CPU 2 offlined successfully
+
+Enable core:
+
+$ xen-hptool cpu-online 2
+Prepare to online CPU 2
+(XEN) Bringing up CPU2
+(XEN) GICv3: CPU2: Found redistributor in region 0 @00000a004005c000
+(XEN) CPU2: Guest atomics will try 1 times before pausing the domain
+(XEN) CPU 2 booted.
+(XEN) Adding cpu 2 to runqueue 0
+CPU 2 onlined successfully
--=20
2.51.2

