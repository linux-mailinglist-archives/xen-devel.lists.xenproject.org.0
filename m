Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCD5B17D34
	for <lists+xen-devel@lfdr.de>; Fri,  1 Aug 2025 09:12:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1066877.1431929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhjvf-00053e-OM; Fri, 01 Aug 2025 07:11:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1066877.1431929; Fri, 01 Aug 2025 07:11:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhjvf-00050E-LG; Fri, 01 Aug 2025 07:11:47 +0000
Received: by outflank-mailman (input) for mailman id 1066877;
 Fri, 01 Aug 2025 07:11:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jpGp=2N=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1uhjve-0004LS-2U
 for xen-devel@lists.xenproject.org; Fri, 01 Aug 2025 07:11:46 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7d770e2-6ea6-11f0-b895-0df219b8e170;
 Fri, 01 Aug 2025 09:11:44 +0200 (CEST)
Received: from DU7P191CA0010.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::35)
 by DU0PR08MB9582.eurprd08.prod.outlook.com (2603:10a6:10:44a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.16; Fri, 1 Aug
 2025 07:11:40 +0000
Received: from DB1PEPF000509FA.eurprd03.prod.outlook.com
 (2603:10a6:10:54e:cafe::ca) by DU7P191CA0010.outlook.office365.com
 (2603:10a6:10:54e::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.16 via Frontend Transport; Fri,
 1 Aug 2025 07:11:40 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509FA.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.8
 via Frontend Transport; Fri, 1 Aug 2025 07:11:39 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DU0PR08MB9653.eurprd08.prod.outlook.com (2603:10a6:10:449::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.12; Fri, 1 Aug
 2025 07:11:07 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%2]) with mapi id 15.20.8989.015; Fri, 1 Aug 2025
 07:11:07 +0000
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
X-Inumbo-ID: c7d770e2-6ea6-11f0-b895-0df219b8e170
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=x4VHkDqyN71OnMrJJHPHimQb/FkqJvEyqp4GVU/rJLpUnqS7B/EdLrVjC2aL3jjCdFD6PmtljGN/Kv9Os06KIW5qRgwSevBg9F4CV7s8Y31p1I062kOWPAyiin+UHG16fqQj8wxewdEy0vv9zpTy/K7HI2WtFsGvtWqL8muZEUSTTL+RIZd8qWJkdz1zmeUeFbVKZvCY30z0AY5WhXbAYLBHvjo+C97C4REPOlhj2TVsMObyD+416OODmfN0Hpa0BTHG3Z7g7g+dbIQzWLcHiOqACzM+85hwlfmwC3DQ+HzpyDxCEPXcNgoKj2I5R69fQBJGTJ3dEqUe5akFeiSQtA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L6uLJbDflK3g1YEpqtCmMHOkZCFWEKxWzHhlvwB/FTk=;
 b=KuGvURduKQ7kriPg1n8luIHBI9Kdx4xQABdR4bNTsqu2wgIscRmrVdLgV2OHXF1R8/O0schHymnVw63Co3QSGUHvVBoSgvgCNzzuaOojjqKrm6SMExa7vXQ61BfZadF6BJFWE0WyZhGgJ2lZkbAMb8o3wAoug55GgprVlMMHjQke+dxTpjn6sKwKR7HQBSFT1SsFhBiPqR3iKPQInceBL006qjjlM1NWlw5iqYHixzlD7+R924WM2KxY44JL5aFM1MwwHFoYOwB12SsEXC0/o48FufLtDZ9w8yz2xk3YaSjOI0y2xDA5eCyImwo27Voa304vU1nCxeG4lcmgRQ9rNA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L6uLJbDflK3g1YEpqtCmMHOkZCFWEKxWzHhlvwB/FTk=;
 b=K71QhJDpZN+fs99ZtatY4nrkVSF3M0kIs9oX8ZCQ6Bk7gkCtOMbdKSSjjXhzk6R2v8eV6j+gUCfCF71enVmVchFTtgQm0GwMB2oIfjVENGuFdej+rUZ/klVNKcLo2E2lZYA6r7t5B69HVCOZkfQghH7xDCIsmYHz2yAYNK7eojc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fyIZbIxjmLwiRU819OUPNcG8ImLPVDuEO1xTtZx7Sep32X6xt/YqfKtR0C81hGbimH+9EPc6AVjziT7vbw7Q0AtWqVvQta9k4gaue1kAPy097GRqblwDzUPyj+NoQPirWAJLawFXuoAFngrC9TGQd1CzsF6EbphAl1heQCVRXrto61Ijeq5fVBBqvPNA0J2ZkjAl4M2Ps5na2cbIMh2y6yFhkDm6ix2BLvtF4fnU4xbK4zh4wKAY13HtapbxSe9YToQlCVGldYLSWQKU8ClvKTuHmej1tg+1zQsWC74WtxwPpkm4lnCuY/uIgZjqM+Qiuqy/2vOxNZvHhYgORPGxcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L6uLJbDflK3g1YEpqtCmMHOkZCFWEKxWzHhlvwB/FTk=;
 b=kvBhnMXIQjx0RcHx3j3QOvWTMGVo+ypAhXzgKSMuwHd3hdZLqN3yylpghm/16DZhMscC9Zv8y7GUsi7P6tnDkYXtryGumdX3LK6I/YOig6it2E1mxh3nj9SkFgIqPnLJmgL5sTGxtBzjm0rh+JCYp5W8R5hCQdRwgOFJS1eruCIg7wJZ0NU02FItp2JMfwBhpFL4L4KTgiUN6CK5bpIi+03fbIUh5T0elocXf+IZjWpvS6hMdQILaueXDxQQNZLdcsDGHzoQ9ZgZZCXIikW81afyyt6/0pXtArPak/PI3G4H+/0HDMDnC8SLgBQvH8c4kS2mQMwTNx0o9sk2czOQAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L6uLJbDflK3g1YEpqtCmMHOkZCFWEKxWzHhlvwB/FTk=;
 b=K71QhJDpZN+fs99ZtatY4nrkVSF3M0kIs9oX8ZCQ6Bk7gkCtOMbdKSSjjXhzk6R2v8eV6j+gUCfCF71enVmVchFTtgQm0GwMB2oIfjVENGuFdej+rUZ/klVNKcLo2E2lZYA6r7t5B69HVCOZkfQghH7xDCIsmYHz2yAYNK7eojc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "jens.wiklander@linaro.org" <jens.wiklander@linaro.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v7 5/6] xen/arm: ffa: Add indirect message between VM
