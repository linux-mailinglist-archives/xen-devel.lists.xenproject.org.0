Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B400E9A6E27
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 17:31:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823686.1237730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2uMj-00066T-BA; Mon, 21 Oct 2024 15:30:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823686.1237730; Mon, 21 Oct 2024 15:30:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2uMj-00064M-87; Mon, 21 Oct 2024 15:30:41 +0000
Received: by outflank-mailman (input) for mailman id 823686;
 Mon, 21 Oct 2024 15:30:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uLLp=RR=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1t2uMh-00063k-CO
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 15:30:39 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20602.outbound.protection.outlook.com
 [2a01:111:f403:2415::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b381d23-8fc1-11ef-99a3-01e77a169b0f;
 Mon, 21 Oct 2024 17:30:37 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by DM4PR12MB8452.namprd12.prod.outlook.com (2603:10b6:8:184::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29; Mon, 21 Oct
 2024 15:30:33 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%6]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 15:30:33 +0000
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
X-Inumbo-ID: 6b381d23-8fc1-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eah/bllfx7RlOoe+GUUzkmMw93A7NQO4VqBjLxTA02ShBXnzJvM+D4cdJuDTE2gNm3GOAdfm4gprlYoPv/0y9T08aBqoJbif1Rs4O5S6pkt1Wj+Fd4DMWl8yyoG3/K4Yq/wmBtg00ZgXSy7S3/4MJhmvr9IqJbqN3kmRsshp+Bmg9j1+YO8p6eV7j8zNJ8OMgHVnjlRnhj/pctFPJv8nAHIjdfrXvshWo+9+8nCBGoBXTUlCljSuelhI2JsJWrfrdMCNxyl41KDv36f+LdtbuuepEX6QxoPuO9tTkrQANFUrh7p9IGOiCErVmAwiO8zPVql2xiwyC0SlV7jAw4l1kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6q4FOnTw5Bp7ynSHNxH1X3HDuB1BVVNOXjtQ+R4dAbY=;
 b=IRdEPaIzTZMbkM1Q9Sc9TjtsCG0rtTCfMrudU55nSmqvmbksVgJ6WWYpsEi3CIORNri64VFjVFlTMmUe4i5pYQDwM6hQqbg8kgYAm4siGWVp+BWWWkSiTEVuHvI7uHajdt47JI/apC6I8/DtPmFZ54Xwu07uTpYhpPTge5wBROQU0bSvNRuHR4A2ewsEhar2nhDJHfaiJX6lt2GxQubATuBTQSaM5wU5MW1yEJ8or2w7A/aNSXrmn2f+En62rIeMceKJlTKOzgFztitSQraRKCV5PjxDGWn7v5EG7bJ9WRfaWzkb0T5HrHlcWsWqDoYX3FYx33rCp4aBNuYIfKsRgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6q4FOnTw5Bp7ynSHNxH1X3HDuB1BVVNOXjtQ+R4dAbY=;
 b=pzI3y1FokILfQehNMxpF6Bs2BJZJituAGTroRum+yElG518Y7toUpLyH9xsganZas3+IDiEevKQNMiG971WdAUdhenHT7OOjc0oEWoFOhlDG6EweykBUM9vG41kAISqRd1QLs8YM6U20/GkIn3ORDQGyINPqBkfLFI2xeDUHo7s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <23b86010-d467-42fd-bba0-65b58e05beaf@amd.com>
Date: Mon, 21 Oct 2024 16:30:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] xen/arm: mpu: Enable MPU
Content-Language: en-GB
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
 <20241010140351.309922-6-ayan.kumar.halder@amd.com>
 <a6a66bd1-45dc-46d2-9e45-8fef8b45e003@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <a6a66bd1-45dc-46d2-9e45-8fef8b45e003@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0058.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::8) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|DM4PR12MB8452:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c99ee77-c41a-40a5-49d1-08dcf1e54db8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NEcrczAyNUF1NTZSRHV1aEM1ZXhhQVh4b1htYklUUnZVcmY0RGUzTmxPYXhX?=
 =?utf-8?B?QVhXTFRKcmFLUTNtdE00ajQwVk14ZTJHREE1dC9rV2NkZnFocDZqZGxoYzly?=
 =?utf-8?B?U0FRQnprdVhuZDEzQWhVR252cGVKczQ3WkpjUjkzR3BFVS9WWENUbFpVaitH?=
 =?utf-8?B?azg1SVU2Q1RTeDYrWnNiRDdPaXBVamRSc2Z3RFMwd0Z3ellCNjVZNGdqNGJx?=
 =?utf-8?B?R3dZeFo1M2p3ODBxRTNLbVliUmRlOEltaENSUkRuSGdIUk5sQW9XajZYVElm?=
 =?utf-8?B?eEFoV2hYMHVwaU9mS0FpOGVxc2RnUjlEKzNYaUNXajh1K0ErRE9iUnYwd3Zv?=
 =?utf-8?B?YzhmcG1TMnpkYTNjbFNlc1ZDeU5SbVAvS2RxSmhYVjhMbS83RC9oS0FUeUpJ?=
 =?utf-8?B?N3ZtL0xEdUxYcWsyUWRxZXM0ZkRtRko1MmpudXZyc1E2dExCcHVJa3ZqN1dR?=
 =?utf-8?B?QS9jdEF2bmNsYXN6ZHowWnVSTkJybUZ0bG9JUHdPNEo3SUZzTWRUM0lJbFRu?=
 =?utf-8?B?UWFPbTRremdBODkxNU5vMEFnY3FmWm5JeUUwSTlqbnF1MkRGS2lCNDU2SVk3?=
 =?utf-8?B?REVFb2ZDUjBJSTA0cUs5YTg2eE1ualYycy9kTHB0QXQwbWN4dC9Iek9meUdw?=
 =?utf-8?B?L2JxbjZRNlQ5VGZQN0RPZ1BuZjB5TlovbkRDRHlwQ2t0c0hSRDFlMnMycFB0?=
 =?utf-8?B?dkswQ0s0ZktRclRnNWhmWVFscjZGSUZpejBvZmk2OW1ETW84QlRMWEROMGxI?=
 =?utf-8?B?aWZDL09ONHliWWpBejBaTzFTQlVNQkFFLzZFbTM1dCtaRUxjTlFBcnFEZ29F?=
 =?utf-8?B?Uit5V2d1cnFsa1RRRzZmcGowQTdDaGRDOVU4VUZhYlQ3TzJLUGlMTklkTGY1?=
 =?utf-8?B?V1EzWk94M2Ezb2xGRHVWbVhqQ2hvaTV6Wkk4YVU2cnd3b283a0k5VjJFRE9z?=
 =?utf-8?B?U0R4d052T21zd0FPTVhPbWhhNVd6dU40cG53ZGJUNGQ2ckt2WmR4alVyQlFD?=
 =?utf-8?B?WVRmMk1zQnNjY2ZEZU5QV0RTR2IwYU1pL1FOdVZDbkxYU0dtTzg4R2Y5SGRK?=
 =?utf-8?B?QUlQUkQwdlVpbFV6QXZPdmxrK2dWTGtOd0hpa2RxSUhYV2JDbFlKZmJXeDN5?=
 =?utf-8?B?azJDMExXY242N05BSEUwdFR3MFVmOWdkWEhXS00rOVpFZ3RJaWpnd09GZFBw?=
 =?utf-8?B?NnVoM1lSWHl1REIyMzJocmc2Vyswak9IeFlFT0d0THdnTzVXaEdBNmNyanhi?=
 =?utf-8?B?OE9QemFxRDBUT3VhM0h5RHB3YUxscHU0UmpVUjN2YzQyaHl0ZE1DaGd6b0p6?=
 =?utf-8?B?QWp5QkU0bFZIYzlwRUJRVDA4SmU3Y20xMitTTWNsNm9HZUFMTUhwY3lQK3Y1?=
 =?utf-8?B?Tkp1TkkxTVgzL3JpQ210WHFtMGcvY3FOSHBPRlpwbndPMmtPb3NwbEp2T3RC?=
 =?utf-8?B?TUhyUld3WW1NQWJ4R052RnZ0L2FTVmR2NlZZU2xxeUFRN0FhVEo0SktrTWc2?=
 =?utf-8?B?b1AwS2hBK0RIa3JCdUM1WTNoZ0t6STJVWWZGOFVIZlVxK2hPQXVXaGdVOE9o?=
 =?utf-8?B?MURDZ0loc1hKT20yN3NBM0ZMTS9jUEo5ODFORDhEcmg1RHkrRjNsK3BrRkwv?=
 =?utf-8?B?SzN1VkFVOW1KclJuOFhkcVA2cmpMS01QZDZHTzNpa2VHaFFQcGpqdmhST2Rj?=
 =?utf-8?B?bG1aakdtSnhpNWxPSzBrUDZObCtqekd5VXRsZ05FQWlDRzhxNEhuSGdUZ3Y1?=
 =?utf-8?Q?hiJmrY/+I9zPK+ifZ72XuwB0avvyLJco8fEdwgT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUxhY1RjOGcxbTNMVUQxV25jYjRGemtjUG44c0wwMkQ3TnI0dVFab01DODJ1?=
 =?utf-8?B?b1JkblBtUHBRUStWWkloNHdQdXEvN2Q1aTFMNnFqTFQ2QnhOQTA0OGhyUFpD?=
 =?utf-8?B?OVFrM0x3V3c3emIwRDhQY0JMdlV1b0x0R3pUMVAwNzNQdGxnWDhOc3N0bDVz?=
 =?utf-8?B?NEIxMU9uVkVubjBNZW1iTE5YSGhKWTlhYTZQelRMTy9lek9VMlpJSCtiQVFz?=
 =?utf-8?B?cXk5SmJab3lvOXo0TUcxV2lhaTdjY0lHOXpESE9pV1d4OGQvU1I5bDZKS3RD?=
 =?utf-8?B?czE1Q2dBVFZHeXFNd0t5elNtUHN6eW9JLzBBVmorZys1ak9EeHBmMnV5ZmxE?=
 =?utf-8?B?azdzYm5WS0pwYzFrUVFMaklLekVrZDVtMVlSbm1jOFZ5OEsxZk1tOE4zVmhh?=
 =?utf-8?B?RDQ3cGt6ekNhK2NUZVRCbXQvYmw4SnU1V0ZxRk8zQ1Nhbko4bGxEWUFET1lj?=
 =?utf-8?B?MVgzUVAvaEs3Z0grUFNxWnF6U3RweHR2bUFra293a3pzcmhVQkNlZC9uSWM3?=
 =?utf-8?B?V3djYkFWN08yVkFXVDNKQTllYkpGcHpMM2tLcy9UMG1wZ3V2eEt3RHUwdXdL?=
 =?utf-8?B?dThoL2cyRTVGcGNkUDhMSDNjTktacGUxbTUyRk8rZlRETEU3eFB0bjh3bm5n?=
 =?utf-8?B?czVOcEw4b3FYaExWQkJlUVVBT1dUcTFYOW5GSTR1RW1rOUtLdUYvek0rVTAz?=
 =?utf-8?B?a2F2VUFncTlrTktrc0cyM21hTDArZngrRGJOSkZxdmRkbzVWemtVaitUTWpD?=
 =?utf-8?B?dDE5VlpRTVIva0lSWFFYaXQ3VlNvbkI4UkNFaFJmY1RCYTdrdnR1blFtR2xI?=
 =?utf-8?B?ZFZicnBuVEpKNy9JR1g2RlhJdEZDbXJlMVB5Q0FVeVhsV3V6ZFFGWTd3clNF?=
 =?utf-8?B?aHFTOVQ1Z1l0L01UMVoxSWxNdkhzdGoycmVzZDgzQnBhdWt4VVdhV1VKNWlj?=
 =?utf-8?B?dXRTNkdseENmYzYyenAyQmgwTkFXYmZ5anZkaHd6V0MyTmVGTGY2TkhsU29D?=
 =?utf-8?B?REFyVmdRbkdDOTdNOXppcVBhMzZINnZ5VHBYK0Q2UmxIR3NBczRJTlM3bDYz?=
 =?utf-8?B?MFhjUXlXRVROUXRERlNPNGJ4Nmt5azFUbXRzL2lTRjVBMTFZbE1CS0hESndt?=
 =?utf-8?B?SEc2T1dHQ1hNR3liYVl1SFZUdmNNUVRSbGFCUmp3U0RXWXhaQmNpSEYreW9L?=
 =?utf-8?B?ei96b0RLaTZTZWZELzNmOThqV3FXSmlrRTFyMlJjQkJPdC9DK29XcCtNUVB4?=
 =?utf-8?B?ZWhYMnd5V2tYZ3BTc3pKK0hqUG1FZTljbktySTRjaUxtRUtlcTlqZEN4dmlB?=
 =?utf-8?B?OEF5anVMOEYxa1Iza1ZBb1RRcWFaSFlEekFoODZyd0Y3UXBQRi8zeFBYelFi?=
 =?utf-8?B?YUJTK3RoREZrNkQ4cnVZVVV3YUxPM3lxN2plTFZYQW9MbkcrUGIvQzlkQnpR?=
 =?utf-8?B?citCa0pJSlljZjcwVmM5Tmlldy9BakZQV3k1dW1oNlRaUGxkcjRhNDhCZmFm?=
 =?utf-8?B?QnEwZHNzUnN0OVcwWFBCeXFWZDdvM1cvUVNwd3ZuMml5cHFTYWZxbTJYZGpw?=
 =?utf-8?B?VmV0S2RLZVZLZnU2TXo4WSsvM3dsMC9EUDlobmRYRDRyRTNjVjBxU0hMbXF0?=
 =?utf-8?B?cWNCTmx4Wks5dyt4OWdtTDY0NEhlalhRQm9JUWkvRDlpZ0gxSHZhWmVyRC84?=
 =?utf-8?B?VlZGTitiUVFWWGZIRDlwRjEyaWtxTEdxdTZGLzFIRThWRlo0WTdTdVJYNHdQ?=
 =?utf-8?B?cEhlOUo2ZlhNSWV2RUZVWUZYa1dhUnVXRGZaSkpBbXVlblRmaWtTZ1dzS1dD?=
 =?utf-8?B?YXdZTU5SNC9zVGR3MHRodEsyOEp6Q2ZWamNTM3JkemhpcmtFNm1ieEhKWUQz?=
 =?utf-8?B?RzdtblIyUk95Q0JCTS85cjliMmMxVnhGLzFUVWhnclpyYWZUb0o0Tm9neDBZ?=
 =?utf-8?B?WjlycTByb041VHRQd0JxS0UxU0VWL2RueWpWUEJoa1VWcWFPYWZDVTREa0pO?=
 =?utf-8?B?MDc5SCtDYjRpV2hWcnc4cld3VytXWnUrSlovejZWaFp0ZEdoNHpHV0JOdVl0?=
 =?utf-8?B?eFVLZUkwWlBoRGtXTzJQVjdHMHZaYktHVWo3emxNSEkvbTZMcWdPeUdtWito?=
 =?utf-8?Q?JFYb8rbenc9wnHJNleE3KBQBh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c99ee77-c41a-40a5-49d1-08dcf1e54db8
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 15:30:33.5870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VZsuDn0P1up8xsv2P9/NtAjn2OOiTcHJJD0y6mEouMb9iKmUHHM4L+eUrKS8BcO/qxhdE4G4mgsiUUU5MepOtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8452


