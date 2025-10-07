Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59325BC071C
	for <lists+xen-devel@lfdr.de>; Tue, 07 Oct 2025 09:01:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138518.1474205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v61ha-0004Dz-J8; Tue, 07 Oct 2025 07:01:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138518.1474205; Tue, 07 Oct 2025 07:01:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v61ha-0004CT-F9; Tue, 07 Oct 2025 07:01:38 +0000
Received: by outflank-mailman (input) for mailman id 1138518;
 Tue, 07 Oct 2025 07:01:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HvEU=4Q=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v61hY-0004Br-K2
 for xen-devel@lists.xenproject.org; Tue, 07 Oct 2025 07:01:36 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74b41f11-a34b-11f0-9809-7dc792cee155;
 Tue, 07 Oct 2025 09:01:34 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by DS0PR03MB8224.namprd03.prod.outlook.com (2603:10b6:8:28c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 07:01:30 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 07:01:30 +0000
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
X-Inumbo-ID: 74b41f11-a34b-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tEGHs4ycVFKQdXwPHs7zDc7wcnEoJ5Jft2XZsZOxzG7Ew18jViWNiV7tUguxpG5cCI1aaMb6f8VcEdDuAndyI/N2RaKM13hp52TvXHffLqEVHB4p1TnwZ7nj7qHpvPEbpfMlw2UiUO98nwMxS7W1G0H4fW78WkXM1wBZjHmgSXyQllEYiHePvV5XZYkOwy4xdHWVqsO/a3HPat4LxNVoQ2eG0YsWJ7BUOOv+b3T0w3q3HuCISwoaFH9ofdrnH+c/ao++JEYUyaZokvnYj6m1MgDNRofoVD52K0ml0Ojg3CgBuIfLeWdqIcBQcIYou2SP5WJHOEqBsF08TaV3MXufgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W3bA8lUzNj8r1eo81eLbcNDAh2zqjwbhhkzCMfAeoKI=;
 b=Dsg+eirUq5GWIIVtLtmtJeHWRfYBv11KNd2QIdU8yNKfYc20jnlXumn2afyp0AjHVSuBUcbFOXJzfdWgf4EwRXRVUtlmdpIL+zYZ346qfsIPOcnDWJtFxW+YtURYA3829hZh6q6QVN/HV9iYfXhyWLfuyce8XWsnkmjCacJ9XyZ4cVTTWWuaZx3KLICGLu8YS1ajglFp7Bz1w9Z5xUxyV4W4kFGcmzUCx0vpaulonNU5nfvDgWjK4gFMV5GHm1bdH9/hsd3MB8lUvvbGxYQhj1m9RaGKhqcPMKeZjtnm3upsQFzq7hYb/ykhyqzpuXH1hYJlOUdperaarp7m+faoQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W3bA8lUzNj8r1eo81eLbcNDAh2zqjwbhhkzCMfAeoKI=;
 b=FMnHX4ISbSDpAYWY7KfsrptNtU3PD1tI3ihw2+YbcqGmGT5GJty18+uXi+wlzYPC1wFkJZImD56R1Zv+PjkypG14xFGvqiKpQaHNYlZS73ULF+FJJHxAtJSvTIL5ttwA1O7P8v5ke8+PD1USVZNlZ7ZxemiybImdZK/laNhzzEo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: oleksii.kurochko@gmail.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for-4.21 v2 1/3] cirrus-ci: install libinotify for FreeBSD
