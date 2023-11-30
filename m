Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA83A7FEAE8
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 09:38:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644452.1005466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8cYs-0002VY-C7; Thu, 30 Nov 2023 08:38:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644452.1005466; Thu, 30 Nov 2023 08:38:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8cYs-0002Sr-9T; Thu, 30 Nov 2023 08:38:18 +0000
Received: by outflank-mailman (input) for mailman id 644452;
 Thu, 30 Nov 2023 08:38:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BG3/=HL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r8cYr-0002RI-0I
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 08:38:17 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0622.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd92e929-8f5b-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 09:38:15 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8320.eurprd04.prod.outlook.com (2603:10a6:102:1cf::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Thu, 30 Nov
 2023 08:38:12 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.012; Thu, 30 Nov 2023
 08:38:12 +0000
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
X-Inumbo-ID: cd92e929-8f5b-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=in+7EC1r1ymJQmtlqoE7J3NJZW97AQ1fjO7LHtA4IJbl888Sp+Va63Ux5cY+oyzMvmD4eSdfWa9VaYLgU1HC8e9pMoegbxE8vUn9enVClM3or/N5XWgM/q57qWAniv8MSb6yiD1bH5/SAIPV/cfZxad0Nw+Oo7PIEJ/ecT+F8VtUDvnjJh525j+2+fFuVqZ3fMyGOXQBhZFOn9AEl6uOOw2lG+Ne1zEmZcvAtnEfa5DoqFVS+oQ4EuWnpU2xxWVt64Qu9uLap/Rbxt/z2oxoUh6khNcd5OShDzES5Xk84RldIXAXLELUaQvFQ26Ik3k285eAxy6kYDPRvSs8SqDYbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F/1qNPJ/KMQFL25ruYIZi0LPZh0Ll+yWBxvwWRWGzjE=;
 b=IlW64F3dWdtniSHo5+4hskIjXuzFxlPPZnMRjZImbZqcTAilnjjlObkNqgykbyOfgIbpkVlgV0tlqd4gp0v9ebImkSWOOlRqhzjqjWzDt7CzejEILMjzzk+jUQgi4vEuepKuR0vPlLmTGRmMCfAh9vnkMtCGQjy/XYQXZhPtVW0gK6GEmsu5ef+jmvGGr+zQlLU7uv+7vDory31Eg8g7ZvOofb8ag9d9ck0ez04dUgSaciW7x5PymlqznVvc0rZL7LVQBdt85DVGlI4O+RLO47R2TDx53IvhDhugBWGrh3X8ZNpqkhuo6muwIrsszCmWPuMmXAdBghDeatUObufLyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F/1qNPJ/KMQFL25ruYIZi0LPZh0Ll+yWBxvwWRWGzjE=;
 b=4TTkHJGHtR2n1I6nGpneR7O8zg+oePdsz3nEu04VM3Ig6wcznNJ6nXttQ5xHPHqBXq6D7XiaBhczyiVdMqcw3EjMNWYnLdCulcn4xLQ+akFCszrRME4EG0eZRQNqyXuZoynhbp8H98NnLNmV352eqrDyJQISDBlEgKb6G7FkBr+izSrA6iEUXg+jz+DsvLyKomd7wwEb7nDBMahgbYOQV9Fi3TK8EaKemrL7Bkjz5pyM6wqS0Wg9NEShxe2XFxq9n0FUo3hTLVnRPMwfk/7BeRq1q+NH7Jj3ufllUQ+FzTFlS20YaTeDT0tdEdupxKlxC++U3nmIF9crsuSFg/Fa3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e036094c-0716-43fe-838d-a9cf5f4f1b77@suse.com>
Date: Thu, 30 Nov 2023 09:38:10 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 5/7] docs/misra: add entry to exclude-list.json
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, bertrand.marquis@arm.com,
 julien@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1701270983.git.nicola.vetrini@bugseng.com>
 <538cd0aaacc5af9111c09664cd3c4a4f78ba36fa.1701270983.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <538cd0aaacc5af9111c09664cd3c4a4f78ba36fa.1701270983.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0045.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8320:EE_
