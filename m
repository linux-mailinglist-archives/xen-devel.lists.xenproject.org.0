Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A52802C4A
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 08:45:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646534.1008865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA3dA-0005GG-20; Mon, 04 Dec 2023 07:44:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646534.1008865; Mon, 04 Dec 2023 07:44:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA3d9-0005Ec-VC; Mon, 04 Dec 2023 07:44:39 +0000
Received: by outflank-mailman (input) for mailman id 646534;
 Mon, 04 Dec 2023 07:44:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CG6/=HP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1rA3d8-0005EW-MV
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 07:44:38 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2078.outbound.protection.outlook.com [40.107.7.78])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8a001a7-9278-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 08:44:36 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by GVXPR04MB9928.eurprd04.prod.outlook.com (2603:10a6:150:117::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.21; Mon, 4 Dec
 2023 07:44:05 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.022; Mon, 4 Dec 2023
 07:44:04 +0000
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
X-Inumbo-ID: f8a001a7-9278-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XRVdNthR4QOnOsgGjWTwNJ0/czmG7/rivPUQKdwdjd05yRVqJEEAo973NgWYhpWe3iUoHVnbP8PpHNNpNSoLlcSCSthaTdP8xycC7clIMlc9r4kBYFfgZH2pjdkdTLNGrf2TF022UIHVXO6oZvRwM4UmE1paWTNvk1G32lXm60JiTTi1X93AkvNvqBe7DzQgMmzK+Ik8qOtGFPKiKcmZ9kndu9sFAF+doQ+cURyUVR3GH+a/XgCpquWptXVXnuEgc1R/52FX+YcH1yf2kDRxLUDtsNFijHc3guXgqY/+ooYhmm3d0if6Xh+bxMF0YaIERnpl4iS5fx8SzWLouzoxiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hTnQWDDXK5reUAJZOj6E+h/gCeuGUmuFqw5EW+cC0aA=;
 b=P4O0cTYGGw4yFyn51kXNHvashvL9ncEJNZnory5bO70svmZrPilh3wYAOlNX9vQ+3/4ZGou/WhCutjo7FvrZONdIu4KCl0wRbhVUO10ews+x3wYX0OcJjdnw/Y3jjFTx9pn/vPIXukvVMFvj7gQC5+KU7rATH8BmIV3OOtWgEfbrI+4QXLgBydH43l8pRf1UEA0AWEYwBrSGRhEG/wayRDYCRLqwWkj1rDd4LJx/k6nzDHaEgbc7FGOT3YPD8gpFCDP0XyRb5jyc0Uk9oaITxM2He+2CBH/09GeuNiAk9a3gc8IvJSzQ2e/6SmvY3GZEgjij48YUyOv0Rd6EQG3lRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hTnQWDDXK5reUAJZOj6E+h/gCeuGUmuFqw5EW+cC0aA=;
 b=tF+E58L82nLiQYaUh5KSyhvPrf/Hr3wqFxDDsmOh3+6n2zu4wtO8FGqfKVMFnlZfboCsEXufKAK/5OPpwsYbaw9EgDwWKsrNBc7Hyqo1wE2awwTUHjbCYNrlNarnAUADAJevvSRA0KGtpcMEQxQtdo/ha7Kbk3ttnmW03UfzAr5D7SKPT4kkYSduCzkMwb75HWtQPlHREjlq4CcmIdGqM69EUcBGOdRYD+PGtdT6xtghHlSnkOny3SrEv90/pfihIfIaNT3JQXlJ8N2PFGJ/984rydELpRmgNqBqKeqIvXwU+ndvinuUGf0NpvtBjjERlB4s/8Ou8x0UFi5VNVX7wg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5dae5d3e-81f3-4e78-a92f-fd1cc7eb2ea4@suse.com>
Date: Mon, 4 Dec 2023 08:44:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 7/7] xen/page_alloc: deviate first_valid_mfn for MISRA
 C Rule 8.4
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 bertrand.marquis@arm.com, julien@xen.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <cover.1701270983.git.nicola.vetrini@bugseng.com>
 <1ee69d2f0b9e9a704bf869e2b2700f88a8069343.1701270983.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2311301847300.110490@ubuntu-linux-20-04-desktop>
 <21956d5b-08ad-45ac-96ff-22fe7d54ec60@suse.com>
 <alpine.DEB.2.22.394.2312011901450.110490@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2312011901450.110490@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0190.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|GVXPR04MB9928:EE_
