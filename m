Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AB97F5A03
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 09:30:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639431.996794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r656h-00054X-HL; Thu, 23 Nov 2023 08:30:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639431.996794; Thu, 23 Nov 2023 08:30:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r656h-00052O-ED; Thu, 23 Nov 2023 08:30:43 +0000
Received: by outflank-mailman (input) for mailman id 639431;
 Thu, 23 Nov 2023 08:30:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=licP=HE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r656g-0004tF-2h
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 08:30:42 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0628.outbound.protection.outlook.com
 [2a01:111:f400:fe02::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 962cbe58-89da-11ee-98e2-6d05b1d4d9a1;
 Thu, 23 Nov 2023 09:30:41 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8943.eurprd04.prod.outlook.com (2603:10a6:102:20e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.19; Thu, 23 Nov
 2023 08:30:38 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.012; Thu, 23 Nov 2023
 08:30:38 +0000
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
X-Inumbo-ID: 962cbe58-89da-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cgm9pxSQjuBrIjIWluGAfPa2rpLjpyZZ/MhBjd9XUdq7BBuHhbCSfcJSzBhJ93D3ql0GeBQebfFhi3cE6GMWVw6mvtiJzHeS9c208r9CL4iuQM2K90Fbmtmf4SSw6+fJdQkL/ixaUgbA2K58Aph54et8FjkhgVVdcMNwJVzVZ+pnDbGSAvlH4fqMDVrOr3AZWseyZ42p8phCQ5Tu/Q7VuM2w2kBssiTyz1D9DQJTDdQK1j8XTW8XsVXoJWj0XwGjU/fNgfQj+h+4IJFdvnHbzuWPQ45ecUErWzIwpSQGAjo6CgNwQ5lfPpziAWqmySWyqPFU1JhRvZ+3FxnYrYvMhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E6ClyfuTFA9yRI/eRw9uLOoTulkpS6bS4t2F5EmxLGc=;
 b=E9kcYOG16Jv7bNMf8H+VtDc0usQgPNqEKd3UnlX+7jtl7g5dKmSOnjJT8pOtYM21KlaFt4B29PuEpXKQbg1CQuZZIZix/qLLriNwz+TTsv9o8gnv+X2x2uwyTRe2lfGxLMtEqCFTRM874r0DfjWcbQ3JztNo+PWWLJzIlgaNNsOV4r4h0E5RguOAynpmVSnrSCPm7Jvb8oSYvZDRp/Pd/T6NkAutC1U6SMtXbJGnRIMZFtxDnkUU4/gNpUyJCbh3I/EBzH1S5+xhH6noe4kysKnO4e2fo0wNy38eNK0IUqFsW/hmkcsC3szRKz1+QKYz5fNJbUF+YRmI1pEzJcyYdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E6ClyfuTFA9yRI/eRw9uLOoTulkpS6bS4t2F5EmxLGc=;
 b=nfUeonEX4/v1xJYArJ6FsZBC4mAMJ0oEEAOv7OLVnBEC8aLTZMnuQhsY5/a3wqOX8Z7fBQAvXGoEf9P+4QPrM0ljTxPdNDrGkpSvwANsau3WLYoUcsPJQ00X/5Q5hFSDtMOY/XA5o+E7DQL7iWwh0FiEaE7vhteArMnpnRQUhES/F9VfbK8otEf1UOOdtM22o/1lGIygRspHtVyyHh+Kr7EZGGt1zJ8sr7lXnGN+zFa8wozUe496eZj+w/T45Fb/Zw9/2CCGsMmMTJ/nh5YMt2lRww8EGr8xHuFH/ZQ951W/y+Dcv9k38qBUiT0FiNSR3D0P7V98icKu0/yjm1aEPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5a8f90d6-6502-4d93-9fd7-45fea0ede24a@suse.com>
Date: Thu, 23 Nov 2023 09:30:36 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] do_multicall and MISRA Rule 8.3
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: federico.serafini@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2311221331130.2053963@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <alpine.DEB.2.22.394.2311221331130.2053963@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0227.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8943:EE_
X-MS-Office365-Filtering-Correlation-Id: 38bcfd3c-06b6-4a96-0da8-08dbebfe7892
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IX1dgaHQyX2J4MmIPPcx9aKQsN6iCXLPLsJyMNBKLbl5/Hnias3Ge7qlscZOXQ3qGeEjnMSgnSWdpFRAxWYUr9npte0QrPus/v2XUu9/MG5a1YInbkYEYyekPMaajgvKXkF5djv42tYYIw2pLo3CHnn3+6y5Dn+RGpHtRgvh/R0tpAVT2jj7wtZvUrCZWssqv6teRizpGDPoM6MVrKPmeJexraoDJZmXvFMoHyL+VCVuQHo27LiRtZjhWEv2TdmjbZqz23jCgfg6umo6hQhwz7lcUzHR4IWmzddxOgh2LB6LxGw6p03+rxDa/sof+DUWNGWm/PYEQ+wUNo2qnX6MeaKyPQhYk3cO596EZiJ2DT5hohDAbb3vQZp+p7GcTRTOqRpWynCB7SfqY8F3ByxjcwtSnU7CWGW2c0J8ajQXQEQcpsuxcS3iI+0Ti3t24jMie38Au1F4IsKQEX5uIBdU2aVPyQcYM65WJ7SaJFnYbSHGhY56CsMhQWIKfgequ2m75qc+XoXI3mlfM6Qxw0h2vZeNupTY+XUW3/RvnzTMJGx0YMVoG4MtvO4MH5fwRWaGYL9e5PDQt6pAz2xTj5a8tusWhiJ+hbC5CK3M1R84I95N0hgUeJU8Rd9U5VDeHjKyXDlFggRWbnWsd0Wl3y8rDZlBqbOe1E99GTkKjSyfu4Xdhv7V+ChkSxcBnXcpvY69
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(366004)(396003)(346002)(39860400002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(31686004)(26005)(6512007)(2616005)(86362001)(31696002)(36756003)(38100700002)(478600001)(2906002)(5660300002)(6506007)(53546011)(4326008)(66476007)(54906003)(66556008)(316002)(66946007)(8936002)(8676002)(6916009)(41300700001)(6486002)(966005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?czdxNGczVWpsSUZQTTBvK1VOVG5rTXNzaG82bnNLRkE0TVRZbXFicDhYYWIx?=
 =?utf-8?B?QnEvek13akFDWXRrTTQ0TGdTY3JYM2xFOTZIQUcrT01IZFc5ZVN4aTdFTzEz?=
 =?utf-8?B?TE5qaUNDM0NVdVdFeTZJOVBGb3ZpTUI1ck8rck81aVY4cmpwRkxmbXdGWEFi?=
 =?utf-8?B?L0VVbXo5dHU2N2t5VnozRE1udlFjYXk0ZktuMm9LQk5WbEl6MFVwc2Y5NUNW?=
 =?utf-8?B?VGZ5cTZjMnl6eVR5QVNJQVBxKzlsb0RLK21GUllOUjFKM1lOb0VGWFVkRE90?=
 =?utf-8?B?MzZrd2lRVDBTVUlHR0NXcTNtejFkQjhYaXlRVDJoNTBoYzRHQm1reElJSFRY?=
 =?utf-8?B?ajVOajc1U3lwQ1dOUDBuVUpTaW9LRzRualVtajB2Q0NURnhPS1hDLzZXWmIy?=
 =?utf-8?B?NDZiM2lYbm5NQUR3Z1lyNVhiT0hNNkdXMFlrMGQ3R3NvUExCYVU5SlBiMGdT?=
 =?utf-8?B?ckRZaU5BeExEUzNyV0NEei9uVFA2Z01KRGNZbmRpKzRmQjlZZkhnS3doUjEy?=
 =?utf-8?B?bnpoR0lLS1ZVdjJkTGI2dzZ5NXhpVDJidDNJc0lUanlwdHdYS1Ztc3ZzMk5x?=
 =?utf-8?B?azFnTlZoaVJoMS8wU0NFR3lOSGg4bVpRS2lvOEgwVDg5cDc3SHo2THhmdmNx?=
 =?utf-8?B?RERVYmplYVJBdjc1VWNDQ25Qam5NU3h0cHFDcTZQRWJXWEV0NXhvdy9ObDFG?=
 =?utf-8?B?RU9CZGlOa3JFYzJLRUEvOEdZSTRzbm9icGNxTU5QcFBLc3Z1R0NmbVJtV0Vv?=
 =?utf-8?B?V25QOHNQRGZKbjAycitvV0orUnprWTJRNG9WZHhGajdjNGhtNk96TkdQNktx?=
 =?utf-8?B?Zk1NbFNjSVBoODVUb0dlcmVMRTd2T2xXQ3FTSkdERmhhRGg4TjFDNk1ZYklO?=
 =?utf-8?B?MUZ3UkNEMzFId3lEeXNrN3JRMDlrRUF5UWdkTkZyb1g0QnkyZmRlZmdBczhy?=
 =?utf-8?B?V1o2bGZqWC9mRHJMZTNpVU96RTExRm01TzFOV2ZDQ0FLcGxqc1dEeDdXM3Qz?=
 =?utf-8?B?c1pwcFJPOUtLekVJbTMzMzJzWG9nRkhRalJaUTJ3amFSeThQZjRqL1BUYXV1?=
 =?utf-8?B?M25ibGhEVWg0TXlLdHNISDNtODZuR1o4WDhXRmhGaEc1RFAyaWFUYnhqRHMr?=
 =?utf-8?B?RHNTL2RNYUJOcklZOHlmMVlVQ21lTi94NWpLWXhmUURra252d0liOUo4S3FC?=
 =?utf-8?B?K0YyUWtBK3J4dTJEUFQvTzBEUlVxWW0yNng5cXc4c2tMcHI1aXJYaUd2c0hq?=
 =?utf-8?B?L2RGOGFZMHlldDF1NHhSbUtycm5qNDRUSVF4UnRVNzBxbjlWTE53YjlnU3I1?=
 =?utf-8?B?a0UvbFVFUHVTdEJsWUhzV2RyR2drRFhIeHJWNXQ0UEZjTjd6R1NmZWJQd0NP?=
 =?utf-8?B?SWxGNGhWdjBZbUxIdDR5WG4zdFVzMEJPRE1oYzhnclEwa3VOVld5d0thTmFH?=
 =?utf-8?B?SkttYklCZ05saC9GTnJNTXh2blNDWVlmRW5mSWZsTE5CNGQ4ZnFHYnJtVmxH?=
 =?utf-8?B?THk1d2tFeVQxdGg4b28xbHE3Zk84a1lxZ0dkTDE2eUl5UXdpVjVGN1hHMGI1?=
 =?utf-8?B?dHVoQ1ZhZVVkZ1ltTnBPcGVDZExZLytoQkRmRXBidDdENExTaHhHVDhWUWJq?=
 =?utf-8?B?MEJuMHhudWhBaEhNbjFMSmtvT3JIWkdiWlNFbDFieUloNlh6eFVwLzRyTkl4?=
 =?utf-8?B?QXcydDFhSzBXTWRHUTJCWmM4UEdvU29Kd250QVlZcllyc3lQUU56K2hRdnNG?=
 =?utf-8?B?cndoQTAvSFpoN0ZlMTJhVm9tcDNBb050NHhLQTh2RXJzWExPcHNKczVlc3lB?=
 =?utf-8?B?ZWhIQzU2dTFYQzZtN0RSTnpabEwyNlVKdnNSUGtNZzBFSlZ2dGFxcjhjRGRG?=
 =?utf-8?B?V1FMeXBBaHhTb1U1a0JYL1JzcXpuNXRFQ3hkRFNjZFJ1QnVEK0hkc2Zuckll?=
 =?utf-8?B?Nkt3NUJ3cjV5MjljdUFRYzhzU0NmUjY0MWI0QTA0eFREd0gwMHJHUUJpeHpv?=
 =?utf-8?B?OHZCSWVqeGIxYnJFUFg0THRleGtwTjg2VzdRY1V2d29wdEM4cnFXSTRvWFMr?=
 =?utf-8?B?QU9UWXR0ZTl3UjVhbjd4eko3MUUyWm81MUU2SEpRemtNL1oybVhiSGRFd0F5?=
 =?utf-8?Q?Bosd/VwzREoRTuUrW5GFiUkGT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38bcfd3c-06b6-4a96-0da8-08dbebfe7892
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2023 08:30:38.1203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IoCrHed5OzOsK/2/8UVUYQfWEx9I2yoS4nerzC3tNygMt8G1beCV11nTR8I73EfnLG2aCNWz1PtLSW984b3F0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8943

On 22.11.2023 22:46, Stefano Stabellini wrote:
> Two out of three do_multicall definitions/declarations use uint32_t as
> type for the "nr_calls" parameters. Change the third one to be
> consistent with the other two. 
> 
> Link: https://lore.kernel.org/xen-devel/7e3abd4c0ef5127a07a60de1bf090a8aefac8e5c.1692717906.git.federico.serafini@bugseng.com/
> Link: https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2308251502430.6458@ubuntu-linux-20-04-desktop/
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
> Note that a previous discussion showed disagreement between maintainers
> on this topic. The source of disagreements are that we don't want to
> change a guest-visible ABI and we haven't properly documented how to use
> types for guest ABIs.
> 
> As an example, fixed-width types have the advantage of being explicit
> about their size but sometimes register-size types are required (e.g.
> unsigned long). The C specification says little about the size of
> unsigned long and today, and we even use unsigned int in guest ABIs
> without specifying the expected width of unsigned int on the various
> arches. As Jan pointed out, in Xen we assume sizeof(int) >= 4, but
> that's not written anywhere as far as I can tell.
> 
> I think the appropriate solution would be to document properly our
> expectations of both fixed-width and non-fixed-width types, and how to
> use them for guest-visible ABIs.
> 
> In this patch I used uint32_t for a couple of reasons:
> - until we have better documentation, I feel more confident in using
>   explicitly-sized integers in guest-visible ABIs

I disagree with this way of looking at it. Guests don't invoke these
functions directly, and our assembly code sitting in between already is
expected to (and does) guarantee that (in the case here) unsigned int
would be okay to use (as would be unsigned long, but at least on x86
that's slightly less efficient), in line with what ./CODING_STYLE says.

Otoh structure definitions in the public interface of course need to
use fixed with types (and still doesn't properly do so in a few cases).

Jan

