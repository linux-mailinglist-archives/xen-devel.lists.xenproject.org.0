Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 985093BE95F
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 16:07:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152283.281350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m18By-0007xV-91; Wed, 07 Jul 2021 14:06:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152283.281350; Wed, 07 Jul 2021 14:06:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m18By-0007uj-5o; Wed, 07 Jul 2021 14:06:22 +0000
Received: by outflank-mailman (input) for mailman id 152283;
 Wed, 07 Jul 2021 14:06:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lj3M=L7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m18Bx-0007uc-5j
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 14:06:21 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 80395b24-df2c-11eb-8501-12813bfff9fa;
 Wed, 07 Jul 2021 14:06:19 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2174.outbound.protection.outlook.com [104.47.17.174])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-31-C08O5834OuSzjHwN4RafyA-1; Wed, 07 Jul 2021 16:06:17 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5325.eurprd04.prod.outlook.com (2603:10a6:803:60::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Wed, 7 Jul
 2021 14:06:15 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 14:06:15 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM8P189CA0025.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.19 via Frontend Transport; Wed, 7 Jul 2021 14:06:15 +0000
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
X-Inumbo-ID: 80395b24-df2c-11eb-8501-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625666778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9B4QMoAz84sWLdKdNyycB29RXmYDNBP30HXYT4g+Bxg=;
	b=c+WNc1Fb16YEvUlv+q7wDXYNkKliMOFIS+IQYeDJbAJWfB85iH+2Yc9UPHE5Mh7DfrTl48
	QokWRyEozirGdLzh4LW9Vvl1rSzDZNujgtyA3ViNZSyA9vh5yjrBlHqixYRqWkze8tBqzt
	92/uJctrFujC/CVdpxaIIK8mQcqbYdI=
X-MC-Unique: C08O5834OuSzjHwN4RafyA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A617n2hYtGDnvKWefrmlF7bm1BanZ72dWku0D1e9GzpzNf9X9I9bFSOFOwPdH4O2Z9wXAiKcvmzpREuk+BiS5pMbd2EIu/L2i06Ao0gNWuVV5Mb2yMUhqBDgAV+5xNsLNkBErPNfumij1pyJ5dZsGFXU/m2DXHXfcWPe/maBu+4SElykbFchrpye9MpWYI5w7gbBaKTwFVzcUY/NGtKrhpkvL6TkNthJkiAhNGOq8wMKpoLhphYZFTZD6iNsxDSr1Dhj1gobE8HxAsjPASGmD9JVq+WoJLUsKUMe9xtaVSbA1JSO0BMD3ZyLmclpO3clrY/tZIQSvCg6Dyr3VPxw0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9B4QMoAz84sWLdKdNyycB29RXmYDNBP30HXYT4g+Bxg=;
 b=F6IiRzaTx+ciHTSN2DOYCOEEJRKRYfUc26AJMOaxZYHGUMZaghgBg5OKg/QjGLTxQ4/X1WjCSHJRnQm9Fobc8X/Vro8vweJ5I+6/x2qyEI0ePecnc/JKrZUiLvb79oN9bNByVrBUB7lIPIeO3BhX4a8YYAY3bsgcFLGHn9IvZ4SCanAFw3KIAEN3/MbXWhev1mog3hjr3QxrApra6pVSt2qeIzxIhAJMvKSa96/NCe2vQAt35GQdrsaQE+I0bhX0pCG8pbHZ6zR1dQwywx6WDanz8ZM+QkS2VBXdsJ2m3jc717CJSoQbU2G0fVh54pSHvwFFzVnYHp1zKrDANBSNGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v5 1/4] xen: XENMEM_exchange should only be used/compiled
 for arch supporting PV guest
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210703171152.15874-1-julien@xen.org>
 <20210703171152.15874-2-julien@xen.org>
 <8c0100ab-dfd7-9c64-c89d-338db62cf20b@suse.com>
 <3bb6ff6a-a4e8-daaf-daaf-a6efe07819d4@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <58669e8e-8397-a5ee-5c54-cd18bbb2718c@suse.com>
