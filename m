Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6819740A8C8
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 10:06:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186234.334957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ3SR-0004k6-JI; Tue, 14 Sep 2021 08:06:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186234.334957; Tue, 14 Sep 2021 08:06:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ3SR-0004i9-F7; Tue, 14 Sep 2021 08:06:23 +0000
Received: by outflank-mailman (input) for mailman id 186234;
 Tue, 14 Sep 2021 08:06:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V0d6=OE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mQ3SQ-0004i1-9n
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 08:06:22 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5cb712a2-1c21-4082-a7a2-0f1dffc82983;
 Tue, 14 Sep 2021 08:06:21 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2051.outbound.protection.outlook.com [104.47.14.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-4-fjOQO6OIMrm66bvaL-KDeA-2;
 Tue, 14 Sep 2021 10:06:18 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7039.eurprd04.prod.outlook.com (2603:10a6:800:12b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Tue, 14 Sep
 2021 08:06:17 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 08:06:16 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0020.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:52::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Tue, 14 Sep 2021 08:06:15 +0000
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
X-Inumbo-ID: 5cb712a2-1c21-4082-a7a2-0f1dffc82983
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631606780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p6cVXwCgI3ZhoJUMSTwlj63aGkUFMebjA8TT2q2fUqc=;
	b=CZsGhWsQCHzTZts4WIqtILSZV23s4aQBCZoEa2EJrF37DlkVANZ3pR3pG9bQArj4BTYb6N
	dA06wDqb+GUrFbMoa/e3BVU+fYFDbLRjYAHfdFJZJZmLGCZl+dwtkvC15efg3GnBDFbRDy
	/iC/GqIFvRgWQZIcqInxH3Ed2099zfU=
X-MC-Unique: fjOQO6OIMrm66bvaL-KDeA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eS25SORDsF2HhD4kf64rJbrV6H8CKkMug7zdnjd+InzFa5BBPTnUHa+IBPoQRmRnj9oeLhF23LLLJE46aMkCmbe51pBnx57CKe7hP+10De6amxDol78tSEXDJSOXdiNga2xT9ptE25iR4jpfFpPV696pTaeO4ntAHUvLeyk8xBjXu98UKTGzgudM58ThF+o+BCceKXbazSlI+L77lrb9deFlhF3rM1LzUyErpkNyrrcl9MIAnVSu1fhlqWKeoACBtWpyAYVxNw7H34L3N+Ws+0JnNUGQZTHHZTgua8mxNwRaJvp8IyE1wPTAcfNvCURAWKpix+coxUtH2s5pgQD30g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=p6cVXwCgI3ZhoJUMSTwlj63aGkUFMebjA8TT2q2fUqc=;
 b=aRzOSkJbmm/j07GCGKYi9BU0HERWkgh3A2k+N7wpg1rBBS2Zr6/EBnZ5ZsK6aoa0SOae/qjLKpZFdDqHk9dmom5z7LGRczy9GYUPRJiDPCIiVLpSZtyqEaATX9msJuAMZebbi3TXP4moyzpmwZxMRohDbS5EIqG/Z+HCOQBsBekLi2XtDbJoRo5kzJpe3rkWifmK7Hn5vITxhUrQk7+sZaXifCMXVjxLcIuVrBKW9g4FhQWA7pLKLUZGXLTbUST/lOgy0Ak32lyxpoUVg/QHfjBDwbWSZiNSLtNRCtyYAw4xLauOhdKn+5xkTjVow4mIr+dc2oWibBk20kRkk+wWlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [RFC PATCH] xen/gnttab: Store frame GFN in struct page_info on
 Arm
To: Oleksandr <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <1631228688-30347-1-git-send-email-olekstysh@gmail.com>
 <398b436a-984a-d6b2-bf88-33e994c95c55@suse.com>
 <c006550f-4fe7-29c5-f370-dc67bfac2b95@suse.com>
 <f9e95fd9-d63e-675b-0236-653afee617b1@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <083817dc-05f3-bfd1-b9cf-1855ec9d21a8@suse.com>
Date: Tue, 14 Sep 2021 10:06:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <f9e95fd9-d63e-675b-0236-653afee617b1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P189CA0020.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:52::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1493fdb-7398-47a1-4593-08d9775686eb
X-MS-TrafficTypeDiagnostic: VI1PR04MB7039:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7039AAF610968F79F9B19885B3DA9@VI1PR04MB7039.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qA8gRaTtcgSV6QqOs6BFPRY8j818iituA7PJFLqE8myNq/6qOLx6JcjqH8rPqbA/GsoUA0IOBcwfvxivwEnwz4BzeODOTTdEl9FdtL79Q5FIsPjHtppUKteQakaOivD2MMK8dGtAtkCqRFm6ZL/FfgfCqUjCN3GKHC/6EeAyYVNqzUK/icjjprhwixAXY5Vsy4vTptMnR6rZCxbS2wLnpb/veiyjap3bR6dOgwTvCNdPA+TJFg8lxTrRKhRr8kwHM8vlvtcoIFuwSut2OQy0eLrNGvSUNWJETV1MB/F4jTYPpEc2poSmlDU+PdosCiulk143Q/1UoY7uucoj6f6wfIKe9GaYJccg5dS+dhVgYivvDC5xJG/qP9Q/1u/+2PKwbt/q4Y7fTXrvNT70FrJMKFaanwlc36BhTvyer3SN3n9VAu1GNWHh7qyuhNEbaxefePiV4ac3WeiW08tHOZWIk1yk4LMwMAE9GLExNjGzWzAc8II5m4MlvvWemaMitm+UlI66GGBRu5c15t5ZVwtbrP9noZ6M9aDQ445hjztkYNo4CZSO+gcflNnE7gP3P3IbXwhERMKJhiS1UHZz+6dVWnKfzGTpCCYVMz2wc4br3Y1FQzC2Lz7jQDwWuQjYji1+vbRp55vZjJefeA+uLyJxByVq6J35HdACpOi3OP547yDCHiJA7gcxNyLiFixahW3kphlrgzal+67lWfVCZMDdCTTviMVthL9Gf8pCg2ZmsTA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(396003)(136003)(376002)(39860400002)(5660300002)(186003)(2616005)(31686004)(36756003)(6486002)(86362001)(8676002)(4326008)(26005)(478600001)(16576012)(316002)(2906002)(66556008)(66476007)(6916009)(38100700002)(31696002)(956004)(83380400001)(8936002)(54906003)(7416002)(53546011)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eG1ETmtjQWhhZmtFOG1GUXNhYkpLOEwrME1Cd0hiVUlJUkh6TkZHU2hlaFhk?=
 =?utf-8?B?ZTBlNHBhSlhLVHVscXNGYTJjUUJqSm4ybSs1QytVSnpjUjlLOGJPUkRoMVZZ?=
 =?utf-8?B?dElaRXJNMzBKcFg3TkR2RFE0bGFWakl3UVpMY2FtMjJrRmVvUjhTbXRiamVn?=
 =?utf-8?B?dThGeXB5VWRoK3V6VG45K1o2Ym83TC9CdEVPMXRmdnJrTTlXYWlqMVNLYW91?=
 =?utf-8?B?MytzRmdJRXVtSjM2aG1sWXpaeXlybElHMTRudFhhenBieThIVUk0SmhuSVA4?=
 =?utf-8?B?L2srTFBxZVpBa0ZIMEVmZWNLTmhvaFg0aDJwWlNKSVNmWmlFOU4zVEs1S1Zt?=
 =?utf-8?B?dkkxVmtQZk16WDBUMkJ3eEplZ1IxRXc3RWtHVGFJYll6citmeVNKWHJRVzQw?=
 =?utf-8?B?M0x0UDBsNGhPLzNXWUQzUlBHV1RSL0lDaXZQeWFWMUlyTEZhZzkvSDZiY0U1?=
 =?utf-8?B?TlB2dFZMeTFraWFlTDV6endEMkVORTE5c2JXV3dFK0gxbDh5TVFpcDUyQzdX?=
 =?utf-8?B?WnlWa3JrcmdIR2ZSVEZldUpld0NES3E4V3Z3QnBHUHlGM0NQL29KWGhQN2ll?=
 =?utf-8?B?bWVuR1gvOVZVL3Q2aGx2Z0tVS2trekVuelpqdzBpREFScGJ3Q3FkU0JLK0dM?=
 =?utf-8?B?MGJQc01pSHRNWUNSRlE0VVpHWXFBS0JKZUxHTEtkcWdMU295eGYxZzJHZ2RH?=
 =?utf-8?B?eGNHL0k1RmVMQzZuQXVUMUpHRmd1S2ZydHdyM2N5WVd3b2duYndqd3JSZ05n?=
 =?utf-8?B?VzJOUlRLbFpHYXFqYUtLZm15cnZPblF6cWtwZVE1SHJuUWFNMkpBVTdSbVBD?=
 =?utf-8?B?MjI4YUpxc1kyRUZ5TCt0aGVUMG91NVdaNFhKdUVUOFZrSEZXdzQrZXpjckth?=
 =?utf-8?B?OExOcHR6UHZHNWEyeGlEUmI1QWlaUVZOWkRtNFlLcUdyZTRIOUlvalBaai9I?=
 =?utf-8?B?K3dleWZOYzdXUmFPNE1KQ3IvK2NvMjZnTmpSbGcvSXd6UEZWOWx6SHpka3Vk?=
 =?utf-8?B?OGJvc3I0eXhTMFJJKzI4V1Q2cGh2emVpZ2NSTjFQNXk0SENrdUVYbGtIYjIw?=
 =?utf-8?B?emk5U2Zld0dFNU16emF1Qi9USC91M1drK1M3U1ozUjVsYjA2MlpOTjd2dVRl?=
 =?utf-8?B?MEZuZSsxMzNSSkRReE5FK0Z4TG9VMmFPTHh3RlZrWXhFYnBSWktUTU9wZDNR?=
 =?utf-8?B?dTNyQ2RDQjNKRUxGRGhXY29NYjZpS2V2d1hFSjg1U0FjbG80WE1NSkQwcTFW?=
 =?utf-8?B?VXQ1VWJ0OFZBTWIyRXRwQmxCM2dlSTI0Y0x4V25qS3cwNnY4RmwxdCtkTGVr?=
 =?utf-8?B?cFdlQUcxSUlqOUZON25DOHZHZjJuWDNCWHhCTFNsL3ptV3RtQ25VbFlUc3ZP?=
 =?utf-8?B?Z25mZVV4Z0l5MWp3V3hVajFLUmsxWGVHeDVXVTJZeVJYVE9CaVErRzdkVXBB?=
 =?utf-8?B?Z0FWSHJpZHZqZ0x5dFJtWWJNUHIwOEtFMkZENTZ1TUMzRURqQlU5R0h5QWU5?=
 =?utf-8?B?RXNmd2FoYkh2MElTbFZkMkRXVVdURmZiU0cycVVDMjF4dkIvVlI3dDE4bWor?=
 =?utf-8?B?ZWwrSXJsTnJ2M1BYd3huaWp6Q0tnc2t6T2lxb3FxUEkzY3J1MzgzZTlLdnVQ?=
 =?utf-8?B?QSsrMjU1cEdxcUVENmU1Qk42ZVppSVVxdlZPdUk1Mm1veWlVa1VEQkVKMlJG?=
 =?utf-8?B?bW5QSHdpczBSU3pyTkwraUo0VDlLWGl2UXNwQTVKWHJtdnFneHhidFE2N0lO?=
 =?utf-8?Q?dPytJVjMFAm0wLj99jcQjPRS9A1ip6M39v5Cf6o?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1493fdb-7398-47a1-4593-08d9775686eb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 08:06:16.5943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cLyVRsTB5KqeBchpVbkeQXhaHizl0AtVZagEwNcp7lPet9nVWqa/I8uS1QkW8BnVwhPXAZa7IxzgS/aO+eBk/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7039

On 13.09.2021 21:57, Oleksandr wrote:
> 
> On 13.09.21 09:17, Jan Beulich wrote:
> 
> Hi Jan
> 
>> On 10.09.2021 09:52, Jan Beulich wrote:
>>> On 10.09.2021 01:04, Oleksandr Tyshchenko wrote:
>>>> @@ -731,11 +733,19 @@ static void p2m_put_l3_page(const lpae_t pte)
>>>>        */
>>>>       if ( p2m_is_foreign(pte.p2m.type) )
>>>>       {
>>>> -        mfn_t mfn = lpae_get_mfn(pte);
>>>> -
>>>>           ASSERT(mfn_valid(mfn));
>>>>           put_page(mfn_to_page(mfn));
>>>>       }
>>>> +
>>>> +#ifdef CONFIG_GRANT_TABLE
>>>> +    /*
>>>> +     * Check whether we deal with grant table page. As the grant table page
>>>> +     * is xen_heap page and its entry has known p2m type, detect it and mark
>>>> +     * the stored GFN as invalid.
>>>> +     */
>>>> +    if ( p2m_is_ram(pte.p2m.type) && is_xen_heap_mfn(mfn) )
>>>> +        page_set_frame_gfn(mfn_to_page(mfn), INVALID_GFN);
>>>> +#endif
>>> I take it the write done is benign for other Xen heap pages? I suppose
>>> this would want making very explicit, as such an assumption is easy to
>>> go stale by entirely unrelated changes.
>>>
>>> I also wonder whether you really mean to include p2m_ram_ro pages here
>>> as well.
>> Actually I've meanwhile realized I should put my question here quite
>> differently: Aren't you effectively introducing an M2P here for Arm,
>> except that you artificially limit it to the Xen heap pages needed for
>> the grant table?
> 
> Difficult to say, it might indeed look a bit close to M2P, so the answer 
> to your question is more yes than no. But, I didn't have a plan to 
> introduce M2P on Arm. It turned out that stashing GFN into page_info (as 
> was suggested) avoided huge lookups, so we have got MFN->GFN in the end. 
> The purpose of this patch was just to fix a potential issue with 
> remapping grant-table frame on architecture without the M2P (Arm).

I understand this is the immediate goal. I wonder though if it's helpful
to make this a special case when it can (I think) easily be made general.
But of course there may be (perhaps Arm-specific) aspects which I'm
simply unaware of.

Jan


