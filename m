Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8CE782CD7
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 17:00:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587637.918984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY6NT-0007J9-6M; Mon, 21 Aug 2023 14:59:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587637.918984; Mon, 21 Aug 2023 14:59:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY6NT-0007HG-39; Mon, 21 Aug 2023 14:59:35 +0000
Received: by outflank-mailman (input) for mailman id 587637;
 Mon, 21 Aug 2023 14:59:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=phPX=EG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qY6NS-0007H8-BA
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 14:59:34 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20613.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5400432f-4033-11ee-9b0c-b553b5be7939;
 Mon, 21 Aug 2023 16:59:29 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBAPR04MB7352.eurprd04.prod.outlook.com (2603:10a6:10:1a8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 14:59:26 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.029; Mon, 21 Aug 2023
 14:59:26 +0000
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
X-Inumbo-ID: 5400432f-4033-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jUp9prpbGLGvWfMuH2KsB8Tx3QLQv95zp5FIuTd9H8gKFMqAoWNkjxIVZBnhzqEsdmNLtDUaF1fQ4Pbi++XI4ky4kXR26DqcfWM/OxyVOrZRxHpzHbblVGyi1DPl/OMift7GaLAgUqnPDPbQjPKyY7qZUYXNg8pOj/RK9Eg3JjkTn2Zdt8JFk8UyEBzsmccZMoXNVCk0E/Sfz7t20FxgR21ndGFrArbjj/eIDJkylFX+K6M+bNuBuI7YHpxgdYWkwV6h9/cji1Xz/dBfpUs7mO5WZBcu1TDsIVI96EktbECkTIpVcjfGSWiLgkqOfsefFyyt8Zhx0YppwpyKWSKSig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+r66bocOA0UbS6mOD9eyfcR2PTGKLa0wDuycQBVmTXU=;
 b=GSR20QT3RTGSofOWcXhAhKizLiLbs75xA9x4KGCB9/aWxWQwEtKULoGEorE15lMJ4Uqce+RQ/jWdIAKOYIF+M0prmTLLBEEASn32RZ4Z1mlol9qHjbgm8vvsmfEcVunFEbh7c7udFfHiXCf7ZvuQykfQyZhNmQIlA9dU+foEiElZha4I29iblq0JzvxGo+pLLg6Q1A5d7AFmi+y+d+gVcXDCyRVAFxDWqsHn3cQjXuQWvWoFiQ95Av9a25zE3tmH+sF82ZR31AOmVQyfLaXeN/PymGOzHV6p74CA3bcn0sC2kloFtTMoCSDwabfZw8s2Y8ba5Ntse+zrELFAG3ErYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+r66bocOA0UbS6mOD9eyfcR2PTGKLa0wDuycQBVmTXU=;
 b=3/UrRNfg3IhfP1RZ5ylRMUOIe/XIYCrJ7WNVAvVGUGNCljRxbDBLmQRZrZlb85fDo1U1gD6SjK5FhR+x5ychNlV5FGtVUI6USvmpPTN30vGbFVO6Rq3Qtd4dLpLXsjSeW6G9aCVzYGOE8fWAxjc0nV2bDjuSkITQeLX9+knvBPG4DFOoVAM3XZ6n6FNgAkIYjTMgpoR0Cy0Nq7h450FZ5c9LM1BaQEel+CqGIO3x7QAY7KhpoD1nEONd3hRKek3/m4FtxA4yn7G3ADaU/pdtRL6WIkFi1HLogue8+nRlNqDe5qYdHLIduvFdSBqWhKfQM4xvmuaAgE6IKTlas/Da9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <57ced9f0-95b8-a560-cac9-08d58e2f0b86@suse.com>
Date: Mon, 21 Aug 2023 16:59:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Ping: [PATCH] mem-sharing: move (x86) / drop (Arm)
 arch_dump_shared_mem_info()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b0a49d20-8e82-8264-8241-86a108139682@suse.com>
In-Reply-To: <b0a49d20-8e82-8264-8241-86a108139682@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0018.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::28)
 To DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBAPR04MB7352:EE_
