Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A79954036BC
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 11:18:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181575.328746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNthS-0001lH-Lg; Wed, 08 Sep 2021 09:16:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181575.328746; Wed, 08 Sep 2021 09:16:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNthS-0001jR-IH; Wed, 08 Sep 2021 09:16:58 +0000
Received: by outflank-mailman (input) for mailman id 181575;
 Wed, 08 Sep 2021 09:16:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NNqu=N6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNthR-0001jL-76
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 09:16:57 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 764b3c30-6b44-47e3-94a6-5f12b8efb4e7;
 Wed, 08 Sep 2021 09:16:54 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-19-wJcEkFcVP1ebfVIA_sWHvw-2; Wed, 08 Sep 2021 11:16:53 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6383.eurprd04.prod.outlook.com (2603:10a6:803:11b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Wed, 8 Sep
 2021 09:16:50 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Wed, 8 Sep 2021
 09:16:50 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P193CA0035.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:51::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Wed, 8 Sep 2021 09:16:49 +0000
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
X-Inumbo-ID: 764b3c30-6b44-47e3-94a6-5f12b8efb4e7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631092613;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5o3MjP4Xyup2z4+VruHsu4pa+Ez3/ZYNop7+qUPcPWU=;
	b=YR7GJ6xA45Dl+RPi0d5ZvAJoLG8SizbcE0G15r7QMeKdvv7Y0P42s0A7jNDBrrpnrZUSzR
	RB3YIAhpG9ZddfLFmVKg7s/FyxLHvUvOfyZfpAmHL92Yj54kyVPi862R9CaZoGQzv0EiQ/
	KKjzDL6ZUSjYq60AZsyLDJRdt1dF8hY=
X-MC-Unique: wJcEkFcVP1ebfVIA_sWHvw-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iENznPPznq4lOx7kKxSZ0R6DH6baKoSPmiBe14QQaJiQmCetzQTroOsgkpRXwnRpAHg4nRG97mJ78KAMzexlyIefbfVB2GVAk0k6/Ng/L51Hqy2IU4aMrhoi0wcpo9Qbjd2COm4Ux4vrEBgEwMkrfhtr8WPe75bZzvt5bQ17axpOel+xKKf1rSROgCgtr8C0dhdYQlWLysEo2Wy8Jqc78JeCkmR0bAkNGE2W3r5W+h6Q2NWq//q6sf7m+/kwrbLwuV+Vy3YlIVGjsid0ioJxpK0h0B/aRs0FpfVHYkKrwFJC0bz0xI3sMWZMlgIBXLEOy2AdRqFPX+pjj4Xd1bfQgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=5o3MjP4Xyup2z4+VruHsu4pa+Ez3/ZYNop7+qUPcPWU=;
 b=Gtvc26UtBl36xK/xqvboQlK6LugjpJx+nlHVpZw/VkesP0uaQdZ3GXbspTLilQxP2eTPgXvF3vLo2GKTMGGcpBzI8T7Tig9M8SXYRuaUEpRtEqe38bCyzyXr2JoVxWTNH5iTyNjWtBgfPW8Hdm5/OgVQHqBHLr8PGzDcuRj98rFwdDrjJCxL6WPDvX+UuZtLa9ICUBrKogAJIkpX2txNlTxW1kR/5Am+0qnwsOWa/zjn872jdC07metqq8evut/WdspAgNgCc/Kxxo9aTfhdNH0aSFj4SDBhkKMTo2JXX0w6NFsI+lKh/0lAIpWBJqvLW1qXX/Y4ZSWT3m5SNDaqCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 04/12] swiotlb-xen: ensure to issue well-formed
 XENMEM_exchange requests
To: Christoph Hellwig <hch@infradead.org>
Cc: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <588b3e6d-2682-160c-468e-44ca4867a570@suse.com>
 <397bf325-f81e-e104-6142-e8c9c4955475@suse.com>
 <YThey/iyCxi5NUwC@infradead.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0082b78b-3821-9908-d365-3f66cf1e92ce@suse.com>