Date: Wed, 7 Jul 2021 16:06:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <3bb6ff6a-a4e8-daaf-daaf-a6efe07819d4@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM8P189CA0025.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33340764-fbb7-43bf-21c5-08d94150627f
X-MS-TrafficTypeDiagnostic: VI1PR04MB5325:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5325366FD859AE0699F1EF24B31A9@VI1PR04MB5325.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RZnBarX3FiDesnXui5RJDMu/HOUZVfiVl0onHc4Chqa8lqeIuhBoUdgEKGkbDYd4owtrllxjs6wCc28cdmiLq6M2VRSd+3sky4vxMBy26+yL57PR1qq6WismjFt/xqaOvbGGF4wKsD5nnJOasZ0ei38tZfPDohZiJO379VdSWVMlO0o0E3PkYXkbtq0L/CZk0EM7F82zYomzKawa5L530LlvgeWxIi5N5ZkFnHBzvh4k5XCXSdXr9Uo/cJHIshyjuo5i8+5kyyZdezgGXka2PBfJgb2q5BXZNGtkoVrgNzudukKR68UIfuUbmaQdRk/MMCLgDnzLvm+c/3Ql3v0v4vMGG15n+9HJYzat8XR2CqWvUgp4ht34I3dEbPFqjVGjqf4md54AvrsQ6i9gEWTtykW3Br8E91s0E/uiW7cQ6XQAl0kqtFQ0amnffAELMWC0BMrrlIv0aF1T1k9SXrQOPBG8fFgNlmVGc/gUFkBzFl3O64vRJYXKuk+VVQV3T5vOwLm2zG7yQJK5Tk6BXaloPj2vhI8jTPqGBVwSiV/vjayH4elPtQkx2sxouOSyQ/hDX6BdKiRjLEkEdrZ4lHlvLGVyndSIDSVDbCeFxvRrVzeoDqlGQW1SLP6qEShF5+BzlDgv9bUy7gnVUCCZsZlR/TbrqqDYFhWxKTrgeKFp3E3ovRRTLn/++RPz2zei5B1hWyb/sT794qYEbBvEsyGbax2puNKjEo5QMCqteyjsuI0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(136003)(366004)(346002)(376002)(39860400002)(2906002)(54906003)(36756003)(8676002)(38100700002)(4326008)(16576012)(316002)(6916009)(31696002)(53546011)(66946007)(6486002)(31686004)(26005)(478600001)(5660300002)(186003)(8936002)(86362001)(66476007)(83380400001)(956004)(2616005)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NlBUYlZ0Y3hwcTM5WEVicmZBV0dicnNickF0N09XaEFJQ3RUQ04xMEp0N0Z3?=
 =?utf-8?B?R2hEZGRtbjlRTm5EVnRjVDNLWlpHckRpUnFDdHBTcy9IMzRRRHhQdEJNaTIv?=
 =?utf-8?B?SkpmV0hONEg1OFZBNjFKWGdLV1A4c1c0WFkyMXMraHNRMmJIcXBJQ2F2Q2N4?=
 =?utf-8?B?WUR5ZFpVZGpvaDl4dEpPM2VoY2xHdDJkMmcwSTVwSDNzaUVsbTJVbDBpeTVL?=
 =?utf-8?B?VmdnSkRJTGV3eCt2ZWxNY21yVW5ySUxIamNubUh1c0ZyQUtzY3hQSGgvck9V?=
 =?utf-8?B?bEdsS0hvSTFPVno5UnFZSGNRMXpDVU5zR2lrclpRVjFreDRSMW5laElUeVFu?=
 =?utf-8?B?OEtTa0dlNHZYNndQdGxoRWZKZjd1Y1F0RWZ2aVVWdmN5N21LUkxhQ0tlNXU5?=
 =?utf-8?B?NUJ6QUlxQ2l0RjBkSVBPSFdtMENsam9maFRrWWp1MDM2WmFFdGlPQXhKSCt2?=
 =?utf-8?B?Ujc1UklCeVZPVlpHRjJDaTVXa2RuRXo1N3ZmMWQ3YTVoSllCMHozMmUxeEN1?=
 =?utf-8?B?bGgxM09Wc1A0LzNTbEhEdGlXY3dackhDdHNRSk1ZdE1QMlEzK2hMblhXUFlO?=
 =?utf-8?B?VUVoZG5zYVdhMkFpcCtBUWVWTU1aNDU2NkEzQkFUcVlSM3pwVGxzNUtrUFU0?=
 =?utf-8?B?YzFlMGRmNWtxNFJSeWdFRXJVSENZK0pFVGh6YTQ4WVRVTTk0KzhyU2x4cW9E?=
 =?utf-8?B?M0VzY2lHc1E0K3dhRkFOa1Q4TllLeUFMZC94dGtUTWgvN25Nc1g4RVVxMDh3?=
 =?utf-8?B?SFBwU3RORTB5dW0ydmxUclpIWjcxaStsUC9wNmZnV1BUd2FxSmx0d1k2WkFp?=
 =?utf-8?B?R3BjN2d2N0dYTytPMjdZd0YxejY3cE9UZWZnYmZOU0gveXVMc1o4UFVrbzZF?=
 =?utf-8?B?YURZcWoyd28ySnpISm1Ub3pTQWViV0pDNFhlYm1vSndCaVhOc1ZSeTJ3MW5h?=
 =?utf-8?B?T1hvMW9zRnM2OHlqS2plcFBKR281ZUxEUWRVWjl0S3BUQnZVOURHWElObEty?=
 =?utf-8?B?ckNDbmE1QnZPc0E2bkRWTmZyY09HeFJ5UkhPUGxOR2l6UVBTajFHYWFHSFdR?=
 =?utf-8?B?QThsd2U1V0ZKS2oyNlM3SXJoRTBvbnB4d0JJeHd3ZndwaXd5VVJsYlhKa0R2?=
 =?utf-8?B?QUtKaUNyc0t4L2dWUkwycENDMCtLQ2FCZ21qc2NCZkZ0LzJDeHZ1bm40Rmxo?=
 =?utf-8?B?SmlNV215SUNmUnp5VnBhcXlkTTQ0TXNMNU84YzFZYjRxUWVFbjhHaklBQXlx?=
 =?utf-8?B?bk45dlp0YXozTzJiUWFaUzl0Y29JMFl0MDlyMnZVWnVsL0IxYis5K3BOdEVL?=
 =?utf-8?B?SUdjaSt4cTBMNDc5SnV4SWovMHh3QmNuRjlDdHdRYkgvdk1HakNzLzFsdTMx?=
 =?utf-8?B?MHVGL0duZWRSTjBMaWhCOXY1TStiOElZTWFaUVErY1J6ZzZpUFpITnY0T0tU?=
 =?utf-8?B?SlNoNVJEL0hkV0J1SW5yZHMvOStJcmRIbUR2QmtOMHJIWHdadnR1cEtNVHBY?=
 =?utf-8?B?eS9VWXRSQVVsSTlORUVVVGhyUHNqaGJPaU43OVJSQ0xlV0NuN2NqTERBUS9G?=
 =?utf-8?B?ck5tQ1h4TFR4QlI4ZXRrUzZoWjh5UjE0VWQwRWorQng1WjY2aDdPRlB3QUdD?=
 =?utf-8?B?V21XWVdPSDZJT2Z0aXdmUFVKamFTOXJ2WFZzOFdNdXdKRWV1NHgzcTFMZFRO?=
 =?utf-8?B?VFZnM2tXWmtiQXVXUjJ6eU9DT2FCeWNCSmliNUgvWVhOSzEvQ2M2V29tWkdo?=
 =?utf-8?Q?kLPqF3xozBazpEXDnQs9dGnjzxJKmxE8ZGKl4VW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33340764-fbb7-43bf-21c5-08d94150627f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 14:06:15.6423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XPdzv5WvMw/015FXt4vew+IdSTnKdRPwAS3CtzXIG+0467GG2GfFy1sv5cscD0HojjZGi03tcc6p7VgJcmI5Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5325

