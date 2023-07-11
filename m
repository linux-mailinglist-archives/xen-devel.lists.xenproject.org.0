Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E06074EBB5
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jul 2023 12:26:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561712.878226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJAYC-0006xg-3i; Tue, 11 Jul 2023 10:24:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561712.878226; Tue, 11 Jul 2023 10:24:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJAYC-0006uL-0k; Tue, 11 Jul 2023 10:24:56 +0000
Received: by outflank-mailman (input) for mailman id 561712;
 Tue, 11 Jul 2023 10:24:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B4LE=C5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qJAYA-0006uF-UG
 for xen-devel@lists.xenproject.org; Tue, 11 Jul 2023 10:24:55 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060a.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c719595-1fd5-11ee-b239-6b7b168915f2;
 Tue, 11 Jul 2023 12:24:53 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Tue, 11 Jul
 2023 10:24:51 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Tue, 11 Jul 2023
 10:24:51 +0000
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
X-Inumbo-ID: 2c719595-1fd5-11ee-b239-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mliOuvzK08WKWdEOPGDiRb62/WwOZX+dkY9fsrWRccQYE/eFXkUm3vYakd+EKExa2DrbJOnBZdmVjU2anfiDTVsoZpQjHCWvCqLvUD2iEE9vk26Yr2TajJoSl5DpfCkEmFN5eTgEFDc9Us1vgAZ/KOhzBQgPzH61K5LYPxOzSdY1p0GMTZ+qdJ8vSFjh1guA0Dv9l7pFixb/BPdW/vRQVJUh1yJQHy4WpPBLGYBdZXvaIptoaTQl1ibLz7JkP6NZ6jTTuK5ZhrsWNLTqq3VEvrTidxp2gcluXeRdN0v/v/ztkHwa7r6Lh69Y0y6dlfVt56JsUUoavNhFdGMr1uzEgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GSwtxfn4Df1/CjsGH7f5Pj53/pUlgvyEjgWxiLx7wFA=;
 b=O3OpMAK/+0XUc0MSMVeQLCWRwmYWmfuX0pJMe+2x/ILLowxJl6puemd7Nwfq4Hb8l9AHs7dVoTmaNGKnqYRkjeWBX03AWfyxQt5wq/G5i6bxNNYnpNjRYEyRE/A4toAV6axncimf4Me0Ht1fB7Pcn1BTSdqZRpJlrwBiW3fT/lqp5o+S6x6FdKqd3HN4VY9wqS+WYYeIiBSU8TtKBkS+aR6FLO1vUJPBtp20sB783X0rko5f/9fch0vS1w1YcRW4Oj/GODpp8JQs+F0dsIqbEi9Y6fSezxDcoHONpZ6F/83wa6VRqdWNFq6r6IT0oIn6LFuB/bTXKvN60aeidf9u5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GSwtxfn4Df1/CjsGH7f5Pj53/pUlgvyEjgWxiLx7wFA=;
 b=3gFubLym0oYX8TeialJxanSMso8YhdMt29GVRH5uqSAks1v7yUJUoTsXHE9sGT3Fjf4l1yUVcrGQIhX0qVma0BsYkoayqrKdfolRrDUFSdj9lS9XRJ5ugjlgHbnsS3vCB2C7FKOCd+ATnrcVPT0E1se6haH5+LPUcl76mQ2Iwf8HBTDK9dAetKwGH5h3XqvUBov8rPheCRDmWffFUW4faO4w70KoEUR/w1gM4HLJgIMseggWRFn31t/Aw0ziE/ju1xOkoZEyIktJeH7tVajtyXc5Wm57hEJbOxRSopNwOa9pYzh0Ckn50kkKKJmZwi2jky4uHo59TtW1H9K4FcUO8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e6ca0ef1-fb66-d923-388f-79cfc20d1626@suse.com>
