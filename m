Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB83ECD9C1F
	for <lists+xen-devel@lfdr.de>; Tue, 23 Dec 2025 16:20:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192623.1511760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vY4Av-0000Px-Tu; Tue, 23 Dec 2025 15:19:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192623.1511760; Tue, 23 Dec 2025 15:19:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vY4Av-0000MZ-Q2; Tue, 23 Dec 2025 15:19:49 +0000
Received: by outflank-mailman (input) for mailman id 1192623;
 Tue, 23 Dec 2025 15:19:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I0w9=65=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vY4Au-0000MQ-1H
 for xen-devel@lists.xenproject.org; Tue, 23 Dec 2025 15:19:48 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf5826be-e012-11f0-9cce-f158ae23cfc8;
 Tue, 23 Dec 2025 16:19:44 +0100 (CET)
Received: from DS1PR03MB7871.namprd03.prod.outlook.com (2603:10b6:8:21f::17)
 by LV4PR03MB8330.namprd03.prod.outlook.com (2603:10b6:408:2e0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Tue, 23 Dec
 2025 15:19:42 +0000
Received: from DS1PR03MB7871.namprd03.prod.outlook.com
 ([fe80::3a7e:e6ed:f8e9:9fb3]) by DS1PR03MB7871.namprd03.prod.outlook.com
 ([fe80::3a7e:e6ed:f8e9:9fb3%7]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 15:19:41 +0000
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
X-Inumbo-ID: cf5826be-e012-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W7EfqsL4l7Ve9wBOdwFSnfJjKf5EOHDss33xtFaNyKLQJxbeMhTjcEfRJHqbyzERhsiDZGtoj5H7DaXSTfiCKvBmG6qO0B27lY0BY9M5+ApTdtpIJQBkhiYvcilNemw4q9KC014/rgY+vAgjS7+m1ZCd+AQIQNxk1DrOqEo2MvDwsz9x/0xOfKnrPPViGOhDwJkCeVpmuqSodkAb5Bbc5NS5Cz+x0EgEf+JO/pqYRte8KRtXEWvMpc7nq6YdM4KSp0weRazWnEy8NJIhA+H5NL7wmIU3MljrNzlTnet/wmvZ9yitc5bNnAvNm47YFTAobXLL++gZAFaSQPUlsX2hsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BAknUQTi8K2C0J6Q0zkHbNf2jrG/qoZ79XdV5Sfv+TA=;
 b=lqnLDXbE71tjkdt5yPgAD/3QPTTOuOr9KXdhsvO/hHRNdePvPJ8IUq/mdoK2pplN1pe+7iEHgmr1Wq4SAsUy2EvgciDooWQ6ss1lZ5lbcs8KRRYIojGmq5vDzoc3ItTkn0o0/FVN58WmmoRYifG9efDmJQToYVM8du/cG0gtPSUB0dBunSL7KP6juU7tmpmZzqwudgWOWIckJ62b+Ujy9Wpev6bd12qDtb+w02hI3KjbAR/VoEWt9q0NpQrs3jY8br86XtFdaRiRVDax4ZMwVPeTalPpzcHRoN59yONfTFaBXTtKvYehYaocEsOwtcy2v9oigZ1heOHxu0/+nIPIjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BAknUQTi8K2C0J6Q0zkHbNf2jrG/qoZ79XdV5Sfv+TA=;
 b=htqi0ShNpwU/Reei2IVf56ZJreL866w81axutQQFYawAUUxkF5AH5BSlWr/ZIf+WZ8maz4t1gEO89zCCKoWKctMUj0hfRgk/IKE9WgLhB3C4U7gmDFRttzldspFqsoFRUpQ5bfr6+YNBFCy2wBoce4zlEecVyvrd+vb8eVbs5+A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 23 Dec 2025 16:19:37 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Chen Jiqian <Jiqian.Chen@amd.com>
Subject: Re: [PATCH] vPCI: avoid bogus "overlap in extended cap list" warnings
Message-ID: <aUqzCZHYfiKB3Ltv@Mac.lan>
References: <26294a6d-e99b-4290-988a-da7b7b838651@suse.com>
 <aUUPPPYyuLUdj3XJ@Mac.lan>
 <4159dd59-4301-4265-bb5c-82949ed095a9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4159dd59-4301-4265-bb5c-82949ed095a9@suse.com>
X-ClientProxiedBy: PR3P192CA0013.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::18) To DS1PR03MB7871.namprd03.prod.outlook.com
 (2603:10b6:8:21f::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PR03MB7871:EE_|LV4PR03MB8330:EE_
X-MS-Office365-Filtering-Correlation-Id: 18a49b32-fd2f-47e5-5649-08de4236b204
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WFU2ZnhVWmx5SUovTDhLSkFPWjhrWVZvazF1cGI0WHU0c1BGU0FCb0tNWHBm?=
 =?utf-8?B?ais4ZjRjazEzL1Boay9FWUhQVjVtRnlkazEzYUFyTDIzeDBzSlJoY2xUVTUv?=
 =?utf-8?B?RWoyYzFoLzEyTE81dWw4UWYvWCtBUVprL0IxVkU2YmxlTlZiK2puTG1LK1JS?=
 =?utf-8?B?OVVtL2JpRUZrdmk5dEY0YkNJa2lHU09XbjN6THhhQTlHQ2JRR1F5RGt3RGdR?=
 =?utf-8?B?MXIwMmdCWm5FZjliQytmVkJZR1FLNGRLVzhZQmNhUm9YN0QrWjBaYlB2Mmx0?=
 =?utf-8?B?NVdRakZoUU9ocVZGb2txbm1PZmRsT1RnQ1IzWGhsbUVSVnc1d2RxQnJOeDBL?=
 =?utf-8?B?YjVWUXlUTGM0U0FYenQxc3J0NU44cCtDOEI1cCtFZ2hCcWh4ZEd2MmVHNDhp?=
 =?utf-8?B?R1VIVDVUemd3SjNnQ0xRWlIzd2tKUUhtV1VtSlBPalVxRW5SVVNuTW15MC9V?=
 =?utf-8?B?MmFwdEI0dkJrdG54S1dSeXRPTVY5TTdzVWR2bWo4bHE0Mk11T2lQdytja0tQ?=
 =?utf-8?B?R0orMGxzVHVPY0VxM0l3eitGTkY5eDRNVlBNTnBsSGh6SXRsbUxLeHVsYzUr?=
 =?utf-8?B?TzdoeXNxR3RrQW1SZ1ZMdTVtNi91VTQrVStBRU81MFBSUDlqbEZXdG14RWFU?=
 =?utf-8?B?V21sbmtCdlg1QnZscGYzdk5UQldjeXVta1E5eHliZXRZN2pVSDVvZzZNK3d3?=
 =?utf-8?B?NjhPbC9QWjJDWlIrUi9OTHhPNnJ1WUZlbzlUSEFZVFpHRE1CSS95cGxJbjhT?=
 =?utf-8?B?ZklNSzNlNWdFQTFtZmRSRy92ZDR1QndyVXFVQ1FZSU5HbC9rWW9ISXFFbFU3?=
 =?utf-8?B?Vk9HWkhadHp3cFBtR3QzNkxGRmNwTjdNcGZCMnJvSTJIUjdSMWY2eS9ZVElp?=
 =?utf-8?B?R3loMlhoQzVEMUpYQzR4bHNsd21xRWRvaDYvSk1GMDNwcmxRaGhCUFhoQnJL?=
 =?utf-8?B?ZE83cmJsUWZ0UzI1bWpiQlFiNE5kazJhbU03cVBuUlZzRDZrVDhxcE90NUlI?=
 =?utf-8?B?YU1YWmhRMHFxZ2FHQ3plb1J5bEg4VTN1QzQySlZNeDRpcUszQ2hBT3IrRXJU?=
 =?utf-8?B?Sm9SbmJKdlE2c0c1OEVaOXFqbmpjVEFZUFZJbnFzL1Q5OEh6cmpLY2NOWHdI?=
 =?utf-8?B?RG5XTi9mbDJtOHdxb0xJQUJFT3pXS3JyQ0x4T2V2UVRPT2ZFclN6ZFJzcDdr?=
 =?utf-8?B?aEtCTjVXa0xTa2JoTUpPcGRiSlBydW1uWC9GcXJJcnpDbHJEb0MyMGRkNW1o?=
 =?utf-8?B?L3dxVWpjRFZGekI2WkJPTDJ1cmtGRnhwVUpLcm9jaXNiZDBkY1NDUFpKMnRC?=
 =?utf-8?B?UDNXOGxPQXdLeXNLbDhFeTVsd1NiZWFBQzJyWEFjT0VXcGFhZVBiVlRuai90?=
 =?utf-8?B?MGVuZlZEVm53YWEvTEwrYkhqZFUrRkFmQzBONnlzdzRNUFhnV0VLazBmeFQ1?=
 =?utf-8?B?RUxEMTF0V0lTY0lvRy9DcG1Fbzgyd3ZKNE1sOFRIZmN2VTdaRWg4TjBrc3R1?=
 =?utf-8?B?RFkzRElnUUYxVW92dHJSb2NFRHcxbTcxRHlMejZneVV1TGtRaWhCRWIxYk9k?=
 =?utf-8?B?QkVEbHBpNytQY1czOVk4bGtBY01WRTVKMHd5dy8wRWRxNWxaNjZRNVVWMUJD?=
 =?utf-8?B?cnFrQytvdHZmLzFmQW9WR0NXUFZ3UEZJWlBKdmY2UnJBeUZMK2NsVjEzK2E3?=
 =?utf-8?B?YW1xZWFibXpwV0kxaVRuU0dWdC9jQW1yNUg5ZGdGWkVjLzU0MEhpakMyTlgr?=
 =?utf-8?B?TW1IZ2paYnZFMy8rbHA2bG9sTm1jdnNjT01XaDd2YmtJT1k1NnorVkFhd3l4?=
 =?utf-8?B?NWFQMDUyTjZTdEMxWmdVbjFUQkZETHNxVFIrT1ZiVFBBUjFwWmR0bm1sclNY?=
 =?utf-8?B?SkhZQ3VoVzE4bmV3TzkvTUZWbHpSU0NMMU5sT2s0c3BRRW1TWEhYRlBrNkV1?=
 =?utf-8?Q?CUXIvjXYEKUiqS+3xdOUEiKFvEE+g4Hi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS1PR03MB7871.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1ZlcTZoZlJvQ2lrY01FeTNJcWJHM2NYbW9UWjJVYThyZXVDaVJVVVRJRzhP?=
 =?utf-8?B?d1JGdVUvK0dKRDVEUTgxT0RBazMyYXp0OHR1Y3N5aGoyblFSY1dyMDVlOWxw?=
 =?utf-8?B?UFRtS2dzRThBczhkb1FBaVFOQzhjKzUyUUhRV0IwL01KMG5YRGFUU2RoWU12?=
 =?utf-8?B?eVJMNy84MDhuWnZXSTFKczZ4RWZoQklva3k5S1BJdnZHMG14cTB6RUZGWU9s?=
 =?utf-8?B?Q2c1S0JDT2dLL1VrK3Nta0N3NFhZckdhOWxkNXAyWHBkSGlYMUQvMEFuT20v?=
 =?utf-8?B?aHpNVXJwRzNMbW9mcEV0WURHNlNBYVQrT1ArTjNvclVsZ21oRkNJNVhsSHdj?=
 =?utf-8?B?SGloSmhJa2VsZVpzR2FzcGVmL21RY1o0b21VUktKVmxoLzlUMW92ckFhUE1h?=
 =?utf-8?B?MHFKMVVFajRXbWVyVmxmelN1TzZHQjdpUEQrQ3dYMG5Fd0NFMnJvVFFFbmIy?=
 =?utf-8?B?bnMvdzc0Tmc2QlJXa2xUdkRlNXIyNEc3aEZLeHc1bHpNNlhZTklYUmJmQ1Fj?=
 =?utf-8?B?ZEo0UDJsNS92UHk5NjJ6OUptbFpsYW9sL1d1czYramFUUitNdC9lSVdIeTdY?=
 =?utf-8?B?ait0c3FiSktEdEZFdm5OcVRzWVpZclFQeFZCWXlLZ0ZXczEyVVlTWjdaTG1Q?=
 =?utf-8?B?am42T3hraWg1amhDTGJUcEdFTkpVcmhYNDh4cmlSK0FzZ2N2aEVhem5jSjJK?=
 =?utf-8?B?MWcwWGU4YmtraGd5eHZFOGErVEp3aDl6QkJ6b3hCQlpDUXVuNDB6S3h1a3Ju?=
 =?utf-8?B?WldBVWFVTStXc3Q5UFVUZ2w0cFF0bG52ZVc1aVo3TFEzY2JvWlZ3c25EbEty?=
 =?utf-8?B?elV4emJpMnNnM0k5QlBlU01HM3JjRVlLekZPckJsZ2dFUkpvdGhiWXBsODlW?=
 =?utf-8?B?UGtqNjJaaExuUElPRGwycUNzdlBxbDYwT1R1REF4dlVDaldDakZMTW02ZEFs?=
 =?utf-8?B?Q04zanR6dlpvaCtJaElnSGhJVTQxb2RmbXczei9RZnpUb3RXcG0xTk5JN3c3?=
 =?utf-8?B?Nm5KTUZKNFFXbkVDVCtPekNsNUt4YzBuQ09kSFRlaWxlK254dUNMME1OZDlW?=
 =?utf-8?B?WmJCNHpOd2tKVEsvS2dqTXRLSDRPMTNhZjc0VjZxVW1JRVoyOEhOZUVZUXdZ?=
 =?utf-8?B?SjM0ai9vMkI3eEJyMGxJQlpIb3NyNW9EZkEwNThjdVNWSzRMTWtxMzVxcjRP?=
 =?utf-8?B?b1pTZHlHejNHMXpqdlpzVTV2bDFIdk1sR3Bscnl2TGZiUkcwWUFjQmtJbW41?=
 =?utf-8?B?Vmtja1F2UDVUWE1mclFmVzkxK0F3U3F1UXl0c3dRdE5xL21malJaaGQveDJ4?=
 =?utf-8?B?ek8rWFo1NXpCU2oyS04rMFJBRzQ4VXpvTllJazZtSnEzNzRiMWxTS0Mvei9v?=
 =?utf-8?B?S2pQWFVhYTFpbzhPZ29kcHQ1T0dGanhoL1BUYWtGL2JPZ3RMTFVMSjVzMkFJ?=
 =?utf-8?B?OGUyWlo3eFh1VThRK0M4RzFmaHAxNjlzcTFZVVNnMTFoMmtXcFUrbUhDcEZ3?=
 =?utf-8?B?N2Q0Z2VobmtHVFpkYVhxeUt0WnB2bStBRktNWFlLeVhrRUN3cTdoeDhMZFh4?=
 =?utf-8?B?MVJEQUZxNjhYaHRaTWk2Z1cxb0FXWTZtM1o3ZURSNEdCbEJOWXNDYWlOREtQ?=
 =?utf-8?B?WDRqKzlMeWdMQlBZM1FnQzgvVCs4V3BYcnFucit5ZU9CSi9ZZjZRYzAzSko2?=
 =?utf-8?B?UEEvU1huQ1p1SDNkeThGaFdZamdRQVJhZGZ5clhrb0JIRXRwdm5OMnZySTds?=
 =?utf-8?B?dlV2R1VhaWhRWWs0OUNHRXZ5aGVEd2U5RlJ4RDU5WXNmdEREanAzNmVpenpU?=
 =?utf-8?B?ZENnT3lLRnNHMWtNVURyNXNmRW52MXRmcGtpai9IVFk2Zm9sWW5kM0xCeFRz?=
 =?utf-8?B?bXZjeiszVmk4eC81WDR4Zi9LM2t4VXBHRGc1NWJlQkFsclZpNk9iRFlmZ1NJ?=
 =?utf-8?B?cU96QUJPOFBiMlROeFJXU3Jyc2FOU1diVGdTTDdxWmxISE05S3hlTENVd3Iy?=
 =?utf-8?B?eGpzaXlpK2hTak5VMS9DS0pKMFAzclUyWkNmVjMwTWFrUG56UXdiTWhsbHVh?=
 =?utf-8?B?RWdHZHB6NTBHT3dHMSs5emRMRnZpN2FnRXY2bFcvNkZOaVhxMjZuOHFqNnpD?=
 =?utf-8?B?KzdiT1R2c2VEaE1YK0F3VEgvWkNUcUs5eVFacXNuUi8zL1o4QVVDclYxM29I?=
 =?utf-8?B?Y3FyL0NGeW0rQ3BUYm9mVU5Xa243U0wzNXZWRWU1WHN3d0JUK1BZLysxdXB1?=
 =?utf-8?B?VWVJMmYwSXU0bS9KZC8wc1cvNmdaejRNZzFzTnFMQUc3Ykk5U2ZnTWt6Ulk2?=
 =?utf-8?B?YnZQdzZYNTBYeW8rMFE0M0plb1pMTFlhVWRidVhQaElqTXBWWFRyUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18a49b32-fd2f-47e5-5649-08de4236b204
X-MS-Exchange-CrossTenant-AuthSource: DS1PR03MB7871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 15:19:41.7813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DFuoGTl/xdSm9b0Hktcx6GeWTx/Iu5M1R3omurxqYjZtK6KvElXiWKLO1mTW7XK2jGBDEXgB5tL8nC79BdCHyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR03MB8330

On Mon, Dec 22, 2025 at 09:39:38AM +0100, Jan Beulich wrote:
> On 19.12.2025 09:39, Roger Pau Monné wrote:
> > On Thu, Dec 18, 2025 at 08:56:24AM +0100, Jan Beulich wrote:
> >> Legacy PCI devices don't have any extended config space. Reading any part
> >> thereof may very well return all ones. That then necessarily means we
> >> would think we found a "loop", when there simply is nothing.
> >>
> >> Fixes: a845b50c12f3 ("vpci/header: Emulate extended capability list for dom0")
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> > 
> > With the U suffix added to the constant, as noted by Stewart.
> 
> Thanks, albeit I'm not quite convinced I actually should put it in. Imo ...

What about using ~0U instead of the longish 0xfff... hex literal?

Am I misremembering that we had a coding style rule to write hex
numbers all in uppercase letters?  I don't seem to find it anywhere

> >> ---
> >> This is the minimalistic change to get rid of "overlap in extended cap
> >> list" warnings I'm observing. We may want to avoid any attempt to access
> >> extended config space when there is none - see Linux'es
> >> pci_cfg_space_size() and it helper pci_cfg_space_size_ext(). This would
> >> then also avoid us interpreting as an extended cap list what isn't one at
> >> all (some legacy PCI devices don't decode register address bits 9-11, some
> >> return other non-0, non-all-ones data). Including the risk of reading a
> >> register with read side effects. Thoughts?
> > 
> > I think that's likely too much - for the hardware domain we want to
> > allow the domain to access all the PCI config space, regardless of
> > Xen's thinking there's nothing there.
> 
> ... we really need to do better here, irrespective of this intended behavior
> for hwdom. Us accessing the supposed extended capabilities list is already a
> mistake when there's no extended config space. Us then calling
> vpci_add_register() to "pin down" the value read is wrong too in that case.

Hm, yes, it would be better for Xen to use a logic similar to Linux's
helpers to find the config space size.  This would need extending to
pci_find_next_ext_capability(), as Xen does read the extended space
without any checks there also.

> Question here is whether even with that fixed the check being added here
> would make sense to keep. In that case putting it in now and then doing the
> other re-work would likely be the right thing to do.

Yes, it probably wants to be there in addition to the extended checks
for extended space presence.  If we have a pre-check that ensures the
extended space is available, Xen should return an error also if
reading from PCI_CFG_SPACE_SIZE returns ~0, as in that case the device
must handle at least that access and return 0 to signal no extended
capabilities.

> >> The DomU part of the function worries me as well. Rather than making it
> >> "read 0, write ignore" for just the first 32 bits, shouldn't we make it so
> >> for the entire extended config space, and shouldn't we also make it "read
> >> all ones, write ignore" when there is no extended config space in the
> >> first place (then in particular also for the first 32 bits)?
> > 
> > If there's no explicitly handler added, the behavior for domU will
> > already be to drop writes, and return reads as all 1s, which is fine
> > for the rest of the extended config space?  We just need to return 0
> > for the first 32bits to avoid seeming to have extended capability
> > support.
> > 
> > Maybe we want to keep the same behavior as expected from native for
> > legacy devices and just return all 1s consistency for the extended
> > space?
> > 
> > Hence we don't need to special case this region, as it's already
> > covered by how unhandled accesses are resolved for domUs.
> > 
> > Or is there something else I'm missing?
> 
> Imo correct behavior would be to return 0 for the first 32 bits when there
> is extended config space, and ~0 when there isn't.

I see, I was missing your point that there are older devices that
might not implement the extended space at all, and for those the
natural value to return would be ~0 instead of 0.

Xen could read the value the device returns for PCI_CFG_SPACE_SIZE
accesses, and whether it's ~0 or something else in order to device
whether the dummy handler added in vpci_init_ext_capability_list()
should return 0 or ~0, but that also risks possible side-effects if
the device aliases accesses >= PCI_CFG_SPACE_SIZE to registers in the
legacy config space region.

Thanks,