X-MS-Office365-Filtering-Correlation-Id: 82d61872-62f0-41a3-2ad1-08dbf17fb071
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o3GBV53uZw9Zbl6og7N31OTjZVV9OLyGngrGiqjk3Rh9uOI8FI7UEUEqTN87v+SiTbn/6MmUDBHaBqYLI4bm4MXEqUXMGo9Tj5ktc/0/GWduiUsVQO4eCLjSCyiN59ZkYNDvYn9QRXQXBxR4/jZrmhnmbRVY/Do5j5Q+TDu9uUl5VMRZT8kA956rB2nGVLuDLz0fukjUFSj3f0PHPEDw0rAoL76qeMaOBIJ1SwFbdKGIC9sldkdZ4+9U+lARGUtWoMQvtnuujMY3O569iStwg4Wu3ktZeuW5+FYfGjoj/OmzFbO7IYwJzgGOVHSfw1wg8WmZYKkLWbDIGkQFrAU30Qu8BpSuxjKWzFnpvkbOdXN/wp4az2Vyo5poxU9zSNtnZQUgkZ4dSI5y1CLUWg3U07sassVG4eOtCyFXLfGnlk/bgOWd3aY6EYaIvsziK6o/vNNzKvFFpKZm8ChvKKD5B17udcSo6IKMYrPwpIzc6r2RkwUeHrEqq2nhgkOwr+sFAeKswla2Pw8/m+i9Bwt9r1EaQ408taAqrmtcluvHOApaIB3h18nUW72cAsRiZgXj5Zy3sFdZn/4aRwQMKZWiw6U/FUQ99GrYc/IdhInBEFxoZxmB3iezexJrRDshCIcOAL0YKKKOWzwDuYlSBGXzpq4IUp3S9GUzqrbShBFA8yqtIVvyjAWOPjRPMfUoVo4w
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(39860400002)(396003)(376002)(346002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(66476007)(66556008)(6916009)(31696002)(316002)(54906003)(4326008)(8676002)(8936002)(66946007)(478600001)(6486002)(36756003)(86362001)(2906002)(7416002)(558084003)(5660300002)(41300700001)(26005)(38100700002)(6506007)(2616005)(6512007)(53546011)(202311291699003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vi90ZTBaUU1CMXRxUXhDTDZhcFBTbitHVEFweEo0Vml6NVBwZXptbHVzMDBS?=
 =?utf-8?B?bllyVHNSNXJnUzRLOUdBbTYvYVVUZXcrNlVwa05KSkhsdms3WUFRd1plZGVJ?=
 =?utf-8?B?Mno3Qllub1N5cG40RHAxaVBFc044bEJNUUhKZms4VXJOMUxQelhNaWxQMDNu?=
 =?utf-8?B?VlZZV0FOc2RFVVZHWm9zV1NWL2JTUUw0VlUzRWZ3WmxKQk8wYTNqZUh4VjVQ?=
 =?utf-8?B?bkZpMFVKdStvNlFTWml2QlZUTDJxMytYVzAzSVRuL1J1WjNjTFN0UEJEYTVH?=
 =?utf-8?B?d3c5UnpGOWRXTENWNEFjSjA3NWI5QlcxZmpBOHdmWm90MlFYcS96ZUxtM3Ir?=
 =?utf-8?B?OVY4RXVIS1pTMzF6ODFIa25UY0dEQ3lQQk4yNjFMYTFNN3EyK1BwQ2RaRnRl?=
 =?utf-8?B?SkxLOXVjZXBaYkIvd3FvRmhUSmxEaW96dHhDbk1ZVlNOMUlDRHNUZGw4T0U1?=
 =?utf-8?B?L0lieEZ5SFMvT2RJN3dBSUN3UFF3KzVIZjZlQTJEMG1kamZpS3RidHdWYWcr?=
 =?utf-8?B?UEN2dmxyMmVIbHowRFc1a2F1LytycFdTSi9KSjhWRFJ2NXpubERJWEt4SHJa?=
 =?utf-8?B?RmVESWFlUllIenFwWEZUYjVZL2JibXNUZTBxa1VqRWljM2xPUGF4RC96KzlR?=
 =?utf-8?B?WFphMTlZVHR6cFRHM1FVdjZsK0oyRlNyS3gxMHdON0tPYkRaRmMrTzNHTzVW?=
 =?utf-8?B?VndxanRrYXBGZzlya3cyNDVwSVJrVlJ3OVRtRUIvd1lmVks2Z3U1NStybnNw?=
 =?utf-8?B?MHVqUGZvRmlVWjBNZlBPZXBJNWp6UW12aE1WbTMrK2Y4eGIweUVyUFBucXJU?=
 =?utf-8?B?bkUrODRxTng3alVmcHUyMHA2aGNVQW0wSnlHYU1EL2FCT2c1blpoMUxFMjBD?=
 =?utf-8?B?U1MzQUpjUk1jdU1jQk10ZjZ3SEVFblErSmZYbityamF4QVdrUlJ3VnBaajdC?=
 =?utf-8?B?SjM5R1A3RW44MnJMbjhyVDhjWFhpUUVtRWpUaU1tRVpvZHl4L1dxalliYThO?=
 =?utf-8?B?MFdTTEFjcUhlazlkbmVCR3g1Nm5uek9NQ1hyNGJMcWlOaHEwTnZUYVBZbkJR?=
 =?utf-8?B?ZnQ4V3RmT0IzdTRNbWZ5dXRnQ2QvM1BrVmJ5NEZGT0FrTGQrTCtZcmFhZGZw?=
 =?utf-8?B?c3VzTThRNHBhVXNTS1B1R05vSGQ5SGFvdTRVVy9NbmxqNlRpNWd4WDVFV0pQ?=
 =?utf-8?B?WSsrc05tWXVKdUdRbFQwK2lCY1VnWjlQcGR1ekFJTGZsRGRmTThjeWd2WFRl?=
 =?utf-8?B?a3pOazhQeUtNZllKd3h5ZUpuRXdZdFlmRGl0U052TzJQY2o3WE9XQmRoTm1P?=
 =?utf-8?B?TlR6cmpPa0dRRGcvL2p4bGlsL2JoNWFoQXVBZi9raTNBVlo1bHVLdWtBSzlt?=
 =?utf-8?B?QjNtUW1XbWxlck9MN0w3cmx4eTZzSXZCbVVrUjN2d1g2c0pUVHpiYTVNZ0hn?=
 =?utf-8?B?aXBhRkswTWk2SldxQm11dWwwcHk0SGZMK1ZFRDBUbjRlQk1USVpiOEMwUEtq?=
 =?utf-8?B?Y01yTXZ2cjB1WEZvSytUNGVEczZ2UTNEOEVmY1R2YVF3OW9wdVhDUC9pZVli?=
 =?utf-8?B?VEFERkVKSGZ1czVVK1VmQzRPZlErSlJzVlZFaFhPVTJhQ2VBc0ZXN1dmYTFG?=
 =?utf-8?B?bWt1MjBkT0ZmL2VVVkQzVDdCVWVwYUNLNFZVdmptY2g4YmpjOHQ3dS9IYVpx?=
 =?utf-8?B?cmpHVVFwdmRVdzlFRDRqbkE1L3E4aHlIYXJ0cm5UQ0xGSGl3WUx3ZjZIaGMw?=
 =?utf-8?B?YjhuUTdXSFhpdzRQTW1RYVEvSDRFUk53UklGcDNKSU5CWE5ZVGJYMXhqR0M1?=
 =?utf-8?B?YS9VUWhvWWVHYUkvYXRuTjFtY2IvMjhHb1hjRkYzK2NtNTVMaEdNYnEwNisz?=
 =?utf-8?B?NENKREFiSlUvMVlrQXRhMjRjQ2ZTMEFBL1FoK2xKOVZXbnExWk9HbnFMN2FT?=
 =?utf-8?B?ZjVIOFZseFhhUWhhay9CUXZtS3RUdHRGVnJaREV6UVVueFAxTzlHUEpvVUZw?=
 =?utf-8?B?THU2WllXVmhrSHI1RVNBREFucHNJSjNlUzl3NUtub0xSQkJpSWk5cU1uY3dx?=
 =?utf-8?B?SE1GNGFqWlNualpZMzBzWmpyNGNyWitiMVB5MVhlZ1FCano0dFhjNDBvdFBk?=
 =?utf-8?Q?OzJAIDgOAOL7S91k4TbHf2XxW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82d61872-62f0-41a3-2ad1-08dbf17fb071
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 08:38:12.7648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cr6D1WUwbvchKCqfOcunZYBWKI6sK+nwHmurn1EEWxWfQEBeEFvJWkAG2ywf8dU8JrwXB5Ii7KRNjephbZxi3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8320

On 29.11.2023 16:24, Nicola Vetrini wrote:
> x86/efi/check.c is not part of the final Xen binary, therefore
> it doesn't need to conform to MISRA guidelines at the moment.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



