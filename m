Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5331BE797F
	for <lists+xen-devel@lfdr.de>; Fri, 17 Oct 2025 11:20:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1145069.1478220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9gcj-00037J-UK; Fri, 17 Oct 2025 09:19:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1145069.1478220; Fri, 17 Oct 2025 09:19:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9gcj-00035A-Qn; Fri, 17 Oct 2025 09:19:45 +0000
Received: by outflank-mailman (input) for mailman id 1145069;
 Fri, 17 Oct 2025 09:19:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rDIu=42=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v9gci-000354-2q
 for xen-devel@lists.xenproject.org; Fri, 17 Oct 2025 09:19:44 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6974e4a4-ab3a-11f0-9d15-b5c5bf9af7f9;
 Fri, 17 Oct 2025 11:19:42 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by CO1PR03MB5858.namprd03.prod.outlook.com (2603:10b6:303:9d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 09:19:39 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9228.011; Fri, 17 Oct 2025
 09:19:39 +0000
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
X-Inumbo-ID: 6974e4a4-ab3a-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YMwsL2PUl+ohBZnApnrzId4B/OhnC/ZVmprIKCU3aHU2OkL/In4xhti8+cMaklsP2KOuBbF+8qfS7oy0ey6nv31KF9LoiMMeTB0TgSVV2g/qw8EFSqHDdbKwUMVJVi5dNC4YdlNJAFgrriTK6ZusAmq2vSUaMKid56/dLKMlyQd3eXu4fD+cUzQU2EN2QlNdVYTjHTyUpHbswtfqr8CX8haQdVzoduhFPkQpusFYErM9m6QBESCzZvXpGSMIbuOuBDRZomAZK8bDDZA6IHoWBhaTUsrwsjqFwohSnW5LgwN50YR4BOkHxss+0qP73NjYRjOrgqRwNDwIVQa5ep/QGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sZq96Ytn09krc7nKMIaw7UO4c8w+ULtWp8ZSmGY2ZSk=;
 b=A8T4aiBkU5m1uHKi/lx+C7QZLXjfkQb5qDAOXAUD0CLfKZ7BCbx9hhaTR1wavdgRS30afPTN7N8Eob3836oiyndg9kVpGLEABm2Ez7LdK3ORCu5JNYvJ21T2eER4L5vDDTR0HrrALHGzmoyudNtLB2Cuo6kMoR48SDkpACI/5uUAaSu2vcmeDRpQaJqGOie4LNA5WEw9TC8Xc6ziE1YFpQN7FN6UF66ViE0QLhPQpGZlbzWoyngpUiz5pbtACoMuDHxkoJmBJamqkZzxyiq3FXRHDKRND79S3NPD/K233Plx4FHO1Bj/zVVJckh5QKbRW7h4D48K1gpX0fD8lY4TFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sZq96Ytn09krc7nKMIaw7UO4c8w+ULtWp8ZSmGY2ZSk=;
 b=ae9WUUcSdWSFkEMzypI0bmtUbwSBVKNt13tx+KmAXlUittC3mhM07OcoIT+e7u1HWmXqck8ZBpwUE8SLneWaT+1KxNs8WdyKJT828r/7C/JYqrm8h0BROjZxSZs9cIfBHbTSoWLZbU7JGjKF/mwZHTHMGgTHQyHdjxigvoQ3GUk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 17 Oct 2025 11:19:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.21 04/10] x86/HPET: ignore "stale" IRQs
Message-ID: <aPIKJw6I8pUFngC1@Mac.lan>
References: <8d94abf8-70d1-478c-885e-ff9a960ac72d@suse.com>
 <e16e2b62-9c2b-4534-8279-daf986cf438b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e16e2b62-9c2b-4534-8279-daf986cf438b@suse.com>
