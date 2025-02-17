Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5775A38913
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 17:26:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890651.1299793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk3x6-00056F-7y; Mon, 17 Feb 2025 16:26:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890651.1299793; Mon, 17 Feb 2025 16:26:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk3x6-000537-4p; Mon, 17 Feb 2025 16:26:36 +0000
Received: by outflank-mailman (input) for mailman id 890651;
 Mon, 17 Feb 2025 16:26:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yBk9=VI=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tk3x4-000531-3c
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 16:26:34 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20621.outbound.protection.outlook.com
 [2a01:111:f403:2009::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f208eff3-ed4b-11ef-9aa6-95dc52dad729;
 Mon, 17 Feb 2025 17:26:32 +0100 (CET)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by IA1PR12MB7520.namprd12.prod.outlook.com (2603:10b6:208:42f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 16:26:28 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%5]) with mapi id 15.20.8445.015; Mon, 17 Feb 2025
 16:26:28 +0000
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
X-Inumbo-ID: f208eff3-ed4b-11ef-9aa6-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rJx/9gmYrOBUreSEALGJusJq5gG+K1izSvgCbRvOEywe6KKg7A6A1A7lkmUY0DrxhlRszXqxmQSHULW+K17SCqC68B1+gzo7PVraS6h4+7garQN2jI1xxRoT1vtVsJtY9yLgqOXwn3azP+agFTKNactZz+Ai4gyJL5qGSAIfecSubrD8INOkyKqwRnLH/garMyKEU3E95+E77wSXIP69n2Eff7mkjrUnsRmyhV/2+5d/B+j49HyUDfsuliZbvqcAR3FkWq0/TnQLigqVCxaIsQikGT10EIrmg4OxZeg6Ea81TayhOefSj8pkuycqxwBTBqakCl6vuW1zGx33jHlOEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s8zSyCpVM/nla7T7tFdWBv8Qx83dfLgaw/dM1BOIwsg=;
 b=w2oF+wl5w7yHK8XrXmrda5ph49b4s9HktGat1T/ng+HyIe5mVPTwm6oIhQc8o0K34WRKiGhvx1Vctu0SWOuGCvhvn0ieXy8zDSIWDmszdZt84EFZcS3QKC/mBhI1+Sx5fPc7HSVU+FLxcn9pUWFJG/Rzv5CLCOLA4PHZkTd93VHCiAk2I+obwMYE4bQVuUVP2bDV+IBTlgvNEUiiKGxXSCNHNpNfbKw36TuIwLS4JWY0JCMOxy9AP4d7ISvDVx0YdkdjAtKcopY4QTUH7oc6Ag2fqbhznvYL6g5syM14WDYeq63+qVxH6Wk7+uHnC8aS0R5N7F2P0ZQOz+Bx0NAyPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s8zSyCpVM/nla7T7tFdWBv8Qx83dfLgaw/dM1BOIwsg=;
 b=AegIPzS06lyKuKYnh1XSdsCSzrQ3JOqWdRETDWV6lrtH+qKP6Hd0aAIeIsjlm9PCL8BAwPPA7846dZcrYzCHSHC80H9mq4sAljGsqGQ6WXRCH9iwybuE+ATVmkmBdh9TMlWt1lgezhI2XnX95F7kGwXMy5JDMPjNIb5ZJnxPGEc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <34b229d2-e61d-4779-a07a-024eea81ee4e@amd.com>
Date: Mon, 17 Feb 2025 16:26:18 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] docs: fusa: Define the requirements for
 XEN_VERSION hypercall.
Content-Language: en-GB
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>, Artem Mygaiev <artem_mygaiev@epam.com>
References: <20250114195010.3409094-1-ayan.kumar.halder@amd.com>
 <65584EA7-9B46-40E9-AFD8-B7C8F77A5DA0@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <65584EA7-9B46-40E9-AFD8-B7C8F77A5DA0@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DX2P273CA0022.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:8::34) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|IA1PR12MB7520:EE_
