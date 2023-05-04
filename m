Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E51F76F6529
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 08:40:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529567.824067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puSc6-0001ey-TC; Thu, 04 May 2023 06:38:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529567.824067; Thu, 04 May 2023 06:38:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puSc6-0001cI-Pq; Thu, 04 May 2023 06:38:50 +0000
Received: by outflank-mailman (input) for mailman id 529567;
 Thu, 04 May 2023 06:38:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bg5W=AZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1puSc5-0001cC-3G
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 06:38:49 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20629.outbound.protection.outlook.com
 [2a01:111:f400:7d00::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 520ac285-ea46-11ed-b226-6b7b168915f2;
 Thu, 04 May 2023 08:38:46 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8928.eurprd04.prod.outlook.com (2603:10a6:102:20f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 06:38:43 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6363.022; Thu, 4 May 2023
 06:38:43 +0000
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
X-Inumbo-ID: 520ac285-ea46-11ed-b226-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hK0z8MRh+oZMYIiPBu8adL2pdYoVh3ULBXAIMzQpRxPTUtBetPt3YCf+KhitQUsSUUG8NAx6Rl2Pg3u0TyZw+/fNrZIdIWBHg7csD7U1aBfJVPUuHQ6xOpmyoOogYG4uyZgsajTF3Vax0P/SaXeLtcA+h2L2M0V0e5cgQ3Lv0Rpx5iytXXG3IDafn20GvW0zZlO2LSpv91cLS3xkI7K+NCLLAK2GiRGU7CPFRztXWZpH/bWNLCni45R4TPTiP4DjcEesKIOqP1vNIW08hcM4ywyudRkcqvgqTK7LavWCawj44RPgDZ/V7EzP4AeIWA3rv7Ntmh1Eu3j49LnHoq7H7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AYJ7iD/4wH8NobWx0XxiU2uD48mzWp79ptgMKoq265g=;
 b=XwNrnRBg6QPDKtE5WT330MYZnOOdvOpF+wGf8sqzxvz/c4KfQPArnBKuXLoEOjXNAYRi4lc4yH8/cQQAMhsxRuiCRFncAessvTmn1SnmCcNuk/og0AgDBYAuUHO90rjXlHy8PPV0lZ2Ri6aJKQ73eXGTOhEeJs+MDCFXILV9PMXG28QXb8kUOzYXmcrjzyr03jDzU6wWK7uj208DCngsfXp8EXnuqAkwLppJhQFVSy80QT9zvaZl/kYGQMWN9GH5AOcKQ6jX0IAgYow4qslzMzpJ6zzs7IBG6b561zLT6LA95VWyK/eIrOq5/19FKH47bta1rQueTi5yxFDH7Qz6EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AYJ7iD/4wH8NobWx0XxiU2uD48mzWp79ptgMKoq265g=;
 b=Hlw0qb4ffkVr4piAdCBwwmv3669rCCLyRdwgNIunwu9u/L7AR9rmnqVAmhXMnmZa8DIAvj4iu0a/wcZMUXS7qzVhl1SMwq7Vm5T3KFo4O22XJgQS4afDC0J3DSkGNRYJYJ7ZUz4sSS21TV+FA7Vn/D+CFdw0khsGEu5UUWRE6sGeF6F0dHsrqIDuF+VuhdmtqnTt/JHnko7zuRJllNA+VJtSj1RqIFrmkzpDuEoArDfsvvSFud3lPYkqfIaDQuSMTnj0j9f/Fbz4HgtLzIqBgKrUizK+OOyfVqf/K6S6EOBVgsOfnLrdEEK/Z8KRpzdfJPWlHKqU1ccqQHxnveVIsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c4aaf146-3b28-532f-5643-053e43425d0f@suse.com>
Date: Thu, 4 May 2023 08:38:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 1/2] restrict concept of pIRQ to x86
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <85e59fd5-9a06-48b4-ba7e-81865d44e332@suse.com>
 <98f51b96-8a1c-7f33-b4d3-1744174df465@suse.com>
In-Reply-To: <98f51b96-8a1c-7f33-b4d3-1744174df465@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0260.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8928:EE_
X-MS-Office365-Filtering-Correlation-Id: 980f9379-1d07-41b8-67c7-08db4c6a345e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IL9uO7e8dswtLUicdJoU/V97XEPZjycUpuaN6iG72V+rVMSycgfkGUs7axfRGo2HdsyVfaKbF/ZCbYsbphGPxyC2EGTx9pNUBz+RXEY8il8ESMAPNmfAmXXcoZng2K6FWAhdHDPV7Mtt7uH8uMr1ZFUff2/Ni4Xw8DI60fokymZ3ujFGP/hqOzwAm6V3t7XdsY4mf9Gy9E2EuMnKaafBqHZHbsMJNJz8WQZaBY19iWhKaqWxUAB3xkdQEMz1Iv9ch/KokQqJn+MzfATTxbjm+8uyJciJGCJ4gVTq4e6wodBabHsF6RtDpcdx2E/SDpfcsM6lXd+NNcd3sdHuTgYoslQCgNptK/RN4yW34NY76L9F60IL8Sehwos90nWYvSYYaWNLSdNH8dyt855nh2IZ1mAJAK7a07xMqtkZXiHpvD4rrhR4riajgy+FiVicHU0THJMS2l3JQlgzQrXeZvp26ePB1NP4kMjS2yniGhxluXRJIg/A8tj1m95O4KoqOorWfODdTjzlPwE2xOQy1ZW4CzeY2hhjQJB9ZlJZuYOtCqIE9Iu/DYKgG6YEKW269Wl8mNP4ryWAnoC1Q0fkk3EkNJSkukUuW+PNKJBbCPy8XQ0gKv1f7LM/A/e8XshUacwAIMxwgONt/0K3j7lj5NTQ9Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(396003)(136003)(366004)(346002)(451199021)(38100700002)(478600001)(5660300002)(8936002)(8676002)(2616005)(54906003)(6506007)(2906002)(31696002)(86362001)(66556008)(66946007)(66476007)(6916009)(6486002)(26005)(83380400001)(4326008)(316002)(186003)(53546011)(6512007)(41300700001)(31686004)(4744005)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzRtdHZwZ2tTZmdSckdoVHVoaitob3QxaVJmR0NlS0JXUm9PYlhtOVhYTEto?=
 =?utf-8?B?bzN4ck45eDlReXZMaUU3OXZWcytVa0JHTEl1UFo2NGU2RzlRVWh4eDhKNnU2?=
 =?utf-8?B?RktRSzZ6Tk9FZVpQL3pJZnFkTlpkOGptUkl2TzRVOWx1cHIxbmRLNElkVUlZ?=
 =?utf-8?B?bklVTGZNLy9IbDR0TE5wcEx4SXNRS0swQWJMeDFHeHBRYWdacGF5NVNkOFIv?=
 =?utf-8?B?VHZTY2xpM0R4Tyt5N29zY0ZtcDBRcG5GK044ZW9SajdUamI3bCtXZFdXUzQ0?=
 =?utf-8?B?VDAvazNmZHVKMHlNV3lJL0RIeVZ1UTBVaTYzaUI1SjVmY2JrQ0dESndLUTBO?=
 =?utf-8?B?czdCbHp2OTYrb1BaYkN1S1lSSEppR21UTk5HcHJBUUtCSlBPTzhVeFZ3VUNB?=
 =?utf-8?B?K3Fna2ZxRktjVkhVZHhoWVVkVFJ0RmhhNDhNSmZnMUtzTE5hRFRDRXoxcXZo?=
 =?utf-8?B?aFQ0aGxsWjVwek9uRVk1WTd5TWNsNG0rSllzcVBRKzBUckgrei9BaWJ3V05F?=
 =?utf-8?B?OWk3bG1kYjYzL09YZTdJMUpMNGl0VEZoM0VObHFaeW9MMXQvcUlCeWJxUnVa?=
 =?utf-8?B?WGVuVTFHenBoSkt5Yms1MGR6VXUxVExvb0s5UGg3TUpiK1l1eEI1VkRRUlJZ?=
 =?utf-8?B?aTY0cm9PZ2xsYXhIcUpGZTh2TWRSYTlxUHQzc1FDZEZXczBDZWFpSStHams4?=
 =?utf-8?B?aE9KZ2htWE14L1lsREVFY2dKYlp5bWhMeVRqazVNa2hSTDZqRnBoQkgwV1dq?=
 =?utf-8?B?bEx4TDIvTkZoZEVReWpQSHNTK1hLTHBva2RDbTFhVlU1QVFtRWNQVExUbmI4?=
 =?utf-8?B?dldFTDNSVER2T0pYWnlFOUVkRFFmbDY4RGFvTXZZaXAxT21DUTBjcHcxQUVm?=
 =?utf-8?B?SEVHNEtuT24zODNFN1RsWFRGeGNpMEtZR2tiS2d5NkliUmxvYmZJclpDc2xw?=
 =?utf-8?B?a1Z0VFdUeWF2TWFEdVViYXQvQnZjRGQwZHAyQ0tOVXFWeEZRTXhMVS9TUU4x?=
 =?utf-8?B?NUxWSUp3YW94NktyQzliL0tPUm9pMW4vWUVpZ082bjk5L0xDZmZEK2JVMGVZ?=
 =?utf-8?B?KzE2UU84aGRKTmxYQS9JdXpMT0hvSysrZURIOTNkQWtrZklyYzI3Q1pWUFlF?=
 =?utf-8?B?NXlxNzhGSmVpUzhuS0RveDNpNDA5amRaNzNjd1dxbCtacWlSOVlDS2ZDY2hL?=
 =?utf-8?B?ZzA2RXJPcUhSZ250WGloV2JMeW9ERWJWbUhianZBeUxxMW5JV05xdHF2OVFn?=
 =?utf-8?B?alBQTXJZUmVibXNPcU1YNEJtaXRIL0J2WWRrMmpsbGt2d3F4T1hBR3VwNUhh?=
 =?utf-8?B?cHpSSGNSazBPVXcwZmwwZ0lROEtqVGxhSmRyemtTL0NmRVYvcVZUUVlxZVNY?=
 =?utf-8?B?MFhVOU8xWkFVSjRuS1A4NXl5WDZyUzE4ZS9NbU9RUkoyNGFlNFp1M0pOVWFX?=
 =?utf-8?B?Z1dIMVhrUXpTaFBjY1BMU2ZmaVlMeXVpSmFUdEoxVTNuMWpmcWN5eHBzY0M4?=
 =?utf-8?B?YnM4ajdkVDV1NkhHN0c3YXZvRTBocm1mVzB4Z3NiNU9YeGtuRW56OEhHUGR6?=
 =?utf-8?B?WnRnRVByaXhnTWFEY0NoNGpqZjFlTHcxeGwrSWN4d0pCaU8vc2toLzBTVGJw?=
 =?utf-8?B?ek84U0FhUmVtdlBTb0ZIdEVmZy82RU5zSXNnNjRFb0NqQStpZ0xSTlpYTkFU?=
 =?utf-8?B?Y2Y5SFJxWHZQQ2J5WnpNa1lTSjAvZDNWUndBaE1CbC90dlJYMVoyaWVSNHNz?=
 =?utf-8?B?UlQ5clNhWFZKa3BrYzlKM2QyMUpwY1F4S0NxSG5uZmZ3cnhZM2VEYlFEL2tz?=
 =?utf-8?B?T1padUo4eHVDMzQ2WndIcGllb216ODZpK0l2cXhsTmsyUkgvU3NBZzVHUEpT?=
 =?utf-8?B?NDZsUldISmJLZzBmb09wRDNTWVBFdyt3Q1haKzJJSERIWm9mU1RPNnFPakQ0?=
 =?utf-8?B?TTZYdDBBNEhkS3lkMmZHdHFQTEFuK3Uxb2w0SWdXTXdBdWJiWHBDbXFEOU8w?=
 =?utf-8?B?OU9oaWtueEE2SmliQjRUckhEeFFiTURMbmg5dkp0WnRpcXlIYjRha2F0djdZ?=
 =?utf-8?B?bFE5VllaZ0VhYTR1YlR1aXE4a0dLVmh6a0Fmd2kyK0ZYeVUrL3dTME5JUDA5?=
 =?utf-8?Q?N3W6r7YywDF9xBMRa1Kk77+u5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 980f9379-1d07-41b8-67c7-08db4c6a345e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 06:38:43.4016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g14kofs0TsLfZgnwJy1mrdJ9mPpaT7GtZd+qPO0JAItYmY7QLkuHl6DpyW4gazK4dlSVABAG37lzCtaJW7VawQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8928

On 03.05.2023 17:33, Jan Beulich wrote:
> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -683,11 +683,13 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xe
>          unsigned int pirq = op->u.irq_permission.pirq, irq;
>          int allow = op->u.irq_permission.allow_access;
>  
> +#ifdef CONFIG_HAS_PIRQ
>          if ( pirq >= current->domain->nr_pirqs )
>          {
>              ret = -EINVAL;
>              break;
>          }
> +#endif
>          irq = pirq_access_permitted(current->domain, pirq);
>          if ( !irq || xsm_irq_permission(XSM_HOOK, d, irq, allow) )
>              ret = -EPERM;

It has occurred to me that in place of adding #ifdef here, we could simply
drop that if(), resulting in out-of-range value to also hit the -EPERM
path. Would that (a) be acceptable and (b) maybe be preferred for being
less code and (more importantly) less #ifdef-ary?

Jan

