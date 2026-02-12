Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIgGBCi0jWl96AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 12:06:16 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CC212CD8A
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 12:06:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1228741.1534868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqUWL-0007El-Pq; Thu, 12 Feb 2026 11:06:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1228741.1534868; Thu, 12 Feb 2026 11:06:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqUWL-0007CM-N4; Thu, 12 Feb 2026 11:06:05 +0000
Received: by outflank-mailman (input) for mailman id 1228741;
 Thu, 12 Feb 2026 11:06:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z4gJ=AQ=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vqUWK-0005P4-7a
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 11:06:04 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d181926b-0802-11f1-b162-2bf370ae4941;
 Thu, 12 Feb 2026 12:06:03 +0100 (CET)
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by SA5PR03MB8401.namprd03.prod.outlook.com (2603:10b6:806:475::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Thu, 12 Feb
 2026 11:06:00 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%5]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 11:06:00 +0000
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
X-Inumbo-ID: d181926b-0802-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M3t/t6g/xq9XiR3qISzopgQFAqAWm10d1fp1y35zXA0KnN9LSQRDXf2jyH1AYBgh15i5DMybmJDDpEIJgfeJp5LQL7Lj9lKeJJXR7HrM2GdXphR/Nd7IO+yleO+39yomBbg2TjcY0w4dmUj7RJMos4POcBmLP6UBILcG78tLHyG/srBEgRch1jkoPCMmKOq02q2A+4aezIN4NYEUMnU4oeTsg3BJuZwbbpTxSzU+dpD6ocg3H50tFwjo8FBy2G16mtl2FoCEUUu/huhhGMT9I5TjlxeXlmzjI8Dd6qFd0iUMoUt+DPYQ1c/SlXQuNY6d142fGnI8NCfyDZukK2HU5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lG/BICPoF3FogZ+K7gnh8sUVzKfYmKdMfZkDtj5g4pI=;
 b=g3CU+YN3BkT1y4FV7EpjnZSbllrSSfO+fApDlKMlZ2jckR5b7DQllDlgBzpdooOM0G2l192kBWnWzV5i5yOLZWns0tuA7m1dZf3T/E/tdYGqQTr2Uw+HWOmbTVIdqlZncSEW31Hm2Wn7/OUcnNGF/EzUWyFi/shMdAc4MLHgBP48L8mFam6aTew28Mvkuw+T5ZPzAzhnILwTtqr4rpyOXx7uOxUlxA4WNorp7qC06tEAketOZdmCgQ3bUtjLXsiVBSkOrQNkP1Z9OUy21XTNH47kgX7K9QRsZVWJUuC4nlXrpUL853+0jzgU0k2GHlaKrOsLBXTakDOzJxhG2QgPow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lG/BICPoF3FogZ+K7gnh8sUVzKfYmKdMfZkDtj5g4pI=;
 b=JKK33xOa+c98WUPCI3gjNJp8EtRRp6Ru9cWNH70nlbCiHV3WEYlElK0Dt2S1zHW3iCEiR8uWOpEAL/RiWmApszu9dJEjYUDq2XV1048Zg1+Xbmm80kDOtjjwkKg4oSCDBf351qONnl7GzNLYwpoO5LVKeyRf5Jf6f8pdZ9wdqpM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <64c6d982-9bdb-40b7-96f4-01c2536b5922@citrix.com>