Date: Wed, 8 Sep 2021 11:16:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <YThey/iyCxi5NUwC@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P193CA0035.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::10) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58c068e7-bd38-449e-2459-08d972a963dc
X-MS-TrafficTypeDiagnostic: VE1PR04MB6383:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6383BD57F9654B7F487D365DB3D49@VE1PR04MB6383.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Guxq+V8Is6BKCmeCsESNqL3+mxl1B1a2wWpJVzr1gl8atZjNJBvUBvXAivqypvQEZxHP/lrHbmhlay8GPHwGY6Uvj20ZI4z8qbRr+xMijHzK1s0yYkArZVk/9kgM+c88j26L1dTgqtXICM9b4KsuwXcMZD4AncWX0iVWRiv07LVadBBvxjUJ/GyjX66RytpI1/JedJwLcuWlJfsisEP/aYdKOXysZnU+Neq/pTBQD70rifQhPwUQXB3zYqatUnpqiVh635kx8n4hyI1LHlh6gYViK+s28uz+/Z5VmMtcGZcoRIDImxw4gawMgfm1qYXRH1xZD5RCbUCx6l446EW32j0nZMCVtJhzlPwkGGv4hjV7tkvIlgA/Jid8CUIYWV4HFay5qcxWBFOyBY2wF61L1gHSkOrewZj4UCrxbUWbOIcyc/lAsXp16Z6h9LCiCv5AyDJs509Aixmkzl53YhRak4qcz9zlhxuSRD8nTAxNmBt7qgJ9Y+gklh1Wb9D7M/m9N6PGozx2ewast5JggbZPUBgP8VMPv2CsnErpbMa+afwHMIEck30zHp7Ky4Ij4kWwSrf61wk33aNWnSej3TtzyYAqrnBPXlkQPa44s5QqatqVu2naF5voVirFeIJgiHuDTiJefvSqvJ/Ijq7NAprepagdz2NyB57ZZJ0ZAjRKuzD8y1IGRxfp2Ly1EnhbltrL56WgbCnDKvwaU8w64R8tTH88zVhu5nFmdV9TXZGkw+ceyOyvsHuPimA6hCYIBhIC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(376002)(136003)(346002)(396003)(366004)(316002)(16576012)(2906002)(6486002)(478600001)(66556008)(53546011)(38100700002)(83380400001)(186003)(66476007)(66946007)(5660300002)(54906003)(31686004)(6916009)(36756003)(2616005)(4326008)(956004)(86362001)(8676002)(26005)(31696002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUdKYUlFbHN3NUVNWGRUaGh3YUl5b1ZYRGN3M2pXWmY1bEliYkJUMzRZN29O?=
 =?utf-8?B?MjNUTGx3TEpEcW9ZalVhbmpQVHFKeHgvRHgwTmJaZktnMEp6TDFVTURzT3M2?=
 =?utf-8?B?LzVhbW9nUTRLNzZGUUNyRWdqZnJGaU9GM2FMWWZSeUE1Rlc3RHp3NzBkZDU4?=
 =?utf-8?B?VlFWcGJDQWlraFRXbGhhUDNMSGFJMzUxQVN3MmFQODhOR2tqcHBoMlluNCs4?=
 =?utf-8?B?NXBSRkMrM1B5US9McUpjYUJ6YXQ0VVJCakJVMXZ2RmhGQ3BlOUV1ZnkrUTBr?=
 =?utf-8?B?bDBERG5xaFpaTHdsOHRPV2FONEVubUt2MXF2dWlXTVN3NmR4OTdYTld6dFJh?=
 =?utf-8?B?UHdOeUJ5ZCtLclV5bEY1RmRTQ2JuQlJzRWZaODNvaEFQTHhKb3g5c00vanRW?=
 =?utf-8?B?Z282eUVJbTQ1N3RzTUFxYWdMVmFpVVdzRnppUkxmTlBFL01aWjUxQ0tYSVo2?=
 =?utf-8?B?UDVWOTFTNFcrZ2V0RU82bm9abU0yeVpzKzhkeURFaEh2bmNRTStiT0NJUEZ5?=
 =?utf-8?B?c3VBQlJPdEJQdTd0Q0ZJb0VhYVMxTWZoaEFpQlhZTDVHblpmaUd0Z0VadlJl?=
 =?utf-8?B?bEx5QXZOalhoUWg3WWRHSXZtT1pXbUY5ZzViczhhRkZlQ050T1hISEtPS3Qy?=
 =?utf-8?B?UkxHNVc5Y3JFZStnSUZNM2ZSdTIzOXA1RVFtL29sZ2hmSHkxbi9CU1FGMTA5?=
 =?utf-8?B?cDFBVS9LT0VzNVk2OXp0RktDdFROOVpZa3pXVU11OEsrcmE1MHNSd3Y3eTdG?=
 =?utf-8?B?NS9iMzZsZW91Nk1HcXRTcTFGZnk5dWlkb3BTNXVpNXYvM3kzTFpMSllKWjBw?=
 =?utf-8?B?K0NuVVBEaEFWU2hFYzFINEgvWnlsNjFvRHdPdXZHMlBqMmJ2dThuaHh0enVI?=
 =?utf-8?B?M1VJdDB5bGxpQk94cTJudXhaWnZTa0tWTldnMXAxYXJ5aGpsSGg2MDZwd1lu?=
 =?utf-8?B?cSsvSHA4c1lmTlBmRjkzaThPUmlyVzVXbXphZEx0MVB4YVE5Mk9EZ2FJaEsy?=
 =?utf-8?B?eFhBNWxQOFZlSCtpLzljeFdnOTl1UEtVNEo4UzNjbnQ4VnJoQlUrcVhhZ1lB?=
 =?utf-8?B?ekVFR21FeG4zYUxKQVY2S2VKMnBqYnZVeXVjRlliU1FQZUViajBENk02cDN5?=
 =?utf-8?B?UWM1NGZ2SG1pTGM5cmtGM3U3Q2lJajh6eldCdk50TXdVdXdPalVlcFJHZnJ5?=
 =?utf-8?B?VVVrb1ZVak04WTcvQkZjckJCb3dtTlZTMXpaVjVGb3dBTnNWenpsb2dMMVhl?=
 =?utf-8?B?SXZ4cUdiSFNDVlVVTHQ5QkM0UldZaTQ2b3djTDE4ZUl6QStmeU5hVVgwVnZl?=
 =?utf-8?B?L21PMmc1RWt6WWpOQlZyaFlTMXpHQTl1UDR0aFZ2Zm5nZW1BZC92SHk0WnpC?=
 =?utf-8?B?UG5uVkQ2SkM4MGJVWUNmdzRoaU84N1FOMU9sZlFhWkViS1Z0UFdVdGkxcnNo?=
 =?utf-8?B?VU5KR2VjK2ZENHpiTForaEhMWHpreVZxaHRGMURsY3M0VUVVbk14Q3pxUlAz?=
 =?utf-8?B?Ynpsd3BxV1JGK2tIS1cyWk5PcXd2eDcrQzVrVTBWNjNmT2RhM3pXVm5zY0pO?=
 =?utf-8?B?VXd3c2Vvam1zdkVaeEdWVkpmWWhuYktDRkhuSDN1cDYwUFd3ai8yMUd6d2c0?=
 =?utf-8?B?RGdUWFdXa3NGSmhCN0N0UWZzdmZDbFRoTDlmU0MvYmVudDQyaGk4Zzh3RzRM?=
 =?utf-8?B?dE9tZ1N1ekxGZU5DcU91U0FGYWNRc1dVWGF3UlRkVXBPNnAzR2FUYWxRZDZ6?=
 =?utf-8?Q?qbZVQZz9At29VAsS2iO2s4Jy08h6Ek2uyO5oZvQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58c068e7-bd38-449e-2459-08d972a963dc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 09:16:50.1985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oxiRe2KcUtPOjSQt5W89hd1K48UU4j81/tBa+grj82mrAEvna7RhDDNcFvfBWZtOxr9eFEGZyOzcKB3JKWQ0+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6383

On 08.09.2021 08:57, Christoph Hellwig wrote:
> On Tue, Sep 07, 2021 at 02:05:32PM +0200, Jan Beulich wrote:
>> While the hypervisor hasn't been enforcing this, we would still better
>> avoid issuing requests with GFNs not aligned to the requested order.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> I wonder how useful it is to include the alignment in the panic()
>> message. I further wonder how useful it is to wrap "bytes" in
>> PAGE_ALIGN(), when it is a multiple of a segment's size anyway (or at
>> least was supposed to be, prior to "swiotlb-xen: maintain slab count
>> properly").
>>
>> --- a/drivers/xen/swiotlb-xen.c
>> +++ b/drivers/xen/swiotlb-xen.c
>> @@ -231,10 +231,10 @@ retry:
>>  	/*
>>  	 * Get IO TLB memory from any location.
>>  	 */
>> -	start = memblock_alloc(PAGE_ALIGN(bytes), PAGE_SIZE);
>> +	start = memblock_alloc(PAGE_ALIGN(bytes), IO_TLB_SEGSIZE << IO_TLB_SHIFT);
>>  	if (!start)
>> -		panic("%s: Failed to allocate %lu bytes align=0x%lx\n",
>> -		      __func__, PAGE_ALIGN(bytes), PAGE_SIZE);
>> +		panic("%s: Failed to allocate %lu bytes align=%#x\n",
>> +		      __func__, PAGE_ALIGN(bytes), IO_TLB_SEGSIZE << IO_TLB_SHIFT);
> 
> CAn you avoid the overly long lines here?  A good way to make it more
> readable would be a variable to hold the byte count.

There already is a variable for the byte count - bytes. Did you read
the post-commit-message remark? _That's_ what I'd prefer to shorten
things. Meanwhile I can of course wrap lines; I will admit that I
failed to pay attention to line length here.

Jan


