Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DF2492995
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 16:23:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258600.445543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9qK1-0007cO-Q0; Tue, 18 Jan 2022 15:22:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258600.445543; Tue, 18 Jan 2022 15:22:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9qK1-0007aS-Mc; Tue, 18 Jan 2022 15:22:57 +0000
Received: by outflank-mailman (input) for mailman id 258600;
 Tue, 18 Jan 2022 15:22:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aElt=SC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n9qJz-0007aM-QA
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 15:22:56 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8134b407-7872-11ec-a115-11989b9578b4;
 Tue, 18 Jan 2022 16:22:53 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-fkWo3o0QPrGr_IIbpDscbw-1; Tue, 18 Jan 2022 16:22:51 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB4535.eurprd04.prod.outlook.com (2603:10a6:20b:17::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Tue, 18 Jan
 2022 15:22:50 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4888.014; Tue, 18 Jan 2022
 15:22:50 +0000
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
X-Inumbo-ID: 8134b407-7872-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642519373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qY+zkviUaTJdFINFr0LJAdxZeeCgqLUR4vnVi52YXvU=;
	b=QgfxJ3CZAjdn7aLm8RaBI+mDFEhzrq82aJeZyWUZ2z7MtBWclauIfDLnVHRj5A+WZMx6uU
	Wf+tTo+IXwLPzQMkkm1s2EyUvgoVJjJqOMAiAVDLyGXGOJk3zY1n7U5gzvhVpFkNv6m4kF
	WyWLqWw7sg6dzcTRTS4tLTi//h0qGJA=
X-MC-Unique: fkWo3o0QPrGr_IIbpDscbw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Udm6GCUR4ccIJYuU4guqcuwHXZNhITL1ygG5IdGfmlvrypb+FvsYL04Hv5B7oxpg8wNDgNyEYf3ghMvucMvXAtJ+FVjS1sFD591hUMOZF1ZZJxIGh0ZvOxvQ2q8+ieJtXqV+EH+/J9KNSVPzqNjHz/HB8/Em/LcDcTgAQD7+etfvn8tgcMx2WALnBMBlbHqxz2vCGe+GedelXys7BFGV/gpAW+CQRWaUquKje3k8LDtpGqB3ZIichQ1hFxS3sd8y5gYD+ywPrIelGyO/7JThd8aXAmycIgxs75z7Ski0eTR4Kx3YMXT6ncn8TBy8nO4F3keynLIV3sIsvOdtPQOiSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qY+zkviUaTJdFINFr0LJAdxZeeCgqLUR4vnVi52YXvU=;
 b=M3DscRjfOSppoGONY0ntOEcznzY9IP5k0nxZAckj8YFIdb2nACpUtbKxloED4ZASRH9xikoJ9i/Er4WpLqjVP9njA9CLqbkVsMFX8sXvu4zsZnI41MIY/TlHsldLmEJfzHWAIv16EnD45XNg4XG9nAeQTwwPZFsEViFySeG+ZjzMxxEdJsSpAsIS8jTjPRzVCujx1sdvYerLy1GBDtMw2RN6ahUc4l87pLS6+uwS+KJtijiBxS8UuJLiCuoUV0pfFbPRJsydK6PyTdc+Xms6+w2yy6rlzUr7ex9pP4NX2C4pYN9gAwcS07uGHRY0lBeCA/7XdUH826wj13/Wf3NoLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a1d96556-5da4-0c73-0d87-f24758866d7d@suse.com>
Date: Tue, 18 Jan 2022 16:22:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 07/37] xen/x86: use paddr_t for addresses in NUMA node
 structure
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: Bertrand.Marquis@arm.com, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, julien@xen.org
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-8-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20210923120236.3692135-8-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P192CA0059.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::36) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d2f9592-1757-468d-35d1-08d9da96639a
X-MS-TrafficTypeDiagnostic: AM6PR04MB4535:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB453521F7B0A17EC5C11C285AB3589@AM6PR04MB4535.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zxjZsp+9OAl8HJkZ4eUzjFLYYyamIuyhK7VljmIj5IQA8i7MB4Y1B5qyy0pI0DpczPse35hsY3WaE85EDXsjRBTvmUeLKGGibtae1HlIAvbzDBzNPUxEeV/k5KDq4pEEoCVdJmq0l5hfvJWyMiTlqGM4voZQ9cZNnouDVck8gPHEiwGeiaU/asaMzg9t2uU+a07q/Yi1KZjv/ofIrW5SjAxGQgvqm5YYbVIPijUnIKhRwP5VhZUbyB4i5sjwwTAuscACEhZKbTdR+LIaBAIQIEYtfEUkNS1SmU1+x2FiFHf7RsnwAHu+F3rnAhzxvQDG5YLUJdEHz3iYESvypDpTL5Y4pRuuCzcT1Z82gss9LcNlDYfQZ8aP05/1qRhDSvBLu7z9nFn4uF16jRHCsd/BD5Mzw9Hnr7OyMplspNNeXO42szHM/oqAeLddoZ1jE0g0qSOraewRa2sdsje5hqqgMYpUFbbwuLN/lU2REwt5FVUmg0rHM2ANrFVKPUyNw/6vJ6DLK3axgE9+GYjUWaCc0cIcdv4xul0A2C8b3FnIvJMD35aV2tmRRGGNOKc6qTkUyyAKvjKstH8OLW8qS40+D+MQMgrm/VJDjNRFca0Bq8GsxLw4bH/O+a5GPCQy/1kwGS+wc3wKbhZcORRPurdCn23HP0eOOUY76fBrK4MuC2jv+2I4052OKKcIR17sZOnbIlAXq9ZIVsIrgf0eUOiAxXYB16IDItsJrx1C/MpZZ30qlHFic8nQxq0+b/nR9Md8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(86362001)(2616005)(186003)(316002)(6916009)(5660300002)(6512007)(66476007)(66556008)(2906002)(8936002)(31686004)(66946007)(6486002)(53546011)(6506007)(38100700002)(8676002)(36756003)(26005)(508600001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVlTa3hsME85Y21KTTdwa1hXaEE2U3orc01NZWdlbDdEU3M5NDg2QmFvNjhH?=
 =?utf-8?B?TnZqSUR5WndIWXlrcUd6L3ZVN2JGWTMrT2pFd2JjbEVVaU1idTQ0VzBYblF6?=
 =?utf-8?B?QnJHbjB6TGRDVlN5SWtjSlFtOGIyei9saXpHckNqb2xMVGlRa1BFWEFpSURV?=
 =?utf-8?B?dlFjSE55NjM4bmZMS3htRlR0RE9xbVRxeGU3bC8xc2tMb011Qm5sK0dqSVdI?=
 =?utf-8?B?aHFSa3FnOTVJZ2xiL2NKaCs4NWxSRisyc3dFYWJOcFFpenJWVFFuQmxYMnk5?=
 =?utf-8?B?MFNreFdLMDd3NlNIaWViRVkyUml6cFgyQkRicXk1aHFtcFhzSk82bnF0Y0Zx?=
 =?utf-8?B?QS9mektsTUN0bVFzWGkwS3RzVjlpaStIY08zdFQwQ2RBNlp5dHM4WFFWVVpu?=
 =?utf-8?B?RFB5UDFSejlwNjlTa3hpRXBLWm8zNGdYeGxYbXltdUtCbTJLOE5jUTR3d1Ji?=
 =?utf-8?B?dzd4NzlkMURNeEU5c0l0cCtjM2tOQXVLb01HdmlDYXM0emtBTmE1ZENxUjZN?=
 =?utf-8?B?UlVwSzQ3VU5TbHdGZTRUYVVMSTJFbFNpbnRzN2FSeUNZMDJlTWRPN2VYM0FM?=
 =?utf-8?B?T1R4MGp5WU9hQUwyVFRlRDk1OUZPME50TEk3NmZuUXB1dy9wNjQ1SWQxc1M0?=
 =?utf-8?B?NWN6R3d6VUhqRDA2Sk5GK1VZS1pkTml5bVBJT2FMcitOTXNoVWdLV3JkdGZ4?=
 =?utf-8?B?RTZ4NXdFREFMdUV2UGM1ZmV5dkg2WUNaazM1T1FnM0RYbVpmcUVIbldCMFNP?=
 =?utf-8?B?VVBjdk9VSUY0NDZzYU4vc2NsaERtemxLMUlPMTVieGV4Z2w5cHpBWllsUThN?=
 =?utf-8?B?THNjcmx2OTg3RVhwZFBlSmpLd2F1QW5QMWI0MmM1Q0Z1T0traFA2dHJhZGha?=
 =?utf-8?B?ZlBWWDRDVDBtakZyZCtWVzdJS1Jxell0ZFhSc0FkYWdwMkEycUFtMkw2MFow?=
 =?utf-8?B?N2xuRG1ySW0wOWprWTVyK0lmVS9kYTdBOWY4VE9ocDJHNW9TclpISmw0eDNY?=
 =?utf-8?B?cmRZSEtGTWdvcFdKMmgzUkNBVFAyZU1EWmMzZjA5MnpZZi9iTFZuMUQydVk4?=
 =?utf-8?B?UFd4R3Ryeml5RUgwcC9Sd1hiWEZKc29Pa2RML0NMWXkwTXJKUDlHem9RRmZG?=
 =?utf-8?B?T0xUQ3JLV2RQbHQ4NEU0Y2ZqbU9WTkhjWGU1Mk1DWkpPaU9IbHBQd2VmS1lz?=
 =?utf-8?B?QmgwbnVUY3hWTTZxL1NaMHl2bXFLblRjQVpBZmlLN1hZaWZOWCtoWVNRSVFt?=
 =?utf-8?B?VHhXQmZPWTNGZjA4MTB1dWRWYXNJRnZxN0trUXFINkJieWVzYnpmeXpHRzFT?=
 =?utf-8?B?WWk0a0g0SFRPQXBrV1hYSUdNcUlUblEzQTlIM3hSOWNubXpRQlAvaXgwL21T?=
 =?utf-8?B?RkpvaVpLN2JaWUJ4QWlkbHNVNXhVQlAxbjhReEhQVXBISE02bEdjbXlodlcz?=
 =?utf-8?B?UFVUZjRaT1ZXclB1ZjRWZHVuZFdyV0ZjVDRXQkpYMHVnY1cySlR2QXNqYjA4?=
 =?utf-8?B?NE1DZW9ISlN5cEd3NlUzb2tlNDZkekNjVCtKWG5ObXp1L1N0NVFFU2pEYTQ5?=
 =?utf-8?B?eDBPTHF4TnhnY21EWWlTYzg0d2EvampuTEd2eFJrT3RLOGw2Tm5qRXJXZyts?=
 =?utf-8?B?TVkxTFd4UnpNL3ArV0R4cmZPcmpVS1AwYUpVeXY1QXBsSnRVZE9XcmxKQlEw?=
 =?utf-8?B?QnRMMSsweEhhNXJyNU5Oa0ZBRDM0VmM0WElLVFkxSWRiaE0wYmRxNHJTNEpC?=
 =?utf-8?B?NEtsRkZRK2o5UGU4aEt6ZGR3cTBaMG5PTEFsamoxb2ZVbFZuT3Y5b3NYb2pa?=
 =?utf-8?B?YjJNOEtlcmhoMGcvdzZrYWNzWmh1cGswMVFrRGd3aEhlSnNmczhEaWhTT1g0?=
 =?utf-8?B?MUtmK1ZKRktoVEk2Um9VdUsrbmhHL1QrSTRab1pvRjdtWEI0SVZWN016VERW?=
 =?utf-8?B?MU1Oa3k3dkVFSjg0RERrUnU2Rlg4U1BnbUpLOUdJenNTR3NqaUk3WE5nSmIv?=
 =?utf-8?B?bURyZHBrVGdJOGd0RWVZemFTZDhubGlCZjBIZTJCWDlkVS80U2pwN1JVT3Yv?=
 =?utf-8?B?aVk2MjZTdTNPQ25zZEtNdXpJVG5WdlVKK0pydXVLK2Y4c3dXcE81MnB2U0dQ?=
 =?utf-8?B?cVozbzREektTNWJhTFc5eUFNMVUrQjBLd2NWOWFNQUh1b2Fyc1BNQXVzUnZT?=
 =?utf-8?Q?CRxtpJDQSultLHGkMFnzqtU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d2f9592-1757-468d-35d1-08d9da96639a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 15:22:50.1905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DIw08djmbDXgml9mk9hE+hx0DnXK6qJXNzKRk/zlsGhFAvROaBE1rOgH5Hw9HrKEDum5LX52kPXIJ5b8ECFlbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4535

On 23.09.2021 14:02, Wei Chen wrote:
> @@ -201,11 +201,12 @@ void __init numa_init_array(void)
>  static int numa_fake __initdata = 0;
>  
>  /* Numa emulation */
> -static int __init numa_emulation(u64 start_pfn, u64 end_pfn)
> +static int __init numa_emulation(unsigned long start_pfn,
> +                                 unsigned long end_pfn)
>  {
>      int i;
>      struct node nodes[MAX_NUMNODES];
> -    u64 sz = ((end_pfn - start_pfn)<<PAGE_SHIFT) / numa_fake;
> +    u64 sz = pfn_to_paddr(end_pfn - start_pfn) / numa_fake;

Nit: Please convert to uint64_t (and alike) whenever you touch a line
anyway that uses being-phased-out types.

> @@ -249,24 +250,26 @@ static int __init numa_emulation(u64 start_pfn, u64 end_pfn)
>  void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
>  { 
>      int i;
> +    paddr_t start, end;
>  
>  #ifdef CONFIG_NUMA_EMU
>      if ( numa_fake && !numa_emulation(start_pfn, end_pfn) )
>          return;
>  #endif
>  
> +    start = pfn_to_paddr(start_pfn);
> +    end = pfn_to_paddr(end_pfn);

Nit: Would be slightly neater if these were the initializers of the
variables.

>  #ifdef CONFIG_ACPI_NUMA
> -    if ( !numa_off && !acpi_scan_nodes((u64)start_pfn << PAGE_SHIFT,
> -         (u64)end_pfn << PAGE_SHIFT) )
> +    if ( !numa_off && !acpi_scan_nodes(start, end) )
>          return;
>  #endif
>  
>      printk(KERN_INFO "%s\n",
>             numa_off ? "NUMA turned off" : "No NUMA configuration found");
>  
> -    printk(KERN_INFO "Faking a node at %016"PRIx64"-%016"PRIx64"\n",
> -           (u64)start_pfn << PAGE_SHIFT,
> -           (u64)end_pfn << PAGE_SHIFT);
> +    printk(KERN_INFO "Faking a node at %016"PRIpaddr"-%016"PRIpaddr"\n",
> +           start, end);

When switching to PRIpaddr I suppose you did look up what that one
expands to? IOW - please drop the 016 from here.

> @@ -441,7 +441,7 @@ void __init srat_parse_regions(u64 addr)
>  	    acpi_table_parse(ACPI_SIG_SRAT, acpi_parse_srat))
>  		return;
>  
> -	srat_region_mask = pdx_init_mask(addr);
> +	srat_region_mask = pdx_init_mask((u64)addr);

I don't see the need for a cast here.

> @@ -489,7 +489,7 @@ int __init acpi_scan_nodes(u64 start, u64 end)
>  	/* Finally register nodes */
>  	for_each_node_mask(i, all_nodes_parsed)
>  	{
> -		u64 size = nodes[i].end - nodes[i].start;
> +		paddr_t size = nodes[i].end - nodes[i].start;
>  		if ( size == 0 )

Please take the opportunity and add the missing blank line between
declarations and statements.

> --- a/xen/include/asm-x86/numa.h
> +++ b/xen/include/asm-x86/numa.h
> @@ -16,7 +16,7 @@ extern cpumask_t     node_to_cpumask[];
>  #define node_to_cpumask(node)    (node_to_cpumask[node])
>  
>  struct node { 
> -	u64 start,end; 
> +	paddr_t start,end;

Please take the opportunity and add the missing blank after the comma.

Jan