Date: Thu, 12 Feb 2026 11:05:56 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "community.manager@xenproject.org" <community.manager@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH for-4.17] SUPPORT.md: revive for extended security support
 "lifetime"
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <df668fb3-b3b9-4f37-920f-b1aa653a35de@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <df668fb3-b3b9-4f37-920f-b1aa653a35de@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0052.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::10) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|SA5PR03MB8401:EE_
X-MS-Office365-Filtering-Correlation-Id: cc076426-dc93-4ca0-769e-08de6a26b4c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RGdrcFV1cXpwZnZuTUFNblJVMzBkeWZGSldQQjEwN0orcXB0VVFWM2xvTmZM?=
 =?utf-8?B?SmZyeERicmtHSlFaUjV2a3VUc2pQdVh5NVdzTE5UN1libXhJTTUrTmJiSjQ4?=
 =?utf-8?B?anJTS1JqdGZwRG90QXF3ajJNNjRvdXppTk9rVnc1Nk1qVE1xQ2ZicGZONzJI?=
 =?utf-8?B?MnB5Ym9QeTJzL2VIaFBMOGQ2cXhUT3ltVVdZdHNIREk4RjhzTkQvWlUweGlt?=
 =?utf-8?B?alBIQVIzd2hIVWI0dS9maXhxemVjWi9YNXRzTTNlTFU0R2NMQTFRMWMxbWM4?=
 =?utf-8?B?NlU4NHd5RTNTdmw5NEFQR0JMTzJBMkNuYnptTVlXTStoUzUxMG5LNHBtanFS?=
 =?utf-8?B?blpFY25qdDhPYTBxQTFvandPNllYeS9DdURBdU93dE5lMlF3MHRuTWsyaUhZ?=
 =?utf-8?B?cFZPNmx2K0lrQ3d6SExXNlVWZlcxTVd5Qmd4WnZNcDgycUlqZ2RzOGJqcXVk?=
 =?utf-8?B?YlNGLzViVElObTJWOHBhckp1KzJHL2dCRnk0MG80eEpQdnFEVDNLTk9vMUVI?=
 =?utf-8?B?bXVoclZDTVZNd2ZUc2I0dW5TVXM5S3ZLSzA0cEpWeTFZWUZTRDlITnA4ekRl?=
 =?utf-8?B?dGlqUnlrMGpVRWFIdmZ6clFTQnlMbDM4YytxMDZudkY5aXlCQUE2dTYvU2w5?=
 =?utf-8?B?R2xCOXhwTFNCdDFoOGdOWTZYOXl4eDArUUdiTEZWRkljR2tpY0VxdjFqYmZG?=
 =?utf-8?B?TVlJWmczUjNrOFEvWURDdXNtNGR6S29CeUw1M2JFQzlmajZZMVBLenptUXY4?=
 =?utf-8?B?NVJKZVI1WjljcUpqb3V4Nm52U2NVaXZxanpoY3hjdE9ERjZ5c1JxQlZ6R3k3?=
 =?utf-8?B?eG5ZY3ZWK3gwaWhpU0lEcWNCNVBoaWZMZ1VieDFlN3ROZmRxNGRrTUJVQXFE?=
 =?utf-8?B?bjhCRm5seCtWaXdRTTZPaWRVditHU2x4WjJ5NnRVN3N5empFdHRXZ3gyMGpy?=
 =?utf-8?B?alNCa0ltU2k5RnQ5ZWFHbGRUSUVVRW51T0p3NEtRV1VScmdRUGFuQkhJbEl3?=
 =?utf-8?B?bTl0cEtkMWFQTHNDMFM1Y2dhenlBWEtvQzNXS1FQaXYyVThSNTFZOStPcEVn?=
 =?utf-8?B?amQrNkpBZzRWNmZmM0JlNWxOOHhaQWxFZGRyZUd2RklWSW10Nk1JVFZlTjhM?=
 =?utf-8?B?d0tzeDRzR0dJc3lOeWZFZFJ4RExxZWgyR2xEa3BvNkZoZkxaQW1qTTU3SVYz?=
 =?utf-8?B?cFBUYklrbitkb2h4YkFFVWZwREw5YSs0MjF2TXRxKy90TDJyWVdxZm14aE5Y?=
 =?utf-8?B?R21qZmxncUVLTnB4K1JlM3poc1p6QUFCeGxZUTR2OUNlKzZJNldlT3V5NjBB?=
 =?utf-8?B?V05UL0pLanNSOXl6TlgrcE9kMXhrcElnNDNNR2pybU1VOVFnRFYxUVI3WWxk?=
 =?utf-8?B?dkpNZzVzTVQrZkNzN0RHazVqNlVHV0tLcnVockJtMzM1M3VUMG5qUU1SMjZu?=
 =?utf-8?B?ZnZod1BwTzkwSmsxUmxBWmJaMnhPVW1JMW5ieVV3aENxMk9GRGEzdWNpa0lq?=
 =?utf-8?B?S1VJNm5zK092Tm94a3B1ZUZxM3VrWVZxMWV2MnV6RnpnWWlhUTNoZWM0MmQy?=
 =?utf-8?B?RVNodkozdnIzOFlNNlFTU1ZNU1BtMHBVRjJOY0hEQlUrOWNkb0ZualN0MjZJ?=
 =?utf-8?B?TmFLa29zZCtic1ZoZWRwUVNQalVrTUlZb09GRzUwYnd1RytxTW54aFpEMXIy?=
 =?utf-8?B?M083SEdFaUtXeE9vb0xrUXE0elJxanJ2MWI5Q3hzUDR2M0dRY3huTDl0enFi?=
 =?utf-8?B?SHhpNmVsdFBFRGloRjRZb2l3M3pNTnR2d2tVOE5kNHA2aUZkL2Fzd3RWZXgv?=
 =?utf-8?B?MXNtdXZTMm9JeVQ0RTNEelZha3habVdlK2FLbi9OWUJFOWh2bFR3Sk5RTGFz?=
 =?utf-8?B?aW90M0ZrdmoxRmhEVE0yQU4zRU13ZjdIWXcvcVMxWVh3M1J6TVZxWDYyZWhY?=
 =?utf-8?B?d3pYRGFkUzVBU01hSTlpeTZMbU5xN3g4bjg4VHpJdHFEcEJhUVhKM0ZwRnBx?=
 =?utf-8?B?WlNmWmpaTFMrNjcwM0RjQ3pJQmJyRUhUbE9TM1VZdVdnMDJOWlpyQ3ZObTlv?=
 =?utf-8?B?dCtlcGdWTEl3d0RpNlYwNGI3elhTVXZGb0RNVDdnMFl6dHpWV0hUbmNVTEV5?=
 =?utf-8?Q?ctQw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WkFEY0lFYXd3ZXRvcXlIOWNyQ1FUZXNGN3pHWU1WQStJZFNEWmhoTjR1VW5L?=
 =?utf-8?B?NWhlbUFYL1hCUDBObmtCNVRqQmlKMVJ1WkEzWE5mSS9iQWpZM2FYbW9lM3Ri?=
 =?utf-8?B?bnNhOUE5T0FWNFIvSjVBc2FiQzFDdWZxWlIzZS93L2ZPeWpiU2kra1BzWjNw?=
 =?utf-8?B?cWxmaVRHeUFFeEtHK3ErTGl2T2pWRjNnVWlCYjlCbkJjQ05xdS9YV2x0bmdh?=
 =?utf-8?B?Qkt0NGpZVkphMm1BZTc0YVJHSnB0TW1kLzEzditwUGZldHlFVjVHVlcwOHZF?=
 =?utf-8?B?QVY0bTBXTmo0bUZBbWdwenhYY2c1akRuY05udFVHYjRUTUZnSFo4bDlBWmxz?=
 =?utf-8?B?TU9pMXkvTkErdld5c1p4UWxESUNOcFJzeEkvS01uZlVBdjJOQzlPVGdVb3hG?=
 =?utf-8?B?eC9XN0hucm9iK1JmM0R4eEpKV1VGNEM3WmhrbzE3MTd3by9TekZ1MVNpOXFP?=
 =?utf-8?B?Wk1BY0tOa0dmY1pFL1lXRXQ5b3BUL1BHZ0F1WGRRTDl0QkpjTEkrNDV1YWlq?=
 =?utf-8?B?ODdXdDhWcGg2MnVrU05ralN2UE54NjFZSUJWUGlZNEhCYmZVQ09wbjdLMkw5?=
 =?utf-8?B?WSttdUVGMEc5N2ZGQzZjK05XcmhHeVhQKzRhMVdCcFVRWWVRQ1VvVHFGV3lm?=
 =?utf-8?B?V3hocG5MTlVpaW0wYVovNVNpaTlUaGttVnVqNUo3dEVlcXRiOEh6QUpXQ09I?=
 =?utf-8?B?VGM1RGxuNlVKVWNBU0QwSzRRbThwb3RGak1qd2p3ei9LbCtEZDZFUnR5RzQ3?=
 =?utf-8?B?ZHRZd1FuS1crVlluWXJNSmNId3JJRnBYSEVwbXltV0lJSGVPWWQwR3BISkYr?=
 =?utf-8?B?aEhPdmZneXZVQlZpSzB3KzVxbm8yNDhDQkcxZ3l2WndvUTlzbGxvdGZoQXpC?=
 =?utf-8?B?Y1RoL2djdTd4WnR2UEo2QXZJeVlzcDh4eXYrSmlpV0lFUGRRNTZRT3NVL0p5?=
 =?utf-8?B?Tm95cUpYV1o3ay91akVVblF1RTVkaGh3bUgyd3drVUxxV2NjS3lnbjNlR0dW?=
 =?utf-8?B?cW1GMk1NMzFtbWlSUFgrdUdKT3VOVmJMcksyUU84NE5sOFdCaXVxN1JzOEZL?=
 =?utf-8?B?VDByQ2pFbGx4K0dsU1Nva2MyVHFnSXRIdnEvYmdGRFdVMUswUDM0OHRJZUMx?=
 =?utf-8?B?VE0vK28rVThPeTNTNnlzMFhtNnlmODhVbFB4MHF4c2RTeU5xam5tMnRrSnhD?=
 =?utf-8?B?R3dYellKc2ZRdjRLTldUQ2hVVXRPeklzSm1BazljcVY0TnZvek0wWWIvdDBU?=
 =?utf-8?B?SkowTFozNy9ab3RqZ2trNkdGZlIwL1prejRnREdrbXJmeW1UaU5JTTdnL2hF?=
 =?utf-8?B?VFpCanR6VWsxdW5oeGJyT08zNDBlOHJXNHloaVBjby9xTHBaVDR3Q2M5alhI?=
 =?utf-8?B?L2oxNzBPWnJPRUc1ODlKOEdHRG9IL1N1NWM0UmRDL2FSS2N3K0l1NWhXcUFC?=
 =?utf-8?B?eit3UjRvSXZPeXNPUEtEc21zMUJQM3QzT1F0aWlyZFZwZ2Z4RXppNm5CSEdi?=
 =?utf-8?B?V1hEUFVwNWFNVlUyeUdnYURHSEtMYlBjN05keVNTMVBzWmxoeWdIM0poa3dH?=
 =?utf-8?B?S1pTYnZ2V2VmNi8xb3VNejM3Ymh6Y3NaSVNJbGMwZnRHamt2OVJQNWhCMi9Y?=
 =?utf-8?B?citQbHVoSVBSKzhScTk5VStCRk45bWlxVGR1QngzSUVNU0FMTkNPQXRNTjlu?=
 =?utf-8?B?ZzFDZFVGYUVpTlFQMDA5WjhvQ29scXlXeEcrSmlQdytReWZRMG1CbmNhbXJn?=
 =?utf-8?B?UVpaZWhDaXdDTGRvTE5reVV2SnBtK3JGajRhaGFpTFloU3o0ZVpvd0htL3Nx?=
 =?utf-8?B?a211RllMOVF4REVCUDFUTEY5ckhpUitMeUhyU1FONFIvYVB2czhJdEY0Wlk2?=
 =?utf-8?B?dk1vUmx2KzlMZHNROEhCM0ZFK0psRzZBQ3BxWUVqWDhLMXV2QkZhYklUc3pj?=
 =?utf-8?B?QWpDbFB3amVRbGZ1bUZTMERzMjRtOHJSa3VIR1ZwNXZZcHNCcmY1Z0xQNzRi?=
 =?utf-8?B?VmJnYkRyWDBNSFc1eUpUL0NuWWI5bUVtaWltYTdpamJSVDNxaklRTDlnTlhE?=
 =?utf-8?B?REl4K0pCT3VQZzM0NFphZklYU1pBTE1TMktvTDZhakZ1a2tEQy9hZnRPU3dO?=
 =?utf-8?B?US9wa2xERStFNGUrOEpZRWhSRVlNZDFvbWRDTlJ6RjhoclRQdlREbXBLaWZW?=
 =?utf-8?B?TDFFTWNBK2JHTjdackdTZStWSkV0QUF6MDd5QlRzdUlHd2Q4ZjVTQU93TkIz?=
 =?utf-8?B?OWQvYUM3bmdMK2plaEVJaXVmNk1NQTZBWTB6aG5jVVJoc3VNc1dCRFNNc0N2?=
 =?utf-8?B?eURuYU4xOWc5Q3lDeEo2L2wwYW9pV0tLbEVXbFVLVkhlMlE1R3Fodz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc076426-dc93-4ca0-769e-08de6a26b4c1
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 11:06:00.7581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PehOzqlNNwZ690rB/ma3LI65v7mRMLYUitEfhKWwbn1Md47mRiUIL9JbhQBBVOb7EtgpGA8T9hLNbwX9HAmzkh8TIE4XkSuh0fZ5qLJD70A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PR03MB8401
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:community.manager@xenproject.org,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 89CC212CD8A
X-Rspamd-Action: no action

On 12/02/2026 9:36 am, Jan Beulich wrote:
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -12,7 +12,7 @@
>      Xen-Version: 4.17
>      Initial-Release: 2022-12-12
>      Supported-Until: 2024-06-12
> -    Security-Support-Until: 2025-12-12
> +    Security-Support-Until: 2027-12-12

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