Date: Tue, 11 Jul 2023 12:24:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH] pci: introduce per-domain PCI rwlock
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Paul Durrant <paul@xen.org>, Oleksandr Tyshchenko <olekstysh@gmail.com>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230711004537.888185-1-volodymyr_babchuk@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230711004537.888185-1-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0097.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::12) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AM7PR04MB7157:EE_
X-MS-Office365-Filtering-Correlation-Id: a380b239-0173-407f-c881-08db81f90f65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wPvpjqbSjEenGTqaqpx3kqbeMiM3EmJgKoxWfAy2da0qJi29BfRmNVZKcfI/qaQp8eSVUdhp2k+r+M9eRMOOVdoffUArpV0GzJrETwjf0jw83A3TLWR23Sey6+zr1DhfFPnvLSSRSDlqMLSJk/T3UKVGSV+nw6ce+kC3NygntkDnVjqvfoE6iFM5NFryngogXJMh/Kbne29DFEBegwYMr7x9dYnZacAVA73KBuQf5bz6g8oIBSwxb1JguN9StpwlZRakQEfqj5f6gPgVw9tTOEbBl1eQrEhCQdAqoX7Wb6EUfGhInIXV3Uh9Rs/cFQplI+NcnxeyRY7wLAwhJxF4nmYae3mPwa2P+7in8Hoc/OZG0xNIpK+IgLeHIjoIfxzleMkMEaNJy21Y2CHSUXMACm67EYZcRfbJek05t7nnUtve8DvyaqQRzltlqxe09g/KJLLUi/PEJV73BgatM9skxHzcccsa2b5ith1BWDZOnhT5EoMddnemDfdDZ1HGmn63neospO14FrKZZVpZ2poYckrBfxTqDN3OG9hjhLHWEW4nffZoo7uGYJ6qgqF2bbIV/4SXxxH+3JgJUcNojw6VF3PUq8N3Fvli6kUr4OO/M5nImuojkd9Ord2EGXqlPAonvOp4fy8p710LL1v0okOyZQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(136003)(396003)(366004)(39860400002)(451199021)(8676002)(8936002)(5660300002)(478600001)(41300700001)(6486002)(6512007)(316002)(4326008)(6916009)(53546011)(7416002)(186003)(6506007)(26005)(6666004)(54906003)(66946007)(66556008)(31686004)(66476007)(2906002)(2616005)(83380400001)(38100700002)(31696002)(86362001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3I0NGdCeXJpZm1JbFBYdkJkMTliVkI0eDI2VE5QVWdJQ3JIQVVFRjRFWWZw?=
 =?utf-8?B?ck56eWlTTHRBRWl3emFlb3hRYUwrY21hWXM5eDlXK1BYYkwwQUVVYzk2Tmsz?=
 =?utf-8?B?a2cwOXA0VzZRei9WdGQrdHhSYzNYTWpBdEhLcjQwWmxvQjhxWkFXT1haRWc3?=
 =?utf-8?B?ZkNrYlp6WTlRSmhVZGovcnU5azVHT1NwTVlyRnMvT1VEcWlmUTJ2WjhtMjBZ?=
 =?utf-8?B?aG9zZWUwMUY1bmxqSUoycy8vb1FRaEZMVGlyVHExRmRYRDJHbTVEYlJ5dXBv?=
 =?utf-8?B?V29Mc3V4Rng4QlBjNyt4cGlqSUZtQzIybk1KbWF6V05QckptMmxYR0hlalVp?=
 =?utf-8?B?WXYvcHo5a3pRdEwzcDZQcEtRWnFrb1dTTC9pa2NKb29hREdCUllMOUZhZzFL?=
 =?utf-8?B?Wkk2NjBTYjFUM1NpeVZha2Q1dzJUVFZKQk05MU5pd21peGpsczdrakJDSlFY?=
 =?utf-8?B?TnFFcDFLOFFGMmtoM0RpNEhnUnFrUmJJT1MzZEpCeGtqWGQyUysrdit3SW1a?=
 =?utf-8?B?VVFkNTI2SnEvU3d1cXQvS2k2eDJmamdTYmg3ZUlnZGtaS1lIRCt5YklzWFNu?=
 =?utf-8?B?R0VFLzZwVG9vVXhZV2RIZVJtOGo5SlFSbDh5Qms3cnJvM0JGOGRJM0gxQXVF?=
 =?utf-8?B?N3Vmc1N6dk13UnJoeGZVVXRRdklUSk1kZW4yN2pIWWF3eW9SNkFZeUQ2ZHhR?=
 =?utf-8?B?K1dNdlZpdE5nQjk1V1JnZ3RnZUYxaWZEQVNlWU0zRC9yRFE5YnJKL1pHOXU0?=
 =?utf-8?B?RE83QllrOVpnaElaTlFRNkFNL2lRcG1GWlZ2U0R5eCtLc2hBMFczOTN5M2NE?=
 =?utf-8?B?OVhZNW1sTXpMQ2xNVzdnb2hvTVVrYTBaQ2dPQVlWQzd0YUtCbW5OVysrTUp3?=
 =?utf-8?B?cnlRSkh2VlJjQklsNzFmbDBqSWpsLzhLRmVYaFZVajdXUDU1WFdQQVcwK2Rh?=
 =?utf-8?B?bm1zZ3A5Z2d1eTF1bHY3cE8xOUFvU0tZT2pON2J4MnloMFA3bDQ1cllWbXB0?=
 =?utf-8?B?dWt6M1lHdmtrZ1BVNUVHZnpuaGdjbG5YRk9qTFkvMTFNVVVSalNrUFliK1F2?=
 =?utf-8?B?czdyTGFFZWdRN1BYcHFKZXdlMlFFVUE0bm9pK2dRZks2MDl6cG03QXpwUEI2?=
 =?utf-8?B?K3Nra0w1eFVvSTJSaGQ0ekVmZkM1OEJmMll3bkt2clBPMmc4aVYxUzdzQWJX?=
 =?utf-8?B?UitUYlFUSnRhd0xXQXorcXNiNUZDYmF0c28zRnp5RGlNYTlIV3dlZGNvZFJD?=
 =?utf-8?B?OERlS2hiYzBXcjlNK0t5Vi9WdXVqc3NuL1RvbXpSdXpIYVZhUUpMNXArdVdI?=
 =?utf-8?B?eC9zOHFtZE11eGNrYjJ6NE1EY05FYjBnMGFNUnZaMk55b1hBdzgxcnorZzd5?=
 =?utf-8?B?NGREeitFSm8vb0E4MXpSTmtTZWRlWUNCYU1aQ0loWERsNVFEYkxFdTlVakVz?=
 =?utf-8?B?eDNsYjFXVGhrMVdsNS9oa1VDRVFkREhDSHZjemxJWWM1bUdxcmJVM0hwVTFk?=
 =?utf-8?B?S09RZ1NLKzNhbzdBV1BJYXQraW9rL2YwbTFoSGoxTkZLNUltdzhDSnE4UzFD?=
 =?utf-8?B?SkZlNytMSGxzQXcxUW5sQi9yakdZTDZKQmpyanl5NVRYT1VmS0xTLytodmVi?=
 =?utf-8?B?bUM4eVBrNHlodE1Hd2gzcjRSb1RkS1B4S0c5dEt1WmdiRVQ1SXlMUDkxRXUw?=
 =?utf-8?B?RytCT09QREpQTkUwbFpSR2FhZHdxVW9ta1Q2UldEckRRangvNkY1WVAxUFhF?=
 =?utf-8?B?RFlCVDh2eDRMOU9CZXFxRmFVemI0a2plYmRCdWpKS2JrbzdYbGRidHFMNGlv?=
 =?utf-8?B?c0JTVWUwdjM0L25QRWVVaGEyMXpNeFFYZEdrRXNWL0pveFpReGh2emp1NXo2?=
 =?utf-8?B?ZVoxVTFicnVLM2llZlNMSlJEOFVnV1lwTmNDQk1nWVczVTc2Wjc0cVdOY1Vs?=
 =?utf-8?B?dTMyc0ZsV0VTa3RseXZBV2F1TWdQTThSSnBCcG1LTnlYUkZoNURIejFNdUVT?=
 =?utf-8?B?UDVQNngwUm92MjNRcXVzZlNlK294TEM3SGQ1T0t1Rnh5bXNBZHFYaVlUTURE?=
 =?utf-8?B?aFRwTUR1alpMYlMreUR0N1IwOTJ3M2V2N2hwL0QyWXhKbDhOcmVLRVIvaHBL?=
 =?utf-8?Q?/RP8Z4jNgWd/De+8ZJIEQjkol?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a380b239-0173-407f-c881-08db81f90f65
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 10:24:50.9234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f3HF1exy2Ulqz2iTB7qzsZLdvzxAwaHCF8xif8/hLlGkrzMq6wtMNJnqYrugTj08awaVZ8fFrcgFrDPGdW4PTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7157

On 11.07.2023 02:46, Volodymyr Babchuk wrote:
> Add per-domain d->pci_lock that protects access to
> d->pdev_list. Purpose of this lock is to give guarantees to VPCI code
> that underlying pdev will not disappear under feet. Later it will also
> protect pdev->vpci structure and pdev access in modify_bars().
> 
> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> 
> ---
> 
> This patch should be part of VPCI series, but I am posting it as a
> sinle-patch RFC to discuss changes to x86 MM and IOMMU code.

To aid review / judgement extending the commit message would help, to
outline around which function invocations (and for what reason) the
lock now needs to be held. Furthermore lock nesting rules want writing
down (perhaps next to the declaration of the lock). Therefore comments
below are merely preliminary and likely incomplete.

> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -2381,12 +2381,14 @@ int hvm_set_cr0(unsigned long value, bool may_defer)
>          }
>      }
>  
> +    read_lock(&d->pci_lock);
>      if ( ((value ^ old_value) & X86_CR0_CD) &&
>           is_iommu_enabled(d) && hvm_funcs.handle_cd &&
>           (!rangeset_is_empty(d->iomem_caps) ||
>            !rangeset_is_empty(d->arch.ioport_caps) ||
>            has_arch_pdevs(d)) )
>          alternative_vcall(hvm_funcs.handle_cd, v, value);
> +    read_unlock(&d->pci_lock);