On 18/10/2024 23:25, Julien Grall wrote:
> Hi,
Hi Julien,
>
> On 10/10/2024 15:03, Ayan Kumar Halder wrote:
>> After the regions have been created, now we enable the MPU. For this 
>> we disable
>> the background region so that the new memory map created for the 
>> regions take
>> effect. Also, we treat all RW regions as non executable and the data 
>> cache is
>> enabled.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>> Changes from :-
>>
>> v2 - 1. Extracted from the previous patch into a new one.
>>
>> 2. Disabled background region.
>>
>>   xen/arch/arm/arm64/mpu/head.S                | 29 ++++++++++++++++++--
>>   xen/arch/arm/include/asm/arm64/mpu/sysregs.h |  3 ++
>>   2 files changed, 30 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/arch/arm/arm64/mpu/head.S 
>> b/xen/arch/arm/arm64/mpu/head.S
>> index 4a21bc815c..e354f4552b 100644
>> --- a/xen/arch/arm/arm64/mpu/head.S
>> +++ b/xen/arch/arm/arm64/mpu/head.S
>> @@ -61,6 +61,30 @@
>>       add \xb, \xb, x20       /* x20 - Phys offset */
>>   .endm
>>   +/*
>> + * Enable EL2 MPU and data cache
>> + * If the Background region is enabled, then the MPU uses the 
>> default memory
>> + * map as the Background region for generating the memory
>> + * attributes when MPU is disabled.
>> + * Since the default memory map of the Armv8-R AArch64 architecture is
>> + * IMPLEMENTATION DEFINED, we intend to turn off the Background 
>> region here.
>> + *
>> + * Clobbers x0
>> + *
>> + */
>> +FUNC_LOCAL(enable_mpu)
>> +    mrs   x0, SCTLR_EL2
>> +    bic   x0, x0, #SCTLR_ELx_BR       /* Disable Background region */
>> +    orr   x0, x0, #SCTLR_Axx_ELx_M    /* Enable MPU */
>> +    orr   x0, x0, #SCTLR_Axx_ELx_C    /* Enable D-cache */
>> +    orr   x0, x0, #SCTLR_Axx_ELx_WXN  /* Enable WXN */
>
> NIT: Can't we have a single "orr" instruction to set all the flags?
Yes, I will change this.
>
>> +    dsb   sy
>
> I still question this use of "dsb sy"...

