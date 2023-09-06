Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C47CA7943E2
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 21:45:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596817.930877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdyTB-0000FN-DX; Wed, 06 Sep 2023 19:45:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596817.930877; Wed, 06 Sep 2023 19:45:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdyTB-0000Bs-AE; Wed, 06 Sep 2023 19:45:45 +0000
Received: by outflank-mailman (input) for mailman id 596817;
 Wed, 06 Sep 2023 19:45:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kbfT=EW=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qdyT9-0000Ac-27
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 19:45:43 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [2a01:111:f400:fe59::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f55441ca-4ced-11ee-8783-cb3800f73035;
 Wed, 06 Sep 2023 21:45:41 +0200 (CEST)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by LV2PR12MB5893.namprd12.prod.outlook.com (2603:10b6:408:175::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Wed, 6 Sep
 2023 19:45:36 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::8931:6349:9a02:48c1]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::8931:6349:9a02:48c1%4]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 19:45:36 +0000
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
X-Inumbo-ID: f55441ca-4ced-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cHPWVqRBJ0H07IFjWy7dzN1I6L4YK/32o/03bo1Qkbsie4ANwbxaQLdQydlw/sPuakQ752a90gTofCadwVVDYI/TmnvHcp2fremMzSU8qD17nGjrr97/TfRqZc+pwfDNZnTve6rn/kfrAfo+SET5UUKf97Adl4+pazg3eCygrN0zuDWqi9za7+LamTlWXlZJbJrVwbGoXSB/Y2Vr0nuLqkF7XZPugbk6BsdY9X5mU9Z2ZxgzSEKLySsNIAxE9/wz6rWOeQWrXlgY75p+D5BJYNH58S7Rq0W/nI07kKGMiq1gr7FQLAKnezeiQ8IN5A6Gbn193Nr81HSMMpvVtjg5Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=liQSn8oQZDNju6irM+DbgNgx5ZCZNQwHsDjmZWd08L4=;
 b=N43qqB+V5gZMrnVTqgs8fmajsx6ioTSxPIFX6QSoWSBgNxvZnNKwSi6G3yLjwSuyyqeRfcKnnzwiak1YCbO4nElASQsYll9fYMHqRaW74zg6jyfmDTN30dvI0RIjr21LqlWDOTAbzICTNp0oX0C2zLkmMqaXYOWOS8u9VZy5EZne7Zf8OfCfI3BZxnwgdWXcNXOIChNC7wdkxvvwER9SCJbiMoTG3VWuenG/a13BlVwSRVXlseSncFQ/okTgvcUSNNROEWUdwT8m7RNpHYMYHIV1mJ9tHUDfpBEqIx4RSjPmY1xzE3KlJ5LiiB2wubFpX2I7VI4A04AdyNNPHQE6Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=liQSn8oQZDNju6irM+DbgNgx5ZCZNQwHsDjmZWd08L4=;
 b=34dvJMrzYHXf7n0AeOQ+Jqbowmu8Aw/bGKn2XbytRBBGARoThWG5BCmCHJkTNtSjTvPKVc1SPLe1lzJCPTtKd7/qbEK4qe95Pz/bcj1AvLdA3FidvKQEJsu11L2f/2ZizSI5CCjPzHr3A9NUzZS3d00ezu0WVEdwfvuAcvTxifo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Wed, 6 Sep 2023 15:45:32 -0400
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: Re: [PATCH] xen/arm: Fix printk specifiers and arguments in
 iomem_remove_cb()
