Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F1462EE95
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 08:43:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445465.700641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovw1n-0004CV-Av; Fri, 18 Nov 2022 07:43:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445465.700641; Fri, 18 Nov 2022 07:43:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovw1n-0004AB-6W; Fri, 18 Nov 2022 07:43:11 +0000
Received: by outflank-mailman (input) for mailman id 445465;
 Fri, 18 Nov 2022 07:43:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LL5N=3S=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ovw1l-00049w-1o
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 07:43:09 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060a.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4976361-6714-11ed-91b6-6bf2151ebd3b;
 Fri, 18 Nov 2022 08:43:08 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7612.eurprd04.prod.outlook.com (2603:10a6:10:202::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.12; Fri, 18 Nov
 2022 07:43:05 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5813.018; Fri, 18 Nov 2022
 07:43:05 +0000
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
X-Inumbo-ID: a4976361-6714-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q6MpMPRRhRaTbbbKypSNQJ9JFAyHp13gk9MCpGwfGHN8LYk+4f5F4tuJ9W0jnNnut8prSRi/2lYsGGbjpG8lzlXCyw2wLfReRnM1f4j8MPEEUXRuwhMukN9ldKC+KmmvwNuhLNJ5ZjHLSONBAWmqgmZOIdIG2JMUjNjHTMQe9hem1rdQ0r8uPNizFr0U3yBu+/HIkA7U46ckK57x5u4KVg5QjjM7bR4T7eBIBaNe10onxCmiWg8DUgW0FRZmjkB/XVjwvGAZXvk81Jz1gRbaCtzbT6aIDqNOmFy4/+KHXsVUKhFqdsQgZzjgkD4doslH5tCuvydIxAPReQawOHDDLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MZrinOzMZNiUyNurxX6HSXi6VoMFVYsjaHSFMxw1KPs=;
 b=BOkHjbxgCaKskkpndPgNZSC/qPYiNZrRHTkVHjPphYBXg4mJ9SCMmKZiLdsN5oi8jRvxLIVOonlnW3Zc8rLWrap8Hy+auJdPYeHVo9nhaaospqvEOmN2I0lIz4V8nFXwChVIzXCys3v0+DOQ5qizPKea9+2gLUbY7ggw1vuTiY3+Qf5nh83yZjaUVeO6Cc7vsKvzCw8zEueA8ESE9qWAXm4jGPXbDwOQxR/MeYt1Ou2oYof4rd3EMf1HlKoPj/PxKP5pMNl8Rdy7RFBhA+M42MrvXZaXd81ZhhDxFXoO0nsjIChPjk6VtzZY47JZyzB9QAHOgTec/ZFpi/B8s3uQ2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MZrinOzMZNiUyNurxX6HSXi6VoMFVYsjaHSFMxw1KPs=;
 b=3nQQ8dvliVJJYB1fJInRl1FKRkZtmibRck+LyqeIWAKM6SWKeGUQkiPrMMI8yU72dO4GbFmurcdd1OgxGkZc1cdWO1au1htkMtblldNt4Zr37x6vIrhz/ooixaMI4XO0rW8JlFRcDjOGNHkcjkMxDljHsrF3gRXEXKVCUTPtPGre+4ufGPvkfDoTCoBWcydb9FL5CTlav+2OEJ6SSwMHHBCky558zeFje4noAOm9iU308sCMKbltd6zJAp57M5U7Eu9BcOUKuU/GcZ+GV96cCbXl7kKs/AOJF0AxmcC2fxc8g+8PRkvMKDHLA5Svm+4dbjk/GTlMrRcEBJP3Gxz8Xg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8aeffc16-b56c-eabd-afc4-521ce6daabd4@suse.com>
Date: Fri, 18 Nov 2022 08:43:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v8 5/6] xen/x86: move NUMA process nodes nodes code from
 x86 to common
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>
Cc: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20221114063451.473711-1-wei.chen@arm.com>
 <20221114063451.473711-6-wei.chen@arm.com>
 <4e961ee5-2b4e-721a-9406-9dde7ba5e672@suse.com>
 <PAXPR08MB7420900BB3104ABEAD330F6A9E099@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <PAXPR08MB7420900BB3104ABEAD330F6A9E099@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7612:EE_
