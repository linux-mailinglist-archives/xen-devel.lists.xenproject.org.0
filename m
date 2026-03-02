Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFWlEVC9pWn8FQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 17:39:44 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A73261DD0C3
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 17:39:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244477.1543933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx6Iv-0001dN-4w; Mon, 02 Mar 2026 16:39:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244477.1543933; Mon, 02 Mar 2026 16:39:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx6Iv-0001aV-25; Mon, 02 Mar 2026 16:39:33 +0000
Received: by outflank-mailman (input) for mailman id 1244477;
 Mon, 02 Mar 2026 16:39:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OlTG=BC=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vx6It-0001aN-Ac
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2026 16:39:31 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f070e6a-1656-11f1-9ccf-f158ae23cfc8;
 Mon, 02 Mar 2026 17:39:25 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA5PR03MB989110.namprd03.prod.outlook.com (2603:10b6:806:4d6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Mon, 2 Mar
 2026 16:39:15 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 16:39:15 +0000
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
X-Inumbo-ID: 5f070e6a-1656-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aDfFntt/dFAH6wPBjAwQGqlecmvaJvIrGm/Ncgm6du8yNL4SSBWA9ASmhU7jUmOouZELxd1qVIbvaAk9sTsS8YH6czhKTPpTVomYV8KR9iipOLsY2ZkNQWNGcPs0VIdhU8rawlNGc9SbUD917g1tWb6rXuUffVfmDQTyAwiXiFnFkIJupBOfAlZ+2smwtxaV/lgUK1Iok5twHITtNiQJdNNkCwG7+6UuuOq8oqde5jnMcV9RX5ap1OLnHwCD6lzZb/ZjPMh1cKrlKBai53bYVNyNSSbY0J6DEufO0kRzDiWnw+0hmV1SsCq8LWEwMBQDq9VvHZrIcQLskKWWx53j+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ZAGbleNAGsLGpujOu2E+DZhVBBMKqRjOv3fR+dtsqo=;
 b=Rvef9ZITNx8HSH+ydxbm8crZi54ClOJIILXNs/eAVySMCWDJ1rthEnXajTxBlirHXM5jBOQ/7iOeVpWXtL5kB1aC6Q+w5hMb/nw27VlXbZpp7ICvror1iKp7GgL+G5bpWkWLQNXDdN1GxM5G5FvWlH4SK+2tU9TmG4AyvhExGGUFkwxu1gX/hgOqekO1eEDGx/FTUar6x39QefTPO5Ogd36OFzY3JCWkR9XXOfbu33/i3i8tDwrq3ReE3rF7p4hD6JMfnkkHXUuIHeADalwzIx4euEMkRswlCkkJ1kDeEcywJOK3S9J3bjmZmywsL+/V4wcMGHpkPbhD7BWKDVuatw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ZAGbleNAGsLGpujOu2E+DZhVBBMKqRjOv3fR+dtsqo=;
 b=T4152G9dOEr8SJGg5wFp6d1ssrVyP9cWAsf/PdcIY5EE3M9mre4yvDqVfHjmo45e7aG9VNyCJsosu6FACEm7GNFt0E40tg68Js3nX4ZyJGDNOTdjO5JkgfbXU6FMK1dmzTYLt4TL0+dZyARO22S0uiTwr7BWHS5bQzbJNrBAm/M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e6f7e988-f5c4-413c-bc44-4e1949c05821@citrix.com>
Date: Mon, 2 Mar 2026 16:39:12 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 01/14] x86/pv: Don't assume that INT $imm8 instructions
 are two bytes long
To: Jan Beulich <jbeulich@suse.com>
References: <20260227231636.3955109-1-andrew.cooper3@citrix.com>
 <20260227231636.3955109-2-andrew.cooper3@citrix.com>
 <bf83838a-8401-4eb7-aea8-25ce59c9d492@suse.com>
 <c8013b73-de27-4354-9e45-da7d47c8b190@citrix.com>
 <f11e7bbc-3bb4-497a-a189-5e4d27e5aeb9@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <f11e7bbc-3bb4-497a-a189-5e4d27e5aeb9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0534.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::19) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA5PR03MB989110:EE_
