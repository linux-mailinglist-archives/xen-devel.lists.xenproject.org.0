Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B30EABB63AF
	for <lists+xen-devel@lfdr.de>; Fri, 03 Oct 2025 10:18:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1136400.1472981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4azk-000794-Ab; Fri, 03 Oct 2025 08:18:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1136400.1472981; Fri, 03 Oct 2025 08:18:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4azk-00076d-7J; Fri, 03 Oct 2025 08:18:28 +0000
Received: by outflank-mailman (input) for mailman id 1136400;
 Fri, 03 Oct 2025 08:18:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=04fq=4M=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v4azi-00076S-OE
 for xen-devel@lists.xenproject.org; Fri, 03 Oct 2025 08:18:26 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 868b9ca4-a031-11f0-9809-7dc792cee155;
 Fri, 03 Oct 2025 10:18:23 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by PH0PR03MB6462.namprd03.prod.outlook.com (2603:10b6:510:a9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.15; Fri, 3 Oct
 2025 08:18:15 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9182.015; Fri, 3 Oct 2025
 08:18:14 +0000
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
X-Inumbo-ID: 868b9ca4-a031-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ua29/l3W3qRJsQqjEe2d5jke1RHCY5qVdtc/wwQlP71WXMH70qhtoQOkLEAGMEKH09KvFTVlnqB2qQ3z28vHpBHgQtv0oracpDyaQbAfSy6fyfWEUC2zen9yJFWfQArkd2zXU40MFR3esKP2339f3rN4yMBMHqSDgAg+l7U6T4Ofjh7Bkt6tfaGs8OhL/0FdL7f/PUgfwdMKXUUot8Sspi6uprOXrSE/zwq8TTMQYkYRonlxorO2nzn/l7liDbhs+mTsiqg2VVzG19rcsk1yHYR1ncn3T/6SsYlWjRi8bBU8GoOUeWpzhQ6CW4Jnd84YBgWHWqYlzAeLIRv9oaoMaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=psaBbf1ss6nYZU78PxYX/h1BWlBoxVQN5YTSBfKgEL0=;
 b=nvb12BJBkFmX0orOMPeKnUnbl4g9DJVgKDABs8tbNqXazoZLb1xMHplf4PTJk0XU32flVWEB1/jg+ZQplMnT5Sj+ToFRRvBgfGa3D03tPvT68w6ZK8nGjbM5WrYjiVeS/dm9ufjZI9fzeIrO4TW/bH0KPPtCT8K17Nmpt8e+zpc0UIrj7EBLaKT+bkQku8miBwRb3vdw2jBmBPkRaYy/Z8IpSuzAU6I+fj5JtJ9toJQH2DICR3Ag0Jft+Y4akj6ElfDTt0gAm1Wf/oD0Z9skn/wgztqp5km5yICpeEBW6Mi5kLgqjBJUqquPhZycfbaS6asJzgLGxPs7IlnnGNukVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=psaBbf1ss6nYZU78PxYX/h1BWlBoxVQN5YTSBfKgEL0=;
 b=sWQEYrEZRQnZYm4jGdeGjr52hls91eG3NiJfU/rcbegtrCFoPqTNX96QMCH84spRQ6SKpic5DaUZevP/AgIEnF3v/K+BrJClyk18JSnbAS/VC3UE62GJfJL5AJ+IiudK82f91/9/QMAwKrejllEYqk96QH32CJtP0855velieDI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 3 Oct 2025 10:18:10 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Xen-devel <xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH for-4.21] x86/hvm: fix reading from 0xe9 IO port if port
 E9 hack is active
Message-ID: <aN-GwqVZNaAfu8mV@Mac.lan>
References: <20251002102200.15548-1-roger.pau@citrix.com>
 <1b4bcb40-d62b-47b5-847f-b6e16906f52e@citrix.com>
 <aN6APR-CUc9xRjfM@Mac.lan>
 <DD7W410Y9LYL.GD6FXC9Q6H37@amd.com>
 <aN6JZTlumMF2B0ym@Mac.lan>
 <DD7X9ZDWAJT9.2J6EHGRUMQCVL@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DD7X9ZDWAJT9.2J6EHGRUMQCVL@amd.com>
