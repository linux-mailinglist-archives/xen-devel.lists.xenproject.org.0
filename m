Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B1B800628
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 09:48:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645358.1007489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8zBj-0006jA-TG; Fri, 01 Dec 2023 08:47:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645358.1007489; Fri, 01 Dec 2023 08:47:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8zBj-0006eu-QF; Fri, 01 Dec 2023 08:47:55 +0000
Received: by outflank-mailman (input) for mailman id 645358;
 Fri, 01 Dec 2023 08:47:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jO30=HM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r8zBh-0006bO-Jw
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 08:47:53 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20615.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 501bc684-9026-11ee-98e5-6d05b1d4d9a1;
 Fri, 01 Dec 2023 09:47:52 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7363.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.11; Fri, 1 Dec
 2023 08:47:49 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.012; Fri, 1 Dec 2023
 08:47:49 +0000
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
X-Inumbo-ID: 501bc684-9026-11ee-98e5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IM6Ca9Ihh6u7ZCkUmzO1f0rW/VwtkjrBZYRqM7RxUnbnPtRQa/IXsgxqG8zFByo8U6qGJtl3SbjtLLe8hrzgcsfBXNaWXVALZrsymySWIg5Q2+t/Mn+yu4KJTEfXWkCAaytR6pIp6uDCyc3cDkkUU/bsU97Neh8/UqajHP1DYlxhQWNIwaPZJtf+t/QwqfKcTRv9StIig+5QR1ayXLxOyo8LDota8/kSq0r8b/ke4n+CJXV4Z1d6D3R1vDFP/SvxVIj+k/y9ADCXALTKJw+X4WBZVyr7m5kV1I/u8xmR0XwlAbl7i32rx+UgCn+WiIQig0ElFtjVL+9aC7aDphE0Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CEHChxh/eplANRe4gyktVXGXTWsC4x+ZsBVwLKuG7tk=;
 b=UP5bqWVH43uuIrHal7OJM3BVcPwA0MuCBwq0ezn9bRHnE/eoNopy7++J98YzVTouS+eoK2AsqBIX2Ndcs5XpoezKutHcluqNK+KcT0V7CoBzfnxW7yc0S4Anos8AI3HzJ0dkN6cfTWlYKgvrMa3sAAn4wYE2agNJ3dDpiPEImCm3GvsV+cgczNmNe5afvhf/qJgH0sRS/xG61OZ4xkLLkJNtNuxdQ/20jy/ih/4X9VwRa5BxA1wO0eoojM8PiTHCvg1KxnfNAmysK/upL/xmzNdpDJqVP8Isfnbq6KYJ7WfNlrbJp+KtMcSkqNntTrbPCkGlwCoqdEL++jSiII6YuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CEHChxh/eplANRe4gyktVXGXTWsC4x+ZsBVwLKuG7tk=;
 b=I0Tka4W77W4roAm7gt2InqliViiQsR0v3cFVmnccmxveq0D52g9AO10SX4JjXyOjL5euTZN9Ay31x9HW/h3A2HDSvuW2b8LP439OFbMr+sBmthPfOh9/jDmFN+Ymt4GxnZUeeoBhRGSMfhzDyUOmBUOFJIDYXFSxVo5O5xGpVJzUhHjc+PbgWnImfxN4eqSOUKm8aX4VCJlwspaohgzFUd9lkexfo+BKi2Y652KlEJisJ6VYYlqBAKqII6tP0hxHWR4zjHgZfjDDLzVRVVJ9Rg5TiFpw0Dro/Ew/2KTb0arycE0QVc3RHnCas6ve3yHuFEQy5LBHzsFtdUgQHQBpbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9f202a87-b41c-49e0-bce5-6224a03eb810@suse.com>
