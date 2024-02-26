Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB3B8670AE
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 11:24:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685414.1066076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reY9H-00050Q-NZ; Mon, 26 Feb 2024 10:23:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685414.1066076; Mon, 26 Feb 2024 10:23:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reY9H-0004yu-KV; Mon, 26 Feb 2024 10:23:51 +0000
Received: by outflank-mailman (input) for mailman id 685414;
 Mon, 26 Feb 2024 10:23:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DoHO=KD=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1reY9F-0004yl-Nj
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 10:23:49 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2414::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 206ff1fb-d491-11ee-8a58-1f161083a0e0;
 Mon, 26 Feb 2024 11:23:48 +0100 (CET)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by PH7PR12MB8037.namprd12.prod.outlook.com (2603:10b6:510:27d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.20; Mon, 26 Feb
 2024 10:23:42 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::32a0:32b6:d5af:9ad0]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::32a0:32b6:d5af:9ad0%5]) with mapi id 15.20.7316.032; Mon, 26 Feb 2024
 10:23:42 +0000
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
X-Inumbo-ID: 206ff1fb-d491-11ee-8a58-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eh478pjCqC6dGHpZAvkZB1x3CatZ+7x3w79FYYLKlCWhR+gxjpcuy12qnIhTWbWqVmuQGv9gi+hh3Blt4uXESytKHKjhPqc/f1v4jb6amJ6WiUC8QbbJ6jx+fQTFWrtW60wZIzS3gCYIsvtMhKsrYdrvPHZ2VHlCOxw++IcQqqGE2yjMSqK3xrs/yNEH2ZM7LmKWiwI091cR7G+WujXHYbXQ03Uup9Ng9I7BCOtae+gpIqfNQCrZmPBU0LXdvixQeWoFTdrLg00Mge0PZoLaFysvnXH+sB989I6hjmmndS5dH/Jt69BKI/A3Lj3MRsE/KyQ8NQ6Zna4kxrsiCMumWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YQP0lB8rP5JB9lBIJQVC7n9vyZDJqKcX0OpdlOQWSBI=;
 b=VKCeFtOGSqR/2nxnON/NWRzNayN4GBvb8J6Q7Zbs7t6S1xOrKkOZ0/DW/9IYiKTXY55As8VdI/+CPdiCq84aDsGH3Rl1WYJK1N/Je9MvuGsiSE9UGL8W2X84FSGoGCxAGwdKeJPwe7wzTuKNSnNa2iKCnF9OMQTVvAMzN4/vTm/CMr5s9yFDQVgOPfOI9rCs7W5DU18h6G6+xDXX+Xb13Vyo4v3s6PioS+t6i7fMTrD7kyiUX7oRnj8wXdiSJdRDCgbATxNPzNeeXAqW452clXcFY+QwOgF4OsexT3BKjDQct6OE820TIU0p/R9Xy+EdeQ5997Jlzs9sVnElyugJSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YQP0lB8rP5JB9lBIJQVC7n9vyZDJqKcX0OpdlOQWSBI=;
 b=cIFfw9jDStzyjITPy4jpayiIJh6XwcfmQYJx0YLCcBcDlWJDZUt7g2HPPWMIGoYLUJexNew97f9aHPsywYUbvKnT6hDxqO0auB6NryYR7TdACld9smg5jdXxlK/uGCyl1oSD9tp/5VraOqfchGvSIZ8Uf+TiTEHc7AkXA5jyXQ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <ed611839-7704-4831-a34e-31bd6203f22e@amd.com>
Date: Mon, 26 Feb 2024 10:23:36 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN v5 2/3] xen/arm: arm64: Add emulation of Debug Data Transfer
 Registers
