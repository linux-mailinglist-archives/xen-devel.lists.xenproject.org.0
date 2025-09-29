Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6877BA86FA
	for <lists+xen-devel@lfdr.de>; Mon, 29 Sep 2025 10:43:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1132631.1470900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v39T2-0005pw-4e; Mon, 29 Sep 2025 08:42:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1132631.1470900; Mon, 29 Sep 2025 08:42:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v39T2-0005nf-1m; Mon, 29 Sep 2025 08:42:44 +0000
Received: by outflank-mailman (input) for mailman id 1132631;
 Mon, 29 Sep 2025 08:42:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rOW3=4I=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v39T0-0005nZ-KY
 for xen-devel@lists.xenproject.org; Mon, 29 Sep 2025 08:42:42 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41c12e05-9d10-11f0-9d14-b5c5bf9af7f9;
 Mon, 29 Sep 2025 10:42:40 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by CH5PR03MB7814.namprd03.prod.outlook.com (2603:10b6:610:213::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Mon, 29 Sep
 2025 08:42:37 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 08:42:37 +0000
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
X-Inumbo-ID: 41c12e05-9d10-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V4E5zaPME3bltlF7dUObGPbHUAcPq8dCdCkzCJY9OhRN5ZkWINBM/gvl+Uqy9K1bl/6P0bBRf9/R6Pe2KEg8Q/qN0o2qO6SUK3q6ITAeG4wjX/K+pWH8GynQWy4HYG4HzrtDu8usynWt8hY7IUL169bEMryb9p3yOclqshyciJYC85Xd/effgiVe3mHQ16FftVS8jCwPT7jhyYsDOueUPIOgxhFwn+Dj45PfynlFzKccbzryZmpItmBjWF/uOQXSxXN+88y6QnNofSpx/YJpeJqtXoUHFWUzOCYCUJb9s2kpfwb0mxT034Sjn2E35kUk8hhu3zAwlSjQ6gMmHZK1jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JkP8vxyU157c6Jk9+NLX/UXEx2hKaJu27EL6ycjAjIQ=;
 b=D2BKWhOHX6BZlOk4ie19XiyUNA6Tbk70wKPEVUr+/Tsv539BUvmt027Enj/LH+FaC/HiGwXc2aQEETLhVplyZjFhRmwi3mr4uWfFg670LstN0Z/8iZIFBfuvjI/CRxu/pP7TsWQfIf9nggvxEYr0ySp6H4SZYnpBvlwuuUJoVEtCIcT2EzK8yLvGGtXZ8Vh8uLxvRehx8oChA10DYICwcx3MfjibWWevry+fkACthaOtaU+gvzvUJKAtvGqTqukd0UcyoKxBftKF5Xq9MtfFjkAQBcbhWv7VTnLYWS8sRjZqNbgTxE0WPlr8X3tfIwFKzUgbXt4lyXgwRN1ERMscRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JkP8vxyU157c6Jk9+NLX/UXEx2hKaJu27EL6ycjAjIQ=;
 b=VGF2/Ug6oxo9Y/cOWILukoRo0J2IKrQCSXPknU2acHNY5niIsmh6wz4iZAeRqme9wvHpYGQjSkh+XvSEUfRgq9svXkCL+EHcXJQ+iCOl0gnTa/rifOE9QOBrXh4EmiBjBRQNBGXFFYGej/yfDB4/5pjMERIjWl0zKWq4hz2FHOY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.21] vpci/msix: improve handling of bogus MSI-X capabilities
