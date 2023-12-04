Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3813803108
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 11:57:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646807.1009375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA6ds-00073V-M2; Mon, 04 Dec 2023 10:57:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646807.1009375; Mon, 04 Dec 2023 10:57:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA6ds-00070U-JK; Mon, 04 Dec 2023 10:57:36 +0000
Received: by outflank-mailman (input) for mailman id 646807;
 Mon, 04 Dec 2023 10:57:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CG6/=HP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1rA6dr-00070O-W1
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 10:57:36 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2062d.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ecd6b4c7-9293-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 11:57:33 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAWPR04MB9838.eurprd04.prod.outlook.com (2603:10a6:102:380::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.23; Mon, 4 Dec
 2023 10:57:29 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.022; Mon, 4 Dec 2023
 10:57:29 +0000
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
X-Inumbo-ID: ecd6b4c7-9293-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e8oMZOXAoTL8Rff217DFCdyWXpxVXoR4eE2aWv1EvBFCNtrjYwdZKDh1/gvzcaBkU49CPOighQOg5kvsxnG7/LY7sVEQddpXFRttgDdBYmJOo7oZYEVSrjhlVVsuSgDAqAlA2eGIpKYTBMlTVkHEcWlpqTNThqswP9QaON80aNr0cNYf1PG0k+QK4oc3d3dYSOjPIme7iaBVZiPC+SiFZaCmbxPTJRIAlL630Ob75HDLs845m3ST2PtL57biS/t2DdYNxdk0jPxeA1MXnhmuz3Dtp2ITfEVu8fo1ca+aOGb6+U2KUn3f6a4d8KQ03BHiKXWiMgjFC4QDYGb6lAen4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H6NNk+ncqrLCgyBB/OupLtQMaU3c0uRAHuTLc94F7Cc=;
 b=bZD4OjR1AKOJvKIcOuipP/c21Q9wVsU5YwDxMsVAqTE2tNWVqn5Mrhen2HCvinVIXkf3m+4lqoJfT+amaiouPwUeJGhmTmWqg3AZF5q2u5NlwWCvU+OudEvOZhcn0kBdD4j4aYv8QjpET1z3WARj3TAluPEwbPfu4V29Ozz+1Ot/NKi/gIJ/Q/0MejcUmrLk/GMfI4C7UOIJ8K8jhzFX2FDe0iEJS72wWXM45i85cq/RcZhUKSCx6syTd55uqpThbE7erxtnavEcWKzVGrmaFgSxIEe1fEXj5TCPqH9kGZfBo8S85ffNM2FmCqmwNcQCOyY6RGqFdNKgG+UiD0Soog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H6NNk+ncqrLCgyBB/OupLtQMaU3c0uRAHuTLc94F7Cc=;
 b=VT0XpVG/A5/0T1fVaXWNq4Fiw16+D78e3u2nqt6E6ObMcngdD3+KGpmrtj/OYsSe0k1UNcCPfSRc+1zGGTLEczou2Eycumvo+NXPR8OBBdn4wbX2om3GSRK3uGuzMQ68vNgrt+cHsy3zk01ZcQ3hE5ADmKPjwSHUxlpEe5ptq7F6ftfxrDCp6l5rlRJhTP8MEz+b5Yg1PCHvM1U6p143LL6Wl6IdF7IwR5mDJVDiwV6Q7s+Hf54upZRKsh7XtgyE7R5xcg1vciQ2k6/XADQJalZnkLO0bpODoWKnB8XGQMDYnBR+wyz5YnVCyRct556nxDHJUTqim70CAlI0/r8d5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2b59a3a2-d2f3-4d29-ab40-3f630fd497fe@suse.com>
Date: Mon, 4 Dec 2023 11:57:30 +0100
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 =?UTF-8?Q?Ren=C3=A9_Winther_H=C3=B8jgaard?= <renewin@proton.me>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] sched: correct sched_move_domain()'s cleanup path
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0021.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAWPR04MB9838:EE_
X-MS-Office365-Filtering-Correlation-Id: 04310738-b8cb-47c8-f11d-08dbf4b7cf16
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	45WPzafDx1skEXsMnTc5DzaQ7KoyZXcvISlyWPB0wctSD9MJ7XoaVa0htITjRUmUPZsGaZV60ogY1FeyR9cznoa7YSHp9mnm2nJXr7mVqKrSf+7+wOOhwfibzyZJOrBRES+nAhVNBNigucHghDEuMqQlIg7WSHGzbj+CLayJiKcxa9h4zkQ7klnctdPdIOSj8OOjC9PJLL4FS7XObJp+IQb0Gj2vRBqPia0+wHc3w4bNVDosoY78VAtlaW16rE1tNgw+jQu8JUO2VdxUUeOMI0/EzDWJP95HvOvLWE+oiEFILJpkw1Hbwi9cDlK63EfjEBAhe0bOp+xpY4PCIXLpc6IafNuVN08lIfBPIsjE53FpoghACDssiBN2HtIvougqRkApqUUnnPsPIW19oyaD3aYuKgueTPnnK/eul1v1Nd6KEc3YJMpLHIuTWGSi2zEySgfGH4Da/HiP1hhozg/Ca/ijAA7BLHm8gPc52OnZJEXeAce5l+eQf8Zekd86hEkhZPsalZIefmmap+cITpGxXc8opc9jna9s+Cwgu5+oqB9+rZFlamQXpn4+3VNtkmzPyZ99OUoR9TyhaC8Vbtz1c8RJUEoNR8/0/m9IsS/GIfft4OJVe4aC63vKBns02b9NWiVvux4VcFI4/XnCWJMmIw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(376002)(136003)(346002)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(4744005)(5660300002)(31686004)(54906003)(316002)(4326008)(66946007)(66556008)(66476007)(6916009)(38100700002)(41300700001)(2616005)(26005)(8676002)(31696002)(8936002)(36756003)(86362001)(6666004)(6486002)(2906002)(6512007)(6506007)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVd2bmNsV1B4SUdvRG84ODZTVHVKWGtOWVZPMWpyQ0k1dzhtemVhT2ZkMUtH?=
 =?utf-8?B?R0pIb0hObmt1OEdYYi84Y1NNNHZ2bm94cStLekt3NG9UZEZyV1RoWkREUWRP?=
 =?utf-8?B?dnhSU3MzUDZjUktXaXJRUllpbzh2dVluTUJLeHNaU1ZCRUg1djFSUitGY0sw?=
 =?utf-8?B?ZFRJRENXZGQ3TnVYamllR0sxQjFoN09WcGU0cGd1ZDVnZmNwU0hCRi9xb1lt?=
 =?utf-8?B?Mmg4aGk1RE5NUTdza3NKeXV3cFdva1RjUzBnbDVta0oydjBPVjA3Z3NjanRj?=
 =?utf-8?B?VXN3TGpDUzVHQW9qaG9YN0RzRlRaS2hNVmFWWmNCRkR4YW9MbnhtWkQrbkFF?=
 =?utf-8?B?T2tmUHNjb2F6RktmOVdPOUhaWnRaZldOTVMrUmZuV2hMbVFGQSsvM09obitS?=
 =?utf-8?B?TE1la2Y5elZBWkFnZE1pV2ZoLzVxZjVpeEZEd2JSSnk3bk5aLzZyaFJCUThM?=
 =?utf-8?B?ZnZuY0ZKRVdmdmNieGdRbmFrOW9udGZUT2I1UHRqSXZHZ0tMOVdFQW41ek93?=
 =?utf-8?B?SHhLcG5FNGQ4MEQra2EyOEx6aVhveFNYRXptNGVQY1ExOWk5NldNRzFGbUo4?=
 =?utf-8?B?a25zcE9zbjZiek02NW1zOGJNbmhCaGFWWThlRTZ1SytwcHFMNWZ5UnNRUlNF?=
 =?utf-8?B?S0c4elJMQnZzR1p0NlQyVU5qdTdvSGp1WU93VDd3Y3BjcnBxWXozOHZxV3Nr?=
 =?utf-8?B?Um1McTZFcW9FbDJNb25aQnVUNmtTUmNsUm5iYnBwVlphbEdKZS9BS2cya2Vw?=
 =?utf-8?B?Q2Y5TkpHT0s1bGZSZFJGWHFPWndwQjBVb0NWNUlOdHB5N0tCM3JIVGRlUy96?=
 =?utf-8?B?UFJnOHo0Qi9SYU1GcURKM3pMaFdqMythUE5ZZUZPNENSM0ZhbElpR3hXd00y?=
 =?utf-8?B?SHBjMFV3R0dQWTI5TDZlZFp1Z2EvQ0RtNENSSUZoN05hSkxiUlg5NG55TGFn?=
 =?utf-8?B?QUFrcE1BeUxvL2VacDlSdEdBK2Nqc3l2QTdaRVprSXhUZzJydm16SUoyUHl3?=
 =?utf-8?B?UFNxdjNGUC82ek5JUzFaSTdUcjcwMU1nNi9ybEJVOW5vdHdCK1B6S1FpSmhz?=
 =?utf-8?B?NTdINnBsY1RnQm96TVAyNTRGWE1EVkM1Nnd5a05kWWN3Q0dLV2RwNHNPTWRU?=
 =?utf-8?B?WEFvWk9aN01NVkt5QTQ1ZHgxRlY2R3hpS3ZnKzd3WDJETmd3VDVFL1RIemlK?=
 =?utf-8?B?amRORlROOHJyZ3hQZGU0SEtBU05LZ1oxZVo0TVdlN0wwanNianNDOTJQSW54?=
 =?utf-8?B?SllmZjdvMG9WK3pvWmZ1aCtWSlRDT3BaT1lXcUpjNjJkcXljaUhxL0xJbnN0?=
 =?utf-8?B?OVZFdlQ2OHVIbFVTYlNLejIxMVkzOHJsNHB5UVBlTUt2elRVMU5lMWtWcWM1?=
 =?utf-8?B?N3dCa1lqV0tXTzd2cWloYWM1RVU1WnNTbjQrdXpSMG9JRXVRMkVMVDdNL0hl?=
 =?utf-8?B?WWpvNGRzM1l4SFdVWjNkNTdKVWIvV1dSU3NURHQzU1B0NWltUkVBUjhocXox?=
 =?utf-8?B?SjBZcmFIL1I4eWFERUVVRFN1Zi9wU2xWYW1NdTlUNHlqWHRvZmdoTDc1ejJD?=
 =?utf-8?B?YUFaQzdGcm5RZUc1VktjS3hQWnFTVk43NnNYTk1IM3BrVHNndy9WZ3Z6OXdy?=
 =?utf-8?B?Vk1uelhQZnVQdVU0VUFNc242ZTVjOVlCVmlLUGs5QlRjd2taK3o1Nndkb09Y?=
 =?utf-8?B?UUJUWmhxcFBvYXJCR0ZreGxlMnRIWjBVRHZnb2F4cE12OXhMam1hUXpaOUNX?=
 =?utf-8?B?YlVUV2MzcFRNYk83U1VjaGFaZFEwckpKSjdNSlBJRUM3Q3NZbEhQcW5HaHI4?=
 =?utf-8?B?T1F4QnV0bW9FZmJXTzNZL2taeUNQTkx4UlFhekdaSG54UHZENVB3MnZ3WTds?=
 =?utf-8?B?MmRNYWpnTXRNSnE1a3ptcHhLNlNYbkFwNEZRK3lMM2dVbkY3THZtckZCWXc5?=
 =?utf-8?B?OWd2ZkNGZDRvc0NtemhLL3AvbjJqRG1tSXh0dnNKOGttRVBDeGtIUm55T05n?=
 =?utf-8?B?WmZKdXA3K0Fad1Q3UHZ3dWgrVy9IZ3g2ZjBVbHZPM1hieEFrSkU0ZjBtTmQx?=
 =?utf-8?B?ZUMzVDZMSE9oUUx4UjZRWXVic2pYaWpZYkRjaHFLZTZIYUFVeVRzRDJYclFE?=
 =?utf-8?Q?RFuf1mmQs1YyQY/wyUF1ynHLm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04310738-b8cb-47c8-f11d-08dbf4b7cf16
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 10:57:29.5766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WiFCBcDk0YOiQkFBHIJB3bph9Fl6T+/Ut1ri00MZXGzTU4ED6FCIZpvdKZERMxiAlf0vTFBgM+VUOO+6QFn0Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9838

It is only in the error case that we want to clean up the new pool's
scheduler data; in the success case it's rather the old scheduler's
data which needs cleaning up.

Reported-by: René Winther Højgaard <renewin@proton.me>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Juergen Gross <jgross@suse.com>

--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -810,7 +810,7 @@ int sched_move_domain(struct domain *d,
     for ( unit = old_units; unit; )
     {
         if ( unit->priv )
-            sched_free_udata(c->sched, unit->priv);
+            sched_free_udata(ret ? c->sched : old_ops, unit->priv);
         old_unit = unit;
         unit = unit->next_in_list;
         xfree(old_unit);