X-MS-Office365-Filtering-Correlation-Id: 64b2cb72-36fb-4cfe-56d8-08dac938875c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	m4MRxJ9nWWaNry24dBEKZ2N6bs/Fe9RkrhPHtu6dCNG3lztz8UxnMf6wtI6VJr7vT4d9Gh1bRJOhhXVij8fuamANVvZdlPDaS1OC4Ll9+ON88lllOMs875czbVAGv2WWxsyzX/3gc7zFx/TmSWF1lwWqVVquV5rr70gnOr1ouRdRjmAcBgB4dPy455TUd6luFj7utMqW7ABdIipf6Fjsv3HKL/XPq9GOYJpQ3DKYswVI7sttSJN08t6Fhun/FkT4mhtoj7vAQRfKpVE8a0/fBGR82HDn/35IgZcposbI53oNoevHHUVzKLQp+GYx4gd/FFCTyj8fYSs5RBhBwjT/yRiikOb4AIEdKAGDw9fuCCvqdoDacu8dkihFNvUEZfXy5D8UYPrjdcAdTSLyKzjDqLvRAkGo9SVN/5t/IWMfqr05Uvsi8R2u/h53shZYAck2m3Xzai/YSV6nQVjQIjIKGDDM6GQoM8RKrm2chJTnwwLap9oSw3+igWszieeG+XU6CggnbWqwzxQfVb7HtrcOpKY2HHrtbXL0yJJ3XcrnwOTtHUJBoNMd+ioVHjSJSXd4U1pgzuCLliQPe+FR1EU/0/XDtp2kBgHK/Vmgtap6sIj1y37b+rIyD5lR8JL2aaS2d83ET0lkk88bhyp+iJHh8b/m4yjFAw3CvP9ZKu75SNR1+yip5iOF4nYCLexpT6sQ75P6BM/ynNjDawJcG4/j1jXgHcrj14DiR7N3BE0cdIU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(346002)(376002)(136003)(39860400002)(366004)(451199015)(86362001)(31696002)(41300700001)(8936002)(2616005)(4326008)(66946007)(8676002)(66476007)(186003)(5660300002)(478600001)(316002)(6486002)(53546011)(6506007)(6916009)(54906003)(38100700002)(66556008)(6512007)(26005)(2906002)(36756003)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzZNTHZQUWRtSFFCbStBcmpSd1oyb1VLTysxbFRtUWxSaUkwbzlsUUZnSVJi?=
 =?utf-8?B?YkY3SGZOYzlTUm53VzRZbE1QY3FjdDBqbnZZU1lBRHFvQ1VXQ01Rd2RvVzUy?=
 =?utf-8?B?UzNHMExDVDVaTW9TK2QwaGw3T242V3ZEUEc1S2FkS2VFbndhSFVhL2FGaHNh?=
 =?utf-8?B?V0FzSEpjSkVKWkphTG1CTE5XdXFVam1qcGx5aTgvS3VhNXA3bXU3UlJRaGtH?=
 =?utf-8?B?VHZ6U0cvcElsMVIyNVRWQStldW03TDg2VEIzeG9qelFTa0xTYzdEVkw0YThE?=
 =?utf-8?B?U29vaS9PUGxDajdnODZaSDNCdFhMdllwUUgzTEV1TllqUVQvaUZSQnRDcHlz?=
 =?utf-8?B?RzExSkxJaFFjTnFYVlV2RjF4UlpleDFyQUlGZStFMW5GMXl1RDdleXgyOWdt?=
 =?utf-8?B?QnErTnJMcGVGS0pkd1QxL3A5TUJnMU1ZcXA2TzNJWVd3QVVwazNsN096T0hs?=
 =?utf-8?B?a1VUa0RXN1AwSVdOSjJsUm16UHplNWNxYWR1Y204ejFJN1RRbXY1aDRqMUNO?=
 =?utf-8?B?eFpYS1pPOWV0M3RLVnp5dmE4SExMOFpLaWkxU2pVRC9xOE9ZSldjM3doREp6?=
 =?utf-8?B?c3d1RU9reHRXc3JobXc5YmZMTEZBOEJSNFoxNEJJQ3d4THVwR0xBRjhOa2Ft?=
 =?utf-8?B?RkFIc1VBMGlkUFlkTmpydXdudzYzb0R5SnpzcEJUZ2NCV3FxMWNQSytFZE9Q?=
 =?utf-8?B?Tm5EVEMyVHhRSk1nWnhiV2Fod2M0ZnlLeTUwUDlwbEMxS3F5MXZVQTJyc0N1?=
 =?utf-8?B?Ni9PZzhTazhMNzBQckpOU054UzdoTG1PWEN1NVpRMm9GUUxYYm5HSGFBNE5m?=
 =?utf-8?B?Tm9VeFdxNFNYRThudWJoTHN3RHQ1YjFFNmFWNU12c3hkMWV5d2VHK1NFRnl4?=
 =?utf-8?B?ZUszU0QxSGh1VDMvelRuTDl6T0pGNVMxemhObTVSNkYyWjNBVHFyVUI2VU5L?=
 =?utf-8?B?QlltdlZDWGNCNU9UdDRHNXZxbnBJUnl0aVU3ZmpzZnBuWE4rYStLYmJIRHgv?=
 =?utf-8?B?cnJodG1JWlZ0QUJXbnZEMVFHK3hZR2pDeGswNnpXMXM5L3pSYTdoU2YxYzNT?=
 =?utf-8?B?OCtsVFlwRDBEUWxmUVVXWjZWZjhvZ2RYaW8vb2lOZFoxUnovbW1CSnJYUnFT?=
 =?utf-8?B?UDhXeHY1Q2grMVREWGt1Z0pLam83L1BPNXU2NThnZ0JsTTBuVGJ1ZmRlNHdn?=
 =?utf-8?B?eHZmaUpwcmtoeXZYK1NTbmx2em01TkRuWGhwUXVES1dpYS9zRmwxUytIbkdC?=
 =?utf-8?B?YWkwakpCVkNJbnhrVFozTEc5WUNoWDVJWWYyK0xJcy8wa1VJNmlIMVZOc3c3?=
 =?utf-8?B?RDFnS2wzeHBWZlArcitlbUtuVURHdEc3bWZKc05ud1U0NVp1NXhKZFNGUEJT?=
 =?utf-8?B?YTFCQ3FTTUxSaWcvQXI0QVY2YWdPZlo4UXpWUU1xKzh2Nnk1ZnIwaTJHSDRp?=
 =?utf-8?B?QjZHT1JSM0k2MGhEaVNsYjMyZ1U4VWVKME1qclRlZ2xDWU0vYW5tK0hDYWZt?=
 =?utf-8?B?b1dJdSs5ZE85V2liZDI4ZXVxRFhtT2NMOEVxRExOSmZCOTFLcEkzUEVLbisz?=
 =?utf-8?B?QW5iYXhSSjlJQzhod000UUdqUDB3UzZjSUE2RFM0QS9wQlA5NCtNTFE1aTBC?=
 =?utf-8?B?MEtSSERzcjZ5RFdjc0hGUElza2M2YjZPTE5PeTRmdFAya2d4M3hkV2d4cTBm?=
 =?utf-8?B?VW5qVkZSVml0Nmh3bFFhU2hLUnhEL3NzRXl2eXVHcDNpT0NQZTNwOGZiSlha?=
 =?utf-8?B?UjVCazQvTHpqYkxDV0pwdytCcm9ncTBmTHFkUDZmbVA3Ty9RQ0dZUTZqOENY?=
 =?utf-8?B?L1l1YXBPdEpBR3BGNlZOZW9BYXhReENJVTRVcnpDczl6eVVPRytrMllra3hX?=
 =?utf-8?B?b00zQnJYNXhHdnZuUGl0N0VhK2VCbHd2R2dlSnpMR0t0eXlhNmZYekhBR3hv?=
 =?utf-8?B?MEZIRkdQZU5PdmxML09nY3padDdyVkdEbGpOaW9pc3pGbkYxdnZ4WDBsYnk4?=
 =?utf-8?B?Um9LOTB4YlhnOVpyRmNUeTNhVURkT0EzdTFJSnhoVlZ4cmF1MTNVUml0QXVw?=
 =?utf-8?B?WVJVNGt2VUdlSkZ2OENhTCtGYjdBUk8xNnpOdURlT0hEOE9HVW10MEtGc2xC?=
 =?utf-8?Q?RtM2N5PwnhZeLOvz/FDqp2VKg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64b2cb72-36fb-4cfe-56d8-08dac938875c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 07:43:05.3767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wMR4VYEUU4UuOzMZAo3Jisnu4SYepFbFq9PM/qfw0kWfnEsGfnoMVlaODoeO99t7sqdzIw/lhb1Q/mTZyAWYkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7612