X-ClientProxiedBy: MA3P292CA0023.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:47::7) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|PH0PR03MB6462:EE_
X-MS-Office365-Filtering-Correlation-Id: 85543958-0a36-4900-90a0-08de025565ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NW1jR1R5b1JIS2ROSEEyeG9tZFh3NkVRNG1lZTVUOEhTSUY1ZEtCcnF6QkxO?=
 =?utf-8?B?VG9CSnBETWthS1kwZlhDdnZxTWJxWXc2dmdiS2xKMlFFb0pObVN0aEJnR0pV?=
 =?utf-8?B?RU15TjRXbjYzSStLVWhzZ2tXTjFWL0VqU2trRHpjbEZBV1VUZXJKbitJdlU3?=
 =?utf-8?B?UUQxV3oxZ1JMRjllTnk4VlIwaENzWm5MWFVlVnpUVjlCOEliRjF5dGlSbjVY?=
 =?utf-8?B?cVQyZmNYVFhlYkZtaDRWOFFKV0J1LzBYRG5idTFkcFZpcFdXLzlSYm9NR1hB?=
 =?utf-8?B?TUFjQ3VnTTlHcUJGZkR4NElhZExER3NxT0VSRm9TN3NYNTY3UVJmRTdXd3Zs?=
 =?utf-8?B?aFRDYVFRNldLZXpvWWpEbENTQ2s2MkppK2t0K0ZrWkN3YkdvZVQvWElGY0Zm?=
 =?utf-8?B?Uk0xampUL0ozWkZiM2tRbzR4aFA4WmhVOU1wc05xUUs5WkliOHdjSkZhQ1VH?=
 =?utf-8?B?Vi9jdGpjZU1YNTFuMytSdExRbFVFM01YVzl4bS82c2Zxc3ZSWHNzVXhFK1Bt?=
 =?utf-8?B?TU1FNXY1dUdTdjVNeXI2L3czQzJBckV3UmhGeHZNalBQb2NaSHhqUTg5bFFx?=
 =?utf-8?B?M3dWY2k5MzgrVlZtNWZBREswUDZCMkxLNFYxdWRmamhReis2enV2cGpaRVZa?=
 =?utf-8?B?Z0Y1WDNxUG1scUlRMGhJVmJHbTJaSDRRMlVMTE5MTVlvWklJaXNEQ210ZVF3?=
 =?utf-8?B?UnNrWDhBbHluSkx3RFMvd2dreGI4NEl2WEdsUDhaRHhzN29yQytvQmNJYjFw?=
 =?utf-8?B?TnBSUEV4QUd0ODRiZ1lSYSsrRVpLMUppZkM2bXZSMERXZmwzVUdvSVJzUm1B?=
 =?utf-8?B?RzFLR1pCRXU1YkVISE84Zm9WZ21oaUp6Y3BYM1Q1REtDTW1ScDVtZENCSFRs?=
 =?utf-8?B?akdRNVdJbllnQTZsNmlGRHNyUHhScTI0OGc4Ym5UOVkzYUw2aUxpNkY2UlZt?=
 =?utf-8?B?SGJJdnFzK1FTSFZFZHZxQzNNNlZZdXphdEZyVENZNngyUlNQd1hEVDFOeXMv?=
 =?utf-8?B?QWFETWUwZytpNXlpb29aclFDQTQrdm1pTVU1ekRBVHNUbXg0Y0pCWXUyKzhU?=
 =?utf-8?B?Z1FNVDM4ME9jRVdIUWIrdE5oUG9Ob0crUm9oMVNyRHg1YnRMUDUwNzFUdDY0?=
 =?utf-8?B?WmFFalBYVHFvV1h2TzhUc3JubUhLL2ljVUZLUTRaTkRlRGdEUEd3dXNTZUdN?=
 =?utf-8?B?Z2picEJRK1Bab0k2WjBEOGtvY1R2RmdMOGF1RTdCdEpLTXkvZ1ZuaGRTZ29D?=
 =?utf-8?B?Q3A3WE9EaGEwYnRwaXhoeERkaTNuVnNoaGRBK0k4ZFNQc05WbE9KSCtQUldu?=
 =?utf-8?B?MENHWldXRytUaCs2eFlMTmw0L0p2dHdzVVJGdXIzNjFseFI4YUFUNk9VRGNr?=
 =?utf-8?B?WHA3RE5sc24vanB3dnFNUHZrOUczNUxsTlkzZkVUOXpIL0ViSUp6cGRmWXdh?=
 =?utf-8?B?TU9uczljV2s1dEx1Z3VuTEt1Y0l2V2oxampKSkJZK3pkelRva0lFa3IrMito?=
 =?utf-8?B?OUZUOVg0MW5RZEs3eXYxcjBrM242WUNDM3dVOFdJV05XTFRtV056QWdtRGlR?=
 =?utf-8?B?NWM3MXpKTVZ0WkRtMDVCRCs2VGlnRUY0bUNQcDlQL2pid2VEeVJOYjBpeTdq?=
 =?utf-8?B?alV5NUdVZ2tHcURZVGQ3N3padzMxeDNScXBValpOQkJaYmY4S0xOSDdIVGEr?=
 =?utf-8?B?QVAzTWxQYU1RU0NldTVYbHBpNCtkMW5vU1paeGdKZHFkRHE4VHB4d0dDV21u?=
 =?utf-8?B?SGoyeEMxbkJUZFRhZnlkWk5ZcTNja1BpVk9UaWZFVXl5TVUyRXUzNEVJNTFz?=
 =?utf-8?B?QlcrWUtaeUlpeVNOdlJ6NnVKQi8zNWZMRS91VTlwZG5pQkE4c3dYVndXOTRJ?=
 =?utf-8?B?eEhqbDdsb1FGdndJa1d1aE9FcnlOMWIxMCt3cHRhOUtQL2c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1hjQWF5bGVsMjZMNHhYNTliVFBtWmVQbVV0MlBTZ3lVSkpreHRjVTBPMXVn?=
 =?utf-8?B?RGdmdmJnelpDUEcwN2tUbVNDZm9TK254OHpqdFNUTWRvdjBKbXNvN2xtdFFw?=
 =?utf-8?B?VFVrTmx6ZFhXaDY5aGV6Rk90UEtidVlROStNM0U4ekw5c3NEQm9YaWlmdHRD?=
 =?utf-8?B?QWcwODRUdXU1VnQydThad3Exb05JL1JJWFQyMmpKTW1wSVhoUjlBbisreGxN?=
 =?utf-8?B?cStHZW05MGh1Y1JUeDd0cGJWMzlBaTJLYk1MeE02SUxVOFFJSS9MR0hXeWho?=
 =?utf-8?B?VmJZa1BvYW1ZSkYrUW52TkExRVpFRTR0OU5EaWVCb2l5a05BYi9jVUpOL21B?=
 =?utf-8?B?RGpBNmcvRG9lODUwY3hvbG1LeGIvY1dGeE81N2tYOVJ0eS8yYm9iQTFOZWdu?=
 =?utf-8?B?eTlQeDJpbGRmUzhxUVcreWdBSzRnVjU3NlhONE02R3FaZ3YyaTZCSzd2ZHpp?=
 =?utf-8?B?U3lrWUlUcE1YamVnL1BLSHN3ZGdnckhUWnp2TFU3S01RclFZNEluR3VOZEZG?=
 =?utf-8?B?blFLREY5YW12dXp6ZG5MUU52TDNJM0Y3N0hyMmlSRGRhZ21tVnlJZmZ4ZFNR?=
 =?utf-8?B?bnVnZUdrLzhoT1dNenpuTUgyYzFUUUphdytlc2I4cDNJMTNVeGJTOXcyTU52?=
 =?utf-8?B?Z2hxaXdDNlpyREUxRlNjb043REVZaXY4SHNBYzhhUElLbHZaakppZjlaVkNR?=
 =?utf-8?B?cFVvR3NMNlk3OU5PM0gwMHBFTHNJZUVQWEdsaWNNUGJHNkpVaUF2OVZuNisz?=
 =?utf-8?B?NmlXcUk3bWM4YU81a3B1ZEgwN2lmWGcxcExXMEg4TlduNDRKbVZOWUZhUFBk?=
 =?utf-8?B?NVpvWUZ3UFJKRTE5ZzlLRDc3cUdHdllQWDFiTjZET0lJdkxoOTl4K2NncUVQ?=
 =?utf-8?B?RjIwdVdRRE50ZTVYUmRUaEZhQTY5SmIzR3V3QXFvN3cyalpyUW5MN2k5U2h4?=
 =?utf-8?B?S3k1U0w3dmhoWFJnekkrM1l0cUtZRW9OeS9oSzJRUTZXNGxRL2hkQTcyWmFM?=
 =?utf-8?B?VTNiVkxESGp2Z2EyNnNnYkVRa1I4NG9BbnY3VmhoemtydDZDblA5TDFSeFpN?=
 =?utf-8?B?WVI0dS95bHgyMEcrdnJjRGhpbDR6Ulc1azRCbk1GWUtRdFlyNTdlUWI1NFY0?=
 =?utf-8?B?bVFlMmRxNDJpN2lmNlk1VHZpbzZTZmxXcm5Yc0FmaHAzSEQ5SWVSZElXbW5j?=
 =?utf-8?B?ZVBVRGJnaStCU004U3gvbXQ2Z21QQTZGclA2MnJhYndyUG4wWC9DdVhiV0ZG?=
 =?utf-8?B?SFlLd1pPSFllU3QzVzVQa1I2Rnl6TlNrY0xzak4ySDAyWGQzaUkzOGhIVzV5?=
 =?utf-8?B?K0g2WDlSczNQQ3pNWU9wQmp5Rk1HNjhKRGpha1Y2bHJ5aEszZWdUVG9rZFdL?=
 =?utf-8?B?TlI2Q1hFVzVaK08wTTFCaUN6QzE2a1A0bG91WnNsTFcxa2QwSndOVFVYa0xw?=
 =?utf-8?B?TGJjbmhDWmNEMFpKTWhvVVQ4SGVneU0weTlDbEpFZTR1anN4L041eDFzVGp1?=
 =?utf-8?B?aVFNNmtMTUtTbDJhUUFsN2VkelUydVVlNEVaMjRZU1IrRXlLdHdKUkxDUFpp?=
 =?utf-8?B?Vlk1d3M5bWRRQm42Y0JhSTdOY210MnZlcDVyTnRtZCtDWVc3ckRVR25UVGN5?=
 =?utf-8?B?dUZ2aW8yb3hJWG5VV0dPZW15OVU4QVZSaEtWWjFSN0I3bWRNU2dISlkvL1l4?=
 =?utf-8?B?cmh4UDFtQkxoeFZWdzByRWhyRjIrTnE4S1E0b0RpaUFwZ3l5d0lZNUdrcHZT?=
 =?utf-8?B?YVVPaHpQbVFnOGhHbThUZ1N1a1oyelc2Tnd6RlRzaWx2WXpaNXNWWXJaSnlD?=
 =?utf-8?B?TG8rSTRBQTZRamNhKzZJelhYS2lBZlRRTWVhdVBnVlkyWml0SEphaytBSzhE?=
 =?utf-8?B?cFhoSnROSDQzdUZuRk4xWWhWS1lsQjFhVkE3amFGeWdzUzRaOUdXZ1FYVERt?=
 =?utf-8?B?NTZKK2RQOUpmanFQYi96d0ZZUFNSNDlnTVEyVUQ5SExUcTRuNlNaclg4aXNX?=
 =?utf-8?B?UHZWMmNYWnF4OGhoU3FNaW5uVHN2YWEzQkJuWGhKTGtlWkZBc05IOHFQejA4?=
 =?utf-8?B?aWxJM1kvWlpCNllUakQ2YzJnbFVVOUZsUTNWbHBJSkg3bjBwZlQzRHFFdXFr?=
 =?utf-8?Q?OhRzDFr+tOvoz7IQGnk/CPCuU?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85543958-0a36-4900-90a0-08de025565ef
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 08:18:14.1798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ifcCCZ9nAAFQ35eXPjs4NH/xEHNzW6vQbcEPf5xxjCjALGJWYE/CbEWf0dz6EC8eu70R9dSg7pxDarQ++RFepQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6462

