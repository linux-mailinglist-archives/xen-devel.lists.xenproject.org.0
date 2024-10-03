Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F93198ED5B
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 12:52:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809270.1221519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swJRf-0006qD-L8; Thu, 03 Oct 2024 10:52:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809270.1221519; Thu, 03 Oct 2024 10:52:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swJRf-0006og-Hv; Thu, 03 Oct 2024 10:52:31 +0000
Received: by outflank-mailman (input) for mailman id 809270;
 Thu, 03 Oct 2024 10:52:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YVgi=Q7=epam.com=Sergiy_Kibrik@srs-se1.protection.inumbo.net>)
 id 1swJRd-0006df-SB
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 10:52:29 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170120003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9524b63d-8175-11ef-a0ba-8be0dac302b0;
 Thu, 03 Oct 2024 12:52:29 +0200 (CEST)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by DBBPR03MB6860.eurprd03.prod.outlook.com (2603:10a6:10:204::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 10:52:19 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%6]) with mapi id 15.20.8026.016; Thu, 3 Oct 2024
 10:52:19 +0000
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
X-Inumbo-ID: 9524b63d-8175-11ef-a0ba-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y+HbBqeTpBCcczCrq3m0IXXlJ1brodBdUUNxmwifkn8OWINB1hf79Z95iEXsumia/LbXzvzyMliFr1MtsPQc72Exza6jHskzJysfa3VZmEsWXTQhkTrdj/jCYsYakzIO7YiF2eigBGj61PfMpdh4VXzqCVpa62x/xDC5tlRmOm8lb1IbojBiF5fftl9C1+6qRcAmiGKQAPS50pLiKtlbzLYhcb1Y67vDMNNPtSug9lj1ZEBWWL7TDZ1jorP1Y9uh6U4Av3Sf40uCSyZqng+kaGVd+qOsdrRwVOXWWmGoodr0FhcuILXjAiU6EaRjaDUeOXs9lTfi1pyjt04K7G/3JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JTVgZWOIwb34G/x/JZjQ+G8TVqFH3J+p6BWZnwnoV74=;
 b=bg/v2EJa806AkRle4n3Q+0sWcWD2LEmqw4RNHbD5j61Ux0S0hjVs2bkcWpEVP5PQ5cAopHny2Tpn5roLsVvqz7fMcnQ0x9sshJSTPlzZWFP6ZGkLbYhjfO04fAznxgxlHTT277HUi5VOLy80+8X9Qb01OG+uh5A65Q+wqWUbtVAj+UtVyt47oeQ52EFxp+H1YO1C2c1H6pljGwQx625frTv7IEPHRD8yG6x2ifOFx4oSl64TSZRg1diCFDYtzPJJ7JD8g9fwJTbuDLE5ctOjIa4VWMfCSyvmNK35EmGdxISvdryZ6yxXnGRdtGUjOop6Bcq31SNHjZvK02dPJihfMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JTVgZWOIwb34G/x/JZjQ+G8TVqFH3J+p6BWZnwnoV74=;
 b=d3rRiR0oO1LzMYqW+Qmf6YuUH1xQEMMEaDtPaY2TBB1xcwPE5J+ceM84UoZznUpso+NsdVpqJKyvULnhHLW1PR8Aux0T7GQM95PKrUlKYVUFfIMPv1riYp5IxprgikT2iMP4NtX0lopdNAomb2oWCVsMxM7xmXVu1ckqyWAFqFQgy1kqaCHr3/LN/P4/CoKuF037zY396/zizOzqH5EM8932Bz8w+4kfCoH1sQGM8vtjq4PWvNnyL4Tr+GUPpNBczZa7MLEXt+LlmoTF74svCIsysF7BomLWSkWoXg+6+r3H/OyUPHCYE4BJ0yrmxdDksgOD/dGXdU6g67Wv/e9e1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <0cc94322-b95c-4e4b-9b59-89137adb1dff@epam.com>
