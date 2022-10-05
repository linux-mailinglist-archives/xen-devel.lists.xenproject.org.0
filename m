Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 044DC5F4FFC
	for <lists+xen-devel@lfdr.de>; Wed,  5 Oct 2022 09:00:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415841.660510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofyNV-0007ZT-K8; Wed, 05 Oct 2022 06:59:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415841.660510; Wed, 05 Oct 2022 06:59:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofyNV-0007W2-HA; Wed, 05 Oct 2022 06:59:37 +0000
Received: by outflank-mailman (input) for mailman id 415841;
 Wed, 05 Oct 2022 06:59:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L813=2G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ofyNU-0007Vw-OZ
 for xen-devel@lists.xenproject.org; Wed, 05 Oct 2022 06:59:36 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80079.outbound.protection.outlook.com [40.107.8.79])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4520cf7b-447b-11ed-964a-05401a9f4f97;
 Wed, 05 Oct 2022 08:59:35 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7310.eurprd04.prod.outlook.com (2603:10a6:800:1a2::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.32; Wed, 5 Oct
 2022 06:59:32 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.031; Wed, 5 Oct 2022
 06:59:32 +0000
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
X-Inumbo-ID: 4520cf7b-447b-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LraRoAvs/dQDK9qQIgiEgE1F72ZIQ/hWLhUKM0GZCNyyFPOkExoMV/ectFvNyCzfqFMEhLtUNXk3vik4G3hXVMspKJ6QLaiD+dG5sxhucmI012r18IbxWZKsh0gZqMVcBgfMyaUmKXIGNUX2cXjEg3HBakY7fONm+2lTB6tqqrrWEGDkkFPklJvzCuKARLXhXCrx/8LgkY0Q5W5sxv05H1pF8KHpBcKIP1ysB/+/BJ6vDrXPzj81oUtDRwLtYpGhrxS1c0pxYFR1vkG8bGZoeBXWJ56XZ+JRMf3y4u/JhkxBuGqdSc6rstjTziEwKQtAKq6+lFDuqqMdjOEMAd5OMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+lWY4fn9XkISJ5SD1K0i8GPSX23z5iFJTd7AaHj66C0=;
 b=DEkyZIPOqF4VVKEX8Ib6zCAmLi7UD+/dgokOxwZx0EYMr6bR4s2AcurdSTijakItEknthrTnDGw3KXoHIYD0NmN2PIdgIBRHaVO2JgsAa25WII47Ms+dmTor7a1jNRlW8lp5PZmpaj2XnwdlwKaaT7Fvw0mlbR2kN5is30UjzAW9LIEbZkF3FyrS1Ib0mlA4sBdKBEz5QFSwaQYSiEQeue2RyIY9Nj1tVXtq8Yst55tcrCg3sOV8rkBOA18G63/qnLP2X8LGXm0bCFQA5/eVaUeMigtsG8ZWORs/+5Wp6RVnDSKEsRRHrBuYQebxGKPBDczeNe+Uydi6O+El9wEb/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+lWY4fn9XkISJ5SD1K0i8GPSX23z5iFJTd7AaHj66C0=;
 b=y87DshhmZfjHtDryJSy/oyEoXr5EcOtM5eoF02FJ7DlQiY52I7MBaRjDeDp19pWRlctTDuG/X5vFmwl9vGHutLXCSmp8aC+m1b28b0WtdX7RqTc8VgxWz9bAY4LtYT+BvX39XTx8ln4nG8aBZk8AScxqo3VzIUfeTnIwsdb+ttKEkFdbfZXHa8NeK4CUvwQmUu/Yy0kwH7FnTZlnmHsz8jUC1qwHiZ+GsrGOT5PsNmsepm5ZLZUcSaKs+G7CYNks0UbuSaZ0d4Xqn7e34MAmSPeEm7Qi01cGOoAEzH+xhYPV6DegfSAKmkDoGq4mCcGOjMBvmzdAn0FesiAahEZk8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <50324b35-5b75-18b6-6ee7-fbe9b5f5d662@suse.com>
Date: Wed, 5 Oct 2022 08:59:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 1/2] x86/cpuid: Infrastructure to support pseudo feature
 identifiers
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Henry Wang <Henry.Wang@arm.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Demi Marie Obenour <demi@invisiblethingslab.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20221004160810.25364-1-andrew.cooper3@citrix.com>
 <20221004160810.25364-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221004160810.25364-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0064.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::34) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7310:EE_
