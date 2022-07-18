Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B3C577D32
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 10:10:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369346.600708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDLpo-0000iM-04; Mon, 18 Jul 2022 08:10:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369346.600708; Mon, 18 Jul 2022 08:10:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDLpn-0000ey-T7; Mon, 18 Jul 2022 08:10:31 +0000
Received: by outflank-mailman (input) for mailman id 369346;
 Mon, 18 Jul 2022 08:10:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pu44=XX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oDLpm-0000es-QW
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 08:10:30 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50065.outbound.protection.outlook.com [40.107.5.65])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15d417c1-0671-11ed-bd2d-47488cf2e6aa;
 Mon, 18 Jul 2022 10:10:29 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AM0PR04MB7075.eurprd04.prod.outlook.com (2603:10a6:208:19e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Mon, 18 Jul
 2022 08:10:26 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e%6]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 08:10:26 +0000
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
X-Inumbo-ID: 15d417c1-0671-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AW2ab3VvzXWWig6m+FcdniguSnvIv2gQI+TWoxT8q0zYAkDx28rhdEl9RZC/DSuLFLFj8dO43KLNwbMxumrVMlQqA6qFKo4Kn1gj3AcNKlS9tfh3bGspWlMNYhkevKC/lPDHke6OcAIhfVcleAXswFTY7zAKsQYq/TQo8LqaH5gBgIosXUOV1QhVOPDmH05pNr9VJwrtQmeIFKxK4wWknBUanu0IeroUdCfOafiqAjNCjkh98qX7scyZHw7pl/1NiGxmhyo9hzURcSBupFD5D+vj5q4xOBN3DwtIX/fJWlXuNr/3L4G7FaQJKzkWIiaUC3PC6wvyAxGb2ZTFkxUKSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLiRB3NPnmg89a3Id+CFH0yyvip2V4psLbTZNzRF7nI=;
 b=Kdm1ozieyFW1beb2WlOJurVrsae8veJw1RtQAVWphTuHJA45Qqn3DhYx1jk+nB+H7pl6Vb2DevgCZyaqmiHtunBhysFQiTwoaF5GePdPRFN4b9F2mPASePR/SOZRwqNHiToHomk6tU5VQ0hYgE/EI/65xTIOhoAuECZ5g4CDsUAv8RX9fs141l9sKXIbL5dJY7UwEdNcfYbnmuQYaWucXiDOXqroSgmXoNsIIXISvtDTz2il/ohlNriVyxWW61B7bSrNdZExy0OdZQWQH02DRTkfoetKXHNIopFqb0ikvrrC9EcdnZZJVRQKSB8FI+uUVWn1wO6lEMZDfEpEBqrFKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OLiRB3NPnmg89a3Id+CFH0yyvip2V4psLbTZNzRF7nI=;
 b=Hb/I7fgqFHAN/7h+XrQcPOQN5urutp688hMjXZXvQQ6dAFcYgen04ZoxsLqLybMuW4Gh8KiwGPS5iBvapFGCITWaETznH5og3J2Pcpgep6I5u0EHY/06pu5Syv9w9T8VebX6YLCz5Mo8vsISyI7dbdXwbCQT6XR0NsmnOyrI6CRwrtO6EgvQsfPkVTA2Dj0tmPe86CDNgB9rdvjXAX1lzj4Ac6e9PYVRf0GsE2INFkU9IphELSj+EudnmxuPE0jlvHmDDqUYmG9lMPo4/a5/OJdoOGdVbF4ZE0EbxcIu1DprNYlsNF8Fp8wp0qOmIUutADroYFAqB2/G4fPCQ99GPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fff36e89-85da-7ccc-6058-6941150a6cd4@suse.com>
