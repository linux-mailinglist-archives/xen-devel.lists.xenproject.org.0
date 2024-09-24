Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DCB9844D2
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 13:35:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802651.1212964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st3ob-0006fk-Tz; Tue, 24 Sep 2024 11:34:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802651.1212964; Tue, 24 Sep 2024 11:34:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st3ob-0006cf-QY; Tue, 24 Sep 2024 11:34:45 +0000
Received: by outflank-mailman (input) for mailman id 802651;
 Tue, 24 Sep 2024 11:34:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Xj2=QW=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1st3oa-0006cZ-6z
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 11:34:44 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2418::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fdca1485-7a68-11ef-a0ba-8be0dac302b0;
 Tue, 24 Sep 2024 13:34:43 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by CH3PR12MB8074.namprd12.prod.outlook.com (2603:10b6:610:12b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Tue, 24 Sep
 2024 11:34:37 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%4]) with mapi id 15.20.7982.022; Tue, 24 Sep 2024
 11:34:37 +0000
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
X-Inumbo-ID: fdca1485-7a68-11ef-a0ba-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VQe7nPKP0FxnnEd3hOSggCZHObygkordGJlNYQX9ygnenOhXYbgPqwXth+NRcQ94oY/X1sQvmO4Zi/rshuGODJkKbzpyxQaKlvIcdFzxB1iR/NiN1kb1vae9dB2v7mGVfwl3LZfhxPnLL6v9xERyqNq2RWx2KtBSWSYAy9rcvO7k3y+0LlOHeeDuNoHBblMCjHiv5sUs/IrlhMGwBme5KVu9Qf7s8rXKq4X4kH8DptMf10kkQcsSCo+TyTuaOe9Nz8dnUTi6BnrFXzLcwwayRBIFnwy1f9Oe7Xw5L4X9yAHeQCOkqgkRRWFvLTgWnV9XAN8cwepH0VW/ZaV+Ov8Kmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=av0pSuShk8DIuESQEQbdZzyT6wnySbCxw/mI/Ynf+FA=;
 b=L/w4t0jNTin84Bmy6/wYgVt2DstawE5o1t4o9Vryzc+fh+9sF785W74tBsbZ2ItdHe3B0s+wml9DPLEjBIu28mWLFSg8sx91BqsFTi9JOXwccVh1MVEZ4bjdh43wVWUZguO0Z0lsmMdmsgfcohoFWopl760VpNUsw/U4OBjfBy0wh7nFAlpkykxyP25EPOufECjAzKb6C07S9BmtJKNJR2OJJOjSiyGTO9LddC10DOc7eMNuQtbPB5PxWUBaZFx+Cpseaz3J5vnhSZt4aKpfx+dORE4v8EUlS6UemnTRqsz6iHUsRv1dOb+XMgf/AnU9eYZc5Xc+wcEIH3kTSSSfrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=av0pSuShk8DIuESQEQbdZzyT6wnySbCxw/mI/Ynf+FA=;
 b=BuZUOflhUEp2wYwG+EKLcJo/jcz9ES0E7/ISh2RGk4B9+RhHV6lzPVHxUfnZRmLzKhxykEGEqZFFX5t4PIA29Zs3crO83QCI9ORFnb0n9BDjs5etQb+DDjdrKKQESJOl8kENd1GbPmQAD99/KmJ7+vDQnZKPe7abRdvs+lKRnSI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <9c147d15-746b-41d6-9530-d638b44d2f0b@amd.com>
Date: Tue, 24 Sep 2024 12:34:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] xen/arm: mpu: Implement a dummy
 enable_secondary_cpu_mm
Content-Language: en-GB
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240918175102.223076-1-ayan.kumar.halder@amd.com>
 <20240918175102.223076-5-ayan.kumar.halder@amd.com>
 <10089a3c-ebcd-45cd-a442-53e34f76e7ce@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <10089a3c-ebcd-45cd-a442-53e34f76e7ce@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0567.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::20) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|CH3PR12MB8074:EE_
