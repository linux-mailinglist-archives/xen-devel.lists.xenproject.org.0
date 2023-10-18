Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FCD7CE1EB
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 17:58:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618702.962704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt8vh-00064E-4t; Wed, 18 Oct 2023 15:57:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618702.962704; Wed, 18 Oct 2023 15:57:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt8vh-000623-2F; Wed, 18 Oct 2023 15:57:53 +0000
Received: by outflank-mailman (input) for mailman id 618702;
 Wed, 18 Oct 2023 15:57:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EezS=GA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qt8vg-00061v-Df
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 15:57:52 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061a.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15a75169-6dcf-11ee-9b0e-b553b5be7939;
 Wed, 18 Oct 2023 17:57:48 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PR3PR04MB7434.eurprd04.prod.outlook.com (2603:10a6:102:8e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Wed, 18 Oct
 2023 15:57:46 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Wed, 18 Oct 2023
 15:57:46 +0000
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
X-Inumbo-ID: 15a75169-6dcf-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jKfeP4jZ/MvMpD9+a4SsT+R82EeEKtf5kOtPWpr8CqzfH+BRoih35Nh5Jf3HrQsrTSkHsu/DiUBil8qBIkMc1ELy4JO5cilOJsPCFbz5C9KWsSb6PIoCUcS5oxAi+lhCSpfEujVt+ShtgI4+gebboC37OxjHU87pMbHzN42OUMiqR5OZuq8voh+h5zOkI7XbIf5EctsrWCSae2OxBQwOvaVoOCu37wuMiTaEz95Nmf8cH1E2lQdPBNgvtUvGzKSV4W492Xysfy1mjZdETsJk5E8E+x584I4YkdWbT+9sih/fcqB3yRQC3BU2NlJIaMK+KaHXkn5KQDf/OuISDYP6HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t8IBvTFzP1phOlDjw7SSlnqr2ekEcF07H/fIzSNK94c=;
 b=C6CEQ6pxIroNhNEfOH75x8phwOsCVwpeD0N+T41E0BJIjHJuP8AmHqY2i1iSv3jgP4sBvYtwMsIUQqrJx0hclD+/P1VzM70YkCIYn18o7sJ07NRKEx3MUQTdgF2/1Z1QClWcgSjPIpPQxnJoUopED5x1/WJD+JXcs0nHkvNbaV0BMp3jCWfYM0qTS0ZTToYsK13asSzxSc3lrSAQa1xGZ/5jPgvvx+3+3JnyOkkvwFe0ZQ1ZWzxafYIuIe47FWyM+bFeh5f7p25Hckhla1Le5gGFWGnKOMqgS8q546mbU312gx9fkeZK4NYmfRTSWSPpXhBDd8KV9ySrJtyqVpS9hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t8IBvTFzP1phOlDjw7SSlnqr2ekEcF07H/fIzSNK94c=;
 b=zPfGucHrUMty1f7v0BxJBoP4diecqpcgYPRNMiU+gF3s5p7R2eZ7Cc9YCUiCE4iW4C3heaw3L/uyNO8/4gWcCh+Zr1F6zpGXae/L4vLwfJdaWjl5Sy20BV1qQ2XOpymhcx+c1slekeDvuG6G5tp/yK5HWVmMTaDNZy+3lXj7HZr4djAU3tCkaBPjzBZYjGOssgKI9tU86jpPcvlW/caO+PMPCRTLfF+Q6CdBA/9kgLL/NNZJiH3NMB4fKiR0UC6Hr646oAMdS0ZaPd+rK0WsnkQS9iWT8pfxx9JGuAIHgh9Kvfchls0c6tnTc0jraeYdNyy74Wo99TOHyuCfxRQ/zQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <12b1909a-5ad2-bc8e-8855-e80b468990b1@suse.com>
Date: Wed, 18 Oct 2023 17:57:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 02/13] xen/spinlock: reduce lock profile ifdefs
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: javi.merino@cloud.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231013094224.7060-1-jgross@suse.com>
 <20231013094224.7060-3-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20231013094224.7060-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0187.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PR3PR04MB7434:EE_
