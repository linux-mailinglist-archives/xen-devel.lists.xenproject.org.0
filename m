Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA18C579BA
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 14:18:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161472.1489414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJXD7-0006TZ-IZ; Thu, 13 Nov 2025 13:18:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161472.1489414; Thu, 13 Nov 2025 13:18:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJXD7-0006S6-Fm; Thu, 13 Nov 2025 13:18:01 +0000
Received: by outflank-mailman (input) for mailman id 1161472;
 Thu, 13 Nov 2025 13:17:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X5Bi=5V=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vJXD5-0006Rz-T1
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 13:17:59 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b17ec41-c093-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 14:17:57 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MW4PR03MB6474.namprd03.prod.outlook.com (2603:10b6:303:121::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 13:17:53 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 13:17:53 +0000
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
X-Inumbo-ID: 2b17ec41-c093-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I/zuLFzgPEli7FiCPjk0ad5ztJJ8NLiHZ7H2P8zRZtnYQK9wh73kSH/JYQn9mu/VLfOS8vW7gibxnfo2AVFxOaSziorQEjiY6D1BPQDSQ47Y6GxtAJkjMB8Ex85MmfTv59JTgaEYwY/fkdU2tnrxxmQCvnav4X7s8t77c2lUN5qKmaixydmaNHk2fB2oEMJF1vlulzhSKFqHWqP6IoJUXO5AGsUaEsjKSg1dufO7iucWixUcNljfn5TraZA+XYODo/olkKKVTRucXXZ7ydBi9ZC/PYtvFcIQtCEAU6CHS713eLf2zt6pPkjyiE4mGQrmz9xCnI+/or1CbjXfMiBxPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IwXmYX3eOYhvipiTCQPcJ+6k9KWItQfK2RlNtrfwylw=;
 b=rkGJoBoBO5r5qOqMFVeFJ4IEM5XAv26Y5/c9fZVO+zmP+4X9hTYmb0ipxk6W+YVwzPIIgerd0qQVP8BLMWufVYSgIJKvrRwRsiq8RpS7tGyeJOxydXnXbk91mxVjJMll2uOWZ5/x+1R/ty89Jm3vr8cATeEnIOSHlarEiBFVON4Lu1RaArPsu3UfYeJRDzz4Fs6YRJOtmC9s2vRnICeMvlwLWeo6bw4Dh/RCjSDitdl95Eo2cWQf7W8AmI+4AeBCio2Hj0AF+p8kBbxKD7kf/3CKBd2gbum1QRrBM27D2j14iIrLuEymtIvv019UtMq7E8EWSNMZi5QvkAxVtjatDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IwXmYX3eOYhvipiTCQPcJ+6k9KWItQfK2RlNtrfwylw=;
 b=mePAtAf+rTpwkyrf/OSjQQvjjOpAMoSLiDKJVaf0sJQKpq1LcuQ5khvfdC05wI4hWNZc0gzPnrfGCwBsS8pgH69PKZBUTRKV+WvuToUMXXZPfmVgTlNOPDvzUg+X0QhYX9oZJkPQ86j0yMwocDg2Q70BIeSMMChr65it369Ydpw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <5c14f58d-c8bf-4c63-b48a-9af5af88c8f2@citrix.com>
Date: Thu, 13 Nov 2025 13:17:48 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21 v7] xen: Strip xen.efi by default
To: Frediano Ziglio <frediano.ziglio@citrix.com>,
 xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Frediano Ziglio <freddy77@gmail.com>,
 Demi Marie Obenour <demiobenour@gmail.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20251113124945.25343-1-frediano.ziglio@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20251113124945.25343-1-frediano.ziglio@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0279.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::14) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MW4PR03MB6474:EE_
