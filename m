Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C305EA00769
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2025 11:06:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864550.1275780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTeYk-0002Y1-6T; Fri, 03 Jan 2025 10:05:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864550.1275780; Fri, 03 Jan 2025 10:05:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTeYk-0002Vv-1d; Fri, 03 Jan 2025 10:05:38 +0000
Received: by outflank-mailman (input) for mailman id 864550;
 Fri, 03 Jan 2025 10:05:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kEjL=T3=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tTeYi-0002Vo-BX
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2025 10:05:36 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2417::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4475d542-c9ba-11ef-99a4-01e77a169b0f;
 Fri, 03 Jan 2025 11:05:33 +0100 (CET)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by SA1PR12MB7199.namprd12.prod.outlook.com (2603:10b6:806:2bc::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Fri, 3 Jan
 2025 10:05:26 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%6]) with mapi id 15.20.8314.013; Fri, 3 Jan 2025
 10:05:26 +0000
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
X-Inumbo-ID: 4475d542-c9ba-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f/VuztrSaeeW5Rw58P6J+wnC/moNXTF71LAYyyG9Ou9mKISPvtmjCJ0IL8lvwZYG9bCbpX5DaJGDqcKAjxzTYFMBoTPzg16JEFcU+xB1tiPg0sj50IH4/D0oNohS66Cc/yRok/L6X2QllkIo9polaOgjsvkP1pmAdMIUfN/Nzr6MFPyIAhEAyB85/EgHN+MnoPm03l6iZfEH+8YDImiNpGkqEm8lG46cgBqHuxA/EKQbj3uoku9Ecg5IF94mywMczPjOUDcfUhUN82Fx1S7Orve4U7m25QWce9D+vKn7UShMHkoKt8ns2bVWudGq2HAqHX2BRDblizLX9jYiguQHyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3f2EOb0fsLW1LW7sBLDEv7XLMSjTm//Reskx8TQXWOU=;
 b=Q3Koi6D6xFa/3vMZQyQrga4xD6fumEeq+uhdOFof/Nxfjzq42IS5i2PoLQRFtUtCp8mMEjKwz4ZTYImWcCkMLF+djDeu+PUZoVmOLRyxSLLhvE5hczxzzJQglq28EnLmLOhvE8ieDkGcwqqLO7a9Mk2v4XBT4wa5SDM+MZ7XF31DyO5iAtLDW829cR0dWjhH8JGUJ/cUiZBLtVMKAKJX18hU6xrqLjubgmvQHC3Q6IiRcwsTTXVDmjdMyV64R9TfF36oZOWJXPE60sR5nNr9tZSd9jcWfmUAh0wifGmvzDHo7Bf07J2QECaEcInqUvBkyF30xfiLHa21WxoImIk+vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3f2EOb0fsLW1LW7sBLDEv7XLMSjTm//Reskx8TQXWOU=;
 b=pQSxU4+ciTHMJ169NlhPWiSVax0xCUBVA/kJYFjOFzVWRR7oDSm8lQnMcOBCipZVFSBWsV5rszrC9I5ExovL76KfcoAPsPSllXqfQjDWD/F/euJmb4yJHeHbavFTcFXNbgaPcqtPiaICEND74YyMQgWhQkt33XsP8bHlJ2q7uuw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <88726324-89dd-426e-ba7a-fc3e5b12733e@amd.com>
Date: Fri, 3 Jan 2025 10:05:19 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1] xen: mem_access: conditionally compile vm_event.c
 & monitor.c