Thread-Topic: [PATCH v7 5/6] xen/arm: ffa: Add indirect message between VM
Thread-Index: AQHb9xP63AO3xKXxGUS6VQz+IbmVObRNeLKA
Date: Fri, 1 Aug 2025 07:11:07 +0000
Message-ID: <24F6DA9F-7FFD-407F-A695-420F0EF5242D@arm.com>
References: <cover.1752754016.git.bertrand.marquis@arm.com>
 <1a5ef965eca870918a120221667e2f26c7604afc.1752754016.git.bertrand.marquis@arm.com>
In-Reply-To:
 <1a5ef965eca870918a120221667e2f26c7604afc.1752754016.git.bertrand.marquis@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|DU0PR08MB9653:EE_|DB1PEPF000509FA:EE_|DU0PR08MB9582:EE_
X-MS-Office365-Filtering-Correlation-Id: 78d0bf0e-c725-4151-9f38-08ddd0caa938
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|10070799003|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?hD44Xg7IyT5iaxgvEWmJj/J+STjTpi+duvdMcysiM0B3ca88aUHZL/EQImeo?=
 =?us-ascii?Q?kDqH7capkheUnNIHgkwmsPYdszKzti1MHMs2Ed7/6FLo4vm6YxwW13VfBCIK?=
 =?us-ascii?Q?k49mYgokx9qcDPy0FkILAgcOHoJoMlmnIGYEKgpYOvUXpDDrpH0Tg49rY+aK?=
 =?us-ascii?Q?MDpTzo+hQm0H8FReWk7+lV861RejypkXCAsU7st1Gx0/jHhXigcf0ofL8Eh7?=
 =?us-ascii?Q?Z5UWh8sMN7bJ7dofQzAIsJPTumUEHupHJQzRx7TDi9e57ZX0n4dQfhovweIl?=
 =?us-ascii?Q?/s5Zy+hKUJpcp0eY6Ks0VrHoBV/CZ2j52NcaZGgHEF6UQS7aekSUUQIihAgo?=
 =?us-ascii?Q?BGdZDL6NaHiw/Wpgu54KdQWbFJxYx9sWjiZfBZkt3UKqM/WPGVkWf71au8CF?=
 =?us-ascii?Q?tyeM79220sY5bqBLPoldQQv7CyepKb/9aFW/XOyGC2SzYJiQ/25Oaefozu8W?=
 =?us-ascii?Q?Fh2giLoF99/SvRv0BXqUHbxAJyHaOmYtLSBLZMRgt4lxUn551UHHjpb8rezU?=
 =?us-ascii?Q?7MsU0aoQsaa39whpyE+fspFxTl5Ajce529HDVMahWkia0jjfBfDILxvPoFYc?=
 =?us-ascii?Q?Pa9PF6LCCRUIJKZzU2PvEomgfSRDQR4MYzRIRGPT2Kf6TIsOVnBcWUyXMgbo?=
 =?us-ascii?Q?4pRR1AbMQkD6H29NHxyDiiCUVyZydD9HZT4dAMtLpAsloMOonXBAo5Eql3D3?=
 =?us-ascii?Q?WbX/e+Fjk7KIcObir8xYc8JXmek+Qm54Hu9kKkVO6LJbwvM7n4Y7YQm5t4k1?=
 =?us-ascii?Q?UOMGpO0jGZrMTbB/gsor9B3R9BU2W7lIeigVpOz0bD35GU7+qzZpWeVULs9q?=
 =?us-ascii?Q?KTuun6mjfi4sDCiBHLRRcKWf5WwlA+Xahgdonz/+uRjR8Wa947H728lSaGpF?=
 =?us-ascii?Q?/qvtFfZ0hc7ae8RaN3ATUF4ULnd5VfMaQI2BOzQoOTg1bzEXoqCEZ08cgaD6?=
 =?us-ascii?Q?mFTbj3x0L4S+16M8PuwC/SWfNomb0AlYNJ9BYnNMhC74JQOiDFE6X/VBGD5I?=
 =?us-ascii?Q?X1HeigFhsCgUEfJ4RwKd/vbQFD+1ZiYGebW6KQ1TM+NaO0U6kV10fyGPyzAV?=
 =?us-ascii?Q?v1q1pDc/8FhL8XxCvKIgM+4FVRfixUm0PovWsv4h2ny1vMVZSlzzUNZ+Wol8?=
 =?us-ascii?Q?Jl+aE1JU3wshZx/AOHEtuayKoWPQGaZJVbzlkS/kA4M5eEyQLUJRFTsUdZC0?=
 =?us-ascii?Q?PWq8kS9Zkq0H+3KVOdPf7Zt0ebALjivL5Q5irEdvunVZPln0Bk+EHfc+JoeA?=
 =?us-ascii?Q?3JfYtr79v/J1Bo0Vqe7bVdDslG4m+5NG8wx7n3gcAeQAnizz1qxRudlSE4Yj?=
 =?us-ascii?Q?jnFg9aEoAgjZlUzL5E/eL+pdU+xK4Az/+xiBbUwTshu8UesLWcSt6YIqMR2y?=
 =?us-ascii?Q?tFYHSmoxAtMbbBXRPKpiZGIwhGPGfwkjAT1rVMaAWPJeyQ1f9T3Q2YwADIOW?=
 =?us-ascii?Q?Ognw3vPe7YPxLROyjP+wCHPRnaBEd8tKLB9Xggf2Yhz/wNe6Yg/hUw=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BC86B44259B3694886B56694063C3308@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9653
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	94e5ccd8-bfc3-4deb-242a-08ddd0ca962c
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|82310400026|36860700013|1800799024|376014|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7iJw/Tyge+y3WFTnCI8i7bvXZZQJsqAwtNtpxsth5ty1T5AQTW7JzAfrO8+w?=
 =?us-ascii?Q?ifFLA+wMcVyMc6iGXlmWm7ULtr0Hi8NZZEU5LDB1RnL11YeiAQU59L8he5O8?=
 =?us-ascii?Q?jfvvvKjuqeZeWK16QNXfxYcp1qTuJNA+PSjRWxTFlDbAkHeu+6Igs1LqzJCh?=
 =?us-ascii?Q?Ce9I12rqW60O4QcKsB9DE0cuBEUkHQQ0Q2NJiCwuxA7dlwbKcrQR7z1U4HhP?=
 =?us-ascii?Q?BumVWHaqt2q39SkgScjSCwh9hpxGOoFhJ7NrDmKtA+QasYTr2Ze0v15lzxdl?=
 =?us-ascii?Q?Be9xRPCogaAHfpdxWe1aTLbQmTT3P5YRoE/tTj3I/XfrRZurrVey4s5btuQL?=
 =?us-ascii?Q?cELfZ+8SIk96MFKJYac2khaKKA/1Nfu1pq76ZEa6SOVdNIxApbDmmKd6MSln?=
 =?us-ascii?Q?iADphv1kKELz829WjZvCg6rgYFMBBKfBdkfS+OlWuKoJNNJM/wuc2t8AT7dA?=
 =?us-ascii?Q?LlPSrL/iAOh2S4wYbFrR3bNVqsAGenrSaqnb0Ybk6OL0AAWe7QFroEOcoW2L?=
 =?us-ascii?Q?mCEIY1zbuaeLdC6ams6aG8nZMeHdJ0q7vbGVbnQs5m2uHtfqOPW3r/Yx7/M5?=
 =?us-ascii?Q?n1dUj9PHk0uEp0tv/m3/WXhFvKYb4ki0Ha7q6kUQ6OiT7MJIcu67UeUmjb/e?=
 =?us-ascii?Q?S1FgCnZ9e+HtnaTn60SiaDU6QmDc4V/r3LFm+0uPR3gE/hNvOv0dmp1zvYRn?=
 =?us-ascii?Q?kZOqqItiY5ONNtqiVEwoTFJHhPoDj/mYvRVgd/qlI/u7ocxWgDlH5Rh7uYuP?=
 =?us-ascii?Q?wzZ5WeWl6SUkrD5tMoEf8pxv7FcLAScx54r62wRWTPkf+yP0wJS5gLfcct7K?=
 =?us-ascii?Q?L9gTFihuX28ERSbbGUNH84x4Lux1JJ6GTHNVFEFrd1B5Ipi6jL6y8Ucu7vC8?=
 =?us-ascii?Q?vt6uOUT/Lxmu4Ad1rx1c2uj65PMJQRAoPcPTQvULeJ7yej1BSmkZW1ss/5wq?=
 =?us-ascii?Q?OtN9pYJLAcrqMjdnJxDtAG4r+2kbzGCzvJuQaiAi63XdmIfEbcwTzhBTdvcO?=
 =?us-ascii?Q?kq4jk5oBumUUk/YFBl0L03qNFnGy/jjG0J3GDjLtLA22xAc729yOW21srinD?=
 =?us-ascii?Q?Dw9VT6fAjDFsApAofTWwcXNFB4Zu+khb/MFZ9LNGLH3d5UMhebYuryVEOTXP?=
 =?us-ascii?Q?eN1i7rUE+1/hJjPfT2FZV6+2TgO9sLEllZ0zueunO0uPoU1ZPiBPzDeg8lKl?=
 =?us-ascii?Q?1iRUsiHsPOQbjUZy+ZBeVpkBvR4FzGHMossxNvoHcIJzX8/3EhTSmg1o6FXR?=
 =?us-ascii?Q?LU2WLACSFUxp6ET7ba2VulzlYKCL6WEbf2Dgj0u/ywneljLR49t/b+5m1NID?=
 =?us-ascii?Q?RWFo9DZha1/BaMnBMInGFm0p96KoY3SdgV46t/DZiLgEl/OvZ6NMGZFA7n8z?=
 =?us-ascii?Q?8LukztBhpEZD4hYYplwA6Lzirbvj+0tVO5Ihf5lRb37F+rse1u+PuWwWfHzM?=
 =?us-ascii?Q?PokT4E/u3oL6dtPCkFN2RA6LlldmHQFlipuuOn2zEsMqrBPU9TUSjUZ8vwka?=
 =?us-ascii?Q?ntCQBt2yENm1m75VlteS4VCx8UxIC5/JiyTY?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(36860700013)(1800799024)(376014)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 07:11:39.6424
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78d0bf0e-c725-4151-9f38-08ddd0caa938
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9582