X-MS-Office365-Filtering-Correlation-Id: 0daee8d3-3831-43e6-6475-08daa69f27ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BpKBxxcb0vmGvKxgGpRqPMdLwrd2/mwNQoYsX2pPUyp9O7G0SNwoLzTFf9rdJ044x83xjZ1PYVZswWF0XOkcLmJDoLPdu7fkDPkWPaVITZ3KBU8RgxI+1gMwHO608lQwvfuWtltHKXlDMYxHntrdBsDhW1ofrj7jsbv7nFPNua2wxLsNufJT+Zvh24h0OZGOlZG+BuvyP+3X8/1bbCmEE1CVXXvuTVplZczAIRI/BsBThUyilDCK8SsuX/rH884s8sCILn9742rPqhh4JmoLxmWu2Ty7JVCz+Q6W7CMhtQCjjS0iBwKhlW5gP7+vGZJfAm/am6eScVkxHaMki03inF4akhPCXt1184HYJwrTeOvsQyyNk1zNSMjVf8bHcl97znxUWo05KxoZgH3jB+8YFI5JPiPBUle2jgarz8wAv1KbtHtidZkNkixPilS7+715VExdxynkqzk9WWPqRdYP5WZaMH1URyFX55yMb6lQbqq87yokIdnVhjckS4/Lqa8bWb7QMnufmgaOZPm65pJ8TmpZKVuFyEBeeceGb5Gk7QeC88WWY0+oQrhCz4j4Dz53Oy6yD1J0i3LOvXXeBdkENhmi0AxLGFI/5iC8GDC+CpkvZjiU0+hbyxAH+hCH6hzELZ9X++mBr9b8VNMQNpVuuWZ/qu4aJQb2aolZAkD3GFxllxndiJJs0OAvcbfK0aObGmhZqZzbhxDEeXfNNCcHP8LyGJjD+FWUnpxVMpsuhdTY4kqDikNDSXJg+KUhSO7fCqAphz0zhQn+QYNjyqETNDXdYoOJmH0jmLjWKlSTshQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(346002)(136003)(366004)(396003)(39850400004)(451199015)(8676002)(41300700001)(54906003)(6916009)(6486002)(478600001)(36756003)(66946007)(66556008)(66476007)(4326008)(8936002)(316002)(5660300002)(38100700002)(6512007)(31696002)(26005)(2616005)(6666004)(53546011)(86362001)(6506007)(83380400001)(186003)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RC9TUGFlNTl5YU1KNy9td0pEY2dvLzd1bzdtSEVydXFUM1ZOTmFKV2NOeUUr?=
 =?utf-8?B?Vi9pYnJFdTg1ZmxpZjVsekswOGREV2RhRHd6Z1lhd3BadlJyMXdkWDdWV042?=
 =?utf-8?B?clhSdk12ZDM4cnc2TXhzV2ZEZjlIL2VycEVaZ2RxVGVNWTlCYWtzR05Xb0F4?=
 =?utf-8?B?Y3U1dVQxdUlMQmlVeWxjOGNDOENueTI0U1dsRm9IU0g3a0pLcVVEaFlRZ2Z5?=
 =?utf-8?B?NlAvMTA5Z0l0T3NLYUZYTG5rQUFiT1ErOTg1UFFqNDJDc3dYMzJzY2U2YVdF?=
 =?utf-8?B?SDg5aml1Z08rSWdJOXdZYVk5UmNISFBSMmg5aDFPdTNPaGxoYTZya20yUzla?=
 =?utf-8?B?K1duUzdQZzBoNG1lTWdnY2NYVzVSRitnNVRqUjNHbUNZM1Q5VWpLVGNMN0JB?=
 =?utf-8?B?R3ZOYmpaNEVVMXlMSjFBQzFNbU9HMDVaL1ZQNWZDbmFtY2laTlFNd0RMOHYy?=
 =?utf-8?B?ZUgyZlNYcGxYK3AxMlFiaXNwc2NHSFpSSTVId25jKzRySEZaOUNkbXdWRVFM?=
 =?utf-8?B?VkpEMXJ5YVZqbE5JS1FiU1NIM0dMSlh1TW9uRUVPVmhFRUhUQy8vVzJlb3ZC?=
 =?utf-8?B?VHNzZTFXLytRek1FdTV1V2tVVFlQYkZMc20xc3JzUWhOVWdZM3BCVGpVQUhK?=
 =?utf-8?B?cWhtRWpxdHltUkVNdjM2K2lWQ3B2aHA2aGlEK1NyNnRTemVCZXBsN1pmUUJG?=
 =?utf-8?B?bWhnOTNwRE1CcmJLcUpYWnBZbnNidDBuUUYyZE5lZCtJbDdPU1FGV3UxT0h1?=
 =?utf-8?B?OVVZamhrM0U3d2ZCcm1lbk5rZG5wbTJwSVpEMzlEcDNlUmZjNTJDR2xzazY1?=
 =?utf-8?B?MHkzMGxuaFdCK0J3NnFabEhRWWRvd3RrQ1VjNXh4cm5tZmZDNWtPVENuSzRa?=
 =?utf-8?B?Z29OQU9pQ2dONzREY0xHdUxnNzErV0RlUDloRXFKMXltV1ZlRzJPSXc4SXAw?=
 =?utf-8?B?MHFDbFpsdkNYdHluZXNBajBBT2VZdnlSTytaNXpNVGpRcGJFanVFckg0bnpa?=
 =?utf-8?B?ZFo4N0dBSzdlbFVaS2Eva1htamhYV0V2UUR0RVNKUzBrd21ZWWsvZWIrZEVm?=
 =?utf-8?B?UEVUYnVXNlpqZHpzeDlDRVNzam9tTTlKSlFiVnkrRVYrUFNFUStaWncxM3I0?=
 =?utf-8?B?dWxMQ2d2c0Vla2puaXpzNldYWFZ0anc3dGZPbU42N1REVzczZy91MkxCTktm?=
 =?utf-8?B?NzJyQXdLK2psVXFUTEhNTFVpTmQ0TDQzLzRhMlhVbHBxaXdVdWxibVVtSVha?=
 =?utf-8?B?THV0QWRGVURPOEFadnZQWjB1enFveXJZV3VJZGd3djVGaXRSREVJcTVBdngz?=
 =?utf-8?B?QjlRMTNhM1l5OXB1OUNnS21QVU5pbmh1ZlpYcWlRMWhOWUF5SkpFQmY1NzBU?=
 =?utf-8?B?QmxzU3UyNWdMemEraE9sRXVDZkoyb3pZYjZtMXV4RlY1NGFnVE9CQm9GWUZX?=
 =?utf-8?B?dXIvejBEbE5JNGdUR01vRUt5SlkrOU5zZVEvQ3NHNWJseGt2UTdWdFo1WVlX?=
 =?utf-8?B?N0lEdWovaUthelRmcUlUaGJ3bzdRR3FpbURnMmJoNDN3STcxczZnb3oxalBk?=
 =?utf-8?B?eWpwWnNrOHlTU09xV1pWQXZsZFdPdHRxdVJwTDA2QU4rTWpJVVJvYjdDTnM4?=
 =?utf-8?B?Wlc5cFZxVXREaGtBQ2Y1UkN2c2tqOUw3VVRmcHJxVE5wRVJzQTMwTWR4L0J6?=
 =?utf-8?B?aURBVisrVXlsN2UvVW1BTCthZWo1dnZLUFNWNm9Bdnl2akE4cC81TGJzMTRl?=
 =?utf-8?B?OVVXWHNWY3ZJWWw2b1h5UEM5djduaitlWDN5WWhxU1o0SnpGamlldjE1c241?=
 =?utf-8?B?bm1GQlhYdTBjb1FqK0N6MTF6c3psQlg0OWlNQ29ybTcwenZxK0lEWjVLajRS?=
 =?utf-8?B?WlZ1YjFQTVRHZGpHNGlXd0QvZVZkcnd0M0dEZUlGTjRlblpwakdVbU1IZU5h?=
 =?utf-8?B?alRLZXl4TitTNGhVYlU5QlV1d2FMVlFtOS9vYnBIT0hPVE9MSUNiT3VsRzh2?=
 =?utf-8?B?bG1NK1V5Tm4rUTM2bGdNeVJTZU9ZWE9CZHJqYnh0NDU3SmEyUEFXZ1crcC9o?=
 =?utf-8?B?blYzN0UwSCt6T3RpNVdtcE1sYnY4Rkk3ejF3b09hNWZnNXVGZ0o4a0pFbElX?=
 =?utf-8?Q?bhDPGJ73GUlgPT6IU4rkSWEhG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0daee8d3-3831-43e6-6475-08daa69f27ac
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2022 06:59:32.3060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qf7UR986bX7yL6JwkdMyzRAQX9hBIAPDy1dmvYYr6f2TQEp8GJ/CyuVs+oF0OGnIZjbTPHARgeUbWK+of+7bHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7310