X-MS-Office365-Filtering-Correlation-Id: 471450ba-5fd5-418a-dd2b-08dd4f6fd464
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OVcxUU9ndXJ6NE5sQmwrQ013MmlKL1owN1BVVHg5NmdOeElEZEV5ZW5BMzNM?=
 =?utf-8?B?NTNYQzUzQk1CT1pKRytrUlJpTlZrV2NmWUN5ZFFRY1hJOEJydSs1eEhGK3Bn?=
 =?utf-8?B?czF1SlRqeE8vYndXTUxRdlg0Z2tMSm4xRTU0cFh0SG5lcFpqLzdBeHdSamJE?=
 =?utf-8?B?M3Zhc3VsOGZLQUFxVU5NbXlqWUNOUU1rbktjNldlNko1c3NTQ214STU0ZExo?=
 =?utf-8?B?emowZTdQS001OHFScTYzbnZxekxsSWRlK1IrMzVqRE9xVUtWcnkwMjVSMUY2?=
 =?utf-8?B?TDRXcVBJTlpEdnovazZWblBab3lJQzZZcktVSDFsd080aTNRNmFweElkK2I3?=
 =?utf-8?B?RUlyZEVsTkpKN3VKSHJFSEFCM0phWGxTSnh3MFlsVmVsVmFtT0hEbktjSzVq?=
 =?utf-8?B?U0Ribmtab0RtN1RrV3Z2dmtQWWJOUElYTk5xbjdudlJIZ0lXWHpSRFYzL2pZ?=
 =?utf-8?B?Nk9xNmZYeVplYlVranFvYkNyRFJXbGcrUlNLQVVkRGFPWnJKaVZvQlhFQi9p?=
 =?utf-8?B?NVV3dFNOdVI3MStNOVdSU0Nnd2tGODZpRk1ENUtSK04yTnZwV3lvOU1aRUhY?=
 =?utf-8?B?QTlnY3JlbWJPM0JmQlhHNmswMHJlMUkzK3U1dmMrWWxRa09IV3I5YU1DcmpJ?=
 =?utf-8?B?dCtBbko3bHdiYzFDUzVHUFNCby9EQlU3S29wRTNKRGdpWSsrS2VES0pMQkVN?=
 =?utf-8?B?MkM0aEF4T3g2eEhXR2E3WlRsWkh6N1dIb3BUSTNUWXRGNDRGWU54eHUxYkVQ?=
 =?utf-8?B?ZTI4cTBsRWZLQTNmUHg2a1kwT1hFbDRzYTFXVVRvUEd0NG4vQWFxSHNwNE9L?=
 =?utf-8?B?eFh4RENkOXJCWXJYaGpMVjNVcm8vbWxrWnRwbkd6YlQ2dUJFV29WWTJUZ1Ft?=
 =?utf-8?B?cFU4cFh6cVJNL1Q5SWhrTUc5L1VDaStPYnhyZ2kvNUMrT1hVeXlKYlpwNmZw?=
 =?utf-8?B?Vmw0TW41M2JwYWNZQ3NWWUFscklSSFpsS0ZBWTEvQnd6RHpjTS9Yem9FM0lP?=
 =?utf-8?B?WVFIaGszOTI2bHNYWms4cHBPNlJmUHBudEtsbXREVGFpa21uZytaRTNFZ0U2?=
 =?utf-8?B?OFpjYmlDY1BDSzBkaDFBeGR2cE9rcXk0UGN1Y1pSZEFZOHJkdldpZ2lrQU5J?=
 =?utf-8?B?QjNFTGsrNW5DSUpxZk0zMUFtNEEzbWxuNEVZeDhPUXM4NHFCRWhzbGJzQzFr?=
 =?utf-8?B?RDl6OGZwRk1LZXkvWmROOEdWZGhNc0h6UXRhWmltRmhoQ2w0bnhicm1kT2Ey?=
 =?utf-8?B?c05oems0cm8xZS9CYk9BS091Z1VUeTJEYmVIM2J1QUpKWU9aalJZQi9NYURy?=
 =?utf-8?B?RjBxUmlUc2l6VWh4N2hKSmZaWWFZY3phak02VjU0VjlNcVFOUGlwR1B1bU9L?=
 =?utf-8?B?YjM0Um4vR1dicjNFWElDbjQrY2dDTGpYd240Y0hNOTZ4TmVaR0NCSkp5VlMw?=
 =?utf-8?B?Q2dhck5HVkxsZkhhZDFwaVJIUENMRHBuRWQrRFF6ZUgxZ2xqVUFaQ1BTejA3?=
 =?utf-8?B?WEZlaTJEbnZiS0Y2Uk04VzZYUHllMXQrL2Q1K3FxbUFOT1lXMmZqNUZBbW9L?=
 =?utf-8?B?N1ZFc3lZU1BIcTJYeURBTUprWXVsQWhrL1BBOUZ1cHhaNnpLaURSN0hnNGhr?=
 =?utf-8?B?dGk1ZlM1aWQra1l5TVNISTFGNGN5cU12eUFlRG0zS3F5OEkzYmR0UlMxelBS?=
 =?utf-8?B?Y3djME5lUmxSNm8wbkUzUC9IMWptaFZZNkl6bnoyTFQwVHFBanJ4U3ZBcTI3?=
 =?utf-8?B?QXo5MzFXQkxYYS9GZk9WNU1meEdPMGNJQ0d6WjlqTDZSNWp0S0FzYyt5Mjlk?=
 =?utf-8?B?SUZOanFZSFg2Uk0wcFo5Qmhsd1dYcTdSMzVRNEpFck9wWWJlWWJDQVEwUFBi?=
 =?utf-8?Q?69EqKZGLJVtTl?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZU5vdVpVSmYvdlZZbVRRNjhGeHE1endpdWhmSXozMU00b2Nqd3IxR3JiVElU?=
 =?utf-8?B?aUQzWjJRRnVIYzBYWkl5a2ZZRmN4cUxsMDdjME9pQ0NmSXloNEozYU5nUU41?=
 =?utf-8?B?RWQ1MGJ5RWRGSnl1Vzc3RENKMFBYbG41Vk1UL2RLMDFPZTJmVkpyclY0UXlJ?=
 =?utf-8?B?eXZhSSs5RGtqYjFNd0JLcXV1V1JpNGNNa1BHMmgyOWUyOWRaN3ZBZndpSktQ?=
 =?utf-8?B?T0RKbWtENEwyRWdFcGVCbTNFeDl0b2N0VHNyc0hkaEg2eituRlo3bEFudWFY?=
 =?utf-8?B?VDFoOWVHaFpUY1E0czZES2RnUW51OWE4NGxDTmZ5c1B2Mi82andINkVoWE9p?=
 =?utf-8?B?a2ZVTVhiVldUUThlMisxUG4xc1VEdHdabGpoZjJHVE5TeFJES1ZSY0t1Um9X?=
 =?utf-8?B?bGlXcGFGT2JMbVJlclo3cnFPYnhyZWxPNkd2K2pFd080eTdaY3RiK3YxcjZW?=
 =?utf-8?B?QmV1SWo2M2thVlVzK01ORGE2MWczUzZnb1ZSOUZ5QXd6aHVSY0w0Q1pjODYw?=
 =?utf-8?B?eS9kOERBZVFqa0ZUSXRsSlhBb2VyUjFYRUUreGFOaU54SWFHTUFBa2EvL0Rs?=
 =?utf-8?B?VktWOStMVnpPWmpCZlloU3RzTjJ2VTU5emFTdEZseWN0TFVLOHRQN0ExUjBy?=
 =?utf-8?B?ckJabmdTSzlzZ3lGOWdLazY1V0JZZjZxZnphVDRhZFVjNmQzd2FNamQzWUo3?=
 =?utf-8?B?QjhReE02VXVmVHBLV0tuOCtZQmtxNU9ITHlyQjlQVUtnWUdWT2RBM3dFbUY2?=
 =?utf-8?B?MEJSS0VmbW12L2xFTmhLMUw4UnFkQzNHUHhDSlg2bDE4cTdTdFI5Z3p0bXE3?=
 =?utf-8?B?TUhRVFhMTVNWcXpJWGROVFRFK21uMTRjUC9zNHdQMHdmQ1EyeTh5WXZHMnBv?=
 =?utf-8?B?VVRUTHcyK014dmtPMUY0RXJxUjFGSEI0NC9mRVZZUnJ1cGhkbndJNUhyS2Zh?=
 =?utf-8?B?S0loZm1DallOdE5PU25TanJ3cmVkcngwMXNxOWZ2TmFCYmZ6WGpWeEtyRFAr?=
 =?utf-8?B?Y09jZ1lUYzVtTU9RVG5hZ2NzdjJ5SHFXMEIwa1c3VGRSMUlUL3EyVHVCYTY1?=
 =?utf-8?B?ekN2TkpLZFRRZDFSTDdNaVk3ZjgxUU9OMmNMM3BtUWdPeG9YKyt1VGtpdHZw?=
 =?utf-8?B?enpTRm1GcVpzeG9td1FuZG9lVWRsRVZFdXM2Wmd5VUtJN3lxck1oaHVoZ3hx?=
 =?utf-8?B?OG1DK3FqUklPYUdpbXBUcENraG12NVRNMXNNRlFFcmpxMkhiai9RYTZsS0da?=
 =?utf-8?B?ODBhZWc3Qkduek1xcUtJUHpURWlyQU9VVHpMSlQyQzYwQlkybzh5S3JxdkxK?=
 =?utf-8?B?a1lNMVdkMVJBLzh6VElYUU8vSkhIcjFBdEpCTGZiMmUrQVdhTVlvMSttbWRU?=
 =?utf-8?B?K3p2em9GVmFOa0dEVE0wTm9zR0J3aVlnNFU1UHg5MnlwdmpaVStOQ203SXBR?=
 =?utf-8?B?QmdBZXA5aTZYaUxaSHJBbVRsT25FTDlkRzMrZVhuTU92MGMvcnNwU1JMcjdZ?=
 =?utf-8?B?d0tzRGdwTU5LeXZ4TTFsMHdkdU9BWFpSY2sxVGEwUzNJQUhPU0k4cUdiSmZV?=
 =?utf-8?B?eDhEQ2x5ei84WFFWWGFqTk4zaDNuL0tmM0JqRWJFSXlVL2hEbW1SWlExSmsx?=
 =?utf-8?B?TzVNV2JiQ2ZLOENEK25uaDdHRjdmUWxkTnZhK3F6amRpM0JhYmhLdDlzZjJk?=
 =?utf-8?B?N2o1QkViUytKQW03Q3dGbzZUek5GRGc5eGtUUXVxdjRQVmVkOHgrTkNMWmln?=
 =?utf-8?B?L1Z3cUZXVGhiNHRiYVorckFyWlRZNGIyZlh2VWMyc1dvMnNtdnhORDVSMlZn?=
 =?utf-8?B?ZzBBMFgyUTNyRXdwREVUQm5yNUM0VllLNGxFZ1haWlVFQTNsUFRiSGhMRWpv?=
 =?utf-8?B?d0I4bTMwenYwWmFGbHoyMWdYNWpVUHRhUFNoWGIzK05hN3I2Sm5uNUtJWkl3?=
 =?utf-8?B?SnJ2OEJsaVNNY2FuK0daZlJCdUgzeGxIQmh4RDRXa2NnOVQ4ODBIQklEL21M?=
 =?utf-8?B?NHRPNGFNSk5xREhRT1BWTXJNL2FjUFIxU2JrYS84NHhSUUJWSEpyY2hkSDdP?=
 =?utf-8?B?ZnVia29PSUE3VTBPdkoxVkZ4WDhXcEt4YXh0b0dwQ2FYbkRvRWpjUEExczVm?=
 =?utf-8?Q?b7rNvQGwtn0cyVTsuHNScLrmU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 471450ba-5fd5-418a-dd2b-08dd4f6fd464
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 16:26:28.3761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 10XPGM/56zlBhdh7RQVGmG/lIOeyN0zszTp+Z1uS1fA3CJf1M3EzFh93Hm+zs/G2m1aywPLcLeYB8fiNXvXeDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7520