X-MS-Office365-Filtering-Correlation-Id: 43d93968-78d5-4ac4-435b-08dcdc8cdedc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TzROR1dKQlI1WDRPU1FxdUFWVWcxY2FQZy9IUFdxeGp4cTBnNmFSOE5KZ295?=
 =?utf-8?B?UWxWeVZ4bEJONGNkcERYd3JCYnladGNrOXY5S0N0d25Bc2g0WWJ0WFVUTWg2?=
 =?utf-8?B?K1pSRVFxUk1ybWxFWTd4MnEzc3p0clA0RE9jUkJYdi9uUXk2ME9aOUFqM2pW?=
 =?utf-8?B?M0l6U0VjTVROczMzMTZwSkxSYmZ2andnZm43NUdOa2ZCQWV5SDhEeGpZejRw?=
 =?utf-8?B?TWk2bWlrOGxpL0FQOTRMSDEySU5GSEphalV2T0orYkNHaGt0c0Y1a3BwS01o?=
 =?utf-8?B?QmpKeDB6a2xtbFZiVmxmeFlZaHNFTDNFd1VGanpsNG9hRmZ5Mi8vOXdlOXBT?=
 =?utf-8?B?ZllTcFRBQy93RjhINytqVkhtUldYdnh2ZkEvaExudlMwbjhMeUNuN0x4ek81?=
 =?utf-8?B?ZjRzak9oL01ob1BUTGZGL3RDRWpXN2ZlNGp1TmFOWllQcGkyRFZJZzJGbW5h?=
 =?utf-8?B?V213Y0JTK3VENWtKdnI1SmI0T3RKdytQaDArQlpBSklHNjBuYkZpQUtkb3Q0?=
 =?utf-8?B?QzhzS1pwVmhqNm5qczk2QkowK09kdGZ0YnBLSS9LeWsvRGIzWUNyNlM5M3pZ?=
 =?utf-8?B?YjFFam5BbThMYk9jN3gxUVZodTZPWnQ0N2phNFRPdy82enV5d0hCekpaZE5r?=
 =?utf-8?B?TktUcUJlUXMwMENuZndkRzUzbWIwNUg2OFBGZTBCcjVzMnlFVXpiT3J2MjFk?=
 =?utf-8?B?b1JkbXBycW41UWl6TDhIY3pwR0NLYXlDNjlCUWNwc1RBYTEzR29tbkwwYVpj?=
 =?utf-8?B?M2ZTdTFwMlpXRStJV1VoV0dMNDg0ejNoa2JIUXAvbi9ZeWdLSW9pcXR5SGJy?=
 =?utf-8?B?dDVSNzJVL0xXODRKODBOS3B2UVJLM1pSV0Z2MTBQb2h6TXdQWEZUVVFnRGFJ?=
 =?utf-8?B?NTdWV0R1SVRmTDFOeE9zZ3ZqajZ0OXp4cm5KL1ppNGl4RFZkTEtKZEg3N2lX?=
 =?utf-8?B?WHIzbVdZM2lPVHdhazhrRE0xTnljc3haYWpnZlRxU3E3bXozKzVtaUhJL01w?=
 =?utf-8?B?S2czdHdJK0dDK0YrMEhYeXJzcVRDdFd2YWE2UVJLRGdIVElBWXJMZWluNmpM?=
 =?utf-8?B?ZXR4bTdxWGd2VFBseFM5Z01RWDFyUTJtcE4zRDJmc1dDaDNIb0RDUlhVY2tq?=
 =?utf-8?B?czEzVHI5NEM3bW13Y0lUU01JOWd3Rm5Fa3grNWc3Z2J0d0ZlWVZ1Z0JqNlYx?=
 =?utf-8?B?Z2JwenF4dHhrS0tEcmFKbXJDZk5nNjhnc0Fjb2FmVWZzQk9QaGV6Vjd1RWp3?=
 =?utf-8?B?RHovQXBJRjdEQk9iN1dRbk9LcUV1YVBVWXM2cWN6UHFoMHNvSWV1THg0QkJp?=
 =?utf-8?B?cW1kSHhpaWYya2pmZnZnckQyOUVyWTA4VnFKMWFUNFVwZnh5MnYyMWczS0hl?=
 =?utf-8?B?am1VSzN4MjN5K2psQTZRbXQyYk1id1g3Ny94TnZNcFR2MFZFbERJcHArazE5?=
 =?utf-8?B?MXdWbUFncjh2d1Nwc0h0UHkvQmhGYnNwZTBpN3dFRFVQeEZ0OEpwZVZmMkVV?=
 =?utf-8?B?b3hPQVpKMlhDbnNaelVNeVpUbUhYalRNQ1ovV3oyMnZCaGJpZnFXN3RZb1Ew?=
 =?utf-8?B?SkdocngyallOUHlyQWExY3dZNWVPSjA2SDZPdHF3aUJ0L1dPNVBhRDFoNlZh?=
 =?utf-8?B?aU1meG5jRnFhbWZXZGRKR0dpbXlaS3c5Mmw0NnBpTTA4N0RkVGI0bEY3WjVr?=
 =?utf-8?B?RWNmQVhnN3BIVWtjZE5zZVZCdFU5VDdIWFF2NGNCbjdVa2QyYWZ1M0ljN2FF?=
 =?utf-8?B?VnFoZW12dUF1VHRYaHNadVpML1NyRXhtYTg5Yno0M2tueTZUcG1SOWRVMVNw?=
 =?utf-8?B?aFNHNllkWDRwOFJBUThNUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjZTdFpoVkpmZk5WTXNsL1FOTXc2NnBFeGVjUWhZeW1yT1oyd3orYXZ4WU9z?=
 =?utf-8?B?TjMyYW9hMm82QjdtR0FzcGsrWlpHc0RoOHNpYk1lMGRXbHUxcTZxZmpSMEVz?=
 =?utf-8?B?QWNpS1hycitIbGMwWXFFcjVOWnJhSmxHeTlXZFVndU15UFluQm1lMzg0SVFR?=
 =?utf-8?B?alRIeWVRcWVnY0tiRlluZVBPYTlpb3dLVVpKaGl4UzFpNnp6U2NqQU0xb1By?=
 =?utf-8?B?di83QU5LSzRGQ21zWVFDWXdYQUtXZ0VoSmNMRkxvWExuTE9FSVhQbkxrejhh?=
 =?utf-8?B?ZFVzUWdGbmkybnNTVTRIZDUweTROQnNrcElKcFovRmt5VWZHUE5SNE1Ia0Jx?=
 =?utf-8?B?dERRMjZTTlZZL3R6YzRUMGV3Szl4UHFSWE43TmNnbDZtd2VEVkRTTDRxNU52?=
 =?utf-8?B?bWdwdkxaUm5FSWt3MUc5cDQ1d0pCcUhVdnFBa2RmVjFabGxiUGxsd2dxamd4?=
 =?utf-8?B?dEJvRlg1ZFMrVDV0MUtTdHd0c2tYaXZ4MERkdVNoM0o2UWxjWWRFMGNxaGVo?=
 =?utf-8?B?emIyOHgrTHdqTWtWQWF4QXlWTnV3ZWZOYVlTR091cHlpUVNKUEpwUFhpVTlK?=
 =?utf-8?B?WVlsYzNkbXJCcGJXSlpQUjhNWWZtRnFIUGNScmNuSjNndUdPelVaYnlTdTVZ?=
 =?utf-8?B?aUUrREFneEU0RE0vVzBjV1N0WFlsZFp0VHpuWE52bTh5cmwvRHJRMDVoOFhO?=
 =?utf-8?B?WE1LSzM3MXUwSDRiY2E1YTd4MFdkanozVXF3YzVmZE50ZjBTaHh0ck0rZ2Nn?=
 =?utf-8?B?emNveXFWVi9mUkNOTFRvZ1JNcXIycmpvQUdZdlh0eHd6cUhVSG84MEpnVTE3?=
 =?utf-8?B?aTU2K2Jib3JCUHhkbnFLMjJuWmxRM2dUL1FjQmp0WFlmZ0dLYlJRbjI3OUlx?=
 =?utf-8?B?V09Rc0FITCs1WStoaW9NMExrUFB0YWJkUEpseUNWcGlWdjJkWm5EWkZ4Tloy?=
 =?utf-8?B?UU9FS2JKTHRJTDltNTBCdVRabW9tSStJT1JaU1pCTXl1UDE1OWlhZ3lCMGJ1?=
 =?utf-8?B?OWFnSTZ5UG5EbnNCcnk0RWkvSVRyN1pFRnQ4N3ZHeTE4UkgvSW8zb0kza2tQ?=
 =?utf-8?B?QkNPd3B2c3RSbThQSGVaMzhSQS92dkJjQlFaUytYT0ZTcVVuVVhjMndMdUNn?=
 =?utf-8?B?eDY3TUZIakNoMmZXS29hL3hBaTFnbllURzJHNlcwVTRTNmdIMXdxeWdRY2Ur?=
 =?utf-8?B?aFZlR01PTGVhdGs5ck5FNEhnTklUSDUzRFVNT1Y0WXdYMkc0ZU84d2toeWJn?=
 =?utf-8?B?dGVtZlM2N3FLbFFBWGJOSTNnbFhhN2xRUnZ0dTExbWdKUDBibjFtNm5UUFVL?=
 =?utf-8?B?a3dNYVZhaERLR3llQm80QzNFejcrejJOL3F0c2RjUkk5cWtWTlRzN2lNL2dV?=
 =?utf-8?B?UThuVzhMRTh0Z3JFaXBidi9oQkxaN0pkelZ0dTFOUTRHeGFtcDQ3TkQwSVo0?=
 =?utf-8?B?MXA2U3VQdThHMG5RTW0yS2N6YmM1NWZSRFRrRWVVN2lDOGxoMU80UjZWTGMw?=
 =?utf-8?B?YXZ5YldBU25yVll0K3RvcWhsbERlditWdlhHV3hnZGxPR3Q3Uk1GajMyeW0v?=
 =?utf-8?B?SHNsY0p5SUVJUldvZlM0VVZNOWNOSWIydzUvOGkybEFyeUFZK2RpRmNzS21N?=
 =?utf-8?B?WXFjRVpNTFdPbk9kd0hVTmUrQi9PSVJYVFhSUTdEaG8weHRxbHJnNXJjNk9H?=
 =?utf-8?B?OFJEczhwN1lFZGIyRUxPdS81OU8zVWh4T2grays2L21CbTA5Y3pDT3M5amFp?=
 =?utf-8?B?eC9wRUdJKzlkWTQvbTRBaTJrN0djM3FYV1ZsdkZzbmxlT0tnVXNtVTkyUEJm?=
 =?utf-8?B?TkNlRW54K2xnNUo3QktHVjlveG5ZMWpydXdJcXRBVkFmajBRcTh3ZUZGdmFL?=
 =?utf-8?B?eUd1K2RWT25JZEJYS2hOQzYrWmQ0Ry9mSFVxR1d0RXNpdUJMNTQvZm9sWVd2?=
 =?utf-8?B?S3ExQURyNUR0Y0ZrYkhPam9LUEVyOHBZUndnUU9MVTRiVDI4TGJLdG8wZEp2?=
 =?utf-8?B?Q3RSVkFrRExRdWZlb2J5U3VCckRQQ2VmRjllUW45TlVLZVdjR2xRMG5EdmJI?=
 =?utf-8?B?RnNEdWFCOUlOSVBsVXFiQXE4NHRHNFloSURmV1Q4VWg2SVViNjVpeTQ1c25k?=
 =?utf-8?Q?0T8HBHyTQrMI/CnhjTXpQD39Q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43d93968-78d5-4ac4-435b-08dcdc8cdedc
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 11:34:37.4655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EQVGA2aZufSAApseryI+JaGvlqADwBi1MBxXPallvNb7JjPp/ZBbFHaqlrcdLMA7mn6mQ5U0tbchp38wS2yvAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8074


