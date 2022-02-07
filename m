Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAD34AB847
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 11:11:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266652.460349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH0za-00039z-GT; Mon, 07 Feb 2022 10:11:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266652.460349; Mon, 07 Feb 2022 10:11:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH0za-00037s-DS; Mon, 07 Feb 2022 10:11:30 +0000
Received: by outflank-mailman (input) for mailman id 266652;
 Mon, 07 Feb 2022 10:11:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=owYM=SW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nH0zZ-00037m-4Q
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 10:11:29 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50177480-87fe-11ec-8eb8-a37418f5ba1a;
 Mon, 07 Feb 2022 11:11:27 +0100 (CET)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2050.outbound.protection.outlook.com [104.47.5.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-6-n6nfZUvJNEaMMCLuGQzWUg-2; Mon, 07 Feb 2022 11:11:26 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AS8PR04MB7605.eurprd04.prod.outlook.com (2603:10a6:20b:292::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Mon, 7 Feb
 2022 10:11:24 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 10:11:24 +0000
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
X-Inumbo-ID: 50177480-87fe-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644228687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8YH8xXPsjaApYBZN9h+yF+I+pqBSmrixHWlVUqXll7E=;
	b=j/YNNoKhhnmPZP8P6nZHkxqbJ7e2qrpA07H3R2/psixbGIoquLGBCiIPIvmByMCKDYqH7J
	xtIDAxMlQmNEfaA3RwqQczlWwjW6tgCl3P79T8At1zw4XV6K+YV9jm8Suj0BW7TGJidhM8
	fQ1xJkCwc2lstHhmJPCHR/3/RXqrb8c=
X-MC-Unique: n6nfZUvJNEaMMCLuGQzWUg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i9/4kvfgOB2QWNmql3FuDFU1GVQeffmMYtfS8LMC4kOCm/NqlVZgpHKMzI3GqcQO7uHO5V+4gmWfVLh0BXDYRMqWF1KzEqcTStBpTQNEF9rE0cHozNywCuuKpU0xDwhfZCjEdO9VwquCQ5Htmwyrc5ts4FJqGyxafpx9IxXJJdv7xkuPPBxlzl2utjTERpkv0IU2tpatBS3rLAwHfaKuy9Q3gIt18l8wlVWAcagcKFGmX3G7JwQOsIPxzRTjmz8O2mo/U87jLcXoUB+qKwRn631gV5Ac2sUOmn0kGl5OP2lQa3clADO/USewmsfszx5GATOkRBr+t9HJMTvifTyqFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8YH8xXPsjaApYBZN9h+yF+I+pqBSmrixHWlVUqXll7E=;
 b=QHx+86vzPIUGxrj9ShEde8FM13s6y/GGO23hnTN1luBkbLOJgnEDeM564nIxZ8jid2l2EeAmIRZDOkwQo2rHD6xgvFESp3/2LTcWKmrscRnqQzS4MBLgwFE68j1TLHHB3PxlEcm5W4aM4fk756cecv0Tc4AThg7ZXq7AlSTDb6dJ+YfxnBROVyGL6TKaCd/lZxPxh5eZ/Aip+C6RIuGRm+wz8I9FS1/HXJrV4RSO3qfkdbAX4NwfciQKholk0HoJ/6Yu7crodqlAu8UFyjTGac/+iaS5RKZRApwFe8aqbUyHvkLCvtxWqIUBUhRM5geMyusv5hfsUmQ3C6D199B4/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ccc16e12-2036-d71b-5521-71685f0ab38d@suse.com>
Date: Mon, 7 Feb 2022 11:11:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 08/16] x86/P2M: PoD, altp2m, and nested-p2m are HVM-only
Content-Language: en-US
To: George Dunlap <George.Dunlap@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
 <694a6590-0018-223a-c796-3e1469ec354a@suse.com>
 <0C051DFA-9147-42DB-AA36-0DED3D192F43@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0C051DFA-9147-42DB-AA36-0DED3D192F43@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0040.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f3d3b9c-0ce9-43c4-b557-08d9ea22326c
X-MS-TrafficTypeDiagnostic: AS8PR04MB7605:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB76056B5BC7D13B57FFF0A423B32C9@AS8PR04MB7605.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PowBbF9VVxd2rsQfgcxL6SbOZapmyTdcU4VG7wPGv6bkHpjM4CPRVIetRu2bV0mDs6fqhlYXdRB8oUGAh+Q/wOXz1W1qVTSotlxmvtQ+wMC7hLl2KM1qxUwS8eRSUYN8B/IejULuPMCHBBRPp8TjHcJw7Ock1o8nd0/R8q0f3lcYiqozZlD8YByUa8FNjOkSHBQZh43zoxL3jd0+Gi/XiYtka5lssHcivyJk1/Ie7ePFjhZLLrpEF0g1QBO15BQao1zCpbZE1mRX/X/aaBYUlwJ9lj55MraINK8aGufS58AZL0R8nab3gjpqAme9sECzNUc4H2sDwThcpSekDXlSKiVi/tG0icWX4RcA0KTmdpLySRWibNujo/i/MrQxf/K9H7/cJU7F5bIVR4IBugWkkjmisn6yz7Gn+C5XeWsXFpPtXjoVLmp6ruPfXrLvuRcsiW6HHDh2kz8a1XvCbcIE0I+7luEayua7yAbVyL1hKnhYK9iM+hLDKqJj1c1hzGScJBx4Pgry2jErrpD4fTqLDyg5oSa7Xa6cTxqce1DtqgjR091nb60SAbCGLSCFhXBJn6kSuF/BmAHMQnOQx70q6+AHaAkmmiB4BChOX+8cfTlEvLJvyM6zWD+6wxbOs/Mux8n8VhOcb/GAN1OkRDVomR2pDlVOXy3cY05t/Kfp4u59Vb21cMLGqykx//mrXyOoGw6JCVhuVB+NxCLy4CCIGB8uPoZ11I/695V5fdkDvQ4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(83380400001)(4326008)(8936002)(66556008)(31686004)(66476007)(8676002)(36756003)(508600001)(26005)(6486002)(6506007)(86362001)(31696002)(53546011)(6512007)(5660300002)(38100700002)(66946007)(316002)(54906003)(2906002)(6916009)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHZwNlhyb2YxNHR5cFhkb0srMzBDaGxyKy84UFRmeGM2RFh0TUJuRkx3d1N4?=
 =?utf-8?B?cVhIOHZ4dDJ5eTBIVlp3RjJ2UFprV0c5Nmgzdnl3L2tLanhoMGw1dGVHL3VX?=
 =?utf-8?B?RVViRjZkTWxLM2d0aEQvby9yRjdYeFY0alFXb0xZK1NGc1BCd2gwK0Z3cHh1?=
 =?utf-8?B?SlB2U1l2Zi9Yd1pRdFE4YlNIMmkvTjRRZ3YzOUJVbm1uQ3pxOVJ2eUVVMWRO?=
 =?utf-8?B?VXY0YkdUeElUREgzMXk2ZFlHZVJjb0xtS2tWQXg0OEs3Tzd6MEFxaWZQRWRX?=
 =?utf-8?B?dkJnV2ZpR0dzM1BBL3lWUm9QaHBNL0hjL013S2h2elh3S0NoNDdyeUp0RmVt?=
 =?utf-8?B?R2VCSWZZZGNuT3NVWWhOTGF6UWZNbkRXdTNrc3ArcjlnQmpIc2FlUWJ2azhT?=
 =?utf-8?B?M0draU9UNnlwMkZubVhJZmxTMGJZbUpJTlhUaVhWTmwybnRIbENjQVBTRkhR?=
 =?utf-8?B?ek5mazVaY3A4WFFPRUhYb1p3VTU5cHJMUVhVRHZ1eSsvQVdMdEZiVkNMQU14?=
 =?utf-8?B?Sm50NGI5dlprOE5yUVFUMUxCZmRaQVBlNDBJWVZKc3RnQnhZNUdSQTFHVkFu?=
 =?utf-8?B?dnRkVUpmUlZqVW9MNTJOWCtOTWp0K0dDT0N4b2xQZ0JBUktjVmhsRi8yYWtF?=
 =?utf-8?B?czczdlkrbU5QV3BrZkplVUZYdUM5RVUrMmhrdm1wMlcyenRJQ3RKV3pxYXl2?=
 =?utf-8?B?RFFobklZeklxdXovMEZIdW5uVHl1bVY2M2doZVBlbzhtMWdvMEJQZy8ySVpi?=
 =?utf-8?B?Wi8xL0Jzc05xdzZuLzFOTGhKVERpcDdPcGw1NmVabXVyYlVHSEc0Y0Y2ZnlS?=
 =?utf-8?B?N1poRFdGeHMraGNaLzJuZkJjSXhJVEpEUk43ZFB1azRkNUpWUzJnTWdqMC9Z?=
 =?utf-8?B?MFRKUXB1SVFPZCs5Zmp4MXFYelh3c1FqNHVicmxYY245TlpTcnRuc2Y3MXVT?=
 =?utf-8?B?cnY5aXA4S1BYSjlzYkNOUENRYmZ1TXVRdmViQ1ZTMmxpRFplNkZTMktrWlB5?=
 =?utf-8?B?SHNRZytUWVh3WWk2VkM0bGhsOUM1K2duQXplTDFJeG44aWdVcGQvQkJ0UjhJ?=
 =?utf-8?B?VUNzN2kvd1dlT3luZkkzYWNERHpzZi9DclVtdkpKUWVxUzhTakhaYS9BUHlZ?=
 =?utf-8?B?cHB3K2JHYWVnclRqZzlFRHZzcHBRR09GQUFGdHpWOXRnclllOFRncU1uRzhs?=
 =?utf-8?B?UTQxeUJPSGI4bHliblNPL0htRkhOUThUZzF3aTNWbnI1cXkwbjN0VDhWMGxa?=
 =?utf-8?B?clE3aGEvVmZXcUhUNnBhejdDNU45bnZvTEgzd1lxKzFGMXdzWGorT0s2dGo0?=
 =?utf-8?B?UmhWZktuTWM0dVdLS1JOWEpIWXlLbjlhQ2pSQk9YeFYzTTVFTllYMFdCQlJC?=
 =?utf-8?B?QStDbjkwQXltdzJtaUVudEk4ZUZSajBZdytGYzdnOFlTMUJjcTFDUWVvRnUz?=
 =?utf-8?B?cW5VUFU1QUxlamVGbXYrVjdqdStoTFh5SGVMaU1BS2sxb21TZ2U3L1EyYlBX?=
 =?utf-8?B?MFN5ZHdkZUY2amVIeHdKRUxiVVFIVk5NclJGN3cwTHlJQll3dnMwK0dlMm1Y?=
 =?utf-8?B?Vi8razQ4eUc3UUhLdFhRUkRDL2xOeG9aUHAxUlAxNHcwQ0F6Q1FwWVNqMlhN?=
 =?utf-8?B?S1R4RGdEenFKeGlobVRBRHFrbTk0RmIyNDFQNE5STFluY2hRU0JaMGZVaGtX?=
 =?utf-8?B?UVgrdVBLZFFML1hJL1J5YWh1bVdRSzRiS3BkZkU4aWVjNWZlWjhjc2txbXJV?=
 =?utf-8?B?VVVENG8ycDdzRDRyU2hiOGlLeHd1c0o0cEhRREVDWnA4ZVkwNjZpMlhNRmtW?=
 =?utf-8?B?ejhEK1JCMnRNSHpVSlNMbGhFRWtpTHg2YTlMNEZUcHVPRWFhUGpvV0k0RklS?=
 =?utf-8?B?VW1oYU13b2daREJGUmdwaGo2TlhkY3BtN0F5VUQ2QWk3RDNIVURkT1F1Uk5u?=
 =?utf-8?B?ZE5CeFpMTERsUFRyTkdhZDRqNG52RnBjNURsSlo4WkVPNVZxdlVaVm1qbDNS?=
 =?utf-8?B?NlJialZFaWNVVFJhUE1URG96RHQ4Nmp2OStEUDJoRkd6bXlMbE0xQjd1YUZ6?=
 =?utf-8?B?cnFJb1JseC93QjBjY1lING05K1BTRUkvT2lLQjVEa2I5Rk9iK3k5RFdFMjJz?=
 =?utf-8?B?N3hUVlhsTUE1RVpnZUptZHJPbmR2NjdST2tNYjdYSEc3c2VIL2w0VTk0T1hh?=
 =?utf-8?Q?MOoK5WaA9+GwaBkpQM7VBNI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f3d3b9c-0ce9-43c4-b557-08d9ea22326c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 10:11:24.6971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ED3UC7trCih21YPrcnJiaPPq3YO0gLQgJN32CmAtVXCp95iH6jjhPoPlLh03pcRbb5XadmWO91z35lftritHyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7605

On 05.02.2022 22:29, George Dunlap wrote:
>> On Jul 5, 2021, at 5:09 PM, Jan Beulich <JBeulich@suse.com> wrote:
>> --- a/xen/arch/x86/mm/p2m-pod.c
>> +++ b/xen/arch/x86/mm/p2m-pod.c
>> @@ -1135,6 +1135,12 @@ p2m_pod_demand_populate(struct p2m_domai
>>     mfn_t mfn;
>>     unsigned long i;
>>
>> +    if ( !p2m_is_hostp2m(p2m) )
>> +    {
>> +        ASSERT_UNREACHABLE();
>> +        return false;
>> +    }
>> +
>>     ASSERT(gfn_locked_by_me(p2m, gfn));
>>     pod_lock(p2m);
> 
> Why this check rather than something which explicitly says HVM?

Checking for just HVM is too lax here imo. PoD operations should
never be invoked for alternative or nested p2ms; see the various
uses of p2m_get_hostp2m() in p2m-pod.c. However, looking at the
call sites again, I no longer see why I did put in
ASSERT_UNREACHABLE() here. IOW ...

> If you really mean to check for HVM here but are just using this as a shortcut, it needs a comment.

... it's not just a shortcut, yet it feels as if even then you'd
want a comment attached. I'm not really sure though what such a
comment might say which goes beyond what the use p2m_is_hostp2m()
already communicates.

> With that addressed:
> 
> Reviewed-by: George Dunlap <george.dunlap@citrix.com>

Thanks, but as per above I'll wait with making use of this.

Jan