On 29/01/2025 08:27, Bertrand Marquis wrote:
> Hi Ayan,

Hi Bertrand,

I need some clarifications.

>
>> On 14 Jan 2025, at 20:50, Ayan Kumar Halder <ayan.kumar.halder@amd.com> wrote:
>>
>> In the current patch, we have defined the requirements which are common for
>> all the commands.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>> .../fusa/reqs/design-reqs/arm64/hypercall.rst | 52 ++++++++++++++++
>> docs/fusa/reqs/index.rst                      |  2 +
>> docs/fusa/reqs/market-reqs/reqs.rst           | 16 +++++
>> .../reqs/product-reqs/version_hypercall.rst   | 61 +++++++++++++++++++
>> 4 files changed, 131 insertions(+)
>> create mode 100644 docs/fusa/reqs/design-reqs/arm64/hypercall.rst
>> create mode 100644 docs/fusa/reqs/product-reqs/version_hypercall.rst
>>
>> diff --git a/docs/fusa/reqs/design-reqs/arm64/hypercall.rst b/docs/fusa/reqs/design-reqs/arm64/hypercall.rst
>> new file mode 100644
>> index 0000000000..66dbcc3026
>> --- /dev/null
>> +++ b/docs/fusa/reqs/design-reqs/arm64/hypercall.rst
>> @@ -0,0 +1,52 @@
>> +.. SPDX-License-Identifier: CC-BY-4.0
>> +
>> +Hypercall
>> +=========
>> +
>> +Instruction
>> +-----------
>> +
>> +`XenSwdgn~arm64_hyp_instr~1`
>> +
>> +Description:
>> +Domains shall use the Arm instruction 'hvc' to interact with Xen.
> Why are those requirements defining what "Domains" should do ?
> Shouldn't we define them as what Xen shall do ?
> Something around:
> Xen shall treat Domain hypercall exceptions and hypercall requests from Domains.
>
> Or something around this idea.
Xen shall treat domain hypercall exception as hypercall requests.
>
>> +
>> +Rationale:
>> +
>> +Comments:
Hypercall is one of the communication mechanism between Xen and domains.
Domains use hypercalls for various requests to Xen.
Domains use 'hvc' instruction to invoke hypercalls.
>> +
>> +Covers:
>> + - `XenProd~version_hyp_first_param~1`
>> + - `XenProd~version_hyp_second_param~1`
>> +
>> +Parameters
>> +----------
>> +
>> +`XenSwdgn~arm64_hyp_param~1`
>> +
>> +Description:
>> +Domains shall use register x0 to pass first parameter, x1 to pass second
>> +parameter and so on.
> Same
Xen shall use the register 0 to read the first parameter, register 1
for second parameter and so on, for domain hypercall requests.
>
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~version_hyp_first_param~1`
>> + - `XenProd~version_hyp_second_param~1`
>> +
>> +Return value
>> +------------
>> +
>> +`XenSwdgn~arm64_ret_val~1`
>> +
>> +Description:
>> +Xen shall store the return value in x0 register.
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~version_hyp_ret_val~1`
>> diff --git a/docs/fusa/reqs/index.rst b/docs/fusa/reqs/index.rst
>> index 1088a51d52..d8683edce7 100644
>> --- a/docs/fusa/reqs/index.rst
>> +++ b/docs/fusa/reqs/index.rst
>> @@ -10,5 +10,7 @@ Requirements documentation
>>     market-reqs/reqs
>>     product-reqs/reqs
>>     product-reqs/arm64/reqs
>> +   product-reqs/version_hypercall
>>     design-reqs/arm64/generic-timer
>>     design-reqs/arm64/sbsa-uart
>> +   design-reqs/arm64/hypercall
>> diff --git a/docs/fusa/reqs/market-reqs/reqs.rst b/docs/fusa/reqs/market-reqs/reqs.rst
>> index 2d297ecc13..0e29fe5362 100644
>> --- a/docs/fusa/reqs/market-reqs/reqs.rst
>> +++ b/docs/fusa/reqs/market-reqs/reqs.rst
>> @@ -79,3 +79,19 @@ Comments:
>>
>> Needs:
>>   - XenProd
>> +
>> +Version hypercall
>> +-----------------
>> +
>> +`XenMkt~version_hypercall~1`
>> +
>> +Description:
>> +Xen shall provide an interface for the domains to retrieve Xen's version, type
>> +and compilation information.
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Needs:
>> + - XenProd
>> diff --git a/docs/fusa/reqs/product-reqs/version_hypercall.rst b/docs/fusa/reqs/product-reqs/version_hypercall.rst
>> new file mode 100644
>> index 0000000000..fdb8da04e1
>> --- /dev/null
>> +++ b/docs/fusa/reqs/product-reqs/version_hypercall.rst
>> @@ -0,0 +1,61 @@
>> +.. SPDX-License-Identifier: CC-BY-4.0
>> +
>> +Version hypercall
>> +=================
>> +
>> +First Parameter
>> +---------------
>> +
>> +`XenProd~version_hyp_first_param~1`
>> +
>> +Description:
>> +Domain shall pass the first argument (as an integer) to denote the command
>> +number for the hypercall.
> Same here should be turned as Xen shall.
Xen shall treat the first argument (as an integer) to denote the command 
number
for the hypercall.
>
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenMkt~version_hypercall~1`
>> +
>> +Needs:
>> + - XenSwdgn
>> +
>> +Second Parameter
>> +----------------
>> +
>> +`XenProd~version_hyp_second_param~1`
>> +
>> +Description:
>> +Domain shall pass the second argument as a pointer to buffer in guest memory.
>> +
> Ditto
Xen shall treat the second argument as a pointer to buffer in guest memory.
- Ayan
>
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenMkt~version_hypercall~1`
>> +
>> +Needs:
>> + - XenSwdgn
>> +
>> +Return Value
>> +------------
>> +
>> +`XenProd~version_hyp_ret_val~1`
>> +
>> +Description:
>> +Xen shall return 0 in case of success or one of the error codes as defined in
>> +https://man7.org/linux/man-pages/man3/errno.3.html.
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenMkt~version_hypercall~1`
>> +
>> +Needs:
>> + - XenSwdgn
>> +
>> -- 
>> 2.25.1
>>
> Cheers
> Bertrand
>
>