To: Michal Orzel <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20240220121743.3680715-1-ayan.kumar.halder@amd.com>
 <20240220121743.3680715-3-ayan.kumar.halder@amd.com>
 <c5c0a46b-8793-481d-a678-da0929a0d6e9@amd.com>
 <9579f84a-ec9e-44be-b614-b70ced221c47@amd.com>
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <9579f84a-ec9e-44be-b614-b70ced221c47@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR16CA0016.namprd16.prod.outlook.com
 (2603:10b6:610:50::26) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|PH7PR12MB8037:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e1e8a09-ae81-4807-1a22-08dc36b501ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Kie0CdE4vPEyg/Ocl2SMlaJt6QGKMTIrMtRh7UAQttISA8YVGZ364GwIPHWeuDVF0r9b7bw9V4s934QHnl4HqDHls3DDpL6tddYbAoQ6oScWc3yhfNZq3JH6W87Yl1Aq14ZqVdWx2NOrvDbR+efEkA3jgk2yXbZ8Hi6QilFCkvATssRNBiuKrEm/P02epVtp8/qnc8mnBRj3ZHTubgENlA5av1H0TZikcDpopzF7KpHaFsi+7vsefGv9d/Ikq+WvwYM4u4d3NyNalkEQdR45+1EkcDwb8gx5E8ZyZMwcGlXiZgZzQMIOznw185EHTjRyxpae9CpXB1G1sACTHnXQoUvhX717FSsx9zVC53/hbvKcDEJbnwMN8FJRedQ1eECjrn65JxHsjlXZjkiNaAf/sgafjDfTpjzq4OjNna16BYZsVL1dMObWtSFor+BOAXt9b+xagfgbSoyToC1UJYWgJqL7K85HhqXVaUbc62Rkl3YicW++l8HgYYssM+/+DOyG3f3Vk9Z0fYhLRz3LBxM/CVMJkOONM7LQhcdkrpj/tdYxRNuea+StvLFqQH3/3mr6zKeZPkn4ouftNIFaLJwAj+NpFTIKcVEhXS1z8OcYc2tL2OjWbmfzhf06Nw9mfAotFVuWoEAIZJ5WwDLi47Dm+g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mk5HQlVtVFVjTWtKN3VRSGtUK1BkTmxEUy9aQjVFZTI1bE9wbzJTNEgvOGVK?=
 =?utf-8?B?V29VdTlxbHNqY1Rka1dhbnFFWEJHS1pSY3ViSE9NcHNEYXJJZHFqVC8vVzhp?=
 =?utf-8?B?TStGQWs0OXZDSzIySW1mWlVWR1ZJbFN3YlNQUWNBQ1pJTkgyRTFrR1E3c25B?=
 =?utf-8?B?b25QcVJWZXlNbnZxYmdpQkRVQ2NJeTNTbG1zSlFoUnFQcmE1dzk0YTNlNjZS?=
 =?utf-8?B?QUdWWDBzWDh6RzNHYi8vMnQramJjd2dOMklhb1BXbjltWS9sbGNxUmpTQVNi?=
 =?utf-8?B?bFVETDVTeGUrdkVNeW8xQVZrSHdBQ3JBOWdHb2pBMlFVc3gxeFpxeE5Hbk9m?=
 =?utf-8?B?cG52NVZ0MVVVSEdhWG9CVk9rdlNvRUwxQ1VtVW1qeWpISVBGSHUrdVkzajNS?=
 =?utf-8?B?aWNkQStrblB3MzNPTzgzYldjKzBybnpzd2FiOXZMQklyb2xveUVTMFVndzBw?=
 =?utf-8?B?RERicHp3UDB3ek9OdkxKUS9TOGVBQzdzUEdKb3lKUUVkOXBsbjRFa2NmUnhn?=
 =?utf-8?B?c0ZsQzFzalphSVZvWkdhc0NlL0ZoMXBPNk9vUFZWS1FuL3FJM2JYWEZnT0pD?=
 =?utf-8?B?eGFQbVVaMm96NHBaOHlheTJpcUdSNVVDbThkc0ViT0MxMSsvMFVQLzFtdWZo?=
 =?utf-8?B?cElhbEp1Wms1SDM4Y1ZyUU5CRGZidEUwOVBhWDJwd0xRMVc4MTJ0UnhxcUxW?=
 =?utf-8?B?K0hjSEdoVTVXWWNlZnVhL3FYV1JHU0tGODJVR1dqYWZjaTV6RW9iRmIwN21Q?=
 =?utf-8?B?WnYzUTZOSmZkWm1qZGUwbzlGcEVPajJDL1BFRmtoS05XQXcxSkNYTS8ra1k1?=
 =?utf-8?B?WkRDOWx3czNJcGUwNG12akE2NDU3ay8yU2E3ajNXcVpxUk1ObitSU0VId2V1?=
 =?utf-8?B?Zmh6L0ZGQ1BwSWp1bnhLc2NVR1l4U2lHNlc0Y28zT0g2ZFhldUlsK0Y4MVo2?=
 =?utf-8?B?SGpsUk5mT1RTVi9SME1Nb3ZTQlZqUWlZeXFmUFgzbXUxN25GUGJKMndSRmZs?=
 =?utf-8?B?amtTclVsSTVXWnFlL1d1eXd4M3lKN2lhS3NXcHFITC93WWlOZzRBL0psaEN6?=
 =?utf-8?B?UFlGeGlrWXBYWnc0Y3hPV3NuS3NZQ3VwU0ZiMm9sZmYwZTl3cHhabHV0WVFq?=
 =?utf-8?B?K0lhbysxOFJESmFESHRVeXRINXdQZG8xTGRqVitKUEo3MEhoM21XODNFb21w?=
 =?utf-8?B?MUFRemIzdDJlVXI3aEMwM1J2dHdIeUMxNWtTNHVYUkFEeFg2aXRHK0xJZXFR?=
 =?utf-8?B?TVorL0gwYndCQ0d5MURFYllZWnAxRFVTWC8xeXJ6SXhhMCtKTUNaejBQQmYv?=
 =?utf-8?B?Ymx1VDNxQ1BsdERkeUozblVtMjZwamtpa2RFRFlCdTF6bUV4V2xwVjhZTmFU?=
 =?utf-8?B?N1FxSWRDZkR5ZG9RdC9iVG9RQ2dNNzE0dHArUGNGdTNZamFZSm1qWWdCY3g1?=
 =?utf-8?B?TVYxOFMwb3VOd1kxZ2hkTzNQV1poMnZwYzRlOFZuWTZTUllZMlA3WUJDOE9E?=
 =?utf-8?B?MUkxUTl4a0NDQkhkNlVha3ZrN2VtbEo2Z2h2YW1uZDVhazFESGhhY1ZSK21y?=
 =?utf-8?B?OEdjSlczNHI1b0tMb01BazFxZmhNbmd1YzcyTXdMd1pJK0JKcEY4SEprSFVP?=
 =?utf-8?B?ZW9SZkVGaTcyRG53ejA4ZWE3TVo5UDc3NG5LbWxiRlVuT0llZ3phWmxGdVZL?=
 =?utf-8?B?dVFhSXlvREFIdEsyNXZ6c2hGdkhXRTR5VjQrVnY1R2FralhUdVhlVU1DL0l0?=
 =?utf-8?B?ZXJHeUJ1cWtPa1dQQitoVWNBYTExaE5pMzdsVS8wZDBKVVJnVUhrKzRrOFBo?=
 =?utf-8?B?QmVzcWVVWno0UzROUUdnakk0a2Vwa2ZERHNaQWd4STdYWXdWQjgwYnM2eTQv?=
 =?utf-8?B?Vk5MakpkdlBYekZjYnp3MWFiQzBJajlHeHh5aHU3dy9wVWhNWHhOSmNmdjIw?=
 =?utf-8?B?TXlEeDdoWklpNUFVdmUwWG10ajdkWUgwZkRTUE1CdUR1cUN4QWFraEMrd0cz?=
 =?utf-8?B?NzJ6dG9JWUlHY2s1RDg3YWU3Q2NCRmRPMXFiTURIRk9VRFlmVC9JOTdkSkVH?=
 =?utf-8?B?WUVDTVdjRENmcWVCcDJnQkptKzVES1ZhWkc2bktJNXpyd0l6UGdtVXNIMXg0?=
 =?utf-8?Q?Z67c/9QD/KaEjXA/Sj0hV48Zd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e1e8a09-ae81-4807-1a22-08dc36b501ac
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 10:23:42.6527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BTOF2m/tdA2twPQ6gFLt/YJqgAFDoF3OgiUxBk63GzudpYlG941gqpOxCrj0rKcurfP2qUGta29KKGzeTquRfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8037


