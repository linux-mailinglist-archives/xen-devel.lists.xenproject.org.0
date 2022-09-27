Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 038D05EC916
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 18:08:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412821.656287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odD8B-0000F1-24; Tue, 27 Sep 2022 16:08:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412821.656287; Tue, 27 Sep 2022 16:08:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odD8A-0000Bg-Vi; Tue, 27 Sep 2022 16:08:22 +0000
Received: by outflank-mailman (input) for mailman id 412821;
 Tue, 27 Sep 2022 16:08:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kd8q=Z6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1odD89-0000Ba-0T
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 16:08:21 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2072.outbound.protection.outlook.com [40.107.249.72])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a500345-3e7e-11ed-9648-05401a9f4f97;
 Tue, 27 Sep 2022 18:08:19 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8178.eurprd04.prod.outlook.com (2603:10a6:20b:3e3::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.15; Tue, 27 Sep
 2022 16:08:18 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5654.026; Tue, 27 Sep 2022
 16:08:18 +0000
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
X-Inumbo-ID: 9a500345-3e7e-11ed-9648-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HEMwUGSI834N9Oe7xPlHaXsPeo+hy9zzIlc2qULKtmEWpfYfLsX/me/fw0lVHE2kVO9M+kL0gNYDIpa/6iEuWbnJ7sN9nuDrgRNtK9bZ6CyiuBmzPAw4ffOHiMMHes6pLBafRz3V9/0WfsHmSjqZAin3PiHI2zyz4tlC6FNfPQBUTdsRpnGARA9QsG2Ka6KYWaOcEGXQu3eDBw4kkKWhM4t8NeGX0PhI4wW4MAzi1k98UqT1oAtyULTs0iijg4LsiFwc6HRC1qMtQCTEZR9O0YuZP20NNk+OZLoMaE4L7MxgQd6sqQusR/ETSTVf/MPQHk7MC6YtWVDTM+ne76uphA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s2OGboVq3PfQxxwhvFOy0FoahiAPxk8VGhf5ESu5kZo=;
 b=nn7LGK2hrIjOS0jdB2y4MTWtN7SjDrGx655SGVDSChoiCk7FLqFGn5hGAYRm5w1pnbEaEUO4o4/L2kAa7ZR3ubrAh4DtZxRtL4s0veBY2Hx8g3Qud4BNHFz/aZ0HgjEDowy0w9U4lmjdy6Qu25QhZpYeBbOFLrXt90sjvhdvsIMMY5IQEGUgbT4I8PCH2m2qZHhXxlCsCmvKn0k5ST1zQ2YH7tZlQ3iddqYuSEfpLstnZgBlARfwYYCpGXH6+FbT7zLZzUGuaHikW0SzSsoIFNq95gb9XvY9cXx1/h17U8HaU+Ka0s7zGpUQnsbv77i/v2rXCkCRQDNKHa7qjU0yEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s2OGboVq3PfQxxwhvFOy0FoahiAPxk8VGhf5ESu5kZo=;
 b=5DWyC4xymFSkleNaWF1yQUbQf64ZTKU+mRLRpfxCVDEBGJfkcPyxT3FiuaKVdNErUUYV1Ap7dN+dC+4q8xPBnqmEvoh41ARMovWdLTs33gxuezIPxrL0qDIF1x4NjU3u0xRuxJ6S9EQr/ggYbis4xeytZEx4S0lz633AjwhHB0RIoUXZoBu8/qWl9cA+T1a6rQE2tdvEi125dIgskN3cPxG2iwMMGRi6MyheQqqE4XMyjbQpJ+JgsrPHULIvpP6GhTwOwaJ3gpdpYszErij1Zywlu/BnBHiEfsEv3Yjm9a7kcbxnFGBS+FI3zt1YSfq/aLh3hhEmGYK8jVUwwn+KKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <db13d059-250c-4224-cfa3-b2b148f95532@suse.com>
Date: Tue, 27 Sep 2022 18:08:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] x86/NUMA: correct memnode_shift calculation for single
 node system
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <87c5e6be-5ad8-fe2f-d729-4f9904a4a027@suse.com>
 <YzMcZHa55QPqepiv@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YzMcZHa55QPqepiv@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0063.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8178:EE_
