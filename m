Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B067EEC79
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 08:08:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634841.990375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3swm-0000Kw-Mb; Fri, 17 Nov 2023 07:07:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634841.990375; Fri, 17 Nov 2023 07:07:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3swm-0000I1-JY; Fri, 17 Nov 2023 07:07:24 +0000
Received: by outflank-mailman (input) for mailman id 634841;
 Fri, 17 Nov 2023 07:07:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Shlr=G6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r3swl-0000Hv-N6
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 07:07:23 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0606.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1a7f6ec-8517-11ee-98dc-6d05b1d4d9a1;
 Fri, 17 Nov 2023 08:07:18 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU0PR04MB9493.eurprd04.prod.outlook.com (2603:10a6:10:350::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.8; Fri, 17 Nov
 2023 07:07:15 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.010; Fri, 17 Nov 2023
 07:07:15 +0000
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
X-Inumbo-ID: f1a7f6ec-8517-11ee-98dc-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OcDDZOAv0U117JYgvMzsMse/i5wPkZ/2q0ahNPLGLnobphGOnEoog3lVfLYxHvWszXQQbyVW7v1FqLX17P6bICOr3XRTO9TBz/moU5f0XGSGW4wGPJHjik+QpuDA/bPOMlY5mZzK2kDulnOIxvmq6Ei6sQEVYo7g5HZHRbso4NFEKHwLK9P2Uz1RLXU7MfrD4Gowp+UcjO2kV87zMlcGvJ9BulWuoYiNdMz1/uqF0cYe06SGrEPHepckE7mVfsTz3PtBQKdf3zDlVJ4Ll4bMz0Qy+Nt/dxb2PSpy6VRW7TdwsJWGiYJEMRdrBiPHv8xJ3Cmr1X6vTVo+UdsCVdb/VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hNl6RJRBsa6ZEVfz8m2Ln7NNIVSX9fq72QHbly0oOuE=;
 b=k4IllggHPrBp/s0/12VWbFBMLA/CGaAQJCSzrKKidALoyBl+GnGlrglpQy22Dy8AOezhUzNEh2cCwM3pMYnc/CCbfLj4LowgiVUwAMWxtmTAqK2mkr0xUdtpJ+4ysbnHWmaaYMOq+U9xaGny8isCNf7rTDLS/9lzXqXPV80xicS0Zn86iX7+a3MHS8X7VdEwwf21dj0zpQzDOa+dEVucNJDjkqFQkjYSjY7aDj1RPoHuTTp1tmQoCOKnVi1gcIJT1rl3b79GvbBjsse+yaDE5Usb+J5po1n3QR15bJZgrihNb2CgMVWyBiokR++BQvyIG1F2X6rPoQQv2Ey0f7gPpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hNl6RJRBsa6ZEVfz8m2Ln7NNIVSX9fq72QHbly0oOuE=;
 b=c2IY4CUFPyyDa9KW6xItSlKJgL9i2Suv8VjWqwrpAgf3jhU+aUH5LLuv6oSU0lbZqnGKZXGrywFT2PAqZS3i1g+lt+1KwVQcbd1bmPaLWkVsunWRO+CgLsOrjXTnHovi7+lOTVsUYibuvpIdyBEcRx7JLnjdmZYPTYbVOVoqIte9110dbcL89ox2cXXHRdvL5XpwbI0d/OLWjtZ9eh5HW3HmxuJMDxj5KZuLnEjtthxxnn23cpDEfdm8xIC9aPJ3U0Uh3xtnC6Me8BF540oBjcPU+wjyLuWDZthNM23XOClLyER1+yvZ6LkG9qvb4RKvvwrBZqBY9zvVPH2kRi67tA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b5277391-71bb-42b6-82e4-635dd1361ad3@suse.com>
Date: Fri, 17 Nov 2023 08:07:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH][for-4.19 v4 1/8] xen/include: add macro
 ISOLATE_LOW_BIT
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1698410970.git.nicola.vetrini@bugseng.com>
 <dca236bf9199f596bafb35eb48d81adc280d8cca.1698410970.git.nicola.vetrini@bugseng.com>
 <f88edc35-6b1b-0136-aa1f-6429652c4016@suse.com>
 <alpine.DEB.2.22.394.2310301536390.1625118@ubuntu-linux-20-04-desktop>
 <7c26fb70-6a8c-58a3-6a1d-300dd57b5827@suse.com>
 <817fab34432c854ce585aba80db77f7c@bugseng.com>
 <8b4e0da82930375b2a95387a9031c73f@bugseng.com>
 <1178b79c-d6a3-a46c-5556-3fb5964dc051@suse.com>
 <392566d1-109b-413c-b904-0e4cb4007263@suse.com>
 <6b6f051130b724ee6a813235e049354c@bugseng.com>
 <7cbf6f0f-d5b1-44e2-9a0e-a9d7d353eb6b@suse.com>
 <alpine.DEB.2.22.394.2311161635200.773207@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2311161635200.773207@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P190CA0012.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5de::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU0PR04MB9493:EE_