X-ClientProxiedBy: PR1P264CA0095.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:345::13) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|CO1PR03MB5858:EE_
X-MS-Office365-Filtering-Correlation-Id: 0350aba0-91ff-4b39-a291-08de0d5e4c2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RXNOcFJtbHlNOTVkUTZtREdKd2VDWmZvT3RnOTJ4aEx3SDNMU2xiZmN5RDVQ?=
 =?utf-8?B?d0l1eGlBNnZlSFVzeFAxbGRJbnVPdklMZjhsVHpHYlRxczhYcTQ1NnE0aGFH?=
 =?utf-8?B?cjF0a2YzVzA0aGg4d2ZFWnUxdS9rRlp1ZUZYSUt4dUF2RWp6NWQzK3JhMDYw?=
 =?utf-8?B?RkVvT1dzTnFBZFBaUXY5TWVodmFtUFJYQzFQcnA4cEVPeWc5cEQ1WVlsMHVs?=
 =?utf-8?B?UldlRkEvN3hCbExZM2lmS0d2QUlrT2oyaXJvempwakw2OXdIUVI1TFpDb1ZT?=
 =?utf-8?B?M3J6VXp3TVYxRVo0NXFYM2lPNlZIT2NYZGx0M1lsUkhDMHhWOXN4cUFlenBP?=
 =?utf-8?B?R1lpdXdmdFE1ci93Y2thbmh4cVl1VXhCYXhRMGR0MDUzMFlzM2Zheks3V0F4?=
 =?utf-8?B?a1hmYjZpQlhNc2ZuZkpaSnZKbWNsN0RxU3ZCU2ExYTl2TDIyWVZMcE5MWGtx?=
 =?utf-8?B?RzBqT1VZSDlHVzhOZHpwZVFKdVhCM0RnZ25OQjhiUjN3dy9aNCs5YWRIWmNz?=
 =?utf-8?B?cmZBZEZENUN2OVBJalFQRXdvUENSOWxDc2pSVjBBSFV5akxBTGNaQ2t3ZWFl?=
 =?utf-8?B?Q3h2OE00MHBaZzNIa1lnL1JFNWlHWTBQRHkvL0UzcUU2Z3pVdWp3cEN3eVBa?=
 =?utf-8?B?QXZOVzJDTGZ2UmJlMkZDMHlXUnVhZEo1YXlmeWwwWStsbXUzSnBPYVpzY0tG?=
 =?utf-8?B?bVVxN1dSYkFzNVFuTTJtWndneXNwclZYelRYMzFXbm5ZeC80Z3ovU1ZXL1dC?=
 =?utf-8?B?K1RPMitHZGJ5UXBVa3Vqb3ljeHVUdUNQMU9Wc3M5Q2YvNHZpRjF0RnZJSVZq?=
 =?utf-8?B?MlF6WGszUGJEbW5XS2RHZlRZYnBWcmxvYk43a0JRNGF4RHhtZXlRcTdxMWFo?=
 =?utf-8?B?UHQzK0ZNZldhdGI4V2NmRWw5bHVIWE91RStxTit4dGpHNlZJYk50dGhyWkNO?=
 =?utf-8?B?TENrSzJhQUd0cTdRb1VtZTlzdGVQVVRiSjVUVUo2RTREL0VES2t5NUlWQXBz?=
 =?utf-8?B?a1ZJMEtTeEFpai9sVEQ3RHpmRmIzSlpER0NMZDFNcFcxcWtkQmY3bVhXNUlT?=
 =?utf-8?B?Qzc5VEtKY21NbkhLa3FyVUhYZTVHQ08zVE52eFlrS0N1SG1CL2VCZVpFWHhI?=
 =?utf-8?B?YnpaTUdsZDhUa09UUEFGSEtOdkxJb25MYUFKMzFIMGUyeXhWK05SWEVCV3dn?=
 =?utf-8?B?YUVCZnh2dndWVGhqYzdQd2ptRkl2QmhWbWJzYy9ycU5JYkxTV3FLRUc1VnZQ?=
 =?utf-8?B?bjZEK0ZrcEFCVzIwL09KQ001WVFzd3c0RE5rQmt0RFVhbjFYRWUyUGs1QURM?=
 =?utf-8?B?TENJbGs3U1RJS3loOEpBUld1K1ptRUNSZG0rRnRRcUlFOFE3V3NVQVAzNkFl?=
 =?utf-8?B?dDhoRk9vMlVBbFN2YnlRVjdxb3lDdDA5NnJhTDlHa1VEMXdnMkpaZEIzY3dL?=
 =?utf-8?B?dklFY3h1d2lLZkFCQ2ZtZGE4UktJY0Z5ZTJxdE00cDk2UngxVXlERU5YTVdP?=
 =?utf-8?B?Q0tRaksyNkt2YzNodDZGdEVYS2x6blNJUkJTOEY4WDJRdkRrb05GeTN3YzFi?=
 =?utf-8?B?RkVXR2Rqenh3Wm1YSitnU1MwenQzYWo4SkU0MDhYLzBTSU9nMGlwUnlWMnV2?=
 =?utf-8?B?a2dqcTQwRi9pM2ZEZjZLZ254SUJiSGduSllNV1F5QkgySXplNmFVN0NrSUEr?=
 =?utf-8?B?QkR4NlR3Z3VCMWVFMUg1dVBhNlNOdU8yeUowcjJNM1VuODE1WWNZc2tia3hi?=
 =?utf-8?B?czYvS3FyS2lsMGJqbUg0MVhZbDF0c3JtZC9KbFhZcllTU05QVTJMa2Y5aHRm?=
 =?utf-8?B?ZXRYcElaa1Nyb3cyaHVBNXZyMFhxbW96TTh0R1l3V0hvdU9QeEFUdTJ0SklU?=
 =?utf-8?B?MUtaMW9zSUV1aEVTdmJXVFpxaHduMnhUZm00d1BSMUVRNjlkRkFkNU9nUHpl?=
 =?utf-8?Q?NgffgiJamLRJwM74C1W2t1wuu+6chYZb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWJzMkFvUSsxVHQyemVpczFnNGlWc0xEdXFOSFF4ZGRscHdTV1Z2aldNd3Vi?=
 =?utf-8?B?ZHdxOU13ZEllRFN0c1hRb2tDZTAzRWlkY3p1c0Q1bXhPVVd4SkJraElzekJ3?=
 =?utf-8?B?Ky9sOTNhUjFDL0crRExRQ0EvQkVwY0gzcE9sZm9TRWNmWHZwa2E0clg5b2Qx?=
 =?utf-8?B?aGlrYUpFSVlCZWR1cTVHVHJ4dlF5cEk0RkZzYlBGRVY0alpadFZ3NDZUaExX?=
 =?utf-8?B?cHVxNFlNcGhnb1Q5NEFlVnJncVVTTHRJL1hSR0JsOGRKOFoyTnF6a0xyWVZv?=
 =?utf-8?B?UTFqbTBSMEdGdjhFczFSZUg2STJRQ0Y2b3FHbmpvdWhtN0dOS21FN3NEdmYr?=
 =?utf-8?B?N1FSblZyWGlsOG1yQUFORmFzOHNFeVBlNTQvYlZUOTdla1o4bnJEVUhkeGN5?=
 =?utf-8?B?MUdnZk1VRXIzbDVJNzFCSy93UjArZVNEd3E2cjUwV1JkUTNxOUZVNDlJYmV4?=
 =?utf-8?B?WkJCanBxOURnODVWekVhNHMzbjZzR1FZSDQ4ajlWMStJWEtsL3M1QmFnMElr?=
 =?utf-8?B?cy8yM0hrNHFzU2Vqa3VLRVpRejRtdU1FaDJaNEloMHdHUmJPMUN1bUZmRldP?=
 =?utf-8?B?cG8xYnQyTGRWWVB2SW9UNDZES21RdkF3QVZ2MFpob1VHd2MxQzAwNlF5NnNk?=
 =?utf-8?B?U0x0SS9Jbk4yNy9zeXdOVlBzV2p1Z0hNdzdhLzJGOE9FSGQ4NGsxS2llUFFS?=
 =?utf-8?B?UlJCRWtFUG55QXhDZ2N3TE1hVHMrRmQxdFpXSHJJQUtHM2xPOGNIaFNlR1Ur?=
 =?utf-8?B?Um5ZL1VqMjZSa2pTTzA3U2xBanlXZlo4VVFHZUU5TVY5THIyRnNVa282VkVB?=
 =?utf-8?B?TTVMUGpmMmgvQXFRd3pyYXovTXMvZGp5STZqTnpkMFpOcGZHVjRGMk5ydEdI?=
 =?utf-8?B?WURJU0ZuT3RzZExuY3NkUFhWbGVGalBlWW9JZStYeVhsUGpJYkRadXM2dWp3?=
 =?utf-8?B?RjRadlJieFJQb1AxenRrRmNnek42bncwNCtGWHZabzV4dm1pTlQ0bkphL1U1?=
 =?utf-8?B?WUpTbGdPekJLRmlKeVV0Ymp5ZUZMMmFCUWxSTC9tNUlReXpkSXV1eHJtNW92?=
 =?utf-8?B?L1RNZm45eWdheWFNZ2VrTkM5SHh1cG41SE01M3djRkp6NzZZSFBMTnVUL0dJ?=
 =?utf-8?B?dHNEZDJrcUtnS2lBaUswRThiS2pHcEY3VG9NL2J4UVp6WG1NM20rcndxMkNr?=
 =?utf-8?B?cUNGUEYydk9TOFc2RCtiK0dXOGUvRS9PTGQzQUVSakZyaGxFMkFsUzdSaTdq?=
 =?utf-8?B?SkhPNlpXR013STc4Mnd2QUdjZkJVZkV4Q3UwZWdGOVMrOU45ZWZMaXZTcmw4?=
 =?utf-8?B?VURzSTVwS1ptTDk0dkdSNVRDejR0dWFXZTg4VTZQeHQ0RGRObG1GZVpIbmpy?=
 =?utf-8?B?aWZldzNpcUpiUm9LWWpqVWY3UFBTcWF6S0VRb0ZRSmdITndyMHBxRzdGTDhP?=
 =?utf-8?B?cDA0OGxwSEtjekt3Wmg0c2g3TjZtcVk5aU9UUHh6WHE2cHZ6dWNDNXhvaXdE?=
 =?utf-8?B?YkIwNyszbStPSXhydG13STFIWjNzS0dVTVZreGJvRlVHWVZMNFl3bDdPNjho?=
 =?utf-8?B?Tm0wRzA1Zi8wOG5paHpGd2FMSVdlUW1tMHF4NmllTnl0ZW5nWDkvUHJsV0RB?=
 =?utf-8?B?dlZ5YWt4Lzg0azN4Z0FIVzAra1lQdGZsNmxlbWJ4MDNZaXQ4TnlzZC9zZVBo?=
 =?utf-8?B?UVkxT2J0c3JTdTVmMGx5OUhPSW1Da0J0TnQ3anNHVG9XWUFYZFBDRERnRFMr?=
 =?utf-8?B?cU52ekhnZWRyeWVmWExlVDZwaXpnZXlBTDY1K3hDeHlseW5ubjhhcFd0dGFs?=
 =?utf-8?B?MFNXS2luYnA3UnhXRkEyQWhDcHNCcnNlS0VRS2J2M0N2Q0tXWmUrQXpzZGti?=
 =?utf-8?B?SCt0UW9UZDlHV1BFKzFVR09EVnZ5YmVRaFdRWU1CNXJyNXNqWVFQaVNsQjU4?=
 =?utf-8?B?dENCd2UzMEZ2Y205RE94SlhmLzBZcUY5aG50bjhWZkwvSjRiNzVXMFVLU3pG?=
 =?utf-8?B?NnE0WGw3RHZEYWRBSGdyWkxicUVzK0xoK2xPejZyazNmR3BKMzVRWTRMdDZC?=
 =?utf-8?B?dWlJcjBQcnBza2J3a1ZhL2NOYVB0N0puamFJTU4xWG1oRlRjTnp3bklqNDUv?=
 =?utf-8?Q?31ZlLugUH1c5KEzI1uafe9SBW?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0350aba0-91ff-4b39-a291-08de0d5e4c2f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 09:19:39.3032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rxDtRLzdOETuwtVh+6j4u7Llnmyn/THeEPVgRwQaq8mpmuhLQvt0M05QOv4zVN07bZYVCuBCgJfKyFuuEKrh1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5858

On Thu, Oct 16, 2025 at 09:32:29AM +0200, Jan Beulich wrote:
> Following hpet_detach_channel(), IRQs may still occur: Ones may already
> be in flight (both from before and after the last IRQ migration, i.e. on
> possibly two distinct vectors targeting two different CPUs), and new ones
> may still be raised as long as the channel is enabled.

Description would need to be adjusted if nothing else, as it speaks
about two distinct vectors which is no longer possible after patch 3.

> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

With the above adjusted:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