On 04.10.2022 18:08, Andrew Cooper wrote:
> A future change will want a cpuid-like identifier which doesn't have a mapping
> to a feature bit.
> 
>  * Pass the feature name into the parse callback.
>  * Exclude a feature value of ~0u from falling into the general set/clear bit
>    paths.
>  * In gen-cpuid.py, insert a placeholder to collect all the pseudo feature
>    names.

Hmm, I was envisioning this to be fitted into the existing model in a
less adhoc way: (parts of) MSRs holding feature bits aren't very different
from individual (pairs of) registers of CPUID output (in the case of
ARCH_CAPS there would be a perhaps just abstract mask limiting things to
the subset of bits which actually act as feature indicators). Hence I'd
have expected them to gain proper entries in the public interface
(cpufeatureset.h) and then be represented / processed the same way in
featuresets and policies. All that would be left out at this point would
be the exposing of the bit to guests (in patch 2, assuming the split into
two patches is then actually still warranted), integration into
guest_rdmsr(), and at least some of the tool stack side (xen-cpuid, for
example, could easily learn of such right away).

However, since I'm pretty sure you've considered such an approach, I guess
I might be overlooking some caveat?

> --- a/xen/tools/gen-cpuid.py
> +++ b/xen/tools/gen-cpuid.py
> @@ -297,6 +297,19 @@ def crunch_numbers(state):
>          RTM: [TSXLDTRK],
>      }
>  
> +    #
> +    # Pseudo feature names.  These don't map to a feature bit, but are
> +    # inserted into the values dictionary so they can be parsed and handled
> +    # specially
> +    #
> +    pseduo_names = (
> +    )
> +
> +    for n in pseduo_names:
> +        if n in state.values:
> +            raise Fail("Pseduo feature name %s aliases real feature" % (n, ))
> +        state.values[n] = 0xffffffff

Throughout this hunk: s/pseduo/pseudo/g.

Jan

