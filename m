Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C03416D0D
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 09:45:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194975.347403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTft3-0005Nq-Dv; Fri, 24 Sep 2021 07:44:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194975.347403; Fri, 24 Sep 2021 07:44:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTft3-0005Ki-AF; Fri, 24 Sep 2021 07:44:49 +0000
Received: by outflank-mailman (input) for mailman id 194975;
 Fri, 24 Sep 2021 07:44:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wINm=OO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mTft1-0005Kc-OK
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 07:44:47 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 489dd967-1d0b-11ec-baad-12813bfff9fa;
 Fri, 24 Sep 2021 07:44:46 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-9-aHLWf5b9OcmtMVFSng3zDA-1;
 Fri, 24 Sep 2021 09:44:44 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7037.eurprd04.prod.outlook.com (2603:10a6:800:125::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Fri, 24 Sep
 2021 07:44:42 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 07:44:42 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0047.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.8 via Frontend Transport; Fri, 24 Sep 2021 07:44:41 +0000
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
X-Inumbo-ID: 489dd967-1d0b-11ec-baad-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632469485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bY4915iIBcBMnu2PBv7qqO8mlIYYQFdth88fwkacaFQ=;
	b=W+ZpUUPWqc6a+tPizLAcMEYdBh/+EvSwg0/DxBYdJGhbkgxJqkUfT/mBUV0VnTROSw1Bw5
	+btKEJeh3DD+8FD+ozwToN6H/BcvcjV057A9bDdsE/6zSue4XTsADh4hLrGVvKA6GAP3QQ
	yzoCt1jHriEa46q89TxAkaB9R6Xr9XY=
X-MC-Unique: aHLWf5b9OcmtMVFSng3zDA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kdnfHjkf2DXJsdaeTOB+SvNYjmHtDAzZ+Tq/PD2AldnjauzzXlr+m4noIWQEPYHFL0/6QtH4EXkkX3PE0YVz+osKRrKqIRk4y3NMaQHI6bjECAb9Q6fjwKBYSugXjRBJaLrc9O637uNPXWVtNLTjJgfRSHzW9jsETbLlXGY8GgaGQvY82UZfihR98ASutbxga6Nl+OboFbJ38D2aT3ZEr8jp+CnYMQwF5UQm/JaVvNTUddtsYlkmIeISLsOA3UAuhD54U0xfLXpoCtATo5ycGRpzE8PnNA5Tv7xP6aFm0nfXpCMPAhKZJIVJXLdWk0ja8yj9fkQXyknNPo/hbg4Xgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=bY4915iIBcBMnu2PBv7qqO8mlIYYQFdth88fwkacaFQ=;
 b=ESK+Nkd4Cyo7vI487aHccAyrI+LCD0miU2YaKbpb6DvmeRWJvH4yn3XwU+1lUJiNsGry0BxTJjoi1RHKIlwin58nQQI3DRB/byTIJfPiI26ns82kOf0ngPobkvYLhkyamfF35iq7v7zAssHTXz0TzUat302igOR1DiE965Gkh49N1A37LcqGZojjuL+6GIpKMA0saNjyLECsauZqs/cj2/O2L0sRDuePrN9seuebUKFbhfk8PSRSFOcdZcGcVkIGnNKpC9g62nOAmwOtN9LmgeJv6j9h073arb+baGIr2zJ9R6E0MBa+ECEJIkfBMpV0ItKULx84Ki69CCVWml3/iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 14/17] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
To: Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com, andre.przywara@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1632307952.git.rahul.singh@arm.com>
 <06e0cf146ca4d82526282c1960177fad97346ad5.1632307952.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fe23eeb0-c31f-0525-dcda-f7cf548ea0cf@suse.com>
