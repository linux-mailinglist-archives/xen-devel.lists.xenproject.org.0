Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB8A49B12E
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 11:18:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260037.448992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCItb-0006Ag-AD; Tue, 25 Jan 2022 10:17:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260037.448992; Tue, 25 Jan 2022 10:17:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCItb-00068W-69; Tue, 25 Jan 2022 10:17:51 +0000
Received: by outflank-mailman (input) for mailman id 260037;
 Tue, 25 Jan 2022 10:17:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81on=SJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nCItZ-00068Q-H0
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 10:17:49 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ba4c998-7dc8-11ec-8fa7-f31e035a9116;
 Tue, 25 Jan 2022 11:17:48 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2057.outbound.protection.outlook.com [104.47.0.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-35-QpDgVySLN_GN0lg5REMCFQ-1; Tue, 25 Jan 2022 11:17:47 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM8PR04MB7778.eurprd04.prod.outlook.com (2603:10a6:20b:24a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.19; Tue, 25 Jan
 2022 10:17:46 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::353c:89ba:2675:f607]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::353c:89ba:2675:f607%4]) with mapi id 15.20.4909.019; Tue, 25 Jan 2022
 10:17:45 +0000
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
X-Inumbo-ID: 0ba4c998-7dc8-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643105868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X8ajbNfMOWiJ/2/Ts8QtcBsVOMF5PHIpFR70xwXWIl4=;
	b=TSZtF/Y8zuvi4tGHEKxHMZoumW9+ZBeW1DpUKeeMG9kC3LWZQzic1YF38YTPxxYsBxEARl
	Wz8vb9iMV0z5aUEECaf3fs+ZhxWFL3QZCCklhEuslP3FtjZZKT0XJTN+kc7MB9upqFd46D
	Kwh5mQ8MYGP5HZWYrfexy2Sb5WcWVpI=
X-MC-Unique: QpDgVySLN_GN0lg5REMCFQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LTNOnqgAt+OltknnypReFb9hMfN5YAWrQAEZQvajhayec+GFrTw6LYpe/bjhtSrPd7X3mme/Yo8vBqi7kKdNeA09VwZ7FBSByln3LU8MU5hEy+xFEf0IYxj262INe4b/l/fr26/UNSKpLCjil2/WyPJUrHi88kBpXFTyOV1MJKHkFMKoyr3tFOPqjrH1qN5tpnGLqR3XeZF8+7e/8WC5rp/iszq8RIhPAMQdPkygeLY4GPh7/7X9bPQ9nuSoBaOD05gO9xgzLd9rmiT2EqzYYehkAqDq8sduub0ga28nuTu3L9fziqvofUMOE+lIEBM5B02ljeRFzDNcg2QOXrZOhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X8ajbNfMOWiJ/2/Ts8QtcBsVOMF5PHIpFR70xwXWIl4=;
 b=a2dwdpKn0HBmkbObcmpJiK3QeiLKLVVHVuME88ziO8pEWI0aeeU9FSh9oTche5cERTP2DCsuLByqTD4oq08pmnoovAcktjmvp5RX5llE02fdP14dUyc6OuFdXri/De4nhDRJtUSFlAy5l5OmON6UupST185gi6vwg2CrE/rFrVdql6qH0ZMDXaibalqnww88MEh43kAD9rrEXq4gDR8QnkDiJ5hnXF6EQJ6iqhM//M4moMiMxWWdkUgsOHRs4FjRh88Rdzl8rjFu8axc7Y56XrhmiOVo8wMGVvP84dMYtx+s88IMqm/HBpqIqbT8BjKuJVYs68gqHQvjb2CjbwjM8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <66b9e129-8c6f-22d4-644e-ffff1dc2b559@suse.com>
Date: Tue, 25 Jan 2022 11:17:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 15/37] xen/x86: rename acpi_scan_nodes to numa_scan_nodes
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: Bertrand.Marquis@arm.com, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, julien@xen.org
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-16-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20210923120236.3692135-16-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0042.eurprd06.prod.outlook.com
 (2603:10a6:20b:463::27) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14622243-057d-460e-8570-08d9dfebee46
