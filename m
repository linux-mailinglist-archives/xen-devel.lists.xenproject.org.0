Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C696EF096
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 11:08:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526604.818478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prb7i-0005hJ-6X; Wed, 26 Apr 2023 09:07:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526604.818478; Wed, 26 Apr 2023 09:07:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prb7i-0005dv-3N; Wed, 26 Apr 2023 09:07:38 +0000
Received: by outflank-mailman (input) for mailman id 526604;
 Wed, 26 Apr 2023 09:07:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dTkW=AR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1prb7g-0005dp-Dh
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 09:07:36 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2088.outbound.protection.outlook.com [40.107.7.88])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c80d3cc5-e411-11ed-8611-37d641c3527e;
 Wed, 26 Apr 2023 11:07:34 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9388.eurprd04.prod.outlook.com (2603:10a6:20b:4eb::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Wed, 26 Apr
 2023 09:07:19 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.033; Wed, 26 Apr 2023
 09:07:19 +0000
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
X-Inumbo-ID: c80d3cc5-e411-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n93/cOZQKl4v6rkZfsPsNQmTkqAcPdxnFBtOEYfVk9dQO1QtHdMa8bSM4yFoiKMizkL1lDvm/G1n1T7pMR8xHw0Dj+iJFBYBhDDjoAFb+Hsk4+iu/0QcSW/MYoVdokjXd25rqSKefTsF5gpqQBPQfN0/PBO7dVeMuEHKfcRW2OfeyS5UFxdsL/MS5zl8KJ/YTRKaaDqyCJs4TDvJVko+9nOyP1ADseweDrke6E76o3nC5sAdKMIrJJqshmE9JxQ8/r3Qe4e4zpot9fF11E4VJMR4Bslct7rhmdjTb2H0zxQ6tdsBr0280+dbF0vHQd1XKTzgcKLvGoWVW02ICdSeHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GkSjVz2yZSYybsLyLMUVxLzZYRjqtAbROe0L+OSR2XU=;
 b=PivZAujCuWwQGytxovwcHSaaS8kvnUTu13Y/bUWDuaqVVQwGQFk2OoqHKu8/Rxop09vKnOTs0w4gQe7pm7PVKiwyG8nV8SGRZSfpE+Is2vDvwqVVJlazBayo34WSv/JHaQUnX8qg06pqj/OMFIlm+RQ4wBGrcQ25jhOLFpLfudQSXu6B8uhjmWdolvpt0XBFdI/O/pA0XwV4EudrlNN70GQ0lu/IxDUiawBzZJatGdog0yBH0VOeD/uq+01/Zd5mn82uh+Zr+waXLJf8pU9ux/24yFaR15Iq/U3EWZfKu1nYZHtRZtx+flo4tOseitaXu2E62QTSUq9F2ivR6xwugw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GkSjVz2yZSYybsLyLMUVxLzZYRjqtAbROe0L+OSR2XU=;
 b=GfA0VwT1TdbOzI9AR2LZxbmBvfVXDSIpyJOi+I4Ky3TYbTolQuvh+DOtewo2pHO0cLjqBOdNMXvVJNOt1I8htkPRPZqj+e++fhtrrrn76GhHXZ9fYjC5vGDCpUiMpH6SXo0blaQosiFQ/2RlWfWd5VbljAGo2QimWid/V2Fa0r4VdkDQj3RUl7SRQwqOy8kkRuxL1wuDGtRzZduRJ6r2M36G7nDXteiSWNU1Lkjt6MxZSdeqfjvOz/cWr5G8OCIz7Ip6p3gCO+g4TkmUux1geyZf5USULf6sTgafIkN8AXSYINXO+8qzzZHXsvd4sO056fGi4S7HeWtE8+eVYDlylQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9dfb4f01-979e-e225-214e-34ddb51a9199@suse.com>
Date: Wed, 26 Apr 2023 11:07:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] Fix install.sh for systemd
Content-Language: en-US
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
References: <20230425194622.114869-1-jandryuk@gmail.com>
 <20230426091533.68324d8d.olaf@aepfle.de>
 <650a7f6e-be82-0312-05f2-bb69e51e828d@suse.com>
 <20230426104754.78845a19.olaf@aepfle.de>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230426104754.78845a19.olaf@aepfle.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS4PR04MB9388:EE_