On 07.07.2021 15:39, Julien Grall wrote:
> On 05/07/2021 09:41, Jan Beulich wrote:
>> On 03.07.2021 19:11, Julien Grall wrote:
>>> Changes in v5:
>>>      - Removed the #ifdef CONFIG_X86 as they are not necessary anymore
>>>      - Used paging_mode_translate() rather than is_pv_domain()
>>
>> Is there a particular reason you use this in favor of steal_page()'s
>> paging_mode_external()?
> 
> This is what you suggested in v4 [1]. I can switch to 
> paging_mode_external() if this is what you now prefer.

Well, I did say this would be better than is_pv_*(). I probably didn't
pay enough attention to you already pointing out paging_mode_external()
in the description; I'm sorry. On x86 both are in sync anyway, and I
have to admit I don't see clearly enough which of the two would be the
right one to use here, partly because I'm afraid I also don't see why
steal_page() has such a restriction in the first place (which you now
build upon).

>>> @@ -815,6 +812,9 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
>>>       if ( __copy_field_to_guest(arg, &exch, nr_exchanged) )
>>>           rc = -EFAULT;
>>
>> I'm afraid that for correctness of the interface you need to keep
>> this part even in the !PV case.
> 
> Xen never initializes the field nr_exchanged. Instead, it expects the 
> guest to set to 0. So I am not quite to sure why we would need to keep 
> this line.

Hmm, the public header is wrong then, as it documents the field as
[OUT] only _despite_ the shouting warning in point 5 of the comment.
I guess I never really understood why this sub-op differs from
others in where the continuation indicator lives.

Never mind then, indeed no code adjustment needed:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