X-MS-Office365-Filtering-Correlation-Id: f5143953-2bd9-434c-545c-08dba257368e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xbb/eFjddi309NuV1z0XkeO/dOsd7PDohlWaGyC9FYNHkaGxsBeJSOQKJkftaM+j5zlwAA83i95lwEleCEyVvl4dET3pqAKAty0q6jd6inOEsaWoGL8ey25ezygpb4hgHT96dtPUQ0q6FPjIjSZiomaftsAu3dngFbdKAB3Sl2C5aXbOWN+QUpS5uA4MVMji/048vyaI4A7Gz5NXqMSArbSvgVe0xJiWwSJ9qqQ/kVeP3ziDrXeR2e2KdJnJqO4zrJmkj+fQTWmI9hULqCzemVYtu9gfBbopMP/IjZNZ47ZGlFjTKPpFxBN6Zqwhn5vHwt9sEzxmwYVLM/50tCjhRsRg07bHbTx046RE85I3ZYwJ4KMesHLQFZYDYK00aiKuHrpxhoB0sGUIGYYLoR1aNNmwjBAATky9MN9u3E33Vbnro1Pkc6d3JKSQ5gJ2tI9IDLbZH+dslLBEENu2zleAToqit4g5VwrOkGKF89kzpUoM+STefsNoCS5+hsdBhidX+lmvguliCOTDgnJS+28tngzqPsrGVh5dMOQ1H3cs7PYYQixGeZBKgB6FzrAE6uqDeDSNrZsBOPO7uyYSHnw63Lq7vtIGta+llNyDV/eKjzMATW4G0nF/rsJJ78bDHh3hvRzvw8PTMFJS6P3se40PRg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39850400004)(366004)(376002)(136003)(396003)(451199024)(186009)(1800799009)(2906002)(7416002)(53546011)(38100700002)(6506007)(6486002)(83380400001)(5660300002)(26005)(86362001)(31686004)(31696002)(8676002)(2616005)(8936002)(4326008)(316002)(66946007)(6512007)(54906003)(6916009)(66556008)(66476007)(478600001)(36756003)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3FWc3NRNXBJZnlOU21rTE5LR2tkN3QwUXdSYzJybmpBNDBTb2xsQkpBTStT?=
 =?utf-8?B?WkxETks0eGNrUncvQnVKZ01vQ2lkUTZRQ2daaHJJbU9Mam5nay9tbGVvSGdq?=
 =?utf-8?B?TlFpZGRUYjJGZENHQnZmWm4vcnorUS9BNkcxU05NQ3lpUkJuTXB2T3J3Q2lP?=
 =?utf-8?B?UUY3NXd1c2g5Rk0rNkMwRG8rM3dBNXpFWVQyS0dNTkVuNm43RVZ3cFlaVVRI?=
 =?utf-8?B?aDlXakdWSktEVjl4TmRWQ3JjVGpSMHZ1MERhZDk5NVpJZDlYZnNDSjlpL01a?=
 =?utf-8?B?c0N2eVgwdXpHYXJxN1YwVTJldFFoZFNOaC9nVExUem1XdGlrRGdvYkwwbmZD?=
 =?utf-8?B?a3BMekZFMVUwcGhsbzZ6Tkt0OHdNZGxnRHdlazF5TndWSGd6YjZIN2FuRm9q?=
 =?utf-8?B?aDVFSDJ1ZnJmY2Fkd3hlMW9UdDMxWDNGOXNuSEpBVWR2NlVINFVia1FNbVFJ?=
 =?utf-8?B?ZDF3aUJxWjl2YUxiN3pONGg0RE8xQURNaFJrcmg2Qjh0N1o4dER4QWxqU1dy?=
 =?utf-8?B?VjN1S29adUtUYlpxQXhWYS9TSWxFNFdJQzNXdVFRbnRYSVdFTE15WU9CUXBJ?=
 =?utf-8?B?ZzZ4N0d1UHBRejhwbTZVdEhqNDJoTVZXaHcyMWNkUnA5LzVKbWkxZkNWUkpC?=
 =?utf-8?B?V0pJY2lERVlBWFV3YW56UGI2QU8vK1V4WWQ2TEliYzJjTXhhbi9hdzV4elQw?=
 =?utf-8?B?VHNOMzZhcm1JR0RWNmxzekRRQlh3d2NEc2IrQXcyK05BdHBaT3NBRlFJL1BW?=
 =?utf-8?B?QVd1NFVSeTJLb1BiSjNjUE5JYWc2eU9idDltTU1lbFhsa1FlK0ViLzFFRVEv?=
 =?utf-8?B?RXZzdjJ5R2Iycjl4TFJoaFRzeWZMNnkxSXgrYmRkVHVkZWJEMDM1Q2tHci8w?=
 =?utf-8?B?c3BMNlU5SndaQkhna2tPaFE1OGc5ekVHbXdpUC9QcHdXQXdzZTRLdVVSaTBa?=
 =?utf-8?B?QnB1cWo4OEtFWUppVkNvZGtjR2F2RUJSM0V2VDJ5bmJPL3dKVlEwTUw2ZmMz?=
 =?utf-8?B?NUUzV2lzZ2hlRnltTXFiOHB4MnNobVJ1Z29MWE5wVnFoL1RRNkNkVFFzVmtU?=
 =?utf-8?B?VTNZTGpzYnlvTXBLQ2FHVm5zdHU1TTBXaEhoRmJpcjZXSjFZd1JRYkpKMXZT?=
 =?utf-8?B?OURqY1RIT3ZGNG84TTk4b3J1eFFkbFY0V3BTQ3Z3c3oyUFVkalJaaTlKaGpv?=
 =?utf-8?B?OWdXR0dZSXpHSnNEaWhkcEcySGw5a2wzdUVLdTJ5eEtncW14OTN4YkRYcnYw?=
 =?utf-8?B?TWVRTUFPNVlKakFFaS94dFNMcE1DSmpZUmYzMWpsZis0NHp0L0g4TksrdExx?=
 =?utf-8?B?KzJ3QWx6MEY3Y0xKYlNnNnhXdFh6c3FtTUpIMS92K0xyY0tKcXlpQnpxYTA5?=
 =?utf-8?B?azN5aUZ1ZWtaaHhDNDhNNlNzN0w4TFJoYXJsTTFRQmdZU2NjNm5pUS9NWUcr?=
 =?utf-8?B?VW5LMDF3SElKNi9jZFFLN1R4V0grczh0QnJWekRxc2FzT1RiR09RelZVWFJ1?=
 =?utf-8?B?RVA5cGU5bElGTGVSQnlJcmNIdUNyWmJYYXQ3RFhiazF3YUhKdzRRbnpDMHpt?=
 =?utf-8?B?MlFPYjFSQ2gwWXdBMGF1L0ZiS2JSRDAvdFBEN0ZrM2hLd0hhTzNzR3pScDNF?=
 =?utf-8?B?UmRzQXdBd1ZSZ0ZFR3JGMjM5VXM3bDZoSU1tZUhaQ1NYSURmeVdPVDFBeTda?=
 =?utf-8?B?eHhQbWNORjljc0dDenhWS0tja01ENytMZG9rR25rd3VyVWtMNndWUmpLQWRi?=
 =?utf-8?B?VnhGTFZJMnFOSlJjY1B6NWc0QTBZcWNYUmp1WFhyRVh0SjBHblNXN2F5ZWV4?=
 =?utf-8?B?ZXZJcUlNUkZqM2NnNnZuZVhrUlBOdTQwMzhXZWM4N0xnSjg3VVVudmdjUU41?=
 =?utf-8?B?ZFJXNWJzZVlkZm5MRVNWMkJjRS9ielE0a2xYOWZaSlpUSkhXdm9pMFIyWXMx?=
 =?utf-8?B?YVRyNk5qWXBxd1ZtZlFvM3lHQWdNVEc2bk0rMEVEdE1PRE1meWUwdVkwdVkz?=
 =?utf-8?B?TWRRQXVpM01hbHl4aWxDK1o5WFEzUXZMSkJUZmhaTFpJRjNlNmp5TW4xVm5L?=
 =?utf-8?B?OFJmT0xUekU1N0grRVlHa0dkekcwT2RibzIzRmdobE5LU1ltQmZiUVVwbDdB?=
 =?utf-8?Q?tTPg+UsJJcobKEul12fpriDCQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5143953-2bd9-434c-545c-08dba257368e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 14:59:26.6512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XxolXgZHIzdQavrJFnFFcohvNmfgWWjQKwVdrhTYp4gGbvqzAdlUqNPm6ez+iyZK2BmsRpKDLfaieAvEhmaheA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7352

