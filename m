Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C25AC80838
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 13:41:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170681.1495778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVry-0002YG-SP; Mon, 24 Nov 2025 12:40:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170681.1495778; Mon, 24 Nov 2025 12:40:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVry-0002Wr-Op; Mon, 24 Nov 2025 12:40:38 +0000
Received: by outflank-mailman (input) for mailman id 1170681;
 Mon, 24 Nov 2025 12:40:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h9jE=6A=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vNVrw-0002Wl-Ov
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 12:40:36 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c590c335-c932-11f0-9d18-b5c5bf9af7f9;
 Mon, 24 Nov 2025 13:40:35 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB5423.namprd03.prod.outlook.com (2603:10b6:a03:28c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 12:40:32 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 12:40:32 +0000
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
X-Inumbo-ID: c590c335-c932-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NiInqFaHW7OYgbTDZ6+vJkTVvytFT9TxrPniI4AOCYoPEclScVQUC2xOTSfhxHAyLJ8FBFBP7cq6rx4DkBooZlBwOuq1L82hVPmfuH/N8SrKtuwYQXWMu+E3gzWvb8da5o8BqRBd2fqYIBwvbrmqzOgnDNmgj1ZFqOhWUqzK1hXIZ1G6tTUY35murDFgDU85Dpguh9SiVq6TEbR5MnsIKswHl3grSx8OFErbBddWfe/Lp2HaBY0UVnWz8vrcSNwbsQ2fUeTmLbLqnq0cUouwVuIsz6jx3xixyQChrEUBdDuEYAZKYg0cg5yLlFrbHzq9OwptmGVS9gCT4+T+KHamRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5vclgoVwekH8F6mA/m96YPNYPYJzrndHAlHTFDeAf7g=;
 b=RYJEqR7lYpmRqMzUPm4GNGroAeW8x27NQU/FJjf011RBVCj0wzdDi5lo84j3pAwq1prYg/tNWTdKJLcVoj2pQ4ORW95nYwqxa7PrhDW+KH3xzpoJS9QF/Yd1Boi4lkfQwPTnEMC6lyYbJDVycua8aBEn+bTsdpwACy6evEW60jRU4d1a+8qM9YT976i6fz5Y45itWjnrUybbqfrUz2oqBOaZUH5qrsTTeJGfNz/XgeAWeukTqoO7u91O3yM+m5hn6W07JtiSFq55ksmpY4q6P4bjDc2Osf+rdoRk5Y5EVSyCezw6W9nZqBz9qvkbb8Q6TWjnZl14egVRaRSO/ZgKhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5vclgoVwekH8F6mA/m96YPNYPYJzrndHAlHTFDeAf7g=;
 b=cDdsT8GNnB3pNoIOkaybJDEwxe2iIJ60XMLzOMWZZJ2RD+iEYQs8kgfPrEZOG4SMbkkYxYzmmvLajp0hrtrHnbKuEc0wlqe/eIvjAIooM4IkEZY8KcHLUYusoSvU9OPoHe4zjOr3/5nJ+r4JUw8jD6uHqGKiSvwbL/MRteEnt+M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <4876be02-9978-49e2-8a48-d7ca10e06843@citrix.com>
Date: Mon, 24 Nov 2025 12:40:29 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] XEN: enable MC/DC coverage for Clang
To: Saman Dehghan <samaan.dehghan@gmail.com>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <3bb418ae6a36a9ac89c697a417fa0745fa9ac702.1763949990.git.samaan.dehghan@gmail.com>
 <9c76a959-51c0-4eb7-9d05-ba4441318faa@citrix.com>
 <CAHFNDNikjXNHCj2RXMoZPckqaQAy2u-xw-QyCO7nXT3pttp6Hg@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <CAHFNDNikjXNHCj2RXMoZPckqaQAy2u-xw-QyCO7nXT3pttp6Hg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0291.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::15) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB5423:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ffc7af4-73b4-44e1-233d-08de2b56a827
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QmQwK0c4Tmwrdi9mR3ZueEpvWU8xTjVmV0R0bFdnOE5ZWEtia1pwdUlHaWxP?=
 =?utf-8?B?cXk1Z0dJQmNKYUFpaE1sT1NjTmE3Q2MvYWhsMW1haXNkSjgzazdtbW1oRmhO?=
 =?utf-8?B?aGdla1YwOUpMSy9DdjcwODNlVEhiMzJVeXpZSWFVeVIwSnZ2U2Z0Rko4Nk5z?=
 =?utf-8?B?TDZLaGdOMUYzZzNTdnllbjA1YUVCZjZGRHM3YzN5TzRXa2RUb0JkMTlwZ0NN?=
 =?utf-8?B?K3FUMFhDQ0ZrM1lmcnVwUXBZdlErL3F2dVZWbUFOV2hLMjlyb2REeng3WGo0?=
 =?utf-8?B?ODhnTkRhWDFXdG4vTUU3bkk2ODNDMEE2YitSS1ZwOGNhckVlRk9SVmNsdHY3?=
 =?utf-8?B?cDV6ZkhrdTRGeG5kUnQ4MHlDZEdJYk9yTVJ4cnM5d2ZCdnVWbTZDblc0K28v?=
 =?utf-8?B?cmxnY051QUNkOS9scUx3SmhuSVRCWmpsZ2VHWUwvWTJmeisrU3ZqODREWlR3?=
 =?utf-8?B?RUYvVWhob3JRY2RBVS96cmx3ZjdiL281cWZWd1c5RFpKblVjZWQxUXB4eWw1?=
 =?utf-8?B?eEp0dUg5bGR2aXBYU0dlaFRlK0tKeUc1SkljNXhsY2xkZzdyRGF1VTA5bW0x?=
 =?utf-8?B?WmRraFpieFFSdEZrTXBjZFpDQVRBdzB0ODFKVDhmNUh3Z2liZ1BLcWlXakNV?=
 =?utf-8?B?WmNrb0dSRCtrTDJIZEpQbDFBS1pjMjZlQ084Sk54dWhOU1ZWejhmM2t4SUIy?=
 =?utf-8?B?bUF5UjZHY25YYkQ3RUowZUZJY2o5c0hUQy9HSkthMVlndU1MbXY0M0g2eGFn?=
 =?utf-8?B?MTdNelh1aFZodTVBUmdiWUlTVko2VXRUOHhFT1hFOEg5TGZOMkozV1FIWUJF?=
 =?utf-8?B?Nk90TjRTWCtiK1RIckZRVUtxdVgrS092bDdmc2hQZFcxcXByTXFFVjVqbHE3?=
 =?utf-8?B?bTlyeDMwbkhKTlhnWEcxZFJBTGhNdkNFYUp0UCsvRWVzRUgxbHdVNlREVlBV?=
 =?utf-8?B?V2ZrS2tBY2NJMmIwdTlicnpMS3g1N1R5YlpydmxZbERMaFJtNXBOdDdNelBZ?=
 =?utf-8?B?Y2FPUjlxaDlvYkpidTkvak43QmhnME1heUhySzBEU2dJYnJhZjAxaHpsUEt5?=
 =?utf-8?B?N0I5dEtwNy9HY3ZvVS9meDJUK1lRK3RjTWZSb1FHVFA0L1lkdWtYREhmNURp?=
 =?utf-8?B?bE1xbEFWTHliaExGR1NNR3REYkZoN1hFaUtvZ21iUU1UYjRibmdRNFJMRkk1?=
 =?utf-8?B?a014aFM0QkViOUhJL2dUc3cvYnNnU3ZmSEF6ZTN3NUdWdnM4OHdWYWhxUzZ6?=
 =?utf-8?B?UVpKckZyQ1czd0FHTjM5dXRlNEFHSnhiWHQ1UWJQK2pqQ1dIOHhhaGM4OWZE?=
 =?utf-8?B?dE51Tks0eDliZU1kQU1tZVhESVpCRk1WUUkwQzJFdkRZbHl5NmpGZjE5SWZC?=
 =?utf-8?B?ZTQ4V1JmQUI2NDNqSmxDT29Panp1L2s5b240UFhnNHJGQW8vaFdhd3BZM3NY?=
 =?utf-8?B?c3J5bGxGZGJHUEVuNm5ZOVlTaGtOT0Q1SDAvYS94dUpYd1pYQlN5UGFQa1hn?=
 =?utf-8?B?WGowMzJEUW5lVkhCSzlSc0pEK1pxQ0hOMHUzckd3T0IvZ0h5dzk1YjdxN2tr?=
 =?utf-8?B?WGs5a1VwY09pZGtFa3hIQ1FNVkVLUStOZUl4Y0JiTng0aWpCQlFuRk5CNnpo?=
 =?utf-8?B?WGliZmF5WEZXdVBiODYwKy9sbmJEbTcrSzNrb3lyRjdTd2NwNHo1V1VrdUpi?=
 =?utf-8?B?aGNmTFlHcGZlOUtjRmVPa1EyeDMxWi80Q2xtc1hCY3N6N3htUjRjNUIvZXpw?=
 =?utf-8?B?TnRBUS9kNjIyUUY4RkY0ZVRoWUd1TDZJT05abnZ4VTdqK09SWTJyVkFSTklr?=
 =?utf-8?B?dndmZEtYWWM3Z3oxQ1R4ZE5vVTV6SWpuS2FuVWQ4WHgyTld0WXgxaEtiQ2lZ?=
 =?utf-8?B?MEp0cVNORG9iN0lnMkNsM1JPTHkybktJMUJ0Ym1nU3FrbjRiSFFvdEpyQVFS?=
 =?utf-8?Q?ZdlrE3fX4rFnxuOslyS1+ZBDUIBE/coy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UG5GelJkYWY1SUtpaHNBZUZXenphelB6citaZVdQb2p5WmEzTGZSMm5TZVdi?=
 =?utf-8?B?T0oySVJUMXRYb0l4eGEyV2lLd2pIUkxuTWpvOVRpd25HdWpOeEVkZTdKYXlQ?=
 =?utf-8?B?QUV4Q3hlOXk2NzNhUmpONWxidnBMaUc2VEtSeTM0TUhoa3NJRGh0cjkyd1FW?=
 =?utf-8?B?OHRtaVNOajliYVFabUd1d0JDdFB2M2hGMlh6YkdQaHpXVEJCRmtUS3Zsc0o2?=
 =?utf-8?B?YXBPeG1qN1VxN09LVFgvaE5WWTFqaGN0RjdaM0VQU0dFWnNYWTN6Ti9XVUJn?=
 =?utf-8?B?WFRkL3EzdkswRTlac3lTMVhkWjJiN0I5ZjM0U0RnTjFST2pvTEh1RUh6dGwy?=
 =?utf-8?B?bDVXRXBpWXE2WUhiWEtnVnNhSS9iT1hwaVBydnpGbEFmbjBqRGFoTlhlSm82?=
 =?utf-8?B?TGNQRFpkcUFwUyttVFNLYlVUbWY1ZE9MRVVITGFzVytrYWlQbE11U3VYdW1y?=
 =?utf-8?B?anlxNGRpenJYdWRJT0daMWYwTUMyN3IzZUVCUjJrM1QvYndxYllkeGZQRVBS?=
 =?utf-8?B?b1VyUWRQU3JRcWJOQzBsbGVBOExSMGRVdVdRSXI3UmRpOUtHSnBSM1FtbTN4?=
 =?utf-8?B?OW00M20vdDljUmV0ZmpHZFhxcVRsWkFSS0NRNUZ3REtLZ2lVdDJLYnZoVXZR?=
 =?utf-8?B?R0w1REU2Rjg3TGVXVUJrMDlLNGU5ZHN1cmk1cDBLZW9IVUJuZk9hQ3VXeFFH?=
 =?utf-8?B?MkhkdEt0MG1HaFN3Z0xEUGZRYWw5NHFiMldzL2w4OHgxWkJpOWYzR0crWllO?=
 =?utf-8?B?ekZER1R0aDQ4NDV0NUx1M0lFYmpNVWZqOXpNRmZ0c0pzRG5qd3dqcDBhV0NG?=
 =?utf-8?B?K2ErQnZQU1BuZVpDcVV5YUw1SEdFVGl0bGhqSDF2b3lEa2kzdEIreTNCdlpP?=
 =?utf-8?B?SHJzQVJTakRUTE1Vd0RWUFNTZndNNzdOT09MSjlYVG1aYXlDOHFrdEN4T3l0?=
 =?utf-8?B?Z3MvN0F6U0RvcWRRUWVYa0k4SHcyb0NvTktpM3NEUHZYNTA2clhoRXU5SFNU?=
 =?utf-8?B?M3lZcC8xdkFuczBRQWFoQklJSkc2a2QvUUlwQWFuR2hIY2U0V2trQWJSNVZo?=
 =?utf-8?B?MTRUcnlZL1NXRlhBY2ZOUGhBemV2N3VEbmlNWmFDWFdyTk4xTVc5TlFPL1hX?=
 =?utf-8?B?U1lETytUdjBIKzVzZ3gxOGJLeFE2YnVaa0ViTEtvOUR6RE8xS2RFS1FpT0Np?=
 =?utf-8?B?NE1lR25QcUwvTWRuNTZLUUh4d21iVXh1QUJ3SkJJeFhXY2wzV25kandHUyta?=
 =?utf-8?B?SzN4RnFZQ1NkYjRKblFFYXhjaG0xdlhCQVEybVhBSzdZQ0N3V2J4L1VhSW9M?=
 =?utf-8?B?ZnVydWg4N0xOSGdrbVN6U3lRZHBwSFlWSitUS2R5RmQ1emtzbUJOSnNLdnVQ?=
 =?utf-8?B?UjRFZUZKcnF0WHBFU1J2UE1sMXcvdVlURG82a3NUa2kzMVNDVGwrSUNQeVJl?=
 =?utf-8?B?SG5VL3ptZDhPb0RTTExRWFAwMzBYNzZDbjh6S1ZjWFhSVFl3cU9Gay82dG5X?=
 =?utf-8?B?NTNNczFQdjV4S0kzL0NsNEdYYTM0TEdackN5eGRQK3MwekV3Y2tkQmRoNXM2?=
 =?utf-8?B?YU5OYlRIUjVydFRLZTBWQms2TVNxdndqMnJGOFdmWGJmQVVNMjlDKzMyamt1?=
 =?utf-8?B?RmxaUG4zMXAvSDgzRDJ0RkVyaUNQWlY0U1V6WXo5dHRrOU1aek5VNXRWeTlz?=
 =?utf-8?B?SnNnNHBMUm90bnhOTUhNR2ZUSFMydzJtVTNBWkhiQUhtaWkyYlBGYXRJM1Ri?=
 =?utf-8?B?TElmWnBqSVlnUSswL0xZM3dZM3V1N2c0YnU0TVBRVVZTT0drakw1akJseHBq?=
 =?utf-8?B?Z2RCOEFvK1VHTzZXTm02SXU4MlU1MThSNTFnMGJTM2pTZUtvM1NiOHZ1T0kv?=
 =?utf-8?B?YVdrSHdwL0lkYWJoWFBMMzJySG5IYkRxZWhncWMrVE1HZXlHZUkrMGhVY1VH?=
 =?utf-8?B?LzdaN05ZTVdJRnBYL3VFRHRXVUQzRHovSk4vaWJwYnQwOXdpRWV6Y0FCaDZS?=
 =?utf-8?B?ZkhyR2wrcHh6ZE1MMGdnQ00zaWNCK05GZ1NaVU5kWWNJd0pwQUJFZWR2Uyti?=
 =?utf-8?B?alNXekt0KzJwZzBXUk83WjM5N3hrV3JhbGFsMk5sblloZll5ZGduRGFacjFy?=
 =?utf-8?B?aS9aWjg3U3pndm9mYmd3UkU2dEU2dHBOL2IvL3RvOTdIbXl0M3RGZW00WWhL?=
 =?utf-8?B?SEE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ffc7af4-73b4-44e1-233d-08de2b56a827
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 12:40:32.3531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VgJf3r9+hF0T/RpyMDmm2kCBd6giy33L2A/IvaDwmP5FRmSBrvylmfeYKwRgXjujQnq6N+TMtD/T+/yLYjLJscpfz/Y4ra9Jsu5PRQ6tV2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5423

