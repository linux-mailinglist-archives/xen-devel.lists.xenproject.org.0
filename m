Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFB4AB63CA
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 09:08:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983837.1370013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF6EP-0001sd-CI; Wed, 14 May 2025 07:08:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983837.1370013; Wed, 14 May 2025 07:08:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF6EP-0001qY-9P; Wed, 14 May 2025 07:08:45 +0000
Received: by outflank-mailman (input) for mailman id 983837;
 Wed, 14 May 2025 07:08:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kjT3=X6=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uF6EO-0001qP-Ar
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 07:08:44 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20614.outbound.protection.outlook.com
 [2a01:111:f403:2413::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44741ad4-3092-11f0-9eb6-5ba50f476ded;
 Wed, 14 May 2025 09:08:43 +0200 (CEST)
Received: from DM4PR12MB5277.namprd12.prod.outlook.com (2603:10b6:5:390::7) by
 IA1PR12MB8312.namprd12.prod.outlook.com (2603:10b6:208:3fc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 14 May
 2025 07:08:40 +0000
Received: from DM4PR12MB5277.namprd12.prod.outlook.com
 ([fe80::9ab:5367:ba51:af6e]) by DM4PR12MB5277.namprd12.prod.outlook.com
 ([fe80::9ab:5367:ba51:af6e%3]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 07:08:39 +0000
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
X-Inumbo-ID: 44741ad4-3092-11f0-9eb6-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iWo8yapL69qsgNiC8m+AAg+50ORynp00Hxr6yI4xbGZgwHmHkQNqxIcXOs6jbCU20bZTKuJsDh8uEm85mkam4gV03G7JVkRnJTCkUc1oYNW+t5Qf6YTw/pVcNrEzHXi6q/Lmz5C7LtZM9FfRDZJ1A6exzaQ6UK7tUEy60E1Tzh+pDEbkQnxkvNttssgcdOdnNeopfimv3hzdAE5sGhF4XcmzfTNL4MY0AF+A7nAZbPqKmP6CbWXqDR3UkkD/rdi7RhnBlOnR+BZwnSn+YOY4lytkiUfyC37r3dujdhmaPT3A9cEz769dGkSxrDFS9jdVe0ZvMF/AWis8lWi4xwkR1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XSug5UFo8aZiLYMizIuP0bAvaM6rQ3x7gEg8lrds+z4=;
 b=xVZRO9TSPVvpbX5h+ASjU9LgmS+TvOS81lruG5Wb5etiYj79ugYy0dDgaaVaPnbSOYuhp52jWgEhQWfCXHnt0p5GhsAaw0qp40iN1CsyT4HTS4l/gbZw+umGIhnBOj8Ck0FA7VclYuZpHdzJZ439Nf6SfNDPASAurlwTavDmUDewNAsNRmosGxianVXyzUMdwg4BVW8ChpiLgrhJ89VQxVanhuGCRSOlCtFwewcbr4X6P6fQ9/HbORtufwRMp4lS279rf7YIZ8H3opt4mY/dXxTRuGqASEKl3C135eZ/QvK8qlQStcYaePRft0hF+vFS+5KnhlnI+QJvSLLgNw+EFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XSug5UFo8aZiLYMizIuP0bAvaM6rQ3x7gEg8lrds+z4=;
 b=A6kd7y2cjvGKXAWtYpB/UouZEZSuJi9mStj9SDbGLVqR8sYzIH79Hd8nDXwYd0ZPX04RBRpMVEhn7f9poHQgcFnLvvy0UWE3D67f3lut/g3W/Onv4QFDaoawyYWbLG+xGVfHZfHbzWpQLq+mXWL7SUzKaGIup+K9mnhMNoG7O6o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <62f55484-aa91-48c9-9e80-97fcd8c919de@amd.com>
Date: Wed, 14 May 2025 09:08:35 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] xen/dom0less: refactor architecture-specific DomU
 construction
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1747145897.git.oleksii.kurochko@gmail.com>
 <a13b414ba19c8928dc7b0e70cece6c26a77d514f.1747145897.git.oleksii.kurochko@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <a13b414ba19c8928dc7b0e70cece6c26a77d514f.1747145897.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0122.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::6) To DM4PR12MB5277.namprd12.prod.outlook.com
 (2603:10b6:5:390::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5277:EE_|IA1PR12MB8312:EE_
X-MS-Office365-Filtering-Correlation-Id: d134581a-2714-4e18-8e52-08dd92b6273a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZzUzT0hyblhWcjhlbGVZOEZ0eTZTMEM5YVU1cENMWTU2SlliU1pDdkJSekhh?=
 =?utf-8?B?bzZoOUFYZElFL1dkdjBEV28vbUttUU81Q0RDRkMvUERUSnVIZGlVdlVnOHdU?=
 =?utf-8?B?ODhZeENlZzgxVms3bCtJakZqVVNOc29FRE0wdWpOYk1SMWhkVU9EUWNpSUZ5?=
 =?utf-8?B?cWZGRE5PQ2s4eGphSDRuU05CMlo0cDYxdXdacG5POTEzeGgxZzJBWWs0Q2h3?=
 =?utf-8?B?ayt2Szl4MHZ5ZXNvRHhqUCswZ2xWY2ZjaVVQVDNYbWZ4aXY3ZkNCK0JUUUlh?=
 =?utf-8?B?cTJSTEIrTHRKQVFwS0d1c3pHaWdvNWVIK3dTSCszOE5ncHFScklRQ3hmN1hu?=
 =?utf-8?B?ZjgxaGl3K3FDaHcwTWxET2ZoR0JzcGEzTFFQRGhqUUZBYzBmS3hTUXlSeXlx?=
 =?utf-8?B?ZTc1TXE0UURtWWJReWU3RlVJTmtxbGsxSjF0UXd1QjBYYVlmR3ZicGFRVmk3?=
 =?utf-8?B?NWJ1UldWVFREVlV2RS85SjNrcGZjK0NOdVk2K0RnUERPNE9LS1cvUC9UTFdx?=
 =?utf-8?B?ZlRUVld3TFpXdjVPVlIrOWNwOTFxL0NyN2hWMm5OQ283dVdoVU9IRUIyc3BO?=
 =?utf-8?B?eVAxaGlaWWROM2VjUjRLb3lYQ1orWGFtN1pkR0ZOa2ttZnlVY0Z1Y3RYQ3c2?=
 =?utf-8?B?S0s2QUIrK1hGL0lFaEZmVGVqRlpTZ3hxbFh4cDZIbkJhemJ4cEpEVlU1dDV3?=
 =?utf-8?B?anBWNXdiN21CRFFaRHhlWFZoVjNobFZ3T1VKWkwvTVkvYzNvMjFQTWYrM2VT?=
 =?utf-8?B?S2V0Ky9rWEpoNGlsWm9JdDd5K3gxYVBCZ045WmJNUmEycS9aTk1welBMbHdH?=
 =?utf-8?B?TUVKVnlTVFlqbkhvc1hzYzRjcEJZVjFXUFY5ZEMxcXFTcHZHZUxRWW9tRnI1?=
 =?utf-8?B?RTVMa3JMNzZnREVMTE1tL1ZlOWlkaVhDWjZYbjFZcnRwUzdoZlFRWVg4RUVx?=
 =?utf-8?B?YW04ZUhEOXgrcE4vQVdRWm5aVkUvb2JtQjhIeWNvUTRQN01VL2t1VGtxRW1M?=
 =?utf-8?B?bFVEKzZRd280d3JkYktkdEpvRTk0azBsYmZrZkV6MlREYWhETkt1bWoyZVpq?=
 =?utf-8?B?a3ZjUXAzN0cyODVFTDhJTkUyUklGMVNpcFRrYzhtWnIzaXlJcWVXTTQ4eHZ4?=
 =?utf-8?B?T1pRc29ZTEhtODR5dktkNTVjTGh6cUR2TFJHdkJBSE5vbFpTYlZQVFFiQmxJ?=
 =?utf-8?B?UVlPcTZ2Mi9pUHk1ejNlUFE4SzFMNHZjbjY2cExzY2VMQXAyVFRqM1VrazYv?=
 =?utf-8?B?Zm4xT2tlSGN4UklFcWxxWTdjSE11aTExZzNxVEF0OWU4em56VnNIUGdoeVBn?=
 =?utf-8?B?UXZ6emhabzRic3JWamhvdVNtSHNTRkh2YVZFVXgydnNDcXl2eFAxVkhnVG9X?=
 =?utf-8?B?TjBvN0o0cGNNR3FRODFReDVBdnlsSkRsOTEzUWNpM29rbkl5UlNmcUNRb3V5?=
 =?utf-8?B?ZzdCeHFOZ00rOGdhdnpibUZmL1pVdSsyL3EzcEZoNTBxWmdXbEU5N1ZyNUJ5?=
 =?utf-8?B?Z3ZtTDE5UG5EMCtLWXVvNHVEUUhrL3ZTODhMNVhWZk5kSnc2TXh2L1hnV3Rx?=
 =?utf-8?B?R0RBQzJjaDEyZFNuV0RUL1NLUG9YenFLU0ovQmw2VllzSGlCdVZST1dvNk1I?=
 =?utf-8?B?QzFLQjRqNmplM1Fyd2lva0xmWndxVExzTDY5WSs2L2ZvNkJJUmFvMi9DWnls?=
 =?utf-8?B?SkVRM2pFaDNEZmhNeDRBZDlIQ080R0JNb0k3RU1ndDZCV2VCckRlNFhvZmVJ?=
 =?utf-8?B?eTgzUFlSMldwM0t2UXo4U3JzcHp6MkdrNGMvM1dpU2dGdzJuR1R0T09WbFBK?=
 =?utf-8?B?L2N1dzdvSWZkcHNQaG00cHpmNVZDekxpMndiTzYzbXB4Z0NEV3FHSDJRV240?=
 =?utf-8?B?djFIc1hjNklwYnhWOUN5WGJrTkJUbVp6UnR5THVFOWF0bmlFbnBGQjNQUDM3?=
 =?utf-8?Q?IWTwgEQznEE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1M0WkVqN2JmN2Q4TTgvY2Iwc2psWHZFZVFZS3JCWEpadkwyUG55SlRWUFg0?=
 =?utf-8?B?VU0vbnUvTUFsTkNPb0xNd0ZmVVd5TmNXb3NOR0x5b0NYeWVBQStQem9RK0Nh?=
 =?utf-8?B?YzN2dUh1ZytTenFLejJhVjl3YmQ5RlExeVMySERvQjFMYlhRZXIxVU9TK09W?=
 =?utf-8?B?aTlLdmxXTmR5SDAyYkF4YjlGcTNQVW1ocDZtNHhwc2h5aUFEM0ZuVFZGQ01T?=
 =?utf-8?B?Y1NMSFdOMUNGTkJWWFQrMGkwQ2FMVXdUYlExS3FaWVdlcUpqWVIzQzdab1Er?=
 =?utf-8?B?b0FZTHc4bEZ4dlkvSEpNRno1d0RYaHN6OTVnVGpSaGdNOWx0TUg5SVBJY1Rk?=
 =?utf-8?B?ZlJmRnVXVGJrZTFyNVpCZThkeWFUZHdPOFJqZnFIZlZNSjNEZzVicUIwWmVG?=
 =?utf-8?B?RFNTQUVTeFlyQjdxeGZqOUkza0MwV0lqSm9UaWI3MnhtSFhZUzlpZ25Qd3pv?=
 =?utf-8?B?cVNwZTNUQnoxbWVFb3dOYld1aTdDNmN2K3RPaG42RHJPSUpRU2owZnN4WFZK?=
 =?utf-8?B?VkFHWVduUUNLalRaSlZ1Tk44OUMwQWZTcFNxWmY0MDhBM2tYY0NSaW02RmJD?=
 =?utf-8?B?U0xzNjNhVVZlS0lTY1dEV2xWYzQ1U0NweURpeDZwWlRIdzdEN1dmZ3pvYzhG?=
 =?utf-8?B?NTNReEJIb1VCeXJwTTlEdlE3NFJjdE9pMnhDSitvVjdnVmI2VVJqTFNnS295?=
 =?utf-8?B?anJ0WUpvNjlYeFljOU9XdnZBT3U1MW9NbktOYlZ5MkxUS3V5OGRyMmlXZFdO?=
 =?utf-8?B?a283L3lacUsvZ2htTkx6NFdyeGd2dU9NK2pZM1pZdVlKcFI0SUxQM0htY3FW?=
 =?utf-8?B?OEo1c2lETDZjbEF5Vk1lZzJrdEZqZlpyL3lJWmVtY0NuSHQxYnBhc1VwQnpp?=
 =?utf-8?B?MDlzR0k1SlluZ3ZIYkl6dGFrQVV6MWQyTWN1UUg2cHIxVXRXeVROM2tLeEtH?=
 =?utf-8?B?R0p6c3hMMHdjTjlWTFlhVDFYMlBGQXdQblZndUQydS8yblM1TlRyemFpaVYz?=
 =?utf-8?B?WG04RHhnVEJrU3cyY2dGWGtwNW9ETGdNSWZvbkVWN2NKbU16Z0U3Mld2Zkha?=
 =?utf-8?B?MHJyYnB6REU5YTUwK0h1NC80VWQ1bXMzNkNxbndXOGxEaFF6V2tvZFV0aGNy?=
 =?utf-8?B?bThjMnRheU85cUpSWFR5VVZ0WDFSeFBzZW5LY2YrOENOTWdJVTJBNmJVelhG?=
 =?utf-8?B?OWx4ekJnY3puOXBSNW5QNFNjcTRmRWtxaGsvaEx6cFM5TEcxSFlRczJrc1Rm?=
 =?utf-8?B?UWpGNWxKUE0rSTVBZDVpcmtZTEFsZGZHTzk1NDRHL3ZORm5meUduMnpsbks5?=
 =?utf-8?B?TVc2ZXZMbFFlYVBYZGkxR1RHeFRxQksxeVhFQXBKL3NUcmhlK3hkNVVjaFBS?=
 =?utf-8?B?QUVtM2VySCtRQkR3NXQ2UUIzM0RySXpUZnMxVmZPQWtTKytTK2dERFltUGMr?=
 =?utf-8?B?NE1TeStDS2pEV1Z3ZllrSDM5ZHU5NlROVVo2Z3N1TEtmN0xUb1ZTQi8xRUo4?=
 =?utf-8?B?Mk1JNEU4M0E3VDhMZGFSaWpSNVpGY2F6SS9PbUxteTVQRzZiSFdHNmZYQmVW?=
 =?utf-8?B?VGY4WFRFdUhycGM3dHE5bDMwdDh3c21LZEY1SndYcHBHb3VlV21aTDNBZU1K?=
 =?utf-8?B?aFAxQ1RZK0ZodHZCcENDTkVBQjRqU0lUT1AvcVo5MUNEeU9EL0hPSGpYb3ZW?=
 =?utf-8?B?UEFwY3M1TXRjN2MvU1FqcFNyTWVuUVB3VHBPOEdhcnZyM0dkS1JtakRSaDZ5?=
 =?utf-8?B?b2tUNUNQOVIxYkd6VDVZdERnUnNMZU5Gd3RuSTVPbHlsTjEwNEFHZHp4aWJa?=
 =?utf-8?B?OExkVkJibmNDejREUU5pa3pNQW5UNmdudndUVHZ2RGhzTTg4eHQ5WFF2TUs4?=
 =?utf-8?B?cmhpbnV2V28xRnpNTENKV0x2aVpQOWh5WVlxd0tXQ3BBaURUNVpmWlhuV0Qw?=
 =?utf-8?B?cDRnWFdxK25TM0I3TmNrVEhxYlVOcC8yN2E1QzJRZGRGODZHTGU4M3k2djc1?=
 =?utf-8?B?eGVGc01iRFg0eFplN21XVmpPOFIwQXk0MjJlbVRQY1hnR3d3RG1Vd1NoaFpa?=
 =?utf-8?B?Mm9YSlE4S0EzYjg0LytOblMyakw2U1B1Z0V1NURXL2Z1VkZ4STJyQ0xVSXBR?=
 =?utf-8?Q?yThtvBeFQNdizLuahhmiZrTs2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d134581a-2714-4e18-8e52-08dd92b6273a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 07:08:39.8891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vhSxBv54Y1Xo/uiy8KOrRYQfeUWH5ZjnU0HlCDg0pwh+scT8GZhUpgo1wgQlvMb1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8312



On 13/05/2025 16:29, Oleksii Kurochko wrote:
> Refactor construct_domU() to improve architecture separation and reduce
> reliance on ARM-specific logic in common code:
> - Drop set_domain_type() from generic code. This function is specific
>   to ARM and serves no purpose on other architectures like RISC-V,
>   which lack the arch.type field in kernel_info.
> - Introduce arch_construct_domU() to encapsulate architecture-specific
>   DomU construction steps.
> - Implement arch_construct_domU() for ARM. This includes:
>   - Setting the domain type for CONFIG_ARM64.
>   - Handling static memory allocation if xen,static-mem is present in
>     the device tree.
>   - Processing static shared memory.
> - Move call of make_resv_memory_node() to Arm's make_arch_nodes() as
>   this call is specific to CONFIG_STATIC_SHM which is ARM specific,
>   at least, now.
> 
> This cleanup avoids empty stubs on other architectures and moves
> ARM-specific logic into arch code where it belongs.
> 
> Also, don't loose  a return value of functions called in
> Arm's make_arch_nodes().
> 
> Suggested-by: Michal Orzel <michal.orzel@amd.com>
Thanks, it looks better now.

> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

possibly with the remark from Stefano fixed.

~Michal