X-MS-Office365-Filtering-Correlation-Id: 838c78a5-4180-4d56-f020-08dbe73bd3ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LP/9quVZrIhxpeg/KzKmNUIgKll9kDA5OoJS2BIaKRHdHdc03VtG/TMmpSKv08mEuZ/k1775+QXz34FUxrRkApExOdPLGY5EmwaqfRdCHIiTBi1RH0h4BH5rJdY3xnhsc+Nv9iKgBpfOw/nBkOV9jz7GwZd9/xakL+bDUDgDxNQAU7YKBu07Sz9zQ86d3sll1BCWjlNoKFRnzS8hTlk8IITfodlNlSOJRogAvt3e8PYLIZ0Qtc/uOVndrFrbfbNkWBjhlvBoA3GVz/q4lexArNO7CVJNKGxIix53XCoAxlBqYK2sB0pH8HJz6AiTbjdJsdJtY7efPJpgRNWfU9gmmOcmX1geZ3K9ZncEZB8yEwDUeL5VjgSox0JZj90YPvUK/Jtjx7V6G2K4hs2SWlZbiqSCdggtOXZvKX3VYTUU2RjCyMhVfjV6SsCs70Ik/QpkGJ7t7QjjR4r83ulMZDg4qlxkOT9xIl4ux58JAXlEhH3IuqdWN10jZkVQ3lXl4n878wT9O+v+UdZ6X19yszyWfIWhRpJpBYQcDkHv+z9Ny/ZGUBZ9CSQNDcNXQp6XTHBC9C1iBgCj/zo3d2D8Yl7fNo9i4bFXTThQooBDCInIrFugL+881CVRa2RS9Cq2pwqdcqubHMwmAbBU7Ou/wk1rsQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(396003)(366004)(376002)(39860400002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(36756003)(53546011)(6506007)(2616005)(6666004)(83380400001)(6512007)(5660300002)(7416002)(8936002)(41300700001)(4326008)(4001150100001)(2906002)(6486002)(8676002)(478600001)(316002)(6916009)(66476007)(66556008)(66946007)(86362001)(31696002)(54906003)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVU2c2xkc1U5UzFoN3MzTzdwdzlsdDA3alZFNUtHUWRjT2xkZFRkU0VzOTVr?=
 =?utf-8?B?K2NoV1ZLMEJ1TDZBUWlRdkcvY0xFKzlTcUdIaVFKMyt2Tm9BWTd6SlpQdDNI?=
 =?utf-8?B?WVBDNzM5TE96R0RkeDZ6Vm4yUXFpWkx2MUtHVlJodXlBZitUcVhNeloyb0gw?=
 =?utf-8?B?SUpNSkxHb2ljSWxzU04wL29DeEZ4L25uM0ZsWUZTVk1FNjM1RSsvV3NCOHM1?=
 =?utf-8?B?MmRHOFJHUXdibU1VV2ZlOTNPVXNSblcrbnVGSDRLVmlrQlZERHFuQW9GcG54?=
 =?utf-8?B?V004b2Z6MUhGcldBVTJDc1JCVVNqN2w4OFlzaXVNR3dXVU56MjAzUHFQM3Q1?=
 =?utf-8?B?NTNkbWh2bGN5c0I4WlJiL3FWRTNMRzRzc1R6eE9wRG1BVmZmWGN1UEpLUlVB?=
 =?utf-8?B?eGlnTDkyUE1KbzRsUUhnNUNpS0hSazZGZnhQbGl6U1M2TDd2TGFoZ2JuM0Nl?=
 =?utf-8?B?NlhjUHdkbTEraDQ1azFZU0JaenQ5Q1BwZ2lIWVR4NTIrK0FPdEh0SnUwWUlU?=
 =?utf-8?B?S0M4VGExQS9SbUlob1hzUzFIQWpsMFp0VUNvSHpKRFdJZk5UUHZPQ3pla0Vh?=
 =?utf-8?B?YmtOT3lEWTlQdlU0aENCT0VrOWdOcWVaYWxqVlpDRUZYd3lHU0FNMmR2aC95?=
 =?utf-8?B?UTdxNUlCTmV3MHl6Ty83MFpWSGc5emNxM1ZSc2x6SFhObVFvVk1sSjhVdHYw?=
 =?utf-8?B?ditxL0RGT1VXc1lUVnBPQ3MyTWV1RXNRTGFWYURQTUVTWGdOdHhEUUZWWVJY?=
 =?utf-8?B?V0R6ODJJdzYxMlB3SDM2OGtaUElHVm9wRnlhU0MrQitHNlRWTlR5NGVyZzVH?=
 =?utf-8?B?dlkyUnlmQ2l4cHg3Q1poZVA1Wk02dHdCRjc4Q2IrQ0dmeHBoQTNheGFKVTBj?=
 =?utf-8?B?OExtcXlDWlhQL0VzcEQrOVh6ZERNZEhtNEMweFVSSTI1NlRHYWE0REs4SGRt?=
 =?utf-8?B?dmhBaHJPc2RVMmNXT1JwcFJhY0RyVng2SCsvclp6Q2pha2ZxdkpsbGF2Qkxm?=
 =?utf-8?B?R2JhZUNoeWhVTnF3eXNGNkR3ZVFoMHhUVEVaZHRCUWFuUGVzR28wUHhJZEVu?=
 =?utf-8?B?Z0NrRnpSUVAxM3RKUmxJY1pCTEloa0Z1clFtVUxhSzhKVlBnZ1laRXZOM00z?=
 =?utf-8?B?SXMwRVRjS2ZGclFTcXM2SjBNTUJuQ1VlYzEyRHB2YnFoMjV5T2VlclhZQnA2?=
 =?utf-8?B?aG15K3MrRlZ5WjVuN3M3UU0wODZmNGZaNEt6UWlXdkFpR0pvcUt0WVZIS1Rx?=
 =?utf-8?B?RFJpRUl2NSt3VkZPL0hRZzNQcTZ1RFV0WHBjUWtIQU1ZQWxqSkRwT1kwY01u?=
 =?utf-8?B?MWZGWC9UanYrbnRTT1VnVG1lcmNjSC9KNHpuQVJqVjVCd2w4TXJKL1VEaDNj?=
 =?utf-8?B?WjcwdXN3bkhqelQ2MjkzS3hSL3RDVFg4MERtcE9LcDMvVFR3Z2dLT1lDdHhk?=
 =?utf-8?B?WVNIV3QvRG03ZVpJTGNkTTdxSkpxUEJPNTRHcS9QU0w5anA2ZDNlR2k5K1k1?=
 =?utf-8?B?eXNLU29QZGlSVEdwb1hNelJ2dVRvSVlPSHAweVE4cSs1MFNPemhuSGhuZDFE?=
 =?utf-8?B?Q21RVVJ5RFV3WFVlRTRSdWY0WWdPL1BJMFE1cUFRUmhnK0N0VkkrU3ErazJj?=
 =?utf-8?B?K1NFTmRBTXJPOFhXZDlicGVUOXRPaVNkSlRTRnpnNGhNRGxVSEFwWURHSGdI?=
 =?utf-8?B?NE5EbFZBTWU5VlRuNjlKMWJHZGlsTWJUVytrVUh3U1Y4TjF5bDc4VjFHS0Fl?=
 =?utf-8?B?OTdvV01tSkg3UmFDUjRIa243Q1hHbjNDbE52Y2UxNDVSLzNqZFYvQ1RBRHR2?=
 =?utf-8?B?ZzlYV2VzNktpUitIcjI1aUwzbmhMVmlhdzdxbGZLUU9zN3JtL1MwTmh4M0g0?=
 =?utf-8?B?Vkh2QXBBMXltcWhObWVXd2NzTzFCVmRuVy9KZEtMTW1PWldlMDdQbmRWZjlM?=
 =?utf-8?B?NEl3YUN1Um8xSDQ0REVRMExpSU96YzYzVWdDZDZGL1FvZVJnSHZrMmR2bUpJ?=
 =?utf-8?B?NUJ3OWZyZWN6RU1VektQeWdLbk5nRTZhbnYwVUVhMmhuaFV2MHRNQkxBVWNZ?=
 =?utf-8?B?cGt0LzhDNWpXTitxV1ZObUNuZmpCakJxK1RpM0YyWFd5NDcwUzZiYXJDWXN3?=
 =?utf-8?B?MWNIc0hWNFlBYXNoZU1UcE1McVpmM0tQOGdWUW56V1ZQZFhxaEg5UkgrOENM?=
 =?utf-8?Q?YJ4QwIknCGSxnY4JfEbF3x3DBIV9HRFAL8pppTBJegmE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 838c78a5-4180-4d56-f020-08dbe73bd3ea
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 07:07:14.9486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5hvd/G3X06b0RThU52riZdH+FJMJ4AgibUlxWVowiwmFfNgjdPMkYboRPEpXgFnEhavldvcq0sPJfmxA2SEj4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9493

On 17.11.2023 01:43, Stefano Stabellini wrote:
> On Thu, 16 Nov 2023, Jan Beulich wrote:
>> On 16.11.2023 11:02, Nicola Vetrini wrote:
>>> On 2023-11-16 09:26, Jan Beulich wrote:
>>>> On 31.10.2023 11:20, Jan Beulich wrote:
>>>>> On 31.10.2023 11:03, Nicola Vetrini wrote:
>>>>>> On 2023-10-31 09:28, Nicola Vetrini wrote:
>>>>>>> On 2023-10-31 08:43, Jan Beulich wrote:
>>>>>>>> On 30.10.2023 23:44, Stefano Stabellini wrote:
>>>>>>>>> On Mon, 30 Oct 2023, Jan Beulich wrote:
>>>>>>>>>> On 27.10.2023 15:34, Nicola Vetrini wrote:
>>>>>>>>>>> --- a/xen/include/xen/macros.h
>>>>>>>>>>> +++ b/xen/include/xen/macros.h
>>>>>>>>>>> @@ -8,8 +8,14 @@
>>>>>>>>>>>  #define DIV_ROUND(n, d) (((n) + (d) / 2) / (d))
>>>>>>>>>>>  #define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
>>>>>>>>>>>
>>>>>>>>>>> -#define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
>>>>>>>>>>> -#define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
>>>>>>>>>>> +/*
>>>>>>>>>>> + * Given an unsigned integer argument, expands to a mask where
>>>>>>>>>>> just the least
>>>>>>>>>>> + * significant nonzero bit of the argument is set, or 0 if no 
>>>>>>>>>>> bits
>>>>>>>>>>> are set.
>>>>>>>>>>> + */
>>>>>>>>>>> +#define ISOLATE_LOW_BIT(x) ((x) & -(x))
>>>>>>>>>>
>>>>>>>>>> Not even considering future Misra changes (which aiui may require
>>>>>>>>>> that
>>>>>>>>>> anyway), this generalization of the macro imo demands that its
>>>>>>>>>> argument
>>>>>>>>>> now be evaluated only once.
>>>>>>>>>
>>>>>>>>> Fur sure that would be an improvement, but I don't see a trivial 
>>>>>>>>> way
>>>>>>>>> to
>>>>>>>>> do it and this issue is also present today before the patch.
>>>>>>>>
>>>>>>>> This was an issue here for MASK_EXTR() and MASK_INSR(), yes, but 
>>>>>>>> the
>>>>>>>> new
>>>>>>>> macro has wider use, and there was no issue elsewhere so far.
>>>>>>>>
>>>>>>>>> I think it
>>>>>>>>> would be better to avoid scope-creeping this patch as we are 
>>>>>>>>> already
>>>>>>>>> at
>>>>>>>>> v4 for something that was expected to be a trivial mechanical 
>>>>>>>>> change.
>>>>>>>>> I
>>>>>>>>> would rather review the fix as a separate patch, maybe sent by you 
>>>>>>>>> as
>>>>>>>>> you probably have a specific implementation in mind?
>>>>>>>>
>>>>>>>> #define ISOLATE_LOW_BIT(x) ({ \
>>>>>>>>     typeof(x) x_ = (x); \
>>>>>>>>     x_ & -x_; \
>>>>>>>> })
>>>>>>>>
>>>>>>>> Hard to see the scope creep here. What I would consider scope creep 
>>>>>>>> I
>>>>>>>> specifically didn't even ask for: I'd like this macro to be
>>>>>>>> overridable
>>>>>>>> by an arch. Specifically (see my earlier naming hint) I'd like to 
>>>>>>>> use
>>>>>>>> x86's BMI insn BLSI in the context of "x86: allow Kconfig control 
>>>>>>>> over
>>>>>>>> psABI level", when ABI v2 or higher is in use.
>>>>>>>
>>>>>>> I appreciate you suggesting an implementation; I'll send a v5
>>>>>>> incorporating it.
>>>>>>
>>>>>> There's an issue with this approach, though: since the macro is used
>>>>>> indirectly
>>>>>> in expressions that are e.g. case labels or array sizes, the build 
>>>>>> fails
>>>>>> (see [1] for instance).
>>>>>> Perhaps it's best to leave it as is?
>>>>>
>>>>> Hmm. I'm afraid it's not an option to "leave as is", not the least 
>>>>> because
>>>>> - as said - I'm under the impression that another Misra rule requires
>>>>> macro arguments to be evaluated exactly once. Best I can think of 
>>>>> right
>>>>> away is to have a macro for limited use (to address such build issues)
>>>>> plus an inline function (for general use). But yes, maybe that then 
>>>>> indeed
>>>>> needs to be a 2nd step.
>>>>
>>>> While I've committed this patch (hoping that I got the necessary 
>>>> context
>>>> adjustment right for the 
>>>> automation/eclair_analysis/ECLAIR/deviations.ecl
>>>> change), I'd like to come back to this before going further with users 
>>>> of
>>>> the new macro: I still think we ought to try to get to the single
>>>> evaluation wherever possible. The macro would then be used only in 
>>>> cases
>>>> where the alternative construct (perhaps an isolate_lsb() macro, living
>>>> perhaps in xen/bitops.h) cannot be used. ISOLATE_LSB() would then want 
>>>> to
>>>> gain a comment directing people to the "better" sibling. Thoughts?
>>>
>>> Having the users in place would help me estimate the remaining work that 
>>> needs to be done on this rule and see if my local counts match up with 
>>> the counts in staging.
>>
>> By "having the users in place", you mean you want other patches in this
>> and the dependent series to be committed as-is (except for the name
>> change)? That's what I'd like to avoid, as it would mean touching all
>> those use sites again where the proposed isolate_lsb() could be used
>> instead. I'd rather see all use sites be put into their final shape
>> right away.
> 
> This request is coming a bit late and also after all the patches have
> been reviewed already. I for one am not looking forward to review them
> again.
> 
> That said, if you could be more specified maybe it could become
> actionable:
> 
> - do you have a pseudo code implementation of the "better" macro you
>   would like to propose?

May I remind you that I made this request (including a draft implementation)
before already, and Nicola then merely found that the evaluate-once form
simply cannot be used everywhere? Anybody could have thought of the option
of "splitting" the macro. After all I hope that there is no disagreement on
macro arguments better being evaluated just once, whenever possible.

> - do you have an list of call sites you would like to be changed to use
>   the "better" macro?

No, I don't have a list. But the pattern is pretty clear: The "better" form
ought to be used wherever it actually can be used.

> Also, you might remember past discussions about time spent making
> changes yourself vs. others doing the same. This is one of those cases
> that it would be faster for you to make the change and send a patch than
> explaining someone else how to do it, then review the result (and
> review it again as it probably won't be exactly as you asked the first
> time.)
> 
> If you don't want the call sites to be changes twice, may I suggest you
> provide a patch on top of Nicola's series, I review and ack your patch,
> and Nicola or I rebase & resend the series so that the call sites are
> only changes once as you would like? I think that's going to be way
> faster.

I'll see if I can find time to do so. I don't normally work on top of
other people's uncommitted patches, though ... So I may also choose to go
a slightly different route. (You realize though that all still pending
patches using the new macro need touching again anyway, don't you?)

Jan

