Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85124A1DC5E
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 20:01:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878182.1288364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcUL2-0003qc-4m; Mon, 27 Jan 2025 19:00:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878182.1288364; Mon, 27 Jan 2025 19:00:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcUL2-0003oM-10; Mon, 27 Jan 2025 19:00:00 +0000
Received: by outflank-mailman (input) for mailman id 878182;
 Mon, 27 Jan 2025 18:56:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TuAY=UT=aptar.com=jonathan.katz@srs-se1.protection.inumbo.net>)
 id 1tcUHY-0003kg-At
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 18:56:24 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64d560bd-dce0-11ef-99a4-01e77a169b0f;
 Mon, 27 Jan 2025 19:56:20 +0100 (CET)
Received: from BY3PR05CA0032.namprd05.prod.outlook.com (2603:10b6:a03:39b::7)
 by BY5PR04MB6932.namprd04.prod.outlook.com (2603:10b6:a03:219::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Mon, 27 Jan
 2025 18:56:13 +0000
Received: from CY4PEPF0000FCC0.namprd03.prod.outlook.com
 (2603:10b6:a03:39b:cafe::69) by BY3PR05CA0032.outlook.office365.com
 (2603:10b6:a03:39b::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.15 via Frontend Transport; Mon,
 27 Jan 2025 18:56:13 +0000
Received: from us1.smtp.exclaimer.net (191.237.4.149) by
 CY4PEPF0000FCC0.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.14 via Frontend Transport; Mon, 27 Jan 2025 18:56:09 +0000
Received: from BL0PR05CU006.outbound.protection.outlook.com (40.93.2.10) by
 us1.smtp.exclaimer.net (191.237.4.149) with Exclaimer Signature Manager
 ESMTP Proxy us1.smtp.exclaimer.net (tlsversion=TLS12,
 tlscipher=TLS_DIFFIEHELLMAN_WITH_AES256_NONE); Mon, 27 Jan 2025 18:56:10
 +0000
Received: from SJ0PR04MB8343.namprd04.prod.outlook.com (2603:10b6:a03:3d3::6)
 by MN2PR04MB6750.namprd04.prod.outlook.com (2603:10b6:208:19f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Mon, 27 Jan
 2025 18:56:05 +0000
Received: from SJ0PR04MB8343.namprd04.prod.outlook.com
 ([fe80::979e:f75e:9b90:1052]) by SJ0PR04MB8343.namprd04.prod.outlook.com
 ([fe80::979e:f75e:9b90:1052%4]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 18:56:05 +0000
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
X-Inumbo-ID: 64d560bd-dce0-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BqvKTQsHwKIRYSLrNnAlrLVdIeG+sVwoG0m8+CybLK9Idy64ZxD9/YHDUkI4LQAATNAhyj2yoVz9XYXxWXZyGo4SvTFvju5Kesr6ZSgdXQH6uLkx8rMzqj8Bd4okc86v/FLYtRVCYXVBetOt6BWVgdnvm8702XGxNL+HgPkMsMBoEZ8kxb3xYXSW1BJep2XIKxgcdW/tpvDDLsEdC0is+RD9NynHFJp41ZspR7sdBmotlVAUGgZmbtaDP9pgJqzTmefCVJAN/G36ttDfPvIj1P/U3hLTd1iSRHGUjYqs/1sVa3aAoVdFu6mrpmlk2Jk+TnDW/XuKkoDxaVmj4hRVEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MtaWsi7QBnTEI4vu3G8gnaRFSj1E4bvDFBEA1/fypsk=;
 b=u1F95YrCn4PZNTW4Rjdd+LTkI6YZA3kD8zoBctplm3bTwcCRVMvf2jpjonHvBYplKPs5gFjjGB8kGqLVs5rY7rZpDYftnJbjmDiVmNF19b3ML45zrecUQzqCwMPPBxDx98L2xLxwGESyhOOtriY5Cv2pPTDmZev6ff/acxrEq6kckZrZKMIyVvxBmajIpotbll6mV5ldSIPmxuipXFH3OA88bF+LyOkepK3UJV09nJGFABIU80KrYVY/YK6lYjItEr7qChaDO+3cteCfyfIuhLsRvXQdkHp8BkBXy77WxQ4qfOZJ/padz7ZEg36QE4Fatp87a2RMR5Wesdq78ADxgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 191.237.4.149) smtp.rcpttodomain=citrix.com smtp.mailfrom=aptar.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=aptar.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aptar.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MtaWsi7QBnTEI4vu3G8gnaRFSj1E4bvDFBEA1/fypsk=;
 b=XQC4044X20+dkxJDVoxUcrj/FGm1u6qqHfH/BHo2GYE3EBsSVGRviEJSrF48wCaSMcnYYyl2UvU3iukFdHW/hKT/ZASJn07+VwYcHWc6QNSltlnkZsPWgnv4pUALeU6DGrURiJgs6JlpkRYZULELuXYvKxTl4HwAMhubSuzBURc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 191.237.4.149)
 smtp.mailfrom=aptar.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=aptar.com;
Received-SPF: Pass (protection.outlook.com: domain of aptar.com designates
 191.237.4.149 as permitted sender) receiver=protection.outlook.com;
 client-ip=191.237.4.149; helo=us1.smtp.exclaimer.net; pr=C
X-ExclaimerHostedSignatures-MessageProcessed: true
X-ExclaimerProxyLatency: 20661893
X-ExclaimerImprintLatency: 3849405
X-ExclaimerImprintAction: e97ae8a1243143d0b04624149f191e88
From: "Katz, Jonathan" <jonathan.katz@aptar.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Xen-devel <xen-devel@lists.xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: RE: [PATCH for-4.20] x86/intel: Fix PERF_GLOBAL fixup when
 virtualised
Thread-Topic: [PATCH for-4.20] x86/intel: Fix PERF_GLOBAL fixup when
 virtualised
Thread-Index: AQHbbBBKV+twyfPJT0qgl/gKrH7t/bMhcvcAgAkmwoCAAGb34A==
Date: Mon, 27 Jan 2025 18:56:05 +0000
Message-ID:
 <SJ0PR04MB83435FE711BB6747C6EA9F90F0EC2@SJ0PR04MB8343.namprd04.prod.outlook.com>
References: <20250121142510.358996-1-andrew.cooper3@citrix.com>
 <eb58ed74-1156-4de5-8392-a546d9afddc3@gmail.com>
 <76b3b208-a576-48f2-820b-e213722fe229@citrix.com>
In-Reply-To: <76b3b208-a576-48f2-820b-e213722fe229@citrix.com>
Accept-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aptar.com;
x-ms-traffictypediagnostic:
	SJ0PR04MB8343:EE_|MN2PR04MB6750:EE_|CY4PEPF0000FCC0:EE_|BY5PR04MB6932:EE_
X-MS-Office365-Filtering-Correlation-Id: 377fd882-1979-4de8-046d-08dd3f0443de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?HPv6Y7HsnymqNl4mEjlbZOtffVFP0FTXBJaOMy+fksyeg9yxGyxDdwsn++Pf?=
 =?us-ascii?Q?D5Gqc6Mzx5HEju9jxJo8fuFOgCisbzGWRjPSj8K/062lkU/v4QhelQHdykt4?=
 =?us-ascii?Q?lU5XKt6ljB/HBdewQcAv5HOrDz+W1F1EiD0qM7h9OMX/8LxOHXfr5+mloRbf?=
 =?us-ascii?Q?VYLjptw1x60lgejApi1KagwYC7u9kfYLW9GYtntN93Ybx22TJ2i1NgpVvBRq?=
 =?us-ascii?Q?TVs4XgFSWQC3EUTThnZDqX23gP3hEKDwwOmq7ULiV8DT1WpOhpNIRqk+FMrO?=
 =?us-ascii?Q?oEi4AtRlBULXJA+fOpatNa18AUPC/5n9XTZ5oWxbA79ZxXIKkkGe1ewYyY8C?=
 =?us-ascii?Q?q3t+hJKWoOupnQckrE8LXAJ9xJCI3OAmP/YhixIUkoeMDbCHQZkx9nbWumo2?=
 =?us-ascii?Q?aDdKxzKHMiDnXwxvjeLwp6uzkaBqDz0eiTKF77FCcbOGwyQF5/ld0caM6Jea?=
 =?us-ascii?Q?tVF3Y6dRrnxCZ+VifSaWQ6fnhvW6iJcDEvi8JaHazMMtdD2AWWlv8H0qC8t7?=
 =?us-ascii?Q?KfQBWz2TzS8qIi0MQ2HMK32h+GYQ1pou4Dv9JqoPkCCpHzZMRYl9PbmLtmZd?=
 =?us-ascii?Q?oEkrQesEKMAwn0hSrntWIdcMXLanuw+Hx2QT+qDMMCq0NjKjG2mHMDybEA4c?=
 =?us-ascii?Q?VPEXgmJriysy0vvTOwlcJoGJoHaPPjylZtHjc4D/1VQGLg4vLm7P/JklVfuL?=
 =?us-ascii?Q?gmd2Tme7un52yr5cocECuJ2cO6C23Zo0A+LnYqPrAlSkikb6UDF3o66ytr4m?=
 =?us-ascii?Q?kFn5u67Ing5EJlqodFPpmNAuMKLyA3uiLPaI+sAlJlhd8LytLiwhHx9PK5jN?=
 =?us-ascii?Q?7VcR3TngzHfqe1DBfhZH4iFIoOpp3k3O8evpH/OkVqa++DSUQSsMnBExyXIo?=
 =?us-ascii?Q?mreRHa7iP38U1BKUXnI8cipBfbkCjKrzmiQkW8VLWHxfFdJXIrlVZ1xguXo+?=
 =?us-ascii?Q?57oO/EtNUigJfN+AF6epDNSfT1iiOA4fNe94Z/+A3iROEOGwPQq2oQOMvDER?=
 =?us-ascii?Q?YzoLB8N+M1kbeA5uMBCMI9pr94p5MPlx9MIyWGbjGfEmfsz/Cv1S5DsO0k++?=
 =?us-ascii?Q?6WQTJ+WJpNcBsF0LZS7eBUifG9lwtgRhTIVOqI/yCButlgA/t7I6hRhUXFRt?=
 =?us-ascii?Q?IYW4VCto1Gv7dZNAi07gZt3geg3gfhvWlVbn8Os6M0jXtQ/L53hm34OloLun?=
 =?us-ascii?Q?pl+9/qi3HEV41DcvnOv5fPghGb0s9WrVjA2Ry+1bSsBJFAnHbAI9xWqcfFcl?=
 =?us-ascii?Q?nEg7S3EVFbsn29iwWkPYMWnPPo7VxcVH5b9c/Wf0MOuf3nabi+TOuovOlJTC?=
 =?us-ascii?Q?j3DRtWmFZAIR9vYlbIZADqtledxm7iQqPuxvHA7OKqu9db5q271k5hnJZ6Q9?=
 =?us-ascii?Q?DfaGtyL0eWms0tRDitHgwrrWSuRm6BIJkHt3UeTLFnpCXUw+hUtZmqfY0nYG?=
 =?us-ascii?Q?I/igk+rdxgtxGZ6MldMLIjgofu6vt9BE?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR04MB8343.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1102;
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6750
Content-Type: multipart/alternative; boundary="=-zyd2Ueu4pAKVThpU39UFJQ=="
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 CY4PEPF0000FCC0.namprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a68b26a4-cd5e-4046-1a8a-08dd3f0440c1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|35042699022|14060799003|36860700013|376014|82310400026|8096899003|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WWF2VnpLVUVXVlQzZVNaUXhYQVJSVCtFUGo1eWM1aHJBcERGbThXQ3Nsa2ZQ?=
 =?utf-8?B?UjVEcnVDTW9XZ1REa3BQQkxiZ2RVdU1aT1U4cWFubmZVQWJvTlAwVWRxSXR4?=
 =?utf-8?B?b3EvQjBYczRDSW42ZWgwbHdXWEtyMjVHalJVblFLdXdvR0tVVEV4SnR3V1hi?=
 =?utf-8?B?UWFIdUhtQk8rWUUwaGpCNzhGbkx1SS8zR3d5MEc1cnVNelNCdWI4TzVYYklW?=
 =?utf-8?B?d1BiY0EyNW5SQTM0TnpLcUhmV2l2bXhiTjJKbmZmRnFpZlp6eTkrbEc5QlVa?=
 =?utf-8?B?OGpDSU9JZitwNTNyZ3hWNkRqUy9oUFQyQTZpWEEzdzFxdzRVSEdYSWU1b0t5?=
 =?utf-8?B?UGNOdXVjUVd0RVVNZ3llenUyREROU3hUb1E2UlIwZ2RTWnFweUlLNWRJdW5F?=
 =?utf-8?B?TTNkKytRZ0J2M3p4S0NoRzNZTTFpcjRYaEcxZDA3bDNGa3N2cGVBaGVZYkpo?=
 =?utf-8?B?OCtvUzFUSzFOTVcxbzlMMUo3d1dVREtuSjhYSjhvaEx4ZlBxNndWeFVucTRF?=
 =?utf-8?B?cVhxS1FTUzY4NG90bG9WY3FTcmkwdkg0bCtDL21tKzRDbUlnNW9qOFVpcHBF?=
 =?utf-8?B?K1pvUnJEMG1sUWNsNllBYmV0REg4Q1pkZmNKR1NYSVVHQjZMSEFWQzZRc2Rj?=
 =?utf-8?B?a3c1LzZ4UktSN2JrT29INEhXMnY3OXBudGpBb05Uako3YmJoU0N0WnVUeHBn?=
 =?utf-8?B?eW84Wmw0Q0RGendVaktaSFIyUVM1dEdzQmFtRTBsWDVFQ3ZwMWQ1QlluTHh2?=
 =?utf-8?B?empYM0o2NlFvNnpiaWdwYVVNNGlYYmlKS2IvRlkxak40VzQ3N0tJVk8vVWRG?=
 =?utf-8?B?ZE5ZK0xhM0pwdnd5bThDYXZqWE9aUjhINS93bXNiVndZSnFRVDg1NnNBc21z?=
 =?utf-8?B?eUhydElHbjRjMUdsY0dBUVpHM1lqZUI3KzNJV2dvSlpYM2tpcmIyTTZqdDBR?=
 =?utf-8?B?dWQxR3hoU2ZYeHptcnluZC9kUlRmc0NSdHkzL0VzV2ptYTJzU1hVcmlMV0Fl?=
 =?utf-8?B?YnNwSk9KT01CMU95czhDODkzTXBXWmlkdXp0bS9BSHl3ODJwdDhzZStyOFBv?=
 =?utf-8?B?Szd0SWVIUk0wR0Y1RGlCd002S2NFcXRSUGlzQk10azViVnkyWDNGV1FvcHZ0?=
 =?utf-8?B?NENNOXBURlJLK2hnSFVhVmJVVkIzbEhyNVc2b2FDc3ZzVEVlbUlESldEbFlD?=
 =?utf-8?B?eG9oVHF5ZHRXUnJEeFU2Tks3RzBmSWgyNkZFSHpxSHpKeWhsdzhzVDU2cE84?=
 =?utf-8?B?aGN2YXZHWkZjbnA5d3F6TFBENVMweUFtS0dpWjNPM2dVd1JDQmNLZVVUWHVZ?=
 =?utf-8?B?QTk5WEdRYVZ4aWpZWUlQdWRwa0o1enJJbVJlSlZmQ1hsSXBYejlHWXNmcFdL?=
 =?utf-8?B?NTFwRmFqWFFQeE5kdC9iTXFBbDMveG93NzZOcmRlODYxZFRCd0Z2SVFKTDU5?=
 =?utf-8?B?Y0ZGMlp2aWNSczBsTG42RmNPd0N2ZmNVaUhUajhvM1BoRzhHZmJwQ1FTQW4y?=
 =?utf-8?B?Kys3ekMyUWxFNDU0aTllUUhFT3Flc2lLNktoRFRDeThrOXBJbEFMRk9IbzZP?=
 =?utf-8?B?TDBUeHNSM28xdjdDenJaR2xVeVUvSGszaWtncEl5SlB6bFQwUVF1NzJOTWo1?=
 =?utf-8?B?SnM0SU9iVE9Qam93N1VGUlQvdzJtVWVQbG1qZ1FuWnQ0QTNkWGVRN09YdVBu?=
 =?utf-8?B?Z0JINVFCOXJENkk1R2VTMS9MelZaV0lmbkd2RENLZmZUelpGVm9VRXBKZTFW?=
 =?utf-8?B?L2ZVdVV0Y2Uxd0U1K1hjbk5zVTkvdysvdFd2K0V5dmVZakFORWtKRXI0MUNt?=
 =?utf-8?B?OHJMKzRGTHVwSmVCSXI1VWNidjNwU3NKUlpqWWQxOUd4UnhRWU5XdmI4YTBG?=
 =?utf-8?B?Z1ZaN25qYUtwMVFMeUJBbjBpYWFsR0ZZNDhNdHZIc21lY0lKK3hzT285ZGdP?=
 =?utf-8?Q?lx30bvazTXg=3D?=
X-Forefront-Antispam-Report:
	CIP:191.237.4.149;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:us1.smtp.exclaimer.net;PTR:us1.smtp.exclaimer.net;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(14060799003)(36860700013)(376014)(82310400026)(8096899003)(13003099007)(7053199007);DIR:OUT;SFP:1102;
X-OriginatorOrg: aptar.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2025 18:56:09.8614
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 377fd882-1979-4de8-046d-08dd3f0443de
X-MS-Exchange-CrossTenant-Id: 5fd74a3e-d57a-410e-8d7c-02c4df062234
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5fd74a3e-d57a-410e-8d7c-02c4df062234;Ip=[191.237.4.149];Helo=[us1.smtp.exclaimer.net]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6932

--=-zyd2Ueu4pAKVThpU39UFJQ==
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Tested on xcp-ng vm on esx 8 that previously failed to boot when performanc=
e counters were not enabled.

- patched host
- rebooted host
- host still came up normally
- shut host down
- turned off performance counters on vm
- booted host
- host still came up normally and no issues running vms

Thanks!
jonathan


Jonathan=E2=80=8B=E2=80=8B=E2=80=8B=E2=80=8B



Katz



IS Senior Specialist, Infrastructure Operations Engineer

AptarGroup

265 Exchange Drive, Suite 100

,

Crystal Lake

,

Illinois



60014

,

United States

(phone) +1 779 220 4484<tel:+1%20779%20220%204484>

 |

(mobile) +1 847 525 8441<tel:+1%20847%20525%208441>

jonathan.katz@aptar.com<mailto:jonathan.katz@aptar.com>

 |

www.aptar.com<http://www.aptar.com/>

AptarOnlineSignature

-----Original Message-----
From: Andrew Cooper <andrew.cooper3@citrix.com>
Sent: Monday, January 27, 2025 6:42 AM
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>; Xen-devel <xen-devel@lis=
ts.xenproject.org>
Cc: Katz, Jonathan <jonathan.katz@aptar.com>; Jan Beulich <JBeulich@suse.co=
m>; Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
Subject: Re: [PATCH for-4.20] x86/intel: Fix PERF_GLOBAL fixup when virtual=
ised


EXTERNAL MAIL: Do not click any links or open any attachments unless you tr=
ust the sender and know the content is safe.


On 21/01/2025 4:57 pm, Oleksii Kurochko wrote:
>
> On 1/21/25 3:25 PM, Andrew Cooper wrote:
>> Logic using performance counters needs to look at
>> MSR_MISC_ENABLE.PERF_AVAILABLE before touching any other resources.
>>
>> When virtualised under ESX, Xen dies with a #GP fault trying to read
>> MSR_CORE_PERF_GLOBAL_CTRL.
>>
>> Factor this logic out into a separate function (it's already too
>> squashed to the RHS), and insert a check of
>> MSR_MISC_ENABLE.PERF_AVAILABLE.
>>
>> This also limits setting X86_FEATURE_ARCH_PERFMON, although oprofile
>> (the only consumer of this flag) cross-checks too.
>>
>> Reported-by: Jonathan Katz <jonathan.katz@aptar.com>
>> Link:
>> https://nam02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fxcp
>> -ng.org%2Fforum%2Ftopic%2F10286%2Fnesting-xcp-ng-on-esx-8&data=3D05%7C0
>> 2%7Cjonathan.katz%40aptar.com%7Cc036df18462d402eda5608dd3ed01147%7C5f
>> d74a3ed57a410e8d7c02c4df062234%7C0%7C0%7C638735785584484308%7CUnknown
>> %7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW
>> 4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DjG5dfAjyXvB
>> JRrtNklKp8MjGOUoYGntpD14eRP5GCcI%3D&reserved=3D0
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>
>> Untested, but this is the same pattern used by oprofile and watchdog
>> setup.
>
> Probably it will make sense to wait for a response on the forum (you
> mentioned in the Link:) that the current one patch works?

It's been a week. At this point it needs to go in for the release. As I sai=
d, this is exactly the same pattern as used elsewhere in Xen, so I'm confid=
ent it's a good fix, and Roger agrees too.

~Andrew
This e-mail may contain confidential information. If you are not the intend=
ed recipient, please notify the sender immediately and destroy this e-mail.=
 Any unauthorized copying, disclosure or distribution of the material in th=
is e-mail is strictly forbidden.

Aptar=E2=80=99s Privacy Policy<https://www.aptar.com/en-us/general-terms-an=
d-conditions-use.html> explains how Aptar may use your personal information=
 or data and any personal information or data provided or made available to=
 us.

--=-zyd2Ueu4pAKVThpU39UFJQ==
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
</head>
<body>
<div>Tested on xcp-ng vm on esx 8 that previously failed to boot when perfo=
rmance counters were not enabled.<br>
<br>
- patched host<br>
- rebooted host<br>
- host still came up normally<br>
- shut host down<br>
- turned off performance counters on vm<br>
- booted host<br>
- host still came up normally and no issues running vms<br>
<br>
Thanks!<br>
jonathan<br>
<br>
<div dir=3D"ltr" style=3D"mso-line-height-rule:exactly;-webkit-text-size-ad=
just:100%;font-size:1px;direction:ltr;">
<table dir=3D"ltr" cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=
=3D"width:100%;direction:ltr;border-collapse:collapse;font-size:1px;">
<tbody>
<tr style=3D"font-size:0;">
<td align=3D"left" style=3D"vertical-align:top;">
<table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"border-col=
lapse:collapse;font-size:0;">
<tbody>
<tr style=3D"font-size:0;">
<td align=3D"left" style=3D"padding:13px 0;vertical-align:top;">
<table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"width:0;bo=
rder-collapse:collapse;font-size:0;color:#FFFFFF;font-style:normal;font-wei=
ght:400;white-space:nowrap;">
<tbody>
<tr style=3D"font-size:0;">
<td align=3D"left" style=3D"padding:0;vertical-align:top;">
<table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"border-col=
lapse:collapse;font-size:0;">
<tbody>
<tr style=3D"font-size:0;">
<td align=3D"left" style=3D"padding:0;vertical-align:middle;">
<table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"border-col=
lapse:collapse;font-size:0;">
<tbody>
<tr style=3D"font-size:0;">
<td align=3D"left" style=3D"padding:0;vertical-align:top;">
<table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"border-col=
lapse:collapse;font-size:0;color:#5F5F5F;font-style:normal;font-weight:400;=
white-space:nowrap;">
<tbody>
<tr style=3D"font-size:14.67px;">
<td align=3D"left" style=3D"vertical-align:top;font-size:17.33px;color:#376=
05E;font-family:Arial;font-weight:700;">
<p style=3D"margin-top:0px;margin-bottom:0px;">Jonathan<span style=3D"font-=
family:remialcxesans;font-size:1px;color:#FFFFFF;line-height:1px;">=E2=80=
=8B<span style=3D"font-family:'template-KDWbeBsYEeiAwgANOhMCUQ';">=E2=80=8B=
</span><span style=3D"font-family:'zone-1';">=E2=80=8B</span><span style=3D=
"font-family:'zones-AQ';">=E2=80=8B</span></span></p>
</td>
<td align=3D"left" style=3D"vertical-align:top;font-family:Arial;">
<p style=3D"margin-top:0px;margin-bottom:0px;">&nbsp;</p>
</td>
<td align=3D"left" style=3D"vertical-align:top;font-size:17.33px;color:#376=
05E;font-family:Arial;font-weight:700;">
<p style=3D"margin-top:0px;margin-bottom:0px;">Katz</p>
</td>
<td align=3D"left" style=3D"vertical-align:top;font-family:Arial;">
<p style=3D"margin-top:0px;margin-bottom:0px;">&nbsp;&nbsp;</p>
</td>
<td align=3D"left" style=3D"vertical-align:middle;font-family:Arial;">
<p style=3D"margin-top:0px;margin-bottom:0px;">IS&nbsp;Senior&nbsp;Speciali=
st,&nbsp;Infrastructure&nbsp;Operations&nbsp;Engineer</p>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr style=3D"font-size:17.33px;color:#37605E;font-style:normal;font-weight:=
700;white-space:nowrap;">
<td align=3D"left" style=3D"padding:0;vertical-align:top;font-family:Arial;=
">
<p style=3D"margin-top:0px;margin-bottom:0px;">AptarGroup</p>
</td>
</tr>
<tr style=3D"font-size:0;">
<td align=3D"left" style=3D"padding:0;vertical-align:bottom;">
<table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"border-col=
lapse:collapse;font-size:0;color:#5F5F5F;font-style:normal;font-weight:400;=
white-space:nowrap;">
<tbody>
<tr style=3D"font-size:14.67px;">
<td align=3D"left" style=3D"vertical-align:bottom;font-family:Arial;">
<p style=3D"margin-top:0px;margin-bottom:0px;">265&nbsp;Exchange&nbsp;Drive=
,&nbsp;Suite&nbsp;100</p>
</td>
<td align=3D"left" style=3D"vertical-align:bottom;font-family:Arial;">
<p style=3D"margin-top:0px;margin-bottom:0px;">,&nbsp;</p>
</td>
<td align=3D"left" style=3D"vertical-align:bottom;font-family:Arial;">
<p style=3D"margin-top:0px;margin-bottom:0px;">Crystal&nbsp;Lake</p>
</td>
<td align=3D"left" style=3D"vertical-align:bottom;font-family:Arial;">
<p style=3D"margin-top:0px;margin-bottom:0px;">,&nbsp;</p>
</td>
<td align=3D"left" style=3D"vertical-align:bottom;font-family:Arial;">
<p style=3D"margin-top:0px;margin-bottom:0px;">Illinois</p>
</td>
<td align=3D"left" style=3D"vertical-align:bottom;font-family:Arial;">
<p style=3D"margin-top:0px;margin-bottom:0px;">&nbsp;</p>
</td>
<td align=3D"left" style=3D"vertical-align:bottom;font-family:Arial;">
<p style=3D"margin-top:0px;margin-bottom:0px;">60014</p>
</td>
<td align=3D"left" style=3D"vertical-align:bottom;font-family:Arial;">
<p style=3D"margin-top:0px;margin-bottom:0px;">,&nbsp;</p>
</td>
<td align=3D"left" style=3D"vertical-align:bottom;font-family:Arial;">
<p style=3D"margin-top:0px;margin-bottom:0px;">United&nbsp;States</p>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr style=3D"font-size:0;">
<td align=3D"left" style=3D"padding:0;vertical-align:bottom;">
<table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"border-col=
lapse:collapse;font-size:0;color:#000001;font-style:normal;font-weight:400;=
white-space:nowrap;">
<tbody>
<tr style=3D"font-size:14.67px;">
<td align=3D"left" style=3D"vertical-align:bottom;font-family:Arial;">
<p style=3D"margin-top:0px;margin-bottom:0px;">(phone)&nbsp;<a href=3D"tel:=
+1%20779%20220%204484" target=3D"_blank" id=3D"LPlnk689713" style=3D"text-d=
ecoration:none;color:#000001;">+1&nbsp;779&nbsp;220&nbsp;4484</a></p>
</td>
<td align=3D"left" style=3D"vertical-align:middle;font-family:Arial;">
<p style=3D"margin-top:0px;margin-bottom:0px;">&nbsp;<span style=3D"color:#=
37605E;font-size:17.33px;font-weight:700;">|&nbsp;</span></p>
</td>
<td align=3D"left" style=3D"vertical-align:bottom;font-family:Arial;">
<p style=3D"margin-top:0px;margin-bottom:0px;">(mobile)&nbsp;<a href=3D"tel=
:+1%20847%20525%208441" target=3D"_blank" id=3D"LPlnk689713" style=3D"text-=
decoration:none;color:#000001;">+1&nbsp;847&nbsp;525&nbsp;8441</a></p>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr style=3D"font-size:0;">
<td align=3D"left" style=3D"padding:0;vertical-align:top;">
<table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"border-col=
lapse:collapse;font-size:0;color:#000001;font-style:normal;font-weight:700;=
white-space:nowrap;">
<tbody>
<tr style=3D"font-size:14.67px;">
<td align=3D"left" style=3D"vertical-align:bottom;font-family:Arial;">
<p style=3D"margin-top:0px;margin-bottom:0px;"><a href=3D"mailto:jonathan.k=
atz@aptar.com" target=3D"_blank" id=3D"LPlnk689713" style=3D"text-decoratio=
n:none;color:#37605E;"><span style=3D"text-decoration:underline;">jonathan.=
katz@aptar.com</span></a></p>
</td>
<td align=3D"left" style=3D"vertical-align:middle;font-family:Arial;font-we=
ight:400;">
<p style=3D"margin-top:0px;margin-bottom:0px;">&nbsp;<span style=3D"font-we=
ight:700;color:#37605E;font-size:17.33px;">|&nbsp;</span></p>
</td>
<td align=3D"left" style=3D"vertical-align:bottom;font-family:Arial;">
<p style=3D"margin-top:0px;margin-bottom:0px;"><a href=3D"http://www.aptar.=
com/" target=3D"_blank" id=3D"LPlnk689713" title=3D"www.aptar.com" style=3D=
"text-decoration:none;color:#37605E;"><span style=3D"text-decoration:underl=
ine;">www.aptar.com</span></a></p>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr style=3D"font-size:1.33px;">
<td align=3D"left" style=3D"padding:13px 0 0;vertical-align:top;font-family=
:Arial;">
<p style=3D"margin-top:0px;margin-bottom:0px;">AptarOnlineSignature</p>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</div>
-----Original Message-----<br>
From: Andrew Cooper &lt;andrew.cooper3@citrix.com&gt; <br>
Sent: Monday, January 27, 2025 6:42 AM<br>
To: Oleksii Kurochko &lt;oleksii.kurochko@gmail.com&gt;; Xen-devel &lt;xen-=
devel@lists.xenproject.org&gt;<br>
Cc: Katz, Jonathan &lt;jonathan.katz@aptar.com&gt;; Jan Beulich &lt;JBeulic=
h@suse.com&gt;; Roger Pau Monn=C3=A9 &lt;roger.pau@citrix.com&gt;<br>
Subject: Re: [PATCH for-4.20] x86/intel: Fix PERF_GLOBAL fixup when virtual=
ised<br>
<br>
<br>
EXTERNAL MAIL: Do not click any links or open any attachments unless you tr=
ust the sender and know the content is safe.<br>
<br>
<br>
On 21/01/2025 4:57 pm, Oleksii Kurochko wrote:<br>
&gt;<br>
&gt; On 1/21/25 3:25 PM, Andrew Cooper wrote:<br>
&gt;&gt; Logic using performance counters needs to look at <br>
&gt;&gt; MSR_MISC_ENABLE.PERF_AVAILABLE before touching any other resources=
.<br>
&gt;&gt;<br>
&gt;&gt; When virtualised under ESX, Xen dies with a #GP fault trying to re=
ad <br>
&gt;&gt; MSR_CORE_PERF_GLOBAL_CTRL.<br>
&gt;&gt;<br>
&gt;&gt; Factor this logic out into a separate function (it's already too <=
br>
&gt;&gt; squashed to the RHS), and insert a check of <br>
&gt;&gt; MSR_MISC_ENABLE.PERF_AVAILABLE.<br>
&gt;&gt;<br>
&gt;&gt; This also limits setting X86_FEATURE_ARCH_PERFMON, although oprofi=
le <br>
&gt;&gt; (the only consumer of this flag) cross-checks too.<br>
&gt;&gt;<br>
&gt;&gt; Reported-by: Jonathan Katz &lt;jonathan.katz@aptar.com&gt;<br>
&gt;&gt; Link: <br>
&gt;&gt; https://nam02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fxcp<br>
&gt;&gt; -ng.org%2Fforum%2Ftopic%2F10286%2Fnesting-xcp-ng-on-esx-8&amp;data=
=3D05%7C0<br>
&gt;&gt; 2%7Cjonathan.katz%40aptar.com%7Cc036df18462d402eda5608dd3ed01147%7=
C5f<br>
&gt;&gt; d74a3ed57a410e8d7c02c4df062234%7C0%7C0%7C638735785584484308%7CUnkn=
own<br>
&gt;&gt; %7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJ=
XaW<br>
&gt;&gt; 4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3DjG=
5dfAjyXvB<br>
&gt;&gt; JRrtNklKp8MjGOUoYGntpD14eRP5GCcI%3D&amp;reserved=3D0<br>
&gt;&gt; Signed-off-by: Andrew Cooper &lt;andrew.cooper3@citrix.com&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; CC: Jan Beulich &lt;JBeulich@suse.com&gt;<br>
&gt;&gt; CC: Roger Pau Monn=C3=A9 &lt;roger.pau@citrix.com&gt;<br>
&gt;&gt; CC: Oleksii Kurochko &lt;oleksii.kurochko@gmail.com&gt;<br>
&gt;&gt;<br>
&gt;&gt; Untested, but this is the same pattern used by oprofile and watchd=
og <br>
&gt;&gt; setup.<br>
&gt;<br>
&gt; Probably it will make sense to wait for a response on the forum (you <=
br>
&gt; mentioned in the Link:) that the current one patch works?<br>
<br>
It's been a week. At this point it needs to go in for the release. As I sai=
d, this is exactly the same pattern as used elsewhere in Xen, so I'm confid=
ent it's a good fix, and Roger agrees too.<br>
<br>
~Andrew<br>
</div>
This e-mail may contain confidential information. If you are not the intend=
ed recipient, please notify the sender immediately and destroy this e-mail.=
 Any unauthorized copying, disclosure or distribution of the material in th=
is e-mail is strictly forbidden.
<p><span style=3D"font-size: xx-small;"><span class=3D"SpellE"><em><span la=
ng=3D"EN-US">Aptar=E2=80=99s</span></em></span><em><span lang=3D"EN-US">&nb=
sp;<a href=3D"https://www.aptar.com/en-us/general-terms-and-conditions-use.=
html">Privacy Policy</a>&nbsp;</span></em><em><span lang=3D"EN-US">explains
 how Aptar may use your personal information or data and any personal infor=
mation or data provided or made available to us.</span></em></span></p>
</body>
</html>

--=-zyd2Ueu4pAKVThpU39UFJQ==--