X-MS-Office365-Filtering-Correlation-Id: a78fceab-ab22-43fb-7b2e-08dbf49cc9b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6ZRy4OtbDF5Isu085tVxPLPaMmrpqX/o3jUO7oAgNxpUMJEhwHsXldbbrMh8XADPKOwm/ED9wB8hmnqkYQ1a2e40ufIRqbxmMqEDl1JNqcNyO/04NqghIpTKbUwLBn8P9H5RNGbu9ituyYJ9sxB7E6ql3tJIfk8CyAjwn6XY59j1Bq4QQjrKMU8ew8e1zy2TDxcpvPkEPRf3zLbLeCBKpxxDuk5o9KoqESOiSjCry/WVs4RgJkp0NF/AP+jOC2Dknta0qJdDbR1HiG5KB8W7zocJRizykh+G4+pIJUFtoZg5SyJISwehcnHVP/MfG75J0Po0j6JwG63gBsOBljBxSm4fYqpQE/dejD6RCGK6Dl+QSz6w5MDiGzM3w6i5I2YeKfcpq1mR90GZld57/Ems2AWVVnGPyzZ785sFDGqQunf4wgYqHnaXOULdct+Jlg67TkfYQ65+TsiLw76l6314tPUlCJUBRdw/6X2YzGZzwbnuJkrWy1wtme7DvXEY2/rEdKNjMtd2dyLaJrgbUEGuXXmlFozJtpyWUAIgwsOJJ5e4/Li+fo27CxMaARFDdXrRBzqVRx0nHW75FItPElnj8JYIV2hvDmko+6hHE7JwCfIQbkA7fTALdK843J62vrJzMufxOPMS95uncyAHptoA0Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(376002)(136003)(346002)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(7416002)(5660300002)(31686004)(54906003)(316002)(4326008)(66946007)(66556008)(66476007)(6916009)(38100700002)(41300700001)(2616005)(83380400001)(26005)(8676002)(31696002)(8936002)(36756003)(86362001)(6486002)(2906002)(53546011)(966005)(6512007)(6506007)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjVZSDBTRkdSQkY4MmpuSkUxTU85V1FoZFZaSUU0V3NLUktxUHdKYmcrVmdt?=
 =?utf-8?B?aUFZcVhqcjJGUTVOdVpFbElyZjZvMXZUZ3lGb2pWUUlSb2pkK3BwRnkwUUIw?=
 =?utf-8?B?VzFseUdEOWpwbjVsZlVrRFE0bGJpaGpObm9MVUp2N2gyRWpTaXp0QmpiYyt5?=
 =?utf-8?B?elc5cFdUMFZzNGpCYW9RRUlEQUNQNXNRbDJSTG9HcVdMTHlhQVJXa0gvQzVW?=
 =?utf-8?B?YTcyNENHamJhVXVmWEQ2Qlg1YTd5SzVLRldsWkFUc0U4cjNKSFplTEVVdncr?=
 =?utf-8?B?dnlOUnhIcFZRUERhdW9lR3FVa0dvZllVZ2Q2Mlo5ckcwNmh4SHgvRkZkZ1Zh?=
 =?utf-8?B?bWlrMUJMT3h1cTJNMVdsa1RiczBBOU5ycWZrejdwMzB2MWZkWnRRbjMrRmJ6?=
 =?utf-8?B?NGVjN21wdHBhdUlMa3NOQVpNem1lNGY1ZE9MVHRWMTBScG1nK0xaZ1h0MHYz?=
 =?utf-8?B?NDhuaUtvYnpvcFBlUDJjenorMXd2ZWVCQ1J5ZytEVFAwdDRUWWNTZUNkQzlm?=
 =?utf-8?B?TER4ZkpvUDBJb0oxY2tvUlI4NUNsYWtvOGNYUmZuY0ZlelBMbW9EWGRlaGQ5?=
 =?utf-8?B?SVVUZjZhVUlkZ0w0K0hsUkU1R2N0dWZSNmN0b1NHTVpjMkJUUWttdUNYL1hP?=
 =?utf-8?B?dzR4U0t5ZmFoemhYVDhQTjJUUm9RaUJXWUdkZVRuT0pQZ2JtdUJwNVV2aHFN?=
 =?utf-8?B?ZHdNTnUxK0JVWWVYNVE5VmdjWUFyOTRuYWFUVFhCT0M4RVIrSXZtQ1FhSFNM?=
 =?utf-8?B?NUwxK1B4STV0NDcwNklOSlBmZ0tacXRnUnNmQ2FTcGtCT3ZWK2Nya2tZcXcw?=
 =?utf-8?B?NTlhOHhoQUhBUjNIOFN4dnJMa0F3MWVENFl3MmRDQzRzZGJJV2Z2clNNd3k4?=
 =?utf-8?B?Mk1ZelB1YjhvNzFJNE5IRnFoeHQ4eC9INmc0VEkxRGtMWHJEdTYvdmVJbkNp?=
 =?utf-8?B?YkJ3TWdYOFdXeG56NjdOc2xURCs1MzRTbTFGd0RhZGxuZnplaVpKRXRlMk1H?=
 =?utf-8?B?emE2Ny9pTFRma1FQNmZnckdFT1c5YzFDV0hqTmRPbERSU2dFb3JBTUtyczVI?=
 =?utf-8?B?WldHZnd6NnpxZzk2bkk1T0duUXFkU2ZFblFPSzVzNkZqeTFvZlJQYm1BdTM3?=
 =?utf-8?B?ZDVVaGhGbGF3a0QyVjBtTHYwWGh6dEFTY2tLYnBCVEVNQzJIaVdsNGdJSjZj?=
 =?utf-8?B?azlZd2tOR0dGcm9qNFB5d2Z0UWlsc2VFVEIvOGcwd1hWaWxyQmoyOWZ0UXk4?=
 =?utf-8?B?S2ZjamVHYWQwTWtGRVBmMExQNHFFTitqTE00Q1V4M0pNVDZVVXRmY0RCU0FC?=
 =?utf-8?B?THJ1cjZFcm1QSGZIdmNRL2lncFgzTFNVWG9aN285eFRoWnNwVXhtelM4SmRq?=
 =?utf-8?B?RDEvKzdiUUtzb2dLRFBRWjhFeVhlZHVNTUJadHgrYzdzYldpVG1NTVo3M01E?=
 =?utf-8?B?cHpxanZtQ2tNVHIvQU9YY0N1Z3hxVzRQVjdVQnBrRUsrMmdvd0NvaFpuVHM2?=
 =?utf-8?B?Yk1nWHBGcmw5K1ZJbFZHYWVTa3RCREQrd2xkSk9ocHhiT2dtSTgxQ2tTY3Q4?=
 =?utf-8?B?ODU2SmR1VHIwMjJ0ZVdPbk80Z0ZUcGsxZlJDdE1jOU5yNHYxZUwrYlhQZ0Iy?=
 =?utf-8?B?eDlML25CMHNTVmRWQk85TzdKSng5UWFEbkhnM1I3SGx5OEltL210dnM3azRC?=
 =?utf-8?B?Rm9UMFFzUDZuVmVKc0tGME5IQUVxeXVzUVJrdDJhK0NoemYzNVdnR0YwWXNS?=
 =?utf-8?B?ZjdHd2lqRFM5Wm5IZ1MyaXJWUER2MTlScmd3MHFPNENvUTc4RHZmYVY0N2Ny?=
 =?utf-8?B?OXpRUVFNVzcwWVR1N3VPcC9OQzBtaG92eER1SWkwd3kydGx0SXVnVzBvNW1F?=
 =?utf-8?B?Y3lwNXlRRDJnV1hYazU4WXJGZ3VVMTZWMTNSVEFZRVR2b2JpcjdQTExvajVw?=
 =?utf-8?B?aTl4cjNwSWgvazB4cEFyL0RmcDIyOUdwb20xditkRUtDdVJmano1anpTT29p?=
 =?utf-8?B?aGtncDI3dDdhUWlrWTBHVG1qWm52MDJkbG84K3RYU3JBK1NUdVJRRE1Tc0Zl?=
 =?utf-8?B?TjdUQThvZ2NSamhYeENXcThjM3JZekFnaUh3aWpOT0l6ZEpsYUMxTnd0c1BD?=
 =?utf-8?Q?omCl6NumgzIimRxC6yoaKjHTU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a78fceab-ab22-43fb-7b2e-08dbf49cc9b1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 07:44:04.0337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cf09tDUmwWJUM/d8vlKjSphXjaGK8zHeFrF20V2JAS/YoOn1p2w5BNBFGPLDYOUmGDwmzXeajIZFzgGbcCkbxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9928