On 24/11/2025 12:31 pm, Saman Dehghan wrote:
> On Mon, Nov 24, 2025 at 5:15 AM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>> On 24/11/2025 2:18 am, Saman Dehghan wrote:
>>> @@ -127,16 +131,25 @@ extern uint64_t __stop___llvm_prf_cnts[];
>>>  #define END_NAMES       ((const void *)__stop___llvm_prf_names)
>>>  #define START_COUNTERS  ((void *)__start___llvm_prf_cnts)
>>>  #define END_COUNTERS    ((void *)__stop___llvm_prf_cnts)
>>> +#define START_BITMAP    ((void *)__start___llvm_prf_bits)
>>> +#define END_BITMAP      ((void *)__stop___llvm_prf_bits)
>>>
>>>  static void cf_check reset_counters(void)
>>>  {
>>>      memset(START_COUNTERS, 0, END_COUNTERS - START_COUNTERS);
>>> +#ifdef CONFIG_CONDITION_COVERAGE
>>> +    memset(START_BITMAP, 0, END_BITMAP - START_BITMAP);
>>> +#endif
>> ... this:
>>
>>     if ( IS_ENABLED(CONFIG_CONDITION_COVERAGE) )
>>         memset(START_BITMAP, 0, END_BITMAP - START_BITMAP);
>>
>>>  }
> Thanks Andrew.
>
> IS_ENABLED(CONFIG_CONDITION_COVERAGE) is not the same as #ifdef
> CONFIG_CONDITION_COVERAGE.
> When the option is completely undefined, IS_ENABLED() returns 1 (enabled).
> So even with no CONFIG_CONDITION_COVERAGE defined, the code takes the
> "enabled" path, which is not what we want here.

What makes you think this?  (No - that's not how IS_ENABLED() works.)

IS_ENABLED() exists for the purpose given here, to turn preprocessor
conditionals into something visible to the compiler.  Notably it allows
for syntax checking even in the disabled code, which is why it's
preferred wherever possible.

~Andrew

