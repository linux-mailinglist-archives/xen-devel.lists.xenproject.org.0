Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E84947DEE9C
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 10:06:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626787.977349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyTeb-00024r-Q5; Thu, 02 Nov 2023 09:06:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626787.977349; Thu, 02 Nov 2023 09:06:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyTeb-00022m-Mt; Thu, 02 Nov 2023 09:06:17 +0000
Received: by outflank-mailman (input) for mailman id 626787;
 Thu, 02 Nov 2023 09:06:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5SK+=GP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qyTea-00022e-MR
 for xen-devel@lists.xenproject.org; Thu, 02 Nov 2023 09:06:16 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20604.outbound.protection.outlook.com
 [2a01:111:f400:fe13::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 131dbb0b-795f-11ee-9b0e-b553b5be7939;
 Thu, 02 Nov 2023 10:06:14 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB9093.eurprd04.prod.outlook.com (2603:10a6:20b:444::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.10; Thu, 2 Nov
 2023 09:06:12 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.019; Thu, 2 Nov 2023
 09:06:12 +0000
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
X-Inumbo-ID: 131dbb0b-795f-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OkTeA9h9C3/8zEBw6JehR+IU9JzTyznQMUunwvjzNoSXDIkqTuQbCOJnSYXUvX2LRJUA62ucze0kiVIgk6wkayaHw7+3OBW+nUZpr4zN/cLIk4kUsMn7InaBhYhQbdY1BGkoFZ7szFhGy27/kl38ANelkyOn1mLvx85czIeW7TKDPx/BVGP2XzNLpKOJF3HFjbviQqXbKlL7ce7m8Zd8xfCNJ2YAbwUV86sPd/lXZuQARMjG6NxQVlvWpqVOrDaAok/5xiKeen5/nmp3Z+IB+Zg28s0TgWyuvMHuHmk79T9phssfIvUV9sjhLpbRDUkF8U0I6BgNpLhm/XFLwFwpnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+EQxsmFVWlqiyl3Fyp0L0HCQ1p5H1CrT5IXWVocnuT8=;
 b=T+HC7NH1T7tOp+RNpbcbR1nLvOcGTfg3jHvJ4ATx2Trw+z6zyRZ2MV+70Bifcm01Xf5GEK4LHix2b+kDD+uaU68zA72sRtDx6bFNZ6BeU/KoddhPfxYsq68bhf2hg5Y5m1xeUT471YR/CFSlCFgjuH/Jgb+0sMllZHyoSsK8cMPYp3VNSKMOldP7VWm6yXu4Bp8uqoX834GbYeE55DfGxhLE8Vl0+r2Vnj/k4NYGMB9r1MRL4/QdmV8Lnvn03c7VEl/iGK9QbCnXAcWyBOBlmibqWNS/16yJUntWQ/OnaX4A12SnMuM3XxQOz4h3qtBcScbOeQUGgNd8/yleWiMhQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+EQxsmFVWlqiyl3Fyp0L0HCQ1p5H1CrT5IXWVocnuT8=;
 b=1Ox6PsR8mVq23Kc6t4uxsSMhj55e9YMKi/wL0ww/u/Qn/BgO4rVPCJgFQwMFuMMSYd5sOFPsQAPPibDBuGZOd5pH2zj3jRBuxzAP3y79SRig3/C3D1wTLF9G7aBten2iKqT8lRQThpAbN/zMGGiKeVTvhZLqfeuyRpLTQ/Oe3oll1dJiCGCJgOrYPa+mROSzjuCIb7GBzDgSGhdtMgfRUf+0sYYxrGcckbEZAtiUxuIAnBGCUcSt1k6eeVW3EA9YKmVbnGar8cxI/nNze3QLFjvVAy8WtRxIos1nCXmXIhuDWa7svx7iS5DonhzOFF01dETdpgtGMKrCsmc46T9fwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e4f007b3-4dd7-0509-1d37-e94a223f7008@suse.com>
Date: Thu, 2 Nov 2023 10:06:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/2] x86/vmx: Disallow the use of inactivity states
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Reima ISHII <ishiir@g.ecc.u-tokyo.ac.jp>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Takahiro Shinagawa <shina@ecc.u-tokyo.ac.jp>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20231101192058.3419310-1-andrew.cooper3@citrix.com>
 <20231101192058.3419310-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20231101192058.3419310-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0090.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB9093:EE_
X-MS-Office365-Filtering-Correlation-Id: fe95d3db-9ea0-45fe-d8d5-08dbdb82f611
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nNBB/pFIMmpfCSYdP6CtzXh5y0/0RfBUVTnyyvOjb+9/cX6ZuMF8vV+EjtJcgG7w9sB+MlW9F00nvBTx7EkyNMv+xHrXImrjmJjGGKxNt55JX30ArtK2dAFdQ7+cxq6UMSVqVGNTTTe5d7QZ0gB+TKRsanTUjOiEoRUOaeTK6NbSPIrFlT5QbO5C58aRXVo+9rtk/GUuAuEItSJ8/2YL2UXK+u3P1qpp0JnOU5/ZmtNchNz6/o/xD+2vRhd51a8tir6+E+6yemGMzeb9MggAHlscwTxu/9NxpHSRdmJ0fE1cyeWmv7Ig1ok/8iCozy7a+VzFL6kjUGFdux5C1b2+XL1AkLKcQ0UIv3FnPssjyJj5cmk8ndOQ9dsLormXYul2gAjkgUV0TJYtrEbrIPnsg1/0vHlvHouHj5Vl8Og9qoC5PJ5CeOkFOLZI8ah62NH5ilR8Xgthmxxsi+5zqOsGKtebGb0ZjeYjrPDWcurQp3pfJ1yOLwdfoJapNkcGRJb+UIGCo6TnwbNPYD+p2bUqJgiGX8l0qrkN7/BRnzfbohnAl9FLpgc3+zm5Lv5oM6Qrd1e8YShsA0R91jcl3PiQIZRZHVDwiMqQeW1/18Ia1nShPYP0ww/eaY8RHk/1ZRJFC0LDaDQCqnNGeXitfqsEnw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(396003)(136003)(366004)(39860400002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(53546011)(83380400001)(38100700002)(31686004)(2616005)(5660300002)(6486002)(86362001)(4326008)(8936002)(8676002)(41300700001)(31696002)(2906002)(6506007)(6512007)(54906003)(66556008)(316002)(6916009)(66946007)(478600001)(66476007)(36756003)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aDRvaDBMdVFiUWZnV00rYm85R21zVjQvWUpwelNLMkFVUVlGNnVMaFlIdXdV?=
 =?utf-8?B?clFwbHVwbEFUNFVBV1lhV2FzSi9QZXRydElNMktrMEYvcGp4VWwzdDVBb3Fr?=
 =?utf-8?B?a3IvNFk1eEFiZUxuZGtaNlVPNjQrRGRFUkFEK3hjakpaRXlVclowMUJpdHZ5?=
 =?utf-8?B?NWVWMW1QYkdBek5HVFpuN1pJRmRDMTg3VkxWdFZQVUdHSS94dFo3ZFljaXFy?=
 =?utf-8?B?NnBncDdjeHdPRFM4TThjRnJTTnd1SFRQQWM4OUt2VFgva1VGYUJJeWlQWDhM?=
 =?utf-8?B?dm5QZXRDME5DN0pqNHFuaFpEYmpNMWQ5dHduWUYrZFJLcDNqZXVaL3RpN2RF?=
 =?utf-8?B?ZHFzaG5XWlpCUHBZbitZSlk3Y1hUa2ZwNHhobHoyM3QzRUl0RVAxcGlBRjVE?=
 =?utf-8?B?blBNamtBOS94M0VSZXltRWNOQzg1UHEvd1B5eEtDNWQxTWRhblhSQkJ5aWp0?=
 =?utf-8?B?NXlPemVSZ0NpeGlOdWVLR1djdDJoY0JGcnlTaUlmU09CWlhqeDh0T3YvelR4?=
 =?utf-8?B?b1NkQUNJT04zTzFqRmlyOTQ5Nlp1RkxLeHI3SSt4WmFqWHNURmJkNGlGdnhs?=
 =?utf-8?B?VFJyNEkzZ1g3b05Xd1JWL3ZDaFJ3U014K0l1clRlVkFjYXE4eEpUYTRaNmFI?=
 =?utf-8?B?aGpkbzFybVB2cEEyblFvTjRKVE5GbTVSWXlBMzFUQWZ3MlNzUHZDeVdaQWZq?=
 =?utf-8?B?QmxISkovYmlOZGp4M0MxSkNwdmxDbzI2dC9UaWNGcHBpbE5GK0Z2UG1ub0hD?=
 =?utf-8?B?a1cwUmxhV3FnbitUMUhMSmN5ZCtIL3RFRUtZRVdtOU9pODBMb1ZwVWxNOGdN?=
 =?utf-8?B?clpIVU1GcmxHcTNHci9GaTFnQWVYeHZpei9qa2NkSXRqajk5Sy9mUUhOWnpQ?=
 =?utf-8?B?L3lyZXpRdUVMNVR1a2k3MThFK2NPaFNDNmwyTEpNM1d2ZVd4VjBiNTZjMnI4?=
 =?utf-8?B?anVZdWI2Zi9YQ0FyK21ISGdLcnFwbzlVRHJwRzJtTXo5NlUvbkVJdUc0TE1s?=
 =?utf-8?B?bFNxUFlJcTcyYmw2cmM1R0dJMnQ0L1BlQlc1M1FiaGZWaHIzcy8vTWR0TUpW?=
 =?utf-8?B?ZURKcHUwbHFpeW5kR24ycGNUY1g1eEpDQ1Q4dFpkanBnaTBHTklFa3FaVklV?=
 =?utf-8?B?VHJhSWE2aENSQXNZSnY4ZUxGT3p3UUNGbmtsdUxKYlhuU0VMOTJIQWZ5cGZp?=
 =?utf-8?B?YnBhckJTS2QyU3RBV1FKWlJqNHNvL1JpeC92ZE1qOFVmOGV6U2JQL3JpYUc5?=
 =?utf-8?B?QTUrUms4ekF2dU5HQUFaWEdNVGhlWTZXYXZhTS9zV1N1TWhGdkxRdlNCbXln?=
 =?utf-8?B?QkhsMFQvYUduTlV5ZXlWUmVINTFBcitnMHRXOEpaQWVnMmRGa0JUR2JIb2s1?=
 =?utf-8?B?OC9MYzZsYTQ5TVJqV0VTaDBEWVBpVFZ3emYycXFDSkZwekxYV0lPdThDNTFr?=
 =?utf-8?B?TzVWMzVRazBaVVducDlwdi85WFJYQUtqV2UwUkp6aDduellicEpOV084Wk13?=
 =?utf-8?B?bTI4UTBCMmN1cUcyb2c4UzhPdm1sMFEzWENVSUp2c2xldFFldGpZcFpFRmp2?=
 =?utf-8?B?bUt3ZDdQNlViM25TcWlvSmZHNXlVS2FITXlnemlSUWdpTkpNY1BzNTZmQ1pO?=
 =?utf-8?B?OS9WMGsrYmp6bTQxUUFnazdVKzEvNURGM1dwZU5uNisraFV3c2p4S3VsbHJz?=
 =?utf-8?B?UlY2MkxIMVJQM2U3VkVwWFBZZklaNExzUVl0Qm4xQlZ3L3o1Qm9uaUt5U3lL?=
 =?utf-8?B?cGYwZ0Z5WXNXVkF3cFdmNHNJbmV2aEVvbHJzZlQxTDk5SmlBT2oxQ2JkSU0z?=
 =?utf-8?B?QWtWSGJCOTcxd0JYQlpwMkRnL0JxZWpiYmljN1psWjQvVytLRVZqb3RmdEtS?=
 =?utf-8?B?WVlyYVVRYkNQaHQrMUdQclBobVNWN1JFME13MFlVaHVHOE40L1E5RXVjUENX?=
 =?utf-8?B?YjlBQ2VoWUx0Z1hsWjFPMDFDQlBrNVlaQjAyc1JRa05qVm5oMHBvOHNmRjRC?=
 =?utf-8?B?SUFkTjdTdzh1UlFmL0pHcGJkaVRrN0c4OEtNcGRIN0NycXoveks1YllhSi8v?=
 =?utf-8?B?aHNQQVhXOExzdDJ0aFVEYU1nWDU0blQ5cXBCY09VR0JBL2hxNmVMajBreTR3?=
 =?utf-8?Q?Q1JwJTf5AWpexdUxQQVr4WQtf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe95d3db-9ea0-45fe-d8d5-08dbdb82f611
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 09:06:12.6325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AyXz+996ZvRMDNHSN0VblbAGm4X9pM9aQ5ISaQZtkui9nlJ68EidEtbwpE5mqwdLKtuEstWD+qyHOyMEf1A9aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9093

On 01.11.2023 20:20, Andrew Cooper wrote:
> Right now, vvmx will blindly copy L12's ACTIVITY_STATE into the L02 VMCS and
> enter the vCPU.  Luckily for us, nested-virt is explicitly unsupported for
> security bugs.
> 
> The inactivity states are HLT, SHUTDOWN and WAIT-FOR-SIPI, and as noted by the
> SDM in Vol3 27.7 "Special Features of VM Entry":
> 
>   If VM entry ends with the logical processor in an inactive activity state,
>   the VM entry generates any special bus cycle that is normally generated when
>   that activity state is entered from the active state.
> 
> Also,
> 
>   Some activity states unconditionally block certain events.
> 
> I.e. A VMEntry with ACTIVITY=SHUTDOWN will initiate a platform reset, while a
> VMEntry with ACTIVITY=WAIT-FOR-SIPI will really block everything other than
> SIPIs.
> 
> Both of these activity states are for the TXT ACM to use, not for regular
> hypervisors, and Xen doesn't support dropping the HLT intercept either.
> 
> There are two paths in Xen which operate on ACTIVITY_STATE.
> 
> 1) The vmx_{get,set}_nonreg_state() helpers for VM-Fork.
> 
>    As regular VMs can't use any inactivity states, this is just duplicating
>    the 0 from construct_vmcs().  Drop the field, leaving a comment as to why
>    it is skipped.
> 
> 2) Nested virt, because of ACTIVITY_STATE in vmcs_gstate_field[].
> 
>    Explicitly hide the inactivity states in the guest's view of MSR_VMX_MISC,
>    and remove ACTIVITY_STATE from vmcs_gstate_field[].
> 
>    In virtual_vmentry(), we should trigger a VMEntry failure for the use of
>    any inactivity states, but there's no support for that in the code at all
>    so leave a TODO for when we finally start working on nested-virt in
>    earnest.
> 
> Reported-by: Reima ISHII <ishiir@g.ecc.u-tokyo.ac.jp>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



