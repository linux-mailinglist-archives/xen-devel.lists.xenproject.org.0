Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 188885F06A4
	for <lists+xen-devel@lfdr.de>; Fri, 30 Sep 2022 10:36:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414087.658171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeBVY-0008FK-3j; Fri, 30 Sep 2022 08:36:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414087.658171; Fri, 30 Sep 2022 08:36:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeBVY-0008DD-0m; Fri, 30 Sep 2022 08:36:32 +0000
Received: by outflank-mailman (input) for mailman id 414087;
 Fri, 30 Sep 2022 08:36:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bHGM=2B=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oeBVW-0008D7-H7
 for xen-devel@lists.xenproject.org; Fri, 30 Sep 2022 08:36:30 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2083.outbound.protection.outlook.com [40.107.20.83])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa6bc32f-409a-11ed-964a-05401a9f4f97;
 Fri, 30 Sep 2022 10:36:29 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6919.eurprd04.prod.outlook.com (2603:10a6:20b:10e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 08:36:27 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 08:36:21 +0000
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
X-Inumbo-ID: fa6bc32f-409a-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gt0QJJNnmV9AlTrf6BZnVs/voyMgwzzAWtQSzKPCiFbyZlJO7BQ8Wwq4okSbjW1tMoUZr7fvAg+BPBhxb8kbTNZGWPAaYWVHWro8DrhyEb9GjZfZXO+1Y3gYNBE7naWMykkIXZx9cgTsHxv+3AhJoLnA2BsfXPHHHSEA0b8B8EerR4nP04X0FaYydYRJKTTOZVh88Lz5AYm18l3KPafebJtu7B+hTPLh+PhAAwP2h93YR0YeIAL85D0rWqtsX2uiYOdGDyZ3upfkGIXr/lpdiTXdwp06mIUu/WmmeqSefsohO/xMJh/rUrSMPa4qrbN3RJE7O5WsJES0l4vXiKplsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qvE2Hj0t5QUvQsd6fn3XoiQAlMmNPdrwVTOWgCLm0ew=;
 b=NDPoDbiuIqsUX2PNI0njmS3XEVK3b5ZmhnoxDPBiDLaA50FT2qNazFPHspyQ70z5sav/NNhl1MfHgY3f5j1R7TFLTEhtgcWIPEeODcKr/NnRRDYJefqwS9qmQKzq5UE0RsTuC8/5L/kdkE61ppQe90D+MoySoHKdFuvYtGdJgc1V0q8UmkNydt6KvTM8Iyz1jtNjYxFrOD0UmP3COiBSoM6uvk98+DFuCrxgIdl/MupQU59Fl3xS6YY6a15poz4t5w7brIf9x300BN0egW/FgxIJygnt3MfzLOjCPpfK7ldrEUhBhUBjBpOQ4Tg5670nB8M56+22d2iaUTai/jWPrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qvE2Hj0t5QUvQsd6fn3XoiQAlMmNPdrwVTOWgCLm0ew=;
 b=X4IfrEkYeXKYwB0Ap0Z+qV1H0yCMPdlstEdreetRygQlknpy3wxOMxTK54tk4SU6HzEoVyH8Ys+2Mup3Zi3bK1paO1Lk02C916gYQmhiEkiNPEydwHO5lCYSKwumYBxCmj5H6LPK+HBs8JG1OKQQnktYt0cOZtCposziwVPw9yuuBtnmnVyjbGFBz8eNWD4V+Y6FIJRnK8uo5GyXxQvjzSOCKoytS9Xank4l3TW0qbERYD0S3mNAoX6dzWWY0ozDQOdkip6u6kIW3gCx5hbXcqamu326W8f0apVnvt9yIRJTMPS7CDfNw96FTHSYvGFkKfZlRd0nKcoMX5ZtWpmUKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bf0168ea-f78a-477a-d3f6-cbff22b07cd1@suse.com>
Date: Fri, 30 Sep 2022 10:36:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] x86/NUMA: improve memnode_shift calculation for multi
 node system
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <84f1b8e4-3927-1986-9ca7-043790ed7011@suse.com>
 <Yzan9D2gZJ6yN3wq@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yzan9D2gZJ6yN3wq@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P192CA0008.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:83::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6919:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e22e528-3aaa-4b70-7140-08daa2beda3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QZeWY4d2HXa7nnPdhaS/0YAUwPEG3m9BK8CEH2tZ/f9g+/jbTwrXctjVyxrjG+jKWMha6iiczS490J96wvSvfhvnobrUYCrwNi0BA14ADwjifMmTxoeeJlIUoNoIxxq1TcWZpUISt0UEI+S5pVHHtE1sai02LVQSAI7bqKuiTHl62jXIBPiqiBpHXhkZ6XHGFeP5zq10hPCh9J4hDM8ap48k3xJDUfyMlJ3ubHZIrJnEenXMKhKeInusGE+oidktYISeXqL+0ylXtp+BVQz0vWWMvjhYdSuiV8gshV7+kIvDO51LAOKWwKlbqqUEDj3cKg7G7VNVykiIIl2cD6ocFIbcIcl7zPeY6Fuq3fhDXz2qjmsjFBl7NXZJjJvwkANfGoHmun8p/0aYUwE2ALkgz9u9BKh4JKYIrcA6F1X4MPRfAe7075PCEnmftAXkLtEoBs4uE5P2ltARsGouNEmHtwaeN51N1GEgWb4u25Ev2PLbNimZ3JkXPlGbieHg2pJG3TqEJlNiRlmgKmRTFkonyVZt04iJyIF/mBfVmRIsmRTaJVnQ8cJ+8H6W1Ugd7LVcJrGPSRZLxPAnwCx1R7nVz80gyF9BlgdOuGpcS8EHwyMlHShDXVONXDo37Pu4QNjX9BCl0kn9A2osD47s1J+TV92eIcMlRwE6oWYdVp255Ca3iH4SE9wpqKxuAdeFbYOdkMOdLTS3DS1bGmNY1WYSDiDFcjV1e15V10bw4UYLO9Hq8hJoRTvQUf+9AqAEEs14NBKfLMQPZd3TioEJwoLPcNIrrwIadWFziP/lG/OqsRo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(376002)(396003)(346002)(39850400004)(136003)(451199015)(38100700002)(5660300002)(86362001)(26005)(8936002)(6506007)(31696002)(6512007)(53546011)(36756003)(4326008)(8676002)(66476007)(66556008)(66946007)(41300700001)(83380400001)(186003)(2616005)(31686004)(6486002)(2906002)(316002)(54906003)(6916009)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dGhZdEVEa3JiRCtsVk1WOHVWUEYvNFNjaEpQcjVUeXRydmZPelcvUGlJWC92?=
 =?utf-8?B?TjJWck5kTnlqYzI2SVdpYlRjRW5aWGNxU243OGJvK1Y2eDJtSXUrOFZuMUVT?=
 =?utf-8?B?TjhhdmV5Sjg4SXRybE5wVW0rUlhHeFNKNGZySWJQcHFLb1lKR3RuWTQxbjVX?=
 =?utf-8?B?UmhkTUFUR003SEZ2akVzdmxiM1RKTktPUjNJRlBvTExFc1BqaXpNOFVBd3dD?=
 =?utf-8?B?WmZVZGd0VysyYytzRjFxTytnMnQ5YnFWQ1RNRnFvR00yQzN1TWUyem9WdXJl?=
 =?utf-8?B?RjRFVDV2K3JNaFQzRXVNQmc4R28rVW9iOTBNam93TU9FYVdpRWhqUnpvWUlq?=
 =?utf-8?B?THFMRE5ROExVUjB6VTVHdEhNaXVBQUdDM2kwQm5kMWtYd2R6bXpBcWltMDdt?=
 =?utf-8?B?bHVCZEVmQzF4VE44MzZSeFpndjUxUjJjaDM1cWZQTGx4QjRNQ3dzVUIySENY?=
 =?utf-8?B?R1ZLQXhFOFc1bTJSMEdISkhNYUhBTjhxdzR1empQbnVnZTNXSnBhQVN2aXlG?=
 =?utf-8?B?SjV5ZDYzaTJtZWxUdFRYWGs1ci82L1pucWRkM1pKTWh0OG43cVN0VlpCdENI?=
 =?utf-8?B?R3NKZUQ0MFV5aGRWSHFYZkxYZi8vWGJCY0hWNW1aNUNpS1h6OE96ZEZlMHRJ?=
 =?utf-8?B?RzluczJVMnB5WnVYRm5FRW9BWE85ejVEZ1VDU2NPd00wNzJaY1pVK0YzSmlm?=
 =?utf-8?B?MnJIbXNvZnpZckExODc5UjRRT1FNVWE5bDdCK2doVEJ2dVRnN2lKZ3RwTUxQ?=
 =?utf-8?B?VHpSYSsyUXlSeHV3LzRqZmx2WUcwdytWQ3VHcllndHBGNHRvV3RGZWswTFp5?=
 =?utf-8?B?M0tYRmgrdUVKTld6NWFOSW1VUzBoRktZd0dtaitFYThQakNsRXZkc2R3ZGJ1?=
 =?utf-8?B?UTVodXplNGFkOHdWa0hLdDRyS3ZkSUlwQWtLTWVLaFdZNXdVQm9xRzd5YnVJ?=
 =?utf-8?B?N1FDb3BhYldmeHYzU1lYQ05ZNjlJa1BBRlc2WU1DMXE4MnVBSXVENHRxS2Nn?=
 =?utf-8?B?ZnF5Ky9QT25IVU45cW9RQzhUOU14MHZoSGQ4RXNhTG03eGR3OWE5NWRsQ2k5?=
 =?utf-8?B?di9RNVZaS2JaNGFQSXNKcmt1MVVXMHUvZHJNTzdoZ0ZaSGY2amhqTHJWZGd1?=
 =?utf-8?B?aHVWdUpyQS9NTW5DNVZPdERPWnh6cmtMTEd0VDdnNmJqY3dXZm9pSzhUek12?=
 =?utf-8?B?SWx2VnlDRmlCWC91bHVHbzRuZ3RscHh5a2xBVExBZysyVkl3M3ZNRlJud2VS?=
 =?utf-8?B?bnJwTkJmY1dWNElxN09qTm44ekpZU1grSURYN0YyRVBWL0VvYXJxUVBzZlMy?=
 =?utf-8?B?QWY2cXpHMnkxdVUrVDBxdFdIN21QcndHUGVYaklmekdKVnRkZGw1Q21GdDk4?=
 =?utf-8?B?T0h0M2ExWVJucjVZVG5zd21XV1NCVDR4eC8vTVRRMHJ2bnlwK3RFeHVRYlBL?=
 =?utf-8?B?L3BzTVdZRHRlTlpPejRnRm9ZRHpBL2FmZGpFejl4ZU5QMHdIWThnNC8yc0k3?=
 =?utf-8?B?ZE1ra3h2Sjhyaks2dGdGS01pZEd6MXlkY2M1Mk1MU01OWWF0QnRsdCtNQlB5?=
 =?utf-8?B?QkFWcHZPU2ZKWE1SdThUMTd0NXlOTmFoQ2J2K2JmNmtKTkNXQkJwMzhwWVRT?=
 =?utf-8?B?UFU0UWdlQzYzZ1BoV3l4UjlPRWkxZzdmeXJUUXQvNERDVERWTm5oaEUyZDdt?=
 =?utf-8?B?dG5BUzdyZE15OWRRN0FVa1hSNWJ4ZXdqc1JoNXBXZGN5NW85R2c2Nlk1Mnl4?=
 =?utf-8?B?RGpmQXA0cWtDeDlKdW9aWmRQWVdFbitKQ2wxa0krNGZvQlVsSzNmY3RxM2JV?=
 =?utf-8?B?Y1hYYy9iYnJIelhIZEZkR1Zlb3NWa1NPQldZOUhZQWdJNUdMd05qMXBpL2xp?=
 =?utf-8?B?bFlUS3JIZ2s0L0tBVHRJKzQ2Rmo4N2RKWTd5QzhtUjJtYVNBSkw0YmJ6QlFT?=
 =?utf-8?B?Y1d4VTFRQ0VSNE9NZ0NrTmNjQnJtWHU2VVRZYVBrUXVRdi9BRHZiS3VlUlVT?=
 =?utf-8?B?aW8wVTc0bnIxUGFrYzlmNjFIOFNNbHU3OTBmNklmVmhnSjVPVHJabTlYSXFP?=
 =?utf-8?B?YWh4TlZLeERxVFdVa2hINGQ2Nlo0UFQybGIwV1Z6U05NWUdQM09ENW4rWXMz?=
 =?utf-8?Q?E8ot/+NrEiAgmsjZISAemuffH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e22e528-3aaa-4b70-7140-08daa2beda3a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 08:36:21.7126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1kfwdal+UMvsYNmaauWfXauxv9i/eXGVzHJUboMtXqw+umA4hPSpERV3i5CiciX3bjmX8JiUUPYuNK13EcQf2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6919

