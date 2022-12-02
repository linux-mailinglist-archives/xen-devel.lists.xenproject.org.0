Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CE5640281
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 09:51:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451569.709342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p11l9-00070I-AK; Fri, 02 Dec 2022 08:51:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451569.709342; Fri, 02 Dec 2022 08:51:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p11l9-0006yH-6G; Fri, 02 Dec 2022 08:51:03 +0000
Received: by outflank-mailman (input) for mailman id 451569;
 Fri, 02 Dec 2022 08:51:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JFaq=4A=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p11l7-0006y9-47
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 08:51:01 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062c.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 713e18da-721e-11ed-8fd2-01056ac49cbb;
 Fri, 02 Dec 2022 09:50:59 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8419.eurprd04.prod.outlook.com (2603:10a6:20b:3fc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Fri, 2 Dec
 2022 08:50:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5857.023; Fri, 2 Dec 2022
 08:50:58 +0000
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
X-Inumbo-ID: 713e18da-721e-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ka2YamZa1EOQIz/eHkLhzx2gqU60ungRVvsJByrAYhUwHqcn0kC4JZKKSTSt5IyNBNcW0InvLdVhJNqqw8hVYfgK2Rj05Zloqu/hJh+msv2lO9OWcf4QeKdBZ29NAyAIw0HNRyiY8NY+UGv3Kl9/KNG4SMm52xsR+BP9kn0nCoa7iGYBGQHnNybpuum/t95PfKeIKwzuHJyTR0moRkz/0SwNRfSu9PB9vGwsB+vS5X2iHGVmfOc45BXdcNgy4rI0zJomgs0Q0Q33Uuhzi1l0IMLN7JuTYXUQaD39w/mlIYukO73/eOvG5OwsV5L2zdMYmQ4QAU7r7rWeOoI/WVPHzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x4EusxBI2a2dLKs/G1rbP7W/QsxsBg3Q6GaEwmcIHgQ=;
 b=DhLmNcJw4vZwx1+2UbI1zzI8nLd9cVwPGmK7PEzkjFITVMq7uYfrJLUHRgDiwbbesAEOCdChqNFG9ozh9eIRS+MGx5g4Fy9Nsza33dQWlUecfBdxc+BCq/0mpCPMUl4ApshcbkJ4WrXIMWHwhIJjK+gRi6TKwu/F+5wE5SYBfbkDxUhrnO34QrvvShhyKnYO5SGOleezHRKPLXwM/KDJQ+jxf7qz5t7X9M/i564sUUhubjj8HfsPncPvshGdcy1pZsGNAsoheUyiBjhPjoiodGxWhkBUZIcstoPMCE0aEA2ochP8Am+79/tjsxf3ZDPJeAdcoZG7rN1ax4+7gsCiKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x4EusxBI2a2dLKs/G1rbP7W/QsxsBg3Q6GaEwmcIHgQ=;
 b=ELm8vWMrapAGaFKZII0RvwUgjmuinx7ipfcOUZTbvSkvEWQSWUvLvsVkVPdxRQpfGsJ5us0ifMeIFrQMqpBTkxaOLAn61uac72FgHVR/PBfFXgoVxWG36Xu8sshODdyEt5O5P6wckx8XesVBKHG9IaAEfGAuvisyYV4+pB70Umdlzp8ySNYpn7P1uxMLvcUefUCX7ofW/zQgDQ0WoFpGHWBrhrUNy3pcel3/qAPux0ZoamG1wQnT8ys8PrjWNu5Tsdk9vHuVNEbFrQLWXDEmsmLPUxExCGdmEChe33fyjuYXF78P797/h6F+Cv9K20G8j+OqxPxp7mOq1KL+RZo+hQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a26e7506-f83b-f761-5be2-d219e8bb3d3c@suse.com>
Date: Fri, 2 Dec 2022 09:50:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RFC PATCH 11/21] xen/arm: vsmmuv3: Attach Stage-1 configuration
 to SMMUv3 hardware
Content-Language: en-US
To: Rahul Singh <rahul.singh@arm.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1669888522.git.rahul.singh@arm.com>
 <b0873a8cf229143544388a90334edd7c96bc78c4.1669888522.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b0873a8cf229143544388a90334edd7c96bc78c4.1669888522.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0165.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8419:EE_