Date: Fri, 1 Dec 2023 09:47:47 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 3/7] xen/x86: add missing instances of asmlinkage
 attributes
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, bertrand.marquis@arm.com,
 julien@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1701270983.git.nicola.vetrini@bugseng.com>
 <4815279026ca4e2f1d93c98bfe6ea51ee139280d.1701270983.git.nicola.vetrini@bugseng.com>
 <918d258e-c10a-4cdd-a598-3b5dc0124de8@suse.com>
 <d48f43185a08874aa0f44287a8023f13@bugseng.com>
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
In-Reply-To: <d48f43185a08874aa0f44287a8023f13@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0199.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7363:EE_
X-MS-Office365-Filtering-Correlation-Id: af3e7e79-4e3c-4aaa-66f8-08dbf24a329f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WiK3mm+kYVsihqQsUzwSKNmiDoqwjFqcmhR/7PsRppe6Pah5OE4cgdbjh/N7DEDvYXC1Y7XNQFG1KTBc5pdUp5ISQeSRVPNtVnKckhGwcSlZqNLE/rNqu7NNN/Xj1fKNDOnDxl2LCBrMm7Qt4G1u5yXrxXmHK+KEh3lUxdZVA97GaRvrxmzsyEMcChTITNKDvRvHtkuIWXqiagyaspb+UGb2K038bOIY9mZEPn0Os8W4C9NljF4Mis2DfTDK+QLLWtAq0Sd3XtAH1pvZEL6QviRMMnDqWjDdKBQUh3iKMYJz+/cggj/nU7HRKaoyxQ2SEHHKrQE1dyldT1jbgtcq8n5Ysrp54ZY7ZgBmpKkFqCpRwKMxakl8sbH0Sv9IBhvfrVhGColp9bvFonOCD8ITyBrwyns9K/Q2ST4/nS3BZ8phnmidsTzxhBWQw8eILjj10ra6wd1qxALcXToKI2O9uzvAWOxV/MSqV6IM6v7mqt/P//ZGFQAWV95wadt7fC71rSxqNfc3oHMRfJLXLcweKiw/LhP1cNg6RR22XD8Sfi2FY8O+/rAFCLAw/BhThp+yKXsdodeOEqE4MK320sDsW1kmUUliwkCtLvf1LzORtRVH8cjhw2NltiuibEXtfQpAm1pYVz2Xh4FBbRbv/BXftw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(376002)(396003)(346002)(39860400002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(6512007)(6506007)(31686004)(508600001)(86362001)(66476007)(54906003)(66556008)(66946007)(316002)(6916009)(26005)(2616005)(83380400001)(53546011)(6486002)(38100700002)(5660300002)(2906002)(7416002)(36756003)(41300700001)(4001150100001)(8676002)(4326008)(8936002)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VHU4N0VaaVVza3REYmw5QmZ5SmFZTkY4Wk9aRnh6NU5lQlhaVEpObkJ2bnpl?=
 =?utf-8?B?c1M2UWRUbWs5cjM3RVhLYjdmcSs1cGNLUkxSWklaWDFqU0IrRjhHVU5ZVTg3?=
 =?utf-8?B?TFMrUzAyTXdHY1luazJNWkN1L2lsdU45N3hlRmdsZno1V293dXU2MXpucE43?=
 =?utf-8?B?bVBRd2RaMWk0emMrZ2hKaU5XMzc0VHh6SXJnTDRsdHVOOGZlUURzRFR1SHB1?=
 =?utf-8?B?V2tNclp3Vk5ZSkFTMEdzdkdDU1VKNHBOK2tGRVAxdXN0bzZUbUZJbmg0ckh2?=
 =?utf-8?B?bTBDdzBMSTB0dXFaNmJPUW0vMmxBQlZ6bzFhN0lRZGVvd1hpc2dWYmlKNDFl?=
 =?utf-8?B?S1RTVkJXVmxCZit4aGdoUG41ZnhQT0JCNFM1YzdiNDEraHByK2F4ZnVNc05h?=
 =?utf-8?B?cFpjelkxbmsybmdSY0xXd2NoSTllSHNDV0tJVW42TVZpU2VvMzc0RGczRmd0?=
 =?utf-8?B?WDVuRnNkZGJnbHBoMmdQaHJLWldqOTMwK3F6MG9CWW5zaEhrYkhVaUJJdW5C?=
 =?utf-8?B?T2ZROFhpMDd0ajRGMG9xMVFqeklxdmRZSEN6SVNQditZMVdzQWhwbXFmV1E1?=
 =?utf-8?B?bE94OGs0UG4zUUJST013QTY5NGdUL0xBeTczVXVuS2VDamVwT1JZU1lqS1FM?=
 =?utf-8?B?N0lJS2JuakVUZzJLUUZvZmNlbzJqb1JOc1Vlc2hidUtCKzcxd0pQaC8xS2VH?=
 =?utf-8?B?R3lYQ1dEOWlDdEZycStDdmtlcVZ5NExzZDRqeGk3OVN4RlhqOVNJNHhaaDFi?=
 =?utf-8?B?akJyYkc4N1pvVm5QdU1BMHdmaGtncmlZZEVlOHJDcUNuOWNIaERYQVhUcFZx?=
 =?utf-8?B?NW0wMEM4azRJNmZVcTBpNWQyMXNSNnJUU0hBdFR4bFUzMnJCajJHeFdtZGF3?=
 =?utf-8?B?aTkrWi83RHJsWWVZRkpnTEhZYmRyUWdNYmI3V0NadmpOd1RWaGdZcmNtUERG?=
 =?utf-8?B?bTlwUmJqL2srYzk2S3ZZWkdDMnZ2Zzg5aWQ0cGVjOWw5VUlRZmdYZk12UCt3?=
 =?utf-8?B?WnEvTGhmR3VDdzByMjdyUzRXYUJUUE5nNmowQXE1eDBhZTdueEFocVh5R25J?=
 =?utf-8?B?Ylc1ZkhVL3Y0ZmMzajRBWmJ3bnQ4dVFic0xyOC9EeWgwamlYaFZ0TktzVktX?=
 =?utf-8?B?d0YvV1E5cFh1Y2RMMDVwOWtGMzZWK2t3aVlIOHZ6K1VUZDZEWm1NMHVlSHNI?=
 =?utf-8?B?eGJkZmtISmpibEtNMU9hclBsU1M2Z0p6U1MzampnTCtlaEEwdFlTK0poN0xG?=
 =?utf-8?B?bTA1NDRDeE5nNVg3M2RQc2tIUFBVT09lMkg5b2hGTVVaU2t4c1FQU3VPd2VJ?=
 =?utf-8?B?MUd2Y0hrcDVDd0k3VUkxdzNaMXc3ekQzZklqUU00ZFFuYStHSkJoVUErZVpo?=
 =?utf-8?B?Y3lUamFGaFlWaU5VbzNES29TRkk0UTRuNjM0NlFEVjNmMmxpVWxwVWNqb3d2?=
 =?utf-8?B?T0F3Q1FHTjd3RTFNNTRzS2xuVjc5NTlZbXpSczB4QkJQMGcyd2JyZVhTeDFB?=
 =?utf-8?B?czdZVTBkZnJZSnFHdXBURlVvT3RuOWIvUys1RU83bjNObjgwNEQxRHdNdVZi?=
 =?utf-8?B?di9TSVBtTjBUZmNnbVlZcTh2Q2FLMDR1c3l4aitrTVVRYjBDNWtMbXRQS0Rj?=
 =?utf-8?B?SGNsbS8xWjczVllrM1R1SGpBUUlHeXBOK2lYUnZwdUc0OXRTUnFrMFhlYzgw?=
 =?utf-8?B?RGUxMmtPY3VFL2Z0K2FPZGpUMHRFM0h0bG5UVDZyUjlUNHNlVFFIci85bGNp?=
 =?utf-8?B?Slk3Q1h0bGhoWGNzNUUwMDZTbjR0N01IQVkxcEpoNHRWZityUE9zN29rcVBD?=
 =?utf-8?B?R256Nm9BeUxjQVEzSnkxcjZCbFljUmFFb2grdmE3MU1iZXFnRGl3dVdYd1lK?=
 =?utf-8?B?cDlXenRQVFoyUmYvYVJyVVlrb3Jib3o2eWhIYjdGb3BENGNpc0haQmtGVTcr?=
 =?utf-8?B?eE1HdmlLdXdHVHhtQ3RkaEgweDRlT2dUcU9WbFN0anp1L3Zqb1MvQlU4dENQ?=
 =?utf-8?B?M3hZenN4TDhJTkZyTzVoMXp0dE5JaDF2Qi85NXZwT1BMc2dyMEVvUTV4WlJR?=
 =?utf-8?B?SXRKWFRrb3UxWTAzVm9uZHAxZ2haMWVzZnVhOFJadVg5ek1kTkNmQ3NPclk3?=
 =?utf-8?Q?NSuvyklM/m54YUIlelEjkfqb5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af3e7e79-4e3c-4aaa-66f8-08dbf24a329f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 08:47:49.5300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U0ArTxSxFp6sBGS1+/FtwcE4xgF+6RYW145CSYMki/QMnOwxulYltg2rK4utuGkekAnrTbWOxIGeobaEYc01LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7363

