Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2EB719A3A
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 12:56:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542399.846211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4fy1-0002ud-PK; Thu, 01 Jun 2023 10:55:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542399.846211; Thu, 01 Jun 2023 10:55:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4fy1-0002sY-MO; Thu, 01 Jun 2023 10:55:41 +0000
Received: by outflank-mailman (input) for mailman id 542399;
 Thu, 01 Jun 2023 10:55:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mTbf=BV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q4fy0-0002oj-S7
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 10:55:40 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20604.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d83a56c9-006a-11ee-8611-37d641c3527e;
 Thu, 01 Jun 2023 12:55:39 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8391.eurprd04.prod.outlook.com (2603:10a6:102:1c4::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Thu, 1 Jun
 2023 10:55:36 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.024; Thu, 1 Jun 2023
 10:55:35 +0000
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
X-Inumbo-ID: d83a56c9-006a-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JptmkSkUj3VEK3ru1blj2zJ5pcoTeUCROYQhpTmSS5LWkBjUaabi0scVmqN0qGDZBs+ht4u/9PQOkch4b3t8PddVETBZpQARSL6Nqe0tVIQ9Vnckj1gFuUbduzoxWWQNSp+uhCH4CkaKhzeV+xgd5VQJjLPqkB5DvZA3al8Gb7Ax8o14MbGklKAO9SIzBYYwCr8Wft8qLdizIMtmnIgjYxGFS1K7NQzyS9XnmgxOugejo5UQ+g4L2pr0ZKJ1KgpuijKmMKmjSEL2wpyX53/brkmFddLUCXUbMORYAIbJyJxsvktiDY1EtIppGi4frGE6RcyWuKDJ+7J24OKba7+cOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fPaLZ3eIEWCN6qynQ1yJDPYU+BI/6mruV4wlPONjL4c=;
 b=V9OoUAKh4bIMuAuFIdyFvSWW8h9IMeIxY01b9566B8gAry3zdF44xWtfS3Dv53b4tSQGb5rM8TYEqTID2JNJJ0Mey7NLdni7oVIZatnJS8Uwfhx3HVZmV45am80W5Z1iZjkqWmtXyMIEXgUDJOEiPtpADikAdNn4EL7xEa53ZAJNcnhvypO6IheurTgzbI+pgxRz6nYNUaaoh9zvwGLGgke/BXr/VWEMbTLckWydMMk5DmrvQo+U/CqOB29OxqjchFskejzTF4MymX57wqJJ1oZop4PQljYL8hJGzeu4KK+2wf7mbjp3jY6UmPClf/hvrMCqSJYK6gQJJD4YeMbzvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fPaLZ3eIEWCN6qynQ1yJDPYU+BI/6mruV4wlPONjL4c=;
 b=tkZw4HF7uwJ9JYvcLcbxE0A2RpvoQbDKKYYowNRMqgz9lWu6QVECkf75GMYsKvaQx3KKPnQmDt519fLIw6msYRIkOj7qHsdyT69zdmFyr6+FyPy2AJ494OK1kRK/lxijo2JrNGmAez7EgpdQTUBoXTJUEatqAPRWtSp+KVqIyRcFGSRwC+L5/nC36n3B25rMq5i1urVk3khM8adqP9lo2H1SvtVsF/VnbQNrF0t2uLA76sMVodUdi1M+DMdwYOP6BiCxT8syI6upxsPf9sfmj646VgSJtmGYnCvK+ZxHHnrXs2OsEyofllu3iDGxuPJBdh8kanqF9EId47IyTNiyOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <924a6ee3-8d3e-a3e0-067a-8295be72e2d7@suse.com>
Date: Thu, 1 Jun 2023 12:55:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Ping: [PATCH v2] x86emul: avoid triggering event related assertions
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a056a258-51c0-2721-1ef2-1e7796c85659@suse.com>
In-Reply-To: <a056a258-51c0-2721-1ef2-1e7796c85659@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0007.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8391:EE_
X-MS-Office365-Filtering-Correlation-Id: a9d3d0cd-cd5c-4194-129c-08db628eba83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IFklEDcetU/6tOY0lcq/EuRk6eLAlnWUC76X4bLZvrxceU5vatfscQVI4eunOdDCLqzo11RRQeWZUTP7l2eNJf4TT35JtFhExqfEUpnxOj6pNx9vv73ljpskRPjRsUOu28n1nWdrYXVMkvKxhac28eJ5cfYczVV+MyO4cc5e8shzC+zG4BQlRgyzlOv9vPGIbjELjtm4Q0W6/WQLcFzNeZ6Yralxt6GbDXszGT6ZPLjjUu75jtJ0Kbn80gGOAF362GXywcppm+IMhUgo6UMOZHm3UfSUIkhnDDMUen9nBYKUtnaUMPvQQ8YaATZETbUXaGULDGyt46XJl/9TsEMyWpYmIK1aErHx9OBUNARumK4jOegEUirkG+u63PV3uVYVm2r6nV3PzQdc6GSoSfb0iJHrH1DdY3gwUNy6H1/LCv4eiLzhqI+81ycCmiZjfC6Aw34hnCBWadbDOM2+55QsQhw2vX+BYLUPVy5nrcCTZYH89NYPksxWaZTR5lsKH32IHjgzFEl8K3bPVtHwalORw8h0S/qJYY6o4MI7bq2NYqVou1aJa9/vrahe7CHv9b8hkoeCM/MAy7IkinZzgppbJ08mq0w5asejyR3JMo6FEhv7yvUoU0VFfnzI3rACsvf4Ltaoh6scwB93PM5yaQ4ZLg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(346002)(39860400002)(136003)(366004)(451199021)(8936002)(2616005)(83380400001)(186003)(4326008)(2906002)(66946007)(66556008)(66476007)(478600001)(54906003)(316002)(110136005)(6506007)(53546011)(6512007)(5660300002)(26005)(8676002)(41300700001)(6486002)(38100700002)(31696002)(86362001)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHgycVZ3WlgyOXF0TW5nbC9YeEpWd2hUaHp5OUpTa0xWN0JISjB3NGhDREU0?=
 =?utf-8?B?YjNYNkRsbWNuTWJYM3R0VVZUZDEvQm5aSUMwRDFXdU16VDhubXpNcmRqaXNu?=
 =?utf-8?B?QndDTnhhNm1jTGhyNTZxMzdqWFplQzFXSVdpVGlKSnRhTEVabjV2SW5oRDI4?=
 =?utf-8?B?eHk5L1F1WURpRGN5UjhGR2JkQ0lFd0dWQzlkV2lUeU1qS0g5T3hMVXZ1dDZC?=
 =?utf-8?B?QlQzVFMvQnZGQWhhRkllN3diUThST0ltc24zWUpwdzc2VU5aNU43YkVqeE10?=
 =?utf-8?B?LzJtMmx1NkFFRisyUnBWMUdIOTB1NDE4em01cTJ4YUwyUHA5R3NuRzUyVmVN?=
 =?utf-8?B?OUxTWDNtVHo4RUxLWHZ1d1QyM1VGbWtCcWZnOFpaa2RCRHUrNEphZFg2bEIw?=
 =?utf-8?B?RXdOcGZVTkczNm44eXJnR0JmdWFHd1ZFRHBzcE42TXV4Wk9qRkIrUEQrRnYr?=
 =?utf-8?B?ZnBpU1d3QTMvUkp5YjVQNG1qK0VQY0p6QWZRS3JncnhWRnRNOUE3SllKZjQw?=
 =?utf-8?B?N2hqVjcwYXA4alA5eUF0OVpKRVhZR1lkRTV0ZWRnMnJvUzNIb2d2aHd6QXZH?=
 =?utf-8?B?U3M4UVRvdnVwbFRVazExUU9sR2lCaVNwU2QwamZlUmNCeU9SRUZ3UDR4dVc2?=
 =?utf-8?B?TTNQajBQT0xlS3h4dEFSR3d4OTJXa2RRRnhRYlI1K3A5Y1daeFF4Z25ULzJR?=
 =?utf-8?B?dHQxUGJIdmZLNGtpV29DRGtuSEhyeG5KUzVRNUg1YnB6RmlCN2IrZE4zRXZ3?=
 =?utf-8?B?TkdubDFraG9na2Q4dGl2M0pTemRzNTB3RitPWE1tYXY4YXJiSGRGYVRRRFg0?=
 =?utf-8?B?cnFOcGt5OCtFRnYwUjJ5OWYyMlBzWXN5WWQ1VE9aUWF5eW9zWHZMZm9pdG1W?=
 =?utf-8?B?WkJCdTJKTXZ6Rkl6MDducElIeDhmMXlrQnRKbTRhTmFEYkJQM2JZdFZBVWhz?=
 =?utf-8?B?RjVxbThYcjNyaUVVQUN5dmoweHphd2xDL1dMUkNML1RrNVhsa0UrVFk5L0lZ?=
 =?utf-8?B?Ly9Ka3RST1pHZ0MxTTBvQ2pqdDR5SHhLUzFPazFNQjN4MURqVDJPeE1pVFpW?=
 =?utf-8?B?aVlZMXZUSVkrNW1yT0h2VUFaMFpNVTlWN1lCOE10Ryt0MUtDem5sK2RRMHlR?=
 =?utf-8?B?cDF0N3ZxWktxQ2pWb0hvOXdmVkJhWVZBWjViUHpMVDdDVEx5OS9USUpYbUJn?=
 =?utf-8?B?ZzZqN0dIZmxBazRTZ09TeDd3R2FaTG5JWDRvVHJWOHYrWCtLdU9XYy9aWkRZ?=
 =?utf-8?B?WWloSm9zRlJKMmg4N3k3czZtOHErL3dtSEM2dXFTUEY0Q0l0K1R0VlBRYnJJ?=
 =?utf-8?B?KzF5M2ZKMWxtVU5idVVKV2lXQXozQnBwZ2ZDVjlNV0I1L01adlBpYU1BemZw?=
 =?utf-8?B?ZXE0bk4waWc4NFR6aGR0OWtBMnpaY0VrSldpTjNpbEw0RHVoWmZJVmNqczBH?=
 =?utf-8?B?a0h6QWFydFo0NFZCaXhiUFlpT3BMNTB6REd2cCt1ZlMyaFdNVGlHVWNXVkhL?=
 =?utf-8?B?Z29nZkxyVHVxUjlOZ2pLOCs2TmR5SHFmUENEajgxNlFkQURpb2ZqbGEzSUNL?=
 =?utf-8?B?RGxNRTMrQ1J4MnFSTlFLdnZaaXhCT1VJM0o3QnlVbWhPckJPOERQejJqMkNG?=
 =?utf-8?B?SjlEL0VZRmVzVVNOVlFOakV5ZDh0Qkpudm1KRlBQMUkvUGtTazkySGxac2Jp?=
 =?utf-8?B?YmRTY1NzTkJnZitKaGtFckJ3WnhOOWZiN0dJQVJOOUwwQWRIYytTS0lpU3pU?=
 =?utf-8?B?WjJhREFQMm1NT1pJN2Q4S2c1SUUyMUZBcGtVbS81OUtELzE1MXo4RzdRZmt1?=
 =?utf-8?B?YzduMkRlVnZka1JES0o1NVljN2xlY1JlK1BvV2NuR2REQmdiWExzSHZiSGNQ?=
 =?utf-8?B?MVZySDNhN2JjaFF6eDU5eDB6RlhwSWpMNnZXZGZaZDN4b3ZwOHlJcWliOCti?=
 =?utf-8?B?bWN5MjVSMzQ5YlVwWUdTeC9aYS9GT3V3VjVzUUhheEJtL3BDRUpvcUNSV2VL?=
 =?utf-8?B?dXJLcmhWdjIva3RDdXhnTnp0SVR0b011b01zcElMcGEzamxpbDJ4cDYyZFhK?=
 =?utf-8?B?MXVtSGQxdExNMFNCS2xxNStSYlVpVlVRanlraHJsUnNEZVRhdWVzdVV6OFl6?=
 =?utf-8?Q?TXBnmUdYvrfe0IOam4YosxdfD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9d3d0cd-cd5c-4194-129c-08db628eba83
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 10:55:35.8672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FrtADA+x1msVE7ehKSKFG0nwrv5JXRMq2WqDAU5TgNwQ0B8S2KppqNscYfbeQjaMRqWEhmJ1gzE2dDrbYc6OTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8391

On 17.04.2023 14:23, Jan Beulich wrote:
> The assertion at the end of x86_emulate_wrapper() as well as the ones
> in x86_emul_{hw_exception,pagefault}() can trigger if we ignore
> X86EMUL_EXCEPTION coming back from certain hook functions. Squash
> exceptions when merely probing MSRs, plus on SWAPGS'es "best effort"
> error handling path.
> 
> In adjust_bnd() add another assertion after the read_xcr(0, ...)
> invocation, paralleling the one in x86emul_get_fpu() - XCR0 reads should
> never fault when XSAVE is (implicitly) known to be available.
> 
> Also update the respective comment in x86_emulate_wrapper().
> 
> Fixes: 14a6be89ec04 ("x86emul: correct EFLAGS.TF handling")
> Fixes: cb2626c75813 ("x86emul: conditionally clear BNDn for branches")
> Fixes: 6eb43fcf8a0b ("x86emul: support SWAPGS")
> Reported-by: AFL
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I think this, addressing a real issue observed with the fuzzer, would be
quite nice to go in rather sooner than later.

Jan

> ---
> EFER reads won't fault in any of the handlers we have, so in principle
> the respective check could be omitted (and hence has no Fixes: tag).
> Thoughts?
> 
> The Fixes: tags are for the commits introducing the affected code; I'm
> not entirely sure whether the raising of exceptions from hook functions
> actually pre-dates them, but even if not the issues were at least latent
> ones already before.
> ---
> v2: Also update the respective comment in x86_emulate_wrapper().
> 
> --- a/xen/arch/x86/x86_emulate/0f01.c
> +++ b/xen/arch/x86/x86_emulate/0f01.c
> @@ -200,8 +200,10 @@ int x86emul_0f01(struct x86_emulate_stat
>          if ( (rc = ops->write_segment(x86_seg_gs, &sreg,
>                                        ctxt)) != X86EMUL_OKAY )
>          {
> -            /* Best effort unwind (i.e. no error checking). */
> -            ops->write_msr(MSR_SHADOW_GS_BASE, msr_val, ctxt);
> +            /* Best effort unwind (i.e. no real error checking). */
> +            if ( ops->write_msr(MSR_SHADOW_GS_BASE, msr_val,
> +                                ctxt) == X86EMUL_EXCEPTION )
> +                x86_emul_reset_event(ctxt);
>              goto done;
>          }
>          break;
> --- a/xen/arch/x86/x86_emulate/0fae.c
> +++ b/xen/arch/x86/x86_emulate/0fae.c
> @@ -55,7 +55,10 @@ int x86emul_0fae(struct x86_emulate_stat
>                      cr4 = X86_CR4_OSFXSR;
>                  if ( !ops->read_msr ||
>                       ops->read_msr(MSR_EFER, &msr_val, ctxt) != X86EMUL_OKAY )
> +                {
> +                    x86_emul_reset_event(ctxt);
>                      msr_val = 0;
> +                }
>                  if ( !(cr4 & X86_CR4_OSFXSR) ||
>                       (mode_64bit() && mode_ring0() && (msr_val & EFER_FFXSE)) )
>                      s->op_bytes = offsetof(struct x86_fxsr, xmm[0]);
> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> @@ -1143,10 +1143,18 @@ static bool is_branch_step(struct x86_em
>                             const struct x86_emulate_ops *ops)
>  {
>      uint64_t debugctl;
> +    int rc = X86EMUL_UNHANDLEABLE;
>  
> -    return ops->read_msr &&
> -           ops->read_msr(MSR_IA32_DEBUGCTLMSR, &debugctl, ctxt) == X86EMUL_OKAY &&
> -           (debugctl & IA32_DEBUGCTLMSR_BTF);
> +    if ( !ops->read_msr ||
> +         (rc = ops->read_msr(MSR_IA32_DEBUGCTLMSR, &debugctl,
> +                             ctxt)) != X86EMUL_OKAY )
> +    {
> +        if ( rc == X86EMUL_EXCEPTION )
> +            x86_emul_reset_event(ctxt);
> +        debugctl = 0;
> +    }
> +
> +    return debugctl & IA32_DEBUGCTLMSR_BTF;
>  }
>  
>  static void adjust_bnd(struct x86_emulate_ctxt *ctxt,
> @@ -1160,13 +1168,21 @@ static void adjust_bnd(struct x86_emulat
>  
>      if ( !ops->read_xcr || ops->read_xcr(0, &xcr0, ctxt) != X86EMUL_OKAY ||
>           !(xcr0 & X86_XCR0_BNDREGS) || !(xcr0 & X86_XCR0_BNDCSR) )
> +    {
> +        ASSERT(!ctxt->event_pending);
>          return;
> +    }
>  
>      if ( !mode_ring0() )
>          bndcfg = read_bndcfgu();
>      else if ( !ops->read_msr ||
> -              ops->read_msr(MSR_IA32_BNDCFGS, &bndcfg, ctxt) != X86EMUL_OKAY )
> +              (rc = ops->read_msr(MSR_IA32_BNDCFGS, &bndcfg,
> +                                  ctxt)) != X86EMUL_OKAY )
> +    {
> +        if ( rc == X86EMUL_EXCEPTION )
> +            x86_emul_reset_event(ctxt);
>          return;
> +    }
>      if ( (bndcfg & IA32_BNDCFGS_ENABLE) && !(bndcfg & IA32_BNDCFGS_PRESERVE) )
>      {
>          /*
> @@ -8395,7 +8411,9 @@ int x86_emulate_wrapper(
>       * An event being pending should exactly match returning
>       * X86EMUL_EXCEPTION.  (If this trips, the chances are a codepath has
>       * called hvm_inject_hw_exception() rather than using
> -     * x86_emul_hw_exception().)
> +     * x86_emul_hw_exception(), or the invocation of a hook has caused an
> +     * exception to be raised, while the caller was only checking for
> +     * success/failure.)
>       */
>      ASSERT(ctxt->event_pending == (rc == X86EMUL_EXCEPTION));
>  
> 