Date: Mon, 29 Sep 2025 10:41:49 +0200
Message-ID: <20250929084149.70560-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA4P292CA0009.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2d::6) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|CH5PR03MB7814:EE_
X-MS-Office365-Filtering-Correlation-Id: f32c3a1e-788d-4071-c825-08ddff34240d
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ek40TlJneWV5d09nYW9VOTZiaVRxUC9od1RKMzdpdEQxQ1RVREZmaVB5UzdL?=
 =?utf-8?B?c1RhdmtEaUc1WWZPc2R1ZWVhdEp6THROcjNtUm9ncjZNZkI0U3FIWWM2MDlv?=
 =?utf-8?B?R1gvV0pzcStWTGpjV3hVU3l6T3VXcEE1OTFYdVd5M3FoN1NTangzYlZwUGJE?=
 =?utf-8?B?b0RxSDFDTVdrL1lycUtndDhvVExEaEJabUduYlB2ZDB1Y20wOEErMXBkUEF5?=
 =?utf-8?B?N0svbUhxdjA0d1cxZThkL0hOR2tMYmdUVVF2c0ZHR295blFxdFRlUVpPSTJJ?=
 =?utf-8?B?MzZFb0h2RkVjRjBvQ2M1WWFTMk1YbHg0S2tnMzVuMnVKNXlEbUZKcHluWFlo?=
 =?utf-8?B?eU9XWm5GVFBZZkg1M203WGg5T0QxQnFlcjNNQkk2cVZYUCs4RUR4T3NucW1D?=
 =?utf-8?B?bWZGUExIYW9DajFSK3hjRmZSLy9hcHBiYzJNeWVVL3piVFFoaVZWb0hnUG9z?=
 =?utf-8?B?S0pzMjNmMzNCL1o0aURobkxhTFBIdDFnSmxQT3JsbkpWRGtyN3NDaWF2aE5U?=
 =?utf-8?B?NENMcndRaGxoMUsyd2c4TVovZXpsUTllUytla3Zub3UwNFZ6VjNweGFmckhj?=
 =?utf-8?B?U1M1SWEwWmkzZmFkREVOT0x2K2sweUdmWE5LdEwrTnJWdmhab0oxYm54OXRk?=
 =?utf-8?B?VTJLMDdpQ0ozcVFETStveHoxWlJvajFqQmprZHdnL1pFNnZ4SCtDQ2hzd3E2?=
 =?utf-8?B?MkJpT3lKeXFFa3pDaWVjUzdJK3N2Nkx0aStsSCtuMHZSckI0UFBBY0N2Ni9x?=
 =?utf-8?B?Q0d1djRZbTQ3Rjg3UHd0VXdMRDR5MHZudzNIc1dzN2xpUXdwN25ML3pTU3ZP?=
 =?utf-8?B?ckhTSkNuNjZPRWlhSUdkSFgwMWR5OURKRU45cU5PTWtxYmQ3QXdaNXpJbXpT?=
 =?utf-8?B?YVhKS2Q1MzZtWENoWGZPckpxaWJYZUJOVFZCN0s3ajExTWNHZlJ2dGFXdS9l?=
 =?utf-8?B?cmMyODNRN2dUczN1bllqbzdMakVFQ2h1MXVnMGF3ZUozYzkvTjN0eEJqbkh1?=
 =?utf-8?B?ejJ5SXA0WGNxZjJIWElxTFBZZE83aTYrcHFvUkZ5djk3Yi9UYThMVi9nWHl6?=
 =?utf-8?B?bXhON20rVjU1MHQwR2IremdLREd4WlhtZGdrZjV5eTdzdnZ5YVlaajB0bGVO?=
 =?utf-8?B?dWY2ZktFSElvc0JBbXJpeVZhc1lGNjhQeUhYOTNpT3pmUkZkaVM0S3pyeU1y?=
 =?utf-8?B?TUFleXBEY25oS1pzZWhkZWUybm5idllTU2M5djQ5aHlzK0ZQbE1IajB2S1M3?=
 =?utf-8?B?TUtaRXF2djU4MnQvME9pY0xWelVGaU5NSlFkd0ljVzFmdU9UYWZ5eWZob01M?=
 =?utf-8?B?K21lM01FV3ZMMkpIVjc4c3g3bUYxdEl5QmVYdlY1V3l1SzN3L0FjeTJGWWZJ?=
 =?utf-8?B?REthVjR1YVlNTU9qRG5pdG1jbFpMbmpHTEZsMWRXMmZqd2F6M0IrZmFMZ0pW?=
 =?utf-8?B?VEhPa3o5bDJjV1EvSm9HYyt3aldkM2V6UWYzSndxL0htckN3SnVLY1ZvT1pV?=
 =?utf-8?B?cndnWWNQL0xQUFRHK2FZS1U3Y0hMZkhoTzVJTDY2cHNPTzZENUlkVUM0YlJw?=
 =?utf-8?B?NytLNGdmVGR2N3dieFd1K3EvaW9NcE5VdlRXMEdYZDdiOWlEWVNMd3FkTjJn?=
 =?utf-8?B?YnU5SGhEZnBhZ1haeHlIanZVVnhRNlVSZFpRREpNbmNmRi8vY2J2YVRhU09n?=
 =?utf-8?B?UzFjQUhGeDhOZlRTaUYzTmR1anJGcUtwMVc3TkdRMzJSS01ubmNFZGRiZHN1?=
 =?utf-8?B?VEQ4eGFJcXdjRmNKN3hvOTNCQUUzV2pYd3U3SWlIblFaY2Mrc1FKdnk1c0hk?=
 =?utf-8?B?MGJMejZ4Tm8xaW8vWjBQUEZjenpIbGpUdUk4OTlQVEIyR1lOaXhUc21vRmNr?=
 =?utf-8?B?V1VhdXVRT0gyS1pJTEZiSkU4ZTFBMTBQQTZTVEhrSFZ2TTQwWk5ZRG14Lytv?=
 =?utf-8?Q?PJtkYlDryEZ+Dx1qyOKnt4uI84cL1Dfp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZjlSRUhxbjV6a255M21hcTNXYkZLVHdTZDNhQ2RiUTl1R1RoQmpRaXZXMkp5?=
 =?utf-8?B?bkFVZzRqMTkwdDlxaFh2T2FNcXVRS1UvNWhaNjV4dUJXR2FHYzlTeGxHWTJt?=
 =?utf-8?B?TFl3Z3BMK2taM0wrWE00T0hGVlVhNjRIQkY4VUhhWXI0V2tYYlI3QXVEU05r?=
 =?utf-8?B?U3NIMDN2TnlTMkhab0ttYW1CQmpVWUU3T0xhVEdZU21pbkFSVE9YU2xoUHdh?=
 =?utf-8?B?NXQrVVVsd0NLb1J5RldzalFiclQ1NjlJNkFGQ250bW5IZVlOSnFBZ21TNmxs?=
 =?utf-8?B?TmsrWFY0dzZ3SHJjTXFQS3lsbXc0VHV6NmdkUlZpa2QxUFgvT1ZLdDVWdEU3?=
 =?utf-8?B?dzFiMVZ4N1A4TkhHMG5pN1pyakk1cUJsRzJSdmRPcmhXY2lsbVZoZ0RFYWtE?=
 =?utf-8?B?NU1RNWZVR0wwM2ZSb0l5aU9UWGVJaXQyd2IyQk1kSGhxUkR2d1ZUeEdUWWkz?=
 =?utf-8?B?R1Zad3ZhQ282dW9sS2tWRHlKR1B0bVkybG42THVmSU9XTEZteVpxSUI5bHJT?=
 =?utf-8?B?dlBDU2o2VS80VFk3a1VFdmV1VG9odkRqMzRJK0phTlVTSUtZR09aN0R5SjNQ?=
 =?utf-8?B?U0cxbmJTd25PbWYvbjhJNzZmRzNEVkF6RlhJS2x2SS9aWmJlNjNoUUNEOWN4?=
 =?utf-8?B?ZHIrRitxMnlHbDdRWEw4RWtTTmN5ODJ5VGpBUC9PZklNd3BVK0ljMlJxUDdQ?=
 =?utf-8?B?U0EwVFdSOXFVZDVERjhUWTErKzVJTmRuVTRVUVgrRVhTeXJLcTYwb3UrWFFU?=
 =?utf-8?B?S04rQUdleUlyN0k5YnMwUFRsZXU0M0xHdkRnN1lpRUlhSWM4UTNGR2tZcDBh?=
 =?utf-8?B?c2dDcE5xMHNPZDBZcUpKS3Q4TFZRZWl4cE9sZndOZ1Q3dTFJanVMdmRRc0l4?=
 =?utf-8?B?ekpETy9zMlZCY0NrbGRhZmd3SjFmZlFxNVN4TS9HRVJrQlc2eS9FV29jRWls?=
 =?utf-8?B?ZnR1L21FOGcvRzI5ZVdCNGVhbUZCSXpoZ3Z1c0RDb0Fsd010N3AyZmVKbFU3?=
 =?utf-8?B?UHdEbWxPYlFtUndGVzNQbnl5c3NiWi9pVkJnUDhnbjNKeU5iQjl1bGcyZExl?=
 =?utf-8?B?aDZrK3pibE1OdDR1eGZiNkdLMU81cjVzYUUzRFlwY0JkSkY3RVcxZnN4dUhI?=
 =?utf-8?B?TlVlK3UxQmtlZ0VsVVRCL01FTFg1U0NwcmxMcWJEMmlxQUQxL0k2emFtRm40?=
 =?utf-8?B?b3A5TGYrUWRVVXI2eXByZnFaRkZMS3ROZHovbm1sYkR2WFdWcGxNN1JKa0pM?=
 =?utf-8?B?N1cvQ1hSQzdnR3Q4YWEyKzZUcUZxcW5VUWMvcHBLTHBZdlUweU5QNnp2TUNh?=
 =?utf-8?B?MGJXY3B2NVpMczBRQ3V1Y0dqcCs4eURsWjRGQ1FDUWxGTTE3alVXSU9pdjNE?=
 =?utf-8?B?eEFBbDdLcUNqY09DdElvMWtqWnU5RWJrbjcyakRsclhPeW9HOEpZeDlTbnRX?=
 =?utf-8?B?NDMvODRVTzBVZ3NZbklWaXliY3lsRll4VC9zRTNONjNTQmM5bTJYSTE0UlNJ?=
 =?utf-8?B?Znc0YnNTVkFEUWxFbWp0cjRqcTI4dGp3SVl5NVJXR2x4ZWJ4YStienlPNzRY?=
 =?utf-8?B?L0duTnk2WCs3Z3BSYzVXRnNEYzJudlRvaWl2UFUvRUs1cEE2cjRJL0dqVXp2?=
 =?utf-8?B?LzZWMnBzRiszTE1VZ2JZT3lvdlFvWTdvM2FiYWpIRjI3Zm9wUys0SERaeTBM?=
 =?utf-8?B?R1ZJTXVmeHpiblhvSm1GN09EaFB0aEJiRDhwMTlqRm1ORWQ1Mk9IbjFPVkMw?=
 =?utf-8?B?cHdkczdKUFZNYVV5aWdMK2ZnZ0Z3N25aN0pycVJEQmhYN2lNb085WTVoQUJZ?=
 =?utf-8?B?SXd1QXIvbHY5YXpxZ1ZjQ2p2bXZmQkM2RjhqVnRwbURXNnlHM2ZCVGFOVHZR?=
 =?utf-8?B?Z0JGUFdudk1kSCsranNmbzQ5Nk1UbXNUUkFxaWxaZFNndHlOcW1uTDZObmpy?=
 =?utf-8?B?Zm5SMGxUSmUxM0Y3bGRnSWc3OGF3UUwveEg1NlJlOElaN3RmYUgxdStXNUxq?=
 =?utf-8?B?bGprZGpNU0Q0NFZ5ZGVCWXFJdGQrSnlJQzdRSlU1M2F1c0lJL0pXVWo1Z2Fm?=
 =?utf-8?B?VWFOOURGQ0RrOVJIdUpmN0lKTW1LZHJreC95bGFaMkdJZjJLbExERXNOd0o4?=
 =?utf-8?Q?4FfO9e6nOYvN2SUS3ENxS/6bD?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f32c3a1e-788d-4071-c825-08ddff34240d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 08:42:36.8585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W9nggHvMQdAjf8T6xsiqYhslRBIjPOwlch0jFWH0i0+OdgwK8Jsewp/ojEFNNZnLdwFFYiBnFT7ekXNa3OFEag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR03MB7814