X-MS-Office365-Filtering-Correlation-Id: 265f30d9-8750-42cc-c607-08de22b70d1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QldCdVNaZVFncGN4NXc1ZEhoZFA4WS9vK2dHTXY1T1ZNMndBeS9qUTR5S3Nk?=
 =?utf-8?B?M20xUVZjQUp0Umd4SEdhYjMwYkEyUUhScTJWWldQUTZlMHFwSkZwMlZJRW1J?=
 =?utf-8?B?NDFDWnp6dk5FV1RaNHdHRmZ2enZpN1VrYUMrTEh2U3pGYWl5a2lGZFNaN09N?=
 =?utf-8?B?WmJ4TkEvVVRpM2UyS24yUVJDaWFLNzh5K0hxT3JraHAxZ3JmbUZqYU5TV0pt?=
 =?utf-8?B?NWlVL09WaHRvQUt0Mi9zeFdQRG8xb25QWkZDVENvNlhieDdEMzMyYk1sRkZY?=
 =?utf-8?B?SUp0U0c4Tk95MjJmb1dMUlJncFlqUyt2RTAreVg4NTBWTjFYS2dISk83czJY?=
 =?utf-8?B?SzhFSzViVU12VmQyZnAyVlNuMWt1WWMrbTQ4SUs0NDJzc2wzMjN4MEVobG1j?=
 =?utf-8?B?N3R5SnM5Nm5Lbm1pZW1JR2pQRnBaZjlQbCtPcGFXd1ByRncwRUIvcXhVWlBL?=
 =?utf-8?B?OHVicnJLSDFHbWc5dU9uUXprbzJSVFpPZS9SeWpDWjBGb3YvUHNzZWtjKzNv?=
 =?utf-8?B?WnNIUGNvcVZRczRQRzF6ZmNoYllWVCtwOXUwa0ZVbWJsQXl1enJqL0JZYlFR?=
 =?utf-8?B?QXhmZXJ5V2oxT1NXT0hzVExKcTZzNnBKandSZDQvNUxySHN5VkRrekhOV3hT?=
 =?utf-8?B?SlpOcG40UVk3ZWw5Nkt4aHQ1ZERPWmdDRmZpWnFrZG9hbDBpRTZyNFdNL3Bl?=
 =?utf-8?B?UlFCaDA5QVZnRTY3UXJXbE44RDRpaXRwMTVpS3cyWll1c0RLeDJYSFgxU2lX?=
 =?utf-8?B?WHhHNUxqY3FlaHRXTFIyNkRTNW5CbVRIa00vSmdUaFRzdGZkdmRhSTEwSWFR?=
 =?utf-8?B?WERwdVhnSnB1akhJWmJMeXhuYlVCeUFTem5raXJrNlV6ZUFBOWlDTDF1Q1VC?=
 =?utf-8?B?SEp1NHRuZmI0bUI3d1JuSDZjZlF4TUpMVStwR2o2aDBGb0l6UVc5akhMSzJi?=
 =?utf-8?B?b04rZHRZRnI1aFlvRk9WSVcrd0tlWEl5eHdseFVRc3pKYVgvUDlGTkxvSHpL?=
 =?utf-8?B?cWlEck1hbXJpK1ljbEpWdDFQUFBSd21oczhBSXRWWUhsS3ZWcTJGbDJGTjcr?=
 =?utf-8?B?K2dCVlMwTTdZWUdyY3pIS0NlZEZqckRBL1lCYytrU1RGaC81d1RqSU1mV2h6?=
 =?utf-8?B?aEJMK08vL0ZBdlZqV2pCbWhwM2Zxdko0Qk9WalphTHJ1T2x1aXQydllmU1pn?=
 =?utf-8?B?RHdVYnF6TGN5d2Rnem95RkRHek1VNTJPRG1LRWNrYy9GUGNCVmNQRkpGUmNB?=
 =?utf-8?B?bEsrUGNzdmNkSmhaME4wTW9KSXBBcFUxUTRES3p0WW1LdENpZlg2K0tqUXZH?=
 =?utf-8?B?Q05ER0U5Qld5OXZXa3IvTkQ0d080RmNFREM4WEhTOXZOQ1VULzZUQXduTXp6?=
 =?utf-8?B?Uk9TSGk0SmdBYXM0bGs1ZUdRWjRjZlA3S2NQNlNxUFdOdkU2TmZhUDE0NXVz?=
 =?utf-8?B?R1RzSU9BdldZdXNZbnY3YkM0ODJ0N2tPSDA0SnRxOFVpMjZFMHN3dERhcUhz?=
 =?utf-8?B?SGZSelk2YWZuNXVhTTJSYWR2R1ZONEVvUTRSeUMzWmtSS1EzU2pqSWJ6UEZh?=
 =?utf-8?B?RlhLd2NRZEpjaEczaGpDb3hFZG5RTXNJR0RxSEFKWGFBeVNPVmlCSVRSQlJJ?=
 =?utf-8?B?V2MwUTNvNmY5SjU2QUJ3ajl0TFA3VjNEL1RJNDh5Q1UwZkFKdjJFZERQdUVi?=
 =?utf-8?B?OGx2RVloS09Kc3R0a3VTTEF3Sk5heXRySmNqZVVWR3VNN1RGK0dRMzVXVHBr?=
 =?utf-8?B?SzVMQ1ZHRjhudUJGc0pvNW5adkNxZVFPbTRVbnNZcDM1U1Vma2t6Wm9tRDJQ?=
 =?utf-8?B?Vk12UjgrR2pyY3FDY0o5WlBSTkp3ZEtvb2ltT0Rjd1FwVDIvOU5NYm1IMWx2?=
 =?utf-8?B?b1F4eUxvOUlKN2l0OVluTC9JUGJJcUR5UHR4VkZLRnY3cFE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UW9WTEFoSUpkOGtuc1NRWUFudVJGdVBnWFVOL2hJWE9KSzVsMHJtUEhsTUN2?=
 =?utf-8?B?UW43b2NPSVJHQm54QzVzLytEamJhdWdPQnV2eUNkOUY4bHlEaWViVTY1a1hW?=
 =?utf-8?B?UjdRSFJFWkVTOHFDR0dVNHdhdFFKV1hDZjc4VFh4Q0sxajdMczRKRTM5S2FN?=
 =?utf-8?B?ZmxqTXYxWk1BUXEydThFQ1dGMk5PYThuWGVCakxlSSsxZXFJM2k5TEpFZGRW?=
 =?utf-8?B?dkEwNmM1T01RcDhsdnFENVhBV1doc2ZxQjZreDMvVk5UekVQTW5zWWRPVS9p?=
 =?utf-8?B?enkxajhDK2ZWRmJORDJDMEhFeEg3NnZTN1hWNFcrYVNucFYyTDBQelE0QTkx?=
 =?utf-8?B?L05XTzBKYnBkNGVkY04wM0dyeGxRcjVUcERhcG1hMlplblU1VWl5N1d5OHlu?=
 =?utf-8?B?YUNLUnhJNU03TVg5djZxYUFNK0ZzK3lZdHlJYjJnVEhoalNkQmJTbEhYOVlL?=
 =?utf-8?B?WkpqbTE3U2Nka3l0N1Z5dHE4L2Fwc21JN2FwNURBYTdDb2dvVXE1MXhwZnJQ?=
 =?utf-8?B?bjYvWVV4T0VTKytlQXliWXRJR0hjbDlOclFwcUNwTGE0WENkTFgxc0pxblVK?=
 =?utf-8?B?YjlaWGR5SkxlQnFldWJ3a2UwdVZuWXF6WFRmYkhTVFo5SzRJK1d5ZlV3ekhO?=
 =?utf-8?B?eG5hMnU5VkRJRDl5Q3U4ZGdRb1lQTnNmZENWVjJCMDdIalVZY1RDS3RqUVJX?=
 =?utf-8?B?dHlPTTlIZzY2UzhHZTJ6UEZOQncwTjUvcnBLWWNIMmxWa3Q3YjZQdkR6NlZU?=
 =?utf-8?B?elFWQUMyNFVCVXhZVWJlUDNjN3BrSE9vN3lhV3FmWklFV25KeWFCZlk2V0lR?=
 =?utf-8?B?S0JQY3dRWVhpaTh0b285b3FpT3VWeURVZ2FBeVQ0VUI3bmkxUUUxNmRyWCtn?=
 =?utf-8?B?Q1BzWlZ2V2RqYmxaMGVoa1VvUHcrLzA2SXV4SzA1UmkyT0FLVFBLUWpVU3Bm?=
 =?utf-8?B?cnBQdzYzTUF6UlJRU3ZISG5WWmdXbSs5Z1NCcWxmQS9CT3FmZ0V5d2hJUGZE?=
 =?utf-8?B?STVySUZQbzhBQVIxdGlReEN6U2huZzBYczdGeGVHVGcwWllEQ1ZYNkpRY3lD?=
 =?utf-8?B?ZjRDemMrNlNWYUpQbVhRUVl3NWhlRnhxZDN4bTJQbENuYzlYMnNrejc3VU9C?=
 =?utf-8?B?aGpaR0NJSFlwSTdpUVNqQ2h3QjFlbkhwTlBobkJ5Z0RSVWI0N3B4YmNSZzNx?=
 =?utf-8?B?MmtNU0FjSEpJTCtXNzRjSVlBZnltZDFWK2s2YVJJcG56cmZSaW9YdnB3QklI?=
 =?utf-8?B?OHVDQzlmcjE2czJ5bXJOV0ExMWFTeTdRNEFOQkZjT1pqVDBMWFczZXNzWkFr?=
 =?utf-8?B?UHMrVGNkcWVJV0Jua1M5Ykk3OFg4SmF0elp0WGI4WnpLT25tM3hxVFIvUmhV?=
 =?utf-8?B?MGVyeU1WemhnQ2dPU01JWXI4K2JSNWp3aUZxWGx5ZER1bnVBVDVjMG1vb2tT?=
 =?utf-8?B?MWptMDFaQ2lJSWRXanR4OHE0R1ErQ1FML0JpTnBEKzhuVHVnQ2tJczBENVBl?=
 =?utf-8?B?bk45SVhXN1BWblhsZ2k4VFpMZXc4S3UwWlFTdHpuYmVzS1NWbmRCZ21EYzhG?=
 =?utf-8?B?RFFvQ0lvRWkzU3hCVU9ScEsxVUhPSlYyZEVqcWhnWjE5a0lFc0U2a0VPM2tO?=
 =?utf-8?B?aTA5UDFSSkMwcDRpb21LZTJ2em14SXcvU0ZubUttaTErczhQeWxoSlBIeVpY?=
 =?utf-8?B?L1M5Q2hodGc3aFlQOXlCTXRuU0VtR3NWNVVWTTg2SW1nTkJublpYakFiRlpS?=
 =?utf-8?B?aU0rZTBuSlNUY2MwREpYbGRsdXl0UVdqUElpdFRZWXpMWmhCcjdDL2Q0MGtn?=
 =?utf-8?B?WmJLRENNRmU3akNSazhxaHJXSjdBMnU2c05oQjhqQVRzVmVQeE1GNkVVM2JT?=
 =?utf-8?B?YW9MK2I2QVIyREhITSt1bkxKT1lKY0xmQllhWWx0dUhGODA2dktuSi9Kc1E1?=
 =?utf-8?B?Znk4SjdkUkYvR3lGcFdSYVdOajJmRmdJbEZGdzdlN0VhL0t1UGNQd1hhV3NG?=
 =?utf-8?B?NVN6ZWVaWlVCU09KL2dRMzA2VU8xUm9reTdzdDBrbkozeXdzODdPamdpTmRq?=
 =?utf-8?B?NnJNMWZ0dGFBYUJqdlUxVUgrOGFQZU5JQkNSZmo1REttVzVWTXNVaFJxQncv?=
 =?utf-8?B?V2RDQytkRXN6MWZIcTk4UFFCUDVBK3F2WXgvdThYN0huaHBEcmhlUXRnRU9j?=
 =?utf-8?B?NEE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 265f30d9-8750-42cc-c607-08de22b70d1a
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 13:17:52.9931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bYMxsRye4sRbj8TT5AjUa4QItEG2F9lagBuyykTMw5Kjgso8ZalR+fmy8ocGWFVxNm1hG6LHcNtERspwOxzHU//n1Uvj9t1H+yOA/CRDg6U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6474