X-MS-TrafficTypeDiagnostic: AM8PR04MB7778:EE_
X-Microsoft-Antispam-PRVS:
	<AM8PR04MB7778AE51D1FA6F6435EB3985B35F9@AM8PR04MB7778.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JiOU5Ymoi4i0cGEQ5V1i5l49kS7FTf3F5n6hNPz/Hyddfbu76A3S+EpfA2c8o2MkfDI8I8awe3dDbzRcGZnlsI6OcjlYlyl8xJk/L14rAIwmWfOOxtXqBvRFnBpoEkDkBv2Sr7m3fGCM5DXcAHfqRmZo+YUMgv3etZTHTaH7gvpzr9x9H+JlIXLp8Ns0/FFlQyuelwoEWzW1VcLo6fnvNWu/7mpMnHffFu1h5+6Del/beELX7ASO/s2C6gxxBe1mMiQNzfuZp9ydUF5igOywNv+MzwJvMJMzx1MUNKQfI38fclaorUAgQRyh7Vn2kbuGL4GwZBQiGBdKo28nSdg/WAWG6TRlP16nN4hbe/7Y7sPrxMT+uF1UrOVcqtDF++kO4VpfFjgM4ccM3W4peiN+COuik+O8Co8v9iTNBswlV0U+wx+inivX/8Sp1Cqi22G01O3gmD8mXQqOgbNQorOB3MGiDPXFxfhoh6AW/ZqeywcPB0+dwV4VLnRiVpi3yEvmVwlog/das4vorDJX5HKf8o85BINPiAqfFTcaHqpPC6HLug39oPqWYNdBAYwMxfT1c5/Bw6WCVzGQJRH+2zkXh2rp1JhqOvpNMbarDazCr/OqjOwbYAYctrpD/EARnwjH1tydn4C6Mn4k5QSlTAUvX94u2FayBPTGtxYOG2rT7b7wsgjnzKYTpRIEJ6f9nmuRXqhlRuW4VwHxBRqEge86R29E4vuX4FsfA0pQ9ViRNu2gPjVBgcInLiWq8TcLyqUw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(36756003)(6486002)(6916009)(31686004)(8936002)(316002)(508600001)(86362001)(66946007)(31696002)(6506007)(5660300002)(4744005)(38100700002)(66476007)(66556008)(53546011)(6512007)(83380400001)(186003)(2906002)(26005)(4326008)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWp5VW4rZ2lNSUdUMEdOcE5iRmpMZ2RobUdDdFNTZGtaWHhPUEhOL3VzZ0tv?=
 =?utf-8?B?UDVvUUFOVGd3YUFrZVBFVm0vVHZZaS91a2tUSVlZeEhhNDU5ajNwZmh0WDBN?=
 =?utf-8?B?Ui9MUE11SHdjdXBHTnZqMnNjUG9NUS9Oa2RMZmZidllDbzhYTWoyendQSkYv?=
 =?utf-8?B?dERxUWFqbVFqQUUwQVk0SkZoUGtUcndrQVovMDJJeGE2U0FRUkdjNFFUM3J3?=
 =?utf-8?B?b2MzVUlUY2V1UXhCamd5eTc2YXUzeWNOOW5Za2s4NkhZZXA0ODRVR2tNNUU0?=
 =?utf-8?B?L1NLUFJTUkx3OEZKUWdNaUlWUnNtMEJDeGJWOFpIS1AwUXYvK29yQzhtWktL?=
 =?utf-8?B?SU1LUURSaFE2clZETThjamJOK0ZkY1VQUEtHVlhXdlBEU1lqYWk0dUNnRjBG?=
 =?utf-8?B?U3doSWt4bDBvWGlGZkV3RkprY0xXM0FuVGJvSmEyeXhqeGNXQVA5UHNlK2VS?=
 =?utf-8?B?Um1qMzBWdGduWkdBblFZWjB6bURROXV5WmZkZzQ3QzNjUnhVR1V1ZDRRQU8v?=
 =?utf-8?B?OVVtY01zQTN2R2xhbUUvQVY3Z1dZeDVEWXJvWXc0NFZubzg0VWt0b2hNbWkx?=
 =?utf-8?B?WW5xYzlNK0IybFczNGlFdnZhT3Jpb3p0dTJPdW02NG5NVEFENlJYUG9zZEJp?=
 =?utf-8?B?MHhEeGNGcm1JY090Rzc5V21BWjNZZ09LN2pSckpaTW5SV0Z6Ny9DWERha1dK?=
 =?utf-8?B?cUw5SVIzVkRFeXFHU0hWQ0xnR3llSElVbnZnMm56b0l1ZVp4SHBlRHJHTkdr?=
 =?utf-8?B?K1VDa04vMjdVWDBxTEhjM3VCc3liT3NldjVaOXpXNTdGQUlzVVdoVTJZdHNN?=
 =?utf-8?B?ZTNJWEtOUVg3ak9QYTBRd0t0RHUwSXgreTRiQUpvVFFKS3lIN1Y1RDA4ZmlJ?=
 =?utf-8?B?OWdCR2dJbVdsYlEvZktmbzhZR1ZLWmYvNWszdVFSZVNlTzlFVXY5NGp3NzJm?=
 =?utf-8?B?WUpoN05IY0VpRGpMQnl4TzdHYnlzbk4wMVdGbTVHd2J5NFJBY1AzbngzTXpK?=
 =?utf-8?B?aGM2MDRLU2JpeWgwQjlkOXg5anczTDdEa0pWR2Yyc1cxUk9ueVpqcEpmb05r?=
 =?utf-8?B?QkJnbWkxajZ1bmI5OHlkMkd3aVpWQksvcHdUcGNRVTJtSmxxTkpQYThpaDN4?=
 =?utf-8?B?T205aHA4MHlUWkJRMzJBWDMxaTBnOXRMYzErU0gzUCtyMytwNEtVZmlCZlpO?=
 =?utf-8?B?enhDRmxWM0Y0RFNONGRrSTBBalJhSWJCSTVmUkNTaUMwREt6WjlFQmR5bTVi?=
 =?utf-8?B?MnhRdHUzN28xNU92L1dQVWlXSFZ0Zjg3bGY0SVZXd1RKazJNTEpTcW4vM251?=
 =?utf-8?B?ckYrc2x2Y3J6OUFsRG1XcitvR3BRNEcwNVdGckNVdzYzbUhPZGFYYTZpTG9k?=
 =?utf-8?B?Mk02cVJlNWsvb3Y4V08zVGNDQ0xlVm5ldEhLYWFpL0Q1ZjdVSXBsTTN3cVVp?=
 =?utf-8?B?MVlEOGpqMDV1aEVjcmkzd1NOMi9ITFdIK283dElqQXZsVXRxeFgxdHQzdTdR?=
 =?utf-8?B?STR4RW5UbVc1eGlJZ3ZJYUpxbi90TG9uR1A2WjBZOTFvOXV3RGtsNTNZbDND?=
 =?utf-8?B?NHQ1eVh3VU5JdmZ3QzRjL08xWGhzK1hyRUhPNEhTVk5uenl6ZkFieFNaUEtI?=
 =?utf-8?B?aVhoV3hwQjcwNlhGV1hXYnNESHdBcGY5R095dVJpWkxTOWIzS0IwSkF5UlpO?=
 =?utf-8?B?RGNiZnBITGMvWktKa05NeE0ySTQ4NkRTZXdobURGV3BJOHBaVVRvYUpQc09h?=
 =?utf-8?B?UnplS0NrT0xHYWU4YVp6WG5LSmdPQ3FwM21nOGw1akJ2K0tVV2IxWG4rK2di?=
 =?utf-8?B?cnJBUHplakJQaGpiRFZHTUJuOUEySUZKSk1vKzFhWGhQb2Z4WWR2ODlSWGRS?=
 =?utf-8?B?VExuUW5tUHh1cE5xNFpMNGxoZXNjNFBrYjB0S0ZRTEdGUmNBNkFnQ1VsV3Vi?=
 =?utf-8?B?S3J5cFEzeUM0NFdPNGdQNEpaM2hLZ0pNNHRvelJJNkNsdU5JNStFRVNtalRz?=
 =?utf-8?B?alA5UHNZMFRZSGwwK0UvWkRQMy9oTUhDQlRRZVYxbEtFM3JRQk96Q0dvZ01y?=
 =?utf-8?B?dTNWY2Y1STZha2NhQVkyK3cvYzZiV1RaK1lwVktReHI0N2ZSejRDRStEZWFq?=
 =?utf-8?B?MDQ1YUgzcS83K2RMQlhYYU9JUGFGRTMrbFhFRml6WWU0d1VPWWZLQU44TW5r?=
 =?utf-8?Q?klqoITVLnaUOjVYM9XggVyY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14622243-057d-460e-8570-08d9dfebee46
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 10:17:45.9105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PopCxctXJNYsu5V0xY1rcBrWJn9xWrEgnxZRnBgUS0FYjKA2210aMBypY1i7uIEC42dunam/Upbt8IrbAhZgkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7778

On 23.09.2021 14:02, Wei Chen wrote:
> --- a/xen/arch/x86/srat.c
> +++ b/xen/arch/x86/srat.c
> @@ -512,7 +512,7 @@ void __init srat_parse_regions(paddr_t addr)
>  }
>  
>  /* Use the information discovered above to actually set up the nodes. */
> -int __init acpi_scan_nodes(paddr_t start, paddr_t end)
> +int __init numa_scan_nodes(paddr_t start, paddr_t end)
>  {
>  	int i;
>  	nodemask_t all_nodes_parsed;
> @@ -547,7 +547,7 @@ int __init acpi_scan_nodes(paddr_t start, paddr_t end)
>  		paddr_t size = nodes[i].end - nodes[i].start;
>  		if ( size == 0 )
>  			printk(KERN_WARNING "SRAT: Node %u has no memory. "
> -			       "BIOS Bug or mis-configured hardware?\n", i);
> +			       "Firmware Bug or mis-configured hardware?\n", i);

Besides the prior theme of in-place renames not making clear why the
rename is being done (by deferring to future patches then moving the
code) I'm puzzled by you replacing "BIOS" but leaving "SRAT" in place.

Jan


