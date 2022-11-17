Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3AC62D4A5
	for <lists+xen-devel@lfdr.de>; Thu, 17 Nov 2022 09:06:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444561.699833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovZtb-0003cB-Nu; Thu, 17 Nov 2022 08:05:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444561.699833; Thu, 17 Nov 2022 08:05:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovZtb-0003aP-Ky; Thu, 17 Nov 2022 08:05:15 +0000
Received: by outflank-mailman (input) for mailman id 444561;
 Thu, 17 Nov 2022 08:05:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iQoc=3R=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ovZtZ-0003a5-Q9
 for xen-devel@lists.xenproject.org; Thu, 17 Nov 2022 08:05:13 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70083.outbound.protection.outlook.com [40.107.7.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f0d837c-664e-11ed-8fd2-01056ac49cbb;
 Thu, 17 Nov 2022 09:05:12 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7512.eurprd04.prod.outlook.com (2603:10a6:20b:29e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Thu, 17 Nov
 2022 08:04:42 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5813.018; Thu, 17 Nov 2022
 08:04:42 +0000
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
X-Inumbo-ID: 8f0d837c-664e-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UVtSU9oyzIg5xWOx+Ixg+YJlx0Pl2y+zuo1Ag6iyFDXxPCchr3L1Dqt+TPPD8tyqYUv63HPYtmRPvCHcbAXuBA3DpmN5eHBq400jRP68TDELBFdfYl/gwTWo6FehgZHLdebN/pg5RhBIyTmZktRklAGdE7Vf7H5olsjEMezJQaiGW481cQZ/zRB8/SJ6d2VPh5lozJsn7sQvz+3a7BT3VVRzZ/5iH4YPS0AEwgmhAfuXtPpXhlMIT62MRESdzS8ZPdQdkGUWEow0ZBhnyQ7OcKF9sFl0h05ds2Axb5sXSUDFQlK+OgZBczUnC8+wzZuAFT/z9HCwCzndtdI4Ec+Qnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RmJ7NlLjFIgEz8MPJs2nNMlsimgFsnOr/vd2T0Lnkng=;
 b=WqC4RySg0cRJcTovDWNp9J1GqPKopB7J8qYo8SIyEn2cXo8Amn89l+VcVpZY04bqqhE80+X2tvnIpGkmu+lMil56IdDLpp4cjeMTFE/FWpNY3RarmORBrRvBzWR3kFjgWG5OQXpZ6AAJfiu3T+b+ulplgnfLO5tHuyhqHltM686ZIdqv+RPs4EWSmQEy9kKGeBQw/xUwDoC7vi9Zst5q0dWf4bZ6DxhVCHgFi1gvY5vXDKTY77Lwt0UR3v1nsvMmYySPkY93tFwV6iU+WtYHrANI+gDnU31JCjGUSHYK5bRYlV8gdpMKaelt1tSN9m/QWaRTwz04bGLLuv/RRwG/uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RmJ7NlLjFIgEz8MPJs2nNMlsimgFsnOr/vd2T0Lnkng=;
 b=TEucqcZ6U1OehAXLYKBuwLAElEdUUJsu2pU3tr0HoetvicCSs5PoVjl94JQ+Ov/oXUpsUZqTM5QwNFA0nBWyr/T0sLNRQXD4M5eMNa7+kp2QGqYWqmQh7WJTuMuAsIt5fRxtAQRCWKtaPdxRM+gGln4fg55HDKEKNUhhaPeOuqj3yJe+8qebIaiv7cTWMrRudZIlbC4zDJByT8WGB6jR4tt/7Ww7F9Xsg61dYcggUBmMEg2Y8E8MXRs3iOV4LTbXI2vKvQMNqgsupXINBL4O1IypTkoUbYfvUinpQlLc54JuKPZGq8TalYxCYjaei29NHCU3iUmDKxQmmPORc0X6fA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1443e924-5b53-9ee0-00fb-4d790d404b08@suse.com>
Date: Thu, 17 Nov 2022 09:04:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/2] Do not access /dev/mem in MSI-X PCI passthrough on
 Xen
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 Jason Andryuk <jandryuk@gmail.com>
References: <20221114192011.1539233-1-marmarek@invisiblethingslab.com>
 <20221114192011.1539233-2-marmarek@invisiblethingslab.com>
 <CAKf6xpvpsJuMZx98vLJ7CAmUWG-vW91Am0L8817eD8nmAN4NUw@mail.gmail.com>
 <Y3VYs/sS4VddrBCK@mail-itl> <Y3WruE/VOBZFfHfi@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y3WruE/VOBZFfHfi@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7512:EE_
X-MS-Office365-Filtering-Correlation-Id: efef1481-c059-41a1-7917-08dac872621a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CtNnW0AssGTZLRN5igRC2+7AKg3NaV/5dR3uMD5WMpsp3bY+BLLIQD7c/X1kGRRBXGEWsGFJCIoF3Zhj+aZiDCURcdPrz4JkAsUdim9oOjvzaTNf1MH34CNIFheripyY/C0HAb5poMUWU+ls+qhN6Gn+1dAfLp/U5ViwLPm4QNc3AquvoR3NXx3Qv2SSWjeSljK4NoYrDLFAi4gzFMN7KMAgJ2xpnhaCvsxpW35Wdrfa5oRVQiEygzspmM9UojtWBymJZFUXRPsY3RNExPlV8MacFn/NDykmwAc+/MwxIMpbrgHJPFxDFiC4WxHDl3m0zkSwA1OoWi+lkRwuvqGMalwaZsbVtuN/bOgc5yz5ubtjay5ckLvDVxAUj5tm7l8pBty6HQQkbXTt6XenctmJoTS1tkokXpqVW1avZiGOym2VHE3Bq5zBPhN8dSYb5eVTun632TTH7tjcdgkGy1fIsvus2exGuTQWka/SwFGdFqJCTwQoyjSBO7T9GzFIiBrS0FBFXpPBsCTf9ZB1RcG+CMwhAhZbBtzQtzUs694x08E4PSopQ1Dqaxwp8d9q0C3s1Ayuy+MrVwOhA348DLJQS4yf76M4PtP3OlXTJWwOB8LKP76rinVLqg8okUxh+34mitqsUuHYxZ0pnIk1c1eyk6bIOIc3FBgE3lMpIJFpratxurAc2p3HhvffO4sV3eiO94v7JN+7EJKuL+gqipGI+shzgTCcNZ2jcovSDZD39vX33KUVj1g5ykGZXZ2FE2Ql
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(366004)(396003)(376002)(346002)(39860400002)(451199015)(186003)(5660300002)(53546011)(316002)(6506007)(54906003)(6916009)(41300700001)(2616005)(8936002)(26005)(6512007)(4326008)(8676002)(66946007)(66556008)(66476007)(36756003)(38100700002)(2906002)(83380400001)(66574015)(31696002)(86362001)(478600001)(966005)(31686004)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHJKZ1V5WWt3WTliS1dlK3gwTzVtOTlTOFdMSHpIQ1FxSUhnVGVLWDZFcUN2?=
 =?utf-8?B?NEM4Zms5Y25RUkZ3TXVtN09nMFFOS1FNV21BVlhFWmNhUERyWVRkMkRyVXE2?=
 =?utf-8?B?TmdzTWFhTU5ZWlc5aTJyK0NRV0tLY2VxRndQMXdhMkc2TklFZlpPTTZjWG9v?=
 =?utf-8?B?aCtHUFBEMWtWb2dsam5Canlvb1IrQWJydHZ4WGJBZmpCTnRZWUdJQjBSeFVX?=
 =?utf-8?B?QkVBbHdLT3FZdHRjd2pxMDcrYTllUWNUc0F3R0pGNUtmOW1EeURTdUlUbnIv?=
 =?utf-8?B?aG1aRGdmRlRYdkc2WlBtSDZZM1lxSVMrSmtjM2pTdjMrcGJ4UVM5Mk8xVTQx?=
 =?utf-8?B?ZHBRYkVmaXR0L29mcTZqb2FjcjhIeWpLUkJBa2toOWN1bjluaVFqRWtJM3dw?=
 =?utf-8?B?dVMrMm0zTFhFOExUbDlWNk5Ob0lFSFpQRzRNdm92OEt2a1pvbWtDam9EVmt2?=
 =?utf-8?B?QXh2NTM1N1VyVVdDaU1VYmNJV1BpVy8zekFQeHphNU13d1FiaWJXWTdXS01P?=
 =?utf-8?B?bzVoSkFOellndEdGOE9sVHNDOTlCWXZnT2NsOVdUSTRCYkNFOVVCcG9aVi9y?=
 =?utf-8?B?b0o0ZmN1eU9lOSs4b3ZwczA2OW1jUTRjNG9lUVE0RjB0L3hLZ2ovdDU3NjFO?=
 =?utf-8?B?WmZYemVRZWx3Q0J5a0I3MVJSTHcxNmtGN2E5dm5EVG12NFZ1YXBOSVRlOW1t?=
 =?utf-8?B?T2tkTW5udklReWUzbGFxdlZNSFRCMkFtajhERktQd2NxUGdEbE8xNENNSnYx?=
 =?utf-8?B?clNtMERITE9lcERHaE1lQ1Zrdjg1cTZDMFp6ZytwQ2d6QkNXK2hTK2dqQmZ4?=
 =?utf-8?B?VXZseHdIUFRtNTN4bDJCTDJTeHVGQmUyK0hBakNFUnJMc0hzQmVTTGRsQ1Vh?=
 =?utf-8?B?ZUlvSmxCVm1UM0dBMlpUdjBJaWxDSEwzSEw4R3VCVGg3QVBpWmM2ZmdBc2FX?=
 =?utf-8?B?R3FId0wvR0RyV0xsamJZVVpvOER2WVRlZTZLVDRWN2pvRXl4MDZPQmlZNENJ?=
 =?utf-8?B?aS9hSGZtU25taTNPTnN4T3Q4d1RUd0VjcGxTQVR5cHVKQjdMU1pQaldQZTR4?=
 =?utf-8?B?VDUzSFpLYkIxR3A0S0ZRKzlQU3JpWG1yYlBoYzBUbDNkZGZoZ0xDeWxYRHVL?=
 =?utf-8?B?eC9HQlJOVlZRNnNobGRDRVJOdzFLVFkyREVEV2M5QVJ2L291OHBFMWxaMFYv?=
 =?utf-8?B?ZDVXOFNzNEcvbWhwK2tjMWRSOXZPMFA4WkhERzZTSUhJNW9WWEY4L2JUakoy?=
 =?utf-8?B?ek5FMVZQM090VHk1VFhaZG45U0YvODAwNE1UemtURHZ2WDViWnFaTmlhR1c4?=
 =?utf-8?B?dkRoemd6RWgyQTVzTTV3QTlwQVloeXNva3JDY0dUaXhyejMrUmRqOCtIZzI0?=
 =?utf-8?B?UjIvSEc2NHdZU0xIZnFqTFFLNWFtb3IvSTBqbTExSXFKeTZTdy82MlBObE1L?=
 =?utf-8?B?MEdYUGxRKzBRZ3hBSjJJRGVQVG93WXZ6dUZDUW1WcTdnUW9wR1NMeFpwQWhB?=
 =?utf-8?B?MlJ5bVlqMis1bmsrNVBOend4ZnY3d3hUc0xOWWRnNU9LVjFvT3RmUzNNRUtx?=
 =?utf-8?B?aWtFRlFMWTBWelpjSk4xWlU0c1BiY0pVNHg4Mi9nV2NWT0tJVFN1TlNHcXM3?=
 =?utf-8?B?VkZsL2FreWNlMVpDRXEwbGROL1d2Y2VQS0N4ZFR4cnlFVUNLcXNQL1hxLzlH?=
 =?utf-8?B?OVN6blZZeE4xWVpFaVpoNzFuWUlkTm1FV3lJdnNLM0Z1dE9mSmNmNVVvQ0Jk?=
 =?utf-8?B?K09PMjlGaFdQZlpXOEEwcU55NklFUFozdC94MnNibFlzL000YUUvS0pGYS96?=
 =?utf-8?B?ckRjVk5ENGhJclRESkU1M3ZuS3owMTRrRFFZYTFlUEZweVJ1cWFXTVFEZ2pJ?=
 =?utf-8?B?dWNiSGpLL2hMTzBzSDdXUCttUWZmT3ZJWnZkcHJpczYva040K0lUSXMrOGdw?=
 =?utf-8?B?SHlzUnViT1p1VHNvcDlNV0UzN1Z2OGttNmJvVnhobFZZMmVSMzZmVkE2SlNx?=
 =?utf-8?B?ZHZEdW9TZ1MwYWlweks3RnNCZk1pVnJuVjRnR2VUSHBoNXc5Zk5HZTNWMXpY?=
 =?utf-8?B?OVQ5T3lNNzVOSHJ6Yi93eTc4SjJ1WkZ6VGxCd2VoWWZISlM2bWFuOEhha2ho?=
 =?utf-8?Q?rr+cmWVSn24IarKlmZJ/45zg+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efef1481-c059-41a1-7917-08dac872621a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 08:04:42.5950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kJqJ3IBJ8bvOuhWsyS0VNkVfK84L1WHUj1LswRvhSW7xrc8n5ogngu/dK+22727Cb99uHiawrnMRajCf1mmYXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7512

On 17.11.2022 04:34, Marek Marczykowski-Górecki wrote:
> Ok, I found what is wrong. Enabling MSI-X is refused, because INTx isn't
> disabled at this point yet. And apparently I was testing this with
> permissive=1...
> 
> Linux does this:
> https://github.com/torvalds/linux/blob/master/drivers/pci/msi/msi.c#L611
> In short:
> 1. Enable MSI-X with MASKALL=1
> 2. Setup MSI-X table
> 3. Disable INTx
> 4. Set MASKALL=0
> 
> This patch on top should fix this:
> ----8<----
> diff --git a/drivers/xen/xen-pciback/conf_space_capability.c b/drivers/xen/xen-pciback/conf_space_capability.c
> index 097316a74126..f4c4381de76e 100644
> --- a/drivers/xen/xen-pciback/conf_space_capability.c
> +++ b/drivers/xen/xen-pciback/conf_space_capability.c
> @@ -235,7 +235,7 @@ static int msi_msix_flags_write(struct pci_dev *dev, int offset, u16 new_value,
>  	    (new_value ^ old_value) & ~field_config->allowed_bits)
>  		return PCIBIOS_SET_FAILED;
>  
> -	if (new_value & field_config->enable_bit) {
> +	if ((new_value & field_config->allowed_bits) == field_config->enable_bit) {
>  		/* don't allow enabling together with other interrupt types */
>  		int int_type = xen_pcibk_get_interrupt_type(dev);
>  
> ----8<----
> 
> Jan, is the above safe? It should prevent clearing MASKALL if INTx isn't
> disabled, unless I missed something? But also, it will allow enabling
> MSI-X with MASKALL=1 together with MSI, which I'm not sure if should be
> allowed.

While it would probably be okay with what we have now (after your earlier
patch introducing allowed_bits), it's likely not going to be correct once
further bits would be added to allowed_bits (which clearly is going to be
wanted sooner or later, e.g. for multi-vector MSI). Hence I think ...

> Alternatively to the above patch, I could allow specifically setting
> MSIX_FLAGS_ENABLE + MSIX_FLAGS_MASKALL while INTx isn't disabled as a
> single exception,

... this is the way to go, and ...

> but at this point I'm not sure if some other driver or
> OS wouldn't approach this in yet another way.

... I guess we need to further add exceptions as needed - the one further
approach I could see is to keep all entry's mask bits set until setting
"INTx disable", without using MASKALL.

I'd like to note though that the PCI spec has no such exception. It,
however, also doesn't mandate setting "INTx disable" - that's merely a
workaround for flawed hardware afaik. (In Xen we also only cross check
MSI and MSI-X. IOW we rely on Dom0 anyway when it comes to driving
"INTx disable".) Therefore in the end pciback looks to be going too far
in enforcing such dependencies.

Thinking of this - what about making the change in
xen_pcibk_get_interrupt_type() instead, setting INTERRUPT_TYPE_MSIX only
when MASKALL is clear (alongside ENABLE being set)? This would then also
cover command_write().

Jan