handle_cd() is non-trivial - did you you audit it for safety of
holding a lock around it?

> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -858,12 +858,15 @@ get_page_from_l1e(
>          return 0;
>      }
>  
> +    read_lock(&l1e_owner->pci_lock);
>      if ( unlikely(l1f & l1_disallow_mask(l1e_owner)) )
>      {
>          gdprintk(XENLOG_WARNING, "Bad L1 flags %x\n",
>                   l1f & l1_disallow_mask(l1e_owner));
> +        read_unlock(&l1e_owner->pci_lock);

In cases like this one I think you want to avoid holding the lock
across the printk(). This can easily be arranged for by latching
l1_disallow_mask()'s return value into a new local variable.

> --- a/xen/arch/x86/mm/p2m-pod.c
> +++ b/xen/arch/x86/mm/p2m-pod.c
> @@ -349,10 +349,12 @@ p2m_pod_set_mem_target(struct domain *d, unsigned long target)
>  
>      ASSERT( pod_target >= p2m->pod.count );
>  
> +    read_lock(&d->pci_lock);
>      if ( has_arch_pdevs(d) || cache_flush_permitted(d) )
>          ret = -ENOTEMPTY;
>      else
>          ret = p2m_pod_set_cache_target(p2m, pod_target, 1/*preemptible*/);
> +    read_unlock(&d->pci_lock);

Hmm, is it necessary to hold the lock across the function call?

> --- a/xen/arch/x86/mm/paging.c
> +++ b/xen/arch/x86/mm/paging.c
> @@ -205,21 +205,27 @@ static int paging_log_dirty_enable(struct domain *d)
>  {
>      int ret;
>  
> +    read_lock(&d->pci_lock);
>      if ( has_arch_pdevs(d) )
>      {
>          /*
>           * Refuse to turn on global log-dirty mode
>           * if the domain is sharing the P2M with the IOMMU.
>           */
> +        read_unlock(&d->pci_lock);
>          return -EINVAL;
>      }
>  
>      if ( paging_mode_log_dirty(d) )
> +    {
> +        read_unlock(&d->pci_lock);
>          return -EINVAL;
> +    }
>  
>      domain_pause(d);
>      ret = d->arch.paging.log_dirty.ops->enable(d);
>      domain_unpause(d);
> +    read_unlock(&d->pci_lock);

This means a relatively long potential lock holding time. I wonder
whether lock release shouldn't be delegated to the ->enable() hook,
as it could do so immediately after setting the flag that would
then prevent assignment of devices.

> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> @@ -102,6 +102,8 @@ static bool any_pdev_behind_iommu(const struct domain *d,
>  {
>      const struct pci_dev *pdev;
>  
> +    ASSERT(rw_is_locked(&d->pci_lock));
> +
>      for_each_pdev ( d, pdev )
>      {
>          if ( pdev == exclude )
> @@ -467,17 +469,24 @@ static int cf_check reassign_device(
>  
>      if ( !QUARANTINE_SKIP(target, pdev) )
>      {
> +	read_lock(&target->pci_lock);
>          rc = amd_iommu_setup_domain_device(target, iommu, devfn, pdev);
>          if ( rc )
>              return rc;
> +	read_unlock(&target->pci_lock);

You need to drop the lock before the if().

Also nit: No hard tabs here please.

>      }
>      else
>          amd_iommu_disable_domain_device(source, iommu, devfn, pdev);

Related to my initial comment at the top: It wants clarifying for example
why "setup" needs to lock held, but "disable" doesn't.

>      if ( devfn == pdev->devfn && pdev->domain != target )
>      {
> -        list_move(&pdev->domain_list, &target->pdev_list);
> -        pdev->domain = target;
> +        write_lock(&pdev->domain->pci_lock);

Shorter as write_lock(&source->pci_lock)? (Also in the VT-d counterpart
then.)

> @@ -748,7 +750,9 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>      if ( !pdev->domain )
>      {
>          pdev->domain = hardware_domain;
> +        write_lock(&hardware_domain->pci_lock);
>          list_add(&pdev->domain_list, &hardware_domain->pdev_list);
> +        write_unlock(&hardware_domain->pci_lock);

What about the companion pci_remove_device()?

> @@ -887,26 +891,62 @@ static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
>  
>  int pci_release_devices(struct domain *d)
>  {
> -    struct pci_dev *pdev, *tmp;
> -    u8 bus, devfn;
> -    int ret;
> +    int combined_ret;
> +    LIST_HEAD(failed_pdevs);
>  
>      pcidevs_lock();
> -    ret = arch_pci_clean_pirqs(d);
> -    if ( ret )
> +    write_lock(&d->pci_lock);
> +    combined_ret = arch_pci_clean_pirqs(d);
> +    if ( combined_ret )
>      {
>          pcidevs_unlock();
> -        return ret;
> +        write_unlock(&d->pci_lock);
> +        return combined_ret;
>      }
> -    list_for_each_entry_safe ( pdev, tmp, &d->pdev_list, domain_list )
> +
> +    while ( !list_empty(&d->pdev_list) )
>      {
> -        bus = pdev->bus;
> -        devfn = pdev->devfn;
> -        ret = deassign_device(d, pdev->seg, bus, devfn) ?: ret;
> +        struct pci_dev *pdev = list_first_entry(&d->pdev_list,
> +                                                struct pci_dev,
> +                                                domain_list);
> +        uint16_t seg = pdev->seg;
> +        uint8_t bus = pdev->bus;
> +        uint8_t devfn = pdev->devfn;
> +        int ret;
> +
> +        write_unlock(&d->pci_lock);
> +        ret = deassign_device(d, seg, bus, devfn);
> +        write_lock(&d->pci_lock);
> +        if ( ret )
> +        {
> +            bool still_present = false;
> +            const struct pci_dev *tmp;
> +
> +            /*
> +             * We need to check if deassign_device() left our pdev in
> +             * domain's list. As we dropped the lock, we can't be sure
> +             * that list wasn't permutated in some random way, so we
> +             * need to traverse the whole list.
> +             */
> +            for_each_pdev ( d, tmp )
> +            {
> +                if ( tmp == pdev )
> +                {
> +                    still_present = true;
> +                    break;
> +                }
> +            }
> +            if ( still_present )
> +                list_move(&pdev->domain_list, &failed_pdevs);
> +            combined_ret = ret;

Elsewhere we aim at returning the first error that was encountered, not
the last one.

> @@ -2765,6 +2767,7 @@ static int cf_check reassign_device_ownership(
>  
>      if ( !QUARANTINE_SKIP(target, pdev->arch.vtd.pgd_maddr) )
>      {
> +        read_lock(&target->pci_lock);
>          if ( !has_arch_pdevs(target) )
>              vmx_pi_hooks_assign(target);

I'm afraid this and the unhook side locking isn't sufficient to guarantee
no races. Things still depend on the domctl and/or pcidevs lock being
held around this. As which points acquiring the lock here (and below) is
of questionable value. In any event I think this warrants code comments.

Possibly the same also applies to check_cleanup_domid_map() and friends.

> @@ -2780,21 +2783,26 @@ static int cf_check reassign_device_ownership(
>  #endif
>  
>          ret = domain_context_mapping(target, devfn, pdev);
> +        read_unlock(&target->pci_lock);

Other calls to domain_context_mapping() aren't wrapped like this. Same
for domain_context_unmap(), wrapped exactly once below.

>          if ( !ret && pdev->devfn == devfn &&
>               !QUARANTINE_SKIP(source, pdev->arch.vtd.pgd_maddr) )
>          {
>              const struct acpi_drhd_unit *drhd = acpi_find_matched_drhd_unit(pdev);
>  
> +            read_lock(&source->pci_lock);
>              if ( drhd )
>                  check_cleanup_domid_map(source, pdev, drhd->iommu);
> +            read_unlock(&source->pci_lock);

Acquiring the lock inside the if() ought to suffice here.

Jan