Hi,

A gentle ping for someone to review this :-)

Thanks
Bertrand

> On 17 Jul 2025, at 14:11, Bertrand Marquis <Bertrand.Marquis@arm.com> wro=
te:
>=20
> Add support for indirect messages between VMs.
> This is only enabled if CONFIG_FFA_VM_TO_VM is selected.
>=20
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
> Changes in v6:
> - fix code alignment (Jens)
> - add Jens R-b
> Changes in v5:
> - Prevent potential overflow in send2 handling (Julien)
> - Only use page_count with rx lock acquired
> - Fix an issue where send2 between VMs was not doing the copy from the
>  tx buffer but from a wrong location in the stack. This bug was
>  introduced in v4 when switching to a local copy for the header.
> Changes in v4:
> - Use a local copy of the message header to prevent a TOC/TOU possible
>  issue when using the payload size
> Changes in v3:
> - Move vm to vm indirect message handling in a sub function to simplify
>  lock handling and make implementation easier to read
> Changes in v2:
> - Switch ifdef to IS_ENABLED
> ---
> xen/arch/arm/tee/ffa_msg.c | 117 ++++++++++++++++++++++++++++++++-----
> 1 file changed, 102 insertions(+), 15 deletions(-)
>=20
> diff --git a/xen/arch/arm/tee/ffa_msg.c b/xen/arch/arm/tee/ffa_msg.c
> index ee594e737fc7..c20c5bec0f76 100644
> --- a/xen/arch/arm/tee/ffa_msg.c
> +++ b/xen/arch/arm/tee/ffa_msg.c
> @@ -88,43 +88,130 @@ out:
>                  resp.a7 & mask);
> }
>=20
> +static int32_t ffa_msg_send2_vm(uint16_t dst_id, const void *src_buf,
> +                                struct ffa_part_msg_rxtx *src_msg)
> +{
> +    struct domain *dst_d;
> +    struct ffa_ctx *dst_ctx;
> +    struct ffa_part_msg_rxtx *dst_msg;
> +    int err;
> +    int32_t ret;
> +
> +    if ( dst_id =3D=3D 0 )
> +        /* FF-A ID 0 is the hypervisor, this is not valid */
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    /* This is also checking that dest is not src */
> +    err =3D rcu_lock_live_remote_domain_by_id(dst_id - 1, &dst_d);
> +    if ( err )
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    if ( dst_d->arch.tee =3D=3D NULL )
> +    {
> +        ret =3D FFA_RET_INVALID_PARAMETERS;
> +        goto out_unlock;
> +    }
> +
> +    dst_ctx =3D dst_d->arch.tee;
> +    if ( !dst_ctx->guest_vers )
> +    {
> +        ret =3D FFA_RET_INVALID_PARAMETERS;
> +        goto out_unlock;
> +    }
> +
> +    /* This also checks that destination has set a Rx buffer */
> +    ret =3D ffa_rx_acquire(dst_d);
> +    if ( ret )
> +        goto out_unlock;
> +
> +    /* we need to have enough space in the destination buffer */
> +    if ( (dst_ctx->page_count * FFA_PAGE_SIZE -
> +          sizeof(struct ffa_part_msg_rxtx)) < src_msg->msg_size )
> +    {
> +        ret =3D FFA_RET_NO_MEMORY;
> +        ffa_rx_release(dst_d);
> +        goto out_unlock;
> +    }
> +
> +    dst_msg =3D dst_ctx->rx;
> +
> +    /* prepare destination header */
> +    dst_msg->flags =3D 0;
> +    dst_msg->reserved =3D 0;
> +    dst_msg->msg_offset =3D sizeof(struct ffa_part_msg_rxtx);
> +    dst_msg->send_recv_id =3D src_msg->send_recv_id;
> +    dst_msg->msg_size =3D src_msg->msg_size;
> +
> +    memcpy(dst_ctx->rx + sizeof(struct ffa_part_msg_rxtx),
> +           src_buf + src_msg->msg_offset, src_msg->msg_size);
> +
> +    /* receiver rx buffer will be released by the receiver*/
> +
> +out_unlock:
> +    rcu_unlock_domain(dst_d);
> +    if ( !ret )
> +        ffa_raise_rx_buffer_full(dst_d);
> +
> +    return ret;
> +}
> +
> int32_t ffa_handle_msg_send2(struct cpu_user_regs *regs)
> {
>     struct domain *src_d =3D current->domain;
>     struct ffa_ctx *src_ctx =3D src_d->arch.tee;
> -    const struct ffa_part_msg_rxtx *src_msg;
> +    struct ffa_part_msg_rxtx src_msg;
>     uint16_t dst_id, src_id;
>     int32_t ret;
>=20
> -    if ( !ffa_fw_supports_fid(FFA_MSG_SEND2) )
> -        return FFA_RET_NOT_SUPPORTED;
> +    BUILD_BUG_ON(sizeof(struct ffa_part_msg_rxtx) >=3D FFA_PAGE_SIZE);
>=20
>     if ( !spin_trylock(&src_ctx->tx_lock) )
>         return FFA_RET_BUSY;
>=20
> -    src_msg =3D src_ctx->tx;
> -    src_id =3D src_msg->send_recv_id >> 16;
> -    dst_id =3D src_msg->send_recv_id & GENMASK(15,0);
> +    /* create a copy of the message header */
> +    memcpy(&src_msg, src_ctx->tx, sizeof(src_msg));
>=20
> -    if ( src_id !=3D ffa_get_vm_id(src_d) || !FFA_ID_IS_SECURE(dst_id) )
> +    src_id =3D src_msg.send_recv_id >> 16;
> +    dst_id =3D src_msg.send_recv_id & GENMASK(15,0);
> +
> +    if ( src_id !=3D ffa_get_vm_id(src_d) )
>     {
>         ret =3D FFA_RET_INVALID_PARAMETERS;
> -        goto out_unlock_tx;
> +        goto out;
>     }
>=20
>     /* check source message fits in buffer */
> -    if ( src_ctx->page_count * FFA_PAGE_SIZE <
> -         src_msg->msg_offset + src_msg->msg_size ||
> -         src_msg->msg_offset < sizeof(struct ffa_part_msg_rxtx) )
> +    if ( src_msg.msg_offset < sizeof(struct ffa_part_msg_rxtx) ||
> +            src_msg.msg_size =3D=3D 0 ||
> +            src_msg.msg_offset > src_ctx->page_count * FFA_PAGE_SIZE ||
> +            src_msg.msg_size > (src_ctx->page_count * FFA_PAGE_SIZE -
> +                                src_msg.msg_offset) )
>     {
>         ret =3D FFA_RET_INVALID_PARAMETERS;
> -        goto out_unlock_tx;
> +        goto out;
>     }
>=20
> -    ret =3D ffa_simple_call(FFA_MSG_SEND2,
> -                          ((uint32_t)ffa_get_vm_id(src_d)) << 16, 0, 0, =
0);
> +    if ( FFA_ID_IS_SECURE(dst_id) )
> +    {
> +        /* Message for a secure partition */
> +        if ( !ffa_fw_supports_fid(FFA_MSG_SEND2) )
> +        {
> +            ret =3D FFA_RET_NOT_SUPPORTED;
> +            goto out;
> +        }
> +
> +        ret =3D ffa_simple_call(FFA_MSG_SEND2,
> +                              ((uint32_t)ffa_get_vm_id(src_d)) << 16, 0,=
 0, 0);
> +    }
> +    else if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
> +    {
> +        /* Message for a VM */
> +        ret =3D ffa_msg_send2_vm(dst_id, src_ctx->tx, &src_msg);
> +    }
> +    else
> +        ret =3D FFA_RET_INVALID_PARAMETERS;
>=20
> -out_unlock_tx:
> +out:
>     spin_unlock(&src_ctx->tx_lock);
>     return ret;
> }
> --=20
> 2.47.1
>=20
>=20