On 18.11.2022 08:23, Wei Chen wrote:
>>> -static int __init nodes_cover_memory(void)
>>> -{
>>> -	unsigned int i;
>>> -
>>> -	for (i = 0; ; i++) {
>>> -				}
>>> -		} while (found && start < end);
>>> -
>>> -		if (start < end) {
>>> -			printk(KERN_ERR "NUMA: No NODE for RAM range: "
>>> -				"[%"PRIpaddr", %"PRIpaddr"]\n", start, end - 1);
>>> -			return 0;
>>> -		}
>>> -	}
>>> -	return 1;
>>> +	numa_fw_nid_name = "PXM";
>>
>> I guess this can't go without a comment, now that we have ...
>>
> 
> Ok, how about following comment:
>       /*
>        * In an extremely unlikely case, srat_parse_regions might not
>        * be called. So set "PXM" before the first caller to use it to
>        * make it more safe.
>        */

Largely okay, but "first caller" looks wrong here (without further
attribution I would read it as meaning "caller of the function we're
in", which makes no sense). Hence I'd make the 2nd sentence just "So
set the variable here just in case."

> And ...
> 
>>> +	if (!numa_update_node_memblks(node, pxm, ma->base_address, ma-
>>> length,
>>> +				      ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE))
>>> +		numa_fw_bad();
>>>  }
>>>
>>>  void __init acpi_numa_arch_fixup(void) {}
>>> @@ -534,6 +295,7 @@ void __init srat_parse_regions(paddr_t addr)
>>>  	    acpi_table_parse(ACPI_SIG_SRAT, acpi_parse_srat))
>>>  		return;
>>>
>>> +	numa_fw_nid_name = "PXM";
>>
>> ... this as well. Otherwise someone may spot the redundancy and either
>> propose to drop one, or it'll take them quite a bit of time to figure
>> why both are there. I thought this would go without saying, so I'm
>> sorry for not making this explicit earlier on.
> 
> ...
>       /* Set "PXM" as earlier as we can for those functions will use it. */
>>> +	numa_fw_nid_name = "PXM";

Just 'Set "PXM" as early as feasible'? ("can" would be wrong, because in
principle we could of course set it earlier. Yet we want to keep the
setting within the present flow of setup, and without introducing a
layering violation.)

Jan