Date: Fri, 24 Sep 2021 09:44:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <06e0cf146ca4d82526282c1960177fad97346ad5.1632307952.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0047.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::10) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 301a8b15-7b5e-4e13-8f06-08d97f2f2bae
X-MS-TrafficTypeDiagnostic: VI1PR04MB7037:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB70371C30E5A04787B4A057CAB3A49@VI1PR04MB7037.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CFmHxB5F7g6HzyPhEKlWx0dmz0XyHIC6idcgT6csarKvrTyLcmilZE4pfpp9STIVcTNf1GwoQWSomKFNcG0yMJAMHZL3a5jZFIqQfkExlplUwYcWL1X7AsDkRcvUEdFJ6wDpEJ0uK+d03mZSjvqzGluomTD47vSoq9E6w6UOyVPWVTyridGNcStoexTCIlQ8L1sG1OIgxeVuHD9PGRLMEjlO8Ypk5q7sRG9J6jqUVCMuJHz0HMOlXl2KDiBWkwFSoJGqfFRqLL+HkPHvL526IkX1D9PKieKN/zCipPCPKuCaCOgWGyetoV8wCtkEnelif3K4VbJq7u77ywX4UpwES0GvRZt/c7ndfQy5FzmOV7vxDJYcO77K9AGVM9piecXKpOGd0zMlxSD6saJNYhNdnaz6vuifM9SHFoZwlyeroV3KNk8DG6G2fBmYrUlRWyEv57pr9baekePIERMJrHklAnOsm4unvGA46CEFv+26h74ojDqtzc6eWhzoCrpYdlswFFNTcn9FZhrEpuLFg6Rnnh1lPGWlQDbeoxXq32l8k9wlpot3mdOwAevEBqqGNcOVljT0CwPn+LhutgAysRHcbIeTuMKVUBnMFf5/7JfGen/J8SsgtDhAO4FeYahkiCCROjgD66lR8Npdy99h0ymVwcptfTq5R9v4i6lYS3A3JK9gIfmw3uKSHgGWl1lX9pyV+jGc2F3+rxeCWY2jC1q+H7aNn04N5MkCTzXhllLHDai+MCcX6DdEpIjcCwDLiNoa
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(6486002)(7416002)(36756003)(86362001)(66556008)(8676002)(956004)(54906003)(66946007)(31686004)(5660300002)(6916009)(16576012)(2616005)(2906002)(508600001)(38100700002)(53546011)(8936002)(186003)(31696002)(316002)(66476007)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ak9jNEdhNk4vZFFVWEFaUzVuNFdwN21NdHc0a2hEVmYvbmE0TUg1djFUV0d6?=
 =?utf-8?B?N1NSNnVFeEhsR2dlRDBxWW1WNmVzR0swYWdXU2lJZjhlSDhmTk9KejU4M1Rm?=
 =?utf-8?B?ZTFvanlkbVZDcFZ5L0ZKT3hFWFdUMXpxMWpRZjRRdUpGY3ZCTW5OY2E1VEFH?=
 =?utf-8?B?dWgxdm9aem9mdGNUZjdFSlJJL21xa29ycGVUdjVxSEl6ekV4bjMrMkhGV2dn?=
 =?utf-8?B?TkVtL2FGeXZmSFdyOWh0QzJjYno5WTlxRUFVbkxzNXlrajg2Yk1RY2FmWEF1?=
 =?utf-8?B?Y1A2ckxZT0dGa2F6TStIaExKL2tpcUlnc1ZQUVBtcjlhaEViL0tQTENnTkVm?=
 =?utf-8?B?dW8xUDJCaXFxajA2ZjlpdjBlQlNhcUFyek1RL2lpcEJPQlo4Wjc0a0hqd2Rn?=
 =?utf-8?B?MC8vbDNGcjM5Y09QUXBKclFQUGFKMGxNWDV2WEV2SHFMbTRsczYwMkJTQ2xV?=
 =?utf-8?B?aGgrbWFoOFBranh0c3NqRXhYWmRIV3g0ZjlKZzRLcjNpdmRzLzFvL0JIdzBw?=
 =?utf-8?B?b29aNUx0eEt3aGEwUDh6VHZrTFUycjdwMUFIRURWQmRqa0ZUazkrRmVyRUw3?=
 =?utf-8?B?VEQzcU45d0o0MjQxeldKSWhqVmhhMTVxMEszemF0R3F3anVjMVNRZlhYNUU3?=
 =?utf-8?B?U1FScEN1ZzRmV3RIL0E5cmgvYXdocG85bDBFd2xLbjZMelVDQzRWR2lYMjdh?=
 =?utf-8?B?bkdabnNvbzR4VnVVMUpOcnJBclRvLytsc0tZUldGMVVPUFVTanJvSGNrWTM3?=
 =?utf-8?B?NnpSRDVYVndoUmFnSVhyRlVkQXJHc29VdkFBdDV3YVh4TCsyODhBZGVGZ0g5?=
 =?utf-8?B?T1ErVmVsZ1F6eGptMEpWSUFtWnpnSTZNeSsrR0M5Q2FjeTNWQ2VPVi8zQXoz?=
 =?utf-8?B?UnRZWEpCRU9JMkg1dUtaOHhZREtodFFEbE9wSVl3TTMwOGUxV0kvK3BWb3ZX?=
 =?utf-8?B?QUlGcDRIMTE4WHZkY0NxTktoMFoyTldGY2tmRE85ZnRUcERVRklqWmpmWGFv?=
 =?utf-8?B?NEt1ejRBVlUxYnNpWmE4dTEwV2RHL2E3OXRTUDJQQ0dDNXQrQlpBbW1XTnNU?=
 =?utf-8?B?RHBnNFZMWHJaeUJ2OC8vaFpnc3pmMzNwSFk4VTJjdzk1U0Q4Q0hDQjVzK3Vz?=
 =?utf-8?B?MUgyTmhRTEhTVUFVcmNBQlk3cW5hQ3N3NnJEZXdPVE16eHBKY0lRYVkyQkg2?=
 =?utf-8?B?cDU1OXAxSExNcHJLaGFqZjZ6NkpWWU5nVWtqTWtteVlYVGU2WjNUTVFPTlZ4?=
 =?utf-8?B?SFNnWDFsMmZIRVdIa1BPQ2NhS3R4QjhXcFBIdHB3QmsvdnE2VENBdFBPRnNH?=
 =?utf-8?B?bFFaWjY1WmFnV2RDYzEveVRNaVd4M1RURzIyK0haYjEwckljZTcwOStpR2oy?=
 =?utf-8?B?MXdLZUJON1hBU2hkUUsrMWtoNmliWXpRSjZVT0pSNXd4K2MrUm1wcDFhd0wv?=
 =?utf-8?B?S2hOdlVKanRHNFE5b1FNNzhRLzdLeVp6a0tWQkxHVDlZV0ZUc0ZHUWd6bkVC?=
 =?utf-8?B?VzliTXBBYkp5cmVjRU8wdDRNd0tTRk45U1d5SzErQ2NIdmlzN0xWdUxhQ0Y4?=
 =?utf-8?B?bENiRU1oRXNKLzhLK3lxLzExdlMrczhORUVJZ2xzRDVhM2lpcDF0KzlWUFQ4?=
 =?utf-8?B?Z04vaENwemJvZjBJUEl3WHgrVzkxZkxIRkRUSnFzSWVwbWJZREtpdlJSQWFK?=
 =?utf-8?B?RXltV1ZXUmpCb09rb2xXRjM4U1dIaXl0K1FvMUdsVS9SRG0zbENWOFVBbGJC?=
 =?utf-8?Q?iHyyJzfHmD35bybtp6PEwoXkgayhTVN4Qa7uRfc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 301a8b15-7b5e-4e13-8f06-08d97f2f2bae
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 07:44:42.3456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6kqDozmzhNoxbCyMpLtqkofLy4d1YTd5XV6nhhzSqJCHOb+NYJbTvhF4HXx965ZUJvGxohzyaKY0JQJTw4Cpgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7037

