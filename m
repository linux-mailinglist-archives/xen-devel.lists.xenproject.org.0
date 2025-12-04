Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B468BCA24F6
	for <lists+xen-devel@lfdr.de>; Thu, 04 Dec 2025 05:23:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1177248.1501591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vR0sO-0001Uk-U6; Thu, 04 Dec 2025 04:23:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1177248.1501591; Thu, 04 Dec 2025 04:23:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vR0sO-0001Tb-Qp; Thu, 04 Dec 2025 04:23:32 +0000
Received: by outflank-mailman (input) for mailman id 1177248;
 Thu, 04 Dec 2025 04:23:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OurU=6K=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vR0sM-0001TV-Lh
 for xen-devel@lists.xenproject.org; Thu, 04 Dec 2025 04:23:30 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fabcd8b7-d0c8-11f0-980a-7dc792cee155;
 Thu, 04 Dec 2025 05:23:27 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 DM3PR12MB9351.namprd12.prod.outlook.com (2603:10b6:8:1ac::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.17; Thu, 4 Dec 2025 04:23:22 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2%2]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 04:23:22 +0000
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
X-Inumbo-ID: fabcd8b7-d0c8-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CYQXWhCvl+PVnX8ZrsBsbwbZq75awJuiAZztayIjvq1CHmaKkGrCescybdsMM8q2FGEHVn+5fESeacamb9n2o66SRnNjrDbeCHH//HA4ey6iy4NICYX9H7bP7RK9BD0jCoKh9NTzGg6mc/xjDAudRYQOvPqdoivoyiBK9B4KPIIqsdj08KI/nT/9iJxNhilvPOquxaino0ITSgIwPVIO1lpNnkqXXNChwycBGLbSueXF25MFdk23b/EieHQeEZg2vJBGFsnSl9jDGHM55g3+mZQIq2R59t7W9Il4O6C+xDqdygBoiT/LuRXSUGm5Hi75d2EuAK3yWo7tudBRj1uZxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6lENOaPQIzFqzDTuMRuVnqLQvMfY2zoaYbAAVvrO0M=;
 b=CqH9ES+I8BGvSN2fDE1OU18syVOLw2Lyr31jC/H6IvLIwbShoCSlCxzdrzZdjrjS0ckgIo3GXbBtE+4lrZYNhxNcJBZ4qqtH4u+QHS1fLWvzUU/aV99XR4Sxf5jNnEXy6sOe9z1LqnhtKVEUU83h4SLR6F5lDMYZ5vTJcGS7xk7a0C9r6HfaB14Vr/NVm8Joj+Dc7Q/jARtbPpuJJjlJnczGyVCrYOr+98x0YyVGvev8hkBFgZCseFVKeqvWhW1exK1WEdHdhzDnqW/V58KzVdM7Jx4q3pX4txygRlLFYbJPUEsmzHHkd79w5PGgeB+8fzoMKE7H/8Kl66bRYEmDjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6lENOaPQIzFqzDTuMRuVnqLQvMfY2zoaYbAAVvrO0M=;
 b=rvUYGreAn5OTd1RbY85r6N5bM3KyXGs+GOCQiM9FffK0cV49wXuaRAypHrgOAuBuIsiMWJKQz4TClxpOjCTiUvL6Z87E3V/oX4PT/0g3P63so2V6B56WN1hLM1kb/R75CEOFKyziPtMA6kbnfla6CgA9Jq/s+6tFKVTAQ8byrIU=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, "grygorii_strashko@epam.com"
	<grygorii_strashko@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, "Orzel, Michal"
	<Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 20/24] xen/x86: wrap x86-specific domctl-op with
 CONFIG_MGMT_HYPERCALLS
Thread-Topic: [PATCH v4 20/24] xen/x86: wrap x86-specific domctl-op with
 CONFIG_MGMT_HYPERCALLS
Thread-Index: AQHcWtXmS51F6WJwgE2h9vzl8XgXOrUDpDaAgA1N7rA=
Date: Thu, 4 Dec 2025 04:23:22 +0000
Message-ID:
 <DM4PR12MB84519D61527BF82117F65CAEE1A6A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
 <20251121105801.1251262-21-Penny.Zheng@amd.com>
 <de34ea34-1558-46b3-b5a6-79edd60ad45f@suse.com>
