Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B57CF7CA632
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 13:00:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617469.960077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsLKa-0001o9-4X; Mon, 16 Oct 2023 11:00:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617469.960077; Mon, 16 Oct 2023 11:00:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsLKa-0001mI-1o; Mon, 16 Oct 2023 11:00:16 +0000
Received: by outflank-mailman (input) for mailman id 617469;
 Mon, 16 Oct 2023 11:00:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BBjo=F6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsLKY-0001lp-Dc
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 11:00:14 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20605.outbound.protection.outlook.com
 [2a01:111:f400:7d00::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e56ee7e-6c13-11ee-98d4-6d05b1d4d9a1;
 Mon, 16 Oct 2023 13:00:13 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBAPR04MB7303.eurprd04.prod.outlook.com (2603:10a6:10:1af::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 11:00:11 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 11:00:11 +0000
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
X-Inumbo-ID: 2e56ee7e-6c13-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TJdUB1Tpp6zqXfDvOr7kpGN+5+p6gzpQgc0bFQzileKPksVB+jVw0SdI+zpYNlOegpy1OXMsgukXl1Mj8TDLb9eFLv+2287XNV6zHhppE/ZEE3HTQcBjikg5M3K2QW1UH+tip26I03CWcsTi8iy5ChjOlty94l2Si+XOohwFGoQmiJ+Dy9Rjav06wX2Q8JfpDbUBsfNxDn3Tggvy5nrrULhHiI5pdlMcMjXW2b8vSYshHFARN06gLngMYTnQxG09P97AeU+sE9SLqMTEzr2TlnLaujzSB1f3l/ottuv5VAhpxg3IgKMyz48G389zcRgNquetVz22A+yI6FtGMp66vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vTvpCDNycz5IKQRIM9uOXTLLSFdTeTBE0ZY8+2XZobk=;
 b=NqYU/hDOgDzIqTJwYLw5gUe8ns+lLY/IjoJoi1mn2D4QnzJPnyEG4sARNSc7lnskzVTANh+6aYXfocMRUZ+eDzOfRw9pz/kcnPY/hgw3L2H35t88ofEsrLbL9244iozI3YpEqsjeG7wfu0lQ9bOuTHtw0GZJ9orFlAzDt/MovY4sEwGdkfJDYQBsO6rX3oftf+40FVAZ75Jq520O/KPJHbyu+YZsadhiJewLizuJVZbJLRoIYrhyU7kc2m3miKbw9aNMU1w32sLSBoULKSvWKpxSq/lxsOQGpilSnlZm5X9iyH4PopcL477d+q4F3SbHMBE6L45PXRbEm5zMzq7U7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vTvpCDNycz5IKQRIM9uOXTLLSFdTeTBE0ZY8+2XZobk=;
 b=bgHx23qtS685v1TtNKBurFkxGqo4NsUQ0/GCgpoEuJxk4d/izclblN7JCItGljsA4L9wT/qGF/IDjsQzGwp10BALs504fodwNwZGr+q3y/JDYHpbPHOSlU+6dIXPvpfKWUCTJxbkZM7exydpFYNWRMCu6fVpQVo4s7yOdZoU40XokLExmpBJR/TKvL2jrJNKOfcSLh/Jr/XvP8lFohMYTYkY10x4G31lZaCVSXmvwWJb2ubSyHEm/J1l/Zhf5N3HwMc103eb+N/rzNdAHpvqNEEvL+v2n8ZGSkz9T9sS5O7CmVEV+YMpgcEIRreH85mMCQEgYl2tHm5A2FJBKgxcEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <137af760-91be-21de-6033-8db1b8b7ef6e@suse.com>
Date: Mon, 16 Oct 2023 13:00:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v10 16/17] xen/arm: vpci: permit access to guest vpci
 space
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
 <20231012220854.2736994-17-volodymyr_babchuk@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20231012220854.2736994-17-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0160.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBAPR04MB7303:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e6de7cd-5827-4b91-ad93-08dbce371147
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dFh1v6r8kLB959Lw5ow+q7SdGURdwkRko686ES6TfLUamXvkhPEkttfY8mDlE9GOUvrQeWw7qI5LQ+G1FC5dloVFu2k+mWFM55j3sFgYzNq7oe4/JLz+9z1lOispKSGPemkOSQnRRbKm0hlgsdZgEa4wrgCbfLPihbTIa3bbYqRxLCmok4Iwt9BY5P95BruxIceZkCbj9vmTxdrT2QK6MzGu1ZX/pkGkvrK5reLt6uhrm73e1aYJq2+sla73SvYVcwPIilrwDHoFd5D6LUzXzXba1GJAEuuMjOFPmQiHjrq0X77mNm0E4U3o8aiCe5pBPt2+/sjXKJLhHWjv5AsV1JejAzhT1/4cUhsmOtgXwzSdLYGWfniQ7fel1QqM8nccBB4DN142AzSiSP15CmfPI9Ltcv3qJhVjE7a1XDWFdm2ewKVahP0hkcznWgyTh3CcjwBCzDL2uYtvS0m6AKJfjOgTud7KilUlB/7UEl7ZRvShiTwNg4e3YysV0S7VVs+fO9Yd4w/gjlYk5Gy1vG/SMSE9DkDH7hLjjXyAH6ktnc1qCBxXmglCKwou/Xe7FSjE3OkVT32fsznxjgcnk4oDw9/a4RQO1JA+lTIOxrQ9g+RCIFy27GzjmTZr8Gs6Yo3t9cNa3VquD30YLTk//0Dvtw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39850400004)(136003)(376002)(346002)(366004)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(478600001)(41300700001)(6916009)(316002)(66946007)(54906003)(66556008)(66476007)(6486002)(8676002)(4326008)(8936002)(31686004)(5660300002)(6506007)(53546011)(31696002)(38100700002)(86362001)(6512007)(2616005)(26005)(36756003)(2906002)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0J5dUVtUDJURGpSS0dWOFRLaitWT1VNMXp0NlhzOVN0ckFjRUxMK3BuSDVT?=
 =?utf-8?B?c09USEhaTjJVYXV0aUtnQWtKY2tBbnM2SDcyb2FJUW1NRWVzWGhzSzJCNXpH?=
 =?utf-8?B?QW51S09IK1YrNWFjeHVzNktLcjhjdkJzeWljTDdKYkpPRTNZMW9UU3RQb0cv?=
 =?utf-8?B?UnM3VytFL3dBWFozd3RGNGZaV0hDS3N3MU45VnFWaG1UekQ0UityTnF5ajBI?=
 =?utf-8?B?QXlFMnRwQlVQcm16b21tNjdFMzNMVnFScDUzNlhiYmZmeHkwdWtwUmh4UWpR?=
 =?utf-8?B?NEpwbmpaRGd3ekJSZXdaQTh2dlliMUNMRzRReUVuNUJrUVc3TmNaR21PcGti?=
 =?utf-8?B?WXI1Q1ZyVXNGUFZQZUh2c1I2UEEwSGNXelVZTkNrR1o1d20zRzh0YWxQZnZh?=
 =?utf-8?B?OXgyOUpOTVgzMG0rM2hFajNRSjJ5bmViNnAyWEZDcDE4eFJnYkg2RjB4V0Fy?=
 =?utf-8?B?ME9SbkI4NWt4T01JaUpHVWZoLzFraWg1ZUdRTWVCSFJRTTJGSTFUbjREaUJC?=
 =?utf-8?B?T0lVbTF6L3A1d1ZrdERhVmVBbGhZeW9rZUkxVU93bk5DbVRzTHpYRnVrZGxW?=
 =?utf-8?B?azJYTTZqOHNObzcyaDRCUHA2emMxcDg2S1R6YWZsaDFuM1J2RWZBUkpOQzhy?=
 =?utf-8?B?N2x3cUVsUkxLYjZST24wbjBZTm9JdCsyZkhWSTdiYllYMUhPaWp6QldiOHk5?=
 =?utf-8?B?UG05MmdrM2tWNUdaU1NsMEJPdkw2QjdOY3I1TUZTYnpYNHhaSDJVTUlDU2hl?=
 =?utf-8?B?V0ZMQzUzK2czTFdmMHQ0WWpEbFUzazF4Tmlhc3NGK241QUJEcG90ejR3YVUy?=
 =?utf-8?B?MmFJdmVJWHVEem1lRnFjRDNGOEh5a2YwaHExQ0RUUWtDd1BIN3ptUXU3dHJT?=
 =?utf-8?B?TE44R1RNT2VJdXlack5waDZjNEtWT21GZlNKTktGT3RnTlE5bGM1Qk1tS0Vs?=
 =?utf-8?B?djl1eDcwSmsvU3UvZy9idXd1NVB5ZDZFTmRDQ3RtL3ErMFpZempnRkE5QjNM?=
 =?utf-8?B?VCtlZldKRFJxUDFIZGZiZXpJSUl5RHJJeWU1WXVBR3pGa0UramFOcFZ6bk5I?=
 =?utf-8?B?MUI4aEFjNU1zMUFyQnZ2MjFvNHJqb2l3bnRvSUhiRWJES3NMUW1MVncrL3Ja?=
 =?utf-8?B?cityb3ZZTFcyMW0xUzNBc0Z1MWo2eU80ZUtSQm9GeFlNQkE4azdHaE5kckVq?=
 =?utf-8?B?YTRrSVhYdGhGZm92MmFzbFU5ZVFqWW96ZW03Tk9uczBBc1YrdW5mZDllRnN3?=
 =?utf-8?B?d3dxeFBtak9valBURkdsTXdjMlhWZDJyUU1NTFdwdUNLWW9FbENEWWhPaUVW?=
 =?utf-8?B?TFBkaVQxNHp5SUt4WUxLVnBKN3FCajBQUWRwcERwbld3clAyNFlyMUJTVExT?=
 =?utf-8?B?RzIxRTlITTNjU1pxVzRwbk9qQ1RjaUtGRG0rRm5EaXJ1KzVCNEFjTjZxYm9t?=
 =?utf-8?B?bnR5S2NMR0tzZ3VZQWU3c1pNWmprS01qdzdWeCtzMngzeldUVkpQVEFCL3lF?=
 =?utf-8?B?KzI2UGlNQXJSVU9QbzNDYlovSE9BckpsOU5yQnlsalNuK1VyaUJ4WE01VHNk?=
 =?utf-8?B?dXdJSWhNS1lGdnBhUWpLQ0JiZTJzRWhlTDlBZnVEbXM0VVRvNlpSejUzbStC?=
 =?utf-8?B?S0x4OGxlV1RCV2Jabnc4OFNoSEZLMGwrWDNHZHUvem91cmNEUkd0REw2aWtB?=
 =?utf-8?B?K1lTejYwa3dNRFdQOTR5bEVrVW9sNmJDellKZFhabUJxU0dJaXZQbkZXM3U0?=
 =?utf-8?B?OFBEUXV0L1FUUjlqTjNJVGpxY3dXd1ZPUnNicmRWb0tzR0xMRDZFRW1hTVNI?=
 =?utf-8?B?QWs5Z0huU0IxdXVYN2pWWk4yUndJNERFMFJjNUgxYUZ2UDJBUllWSUNhTnI4?=
 =?utf-8?B?QVhRU2daNFExNDlGWnZFVGd6WExmWFprOEFjc3h4djkzeWZqNDJFOWh4VnRp?=
 =?utf-8?B?Ukl2SGpVTjRNS0t3QmZ2ZTVVZVZ6VG4zdkJWYUlsbGwvaWZqQ2lYM0YxZ0xy?=
 =?utf-8?B?dFFHbXdRN2h0N3l1TlE1Z2doNllvLzFhZ0RRRmJGT0FrYm9ZV3R5T1h6ak90?=
 =?utf-8?B?MVdScmR2bU5GV1A1UUxVbzJSd1BjVUt0SjRVWGN5ZGpFUlo2U20yWnZxelZM?=
 =?utf-8?Q?haWUV5stH64KlEi4p4HjI1F4x?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e6de7cd-5827-4b91-ad93-08dbce371147
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 11:00:11.2560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VWrED6ii78B3M5qqAMyIPgI2E0SvkqJhXCv9qaHhAHOvMz85gSNuOnt1FjPp1xU2hgQVLuGop31hyfVhe3Ekpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7303

On 13.10.2023 00:09, Volodymyr Babchuk wrote:
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -695,6 +695,9 @@ struct domain *domain_create(domid_t domid,
>          radix_tree_init(&d->pirq_tree);
>      }
>  
> +    if ( !is_idle_domain(d) )
> +        d->iomem_caps = rangeset_new(d, "I/O Memory", RANGESETF_prettyprint_hex);
> +
>      if ( (err = arch_domain_create(d, config, flags)) != 0 )
>          goto fail;
>      init_status |= INIT_arch;
> @@ -704,7 +707,6 @@ struct domain *domain_create(domid_t domid,
>          watchdog_domain_init(d);
>          init_status |= INIT_watchdog;
>  
> -        d->iomem_caps = rangeset_new(d, "I/O Memory", RANGESETF_prettyprint_hex);
>          d->irq_caps   = rangeset_new(d, "Interrupts", 0);
>          if ( !d->iomem_caps || !d->irq_caps )
>              goto fail;

It's not really logical to move one, not both. Plus you didn't move the
error check, so if the earlier initialization is really needed, you set
things up for a NULL deref.

Jan