Date: Mon, 18 Jul 2022 10:10:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 9/9] xen: introduce a Kconfig option to configure NUMA
 nodes number
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>
Cc: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>
References: <20220708145424.1848572-1-wei.chen@arm.com>
 <20220708145424.1848572-10-wei.chen@arm.com>
 <b7d914bc-a2d7-d12e-15ac-ae7389d8bcd2@suse.com>
 <PAXPR08MB74200E2A75A2D755AC95BF519E889@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <a54d09a2-6629-16f1-8893-37d022c2dd5b@suse.com>
 <a9cd1e2f-fb49-ef68-41a9-58eb7c546266@xen.org>
 <PAXPR08MB7420CC0ACE1AAEED5254981C9E8C9@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <PAXPR08MB7420CC0ACE1AAEED5254981C9E8C9@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::14) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8385ac31-7667-4623-062a-08da6894f8ae
X-MS-TrafficTypeDiagnostic: AM0PR04MB7075:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pxAsrg1osfYnylj3rXK1gVYEJPMpkz5ONezT6cvIKHCJoQXNBG9o+E/2fly+1/s1n+xi3bKlGvKMsP9gWC4DID/O1JXqeD8JAKa9Fy419VvcnthRRzIxfhRcxR7BiK88JzjxEPYH3TnUIG65365+cnhLX3G1fKneiO0SbXMLKE6JFnoa9eS7dsZRiyofC/hQY6dTFe2Ih15a2arzEz7fqF4qqMuN/X4Jv5lho7enDzR35lcDPe/u8I5/KHmZX6PvHt09kBoODlJE28+YnVbdQw0JQqdY6AXA/rIrL0cbl0S2vIKKVnNE9E8AEIsMpQMNZJZOsLPzZPIhzDPOtX21kvqPQliXVezgtRZXRk/21aLVnED74GJWLT8iww+rEsXkBqkmzReTHPJsj2VMbyQsrZqTHc1s5AbMHDR1pqbVB4QvuxchMHZghEioe9IMpe0Lg5y3Wy742H9sffpQGsaRooMlE5RskryXf5iQ8JwZ8a3SUXN/N8UJVIo97mycnYZbOLRLMWifIwZJ18LhqKZBYu4F5gDytNJI0kJvkuxeJuXy3UqP0vTKQTvH1HF6M1FLJSGBqh26+rtfqpvPFcR8uObRlSyk4zBBF2+RJj6ylvKhm/K89TNlrbIYloSXR0Q2Eerw16kmA7EHnk8MqsGUlrLREZ+IIyoBtiiRJv1xRlG3iZ9QfSO+RwG7EwNsB4n/QD7Mbga5gH8dDNlZM8WJJwl+SCzphG2dNGuKJG45G/qnFNr7ty34bnNbAWvIB7hzGKuS9UN1T+ngPh8oHRluHBg92sNmCgJHiSJAF6qLMPkFOXyiJQqjtHNFKSnh+UlVmYNjfo8pO1bA3jQo2608/Peb1oP55kAiFWlpoHR2NZo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(136003)(366004)(376002)(396003)(39860400002)(6506007)(53546011)(41300700001)(6486002)(478600001)(83380400001)(26005)(2616005)(6862004)(186003)(2906002)(5660300002)(6512007)(54906003)(316002)(8676002)(66476007)(66556008)(66946007)(4326008)(8936002)(31686004)(36756003)(38100700002)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NlZUSnljNlNWM1JPdGgvck85bm9LV2lwS3h0cGJUYy9NQXE1Rm03emhqSVor?=
 =?utf-8?B?dWRpcWNxL2k5VnFHYzlkT2JkWXkxc3ZWS1U3UzBnWnMwVmx4MkI0Z0ozZlZF?=
 =?utf-8?B?Tkg5WFcvaVBVd09GdWZqWUlOWmtzYTRzR2RxVTJuTlhlcU9PdzExbmZpV0ZD?=
 =?utf-8?B?WGJkam1WaWJBS1FRQ2lLVDRMdGFESVlnRnV1TUM3RzB6QUhJM01PeEpXZno4?=
 =?utf-8?B?WlJPaDJaZUEyTTU0dGtQTytuYTltSXRqSEZMOFR4am9tcWY3QmJiMHVCczM5?=
 =?utf-8?B?VEF6R3R1NXhQN1lrVWZ3YitjbHJ5ZjhIWjJENGxqZkFjNWsvdzFVZGxzdFhF?=
 =?utf-8?B?azJyOURFclpaSThTQkR6SXFQYXdoYUZ0c21wbHlTdUVuMXd4RElGMW5CSmFV?=
 =?utf-8?B?U05kNEt4QkNHZ3R3ZWU5dWVEZFdMTkN1RTVsNlkxNUd1TVMzYnpUNDdrd1pE?=
 =?utf-8?B?bVhDUld0V1hoU1NFZ1RxZTV4ajdyV3VCWEcyWjM0ek94TDdmNmdaOU1XUkdB?=
 =?utf-8?B?OEtZc1A5Mm5tVnFqUExQRjUvRHIybHdidG9wNm9tM3ZqQUd6NVlpZGtWWWhV?=
 =?utf-8?B?aWZsbHA1UWpkY1JxYnU2dGF0eGN6NHZqSVZpZVF2WHlueUhPSlRZTGJhWDhr?=
 =?utf-8?B?VW1MQ0lkV3Nhd3p3Q0UwU3FIeUtVdWdVV1QzOTA0OFYzTm5lcHBWUm1MUFVG?=
 =?utf-8?B?Y0RBdzZhRml6em5na3ozcldoYmw2MGJlMlo1YlBBNUV0dnpSUWdqb3VyTlBZ?=
 =?utf-8?B?RlB1MHhYZ0NzTFhvblpEMHdUeG1OTHcyLzl4S2ExWFdpczAwLzVUamNFMWlM?=
 =?utf-8?B?UWZHTWpSWlZ3eHByenRmMHpuZXF2czNxNVRndnBUZEYzVWlqSm5KUFdZSUZs?=
 =?utf-8?B?YXJyOGtmTXVWTDhWbkFIL0oyMFNqSStCaTlmWSs2dVEzaW12SVpkdk9nYlAz?=
 =?utf-8?B?Mm0zYkZHVm5pR1o4WGlFVjNTZnp2emRLc1hhNWgreUZtM1hKUmM0UFFnMy9Y?=
 =?utf-8?B?NW9vMWZNNzlVTGRtY3pSQlUzZkVOY3FRZTFPbGV1c0EramNSMXZ6eTNRdHVq?=
 =?utf-8?B?b0NHY0NaQzVKalNUaTB2bEdOaktsckZBaFJocW1oM2lta3dZYUZieERvU2E5?=
 =?utf-8?B?MFNBbTkwRVFJbWFLY3VQWnc0T1ZnUVZQZDBzMTlHNzVocjltUllEcTJCQjF1?=
 =?utf-8?B?WitOelB3aVhwUTBWMEcxdHgrdmZaSUd0UnVGY1JSREhROUlXcjExTjVHL09U?=
 =?utf-8?B?RnhNa05WbTRxWkExVi9DbHZUQUJENjlTVXlGMEt0WmJYRmFPRFZGU2tlK1pu?=
 =?utf-8?B?TVdycEtiVTRxeWV5QktsZVVoTk04NTNpS0trL0srTkdnK3N0OFZYN0pmc1pn?=
 =?utf-8?B?M1JKc3ZYYU4rSTFrUHNFQ001SzJ2WmdBbnV1UGFheE9Ud1dyL2FLcUNrUnIr?=
 =?utf-8?B?NUszYWtLNDN4WDR4V2FHdzNMVXF5aU1Rcm9QZVEyNlpqTUl4WEU2YVpDNmVP?=
 =?utf-8?B?VmJZSFpWNnA3VFdNR2I0UnpjbVdCUjdCZEN2YWtaNXUvY204dTRxckR4K2hw?=
 =?utf-8?B?V05FWWtzc3NES2xOUlJ3UVZtbmNoc1R4bEJIM1Q5QnZpQWg0eTZiMktEUHYy?=
 =?utf-8?B?a1g4akVRd0VOZjlpT1NqZUxNbjN3amRDcjlwNW9ZeFRqYk5sZUJBQ3ZRU0lp?=
 =?utf-8?B?VHJMdU9ZVmdyU0VSRXhWZHNtclE4b1dxTmo2Y2tOR0lqSE1yb1FoUHJMNHYx?=
 =?utf-8?B?VmtPN2xubm9ZaDJSd3lxa2FZcUFsb0lRdytid2hDK2didkNZeEhreUZGU01D?=
 =?utf-8?B?OG1paWJUdXhaN09pZDBYOExPcU1SL2hTdUJtbURaaS9mdHAvNlM4aVFhTjI4?=
 =?utf-8?B?K3l0SGRYTTA1eEs5UUQ5ZkpWUGN6a1VzdjEvWWQ3a1RyeE92R0dBMDV5VGJz?=
 =?utf-8?B?elZaZ1NDSkVqTHJla1NWeWo5Y2JzVmJDNFNCL2tTajUya1oxSTA4bHNpcm9V?=
 =?utf-8?B?bDZNQlJac0paZlc3WHhHc2l0bUZHUTlaY2tndHM0Z0ZkWVhLV2pkZnRlVzhJ?=
 =?utf-8?B?R2E4UnY1aWNubDVDaXg2NDlkWkxhTU15bXhNTWprSjJrbTNvSTBMdDZTT3hv?=
 =?utf-8?Q?q53Y2/jqcWqeu0/ggbwErvfv2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8385ac31-7667-4623-062a-08da6894f8ae
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 08:10:26.4511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 51XCTmCBZii2rrKqP+78pJssYcUJRr5q4BKff8Pf7rY6PGEJnDDa7nLebBtRnypUvnkOb+boQ9QPo25mV5GeIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7075