Date: Thu, 3 Oct 2024 13:52:17 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] x86/hvm: make ACPI PM timer support optional
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20240916063757.990070-1-Sergiy_Kibrik@epam.com>
 <Zufh7DOSCwzhrpZG@macbook.local>
 <alpine.DEB.2.22.394.2409161252380.1417852@ubuntu-linux-20-04-desktop>
 <614611f1-dfbe-4185-8f0a-dc89aa7f5a20@epam.com>
 <ZuqgTKqaUDWC_I-u@macbook.local>
 <27d717f7-3073-4139-bef0-05d1a39f1e6c@epam.com>
 <d5a6774b-3c50-4b39-9bb7-740f0763a1d4@suse.com>
 <12072ee1-5a39-4c19-a442-c5be45fb968e@epam.com>
 <15d79e3e-dea6-4c07-82c6-43e17e429123@suse.com>
 <b2edae9d-2c1a-4e67-9e01-2ce3813d4dbe@epam.com>
 <3c6aebb6-ec8c-4f1a-b5d2-eb216b9f7bef@suse.com>
 <af218437-b8fb-4e34-95ca-cb39d4f57e7b@citrix.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <af218437-b8fb-4e34-95ca-cb39d4f57e7b@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0011.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::8) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|DBBPR03MB6860:EE_
