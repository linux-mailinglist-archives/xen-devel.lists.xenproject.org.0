Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7206FD90A
	for <lists+xen-devel@lfdr.de>; Wed, 10 May 2023 10:16:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532691.828942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwez6-0006fH-Gw; Wed, 10 May 2023 08:15:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532691.828942; Wed, 10 May 2023 08:15:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwez6-0006ca-E8; Wed, 10 May 2023 08:15:40 +0000
Received: by outflank-mailman (input) for mailman id 532691;
 Wed, 10 May 2023 08:15:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WIjz=A7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pwez4-0006cQ-Mw
 for xen-devel@lists.xenproject.org; Wed, 10 May 2023 08:15:38 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20631.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d769ac69-ef0a-11ed-8611-37d641c3527e;
 Wed, 10 May 2023 10:15:36 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7672.eurprd04.prod.outlook.com (2603:10a6:20b:23e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Wed, 10 May
 2023 08:15:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.033; Wed, 10 May 2023
 08:15:33 +0000
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
X-Inumbo-ID: d769ac69-ef0a-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g5C3D/jZEFfnCcULQAWGM3/tXogwdQpun9MwJgdvdgg8U20jbDZRFTIsHZCoPzN5C9zRaikoTMCgqSOlG4MDBOR/+e5AJOgaV8cra6WTp5Xf6w31CHFPhDnBosxF34eyE072O9aNYqwiyAreHlOV3/9Huk96sHQf50GDLnUAAAuaVdDG5LVGYYrySy/ZY4EYg/oznhIDGb7moytf6kFn+diUoNDARfYj/WPbNX0mSzTn5/KP3WpTmJE2ij4vdMNAL5oefbjm5Mgmebb4GF4BqnYWFl7jBYk1AAcHNJLDrkp0vLAmpN/yUriyoPS8n4BiafcARnsab1TiluyYKg0zoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2nTaZG5JSa3b9kU2fi1/OejC6IzTEZM3QCV2ZpRwL1A=;
 b=SKD9RaQNMlMTC53HLWjXBfJ1WecnnXd/3Dn2BJYUwHpO8OzLotA5b1tk1Wwn1wrdnN/+60TRzKsbx3mkcb0FeFCr6+v9/xn9btnZo7EccHN73n1ReR/1nAWPpC9SupYVgI/53aPyFB/U4XK/JvnDmbh4atRJ6gavYxIEbr5kihUe5/iKFWAi4mw6CXuguBe2Bz9DguY9vFt8ujxeqcLA/mzrNBTLeutN5LuHqk0cNeOQQuxCTbWGaBdzhLjCGwAq2Wu+NxJb0o0lA9p3UpcFG78DbMWqf+/7rbn1QWXF21bWkY98gfEbn/XkkFGiYO3GSOLwZ6uR9PIXc0qsOee/dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2nTaZG5JSa3b9kU2fi1/OejC6IzTEZM3QCV2ZpRwL1A=;
 b=fbveqnn6nYNlteY6DCyd8AAWCM9Q7C1s2yWiyyILTjrlbO0QIpBeUZkMM8ffjFYYh9URogy5CLfWjM4xoAxoG7dvgypf6Jy8irs/tSVReWcICHhJgSwDvoMRRHkVjmtISzyllvTfapcbFWXTL6KykC1OzSGutN3TYvvjYohjIvszlPgdP5sVo0kc6VteCz+3wDfc7CbEtaF/xcBwoJtHURll3tP/qFCnIsub7/yap6BUAGIzl+9C9RXYVt0J3gnSrwzj9v69yMXxRcLPhxBExw5guEThy4TwQ8xAldXTsNDEM+IJzw+VJxdsqWL7stSBNGzWHffu0M7/qLBS/daZDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7d41940f-e671-954c-1afc-510e4fa674fa@suse.com>
Date: Wed, 10 May 2023 10:15:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 3/3] x86: Use CpuidUserDis if an AMD HVM guest toggles
 CPUID faulting
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230505175705.18098-1-alejandro.vallejo@cloud.com>
 <20230505175705.18098-4-alejandro.vallejo@cloud.com>
 <d8c9728b-b615-7229-2e76-106d81802a20@suse.com>
 <d0794e7d-604e-044f-000e-3a0bde126425@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d0794e7d-604e-044f-000e-3a0bde126425@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0130.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7672:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b309d85-d4c6-4cd9-ab87-08db512eba31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DJrg5iYe6kpovItnCUsynYiJrv+0yR7mb1X9XDcX+vptPzyHcYvLcHmducz9wE632q5raN1+rpF+fCNN7F4iGAGMm2YcUi7N6jZOqFjY72fR1aAniyA30qCgNFJJWPQNtDIxjZ8X0OuTJlYMoCIMMJ/PgLyGWg/jSB6zPtSVA8lu01/FM0Z2PHpNXUa8V7pYzLxfI7qncT/lNGMrQzl9z85R0HsV5BPMnX6wwV5AqDVqEDLdPHyhEM3J0YYx1vQl+FWrwjZcTwXxDBDUYKfK+3kdYKpqTfPsM1DkLBDJStQPYWoo3ddgjuOoE3cGH8nCKOHz1ekDuldPF9ql2Uii6CD0hvSA49z5sDXz5bUTdbXDNbRClJMNDd4qw9q7zBIiqoqGJEptuSNi3kfSBILnQATyNOx3WlVOuO26vGxQd/uYvjQRPfko5BPP4hVDAjOolxMwlpPust5L9nUnloLV20I1AKMFDZIyEvGexGX/HNxV6GxoJoQ1x7uKe/WIxXVjKFxQ9sxqUAEyOIgKwO3oHwwnFZM0pCxw8Zgsvps+pDVsu1FxkiOYulr0vhPE7ZQm9XN8LpoeS7PMZ88A/0ddGgtSksvZagXMaqssFtgzx1EfD3r93E9jR7sE9mX94vn/N/9wM4pxEbz8iIz3+BzD7g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(366004)(136003)(346002)(376002)(451199021)(110136005)(66476007)(66946007)(4326008)(316002)(38100700002)(31686004)(8936002)(8676002)(31696002)(54906003)(83380400001)(26005)(53546011)(6506007)(6512007)(86362001)(41300700001)(5660300002)(66556008)(478600001)(36756003)(2616005)(2906002)(186003)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2E4M0NhWmJuNFo0WmpNc0hyU0p5b1ZtL2EwMXg2WXNEU09HWStoRnZEalB1?=
 =?utf-8?B?elh2ZjBrY1k4dWxhem1ZdFhyU3dDMEZGb25qU2lXaW95VEhRRXExSzhQTHJU?=
 =?utf-8?B?dG1wQVNFQ1l1czF1NndQUVQ5UUlEZDNMMkkyNzlkOVNUSHJBVEZ6NUJyaUwy?=
 =?utf-8?B?eEFsQWlUVFYrR2d2RWZRanVFMlZMVTFJbGVsY2hkUVk1N0gzVHozUTI2R0da?=
 =?utf-8?B?c1htenhkTjNleTh5TlFkU0txcmhhTzZZQWZCZ3VqVXJSQ0RMc1FTMm92VTlz?=
 =?utf-8?B?dGd4WjNVRFg1c090bnZhMU9mdEdJcGpocERaY2V2QTJJT1RwMEV0UUZpenlj?=
 =?utf-8?B?RncvV1QrRkdIWjNtb1B3amJKbzlDMHFLdGlCSWpWNlgwc1ZOdCtpVXJMWnd4?=
 =?utf-8?B?K2pCejdGWlhmT2c3RTNZZWx2b0RCUjBFMWZ4NFUvc2YzbkRYY2ZPYkkxUUcy?=
 =?utf-8?B?TzZEZElNL3FLLzc3aC85ajBiNG5LWXJwQ3d0SEJtRE9NU0g1QkFDaGRKeUtp?=
 =?utf-8?B?M0tzZ2ZlYndpTjBuZ3dkeG0reWM1WFVERWdOTUt5WE1iUklkUlQ0R2R2RUtD?=
 =?utf-8?B?ZUNMMnQ2Y1grNzR0NjBVOEhxMGdkWGFoTWJYTVVoaEs4alIvUEJqbm9mZ3NE?=
 =?utf-8?B?ckl6S1cyMWJRL3dPMlFxbXd3UTBzZ3diRTVYM1RGMmV3MHlnUGRKWEY2Qkcy?=
 =?utf-8?B?OG15Und6THR6b0V6U1Bxd2VvOGRPTGNTSHRBSVRHd09tZ05YTllUTnVRdUN2?=
 =?utf-8?B?SlpKYVluQ1lMZERKREc4MjlCdTNZVmxYbTJMZmp6Y1cyd2l0bXdJcGNFcEV6?=
 =?utf-8?B?WTB0aEsrYUx1Q1ovcVRBN0NTS0NCUlJuRCtTdTl2M2h1QUdXTkdmak44Wko4?=
 =?utf-8?B?MitIdStpVnErK3g2ejB1Zmw1NURaVVRQWnFNQWxiNGlTYmdHSDVJRnA5eDhD?=
 =?utf-8?B?ZHVoSkQ1REFSMWlBWlZnTHpsbGhGUGdxUURtdTNUWnEwQmtFdXlWRjMwMTcy?=
 =?utf-8?B?Y1kwSTc4K3VVNUFhVWRDb0ErVnRneGQ3YzdxWUtqWTdWWitHNzRWZm9MeXdu?=
 =?utf-8?B?ZFYvRWdwUGgzYTZvWE5JR09BOWhMNDU0TGRBM3Y4bjZoSy9GaG56UHJ5MjRB?=
 =?utf-8?B?eEd2eEtHbm0ySWZQd2I1WnFQWDEwZ3YzRnI2ZEsvUlU5YmRvVVpSamdvdEls?=
 =?utf-8?B?RkZuZjRzUThTNmhnTGtmeUFGZ0tuSXJZOVpCY0ZRcXo3SXNBQWVnaGd4Y1Nx?=
 =?utf-8?B?MWo5QlRlVE83WkxiQ3J3Tk1rZ1BySGV3Q2F1ZTFZbHBhVmdQcjVmdzVXNmx2?=
 =?utf-8?B?TnZrMnNua2xWSVlhQjVjZU5KeG9FeHN5Q1VUdVJYSnpZK2ZrMHQrYWVRdVlR?=
 =?utf-8?B?QkdHdGQ2V2M0QUxkSmNqZzVBYjlRRGd5VytGWTJhZE11aGhVdTNuTVdKbTVI?=
 =?utf-8?B?dXdMYzlkTHFGbjlxenR5dm1oK1dQT0QwbDFzdmVJbUI3dTV3RkVqdDdQVE52?=
 =?utf-8?B?WGcrZk9XTTV5Rm1MdU53a3orSC9yWEx5bVN4ZFl4VzFvSnlmYnJ2TUdJS1VB?=
 =?utf-8?B?ZDlaMzVUSzY4RnF6dGt1QUhHVmthdU83bnduR0FCZElNa0ZXMmRSYUpmR2tB?=
 =?utf-8?B?MEtoSTkrd2xGY1ZpSXZGclBocXgzelB6M0Z4WDZFQm90OWZxVUVXMnhxZkFt?=
 =?utf-8?B?TU5YVUhxUjlUZVV3Wm9aaHAxaXAyeHBpQXhjSFRTVEZvS1I4a2ZMY2Nja08x?=
 =?utf-8?B?T1U5bGw5S3VnYndTcEJhOW9FRitadEFiNTVqc0IzbzRiTUxNUUpobG9DNFVP?=
 =?utf-8?B?cTVGdlIzYk9aK3hNVlkrSFgyYmVBNVFyODNDQzM1UGhWSlJiUmdRem9uanJy?=
 =?utf-8?B?dndaamRMZjRqVy95alJFRTg5cXlXcXNCak04c2hVNDZzalZZWkEraGM2ci96?=
 =?utf-8?B?a25xU2tuZ0FtSnBwQVNzZHpLK3E3UHFuRnJPcEp0eHFFYUhuS2N5QkZvbXV1?=
 =?utf-8?B?eWpsUk05WmpJV0E2UkNiaFM0YlkwVmRTalpFMWhtNVFvRm9EQ0tERHh4T0N3?=
 =?utf-8?B?a1h1b1NlWlgzdjVsakpFR2Nyejh1Wm1SVnY4ZXFhc0Q1djYrVllIUmZqbjVp?=
 =?utf-8?Q?GUendGR2G+pIKtZZRtxEp5a2A?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b309d85-d4c6-4cd9-ab87-08db512eba31
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 08:15:33.8723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C/xOZ9Oc+8keQ6SRf/SkYf7Sg5u/1/mj9DSC8frpIyRPX76OLDAGaGbSWb9HEw8sNEzJuhJ9T8J/1W3SQ7uvig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7672