I've had the luck to come across a PCI card that exposes a MSI-X capability
where the BIR of the vector and PBA tables points at a BAR that has 0 size.

This doesn't play nice with the code in vpci_make_msix_hole(), as it would
still use the address of such empty BAR (0) and attempt to crave a hole in
the p2m.  This leads to errors like the one below being reported by Xen:

d0v0 0000:22:00.0: existing mapping (mfn: 181c4300 type: 0) at 0 clobbers MSIX MMIO area

And the device left unable to enable memory decoding due to the failure
reported by vpci_make_msix_hole().

Introduce checking in init_msix() to ensure the BARs containing the MSI-X
tables are usable.  This requires checking that the BIR points to a
non-empty BAR, and the offset and size of the MSI-X tables can fit in the
target BAR.

This fixes booting PVH dom0 on Supermicro AS -2126HS-TN severs with AMD
EPYC 9965 processors.  The broken device is:

22:00.0 SATA controller: Advanced Micro Devices, Inc. [AMD] FCH SATA Controller [AHCI mode] (rev 93)

There are multiple of those integrated controllers in the system, all
broken in the same way.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>

While not strictly a bugfix, I consider this a worthy improvement so that
PVH dom0 has a chance to boot on hardware that exposes such broken MSI-X
capabilities.  Hence I think this change should be considered for inclusion
into 4.21.  There a risk of regressing on hardware that was already working
with PVH, but given enough testing that should be minimal.
---
 xen/drivers/vpci/msix.c | 50 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 45 insertions(+), 5 deletions(-)

diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index 54a5070733aa..8458955d5bbb 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -675,6 +675,51 @@ static int cf_check init_msix(struct pci_dev *pdev)
     if ( !msix )
         return -ENOMEM;
 
+    msix->tables[VPCI_MSIX_TABLE] =
+        pci_conf_read32(pdev->sbdf, msix_table_offset_reg(msix_offset));
+    msix->tables[VPCI_MSIX_PBA] =
+        pci_conf_read32(pdev->sbdf, msix_pba_offset_reg(msix_offset));
+
+    /* Check that the provided BAR is valid. */
+    for ( i = 0; i < ARRAY_SIZE(msix->tables); i++ )
+    {
+        const char *name = (i == VPCI_MSIX_TABLE) ? "vector" : "PBA";
+        const struct vpci_bar *bars = pdev->vpci->header.bars;
+        unsigned int bir = msix->tables[i] & PCI_MSIX_BIRMASK;
+        unsigned int type;
+        unsigned int offset = msix->tables[i] & ~PCI_MSIX_BIRMASK;
+        unsigned int size =
+            (i == VPCI_MSIX_TABLE) ? max_entries * PCI_MSIX_ENTRY_SIZE
+                                   : ROUNDUP(DIV_ROUND_UP(max_entries, 8), 8);
+
+        if ( bir >= ARRAY_SIZE(pdev->vpci->header.bars) )
+        {
+            printk(XENLOG_ERR "%pp: MSI-X %s table with out of range BIR %u\n",
+                   &pdev->sbdf, name, bir);
+ invalid:
+            xfree(msix);
+            return -ENODEV;
+
+        }
+
+        type = bars[bir].type;
+        if ( type != VPCI_BAR_MEM32 && type != VPCI_BAR_MEM64_LO )
+        {
+            printk(XENLOG_ERR
+                   "%pp: MSI-X %s table at invalid BAR%u with type %u\n",
+                   &pdev->sbdf, name, bir, type);
+            goto invalid;
+        }
+
+        if ( (uint64_t)offset + size > bars[bir].size )
+        {
+            printk(XENLOG_ERR
+                   "%pp: MSI-X %s table offset %#x size %#x outside of BAR%u size %#lx\n",
+                   &pdev->sbdf, name, offset, size, bir, bars[bir].size);
+            goto invalid;
+        }
+    }
+
     rc = vpci_add_register(pdev->vpci, control_read, control_write,
                            msix_control_reg(msix_offset), 2, msix);
     if ( rc )
@@ -686,11 +731,6 @@ static int cf_check init_msix(struct pci_dev *pdev)
     msix->max_entries = max_entries;
     msix->pdev = pdev;
 
-    msix->tables[VPCI_MSIX_TABLE] =
-        pci_conf_read32(pdev->sbdf, msix_table_offset_reg(msix_offset));
-    msix->tables[VPCI_MSIX_PBA] =
-        pci_conf_read32(pdev->sbdf, msix_pba_offset_reg(msix_offset));
-
     for ( i = 0; i < max_entries; i++)
     {
         msix->entries[i].masked = true;
-- 
2.51.0