On 19/09/2024 14:20, Julien Grall wrote:
> Hi,
Hi Julien,
>
> On 18/09/2024 19:51, Ayan Kumar Halder wrote:
>> Secondary cpus initialization is not yet supported. Thus, we print an
>> appropriate message and put the secondary cpus in WFE state.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>> Changes from :-
>>
>> v1 - 1. NR_CPUS is defined as 1 for MPU
>>
>> 2. Added a message in enable_secondary_cpu_mm()
>>
>>   xen/arch/Kconfig              |  1 +
>>   xen/arch/arm/arm64/mpu/head.S | 10 ++++++++++
>>   2 files changed, 11 insertions(+)
>>
>> diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
>> index 308ce129a8..8640b7ec8b 100644
>> --- a/xen/arch/Kconfig
>> +++ b/xen/arch/Kconfig
>> @@ -11,6 +11,7 @@ config NR_CPUS
>>       default "8" if ARM && RCAR3
>>       default "4" if ARM && QEMU
>>       default "4" if ARM && MPSOC
>> +    default "1" if ARM && MPU
>>       default "128" if ARM
>>       help
>>         Controls the build-time size of various arrays and bitmaps
>> diff --git a/xen/arch/arm/arm64/mpu/head.S 
>> b/xen/arch/arm/arm64/mpu/head.S
>> index ef55c8765c..3dfbbf8879 100644
>> --- a/xen/arch/arm/arm64/mpu/head.S
>> +++ b/xen/arch/arm/arm64/mpu/head.S
>> @@ -168,6 +168,16 @@ FUNC(enable_boot_cpu_mm)
>>       b   1b
>>   END(enable_boot_cpu_mm)
>>   +/*
>> + * Secondary cpu has not yet been supported on MPU systems. We will 
>> block the
>> + * secondary cpu bringup at this stage.
>
> Given that NR_CPUS is 1, this should not be reachable. How about the 
> following comment:
>
> "We don't yet support secondary CPUs bring-up. Implement a dummy 
> helper to please the common code."
Ack.
>
>> + */
>> +ENTRY(enable_secondary_cpu_mm)
>> +1:  PRINT("- SMP not enabled yet -\r\n")
>
> You want the print to be outside of the loop. Otherwise, it will spam 
> the console in the unlikely case the code is reached.

Ack.

- Ayan

>
>> +    wfe
>> +    b 1b
>> +ENDPROC(enable_secondary_cpu_mm)
>> +
>>   /*
>>    * Local variables:
>>    * mode: ASM
>
> Cheers,
>

