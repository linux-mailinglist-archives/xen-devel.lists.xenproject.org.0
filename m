Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C49978D52F
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 12:51:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592835.925674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbIll-0006YY-OX; Wed, 30 Aug 2023 10:49:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592835.925674; Wed, 30 Aug 2023 10:49:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbIll-0006Ve-LW; Wed, 30 Aug 2023 10:49:53 +0000
Received: by outflank-mailman (input) for mailman id 592835;
 Wed, 30 Aug 2023 10:49:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a0OZ=EP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qbIlk-0006VY-3q
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 10:49:52 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0614.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f181f72f-4722-11ee-8783-cb3800f73035;
 Wed, 30 Aug 2023 12:49:50 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS1PR04MB9559.eurprd04.prod.outlook.com (2603:10a6:20b:483::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Wed, 30 Aug
 2023 10:49:47 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.035; Wed, 30 Aug 2023
 10:49:47 +0000
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
X-Inumbo-ID: f181f72f-4722-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gsK8fxatwOXitL5wQ4GuL91p7tEA8XWlZhy+QZLPL02mx9JEk88kiCHKBEBGos20HSqfRighByMZAX1DAiKiveJOfPAzQD2BoI3w0frc5/K06ZzEn9+HcJHrFQut5041W4cEChGikSYN7ze4sufZigpNDxHG1IXtoHvfK8PDHK9h0jBgFGxoAkvzlUpJRK8dcGTfkKQDN6qmzNi62FVjt7WT6lozJ3Ve73XP0/N4QvBBpUEmXJKe/AE5h8onyhUzkpOs+ByVKrbzJLemYp8OQ95DmPCkKgoqo0/F5jNtco5BBAuIixxEQECHzEyQKRHQMaEzCFH4ONCERd/Lb+wuaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5UCuoJAtg65Sf21lBVAiz4dvDw0ljlliMTicgtxBzXg=;
 b=TosZ6ZsxNmShSEYuGKFSOtovLgoeQ8vPe9VUAZ9MMarCMWn/4Upyg8ik+4RciERhtqCeacIfnjZ8LvQrvY7PLeZ+nhlBblaO9M0DqPSCXoXo3Aas4p1W/ZX1TVTTtnpcgEzpunkDzPmwz7NgmFKaT2sDKbVlH5SZdheieZorvUfxDSF033qvdlNlNhEPfWFt7uwWys9RrnOGM5VYr2vksjPce+x/1wk63eTllesI9pUplyxzuz807Mz93VqmuipNBn6GXZ6OP25KJfGSuz3pBxIpmvsdrB0vNN2f3XsDLPl5rGp2zEXANVX1HKW9sJfve+K5kpRKV0Kcjmaritq2iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5UCuoJAtg65Sf21lBVAiz4dvDw0ljlliMTicgtxBzXg=;
 b=rmJu/UMPvVr61q6TolUmYsN4Gyn1AOjdlJ9J6aVHPO4WaBWtjQBa6pd8FoR6Tg36FhxrXe/FagKEhfj1LEqw3+F4UYNuPcLk43VWWd+ohi+GqQ0TVjOkJBrfJ3YMpcvbvVYnGOHTkIA/j1e0G1pXl6IxPPXFvVBAQ9wtwaZEepcO/z1sAQ3No1bhpT6Br/din/e22Fqc/krZJGO4Y9q0fjotURbNCkuptfBUxdQIZdHrfZ9uX63ur51qxtc+4FeL+Qh9YWuzpN4/g8KgZwkwLgJ1EXWSIwp0ACSpv3ZRtHMVkfdjM/FYIQatdHanJmMN06b4vB4dwGbEx36AockdhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <47e40325-0521-c2ee-e0da-99bfb4449097@suse.com>
Date: Wed, 30 Aug 2023 12:49:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 5/8] xen/ppc: Define minimal stub headers required for
 full build
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1692816595.git.sanastasio@raptorengineering.com>
 <a92f99e8f697da99d77bfde562a549dbef3760ce.1692816595.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a92f99e8f697da99d77bfde562a549dbef3760ce.1692816595.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS1PR04MB9559:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b6fe0ea-5f8b-45dd-b2a9-08dba946d3e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	naNzayrFyDhte0dr1w2MFkSY9v6QeHNEJRxBBfLRTJHBqOAXHaAv3V3UdgSZQM14yCHYBGv4hwOw37o0zcDivmxqC8Mft7c8GJVBYBYAUqLpG19SyYPz38vpL6pkPzRoSGPAI2k1jg8vm952Nsrxr5j1XGkV/fYOQI1Nan8RUGXnl6aa8pySLtWOU1grE1jdaztH+rPUqUxSnp6GGUhAXc9Az2mIzjABAJlOotBBURvpAd1SHYf/dzJ4T4C8chhSVZ6Y6k2ttLLlQjsx1IJJghVVx0Xx2tzMnpC2qrdqlQsDFMwlwVcTxLqVjSL2Hhi3hinYzFwKNnLSxGuW4xVXtIJ2Qs9TaZ+QUtnzcKcWF81UwU+9YRKY/8mfiabJ8wdnZvwZFAIgvvfPfXSHoJRKtNJiga0oI17Kuu/yaBB0OyY7XN999ulrOBHBxcuWQxSAXj0YkEfDYo1/sl1ab8gy/QHHsaPlhD+Hj060SyWmUm3AXL6gEqNdGvEo5pp6fuBlgra547Co+pvT2+wrvHd34nlk7SHEbBa6R6lsW3oyoFwcD1S4Jtw6zA/L1o/znPcb84eVjvaGLhvxAxJrip5LxFcIC7Afgglc8lgmWcflrjkljvbvZqD6guT9h9a9OYjwQc04uv3GvZTRSygmNnZegQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(376002)(136003)(346002)(396003)(451199024)(1800799009)(186009)(6512007)(26005)(316002)(38100700002)(6916009)(66899024)(41300700001)(4326008)(2906002)(31696002)(30864003)(86362001)(5660300002)(36756003)(2616005)(8676002)(83380400001)(8936002)(6666004)(6506007)(66476007)(6486002)(66556008)(54906003)(53546011)(66946007)(478600001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3dVVHFYV0FYbDVqKzZzN2d0NnhKRVhoelQ5djNOQXJ3bVArdnp3bVV6MjJt?=
 =?utf-8?B?TUN2Z1h6ZjdEMUh5dGFsQUNEbVVLbFFpOThkL2VtdXRlYzlPMVBTblhiM242?=
 =?utf-8?B?T3pYUkluV1JVMWVoQmJrNm5LeWZMMkVaUExzSUV1aXZuRFVkWkh0eFlaZm01?=
 =?utf-8?B?bEFXL0JSQmM3clFPL1JjM3NqSTFCUXVEeDRJd01oN3dHaW5SdnhqYi9uZEMw?=
 =?utf-8?B?RG9LSjRvZFN6bjQvTkZFNG5oU3JGZjlid0tmWWRlUWZOcFV1T05DMnRLUEdB?=
 =?utf-8?B?cFFJcjFWTDRBOUpPcjJ1dzE1djQyMVN5V2NmZEN4ZjNXUHhKVzM3NzhDSVBZ?=
 =?utf-8?B?S3d4TW9iSllFaGNCVVk2M1BwRFd3Z0crME4yWG1YY0tuOXFHeis0dHYzcVpK?=
 =?utf-8?B?cDRpRWVZWVFkOWFtQnhiN1dxajRXUklCNmF0TmdvRmlCT0gxckRrWkw2WUIz?=
 =?utf-8?B?ZEhMQzJxV0hIRW12Y09VSy8rMldzZTRkU1J3OUVYZXlOTXJXL2M2WTBxRlJu?=
 =?utf-8?B?dzR2L3lEMi90VTYzM2l5NHlxcEFVeTM5dkxCOVY2dEN2aDgxVzF6R09PV2g2?=
 =?utf-8?B?WW05djUzT2luZkRSUVNvZVp6SWNuWndLV0pvWnp6NEg1Sk9QQ213RCt3cHh2?=
 =?utf-8?B?UzAyWGFGdHMvOTQrcnk4cXI5TFU0YzRseVVKNEJGelNpQk8zbXY1M2lYbTdu?=
 =?utf-8?B?S0daYkpoTmdjQ043cWt2dm5UTjl4VXg3dFZTNy94QysvSy9maU9FTDNYZFVt?=
 =?utf-8?B?OFVxQlF5V2o1Vmt3cjNsOEpMcUE1RkgyZEZ4ajdpeVRzNUZkdFJwT2pUblRn?=
 =?utf-8?B?QVVqdHI0SVM1Y2lDRUgybXJnZXV0UGd4OFNlZnNiVGFsbmNITUhlRDVJMHFF?=
 =?utf-8?B?WGJOZVE2MHhVUjlGWnlIcFlFUWZPbVRmRHAyaEZJNnZIeUZjRHpneENJRUtU?=
 =?utf-8?B?MWZqRjJWTklLaUhyMUozMmpnOU1TYU94aUdvQVUrSlBTTGxURXdFVmpPekhJ?=
 =?utf-8?B?cU5RZ055QnU0YXhJR1hCQ3ZNb1laQjM2bFE4ekxFb3d1ZkkrWVRyeXQ2VlJi?=
 =?utf-8?B?RHpqRUtqM21TQUdqbElwTmY1blNpam4wQldHTzcyZmNVQTVibFQ4UCttY3pI?=
 =?utf-8?B?dkkzMDJ3a3ZBVHpkNTcxR0dJdmdIR2N5bGpEZm1hamFIK3pwbnk5YXNEMktz?=
 =?utf-8?B?UlU5MnZMZGl6bDRuNC9DLzNFT2JkTXZXaHQzUTZNaXRhak9LSE80d3JBRnla?=
 =?utf-8?B?MWZoVllzWHBpa2NzMnR0Sm11R0xHSCtsL2tNcXFBaFgvNVlERmMvbGRMRDBF?=
 =?utf-8?B?YWIzU0w5ZmZLNThqcGptcDlVYnpnYnhkS3U0cFBVWnF5QWFmVXIvenBqc2JE?=
 =?utf-8?B?VXFVRWdBeHh2d01zQ3NPc1Q2YTNRRmg2TzZJcTlkWlJkVitLbUtGcU9CVUFt?=
 =?utf-8?B?blhTSEtiOXR6S1dYUjRyMVl2c3J1YUZmb2JUT1c1OVV0aGJVRkZhTXBHcXJx?=
 =?utf-8?B?SWo3eUMrR1ZWRXJwdG5wcTRmZ2ZrRWtCaTNOcndMRWR1ZmRCNklUeEhOenp6?=
 =?utf-8?B?YkdjaUNRaGRjVjhiRWdRYjQyeUtXb2JZTnNBclByUE5LcXBXRGhEUW5FUmZP?=
 =?utf-8?B?U21FTmdHZUNEdFZZMmN5VjZpTDdLeXhlWDRNTy81TENUc3FKSCs3THd6dDBG?=
 =?utf-8?B?SUdCdFdWREdMMEttNk5xODFOcjFRd281TzhTVExyUnRVV2hVSTlDNzRqZkxW?=
 =?utf-8?B?R0RWbzAvekN0eEwzUzJMN3d3V0l4bWl5WmFmcFBYUnZ6VzBlZnhBbjVGNjJF?=
 =?utf-8?B?WUVyQy9iNTJtZ0lmancrUzhyb3BGMDNiWXp1YU9QZStLR3NuNWVEOE9BMXIv?=
 =?utf-8?B?UFRWOWo2RUR4aHBxOFd2cDdsTmQvWkpsTnIrRzUySlM5OGNRWERzNlFibUx2?=
 =?utf-8?B?cDBtZTRWTEJuejd0c25hdXJrNERHb2dVTWZFQldlcGp1ejhRUVh5NW5lMWsw?=
 =?utf-8?B?bzJDOVFMamZHeDF2bTRCdnlLY2pQOVN5WW5HSStoNy9OVmFnYmRjQ2cxRE5I?=
 =?utf-8?B?VzZ1RTFrUzBuRHNybGNhcUxQSmNCazJDd3F4ZGNZS042S0M4WFJVWG5Ja1ND?=
 =?utf-8?Q?zMtXEs5hiyV+1g2mQzsg30FL1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b6fe0ea-5f8b-45dd-b2a9-08dba946d3e7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 10:49:47.2585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wN14cVJWQdnVij+P+M6BNU4ayQnFvGGyJ4DLPIC+KcQZBAEnEqu4k2ok0SUkpWzuShi7ZoaJbZJ5DSzsb3M9MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9559

On 23.08.2023 22:07, Shawn Anastasio wrote:
> --- /dev/null
> +++ b/xen/arch/ppc/include/asm/altp2m.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ASM_PPC_ALTP2M_H__
> +#define __ASM_PPC_ALTP2M_H__
> +
> +#include <xen/bug.h>
> +
> +struct domain;
> +struct vcpu;
> +
> +/* Alternate p2m on/off per domain */
> +static inline bool altp2m_active(const struct domain *d)
> +{
> +    /* Not implemented on PPC. */
> +    return false;
> +}
> +
> +/* Alternate p2m VCPU */
> +static inline uint16_t altp2m_vcpu_idx(const struct vcpu *v)
> +{
> +    /* Not implemented on PPC, should not be reached. */
> +    BUG_ON("unimplemented");

I would have thought this construct is meant to flag places that need
work in the course of bringing up Xen on PPC. This isn't one of those,
I think. Perhaps ASSERT_UNREACHABLE() is slightly better here than
Arm's BUG()?

> --- /dev/null
> +++ b/xen/arch/ppc/include/asm/current.h
> @@ -0,0 +1,42 @@
> +#ifndef __ASM_PPC_CURRENT_H__
> +#define __ASM_PPC_CURRENT_H__
> +
> +#include <xen/percpu.h>
> +
> +#ifndef __ASSEMBLY__
> +
> +struct vcpu;
> +
> +/* Which VCPU is "current" on this PCPU. */
> +DECLARE_PER_CPU(struct vcpu *, curr_vcpu);
> +
> +#define current            (this_cpu(curr_vcpu))
> +#define set_current(vcpu)  do { current = (vcpu); } while (0)
> +#define get_cpu_current(cpu)  (per_cpu(curr_vcpu, cpu))
> +
> +/* Per-VCPU state that lives at the top of the stack */
> +struct cpu_info {
> +    struct cpu_user_regs guest_cpu_user_regs;
> +    unsigned long elr;
> +    uint32_t flags;

May I suggest that you pick one of fixed-width types or basic C types
for consistent use here?

> +};
> +
> +static inline struct cpu_info *get_cpu_info(void)
> +{
> +#ifdef __clang__
> +    unsigned long sp;
> +
> +    asm ("mr %0, 1" : "=r" (sp));

Nit: Style.

> --- /dev/null
> +++ b/xen/arch/ppc/include/asm/device.h
> @@ -0,0 +1,53 @@
> +#ifndef __ASM_PPC_DEVICE_H__
> +#define __ASM_PPC_DEVICE_H__
> +
> +enum device_type
> +{
> +    DEV_DT,
> +    DEV_PCI,
> +};
> +
> +struct device {
> +    enum device_type type;
> +#ifdef CONFIG_HAS_DEVICE_TREE
> +    struct dt_device_node *of_node; /* Used by drivers imported from Linux */
> +#endif
> +};
> +
> +enum device_class
> +{
> +    DEVICE_SERIAL,
> +    DEVICE_IOMMU,
> +    DEVICE_GIC,
> +    DEVICE_PCI_HOSTBRIDGE,
> +    /* Use for error */
> +    DEVICE_UNKNOWN,
> +};
> +
> +struct device_desc {
> +    /* Device name */
> +    const char *name;
> +    /* Device class */
> +    enum device_class class;
> +    /* List of devices supported by this driver */
> +    const struct dt_device_match *dt_match;
> +    /*
> +     * Device initialization.
> +     *
> +     * -EAGAIN is used to indicate that device probing is deferred.
> +     */
> +    int (*init)(struct dt_device_node *dev, const void *data);
> +};
> +
> +typedef struct device device_t;
> +
> +#define DT_DEVICE_START(_name, _namestr, _class)                    \
> +static const struct device_desc __dev_desc_##_name __used           \
> +__section(".dev.info") = {                                          \
> +    .name = _namestr,                                               \
> +    .class = _class,                                                \
> +
> +#define DT_DEVICE_END                                               \
> +};
> +
> +#endif /* __ASM_PPC_DEVICE_H__ */

Do you really need everything you put in here?

> --- /dev/null
> +++ b/xen/arch/ppc/include/asm/div64.h
> @@ -0,0 +1,14 @@
> +#ifndef __ASM_PPC_DIV64_H__
> +#define __ASM_PPC_DIV64_H__
> +
> +#include <xen/types.h>
> +
> +#define do_div(n,base) ({                       \
> +    uint32_t __base = (base);                   \
> +    uint32_t __rem;                             \
> +    __rem = ((uint64_t)(n)) % __base;           \
> +    (n) = ((uint64_t)(n)) / __base;             \
> +    __rem;                                      \
> +})

I understand you're merely copying this from elsewhere, but it would be
really nice if style could be corrected for such new instances (no
leading underscores, blank after comma, and ideally also no excess
parentheses).

> --- /dev/null
> +++ b/xen/arch/ppc/include/asm/domain.h
> @@ -0,0 +1,46 @@
> +#ifndef __ASM_PPC_DOMAIN_H__
> +#define __ASM_PPC_DOMAIN_H__
> +
> +#include <xen/xmalloc.h>
> +#include <public/hvm/params.h>
> +
> +struct hvm_domain
> +{
> +    uint64_t              params[HVM_NR_PARAMS];
> +};
> +
> +#define is_domain_direct_mapped(d) ((void)(d), 0)
> +
> +/* TODO: Implement */
> +#define guest_mode(r) ({ (void) (r); BUG_ON("unimplemented"); 0; })

Nit: Stray blank after cast (more instances of this pattern elsewhere).

> diff --git a/xen/arch/ppc/include/asm/grant_table.h b/xen/arch/ppc/include/asm/grant_table.h
> new file mode 100644
> index 0000000000..e69de29bb2

Instead of introducing a completely empty file, perhaps better to put
one in that at least has the usual header guard?

> --- /dev/null
> +++ b/xen/arch/ppc/include/asm/guest_access.h
> @@ -0,0 +1,54 @@
> +#ifndef __ASM_PPC_GUEST_ACCESS_H__
> +#define __ASM_PPC_GUEST_ACCESS_H__
> +
> +#include <xen/mm.h>
> +
> +/* TODO */
> +
> +static inline unsigned long raw_copy_to_guest(void *to, const void *from, unsigned int len)
> +{
> +    BUG_ON("unimplemented");
> +}
> +static inline unsigned long raw_copy_to_guest_flush_dcache(void *to, const void *from,
> +                                             unsigned int len)

Nit: Indentation. In cases like this it may be better to use the other
wrapping form:

static inline unsigned long raw_copy_to_guest_flush_dcache(
    void *to,
    const void *from,
    unsigned int len)
{
    ...

More instances further down.

> --- /dev/null
> +++ b/xen/arch/ppc/include/asm/guest_atomics.h
> @@ -0,0 +1,14 @@
> +#ifndef __ASM_PPC_GUEST_ATOMICS_H__
> +#define __ASM_PPC_GUEST_ATOMICS_H__
> +
> +#include <xen/lib.h>
> +
> +/* TODO: implement */
> +#define guest_test_bit(d, nr, p)            ({ (void) (d); (void) (nr); (void) (p); BUG_ON("unimplemented"); false; })
> +#define guest_clear_bit(d, nr, p)           ({ (void) (d); (void) (nr); (void) (p); BUG_ON("unimplemented"); false; })
> +#define guest_set_bit(d, nr, p)             ({ (void) (d); (void) (nr); (void) (p); BUG_ON("unimplemented"); false; })
> +#define guest_test_and_set_bit(d, nr, p)    ({ (void) (d); (void) (nr); (void) (p); BUG_ON("unimplemented"); false; })
> +#define guest_test_and_clear_bit(d, nr, p)  ({ (void) (d); (void) (nr); (void) (p); BUG_ON("unimplemented"); false; })
> +#define guest_test_and_change_bit(d, nr, p) ({ (void) (d); (void) (nr); (void) (p); BUG_ON("unimplemented"); false; })

Perhaps deal with these overlong lines by introducing a common helper macro
that all of the #define-s here then use?

> --- a/xen/arch/ppc/include/asm/mm.h
> +++ b/xen/arch/ppc/include/asm/mm.h
> @@ -1,10 +1,23 @@
>  #ifndef _ASM_PPC_MM_H
>  #define _ASM_PPC_MM_H
> 
> +#include <public/xen.h>
> +#include <xen/pdx.h>
> +#include <xen/types.h>
> +#include <asm/config.h>
>  #include <asm/page-bits.h>
> 
> +void setup_initial_pagetables(void);
> +
>  #define pfn_to_paddr(pfn) ((paddr_t)(pfn) << PAGE_SHIFT)
>  #define paddr_to_pfn(pa)  ((unsigned long)((pa) >> PAGE_SHIFT))
> +#define paddr_to_pdx(pa)    mfn_to_pdx(maddr_to_mfn(pa))
> +#define gfn_to_gaddr(gfn)   pfn_to_paddr(gfn_x(gfn))
> +#define gaddr_to_gfn(ga)    _gfn(paddr_to_pfn(ga))
> +#define mfn_to_maddr(mfn)   pfn_to_paddr(mfn_x(mfn))
> +#define maddr_to_mfn(ma)    _mfn(paddr_to_pfn(ma))
> +#define vmap_to_mfn(va)     maddr_to_mfn(virt_to_maddr((vaddr_t)va))
> +#define vmap_to_page(va)    mfn_to_page(vmap_to_mfn(va))
> 
>  #define virt_to_maddr(va) ((paddr_t)((vaddr_t)(va) & PADDR_MASK))
>  #define maddr_to_virt(pa) ((void *)((paddr_t)(pa) | XEN_VIRT_START))
> @@ -13,6 +26,240 @@
>  #define __pa(x)             (virt_to_maddr(x))
>  #define __va(x)             (maddr_to_virt(x))
> 
> -void setup_initial_pagetables(void);
> +/* Convert between Xen-heap virtual addresses and machine frame numbers. */
> +#define __virt_to_mfn(va) (virt_to_maddr(va) >> PAGE_SHIFT)
> +#define __mfn_to_virt(mfn) (maddr_to_virt((paddr_t)(mfn) << PAGE_SHIFT))
> +
> +/* Convert between Xen-heap virtual addresses and page-info structures. */
> +static inline struct page_info *virt_to_page(const void *v)
> +{
> +    BUG_ON("unimplemented");
> +    return NULL;
> +}
> +
> +/*
> + * We define non-underscored wrappers for above conversion functions.
> + * These are overriden in various source files while underscored version
> + * remain intact.
> + */
> +#define virt_to_mfn(va)     __virt_to_mfn(va)
> +#define mfn_to_virt(mfn)    __mfn_to_virt(mfn)
> +
> +#define PG_shift(idx)   (BITS_PER_LONG - (idx))
> +#define PG_mask(x, idx) (x ## UL << PG_shift(idx))
> +
> +#define PGT_none          PG_mask(0, 1)  /* no special uses of this page   */
> +#define PGT_writable_page PG_mask(1, 1)  /* has writable mappings?         */
> +#define PGT_type_mask     PG_mask(1, 1)  /* Bits 31 or 63.                 */
> +
> + /* 2-bit count of uses of this frame as its current type. */
> +#define PGT_count_mask    PG_mask(3, 3)
> +
> +/* Cleared when the owning guest 'frees' this page. */
> +#define _PGC_allocated    PG_shift(1)
> +#define PGC_allocated     PG_mask(1, 1)
> +/* Page is Xen heap? */
> +#define _PGC_xen_heap     PG_shift(2)
> +#define PGC_xen_heap      PG_mask(1, 2)
> +/* Page is broken? */
> +#define _PGC_broken       PG_shift(7)
> +#define PGC_broken        PG_mask(1, 7)
> + /* Mutually-exclusive page states: { inuse, offlining, offlined, free }. */
> +#define PGC_state         PG_mask(3, 9)
> +#define PGC_state_inuse   PG_mask(0, 9)
> +#define PGC_state_offlining PG_mask(1, 9)
> +#define PGC_state_offlined PG_mask(2, 9)
> +#define PGC_state_free    PG_mask(3, 9)
> +#define page_state_is(pg, st) (((pg)->count_info&PGC_state) == PGC_state_##st)
> +/* Page is not reference counted */
> +#define _PGC_extra        PG_shift(10)
> +#define PGC_extra         PG_mask(1, 10)
> +
> +/* Count of references to this frame. */
> +#define PGC_count_width   PG_shift(10)
> +#define PGC_count_mask    ((1UL<<PGC_count_width)-1)
> +
> +/*
> + * Page needs to be scrubbed. Since this bit can only be set on a page that is
> + * free (i.e. in PGC_state_free) we can reuse PGC_allocated bit.
> + */
> +#define _PGC_need_scrub   _PGC_allocated
> +#define PGC_need_scrub    PGC_allocated
> +
> +#define is_xen_heap_page(page) ((page)->count_info & PGC_xen_heap)
> +#define is_xen_heap_mfn(mfn) \
> +    (mfn_valid(mfn) && is_xen_heap_page(mfn_to_page(mfn)))
> +
> +#define is_xen_fixed_mfn(mfn)                                   \
> +    ((mfn_to_maddr(mfn) >= virt_to_maddr(&_start)) &&           \
> +     (mfn_to_maddr(mfn) <= virt_to_maddr((vaddr_t)_end - 1)))
> +
> +#define page_get_owner(_p)    (_p)->v.inuse.domain
> +#define page_set_owner(_p,_d) ((_p)->v.inuse.domain = (_d))
> +
> +/* TODO: implement */
> +#define mfn_valid(mfn) ({ (void) (mfn); 0; })

BUG_ON("unimplemented")?

> +#define mfn_to_gfn(d, mfn) ((void)(d), _gfn(mfn_x(mfn)))

This looks risky to me. Perhaps better to also use BUG_ON("unimplemented")
here?

> +#define domain_set_alloc_bitsize(d) ((void)0)

Better ((void)(d)).

> +#define domain_clamp_alloc_bitsize(d, b) (b)
> +
> +#define PFN_ORDER(_pfn) ((_pfn)->v.free.order)

Unnessary leading underscore again.

>[...]
> +#define PDX_GROUP_SHIFT (16 + 5)

DYM (PAGE_SHIFT + XEN_PT_ENTRIES_LOG2_LVL_4) or simply XEN_PT_SHIFT_LVL_3?
Using open-coded literal numbers is always at risk of breaking (when one
use site is updated, but another missed) and also isn't self-documenting.

> --- /dev/null
> +++ b/xen/arch/ppc/include/asm/monitor.h
> @@ -0,0 +1,46 @@
> +/* Derived from xen/arch/arm/include/asm/monitor.h */
> +#ifndef __ASM_PPC_MONITOR_H__
> +#define __ASM_PPC_MONITOR_H__
> +
> +#include <public/domctl.h>
> +#include <xen/errno.h>
> +
> +static inline
> +void arch_monitor_allow_userspace(struct domain *d, bool allow_userspace)
> +{
> +}
> +
> +static inline
> +int arch_monitor_domctl_op(struct domain *d, struct xen_domctl_monitor_op *mop)
> +{
> +    /* No arch-specific monitor ops on PPC. */
> +    return -EOPNOTSUPP;
> +}
> +
> +int arch_monitor_domctl_event(struct domain *d,
> +                              struct xen_domctl_monitor_op *mop);
> +
> +static inline
> +int arch_monitor_init_domain(struct domain *d)
> +{
> +    /* No arch-specific domain initialization on PPC. */
> +    return 0;
> +}
> +
> +static inline
> +void arch_monitor_cleanup_domain(struct domain *d)
> +{
> +    /* No arch-specific domain cleanup on PPC. */
> +}
> +
> +static inline uint32_t arch_monitor_get_capabilities(struct domain *d)
> +{
> +    uint32_t capabilities = 0;
> +
> +    capabilities = (1U << XEN_DOMCTL_MONITOR_EVENT_GUEST_REQUEST |
> +                    1U << XEN_DOMCTL_MONITOR_EVENT_PRIVILEGED_CALL);

Are you sure about putting these here right away?

> --- /dev/null
> +++ b/xen/arch/ppc/include/asm/nospec.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * From arch/arm/include/asm/nospec.h.
> + * Copyright 2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.

I wonder about both the reference and the copyright, when ...

> + */
> +#ifndef __ASM_PPC_NOSPEC_H__
> +#define __ASM_PPC_NOSPEC_H__
> +
> +static inline bool evaluate_nospec(bool condition)
> +{
> +    return condition;
> +}
> +
> +static inline void block_speculation(void)
> +{
> +}
> +
> +#endif /* __ASM_PPC_NOSPEC_H__ */

... seeing this trivial content.

> --- /dev/null
> +++ b/xen/arch/ppc/include/asm/p2m.h
> @@ -0,0 +1,105 @@
> +#ifndef __ASM_PPC_P2M_H__
> +#define __ASM_PPC_P2M_H__
> +
> +#include <asm/page-bits.h>
> +
> +#define paddr_bits PADDR_BITS
> +
> +/*
> + * List of possible type for each page in the p2m entry.
> + * The number of available bit per page in the pte for this purpose is 4 bits.
> + * So it's possible to only have 16 fields. If we run out of value in the
> + * future, it's possible to use higher value for pseudo-type and don't store
> + * them in the p2m entry.
> + */
> +typedef enum {
> +    p2m_invalid = 0,    /* Nothing mapped here */
> +    p2m_ram_rw,         /* Normal read/write guest RAM */
> +    p2m_ram_ro,         /* Read-only; writes are silently dropped */
> +    p2m_mmio_direct_dev,/* Read/write mapping of genuine Device MMIO area */
> +    p2m_mmio_direct_nc, /* Read/write mapping of genuine MMIO area non-cacheable */
> +    p2m_mmio_direct_c,  /* Read/write mapping of genuine MMIO area cacheable */

Is PPC's memory model really this similar to Arm's? If not, I'd recommend
ommitting all enumerators you don't need right away.

> --- a/xen/arch/ppc/include/asm/page.h
> +++ b/xen/arch/ppc/include/asm/page.h
> @@ -36,6 +36,9 @@
>  #define PTE_XEN_RO   (PTE_XEN_BASE | PTE_EAA_READ)
>  #define PTE_XEN_RX   (PTE_XEN_BASE | PTE_EAA_READ | PTE_EAA_EXECUTE)
> 
> +/* TODO */
> +#define PAGE_HYPERVISOR 0
> +
>  /*
>   * Radix Tree layout for 64KB pages:
>   *
> @@ -177,4 +180,18 @@ struct prtb_entry {
> 
>  void tlbie_all(void);
> 
> +static inline void invalidate_icache(void)
> +{
> +    BUG_ON("unimplemented");
> +}
> +
> +#define clear_page(page) memset((void *)(page), 0, PAGE_SIZE)
> +#define copy_page(dp, sp) memcpy(dp, sp, PAGE_SIZE)

Does clear_page() really need a cast, when copy_page() doesn't?

> --- /dev/null
> +++ b/xen/arch/ppc/include/asm/procarea.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (C) IBM Corp. 2005
> + *
> + * Authors: Hollis Blanchard <hollisb@us.ibm.com>
> + */
> +
> +#ifndef _ASM_PROCAREA_H_
> +#define _ASM_PROCAREA_H_
> +
> +struct processor_area
> +{
> +    unsigned int whoami;
> +    unsigned int hard_id;
> +    struct vcpu *cur_vcpu;
> +    void *hyp_stack_base;
> +    unsigned long saved_regs[2];
> +};
> +
> +#endif

I can't spot a need for this header, and it's also unclear how it / the
struct it defines would be meant to be used. Perhpas better omit for now.

> --- a/xen/arch/ppc/include/asm/system.h
> +++ b/xen/arch/ppc/include/asm/system.h
> @@ -1,6 +1,233 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (C) IBM Corp. 2005
> + * Copyright (C) Raptor Engineering LLC
> + *
> + * Authors: Jimi Xenidis <jimix@watson.ibm.com>
> + *          Shawn Anastasio <sanastasio@raptorengineering.com>
> + */
> +
>  #ifndef _ASM_SYSTEM_H_
>  #define _ASM_SYSTEM_H_
> 
> -#define smp_wmb() __asm__ __volatile__ ( "lwsync" : : : "memory" )
> +#include <xen/lib.h>
> +#include <asm/memory.h>
> +#include <asm/time.h>
> +#include <asm/processor.h>
> +#include <asm/msr.h>
> +
> +#define xchg(ptr,x) 							       \
> +({									       \
> +	__typeof__(*(ptr)) _x_ = (x);					       \
> +	(__typeof__(*(ptr))) __xchg((ptr), (unsigned long)_x_, sizeof(*(ptr))); \
> +})
> +
> +#define build_xchg(fn, type, ldinsn, stinsn) \
> +static inline unsigned long \
> +fn(volatile type *m, unsigned long val) \
> +{ \
> +    unsigned long dummy; \
> +                                                    \
> +    __asm__ __volatile__(                           \
> +    PPC_ATOMIC_ENTRY_BARRIER                        \
> +"1: " ldinsn " %0,0,%3\n"                           \
> +    stinsn " %2,0,%3\n"                             \
> +"2:  bne- 1b"                                       \
> +    PPC_ATOMIC_EXIT_BARRIER                         \
> +    : "=&r" (dummy), "=m" (*m)                      \
> +    : "r" (val), "r" (m)                            \
> +    : "cc", "memory");                              \

Nit: Style and indentation (more such below).

>[...]
> +#define local_irq_restore(flags) do { \
> +        __asm__ __volatile__("": : :"memory"); \
> +        mtmsrd((flags)); \
> +} while(0)
> +
> +static inline void local_irq_disable(void)
> +{
> +        unsigned long msr;
> +        msr = mfmsr();
> +        mtmsrd(msr & ~MSR_EE);
> +        __asm__ __volatile__("" : : : "memory");
> +}
> +
> +static inline void local_irq_enable(void)
> +{
> +        unsigned long msr;
> +        __asm__ __volatile__("" : : : "memory");
> +        msr = mfmsr();
> +        mtmsrd(msr | MSR_EE);
> +}

Nit: Too deep indentation.

> --- /dev/null
> +++ b/xen/arch/ppc/include/asm/time.h
> @@ -0,0 +1,20 @@
> +#ifndef __ASM_PPC_TIME_H__
> +#define __ASM_PPC_TIME_H__
> +
> +#include <xen/lib.h>
> +#include <asm/processor.h>
> +#include <asm/regs.h>
> +
> +struct vcpu;
> +
> +/* TODO: implement */
> +static inline void force_update_vcpu_system_time(struct vcpu *v) { BUG_ON("unimplemented"); }
> +
> +typedef unsigned long cycles_t;
> +
> +static inline cycles_t get_cycles(void)
> +{
> +	return mfspr(SPRN_TBRL);

Nit: Hard tab left.

> --- /dev/null
> +++ b/xen/arch/ppc/include/asm/vm_event.h

For this, please note Oleksii's 2-patch series eliminating the need for
a per-arch header. Else ...

> @@ -0,0 +1,49 @@
> +#ifndef __ASM_PPC_VM_EVENT_H__
> +#define __ASM_PPC_VM_EVENT_H__
> +
> +#include <xen/sched.h>
> +#include <xen/vm_event.h>
> +#include <public/domctl.h>

... public/vm_event.h instead and likely no need for xen/vm_event.h.

> diff --git a/xen/arch/ppc/include/asm/xenoprof.h b/xen/arch/ppc/include/asm/xenoprof.h
> new file mode 100644
> index 0000000000..e69de29bb2

Again perhaps better to not introduce an entirely empty header.

I also notice that most new files don't have an SPDX header. Would be
nice to fulfill this formal aspect right from the start.

Jan

