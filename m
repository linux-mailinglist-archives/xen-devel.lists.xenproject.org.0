Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 003606F5652
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 12:39:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529097.823109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu9t5-0001uk-Ep; Wed, 03 May 2023 10:39:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529097.823109; Wed, 03 May 2023 10:39:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu9t5-0001rX-Bh; Wed, 03 May 2023 10:39:07 +0000
Received: by outflank-mailman (input) for mailman id 529097;
 Wed, 03 May 2023 10:39:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S1uT=AY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pu9t3-0001rD-Mw
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 10:39:05 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20624.outbound.protection.outlook.com
 [2a01:111:f400:7d00::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b98a52d9-e99e-11ed-b225-6b7b168915f2;
 Wed, 03 May 2023 12:39:04 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by PAXPR04MB9708.eurprd04.prod.outlook.com (2603:10a6:102:24e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Wed, 3 May
 2023 10:39:01 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7%6]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 10:39:01 +0000
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
X-Inumbo-ID: b98a52d9-e99e-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BzVtkFcvkJS5xCtCqy2zTZ2VXEXAnRmdJUZvJHuuUYhHX9eI1MitKhYYEVcSztQ55bILvtyyArMegJgq0Qrw06yjYrU009ITQtHxucF4cY9CRc4UreZfgnO/g3mrGVl5Uxfcq1An3Odd+xXRAN2L31PuuG7FzkZRzeiJq6Z0IL0sMYxIePVL7PvGCa8+cX7YfTU4b7HbOpSHOUN82X96RGvJYaugoVK86oCI+nC9Re65bhU8+iuTNUKAvuiqn/3ir9Cel2/8MIenH8dZ2h+r+ih4kzODuEzGMPj8oRo77vsk0KJAYpaplhyK06oyXgmbpoMLUvItpYk8uPU5MJeBpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YZnJA7uwg1W9CXtAacAnccV/fU/ZKdDe4hNxkcvkVs4=;
 b=UIPi1G/GnNoI6W31ZtyQIbYCusztGPgVuqOqNR0sXYTuB1vT0pgUoyOeS7IzYH3HFP97koD4DNwc88GEldTUb++7KtWVJPbdBBv+28ce4APZXdwnhYXMa/TbJfUARa7tiXpGcDESCQJDrBi+sjR4NuonM1D3j+m8OBEYGN4cF/s+0dneAPFMzaps6pg2LMDGXM0pmZdIIQCrToAkd0RhrUput9nKYGBIvYqhBDMD9ylHy1mU/H1eDwv30HXYvCQLuseKHbXThL5Yhy37pIge9HNxqT1+N540SOuX4ljrJhS7RH7OwZxDOtbPCCMbjk2GHycmWTJ5xkI+eELa5iowdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YZnJA7uwg1W9CXtAacAnccV/fU/ZKdDe4hNxkcvkVs4=;
 b=0OLzElqy49CTs6nlUt9j+KyM+bhE1oSs5kJ5jbMs41J3kC8Az+zU3yy0o+l82K+8cwhTyORRInIjmtRiRAfAqC2+jzD4x0zgtePxAGn6wqmVASq2HSRlsULVWWIuEapV5aGsA/9Lp+zWUllVlsSlY5fxN6CFn1X2JE0zNkIAI4pl9B/0P+URwWlp9+zUvuyHobaWlmIh4qsKaoEN6+JqrkP2QyfWMuL4ikaIEKOJFfbEQ+GcyH/GHOSJtq/ribdgyQHUcNorcdU3UevzjmP2Ys6OtvjygHmqotV/d8nD6KNcSX53mOMMWqWJg5eV6eGi86BNTvp6w8tZId0JbMpn0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0820220d-a500-7920-3630-eea074856e3f@suse.com>
Date: Wed, 3 May 2023 12:38:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3] xen/vcpu: ignore VCPU_SSHOTTMR_future
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Henry Wang <Henry.Wang@arm.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230419143155.36864-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230419143155.36864-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0208.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::18) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|PAXPR04MB9708:EE_
X-MS-Office365-Filtering-Correlation-Id: 902caba1-e3ce-401d-2298-08db4bc29bb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qslPK06QJaDlZ6v06JV5tA0yzaoyi0+tJ0TXinklQOSqKxrcI7n7oDPuf2RyvZ/pd+ZedzVXhhBMh4PfXwPd6uPxdbhW9VJoxnYWEaSHwiqOsCIdyQahBpMLOI+eE5p1HYKos73PPawjaG2NzGfaHcmByJCaisrIwFBt3b2PUyp9Wv37mvFuM7dSWzO6yZmXS/jxhP1ZH0Hh+gvfI6TfqtOL8OSPSj+kd79dhajm07RC0ScPTUYjxz19pvOHZwpUBOxetWN3DmOOsi8n6Y87vLZ9T1pkf7y9+PC7dWr2K9ltqGXidFXtoDalqhGrOaFTpvaKKwPKb4pD9vAbmhJ2WrR2Hh1F25dD9bhBr4SSsuFQZeoHpqt8B1svFI/OeHD4nQpa+v81aj5Om7bWOHnX99MOf+zZ9Wxe5fdereDG9eppx3YS/ucz7i92GBcFyFShjyxNzeOYsOyMv01iiG+eFXFVD3OTsYqPNkJRcMWnnRICwhHuTBDc6xZyrwfIKpNZUzd3OIz2w+NShH6nMMAdc0xx0vrnHhwDwmyVQMsCZjyiUhIDflXTpu2MQzOCjSv84tRWU6PqxaldFS7b8ngye7JCTx9gs8NeMsoSqGcMsICB2gtTt9Xp0RpS1KdlKSNHXbsskc9MeeOl1rCuUA+aBA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(376002)(136003)(366004)(346002)(451199021)(6916009)(66946007)(66476007)(4326008)(66556008)(316002)(478600001)(6486002)(31696002)(54906003)(36756003)(86362001)(186003)(53546011)(6506007)(6512007)(26005)(5660300002)(2906002)(2616005)(31686004)(83380400001)(38100700002)(8676002)(8936002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmFISG9HcDRzRkl6Znp6d0tJcDllek9NS0VjVmZMM1lxbGJYVEtudGRFME4y?=
 =?utf-8?B?bkdNRDh4dHQrdy9wWGRpUkJoYmdrUGZ6dkZ3amV5VXdDYTRTeXNxemROL0FN?=
 =?utf-8?B?REYvajFLV2M4N1dLZWdpd0ZGMW9oK0Y1NUJHeUgyY1p3K1F1Z092cWxvNXBw?=
 =?utf-8?B?RWhpcDZ0T3BpR1NSblVNQ0YxVXJnUi9wVXZFZFJpbzhzNE1MNDRNN213bHc1?=
 =?utf-8?B?V01VcktmVlF0blc5ZSsvMzFuSm1wL0V3ZFlGNmRWbkFMV1gzSlNINlU5c2tm?=
 =?utf-8?B?cjBGMnEycUJBc240Rlo3Vk1GNXNvY2hpNFpYc3E1UkdnNENSSU9oQ0xHUFhB?=
 =?utf-8?B?ZkYydWU3L0l4RG9HeWtwbVc0R3JtWUN5Y0R6TXNtOXMzRHpqd0pQck5wUzdx?=
 =?utf-8?B?QjlrNW9Ka0daaFdwdlk0dFNaRUJLSWpLT2hrSUZPbFIyekdEMjczNzVQYWlN?=
 =?utf-8?B?NEpLL2loa1J1a1hSczFqaDU0VTd6c0QvMFB2WEdnZm80THBpdlNuWU42Z2pK?=
 =?utf-8?B?YUNsaUluYmsyanJHV3BBQWxhM00vQjhTRjdOMnhkRHh3WEFKYTI3WWdXMmxx?=
 =?utf-8?B?c1Qzai8vWjBxSEYyeloyTmpYR3UvblVBaWQ0cnl3bC9EVHQ4UFJXR2NDRkxB?=
 =?utf-8?B?NVBhUXJNTFdRbDZkNU9uMmpJamEzNWN1M2VVbWlSZXBVNHhFTW9uZGZaUkNO?=
 =?utf-8?B?dHpVSUFuc3A4NjRKTmhWamFLMk9NS3VnTmpVUTFWTE11dkd1ZG5VaUVWRlU1?=
 =?utf-8?B?c21CUEJnQlc4K0xhTTYrbXk0MzdtM3dVSHFtOW1kYWIrVUV4cG80NVJqSTVO?=
 =?utf-8?B?RHdzYVlkMGFZbWFEekFVMlBGZTM4R3V2TVFLRWxuWnBKMlQ0bEJnY2YxLzJ2?=
 =?utf-8?B?SzRIbU5HMVJlbTd5Wk84eWJ0eU9FNFJtUXhVbWhzeU5QNnNVRmF4Y2JHR1ow?=
 =?utf-8?B?Z3RLbU0va04rcS9aTktoOVpJR1c4NnM4WUw5ZElVNmVIaDhSSkRzVTk2Y0VC?=
 =?utf-8?B?cUZwK1dUVldQc0h5R3h2Vm9LUmZsUmpoWm1kRlhhQVVCdnY0NVk3K00ralJv?=
 =?utf-8?B?OTJUYmNkV2grbk5ocWMvNHZMeGRuR1hkVjNVMG1DNGx3eGZuNnRLdnVPR0JY?=
 =?utf-8?B?S0xXZ04vQUxwNWZIMXB1Ym1VWEU2bUU3WWRQVHltMHhaL2s4Mk1KcmtiYkQz?=
 =?utf-8?B?ZTZuNVRwNE4yRGloQ09SUVpKVVZNVVdRaGFCMEhFUDhTa2NhMlFvT3hvZmtP?=
 =?utf-8?B?NFFsSnM1L1pKa05sbHBMZ3ppT2hxUWNSRDNOMEtaZWZpbHVvOGUvOTVDejVC?=
 =?utf-8?B?ckpjQkR6cXJkaUwxTThWZTBhYWFUZDJIVGxqTlY3cFBnTTR4VzVTUGdxZmU2?=
 =?utf-8?B?MlZJVDFDaDVSVFQraERsNVZKcmloVEs1U2w0WWRTZ3NEcmZKR0lVSWo4N2gx?=
 =?utf-8?B?OFN1RHNkS0hqaHhZYk1rbHFBbUVNYUhsR2wrc1ZaWUlBWUMzSGJHc1poL0R1?=
 =?utf-8?B?dkFONDY1bi9ONHhiQWNRS0JZT2JYZDNPUkNjWTBiM1lYemgwMk1CSVlMUzFx?=
 =?utf-8?B?bTlRbUV4TEkwSTdGWGdHdzhad0NrcWZCdzRuMysvd1F5TTIxaTJUYTdoalFq?=
 =?utf-8?B?ZUlRRDBhUDVTanV5U2VSbUIzaFQ4R3V0aDhwNnh0dmlIanJMVFBFQTRNcXNv?=
 =?utf-8?B?NjA1NFhBSVVIQmJMUGNFdmM2anEwMkJMUTZZQklZOFpHQ291eDdCZCsrUWpE?=
 =?utf-8?B?RWVabUNnZ3ludEEydW5rS2NvR1Z5RytzaHlEK1l2OWpVbGFldVo4OFEwWFhi?=
 =?utf-8?B?RWRYWmIxenhSMkZSSnVJa2M3Z0dQSWY1anF1OXY2RjRKM3Z4OUpubkV0R1lZ?=
 =?utf-8?B?bUl2Sno0OXZjYmpGZm1RakszdkZzVnExcHRZdHFmWkpLU0NNOXltR0N5S2Y5?=
 =?utf-8?B?T3JZSjJTaStNbnlYcTI2ZFRYRmpDN2RhVllsT3o1bjk2NEVPWnNueVp4Njlu?=
 =?utf-8?B?WlUxOWMxVnI2d0k5aSs0ZWlZajhZaFQ5YmdBQkZpeTYzaFZ4TW9iOE5oNnhp?=
 =?utf-8?B?Z0VnSnFWd1NaNWdaRU16V1lNcmgyQmpGdmR1dHdBbkpxcmNEN1plT2t4Nmc3?=
 =?utf-8?Q?ZGDYEyhEmojWzes4mPsnHQPAf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 902caba1-e3ce-401d-2298-08db4bc29bb8
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 10:39:01.3511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J3mTB5ptPPKcCTVhZqlzKq9sP29OINTRcHV/GAGE8xY6A56Pw1WcH7OEVwoSPB4V4918kOwHGFRshHNw+2hvWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9708

On 19.04.2023 16:31, Roger Pau Monne wrote:
> The usage of VCPU_SSHOTTMR_future in Linux prior to 4.7 is bogus.
> When the hypervisor returns -ETIME (timeout in the past) Linux keeps
> retrying to setup the timer with a higher timeout instead of
> self-injecting a timer interrupt.
> 
> On boxes without any hardware assistance for logdirty we have seen HVM
> Linux guests < 4.7 with 32vCPUs give up trying to setup the timer when
> logdirty is enabled:
> 
> CE: Reprogramming failure. Giving up
> CE: xen increased min_delta_ns to 1000000 nsec
> CE: Reprogramming failure. Giving up
> CE: Reprogramming failure. Giving up
> CE: xen increased min_delta_ns to 506250 nsec
> CE: xen increased min_delta_ns to 759375 nsec
> CE: xen increased min_delta_ns to 1000000 nsec
> CE: Reprogramming failure. Giving up
> CE: Reprogramming failure. Giving up
> CE: Reprogramming failure. Giving up
> Freezing user space processes ...
> INFO: rcu_sched detected stalls on CPUs/tasks: { 14} (detected by 10, t=60002 jiffies, g=4006, c=4005, q=14130)
> Task dump for CPU 14:
> swapper/14      R  running task        0     0      1 0x00000000
> Call Trace:
>  [<ffffffff90160f5d>] ? rcu_eqs_enter_common.isra.30+0x3d/0xf0
>  [<ffffffff907b9bde>] ? default_idle+0x1e/0xd0
>  [<ffffffff90039570>] ? arch_cpu_idle+0x20/0xc0
>  [<ffffffff9010820a>] ? cpu_startup_entry+0x14a/0x1e0
>  [<ffffffff9005d3a7>] ? start_secondary+0x1f7/0x270
>  [<ffffffff900000d5>] ? start_cpu+0x5/0x14
> INFO: rcu_sched detected stalls on CPUs/tasks: { 26} (detected by 24, t=60002 jiffies, g=6922, c=6921, q=7013)
> Task dump for CPU 26:
> swapper/26      R  running task        0     0      1 0x00000000
> Call Trace:
>  [<ffffffff90160f5d>] ? rcu_eqs_enter_common.isra.30+0x3d/0xf0
>  [<ffffffff907b9bde>] ? default_idle+0x1e/0xd0
>  [<ffffffff90039570>] ? arch_cpu_idle+0x20/0xc0
>  [<ffffffff9010820a>] ? cpu_startup_entry+0x14a/0x1e0
>  [<ffffffff9005d3a7>] ? start_secondary+0x1f7/0x270
>  [<ffffffff900000d5>] ? start_cpu+0x5/0x14
> INFO: rcu_sched detected stalls on CPUs/tasks: { 26} (detected by 24, t=60002 jiffies, g=8499, c=8498, q=7664)
> Task dump for CPU 26:
> swapper/26      R  running task        0     0      1 0x00000000
> Call Trace:
>  [<ffffffff90160f5d>] ? rcu_eqs_enter_common.isra.30+0x3d/0xf0
>  [<ffffffff907b9bde>] ? default_idle+0x1e/0xd0
>  [<ffffffff90039570>] ? arch_cpu_idle+0x20/0xc0
>  [<ffffffff9010820a>] ? cpu_startup_entry+0x14a/0x1e0
>  [<ffffffff9005d3a7>] ? start_secondary+0x1f7/0x270
>  [<ffffffff900000d5>] ? start_cpu+0x5/0x14
> 
> Thus leading to CPU stalls and a broken system as a result.
> 
> Workaround this bogus usage by ignoring the VCPU_SSHOTTMR_future in
> the hypervisor.  Old Linux versions are the only ones known to have
> (wrongly) attempted to use the flag, and ignoring it is compatible
> with the behavior expected by any guests setting that flag.
> 
> Note the usage of the flag has been removed from Linux by commit:
> 
> c06b6d70feb3 xen/x86: don't lose event interrupts
> 
> Which landed in Linux 4.7.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Acked-by: Henry Wang <Henry.Wang@arm.com> # CHANGELOG

A little hesitantly, but since no-one else appears to show any interest:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

