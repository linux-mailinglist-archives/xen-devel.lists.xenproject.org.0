Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF3B6D0077
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 12:00:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516559.800866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1php4m-0005Yx-UH; Thu, 30 Mar 2023 10:00:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516559.800866; Thu, 30 Mar 2023 10:00:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1php4m-0005Wd-R1; Thu, 30 Mar 2023 10:00:12 +0000
Received: by outflank-mailman (input) for mailman id 516559;
 Thu, 30 Mar 2023 10:00:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKpO=7W=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1php4m-0005WU-2U
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 10:00:12 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20627.outbound.protection.outlook.com
 [2a01:111:f400:7d00::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a82dcb0c-cee1-11ed-85db-49a42c6b2330;
 Thu, 30 Mar 2023 12:00:10 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9317.eurprd04.prod.outlook.com (2603:10a6:102:2a4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Thu, 30 Mar
 2023 10:00:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Thu, 30 Mar 2023
 10:00:08 +0000
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
X-Inumbo-ID: a82dcb0c-cee1-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XaUm4iNMsDoYdKHa5tSEbyjCg57jsCOXGxvXLmu+oy8Vfm+KdK0OL9iorJ1jXi5y17rWtTtm0HGrc5rUhLqmneMpNEaNDA/kGS372NQJTcMszuMLfsml/eBzqmHwb7FvZz6EOv1BSI16uzX0tCk/Tybetq5QtcZMjanJp70XdZrr+kJHcpOLiR7QMvEe8ZaDHVxIG8+B95wMvbq/A6gUQHNcsP3xUlK70Pla06meO6oUvrdAmiO7KkJCZN/vcXg6m8RtH43YJygDVoczstGwaKix07p4AtdqEI/lEMRU6ioCb8RbyH8ObTdkfTLndUn3bI682dS9O6Vp+sW+HiM+8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OGoAZHpBjVu5hoX0d+UdzOvKvmPCmdbVBv+QUuz5cZI=;
 b=gGQggwru9qF6Dr5DfmhYsgtGfD5jgmMwo2z5gM94xlIPM8RrLIOIIN/6uD2h5p3NZGYKzjWl+0Obu6Cz8bdgZz6JnU2JxwywU/UQNtFDogXBjspZdBMvWpA81RwH2ortibfqwaiR+VKHkN5RTE6vdfYSUjjFIF5+2TtTCjfapH2Mqg9gMkmRceFY+8XHLyKdCzZ4hljdJW3/4NBp177bhyyGJwTyTGSKUx+/j/NIqKIFkMfsx2emNpuH/NcFKDH9K1jBv7jXD9N7Bj72A1WkhIRe0b9c0IwMiaWR355ELn0djJ4hM9dJaoxJRTNQbSLvso8Uff8u6McjEf8ckmK5gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGoAZHpBjVu5hoX0d+UdzOvKvmPCmdbVBv+QUuz5cZI=;
 b=M822m0kER1mzJhuZj8349ty+jyn8MEjYZXI19fFaZ94Inqc7RIQPMAFn0vehnrPf4g9Ou4salRcABJ3oYFhptH23xNWUv4Cfei1klYDZX9hBXuEKbyro5Z1OhaqD+YeDKBJWiS6QTA/KhsyQfeOSV/9Tb42OcUSy70JebhC0jZTG735er5oHUDITneHPMAD3cIcrGAICurtX9kMJ1k47Il+TwUxva35Kn4I1B3Q/Dk25D59ErLh1HEisaPxIkDZSvvX5Z9VLHc+BdHxgBe6v1DlXtTVnoAokoPIkTqIyV7tcgMtEUNmVkYh+6RDTPph+oSdk9YOpgTifRUiADrtBJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b111d60a-5f83-1ab0-3c10-84e9fb743011@suse.com>
Date: Thu, 30 Mar 2023 12:00:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 6/9] x86: Merge a domain's {cpuid,msr} policy objects
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230329205137.323253-1-andrew.cooper3@citrix.com>
 <20230329205137.323253-7-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230329205137.323253-7-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0201.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9317:EE_
X-MS-Office365-Filtering-Correlation-Id: de664d6d-937e-4951-7056-08db31058b54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	elThiPFXuQEC7JgwmI0iACNoC+tY1wDveobASTbJy5YdAIwjuzh8ulxt3O+skYAoqg5boWePVl6HtKvYaeuU1a1GnQ+u9jGdsDicjpVuc4lOGxFVsfVrm3QY9MY6V4rbiucWPxIR+T3+ESwRaQfqQbt7zKKLWeuIcycHy403mNO2nADl851uoRBzNxdQ3fHAYHRJfAUOgKyrzWd0fwCmo6e/5aa247fzdggVDmUAnvIcW4Ua/GxZXipx0pRCZbHpC194EH3/7vLWPIk1FSrJjaXB57cbeJZY6a41hQKKddWPtEXUerJYEgEjOetaGMgaGGj9TRcs37kdYaYG7nH1EABEbfG56CSvvPrqDUzMyzvomM2+ukI5jTK2QzkrCvWdaFms9U3tzCP6Vc425Ajycevtn0jxvFPVr/y6B7PAdHwHbo1z2Keanv5MQs5VpXRb3LhIkrgfV3x+j3vmNWGhxbyFXC/P0rafN+Z96aqDWczL++K5VvEBMaf3cFxt91l1+Li5P0ZD1+q/vDeQp2GReph3T9ybx457xR0jvM6I5tPQNr3zOieG95Crk3KIeu7hJnF87gylU0ZFmCq5MQfYKtDoIFv/XzLTc4zfLVjRwPPizmf9I/67gqqiKahFvyzr2ddw+vqHLHeNVDtnXIJ05w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(346002)(366004)(376002)(136003)(451199021)(26005)(8676002)(186003)(8936002)(66476007)(66946007)(316002)(6512007)(38100700002)(41300700001)(6506007)(4326008)(4744005)(54906003)(6916009)(5660300002)(53546011)(83380400001)(2616005)(478600001)(66556008)(6486002)(31696002)(86362001)(36756003)(2906002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXcybWdpRktmc0NGNmR1alBTTWlCNGJIV1ZodE9uVm8zb2NSekVEVEZEZ0VC?=
 =?utf-8?B?SGx2bUcrZ2JURWFSSDNYbW8vK2NUeW52OGxtYlg3a3lQOXEvR0RVVHE2ZllH?=
 =?utf-8?B?b2ovRXZVS2p5WkFTZ00wNityVk9vMGlEYVErc215VDVQMWJTejcxYW5iREtm?=
 =?utf-8?B?aTNhM0g4cXN3ZVVHNm9YNjR5NmhveGxtTTZkb0Ztdk5sN3U0cVliN1NPNWZE?=
 =?utf-8?B?ZnkvNWI3ckFQckRkWlZEdmIxNDl4aXpFMURzaGZiVGExaE8vaGc5VkdzUmI1?=
 =?utf-8?B?UXh6R3dkTUJ5ekpOZENLa3pUSnhEQmpKZ0ttK1BCdjcrY3dnZWtmUXAwanZs?=
 =?utf-8?B?cnVyVzhpTU9HWWFiRUR2RWNsc3RHWitwQnpyRExmQWs3MHBGUDY5bDJHdlRN?=
 =?utf-8?B?Vnpqa25TbEtaaWsvd2J0Z2RDRG11ZkFNc29RWjJaLy94bWpSY0h2emhWcUw0?=
 =?utf-8?B?ZWpTbjE0dzRCdk1waW8xZFlOZGU0VzVkYTBjeG9nQlVJcjByZDBncll3c0dk?=
 =?utf-8?B?aUhmZmZ3RVNxNE1YQjJmOGR4R2hrSEN5SzVqb084OW9acE51QVFvRUdTWkw1?=
 =?utf-8?B?WGlwTm9kcTRHODcxVHM3bGZXcTBXSnJmeUVzazZwQmdFWTU3WkNyL21sM1Nk?=
 =?utf-8?B?Qk04Y2xLMVg0VWI5SThjQWcvT0hzc0JBRVA3bjlRTHk1VTYzNTIrWDRzejFQ?=
 =?utf-8?B?MFRtYUJIakhkaE04eTVBcHF5K3QwWU5ZNXRXK2FZcStQK1dJcjRhajhRRSsy?=
 =?utf-8?B?c0hVU01HcjhBOTFVQk9nZjJ0dU1MQ3gwazRrcUt6bS9CVXRhUDFSa1JuTEFS?=
 =?utf-8?B?S0tuNHZlODFFS0RmT3Q4UkVGUzdQSkpVMDllSUJOWXNNeGRXVTAwUlZhaHZh?=
 =?utf-8?B?WDVhWldLVE53MWU3N0QwY3c4UHNkNWl3THhudWR1d2lpSUpLVFU3Z0VmS1lo?=
 =?utf-8?B?VjZobnBFcDlhMnNuVFgyejljVmRnVkRjZ3g2UjNqdk9PKzJQUEhXNTdabVpC?=
 =?utf-8?B?WHFnazd4dXFYRDJDakNVUzU3WDVvLzNDazRDM0FrMy9WZGdUT2RhK093Q0J2?=
 =?utf-8?B?dDhKK2krcXh4ODFxT0pwQy82M2h0UzFxY20xMVFPd1FnWVlxbFAvdWtVL3dV?=
 =?utf-8?B?UTJjcERuMWVnMkxBN2o3dW5pWmJTY3pPN0FpK0FiMGw4OUtIWHRTemZmTHdU?=
 =?utf-8?B?cU0ycHBlVVB0WkswL0FQK01MQnBWdlh1eUJGNmFGOXJxTmJkM3NwZjEvRzly?=
 =?utf-8?B?bVROS044clZjdlJ0MFl0YlJlR2dzcHFHQ2RPeXQxSmhkRHlFeGNGeThNek9C?=
 =?utf-8?B?REY0UVpkNzQvSzErUG5mWU9wbU4wWXljWjNOK1RXNWNVYy9sVmlydVJ3YzNH?=
 =?utf-8?B?eldmRng5aHYzcGgvb3IvSkdtdjd5amFmb3JwZnBWcm8zbnFWdkxoUVRzZTZL?=
 =?utf-8?B?bno2REFFSjZmNXlpbUxlU3ExYnFiSW5OdW9vQk1XYi9tYklKeWJ1TzVQK3kw?=
 =?utf-8?B?b1NjNjBVT3ZEdERycDIzRUJFR01YQmE0eWhkWng0bVAyL0plNVV1VUd6TTQv?=
 =?utf-8?B?QzJOWmNNaTdDYTJYa3pTYVdhWE1VRkJHOHFWQW56aDlGdlI5Z29IcEJ3bzhv?=
 =?utf-8?B?ekxsSEQ0YUhXeW1WdmRMZk9EeDFEbXNqOWo2R1gyaTFScW5MK0xsbE53VkFp?=
 =?utf-8?B?R2ZQMkRIVE5NRmpFZExrVTU3M0IxakNhWU1hTW5qK2t1T2E2djRBOWNJM0lz?=
 =?utf-8?B?UERLNUtxRGtnczB6TUlwMXJRUUQ1ZkhSaVRxTnJwb0h4b0d6TjVTQ2NvczFB?=
 =?utf-8?B?YmRlTHk4MmZFL3VnYVlrS1dpOHNSYS9KOTl1and2b0toUGlNZ2pQTlNNajZM?=
 =?utf-8?B?UEhKN2VOdS93MVdtRk51N25yOWliSEVjWnljK25nNG15Nm55Y0g4aVZ5K3NJ?=
 =?utf-8?B?NFQxV0NtMlVLOWJ6akEycy9XWEgza2VXV2Vta0Z3WmZXaWV6YVFZRkh1NGZz?=
 =?utf-8?B?RnZDRzEzcm5LV0tNbHEzMVVnODZjQjloM0d2aFNmdmo3cnpYcmVxdVZ1Wmg4?=
 =?utf-8?B?OW1nTW9mdWU0bHlacE9EOXd6RUJOR3QyeGx0Q2h1SThyc0FmSHFXZk9PSEtG?=
 =?utf-8?Q?f6aS+R04SZPhvcgiOaq9sGrR9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de664d6d-937e-4951-7056-08db31058b54
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 10:00:08.6889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 34jZkLPG3h6UGZ1xRUs1fOlMW/wwERbQOee7I4wF7I8WGWhm7N5gpVwdtR4vnyHEw9OBGCEB2RnbkygJBDeM5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9317

On 29.03.2023 22:51, Andrew Cooper wrote:
> @@ -573,7 +574,6 @@ int arch_vcpu_create(struct vcpu *v)
>          /* Idle domain */
>          v->arch.cr3 = __pa(idle_pg_table);
>          rc = 0;
> -        v->arch.msrs = ZERO_BLOCK_PTR; /* Catch stray misuses */
>      }

Is this intentional? It's a vCPU pointer here, not a domain one.

> --- a/xen/arch/x86/domctl.c
> +++ b/xen/arch/x86/domctl.c
> @@ -40,11 +40,11 @@
>  static int update_domain_cpu_policy(struct domain *d,
>                                      xen_domctl_cpu_policy_t *xdpc)
>  {
> -    struct old_cpu_policy new = {};
> +    struct cpu_policy *new;
>      struct cpu_policy *sys = is_pv_domain(d)
>          ? (IS_ENABLED(CONFIG_PV)  ?  &pv_max_cpu_policy : NULL)
>          : (IS_ENABLED(CONFIG_HVM) ? &hvm_max_cpu_policy : NULL);
> -    struct old_cpu_policy old_sys = { sys, sys };
> +    struct old_cpu_policy old_sys = { sys, sys }, old_new;

Interesting name, but as long as it's transitional only, that's of course
fine.

Jan