On 13/11/2025 12:49 pm, Frediano Ziglio wrote:
> From: Frediano Ziglio <frediano.ziglio@cloud.com>
>
> For xen.gz file we strip all symbols and have an additional
> xen-syms.efi file version with all symbols.
> Make xen.efi more coherent stripping all symbols too.
> xen-syms.efi can be used for debugging.
>
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> ---
> Changes since v1:
> - avoid leaving target if some command fails.
>
> Changes since v2:
> - do not convert type but retain PE format;
> - use xen-syms.efi for new file name, more consistent with ELF.
>
> Changes since v3:
> - update documentation;
> - do not remove xen.efi.elf;
> - check endbr instruction before generating final target.
>
> Changes since v4:
> - simplify condition check;
> - avoid reuse of $@.tmp file.
>
> Changes since v5:
> - avoid creation of temporary file.
>
> Changes since v6:
> - install xen-syms.efi;
> - always strip xen.efi;
> - restore EFI_LDFLAGS check during rule execution;
> - update CHANGELOG.md;
> - added xen-syms.efi to .gitignore.
> ---
>  .gitignore            |  1 +
>  CHANGELOG.md          |  3 +++
>  docs/misc/efi.pandoc  |  8 +-------
>  xen/Kconfig.debug     |  9 ++-------
>  xen/Makefile          | 25 +++----------------------
>  xen/arch/x86/Makefile | 11 ++++++++---
>  6 files changed, 18 insertions(+), 39 deletions(-)
>
> diff --git a/.gitignore b/.gitignore
> index d83427aba8..213972b65c 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -222,6 +222,7 @@ tools/flask/policy/xenpolicy-*
>  xen/xen
>  xen/suppression-list.txt
>  xen/xen-syms
> +xen/xen-syms.efi
>  xen/xen-syms.map
>  xen/xen.*
>  
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index c9932a2af0..3bdcc3b47a 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -65,6 +65,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>        for hypervisor mode.
>  
>  ### Removed
> + - The install-time environment variable INSTALL_EFI_STRIP is no longer
> +   supported, xen.efi will is now always being stripped.

I'd rephrase this a little.  "... INSTALL_EFI_STRIP no longer exists. 
xen.efi is always stripped, while the symbols remain available in
xen-syms.efi."

Personally, I'd have put this in the Changed section rather than
Removed, but both can be adjusted together.

This bug is on the 4.21 tracking list.  CC'ing Oleksii.

~Andrew

