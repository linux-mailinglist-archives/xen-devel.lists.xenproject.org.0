Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7662F4C410E
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 10:15:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278911.476337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNWfq-0005hr-5T; Fri, 25 Feb 2022 09:14:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278911.476337; Fri, 25 Feb 2022 09:14:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNWfq-0005f4-1P; Fri, 25 Feb 2022 09:14:02 +0000
Received: by outflank-mailman (input) for mailman id 278911;
 Fri, 25 Feb 2022 09:14:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RDkG=TI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nNWfo-0005eh-0P
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 09:14:00 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 436d0a82-961b-11ec-8539-5f4723681683;
 Fri, 25 Feb 2022 10:13:58 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2056.outbound.protection.outlook.com [104.47.6.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-9ki6KQL-OpeMvh6mcDAr3w-1; Fri, 25 Feb 2022 10:13:56 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by HE1PR0402MB3449.eurprd04.prod.outlook.com (2603:10a6:7:8a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Fri, 25 Feb
 2022 09:13:54 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.025; Fri, 25 Feb 2022
 09:13:54 +0000
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
X-Inumbo-ID: 436d0a82-961b-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645780438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TrTFREjytDbzqeDL8ZkSTClwJ54uo6X9ShAXL2biEHg=;
	b=UM2KkVzro5c3iDk3NRPJEVIG1yLb5Hr7z7fseNgu15C1R849YhYWAPY4KXPtNdsfstcBCG
	ziLVS3Ktnp/POYfMu16z7ALDFeCoMRP0MQl/JoXzlmrrs1G7Er/TYbAlPUOA7YMsoQ1KPJ
	IS2dlWzeXdsLyBbzB49HgAqG4ZJd3rs=
X-MC-Unique: 9ki6KQL-OpeMvh6mcDAr3w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R6NNch5Is1TkuOLcMWFvC166AZcQ1AX6BPbgKYHMNRq5VHUGxxXx31rGdPpUv3qnMV51qd1Zxk3JQTqioL8kOTD0Nj/jRkct54QubbKJT3jlqWWnSTRjravfzrdtz06wD2O4nI0R29AP5erJStpMAAl2JwM+ACoVCeC35ksyTXC2cTvAeFdGg43GfIU4tJ736Vfh4O/T65REnCwY7Qs7TQiZQmNMPn+ebmw9p9vQkg7+DQn9GAI6y6ee2nqYEpeYx028jTjjDE+so2TE5YfLtMoCzWyfApGCdB4gLAGpV6Xm46TqM9UkjVX81z7yMvYAWHkeiJdPzQwJ4RFKkFG1rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TrTFREjytDbzqeDL8ZkSTClwJ54uo6X9ShAXL2biEHg=;
 b=EukByAmETfc/cFH2lXFS4fc/yxdVYzpRuZCMTvnG4zRIyDY6xoJpUNfpAS68ouPAsrBZsjTfrPSc45lFe6ZVScD5MibuPdViqDycYzJUlzNurgDeW/joa2OePeyY3NXNd/YZegOMzVXKF22MuKCO3aR8XJGY2CQTrkjpmm8n6dmEzMvuq6hy1FTsQ/TBlA0yFZ80FvIPLXhBs+TgQA8PkobG3qZTUZmaL5fKBxJEIQwyPbRvM4UFfjAkpkGuadjRVabjL7YmhQP6OgYJGQd+3MUZvFMbj6+wi5ocVphcEOH4KiWDW56lrEANPSnSdHB7biCCUfjzIh8qPfnBWDYGlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9761efc1-15c9-0d5d-95c3-217bb5054853@suse.com>
Date: Fri, 25 Feb 2022 10:13:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 2/2] xen/spinlock: merge recurse_cpu and debug.cpu fields
 in struct spinlock
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20220224105436.1480-1-jgross@suse.com>
 <20220224105436.1480-3-jgross@suse.com>
 <15e71984-37db-c6c2-5feb-05c8f1ad85f7@suse.com>
 <05a26a5d-8597-84c6-171c-2751987b7836@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <05a26a5d-8597-84c6-171c-2751987b7836@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0402CA0003.eurprd04.prod.outlook.com
 (2603:10a6:203:90::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ede18e35-fc9f-470a-d68d-08d9f83f2542
X-MS-TrafficTypeDiagnostic: HE1PR0402MB3449:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<HE1PR0402MB3449AD13635A8131C5342358B33E9@HE1PR0402MB3449.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Tg9aiWzoBkb/zN9z4bGIvjCPO7eDPzz/0CWBoYsfDJeHIs00/z8Y/qMsa1drlNGx6idObPiFPbWjXK3rNfCYPUO2DnEqtHLMaTihaKB90viQ3u2r5ng6u9zknDg68yH/XORLf6L1MGHB0uc5OHDyrM8z7AHQEGdOuKJLIW2nxL6ReDk5yGXsbbyRLcI/EljXSDDgnbp01S7wmDhHL1NF3J6UKTWCBDcAGVV1EeX1A6aeE79UEQMCWqxcAVjtWS3TxoDK5cR6z6Tqs4yNSDCJtJHhG5UwcQ8WBF+5q++gTU06MvL5QlRwzrVT4aEj2jpL+HHepKLiHuZnKSApvx7Jm1rSXTO/arJptZozHK3L1dzK4spqJyGXfP+fKUD80IafAcZY59b9wICDmzOBAdDJzIM1tscsZuvHRf4759cnJ2PF77Jk4RAqQ4cZK7a1WQ91Ze4Haj7nMieXyVV03JH6hsDtsCEVPtbWJhAxjWffWnquif083pmAUfsKcS9DxKZKLNJMmQNu/MGKUt2EOZKtdWwToOc8uD+L4Qhkwk6ZrK4i9W7foDgUG51UVQlHs9kMX3vJaP9uF+qoQQp4TLSgqx8W3o0Qyr/utcmApmVMRJPe+gv1W9iVBSExQpDDcen2xhInm+qOOinPktKYCyLlFqZ6jALPSojxkCSjimWg922zONOUlEmHAJSEJ1Tq6hAxEJpUWZ+G60zicrAvVPdHIKvq+QX+V9AH6KUIjT+XamU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(8936002)(31696002)(316002)(38100700002)(66556008)(508600001)(83380400001)(186003)(6636002)(26005)(37006003)(54906003)(2906002)(66946007)(4326008)(6862004)(8676002)(6666004)(66476007)(2616005)(53546011)(6506007)(6486002)(5660300002)(36756003)(31686004)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHVEcHNWZzJ6Wkp1SXRkWGJMYk43dm5iR3N3NGplTWdST09oVkdhSzhBeWdP?=
 =?utf-8?B?UWZ6bjRVVlFzMnhnWnllaVBPdXdyeXNvb3hVQkFGb0I4WXU5M1cxQnVJcEg4?=
 =?utf-8?B?U1BZUURWYmczUGc2aXVNZzNWOHFCazhtUmlMZ01HeGl3bVh5a2E4SUFGa3Fm?=
 =?utf-8?B?VFh5VlVQbE1mZVJwamFhMDBDbzZFckpJckhxeDFNeWtONXVuclMyUWxUZ1Vy?=
 =?utf-8?B?UDR4YmY0cXllQTlnSFk3NkQram9QeXJlTXB2ZlJ4K0NSMkd3bVNab0N4QmhY?=
 =?utf-8?B?ZXFOUi9BRWNLLzVlL1FwZk9iTk5oVnVPd2dEYmQwTUFMYTJRaUt2QmlXN1Y2?=
 =?utf-8?B?ZWg5U3lyYkQ1MXlHdFYyaTR2RFFZenAxc1h4NytuS1ZybHIxMjNTYkhNMGI5?=
 =?utf-8?B?c1pWc0x0cHRCMmZOMktPazZ0ZHU4Y3kvSGkyQXJ1bGVxSkZmY0RqZy9WQkhZ?=
 =?utf-8?B?UUFJNXZjOEU1NVN4YWppZ1JqTWhsVGJ6VWFkbnBKZU1OempGQVhtM1htTUhT?=
 =?utf-8?B?cUhqdXcwUDRKSkxlWXBmL2ZWcktGUlMyc3hVd3ovWWFuM1FLM1B4bXdTd2ht?=
 =?utf-8?B?dVpaOXJLdE5lazJ3aUwxVURoeHVuejRHejJoa2ZLRFEyclJTeXh0a3hsUHZN?=
 =?utf-8?B?d2J5LzdsbCszRGE1ZGthdU9oR3BtalpLbHlYQks5YnhZdFN6S1NUVDIrWkI0?=
 =?utf-8?B?eFQwT21LbVZBZ2dtTmQwMmhxbjhiZ3htNUNROHhxK0hIZUM1UUJQa3hkK0gz?=
 =?utf-8?B?bm5sQkVCWEswNHkxaEFXMEltRngzVFFkcktmcm9icW1SVyt5Rk8xSGUrbjhO?=
 =?utf-8?B?Z00wZVlLekx1TEt2a0Q4RzRrN0FFOStTSWNPdEtmeEE1WDk3UlV0QmpTMVZC?=
 =?utf-8?B?aElVNHU1OWxnb3pDd2hNa0FFR0FtSFFrdm81Y1k0Y1RMSkI2cXNGeS9oNVBu?=
 =?utf-8?B?eDRGZWg2aThWMlduMlpGK2NvcGw4SzBTZ2Zzd1pkOGxRUlhaUzB5MFRIMHVI?=
 =?utf-8?B?cFdvb212blBqNnNSUzRvRlZodEZtZ1dGUDJ6bzR3R0F5cnBQVTM2a1UxYmho?=
 =?utf-8?B?b21pVWk3b292TEYxTWc3VDZGMUJKeWRYZ0I5TkMrZzQ1N09PNDdjMnlSUEhN?=
 =?utf-8?B?VjJ2d1Jhdk5ZaFIwRDhOOGk0N2tXRGd6V0FhV1d4MzJESlhJM3daQlhEREd3?=
 =?utf-8?B?Nkt4RC9Tc09EbERoUWtsQkYvTklzV3BSOVFoQTZWOGhrUEd2Uk9CNmVXM0ZX?=
 =?utf-8?B?TGJwbndPenBjcUJzQmxuMWpOOW9uRkw2c3NHVVlvY0o0WUdQTi9tY2ZwNm9Q?=
 =?utf-8?B?OVZFS2ZodTNWbnlVVjlqZU9jTGNZR2tqU2VMM3VEVGRpWHk0YmxFUWpNVllw?=
 =?utf-8?B?aUR4YWF0MXdxZlBZOGV1QmpBSWhUR2VvMUV4ME5meHZDang0UDVpa0JRVHdD?=
 =?utf-8?B?K0RsVFlGTDB5Wjhja2E1RVFlYWtNSXdNOUIxOXhSd3JnQTJuaTZmTk9GQlFi?=
 =?utf-8?B?emtvZHE1VStWSFJYWmR4cVg2N3J1QnY3VmZlR2lNVFRNMW1wRDdnZ24vTW5k?=
 =?utf-8?B?dUd2OFU2a0VsUGdvakdHSUdzenNncUFqWE9TZkNWenJlRTRJeG44OWtBUk54?=
 =?utf-8?B?dS8vVGdTWUw3VUh3cEVRaTVpd0R5dFBnWm1ZZi83S1FkLytjQW4ySEFjNUtH?=
 =?utf-8?B?bFoyek4yaVVhQy9wRzV0b3kxblJoeUdoMzVhOFk4ZGplWDFFaFUrOGdGTGhi?=
 =?utf-8?B?UHd6b0dTVytNNFNBN0ZZMFBBNnlWQTViYjBkM3hoK2EwY0lJM3ZNRWVZMlU4?=
 =?utf-8?B?dndWMlhjcU1iQmF1Y2xKZ0kvSkdXLzl2UlVpVzY4eUpWYjN6UzNNOVhBMENt?=
 =?utf-8?B?djF1UUU1UVhOVjZ6aWRFUFBqbDhJc0tuMWwzbnduanMzSHN4NU5NRlNoNHUx?=
 =?utf-8?B?Y2xnNmZ3QTdhN2FLYndCZlRCNm5JUExTSSt3OTJJSlAwNitoOUFCRWRlY3Fx?=
 =?utf-8?B?azdBL0lrcXIxWnZxZzQwaUN2WmJKOENBVGEzTXA4Ymt5QlF3UU5XUjgrOWVv?=
 =?utf-8?B?NzRNVE96VXFiMndKYXBGYmlBSzJmckNjcnhkc1gyM24zMzRCNk1HbzYyeFJy?=
 =?utf-8?B?VStiQ3I3Yy9iSlk5VG9NMGpsaDdLRnRtVkZ1czhJYjA3Q3dSanFKNHBaajkz?=
 =?utf-8?Q?Eypw/OKlYZRjrLR4he+KLOU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ede18e35-fc9f-470a-d68d-08d9f83f2542
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 09:13:54.2807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OcLNLwoJP27c4kRC+BSSJQMhSSjPOqAXcP5uQfovvgppmBpipuoKg3ZbgSA7naeEoprSNRn5UGp9QmUHabAoAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB3449

On 25.02.2022 09:36, Juergen Gross wrote:
> On 24.02.22 17:11, Jan Beulich wrote:
>> On 24.02.2022 11:54, Juergen Gross wrote:
>>> --- a/xen/arch/x86/mm/mm-locks.h
>>> +++ b/xen/arch/x86/mm/mm-locks.h
>>> @@ -42,7 +42,7 @@ static inline void mm_lock_init(mm_lock_t *l)
>>>   
>>>   static inline bool mm_locked_by_me(const mm_lock_t *l)
>>>   {
>>> -    return (l->lock.recurse_cpu == current->processor);
>>> +    return (l->lock.data.cpu == current->processor);
>>>   }
>>
>> I see a fair risk with this: Behavior will now differ between debug and
>> non-debug builds. E.g. a livelock because of trying to acquire the same
>> lock again would not be noticed in a debug build if the acquire is
>> conditional upon this function's return value. I think this is the main
>> reason behind having two separate field, despite the apparent redundancy.
> 
> You are aware that mm_locked_by_me() is used for recursive spinlocks
> only?

I will admit that it occurred to me only a while after writing the earlier
reply that it's used only with recursive locking, due to _mm_lock() indeed
using spin_lock_recursive() unconditionally (i.e. independent of its "rec"
parameter). Nevertheless I continue to have the vague recollection that
the duplication of the two fields was intentional and deemed necessary.

Jan


