Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A11847FC021
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 18:17:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643365.1003502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r81iH-0002pG-2p; Tue, 28 Nov 2023 17:17:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643365.1003502; Tue, 28 Nov 2023 17:17:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r81iG-0002nB-VE; Tue, 28 Nov 2023 17:17:32 +0000
Received: by outflank-mailman (input) for mailman id 643365;
 Tue, 28 Nov 2023 17:17:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xcZ5=HJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r81iF-0002UF-GD
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 17:17:31 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20615.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 024b2be3-8e12-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 18:17:29 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB6787.eurprd04.prod.outlook.com (2603:10a6:208:18a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.21; Tue, 28 Nov
 2023 17:17:27 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Tue, 28 Nov 2023
 17:17:27 +0000
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
X-Inumbo-ID: 024b2be3-8e12-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=esG61ieHEQHmT4tArz8jZRzw4uLCSwJXmrzWqEIMCnpdPbypUouvy42LRYCANiRrZUeThsKiKL2JV+vkATWruja7aP/MNhBxH63xZmMOinzD+JRtVeR3kq03qd4vIrhKVxqDIoIGwbdIitJwDQJ8MZKr9TEwTJaV2R+SiHVfXXyeKkW4A55Z44N6tqJfi4swqMoyvJwJMlb7jL/Y/pjCFqHTAcI92tjYyinhAKu/gnNmo4J0CqYw14/p98/RnIlGixhp3D9VyLBDiVxC+qrd4fYoy6MrBFrvCUomtrhMxh6Z+BKed+abr0Jl5IA7RW/LLMMRPwxbpcPAB4Rv4hVoBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rWotridvm6muUlq0r5Kr1rhO9uHIL55/qLRxDmhORpk=;
 b=mY3hrM+T/CscOXSsns3PrHCFtlRfh6vX1JehF8DrIQqfJlzKTHSVdWmACE4ZbMerxAVvfVGc2eU36Tlrtt1Uu+sKQekxcFKn3gNup47RIESGkaWBOmc4R8W/dKzegzxB4naRyEE6VFk56hbEYrh+dmh3Ne9LQEz5XcNJu4XKY5fzJcnwLm4n+YGvrPXr7NgYiD2+UAWDZk2iFAL2EePIRUdzRNg8qozP+RtN+UQkiBZz6pxMus+NX4PvxI4u2qZacpkgB4kvc+FF73YUR5v9ISNcOeo8vMKyV8fUARHW+w8660ccYUpPr6oYCk85Bqhvqp2AefoYOzDd1+FCwHyN6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rWotridvm6muUlq0r5Kr1rhO9uHIL55/qLRxDmhORpk=;
 b=EdT+8ZbyGxqI5v/sDbI0APscb9eKM3+V25pGDuJOotnlHK5uYjDN0k8gT2BuHr2Ztmri1l7KdQvGqOSWGw3oNcHBl0MF9Q2761U9fevxAPNeSZDNqjC9AqzGuKguD9rIEXpWuascEfcN6N4A8Do8jBDnyL5HyxNRjetqP6gz5bnAv/OzyvzAuRuKSQPMf1aZTXFklR23jpUgfIknlBchtB2dqEzmG6fSI5wABNb1oMdgThtDm7SkGVvWyfSA/lVcHY399bWm4c8CS66Y4T0vA2kgEQjftSc8ZDdgO6JodkxcqRPwfzcifikvxiTZ9zxNQB7NTcr4buTApdJsLa5vdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <957f7d84-d7c1-4fa2-b006-53f22248d19a@suse.com>
Date: Tue, 28 Nov 2023 18:17:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] automation/eclair: add deviations for MISRA C:2012
 Rule 5.6
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <5826d25aeb31ebd29b0f2aebf3f78e676deb50b9.1701191295.git.federico.serafini@bugseng.com>
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
In-Reply-To: <5826d25aeb31ebd29b0f2aebf3f78e676deb50b9.1701191295.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0076.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB6787:EE_
X-MS-Office365-Filtering-Correlation-Id: 125927f8-298b-4e26-0aee-08dbf035e578
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cAOep2JXPf3cvDnny/MKUn57fBaUuUkz7TnNxcCtc+Sz+Nnr4gSFLhRwcRPDYxA32UMRjByFiJVL8XnLSj9wkmYcMnqJpbdctFP52fRp5J8DayS0H0jlIpRiBEsSP+A7noHaOy9Tf0i/aSbjzjAffuswZvMQJzAMf8jZ0WAl/GyD16dqUXkp6FILYQStkHXgwO3F4sn0u9Kai2cCEa1PZVNT0mlq2y9fL5/Z4pq77q5PfY0U6pmeyhFvLePbf4EGCt3sA5c2Vjh4s59Zl+rfXy146x4covxP+c4ed+u2V1WcOW9b4uQXTloM6crAeCjcydxeZhdcV9DXCCC2REhslA+NVh5kg7YtPGOH5FlNxeVY8/53V/a+gRHhINElp5VNGRNelmzOgoBDT1nyeXNuTY4UbfimMLeMxx0iCS/N9FnjRwJxgmpTni65KPop2Azw9MbQ4IQPuV8+NLlkuXeh5hxZpe2GZrHTVHQQ7FDCy8oknno3Q7mq2b2Pf8ytECTI6yNijPRFYCA9O5WjlvVmgg6dOvLsAl4gL2XPc1Im7d9uCGYHLoT6FFOxEc0IuOIbBk5PKJKD/ilsApC9vlhS/N7cB+NSF4VoWJbBVAfM1LWqTautcYaGgi8rvo4+r4PHNC4rdm3oI5yM/LJxJeEE4A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(39860400002)(396003)(136003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(316002)(2616005)(53546011)(6512007)(31696002)(86362001)(6506007)(6486002)(36756003)(26005)(478600001)(38100700002)(6916009)(66476007)(66556008)(66946007)(54906003)(7416002)(5660300002)(2906002)(8936002)(41300700001)(31686004)(4326008)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWFoOEpvcUNlS2hvNjN2T1k0Y00rWldBbHFRck9uaGk4NVVRUnlaVWozYkVv?=
 =?utf-8?B?aGhMRkQ3SXJJNjJBbUtqRC9wMkV6clU5SHZpeEZNUDIxY1ZtZzhnVkVkT3hB?=
 =?utf-8?B?NmFsNm5vR1VuT3lEMldlaldWZVpFQ0RWY1loelZ4d2YwQXVncGRFbGhHNklx?=
 =?utf-8?B?UXN6ZzNhZDB3eVdtVlFiTlhFdEYxaUpiKzVxblJ4R3ZkMDJGVXpObHJ3WjMv?=
 =?utf-8?B?dnBkOHZNekRzQ0dmNFphMUhPSTY5SjVlUzY1UnNqVFhjdzNmWmJjY290czZF?=
 =?utf-8?B?UjkxRHRvWDYzdVZpSkRrTm5FY3R4N2UvQm1zaXlTN0VCZnRPQ3g0LzBpUGpU?=
 =?utf-8?B?aDh6SElTZzVCejU1Qk9wbVUvVDNGRHZkdW9LZWZDME9nTGRuN0NkWjltamZx?=
 =?utf-8?B?ZzNlVlUza2kyYnkwWGxNYTE4T3hhM1QzdWV1NldnUHJlTmVOT3J1dXVzTEhw?=
 =?utf-8?B?TzdDU0RlalNMT0JkelNaZFJHU05IZVFTUWRleDV6WnE1ekZyM1hOMnd5a3pT?=
 =?utf-8?B?TkR5ZVFTRDBaUDRDeTN6RmEwZEUyNHhDS25KN1ovRVExSHJrcWRyUkp5eW9t?=
 =?utf-8?B?bkJycGMvMWhaNmRySXdlb0NlZGMzdGQydUY2d2FlTUU1aXNtZjlrOTRieEEz?=
 =?utf-8?B?bnY1S0szK1hkcklZR1hwUmdZVVl6R2xzemsvMmN4K2VjeUExNDNtMEcxZU83?=
 =?utf-8?B?TzY4UnA3MGIzem5DT0dyL1YzVkxWUTduSFNDZGVoN1ZpY2ZQQi8rcnVWb0N5?=
 =?utf-8?B?K0VKcHBidGlpOXgwWmRTSmZoZUtQSm1tWmVUT2xBWWdzbVpzZnR2SncwZUsv?=
 =?utf-8?B?SkFEZ0ZuYnRLckNOVDJZN2laTFFpbHNJRFV4RlFHZStHbW5jaFFWdUdoWFlj?=
 =?utf-8?B?bDloQ0RDNEZ5TFJyeXAraEtIRjh1T0Y2VnFVeUtweDUzNFEzQWJ3TzN4NVIx?=
 =?utf-8?B?UnpqWTNURFlraDRCZTd0ckJWaE1zZjdIZ2hKVmhtdmN5QWFhejlkM2RlbjJZ?=
 =?utf-8?B?UENKR0ltTVZqU3Q5L2pDdVpHVlNlQjZYV1RCOW5jUHA1bzhjZjFCUFBwblJN?=
 =?utf-8?B?VUFMTTRVNmkzTXkxVWp0WUk4d2owYlFSd0tVS1g0ZFNrenZYeEJjaGJaWThu?=
 =?utf-8?B?TEdCUWk5eTg4c3lnUWpnUmZmbXAxYjJDWmdFcU1INUs0aUF6ekZOUU9wL0s4?=
 =?utf-8?B?aVV0MUZkRFY2RjBJSTYzWHpWS1c4WXo1eDZvTGxMbkVJNk5OWnlrTkNHYVhX?=
 =?utf-8?B?T0R0RU9hc1VVVTB1MDlXb2pCc3JRTGRzVHpxcGZMV0RPcy96R2F3ZE5vdldh?=
 =?utf-8?B?Sk1ET2c2L3ZtQlF4K3R5Vm1KekY2cGUyci9ETmUvL2FUaDVhWlJlbmF5eGcv?=
 =?utf-8?B?b3g3OHd3dWRKS0tWdWlXcXViV09LOWswYlVtT3dhRi90c3NFbVh0QzlVUExx?=
 =?utf-8?B?S2pKTUNESmxSa0ZGd0hxT2RQalFvdE1Ub0JGWkNPOXExK0g0dHJYN29vTzVV?=
 =?utf-8?B?bWo4dFROOGNSZHV4TVV6a3pFbFMxZGs3MXZ3bTk4VmlKWGI2NlNvWVhOUHZ4?=
 =?utf-8?B?WGNZTzZaZFpjdXhHVXZvRVkxYXkxc2R1ZElqbWhFZkZlVExOdmhXSjEyakgz?=
 =?utf-8?B?MGUzZ2xZZ3RaL3J2L1NzVVRsRERmWGxUcStJRXpvUSszY2lRQ0wxSFVjMlRN?=
 =?utf-8?B?V3ByNVIrVTZiTCs4MUs2WDg4N1kwdWcwazhiM3pBaHpTa2VRK0x3YTRYbzha?=
 =?utf-8?B?TXB3ek1BU0V3MENJQi96c0Y4RkxlUWlEUmNmb0xpMDlEZlVyc3ZUTm42ZUZt?=
 =?utf-8?B?RFgxNXlmSXFTVnpXdjdiSWYxQ2xON29ydjNGT25pUitDcWtEcGlwSFhFQ1Ro?=
 =?utf-8?B?TFBFTmhUdzZHYmNzYzFvTnZwcWJmaGtMNjZ6NVlET2l1Umd0YlF0MFJKczU2?=
 =?utf-8?B?anJkdDdFT3lITHRnNXV6bU8rdjV0S255ZW9BeGFRRDEyWVlMWGNFM2djYTlJ?=
 =?utf-8?B?MXFFUndyQWowRFFRWDdHS2JVYUJFR1pEblZnVDJMamRQMDN2UkpKOE0yTEU0?=
 =?utf-8?B?eG5QVlkzdlRxdXFBOU9IVzF6emF4WXFKOUVOWGdzNzhxUjh1bjFTeXkrNW56?=
 =?utf-8?Q?ZvStz7ydyrP06xInXcl5KKPyX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 125927f8-298b-4e26-0aee-08dbf035e578
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 17:17:27.7980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DFsAan/JjG5aD+uLpmLKlGj9zFJPk3OCyRNv2Gh9VN0YWWBfdUlDKDs7bT8g7F7CA7YxV6JnVGXcrhVV72NfeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6787

On 28.11.2023 18:09, Federico Serafini wrote:
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -90,6 +90,22 @@ Deviations related to MISRA C:2012 Rules:
>           - __emulate_2op and __emulate_2op_nobyte
>           - read_debugreg and write_debugreg
>  
> +   * - R5.6
> +     - The type ret_t is deliberately defined multiple times depending on the
> +       type of guest to service.
> +     - Tagged as `deliberate` for ECLAIR.
> +
> +   * - R5.6
> +     - Some files are not subject to respect MISRA rules at
> +       the moment, but, among these out-of-scope files, there are definitions
> +       of typedef names that are already defined within in-scope files and
> +       therefore, ECLAIR does report a violation since not all the files
> +       involved in the violation are excluded from the analysis.
> +     - Tagged as `deliberate` for ECLAIR. Such excluded files are:
> +         - xen/include/efi/.*
> +         - xen/arch/x86/include/asm/x86_64/efibind.h
> +         - xen/arch/arm/include/asm/arm64/efibind.h

Could these two be generalized to xen/arch/*/include/asm/*/efibind.h?

Jan