On 22.09.2021 13:35, Rahul Singh wrote:
> @@ -623,7 +624,7 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>      unsigned int max_vcpus;
>  
>      /* HVM and HAP must be set. IOMMU may or may not be */
> -    if ( (config->flags & ~XEN_DOMCTL_CDF_iommu) !=
> +    if ( (config->flags & ~XEN_DOMCTL_CDF_iommu & ~XEN_DOMCTL_CDF_vpci) !=
>           (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap) )
>      {
>          dprintk(XENLOG_INFO, "Unsupported configuration %#x\n",

While you accept the new flag here and ...

> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -483,7 +483,7 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
>           ~(XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
>             XEN_DOMCTL_CDF_s3_integrity | XEN_DOMCTL_CDF_oos_off |
>             XEN_DOMCTL_CDF_xs_domain | XEN_DOMCTL_CDF_iommu |
> -           XEN_DOMCTL_CDF_nested_virt) )
> +           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpci) )
>      {
>          dprintk(XENLOG_INFO, "Unknown CDF flags %#x\n", config->flags);
>          return -EINVAL;

... here, you need to somehow reject it on x86, until DomU support
there gets added (unless I have misunderstood things and you're
aiming at enabing that support for x86 here at the same time). I
cannot spot existing code which would take care of such a newly
added flag.

> --- a/xen/include/asm-x86/pci.h
> +++ b/xen/include/asm-x86/pci.h
> @@ -6,8 +6,6 @@
>  #define CF8_ADDR_HI(cf8) (  ((cf8) & 0x0f000000) >> 16)
>  #define CF8_ENABLED(cf8) (!!((cf8) & 0x80000000))
>  
> -#define MMCFG_BDF(addr)  ( ((addr) & 0x0ffff000) >> 12)

While there was a reason for the padding blank after the first
opening parentheses here, ...

> --- a/xen/include/xen/pci.h
> +++ b/xen/include/xen/pci.h
> @@ -41,6 +41,8 @@
>  #define PCI_SBDF3(s,b,df) \
>      ((pci_sbdf_t){ .sbdf = (((s) & 0xffff) << 16) | PCI_BDF2(b, df) })
>  
> +#define MMCFG_BDF(addr)  ( ((addr) & 0x0ffff000) >> 12)

... that blank ends up bogus here.

Jan