On 09.05.2023 12:05, Andrew Cooper wrote:
> On 08/05/2023 2:18 pm, Jan Beulich wrote:
>> On 05.05.2023 19:57, Alejandro Vallejo wrote:
>>> This is in order to aid guests of AMD hardware that we have exposed
>>> CPUID faulting to. If they try to modify the Intel MSR that enables
>>> the feature, trigger levelling so AMD's version of it (CpuidUserDis)
>>> is used instead.
>>>
>>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>>> ---
>>>  xen/arch/x86/msr.c | 9 ++++++++-
>>>  1 file changed, 8 insertions(+), 1 deletion(-)
>> Don't you also need to update cpu-policy.c:calculate_host_policy()
>> for the guest to actually know it can use the functionality? Which
>> in turn would appear to require some form of adjustment to
>> lib/x86/policy.c:x86_cpu_policies_are_compatible().
> 
> I asked Alejandro to do it like this.
> 
> Advertising this to guests requires plumbing another MSR into the
> infrastructure which isn't quite set up properly let, and is in flux
> from my work.

Maybe there was some misunderstanding here, as I realize only now. I
wasn't asking to expose the AMD feature, but instead I was after

    /* 0x000000ce  MSR_INTEL_PLATFORM_INFO */
    /* probe_cpuid_faulting() sanity checks presence of MISC_FEATURES_ENABLES */
    p->platform_info.cpuid_faulting = cpu_has_cpuid_faulting;

wanting to be extended by "|| boot_cpu_has(X86_FEATURE_CPUID_USER_DIS)".
That, afaict, has no connection to plumbing yet another MSR.

Jan

