Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E49B43E8C
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 16:21:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1110286.1459575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuAqJ-0006OI-Cc; Thu, 04 Sep 2025 14:21:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1110286.1459575; Thu, 04 Sep 2025 14:21:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuAqJ-0006MY-9P; Thu, 04 Sep 2025 14:21:39 +0000
Received: by outflank-mailman (input) for mailman id 1110286;
 Thu, 04 Sep 2025 14:21:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m40+=3P=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1uuAqG-0005ts-Th
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 14:21:37 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 760b2498-899a-11f0-9809-7dc792cee155;
 Thu, 04 Sep 2025 16:21:34 +0200 (CEST)
Received: from DU0PR03MB8934.eurprd03.prod.outlook.com (2603:10a6:10:473::15)
 by GV2PR03MB8751.eurprd03.prod.outlook.com (2603:10a6:150:a8::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 14:21:27 +0000
Received: from DU0PR03MB8934.eurprd03.prod.outlook.com
 ([fe80::26fd:98f2:a1cc:be40]) by DU0PR03MB8934.eurprd03.prod.outlook.com
 ([fe80::26fd:98f2:a1cc:be40%7]) with mapi id 15.20.9052.013; Thu, 4 Sep 2025
 14:21:27 +0000
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
X-Inumbo-ID: 760b2498-899a-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g1vx/7oJJ/owA78eDldT3gLToOv+Zm/JprMSh2uYIbyXSilBNOpcHuZUnLjl1ZGK8h2HmIJHCHbDdHVPGjhaP9HpzDzZh1q1LW4Jf+0Sz9KtDC34qUDz44jhFyxXUO1rq0UDBPUiGGhH+OqibQV9MRqVJejVFLSn34JIC2Kjlmujss1Li7yHHJWzxfB4VINSL9qSvRQekGkg4pYUDgTIcA0ghOjZ94PcmcxEuN/5JhAZ2f+sXYgHPXTX+gESxEb5vhwfiuQIHDQVdq5QgUlM+xFRHX8h2Om5o4HRW7hjzkzItrKTHEDxCle3wDpQgB/Rwh9gNppGApERE3zSEWom1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vBrFjLRNqA0YEzCePfVWiUA4mMc43WHwaPUc0JP2ZXc=;
 b=ruDlYz3nswZs9sBZc8BB7tr4Hbr9by5NJg7h4OiYw/HUP/ea06Jb2X9R+nzHnoAP3cz6ZQKmfnzRpj7pC2S3CwnePpSS4EikFHcGl9T5dSqmq+J05n5EFlMWiHd3gMhy9eOUn9D4cajcBH7NGInA+vjzUazdLDYxK/fFR1+eK4Q4yHvsY3XBRh1gJe1FS3NHDzRC1mw3UDeecHCjt93KiQYYf/sxld9EWb4uXWRn+8mKccZDXKqJM9PL810gJBMwSl9VD64rhLa+QMkhUuxM2ttoHZZq4iJX/8b7JAMcFcyUkJTWNrew6UTMkUj69rYQfa9SscnBbyP4D9rl7lAfmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vBrFjLRNqA0YEzCePfVWiUA4mMc43WHwaPUc0JP2ZXc=;
 b=Q4lJwQxIAU/CsiQQHkFJ/oh4+IRCkutGsnUP4DszT2JZK77AK/uoPBUFXfvDyCENtE+xukeLRlYZZ6KI08RC/A28VLJi76G2Y6klYE6LGteSMzp97flcaTGHIs+7JqHb0AHosW0XuJYIFf7yRyrnu6YK7NfJsll4JkXlQCZ8ykYV7F61xSVa8IIC3ncuKHAu0z0RynlLIeUhqLg46NDlzXuQ9xhA2+5ts9wBrP1F4pxzIbEJqYnsOsamv4EqzxBfaCXVLxMOVfxoNTc19Hx3XAe8AO0o8tQJRi5JrrFAg59hpV2Rl5M5ZovB6zgSsn7ZgIp08DMbPiODpTRrGjUOxw==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: [PATCH v9 1/4] xen/arm: add generic SCI subsystem
Thread-Topic: [PATCH v9 1/4] xen/arm: add generic SCI subsystem
Thread-Index: AQHcHaczp/pn2jKXU0i48m8PFCAwNA==
Date: Thu, 4 Sep 2025 14:21:27 +0000
Message-ID:
 <3e237c5256054a88b1c099d85d8bd1a602bba230.1756995595.git.oleksii_moisieiev@epam.com>
References: <cover.1756995595.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1756995595.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR03MB8934:EE_|GV2PR03MB8751:EE_
x-ms-office365-filtering-correlation-id: 3ea15c19-5fc1-4378-494a-08ddebbe560b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?+gUOHSrlBig1bNQUdrA4QDhiQsB888urPrPiF5tJe94HrSJOlfwhUck6tf?=
 =?iso-8859-1?Q?9uDqfpYC4UqsBBVPANGj4N2RppfDTI7fNvegJzp2OZHxWNLpwmztGPekf8?=
 =?iso-8859-1?Q?ndhUaDwnCSRtQbXaR3E9XdsAm3HAb+rk2YwSErcPKokKKa59eX6QGqnB0o?=
 =?iso-8859-1?Q?FotM630W/toBokDx/MZMlNd9WK7idg14Nb8h4nnGgCl0v36/LmHPkYZlLg?=
 =?iso-8859-1?Q?lKmqZybB4k8hXgbuqa2QqFmHiCulFXxHSW5T6QLud6HPBFzVECrB3cQ8M5?=
 =?iso-8859-1?Q?wpam5SZ/HUm/BGIvppnoQKsMrY+LQ8oMRns8zWOb1SlXdhCIcLdolV12KT?=
 =?iso-8859-1?Q?pcqr1HlkyNuHFSsZv8iXMHQ+AInL5DaHSk3TumHJBuU6vHyno5YFc/ohIj?=
 =?iso-8859-1?Q?22tuBPT9zFxuTYIBewWrnCXSOm5mYr911Cvm39H7Ttxqm+A3HD5RaTE+m7?=
 =?iso-8859-1?Q?dfRNYE8EpolviwEDTyIbeoe/fHE6TR0fAfo7ngmtjgMG0b93vOr4o/LoNk?=
 =?iso-8859-1?Q?FnlI056Np4AbheAPdgKejKyb9GUcAGJRXuQgflwdaueUIEif5F6dTmQZsR?=
 =?iso-8859-1?Q?i6MsjG0nSaRsm1BcjHsQ7n683lhB0JS5SBBeYNbDWxgENwQzcA/K3zVFR2?=
 =?iso-8859-1?Q?trlHmlkrVIFWhqVprS04OQhW3R24Ke6x/sUwMgjVsmwIpmApkMx2x8kXZk?=
 =?iso-8859-1?Q?rbDXGHYfLJb+XqOD7FFB9iREUUI4WaBqh4SSs7Bvz6YhNAybzqe9oxf31Z?=
 =?iso-8859-1?Q?XewJukgS8OiRYXDKUbs89qoJfdyM0sLbgFcPA+9+BtsT9ralmlrm4FNAWb?=
 =?iso-8859-1?Q?laqIxPzQWjsELONUW/sKxegY3AEs6C3nsU1FFvF1z5eh5d1Q1macS7NuuM?=
 =?iso-8859-1?Q?oQ5EppDmC+GbrxhoqOLYZYW1Q950vdUdfbk2jueyj1gIGeUwIndsOD5UVm?=
 =?iso-8859-1?Q?C8SdPmbVSg/jCRI8nz3MR1RlQ+wQiKwR32Zzw4TdipYmuS1st82KFx/3lP?=
 =?iso-8859-1?Q?vl9gvgD8HtImWiVlT4R5OgC7GFgdGKa3t7nTXvGb+0B/0/KwP3GUc9bdRf?=
 =?iso-8859-1?Q?omM/EOmwBoQjI7y67vpKrI1Tyz5sD7IKjz2cmseX+79L/RhT3f7ZF+fa26?=
 =?iso-8859-1?Q?aNqyOYyCs4Zyh2nd6oSN/PGGM0hbK4080btfBWVoJbhetgKL7B7d7raJ3r?=
 =?iso-8859-1?Q?ec+JWza1DSbQqi1M2CXbGKNUwnpoA6jWzrbr6RSiYv/mwAcSLyxDj90FbN?=
 =?iso-8859-1?Q?o4nMAM0F7ueO6T+E9fF7Lg92wjOwf9FAHKdwW5gQVqh0ThFaoNcElNrOp/?=
 =?iso-8859-1?Q?NhjQ2Z2AoiN4l3TdrnCbJjXcho04KMNuipfGFylcf+ptwVIvg2PPk/s8tp?=
 =?iso-8859-1?Q?drVTJTZwBXWPhlSbXPgnTEvPxHEuZebKiICfJeEsDtSAKnmzQ9oeunpoa8?=
 =?iso-8859-1?Q?5rS1akl5fTuPhun68hrAld2myfP8PWtd3eOJ2oamJV3MapFHuMs7ZXpLKB?=
 =?iso-8859-1?Q?TQn3f2E1kecTgN2EghvJQmQeHgvK11sRTC5bw3R69OKw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR03MB8934.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?JUfyNbQjU1GAHZP5a0lMqAw6rH8fLz7iWM7zpk1kYpj2X3eq2FmdvMjL1D?=
 =?iso-8859-1?Q?G8SQHr5HwnUfLEKDWcyVStLwXrLSWXw4AFFUGlgTbAuHnz9rcjGhsci65P?=
 =?iso-8859-1?Q?z2/o8up36byjc/aW/XJyocQo7kYC//z34x+sYE+0HcMjwuii5eWREQVt4d?=
 =?iso-8859-1?Q?LS9e5P6lqe0/R1t5RPXGlRBsmIJyqgURYTILPLW6Vxzqo2UovldwIPdIZT?=
 =?iso-8859-1?Q?wHt4ZvLSzNPcZGG9n/nX4pbze6e5832r9rJn3zPy6dBqLtsYzAjtLKkjkD?=
 =?iso-8859-1?Q?6wqNioVAgPOS9GCpsvnnOcNWidwmYP+JAmV4tLpVuGHko2OVUDO2WYtRik?=
 =?iso-8859-1?Q?3y1Q5vSL1oan239syTAIKCPQ8fZY8LVNLECwzAVOTqleh33Y7lV5KiD+45?=
 =?iso-8859-1?Q?cFBzaZHx2ZC2J1qDg+8ek077N2qK+VKRbzkv3O1x+91XPsRRXrdNiFkUjn?=
 =?iso-8859-1?Q?qQCzg0LQTVWBNOvyCTjIJEp74ONCbHHP9JjlT6PlhbRXSTMjdLrw5xfNd/?=
 =?iso-8859-1?Q?iJoQvLr8Owu0hM0L4vDVzT/LHyynO7lH4m5iiE18Y+DLQ5m60vApImNDxQ?=
 =?iso-8859-1?Q?0mfogEp6aIXvF6fH2RmoHk8pjty+ogNLBOWWhi8TEuHIRb8sHq+whx38VV?=
 =?iso-8859-1?Q?0zyM9TA30NnNlgyU974n0d4iW0lqta1gdI8VRV9mbrqPkSf8Er+Vs8vcup?=
 =?iso-8859-1?Q?+7AWYBwMASDmLGzEd8RQQTKvveIC9dI4WX6uRiiXogubhb7ihVQOzFomc1?=
 =?iso-8859-1?Q?y1CB+3coTLSlOBsh04l8BJOwqgPZ1tWM01n8uoJ9a44ko0/vyAp856/y42?=
 =?iso-8859-1?Q?We7YCKCCU6gQ84SIpLIHUCfAYKiRr0JfsV1kukcSSVDPgRIw4vcK27M7je?=
 =?iso-8859-1?Q?A2b1STZorUdMbLkOYW6d6dwp+DL7Eeh7LnU2fKVll2shF/h4FJppvBm5fw?=
 =?iso-8859-1?Q?gdMNiNGCuwCKT5QOuECUD1XNrRIpDOvNlSHHd3fqOS4NI87tClKcLBjMLt?=
 =?iso-8859-1?Q?cUuiuQ3JUfamACrSAq+Bj8k3YVtImLS930hPC+YTd/wW6SNCluwIerxMzi?=
 =?iso-8859-1?Q?YWGCOQX7wNpO5IfL69xZLpFBfRg3Xy3BWM/BDq4XQfp9EMz4560DHPqyAU?=
 =?iso-8859-1?Q?oavONkj+EVYlBRdQpQZQZjgXpfvIDQHH386B62cJQSCo10fQxNBEOpgCqD?=
 =?iso-8859-1?Q?VVWcQUCS+nZ2XSHRWEdS93crfwOajGAvy9kpMgE8GP1GWfGBebiWa6Q0s6?=
 =?iso-8859-1?Q?BuFUhvyKWag+6RbMqE9rsA90VAlBNLt8/AqoOqWIug8/vpaeQwkmbcu481?=
 =?iso-8859-1?Q?oAdgpwMjRWvTfNqiwfv0aDfka+K/Benf8ij4Fy2GSFwiOuticFqlqSJZnB?=
 =?iso-8859-1?Q?Kr9CkJ7qvpZfYzE0Vozmym42+3IiXD4um6C/HPo3rr4K5IKAzNxW5b466R?=
 =?iso-8859-1?Q?jwszTRgRwlskGE22dRKBBt6mDsfDllgKqiiW1W9bI+SrdIbPfMNacbR4+b?=
 =?iso-8859-1?Q?uGbVt4NrNHj/7WLyQ/5ivs5XtK5i06pm/wlaWc11ncG+8U5AQ2YTCbb4xP?=
 =?iso-8859-1?Q?6SK0WoWNxLSRHV8idOQVXSl4tyYvEtQubF8mq1Ay7QnQ0S5jUQEevKbgm8?=
 =?iso-8859-1?Q?mZIRfHewb3QLIk8jvXvNOmJmmQhJX5fs0pvW3ivKgDvHmUrtLVHoYPVQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR03MB8934.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ea15c19-5fc1-4378-494a-08ddebbe560b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2025 14:21:27.2395
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZzeoS0wSaXjo7kwRiIYSNa4xOqeBAQpuMxJqUWlm0t8cT01ZnQBH86LIMrLobrG5XzJcwWrGp9InHoq7PBCaPZYU/dV2OdgwNgSeWpaHWlM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB8751

This patch adds the basic framework for ARM SCI mediator. SCI is System
Control Interface, which is designed to redirect requests from the Domains
to ARM specific Firmware (for example SCMI). This will allow the devices,
passed-through to the different Domains, to access to the System resources
(such as clocks/resets etc) by sending requests to the firmware.

ARM SCI subsystem allows to implement different SCI drivers to handle
specific ARM firmware interfaces (like ARM SCMI) and mediate requests
-between the Domains and the Firmware. Also it allows SCI drivers to perfor=
m
proper action during Domain creation/destruction which is vital for
handling use cases like Domain reboot.

This patch introduces new DEVICE_FIRMWARE device subclass for probing SCI
drivers basing on device tree, SCI drivers register itself with
DT_DEVICE_START/END macro. On init - the SCI drivers should register its
SCI ops with sci_register(). Only one SCI driver can be supported.

At run-time, the following SCI API calls are introduced:

- sci_domain_sanitise_config() called from arch_sanitise_domain_config()
- sci_domain_init() called from arch_domain_create()
- sci_relinquish_resources() called from domain_relinquish_resources()
- sci_domain_destroy() called from arch_domain_destroy()
- sci_handle_call() called from vsmccc_handle_call()
- sci_dt_handle_node()
- sci_dt_finalize() called from handle_node() (Dom0 DT)

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---

Changes in v9:
- change input param name for sci_handle_call function to match MISRA rules

Changes in v7:
- fix sci_handl_call to make changes more readable
- fix build error when DOM0LESS_BUILD is disabled (removed
 arch_handle_passthrough_prop from the header)
- sort headers in alphabetical order in sci.h

Changes in v6:
- rebase on top of the latest master
- fix return value of sci_dt_finalize() call

Changes in v5:
- update Maintainers file. Set role as a Reviewer
- rebased on the latest master branch
- Introduce arch_handle_passthrough_prop call to handle arm specific nodes

Changes in v4:
- fix SPDX-License
- rename DEVICE_ARM_SCI DT device class to FIRMWARE_DEVICE
- move XEN_DOMCTL_assign_device code in separate patch
- Add documentation for SCI SCMI drivers

 MAINTAINERS                             |   6 +
 xen/arch/arm/device.c                   |   5 +
 xen/arch/arm/dom0less-build.c           |   8 +
 xen/arch/arm/domain.c                   |  12 +-
 xen/arch/arm/domain_build.c             |   8 +
 xen/arch/arm/firmware/Kconfig           |   8 +
 xen/arch/arm/firmware/Makefile          |   1 +
 xen/arch/arm/firmware/sci.c             | 154 ++++++++++++++++++
 xen/arch/arm/include/asm/domain.h       |   5 +
 xen/arch/arm/include/asm/firmware/sci.h | 200 ++++++++++++++++++++++++
 xen/arch/arm/vsmc.c                     |   3 +-
 xen/common/device-tree/dom0less-build.c |   4 +
 xen/include/asm-generic/device.h        |   1 +
 xen/include/public/arch-arm.h           |   4 +
 xen/include/xen/dom0less-build.h        |   3 +
 15 files changed, 420 insertions(+), 2 deletions(-)
 create mode 100644 xen/arch/arm/firmware/sci.c
 create mode 100644 xen/arch/arm/include/asm/firmware/sci.h

diff --git a/MAINTAINERS b/MAINTAINERS
index c4886c1159..31dbba54bb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -509,6 +509,12 @@ R:	George Dunlap <gwd@xenproject.org>
 S:	Supported
 F:	xen/common/sched/
=20
+SCI MEDIATORS
+R:	Oleksii Moisieiev <oleksii_moisieiev@epam.com>
+S:	Supported
+F:	xen/arch/arm/firmware/sci.c
+F:	xen/arch/arm/include/asm/firmware/sci.h
+
 SEABIOS UPSTREAM
 M:	Wei Liu <wl@xen.org>
 S:	Supported
diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
index 11523750ae..74b54cad34 100644
--- a/xen/arch/arm/device.c
+++ b/xen/arch/arm/device.c
@@ -13,6 +13,7 @@
 #include <xen/iocap.h>
 #include <xen/lib.h>
=20
+#include <asm/firmware/sci.h>
 #include <asm/setup.h>
=20
 int map_irq_to_domain(struct domain *d, unsigned int irq,
@@ -303,6 +304,10 @@ int handle_device(struct domain *d, struct dt_device_n=
ode *dev, p2m_type_t p2mt,
                 return res;
             }
         }
+
+        res =3D sci_assign_dt_device(d, dev);
+        if ( res )
+            return res;
     }