Date: Tue,  7 Oct 2025 09:00:54 +0200
Message-ID: <20251007070056.83423-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251007070056.83423-1-roger.pau@citrix.com>
References: <20251007070056.83423-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P189CA0012.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:52::17) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|DS0PR03MB8224:EE_
X-MS-Office365-Filtering-Correlation-Id: 09c271d8-2c3e-49fc-30db-08de056f5797
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?REE3UmN2Y3ROL2hUZEFaUmwwTzlLdWFtK2swV2pycm5UZ290VG5tTFZMelhY?=
 =?utf-8?B?KzE3L3lQc2hOald4UTRIalV1K3ZSYUJ2VUlzM0E4Q2E0eDBWSkNtY3J3YndP?=
 =?utf-8?B?MGV3T2ozdGtVaVlYYkJxVENKN2RyZkpwSFBxc09PenUvRXEwV2xESCtTbDc0?=
 =?utf-8?B?bkpHbXpZb3l3MzZMQy9WSnBvZ0tyNGV4OUdTbDFuMk11UTdpK2ZCeEMwTEJx?=
 =?utf-8?B?aWFkM09nSUNYeGV6QnFJUGlZZUl4QzF4Z2FENDZST1FSampOZUFQZnJXYkty?=
 =?utf-8?B?WFN3NjhtMGtzVUttYkNJaGcvdEtPcXR3YW1qWWJrVCtFbitJbUw5ckFhdnBC?=
 =?utf-8?B?SG8ydTF2SzgxZnBoTmEvbVQ2SDAwVGt2eWNsU3BsaHVUSVUybUZib1pBOVQ3?=
 =?utf-8?B?RVhrQThvSVZaNGNoa0N1Sm5hMExiNXd4TnVGdk9DVmZoTlIrK1R5RVVnaFEv?=
 =?utf-8?B?Y0psV1lIK3U5QkgycGhLaE9uTEFqMUowd1l5Mmdid0lSRFF0V1BTcW5QUXlo?=
 =?utf-8?B?Rm5NanVnODJLMFBERTQ4OE1qOWpyV1h5NVBTQU0vMFBabG5WYmRJdjFSK3h6?=
 =?utf-8?B?WmNjREpZTHNvbmF0T0ZicEM0MElFVUZxdGswQXdTdTg5TUx1K1RNOGFERzNK?=
 =?utf-8?B?SS9pWUYydkRJMWt1OU9wVWpCU0Z0dGNqZ2xWNEpXUVR3U0hCTUphd1c2cmF1?=
 =?utf-8?B?NVNLRFRiZkt5cDZKd0VVblgvSC9udkFwcFVrc0NJZ2hsQnhWb21WVWcxUmV4?=
 =?utf-8?B?ZHZiRTArVmUyT0hhN1VCYWlzbDhvWVkvVWpzd2x2TTZZZ1UvWUR2dGVzcSsr?=
 =?utf-8?B?SWYzYkUwOWhpYlEzUHVRUnB6RXZhL1haMFJ6ZGhyWktUeHlGYUhjdm1teUJK?=
 =?utf-8?B?Z3RtZy83Skp2TVUyK2oyUDhpZ1IwMFJtTWlobDRwakVVSHNHTzJtUFdCeXMr?=
 =?utf-8?B?QThLSTJFR3dEMzc5MFgwVmQzalpLVkRQOWZ2M2haOGNQTFgwOGhyOU1zUllx?=
 =?utf-8?B?bXNyd3NuYTJUT0JiODFhNEFFK05jdjZndThRZXUrdHZxVTlqM0VyQnVGQ1dq?=
 =?utf-8?B?cjJyekJhWTFCbGFVeVkwOU9hYU9pd3R2VGdTa2wyT1J6UnFqUHVmZFZGeTVB?=
 =?utf-8?B?S1hTd1JudjNWL3VxalRyQmYwdzZnaTR1aTk1L3pvUnhKRWNhZ1RxNjRZcEVa?=
 =?utf-8?B?QVdVU1pkL29lN2lFUU56VGNRSkVleXpkdWJmMUdkelhsa0dFTEJ4MGlxcTN4?=
 =?utf-8?B?T0xsWG9xUnVoeDBKVm81ZnNDN2lCQWhVbno2bFE1aUhFOGdtK255WVhnbjlz?=
 =?utf-8?B?QlMzS2MvcVpHS1lpRUM2KzRvZW1uZ3VoRGxGazZETjRRVDRUbkV6eENoek9T?=
 =?utf-8?B?ZDNwd0EzZHE4a2NieGJCclNBRDRvdWI2UkJhdXVGekN2Mmxia2lQQmJRV0lG?=
 =?utf-8?B?eUVNR0picmozblBvb2c2MU14YVZxQnQ1SUFaQWJvS2kydlN1SUJiU05ycC9D?=
 =?utf-8?B?c3JUQlJ1VEVEMFNzZDBmaGxOVE4zNGZHRllGVGNNSjFzdXJ6NHUxbTFHYXZU?=
 =?utf-8?B?c0t0MzRVS1YxejBFaythcHdDVkMrT3YvVVl2aTcxdytWWXViQW1SZ2toWGdE?=
 =?utf-8?B?MGM1UWMyU3ZEdFZUS3hGcVVHRWxHOFRMTDVkeHlWSUNRcGNNYVFTcDBZSjYv?=
 =?utf-8?B?MnZ5cEN6bjV5ZjFmNHlDVnIva084cmxwNmpjRWdvYkg3YUNmcjJEa0U2dklm?=
 =?utf-8?B?NG1sTmdQODZSNHRsaHBmcjVDbHZKWTR2bjNacGVoVGZHL3krdUp3MzRQL2Mw?=
 =?utf-8?B?dEk5SEtPT0pVSkt4Y2I4a3JRcGtnNnBWTkJPWEpFRFUvQ1dxT0hMRHcwbmFz?=
 =?utf-8?B?YitrRkFKYnNnTnpmMVI3U2E1cE1lQUlhMnNzdzZ3V0g4Uzl3cU8vL29Hbm1E?=
 =?utf-8?Q?K4sKw3iOVL2XN7XP9xv7/CaE/al2tJqi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amsrYkkyR2Q4aDQxZHhPK09CdUxxc3dWYVlmRzFwMjdENWJGcm10dkJNTm5X?=
 =?utf-8?B?Uy9CK0xaWE5uTThEYUhlVFhKQTg2ejhDR0JBVzhucFNYZ0R6SS91NkI3RTFl?=
 =?utf-8?B?Uks1UzZaMTdnZHZEUnRTenlObGNWYVJEWHllRS9JUzV2U3d0WFNxRS90Y2JB?=
 =?utf-8?B?TmNZWmVBd0pEbzRRSDFjVzA2MnlEQ3ROaENPNEpyU0dPSnNvbGFWb1NvSjlF?=
 =?utf-8?B?d1hKOEhiUjNEeU5KdXFRajdzQy9yS2RDUkhrVDg4L0dhYkFOcnFOUnNqeTM3?=
 =?utf-8?B?R1JtcEtVNHE0WlJmR3UrSnprK2lQcXBxRnFqNkRHUlVYSktVMTdZb3NCR2w0?=
 =?utf-8?B?djA2RS9kNUxrdHZNSFJDU0VtbXhFdWZ4WE5pZG9EK1lBYUFjcVozNGo2cFRk?=
 =?utf-8?B?eStNUnl1N0RXS25WZ3p0Wkppc254cWtZZno5eUhMUGVnUDZPb05NMFlERStH?=
 =?utf-8?B?Rmdub200aGJ0dll6VE9CRmNNU1o4UnJ6dSt1VVpNQWYrWFpuZW1PV0xtKzVr?=
 =?utf-8?B?eTVDaHVYYVNYTDk5bG5rK3lLdCtyS0xzMkFRRERpZ2V5c2E1ek44bEdKSzA5?=
 =?utf-8?B?V1d0RzBXUzlqa3J3V0lEUmU5Z3JRVkZhK2c2NmdSakh4U0E3dzltSEtsVjEr?=
 =?utf-8?B?UFlhdExLWmtGR015RVlsR202cnc2UTdSek0rbE5qZDRKb0FNNjJ2ZzNYQkV1?=
 =?utf-8?B?YTlwOG5TZmlsZ0ZBMkRaQ1k4NldXVXNjYU8xOExNR1VRZzJCVy8ydFRCL0RG?=
 =?utf-8?B?YTRLUkd2TDc4QTJabTlxbGtEbS9HZkNhZ0lmajV4LzUyVVdHb013MHIrU0tE?=
 =?utf-8?B?Wk5IbElkSGFCcXhkM1M3cE1YVHorcmxQRWRnMGRFSndqSGpvUTRYU2pYbDNz?=
 =?utf-8?B?VE1ER3AvWmI4OHpoOXRKZWlIbVo0OWdBb0grZXNZWG1QSGdrYXl2SXhLR3Qv?=
 =?utf-8?B?QjF2NFlXOGFTZWF2aytNQlNVTkV6bjQ1UytiSjdkVktQdXljU2NyOHRLbXRh?=
 =?utf-8?B?K21LRnVwTEc0ck5laGlYdWhZYkNyZmRXRzAraytKUy84eU1xMnlWV0R0Mm1G?=
 =?utf-8?B?S3Q4aHlEVmN4emdBQ1pvcVQrWkduQVVGU2l6aDJBYWhsRHRuY2ZmUWZZQTV0?=
 =?utf-8?B?Nzd4L05Cclg1UTVGZ0IxYnB4OHFoVCtxV0NxcmpCNTB6c01ucENPUUx1QlQx?=
 =?utf-8?B?QUNWTzErMnc4K2FySGh5Tm95ZjFzZCtiYXE4QjUxOFBUTWMrSlBoZjhudXJC?=
 =?utf-8?B?YU53dDFlbVZQSHVFMXpwNk5qY0gxNG1rbHpIMEh3bjkyODlNRUVxbktrYlZL?=
 =?utf-8?B?Smx4NityNm9oaGZFOXYwdi9hUi9HZkxrY01GSk0wMjNKSnF6MVl1c3N0azFK?=
 =?utf-8?B?MFVQU0ExQVdFbHVyZjFsSllKUk1IS2xiMWRETFl4dDZJNTZkU0Q0NFhCZlNO?=
 =?utf-8?B?dUdKUWlaNEdnSURJZTZ0TXpyZjVwL2FocmM5MmQxSWluaHZTYkhnMktwemha?=
 =?utf-8?B?ZFFBNWNDNVdvR2VaaEpsS2RuOHNOZlhFNlR3SStteG5CQTNpUXVXMUhsLzdJ?=
 =?utf-8?B?Mmc0OGlEVFFFLy9YeXNxNUE3Wko1MTdNMzVVS29DMzlDaFBPejM5aEhTcjRU?=
 =?utf-8?B?ZG5OazRBVzN0ekptdDFXNEFlNWIxUXBKRGZnc210cEFvaU5QQTF4NUhpd1po?=
 =?utf-8?B?ZlE5V2huNVRheXh3Z1QrdFhXbThqOXg0R3kxRC9qQmxDSjRkY2NqeC9ieTh5?=
 =?utf-8?B?SjhvRzRCa3g4ZFZqcGhpOVJYWXJScEtHQjQ0U211WDRvbkRNTHRuMCtsWUc0?=
 =?utf-8?B?dTI5V1V1K0pwK29vaXFSeVZML01nV0ZZMXdhR21pdkJsaEZFS2hKZ2xoK1Fr?=
 =?utf-8?B?NU9XVEpjMGQyU2tPdUZYVFo2dlIvL0lwSkJZVXFVZVNTWXFtSTBPcXhCMU5y?=
 =?utf-8?B?QU9GOEg2Vkh1SjBSdVVMVFYvd1Y1eUI2TFRTdnlRNWNEZW1IQmh1RnVpbmZ1?=
 =?utf-8?B?WTJ6MVZqcGlUbnZKcFZRanY2Ui9LbThUNEVVd3JzRHpINzBJS05XZUJOQkZW?=
 =?utf-8?B?dVVTWVhJZjYzUkorbWtUSWpFK0lXREtBb1EybDFOa2h0RGozeUFPcThUQjJV?=
 =?utf-8?Q?a1Iu7o9k3fDVcvxgKow67Bhak?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09c271d8-2c3e-49fc-30db-08de056f5797
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 07:01:30.5482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FJsJaH7GhFSdPzx9cgwnvZH9lTd/5Y3G5r9k900UQ5fpswXrRCb55iGovi0fJs49kgJ0gq5bxePRsM6U790iiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB8224

FreeBSD QEMU build requires libinotify, otherwise the build fails with:

./qemu-xen-dir-remote/meson.build:2535:15: ERROR: C shared or static library 'inotify' not found

Install the package and add the /usr/local include and libs paths
explicitly as QEMU configure options.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
 .cirrus.yml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index f295c8cb0a02..10d8371ccc38 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -51,11 +51,12 @@ task:
   install_script: pkg install -y seabios gmake ninja bash
                                  pkgconf bison perl5
                                  yajl lzo2 pixman argp-standalone
-                                 libxml2 glib git python3
+                                 libxml2 glib git python3 libinotify
 
   configure_script:
     - cc --version
     - ./configure --with-system-seabios=/usr/local/share/seabios/bios.bin
+                  --with-extra-qemuu-configure-args="--extra-ldflags=-L${APPEND_LIB} --extra-cflags=-I${APPEND_INCLUDES}"
     - gmake -j`sysctl -n hw.ncpu` -C xen clang=y defconfig
 
   << : *FREEBSD_CONFIGURE_ARTIFACTS
-- 
2.51.0


