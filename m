Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A56652518
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 18:05:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467239.726277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7g2z-0007ls-FR; Tue, 20 Dec 2022 17:04:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467239.726277; Tue, 20 Dec 2022 17:04:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7g2z-0007ix-C9; Tue, 20 Dec 2022 17:04:57 +0000
Received: by outflank-mailman (input) for mailman id 467239;
 Tue, 20 Dec 2022 17:04:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I7dU=4S=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p7g2y-0007f2-KV
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 17:04:56 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2088.outbound.protection.outlook.com [40.107.21.88])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6cfea0a8-8088-11ed-91b6-6bf2151ebd3b;
 Tue, 20 Dec 2022 18:04:55 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7222.eurprd04.prod.outlook.com (2603:10a6:10:1af::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 17:04:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 17:04:53 +0000
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
X-Inumbo-ID: 6cfea0a8-8088-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ashzqsfKp2TF3YE7Iuvl6Sj2pV+yYe4hO7XZpQv6oOSt1y9uLBwoCyWF8KrKLdgWEL6BNq2le3dt91LrzCeOPFcbuj8cH+CoZOy2qsVQfVe/oz+nUn2vC4cRmfXD4AYdoYj4rg21/Hz6LKPoOOCM2xAqmvyHGMfYg7k5QPeaW99wY6EsC/6phUjAjuJRLh7H6zkE2pwQHGaSiT0nAJybq4g355jOsooB1X1v3cNbR2FaDE805bhnzIywYCatj5ax0/CTOPhiK1bsQBWmZTkWU3VooZ81EH2vTFLEnEjtuwCNVFGlS3k3xEOHr9Kii6vawUbH4xgOGeltzF1lvKrPxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IPnoIUI7ai8RRkcJ0ThqqrK6GDgOyZu6/wXjv4DcAWs=;
 b=MApmmJ131euaf9KKz8f0KIe5R8VWxvYcOUVo2AA57yerOG0pa+95SmWBNyBKUN3zLAjowA7lvkaYwqjijrUUyViEI3fFn7lZpBpmmoMclQjRfWWV/FMDxWJfgGQeJEmmI6gfs/NVBJbIhL0vAvrHlV7Z1koqdAtd8rxmWQ62pMjScV7VBok4vGAImRSGAz+fPYi5BRLpTSBZejnspYH3rSIbIaA6vrDYpnJfV6detCpwfzE3gWGihPkO+7hidnpwfi26g1oJcvypL5DS+kV14rpBRhJF+GcBh0jBxYx9OtzOIokO3PrXhjM/ZO5RRDv6Qn6DRdfytth/FT/qWQhBtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IPnoIUI7ai8RRkcJ0ThqqrK6GDgOyZu6/wXjv4DcAWs=;
 b=EvFT66wzpCTISM+Usb5PC9oE9cK6ba9VPL5E9bps73nPF1qZG+G4X3AZykVoJeiItWt/7ZghGPRuljxpFx8GhpLzWQ3RYoZFVsnXv7yUaRtda/nSKwqAkbsrvY13E3PkeCN9/+aiz0VNfjUIRZK4Q6NVzfhAdigoFWMXfZ3RvtOCeriRv92UXsczywtHLyQhDf8yMeknSpDgG8nYuShq8QBFleoTLjyeYjPsNI0K+1qY2kZME4XZyqQ0rNFH+9aVZMHxmIzGvXFEBeWd7pNtuCv2Pe0QC10x0NtqWKTATe/d5UlkTrpBiJVbw5A1QPaEwGKAZdvHlUXNzIUFkklCOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4a2e34e9-32e7-1fac-0ecb-7cf084a06a3c@suse.com>
Date: Tue, 20 Dec 2022 18:04:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC 2/7] x86/iommu: amd_iommu_perdev_intremap is AMD-Vi specific
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20221219063456.2017996-1-burzalodowa@gmail.com>
 <20221219063456.2017996-3-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221219063456.2017996-3-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0140.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBAPR04MB7222:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d9c46b4-775d-4552-2e58-08dae2ac5010
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qbII5bZLdj+6fMrntdHi+6sn74u1p7VpMguJ9CrWpoYDN4TuaRkX635Or4dfFWXebQtQ2lZQ1wf4mFYgN1NqaATb0e8E0on8qVr97ndN4rT6wDayMBF9ljAHbXHGN7hDAEsR4H4bh6ZYoMRXq7nhmt60IFyS6jDcXymbNtk/27AeTJUGZy+/ZK4LutjWYJTq+8WiqgENAlGCoRlgkc1bpHVGzfGmRZ/7Fqa0q4Yf25EBvofzv8aAx78/k00K9deFPPikIG1aNQey+2n/JueWh05lq1K/pGo9i1IAhw4+DZfWqmk2nnrMySTpiw+Dmh2GdH2XgOk52qmLZHuiREuLrYGMDeu6pNFZoWMGqsjiMnc8dWyawTpM626s8cG4F7BEJ39d17tEwW+UZYsei7KczZxftZ8aS0VZ440iLmvflVWFAywqpPFSrSvxv21XhDKEJk/2nw/ME516ZjwDrZ4kvjWddudQNxrpiUbaOE5gDCW+znXibPKBez7WHlWw7qt5QU+0RHDrlQOIqdAt4uvkE0qsbCsWcD/lqFHjzwEUJOqEJD6+KW7BAnPiybYC/5PjJ2CdKJaHobXtuKSdAtMHMDLfF/MSogtsQpeU5rYLqZGxIDUjHH4O8M8uwO7wJQdGLgqj9NrXoHnMtQuZO5CNpCoEy/z7EbWlFpT/u+8/gsGTT1L7B1HLQ5Q64pG7tRujhpqp4KJIApNx+Ft3xRTlsu/gG2diWXDENnAxY+epM4M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(396003)(39860400002)(136003)(346002)(366004)(451199015)(54906003)(316002)(66946007)(6916009)(31686004)(2906002)(38100700002)(478600001)(31696002)(66476007)(66556008)(86362001)(8676002)(4326008)(36756003)(8936002)(186003)(2616005)(6486002)(26005)(6506007)(6512007)(41300700001)(5660300002)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGhpQXZHNjdxd3RrUE1jSExRZy9EMWxFbURSSXc3QWlzdnNmdXJqcXFxdFh3?=
 =?utf-8?B?bDNCZmZSd1pxKy9UeWp4djBBZjkxMGsxK2s3dDhKdXZVeXlDWFhsTGRPcW9G?=
 =?utf-8?B?cGlIRVFCM25qNEN2VVRuT2VybERCZW12dno4NGNDOTZCb0pzVDlaOE5xaGUz?=
 =?utf-8?B?a0RYUmpGa2FzQzh5SitjZ0F4RmZKNTh3MS9NRzdqc2V1b0pRaWg0cjdoYjU5?=
 =?utf-8?B?RWVIS2w2T01ZVkJrekNpbVZQUGY1SE1jRktNQmpjOElVMmpFZm82OGRpWGdN?=
 =?utf-8?B?QWhjYTFsTXNLNWpmNDkyZzlVUXYzLzlkK0FBeStNa1A1dmlSL1lqemtrUDNw?=
 =?utf-8?B?eTVETld0THdUM0ROd0lRVEgyM0t4eXlvc1pTMFhwcDVjbkJMRmIvc2dPcmIz?=
 =?utf-8?B?ZWxURjBlazc5TjFOWDcyUWFKT1JoTWY0Y3VYVEV3OFdxMHlMS21SdWFhV0M2?=
 =?utf-8?B?SkpwdGRJb2srbVc0NmlaRG9KSU10TnJPYU1kUWd6ZVhEQmlJQjJrb2s2djYw?=
 =?utf-8?B?VjRyd09scS9PYUw0YWtpaFg0K25qak5PSHNSdHZJNW5mR2NCV01ubXNNQ1dH?=
 =?utf-8?B?ZXBWUm5jaWNwSlFxbko1dE1YbEtPcUdWcFROMlZkUVVEQW96WFhkMVpqZ0JT?=
 =?utf-8?B?Y0w0RjRsUkNBdUNuRU4vQkgvYkxDN3BleWFVQkVSdVYrTDJ0OXo1ME1UTldL?=
 =?utf-8?B?T1FxbzdXLzExbVI5eXk1NXNBNXZZUWQ4aURnaEZwOXZYOUpQVUxSODhtbm5Q?=
 =?utf-8?B?MEZ0cGVBRVdubGluK1d4MHZPWHQ5ZnNBMDlrTWxHNWlUZVl5bWVTdlBoNGVR?=
 =?utf-8?B?dmFRQ29EeE50M2M3bGZXZ3lETml3dGJLaHVqbGlMTlFxV2ozUk43eVkwOFRU?=
 =?utf-8?B?NTNucVplQXJXSzlpUWY2cXl2Mld3WFpDM0loR3JibDJwa3N4ZkFnWk1mWUxZ?=
 =?utf-8?B?dmhvdUdiNldWRUNadmpZMTBidUF5cC8zL0xiSERialMrSGdubUc2YThvbStr?=
 =?utf-8?B?VEtsa0lOU1h3eWk1eEFHWnd5M1dYUE4zUk9IS0JsLzJaMjU0bk53OTlELzIz?=
 =?utf-8?B?bDh1YzhSaEFpVmNjM1p5N0ZhUUJuM0o3TDNZSmZHVFRQNzlqUnEzRDBIV1BH?=
 =?utf-8?B?WFVDYmNxMUNBVVpRbWJlamRnYkdUZm05ZzJCc2czcEZrcWVSd25UU0doZ0E1?=
 =?utf-8?B?ZUkwdGVpNVZFVGJkNnVVaXNyenV2N2cwZStYOGFWclNxK1pFdzZHd1hZKzRX?=
 =?utf-8?B?WllJaThXU0pMT2FGS3pwbGR1TGN2QXpUTUZ5ZXRYbHdLQzdPYWx3Rk50TFMw?=
 =?utf-8?B?YmtNaEVKUEZzZng2RytRU241ZFBUWmp3VXRWNVdSa1UycmhvTERDU0RvSXZ5?=
 =?utf-8?B?bG5YTU8zbWJuR1RkSnFKb1ZnSHBoTDNxbFBKWG9IYU03ZEE2UWN0TTNOUldw?=
 =?utf-8?B?eUd0S2VlMUorSjRJZUkzcmtscFFrOWIrRnJOTlovUjY1dmljZ2RHQnFqM3RW?=
 =?utf-8?B?eTZtWkFrT2FiaktLMitrZ3NxMWNKaTd2OXNrQmZyUmErMUo5YXpSeUtsVXZC?=
 =?utf-8?B?OFYwNEpHaGRnMjBZNlNubUsyWU5qNDJpMVBuVzdBVGtHTU90OFNKbEllT3cw?=
 =?utf-8?B?YlFLMTgrNHhnYTFSSjdpdVpTZmZJT0hNWEMrYkJidXdOYy9ick51aEwxMnhL?=
 =?utf-8?B?YkVMaUZnc29uY1RpTFFSMGluQUJER2E5VlFGa2JHVHZhYXZLL0ZaOWFFZVEr?=
 =?utf-8?B?T0huc2NpN2FZNFJ1aXdnWndrR250UnRtaDhCN2NRLzRXaU1LcmkwMjV5eTZO?=
 =?utf-8?B?L21JUCtwc29yNzQzd3hxcEc0bzZHdHFrY2sxRG1zYkVWcVplbWlYRDljNTly?=
 =?utf-8?B?WGNsQVJOTEM3Z1JEVXdpemE4eE9KeUNIV1NaTlVNRWcxMDZMT2s4RDVXbHVp?=
 =?utf-8?B?VnMwZTJNSzVrV0FEalFRYkdVbFlNS1RVRHFkTlUwRElEbGx1YjlhajlxczlL?=
 =?utf-8?B?Q2xDN2ZiOEtuanFwcVpBVUR2NFpESEJ3QjcwL0tpN1pGaG5WdDZCZGhkaHlp?=
 =?utf-8?B?dFBnc1NuemZmUFVqVGxVWjVsUFBQK1FzMzdWZ1RLOS9KQnUzKzdPNEdWRHZQ?=
 =?utf-8?Q?FZHLhOmfV/3iIOfdTYNczWb3h?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d9c46b4-775d-4552-2e58-08dae2ac5010
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2022 17:04:53.3398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6rrNJpw1gMszXtoiJht2jRKeURS8qbLFpfTHthzSGvSw0n3Mv9at0xvIitlKP+m6W0dqUAt6WjxBzB/d9qpy2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7222

On 19.12.2022 07:34, Xenia Ragiadakou wrote:
> Move its definition to the AMD-Vi driver and use CONFIG_AMD_IOMMU
> to guard its usage in common code.
> 
> Take the opportunity to replace bool_t with bool and 1 with true.

Please further take the opportunity and use ...

> --- a/xen/drivers/passthrough/amd/iommu_init.c
> +++ b/xen/drivers/passthrough/amd/iommu_init.c
> @@ -36,6 +36,8 @@ static struct radix_tree_root ivrs_maps;
>  LIST_HEAD_READ_MOSTLY(amd_iommu_head);
>  bool_t iommuv2_enabled;
>  
> +bool __read_mostly amd_iommu_perdev_intremap = true;

... __ro_after_init here.

> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -104,7 +104,9 @@ static inline void clear_iommu_hap_pt_share(void)
>  }
>  
>  extern bool_t iommu_debug;
> -extern bool_t amd_iommu_perdev_intremap;
> +#ifdef CONFIG_AMD_IOMMU
> +extern bool amd_iommu_perdev_intremap;
> +#endif

We try to avoid such #ifdef-ary: There's no real harm from the declaration
being in scope; in the worst case the build will fail not at the compile,
but at the linking stage.

Jan

