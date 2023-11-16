Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC937EE1CC
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 14:46:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634232.989623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3chg-0004Ir-Om; Thu, 16 Nov 2023 13:46:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634232.989623; Thu, 16 Nov 2023 13:46:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3chg-0004Fx-LV; Thu, 16 Nov 2023 13:46:44 +0000
Received: by outflank-mailman (input) for mailman id 634232;
 Thu, 16 Nov 2023 13:46:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r3che-0004DG-Qg
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 13:46:42 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0607.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92a08bdf-8486-11ee-98db-6d05b1d4d9a1;
 Thu, 16 Nov 2023 14:46:41 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB7181.eurprd04.prod.outlook.com (2603:10a6:800:12a::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.7; Thu, 16 Nov
 2023 13:46:38 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.019; Thu, 16 Nov 2023
 13:46:38 +0000
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
X-Inumbo-ID: 92a08bdf-8486-11ee-98db-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AGYX+/Qdu73ErPenOXphgWjKQUE4DrqCX6kaEgc5KOrX5bz7BqhsRDuRg1VPadxCJUjYy5CVM9t/v9VNnrVEA11aVlfmW09ctJdei6xi08iV6jx1qkkHqcTq+QF0lF7RYsO/pww7LcVR0LeD/TQgfNXy//wWwvDc9W8CJFDdaG9h+if75lC56jLKFqpxQSQ1Fg37jqiCofjiGnDyVezbwFHQfqo45ZtdljTEREbie+4yvwXEWB3VufO//UGhfP1SGGrRykL24Vlw9zvbfPpyqmvBY1ihAucN7Qgi42DmqEygSlZHPT6Dp6lsoU+j6NHt91CQYx7mEuv41EvHPAaCEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lMSbuMzFk476bXS0hFnUWgnN47n36WdfLn6n8LRD3+0=;
 b=fTpGHzIg6Sf/naHm+oDh22w726uo9LnHvxqC34/pxFxKWH7isWmGiGzY+OwRAnL+CHN8mc1jHKuIa5Hbc0wOzpylq397khBnUcZtvqd4ioRHwZSZBmDzCTkHnhOA+ZIrgtf/rb7YgHQcXtNtGp+bB6EzVaFQ63jdJqguo8n/q7Be2wG8zYn9/s60eLpNlAC7e2u2qUQH/pZLYYrBQwA/W3vEIGu2kRkhxhTrbjbI+DizitIQDW0js9g5bU2TZR/IenDrDlL2EQNTLbIg8uzdrm1eN4EZGGpb9C5+bXsAIWWDL9DKskemd+CH0TI0Qb05hOXyjzTJI/DnTN7Vm4cPDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lMSbuMzFk476bXS0hFnUWgnN47n36WdfLn6n8LRD3+0=;
 b=RqyzQX8/3tDlg4mUVircMf9Z/ACsE8tRwaru/GrmvW2luSkh67XR7gHh6bbw92G/CnbQTs4Vor3rviKBel1nzZII145UQTo+XTyoeki3h8Hn9iAa/rHUScBj89O9+CJkqs7rFRhnMNePvi77+l0jF8AIErW0+HoIjlr6lH/Q1cYr8YPx/cWBpl0fPE+GRAbkB4+DWDlY9wVK9izfwrOi8LkYsv9n4w4Rc9Q02PrGUPsRB4Cp9dhjR8G3Xpe6V2Iwc2/HV9OQqVqgvz+OhUoSO8GNkSByDI9T8xazlOJgug/Vb3+O4jpVF5b/bYa5vJ38FrelVanP2TfGMixSn+roeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <822a6328-36d3-43e9-9fc4-36d01a6b9ef2@suse.com>
Date: Thu, 16 Nov 2023 14:46:37 +0100
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 2/5] x86/HVM: split restore state checking from state
 loading
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <08e0708c-17e2-4a5e-aaf7-5f60a40f76db@suse.com>
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
In-Reply-To: <08e0708c-17e2-4a5e-aaf7-5f60a40f76db@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB7181:EE_
X-MS-Office365-Filtering-Correlation-Id: 6db19afd-6e97-4056-e6a2-08dbe6aa74b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	l7b2L41tkC0WthIIlKGQPUBN9XXJEnHOPuiRqlmhPrwnb3MYMvXT7N5/RXgR5p6Te645tmT3ql5Ezrjv9gDmGNqKxeIs+ABF243+1lM9fAo5RdbirCEqMpTzK5GHdpf4jOC6J/5sya4lRiJzG7mOad1mrzCyNKAHPQ0NqdeyAU2kmbxNJxxmVOTeLZfax6TYREJBVyErflJGKvaks3ujhN2+c4xv9M2F0pU2pINFzs03OLX9yjxakFZAZgFVTfg1eSjdLgzdVcehQiOzkeZUZgBQBfi8f5dQco4Mo8DZA9QIAm3BxZplfxpK9+PAgaA1+aNGbKfcyCFdeyILB9Gd+FbE9k+wjv5RTCskwh90aG+R/d2r0t3wmMlQMz/dW8kHvdPR8N6y8eBNIF7iQijcdZLsI/iAqIX4/6N1lo+upUOs3PQw36xfGmafsVaLYopcvpNONbrG/NC+7PWPs8PVKXj2jTRgfHFD55grF/Ute+XzHMqc1dj2zXJT31PCvTpZBCrcHQeI8/ZQJZsbPNImUo69sUAgOdJdSf0A/j8k6aZzL0hM/dRZ9NYprngYXWprhi96aPr9ieb1TVHIejzpQqNF03FmdnJg+3Ncwyebay9mM9EbyZyta8Z1usGJKQCAriGbM+AXpo0jABfngN0/fA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(136003)(366004)(346002)(396003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(31696002)(36756003)(86362001)(8676002)(2906002)(8936002)(4326008)(5660300002)(66476007)(66556008)(54906003)(316002)(66946007)(6916009)(478600001)(6486002)(38100700002)(31686004)(6506007)(26005)(2616005)(41300700001)(83380400001)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUwwTmQzVldaUG0xazhJeXp5WU5aa1o1ZEhyUXRmQlZ6eWp6WDBxV0Z0SGt5?=
 =?utf-8?B?cWYyY1JaNFRIdE82S1NIdlNUZGpBOXREU0dZYmpweGd3cWozMkpuQzgxOTlD?=
 =?utf-8?B?clVZVTVzQTlKc29icHZ4b2hXT01ZdThuRkEvSUhBSWR2K3NlZlFsYUM5cnlG?=
 =?utf-8?B?TXNJMXdZVHRJbSsrZEJvck9OQ3Z4S1c2WElEcjRGNVJ6NWVXSHB4WmYzOXJJ?=
 =?utf-8?B?ZXRuekpIN2lTTGlMT2pFWDJDa1Fpc0Nrb3E1K21za3dDQzlsOUsxNUxzZnhM?=
 =?utf-8?B?aGorekdJWkZidVhLTGVUU1g1RkFhaWY2Tnd6UnVjd01yNVNRa3RRb0JyWFcr?=
 =?utf-8?B?dXZ5RFAwRDZGbjREYk5XN3RRVm1iOEFaY3ZwREcyMTdKVFN6MmZMOERxclIw?=
 =?utf-8?B?K0JZV0ZNc0tLd0JvWnpPZDJUWjN5WGtDa3h0c0xmb2E4QzcvM0tleHI3aGs2?=
 =?utf-8?B?dzN3UWZpVVhEbk1GdzczcVhENU04ZDhueVVtSmQ0QnRwc3RMZzdYUzdLT1Zp?=
 =?utf-8?B?V2ZKQkJXYkR6RVFkWmNWajdQVjRwT0JBRWNsOGY5ZnZoTERyb3FWQVdueGE1?=
 =?utf-8?B?OUFIZkluVWpFUG5kUURVZlZiUmxwUjU5RWFwbk9sWkVoSS8vU1MvcUdLVXp1?=
 =?utf-8?B?OHYvbW5VZ1piRnlpdEdCa1d3QzFXYkF3Tkh3TXRkcnlQcmg2RFl1OGo2dEdW?=
 =?utf-8?B?eE01ZkJ2WXh6OUI5M3NSejdtbjZib2U2MXhMTWdKOThtL2VybHpUZjNuMTY5?=
 =?utf-8?B?T1hEQkw4dHZvU0RLa21kdkk2U1pNNStMMDV6dUZaMFl6b3NwQjR0V3hONGps?=
 =?utf-8?B?K2lIb2lJV1pNcktNYnlwcFNMZWpmdkMzLzFHRXVXaDg3SHlDUnRkWlg0cEVM?=
 =?utf-8?B?czJJQ0JXZDR3c1hrRElwWHArbkR3L1VTa2dTZGJFb0RxRmllOGVvY0JxVHN5?=
 =?utf-8?B?OFEvZ2d2UHlvWWwvSVFjNE9vYnVzWWZoOFhtYVZ3VTh3ZzBPUm5qUTBRMXBI?=
 =?utf-8?B?Q0RHSk9CY3BPcXd4VkJDQXlPcndoekxqL3VSWlp0b0V6NWtZRExublBuVkk4?=
 =?utf-8?B?TXZhOHlOSW0xSnorMkFocEhuWDhHR1hEVnJrWUp3dE1jY2FqZlhIdlRoellJ?=
 =?utf-8?B?YlJPYjdEOFl3d2R3TWIwTE1pSndlSW5tZzRWR3BjUkdqZ0dEcC9EK1BiTUFt?=
 =?utf-8?B?Mzd0WDh5S2Vzb3Fwby8vQS9zbUN1T2VVMDRYUXpLVXI4SHU2ZFgrdExIZGJn?=
 =?utf-8?B?QWg1bzMyTXNjT0pha2Y5WDEyRnJZOE8zRFBtUzcrTndzdHpkZDEzTzdnMEl5?=
 =?utf-8?B?MncyRGQzUXdLMmxnaHNPTGY1UGNYb3dwdUUyTnJZMHRGYWtyeVNsdFM1VVlY?=
 =?utf-8?B?YkNqUC9Jd3p4dVRBNEFYY2twWVd2SlVRckJkOWpnUXVMWlhhQ1g2V3lJQmtp?=
 =?utf-8?B?d2RVYTg2bW9mTXhEN3RJZGJ0aTM1UTZVQ0lQZEo0T3Y1c0tncUpFUEV1bXlG?=
 =?utf-8?B?SnVPczJzL2xyZ2JkYWZLak95Vlc4clJPTGpVaktEUHpNRE8yam1uR3JkMUFw?=
 =?utf-8?B?ZGdUYTY4Z0I5OTRPYlJUNy9iNVFyUnpPSy93dVhIeTJMMGVheG1ZUkwrSHlp?=
 =?utf-8?B?cEUreit0OFZrNTU2NFRYdGZ1ZDFRZGI2dHdWUk04YWFWSFJlYU5aWkJsZmR2?=
 =?utf-8?B?SklvVHpwMjBaR21ZbnFSalJCSXpLbVhMTnpaNzJDYk5Wa2tOSzh6V0FtSE1S?=
 =?utf-8?B?aGVMRUtXWVJsUDI2UC9hbHVPTUxuMVB6TVFBYmY1cXIxWGZwRzFrdkxSWU5D?=
 =?utf-8?B?OUxvVGIvaDFFVWc3SjQvanBkajhTSXR6UlExcHNNbkVaU0tuM2lEZnV4UzA5?=
 =?utf-8?B?Vm40VGEvSGppMkVJUzg4SHU0TlZiKy9KcTY0aHhTbkpBYW9JRE9pTnBrNVZS?=
 =?utf-8?B?dE1ZTmFPbEZ0dFovY2lXdUNESzZMTkZvTEIzVkEySHZNTFBURmJoRlFGTEpX?=
 =?utf-8?B?M2J6N1BVRlVQRUpaZGFKWEtWZzQxejc5aytKSFR6TkpTNUNTN2YrYyt6NXVs?=
 =?utf-8?B?VnR0Nkl0VFNTcUZHZlEzaGgyVksyN2Q3eXpvY3dxRTFFVENLSnpWVnpSRjNz?=
 =?utf-8?Q?yz51vHLdxvfcGwIblOLZFPm5y?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6db19afd-6e97-4056-e6a2-08dbe6aa74b6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 13:46:38.1094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J5nkrMY1KAV+nTaTMkYCPyeqlg9qSy9zKpxEWeQaCxn7ptUs7AZNZpyhdYDNanlCV47IQb2RIamy1RlnzuZ7EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7181

..., at least as reasonably feasible without making a check hook
mandatory (in particular strict vs relaxed/zero-extend length checking
can't be done early this way).

Note that only one of the two uses of hvm_load() is accompanied with
hvm_check(). The other directly consumes hvm_save() output, which ought
to be well-formed. This means that while input data related checks don't
need repeating in the "load" function when already done by the "check"
one (albeit assertions to this effect may be desirable), domain state
related checks (e.g. has_xyz(d)) will be required in both places.

Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Do we really need all the copying involved in use of _hvm_read_entry()
(backing hvm_load_entry()? Zero-extending loads are likely easier to
handle that way, but for strict loads all we gain is a reduced risk of
unaligned accesses (compared to simply pointing into h->data[]).

Would the hvm_sr_handlers[] better use array_access_nospec()?
---
v2: New.

--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -379,6 +379,10 @@ long arch_do_domctl(
         if ( copy_from_guest(c.data, domctl->u.hvmcontext.buffer, c.size) != 0 )
             goto sethvmcontext_out;
 
+        ret = hvm_check(d, &c);
+        if ( ret )
+            goto sethvmcontext_out;
+
         domain_pause(d);
         ret = hvm_load(d, &c);
         domain_unpause(d);
--- a/xen/arch/x86/hvm/save.c
+++ b/xen/arch/x86/hvm/save.c
@@ -30,7 +30,8 @@ static void arch_hvm_save(struct domain
     d->arch.hvm.sync_tsc = rdtsc();
 }
 
-static int arch_hvm_load(struct domain *d, const struct hvm_save_header *hdr)
+static int arch_hvm_check(const struct domain *d,
+                          const struct hvm_save_header *hdr)
 {
     uint32_t eax, ebx, ecx, edx;
 
@@ -55,6 +56,11 @@ static int arch_hvm_load(struct domain *
                "(%#"PRIx32") and restored on another (%#"PRIx32").\n",
                d->domain_id, hdr->cpuid, eax);
 
+    return 0;
+}
+
+static void arch_hvm_load(struct domain *d, const struct hvm_save_header *hdr)
+{
     /* Restore guest's preferred TSC frequency. */
     if ( hdr->gtsc_khz )
         d->arch.tsc_khz = hdr->gtsc_khz;
@@ -66,13 +72,12 @@ static int arch_hvm_load(struct domain *
 
     /* VGA state is not saved/restored, so we nobble the cache. */
     d->arch.hvm.stdvga.cache = STDVGA_CACHE_DISABLED;
-
-    return 0;
 }
 
 /* List of handlers for various HVM save and restore types */
 static struct {
     hvm_save_handler save;
+    hvm_check_handler check;
     hvm_load_handler load;
     const char *name;
     size_t size;
@@ -88,6 +93,7 @@ void __init hvm_register_savevm(uint16_t
 {
     ASSERT(typecode <= HVM_SAVE_CODE_MAX);
     ASSERT(hvm_sr_handlers[typecode].save == NULL);
+    ASSERT(hvm_sr_handlers[typecode].check == NULL);
     ASSERT(hvm_sr_handlers[typecode].load == NULL);
     hvm_sr_handlers[typecode].save = save_state;
     hvm_sr_handlers[typecode].load = load_state;
@@ -275,6 +281,78 @@ int hvm_save(struct domain *d, hvm_domai
     return 0;
 }
 
+int hvm_check(const struct domain *d, hvm_domain_context_t *h)
+{
+    const struct hvm_save_header *hdr;
+    int rc;
+
+    if ( d->is_dying )
+        return -EINVAL;
+
+    /* Get at the save header, which must be first */
+    hdr = hvm_point_entry(HEADER, h);
+    if ( !hdr )
+        return -ENODATA;
+
+    rc = arch_hvm_check(d, hdr);
+    if ( rc )
+        return rc;
+
+    for ( ; ; )
+    {
+        const struct hvm_save_descriptor *desc;
+        hvm_check_handler handler;
+
+        if ( h->size - h->cur < sizeof(*desc) )
+        {
+            /* Run out of data */
+            printk(XENLOG_G_ERR
+                   "HVM restore %pd: save did not end with a null entry\n",
+                   d);
+            return -ENODATA;
+        }
+
+        /* Read the typecode of the next entry and check for the end-marker */
+        desc = (const void *)&h->data[h->cur];
+        if ( desc->typecode == HVM_SAVE_CODE(END) )
+        {
+            /* Reset cursor for hvm_load(). */
+            h->cur = 0;
+            return 0;
+        }
+
+        /* Find the handler for this entry */
+        if ( desc->typecode >= ARRAY_SIZE(hvm_sr_handlers) ||
+             !hvm_sr_handlers[desc->typecode].name ||
+             !hvm_sr_handlers[desc->typecode].load )
+        {
+            printk(XENLOG_G_ERR "HVM restore %pd: unknown entry typecode %u\n",
+                   d, desc->typecode);
+            return -EINVAL;
+        }
+
+        /* Check the entry */
+        handler = hvm_sr_handlers[desc->typecode].check;
+        if ( !handler )
+        {
+            if ( desc->length > h->size - h->cur - sizeof(*desc) )
+                return -ENODATA;
+            h->cur += sizeof(*desc) + desc->length;
+        }
+        else if ( (rc = handler(d, h)) )
+        {
+            printk(XENLOG_G_ERR
+                   "HVM restore %pd: failed to check %s:%u rc %d\n",
+                   d, hvm_sr_handlers[desc->typecode].name, desc->instance, rc);
+            return rc;
+        }
+
+        process_pending_softirqs();
+    }
+
+    /* Not reached */
+}
+
 int hvm_load(struct domain *d, hvm_domain_context_t *h)
 {
     const struct hvm_save_header *hdr;
@@ -291,9 +369,8 @@ int hvm_load(struct domain *d, hvm_domai
     if ( !hdr )
         return -ENODATA;
 
-    rc = arch_hvm_load(d, hdr);
-    if ( rc )
-        return rc;
+    ASSERT(!arch_hvm_check(d, hdr));
+    arch_hvm_load(d, hdr);
 
     /* Down all the vcpus: we only re-enable the ones that had state saved. */
     for_each_vcpu(d, v)
@@ -304,10 +381,7 @@ int hvm_load(struct domain *d, hvm_domai
     {
         if ( h->size - h->cur < sizeof(struct hvm_save_descriptor) )
         {
-            /* Run out of data */
-            printk(XENLOG_G_ERR
-                   "HVM%d restore: save did not end with a null entry\n",
-                   d->domain_id);
+            ASSERT_UNREACHABLE();
             return -ENODATA;
         }
 
@@ -320,8 +394,7 @@ int hvm_load(struct domain *d, hvm_domai
         if ( (desc->typecode > HVM_SAVE_CODE_MAX) ||
              ((handler = hvm_sr_handlers[desc->typecode].load) == NULL) )
         {
-            printk(XENLOG_G_ERR "HVM%d restore: unknown entry typecode %u\n",
-                   d->domain_id, desc->typecode);
+            ASSERT_UNREACHABLE();
             return -EINVAL;
         }
 
--- a/xen/arch/x86/include/asm/hvm/save.h
+++ b/xen/arch/x86/include/asm/hvm/save.h
@@ -103,6 +103,8 @@ static inline unsigned int hvm_load_inst
  * restoring.  Both return non-zero on error. */
 typedef int (*hvm_save_handler) (struct vcpu *v,
                                  hvm_domain_context_t *h);
+typedef int (*hvm_check_handler)(const struct domain *d,
+                                 hvm_domain_context_t *h);
 typedef int (*hvm_load_handler) (struct domain *d,
                                  hvm_domain_context_t *h);
 
@@ -140,6 +142,7 @@ size_t hvm_save_size(struct domain *d);
 int hvm_save(struct domain *d, hvm_domain_context_t *h);
 int hvm_save_one(struct domain *d, unsigned int typecode, unsigned int instance,
                  XEN_GUEST_HANDLE_64(uint8) handle, uint64_t *bufsz);
+int hvm_check(const struct domain *d, hvm_domain_context_t *h);
 int hvm_load(struct domain *d, hvm_domain_context_t *h);
 
 #endif /* __XEN_HVM_SAVE_H__ */


