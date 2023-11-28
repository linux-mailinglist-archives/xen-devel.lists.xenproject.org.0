Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7357FB4E9
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 09:54:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642811.1002526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7trT-0006CB-J4; Tue, 28 Nov 2023 08:54:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642811.1002526; Tue, 28 Nov 2023 08:54:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7trT-0006AR-G3; Tue, 28 Nov 2023 08:54:31 +0000
Received: by outflank-mailman (input) for mailman id 642811;
 Tue, 28 Nov 2023 08:54:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xcZ5=HJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r7trR-0006AJ-QP
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 08:54:29 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd3ff266-8dcb-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 09:54:29 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9472.eurprd04.prod.outlook.com (2603:10a6:102:2b1::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.21; Tue, 28 Nov
 2023 08:54:27 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Tue, 28 Nov 2023
 08:54:26 +0000
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
X-Inumbo-ID: bd3ff266-8dcb-11ee-98e3-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IrykMD/NEcWBYq0WIafC6nytzlCzD0SGooWC4ztbTw3EoQkIMtS0H71o9sljVM2Dl/uNQwJtITYT2w2O4edZbAHpYFTqJwqCuklhGTgwt59jKSjnd+4b8Y8Ss/2lZ8jyCvjIDsV/j1+tXt5sKC+gmdkaVTPU/Y0aFmv7hv2lpYHucx6BjM/TmfciqHDOymRZm4ojr3/7IiQvX8DdTSomVJcKuMaYhfAyauAOaeOuPKUETAjYQUmAfM8ci6s48Yt9nqseYVZxHAr0TmmC6ybcKUVjedTQLhdZXM5Q+xKqTbARbgG/vEmYLv/+Fp61GKXbKd6G5vtU/e31zPKDHOPZ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i34ThBUw9MpRW6LsQCTqYObUX13WQFuVCiwbDamPOAE=;
 b=SpiOZ721u6Nb7mOepcPJ7DTkCev2vLyGWv9b2+lyNzIdQ14Rq5AuwrnkghareWEtSkB4WGNvnwkTBgB4oo0X/YjRvjvqh67FkpI7EDilXY0XYsdxHhIIzUD6sXlBbOd3yUxPAnlD+p+UQyVm6ufQtx9ydjqwNPE1V0K4oZhC16uRCw/gEKm8HFdPryf3Vi41xO421MCxSPeSswVGt83u8lz4TOOeKE8vHy3LcMlNSk7xGR6t0ywX72J/G3sZQ6Ed/UPB5fmE1C3fXikUXHWq5EERO284eGSYKozE74RdJRhp70o7VnAAnd4FPQP4lHE5fUK5VmDmZiBM35Evx7L/FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i34ThBUw9MpRW6LsQCTqYObUX13WQFuVCiwbDamPOAE=;
 b=bnqr9UidCP6FW67DnWHMdUML9PE2UkEqdaPFzTQrRacY6sftp43EKMtLpuCzqfDrbNZU8KGDckSKhAMIIgIpQI85eonkqdq+6yqB3jpm4Pxul8s/9HMRiHF4USIYhTPg7eb1Q2G88UK0hsAmHBGZvlR2HUE5JvH1lSyMp1gfawoZrRDH9TUHbJLyrr3sN0nsWSIEu1YSTxLfnxFx0OAang6LcmD0i7N10MtUYAYVRE8zW8n3w/yBU8yNGmTOJFVnHGaKYXFbUaWZ60Y9HngvsrcGHFnwSSwi29wOGPsAOZwVhfNkSVwPDTs2uyopDu0jOKa34A/6zDQ/yz9/RN63SA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0c8289f7-63ee-4833-a807-319f72e9b842@suse.com>
Date: Tue, 28 Nov 2023 09:54:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: MISRA: Compatible declarations for sort and bsearch
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Andrew Cooper3 <andrew.cooper3@citrix.com>, Julien Grall
 <julien@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Xen Devel <xen-devel@lists.xenproject.org>
References: <f60a702c838c3274cf9e1193964222f4@bugseng.com>
 <ca540835e3cce50a852fdf2b3956205a@bugseng.com>
 <b3e14bf0-def2-4e1c-83f6-a94a203c7b8d@suse.com>
 <5ebb62b5485bb1a0c4e805af6580ab6d@bugseng.com>
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
In-Reply-To: <5ebb62b5485bb1a0c4e805af6580ab6d@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0295.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9472:EE_
X-MS-Office365-Filtering-Correlation-Id: e4a1e1aa-873a-49fd-0e93-08dbefefa03c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xnmloYHg1qBZ38dk42jO6R9XxRjp+awZ9ir6E1TqUFP+rfCCOC96H63FyDj71J3TuXF1/oWQeHIy3eQqo0LkC9oZhceExShBUUA2j+EIPpeMmkl5gh3K7wyOdJhGSoDGpPkqxUrAdUwGW730MXi+dvpjC6GNhoHv+92/9QWVPslGUExtyhX+51cOgWlM0SoTImjqg+/4NulZjoP23edDFw3d102mhSl+oPnxpEv0unWjnCfok2ji0v8Gp0W16yTB03/SPA1Z5O2QBkSw3HjjdyQbOfe3Lx6KMOU9nAQtif3PKGuQt7+UGi8isILhd18xyM0kqQW7Tkh9X9zlWTena/cReVPw8RuGNc/xAoU8svuYRn6L/N2NHbEHfzm6OjaqjQ6ZP/8dNAoatFwCnz7EmI+vPosu9Td15ATmphvlKRkcC51ISP7Jo9bxonO99uyv6RxEmFH1soXi11Sz6/JLktN+5YdYky8nrzQqYwzUE2AvLc3ytZLFXzzQkitZfRSMalzCKDZfgzd1GOcuAA6ziidByzrALdc8Exszad/0GWWzv1XliJ7XLe3J1HNoh4zZGs/Uk5A3bhzBd8GLMZ1RyvA4Ai+aEVtngNX2ZWN+ktRTlogTcW629rBSq30Ka5ptkZNFwnwm48TL1QmSw2wBRA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(346002)(376002)(136003)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(66946007)(66556008)(66476007)(54906003)(316002)(6916009)(8936002)(4326008)(8676002)(83380400001)(2906002)(4001150100001)(38100700002)(6486002)(36756003)(478600001)(6512007)(53546011)(86362001)(31696002)(6506007)(41300700001)(31686004)(5660300002)(26005)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2txU0JNeEtUUFFkS1Jxc3lxNmR5cDhlcUhMUlVhNEZoUGUwNk90cjFiL0t6?=
 =?utf-8?B?Ym40ajRkYlN1T3YweTFMa0MvbkllOE9Ra0s1dy9uUmtpbjdDWHFvdzhOVnVr?=
 =?utf-8?B?bHZLN0hnYkoreHFvV0ZHekdtMjNJakhVR1F4aUZLcDRGSWNiME5tamMrMnlp?=
 =?utf-8?B?THhheUpxRmNkZjZzcXIrWHFweWZqR3ZUOHNvNnRHTkQ2SmtQMHBDb1BUZ3JM?=
 =?utf-8?B?YUNWQlVuZGcyRjl2eGJhbHJ4YVJLVVZGNnlTeFg5WTgwY00rajgwWDlLM1Y0?=
 =?utf-8?B?QlUrQnRaOE02cVA3TWFRWm9EanVLZkxFbkY5Qm1pN3NiaWd1MkhXWVlzOG9y?=
 =?utf-8?B?aDI5NHhBRkZLZndBa2hvL3lKR3pDdkJ5YktCR2wrSDRRRkVoSTBQeWxQZ0pU?=
 =?utf-8?B?OHhKSTUyc0NHQU1oeCtob3p3MGVuRjNzOG9vL0w4UzlYZFdJRDl2bDRlTlNs?=
 =?utf-8?B?U1RaOUQzSEZXVUhjZGJ6R2xhR3lpcjdWejRkbWVMU2dTcHlEL2ZlaWdSWjI2?=
 =?utf-8?B?T2RvakI4RHhidkIwSzN3YVVyazhvZFNoSENaVDkxd1RNcng0QUU5VXMrMTRU?=
 =?utf-8?B?T3Z5dkJSL01GenVTVXR6ZGpjclp0Z1pZWmZmang4c0piMWI2cnJFcERNSVJI?=
 =?utf-8?B?bGNJSGEwazM3UUhnendYNFp4cVFwTlloQkpGYkUxQTJxdHlYa0lrcWFlMWFD?=
 =?utf-8?B?by9PK2hQb3h1ak1DV3RaUFZHKzdqUDlQR3doZGlIM0YvNHZScU4rVEtWcUxn?=
 =?utf-8?B?cWdKazVjQkwva3k3RWdOc1lHRlBxcEF5aVFQU1RpRTNmZ1dDQVg0QldLRjR3?=
 =?utf-8?B?dGp6UExLTHk5Y3dJOVJTQ1ZRQ0NjVjI2bFpTTGdIbm5KMUFwT25Yb1ZGOWpY?=
 =?utf-8?B?WWFTUXpNTnJGZ1RNTkRGY2RyaS9UR3AwS0UvK0pRS2RESklHb3FyV20vR3li?=
 =?utf-8?B?OFI2T3YvOG54TjJCWFlBbW1TT0xSR09LTGdGanFtYnRMeFdVcWlydkVhSGh1?=
 =?utf-8?B?TGZCdmxhZ0pPWTR4bXJxR3ZoUTZFV1pNNkJReVJUNnU2d0VQSDJzdHFSVmtr?=
 =?utf-8?B?aVQyL0x3UDlMdFFmUXg2TDFSSjhWNlRnK0d1SVFxOWYrd1N4K3pScHVDTGtX?=
 =?utf-8?B?c3ZBM2RYQ3ptcW9MV3lSUzFqWWxUQkJuNExTMmtwdDVlZEg1NUxhem1nR2xs?=
 =?utf-8?B?M0VTSW1BeG5uSFZxdnViaXlMSDJrME55NVRxdG5jYlNaa3AxTlMzVUs4SHpj?=
 =?utf-8?B?OVNIMm5zNEhxQjBFcEk5azlYaVFvejVnVjFPTHlFaGNqSHdZRS96YTRtTTZU?=
 =?utf-8?B?MlcvR2oyUkRSblpFeUtSaUErR0hzQm81L2oyaVdxWXlnTExVcWVENXdrSmh3?=
 =?utf-8?B?OG5kcXhlZmlndG9CSFFhMEQxNVBNMGlWY2phRnd0TXkzRzNDa0RlMktiUTZS?=
 =?utf-8?B?QzZMdit0SnlnTGxTTWgzU2FPQnQ3dkNXMG5rTmI2bDR4bVBRVUVXWEFybDNM?=
 =?utf-8?B?ZU5sdDFVLzZCZFd0U2ZPSGlHSDNldUwybWZsK1JCTVV4Z0VvWTNSZnRwd1Zy?=
 =?utf-8?B?Q1hBeitMRG9MNW5pUEsybUJuNlpCb3h6WDdOWFhrdmFVUUZhMUM4S2xjRmhq?=
 =?utf-8?B?ZzFTUmdGVk1WWVlTVXJFY2cveTBFY1BsYnFNUEtsV1NOSjZaSFVMR0Q0cyt1?=
 =?utf-8?B?T1I1T0g4LzVOZFhLZXFYSitQSWlMYkJBMExhdjVaUnBYdzM3cGk2L2lWelFL?=
 =?utf-8?B?UE0zM3d5QU5SWkhCeVpxeEtsS1BuWnFPYjh1d0IrUHYwVCtXTWpiemNpY2JU?=
 =?utf-8?B?WXl1Y1RnNUZTNms3MHZGdXFDQlUzQ1lHSHc2cFZWUmdWNUtEclFjSHlUbjVT?=
 =?utf-8?B?S0kzeitHcnk1UXQzQTU5aXhKdUJudVovdEhMSHFuMHBNQzhDOHlHdE82N3hZ?=
 =?utf-8?B?bE96WGxJaW03V051SzhkcWQvczhrMk9XaDBaN2g1Mzh4L0hRVkl5VER2Tk5N?=
 =?utf-8?B?YnR5ZE5YWFJmaG9JQ2J2NkRGK3dLUEkyRTZHYXc0SmV2bHcyZWVHbldBd0hr?=
 =?utf-8?B?TFhqa09zaS84SUNUdk5qVnVBeTFCUm11ZEV5d0FLR2NtSWNyNWF4WFFXbHFP?=
 =?utf-8?Q?Apksr9CIrxm+iIETOjxCcVmTf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4a1e1aa-873a-49fd-0e93-08dbefefa03c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 08:54:26.8932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KRrdQKCBNzP6hlzPhSOjUMQbMLxl3O7Av34Uwz80Q6HljtkkmTHNqZwuB0f8tDr6OyzJo6jegsNFZjK5IDUozQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9472

On 27.11.2023 18:57, Nicola Vetrini wrote:
> On 2023-11-27 15:59, Jan Beulich wrote:
>> On 27.11.2023 15:32, Nicola Vetrini wrote:
>>> - compat_set_{px,cx}_pminfo in x86/x86_64/cpufreq.c are perhaps 
>>> declared
>>> with an autogenerated header?
>>
>> I don't think so. Only top-level hypercall handlers would be. This 
>> works by
>> (perhaps even unintentional) trickery: xen/pmstat.h is included only 
>> after
>> set_{c,p}x_pminfo are re-defined to compat_set_{c,p}x_pminfo, so the 
>> same
>> declarations happen to serve two purposes (but of course don't provide 
>> the
>> intended caller/callee agreement).
>>
> 
> I didn't understand your explanation fully; I see xen/pmstat.h in 
> cpufreq.c included before
> compat/platform.h which, as I understand it, redefines set_{c,p}x_pminfo 
> to compat_set_{c,p}x_pminfo, therefore down below no declaration for 
> compat_set_{c,p}x_pminfo is visible, triggering the violation.

May I suggest that you do what I also did in order to answer your original
question (and which imo you could have done up front): Generate the
preprocessed file(s) and check where the declaration(s) are? After all I
assume you understand that the compiler would choke if indeed there was no
declaration before use. The issue here is that there is a declaration
before use, but there is no (suitable) declaration before the definition.
Hence figuring out where the declaration is and why it won't be possible
to also use it for the definition (simply because there's nothing you can
include to achieve that effect) is the first step.

The (as said imo unintended) trickery can actually also be broken, by
simply adding an explicit inclusion of xen/pmstat.h to
x86_64/platform_hypercall.c near the top of the file. And it looks to me
as if adding this #include there is going to want to be part of the
eventual change (to deliberately make said trickery not work anymore).

Jan