Message-ID: <ZPjW3LT9S5af_1Im@amd.com>
References: <20230906103014.19574-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230906103014.19574-1-michal.orzel@amd.com>
X-ClientProxiedBy: SJ0PR03CA0389.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::34) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|LV2PR12MB5893:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fe97952-45dc-4a6a-7d16-08dbaf11d6f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Euuz5Gexzah4MZGVWgqOW6PUoK7bOsnJc0GKr+P1+qxQosh4cZByKiLnQF6Ifoe42+tJM++4XHOo5n1H3nVHA8A39/bQeolp94per5Zgj0D1BTvkaF5flKJJhgbQ70JlL/XGYzLqqT6jte87sleAcNYRlIEUg2b4XTv853ZB/UCuxyzGvtdbNjML6luydEilG96Nn0ZHPnWWaozKflYFq67aQ93WLYWbZQlVXCDQSD+fTN4nPOgC+8mEVWaWrxAPKi5Ng5Z5tfCj+6rIXnKmQIgXa9WCB/KRvw0ktCId6Kro3hyTaGHhF2DbjJ5wdROITeRiuQfD940K3QBAeFldFlQBbvEhLlLvjXaKTkNtWJ8oUUnOcaCe6GmE/bzcOcuNW4waeb85Bkouv1L1+WptfcB5ab5VpwU2Gb9Toi/wvFmYU3bZgEQ+iBTvqSuIZjm/ZVcankxnpyhGlkWwxpWDDIxD3YXRDdTh5PS50sgN8P+bkHXDEHF6MYpeFRxhpjerpzpmf72WcL1+i5OtkMKvoNslfePwoXqBM3KHTN4BaWHpojZ1fn9/6QMVnN06y8rZ7VUoyz+nGZ/StYMXZfJjAlrsSULGSO0PNzyQh09Y5WU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(376002)(39860400002)(346002)(1800799009)(186009)(451199024)(41300700001)(478600001)(6666004)(86362001)(38100700002)(83380400001)(2616005)(966005)(6512007)(6506007)(6486002)(26005)(66556008)(66946007)(2906002)(316002)(37006003)(66476007)(36756003)(54906003)(8936002)(6636002)(5660300002)(8676002)(44832011)(4326008)(6862004)(25096002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1h1cHhabEt1TnIyR1Vwa0c2amkvUTBXSHBpaVdCcGNjS3J5b0hhbVB2T3pa?=
 =?utf-8?B?ZS9tZFlwZ3R2Rm1LNkNXcWFIdHNwWFMvbWFhbjF2S3pUQUJTSTRiN1BxZEhk?=
 =?utf-8?B?VnhsWXR6bG9MUytJYXUvTEh4QWo0MkVENys4R0ljN1ZxYmJHTzF2V0JUZDNw?=
 =?utf-8?B?clFKbE1peVJHQUlFTWpka3FPM3AyV0l6ZG40c0YrUENiaUJuMHhBam9uL0NS?=
 =?utf-8?B?ODVoM2ltUUJuWUcyWGdlQ3R1MWJteW1UcDBPNjc5OTZvQUJiMVZiN2NBK2N1?=
 =?utf-8?B?UlNLdEFOMU1xL0Z2SVQxZFpQMXpobFdWMUY0a1N0VldVQ2dTN0pSc3FIN2gy?=
 =?utf-8?B?NGhLZk40aStmVGNKRjJHbCtyck1ubyt0L2c2RUxtUTA5TDZPdy8zQWlQU0lp?=
 =?utf-8?B?RERoTHcxMHZ4VGRYMUxPYVhUcXJDZy8ydTBVYnJNS2RnRUV5WFEzc3BtL3VR?=
 =?utf-8?B?bFYzY3laSFF6aFA4UjV1RHhoZXI5Q0x3UWpndG4zMGpyd0xURWw3MTBxK1Fs?=
 =?utf-8?B?QXpBcFpsMGdIN2VyVmVPM290SG1xYUZFdTV4eHJwdnh6QWlEZkVQdm5OZEZV?=
 =?utf-8?B?SXIzVHN4OUJsbUx4TFdVa0E2OEVqc2RDZDNUNlBUYXh3aVpxdEtnZFNRZ2E1?=
 =?utf-8?B?dlZ3T1Z3ajNnWVgrcFJZT0pUL2FYYnFKaWZBT2xMTkNnVHhPSWx6ZHhDdjhI?=
 =?utf-8?B?WE1jZk9oR0pHaDVSRlY4N0xUZlBxakZZZ2lJU09NU0NTTnhRaXdQTnpYdWpE?=
 =?utf-8?B?Zzd6L3BqN3F6cDFNcDRXNHozN1A3SDU5QjhvYXRZaFJVeTIyOG5QUlZQeGRU?=
 =?utf-8?B?QTNXTm01Ti9NSmdqVTNWM0NQcVZkM3BPL3ZiTXJqSzNDSnZEZWJnd1RieGRV?=
 =?utf-8?B?aTZ5OGI2NUtGcnJNTnFPRDdWbVRnTm1pdjM2TUVjOE5Nb1NVbFU2Q2JHZndC?=
 =?utf-8?B?NVMrOTc2TkVqS1FZS1BUV3hyaGF0RDhvTWNDUWVDbXU3eWhGaEdPaDQ2a2Fo?=
 =?utf-8?B?V21sRjNDUDBpL3l6RWVxL292ZVpUajRWS0ZPT0hFbGYwZ21UQ0o0clBkdWtB?=
 =?utf-8?B?UVpPQ0ZxNk5lQkd0QjhsbXd3bk05MUxQUnhMVDZMTFVLMnNiUEtIY1BkMWF3?=
 =?utf-8?B?YUgweW9veFlEMlEvSzBaL055UWdabUM2UHZwc2xiME1MVndHZ0lrZE5NclRp?=
 =?utf-8?B?SHJWLzdHcWpaN2pGR29KalB0MWdhbWlCU0w2Y2FJYjVRQjhUWmNraS9pZGFZ?=
 =?utf-8?B?MHZNNFFzS2xFTmZWbTI1eFNsK0kwL3k5clR1WnhTKzd3eFlWRytSUzl6QUF0?=
 =?utf-8?B?K1MxZTBXTGh0SFZQcmJwZ2hsQUlSdk16T3IzZXJHcWw0N1BZcHFFMC91T212?=
 =?utf-8?B?SDJHb0hGc2tUcEtLUStGZnVacXZucmJTcDNCQVlWVnhmTHJJVEg0T215RDhK?=
 =?utf-8?B?UFZ1YkVNcFdjLzVRSG9tVmRXR0lUUkVZWWIwL0pMZnF3QjNuNVphT2dXSWpR?=
 =?utf-8?B?OVVQcjI5Y05JVFpJZ3RGWUp6MnJqeW5aNG41Vy9LdmF6MER6OE1XV3dxQ2kz?=
 =?utf-8?B?MzZEbFRrTXZob2xVTWc4amNFN2xkSGZoanovQ1duZC9aVzltSkNIL3FTc3dT?=
 =?utf-8?B?NkphUEJJV0IzR1BiQmVZTGNjZWdBOVJCeVZ2YUdSVy9UOUxwNUp2dWFVU25G?=
 =?utf-8?B?Vm05OTFnbDR6b0FWeDJYODMwWXQwR0VFYWpJZEk4M2N0dWh5eEhDK2pPWWcw?=
 =?utf-8?B?WEJaNXZIMFR1RnBVUTduUnZib0lqUm9qT21mVFQ1SzFRdExsYTlKMEFOVTAz?=
 =?utf-8?B?Ry8vZG80UGxQU05YV2FQMENSdFI2c01lV3VaTjU0NTdobnFSL1RTa2s1NGRU?=
 =?utf-8?B?MkZxVVpYdVRHRFF2cmlJWWRSS2lDVER4Y1VxSFovOHU2SU8xV2FBM0FtMFAv?=
 =?utf-8?B?SkdXanMzcURsZm1zellsS2RpOS9Pc2NtcXdTWTJoaVFUY011MndkQWg0VWRE?=
 =?utf-8?B?cFNkUkFIMlNneEs5K1k2U04xWXg1UFdwT3RPdENVNGNVS0ZDN3ptNVYyTjNr?=
 =?utf-8?B?azB6N2ZtcnNBekxlYnd2M1MwNFZGWE9RdGx5Y3daNzhpTWhGSDB6b0phTGw2?=
 =?utf-8?Q?2T2i72juRj6WkZIJq01O0l94k?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fe97952-45dc-4a6a-7d16-08dbaf11d6f4
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 19:45:36.1305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6l8VJzKabJcXAov18S/5VTfvhOVncg5Y1nZBJkTZNHLO6i/fPmMwaD4TsoixSOecurYE2H6Lrrfy4bOAIBAvlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5893

On Wed, Sep 06, 2023 at 12:30:14PM +0200, Michal Orzel wrote:
> When building Xen for arm32 with CONFIG_DTB_OVERLAY, the following
> error is printed:
> 
> common/dt-overlay.c: In function ‘iomem_remove_cb’:
> ././include/xen/config.h:55:24: error: format ‘%llx’ expects argument of type ‘long long unsigned int’, but argument 3 has type ‘long unsigned int’ [-Werror=format=]
> 
> Function parameters s and e (denoting MMIO region) are of type unsigned
> long and indicate frame numbers and not addresses. This also means that
> the arguments passed to printk() are incorrect (using PAGE_ALIGN() or
> PAGE_MASK ANDed with a frame number results in unwanted output). Fix it.
> 
> Take the opportunity to switch to %pd specifier to print domain id in
> a consolidated way.
> 
> Fixes: 7e5c4a8b86f1 ("xen/arm: Implement device tree node removal functionalities")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Reviewed-by: Vikram Garhwal <vikram.garhwal@amd.com>
> ---
> After this patch (and the one for xl), we are left with one issue breaking CI:
> https://gitlab.com/xen-project/patchew/xen/-/jobs/5026938514
> ---
>  xen/common/dt-overlay.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/common/dt-overlay.c b/xen/common/dt-overlay.c
> index b07a6128dc99..5663a049e90a 100644
> --- a/xen/common/dt-overlay.c
> +++ b/xen/common/dt-overlay.c
> @@ -251,10 +251,8 @@ static int iomem_remove_cb(unsigned long s, unsigned long e, void *dom,
>      rc = iomem_deny_access(d, s, e);
>      if ( rc )
>      {
> -        printk(XENLOG_ERR "Unable to remove dom%d access to"
> -               " 0x%"PRIx64" - 0x%"PRIx64"\n",
> -               d->domain_id,
> -               s & PAGE_MASK, PAGE_ALIGN(e) - 1);
> +        printk(XENLOG_ERR "Unable to remove %pd access to %#lx - %#lx\n",
> +               d, s, e);
>      }
>      else
>          *c += e - s + 1;
> -- 
> 2.25.1
> 