On 08.08.2023 14:02, Jan Beulich wrote:
> When !MEM_SHARING no useful output is produced. Move the function into
> mm/mem_sharing.c while conditionalizing the call to it, thus allowing to
> drop it altogether from Arm (and eliminating the need to introduce stubs
> on PPC and RISC-V).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Tamas - any chance of an ack?

Thanks, Jan

> ---
> I wasn't really sure whether introducing a stub in xen/mm.h would be any
> better than adding the (further) #ifdef to dump_domains().
> 
> We could go further and also eliminate the need for the stub variants
> of mem_sharing_get_nr_{shared,saved}_mfns() by moving the
> XENMEM_get_sharing_{shared,freed}_pages cases in
> {,compat_}arch_memory_op() into the already existing #ifdef-s there.
> Returning an error for those sub-ops may be slightly more appropriate
> than returning 0 when !MEM_SHARING.
> 
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -1297,10 +1297,6 @@ void free_init_memory(void)
>      printk("Freed %ldkB init memory.\n", (long)(__init_end-__init_begin)>>10);
>  }
>  
> -void arch_dump_shared_mem_info(void)
> -{
> -}
> -
>  int steal_page(
>      struct domain *d, struct page_info *page, unsigned int memflags)
>  {
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -6265,13 +6265,6 @@ void memguard_unguard_stack(void *p)
>      map_pages_to_xen((unsigned long)p, virt_to_mfn(p), 1, PAGE_HYPERVISOR_RW);
>  }
>  
> -void arch_dump_shared_mem_info(void)
> -{
> -    printk("Shared frames %u -- Saved frames %u\n",
> -            mem_sharing_get_nr_shared_mfns(),
> -            mem_sharing_get_nr_saved_mfns());
> -}
> -
>  const struct platform_bad_page *__init get_platform_badpages(unsigned int *array_size)
>  {
>      u32 igd_id;
> --- a/xen/arch/x86/mm/mem_sharing.c
> +++ b/xen/arch/x86/mm/mem_sharing.c
> @@ -2329,3 +2329,10 @@ int mem_sharing_domctl(struct domain *d,
>  
>      return rc;
>  }
> +
> +void arch_dump_shared_mem_info(void)
> +{
> +    printk("Shared frames %u -- Saved frames %u\n",
> +            mem_sharing_get_nr_shared_mfns(),
> +            mem_sharing_get_nr_saved_mfns());
> +}
> --- a/xen/common/keyhandler.c
> +++ b/xen/common/keyhandler.c
> @@ -365,7 +365,9 @@ static void cf_check dump_domains(unsign
>          }
>      }
>  
> +#ifdef CONFIG_MEM_SHARING
>      arch_dump_shared_mem_info();
> +#endif
>  
>      rcu_read_unlock(&domlist_read_lock);
>  }
> 