X-MS-Office365-Filtering-Correlation-Id: 736ca01d-e970-4bd6-3d95-08dbcff2f897
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SJ8ftNgz9j84fMI/+uaKkqhed9/yWGN14SNNgvEsrlgTkMg7iebjuYCKVf3IPUTLKjqBAWsu6gcnP+mIjJE8h3bl3zFgKOhZ2NWVs4NKWjxMtHADSw5Ssz28mW8VCPr9SFvSePByCdGRkM/d6UiyiTlkgu905bff1+ttZVncPo8NFyMlOu9cFSsLBBwNfDTsx8nE4JfJyMVYSIcbObxqiRl+mAAAWeC0re+slvdpKIGliMZCZZJdy8NLdusOEmmluS6IbfgZ+FaEsSsx/vnZfamPxbsQCrkFvN2okDChAQDKuLTS1H5kA3oeC1kiNujqm3/vwVMJi6HmwqyoGFd94RxgVbyZ5T6YkwTLSGSiBIKst9u+WVYoscIo2rqBuGbEcqT/s1TQlTJog6qUdBvDY+ktUYysn0oq8nOR2rb0npwN+R6HBS30WG199lTny0zeyRxZBTDl4nOXryUCW6m2agiTIz3sbin8Zk9PRKR3LiZhRtPO/ywO+BSAEP4jdiU8tk0E2y9MXU8Ipoj2K1RCl7yi2kKLP9jLJvFeBMxR+0uxK1vrLAWMewp8+ArdQHAE3btibLnQbsDQeofBWEHq5q8cOVJizxtwdY7moPEfBxOhRKpQTQRdhWMX65Jp3gNutRJifQEvu8EXFbv50+bTDA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(366004)(396003)(376002)(39860400002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(31686004)(6486002)(36756003)(316002)(6636002)(38100700002)(83380400001)(66476007)(2906002)(478600001)(66946007)(66556008)(54906003)(31696002)(37006003)(2616005)(6506007)(6512007)(53546011)(26005)(6862004)(86362001)(41300700001)(8936002)(8676002)(5660300002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2FaUlhEMVcyaS9iOGVvRzdBMmJrMFpBVHZHVXdWb2hiUVlmeDVrTDlEdldV?=
 =?utf-8?B?TGpQSENvTFdjTzBvWEZ0NWZnYmVoZEJFaDQ3d2drUEpRZUFKMTBRejhmQnJ4?=
 =?utf-8?B?emNabm1JdFJoS09ZQmxXUi95a0tUaHRZb1NWdHp1cUlRbVdCc0REVXlUejVE?=
 =?utf-8?B?MlEvckVHRW8vRGdzeEZZUHkzTjZJVGppU25uMXhZbWNIdW4wM2t0OU1XYXUv?=
 =?utf-8?B?VlhXTUtqSHJkbGRtNHY0VGJFSS8wKy9SRU5RcU9Ec0F0dkpkdWI1bHZ2NlMy?=
 =?utf-8?B?NzlQYVhveGkyWFBKL2lhYzcrdkRiS0RPUEFuaGRyeEs0NDBJWWtac2N2S1Jx?=
 =?utf-8?B?eVN3Y294cWhPRUdRV2xaalUzcGc3SWRrdUttSnlMSDBUemU2dWZLS2ZlZjdN?=
 =?utf-8?B?TDMwT0YyTlR5SFVINEJkZTBmOWVFdzU0SnE3bzBPS1ZWbjlaQUtuQkxaajZC?=
 =?utf-8?B?RXh6NzB2OWs5bTk4QVlVKzZHVGdSNTVqTlBiazNTeXBza1pxazl2TEpYTHpQ?=
 =?utf-8?B?RTFkWnBCV3VoNmU2MEhoWkN4TjZ4SWVLNjRaSGlsSGwzTkpJU21La25PRHRL?=
 =?utf-8?B?OWM0TjBQWnl5QUdDYUJDZEFGVnRUN09iTDhoM2VWK3lBRm9HczJrUWZnQVZw?=
 =?utf-8?B?TFQvL080QlREc1R3bzJwVXNCQlpHV1BFMXZsVDVTV3hJeHZCdUI0eDdFSy9L?=
 =?utf-8?B?eWFtQUZHSFZ6bmQ5cWVBZ1dBVHV4Y3JJcEVmN1Z1NnFKYlFzRTJsVFdRb2Jq?=
 =?utf-8?B?NysrcHltaTRlNHY5QmpHaUg5VDBuMzIrUnYraHFLK2s4bUdmN1djandPZndr?=
 =?utf-8?B?MlphcyttVC9qclBubTRKelgyN2hUOS81Q09rUlEvQm5rZlpXYjVEeVU2RzRP?=
 =?utf-8?B?a3ZhQVhXN2M2bnluazFOOVc5WVZnNTJBWUdBcWFKSTZZcStFVnZ0d2ZqT0RK?=
 =?utf-8?B?Z1R6N05JTE1vN0M5dGVVelFDazc0OHN3NkluRnA1Q0pDRStIWnJDY0twN2pr?=
 =?utf-8?B?MHlsVEF0KzI3UnFyZVlsMjEyK1lxbDdRNHYwNmdqb25FMWVOOEJoblROQ1dH?=
 =?utf-8?B?b2xHUk4rRy9JOStvYngxTkErNEdra3laNXFTTkdwWEYrRXc3VWIzTGxvaG9i?=
 =?utf-8?B?bVhIaE9zWVZGNXRteFB0VCtTVHRzK0l1dzBIcVMxMUhLcU1zT2g0ZGNVZXNS?=
 =?utf-8?B?dkFLS3BWNkhZMDl5bEpCWEcyeGMyTlIrS0hYVndJaXZvTGdBcXVmNWpJT0o4?=
 =?utf-8?B?VWkvZzBEeWtLZ2FVcm15YkpBUnBFWkg1WGVJdVk1Y00rakxpRHJlaE5nejRh?=
 =?utf-8?B?Q3VGUjZHSi84L3lCQmpZWjMwOE9mMjNLUUJVRWlJYmtraG9vNTM3dTRPZGNm?=
 =?utf-8?B?dTRzc1diZml3VTRCZnVVZEUvM1g4Y3RoZlhldkFGSmRmSWVIQ3Y4Uzl3dC9G?=
 =?utf-8?B?RHlUeVpEMlhiaVFtVTNIVFQ2OVFDWFlXRnV3aVY2dXpzai9ucTh2Ym5UcDJD?=
 =?utf-8?B?UjVRS3hjOENuaUxMU29WNHpkanFSU3BoUEM0VFUyNFhxb01nLzRsem1BN2I4?=
 =?utf-8?B?RkE2M1NKSzA3L0lzRmNEb3p2dStVWW44NFpaOVhtVXU0MmJub2E4SlNzaXRG?=
 =?utf-8?B?bmFmWGpPc3pYWmRHZkJZUGpnSHpFdXBaN3g1RHEwV20vdGFySGhhMndJWUtC?=
 =?utf-8?B?aUhrYzQvc1MxamEyMmtmbWxyamxzaVNlMmxtYU5yM2h0YUxseGFxZURvbk1J?=
 =?utf-8?B?WndtanVKTWZKUzFqVVFvM25BUnVUZzd5bzAvREVVU2VCc1o1N09IU3E4WDhM?=
 =?utf-8?B?VjNPMG0zb1pVNnNGMEMxd2RRVFQ5OGtIRjdmRFpkemF3MFp4TjNlcW1rTnd1?=
 =?utf-8?B?YVg3akRuMTN5R1NCeTliTW9YOVBvN3lSWDNPWXZidmVuT05sRHpmM2xGOERK?=
 =?utf-8?B?SENNYVJZOFBBaW82L0RrRFVac2NQYkUvb1JyU20rSzVxZ04zK1d1M1F0VVdi?=
 =?utf-8?B?UFdGeUtBYUpMWWZidlZBMzUyN1NrbTRzTHRhM2hzRFhyY2dSclZoSzJ2NDFI?=
 =?utf-8?B?VVlkd3FRbkdXK0N3SGNoRkF3M01SQktlU3I1SjhHcitnOXZ3b25zTUtVZy80?=
 =?utf-8?Q?jLXf4HfyXQF9DI9rFr1q7NpU1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 736ca01d-e970-4bd6-3d95-08dbcff2f897
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 15:57:46.3894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rEI82B7zgZFeEASQHxpVj94Aq0iWA5rNS7q8FyUbJynYTX/CP/aUlUx6IjoFXSLjNWgqoeFEZbtXIafNksDVVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7434

On 13.10.2023 11:42, Juergen Gross wrote:
> With some small adjustments to the LOCK_PROFILE_* macros some #ifdefs
> can be dropped from spinlock.c.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - new patch
> ---
>  xen/common/spinlock.c | 45 ++++++++++++++++++-------------------------
>  1 file changed, 19 insertions(+), 26 deletions(-)
> 
> diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
> index 202c707540..4878a01302 100644
> --- a/xen/common/spinlock.c
> +++ b/xen/common/spinlock.c
> @@ -267,25 +267,28 @@ void spin_debug_disable(void)
>          lock->profile->time_hold += NOW() - lock->profile->time_locked;      \
>          lock->profile->lock_cnt++;                                           \
>      }
> -#define LOCK_PROFILE_VAR    s_time_t block = 0
> -#define LOCK_PROFILE_BLOCK  block = block ? : NOW();
> -#define LOCK_PROFILE_GOT                                                     \
> +#define LOCK_PROFILE_VAR(val)    s_time_t block = (val)

This macro, and then at least for consistency also ...

> +#define LOCK_PROFILE_BLOCK  block = block ? : NOW()

... this one should imo take the variable name as an argument. Otherwise
situations like ...

>  void _spin_barrier(spinlock_t *lock)
>  {
>      spinlock_tickets_t sample;
> -#ifdef CONFIG_DEBUG_LOCK_PROFILE
> -    s_time_t block = NOW();
> -#endif
> +    LOCK_PROFILE_VAR(NOW());
>  
>      check_barrier(&lock->debug);
>      smp_mb();
> @@ -432,13 +431,7 @@ void _spin_barrier(spinlock_t *lock)
>      {
>          while ( observe_head(&lock->tickets) == sample.head )
>              arch_lock_relax();
> -#ifdef CONFIG_DEBUG_LOCK_PROFILE
> -        if ( lock->profile )
> -        {
> -            lock->profile->time_block += NOW() - block;
> -            lock->profile->block_cnt++;
> -        }
> -#endif
> +        LOCK_PROFILE_BLKACC(lock->profile, block);
>      }
>      smp_mb();
>  }

... this arise where there's no visible declaration of "block", but a
use. (Originally I was meaning to ask how this function would build,
when the declaration is dropped.)

Jan

