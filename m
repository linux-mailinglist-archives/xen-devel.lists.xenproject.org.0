Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4BABCD595
	for <lists+xen-devel@lfdr.de>; Fri, 10 Oct 2025 15:53:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1141221.1475778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v7DXk-00084Z-Ak; Fri, 10 Oct 2025 13:52:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1141221.1475778; Fri, 10 Oct 2025 13:52:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v7DXk-000829-7m; Fri, 10 Oct 2025 13:52:24 +0000
Received: by outflank-mailman (input) for mailman id 1141221;
 Fri, 10 Oct 2025 13:52:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1vPy=4T=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v7DXj-000823-9k
 for xen-devel@lists.xenproject.org; Fri, 10 Oct 2025 13:52:23 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 579c92ee-a5e0-11f0-9d15-b5c5bf9af7f9;
 Fri, 10 Oct 2025 15:52:22 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by PH0PR03MB5944.namprd03.prod.outlook.com (2603:10b6:510:36::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 13:52:17 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 13:52:17 +0000
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
X-Inumbo-ID: 579c92ee-a5e0-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kn5IP+DqaMXyfnMWEB5VmSJE0HTV9LxmatzAcwYtmBuUUKrAm4+nSdEIxu7IY3buqZBIHuYYLAv4yJ9tq8Jtp1na4yWde2OjkKgATeHqtgimhbvZ9sSDTo3+Z7mg98sSE/K1QkpQSx6FmXzxBUarjl1Xpdl3XExbegk78p1vRw5I9QFoTEmDF5QWmDMtagpcJfDSaGXfXttsnGHNq7CdD2qPCBmtCk3USIYSqUxjnspdiMhq6EWglwgV/oVoWaB/gD86sv651v9vML2xixdCwKvvh4QZfDA7EtFG6AkrwH9qqeHgocw5gr4fSHgON2K/hyrkM1J/LPxyKmwjrPMpvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iRsbWzZh6NWmanuGC6yLuMnE8VsKm8UEG2Uo5cuBanA=;
 b=XoXE2bYbE4AT5bsgB9CI/0rcBU6PtZv830rJYt+NuQGdBzfHnpGdlS4UYP7Nj+cyVLUNIgowvLKm01JqvQaXUnX6mgOULyFX7fSxp42DHZe+OF71cH79GFkMxy//VhSRTTyQWogkj1rdAHjPriqvEfoYMIW8uAoWS6N+mrJt+uEPdHvRoqZqPb7p9RoA3unhKFiwav2wHOFV3ahf4CeXqw+kZ0VkV8kkpI+QLjy8PP0bBroGNSO8X3JQo5HuvtXrjTwwuGW55PejEwKAqwfAKR9tykfCsXAgQU4AxhL2kS9S1yv5UbkEnBvdLkTuGvq6mTKfpUNYf4pXeLgJCsh9zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iRsbWzZh6NWmanuGC6yLuMnE8VsKm8UEG2Uo5cuBanA=;
 b=fTreqWyfS8HCBNH9qapqk7yQIt6y1BwGs4Xgnmn0B98oq1JBoXKtvU2kXfOlW3BzCSwAjf0Lvurg4YMEXwEJCLd6xcxy4GzGZR1rHIIn4xzZpKumNBqvP3lyjYUvYjiBOo57zsRdXmwWzuA+ahsk0VI4JTZc61Rn1HpUlMcw+kw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 10 Oct 2025 15:52:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Andrew Cooper <amc96@srcf.net>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Grygorii Strashko <grygorii_strashko@epam.com>
Subject: Re: [PATCH for-4.21??? 2/3] x86/vLAPIC: drop VLAPIC_VERSION
Message-ID: <aOkPi7DIZtlDfSKO@Mac.lan>
References: <265d5053-af61-42cb-a3b9-ef60df39c21b@suse.com>
 <feb47fa6-27a0-4cf7-8fc6-bf5f29f467c1@suse.com>
 <aOaP54CZw8lgLLUv@Mac.lan>
 <4523206c-7e0f-4197-acaf-4a1a08dad929@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4523206c-7e0f-4197-acaf-4a1a08dad929@suse.com>
X-ClientProxiedBy: PR1P264CA0146.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:346::11) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|PH0PR03MB5944:EE_
X-MS-Office365-Filtering-Correlation-Id: ccc07b25-5ece-4a23-bf2b-08de0804397e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MkdvZVNmZCtIQmxHQ3dvZmZHUjhuQmo5d2FjV09ia2lkRkdkUGJ6Y1VwY3Qw?=
 =?utf-8?B?MFNMcGJ0bDZZMjdBZXZRd2RLa1o3U0lZNUorc3AzRFJiQ3Z4ekE4LzkrYUty?=
 =?utf-8?B?cllDcWpxWHJzWm9XVm9BcndPelc0cUdvUVFZTHhjeXErSmJYb2Q5RHBzZURx?=
 =?utf-8?B?aWxYV21DclRpeTArMXp3LzRQNDZWQXFkMDJLOERIYlZncmFpcFBOMFoyU0kv?=
 =?utf-8?B?VERFT0U2NjRaOUNYU0hDcysxc2ZqYnpKUnlEYUJQaS90U3VSYktmc0Y2NG5L?=
 =?utf-8?B?d05CRTJ6THBUbERHUWM2S1FPbHNXdTNWSG83ekhLMVNGdXgrRVNKbUpJTFpQ?=
 =?utf-8?B?VkdMVmdSc29UQ2JnMGlLb1lsVHdOa1lHbG1zYVN4b2ZYSjlydU5DZEFWM1Iw?=
 =?utf-8?B?RmdYcWhjMHVWZWFMMUJXeTQ3TEVuTFdwSlZuNjIvelNxbDdRVk1jTCtSWity?=
 =?utf-8?B?SzczYXFNSk1nR0hNUHpHL1BjZkNuSXBSYlNoczVBOCt1OHJrRVBCTFo3RStp?=
 =?utf-8?B?aUJ0Q2U5aHlWdm4vUkxDL0tMMUZLZmczR1VMRCt1VzNpSWF5WHNrK2p5dVFC?=
 =?utf-8?B?VTJLMFNyWldldk5RWk9kWElJaUc1NmF6cnJ4cGFib052NjZ2bjRUYUhCeFU0?=
 =?utf-8?B?ZngxVExQY1VIWCttWjNjSWoycWxXVUZ2eENrTEN1TVRZdVlKVWI4NzdLSjRF?=
 =?utf-8?B?TDJkRHVNdEMyY2hVK3hDamxhL2JsR09nN0kvYUtyYlNDVDYvbC9VTjk2L1NI?=
 =?utf-8?B?cEVKY3dzMmRIQklPMkhuYW93bWVVa09JTmJteWlqSmYwNjYwaEJPZllmWVlm?=
 =?utf-8?B?dG9sSW13MTZVdERDT2ZUNUl6ZlFucXFmL29OcWc5cDdkQUo2R3RBZmI2dlhJ?=
 =?utf-8?B?bzZwSmV0Yng4OWhxMUd5MWw4MzlGS0ZtWTQrSEtmRlFod3JOamFyVW8vclJB?=
 =?utf-8?B?VjFTTmlzQ3R3djlBdmZ4OVowN1VnVDQxWTVNYThzWGtTWEhJcm8rNWhEY2N5?=
 =?utf-8?B?YW1nTmVrNGlZbnhRanZZMm90d0E5T0dMd282eURkSENJTC95R3ZmbmJ4L1hN?=
 =?utf-8?B?bzNCaG5FZFNXM0RZdVNQcEQ3cG5yOTVtMEl5bXBaRkdYWVdRTVltbXN6bWJt?=
 =?utf-8?B?Tkc4SmxOeVFoSXJXWGJtTEdXa2wxK1ozNEVOcUJ1a0lEb3lhbFJzVUplbUVq?=
 =?utf-8?B?dlBCaXFwR0YrM0YxZjFBZlViejZaVUN2enFlWHBBVHJWOG5ZR0dQMGt3VlUz?=
 =?utf-8?B?dzlURzVFZ3hUM2FNNkRJU2dDNGlzMDRxY3VXOXZsVEIrcStYdDZpUEIyR2Yz?=
 =?utf-8?B?c1BHaEVlZHR1R0N5bE9NOFU3RWRHVURzZ3VDZW13RHJmaEZiUlZtZ3FQOW5H?=
 =?utf-8?B?MWQwSmdtR2xnUE8zTWEwWGpUSDZkTTVhM1RJQUxKR0ViN1pzSHowdjNUcHZU?=
 =?utf-8?B?T0lPWEluc21nMC8wNEN3eFF0QjRzQzZmNWJkTFJGSEgzTktWWFdzdHFiNXN1?=
 =?utf-8?B?T1NhUTBVbnlSTFo0aDJkRVNFdnpaNTNtTkdFMU1xeDJYUys4MmNSU2Q3OU0v?=
 =?utf-8?B?VThzMm93MWdLT3ZPT0xBWldoQnVDRVRmYmFaV2gxQkQzVU56NmVyemc1bTg2?=
 =?utf-8?B?YkVqS1dRRzliWUpOOFFhQUY3WGpxSEM0NGlXU3JocnBQRnJvTHRUVldINjZs?=
 =?utf-8?B?Mzl1WThYK0VHMUc4RHdEQm5XUjlqdmNGbDEzNExnTTcyajFPL0NXQUttbS8v?=
 =?utf-8?B?dlZsaVA4cExINExKU0Nac29WYVdEbFRHbDkyMEJUSDNudSs3MVVrWjJ3L3NJ?=
 =?utf-8?B?UE9zZXMvUXdyZ2Q2YmhHRlNyTDVJcEFRVm80SkZaUHZYaWNLaU1ic1FiSGpE?=
 =?utf-8?B?dkRpKzhSMWtGdWR4bnlUM1BKdDhmTmdQUWVQT0xhbFB0amhicjJHVTQ2VzhI?=
 =?utf-8?Q?0iCdEcCAypXFmKiD6NNn/NJzcgVhcvPN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEQyNVNOWjl5V1ZEUk1md1RFSzZBaW1oNHZpc2dYWGhQVzhEelg5bEV0SlA4?=
 =?utf-8?B?TmNNdW9NcjJ4Y0E3c0NsVFF0RDJPZG1PaTgwbEluWHByQmcyS2Q5ZnJLeTdp?=
 =?utf-8?B?RWx3cUNTSE9Wb2F6S3pJQm5ZelA1MnA1WG9CYTVFa3duLzBmKzYrUGpRMjJw?=
 =?utf-8?B?RjFOLzE3aENBV1IwdDd2UCtDMFpEY3p1bXRlelZEcStkSXpmVDlPeW1rcit5?=
 =?utf-8?B?ODBPK1dQUHMwQzZRZk05Y2k3VERkbENiOXFTNVYyZmNHNUpycTZuM0xKcGww?=
 =?utf-8?B?cGcxVW9TRWhET1F2MEp0blN2S0hCY2g0MDcwRWgwL1FVYkhOUnRJbU1KbzFs?=
 =?utf-8?B?cXBOSUlzZC9SWXVqSmgxQmU0aHNiSnREa2YvZGkxVWVsK3lmT3ZmMmtPckdn?=
 =?utf-8?B?Zkk3VzN4cnJ5WWhVdVF1M3dERGNHeXdENW1mclFZa2duYUpwY2I4OUw2MEIz?=
 =?utf-8?B?RmM5Y1RUS0dINW9RVW9NbldvclVWamtDcWxJcWd4YVhVN28wNWYvcHo3RXJz?=
 =?utf-8?B?Q0pacWh2Vnl5Q0xkMENnd0lrRXMyVFJPc0tFWlJxZzlpNGdLSms0T3BkWlVS?=
 =?utf-8?B?a29XeE5Za1FwYTJRMm0yQktLVzF5OVVhRW11ZFFjN0VqNVUvcWIvVEsxNjFW?=
 =?utf-8?B?QXA2aXc5ZmRLbzRwUFFieVZxaVlSMklRTGJsTTJYZWltZG0vaU0rOFY3Nks1?=
 =?utf-8?B?cUh3aFNSVE1SSHpmeThBeVdDS1g4d3lpem1OaTN6NEdjSWpYaXBsRnpFUlgx?=
 =?utf-8?B?dnFXY3NWZTNMTlo5L1JWMGpoOEFwNERWc2J2RzdXdHExTEhIYTVRNFEya1Ax?=
 =?utf-8?B?U0N2djhFbUpIcVJHcGNlczZqeHJYQjRYWmNzSFVtUzI0MXFjUzdwVFViMDVC?=
 =?utf-8?B?VklQVG01a3ErVkl2d1YvbnhHVnN0QTloSXVvdGhjNHJFRE51TG9VNHJZcjNP?=
 =?utf-8?B?RUxpcjVlR2R0NlgrMFV2RjlodXZMM0VKVTFQbXp1a05tMkcwY3gybzJ3cjVw?=
 =?utf-8?B?K3NMTUxSR2dGYmc2MmNoa21Kck5rRmdKaXNLN1BvcW5qRjZLWjljYllNU0NK?=
 =?utf-8?B?SXY2T0ZzdXpFRTdhdGhCbkRWckM1dEIwSWQxL2Z3QWs3eEhrelBROGNzYng3?=
 =?utf-8?B?bWJqZG12STJ0d2JmS3pnemY5anFZeUN1RUNHekI5ck5HRmpsS2ZsK0ViUUpZ?=
 =?utf-8?B?REJVVTFQdHVibHFUQmNZVm1qWHR3T05pWWc4WktReXdFTXhuYzNaSGZ4djdK?=
 =?utf-8?B?UStTY2N0RW1FRTYxWElkNDV3Zk5Nc2RVSDB0MHQ0QTNnZ3k3NlFXemN1dGZF?=
 =?utf-8?B?SlpDcTY4cm40U29yaE5rRzEzTmdQODlTcUtlVWc5aUtNc1VJcEpZbXdYSnlk?=
 =?utf-8?B?RXJPdStLVGdiK1JacWtlSW1iRWJsa1RJd2VwOG1tdVVzMlQzcGVneGI5cENZ?=
 =?utf-8?B?VWxpZmlhYkd6V2hDOUdQSkd5UTg0YmIvdUdEdDE0ZTZVQU0rM3VKWnVvOTh5?=
 =?utf-8?B?UTdZb2NLczhMN0RrQ092ZEZwdEZ3S2cvaFBBUUlGTE45V3p4dTl2enN1MWU2?=
 =?utf-8?B?ZVNsbk1QMHdwR1huaXRKQlNwcGkycHFtcVJHSXZsVk1xQzBLc09tWTVtMS9F?=
 =?utf-8?B?cXNxSG1SSVZFWjhyMFMrMFlzdjNaMkd2bnI2RzdkU0svckUxd250Nk85MVBJ?=
 =?utf-8?B?ampTWU1xN2gxejdIS1FMb3ZvS3dzTHVkMHZ2YUpEcTMvdXcrSUdYaXJmSGd5?=
 =?utf-8?B?d01jdTZJWi93YmxRTHpxNmpINXljdUNvcDlvN0hjazhhVjI0L0JVSG9iS0dq?=
 =?utf-8?B?TjhOWjhDZnp4TkhIZmlLdEhUTndMbGxHOG56cHhwZ0N1QnpTYjlJUHVVeklZ?=
 =?utf-8?B?Unp1aU9CMUpaK2tqclNKVS9SY3RNNHlScGR6dS90SDcxOXhGUVBlU3J4eGlM?=
 =?utf-8?B?MnkzaDAvNUh4bEZWMzVPRWQrSDFoTGd6K3J4NWJkRTdFcExDUitrV3lMSTJu?=
 =?utf-8?B?Ym80cm9UMmxHSVJIdFJQdkg4Nm1PSkhCVy8wOG91V2dCSHJtK25ZeG4rNnhG?=
 =?utf-8?B?dFRzSzNWTWJsTVI4UVR5aC9jTXJSM3pYdXFiQWtCb3Jyd2NybnREVkcrenc5?=
 =?utf-8?Q?q28UrLzW4xRTVG5i5kvsS2wdr?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccc07b25-5ece-4a23-bf2b-08de0804397e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 13:52:17.2387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zXv+RJK150K3MI4zE3ck0ZZYYWsTHNfWE6LrIqCcxTiXvzEjYWn3hlvRE6XcHVlM7lCZcL7zBii5twtx++wtyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5944

On Thu, Oct 09, 2025 at 09:21:32AM +0200, Jan Beulich wrote:
> On 08.10.2025 18:23, Roger Pau Monné wrote:
> > On Wed, Oct 08, 2025 at 02:08:48PM +0200, Jan Beulich wrote:
> >> @@ -1439,7 +1438,7 @@ static void vlapic_do_init(struct vlapic
> >>      if ( !has_vlapic(vlapic_vcpu(vlapic)->domain) )
> >>          return;
> >>  
> >> -    vlapic_set_reg(vlapic, APIC_LVR, VLAPIC_VERSION);
> >> +    vlapic_set_reg(vlapic, APIC_LVR, 0x00050014);
> > 
> > (Maybe I'm getting ahead of patch 3, as I haven't looked yet)
> > 
> > Don't we want to use some kind of macros to build this in a more
> > friendly way?
> > 
> > We could have a pair of SET_APIC_{VERSION,MAXLVT}()?
> 
> With what patch 3 does to apicdef.h, I was rather wondering whether to simply
> use two MASK_INSR() here (patch 3 already uses one right now).

That would be fine for me.

Thanks, Roger.