To: Stefano Stabellini <sstabellini@kernel.org>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>
References: <20241230063051.3332332-1-Sergiy_Kibrik@epam.com>
 <alpine.DEB.2.22.394.2501021133050.16425@ubuntu-linux-20-04-desktop>
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2501021133050.16425@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR01CA0033.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:542::19) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|SA1PR12MB7199:EE_
X-MS-Office365-Filtering-Correlation-Id: 973d469e-e09e-4eae-0e35-08dd2bde24ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MGtXZEVLK3lTVkJRVU93SVVYNWIvWi9ZSS9EelFOTXd2TUFVSGpIMktpb1Vl?=
 =?utf-8?B?UzhPUDl4SmpaYVVBNnNkZTV0VlRWYTdEWjRuS2NqSXUwcVUybTY2dENOcTNv?=
 =?utf-8?B?S1VuQ1haWWUzR2FTWmYwb1I0czhlY2IvRUIvSmQwNW9VYXJleitRZ2g4blRi?=
 =?utf-8?B?eGR2SkQ3cVJuZ2J0K1FDNDdZQjVYNytBeisvS1YrMjJZVy9abUpTYUdUQU9a?=
 =?utf-8?B?NXFrc01NdjcrajJ1anZPK205YzJxaE5JNERVWkV4anpEa1M4UkxYbzdBRElK?=
 =?utf-8?B?WWFjdFJ2b1FwUnJ2YkdlWEtHU3hsOWFHOWVxM2F2eGtML09EcFl2WXdQazBh?=
 =?utf-8?B?ZDhjRTQ1NG5MczhvL3VZWTJwVmpFaHJ3cWE4WFZqaGEwekNuUHlrcFAvYXh0?=
 =?utf-8?B?aHV4TEU0d3RSbnd3ZnBNN0Z5aE53OC8zd0ZCMkpQcU9CZVVJcFZXcC9wbHBt?=
 =?utf-8?B?RHhwbm9sdjJTVVF5UHQyVmRSSUt0eWw2SklKUGt6bWpJRTM1MjBUTVZtb1lL?=
 =?utf-8?B?YktnM3RxTk8yWENWL3BqL00zL0VGZmlFN1dkdlNLeFJqcHZtNjJyNWpnQUhw?=
 =?utf-8?B?ZG5SUm9GVnkyakM1a3ZOd1JNdXozUktYWllsRnd6b2RyUkFrd0Q1YXg5ZEFy?=
 =?utf-8?B?REoyY0JNeFJKYkt2Szd1RU4yNzB4MjluM29KVUFMYnFGTURpMS9iQWU3cTJK?=
 =?utf-8?B?ZEQxYmdVcmw3dWo5MkhUK1FORy91ZVJWbjFvV0NZY0I0TGphOHlBQ3ZaS3ZB?=
 =?utf-8?B?N2V6a3dVVGkxV1UzQ2MwdG9kWXU2YXBhbXIzc0RmMHJtSjM3Vm53dWRjZ0Q0?=
 =?utf-8?B?K1M5NXJjemM4bE9tZTN4YXJRWnNwTzV4UFQxanI1djJIQUl0Wm8xU0prcm15?=
 =?utf-8?B?UDU5Z2N6RERxMWdFb1EyZy9RYTZZRS9xbldTZDFUQ2J0TlZ4YlJOUlorRmcy?=
 =?utf-8?B?TTdvR1BoYVA1OEtSbkd6VVhLRm9MS2kwOFV1MkZORGtjd3J4RmdCYjFJQllw?=
 =?utf-8?B?cFEvSjBZU2hJZkQwbVNxSUFvNSt0SzNuTkJwZ1E3WEw1VGV6YzFOZUdWL01y?=
 =?utf-8?B?WlZBNVF1WDlOa3l2R1ZWbnNJaHgyUHZtY2VrVkJVSmQ3SGhwOXRMbmk5dnZE?=
 =?utf-8?B?alpWUkU0MnlrTWxwRWVmNjF1SElKU0JJSE83SW5RQ0I3ZnZhSjZkcndIQVhO?=
 =?utf-8?B?T2lqL09KbFY5clVNZWFJcVNXQXY3NmlWREdNNXFxQ0p3SWxFMXZxUzRaNmN4?=
 =?utf-8?B?YkVvaTVhWVpvT1Q5aXY4MjkvNFRqa2tzendHS3lydG1GOEFiVTBUVmVIY3k4?=
 =?utf-8?B?a0YvZHE0a1pla2d3TndxVUxvaVJyM01GcDRhVzFtaHNPYkMzNXM3aC9tbm84?=
 =?utf-8?B?SDVOZTZQYmZoM1EzZVJuN0gwMk0wWDlpTXZhVllIMzFBUyt3ZStXM05iNlZZ?=
 =?utf-8?B?UzN1RmE3VnVoVUJLTHJCNTRqZGlBRHl2QkFJTS95MWUyYWlXQ2t5Mmp0S2JR?=
 =?utf-8?B?eEhYL1o2M3orZjRTWDI1dVVCNXdMblB2bFVDM2FncTRVd2lxTmJaejlMbUE3?=
 =?utf-8?B?N1E4dWkrNnJac3J3QTJlMkJEUnZ2TXdzV0lTRExURGFVMDhMODhPWTBMMEt1?=
 =?utf-8?B?dXFxUDVEY0tqSVFQN3ltdmdQMVJDUzRNdVJXcHdKY1ZXVzZlRVk4YTRzNWtm?=
 =?utf-8?B?QkFSVlpkaEtwWGNhblJCR0ZxZytUK0FaTXZYTklJdUlGR3U4dUV0SnpsUVJN?=
 =?utf-8?B?YjA1Sk93U1I4djJFZzcyUTBJUzhoVlBJVFFEcGpPVWF2RnBZY1llN3FQU21W?=
 =?utf-8?B?RjdKRE14UW4yTzdHaE1XOXpkQ0NKa1dVQVBxMTVFbkpuTmM2Tm1OR2F0cjdo?=
 =?utf-8?Q?niSrAoAORNRaK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHgyOFlveWZUNjd2VDQwNlRIVUVvRWhlbnZGaFdFVWRzbXh2NnlhendvTEli?=
 =?utf-8?B?b2YvMC84VHhNYTAxZ2JTVU9aR2ppc1FVQlhGeStKZ3V5ajdpclVEVEhORkdB?=
 =?utf-8?B?OVBmUUVoYW84NDh1MFpYZ0RFNzkwV2JzcHgvb09tVlkrajlQRy85aEgveW80?=
 =?utf-8?B?S0JTNGx6TGx5eVdyU2xLUURlQ3kxa3RZUEZYU01WcGtQdnl5clJ0dk9UdVFB?=
 =?utf-8?B?T1pJckNsR1hsNC9LbVppemc4Z3Y3aVlDLzFWMGtTcjhZQzFBejhlMmRzdGpq?=
 =?utf-8?B?TTZ0Z0VUb1JYUU5pMU9kVkt5SlZSWk84L2tlRmNTVXV0dGxtRnVpSmxncy9Z?=
 =?utf-8?B?NXdiQWVFVVZzQjJOaFcwTUZMNFhyN2VCejAvYmFMcVRsSG9Ud3ZZT0lLUVp4?=
 =?utf-8?B?VldhU0I3SlBpRy9aT092ZWV6MGNlQXR4UXB4ZUFxbWFuR1NrMDgyNExOT2hv?=
 =?utf-8?B?UnZMWTV5c0ROWFZEQzZlM2pPREhRRHAydmJSMEgyVE9VVTd5NlZsYy94TzNr?=
 =?utf-8?B?cWQ0aWY5NTMrUTBKckZqSnc4U3VWbXlNeHBZSDhmTWR5ekY4dkdZb1ladHpH?=
 =?utf-8?B?dTRRVE4rNjRnaDR1di9rRDJoK0ZFa1VBYXlIQlNyaVkyUTJvS0tsSGJHeTQ0?=
 =?utf-8?B?aEhMemdXSUFhSHd6MlpLSHI2MGhFRlh0djFPTytlZjgxVloxVmk4T1lkS2ZZ?=
 =?utf-8?B?UERxZEx2NTFXS1JGSlZ0NzJvL0xFcVFERUs2bGlQRy9zeEVBSGJIUWRIOFEz?=
 =?utf-8?B?NmVDV3VYb09NSTM2dHVJVEtKVkRlbEdqSzZLSGhSaGRFQWV6M0lDc1hmSEJ4?=
 =?utf-8?B?MGlTRDI4U0oyVUJrOWI3aTBlYmZ5dmNwR1pSU0pjZmlTTEdqaFAxQ1pWaDIx?=
 =?utf-8?B?REFuY0Y1WXdJY1FBUUZjd0hYUXFjQ3lZWFQvU2NMTkU2YmlTcUpIUk5JVC9u?=
 =?utf-8?B?Ym1ocWxielg1VFdRMkxuWGluQUh2TEJsb2Z3K1YxdGhmUDRuMEVFWitZZm8x?=
 =?utf-8?B?Z2RWM2hTSUF2UXRSMnJzeHV3SGdmT043ZlZHT3NVYVVudEZhOWU0N1ErK0Z0?=
 =?utf-8?B?Q0VUaVZpSHZRUmczNWl1T0x5V0RMMSt1aWNMZUNkc3NJM1owUlJTTnlnTzEr?=
 =?utf-8?B?Z3NLWGgyT0MyRkc5ZEV0VDBuUUJ1VjFHWWFFT2t6KzZ2Y1UvZStQRnREa2lu?=
 =?utf-8?B?REhsN2VycnlMQmhrQVlkd1MxYTJnQzkvcVJPMGhja24zZnhiVDhWVWxtWk1J?=
 =?utf-8?B?UmJvM0MzMUJ0NEdQQUlYZThmWnZjWTBkMjFJSFNseGJZaXdnR2J1NWUxcU9W?=
 =?utf-8?B?a3c3eGFpSnJLdk00bW5OeXB2V3FMTXVEWjlQSHJjU0c0QnZ3SWlJcWJFSzJ1?=
 =?utf-8?B?VEl3MDdtbnoxUDB2NldMRnFDRUJ1cFNDT29oamd5eFBTWjhkcFJTb2xkRkU3?=
 =?utf-8?B?U255MnZQV1ZvMC91WW56OHBqRldhOU1RZG5LeEhpNDFYT3p5Q1YzeGMvbmNt?=
 =?utf-8?B?OVU4alJsazAwaHZ1VlEvMiszbS92VCtTSTVUM2tIZ1FCd0tSVzN0bGxnWmtx?=
 =?utf-8?B?L2c4Rit0VkxpZE8ya1lQNlJiRGVOQXlDNEp1TklBQmpwbFN0SE0rM2twMFND?=
 =?utf-8?B?QlNvb1BUUy9VYUQxdUhnRUdTSFBaenlQNTR6TnlBbFZWNVNQT3puVHVKeEZ0?=
 =?utf-8?B?K0pmZlZCOSt5TXdmZ2cwUll5V1pySnFUcVZOcXNIdTdQT3lhWmpwWDgvZEhl?=
 =?utf-8?B?Qzd6MmhWWkR0Z09ad29MMk9yUlBIeUZhVEkzZWtMT3Y3dS9hdjNxMWJDV0Fz?=
 =?utf-8?B?aGtCR0hJRkVDUndQWGpjTU9MYU1uN0t0cW1PM0JHblY4enZJVmlEK01WM1pW?=
 =?utf-8?B?NkxZZ0JHRFNlTTdLVUN2Snc5YXZLdlBHeFFDZWt4MlJoZUNTT01mQVBlZWpa?=
 =?utf-8?B?ODhYK25SYld2MCtaT1hhQXNPNnhzdklvTWkyRWx6WStpbzNwQ25SQ2QvRjcw?=
 =?utf-8?B?c213Ykp6RlZISkdzOUtGM0dwZEZ1ZE1UMXRMUjJybFpOcVJGT0RyTEs0QnRw?=
 =?utf-8?B?czA1MHdneFp4U2VaUEdBVkQ1MVdwUDUrTVFQK2dUT2UwemVQcllsSHZ5dXJZ?=
 =?utf-8?Q?fOy48x17aGTLBaMJw54cZF9Zw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 973d469e-e09e-4eae-0e35-08dd2bde24ea
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2025 10:05:25.9935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d6rG8e1WbHzpwTV6CB9ECetf2SPzM1659EOfkZP3mzhL7yaZ5M/Jj9khYaJ7R+CWSNk5C4JR55NejmtFWNthiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7199


On 02/01/2025 19:34, Stefano Stabellini wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> On Mon, 30 Dec 2024, Sergiy Kibrik wrote:
>> From: Stefano Stabellini <stefano.stabellini@amd.com>
>>
>> Extend coverage of CONFIG_MEM_ACCESS option and make the build of VM events
>> and monitoring support optional.
>> This is to reduce code size on Arm when this option isn't enabled.
>>
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>

Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

- Ayan