On 30.09.2022 10:25, Roger Pau Monné wrote:
> On Tue, Sep 27, 2022 at 06:20:35PM +0200, Jan Beulich wrote:
>> SRAT may describe individual nodes using multiple ranges. When they're
>> adjacent (with or without a gap in between), only the start of the first
>> such range actually needs accounting for. Furthermore the very first
>> range doesn't need considering of its start address at all, as it's fine
>> to associate all lower addresses (with no memory) with that same node.
>> For this to work, the array of ranges needs to be sorted by address -
>> adjust logic accordingly in acpi_numa_memory_affinity_init().
> 
> Speaking for myself (due to the lack of knowledge of the NUMA stuff) I
> would benefit from a bit of context on why and how memnode_shift is
> used.

It's used solely to shift PDXes right before indexing memnodemap[].
Hence a larger shift allows for a smaller array (less memory and,
perhaps more importantly, less cache footprint). Personally I don't
think such needs mentioning in a patch, but I know others think
differently (George for example looks to believe that the present
situation should always be described). In the case here a simple
grep for memnode_shift would tell you, and even if I described this
here it wouldn't really help review I think: You'd still want to
verify then that what I claim actually matches reality.

>> @@ -413,14 +414,37 @@ acpi_numa_memory_affinity_init(const str
>>  	       node, pxm, start, end - 1,
>>  	       ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE ? " (hotplug)" : "");
>>  
>> -	node_memblk_range[num_node_memblks].start = start;
>> -	node_memblk_range[num_node_memblks].end = end;
>> -	memblk_nodeid[num_node_memblks] = node;
>> +	/* Keep node_memblk_range[] sorted by address. */
>> +	for (i = 0; i < num_node_memblks; ++i)
>> +		if (node_memblk_range[i].start > start ||
>> +		    (node_memblk_range[i].start == start &&
> 
> Maybe I'm confused, but won't .start == start means we have
> overlapping ranges?

Yes, except when a range is empty.

>> +		     node_memblk_range[i].end > end))
>> +			break;
>> +
>> +	memmove(&node_memblk_range[i + 1], &node_memblk_range[i],
>> +	        (num_node_memblks - i) * sizeof(*node_memblk_range));
>> +	node_memblk_range[i].start = start;
>> +	node_memblk_range[i].end = end;
>> +
>> +	memmove(&memblk_nodeid[i + 1], &memblk_nodeid[i],
>> +	        (num_node_memblks - i) * sizeof(*memblk_nodeid));
>> +	memblk_nodeid[i] = node;
>> +
>>  	if (ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE) {
>> -		__set_bit(num_node_memblks, memblk_hotplug);
>> +		next = true;
>>  		if (end > mem_hotplug)
>>  			mem_hotplug = end;
>>  	}
>> +	for (; i <= num_node_memblks; ++i) {
>> +		bool prev = next;
>> +
>> +		next = test_bit(i, memblk_hotplug);
>> +		if (prev)
>> +			__set_bit(i, memblk_hotplug);
>> +		else
>> +			__clear_bit(i, memblk_hotplug);
> 
> Nit: I think you could avoid doing the clear for the last bit, ie:
> else if (i != num_node_memblks) __clear_bit(...);
> 
> But I'm not sure it's worth adding the logic, just makes it more
> complicated to follow.

Indeed. I did consider both this and using a single __change_bit()
wrapped in a suitable if(). Both looked to me like they would hamper
proving the code is doing what it ought to do.

Jan