X-MS-Office365-Filtering-Correlation-Id: 43345cb4-bbbc-4899-7f37-08dce39973ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QVJlbUVZNWcyTkNuV2FBVm5KSCtpYklpUXhwTGZIZDJqdGZ3N0laR1RJMjMx?=
 =?utf-8?B?OThHMzlnNFM3UW5uV0p6N1RlcXZPMUhNWlhhLzVDNWFFTnVUWkEzWEFRbEN6?=
 =?utf-8?B?eDJxVUtEbFFIOVhWS2doRlB0Z0hza1hJNW1IQ3ZPTDZVMUlWdVR2a3hOenFX?=
 =?utf-8?B?OFdNNjl1bEFaSDNZWVNoMjhLY3dabmJkaEg4UXZTNkFwcVc5WldGRE5rSE1C?=
 =?utf-8?B?eUNnZlR0aTUwT3A0TU5XdFEwRitSekZ6NTlrOXVudm9TdVQ1c3RmWUozdlVn?=
 =?utf-8?B?RW03UGJIOTFONStoSE1hSnJ1eW50R0pOckhDRzFkMUd6SDhPWGdXVTlXeWF6?=
 =?utf-8?B?RHVkNjU0b1Z3b05RTnZlUnRiN2txVWZCaklqQXZVSGU2VkFoWTMzWEUvQ3VS?=
 =?utf-8?B?NXV0MURUWUFYaEJKNTU3dHJZQVJHNW1oaG1SQlQxeDlvVGYwbUZnenhPWGRz?=
 =?utf-8?B?WDBOam1RZnRnN3JRTlVGYW9yNEtoUUV6K1N1VVh3OG1HSlYxWnRUVzZ5b1dR?=
 =?utf-8?B?UG9OcnJaZUJmZGhnblhLck0rbitVM0tsb3E5bTJYVktnN3B6R3RZa29QbStF?=
 =?utf-8?B?SVV3bVE3SG1NMUhKNWNLSmoxQ0hVUnEwNFlxRUhWcVJwcVhnbWVWUHRxbUoy?=
 =?utf-8?B?dFIwRi9EaDBrcU1kaXR1amtVWU1vYWJ1NVdSajYybnZ6bVZsZm10VjRrTEcv?=
 =?utf-8?B?QkVpZm5pM2lsajJkUndsSVpaZGpYRWRzd0trUGxSOW0wRWRRNTZIWlg2SHQ1?=
 =?utf-8?B?RnFxK1VZZ3ZxRGR0eitGZTQ0bmVZU296dVJ2Z2ZleWJYaHRGTzBVbWhXZXVB?=
 =?utf-8?B?dVhzUW11M3FZUVVHVkhhc2ZEeXByMWlwU3RsMm83NjRjRGRCZjN4SUpId0ZR?=
 =?utf-8?B?aWdkV2JpQzlTSnhsZUk4M3NRV0sydm1EalBWSStKTDVZaHpmaDdQYm54Ym5r?=
 =?utf-8?B?UTZNVHdSeENOTzU5akg3Z0FURGNpNWpuVWtVd0ZqREJqLys5N29RRHZDQ0Zu?=
 =?utf-8?B?VnhSdFlIWUJ5MFZTQjFCdkpiQ0U0MVpJbWdQUThUdUxvUkhITmZVa0pyYUNv?=
 =?utf-8?B?YUE2cjJzbkhYNWJvbWZBZXlralBzWkhJS1MwTFR2UmVJQ0dkTUhmK21way9i?=
 =?utf-8?B?VVNmQ2FQejRFbTdHVmN4MFd3dTdVbHY0UXlyM0tlTWs4R0hPak9pZi9HSUtq?=
 =?utf-8?B?eTd3YXBrclRwVnhsSjdJZUxZVU9CcTJsbjVSRVBCVjZLZVF3Y2gvU2xEdWxI?=
 =?utf-8?B?YXhYL3JpcFI2Y3MzcVM3NGF4dWZObHFjNE1FMDJiaEVqamJUTUVmNGpBTHU0?=
 =?utf-8?B?b0EvVTMxOEdoaDZ2WllES01yTlJwRU5GTS9ZQThDWXl0S0xSMWh6aDdPRThC?=
 =?utf-8?B?RU5VdWg3U0Q1Rno1d29mSjZSMWUrNlYyVDdBQlBENUh0YXpXMlYwbUk1MWRu?=
 =?utf-8?B?UXhtMEhMQXFNaWNPNmp6TGpxYkN6YzlObXkrUloxOGE1UHhSaytudTJqQThH?=
 =?utf-8?B?Z0xzbGFaK3hRVUczeTArdU9wbnY5VTVQQjgrV3dqOCtRUzkya295eW11UTAv?=
 =?utf-8?B?UXo2UTJYNHR4VHRpTENYWUw1b2dzT1lTWXNMQTBVWDZmZ3psa0FXVUd2bVVX?=
 =?utf-8?B?ZWY1M2l4eHF5N0pBald0LzhjWEZvTWRXWmt1dGFmSkl0bm1vaXpGMjlWcTlK?=
 =?utf-8?B?MDJyWlV6M3R1UFVqZFdHZHNVVkdwMWRua1ZxR01YK0VtdHUyaWoyejBnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2JqQWFudTlpcm9HaVdPTUQ2Mk1jNkhjNHFaUWVWVXFKM1NuOWZreHAwbDBX?=
 =?utf-8?B?blVrSlIxNFQ0bXpleEdheWZVYXhwNW9EbVRQNmZxb2tjYVhYL0lNbXVEWWZB?=
 =?utf-8?B?LytSMVlLMEluNDVUZHZuUXlTYkwveVJ0UUdtTEM2VWJmWnN3TldIRC95dTZW?=
 =?utf-8?B?bUtVeGoxY3BYUGZ3TGtBVmZBeXlvZWtHcndhRG54VHRoeFlmWWRTMU5CZElQ?=
 =?utf-8?B?ZHhGWGVVQ0xHbHVhNGdLT0EralZtb1drRW5ZdUIzc1FtUmxaSDFMQnRpK0U2?=
 =?utf-8?B?NEx0V1ZLMEFkTm0wOXJscG54UFlXbHQrQUlXSGhET1NINmZZcUsvRndaSGVr?=
 =?utf-8?B?VnJDeWhadThxM0NQU1FvekFLMDJ2N1dLZ1h2aUlmTU5iUTBYdmdORVFFTUpC?=
 =?utf-8?B?SG1JQS9NUldLbEMwWUhnak5aQlRUQngyRVYzeCtac21reGlXZ0hLU2dnSllz?=
 =?utf-8?B?QWdyRkI2UEh1M1cvRXphN1BrOWo4Ynk0cGpwRzIvYlZJMVI0R2UrRWh2eE4w?=
 =?utf-8?B?c0crQkpXODVYMXNJdjhzM3BpeU1QREpYSVJ0U2s5ZlB5a0tIT0IxYUtibGt4?=
 =?utf-8?B?dmNtbDhNVm02V2RCSU1Vd0pZckVUMzZoM0FvZWhETXM2VzIrK3ZQRGRkZTFI?=
 =?utf-8?B?WjR1NWJsbWVXNjVCbEJrZitPMzErYUZPc2FVY1c3S2VPNW9Sb25lOEd6aFNB?=
 =?utf-8?B?Mk1hblNZeHU3NkJ5ci9aaHRXZWxoWHhraFJZMGNjS25aTkkxREFuOVhpZFhO?=
 =?utf-8?B?cnRaYlY2TUdqQWZadzFaSVFjSmF2Q2lLMVp4QWd0UENiZC9JV0hxY3VlWXlo?=
 =?utf-8?B?a3BHZTIrK3RSQUE3WElOYUpvbExiZWxWVU1GY3Z4dXAxRCtvWTd2NXpZamdV?=
 =?utf-8?B?am5hK1ZKc0tlVDU4WmczRWxMdWs4MnZFNE42QlNLbEQyMm91OElCWUZUZ01H?=
 =?utf-8?B?czJEdTBRMGhDS3EvN1dHREIxZ2ZJQzNybEh5NGdTTU1rTktGNHR5cXRhaGps?=
 =?utf-8?B?VmxOTG95VTZzSStZYUpFOFN6UlBMc09uUTMzYXNYd3Rnc1F2eUk2VkVJTVla?=
 =?utf-8?B?elhxY25ld1l6MkZNL2xMbzZvNkdBbTlzZWxnczlVTEp5ZGdINGwvaVdVKzhx?=
 =?utf-8?B?M1dWQ3BsVE5mZUZzNTJDS1ZoSHdqczdzRW5XR0JWYUdwcHZ4R0czNEs0aWhU?=
 =?utf-8?B?Ry9GVTlFOTBDNHFZWUozOG5hS2s4RmI2TU0rbmhKQUs3MkFNRE02QWlVUjhv?=
 =?utf-8?B?K3c1NkJoNTVIUzI1cU9JU0VLUU1CQldwVkdKVEd0d0lmaVNmS1UwRjM0T2xU?=
 =?utf-8?B?cUhWelh5aGRKY0tFTEo0Undqb0prd0xwYzFzUG5YTTEyY2t6ZE43VEwrYTJO?=
 =?utf-8?B?SmhabjFwREtQZkFLL05kZXVMSHNSV1hZeGtzS0loTk1NK29nQ3c1K2ZSRXRL?=
 =?utf-8?B?d0xvRS9qdUlBamNDaHFSREhzTk9RYVAzK1o3c0hSNWdVUGd3S3VmQmVNbGlT?=
 =?utf-8?B?Y3RXZEpqTDNBcGVqZ0pEY0xnOU01eEhzN0c3SlArRmdlQ0FCbjBWMjZZa1lh?=
 =?utf-8?B?V1ZjM01mempSWlFuWmpwMHNMOUFOQVEzcTdTa29za3BTVGVwNkxjcFFLM1B0?=
 =?utf-8?B?aEVSdXg3RUEwbU5lN0VmVlhaYnAwWDFJR2h0QUdHZU1XMXNxU3JvN3VFMFZF?=
 =?utf-8?B?OFdyeVNMeUs5S0dINlJqZ2wySHl3cGpDUG5JbWRKVzNYZElUQThGb2ZZNk8x?=
 =?utf-8?B?SjRWK1d5UXAxMFBJdSt5ZmYzMU5TTW1aek1iU1g4R3dDeTV2a3BZK1JqeXhV?=
 =?utf-8?B?Q0xPVnNzQ0I1eFpiZzEwaVhjenp3SWRSTGxtbXlDL3JKZUtHb0dxak9PcWsw?=
 =?utf-8?B?cWY3TnUzamE2N2VRait2OU4xZU5jeS9MMk92c0lRU1Iwb1RlMW1DOUI0STEr?=
 =?utf-8?B?OU5GYmxLZklCTCtadTFUQUtHTlRCZlRVMkZKcWVUZ3VEdWNCWjJLOWExQWl1?=
 =?utf-8?B?RisrME1pR0l5aTVXUENOc2N2OVRtSzRRdHlBYmttYUluTDd4UkdTRFBWOTNs?=
 =?utf-8?B?M1VoVm0zVklWRDkya24xU3crK1UwaUJZSDBSWGx3aVI2ZGVjSU04eEpYaUk4?=
 =?utf-8?Q?LA0trGzaPzToy8wx0r3NLB9SA?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43345cb4-bbbc-4899-7f37-08dce39973ef
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 10:52:19.5639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gfBlU7/BKCrwNxW2qvx9jLpqxYhHomCbVOC5jc+P/Bjq+NWGoq4BmR9rwYuXBosbWktfL+W5FBrKB2d+0kPagQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB6860

30.09.24 14:33, Andrew Cooper:
>>> Options are dependant on HVM option, because pmtimer & stdvga drivers
>>> are part of HVM support code.
>>> At the same time these options are allowed to be de-selected when PV/PVH
>>> enabled, because only PV/PVH domains can be created when stdvga or
>>> pmtimer are disabled
>> But PV != PVH.
> Furthermore, be aware that there's no such thing as PVH in Xen.  It's
> toolstack level "branding" for want of a better term.
> 
> In Xen, there is PV (ring privileging) and HVM (hardware virt).
> 
> PVH is a toolstack level construct which passes a different set of
> emulate flags, and doesn't set up qemu (on ioreq server 0) by default.
> 

understood, then I won't complicate configuration by linking it with PV.
Thanks for explanation!

   -Sergiy

