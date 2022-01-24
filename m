Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C58049853E
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jan 2022 17:51:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259933.448744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nC2YQ-0007I4-2j; Mon, 24 Jan 2022 16:50:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259933.448744; Mon, 24 Jan 2022 16:50:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nC2YP-0007G0-V5; Mon, 24 Jan 2022 16:50:53 +0000
Received: by outflank-mailman (input) for mailman id 259933;
 Mon, 24 Jan 2022 16:50:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=REvy=SI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nC2YO-0007Fu-2Y
 for xen-devel@lists.xenproject.org; Mon, 24 Jan 2022 16:50:52 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9327b91-7d35-11ec-8fa7-f31e035a9116;
 Mon, 24 Jan 2022 17:50:50 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2055.outbound.protection.outlook.com [104.47.8.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-9-IhmMAS21NueJ4DMRsUtltA-1; Mon, 24 Jan 2022 17:50:49 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by HE1PR04MB3180.eurprd04.prod.outlook.com (2603:10a6:7:22::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.17; Mon, 24 Jan
 2022 16:50:46 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 16:50:46 +0000
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
X-Inumbo-ID: c9327b91-7d35-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643043050;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vl3ZW9vBs+LnjxVnGdQf5PMnVQBpFfSWqCX8MaY3c0E=;
	b=Qwo3kSr+X3X+wPFUtZTkug9lExMds3qtOpGZhxhGdAYjyfVfHmOe2NFaH0+1ceEwVG5x4x
	Li6CZouXG0lTuiy/7wXKxlhQHp4i9xswGgoaBWGj1X5MI4RPw1srQW6IKZfdKiHYJzVXlq
	WHl7I7KcZnE2TDPFzTxoNmuYLO6Wlzk=
X-MC-Unique: IhmMAS21NueJ4DMRsUtltA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mivc1GTS2AiqjdUAnJA0MWiHtd+J8BDFBNecE7puT7g3Q7yKMDMD6prnUeHKBjqF0U1XnPTBgZQ/5LPSjNl0jRL4lHeXwi7/G/4hrUx8eV+2flDkCdG2ArX9Fy8HQQLxz+1h0VAwQ0XAJRHXyyXaoPd3Mq1G2kzRC/9mjaXVPNuSp8duuF1KK82htkatXUeIUeV7wos8alFP5AdA3ZmPjGbuUe3+mzi1bDgCkVDf0XR0XE1d1NjPQCuLS8Dl3Vt0vNKiZKJgFUcqCngRKOPaFuUS2o7ZDGXoxAfueg0nAyuGxr4+F03TeCWFuhPsHTOaBWTaORqiSi6/+YAK5qaF0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vl3ZW9vBs+LnjxVnGdQf5PMnVQBpFfSWqCX8MaY3c0E=;
 b=oXZ7bUaAjV2jCZs/Q966sndmteUnk+qlNEFx904Kw3tOxikbCoOpqW9oK9cEyN+CxFRAu3TAC+rua7w4UJ2MQ2dVaDly+AdiXuUIVTsSqN34/kRPcn17WIci9Xrz8iia+gxbnWw0U7DdqxY9DCKdB6HbtyrDWVxiEDa/9uANWW0dU4BU/Enqep+kBvgdIz/oRwlJu0jU1nduSXjY4fQphR2GyOpP7ItEt3H0M2X1ppelK88AWOog8dYVy6nwEcJyZz6wynyYgnxoDVCBvwPStlOVKxeLhutgLBQL2V//t9dZTB1cVTDhIv6ywGR9rfFzbh151NJYfeaMuvZrfnkbQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <46759708-36a8-fcde-d0dc-f73401491cbc@suse.com>
Date: Mon, 24 Jan 2022 17:50:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 11/37] xen/x86: abstract neutral code from
 acpi_numa_memory_affinity_init
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: Bertrand.Marquis@arm.com, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, julien@xen.org
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-12-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20210923120236.3692135-12-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0301CA0017.eurprd03.prod.outlook.com
 (2603:10a6:206:14::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 910c2b84-14d5-48b8-8e37-08d9df59ab2f
X-MS-TrafficTypeDiagnostic: HE1PR04MB3180:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR04MB318043264AFA9902FC8B1748B35E9@HE1PR04MB3180.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0kNOtAZ6kHmops37MyPag8CYxvlRUGnUIEYvdw0STxcYLZWmPDgbfkTks+sCcK2KLVl+hf7QZ4MIvMulys94aoG2qPtEvhsmJziKjfc+1YJyg0lqvTfnXPbCqVA9vRZGRAG4gRhbdFITNXvl0QaRGvw3PofiY8inS5csut/peQZmxeu0QmFT8kUqiTupn6c+M8yM6ymSXHRNcfbxAR7rAaYTlLuU7hfjaGsDOR7XjkKmSHxA1lZ1ahU0oJt1M4fTQgIEWVwreAkt2UKQfMeUeZmcpN0R8nX699BW4Ujnd4YqrLDV9rWUJvXDWtFu/Ic+guD4P5P5C8oQ/TIhoRNJ3hA6XqmXDIXB2kfbiHmc1Pev0whRc+dod4Z+pHQ6h72ZlSAebBTdnEdnp55F0teGg5X7eh07bg2UZkvsP/+owsKyLmTabzkjLLYMV/zPy+h0loD4nVAWhfvHCG4Qs+4YqWHRO6eEXzE7xWMcZHdTDGFWwNn0NbKEiSnETwxlcyKXRrUPSktD2SnwiS4tWUKF0IrIUpouTEGC8f2X1LJw1PF5OpwVtjQIgUz+PIXpqzLFnTAyqhGt3QQOEkVExGCKxC+Tx6IWCHO/YKSgWWBZVuKXZubyXlmPPg2rBxj1AsJRD7hEqY149zV06uBqSFImh9HnX3CBbgHgdLMfQJXwRBjCJMxY5puaiL42fld7pWAhGkgUTGc0vprPiCGv7zby5aKZRYpOJK18GUh9MCZ+ED7J1E2HC7QYwiKcy0Ne8FH5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(6916009)(66946007)(316002)(6486002)(508600001)(186003)(86362001)(6512007)(31696002)(5660300002)(8936002)(8676002)(26005)(66556008)(66476007)(31686004)(38100700002)(36756003)(2616005)(53546011)(6506007)(83380400001)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFFrckp4NTlDT3B1aVBxZWVvYm1zRjhHaVhPSEJhM3l0THdocEVUOFU3QmRq?=
 =?utf-8?B?ZU9iUUo3enN0ek9qQWxYcHppM1VEc2lpbXpXcHN4V2QrSVRrUGZzaVNiazBH?=
 =?utf-8?B?NmtoRFhnWDYzV0xZZ1NTZXN2OHJONDVLWnFZY2w5ei85dCtVVEp2eGRibzBB?=
 =?utf-8?B?aG11WDQ0T0hoRjdUSFMwamo5Y2plcTlpUEZOZk1vOHlXZ3E2eFFNbkVsZldW?=
 =?utf-8?B?VUFBY2c4V2t3OG9lOGNtczNsVmxpNXVMRHZQNFpFdThDM0d2Qi9kSWlKZmIr?=
 =?utf-8?B?Q09aYlUwWnlnMUliYVBta1FqaUlWSkJ6dzkvajNQOVhVS0NJUEJxcURHSlRH?=
 =?utf-8?B?QlJHZHJuT1JPbUVqR3dzVllDQndBQnNQSnBlVkZ0YzBqR1FtUFBJZE45dWps?=
 =?utf-8?B?K1ZvMDc4YTJGa21TRXk3Tjh2MTcrMTVrRWt2b2h6UHVta0drVGJoa3ZscTEv?=
 =?utf-8?B?ek1XSDc3VnRVVmdnNy9wR1d3UHdiUEJGYmZSWG5qVFpIeWE0MUlPWUVaa0Ri?=
 =?utf-8?B?N0JTQTRURXMrajBWK1NsMWNCV1kvWHVxdDFTYmhibzNGMExHOFBvVFl3alVU?=
 =?utf-8?B?NVptOTZiMHlaSXJaaUpGeGFiZDFzcE1aL05aMG83WXZ4SnhOUlZscDZKWVY2?=
 =?utf-8?B?TlQwRXgvSjdxWXdFQUhDa2R6NEZzUVJ1SjJSd2VTSnNsVTNxM2plUlFWdzZK?=
 =?utf-8?B?aG1hdnRwQk5QcHpka1ovVmFJODN5bGFTMTRlVjB1bGw2QlBkWmFYOEZwcUpQ?=
 =?utf-8?B?VlBQYzhEZ2N6S3BSMVRubmM4UEJnaVFoTS92ZCswUWN4bTNrQ0J6QTRQUDZX?=
 =?utf-8?B?RTVDc2xGV0RkUDFWV3k3QWF6SUo5bWZhVklpSEV1VGRpSnZnZ0w3T0dscE5M?=
 =?utf-8?B?SWpsdk1FTzFBdG80ZGFPeVFScVRBdTE2bmRFU3N6VVJyVFFJUDRPZW9kbTlW?=
 =?utf-8?B?SUNxN0FhNkIxMVVadnpZSjl5SUI3NFc4TERvY2xyQVdxN1VmYlZYT3VrUXBa?=
 =?utf-8?B?d3dTT0tIWUpwMDVLOFgyR1RnMXAvUlJGRndXV3B0OUttSE4zR2daMzNTUGRJ?=
 =?utf-8?B?WVBhQ0FBLy9lTTZIdUFWMlI3ZGJ1eGxkeVBvQ1ByU0pXNkU4WGtRWndkZFNp?=
 =?utf-8?B?eWFnZkF6c0ZaUzc3MkFOaUlGblhWOVJxZGdndUNkVFV0V1QxQVpPUlYxOTAw?=
 =?utf-8?B?QSs1MFdZdlFwTWprbEZCVmZKREZ2dVdkMTZlLzh3S1N6M0hOYTNFVWxpMDVE?=
 =?utf-8?B?cFh4cUF0VWJPQ3Zia3BiQXpkY01zVWc4SzVsZGczRXdqNG9PKzZmZFJRZVhD?=
 =?utf-8?B?UC9HRWNIRHJnbDBiNWU5cUJrcFEwNzAwL2oyWm1XS0tlQ3VKSjk4VnppV1lr?=
 =?utf-8?B?Uk5LMWI1SWhSbUNCcVgrRkRTNVlCZ1VYbWpQOFBKb1FPNGxlRmhNelhwQVlp?=
 =?utf-8?B?akdWTXhPZ05VS0dSTmtwWkcwUTlhaWsrQ2VvR0pKZ0s4SDI2Vk5JUERYd2Zn?=
 =?utf-8?B?SGo5Tit6dC9COTY5M2kyczVDVko3SVFlVGZMRURBb0dkUHFqbVdTWGoxUlNj?=
 =?utf-8?B?Y3hOR3EwSlV2QVh4SWFpbVR3T3o5bXVLT21zZUhGWTJHYW5HT2xrajVlY1Vy?=
 =?utf-8?B?YlIvMlhQRFVKZ1JyYWxPeVc5LzNyRiszODE1QmozU0srVTJRc3Q2Y3FndmNy?=
 =?utf-8?B?bnR2U2VBSkI5dzByRFh0VWhMM0VSUjJOdmp6WCtsekk3WGZBcUhxem1BbE1Y?=
 =?utf-8?B?ZklBdzZsTWM0ODZrb3FQaVpudFdCM2tFOGVmbU9wQStlN3BSNW5LMm5QNkhK?=
 =?utf-8?B?am93RFhtU0cyeG9rZXhsSXNBVmVVajYzR2lCS1g3NHVYNUluRHFxaXRIQTB2?=
 =?utf-8?B?ZXFTbWVIbFNtTjRsckxXSVREYjBFQ2dtcjVPVitWaUxON0JaVmVuN1YyV3Uv?=
 =?utf-8?B?U3BOaVVQWWgxMStvRjV6azh5SjBkMEVNbjVmUHd6UzZCRjduTG1mbmxGcm1P?=
 =?utf-8?B?dDYvQUNEZ0NXSFI1OFJuQ3VVY1N1bXNzK1pNQjhoL2hHMlpxUlVINE16WjVT?=
 =?utf-8?B?anVXeDY4eHVvY05HYTV2cWVUYitYUE9FMmxGTUZSUEdlWnJkQUQwbHVlWVhJ?=
 =?utf-8?B?Y1BiKzlIbkJQemI2eWdyMHNId21xSnRsYjdBTms1TjZUbWgvcjFDTHJNRGJ2?=
 =?utf-8?Q?jDI/NqoiYYxIT80zOqBIB9s=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 910c2b84-14d5-48b8-8e37-08d9df59ab2f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 16:50:46.8208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zU4tOe/K+MaV1yJGpzQ6v377jmEXhMfYqtWG4UP1C9J468dsQShr80Cr1NiCKwIL60sLbU7hSH9StlVRdnO37A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB3180

On 23.09.2021 14:02, Wei Chen wrote:
> There is some code in acpi_numa_memory_affinity_init to update node
> memory range and update node_memblk_range array. This code is not
> ACPI specific, it can be shared by other NUMA implementation, like
> device tree based NUMA implementation.
> 
> So in this patch, we abstract this memory range and blocks relative
> code to a new function. This will avoid exporting static variables
> like node_memblk_range. And the PXM in neutral code print messages
> have been replaced by NODE, as PXM is ACPI specific.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>

SRAT is an ACPI concept, which I assume has no meaning with DT. Hence
any generically usable logic here wants, I think, separating out into
a file which is not SRAT-specific (peeking ahead, specifically not a
file named "numa_srat.c"). This may in turn require some more though
regarding the proper split between the stuff remaining in srat.c and
the stuff becoming kind of library code. In particular this may mean
moving some of the static variables as well, and with them perhaps
some further functions (while I did peek ahead, I didn't look closely
at the later patch doing the actual movement). And it is then hard to
see why the separation needs to happen in two steps - you could move
the generically usable code to a new file right away.

> --- a/xen/arch/x86/srat.c
> +++ b/xen/arch/x86/srat.c
> @@ -104,6 +104,14 @@ nodeid_t setup_node(unsigned pxm)
>  	return node;
>  }
>  
> +bool __init numa_memblks_available(void)
> +{
> +	if (num_node_memblks < NR_NODE_MEMBLKS)
> +		return true;
> +
> +	return false;
> +}

Please can you avoid expressing things in more complex than necessary
ways? Here I don't see why it can't just be

bool __init numa_memblks_available(void)
{
	return num_node_memblks < NR_NODE_MEMBLKS;
}

> @@ -301,69 +309,35 @@ static bool __init is_node_memory_continuous(nodeid_t nid,
>  	return true;
>  }
>  
> -/* Callback for parsing of the Proximity Domain <-> Memory Area mappings */
> -void __init
> -acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
> +/* Neutral NUMA memory affinity init function for ACPI and DT */
> +int __init numa_update_node_memblks(nodeid_t node,
> +		paddr_t start, paddr_t size, bool hotplug)

Indentation.

>  {
> -	paddr_t start, end;
> -	unsigned pxm;
> -	nodeid_t node;
> +	paddr_t end = start + size;
>  	int i;
>  
> -	if (srat_disabled())
> -		return;
> -	if (ma->header.length != sizeof(struct acpi_srat_mem_affinity)) {
> -		bad_srat();
> -		return;
> -	}
> -	if (!(ma->flags & ACPI_SRAT_MEM_ENABLED))
> -		return;
> -
> -	start = ma->base_address;
> -	end = start + ma->length;
> -	/* Supplement the heuristics in l1tf_calculations(). */
> -	l1tf_safe_maddr = max(l1tf_safe_maddr, ROUNDUP(end, PAGE_SIZE));
> -
> -	if (num_node_memblks >= NR_NODE_MEMBLKS)
> -	{
> -		dprintk(XENLOG_WARNING,
> -                "Too many numa entry, try bigger NR_NODE_MEMBLKS \n");
> -		bad_srat();
> -		return;
> -	}
> -
> -	pxm = ma->proximity_domain;
> -	if (srat_rev < 2)
> -		pxm &= 0xff;
> -	node = setup_node(pxm);
> -	if (node == NUMA_NO_NODE) {
> -		bad_srat();
> -		return;
> -	}
> -	/* It is fine to add this area to the nodes data it will be used later*/
> +	/* It is fine to add this area to the nodes data it will be used later */
>  	i = conflicting_memblks(start, end);
>  	if (i < 0)
>  		/* everything fine */;
>  	else if (memblk_nodeid[i] == node) {
> -		bool mismatch = !(ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE) !=
> -		                !test_bit(i, memblk_hotplug);
> +		bool mismatch = !hotplug != !test_bit(i, memblk_hotplug);
>  
> -		printk("%sSRAT: PXM %u (%"PRIpaddr"-%"PRIpaddr") overlaps with itself (%"PRIpaddr"-%"PRIpaddr")\n",
> -		       mismatch ? KERN_ERR : KERN_WARNING, pxm, start, end,
> +		printk("%sSRAT: NODE %u (%"PRIpaddr"-%"PRIpaddr") overlaps with itself (%"PRIpaddr"-%"PRIpaddr")\n",

Nit: Unlike PXM, which is an acronym, "node" doesn't want to be all upper
case.

Also did you check that the node <-> PXM association is known to a reader
of a log at this point in time?

> +		       mismatch ? KERN_ERR : KERN_WARNING, node, start, end,
>  		       node_memblk_range[i].start, node_memblk_range[i].end);
>  		if (mismatch) {
> -			bad_srat();
> -			return;
> +			return -1;
>  		}
>  	} else {
>  		printk(KERN_ERR
> -		       "SRAT: PXM %u (%"PRIpaddr"-%"PRIpaddr") overlaps with PXM %u (%"PRIpaddr"-%"PRIpaddr")\n",
> -		       pxm, start, end, node_to_pxm(memblk_nodeid[i]),
> +		       "SRAT: NODE %u (%"PRIpaddr"-%"PRIpaddr") overlaps with NODE %u (%"PRIpaddr"-%"PRIpaddr")\n",
> +		       node, start, end, memblk_nodeid[i],
>  		       node_memblk_range[i].start, node_memblk_range[i].end);
> -		bad_srat();
> -		return;
> +		return -1;

Please no -1 return values. Either a function means to return boolean,
in which case it should use bool / true / false, or it means to return
a proper errno-style error code.

> @@ -375,26 +349,69 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
>  			if (nd->end < end)
>  				nd->end = end;
>  
> -			/* Check whether this range contains memory for other nodes */
> -			if (!is_node_memory_continuous(node, nd->start, nd->end)) {
> -				bad_srat();
> -				return;
> -			}
> +			if (!is_node_memory_continuous(node, nd->start, nd->end))
> +				return -1;
>  		}
>  	}
> -	printk(KERN_INFO "SRAT: Node %u PXM %u %"PRIpaddr"-%"PRIpaddr"%s\n",
> -	       node, pxm, start, end,
> -	       ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE ? " (hotplug)" : "");
> +
> +	printk(KERN_INFO "SRAT: Node %u %"PRIpaddr"-%"PRIpaddr"%s\n",
> +	       node, start, end, hotplug ? " (hotplug)" : "");

Continuing from a comment further up: Here you remove an instance of
logging the node <-> PXM association.

>  	node_memblk_range[num_node_memblks].start = start;
>  	node_memblk_range[num_node_memblks].end = end;
>  	memblk_nodeid[num_node_memblks] = node;
> -	if (ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE) {
> +	if (hotplug) {
>  		__set_bit(num_node_memblks, memblk_hotplug);
>  		if (end > mem_hotplug_boundary())
>  			mem_hotplug_update_boundary(end);
>  	}
>  	num_node_memblks++;
> +
> +	return 0;
> +}
> +
> +/* Callback for parsing of the Proximity Domain <-> Memory Area mappings */
> +void __init
> +acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
> +{
> +	unsigned pxm;
> +	nodeid_t node;
> +	int ret;
> +
> +	if (srat_disabled())
> +		return;
> +	if (ma->header.length != sizeof(struct acpi_srat_mem_affinity)) {
> +		bad_srat();
> +		return;
> +	}
> +	if (!(ma->flags & ACPI_SRAT_MEM_ENABLED))
> +		return;
> +
> +	/* Supplement the heuristics in l1tf_calculations(). */
> +	l1tf_safe_maddr = max(l1tf_safe_maddr,
> +			ROUNDUP((ma->base_address + ma->length), PAGE_SIZE));

Indentation and unnecessary pair of parentheses.

> +	if (!numa_memblks_available())
> +	{

For code you touch, please try to bring it into consistent style. Here
the brace wants to move to the previous line, seeing that the file is
using Linux style.

> +		dprintk(XENLOG_WARNING,
> +                "Too many numa entry, try bigger NR_NODE_MEMBLKS \n");

Here you want to fix indentation and ideally also format and grammar of
the actual log message.

> +		bad_srat();
> +		return;
> +	}
> +
> +	pxm = ma->proximity_domain;
> +	if (srat_rev < 2)
> +		pxm &= 0xff;
> +	node = setup_node(pxm);
> +	if (node == NUMA_NO_NODE) {
> +		bad_srat();
> +		return;
> +	}
> +
> +	ret = numa_update_node_memblks(node, ma->base_address, ma->length,
> +					ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE);

Indentation again.

Jan