On 02.12.2023 04:03, Stefano Stabellini wrote:
> On Fri, 1 Dec 2023, Jan Beulich wrote:
>> On 01.12.2023 03:47, Stefano Stabellini wrote:
>>> On Wed, 29 Nov 2023, Nicola Vetrini wrote:
>>>> No functional change.
>>>>
>>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>> ---
>>>> The preferred way to deviate is to use asmlinkage, but this modification is only
>>>> the consequence of NUMA on ARM (and possibly PPC) being a work in progress.
>>>> As stated in the comment above the textual deviation, first_valid_mfn will
>>>> likely then become static and there would be no need for the comment anymore.
>>>> This works towards having the analysis for this rule clean (i.e. no violations);
>>>> the interest in having a clean rule is that then it could be used to signal
>>>> newly introduced violations by making the analysis job fail.
>>>
>>> Please add this text as part of the commit message. It can be done on
>>> commit.
>>
>> I assume you saw my reply on another of the patches in this series as to
>> asmlinkage use on variables? IOW I think this paragraph would also need
>> adjustment to account for that.
> 
> I was going to ask you about that: reading your reply
> https://marc.info/?l=xen-devel&m=170142048615336 it is not clear to me
> what you are asking or suggesting as next step in regard to asmlinkage
> use on variables.

Either we need a separate attribute, or we need affirmation that calling
convention attributes are ignored (and going to be going forward) for
variables, or we need to resort to SAF-* comments. I'm not sure what's
best (assuming the "affirm" wouldn't really be possible).

Jan

