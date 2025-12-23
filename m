Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D500CDA2D3
	for <lists+xen-devel@lfdr.de>; Tue, 23 Dec 2025 18:55:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192789.1511899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vY6bd-0002nD-UI; Tue, 23 Dec 2025 17:55:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192789.1511899; Tue, 23 Dec 2025 17:55:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vY6bd-0002kg-Qd; Tue, 23 Dec 2025 17:55:33 +0000
Received: by outflank-mailman (input) for mailman id 1192789;
 Tue, 23 Dec 2025 17:55:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I0w9=65=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vY6bb-0002jy-SK
 for xen-devel@lists.xenproject.org; Tue, 23 Dec 2025 17:55:32 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91ca203a-e028-11f0-b15b-2bf370ae4941;
 Tue, 23 Dec 2025 18:55:31 +0100 (CET)
Received: from DS1PR03MB7871.namprd03.prod.outlook.com (2603:10b6:8:21f::17)
 by DM6PR03MB5067.namprd03.prod.outlook.com (2603:10b6:5:1ec::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Tue, 23 Dec
 2025 17:55:25 +0000
Received: from DS1PR03MB7871.namprd03.prod.outlook.com
 ([fe80::3a7e:e6ed:f8e9:9fb3]) by DS1PR03MB7871.namprd03.prod.outlook.com
 ([fe80::3a7e:e6ed:f8e9:9fb3%7]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 17:55:25 +0000
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
X-Inumbo-ID: 91ca203a-e028-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=klvQgypjtq+EpJqJsUkMYgBCpyxv+uQIjqYl8ERMBOzibs7kZ1vqt2vvPp76nIaDqF3zuNUzxOuj+q3PEC8IEoJpS6TepV1cnCVFCqRWP4hTwgOfqmNtzQPySql4vyGROiIhpKDCsbwaCyQBZ/9Gms63h/XAQYi7OJQKrb8YDmCUEiDSGUqA+IgzbTlnEWYsUg/iDnfC8O9ZUDvikBywoCeOSk0f1+4fpS/q8IQisFFkdBEKze/LZFHlD7X7n+F2kbyzqQOgWXOs+62hh/WaqeI9xTHrv+6KMcUkHYJluXF4AStUtNZHurTfd/TAkm5XT0fDoFcxe/Gl+kYcv6EpMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nHH7BKBRfPHkAIvefv7tZmg+rxCnzOgE9VgJncB9Lew=;
 b=X9je9Q2X8QsLkwECxKiktp5yIVvBHNyyXEz/pgm6pIFu4TD6gPZKtvomsYsLDpVVbpWBv32cDflogAaTPIPO3MDtOajB0wQIa8ou/Mm7TQqH/QmSRyL0XKHqCW+fj5EdD67J3MfKRWNBhJGHm9QnMS5ETzQoICAZXxqWENRqWELekMiQE7QHY5PNqJFiYO6HOyUvadrqB7yc52fSvbTH6KnzXaCc6qiur0tm7a0GQ/2u+a/ZTJmh2zXgdLVoprjgWMWdoLwGQYP8jtsUGk3kDTPJEfKOi4bO5KYClyM7Btm8ydMZEhJETAx6HRdE3GxVMKXkfkhhFcbZvi1SppG/pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHH7BKBRfPHkAIvefv7tZmg+rxCnzOgE9VgJncB9Lew=;
 b=thEzwRT34JH/uAkOSOPs8Jop2NFkMUtXJAwLxgvATa30pphyHQN7EEOLAFVlJZi4nxPwAnPbuVTE3qQdd9LqMpCgpFBrzlVB68041tAbcWNNuSKLw0TpYk7r/C+7krPeO1ejQa1xfErTvXHq+qFA3w2vJxr2oerRkbiKEhf+T4E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 23 Dec 2025 18:55:21 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/mm: move adjustment of claimed pages counters on
 allocation
Message-ID: <aUrXiaWnyM-eTJg2@Mac.lan>
References: <20251223081507.29325-1-roger.pau@citrix.com>
 <754a5e55-828d-4b3f-85cd-574760ddc69b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <754a5e55-828d-4b3f-85cd-574760ddc69b@suse.com>
X-ClientProxiedBy: PAYP264CA0011.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:11e::16) To DS1PR03MB7871.namprd03.prod.outlook.com
 (2603:10b6:8:21f::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PR03MB7871:EE_|DM6PR03MB5067:EE_
X-MS-Office365-Filtering-Correlation-Id: 50a7f2d5-22a3-41de-eb87-08de424c7367
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S1BCdHBCOUN5K0w3cjRoaU9uN3M0MndUc1pFZElMVmFNQ2d6dklveE11V3BL?=
 =?utf-8?B?M3hNNzlQWVF2aEh5b1d4NkJieUQzS0tDNzNyZVlYWWxmY2FpMzdJZU95OVk4?=
 =?utf-8?B?dHJadDRKd0FmYUk4YmsvNzZNc3YvMzJuWXZrMUIvNHVtbDk1S3JaZ1FqQ0F1?=
 =?utf-8?B?V1p3dnFZQ2crTE1qTys0SUM5c2JrRFhRUStCOGxQS1NoWkhIVWh0OCtMWmp3?=
 =?utf-8?B?ajZwbjNacGN0Kyt0V1p6bVluOElWNWpueUF5TjRKMFBadklNR3krWFRkMk1p?=
 =?utf-8?B?Wjkrd1l3MzhkeWVIUktCNHc3YVF4eTk0aWs3eVE5Y0hickIybmJRNVB2ZDFk?=
 =?utf-8?B?TDZ5aTExaXkxTGwwR09hK1N6c2JFNFd4eHJBaW10ODVvcUpaZzZHcUJMVmE2?=
 =?utf-8?B?bVluMWx2ZzY3aXNFYjRFUy9FRElKakpQMUt0M2Y3NUJJQkpSY1FqNjFpbnc5?=
 =?utf-8?B?Tm9ONXQrZVZCWW1QWWVyaFJoVCtmY0tYTDZOMit3emYyTnJITEZjRkhiektm?=
 =?utf-8?B?OFFHZlZjZ1hnN1ZLeUxic3hsVUhiK0graTVjaFUxRkd1WHVrbFRqd0lOcExp?=
 =?utf-8?B?ODB6YXh2Y1pTS1lSSVRBMjJVYnpUY1psb1gydU9DZ1cxa1pGNzg4U3lpNXNj?=
 =?utf-8?B?VDY5SWozTEtOVURNS1Q1NElkVlkwNUZtRnF1K1h1ZFFjZzBTcnB3UkFWai9z?=
 =?utf-8?B?M2V2YUxMVjFraHMxQmgxcGtPUmVWYTVRTFJraHN1MGNYQnNwRjkvZU5YV2Y3?=
 =?utf-8?B?TmFOR1RDRTBMT3I1OXNLbUoxZjhERERXMlNQVUxWeFZFNlViSVA3ekFuOHRH?=
 =?utf-8?B?dll4ajFVYVRUVTBvdUhXUlA3czErYlUvUysycWlrNTh5dEJSZmh6YjFpMHp5?=
 =?utf-8?B?TEJCcFBhcEVIN2lxVFBOYWMyREtnY0MzczZvVGVydnQ2cEprQi80TDJqbkJW?=
 =?utf-8?B?WmtQZFdBYldUVkwzQVM3Zit2N0dkbWxJRnNxTU44MDRxN2ljVE8zUk1lWk5l?=
 =?utf-8?B?MTZ6bFdaZXpqYjJIM0VOdnhGM1prL25hRVBURldIVFFKZ2lBeUZrcGd2azBW?=
 =?utf-8?B?SG9oTzhrS3o3NTlHcnNDVWxRaFlaaVdIQklvVDc3aENHZzU5NEZ4R1hCY2g1?=
 =?utf-8?B?OUJQMC8zZVRXdkpvMzQ5SHNxL1F3L25CdTk5dFRNN0dCR0pHTEkyZ0cwVUpQ?=
 =?utf-8?B?Mkx1YjlHUC9sazJibXl6SHRiVmZhSC9MRUJqVEVhSHMyaVpuZWlFRjZnVk1u?=
 =?utf-8?B?SzVxUHF0a3Vlb0hEcWRhWldVQU1aSVlMaWdnRGdxdkhzbFdFVGplRndvdVhM?=
 =?utf-8?B?Zkh4WHp2d0JmQmRPdTNEQ3V0L0hOZ3dXaitBWkFmek54eGoyTFlkT0x2RVR3?=
 =?utf-8?B?MTFKbEhWalBZR09iV0F5ZWUvdmVIUFJYU0QzNUk2QzNoS3RGWVhVK3hza1h3?=
 =?utf-8?B?NjNwUHNUbWF0b24yNDRNNWdIS0FxWk1TTUNoVENUekY0Q2NVK1Jpa1pyay9Q?=
 =?utf-8?B?a2ovdDlIZHhiRnJ0TncyUUNPSW9pa3g4T3BXNDV5bVN1cGJBMUo5R3RJanpZ?=
 =?utf-8?B?UlFYa3RFd3JZOUd1QlhXbjJaT2QvbXNEd1kxZlhMWlIvSENJSFpKRVE2Tmoy?=
 =?utf-8?B?Umx0NWk3eVoyUktYTVRWM3psUmRpTHJ5YlF4TnZyeFl0TEEzUGZjWHNQTnd5?=
 =?utf-8?B?UGdSeGo5UzROR2dnU25YVGxxUWtIbFpGbm9QWGlETkcyUjVkRW0rRXJtYUxH?=
 =?utf-8?B?Wll4SnNpdnZ4TC9CdDV5bHFldjd0amJFa1MzeFlTN0pOSzNJMGhjWjJjVEFR?=
 =?utf-8?B?ZFBVSm4yMmJJcmRNcHJNWnhQeHgvS2krMWMxTlh3RzJiM25GcGRmR1NBVjRx?=
 =?utf-8?B?eTNmZEJWVlhGTnhDaFVWUkx5MHhLc2Y4VWYrbDQwQ1pPUkRzZUlBc3g2eWFU?=
 =?utf-8?Q?3aWYlh4UrsJnay14/i3X/vyHmmToHlmQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS1PR03MB7871.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?STFDWnVLRUpBNGV2TG5BRWFLdWFXc2JUTm9sRUVtL1Nha2xwTXV2S0lKcFNL?=
 =?utf-8?B?REZyRUthMDVRY2hsRWw5TnJHYVJNTDNRUWVZT1dwcmlBMjFMN0p0NUp4MmU0?=
 =?utf-8?B?LytBU1VGQWptQXZnV0sySjFuZTlqRTlBK041OW1rMHVPT3l4S25WOWFhb0xz?=
 =?utf-8?B?eSthaTluVDlwTktlRHZRbTE2a2ZtZU1wT1lvTm9KL3JnU3R2RVJ5blAwQnhk?=
 =?utf-8?B?bTRBY0hUd0Urc01QU2t5RG5PSi9IRUNjWnVHU1FqMmFOOFZXN1RZWWluR3VI?=
 =?utf-8?B?TzJveFJXM2FtOXdkV3IxYlZPems2djE1ckJjZnEvVGNQbTFDVU4zbzZocW1k?=
 =?utf-8?B?Tmw2SXVKS2NKOUczZWYrSytWSmJHblo2ditZMHJ0UkVGa3BJb3RjRzdsV3pE?=
 =?utf-8?B?eCtwNms1SlcyL3o4V1NQd1JaNTBSV3d2ZjNscmlBNUV3UEZidVNtRDF2b2FX?=
 =?utf-8?B?NkZRd2JhRWRqTUFIWWtUOWUwbGYvV1JjdTVHeUp2OGI5N2lYMHZYWXFWOXNB?=
 =?utf-8?B?b2phZVZsUm1lZlU0THdvZ2c3bmNNM2pjbGgxZk1OSUhPUmNmcEprNEhxb252?=
 =?utf-8?B?Y3N6aWd6SXFHaHlZNmlIc2lzOE53U0tidUllTTdyT3ZaekJCQ3RDbVNOQ0hn?=
 =?utf-8?B?M3pTSlUzWGhtQ1JBenNicUZXQkFMbTJlRC9XK2xuTU9IUDR2K1lBZWM4cjUz?=
 =?utf-8?B?MUpJRlY5V3ROditpSk5XSDlhUEYzZVpxbXV4VnIyd2tROWs5Tlg3UzJiKzEx?=
 =?utf-8?B?QkdwSkRZM1RiS213QU9IYUxEaHk4REJORlZrbEtPSnpKK0VpWVl5VExyb1ZU?=
 =?utf-8?B?RFY1ZW9IdnNIbS95dlJmU3IwTjM5UTlZT1RwM0RJeS8rem56ektlSktrNTl6?=
 =?utf-8?B?cGxJSWM3Q1BUN2xzK25NWjUyN1YvU1RrZmdNYmNydittcUFhR0FPOWF5NURS?=
 =?utf-8?B?endPMDNNMWtndE5DWnVFR2xMOTM5cG80dTJKRjM0Z01ZdjVqcVVBUWdoaDlX?=
 =?utf-8?B?dnQyaWFFYXNyZW4xTk1NUVdaaDF4aExSUDRFVm43NkcwTWZnamxtWjQ3a2pX?=
 =?utf-8?B?RlBVMkRWUTFVajI1UkVCY0N5UFpybkVOaVF3cWRYQm9NTTkrSGtiZjZLaCtN?=
 =?utf-8?B?UmRLL1QvMCt4dGNDL2tJc2lza0NQc2lTV0VyUFRodGg4VzFwaGJrTDNVSkxM?=
 =?utf-8?B?SEpMcFl3UWNKY2xSdkdKdlF1YUc5aEVzamc5Qi9DKzR4NldSM0RSaGtvTUN0?=
 =?utf-8?B?R2NSeFdac2t4NnlYTWk4UHhnSU16WTdLVjEzNExqQlh5RGFlc0hia2lwdWp4?=
 =?utf-8?B?SGExWE5QcGYxMVZKWDVvbm5HNndMWWtGWUJNWkVWQmgvRTd3YVU0K1RhWlF3?=
 =?utf-8?B?T01YUWlsRjNkNEY3eFFaQlFuQ2RCazBMemRVS3RsS2hxbU9IcWZNa3NwSkNn?=
 =?utf-8?B?bnNOc1UyZS9CTk5jcUtqTUh3ODZoM0VYZ3FXcHZhY25YRFpNSkZmUVBhMTV1?=
 =?utf-8?B?eWhya1ZWV08zTkJzMTlEU2Q5OVFoQWJlaDBNeUZJM0dTclk0ank1Z3ByWHp6?=
 =?utf-8?B?dkhUejNiV2VGWXR1V3BrRXhuZTNkREppd1UzQklUS3o1cEdDS1VVcUQ1a1ZE?=
 =?utf-8?B?WlkxMmk0cG1qcDFkcWFHbUFqbUdkMzlkNXo4L0FzVUFSTjQzYkJCQkFOT3BH?=
 =?utf-8?B?NEw3SkRVTkFhSTZRZUVhN3IwUXhWRkRmRjNBRElzKytRNnBuSHY5WHVKNDEz?=
 =?utf-8?B?QWtqODl2djM1TDg0Q1NYcXB3UU16NFZtbjNaMlBTSjFtRXowYSthOWsxYVN3?=
 =?utf-8?B?aWk2NzgxaC81aUVBYUxyYVVsdFN2dngwMnI4a01sZXl1bXpHdzh6V2g4emhj?=
 =?utf-8?B?b0RqVGFMOWVHTWgvc3BxRHk5amlVWGN5SmdiU1NrcCtTemNWdEpjS3FtS3Bn?=
 =?utf-8?B?ZXFjS3R1VnZxQUJjNEtzNWFzQzgxYythVFdXd2F1Q3NTQW96VUJvK0tkYkVt?=
 =?utf-8?B?UGVYQWpaR200OEpwMzlFaEIxT0ZKZzNaSVc3S2hVd0xzM1FQay96OUQ0YjYw?=
 =?utf-8?B?aWZ5T1krMDFEeW5WZ1l3SGZ6bVIzRUUzeEFyTW1HVEl5RDY1aFBkODZKYzhi?=
 =?utf-8?B?MXQvZXN4K2pDQTR0WllhOEtOa0RsTEJGK0hsblEyYWV6SGdUSU1sNjZNM3dO?=
 =?utf-8?B?UXhJeW5hUEdyTTlPakY0dlhaUWdiNlEzV0lwaHdwMDQ2UzZNeWJtTjZSWndY?=
 =?utf-8?B?UElDQ0ljdkpBUmk2QWs4YXo1ZzhhUVNkNS9pK09HK2ZNWnNsaldORlg2MkhK?=
 =?utf-8?B?MkxscXdJdHFlMFZrNmxXY0k5Vkg5U3hQZFVUMnRMTHZUOENlWmFZQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50a7f2d5-22a3-41de-eb87-08de424c7367
X-MS-Exchange-CrossTenant-AuthSource: DS1PR03MB7871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 17:55:25.7424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gkxpBkwxgc5v24nQSpat0T3ZhnWw59GsVGeB4lrbV7N6TUHa7nWl6ocZqov3ctqQaCn4qIxluEid9Zs1JGl9dQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5067

On Tue, Dec 23, 2025 at 11:59:54AM +0100, Jan Beulich wrote:
> On 23.12.2025 09:15, Roger Pau Monne wrote:
> > The current logic splits the update of the amount of available memory in
> > the system (total_avail_pages) and pending claims into two separately
> > locked regions.  This leads to a window between counters adjustments where
> > the result of total_avail_pages - outstanding_claims doesn't reflect the
> > real amount of free memory available, and can return a negative value due
> > to total_avail_pages having been updated ahead of outstanding_claims.
> > 
> > Fix by adjusting outstanding_claims and d->outstanding_pages in the same
> > place where total_avail_pages is updated.  This can possibly lead to the
> > pages failing to be assigned to the domain later, after they have already
> > been subtracted from the claimed amount.  Ultimately this would result in a
> > domain losing part of it's claim, but that's better than the current skew
> > between total_avail_pages and outstanding_claims.
> 
> For the system as a whole - yes. For just the domain rather not. It may be
> a little cumbersome, but can't we restore the claim from the error path
> after failed assignment? (In fact the need to (optionally) pass a domain
> into free_heap_pages() would improve symmetry with alloc_heap_pages().)

Passing a domain parameter to free_heap_pages() is not that much of an
issue.  The problem with restoring the claim value on failure to
assign is the corner cases.  For example consider an allocation that
depletes the existing claim, allocating more than what was left to be
claimed.  Restoring the previous claim value on failure to assign to
the domain would be tricky.  It would require returning the consumed
claim from alloc_heap_pages(), so that alloc_domheap_pages() could
restore it on failure to assign.

However, I was looking at the possible failure causes of
assign_pages() and I'm not sure there's much point in attempting to
restore the claimed amount.  Current cases where assign_pages() will
fail:

 - Domain is dying: keeping the claim is irrelevant, the domain is
   dying anyway.

 - tot_pages > max_pages: inconsistent domain state, and a claim
   should never be bigger than max_pages.

 - tot_pages + alloc > max_pages: only possible if alloc is using
   claim pages plus unclaimed ones, as the claim cannot be bigger than
   max_pages.  Such alloc is doomed to fail anyway, and would point at
   the claim value being incorrectly set.

 - tot_pages + alloc < alloc: overflow of tot_pages, should never
   happen with claimed pages as tot_pages <= max_pages, and claim <=
   max_pages.

However that only covers current code in assign_pages(), there's no
guarantee that future code might introduce new failure cases.

Having said all that, I have a prototype that restores the claimed
amount that I could send to the list.  It involves adding two extra
parameters to free_heap_pages(): the domain and the claim amount to
restore.  It's not super-nice, but I was expecting it to be worse.

> > Fixes: 65c9792df600 ("mmu: Introduce XENMEM_claim_pages (subop of memory ops)")
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Arguably we could also get rid of domain_adjust_tot_pages() given what it
> > currently does, which will be a revert of:
> > 
> > 1c3b9dd61dab xen: centralize accounting for domain tot_pages
> > 
> > Opinions?  Should it be done in a separate commit, possibly as a clear
> > revert?  Maybe it's worth keeping the helper in case we need to add more
> > content there, and it's already introduced anyway.
> 
> Personally I think we're better off keeping that helper, even if it's now
> pretty thin.

Ack, sounds good to me.

> > --- a/xen/common/page_alloc.c
> > +++ b/xen/common/page_alloc.c
> > @@ -515,30 +515,6 @@ unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
> >      ASSERT(rspin_is_locked(&d->page_alloc_lock));
> >      d->tot_pages += pages;
> >  
> > -    /*
> > -     * can test d->outstanding_pages race-free because it can only change
> > -     * if d->page_alloc_lock and heap_lock are both held, see also
> > -     * domain_set_outstanding_pages below
> > -     */
> > -    if ( !d->outstanding_pages || pages <= 0 )
> > -        goto out;
> > -
> > -    spin_lock(&heap_lock);
> > -    BUG_ON(outstanding_claims < d->outstanding_pages);
> > -    if ( d->outstanding_pages < pages )
> > -    {
> > -        /* `pages` exceeds the domain's outstanding count. Zero it out. */
> > -        outstanding_claims -= d->outstanding_pages;
> > -        d->outstanding_pages = 0;
> > -    }
> > -    else
> > -    {
> > -        outstanding_claims -= pages;
> > -        d->outstanding_pages -= pages;
> > -    }
> > -    spin_unlock(&heap_lock);
> > -
> > -out:
> >      return d->tot_pages;
> >  }
> 
> Below here the first comment in domain_set_outstanding_pages() refers to
> the code being deleted, and hence imo wants updating, too.
> 
> > @@ -1071,6 +1047,26 @@ static struct page_info *alloc_heap_pages(
> >      total_avail_pages -= request;
> >      ASSERT(total_avail_pages >= 0);
> >  
> > +    if ( d && d->outstanding_pages && !(memflags & MEMF_no_refcount) )
> > +    {
> > +        /*
> > +         * Adjust claims in the same locked region where total_avail_pages is
> > +         * adjusted, not doing so would lead to a window where the amount of
> > +         * free memory (avail - claimed) would be incorrect.
> > +         *
> > +         * Note that by adjusting the claimed amount here it's possible for
> > +         * pages to fail to be assigned to the claiming domain while already
> > +         * having been subtracted from d->outstanding_pages.  Such claimed
> > +         * amount is then lost, as the pages that fail to be assigned to the
> > +         * domain are freed without replenishing the claim.
> > +         */
> > +        unsigned long outstanding = min(outstanding_claims, request);
> > +
> > +        outstanding_claims -= outstanding;
> > +        BUG_ON(outstanding > d->outstanding_pages);
> > +        d->outstanding_pages -= outstanding;
> > +    }
> 
> This now happening with the domain alloc lock not held imo also needs at
> least mentioning (if not discussing) in the description. Aiui it's safe as
> long as all updates of d->outstanding_pages happen with the heap lock
> held. Which in turn may want mentioning in a comment next to the field
> definition, for (now) being different from e.g. ->tot_pages and
> ->xenheap_pages.

I will add the comment to the field definition and update the commit
message, thanks for noticing.

Roger.

