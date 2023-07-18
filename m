Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C7F757DA6
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 15:31:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565259.883258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLkno-0000iu-1i; Tue, 18 Jul 2023 13:31:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565259.883258; Tue, 18 Jul 2023 13:31:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLknn-0000fv-Uk; Tue, 18 Jul 2023 13:31:43 +0000
Received: by outflank-mailman (input) for mailman id 565259;
 Tue, 18 Jul 2023 13:31:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g6ux=DE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qLknm-0008Vz-T4
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 13:31:42 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0626.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e2b96a8-256f-11ee-b23a-6b7b168915f2;
 Tue, 18 Jul 2023 15:31:42 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAWPR04MB9960.eurprd04.prod.outlook.com (2603:10a6:102:38b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Tue, 18 Jul
 2023 13:31:39 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 13:31:39 +0000
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
X-Inumbo-ID: 6e2b96a8-256f-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h9z+AmZA1GryZeM4tmY4lNkPS2BMDWWVgWipP4xM4+biQ6g7yHyQJsRThLcFL+8Ob6HlUE6C2FRQjmOEXtvQplBLA2A3nH0tOteOKJq98ZmiDa36DS6fH9wTer4payap+2Fn3ezkqa9AU7C8RiJeUOmvI+tMb57vUV6MopcXr0b6U7xt5jUKsGUfu+lgUuZScC1n69st8BhB1PUAqrtjcYsoMDkJue+7Xn9Eu5tAggPqOpv2O+Y1eH903byh9qLm8vSuPfYKKmKpxDFzYLDp32h0eTgrgYjkodGyTvb/Iw6TxSuJbDIgVJFTD9StTaHUglxu+Y0DTgDtV9cx7velNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Umhn/UNfEyDPEfccZQ+7Y17IMf8ChaDDd4GeUL7WtlE=;
 b=HR1IsWJPnhNHM/W5N/qCUeq8kv4on+kf/o1duralXcW7lY7ZYEA5OWHxWmZOzlK8F31z8dU1109NOrJAbJ2e3O8yT9b/yJa5yXSD1s0XLGUj/Jm9LgFnDBDkU6VgX3yn8o/MJLmLw9bWDYJIi6SWqpdm598aq10g4LUDm+LyTLM1vzdUoZqP7cdTkv8bKTpWFrkX4gZePmn0PApE+AITOqaiA5bJApu8+nN6CSDzqizsClq9eGf4wv6yLOrsUuPBNzdc/CdZnqkYX1MhHhu/A3HOGOh2oSwbn2vf6MpDXxu98fQD1ozranZtaA3Hrfm4Cy0WhqxyG/FTmnv/zCSoEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Umhn/UNfEyDPEfccZQ+7Y17IMf8ChaDDd4GeUL7WtlE=;
 b=ahUAwJN5Om/a8L7kxuf6MLQd3o9psTEhMdTgoVlnT68GtCPx/vmS4mlaeu3c9gPYV+Zoo2t8e35jSiO+08v4+BPNckOBAbp9y5+eHyMpFPlSEAEtsZX2QsbSjoBJZYOPgVfpqwgO/kNYYXIcjETtjmpIrUFW+i2/Xbpb45Da+W+TYfvPikN7jO69y6qDj7D91cwSPHwj+vx9GkRDcqq6+4KXwyzatNWheSUMBsdiwv3gox7c2DKm6zfU2LY2vDXSAz3oQ7fVxIqVJeeJeYdOG+Gw3vYIVUN+7hbeF7SP0uvyE1vTrR2phuxQklU81vJ7NKRW7f0khd1KtnZ+zVteiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d512a592-24e7-2eca-16ce-7451dc110f64@suse.com>
Date: Tue, 18 Jul 2023 15:31:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH] x86/msr: Allow hardware domain to read package
 C-state residency counters
