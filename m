Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DCE4265A8
	for <lists+xen-devel@lfdr.de>; Fri,  8 Oct 2021 10:14:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.204499.359646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYl0n-0006CQ-I2; Fri, 08 Oct 2021 08:13:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204499.359646; Fri, 08 Oct 2021 08:13:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYl0n-0006Ac-E8; Fri, 08 Oct 2021 08:13:49 +0000
Received: by outflank-mailman (input) for mailman id 204499;
 Fri, 08 Oct 2021 08:13:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aYfl=O4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mYl0l-0006AW-Pw
 for xen-devel@lists.xenproject.org; Fri, 08 Oct 2021 08:13:47 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a824ca16-280f-11ec-8024-12813bfff9fa;
 Fri, 08 Oct 2021 08:13:46 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-28-dpBFHXTtPAudUpyRV-Q30Q-1; Fri, 08 Oct 2021 10:13:43 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2333.eurprd04.prod.outlook.com (2603:10a6:800:28::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Fri, 8 Oct
 2021 08:13:41 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 08:13:41 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0202CA0011.eurprd02.prod.outlook.com (2603:10a6:203:69::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Fri, 8 Oct 2021 08:13:40 +0000
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
X-Inumbo-ID: a824ca16-280f-11ec-8024-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633680825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hqWELZeks3LgEfaO4qPvZ2j58FW9M+MeMqcPnZFGtx8=;
	b=Lu4vGo2vzL11BIwiRfIZVAx6tziExL5cSs1ElQP/DDLbpDN4LprxAGs7DAOP6IcifQYf/I
	w3XJrj2hS5c73MG967GtZx26QxOQDbd5/EwWOsUxGlZ57LPnAxgaxQZ3oYjXoCAIrwWSg9
	GyfJpyzEogCUSU9Kh2jpAXlzeif0l8o=
X-MC-Unique: dpBFHXTtPAudUpyRV-Q30Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n0V5SYWDl72Rw44OHGDELfhqDBvXb9uo1br+l/K0WEXsOxlvmrCwupM4sq3fotWbXOs8IjOYlc2aIYb9BSis4tc4Rn87i9DRPs7uywBKCQkt1f+x1gXr21CvDRQYUotM9XX9kuNdVz2UQitNMrOoV7V+7aGLIG3hB8otl2vWWLQryskgrBbZMmoMx7QjB/JACl2FOuO6d49skIvbIt3XyEJXizDkAjwpk7Uvpvcp4bv21ndir74qWwj963N+usUG/0DFhJZBPGBXlSupf2zEvGJIZGIyS95IzaVk59GJ6fwDxISCDYHk5SuOtB8Fkg+yOUVuTaTzMwCNQDkK7eIZGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hqWELZeks3LgEfaO4qPvZ2j58FW9M+MeMqcPnZFGtx8=;
 b=JYX79DsDtL/eeOOw27PDfnwOj7nIle613lTQTxsW6cVImLoFyvrIwAFHnnMMxMW4k1J1i6pvC3ZRI60STujEeRKNRv5T6TTXK4xzSiW+u40pI2L10ieGbA0hak1R9EhllkqfyK9+RSgFk2QFCqCW6a4rddW/+H8gfMClLFXhMtz00Hqa8PEgFyMIzwjE7zSnZEFHbEhK9WOMN4bKL0ixbwdDxwGrKaYmGLUR/Rz+iiKWjkaZFJBxjhHsZFvJOwEkfDqjmJRvatUmM9rY+uQukWs4wal/ARrw3lkJu//dWla0crINW0vq7mLn03jps0PCgmIt2LUxwUqJXB6eiDiYjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH V5 1/3] xen/arm: Introduce gpaddr_bits field to struct
 xen_arch_domainconfig
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr <olekstysh@gmail.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Juergen Gross <jgross@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <1633519346-3686-1-git-send-email-olekstysh@gmail.com>
 <1633519346-3686-2-git-send-email-olekstysh@gmail.com>
 <68cb29bb-7d84-dc27-eead-4a079b9caf68@suse.com>
 <e77eea6f-163d-0920-2e90-fb9f3a602743@gmail.com>
 <ffb40f3b-2394-7747-2c06-955e2aa87cfc@suse.com>
 <387608b9-c7b2-e814-7fa5-a262acc0c73d@gmail.com>
 <ae852345-66ff-7bcf-f68e-2161e23933a1@suse.com>
 <alpine.DEB.2.21.2110071311450.414@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b8e868a2-9af3-de6c-0683-4bb2ff7821f3@suse.com>
Date: Fri, 8 Oct 2021 10:13:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <alpine.DEB.2.21.2110071311450.414@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0202CA0011.eurprd02.prod.outlook.com
 (2603:10a6:203:69::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f8758e5e-e333-4e65-62b3-08d98a3389dd
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2333:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB233347F829043D142B5EB156B3B29@VI1PR0401MB2333.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	r55kVbK9T3hJD3Sdv4cSkzQb5fL8CCnRDi+hYyzvSRqyyEYJF+JFu6jlQ+H3sbl4RpVcAVeX5RWgWIs49GP3eVTB2ktmP/icPtMS6iA07bxV35p28F/+Tu+eOLOCwmJ01/U9sOxvFRpMUjcmbaOX1iogzQvoa6h3wtKU8RjUSnG1hUo/Pd1Vx10ZTqXbbMHOVzAnRMsxqaembdvQZjO61hM0cnFOtes47kHSOaDuLsJQkicfbZHqFAGMN/nimuzfQSCobirIf73c+Jse+HYRrxZ0LUQ0QXLusked04RxHAfWkkRMmJuO6v5GaUyoJsCtr1ke4sp30E2zAHb6jLzRXup6wMgwgtwhGhHYMICZqRecTRKN5HmVezxtgm59Q8Y5r+mXt8hVG5Cc0Medvlr3WXM4luCpCJYFfuvOGBG/e1351wolGTD+2mNC1KwKNUstQtyR05QTMzlCIoPa9UkYsNoKLBoNG2KGBYq7hIeuIdP7kld7FNNw7dRPZuehU1ixphzFzJTpj4EKw1OjPM8W4yxbseEa9WyW78E773lsIU3E+bou3AOYcfCaUe/WceIjJz48jm2dPYXI3tdmLvQZYIm1IGSz4DJu+KhMEnLdcnGBJyw6GXUcr8AjlUkvAZMWYiv8rnLOs9DxB5Mtfr99/V/SHjc+GfBkcbMyofzKZPQJYBKdhq9fbl77gqOBtISlhpsJDtXqNAbGJLu2V8fTykNoSdE1o5NzPtkLoPzgcLLkIkDXxHTTWzm8Zg7TLAGr
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(6916009)(86362001)(508600001)(7416002)(36756003)(16576012)(316002)(8936002)(54906003)(6486002)(2616005)(26005)(2906002)(5660300002)(66946007)(4326008)(53546011)(66476007)(31686004)(8676002)(38100700002)(31696002)(66556008)(83380400001)(956004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGs3VEZIeEZ5ajVxSU0wSlJQQ1UrdE1BcmJuTEdxMzBjWlhWRHZ2d3U2eGhD?=
 =?utf-8?B?TGJaVjRFTVJzck8rMWFjN3J5WWtiOW5qREhHQWtCUlgwVERkWWl6RmpvUUkv?=
 =?utf-8?B?cGIyYi90d0tkUGVHcGVUdlExd2piS1EyaVlaUzlIVzEvdlVONlpXR0JwWm04?=
 =?utf-8?B?Z0N3RFlleFppL0pTUDFaTUs1Q3pSS2hveVF3ZldPdGpZN3c0Ym1KQ0Q2R2ZK?=
 =?utf-8?B?UFdBbUdsUzc4RWJjU3ZSRHpqR0RsZW9nRmVRT0l2VTV3MEd0SVJzSWMwWFdy?=
 =?utf-8?B?OHJoS0dMRlpvTUFmalRlZitSTTIzSHd3NmQ2aTBXaHRCRE9QK2U3VzVHbzhZ?=
 =?utf-8?B?dDRJNTBVcmwvY1FaVmdRckFFL0VRdjJsMnVVdFZJdnJFUlJVdU5NMGhBU0FR?=
 =?utf-8?B?YmxpdHRHMXphQXFjeWlnUDdXc2w5ZVJPcmVCWFB5dFQ0blJTWUFHbmlMTUZE?=
 =?utf-8?B?L05CTVNscDZFSHJ0emdrOVJucmxwYnI2ZFEzVjBpajFKb1dCWWR4OUZCUGJJ?=
 =?utf-8?B?VTJFU0EzbGNCSmx2OFlSYTMvVTAxanVTMVFMSEs5MFFhckpBWHRBNVdJd3Fo?=
 =?utf-8?B?NlBieWNReDZLTVI4Szh4SzFqYU94SFVWeUhCbWg0ZUY0NzBKT2xpZjJHTlk0?=
 =?utf-8?B?dVBLM1lsWk9wZlBqeXJVSS93RnlzWW9YZ252V0VBNnNvT1U4cjFwdFNIbE1o?=
 =?utf-8?B?M0k2Yys5MDhGQ1BBbDM5d3hlOTFhVzIrL0ZPR21DY0JEN1hSVmtqNkZKZS82?=
 =?utf-8?B?ZFF6UWxBRThZdEpzY29yV2R0MTlTczFmb0FoUlFjUFc2QVF2dzZ3VGhUU1p2?=
 =?utf-8?B?OFhJR1BKYWlzZ1FqR2ViS2hnbGZnNGtjNG1sRmhmSjJnclpGRHAyMWhZbWky?=
 =?utf-8?B?TzdkV3dEcDhweDlKM0ZucEQzQ2o1V1RPZmZYdTJkekRic0NUWlh6L0kwaUtY?=
 =?utf-8?B?Sy9ZNE9UYXhaUi9MOU9HZVNJTkc1Q0RLVDlGRDdualVGaUh2Q2NTQ0J1MDRm?=
 =?utf-8?B?RzZUZ3N4NUtyOTFYbEN3YVc0UFozNjA3U0NSbnlscjYvM0pGcVRJZDJwb2VV?=
 =?utf-8?B?SnBoRlZwOU1PZnRQb1VEQUNXTHNUbHFKcjRhenRXaTNYMk5tcGR0Y1hSUDlD?=
 =?utf-8?B?TVBlaGZNaEdIbU5SdXQ0UkhBSHdkQnhmZU9CbWJyM0p4OVBmZEloQ0Y0emsx?=
 =?utf-8?B?OGFuK2ljSkxRWGN5VldGVktqZEpoUmp3UHVURkc4cHFWaG0zUnFjejN1Vkdz?=
 =?utf-8?B?T0ZBM2Q2NkFzNEtwUXk1ZWUzSHg2c0cxOEpJaThOTjlUWnI0UmV0UHpzWGpx?=
 =?utf-8?B?SGxDSDh4SmdhaXFDVjBneS9VVmlLcTRqZEgvNFpCVWRJZVlKU3dQTVR5S1Nq?=
 =?utf-8?B?TlRpTmVaUlRQY1pXN0NlcXpSUjFyNTh3eFE4alZ3Mk5kMG5yQlJyeVBlTXFp?=
 =?utf-8?B?MnNDa1BtWW4yRnF0Q3UwUnZTbGR1TUxOVGlsMTdJVmhwTmlXRk9IcDRlRVJz?=
 =?utf-8?B?T21XK0RDWEgyMGNML2NXLzFxOGpTMG4xZndORVZ3MithdnRJOWZBallsM3VQ?=
 =?utf-8?B?ZnNoeThPeFJpWXlsVTRoMFVyejhiYkdlK0VDY1BOK2NTcUtVcW5jNElUam4v?=
 =?utf-8?B?d3RzV2FUUWxER3NjS1dJbnMzMFVDdmt0WmROekJkZElLL3JpdmlFK1NPRHFV?=
 =?utf-8?B?MnliVkppSFRXSEVwZ0pxY3kxSFNvZUdVZUNyamljWDFlV0pJU3FZU2ZGUlo3?=
 =?utf-8?Q?DioIMaTeYyoE4bAwcgGHLJVPNFecwfWgJ50TpQ+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8758e5e-e333-4e65-62b3-08d98a3389dd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 08:13:41.3286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0irD3Vr79aSpX8AQOuGznV8iP8vFXc+6dYV2+AKLYgDKtELUhyghB04c1QDPfTQ8qIPtzHvhqwAgfhKKUzHbsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2333

On 07.10.2021 22:23, Stefano Stabellini wrote:
> On Thu, 7 Oct 2021, Jan Beulich wrote:
>> On 07.10.2021 15:12, Oleksandr wrote:
>>>
>>> On 07.10.21 15:43, Jan Beulich wrote:
>>>
>>> Hi Jan.
>>>
>>>> On 07.10.2021 14:30, Oleksandr wrote:
>>>>> On 07.10.21 10:42, Jan Beulich wrote:
>>>>>> On 06.10.2021 13:22, Oleksandr Tyshchenko wrote:
>>>>>>> Changes V4 -> V5:
>>>>>>>      - update patch subject and description
>>>>>>>      - drop Michal's R-b
>>>>>>>      - pass gpaddr_bits via createdomain domctl
>>>>>>>        (struct xen_arch_domainconfig)
>>>>>> I'm afraid I can't bring this in line with ...
>>>>>>
>>>>>>> --- a/xen/include/public/arch-arm.h
>>>>>>> +++ b/xen/include/public/arch-arm.h
>>>>>>> @@ -333,6 +333,11 @@ struct xen_arch_domainconfig {
>>>>>>>         *
>>>>>>>         */
>>>>>>>        uint32_t clock_frequency;
>>>>>>> +    /*
>>>>>>> +     * OUT
>>>>>>> +     * Guest physical address space size
>>>>>>> +     */
>>>>>>> +    uint8_t gpaddr_bits;
>>>>>> ... this being an OUT field. Is this really what Andrew had asked for?
>>>>>> I would have expected the entire struct to be IN (and the comment at
>>>>>> the top of the containing struct in public/domctl.h also suggests so,
>>>>>> i.e. your new field renders that comment stale). gic_version being
>>>>>> IN/OUT is already somewhat in conflict ...
>>>>> I am sorry but I'm totally confused now, we want the Xen to provide
>>>>> gpaddr_bits to the toolstack, but not the other way around.
>>>>> As I understand the main ask was to switch to domctl for which I wanted
>>>>> to get some clarification on how it would look like... Well, this patch
>>>>> switches to use
>>>>> domctl, and I think exactly as it was suggested at [1] in case if a
>>>>> common one is a difficult to achieve. I have to admit, I felt it was
>>>>> indeed difficult to achieve.
>>>> Sadly the mail you reference isn't the one I was referring to. It's not
>>>> even from Andrew. Unfortunately I also can't seem to be able to locate
>>>> this, i.e. I'm now wondering whether this was under a different subject.
>>>> Julien, in any event, confirmed in a recent reply on this thread that
>>>> there was such a mail (otherwise I would have started wondering whether
>>>> the request was made on irc). In any case it is _that_ mail that would
>>>> need going through again.
>>>
>>> I think, this is the email [1] you are referring to.
>>
>> Well, that's still a mail you sent, not Andrew's. And while I have yours
>> in my mailbox, I don't have Andrew's for whatever reason.
>>
>> Nevertheless there's enough context to be halfway certain that this
>> wasn't meant as an extension to the create domctl, but rather a separate
>> new one (merely replacing what you had originally as a sysctl to become
>> per-domain, to allow returning varying [between domains] values down the
>> road). I continue to think that if such a field was added to "create",
>> it would be an input (only).
> 
> During the Xen Community Call on Tuesday, we briefly spoke about this.
> Andrew confirmed that what he meant with his original email is to use a
> domctl. We didn't discuss which domctl specifically.
> 
> This patch now follows the same pattern of clock_frequency and
> gic_version (see xen/include/public/arch-arm.h:struct xen_arch_domainconfig).
> Note that gic_version is an IN/OUT parameter, showing that if in the
> future we want the ability to set gpaddr_bits (in addition to get
> gpaddr_bits), it will be possible.

Well, as said before - I'm not convinced gic_version being IN/OUT is
appropriate. At the very least a 2nd way to merely retrieve the value
would seem to be necessary, so that it's not only the party creating
the guest which would be able to know.

Since here's we're solely after retrieving the value, I don't see
the point in altering "create". As you say, domctl can be changed,
and hence at the point this needs to become an input to "create", it
could easily be added there.

Jan