X-MS-Office365-Filtering-Correlation-Id: b9bf0bdc-085f-4a65-edaf-08de787a3df3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	SYmyP750UB3I4uV/tt0FmMirshYbKZgX/0IV+h4cbiyOdRi3ci2RJv3Y2H9cxLsjVGFwzE50uzttEUlTCgNAD7XO/C2Phi+q1Kq5DG0wby8XyNlLDCHz0T6qMg+Zc+Wr0K6Vmj7v5XQo1p+lTGrKqLuRrXE7i+pUoGCexG8J8ZE1hZO+dssAQX2zctITY3lJZn4X6RZoi5l2z/uV90BtHvbs68ndHnPU1U1CasOkiNEGxQgEDiUdiJIY7Dz73vCBEen2uM4HG5brMg8ZIn2DO/jlxW4BbVh3z3gtd1sH9Ctllu5UTlVNUn5hiQVsZ6f7LCrahHUERHWenJx0Iv0s7K1Xv5hokhjljzLJ6+pxih10MHOQCqZ8ndsPoaEg3Wy+5hbjtup0+qVaJXF68gVn3SkRSivsmeSwWLhZRztMF04VpQwK/QbCdAhhbmMn6reyyGk7gzEHeC5HlFFNpDf/5pGGs8QMugc6n+hNONQucbOm4sAo+/TeUUh3r/PR4fI7qNbCXaZbxzOm73hnmJo8+wk+6cCR11pRDH9l1HZcqMm1pyHatg9qW+HFJEQZYV3ERi/OaaOC7WOmiwOqRnWEIBlH54mFWy2TNICDlwpgdi1Fmr5adAA9RNrwESC86KCoobN89GuLZMSLnVnue4MvdWuPRk+0Kz015HcyPdM/qesPkCmOt9WAdEBKH0crZ9XxundfXVtH8tJjKNjkuoQ5llBXyaP8qOU0U0ixCPIq1dQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkZHeHh0dCtVc2ZITVVpZ3VtaDN4eGNyVUZNbXVaQWh3Vm9SQThMUmZvZkV0?=
 =?utf-8?B?OTJOVWpYWEhVSlFIRkl6b2wyaktoKzNnUE5wVlQrOGUwemkvVDZoK3JTdElQ?=
 =?utf-8?B?aTU0enZ6QWNCUmRRb25ndkFvZDJRdkhkYitjeHpacTZMN0NGTkhCSVk5Q05Z?=
 =?utf-8?B?MUV6K2x0akpzdmx3bzVoU3FQUWtxT2gzWWh0bjc0bmRzQlhhYzRKaXpsNzNY?=
 =?utf-8?B?bFgwRDFDeTJZNnNEVDUxYXRNdzRSL1JPRUVnU3Y5SVdna3QzU2ZwMDBZWGlS?=
 =?utf-8?B?eSs5VXdCRGtWRFI0dksreTZYRURCNkg1K1IvRjV1cHpCdnBjUTVFL1RsTk9v?=
 =?utf-8?B?SWo0VEkyQTdDaUd6U0UvZ0JRK2FnWFljYVEvQ011THE4cjFlTUVabHpiN1hm?=
 =?utf-8?B?Z09rTXFXWkwvYVFvVkpEL09weHN1eWFCNHBkWGp1TlY1STc5dmgwRFhyRk4w?=
 =?utf-8?B?Rm8yd3NHczFBZnFXajYzbzNCM2JRK1BzT0dBNkk1UTlPWTVSeVIvaGg3Q3c1?=
 =?utf-8?B?K2F0VjcvN29OaWFtQ2ZqcmNSUkNiUlZseWlzVTBteDFCY21yMjMrVHpFb1dq?=
 =?utf-8?B?RGpNekNpSTZQU1Q2cU1PVU4yQk1lb3NUV2lwZVNXR2k4V3lDZkE4T1ZzUUZI?=
 =?utf-8?B?akRPZkttcW1SYWFpUGFINUo3OXZ2Z0pwcHFRT1JsNEhjMkcxS2VuakFGb056?=
 =?utf-8?B?Z3ZEVDhaRUNpZzhNTnhuRWN3OUFuV0E3Y09xR0d3R09qQmYvWnVESkdlYkVI?=
 =?utf-8?B?YVZ2WG9aYURYZzduZEszdmdKUkdQRFhVeldBVCtTVWUrVHNNOGY2Wk5sajMz?=
 =?utf-8?B?TitManFwcm04b2NRc2h6dVFxQ0R2dXZBOFY2WGg2Yk1XTkt4UGpnemJZUTR0?=
 =?utf-8?B?MTVIWjFINHlRbDlEU25GM3gvZnB2TVl6aVhMVHhicThqdVMwd2grT2RQc2Mz?=
 =?utf-8?B?NGFOODk5aVJiSTV3MVp0c0FWTjJZWVdZcEFkQXJPQ3pOaXRkK0ZIcUNqOXVR?=
 =?utf-8?B?M2c1NzJZTGpRbEpVeVVKNWtXNDAxcWZLczlHc1VkZmVqbTRsS0ZKTHJtdDA1?=
 =?utf-8?B?aHRaN2wzR1ljMWQ0Y2Qrb0pRbExBNmFzaDVzaTh3VlQ5VkhJUGVzMWJFR3JB?=
 =?utf-8?B?RGlMVFJVd2Y0K2gwUExFbTNKcFBNMXkzOFNBbC96T3ArYXR6OElWeTREM2xI?=
 =?utf-8?B?cDNycWEvVE8wMXltSlptaStwWDdxTFp4NnpXNjNCU0FicXc2MEQ3a1ZsclQ5?=
 =?utf-8?B?YmJlejFxTjhFcmNzbXZwQ2hrcHlsTnhlNUxDL09FZS9KTnFrakI0K1FjNTdX?=
 =?utf-8?B?NGtveDd5a0xKKzE3UFduemhaV2ltT2g2MkMxS2k3K0pwcTdhOGRzcnZwNnNP?=
 =?utf-8?B?a2JCck9mQWFxTC92L0FaY3pHNUs2a1A3ei94aUZvc25YV3V1L3Bma3UyVWVN?=
 =?utf-8?B?KzYwNi90d2gvOHVtNk1jL3paUlNRdjF1SXJnWXdEQlRmRXRmWXdlN2w1dUta?=
 =?utf-8?B?T3R3T2UwSzRzRlRvenQxVi9lRDRPZk1IRFc3OTJ2eW1aN1M1K3VlRGt5em1u?=
 =?utf-8?B?bTlGajNHQ1F1d0E2WVlnc2o0QlRxMVdPbktVOG0wRjdNN0FiVnlvSm1IaVNQ?=
 =?utf-8?B?TGwwT3ZWdWpPbXFOVWtTUDJNV3Q2alBiSktqN0d2bk1qM05kVXVVQUxoUXRs?=
 =?utf-8?B?eHMzUmJ3WjF1bEpEdXFIQXV0RStmeE5kU0ZQTG9qVGpjVGw1SDhPSzVDcy9M?=
 =?utf-8?B?aGVNd0pGV3F4K3NhSkVnQ3pFeEZocGZSemNCdGZNdUxOTUpUL1NndFZzdklB?=
 =?utf-8?B?OWxPWTBpaTYwcHFjS2dwZnQrSnA2dE5UZXhpQVNQTWpSV00xTXlGdVJKTTRR?=
 =?utf-8?B?OXNaNTFhbUQyWCt0eHdoYysvOFlWQ3NQU0xaRlFXK04wNE5COTRoRDBhZW1i?=
 =?utf-8?B?YXlZQnludjBwd0Z0VnlJdU1SMjRZVnYxTW03bUhkNEtTalY4bWJPaTcyazBn?=
 =?utf-8?B?VmlDTCtMMzdJVC9SWDFHaloveFdOdWNmMFRISlNUbnJ0Wkw2YzVhbmN3dk9V?=
 =?utf-8?B?VU84bUhhM0dxdkNndmw1TmpRRkhIUndtYzFHbEYxcThBQjVHa2l3eDlKeVdF?=
 =?utf-8?B?aDQ4Y214cEg0Yk94NENJSWNBeEZLTUd6Y2UvV2Z0bXR3ZG9RWHZUQ2JXWHdO?=
 =?utf-8?B?SGM5NGE0VnJZRGhLaHFTTnQ5REQ4QXk3UlZ0TCsxS041NHZjTGM3eDBuaHIv?=
 =?utf-8?B?QW9TZjlVc0RISjQzR2pUVnBtbGd6aWhoaklHczJIajlTd202UjVxUmZrQlBR?=
 =?utf-8?B?UjNBTGhaRDJrZ29PQnVvMVlheFpyRHI5OFpzemFjZUxWRDNQVzBGdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9bf0bdc-085f-4a65-edaf-08de787a3df3
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 16:39:15.4800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eMUzYn7lELLhxYwqwNsLnwqiyhSIhd1zlNzUAt2PacSfzrOJyIPhdJYeLzS3q71HLXfIG3YCN6BbLjMhS3CTImVwnvAqJdpXfW5zzKLD8Lg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PR03MB989110
X-Rspamd-Queue-Id: A73261DD0C3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	SUBJECT_HAS_CURRENCY(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 02/03/2026 12:57 pm, Jan Beulich wrote:
> On 02.03.2026 12:43, Andrew Cooper wrote:
>> On 02/03/2026 11:03 am, Jan Beulich wrote:
>>> On 28.02.2026 00:16, Andrew Cooper wrote:
>>>> @@ -1401,6 +1402,53 @@ int pv_emulate_privileged_op(struct cpu_user_regs *regs)
>>>>      return 0;
>>>>  }
>>>>  
>>>> +/*
>>>> + * Hardware already decoded the INT $N instruction and determinted that there
>>>> + * was a DPL issue, hence the #GP.  Xen has already determined that the guest
>>>> + * kernel has permitted this software interrupt.
>>>> + *
>>>> + * All that is needed is the instruction length, to turn the fault into a
>>>> + * trap.  All errors are turned back into the original #GP, as that's the
>>>> + * action that really happened.
>>>> + */
>>>> +void pv_emulate_sw_interrupt(struct cpu_user_regs *regs)
>>>> +{
>>>> +    struct vcpu *curr = current;
>>>> +    struct domain *currd = curr->domain;
>>>> +    struct priv_op_ctxt ctxt = {
>>>> +        .ctxt.regs = regs,
>>>> +        .ctxt.lma = !is_pv_32bit_domain(currd),
>>> The difference may not be overly significant here, but 64-bit guests can run
>>> 32-bit code, so setting .lma seems wrong in that case. As it ought to be
>>> largely benign, perhaps to code could even be left as is, just with a comment
>>> to clarify things?
>> LMA must be set for a 64bit guest.  Are you confusing it with %cs.l ?
> Indeed I am, sorry.
>
>>>> +    struct x86_emulate_state *state;
>>>> +    uint8_t vector = regs->error_code >> 3;
>>>> +    unsigned int len, ar;
>>>> +
>>>> +    if ( !pv_emul_read_descriptor(regs->cs, curr, &ctxt.cs.base,
>>>> +                                  &ctxt.cs.limit, &ar, 1) ||
>>>> +         !(ar & _SEGMENT_S) ||
>>>> +         !(ar & _SEGMENT_P) ||
>>>> +         !(ar & _SEGMENT_CODE) )
>>>> +        goto error;
>>>> +
>>>> +    state = x86_decode_insn(&ctxt.ctxt, insn_fetch);
>>>> +    if ( IS_ERR_OR_NULL(state) )
>>>> +        goto error;
>>>> +
>>>> +    len = x86_insn_length(state, &ctxt.ctxt);
>>>> +    x86_emulate_free_state(state);
>>>> +
>>>> +    /* Note: Checked slightly late to simplify 'state' handling. */
>>>> +    if ( ctxt.ctxt.opcode != 0xcd /* INT $imm8 */ )
>>>> +        goto error;
>>>> +
>>>> +    regs->rip += len;
>>>> +    pv_inject_sw_interrupt(vector);
>>>> +    return;
>>>> +
>>>> + error:
>>>> +    pv_inject_hw_exception(X86_EXC_GP, regs->entry_vector);
>>> DYM regs->error_code here?
>> Oh.  I'm sure I fixed this bug already.  I wonder where the fix got lost.
>>
>> Yes, it should be regs->error_code.
> Then (plus with my confusion above sorted)
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
>>>  Might it alternatively make sense to return a
>>> boolean here, for ...
>>>
>>>> --- a/xen/arch/x86/traps.c
>>>> +++ b/xen/arch/x86/traps.c
>>>> @@ -1379,8 +1379,7 @@ void do_general_protection(struct cpu_user_regs *regs)
>>>>  
>>>>          if ( permit_softint(TI_GET_DPL(ti), v, regs) )
>>>>          {
>>>> -            regs->rip += 2;
>>>> -            pv_inject_sw_interrupt(vector);
>>>> +            pv_emulate_sw_interrupt(regs);
>>>>              return;
>>> ... the return here to become conditional, leveraging the #GP injection at
>>> the bottom of this function?
>> To make this bool, I need to insert a new label into the function.
> Why would that be? Simply skipping the return and falling through will do,
> afaics.
>
>>   I
>> considered that, but delayed it.  do_general_protection() wants a lot
>> more cleaning up than just this, and proportionability is a concern.
> Whatever you exactly mean with this.

Hmm.  That was supposed to say backportability, but I have no idea how
ended up like that.

The other advantage of being void functions is that they can be tailcalled.


Anyway, I have a plan for cleanup once FRED is settled, which looks a
little like this:

handle_GP_IDT()
    if ( guest_regs() )
        return handle_GP_guest()
    else
        return handle_GP_xen()

handle_GP_guest()
    ...

handle_GP_xen()
    ...

where the two FRED entrypoints can now call the context-specific
function rather than the generic one.

This does involve duplicating the X86_XEC_EXT check which is the only
common aspect in the #GP handler.  Next I need to figure out whether the
other handlers can be rearranged similarly.

~Andrew