On 18.07.2022 09:51, Wei Chen wrote:
>> From: Julien Grall <julien@xen.org>
>> Sent: 2022年7月14日 19:27
>>
>> On 14/07/2022 12:10, Jan Beulich wrote:
>>> On 14.07.2022 12:14, Wei Chen wrote:
>>>>> From: Jan Beulich <jbeulich@suse.com>
>>>>> Sent: 2022年7月12日 22:34
>>>>>
>>>>> On 08.07.2022 16:54, Wei Chen wrote:
>>>>>> --- a/xen/arch/Kconfig
>>>>>> +++ b/xen/arch/Kconfig
>>>>>> @@ -17,3 +17,14 @@ config NR_CPUS
>>>>>>   	  For CPU cores which support Simultaneous Multi-Threading or
>>>>> similar
>>>>>>   	  technologies, this the number of logical threads which Xen
>> will
>>>>>>   	  support.
>>>>>> +
>>>>>> +config NR_NUMA_NODES
>>>>>> +	int "Maximum number of NUMA nodes supported"
>>>>>> +	range 1 255
>>>>>> +	default "64"
>>>>>> +	depends on NUMA
>>>>>
>>>>> Does 1 make sense? That's not going to be NUMA then, I would say.
>>>>>
>>>>
>>>> Ok, we need at least 2 nodes to be a real NUMA.
>>>>
>>>>> Does the value being (perhaps far) larger than NR_CPUS make sense?
>>>>>
>>>>
>>>> Arm has 128 default NR_CPUS (except some platforms) and x86 has 256.
>>>> So I am not very clear about your comments about far larger? As my
>>>> Understanding, one node has 2 or 4 cores are very common in a NUMA
>>>> System.
>>>
>>> The defaults are fine. But does it make sense to have 255 nodes when
>>> just 32 CPUs were selected? I'm afraid kconfig is going to get in the
>>> way, but I think I'd like the upper bound to be min(NR_CPUS, 255).
>>
>> Looking around NUMA nodes with 0 CPUs exists. So I don't think we should
>> tie the two.
>>
> 
> Yes, some nodes can only have RAM and some nodes can only have CPUs.
> So is it ok to use 2-255 for node range?

Personally I think we shouldn't allow unreasonably high node counts,
unless proven by real hardware existing. Which goes hand in hand with
me wanting the upper bound to be a power of 2 value, if for nothing
else than a hint that using power-of-2 values here is preferable.
Hence I'd like to propose 64 or 128 as upper bound, in this order of
(my personal) preference.

Jan

