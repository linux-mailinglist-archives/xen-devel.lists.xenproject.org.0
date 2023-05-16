Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF6170472F
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 09:59:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535035.832626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pypZx-0005dr-NX; Tue, 16 May 2023 07:58:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535035.832626; Tue, 16 May 2023 07:58:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pypZx-0005c0-Kh; Tue, 16 May 2023 07:58:41 +0000
Received: by outflank-mailman (input) for mailman id 535035;
 Tue, 16 May 2023 07:58:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00Q8=BF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pypZw-0005bu-Ki
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 07:58:40 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20607.outbound.protection.outlook.com
 [2a01:111:f400:fe12::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76e5209d-f3bf-11ed-b229-6b7b168915f2;
 Tue, 16 May 2023 09:58:38 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by GV1PR04MB9055.eurprd04.prod.outlook.com (2603:10a6:150:1e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Tue, 16 May
 2023 07:58:36 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%4]) with mapi id 15.20.6387.032; Tue, 16 May 2023
 07:58:36 +0000
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
X-Inumbo-ID: 76e5209d-f3bf-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RSTkbP28W9U42Gb1uMutBn5zs+o1LCLN68v4NG4k0R0vlhGPhu+6x7vtNsCayAVu0M2V41PVlbqqGy8IO7sNJouzS/Vzu3wY9fla0QjjxMrE42r9t/qSrOjV6zrmGZznihCoAcEz13AG/pUCaiw5g/dk+8S8sf8wRnGjJVn3Xs5iJkAc0i0fGUqhrN7L663rgc4IUPRBwKmuxv+AafS+x5q2UtZT90llTj40TGAYlULW6BVzOz+6fOyW4UnnUXmCiaJIwZYCiJe2VP1S+CDHLlj3QU0lMkTnc/dZuu2JVHk8Zo0F7TVpH610AW37HYfLzpof7T/mqJwBrUboqVZ9VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e+NqQN8QURNGKAr2qM5Y4A17EH6PrzkLoVprF0hx4cI=;
 b=DaDbzNh9bpkl7fTK9B7/xccNXr2xoXPhXiHjCxhcr+xDNzHNK0FK7qVeR4mOkkr+pbuFEBxCSrIyfETj1K9L5/CdtoayPOGD0az7KkjEwi0xnluAHdB+6xpj1MB9K6NPgqqvyTZMiIDvE5+N4b6CZCrVndcxrNGOPQRYjvoiFxB2dHvbyGtozMJNYQyTLdXdddShcTCfOEPA5WqY9s8RawOQO6nayEgFAY0+NXcA52PtRL+Teeqr7RQlqXhtcAp8cbd+BJI6NNaLzlZY3Kvj2c6/x8BXR05wLh/b20BTTdpDXF3xSrhqzFsro+3Kfauwr2dWeRmXV+SOqVXN+v/WsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e+NqQN8QURNGKAr2qM5Y4A17EH6PrzkLoVprF0hx4cI=;
 b=33u/xPgKzfbemfdF5sFpYPouWhDbR69p9QQx4yLuksQtQUqQEiCP+fq0RdQOYN8863l1py11PsWs+dlt2Ly+UWhigtHfwLkjDVeJ9tWlC1UuyXsJ0m4a5NSSpgQzrWSBFaakKYlreU6UHSb/irxL9Au5IKh3Kx0GWBILWXcbE8Y27okdRXJSe8SXFHTwzvcShoCmGPsytwNDeu1G8PrXiz4NQkF1DgBcyX4rh67fouCs/vWINCX17OzD9UxnY9nMIEsH/5u9L8ZAzoSfgs8iYiFdwhN4w4eaWKXQmR0QhlLMEb0HU9/mRpsUm7ZDJ2WoGvpdLU0b/EYDbgbJu7eQKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <97825c89-87c5-1156-5621-9d03286fd865@suse.com>