In-Reply-To: <de34ea34-1558-46b3-b5a6-79edd60ad45f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-12-04T04:23:15.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|DM3PR12MB9351:EE_
x-ms-office365-filtering-correlation-id: 469a90ea-740f-41a4-a942-08de32ecdc65
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?Y1h2U3h0NkxrYi9SMTRydUZ0bnhSMWNja2hYamlnSWNoYjUwL3IyY1hSUitF?=
 =?utf-8?B?QUZEaWRpTE5MeEJFTE11cFRiRHl6NGs3QVVUWXZMTEMwYkF3WWx3RERsN1Nm?=
 =?utf-8?B?UUh0dW9qellLUU8xRHNIbmFJSnhxb1NvOEVzeWdkeHN1akxGK3Q0SHprNStV?=
 =?utf-8?B?bzNXYkFRNjN0dXBjODExUzhVQmZjZHhsV1FRTjZOU2FHMGRtejNPWXBlNSt3?=
 =?utf-8?B?VlgyQlV5SXlXNTB4Qmtna2FUVHIyUm1oSy9CcDkwZVUxdWZlWkUxU3dhMklV?=
 =?utf-8?B?dXRFbGhRK0owT1RXN1c4NUFmeFAzYklFUk1aRXlvYVNYQUN6amZEcEttNGM4?=
 =?utf-8?B?S0g0VXQ2YXA2L1ptODUvaHVvK2FGdlBVZmg4NjI3R0o0U0tGUEM3Z1oxUlBW?=
 =?utf-8?B?REVzZ2lCUjEyTFBoZ2drVFBmOGFmZ0wzYmZ3ajZRWWE2eUllWHNNWitCSHI2?=
 =?utf-8?B?VWxoSGd0ZERUTlZHNVpiU0drVldOSFBSUGRXamNMakJsTW03ZzdXakFZWlpU?=
 =?utf-8?B?N09MZTd5VGMxbzFncDFhNXJFdGJXYUVkTUx2TktFTDM3ZkFzVTg0UHZlTnhV?=
 =?utf-8?B?OXNaVEREZTl1Nk1iU2tUbGtxSnNLQnE5azZxVHJYREhoWUNlWDJlMlZtMFhU?=
 =?utf-8?B?MVk5enBhUVdsK2hCVVk4M2ZHNWZQd2Z5dzJjYThCK1JrVHhYNUxGd0lyanBi?=
 =?utf-8?B?L2w2NzZicTBxZ1ZFbjlJTEU1QkxRYUx1Ni9zZ0RnUGRGTWdjclFyQWppNElJ?=
 =?utf-8?B?bU5JMXJKYW1TVkx6Z3pnVXhES2JsaVpZZFFOQzFFV2VYRWpHUCtYZ3cxVW9Y?=
 =?utf-8?B?dXdJWjBzV1NJcHRoeUMwUVhMak9uSkJjTDJYQVptQ1U5cDhNMytvUitNZi8w?=
 =?utf-8?B?Y1JsNkhRNDFyT1NKcTdYdGtuMlQwTG9vVTJTUUNWM2Ric1BKWHJoYndFZTRS?=
 =?utf-8?B?V3dwbjc4aEZWVjJVTktKNkpMclFEM2p3WURGZ3N5UVRWZnU5anZZUXJ6UVhW?=
 =?utf-8?B?eFgrNjR4TllhZE9wNmUrR1hzT2dTK2ludThVTUkvazJzQWw3QmVLaVUwQnh6?=
 =?utf-8?B?UUkvMlZZK09peXlyM01HcGFHZzBwY0JhVTBVaUtiSWorSlZ5cmtOTDk4bHhz?=
 =?utf-8?B?VVRNTElKSUdxK0tSTmg2UDJaSUJ6VFBFNjFTRlh1b2llUUk2dXZpS0orV0dQ?=
 =?utf-8?B?eWRnd3NwWTBaeGZVMVFlb0xPWU5DZmhjUWlrVnpFMUhrOWx0RnkxREkvN1hE?=
 =?utf-8?B?a3pxZ2s5dzN3ZDY1dnlhMTlhVU1rdjVlaksvSGh4REkrdTBFcGhJMmZXVHhs?=
 =?utf-8?B?akl6cCtJU1o0NCs0MTFWM0dNdXVyYmh0RkFZTU5pQktYNlI1ZHFLVWUyTk5F?=
 =?utf-8?B?dE0vd3Awbnh1bFZtUk5xWXJLaDAzOE9WUkJ4cFBDZFd2UFAvK2VmZHZPWVpr?=
 =?utf-8?B?OThYNjJtd1IrcnB2djVLT0pqN3BLdTBpeFhvbUQzTmFTMDE2a0crVlk4a2RS?=
 =?utf-8?B?djZPUVYzWDRWOFk2eHE3YVVma1BuRWFLQjltU0duMGhFQVRmb1B6aGpKa09o?=
 =?utf-8?B?b0F0VVJLS1FkMm9XZ2RPKzhUZzBBNnB2VWJVSUpPS0lJT3p1WUFCTDB6OW1u?=
 =?utf-8?B?cFdZNy9tODE2emNreis3bk5ITkRqN0wvcStQeVQ5c3dRK0RHRm9aQlhHNTgw?=
 =?utf-8?B?Z043dVhEdm9HWTFmYzZLWmRKWDVtZ3Z2cms5MXI5bjZ0cThlVzlSZmRYcEJ5?=
 =?utf-8?B?ZFVKQ1ZHbDB0WDZoOFA3Z1pDYTdreXdwZmlWWTdkRldWU1ovUUZSY2xkZzg1?=
 =?utf-8?B?VXNTdGpqd3l2Tkx1WU1yaTdWUWZTZVROTSt1MVJrZUEraWdXcXg1RUFSRUdj?=
 =?utf-8?B?eE1JWFEwTVFwM2hndmZqUVJXRDB1UGRKK2NpTThBS3VLcE50V0QyY3BJcUhi?=
 =?utf-8?B?OGFvUlZpU3hCYit6L2tydUV6NEYzOVFXZWNvUXlqb2hQd2JTTWVyNXJvOFlM?=
 =?utf-8?B?YmpYL25nOFlMY3ZwNUUxeTM5TVZxcU4rUzMxbmwxR1g0NkNac1R3V01pWjVt?=
 =?utf-8?Q?0/Z3KC?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dTRLMWcrdEN2TG5rZlFWcnFVOXczc3JNOVVUTGtxcWJqeFpTQk1Db0xzL2RN?=
 =?utf-8?B?ZVZwT05nMExrTjlvQXY1dW83UHFWNGdrM2d1QWRkTkc2Q0djZEMyTmxLc1pQ?=
 =?utf-8?B?VGtWUGZGdG1SL1cyQ3d6ck5yOUZqYmZzcVQ2czRoOGRldG00bU4vc1gybVhR?=
 =?utf-8?B?VklBUC9xZmlVNmNyL3RuSHpHS1NUVlZhUzBQVFJ1eVl3SGNieWVwN0JsN1E4?=
 =?utf-8?B?WGJFZnp4TE10NmVJY0JrRzYrQXpCUUE5NHZjbWJkMWoyU1lRVXZHSmtncE1p?=
 =?utf-8?B?dVRiSXNReFhuKzZHNEVDY0ZTY1NQa3FwZ3dGMGR5cjhndEdtcEg5L0RlQmhE?=
 =?utf-8?B?SE9PMFVUeVVYNTZTTnFsZWtDQkY4YXBhRVA1VDlkS3RZSk95U2FLNE5BNGtv?=
 =?utf-8?B?K3Bnc0FmZXR6ZFdnSkVQYzE2S3pCZ3ptYlBsSUt4RGkzYmJQanEvUVFYT0N6?=
 =?utf-8?B?U0p1VTVra2VyU0dMUndZRkdhN0FYUFRBTW5JUVJTdGVxQXM3ZERyd1FYV1kz?=
 =?utf-8?B?THMwZVlURVZYY1k3LzJ6bTVQUWpSQlY4Q3FtdWQvMzl1UW95TXhBUlQzZTVm?=
 =?utf-8?B?TVo2elFralJvY3IrWGRSQnRBa3dZTFpmdVgzd3NjVm1ucVNBK0ZmUm5Ea3Vv?=
 =?utf-8?B?TVhMc0dZeTUvKytmSDRhbVhJTys3SlZ5dmMxREZpdjMvWndMd3JxTGJUd3JH?=
 =?utf-8?B?c1FiRGRiQUVyaHR0ZGtmQS9IVnF0TCt6eHI3YmVDOE84S3hoN3Z2Y3NiWWlK?=
 =?utf-8?B?ZENtN1E5K3ZFamJOaU9KZTR6ZVNJY0tWRzY2ZWljWDRoa09SR2dMK2ZmcHVK?=
 =?utf-8?B?Y2xXZzY5S2U2Vi8rYk0yNStsZWNZbFE5VFVTMkFackR0azFnVWR3WlNVa2I4?=
 =?utf-8?B?L2hmU1lSZzNHM2l2dENNWVU4WWJwWmxTN3o0c1ViQmZIL1hMWE1reFdldUVZ?=
 =?utf-8?B?aDJ2OGovNlZlQmhpeTR4a1Y2cTJBYWhjekxheEFmRzRhWE0zd0VUUzZNZ1U0?=
 =?utf-8?B?S0tFY2JXU3Q3aDd1emJBN2wyN3NXM1pQNjZ6OW1JNktOYWdUS1p4ZytDV2tl?=
 =?utf-8?B?RlBOZi9wWG0rVWtOVmZ5YkZLQndrZ1Vna0lYNWt0Ri9rZjU1NVJyTXhua2VI?=
 =?utf-8?B?WHhJVHcyVHMrUlhUN2lvbklVelN1TXVPTlcycUhVM1JISGJleit5NjV6Y1JM?=
 =?utf-8?B?WVBIWHM1SmNLb2tTREg2a2xJcmRObEFkMFBoNDRMRVFSb05USVUvOUJIUzcz?=
 =?utf-8?B?NDlJYUl6WnV5TXlOcjlNT0wyaEJ3K3BKY3Z4d0gxUlYvMlJZTzNFWEVqZWt2?=
 =?utf-8?B?czQ4akkvVUovNmpybVJJcURQcG5MMjRjaitjeDBPTUVCNkljS2RUSUJ4dGpz?=
 =?utf-8?B?c0wzVkVHSGN4TVlIZU52VHlyKzRzd29zVDNSdyt1QmQxdnVxQmZKTVduMFM1?=
 =?utf-8?B?cDVYOXBzVUxaem43SDhVTzZNRmU3cGt2dlhvTE5Wd01PdmVpa1I1M29XK0Q1?=
 =?utf-8?B?cXRGVWE1SlJnK1l1cDhhMFk2ZEltL3RheURYTnZxNHpFRnE3YnNncm55UFp1?=
 =?utf-8?B?L0dKL2JCbDQ3dmtLM2FrdG80QzBGMEZvS1JocFovcG9tMHpUellZaEVwL1dU?=
 =?utf-8?B?cG8wcTZHT2tvSEhIWmJBK3FGbEw0d0pWbkNCOHRvclJ0cVA0ajBrazdsM29u?=
 =?utf-8?B?NGFVVDlZNmRzdFhudTB0R01NQy9iR3Y1Ulc1U3p6WWM4YTBPeXBjeTdwaUdR?=
 =?utf-8?B?MDY5ZU41bVkybStCQUJWM3UrNDFSckxkZ1Nsb2s2RE94T1NSa0dCOFpuKzlw?=
 =?utf-8?B?WnNjdk0reW5jMjZ4eTlJK0RkWUZMY0xaZXl6NnRHbzBZZDQ0ZXRNQTVKQ2Nr?=
 =?utf-8?B?Y0poS0Rvb1lYcVhyV3pNeE5OeE8xdmNwRWZ1ZkZSTkhUaUY4eHRpcUhyR0hj?=
 =?utf-8?B?OGlBbHRVT0cwVURLSFVrYVJvQkMySDVOTnhyRFFUOGdRa0draTByT2YyQW5q?=
 =?utf-8?B?MklRcWR4SGkzMU05Yms4MXdGM0VyZlkzQVZkUDh4ZC9ZZVZpeS9qay9zQjNI?=
 =?utf-8?B?dU1rNjg4UXhpb2Jzc1BGVUtTNDNHOWwwNlRFOVBoUjZYamc5UzVKVll3NkNE?=
 =?utf-8?Q?doQk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 469a90ea-740f-41a4-a942-08de32ecdc65
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2025 04:23:22.4162
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GG+tLNBeqdFslVTe/83w642iMmWdyk29zfF485axBR2LTYd5oi0GSjcVEkBsSgnZ8fvurhe6nfujUv6l+ghNZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9351

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgTm92ZW1iZXIgMjYs
IDIwMjUgMTowMCBBTQ0KPiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0K
PiBDYzogSHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBncnlnb3JpaV9zdHJhc2hrb0Bl
cGFtLmNvbTsgQW5kcmV3DQo+IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IEFu
dGhvbnkgUEVSQVJEDQo+IDxhbnRob255LnBlcmFyZEB2YXRlcy50ZWNoPjsgT3J6ZWwsIE1pY2hh
bCA8TWljaGFsLk9yemVsQGFtZC5jb20+OyBKdWxpZW4NCj4gR3JhbGwgPGp1bGllbkB4ZW4ub3Jn
PjsgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBTdGVmYW5vDQo+IFN0
YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBEYW5pZWwgUC4gU21pdGgNCj4gPGRw
c21pdGhAYXBlcnR1c3NvbHV0aW9ucy5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCAyMC8yNF0geGVuL3g4Njogd3JhcCB4ODYtc3Bl
Y2lmaWMgZG9tY3RsLW9wIHdpdGgNCj4gQ09ORklHX01HTVRfSFlQRVJDQUxMUw0KPg0KPiBPbiAy
MS4xMS4yMDI1IDExOjU3LCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPiAtLS0gYS94ZW4vYXJjaC94
ODYvS2NvbmZpZw0KPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9LY29uZmlnDQo+ID4gQEAgLTI5LDcg
KzI5LDcgQEAgY29uZmlnIFg4Ng0KPiA+ICAgICBzZWxlY3QgSEFTX1BDSV9NU0kNCj4gPiAgICAg
c2VsZWN0IEhBU19QSVJRDQo+ID4gICAgIHNlbGVjdCBIQVNfU0NIRURfR1JBTlVMQVJJVFkNCj4g
PiAtICAgaW1wbHkgSEFTX1NPRlRfUkVTRVQNCj4gPiArICAgc2VsZWN0IEhBU19TT0ZUX1JFU0VU
IGlmIE1HTVRfSFlQRVJDQUxMUw0KPg0KPiBXaHkgd291bGQgeW91IHVuZG8gYW4gImltcGx5Iiwg
d2hlbiByZWFsbHkgd2Ugc2hvdWxkIHVzZSBpdCBtb3JlPyBPbmUgb2YgaXRzDQo+IHB1cnBvc2Vz
IGlzIHNvIHRoYXQgeW91IGNhbiBhZGQgImRlcGVuZHMgb24gTUdNVF9IWVBFUkNBTExTIiB0aGVy
ZSwgYW5kIGl0DQo+IHRoZW4gd29uJ3QgYmUgYXV0by1lbmFibGVkIGlmIHRoYXQgZGVwZW5kZW5j
eSBpc24ndCBmdWxmaWxsZWQuDQo+DQo+ID4gLS0tIGEveGVuL2FyY2gveDg2L2luY2x1ZGUvYXNt
L3BhZ2luZy5oDQo+ID4gKysrIGIveGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL3BhZ2luZy5oDQo+
ID4gQEAgLTU1LDcgKzU1LDcgQEANCj4gPiAgI2RlZmluZSBQR190cmFuc2xhdGUgICAwDQo+ID4g
ICNkZWZpbmUgUEdfZXh0ZXJuYWwgICAgMA0KPiA+ICAjZW5kaWYNCj4gPiAtI2lmIGRlZmluZWQo
Q09ORklHX1BBR0lORykgJiYgIWRlZmluZWQoQ09ORklHX1BWX1NISU1fRVhDTFVTSVZFKQ0KPiA+
ICsjaWYgZGVmaW5lZChDT05GSUdfUEFHSU5HKSAmJiAhZGVmaW5lZChDT05GSUdfUFZfU0hJTV9F
WENMVVNJVkUpDQo+ICYmDQo+ID4gK2RlZmluZWQoQ09ORklHX01HTVRfSFlQRVJDQUxMUykNCj4N
Cj4gVGhpcyBsaW5lIGlzIHRvbyBsb25nIG5vdy4NCg0KSG1tLCBob3cgYWJvdXQgSSBpbnRyb2R1
Y2UgYSBuZXcgS2NvbmZpZywgc29tZXRoaW5nIGxpa2U6DQpgYGANCmRpZmYgLS1naXQgYS94ZW4v
YXJjaC94ODYvS2NvbmZpZyBiL3hlbi9hcmNoL3g4Ni9LY29uZmlnDQppbmRleCBjODA4Yzk4OWZj
Li5lYzhmNTFiMGIxIDEwMDY0NA0KLS0tIGEveGVuL2FyY2gveDg2L0tjb25maWcNCisrKyBiL3hl
bi9hcmNoL3g4Ni9LY29uZmlnDQpAQCAtMTY2LDYgKzE2Niw5IEBAIGNvbmZpZyBTSEFET1dfUEFH
SU5HDQogY29uZmlnIFBBR0lORw0KICAgICAgICBkZWZfYm9vbCBIVk0gfHwgU0hBRE9XX1BBR0lO
Rw0KDQorY29uZmlnIFBBR0lOR19MT0dfRElSVFkNCisgICAgICAgZGVmX2Jvb2wgUEFHSU5HDQor
DQogY29uZmlnIEJJR01FTQ0KICAgICAgICBib29sICJiaWcgbWVtb3J5IHN1cHBvcnQiDQogICAg
ICAgIGRlZmF1bHQgbg0KYGBgDQpUaGVuLCBsYXRlciBmdXR1cmUgZGVwZW5kZW5jeSBjb3VsZCBi
ZSBhZGRlZCB0byBQQUdJTkdfTE9HX0RJUlRZDQoNCj4gSmFuDQo=