On 01.12.2023 09:42, Nicola Vetrini wrote:
> On 2023-11-30 17:44, Jan Beulich wrote:
>> On 29.11.2023 16:24, Nicola Vetrini wrote:
>>> --- a/xen/arch/x86/desc.c
>>> +++ b/xen/arch/x86/desc.c
>>> @@ -91,7 +91,7 @@ seg_desc_t boot_compat_gdt[PAGE_SIZE / 
>>> sizeof(seg_desc_t)] =
>>>   * References boot_cpu_gdt_table for a short period, until the CPUs 
>>> switch
>>>   * onto their per-CPU GDTs.
>>>   */
>>> -const struct desc_ptr boot_gdtr = {
>>> +const struct desc_ptr asmlinkage boot_gdtr = {
>>>      .limit = LAST_RESERVED_GDT_BYTE,
>>>      .base = (unsigned long)(boot_gdt - FIRST_RESERVED_GDT_ENTRY),
>>>  };
>>
>> I'm not convinced asmlinkage is okay to use on data. Recall that in 
>> principle
>> it may expand to an attribute specifying a non-default calling 
>> convention.
>> Such attributes cannot be assumed to continue to be possible to apply 
>> to
>> non-functions, even if such may happen to work with a particular 
>> compiler
>> version.
>>
> 
> It's already being used on variables, I believe.
> 
> xen/arch/x86/mm.c:l1_pgentry_t asmlinkage __section(".bss.page_aligned") 
> __aligned(PAGE_SIZE)
> xen/arch/x86/setup.c:unsigned long asmlinkage __read_mostly 
> cr4_pv32_mask;
> xen/arch/x86/setup.c:char asmlinkage 
> __section(".init.bss.stack_aligned") __aligned(STACK_SIZE)
> xen/arch/x86/setup.c:unsigned int asmlinkage __initdata multiboot_ptr;

Yeah, I was fearing that something was overlooked earlier on.

Jan

> If you have concern about this particular variable, then we can fall 
> back on SAF or just put a declaration in the appropriate place.
> 