X-MS-Office365-Filtering-Correlation-Id: d1be4024-9c28-4f8b-9e64-08daa0a27e00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	og2SEg+xXFJkGyiFsWcqPrs6CZwISmqWlW2jlL+GpTxfd6sreeDU+tfw+eZUmbSFP8n0NzowdKwUpOYsxj60l6e6VfCn0Nb/4rmT6ig5hp5WcYkXAZDIVudtYxFvwvsz5MMXbSky3S1qxlJLaoQN2DYXoQNMwGWFF9iKzj4tXPAs7hil63y0iIazPVgQIq4A/eUsK0JdiVlRNtraqJws2VK+cJoG1zDvPEMZLcDSMvn4MEDmpQGM64Rf5Ysh5OhLmuMEWqfQ2AgWbQGgabvWjbYWt8gzHTwcwvKhgG60eNOgmC62nOYF8WnYDjMa095rCgurFJw5H4Lin0ZtfMQ80bgyfDIA16GuVC7Dn05PcuN515BCrl9B/8+QBjZ2DdgccrFcd40NO0CoBiZHYdDHFiNdgsZmvlsSdrjrY1mo5tBq1ejwPqJ0WPzjDPz7fq2dSgnZdFGefCj0cJu8TYLjBfRr+9uu0/mN/NIfHuatUa+os9f3+8+uGnRRwc8PqsNcQK94D0mTvMXOqH9RPNTfhR3LWtFmpkmT5z8ZvefXdaZAmbb2MZu/JCkBnG/Ez9OtyrgTuGz/Ge18F6SVb7z5rfUINdBuCO9Jr+cBCBXjTQ6P93mcDo6ac7Z1y92CwX1lExwwVq59GCjbssdj0MIt7n4cNqXOWb7cngwGzxvzTUz1gGQ8G3u41f6wjUWA6qkN9kUdNXFfbUzi653xkaD9p1lY05Z+R9hLtw2KE6SkfFoy4r6NPfVeE4U8fr6brYIDdDnOMep/OltWQznwjq0/DVZMjcQ8FmcGOLUEsVlMK3g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(39860400002)(136003)(376002)(346002)(451199015)(4326008)(8676002)(66556008)(31686004)(36756003)(66946007)(2906002)(54906003)(316002)(6916009)(8936002)(38100700002)(86362001)(31696002)(6486002)(478600001)(83380400001)(66476007)(6506007)(53546011)(186003)(26005)(5660300002)(41300700001)(2616005)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YTNGY0NOdnpHdWs3T2k0dGIzT0ZMNFpLZHJELzcycy9kazYxb1YvdTlhQkIr?=
 =?utf-8?B?SW5TSm9MSnlBOHpFU0hPak5VT1ZsWDdnUXZsUVR2ZmpKQnhxQUlkeEZOSEty?=
 =?utf-8?B?SXVxbFBlRTVpelRxam9hZU1VdlB3WUFTWEJpSnJFT0RETGtVSWo0dWFyeFI5?=
 =?utf-8?B?NTlJTnBMNG5ZK3pzUnRHWFNHZnV2aDFCUy9jOTM3aG5hcStIQ2lHY1ptUW9q?=
 =?utf-8?B?MmZOTnpScVhhWFIvdTcrRnFxOU5lZlJKbUlGZVhiMHZtRVFrS1VDbURybHc4?=
 =?utf-8?B?K1RwWFUzUGNOSUkyM1hYUXY2WGN5cVJ3SWtrUC9vZGNNK2RZUTBraHNRcVlY?=
 =?utf-8?B?bytIYy9XSVBGTERkTFVaeHpQaUppYy81MVU1Z3c4eGQralV4aWYvb2lWdS9x?=
 =?utf-8?B?TWw1SGxOaVltSHRMd3ZrWGpnRTRsYnZ0K051aGdtU1NQbUIwbVR5aHdpSTAr?=
 =?utf-8?B?U3I0cXFYVUhTTmlYTGE3cGhXVXVJM2YrZ25zb2FlU1BWeGpqY2xYUkFrR2Vl?=
 =?utf-8?B?UXpZbUwzSkE2UXkwUzlnTHZkOHNOK3dtNnlGa2k4VXUyc1JXTzNGU1FveFp4?=
 =?utf-8?B?dStwZUxmWm13cm84T2ZPeWRVZ0lHOGZId05aUGxxbWpNblV0RkNZVFF1Um16?=
 =?utf-8?B?SEJkNnF6UEZ3L2JrMWhZRlA0SCsxZ0VmeHBMZjNPL1NCOTkvYmF6N2k4d0dV?=
 =?utf-8?B?VkxYdXlKbk1HdWoreUw5QTRmWWJ0RVdUVzAxM0EvUElyWkdYcVQ5KzJvK0FZ?=
 =?utf-8?B?RDVYSGpSZi9GZkgveENKVU9lenRIakdiNS9aaStnb2dDSW1DTU1CczVkYVRE?=
 =?utf-8?B?eUUrU2tXeklVL2hvTEw2STMzVUp4ckJzZW1SQjdjMjVVMlhmTzBKSkZyenAy?=
 =?utf-8?B?RC9Fa2p2anlqZHIwWnBmei9rcE5YN1JmdU8zd3IrRFNkYWZUS1JQbVdMS2V6?=
 =?utf-8?B?K1hQOVpFdXNpcGsrV2w2UDNDUjR4TFlybFkxdkdiNHlHdmhVNnphRzljR2VF?=
 =?utf-8?B?a0R5eGVhT1F1RVJSbFBhcDU4VlJoUjJqTWJqTnc3MEc1ejZoRC9kWGhrTFEw?=
 =?utf-8?B?aWRqY1ZvOW4wMFJoMUVNdW1jSkgxNTVpQThaQzFWNUpDN1owR2RLanRTcnlP?=
 =?utf-8?B?NXhNUmlqdnIxZ2lNaE52cGRaWFZCanRPWVlEVHZycXlMVnVORjJPZ1U2R3NF?=
 =?utf-8?B?Q2hkUVpVQWw2QStERHhMcTZibVVFVXJLMVBNamdFcTFtbC9GVXFLTjBUamJW?=
 =?utf-8?B?OFVFR3ZNNmRxNDErNHlOMWZpZ1FtcHJDMTFhZEZRbm4zeXFOUUw3amN3NGND?=
 =?utf-8?B?V0c0djFLdkc4QmRwSVZ5blo2NkNOc2tLMWJrWUxMQXJsM0Ftbm1WTWdiUW5D?=
 =?utf-8?B?aGtxS3RxSjVpeUR1bU9uc2xZMU1jZGdFa1Y5MDR1SkJoOVJnL3VQd09Bc0VL?=
 =?utf-8?B?d3VHMnFzL3lqR2ZSUEZteSs4NkhLOWpaTUltd1BRbTZ5cGR0cnR3ZjE3TDNr?=
 =?utf-8?B?amJZTDdwaEFSL2RkTy8vZnVUQUdzVDRrQ0pYM2JqdGptWEFyekpaakExeFE2?=
 =?utf-8?B?dVc2elI3a1NTRk9WSnYzNnYrcmZvSkptcGtXQ3VvVElud2pKRHI2Q2hjak9l?=
 =?utf-8?B?dEZlQ1pNUzQzQlgwVnYrVEJ6NitKWWx5M3FTMXNhQlZ0YndsRE54MGdYWVlk?=
 =?utf-8?B?SlpTUjVDTEdvaE84NGlFY29YZThLdHFsREd3VUxuUmhsbkF4bjYzL3BJa1U3?=
 =?utf-8?B?a0Z3bWs4dHNpMkhLZEx5S0U0bjJYY0lVdG9zZkVhL2VudTNTRnQ0c3NlNXJQ?=
 =?utf-8?B?bWhxRDJ2MFdtYTJOUUV6Q0hjM09MVDZBbW1OS2QyOVBZR29OdjIybmZ4OWVJ?=
 =?utf-8?B?TVNUaFFYcjJRWm11RklHMFM2b25oKzhFM0Rrcmo1d1drOHd1QWVmSURXZnU2?=
 =?utf-8?B?c3JjQ3FVU2ErUmZENC81YklFcFNwVSsxZ0NGVm41U0N6N25SbVRxNHdtQm9q?=
 =?utf-8?B?WUt3VnhlQ0lLSE80VldQUFVva09OQS95UGpjYVZiMCtwRGFnbW0xTDBScjk0?=
 =?utf-8?B?VVFRNUtwNWdYSEN2cTFwTitIbnpqdG8zSGk5SGhlWi93YzVVS2xhcFppMkFP?=
 =?utf-8?Q?GK8vKraXrPPYwi6K8BhO+CCLE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1be4024-9c28-4f8b-9e64-08daa0a27e00
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 16:08:18.6087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oEjjKyeG/+c5GQcv+odBza7xk+z/p1IzBnC3rBL0/4tRhRw+SFr0Rp/Lmvl6eoFUaQY3z4cxLFs71tNMZnkxuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8178