Date: Tue, 16 May 2023 09:58:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 1/6] x86/boot: Rework dom0 feature configuration
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230515144259.1009245-1-andrew.cooper3@citrix.com>
 <20230515144259.1009245-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230515144259.1009245-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0131.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|GV1PR04MB9055:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f4f0439-71f7-462d-993f-08db55e35a0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ejQy45v9paUH2lEVo83XMH3PeNmJrm0yjDrI2nrPhfdUEIMh9Xwl2EzlBFAXiYho9HSbWceVMSGYSe7nRzF50qH3pbGulJccCeaAz6c/PWsJ9i9dCBZVF6eHB0veHTfpYM4n+U8MW2L+VO7FWsje5b1PwNLXA0ddchbpp/2pddPmg8Q3i2wjwXg7SWq7RGGZ7uzCQTCOXocEYoDtou8u+CyH5reg3rxH7CdkxMEZYNpPfxqPVdVOOTKb9tln1wdtyhX0wC3s/Cw6XFX1PFNXdjU+qLKX1HUTaY9EbqVAvm0ioGQyUe35PeRUaX8JAQ6vEponkbHNSGsfQthPUmYODFbMZtBxzSQ9Qc5Y4sJyWrROji0DfluF2eojtkKz0G2Z9UVxu7K2RS1YmFtxgyutr6D4drlpN6+xDiiVLHlG3J4alj75xiOHypdVlBCueZUeUAEtCtaDHzY6DjzP2uNTVq7ELrC45Af8ZftInKRcISB/y+NWxO13enB6b8jzmdQqxatItVH7xO6UQNnmcLDw+ds3JN55Etf1UtWSf1/Zabc61S5yDkC7ZVdBsCnsd+JSh5yKCvDq58VAwR8ohonE9Mcy698ChxbBG6/xFwPrFagYiL+yZRL5iG44xkiR8hU6PLWQzot+zZWKTdrgUahv6w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(39860400002)(136003)(396003)(376002)(451199021)(36756003)(86362001)(31696002)(54906003)(316002)(66476007)(6916009)(66556008)(66946007)(4326008)(478600001)(8936002)(5660300002)(8676002)(2906002)(38100700002)(2616005)(6512007)(26005)(6506007)(53546011)(186003)(83380400001)(41300700001)(6486002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWQyVDQ1c2tHQ3dHWVRrUHNITmp1Z1pwWmYwRjM1VHcyd0w3bHEzR0VyN2tT?=
 =?utf-8?B?SkVkcXF2WmdTKzlNdkd5SzVZSGZzODFBUDlDWTZjenV4YStGajJzYnBjT203?=
 =?utf-8?B?ZGdsQmJuUUV6d2lZTWNHWGZwTnUrdTRFUi9PcUY4c3ZycE02emQxT2xTKzFV?=
 =?utf-8?B?SkEvR0dleFdocEJQNUF5NmlZSUpHWnEySmNUd1FwQTlaUTJtOStCbG9QUEJO?=
 =?utf-8?B?TnFZZCtxKzNLbitXcGZIeEZwNm1oY3kyWVVoY3d1Kzc5NFhETTdvUmJiRExQ?=
 =?utf-8?B?NWU3MW9EVzc1cWhPUDZpUmFsVmFMV1k2MVErL3FwRkMzTlJVdXdJMVRSNnBC?=
 =?utf-8?B?NFNIdW4vUS91OFVDbDBSL01wR2VrUnBINUNYZDlxWHNPa0RhQXlIUTkvWXdo?=
 =?utf-8?B?TTUrWG03cmVmdEdIL2tQdWNsTDFiNmVMV1VUaW9aU1g2RTZobEpBbkF4MUgw?=
 =?utf-8?B?bEtYTE9adlRPaE9OUVYwVGQwWGxjQ2tiUEpVSHJGTzdraGFlV3RobW5kYXNF?=
 =?utf-8?B?V1A4ajFLdnQ0RWZmbzk2dG1SMnN1ZHFaOXc4YWdmZDN3bVN2cGhnaVE0cXpD?=
 =?utf-8?B?Q0NMdm5QZWxOREQzMWduNDZ6RER5eGxQaFM1bFRDNlhwRXpoZGNkaWlUK0tz?=
 =?utf-8?B?YUZXOHkzUDg1cGN1RGh2MGpiZDZkVlZKNEJvMTNFYlM1bjZjSXo4cGR0WVJ4?=
 =?utf-8?B?K1RLbWwyV1BSWWx5a1dOaEl5MEdDQUNKQU1LWWRFNXhQMTA5dkxnVkM0YnM2?=
 =?utf-8?B?MFFaNnY5YXNRM0FWU21GQk4xbmVCTEdMejY4T1lFRFVOcTh4NS96TEwzTDBz?=
 =?utf-8?B?TE05TGhyRk5UUWZWVTNZclpGekhJcXpwWW05YVFUU0h6dU5STlNhN0tyb1FL?=
 =?utf-8?B?K0ZrejZOTWFWV1g1TGNFMlhQWWREZ3kvQmtkOUdoUXBtRjJHYTBHVjBxZnhZ?=
 =?utf-8?B?VnlraWt3ZEtMTkNsOXpsV0RpV0xuNE5tS2pKZ2g1NVZ1NWxqT2Y4U2M2UDhn?=
 =?utf-8?B?UG90MG1LcFNaTVM2UlFFbUhEUVYyL0pmbGVlMnpBUG51Q0czV09IbXlDaUVV?=
 =?utf-8?B?WU1vYlNhYUpYWTVsbnlUMUFZaTkzeERXTnFqendpM01KTmJoSU9uSkJnMXJG?=
 =?utf-8?B?SXI3TUtYOTRWYlJta01HWUZkd05UcFhkRWZKWndGTTFUNEl6UFpMZXpJZGYy?=
 =?utf-8?B?K2xaRGg3ZncyRk5IM0FlNmR4UHFIRUNkamJRd0dKbjFHTnZhSG1vWFArRjMy?=
 =?utf-8?B?NytmMHg2MWFLYm5wUXY4c1o2ZmtXakYzanZrRHkreW9QS25PbURQd29Nb0wr?=
 =?utf-8?B?am4vWW1sa0F3MFI5b09uNzhlYUZteURHNHJwejZOVStUSFJLUTRjcVpMK25j?=
 =?utf-8?B?YmtxeDB6YXNmSmorVkdFb1BwSDhWcXdvZStMbGliZ2MzRUhWdWxEdC9ISmZ6?=
 =?utf-8?B?cVBrTDA2cEJFdWRqdnV1b3UxNEtHd0NyZzRtSmNwRHNicDYzT3hpK2JZczJw?=
 =?utf-8?B?YkJTK1FGSzd3cmo2WWdZN0NhdUZtYldlZ1lZKytVUDBFa2d4eXZ0SlRrM01y?=
 =?utf-8?B?b2xzdEhreElUSTg4SDJoOFczSWpuNXZYK3dXU1RsZi9YZWRsWG1ONnM1LzVW?=
 =?utf-8?B?MUppUWtmeXVKakhDZFYrUFdHVGQ4dlJFUGxSdWFQeFJlZGxVNUhZNStSWFk3?=
 =?utf-8?B?S21DaVlwdnhMUkhSQkZWWjRVZkJPMlE5d2llc2VPQTdoOTZCSW9GK3JWR2hH?=
 =?utf-8?B?MzJKbG82ZEJrOFQxaHdVRFNWYzFyelF6MWQ0VzRLQjJhV1lYWlkyczZqdWo3?=
 =?utf-8?B?K0x5TlNzOGdHcHp4V2NoSk1iRlY5NHhTTWx0djcwWmVxc3hjTU9UZWUwMEVV?=
 =?utf-8?B?MGNTQlRjRkx3MmRTbVpibEpKS2o1ZjY1L2lzVXZCWmVWSFBDUklLZ1UzbWhu?=
 =?utf-8?B?Nkh2Um5KMnFnVnZCQ3cvOC9KMkZZVU93K1loVDdmQVZqSDBTZjg5cVYrRUNy?=
 =?utf-8?B?V09JdlRvL0pVNkE2enI3OGNBRmRsdW9RbjNseTBLRWN0Z2t3bllqWXhRK1pJ?=
 =?utf-8?B?V29qVHErTDQ1b1BKTHdobEEvSHV5Ni9zeGZXUlVaak9EY1ZERElqSlQrQnZQ?=
 =?utf-8?Q?WmUoQkiJfmXx3M1PYJ85jvKFZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f4f0439-71f7-462d-993f-08db55e35a0f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 07:58:36.1500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rSiHKmnUkNa/dixbc73XvdEjq+yUaW2oJ6MiZuRdYjbOQOBOToiR2c9eGaiXq9whrDcoEQFKTOhrVJo9Qjeqwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9055

On 15.05.2023 16:42, Andrew Cooper wrote:
> Right now, dom0's feature configuration is split between between the common
> path and a dom0-specific one.  This mostly is by accident, and causes some
> very subtle bugs.
> 
> First, start by clearly defining init_dom0_cpuid_policy() to be the domain
> that Xen builds automatically.  The late hwdom case is still constructed in a
> mostly normal way, with the control domain having full discretion over the CPU
> policy.
> 
> Identifying this highlights a latent bug - the two halves of the MSR_ARCH_CAPS
> bodge are asymmetric with respect to the hardware domain.  This means that
> shim, or a control-only dom0 sees the MSR_ARCH_CAPS CPUID bit but none of the
> MSR content.  This in turn declares the hardware to be retpoline-safe by
> failing to advertise the {R,}RSBA bits appropriately.  Restrict this logic to
> the hardware domain, although the special case will cease to exist shortly.
> 
> For the CPUID Faulting adjustment, the comment in ctxt_switch_levelling()
> isn't actually relevant.  Provide a better explanation.
> 
> Move the recalculate_cpuid_policy() call outside of the dom0-cpuid= case.
> This is no change for now, but will become necessary shortly.
> 
> Finally, place the second half of the MSR_ARCH_CAPS bodge after the
> recalculate_cpuid_policy() call.  This is necessary to avoid transiently
> breaking the hardware domain's view while the handling is cleaned up.  This
> special case will cease to exist shortly.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one question / suggestion:

> @@ -858,7 +839,7 @@ void __init init_dom0_cpuid_policy(struct domain *d)
>       * so dom0 can turn off workarounds as appropriate.  Temporary, until the
>       * domain policy logic gains a better understanding of MSRs.
>       */
> -    if ( cpu_has_arch_caps )
> +    if ( is_hardware_domain(d) && cpu_has_arch_caps )
>          p->feat.arch_caps = true;

As a result of this, ...

> @@ -876,8 +857,32 @@ void __init init_dom0_cpuid_policy(struct domain *d)
>          }
>  
>          x86_cpu_featureset_to_policy(fs, p);
> +    }
> +
> +    /*
> +     * PV Control domains used to require unfiltered CPUID.  This was fixed in
> +     * Xen 4.13, but there is an cmdline knob to restore the prior behaviour.
> +     *
> +     * If the domain is getting unfiltered CPUID, don't let the guest kernel
> +     * play with CPUID faulting either, as Xen's CPUID path won't cope.
> +     */
> +    if ( !opt_dom0_cpuid_faulting && is_control_domain(d) && is_pv_domain(d) )
> +        p->platform_info.cpuid_faulting = false;
>  
> -        recalculate_cpuid_policy(d);
> +    recalculate_cpuid_policy(d);
> +
> +    if ( is_hardware_domain(d) && cpu_has_arch_caps )

... it would feel slightly more logical if p->feat.arch_caps was used here.
Whether that's to replace the entire condition or merely the right side of
the && depends on what the subsequent changes require (which I haven't
looked at yet).

Jan

> +    {
> +        uint64_t val;
> +
> +        rdmsrl(MSR_ARCH_CAPABILITIES, val);
> +
> +        p->arch_caps.raw = val &
> +            (ARCH_CAPS_RDCL_NO | ARCH_CAPS_IBRS_ALL | ARCH_CAPS_RSBA |
> +             ARCH_CAPS_SSB_NO | ARCH_CAPS_MDS_NO | ARCH_CAPS_IF_PSCHANGE_MC_NO |
> +             ARCH_CAPS_TAA_NO | ARCH_CAPS_SBDR_SSDP_NO | ARCH_CAPS_FBSDP_NO |
> +             ARCH_CAPS_PSDP_NO | ARCH_CAPS_FB_CLEAR | ARCH_CAPS_RRSBA |
> +             ARCH_CAPS_BHI_NO | ARCH_CAPS_PBRSB_NO);
>      }
>  }
>  