On 26/02/2024 08:39, Michal Orzel wrote:
> Hi Ayan,
Hi,
>
> On 23/02/2024 16:41, Ayan Kumar Halder wrote:
>> Hi,
>>
>> On 20/02/2024 12:17, Ayan Kumar Halder wrote:
>>> From: Michal Orzel <michal.orzel@amd.com>
>>>
>>> Currently, if user enables HVC_DCC config option in Linux, it invokes access
>>> to debug data transfer registers (i.e. DBGDTRTX_EL0 on arm64, DBGDTRTXINT on
>>> arm32). As these registers are not emulated, Xen injects an undefined
>>> exception to the guest and Linux crashes.
>>>
>>> To prevent this crash, introduce a partial emulation of DBGDTR[TR]X_EL0
>>> (these registers share the same encoding) as RAZ/WI and MDCCSR_EL0 as TXfull.
>>>
>>> Refer ARM DDI 0487J.a ID042523, D19.3.8, DBGDTRTX_EL0
>>> "If TXfull is set to 1, set DTRRX and DTRTX to UNKNOWN".
>>>
>>> Thus, any OS is expected to read MDCCSR_EL0 and check for TXfull before
>>> using DBGDTRTX_EL0. Linux does it via hvc_dcc_init() ---> hvc_dcc_check(),
>>> and returns -ENODEV in case TXfull bit is still set after writing a test
>>> character. This way we prevent the guest from making use of HVC DCC as a
>>> console.
>>>
>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>>> ---
>>> Changes from
>>>
>>> v1 :- 1. DBGDTR_EL0 does not emulate RXfull. This is to avoid giving the OS any
>>> indication that the RX buffer is full and is waiting to be read.
>>>
>>> 2. In Arm32, DBGOSLSR is emulated. Also DBGDTRTXINT is emulated at EL0 only.
>>>
>>> 3. Fixed the commit message and inline code comments.
>>>
>>> v2 :- 1. Split the patch into two (separate patches for arm64 and arm32).
>>> 2. Removed the "fail" label.
>>> 3. Fixed the commit message.
>>>
>>> v3 :- 1. "HSR_SYSREG_MDCCSR_EL0" emulation differs based on whether
>>> partial_emulation_enabled is true or not.
>>>
>>> 2. If partial_emulation_enabled is false, then access to HSR_SYSREG_DBGDTR_EL0,
>>> HSR_SYSREG_DBGDTRTX_EL0 would lead to undefined exception.
>>>
>>> v4 :- 1. Invoked "goto fail" from "default:" to ensure compliance with
>>> MISRA 15.3.
>>>
>>>    xen/arch/arm/arm64/vsysreg.c         | 68 +++++++++++++++++++---------
>>>    xen/arch/arm/include/asm/arm64/hsr.h |  3 ++
>>>    2 files changed, 50 insertions(+), 21 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
>>> index b5d54c569b..80918bc799 100644
>>> --- a/xen/arch/arm/arm64/vsysreg.c
>>> +++ b/xen/arch/arm/arm64/vsysreg.c
>>> @@ -82,6 +82,7 @@ TVM_REG(CONTEXTIDR_EL1)
>>>    void do_sysreg(struct cpu_user_regs *regs,
>>>                   const union hsr hsr)
>>>    {
>>> +    const struct hsr_sysreg sysreg = hsr.sysreg;
>>>        int regidx = hsr.sysreg.reg;
>>>        struct vcpu *v = current;
>>>    
>>> @@ -159,9 +160,6 @@ void do_sysreg(struct cpu_user_regs *regs,
>>>         *
>>>         * Unhandled:
>>>         *    MDCCINT_EL1
>>> -     *    DBGDTR_EL0
>>> -     *    DBGDTRRX_EL0
>>> -     *    DBGDTRTX_EL0
>>>         *    OSDTRRX_EL1
>>>         *    OSDTRTX_EL1
>>>         *    OSECCR_EL1
>>> @@ -171,12 +169,42 @@ void do_sysreg(struct cpu_user_regs *regs,
>>>         */
>>>        case HSR_SYSREG_MDSCR_EL1:
>>>            return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 1);
>>> +
>>> +    /*
>>> +     * Xen doesn't expose a real (or emulated) Debug Communications Channel
>>> +     * (DCC) to a domain. Yet the Arm ARM implies this is not an optional
>>> +     * feature. So some domains may start to probe it. For instance, the
>>> +     * HVC_DCC driver in Linux (since f377775dc083 and at least up to v6.7),
>>> +     * will try to write some characters and check if the transmit buffer
>>> +     * has emptied.
>>> +     */
>>>        case HSR_SYSREG_MDCCSR_EL0:
>>>            /*
>>> +         * By setting TX status bit (only if partial emulation is enabled) to
>>> +         * indicate the transmit buffer is full, we would hint the OS that the
>>> +         * DCC is probably not working.
>>> +         *
>>> +         * Bit 29: TX full
>>> +         *
>>>             * Accessible at EL0 only if MDSCR_EL1.TDCC is set to 0. We emulate that
>>>             * register as RAZ/WI above. So RO at both EL0 and EL1.
>>>             */
>>> -        return handle_ro_raz(regs, regidx, hsr.sysreg.read, hsr, 0);
>>> +        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 0,
>>> +                                  partial_emulation ? (1U << 29) : 0);
>>> +
>>> +    case HSR_SYSREG_DBGDTR_EL0:
>>> +    /* DBGDTR[TR]X_EL0 share the same encoding */
>>> +    case HSR_SYSREG_DBGDTRTX_EL0:
>>> +        /*
>>> +         * Emulate as RAZ/WI (only if partial emulation is enabled) to prevent
>>> +         * injecting undefined exception.
>>> +         * Accessible at EL0 only if MDSCR_EL1.TDCC is set to 0. We emulate that
>>> +         * register as RAZ/WI.
>>> +         */
>>> +        if ( !partial_emulation )
>>> +            goto fail;
>>> +        return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 0);
>>> +
>>>        HSR_SYSREG_DBG_CASES(DBGBVR):
>>>        HSR_SYSREG_DBG_CASES(DBGBCR):
>>>        HSR_SYSREG_DBG_CASES(DBGWVR):
>>> @@ -394,26 +422,24 @@ void do_sysreg(struct cpu_user_regs *regs,
>>>         * And all other unknown registers.
>>>         */
>>>        default:
>>> -        {
>>> -            const struct hsr_sysreg sysreg = hsr.sysreg;
>>> -
>>> -            gdprintk(XENLOG_ERR,
>>> -                     "%s %d, %d, c%d, c%d, %d %s x%d @ 0x%"PRIregister"\n",
>>> -                     sysreg.read ? "mrs" : "msr",
>>> -                     sysreg.op0, sysreg.op1,
>>> -                     sysreg.crn, sysreg.crm,
>>> -                     sysreg.op2,
>>> -                     sysreg.read ? "=>" : "<=",
>>> -                     sysreg.reg, regs->pc);
>>> -            gdprintk(XENLOG_ERR,
>>> -                     "unhandled 64-bit sysreg access %#"PRIregister"\n",
>>> -                     hsr.bits & HSR_SYSREG_REGS_MASK);
>>> -            inject_undef_exception(regs, hsr);
>>> -            return;
>>> -        }
>>> +        goto fail;
>>>        }
>>>    
>>>        regs->pc += 4;
>>> +    return;
>>> +
>>> + fail:
>>> +
> No need for this empty line.
Ack
>
>>> +    gdprintk(XENLOG_ERR,
>>> +             "%s %d, %d, c%d, c%d, %d %s x%d @ 0x%"PRIregister"\n",
>>> +             sysreg.read ? "mrs" : "msr", sysreg.op0, sysreg.op1, sysreg.crn,
>>> +             sysreg.crm, sysreg.op2, sysreg.read ? "=>" : "<=", sysreg.reg,
>>> +             regs->pc);
> The original formatting (i.e. placement of printk args) looked better. I'm not sure why you changed it.
My bad. I changed it to align with 80 chars. I will revert it.
>
>>> +    gdprintk(XENLOG_ERR,
>>> +             "unhandled 64-bit sysreg access %#"PRIregister"\n",
>>> +             hsr.bits & HSR_SYSREG_REGS_MASK);
>>> +    inject_undef_exception(regs, hsr);
>>> +    return;
>> The last 'return' needs to be removed (spotted by Michal)

Ack

- Ayan

>>
> ~Michal
>

