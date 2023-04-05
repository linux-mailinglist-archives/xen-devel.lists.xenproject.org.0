Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 380556D776C
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 10:57:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518337.804761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjyw7-0003IF-3G; Wed, 05 Apr 2023 08:56:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518337.804761; Wed, 05 Apr 2023 08:56:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjyw7-0003FK-0M; Wed, 05 Apr 2023 08:56:11 +0000
Received: by outflank-mailman (input) for mailman id 518337;
 Wed, 05 Apr 2023 08:56:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gw2r=74=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pjyw4-0003FA-Ro
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 08:56:08 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20618.outbound.protection.outlook.com
 [2a01:111:f400:fe12::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3887f47-d38f-11ed-b464-930f4c7d94ae;
 Wed, 05 Apr 2023 10:56:06 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8806.eurprd04.prod.outlook.com (2603:10a6:10:2e1::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Wed, 5 Apr
 2023 08:56:04 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.035; Wed, 5 Apr 2023
 08:56:04 +0000
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
X-Inumbo-ID: b3887f47-d38f-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XBPb2bwqdMtAV18nOX5hsDz40W/yqZhYRFJnVJL6SKT9F+JmEVz0Rq1kJjIRrVBle6Bc+yxeOesadtg7HhUnVWlI9EJ6PCoX16Es/rkLLHSD3uU7vYN5z4xhp1Vf7N7vseHU73JOLcG8zwSRqahb3fz09aCasGndx/2FAz9o1YAOnynPw04h+5orRf9qVzP/dVgJJv2aQPw263DgPPhWooA8GWEUdQBZxrypgZQ5mX0Ccf5j3nBh04S1807O3ZTrp/JVWUKsROo/AHi965NmciNJXWKw0daJX1I6QB1pBBvcBjdwGsJtl+0eyau4UWq15SUdgPI9YjU1ulfdatuzLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+mVTO62r6MdNDfQvzJjVKCOtuW5R5PdZ4og7pljUhPc=;
 b=nePbIZtD0nvR9bshlTd/7uTXv3D+YWMQA2oSa++ZYDq5m/RC/qWsAF7Ov0RvYiodAVMIH3w+nriT/1BeB2mAdKXt3C2DrvKK+fiyfE7RC+m5RTcpuBt6baUT7xSxL+veujQFfC7G+DWNW4Ldqr3WgsW30ka2dd7ly1/c3Zu96B08Ng+RfnehbcXgMZadJyTH69Jf7+yEs0ZewD4O5Z590piZC6oJKiZhNtgl1zz3sbUsLp0lgWQvj3y8GuG3AKunNGp+t4iHqhBdfHT9XzUeqC4xOUJfybeoyVD27Aa/PN8gB9umj6FtbYg4nWTqQkyxNuVJZJsJaKBAyxt+dbEAOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+mVTO62r6MdNDfQvzJjVKCOtuW5R5PdZ4og7pljUhPc=;
 b=dxG/77rFnJRGMEn7p7hepF5W4d4JCa/1slGtyQ+FWtSUu2tREcFfVGvr7suG+PJKa16M7Je+z055w1mH4Hh9z1OIjwT1LHxjSwpMUwGM7HNST9m2CR0Ez6XGaEjkWM5fI2nb11W+7+lBokuKE//7V5NdKQN6UI+HUoQ3MBiJ+uwJ2BiONUEh8cjFnrcTgLFwCwE1yA2MfJmWbjmeiKydHxSAIuEluQTWjH2FjP+xVeBZo9Nm/DdI0tp2Ddfh1YrrWNhdQPzK3FaAoM28Ea5oT2U3pChUxeqKGxbBkv8QaSz77R5gsgFo9t2UVwJFoal0hKh0MpeneulU3wIgwCExYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a1c16028-3f33-36bb-36cd-b1ad2664b0f9@suse.com>
Date: Wed, 5 Apr 2023 10:56:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v4 2/3] x86/platform: introduce XENPF_get_ucode_revision
Content-Language: en-US
To: Sergey Dyasli <sergey.dyasli@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20230404160655.2354-1-sergey.dyasli@citrix.com>
 <20230404160655.2354-3-sergey.dyasli@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230404160655.2354-3-sergey.dyasli@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0050.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8806:EE_
X-MS-Office365-Filtering-Correlation-Id: 080548f0-1ca7-4cab-11e6-08db35b39690
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5Fw1PSZqg8TBwr9bXEIHVhFo0nkeout8a0NpsOG7Dgt1gCqTi2oM+/CgudF5+sXmxKVkFrT97fSXbOkFzvhuyLThXs116HJ33jakUTg5ASfga5qkGh4BHGvgu/nz3Vj6TKZUBbIFMXSBI7XIQ9THsA9jnEoTape29XVWnOnKsYsLjUMyzE2hQZ0ZiuWScxeIPdGi171TXOPTfElazDbo8cNKuUYVap8FS4KM5G0GCR2EbkCmn2H4+LfvEWhVFYDUZq2tHrCIHe+LCEl2iaRGbGZ8WB2LVQlDcs4Zs0Hwl13VUfEXh12ZkXVjTxml8QqjiNp5bi8025uckVqUq2zUURA5Zz9Lm9cSVFiB32n9t5a3eL9fnQ7Hca0Wp8V//QmCtNn0waq99+FV0uxWQybMO9c7xMJSnCXIMvabUv+rwHcfQcViwgKAeB5RVtuDvXt7DF+a8cnZLMLSkPNg+1Iy4ugxQITyfiGlMLyOOWj6PK1IWw9U13DNvIYJH5Wb+RZRswBtfUdcdNWthXisdr1lXA/eiLUJaWkWcplOVZ08ue31QPKWWp1Kqc0NJdpqUNpYbSLutrJHwx6MT/G05Rw2RnSHKLPJWPVanR6aX6aZl1IkG30wuiYGcw9bYug80Wy3nB2HbrTcOogip7iQ1tBuIg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(366004)(376002)(136003)(346002)(451199021)(66946007)(478600001)(316002)(54906003)(8676002)(5660300002)(8936002)(36756003)(4326008)(31696002)(2906002)(6916009)(86362001)(38100700002)(41300700001)(6512007)(53546011)(6506007)(26005)(66556008)(6486002)(2616005)(83380400001)(31686004)(186003)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dkJVUksxRVVFVW8zbUp3VisyeFBCSVlhcFJzRlh6MHhxK004dnFESHkza0dn?=
 =?utf-8?B?dDhtS2pTblNvUXpEakVoZ2xQYnpibXZDUDJqZ2tSUWdPNkhxTEFHeTFqOU82?=
 =?utf-8?B?eThxS010eTV1R2V6VW1IM09rV055UGlmZGVkMXdpYncyc3dXNDB5M09QYkQy?=
 =?utf-8?B?dkFSRTVsZ1REWlI1ZHN4ajBpT0lDRGdKZTBNNDNUVW1XQ1U4UlZSWUJuZVhy?=
 =?utf-8?B?clR3aUJtZGZQYmF5SFE3a0ZwekRIKzFPYUNmWGRpdFMzZWFvSTBPbmZ6Rmkv?=
 =?utf-8?B?MnIxMVhYSVZSSU44aU5iZStPcC9obGQrMVlYVkk5bkRTR1d5bVRPMy9GMnBV?=
 =?utf-8?B?OEhDdmQ2QjhtZVlyYWs3UzhrWGU5bGhKV0paMyt1RzY4YktNNnArenVqNUZP?=
 =?utf-8?B?WWphVEZPay8wMWtsdHAvZHFjb2lVbTlkTjg3VzR3VHBkWndHZFZCcnZoem1K?=
 =?utf-8?B?ZS90NTFCMW1maVA5UXZFdExCNmJ1R3dnN0dxd2h3Sm9kZERPclRqYjdqTlVk?=
 =?utf-8?B?cTkwVjNhM3NxUzJQaDhYaTJsRisvY2FZVlR5TFhQSEFCRHZ4VkNLRUxGZzhY?=
 =?utf-8?B?YXZNUFAwYkU0aVluVEpqSG9kU2xPd0VWYjF4Z05EWXBqNnZraGZHb2tkVHpJ?=
 =?utf-8?B?V0lwUWF3MkVjTFdBRVpvRHdqMUNVT0NJT0VYeU1xeGY1ZnNBSWZ4THNpak5G?=
 =?utf-8?B?VFJWeXBWUDd0ay8yeHZiaVlCR2p3MmNSeVZrYmJhVzQzOWZMK1p2Wll2TXNX?=
 =?utf-8?B?SVI3RzRRZmhuWXdsWHhoVGxwcFk5T0RrL25BSlBrTi94eUhiL3Zpa0pZT2p5?=
 =?utf-8?B?SmNvaVZOZnBOS2VhUndYZjhWZDZmM1ovRExUZ2dBUmp4V1YrdWJ3aE9mSlEv?=
 =?utf-8?B?a1V3dGx6OFpuUGNXeWlkalhnVlgzcnBLSFdnZDdyM3FkS0VmQ2xkZWZpWWVZ?=
 =?utf-8?B?akVPdHl5S29KMVVBbnlpYjF3VWtqRFBtdUUxK3lmTStTMlpOdEVOOGwyT2Jl?=
 =?utf-8?B?amxuak9Od2Q3VndDMDVURVI5VlFPbDNia3daSlZqcnNTTW5POGFSTDZ2VXAw?=
 =?utf-8?B?MUhqK2xjWXpKUVB0K2lQTDY3SVlWVnBWbGZ1K0lONU16K29rWU5XRG1CUDhB?=
 =?utf-8?B?bFNRSGhZQVUxT1hiTWlwODJsdlpPVUFpTjU0TFJtYm9temJpSW1HNldOd1NQ?=
 =?utf-8?B?citqVjUzYUEyRThLR2JKdE1rYnBONGxGcU05R0ZsOGY0MEptODVROVRvOU5F?=
 =?utf-8?B?YzZyaEQwZzd2dDJkaXNJdFN4MVhleUhvSjB4MEpkak9LK1Z4dE9aMjlGRk1G?=
 =?utf-8?B?OTdXZW9ENyt3S1VVVTM2NmxYS3huMzBXRjNMVitBbk81QzdvREpjT1NYaktj?=
 =?utf-8?B?a3BYNWJVMzJTWEZja05FZjlSTVhnaGZoc2VnQlBwaDgxUzEwZkZ4OS94WDZS?=
 =?utf-8?B?YnQ2QWxjL3ZIU0ZsUy9kZ3U3MkpXZHVHenRvalUrVFVreFhISU41SU4vZnNt?=
 =?utf-8?B?Uy9wS2JFUXhzU2F5bEx5S05jTEtxNU1lbGdXaFIxdVQ4TkxKWFhtUnRsdFFR?=
 =?utf-8?B?YU40U2cvMy9qYXpoN0dwNHJqa3diNlQrY20yTzNZelRGN0MzeDV1NDlGT0d0?=
 =?utf-8?B?TkJ6ZjdRWmEzeHBNREszR3g5NFNvOXBubDBRVHpKYTZQVWpZc3FFUVRtZVJ3?=
 =?utf-8?B?ZmlrUS9NRjRxSkw0OXpOZzVkUDdJTFZLVlVhTFE5RUtaWklwM2k3ZkF5TVVh?=
 =?utf-8?B?b2ovMFhkNmpLWkRyS09hVjVmd0dEMEFhNTh0Q3d1YVN2RG01V2RRenBROVJD?=
 =?utf-8?B?VnRiNHhSY21IcFQ1YjhrdWY1UTRiL09xNE5HNzhpSGZCSFpMNFlVa0JUVzVI?=
 =?utf-8?B?UWwyZWxURVQvTmVLeGFKazM2N1VGNnAxa0NzOHBzZHMwUmQzMlowVm5uS0xE?=
 =?utf-8?B?dEVqNEJSbmtEbmp1by9lbTFKOTRZUUZPSm1tMFplak1aa28rUUhkQkljRWdU?=
 =?utf-8?B?NjFFWXpuU0xzS0Z4bGVmOGxubHZpUXY3c0FxVllUN0FISHJvL2NrenNXbmth?=
 =?utf-8?B?OVU2TGdDVUFTSlJFb2piL1k5czUyQXF4clB1WmNNZFdQNENGOWFoeSs5RXJX?=
 =?utf-8?Q?5VgusHQ4lG0EVzjzxvHS002hn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 080548f0-1ca7-4cab-11e6-08db35b39690
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 08:56:04.6427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k6xC87La6JoQWdoSck+NccnVmTZcm5+/4MSO7T/NTnAeTwMMVmM5ef5ks2KH4OWEXC9TeMKhcJhV8pCIrTXNUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8806

On 04.04.2023 18:06, Sergey Dyasli wrote:
> Currently it's impossible to get CPU's microcode revision from Xen after
> late loading without looking into Xen logs which is not always convenient.
> 
> Add a new platform op in order to get the required data from Xen and
> provide a wrapper for libxenctrl.
> 
> Signed-off-by: Sergey Dyasli <sergey.dyasli@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with two remarks:

> --- a/tools/libs/ctrl/xc_misc.c
> +++ b/tools/libs/ctrl/xc_misc.c
> @@ -243,6 +243,24 @@ int xc_get_cpu_version(xc_interface *xch, struct xenpf_pcpu_version *cpu_ver)
>      return 0;
>  }
>  
> +int xc_get_ucode_revision(xc_interface *xch,
> +                          struct xenpf_ucode_revision *ucode_rev)
> +{
> +    int ret;
> +    struct xen_platform_op op = {
> +        .cmd = XENPF_get_ucode_revision,
> +        .u.ucode_revision.cpu = ucode_rev->cpu,
> +    };
> +
> +    ret = do_platform_op(xch, &op);
> +    if ( ret != 0 )
> +        return ret;

Is there anything wrong with omitting this if() and ...

> +    *ucode_rev = op.u.ucode_revision;
> +
> +    return 0;

... using "return ret" here?

> --- a/xen/arch/x86/platform_hypercall.c
> +++ b/xen/arch/x86/platform_hypercall.c
> @@ -640,6 +640,35 @@ ret_t do_platform_op(
>      }
>      break;
>  
> +    case XENPF_get_ucode_revision:
> +    {
> +        struct xenpf_ucode_revision *rev = &op->u.ucode_revision;
> +
> +        if ( !get_cpu_maps() )
> +        {
> +            ret = -EBUSY;
> +            break;
> +        }
> +
> +        /* TODO: make it possible to know ucode revisions for parked CPUs */
> +        if ( (rev->cpu >= nr_cpu_ids) || !cpu_online(rev->cpu) )
> +            ret = -ENOENT;

While the cpu_online() check needs to be done under lock, it's kind of
misleading for the caller to tell it to try again later when it has
passed an out-of-range CPU number.

Jan