Actually I kept this to ensure that all outstanding memory access are 
completed before MPU is enabled.

However, prepare_xen_region() is invoked before this and it has a 'dsb 
sy' at the end.

So we can drop this barrier.

- Ayan

>
>> +    msr   SCTLR_EL2, x0
>> +    isb
>> +
>> +    ret
>> +END(enable_mpu)
>> +
>>   /*
>>    * Maps the various sections of Xen (described in xen.lds.S) as 
>> different MPU
>>    * regions.
>> @@ -68,10 +92,11 @@
>>    * Inputs:
>>    *   lr : Address to return to.
>>    *
>> - * Clobbers x0 - x5
>> + * Clobbers x0 - x6
>>    *
>>    */
>>   FUNC(enable_boot_cpu_mm)
>> +    mov   x6, lr
>>         /* Check if the number of regions exceeded the count 
>> specified in MPUIR_EL2 */
>>       mrs   x5, MPUIR_EL2
>> @@ -113,7 +138,7 @@ FUNC(enable_boot_cpu_mm)
>>       beq 5f
>>       prepare_xen_region x0, x1, x2, x3, x4, x5
>>   -5:
>> +5:  mov   lr, x6
>>       ret
>>     fail:
>> diff --git a/xen/arch/arm/include/asm/arm64/mpu/sysregs.h 
>> b/xen/arch/arm/include/asm/arm64/mpu/sysregs.h
>> index b0c31a58ec..3769d23c80 100644
>> --- a/xen/arch/arm/include/asm/arm64/mpu/sysregs.h
>> +++ b/xen/arch/arm/include/asm/arm64/mpu/sysregs.h
>> @@ -15,6 +15,9 @@
>>   /* MPU Protection Region Selection Register encode */
>>   #define PRSELR_EL2  S3_4_C6_C2_1
>>   +/* Backgroud region enable/disable */
>> +#define SCTLR_ELx_BR    BIT(17, UL)
>> +
>>   #endif /* __ASM_ARM_ARM64_MPU_SYSREGS_H */
>>     /*
>
> Cheers,
>
>