On 27.09.2022 17:53, Roger Pau Monné wrote:
> On Tue, Sep 27, 2022 at 04:15:19PM +0200, Jan Beulich wrote:
>> SRAT may describe even a single node system (including such with
>> multiple nodes, but only one having any memory) using multiple ranges.
>> Hence simply counting the number of ranges (note that function
>> parameters are mis-named) is not an indication of the number of nodes in
>> use. Since we only care about knowing whether we're on a single node
>> system, accounting for this is easy: Increment the local variable only
>> when adjacent ranges are for different nodes. That way the count may
>> still end up larger than the number of nodes in use, but it won't be
>> larger than 1 when only a single node has any memory.
>>
>> To compensate populate_memnodemap() now needs to be prepared to find
>> the correct node ID already in place for a range. (This could of course
>> also happen when there's more than one node with memory, while at least
>> one node has multiple adjacent ranges, provided extract_lsb_from_nodes()
>> would also know to recognize this case.)
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> --- a/xen/arch/x86/numa.c
>> +++ b/xen/arch/x86/numa.c
>> @@ -78,7 +78,8 @@ static int __init populate_memnodemap(co
>>          if ( (epdx >> shift) >= memnodemapsize )
>>              return 0;
>>          do {
>> -            if ( memnodemap[spdx >> shift] != NUMA_NO_NODE )
>> +            if ( memnodemap[spdx >> shift] != NUMA_NO_NODE &&
>> +                 (!nodeids || memnodemap[spdx >> shift] != nodeids[i]) )
>>                  return -1;
>>  
>>              if ( !nodeids )
>> @@ -114,7 +115,7 @@ static int __init allocate_cachealigned_
>>   * maximum possible shift.
>>   */
>>  static int __init extract_lsb_from_nodes(const struct node *nodes,
>> -                                         int numnodes)
>> +                                         int numnodes, const nodeid_t *nodeids)
>>  {
>>      int i, nodes_used = 0;
>>      unsigned long spdx, epdx;
>> @@ -127,7 +128,7 @@ static int __init extract_lsb_from_nodes
>>          if ( spdx >= epdx )
>>              continue;
>>          bitfield |= spdx;
>> -        nodes_used++;
>> +        nodes_used += i == 0 || !nodeids || nodeids[i - 1] != nodeids[i];
> 
> I think I would also prefer the `if ( ... ) nodes_used++;` form, as
> it's clearer.

Okay, will switch then. This isn't for 4.17 anyway (I think), so
there's no rush.

Jan