=20
     res =3D map_device_irqs_to_domain(d, dev, own_device, irq_ranges);
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index c8d07213e2..0094cf9e40 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -22,6 +22,7 @@
=20
 #include <asm/arm64/sve.h>
 #include <asm/domain_build.h>
+#include <asm/firmware/sci.h>
 #include <asm/grant_table.h>
 #include <asm/setup.h>
=20
@@ -272,6 +273,12 @@ int __init init_vuart(struct domain *d, struct kernel_=
info *kinfo,
     return rc;
 }
=20
+int __init arch_handle_passthrough_prop(struct kernel_info *kinfo,
+                                        struct dt_device_node *node)
+{
+    return sci_assign_dt_device(kinfo->bd.d, node);
+}
+
 int __init arch_parse_dom0less_node(struct dt_device_node *node,
                                     struct boot_domain *bd)
 {
@@ -281,6 +288,7 @@ int __init arch_parse_dom0less_node(struct dt_device_no=
de *node,
=20
     d_cfg->arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE;
     d_cfg->flags |=3D XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap;
+    d_cfg->arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_NONE;
=20
     if ( !dt_property_read_u32(node, "nr_spis", &d_cfg->arch.nr_spis) )
     {
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 863ae18157..1a8585d02b 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -24,6 +24,7 @@
 #include <asm/platform.h>
 #include <asm/procinfo.h>
 #include <asm/regs.h>
+#include <asm/firmware/sci.h>
 #include <asm/tee/tee.h>
 #include <asm/vfp.h>
 #include <asm/vgic.h>
@@ -699,7 +700,7 @@ int arch_sanitise_domain_config(struct xen_domctl_creat=
edomain *config)
         return -EINVAL;
     }
=20
-    return 0;
+    return sci_domain_sanitise_config(config);
 }
=20
 int arch_domain_create(struct domain *d,
@@ -791,6 +792,9 @@ int arch_domain_create(struct domain *d,
     d->arch.sve_vl =3D config->arch.sve_vl;
 #endif
=20
+    if ( (rc =3D sci_domain_init(d, config)) !=3D 0 )
+        goto fail;
+
     return 0;
=20
 fail:
@@ -851,6 +855,7 @@ void arch_domain_destroy(struct domain *d)
     domain_vgic_free(d);
     domain_vuart_free(d);
     free_xenheap_page(d->shared_info);
+    sci_domain_destroy(d);
 #ifdef CONFIG_ACPI
     free_xenheap_pages(d->arch.efi_acpi_table,
                        get_order_from_bytes(d->arch.efi_acpi_len));
@@ -1044,6 +1049,7 @@ enum {
     PROG_p2m_root,
     PROG_p2m,
     PROG_p2m_pool,
+    PROG_sci,
     PROG_done,
 };
=20
@@ -1103,6 +1109,10 @@ int domain_relinquish_resources(struct domain *d)
         ret =3D relinquish_p2m_mapping(d);
         if ( ret )
             return ret;
+    PROGRESS(sci):
+        ret =3D sci_relinquish_resources(d);
+        if ( ret )
+            return ret;
=20
     PROGRESS(p2m_root):
         /*
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index a9e4153e3c..039aa71439 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -28,6 +28,7 @@
 #include <asm/setup.h>
 #include <asm/tee/tee.h>
 #include <asm/pci.h>
+#include <asm/firmware/sci.h>
 #include <asm/platform.h>
 #include <asm/psci.h>
 #include <asm/setup.h>
@@ -1640,6 +1641,9 @@ static int __init handle_node(struct domain *d, struc=
t kernel_info *kinfo,
         return 0;
     }
=20
+    if ( sci_dt_handle_node(d, node) )
+        return 0;
+
     /*
      * The vGIC does not support routing hardware PPIs to guest. So
      * we need to skip any node using PPIs.
@@ -1740,6 +1744,10 @@ static int __init handle_node(struct domain *d, stru=
ct kernel_info *kinfo,
         if ( res )
             return res;
=20
+        res =3D sci_dt_finalize(d, kinfo->fdt);
+        if ( res )
+            return res;
+
         /*
          * Create a second memory node to store the ranges covering
          * reserved-memory regions.
diff --git a/xen/arch/arm/firmware/Kconfig b/xen/arch/arm/firmware/Kconfig
index 817da745fd..fc7918c7fc 100644
--- a/xen/arch/arm/firmware/Kconfig
+++ b/xen/arch/arm/firmware/Kconfig
@@ -1,3 +1,11 @@
+config ARM_SCI
+	bool
+	depends on ARM
+	help
+	  This option enables generic Arm SCI (System Control Interface) mediator=
s
+	  support. It allows domains to control system resources via one of
+	  Arm SCI mediators drivers implemented in XEN, like SCMI.
+
 menu "Firmware Drivers"
=20
 config SCMI_SMC
diff --git a/xen/arch/arm/firmware/Makefile b/xen/arch/arm/firmware/Makefil=
e
index a5e4542666..71bdefc24a 100644
--- a/xen/arch/arm/firmware/Makefile
+++ b/xen/arch/arm/firmware/Makefile
@@ -1 +1,2 @@
+obj-$(CONFIG_ARM_SCI) +=3D sci.o
 obj-$(CONFIG_SCMI_SMC) +=3D scmi-smc.o
diff --git a/xen/arch/arm/firmware/sci.c b/xen/arch/arm/firmware/sci.c
new file mode 100644
index 0000000000..aa93cda7f0
--- /dev/null
+++ b/xen/arch/arm/firmware/sci.c
@@ -0,0 +1,154 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Generic part of the SCI (System Control Interface) subsystem.
+ *
+ * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
+ * Copyright (c) 2025 EPAM Systems
+ */
+
+#include <xen/acpi.h>
+#include <xen/errno.h>
+#include <xen/init.h>
+#include <xen/sched.h>
+#include <xen/types.h>
+
+#include <asm/firmware/sci.h>
+
+static const struct sci_mediator_ops __read_mostly *cur_mediator;
+
+int sci_register(const struct sci_mediator_ops *ops)
+{
+    if ( cur_mediator )
+        return -EEXIST;
+
+    if ( !ops->domain_init || !ops->domain_destroy || !ops->handle_call )
+        return -EINVAL;
+
+    cur_mediator =3D ops;
+
+    return 0;
+};
+
+bool sci_handle_call(struct cpu_user_regs *regs)
+{
+    if ( unlikely(!cur_mediator) )
+        return false;
+
+    return cur_mediator->handle_call(regs);
+}
+
+int sci_domain_init(struct domain *d, struct xen_domctl_createdomain *conf=
ig)
+{
+    if ( !cur_mediator )
+        return 0;
+
+    return cur_mediator->domain_init(d, config);
+}
+
+int sci_domain_sanitise_config(struct xen_domctl_createdomain *config)
+{
+    if ( !cur_mediator )
+        return 0;
+
+    if ( !cur_mediator->domain_sanitise_config )
+        return 0;
+
+    return cur_mediator->domain_sanitise_config(config);
+}
+
+void sci_domain_destroy(struct domain *d)
+{
+    if ( !cur_mediator )
+        return;
+
+    cur_mediator->domain_destroy(d);
+}
+
+int sci_relinquish_resources(struct domain *d)
+{
+    if ( !cur_mediator )
+        return 0;
+
+    if ( !cur_mediator->relinquish_resources )
+        return 0;
+
+    return cur_mediator->relinquish_resources(d);
+}
+
+bool sci_dt_handle_node(struct domain *d, struct dt_device_node *node)
+{
+    if ( !cur_mediator )
+        return 0;
+
+    if ( !cur_mediator->dom0_dt_handle_node )
+        return 0;
+
+    return cur_mediator->dom0_dt_handle_node(d, node);
+}
+
+int sci_dt_finalize(struct domain *d, void *fdt)
+{
+    if ( !cur_mediator )
+        return 0;
+
+    if ( !cur_mediator->dom0_dt_finalize )
+        return 0;
+
+    return cur_mediator->dom0_dt_finalize(d, fdt);
+}
+
+int sci_assign_dt_device(struct domain *d, struct dt_device_node *dev)
+{
+    struct dt_phandle_args ac_spec;
+    int index =3D 0;
+    int ret;
+
+    if ( !cur_mediator )
+        return 0;
+
+    if ( !cur_mediator->assign_dt_device )
+        return 0;
+
+    while ( !dt_parse_phandle_with_args(dev, "access-controllers",
+                                        "#access-controller-cells", index,
+                                        &ac_spec) )
+    {
+        printk(XENLOG_DEBUG "sci: assign device %s to %pd\n",
+               dt_node_full_name(dev), d);
+
+        ret =3D cur_mediator->assign_dt_device(d, &ac_spec);
+        if ( ret )
+            return ret;
+
+        index++;
+    }
+
+    return 0;
+}
+
+static int __init sci_init(void)
+{
+    struct dt_device_node *np;
+    unsigned int num_sci =3D 0;
+    int rc;
+
+    dt_for_each_device_node(dt_host, np)
+    {
+        rc =3D device_init(np, DEVICE_FIRMWARE, NULL);
+        if ( !rc && num_sci )
+        {
+            printk(XENLOG_ERR
+                   "SCMI: Only one SCI controller is supported. found seco=
nd %s\n",
+                   np->name);
+            return -EOPNOTSUPP;
+        }
+        else if ( !rc )
+            num_sci++;
+        else if ( rc !=3D -EBADF && rc !=3D -ENODEV )
+            return rc;
+    }
+
+    return 0;
+}
+
+__initcall(sci_init);
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/d=
omain.h
index a3487ca713..af3e168374 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -120,6 +120,11 @@ struct arch_domain
 #ifdef CONFIG_TEE
     void *tee;
 #endif
+#ifdef CONFIG_ARM_SCI
+    bool sci_enabled;
+    /* ARM SCI driver's specific data */
+    void *sci_data;
+#endif
=20
 }  __cacheline_aligned;
=20
diff --git a/xen/arch/arm/include/asm/firmware/sci.h b/xen/arch/arm/include=
/asm/firmware/sci.h
new file mode 100644
index 0000000000..3500216bc2
--- /dev/null
+++ b/xen/arch/arm/include/asm/firmware/sci.h
@@ -0,0 +1,200 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Generic ARM SCI (System Control Interface) subsystem.
+ *
+ * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
+ * Copyright (c) 2025 EPAM Systems
+ */
+
+#ifndef __ASM_ARM_SCI_H
+#define __ASM_ARM_SCI_H
+
+#include <xen/device_tree.h>
+#include <xen/errno.h>
+#include <xen/lib.h>
+#include <xen/sched.h>
+#include <xen/types.h>
+
+#ifdef CONFIG_ARM_SCI
+
+struct sci_mediator_ops {
+    /*
+     * Called during domain construction. If it is requested to enable
+     * SCI support, so SCI driver can create own structures for the new do=
main
+     * and inform firmware about new domain (if required).
+     * Mandatory.
+     */
+    int (*domain_init)(struct domain *d,
+                       struct xen_domctl_createdomain *config);
+
+    /*
+     * Called during domain construction. The SCI driver uses
+     * it to sanitize domain SCI configuration parameters.
+     * Optional.
+     */
+    int (*domain_sanitise_config)(struct xen_domctl_createdomain *config);
+
+    /*
+     * Called during domain destruction, releases all resources, that
+     * were allocated for domain.
+     * Mandatory.
+     */
+    void (*domain_destroy)(struct domain *d);
+
+    /*
+     * Called during domain destruction to relinquish resources used
+     * by SCI driver itself and request resources releasing from firmware.
+     * Optional.
+     */
+    int (*relinquish_resources)(struct domain *d);
+
+    /* SMC/HVC Handle callback */
+    bool (*handle_call)(struct cpu_user_regs *regs);
+
+    /*
+     * Dom0 DT nodes handling callback so SCI driver can detect DT nodes i=
t
+     * need to handle and decide if those nodes need to be provided to Dom=
0.
+     * Optional.
+     */
+    bool (*dom0_dt_handle_node)(struct domain *d, struct dt_device_node *n=
ode);
+
+    /*
+     * SCI driver callback called at the end of Dom0 DT generation, so
+     * it can perform steps to modify DT to enable/disable SCI
+     * functionality for Dom0.
+     */
+    int (*dom0_dt_finalize)(struct domain *d, void *fdt);
+
+    /*
+     * SCI driver callback called when DT device is passed through to gues=
t,
+     * so SCI driver can enable device access to the domain if SCI FW prov=
ides
+     * Device specific access control functionality.
+     * Optional.
+     */
+    int (*assign_dt_device)(struct domain *d, struct dt_phandle_args *ac_s=
pec);
+};
+
+
+static inline bool sci_domain_is_enabled(struct domain *d)
+{
+    return d->arch.sci_enabled;
+}
+
+/*
+ * Register SCI subsystem ops.
+ *
+ * Register SCI drivers operation and so enable SCI functionality.
+ * Only one SCI driver is supported.
+ */
+int sci_register(const struct sci_mediator_ops *ops);
+
+/*
+ * Initialize SCI functionality for domain if configured.
+ *
+ * Initialization routine to enable SCI functionality for the domain.
+ * The SCI configuration data and decision about enabling SCI functionalit=
y
+ * for the domain is SCI driver specific.
+ */
+int sci_domain_init(struct domain *d, struct xen_domctl_createdomain *conf=
ig);
+
+/*
+ * Sanitise domain configuration parameters.
+ *
+ */
+int sci_domain_sanitise_config(struct xen_domctl_createdomain *config);
+
+/*
+ * Destroy SCI domain instance.
+ */
+void sci_domain_destroy(struct domain *d);
+
+/*
+ * Free resources assigned to the certain domain.
+ */
+int sci_relinquish_resources(struct domain *d);
+
+/*
+ * SMC/HVC Handle callback.
+ *
+ * SCI driver acts as SMC/HVC server for the registered domains and
+ * does redirection of the domain calls to the SCI firmware,
+ * such as ARM TF-A or similar.
+ */
+bool sci_handle_call(struct cpu_user_regs *regs);
+
+/*
+ * Dom0 DT nodes handling function.
+ *
+ * Allows SCI driver to detect DT nodes it need to handle and decide if
+ * those nodes need to be provided to Dom0.
+ */
+bool sci_dt_handle_node(struct domain *d, struct dt_device_node *node);
+
+/*
+ * Dom0 DT generation finalize.
+ *
+ * Called at the end of Dom0 DT generation, so SCI driver can perform step=
s
+ * to modify DT to enable/disable SCI functionality for Dom0.
+ */
+int sci_dt_finalize(struct domain *d, void *fdt);
+
+/*
+ * Assign DT device to domain.
+ *
+ * Called when DT device is passed through to guest, so SCI driver can ena=
ble
+ * device access to the domain if SCI FW provides "Device specific access
+ * control" functionality.
+ */
+int sci_assign_dt_device(struct domain *d, struct dt_device_node *dev);
+#else
+
+static inline bool sci_domain_is_enabled(struct domain *d)
+{
+    return false;
+}
+
+static inline int sci_domain_init(struct domain *d,
+                                  struct xen_domctl_createdomain *config)
+{
+    return 0;
+}
+
+static inline int
+sci_domain_sanitise_config(struct xen_domctl_createdomain *config)
+{
+    return 0;
+}
+
+static inline void sci_domain_destroy(struct domain *d)
+{}
+
+static inline int sci_relinquish_resources(struct domain *d)
+{
+    return 0;
+}
+
+static inline bool sci_handle_call(struct cpu_user_regs *regs)
+{
+    return false;
+}
+
+static inline bool sci_dt_handle_node(struct domain *d,
+                                      struct dt_device_node *node)
+{
+    return false;
+}
+
+static inline int sci_dt_finalize(struct domain *d, void *fdt)
+{
+    return 0;
+}
+
+static inline int sci_assign_dt_device(struct domain *d,
+                                       struct dt_device_node *dev)
+{
+    return 0;
+}
+
+#endif /* CONFIG_ARM_SCI */
+
+#endif /* __ASM_ARM_SCI_H */
diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
index 6081f14ed0..4095171533 100644
--- a/xen/arch/arm/vsmc.c
+++ b/xen/arch/arm/vsmc.c
@@ -12,6 +12,7 @@
 #include <public/arch-arm/smccc.h>
 #include <asm/cpuerrata.h>
 #include <asm/cpufeature.h>
+#include <asm/firmware/sci.h>
 #include <asm/monitor.h>
 #include <asm/regs.h>
 #include <asm/smccc.h>
@@ -232,7 +233,7 @@ static bool handle_sip(struct cpu_user_regs *regs)
     if ( platform_smc(regs) )
         return true;
=20
-    return scmi_handle_smc(regs);
+    return (scmi_handle_smc(regs)) ? true : sci_handle_call(regs);
 }
=20
 /*
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tr=
ee/dom0less-build.c
index badc227031..aaa5e9b22c 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -228,6 +228,10 @@ static int __init handle_passthrough_prop(struct kerne=
l_info *kinfo,
     if ( res < 0 )
         return res;
=20
+    res =3D arch_handle_passthrough_prop(kinfo, node);
+    if ( res )
+        return res;
+
     /* If xen_force, we allow assignment of devices without IOMMU protecti=
on. */
     if ( xen_force && !dt_device_is_protected(node) )
         return 0;
diff --git a/xen/include/asm-generic/device.h b/xen/include/asm-generic/dev=
ice.h
index 3bd97e33c5..cb13f7faea 100644
--- a/xen/include/asm-generic/device.h
+++ b/xen/include/asm-generic/device.h
@@ -18,6 +18,7 @@ enum device_class
     DEVICE_IOMMU,
     DEVICE_INTERRUPT_CONTROLLER,
     DEVICE_PCI_HOSTBRIDGE,
+    DEVICE_FIRMWARE,
     /* Use for error */
     DEVICE_UNKNOWN,
 };
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index e2412a1747..e7a17ede3e 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -327,6 +327,8 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
 #define XEN_DOMCTL_CONFIG_TEE_OPTEE     1
 #define XEN_DOMCTL_CONFIG_TEE_FFA       2
=20
+#define XEN_DOMCTL_CONFIG_ARM_SCI_NONE      0
+
 struct xen_arch_domainconfig {
     /* IN/OUT */
     uint8_t gic_version;
@@ -350,6 +352,8 @@ struct xen_arch_domainconfig {
      *
      */
     uint32_t clock_frequency;
+    /* IN */
+    uint8_t arm_sci_type;
 };
 #endif /* __XEN__ || __XEN_TOOLS__ */
=20
diff --git a/xen/include/xen/dom0less-build.h b/xen/include/xen/dom0less-bu=
ild.h
index 408859e325..faaf660424 100644
--- a/xen/include/xen/dom0less-build.h
+++ b/xen/include/xen/dom0less-build.h
@@ -62,6 +62,9 @@ void set_domain_type(struct domain *d, struct kernel_info=
 *kinfo);
 int init_intc_phandle(struct kernel_info *kinfo, const char *name,
                       const int node_next, const void *pfdt);
=20
+int arch_handle_passthrough_prop(struct kernel_info *kinfo,
+                                 struct dt_device_node *node);
+
 #else /* !CONFIG_DOM0LESS_BOOT */
=20
 static inline void create_domUs(void) {}
--=20
2.34.1