On Thu, Oct 02, 2025 at 04:56:48PM +0200, Alejandro Vallejo wrote:
> On Thu Oct 2, 2025 at 4:17 PM CEST, Roger Pau Monné wrote:
> > On Thu, Oct 02, 2025 at 04:02:00PM +0200, Alejandro Vallejo wrote:
> >> On Thu Oct 2, 2025 at 3:38 PM CEST, Roger Pau Monné wrote:
> >> > On Thu, Oct 02, 2025 at 11:37:36AM +0100, Andrew Cooper wrote:
> >> >> On 02/10/2025 11:22 am, Roger Pau Monne wrote:
> >> >> > Reading from the E9 port if the emergency console is active should return
> >> >> > 0xe9 according to the documentation from Bochs:
> >> >> >
> >> >> > https://bochs.sourceforge.io/doc/docbook/user/bochsrc.html
> >> >> >
> >> >> > See `port_e9_hack` section description.
> >> >> >
> >> >> > Fix Xen so it also returns the port address.  OSes can use it to detect
> >> >> > whether the emergency console is available or not.
> >> >> >
> >> >> > Fixes: d1bd157fbc9b ("Big merge the HVM full-virtualisation abstractions.")
> >> >> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >> >> 
> >> >> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >> >> 
> >> >> That's been wrong for rather a long time.  How did you find it?
> >> >
> >> > I came across the documentation above and I didn't remember Xen
> >> > returning any value for reads, which sadly was indeed true.
> >> >
> >> > This was because I had the intention to suggest Alejandro to (also?) use
> >> > the port 0xe9 hack for printing from XTF, which should work for both
> >> > Xen and QEMU.
> >> 
> >> QEMU doesn't support 0xE9 though?
> >
> > AFAICT it does:
> >
> > https://wiki.osdev.org/QEMU#The_debug_console
> >
> > However when running QEMU on Xen as a device model writes to 0xe9 are
> > handled in the hypervisor, and never forwarded to any device model.
> >
> > Regards, Roger.
> 
> The more you know. I searched for it once upon a time and couldn't find it.
> Thanks for the pointer.
> 
> Regardless, "-debugcon stdio" is functionally equivalent to "-serial stdio"
> and the latter can be adapted to work on real hardware too.

The emulated serial is possibly equivalent to the 0xe9 hack in QEMU,
as I expect the serial is mostly setup to "just work".  On native you
likely need to configure the baud rate &c, plus implement flow
control?

Is there any testing XTF should do to ensure the serial is there,
before blindly writing at 0x3f8?

Thanks, Roger.