X-MS-Office365-Filtering-Correlation-Id: f3d62308-9855-4c45-32d2-08db4635a349
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RTaTUOIWVDwO4xFYT5PwzzULKPj6ImPbXGBYvVSjBFB7W3IRovjANGm7pPJFOD8v814abX2dn3oD/Ybo6DIdeXWWGS4K3oxOlnfqJLmjmoDA6aM9TUZzedik2UaHWukAzCExwc0o1Zj8P7XvEI0TsEYuQz/L4CaOJya0yXUjIjFWy3Qd8ZtXSIn71ZMFp5cxH0V8Rj7vtAnp6eiqvZIRKljQOKl6RB8csjCqiR3GFmUzsZea8Xco7lPLbmT8MWmsorJlZR9A41ooGAF+ne8x6bNBs1PxrkQOqHrxB9e/42lcNwKhzp6uAxqn+xPXUhEXWz3ZYqX0ySTujd15qX8og5hD4jg0Snm8nbxuxVpUjbNaLTyA5+vclLqQBZh4qGvmRAdXUP2UZustn2dFLoQ06WkWlu3jWucLjpWJ6Df9XmtO44tL+2wy/cG5G/QcuQdMayWP8wXSlKEqmmrUnliVElw/VXGl+rgaHrC/Sqoy6nplY7Rtl8E6AWilHCChicn+rQA/PmFUvkx6i8bk/TNCuIr0VqGeVvXg/HFoJreLNhD4pTkV9HkmH9fIWxhzIjB3fyOzZFbgjPu3B2bt6XJCm5Dn6itUytAph3w7F+keH+ru4Ac0REwzCglTJYAzj14wWNTiFcVsza4cOu8HR0kpLg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(346002)(39860400002)(136003)(376002)(451199021)(5660300002)(8936002)(38100700002)(8676002)(86362001)(316002)(66946007)(66556008)(66476007)(6916009)(31696002)(4326008)(41300700001)(4744005)(2906002)(186003)(26005)(6506007)(6512007)(6486002)(36756003)(53546011)(2616005)(31686004)(478600001)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTNicGwyaEdVeDBERlF2K3hER1o0ZlZGM2hraElRS2ROdTdMQk5VU1pDajBW?=
 =?utf-8?B?dk9jL3pUYTlTQzZPdlF1Rnd4RWxNcThTWHJXLytxS3M4a3Zva29DQ0JXL21z?=
 =?utf-8?B?RWZWaWVGWUFBODFJNXRubW9MdzFXVk9vUkttZE9aRm5aTmZ1R2xmK1h5WU5W?=
 =?utf-8?B?VE42RjBDOENON0M1NDNLa0cyQWdmTmtaRXdWeENMYU1IOUl5bFFQVGFXeXpy?=
 =?utf-8?B?TzBISTRHS2J0WmVKdGxsWjB3NHFib1JNL2pxYXVuMnNBRHhsYlFrZG41L3p1?=
 =?utf-8?B?RVQzbWxLZUJDc0hTekRJOWpQTU5INHJ2S0h4OS9JTUJPNStMbWQ5L3FiTTFZ?=
 =?utf-8?B?TTZzZ2JZdnkxcUltcW84M0k4dWN4RUxPM0l5T0RucDdRRm9vcytIV0RFRmZ2?=
 =?utf-8?B?anMyaTdWTnFkZkFvZDJ6enlqRVZpSEh1Sk1ndEhINUJkU09jTWwxSVVac3hT?=
 =?utf-8?B?dENIUnVXbjdvTkZVcXNxbUdFcXlONjdUYXpCcm44Uk5abHFxQmtGaDFqZk5y?=
 =?utf-8?B?WkxscDlOOWNKelhqQ3VqdDlEZDdWT0ZhNXo4QWJXamJEVU9VN0dCKzlneXRC?=
 =?utf-8?B?SSs3R1hkREpMUUxKZ2owRXhVeUYzQWtQYzVmMTNFWmRCaS80WVJGWXpsZktQ?=
 =?utf-8?B?bkpyaTdzSmxBdXBoT0RqTXdJUUNleGxSdWF0Mlo1ZVRDbVRLL0lZNDFaVkdC?=
 =?utf-8?B?Tnh2OEV6eTFHbkw0NmdNZ1pOdHVkMlhuMmh2d3FMMGw2MWtSYnZmMm1PcG82?=
 =?utf-8?B?WG1QbzJOeFF5NDIrWE5vMFhlSTR5c3QyaVZqY0U1M2RaU3hCVlRqRUU3NlJw?=
 =?utf-8?B?aFR4WWRlbUpEMEFHVGFNMXFDZEpYei9tcDkybUp4Nk4yOGVYcTVzZTJodXA4?=
 =?utf-8?B?bGpxb05iWXI3ZCtSakdEYzVEbmJTekZPVVE2Y3UvYnZJWTYrRDhFUWoyNjR2?=
 =?utf-8?B?ZllPeHJ2OWNXcnhLZkpTZ3BLV3JueWd2RWxteE9EN3ZWWDhNZ2FldXJib2Mv?=
 =?utf-8?B?L1o0SU9SQXVDeUkrME92UGNqZzFwR1pGOHBOUkJ5TnM4ZTB6OUVHakFHbUhx?=
 =?utf-8?B?Y1MreXNGYXZaMXMyblNHbU9LNFRVTTRNbTNzeEoyYllEWnFsdDltSlo5d2Fm?=
 =?utf-8?B?c3NjL2JpWlY5RU1NNHpTY000c0k1eTkzbC90NkgzZHN1NEpwMllWMjhtMEFM?=
 =?utf-8?B?KzFkYjloenJRTzlFRWJXaFFFNlM4SGdEeUxmcndDckpKT0FaNUJIaU1BYWt6?=
 =?utf-8?B?VXNtMmI3K2FPb3BnM1dVdHlNVmsrTlB3R1ZkV0p3NHB6cWlVSFFGQitNWXU2?=
 =?utf-8?B?cEpoeDhSaU5QUU42dHBEYXFyb3EyU0JRbkNyWkQxWVhtS1NoOE1td0xvaE1J?=
 =?utf-8?B?T1FoQ0V2RitCOERCVWFPaCtpNnJuUWRLMy92Zk8vOHl0QWtsbEF5ZHFZajVV?=
 =?utf-8?B?ZzU0bXV2bDgvU3dEV0RvMWd1UmI3MU1lMGdBdzg3cnEyWk5iTFM5d3lkTUg3?=
 =?utf-8?B?ZlNxU1pmdURrdGx6b2NLS0syK2E1SStlZ2cvMkJPTlg3b3QxenlmcEIxbmtJ?=
 =?utf-8?B?MUN1YXBOblFnMi9RVUt2QXVWSTAxMC9BNmVXUVRRQ1dyVC9TbUxFdlZnV29s?=
 =?utf-8?B?OUJHTEl0eXBHMStwQWMzc3NWcXErSi9OdnRvbE9WVXM4R3RLdi9Zdkk4OVNJ?=
 =?utf-8?B?U1ZPYXQ4QWJmU2JFaVpFVEhHZFpZN0c2eEwzSktNTk5XS2NzcGpZOW5zSkFH?=
 =?utf-8?B?alowRHJncUpiN0swS1hHSE50MVpUM3ViL1JHWVJaTWdGU0NYUGdabk54YUx5?=
 =?utf-8?B?WEFOaytSSVVvUFlXTE1OUExJZkJoQ2dSUFNvekUzazl4QXpPdm0vWkIvSjhI?=
 =?utf-8?B?blF4WjRzOGUyd1hOM2ZqRHRtNC82RVVMZSs2NGdQWnRSSVpNWVJIa3JES1lX?=
 =?utf-8?B?Q1ZNT1VGTy9KRmdxclpaMjBpUytSSXhBRGpPUlU4OGVXVTh6N0orMDVpUmJN?=
 =?utf-8?B?ckJQdlFhbHdkZGFwSnRxZWdmNkVLZkpKNHBIeHpBeWttMFI0WTFqcDNkR25h?=
 =?utf-8?B?aTAxUm0vTHBNVE1uNTA4bVZBcFFRU01QYmNFNVVYa1ZURjJXM0RFeDZvMkxx?=
 =?utf-8?Q?lQR+RGA1+r+HsniscMl456sd9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3d62308-9855-4c45-32d2-08db4635a349
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 09:07:19.1150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ix4/YjDGxO49hOJh8/7sT7sS8uph9ngk4TbK3g0rY+ZYe2K7ZfpKOnKHfz+CGFLHtOuGIsExhaJ0QwKoMPAj7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9388

On 26.04.2023 10:47, Olaf Hering wrote:
> Wed, 26 Apr 2023 10:28:38 +0200 Jan Beulich <jbeulich@suse.com>:
> 
>> Is this to be translated to Reviewed-by: <you>?
> 
> It was a Nack, in case such thing exists, and if it has any meaning if sent by me.

Now I'm confused: Your reply didn't read like a nack at all, at least to
me. Furthermore ...

> There are a few places already which do a mkdir -p XEN_RUN_DIR prior usage.
> But a few are missing.
> XEN_RUN_DIR and most likely also XEN_RUN_STORED have to be removed from make install.

... this suggests to me that you really mean the change doesn't go far
enough, but that's then different from nack-ing a change. Can you please
clarify this for me (and maybe also for Jason, depending on how he has
read your replies)?

Jan

