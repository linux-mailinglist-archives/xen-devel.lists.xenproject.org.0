Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 254433ED33D
	for <lists+xen-devel@lfdr.de>; Mon, 16 Aug 2021 13:42:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167294.305357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFazL-0007wY-LI; Mon, 16 Aug 2021 11:41:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167294.305357; Mon, 16 Aug 2021 11:41:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFazL-0007uB-Ga; Mon, 16 Aug 2021 11:41:07 +0000
Received: by outflank-mailman (input) for mailman id 167294;
 Mon, 16 Aug 2021 11:41:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3tuO=NH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mFazJ-0007u5-Fu
 for xen-devel@lists.xenproject.org; Mon, 16 Aug 2021 11:41:05 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8c27c4c4-bc2d-4fa1-bc0c-5eff72e8cdde;
 Mon, 16 Aug 2021 11:41:02 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2054.outbound.protection.outlook.com [104.47.10.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-24-w3C7kaWMNg68Jr25Hu8aLQ-1; Mon, 16 Aug 2021 13:41:00 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2445.eurprd04.prod.outlook.com (2603:10a6:800:55::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Mon, 16 Aug
 2021 11:40:58 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 11:40:58 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P251CA0018.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:b5::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.14 via Frontend Transport; Mon, 16 Aug 2021 11:40:58 +0000
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
X-Inumbo-ID: 8c27c4c4-bc2d-4fa1-bc0c-5eff72e8cdde
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629114061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jd4KT21H2fHTncs6vdf4WkWuTtDrXk1Xd3XvwNSwKd0=;
	b=g/lX0u6wfnWYqCCQGFbBiHgdLP87yM3ljPJzJeHt+8qpEUlbRw/yftiv9Z9VAb30h9xwZp
	v6UpjeGjfB3Ae6FpZJhF7cvimyi5K293Oje29xVACZHes+StBU8uiXZ2zOym2UDZnzQx/0
	s6Sc1+wY54Jn24IQNGXWbOBsc1fBKlc=
X-MC-Unique: w3C7kaWMNg68Jr25Hu8aLQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PoNaV6WmxDWBVjWZ1x9zB1TIn26LUtiLZQh4TsBQxmVeMnCZFWMl6iYYzsA0HN87o4mTC0IqxM93fgbMH+JnKY9GKHGrGAh2dOtfUWs7jdP8tbBCmobKP9ANy6uSmj9Z2MutW4z7HVCMmlStIW9yOK421Zc/ZwHJeMLvToGCzQAhThYjjlUKA7FwJxOusD6Eo3Sc+XPcTmihmwDhY7pXOkMKgUDoIguK+Y0//kfZIkFaqRgk8y4QEybezG+A/imQZuXBvCtJ7WW7NZTGYkiuuzryOxEGLrgJpRehHXGTjpQbQt4x9eknTY4nYP/caxt712bSAToDl1vIk53IZmloRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jd4KT21H2fHTncs6vdf4WkWuTtDrXk1Xd3XvwNSwKd0=;
 b=RlespkhcxLxwLE+momXKt0YNcf94wbDW3FrNNM3WokIeYutiEBbLAa9wgISzrkjBTSB4rsW+UPPJIuHIa+AFz9HbiL4FBz41ZaWkUy0mqAGfxHb9VniF8Nc4QY2KB/zk7PnJcVdTra3Fq4oeqSerVJi3UPejXmOG/VQ3HYwwaA3REO+wHLNOXfOeBC/KIHrDusmWaoozSC4htzmlvkk1D8BRjwMgp/uS7CatBmwai7ScoKIrs32H9TPF+P70B2qX6dKcrXHsB6YpTZKxA6gbKiFKpkX0+ihgZtbmEUWIIsd0bS9K9U/Ep8CnghfeQMhRxt842bRSYw1Z89c7ek1+aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 2/2] x86/pv: Provide more helpful error when CONFIG_PV32
 is absent
To: Jane Malalane <jane.malalane@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210816111927.16913-1-jane.malalane@citrix.com>
 <20210816111927.16913-3-jane.malalane@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <aeb14367-4292-bb6c-1a5d-181ebb79331a@suse.com>
Date: Mon, 16 Aug 2021 13:40:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210816111927.16913-3-jane.malalane@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P251CA0018.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:b5::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa570924-b908-4c33-3d0d-08d960aab72e
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2445:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB244557A43ABCDD3E464B1D18B3FD9@VI1PR0401MB2445.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3GLAOF2SZz1zONeVwERMHsMtbOUO7Rb4tvtfKYRUyY4xtbFmJRJBejftDJNnxTxRCtbQ6NkH14dLa6dIer9K44UL7osCwpnJ59DAjXTNJ/6hL2FhLcTjn5bWW+1zbjDvtSbFLp3/D4StsqE7J0dxS48V0vnP86nt2mWXvJ2jIsHQ4HKuPRL6mIns+1/hTSGH1GMWfXlF/ZDjb+3JAE59MiPnDSh/GAEtOLACVkzEwD+HjjzMoM4GwFySUcTfShVtdQejmYGQsaVngNDPsOA35HpZOoFBUqxZ0ZvpPL0U80l6ao+WRvjLhyloBgs0LSA3pPGtP5IOZTKwVIZvdP7KP+Rb6s9vYbgoklhsMpiANzgKx9dzzx57dx5Bi6gT4lwqaOcRXj8EVOddhH0s5W0aE5+luKVo8BhNrLAxwcHfz8PeEvKK0o+VXdgkLSc91nH8ws5yXPDjkVsP1wrluNAhKzyGLkD1w0oAVKwS/PBvbGw1MT428fvx9X9kUv28UituAI9DjSB7Y3lqZ6Da6YGvE7HNXyclCWniMGGpo8a27gXhmrTim+2A1TmGr0gubMholRlTUa2GCZJqOTIfkFUhwSJVIRpQqDZC+U5v/shSEQK/4lb+3bYjSmO/XhCrIjlvDanFzLiixZicjnR0k1bqrQOUAJdmwQhzZl1i0va03h5HSVeRXBdDARgyJcTV5tlWqIhKdxbKemdCZmn9FAmUY6L1mAZxLQQPLWuxUM2KnlM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(39850400004)(366004)(396003)(136003)(376002)(6916009)(54906003)(53546011)(956004)(2616005)(26005)(186003)(316002)(6486002)(83380400001)(16576012)(86362001)(4326008)(8676002)(66946007)(66476007)(31696002)(2906002)(38100700002)(8936002)(5660300002)(478600001)(66556008)(31686004)(36756003)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjdFcFN1N3ZEdDRLVUNBMndvS2d5Yk5FL2VmaEMwYzJQWTVpR0ZDU3o1TERh?=
 =?utf-8?B?SUVkWmU2alZHa1dBYXBkUEpOMXFaeG1ZRTFGOXRscVluNWxHUytMNHh1TXEr?=
 =?utf-8?B?dDdSYUZ0WVFTaUpWOGNha1QraEFSemdoQk5HK3BCaWhrZURvN2tiN3g4QXNP?=
 =?utf-8?B?S0lyS1gvZXZkVEVuNGcrOW11WE1QQTZIMWRHSEpjeVFSZFJTNk14bWN3Slc0?=
 =?utf-8?B?SUtzb2JqdS9zdkFvVkhuQ0d5NStJSDB2emEyL1NMSzVrYklObmk1c2VVaUdn?=
 =?utf-8?B?YngyODFabDVPRExNMjBnLzFqemd1TjdJV1ZXNHh1ZlEwU3JOMXhkZFlyQ2Vw?=
 =?utf-8?B?bTR3VENQWXdkODNNRDB0UE1UQk1VRXZ2amFPa2VoM3d2OXhVVy9LUVVyZ284?=
 =?utf-8?B?UVpkc1RuTzRoLzltWk5CbXZMNEUyNTc2QjRhaFBibGdwRVJOWjRmNEw5S2ov?=
 =?utf-8?B?ZEpaY1BXVlBQdGJ1dk1MQUtPR01tTzQ3ZStwZHZ4SElxTmtHbVhKazlRcFVZ?=
 =?utf-8?B?ZVlrQitnRkZJSkppdFVWZmdzWXAxTG5KSEIrNHF3c1hnclRsRWY1QnJtdElo?=
 =?utf-8?B?N1UwUmg0WjE2ck5NWFNja3NxRWNWMkNMRDRKbzBObFNJcWFPQW1icmVHbzhN?=
 =?utf-8?B?eUpnMTg0MlR2NXBWS2h3ZVYrQjFXRGsvSm5OZ3J1UzVUWmRIUXE4SHRRMlNB?=
 =?utf-8?B?YmpLMm9SOGZHdFdJRjBIdW9YSmc2eUt6U2hlZC90NnRmZ25tbUR0bkdob01W?=
 =?utf-8?B?TVdjWG05dXFiRjdhZ0lzZHJyVUV5RWZXMVpFeEl3QkpVUU8vZURTNEZFYUM1?=
 =?utf-8?B?MmlDbDVNaVBiWlk0NllzYm5XUitwT3dwTkd3Z0E4YngvVi9TQS9MWlBiS3Va?=
 =?utf-8?B?S1ZRMndqZ21SMzZ4Q3AzQVVtdllYRDN6KzZrdWczMUJRbjZJTGIrQytmRXRX?=
 =?utf-8?B?WHh5blBIbGlldEFKMzJvY0FWK0o3b0FXTzBQNk9IMEdxK2JKNzNQMlRlWFQr?=
 =?utf-8?B?NnlwNGhqT0ZUZ3RSYnhzTmRqajZRQlM0ZmIzMVNwdFRZQ1JqUGI4MG1qOHNo?=
 =?utf-8?B?T0lVWU9HdEIvNmRKSXJ2ZmdXWERCOGw1SnRKY25ENkFIYi9vN0hyVHBSM3lK?=
 =?utf-8?B?dWdFMnpjc01nM08yWDBDWXpCc3N5cXF1NnFMN01IUDFoMjhKR0ZMR0NEaGN6?=
 =?utf-8?B?NjNzeDJOcW5PdnBNd0pmeXg3N1NiZGZTc0UwWHJISlc3WVlXOFlmbmZjdGUw?=
 =?utf-8?B?L0IzS2VlQW9oa0RvVU5ZZXVESHdlak1nMDZVU0tKT2JJdmhXMER1YzFJVjd5?=
 =?utf-8?B?NmlHOEdoeSt1RDVudHozNzZtV2VMWkdkbjNaTE9OQnhURHlwQmhQOWd1alZJ?=
 =?utf-8?B?UU01V29MVm5XT1JBKzJ4d3VzWUw5UlBBcnRiZnBhSmpDazlFTklBQ3hPaHJl?=
 =?utf-8?B?bXdmZ3Y5ZWp3dFQ5cWhiWDE0dmU2dVFWTEJQSzVsRFlwa1UwRmRGcUEvd3VB?=
 =?utf-8?B?ZzhUQmVzYkU1eXlESnBjK2k3MHNTSUl4YWVTNi9DdFRLUnBXaHlubzVuVXk3?=
 =?utf-8?B?cStBd3dBTFNRNkJRVjFsU2JjUGlDZHBhNERvM1lOak40RW94anBnY1BpVExU?=
 =?utf-8?B?UHJhMVBrMnowVGQxdW5WQmtiWVNBSFhpRmU0SDZ3MHNwVDZLMzQzYmJ1UENq?=
 =?utf-8?B?S1A4aUJJRittcmZOa3FTOHZzeUlCYUpPcFk2Tm4rS0JyTy9lRDNtOGw0OTU1?=
 =?utf-8?Q?1oW33W5UQy/f3ZJox0TWzdGCnGM0ecRPry3XMYx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa570924-b908-4c33-3d0d-08d960aab72e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 11:40:58.4592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6gGRjghMWIQiw0JiBd1IlP5g+j3C9WCwVtL/UiY0R14lB+o4PEsYnwo29ZISLJgBcn8DIfZ8LBYfXpzZ6PXlqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2445

On 16.08.2021 13:19, Jane Malalane wrote:
> Currently, when booting a 32bit dom0 kernel, the message isn't very
> helpful:
> 
>   (XEN)  Xen  kernel: 64-bit, lsb
>   (XEN)  Dom0 kernel: 32-bit, PAE, lsb, paddr 0x100000 -> 0x112000
>   (XEN) Mismatch between Xen and DOM0 kernel
>   (XEN)
>   (XEN) ****************************************
>   (XEN) Panic on CPU 0:
>   (XEN) Could not construct domain 0
>   (XEN) ****************************************
> 
> With this adjustment, it now looks like this:
> 
>   (XEN)  Xen  kernel: 64-bit, lsb
>   (XEN) Found 32-bit PV kernel, but CONFIG_PV32 missing
>   (XEN)
>   (XEN) ****************************************
>   (XEN) Panic on CPU 0:
>   (XEN) Could not construct domain 0
>   (XEN) ****************************************
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jane Malalane <jane.malalane@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