X-MS-Office365-Filtering-Correlation-Id: 49236def-8f95-46f6-9768-08dad44254b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	x62xlC7ZEMiJ5eLJLNeu+/VjLx3WWg2sdjnvZzPUOvaYptLRMwIzkofI4ypIf8DQCmU9xwhFEun7elxlSqKM5PUsIC/MJ+amds9sUF8zhblJG3GP8UG3jCwhQi79hZoR8G95DVh8BLBCaQBVXsTxxyauTdfuKLc/ajv72OK49yxaFoj/Z1nTR8m5TK3MLNCv7sJSiZnDuxM5NKabyFSKmXmIZh5lnI/P3WjYlxBGLX0DMsT15xIRLhPywqUeCiW2nzdPyjiEkX92gcKTIqyhPIIICoYC2dk4KwGmxvQ+R6Z86gpbaWDG33I4akVA4BHTvWYiuuM4mcQvlFiRFV+3IcWqR68OmFaGR4cYadGdD6yRvtnRdpWFsGMgD7qd5Y4hY5NQJfSZ+wAChp7QV+sJJsQNbXc8BvRvHR89jIlrtpDEF6kYFi9mDeViU0d3OnPqdbnMch0iWzUF9SE78ic3J6EnfrG+CsaLquA3KqFUDY279w1i1SbQHXIB6fiIuNebti1huthNH2W62SNyAviXdHo2OTPO+MukZ0P+1t9VYAq8PSNW4KQoJ9tsI1XZESKIypgseelaVVLHVuAJTT6mFuCPYGqbN/OXPEnnMh/qFOfuUYRt+VCdPoy+2G0wqcEXkCxdi4Nc3+6bVecmMTFCqxRnEkOEmOt8aQ6AsFb1ptYTo/sedt/UA6eyybW42m7ZJtXFyCHaQiqLBmHKXayuK/2yk46rj6RSnm10g+MexoA5C65SQYsy5MFI8pOjBd3sg+Vl/4NPA6sX32ZFkLCpMtSZGqEO4KWLepEwvYrTrf4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(346002)(396003)(39860400002)(366004)(376002)(451199015)(6506007)(53546011)(6486002)(54906003)(186003)(6512007)(26005)(478600001)(316002)(6916009)(4326008)(66476007)(8676002)(31686004)(66946007)(66556008)(2616005)(4744005)(5660300002)(8936002)(2906002)(36756003)(41300700001)(38100700002)(86362001)(31696002)(45980500001)(43740500002)(414714003)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGFxMjhYTzBCOXdKdE5BNWJDamNlc212UG5kT05YOWFrbUQ5NjhkQ1hqN0Fs?=
 =?utf-8?B?Y0tPUmgrMldtTDJSTW9aMVgyZG85aFRHZ0VJM2MrY1dPdnhqcDJjOEdFUktr?=
 =?utf-8?B?RmNob0RqcjVBVk45SVhWNGl4NW9aanhwb0IvRHljSE5wT0NNcm95MURjQ05F?=
 =?utf-8?B?ZFRWZTFtU0ZYYmZUVXB1UGJ0bE9JMVFjSXRndmxoQjNmMEpGY0szYnJzQkdS?=
 =?utf-8?B?SmNxa09Sc1llT2FGSHNCSzVBbSs0TW1JYnQ0U3VzNSsrOHdRU3dNbWxlUXEz?=
 =?utf-8?B?SHY0aXVSZUZCWHBqRlBtMGp5Ni9wVGdEVy9lbnpuUXhFQm5tNFpKZXFLZTJM?=
 =?utf-8?B?TmVnYm5yVFRVQXZIUlJoRDRWc2NmQnVkU1ZxKyt6RVk0WGdJNDN1ZThHRk9p?=
 =?utf-8?B?YlVPMFFmWlVjajM4NkVDdVdvanJUWkVjUElYVkZwRWhGV2tjdEJ2cE1GUlla?=
 =?utf-8?B?S3ZCME91alV0UnZjVE1qYWU5UTZDZ25odlR3L25YeEthUHM1dS9HZnFuVW9N?=
 =?utf-8?B?YXVPQmhyYkdQODMxSmh5UStwZkgvOWRnbnFqVTRvNDhMMjgrVWRNWXV1b2d0?=
 =?utf-8?B?U1dtRXBzZHFKUWExLzhuT3QzRTNPSExrNjcyczdqbmVVcjRLRVhNekZab1dS?=
 =?utf-8?B?bXF3T3YzVnFFQ25jMHdvZWVuaUtBMGdpRXZqUlBMMTN2NTUxT1dlbUw2SDhq?=
 =?utf-8?B?WkhlQkRJbkkzS1lTRjJOdFBIcHlNdE9rSkgxN29rUmdWQUtHbk13eDhwNWEv?=
 =?utf-8?B?d0RjTzBQNm9Yc00wZlNBSDkzakIrcDlaT2hvSDYvT21aNFpaUTlBQXZJeVhp?=
 =?utf-8?B?VlFmOERUWndRa3pLYWJod05PVUJQMmJNZ1RUVVNzOFJVSXd2SFBkYms0SEx5?=
 =?utf-8?B?eWdQcWNSelVLWVI1QUpaR0pFUEJGdHc1bzNYQmlpSDdKRmM5eWpvZ0hhRENZ?=
 =?utf-8?B?SUNCY0tRT1BHeWVORlhzeFVtUlowcnJZZlRRV1pMSjVTQ2lnTkdjc1pydUEy?=
 =?utf-8?B?Q3RSMEN5Ky91ZGt6ZmZlRmhsRmNsNU9OWnY2Ty9jYy9ZVFVLM1VkeXJvQUZQ?=
 =?utf-8?B?YnFsV0VlUU9zMWNod3NQZ0RUaFY3RGlieW5RaC8wcHJwWFVjTEQvdEhVSzkr?=
 =?utf-8?B?bnRPbUZrVFg2ZEJJVGtOcEVkc0xodld2K0FQa3BaNkhXU052MDdlQUh2YmhV?=
 =?utf-8?B?T1prZlFmQjFhaXhSUS9PR0JCWEI3eitQYWgxeHZZdDFCRlVVZ2l3dGZsakwy?=
 =?utf-8?B?YU0rdHd1NFRQVkQwaHJVR1VVNlJzSHFNcTBNKytqai9vOVdhbnZwdnZlTFJE?=
 =?utf-8?B?em9OLy9ETnhLcngvak5ybVNydmZCN2VaK0pTOURlV2VMa2ZuWXVsRHJ6VStz?=
 =?utf-8?B?Rmt1ZUtmUVRZY3Y1Qml6VDVDREExYnlWVnR6bUlpa3IzVlZxU29RN3lFczI2?=
 =?utf-8?B?QVBIMUFUeER1TjQ0bE5PN3JXbHJhTGdBM0kxZ25SVGdpWXhTTWx1RVVjRncz?=
 =?utf-8?B?M29sSTk5bEtqbXdyR2tjcjJmWG9Dbkp4RDN5QTBPQ3Z5QndWckU4TXNTeDhC?=
 =?utf-8?B?VHJqYm96bjN2WHBDYnZ1TnQzWjVWamlSdW1KazY4RzdHTm04a1NjM21nWkYv?=
 =?utf-8?B?RnE1V3VLd0ZXT0NJcUpYSU9wTjUxclVDWjg1d1B3R3g5Sjd6TUNGbW5DTVdJ?=
 =?utf-8?B?STdQaHNFSkFNMWRtTS9hdk9qWnAyQ3hQcHNlVy83bXZPZHludXY1dVMweHpk?=
 =?utf-8?B?ZE4zWHJIaXdHbmpiRWxGSkJDelhOMVFuSjZqczV0NUlyYm40TDR2K2ZkcGRx?=
 =?utf-8?B?YjVCamhRaFFoU1VZcDBGRWxRN29EWFYrQUJCR1BGeFkyeHAxbkFlblAwN2NU?=
 =?utf-8?B?a2lzeXIrUWp6L2lVSTFYaGZwUUh5dVFGSExsWDcrWnE5WFJuVHZDOHRPVzdE?=
 =?utf-8?B?RzFwUkZZVFNkYmFYTUZsU0FpOUgwcmJlUGpUcUhkdjdqQko0Z2xWeXFDb1pl?=
 =?utf-8?B?MGpPcFhvRDdXMnVuZm5saFhLTElzd1l6ZTBKQlJKbzJadVJJTklpT3BFbnBy?=
 =?utf-8?B?V1IrQ05vR2UwdFJhTW1UODhOWUJOSHE0dEIxOGxEYU9TZVYzS0VkaGJMN2x2?=
 =?utf-8?Q?lkO1K8pbkZJrmZOwKs5pPv/EP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49236def-8f95-46f6-9768-08dad44254b1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2022 08:50:58.1138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ba69/hSUCIoOM5qo4HpdzCa//xZQ5v2IONIV4oBEfILPfGpKxU6KJmBXJJnqHQyPkJTTkGM1VdbUxkha687Z+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8419

On 01.12.2022 17:02, Rahul Singh wrote:
> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -230,6 +230,15 @@ int iommu_do_dt_domctl(struct xen_domctl *, struct domain *,
>  
>  #endif /* HAS_DEVICE_TREE */
>  
> +#ifdef CONFIG_ARM
> +struct iommu_guest_config {
> +    paddr_t     s1ctxptr;
> +    uint8_t     config;
> +    uint8_t     s1fmt;
> +    uint8_t     s1cdmax;
> +};
> +#endif /* CONFIG_ARM */

Perhaps rather CONFIG_VIRTUAL_IOMMU?

Jan