Content-Language: en-US
To: Simon Gaiser <simon@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <946e5494801866c93332cc5d9ec0fa03a4df00d7.1689686046.git.simon@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <946e5494801866c93332cc5d9ec0fa03a4df00d7.1689686046.git.simon@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0136.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAWPR04MB9960:EE_
X-MS-Office365-Filtering-Correlation-Id: edbdca5d-e91f-4959-7dcb-08db879350dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	urJq08b1APu3Xa4iImEY1H2pZ1AuMZBnvcVe6+XIY+fjQSPQlsV7AwolEYg/OripcArjcUwyt3fv+nfbdztG/O8oeLbxcbyrbK80YYbtJfsJmVZabkmXcmDSSQvwsfQ5CL4DvqMic3Cfm76NHXd8nBRyEOLC6nG9wkqRS6blyOgycCKowsye/2WNS534ul9YsfS4gaB03bVGaKaFOaKMlLfPPFT16aoFR2flYm2N4aV+9uVtlEe9WaeQgMB6hojQ2WqhBru8rFgUWu0gi6qcd+iKtULVICCiv7e3FUFgn5P8akE4Lh8Xc29leR0ikOCzaBq+5lbFYj+cw7JK2ioPvNEa7k5Y7+nO/BLB5a3cSBygs/ccU0eAmdQXJ4jicpopDJPgeVlse79aSoTl6Ut4hwofZ7gnG5yjtztI75tnYNoxmvssHOpNzBv0nobzYdzbFCUhH+/L8NDmWIJ3sKQtus18vfdjPUdfKveP1QSDcF2vv/2BrBz5fKUeK5YmocLS6s6FR268c/2AZgxM77N6VEVaYnXd+ypdd9jcIKaNGUGXzmcCFIyMGvzd0wj+sD45T1SaKm3ujIidGMiK23MKBa2hZpOxW9JxgmsKxNOov2uR6ofi5awDM8NkGynq1OnbLhk4B+0+nS9tqjv91ggt7Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(39860400002)(136003)(346002)(396003)(451199021)(31686004)(31696002)(86362001)(36756003)(4744005)(2906002)(2616005)(186003)(6512007)(6506007)(26005)(53546011)(38100700002)(6486002)(54906003)(66556008)(478600001)(316002)(66946007)(66476007)(5660300002)(4326008)(6916009)(41300700001)(8936002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1RFWE1pQWRvT2xzdVIwUkh6R0dqcHdSNmMxZEJtRjBmZHRucGJLbzRXclNs?=
 =?utf-8?B?Mk1XM0l2cFp2eWNWZys0RUhIQ2ExZHd4bk9hNjJTNGFNY0ZiM2N4UlB1dTN5?=
 =?utf-8?B?eGtML2hhcWVsVnUvTFVjSVRNUXFnMW8xV3dKR3hoZjRoaGtBMkJRcUlNeXRT?=
 =?utf-8?B?MUduYW5EeXlpaDZaOGNQWDNvOE52V0QzdWVDRjRvQkVYNzdBKzZYRkJtZlUr?=
 =?utf-8?B?RUVqOXBMZGptblJsQ3JJdnEvUmt6Y1NiNWdlcERGeU5vSklxbzZBcTlOT3N1?=
 =?utf-8?B?VTcwSzQ5RHdMdDV0ZUkrMlR6UXR2aHlLNjgraVg4dUNBc3ZwclpzbnBTNXUy?=
 =?utf-8?B?b2dScUM4N1BQaGgzOXhob2tBWi9xV08ydmxQcVp5djd4SDh2OTR0WHdzcjdI?=
 =?utf-8?B?LzNKTUYxOGJuNUJxV0d0VVVXdElXNTMxRmZ0WWFuaVFNWUR4SkJDK0szQWZq?=
 =?utf-8?B?N3g4SjdPSVFEQ0twa014emJvSHloMUc5K3FFdmY0RElKT3VQRUgwM3d3SDV4?=
 =?utf-8?B?cmZlc2VweGR0NTRzZk4zU25zVFE3REF2QmQ0bE43WldvV2oyTjQ1SFl3VFk3?=
 =?utf-8?B?RmM2T0s2UFJUS1AyZzNkNDhXaFRQM2RnY3FTNnZkclB6OFhXQnFjWWFIRmZu?=
 =?utf-8?B?akpiRm9YU09sSE1YdTZYNGhkZHZuUTZkY3RHbC95c2g5TGc0MVErNExrVDFM?=
 =?utf-8?B?SW1hckwxMHZFNGxHQWhSZFdBSlQwdThHMWZDSjRySnRXcHdVTlVveFhLTnFQ?=
 =?utf-8?B?TElqbGtYM25KOTBRQWlyZmdpc3MrM3hwYzRNWmpSenFYMEpZK1F4bGovbXpB?=
 =?utf-8?B?dGZMelJicU1wbXowd3VSd3FJaXJtYitoSmFIQUhjUWRhZ0F6V09zUW9yK1hy?=
 =?utf-8?B?RXovazI0QkZmTnhQZHVRS2kvRmZFa1UzZHFsRlk4dmxDSXVkYWxHL1hqTG9E?=
 =?utf-8?B?WjdEaG9mbzBNWjVYcFdod3oxSDdDN3RXTkpjblY2aldCK1dReGNIY0tObWRU?=
 =?utf-8?B?TXhPNUF2Qi9FZkYyME9URld3dGwvK2k4a0d3dUxURDFhNktkM2YzcHc0bVdM?=
 =?utf-8?B?cWdsRFhlNmw2Ym1wK2hZSzhrbTU1TlVMTmUzQkh1bkpvUlVsSEJxQ0RRTjIx?=
 =?utf-8?B?SmF3RWFoNThxS0xVcEdXZTV3bUVCakVzWFNFaEFiYktZWVcyRy9iK0ppVHBm?=
 =?utf-8?B?REM4OXlZRXRmaFZ1MVZPVEhpUjJvOVFQZUY1QmxsVkpnWjljWk1STGwzMjNU?=
 =?utf-8?B?V0x1VllQZWJDaWhKUzBJM1ZseXh2NUY0RnJLdFN1UjVYcXJvWU5uRlBpZlRs?=
 =?utf-8?B?QWExOG5oamdNYVQ0WVFGT3J5Uy9zTmN1ek1lamllYlVsQjJLWEdNTUVaYXVt?=
 =?utf-8?B?WUlDVlVuWis1RSs0RU5wOU5ORWRrQVJ3V1ptSWlURHE0eWdUdllXcDR1eC9y?=
 =?utf-8?B?NExiR1l2UmMzVjB4bHk4MWZCQ2g3WENJR1VKZE8rc2ZLRDJ2QXV6TTRyYm1z?=
 =?utf-8?B?dEltQ3VodEI2czZWekhXZDNwdkl5SG9kNFBWL1JIT0orYWZTZll2ZTMxWkRD?=
 =?utf-8?B?REZPN3BOMnBRbnQ4YWdrbkxaT2FaMWlwc1NFL3g4K3NYcWs0MUxxcHEyUUF0?=
 =?utf-8?B?dHRGMFR5R2xFVnJNOUJjMDRzcW56UDVic0MraGZ2ZGMwNVQzZytoQXVobnlk?=
 =?utf-8?B?VFZabU54dG9GeG1mOWN6TFU2b3kxTC9hYWNzY2xablllZFYvK3JaUnlDWTJP?=
 =?utf-8?B?QlMvNXFiUTVlTlVMM2xlb2NyeXNVVXRzSUNGU2ZGeXkvWEVCQTlLbWFBQjI3?=
 =?utf-8?B?MVB5QzA1UVNLeW9nWGgxbWxOVGQrMGJwcjlxVTVlREp3RGY4dDExYXpqaENE?=
 =?utf-8?B?OXcyaVlzZEl2ZzE3ZGpndVRLekJrTURDRFA3bUtnYS8veng0eTdKZXhDOWJQ?=
 =?utf-8?B?blJaM29KN0hibVU5d0RmbU1kSFFSclFCcVZLREtDZW9yRm1Vb3pHelBjZU1t?=
 =?utf-8?B?SW9SNFIxdzE1RjZycWduQ3VDM2pqUE5Ld0NXYWJqKzN2UFlzMzhiUXhZUVZj?=
 =?utf-8?B?cVY0cTNYVmJ4ZzBoeGZQWE8xd3d5ZDBISTlRMXN6ZGhxa1UvVHdKbDlySTk5?=
 =?utf-8?Q?Pp5+tgouMbSS083ISTbehEzyF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edbdca5d-e91f-4959-7dcb-08db879350dd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 13:31:39.1125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qr2kBlUn014PC44/MZZH7kUBNLpNPO3HVnsrkeUZbt6SR7e/JBi0Pup/bgKQiq5poXWG6r6h9Et0l2wgY/dV6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9960

On 18.07.2023 15:17, Simon Gaiser wrote:
> --- a/xen/arch/x86/pv/emul-priv-op.c
> +++ b/xen/arch/x86/pv/emul-priv-op.c
> @@ -965,6 +965,20 @@ static int cf_check read_msr(
>          *val = 0;
>          return X86EMUL_OKAY;
>  
> +    case MSR_PKG_C2_RESIDENCY:
> +    case MSR_PKG_C3_RESIDENCY:
> +    case MSR_PKG_C6_RESIDENCY:
> +    case MSR_PKG_C7_RESIDENCY:
> +    case MSR_PKG_C8_RESIDENCY:
> +    case MSR_PKG_C9_RESIDENCY:
> +    case MSR_PKG_C10_RESIDENCY:
> +        if ( boot_cpu_data.x86_vendor != X86_VENDOR_INTEL )
> +            break;
> +        if ( is_hardware_domain(currd) )
> +            goto normal;
> +        *val = 0;
> +        return X86EMUL_OKAY;

In addition to what Andrew said: Why would we suddenly allow these
reads to succeed for DomU-s?

Jan

