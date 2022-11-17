Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1292A62E016
	for <lists+xen-devel@lfdr.de>; Thu, 17 Nov 2022 16:39:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445271.700380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovgyR-0004Lf-QB; Thu, 17 Nov 2022 15:38:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445271.700380; Thu, 17 Nov 2022 15:38:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovgyR-0004J6-NT; Thu, 17 Nov 2022 15:38:43 +0000
Received: by outflank-mailman (input) for mailman id 445271;
 Thu, 17 Nov 2022 15:38:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iQoc=3R=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ovgyP-0004J0-Nt
 for xen-devel@lists.xenproject.org; Thu, 17 Nov 2022 15:38:41 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70082.outbound.protection.outlook.com [40.107.7.82])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8ee8482-668d-11ed-8fd2-01056ac49cbb;
 Thu, 17 Nov 2022 16:38:40 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8159.eurprd04.prod.outlook.com (2603:10a6:102:1c1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Thu, 17 Nov
 2022 15:38:11 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5813.018; Thu, 17 Nov 2022
 15:38:10 +0000
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
X-Inumbo-ID: e8ee8482-668d-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j7nb6k9ojcELdvct2t0v4iswcJqYNJuoDqs3kvSvfX6yRDNqql8SKhw/Df0NOcfVsH4KzYvCSl4QAFKXs2oUecOa2mqL0/O17PFjOqj6wzw5fnxQHG7vD7vnEJDiJd4yh0rZmzZ2BWjZhy8RftByTMhBUp69Ln4Evfj1buiSyvnxBjPjFcoa2ZkZvjr8Ek9yK4msmGyFkFRnxowpb6TUSQDWA9zwBVnpVs8maAKV5Kx2lLmitz4Y1RwXYChY4YrueQUMzacdmGnUYkRtDf1vwrFdhfM5aZi+zE//dWUgwNMNI0aCZax66VUkcqO1NvTBchIa0htSmQlNoWdSfYFhcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nf2ZhOc393Vbq7veFfSkuaozHPcfKNKg6DK+3VET304=;
 b=fBGaEXdEDMngqMaiVhopIPPgQvkdf7FDdkfQW03bJ9FZgROBfDyu+rYlvWxfQEpRukiHWw+3C80p2nRONG2l7nOWLdE8W6xtCSj2o5j2zOGMhqNZQOoCnXlAEd/ANftucABFlSq0XMYd0n4/vuIOb/+JGuJDY9v6Z9XoGgt55jLOKhUsOGSIQ9Ez1ljKuATYnJMfrlHfcyvMPAaxytiVA6bquD34bazxEB2vSSRE5u5Es76odRIvT7z5D/WbfOGX6qbXG6tffRwNTRxqGCfhwnUl3+t5ZxZak2nTysnQgv71fuUenTOBrmvvYwQ//TDdfzZjjxFBTi3KSVtyi+ineQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nf2ZhOc393Vbq7veFfSkuaozHPcfKNKg6DK+3VET304=;
 b=5PyzYfQSzI7pTX7gHD1+ktkeua6hoXL1XNuLG+brE0e7fPONqi1jYl9YJsPr9+d9MVEBao7Fzfak7dRQba+h7DvdK75qwCwIs5OA5vabCdDacsruCny43s8KeZJuGKwEOECxAcmayPm9OqtQWEsu3Jc8gumvAIlCY2gzohM0kHquEGW5Z0cIq7OSVtJPjfTuAk+YK54q1z9J/Adkn+Y5mzoJRlnrhx92Z/IUezR/x4Pf0nRB5lLXNeUoCM3EwF+hJzEc2YUGvuDXNnm/5K0LMbkaN0zGm62NNAtlgSpy0lAohuuRsbqbJA/nVTrCeym0x/DN3IoUd/BltFGM8nfkpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4e961ee5-2b4e-721a-9406-9dde7ba5e672@suse.com>
Date: Thu, 17 Nov 2022 16:38:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v8 5/6] xen/x86: move NUMA process nodes nodes code from
 x86 to common
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20221114063451.473711-1-wei.chen@arm.com>
 <20221114063451.473711-6-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221114063451.473711-6-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0144.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8159:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f8d2391-9305-403f-8439-08dac8b1ba9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/I51+8kCdYWkZ8gSsOLKbo9qCCvehca+9HHVObkoVU+vcEENO0bxZ2G2ZBwbKDueieKWsK2RT5vZuhokT6qaYk2May59h+Y+l0jsCnzrWM+Prqt0JwsgxP9g/YEbeqRkgfeex0RjbyvSVM+fFi+JLKYIgKjA8dvWDs90x5ubCy/DWUch0yyBxwxAOnKfO5xb6utRJ3I/4Ea/z9s8UDDgp8C4Y4zywOINEvhUrkR8zmZXLKxM+xWMo14QAiQa9DJZEUHy1BralhRNkMTq7jcI2beIgExY/qpniV06wDgOreD2BL2ZmVz388OM4IZ7i7sjvAm0blEjmdGEww32btDpXMxrmvQ0n4hWsmgPTO7NhSekoeKzWxBwkfnTjsQVbhY3/mb8pMTeaihWYFyXRjfGV2c6+uzBIY2M5QVgo/O9NMDkCv/DnbVXc3mkY+kpsbglDnbtrKz3Q3BaYYAzcCODMtY9c77u5uqgQ4AfJtpk+RtBSDsLxve1jx70Yi19UhqQvC4i/CFmhY3DwsSyBmsXenyD6Dh6YHzkBvWdxYfK2CudIfUSFz868JW1RGDN4M4/agYeDC7mxaOZurdq81w9J5rc3RWWOP5HvYSddFyPAa30bwrKpS372ctZerf+bKCxDZ7WYBSj2gGtPeCXhwnIbAk9RJ1Zo1v+Bxwx6U8z7sHebMZzkDyPsHMMapHpRcwI+A8mxYz48PU2k/OXlBq8Vi61wOYjAwoU5NxTQzWu7qA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(396003)(136003)(366004)(39860400002)(376002)(451199015)(478600001)(31686004)(6486002)(6666004)(41300700001)(8936002)(2616005)(66946007)(4326008)(66476007)(36756003)(66556008)(8676002)(26005)(6512007)(54906003)(5660300002)(186003)(6916009)(6506007)(316002)(53546011)(83380400001)(2906002)(31696002)(86362001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFI3NEVseVd4V2lxVjg3ZWk3NUtCVkE1QU9HVGhRaEkwZFVtUytrRHFIQURS?=
 =?utf-8?B?QXNJaFZ6RERaazFOMGprVDdoY05va2NxeUNRWTRMbWNjTjVYc3ZObmt3MDdV?=
 =?utf-8?B?aGZneDBHN29OeTIwVGE0dm9NbWVYRm8xU2E4NnhtU1BPV3RUV3d6VVdrbHhi?=
 =?utf-8?B?aHo1b3h4MnhoTGVlMlZkU1BGU1ZOM3R4V0F3L3IrR1Jhdm5hMVVJR0haeFJx?=
 =?utf-8?B?czhlT0VORWV2ZGNaaWF0bDVzMzh4dU1zNEo1b0c5VEROOXlveHRTb3hQb0Zi?=
 =?utf-8?B?WXAzU01vUWNLK1Q0bEZxR2dMVHdCMG5TUXFsa3BUTDdhaXVBQlJDRFFQY3Fp?=
 =?utf-8?B?QVVsYWV4SG0yUE1CRlM1UHU4elR6ejVxRS9VRFBSRnU4R1N1cE9WZnlveEVE?=
 =?utf-8?B?NG40T2pOQjFJaERnblpzOHdBdTNHSTFtTW03ZGRSV2U1cG82UTM4eHhSUXVY?=
 =?utf-8?B?UkwxajlqU0xES05PaGFxcG1YdjJaalJxVHNqYzI2aU93MXJmYTBZamlSc3Mr?=
 =?utf-8?B?K3R1Zm1YcVpHYWtMTDFoWE8rK2h1SFd0N29CRjI2OGZTczBvV2ZBdzZ2MEV0?=
 =?utf-8?B?ajluNnZLNlczdVNkTE45RWgyUTJ4ZGpNaGZMcmluQldoYkRKNXpOaWc1SUdI?=
 =?utf-8?B?amg2dnVWYTQ1MTE2TmJhaEhvbFRIa1BrYlEzVktUZ2s1aWdYWDdMSnBhejJv?=
 =?utf-8?B?cFRyY3dEb1JlaW1vLzJwbkdPb3V3MVVUckptRmh0QWk2WFRtK1dLNFRnQVps?=
 =?utf-8?B?UmFKMFVucnpzNTd0S0VLV2doYU1qZXdZRVUzbEhnN3dERW56LzFxRk9tVEl5?=
 =?utf-8?B?MWlZUk9vbTBETGZWVExYYm90U24yQ0tpSzV5UkhGdlA2dVZ2dlpWbUFQVlFw?=
 =?utf-8?B?ZjJUV25GMEN0M25BMjVXL25qcGxvOWM1TjFRR0ltN2ZmOWJOc1ZsTkhPajZ0?=
 =?utf-8?B?UzFkRk1ac2xwYTA3QWtMN2cvbUFMVC9sWm5Gd3NCZ3RUTVZIc2VFMGQzM2cr?=
 =?utf-8?B?N2src2tpRDdiR2dXMnJjT1pXREFlSCtFOW5uNWdvWWVSREhkMG5vOW9MZ2tm?=
 =?utf-8?B?ZWU1UFRoQ2xTWVF1OHk5N3d1NEw2TWRINngxb3dGUmwxV3FnamlSWENHR3RH?=
 =?utf-8?B?YXNzYitSdzBYUFJoQ1NnOGJydnJ0ME1nMG5TZldid1cybDU1NE5la0J4MzFt?=
 =?utf-8?B?cnk5YmpWYVlzTHNyMkVLS3FYVzNRN1o5OGI3Y0JaNXNZL1hsQTRGU3Jqc1ZJ?=
 =?utf-8?B?Vm12Y3g1a3dqSTlDRWlUNDNZY2FHQThETjNQTmh2b2hDbm1Gd0xWV0pjTWc1?=
 =?utf-8?B?OFRQWWc2TEhocDNUaWpyWVdEVTVVYUNVai84b0kwYTc0ajZmbHAxQXB6Kzh6?=
 =?utf-8?B?L3BLSmdXYWRYd1YwakozV21uV1NtMUl6aldxWTV2Y1piRVd1cVRmcnJoZm0y?=
 =?utf-8?B?S2lwQVVGSXA0bWIybkdkZElhQXk1cEVOdmkyUE5LeVFkNC9CckZZT0hrTnZT?=
 =?utf-8?B?SmZpTnlWTUdBSnBBZzEvQnFGR0FxOWF5bE94RGsyVk5pVGM1S01YVTNjaUNj?=
 =?utf-8?B?L0plMU4xYk9pSmJaVXNTTnVVOEhSemM5cndZcGhZaXUvR0RXZ2p3QzNHYTFG?=
 =?utf-8?B?VlBJR0xWa0xKNHk4REdJcDlBTWRqZEYrWlpMR0ZJSldvbkdRcHNJOFVSaDc0?=
 =?utf-8?B?WFBQaXJIVnVXck1YaWJLN1lvb2xTUEdaVTlOeVlURXNkYXFIZmVCR2VlZzRJ?=
 =?utf-8?B?Z2gxVDF0MUtpVnJHeFNxcmZnQjhLd2xDSXIvOFRiRjVRNXROam9BMGdoKzZV?=
 =?utf-8?B?VnZJWE8vVU5MdXV3NUkzMW1Yc1RaMzlvZ3hzV3VPNXd2ZEpOaHp1UVArK2Zu?=
 =?utf-8?B?L3QwekF3V3ZITlFhT1JPZUJFeGpzL0V0bjhsNWtOeDNHbGlhblZQeUtuUnpD?=
 =?utf-8?B?cHFKdndoVlhjZUEwTnRzTjAyU04zY29TRkxpQjR0ZklkSUUzZjZycFlDbjMz?=
 =?utf-8?B?eGxocUU1NTRrUTljamxNcWkrRS9iTnRqejJZTjV1eDdia2w2Z2JVQnhKRU1F?=
 =?utf-8?B?eFpmb2s5RXg2dlN2dFpXT1d0NTl0TFI4WGZaSmZMejViN05haThubG5jd2ZD?=
 =?utf-8?Q?w1VckmYwBCGhvO2H8ilkyEUl+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f8d2391-9305-403f-8439-08dac8b1ba9c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 15:38:10.8181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: onZqJeqtA6KrdvRK6/LFGkMFrQmFTN/Mgw608z3ZuvR+15fIGN8/+E09V2AB8McrAd5HR4cfSa/SORZk4OLDyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8159

On 14.11.2022 07:34, Wei Chen wrote:
> x86 has implemented a set of codes to process NUMA nodes. These
> codes will parse NUMA memory and processor information from
> ACPI SRAT table. But except some ACPI specific codes, most
> of the process code like memory blocks validation, node memory
> range updates and some sanity check can be reused by other
> NUMA implementation.
> 
> So in this patch, we move some variables and related functions
> for NUMA memory and processor to common as library. At the
> same time, numa_set_processor_nodes_parsed has been introduced
> for ACPI specific code to update processor parsing results.
> With this helper, we can reuse most of NUMA memory affinity init
> code from ACPI. As bad_srat and node_to_pxm functions have been
> used in common code to do architectural fallback and node to
> architectural node info translation. But it doesn't make sense
> to reuse the functions names in common code, we have rename them
> to neutral names as well.
> 
> PXM is an ACPI specific item, we can't use it in common code
> directly. As an alternative, we extend the parameters of
> numa_update_node_memblks. The caller can pass the PXM as print
> messages' prefix or as architectural node id.

The use of "prefix" here must have been stale for a while, perhaps
resulting from an incomplete re-write of what was here earlier on?

> -static int __init nodes_cover_memory(void)
> -{
> -	unsigned int i;
> -
> -	for (i = 0; ; i++) {
> -		int err;
> -		unsigned int j;
> -		bool found;
> -		paddr_t start, end;
> -
> -		/* Try to loop memory map from index 0 to end to get RAM ranges. */
> -		err = arch_get_ram_range(i, &start, &end);
> -
> -		/* Reached the end of the memory map? */
> -		if (err == -ENOENT)
> -			break;
> -
> -		/* Skip non-RAM entries. */
> -		if (err)
> -			continue;
> -
> -		do {
> -			found = false;
> -			for_each_node_mask(j, memory_nodes_parsed)
> -				if (start < nodes[j].end
> -				    && end > nodes[j].start) {
> -					if (start >= nodes[j].start) {
> -						start = nodes[j].end;
> -						found = true;
> -					}
> -					if (end <= nodes[j].end) {
> -						end = nodes[j].start;
> -						found = true;
> -					}
> -				}
> -		} while (found && start < end);
> -
> -		if (start < end) {
> -			printk(KERN_ERR "NUMA: No NODE for RAM range: "
> -				"[%"PRIpaddr", %"PRIpaddr"]\n", start, end - 1);
> -			return 0;
> -		}
> -	}
> -	return 1;
> +	numa_fw_nid_name = "PXM";

I guess this can't go without a comment, now that we have ...

> +	if (!numa_update_node_memblks(node, pxm, ma->base_address, ma->length,
> +				      ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE))
> +		numa_fw_bad();
>  }
>  
>  void __init acpi_numa_arch_fixup(void) {}
> @@ -534,6 +295,7 @@ void __init srat_parse_regions(paddr_t addr)
>  	    acpi_table_parse(ACPI_SIG_SRAT, acpi_parse_srat))
>  		return;
>  
> +	numa_fw_nid_name = "PXM";

... this as well. Otherwise someone may spot the redundancy and either
propose to drop one, or it'll take them quite a bit of time to figure
why both are there. I thought this would go without saying, so I'm
sorry for not making this explicit earlier on.

Jan

