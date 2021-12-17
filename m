Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A60674785A6
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 08:40:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248443.428558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1my7qI-0004dd-Bl; Fri, 17 Dec 2021 07:39:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248443.428558; Fri, 17 Dec 2021 07:39:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1my7qI-0004bT-7W; Fri, 17 Dec 2021 07:39:50 +0000
Received: by outflank-mailman (input) for mailman id 248443;
 Fri, 17 Dec 2021 07:39:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zqed=RC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1my7qG-0004bN-Ic
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 07:39:48 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81c48e62-5f0c-11ec-9e60-abaf8a552007;
 Fri, 17 Dec 2021 08:39:46 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2057.outbound.protection.outlook.com [104.47.2.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-nA_pG-tcPO6tmjM2807BdA-1; Fri, 17 Dec 2021 08:39:45 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6301.eurprd04.prod.outlook.com (2603:10a6:803:f1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Fri, 17 Dec
 2021 07:39:43 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4801.016; Fri, 17 Dec 2021
 07:39:43 +0000
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
X-Inumbo-ID: 81c48e62-5f0c-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639726786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZdQgE6pD11VLa2w58nTAWrowaNXWfX2MqQAbRI165VI=;
	b=eqam6ZotYmRHcQPsnGRixB9vr1aR1JlWn/9UtCUgzq2Xzl9QYykkmTL+KwV+mshmBgIgLC
	9rgKR8JcSJ4m5MZESfVB8+vEjeVZ3hrWXx9lgXXj3tfL4ltcAGGxxSmrnCnWcdDwIHqBQI
	7mGjtuicJVLIb4zsrybCnc/K/TxDAZY=
X-MC-Unique: nA_pG-tcPO6tmjM2807BdA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EpoP1nSWVwo/z8WqXtRQsdYuHb/7a600GCmDGo1qGOrrHvIdxr1dJt+RHFopG2u1fKurJ9Gcz75CMMDcmzyglyaTOuIZT/lUXerv3j0nz2vinPiuyqS6/3nI655rbVIh+OChJXLeslI2crVRcS4k9lQnFt6ROl+zWQlFfFeq9ycspDmgM3xbupvYjYSlq3i9+0H6SBtMyIhD4T80Kpl3lL+wGkdePOlcjLEJkM2EiOZtEb5I270LbGnUI6WQQLfn1VWVX0qge2j1EenmXAB/AAC3pMtY8hkYdKpX1LuWYT/GkgkJnzrT9yS/5L8SAmDEcrwGYWrxpafkfRaWnxGoNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZdQgE6pD11VLa2w58nTAWrowaNXWfX2MqQAbRI165VI=;
 b=BDW8tX24o9RgPgn7NYtODW6ELJXG0zageDtaeabKIl9IvTAh/qIud1aNpBrr2OMsqwgG5pjXsWMLGNzOPeBNGdNqr46wiWiG0ZADvAsdhs7x+c3EuGz43Mr46u3wdoRPcya+Arw5yd9w2WC1IQlfX+ID+DVmCT6ZcjFjM/tt/xPa/RXnHAYCQX19bzrOeBwMFvxYs/VYMPD9i19q0x5zTE1+vda9DnmaJrnwuquKoGSmwHKfbBmV2lSH/+Fe3MuCe3EidXONHbW7eor35RZxVXCadRyVB7erLMb/btdKkDSy5FmHhva92pTC8dVfnIbL8YI2Fi4+5z+q7j664fnWmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1a23f21d-57e3-9f9f-6447-82731f7c0b22@suse.com>
Date: Fri, 17 Dec 2021 08:39:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 02/13] xen: harmonize return types of hypercall
 handlers
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>
References: <20211208155606.20029-1-jgross@suse.com>
 <20211208155606.20029-3-jgross@suse.com>
 <7dd419c1-9ad0-798e-317b-71c8e613ff3e@xen.org>
 <4e9947b6-08b4-4ac6-9cfe-538c3b34175e@suse.com>
 <alpine.DEB.2.22.394.2112151757410.3376@ubuntu-linux-20-04-desktop>
 <c650062f-948e-569d-d4fa-e5333867854e@suse.com>
 <alpine.DEB.2.22.394.2112161232310.3376@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2112161246180.3376@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2112161246180.3376@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53ed3f08-c87a-4ff8-8967-08d9c1306417
X-MS-TrafficTypeDiagnostic: VI1PR04MB6301:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB63019CB62B8D0EF5BF4156C4B3789@VI1PR04MB6301.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bc890s+l0I7KS2WTtyF36yxT2iRGX1eg4U7+hWh9eYU0tDhSkiTwW0rl6H1N+1LzGnX/Rc98F4R8oiDNh/WKW9NvnyuEpohiogVM8LIbDndtRJj16DKdmg2VM0kec9WgRve0qXDyE1JwI89IE8e79/rqVWNbiZboIcio/zz8CWVGqxiBfGXm6IFQkoKushkP6L73TcJZu6Xa/3Daj63YBnnGkAu40gDqw0l2Zvv0vQxOCHzF6HNoP+7v7+VGJuC9eBEUzGCAGwgIaqb+Q+iyg+FEV7joCWcBvNgoJuqBXxHDV+E5B7jT8676+yWOihkFEw37UqFzotUjVCXTcXqmXzBADsEm02VWm2rQGFp4IRFicPPKYXa7G0d/T77QAFXDuqOnNCEyWEXh8ohpVF/2QsskKqBhWhuqerTx2um354iGYxqdefjW42Pa1uEO9sONYxKk77BwPxzKCpqkC7GWjh558xMsjx2qmyawKg2IGaxLkbOcvOltPiOJ78wPQi1uLn0zunwqvoYr4YIxdd7N4iV+BTd6LeKWtkkESE/XlX4ikqpFY7tckLBkA9+BiUwiOcRWVoSnOy4q97dTLiMBW+qFXq8n3xaSYH0sus7uAIwYtFfMv7L6RCxz7m2/5/hX82KBSOZknp4pirhgU9h8/RcF+1vLZdbElNIUKiw+wjMKaH07AeNMFqJM/KXp6Gsoh3f1T7DnRT16E9+lg1+TPuNG4o8e902TK3NMkD8xadl+lqx5mh13bH0ys5gUaahD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(2616005)(5660300002)(6486002)(66476007)(66556008)(66946007)(26005)(8676002)(6916009)(54906003)(4326008)(508600001)(8936002)(7416002)(2906002)(53546011)(316002)(6506007)(31696002)(186003)(36756003)(6512007)(83380400001)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MU4zcjJ5d2dDeE1RdGQwSFZrYkR4RDExNGlUSHpHRzY3WUcxV0lIRkRCVVJW?=
 =?utf-8?B?Wk5jbDVOODNhcUlWMUg1YmNTYnN0N0tJWlQ1d1NmdUNyTG9ESjZ2SCtja3h3?=
 =?utf-8?B?dEUvYmxIUTNDYzB5TUk1b2N5V1o0bGkzNFZoSnAzQm5Cd0ZwcTdEMFBLK014?=
 =?utf-8?B?N1hDUEZUZTc3MlQ4Z3FNRDdpNXBLamlseGdFbkNuMGt5bEJYbkp2M28wY3hO?=
 =?utf-8?B?SzgzRXo0Yzhrb3dwY0xHeHNqdmNqN0FJT3diN1RGMTF4SjdHK0o0dE5BRDg2?=
 =?utf-8?B?bE9LVkZlYTdya0xSL2k4d3BIaks4cGJrWmt4UThmUm5sdDJSN2hWQWl1Qy9G?=
 =?utf-8?B?eTkwNFdrRkVmbmIyWjljbHd2WnVkWlcxcEtyZWhXS282R2pFOHljNXJHaktT?=
 =?utf-8?B?NEhRMnkzTWJZUC9LN2hiMnNKU3h2cjNOWlFpdFAvalA4MVp2Vm1DaEVXQlFQ?=
 =?utf-8?B?OGNYU1d0b0ZDa2pTeU5oazM3eFJzWGJsbFNKRjI1OVJUNDVZckJUV2wraXF3?=
 =?utf-8?B?VjVrU2twK0wrTm9BeGNZNHFGSHRvay9ySHplcFFOWWprWHppYVIxeVFsbFFJ?=
 =?utf-8?B?dzJOb1lrRk01bEhqYkN2YUlkK3BTcWVxZXkxcGhObkR4Z045VnZQSGlsaVh0?=
 =?utf-8?B?S2pUSHhkeUtOcjQ2S09RNWhLMm4zVExWMlFmbzZMcjFXZ0xIYzg1VTlCVS9r?=
 =?utf-8?B?WXdXaENnUE5WVk1jWDhDRjdwY2sxT0M1a2dqNTh4c1BVWmNUTXVndWFraVlw?=
 =?utf-8?B?U05SRWFMdGdTZThqZUR3aUU5R1VNS1BvMXlCb3kyK29Rb252TEdHTmFlWnQ4?=
 =?utf-8?B?b3ZDU0VYenpqRWdPeFp5ckZxVVZTbjBVN3hkbW1yV3ZES3krUjdaZ1ZpU3k0?=
 =?utf-8?B?QTh6TEpUcDIyOEJwNnRiUlBmWHVTOVlXT25JUWRJb3A0c0VqVE9rR0dYTGZY?=
 =?utf-8?B?ekZrSzhadTlDdEkwcDBPZ0FLTTl6SmIrVy95eUJiOWUyTHQwK3NkZUJGNldB?=
 =?utf-8?B?RGUxdjVNOHFGUTBCV1JTMzQyNW5MTENlRlo4bW5VamRKSmtvd1Zyc1RKWWVW?=
 =?utf-8?B?UVdsVkU3ekY2K1plbHF2djBqVTdCUXBaVWJPZldqb2FSWVAzYnhDU2s2bmQ3?=
 =?utf-8?B?SDlPVU5TNGhOd1VLZE1uUHBVMUt1dGZLWXR4dVUxb2tzNysyd2RBb1VQZVV3?=
 =?utf-8?B?OERudVdYTFAxcVpBcHlicE82SEFSM3Y4M1ZSNmxqd08zWkpteHVlZDJ1SHJX?=
 =?utf-8?B?dHloeHBkeGljbG93cU40SlZhak9NWmRoZmNWL21CcTFLTjdxOEk4ZGNldnFP?=
 =?utf-8?B?ZFNUM05peTB3Sk5Ub2JlRnViUERiajlRK2tyRnF2VVkvWVk2Y3BRdFZ3RXFr?=
 =?utf-8?B?Z0NDTEpqbGtzYTFKMFlWN3czSmF3QWRtbFdKV0hHOXBDK3hNdFRITjQ2ditT?=
 =?utf-8?B?YXJSVVVDUzkxSkVKR0FaZEg1cUZQSThQRCs1cllUZk5NOVlDUE1MRng1eFRD?=
 =?utf-8?B?Y3pDbkdjOEZFT1V4VXVtMHFHYnVObFlCNWJlQ1VlLzEzeUpSWnJrTS9HVjlI?=
 =?utf-8?B?ZUd6U2EzTGd4NS90b0NnRDgxRkRPckhDQ1lQdmxqWGllSlBGSEUvK1k1R2lX?=
 =?utf-8?B?UFEvTHAzNHVEdVY4L3JCMWhJdmorUkM4dzgvTzRKc0lKYUNGL2dwUXZJY0FK?=
 =?utf-8?B?Q2MyWHpoanUrRWUrQ3E5bjBhMG9XMlQ5Z2MyYVNSWjdpWTA1WkZoTnRXV0Iz?=
 =?utf-8?B?eXBCR09wbld4MXFjNm4zNFNBLzVnaStCYmtKNnl4bWVQRi9TTlc4L2txRis0?=
 =?utf-8?B?TTVzbXNpaU02b1QxL2ZoWHJSb2J2VnQ1NE5PWVhQWFl1UjJpekdkSUJ6cFc2?=
 =?utf-8?B?YnYxczRtZG9BTzdIelY1UFBsUUtQVUhVZlg0ZnlGVUFYNm92S25HeU0vN1NB?=
 =?utf-8?B?WitKOGhFZjE1RTN6eWxqMWk5ZUhVL0ZZdTdKb2svaFVySHFXUDhHV2Y0ZVVN?=
 =?utf-8?B?NmttR0p1UWNoc2xLdDREUjFsL3U3Zks5N2FkZHNtMHd0aVJuK0dacDJDZmpm?=
 =?utf-8?B?cjV5S0U3TXdZMFVFTnVPd0NXeGtlQ2NxZlZIREQ3RjRTOERpdEI5M0R0TkV4?=
 =?utf-8?B?YUxDZVJPTk85NTJPMGJlYm5JajQzUFh0cDkxU0VCOC93U2hDV3lHNnY4Mkgv?=
 =?utf-8?Q?empnn1p4silIhaYy+dAUf3k=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53ed3f08-c87a-4ff8-8967-08d9c1306417
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2021 07:39:43.2560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x90NWk8orPEDcX81oJDSJEhUI8fnUOIiSF+FfQS1HuLNvyvYA22TBMUqvRUa3tkbx7M5l903LXNyhxfO1NVcNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6301

On 16.12.2021 22:15, Stefano Stabellini wrote:
> On Thu, 16 Dec 2021, Stefano Stabellini wrote:
>> On Thu, 16 Dec 2021, Juergen Gross wrote:
>>> On 16.12.21 03:10, Stefano Stabellini wrote:
>>>> On Wed, 15 Dec 2021, Juergen Gross wrote:
>>>>> On 14.12.21 18:36, Julien Grall wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On 08/12/2021 15:55, Juergen Gross wrote:
>>>>>>> Today most hypercall handlers have a return type of long, while the
>>>>>>> compat ones return an int. There are a few exceptions from that rule,
>>>>>>> however.
>>>>>>
>>>>>> So on Arm64, I don't think you can make use of the full 64-bit because a
>>>>>> 32-bit domain would not be able to see the top 32-bit.
>>>>>>
>>>>>> In fact, this could potentially cause us some trouble (see [1]) in Xen.
>>>>>> So it feels like the hypercalls should always return a 32-bit signed
>>>>>> value
>>>>>> on Arm.
>>>>>
>>>>> This would break hypercalls like XENMEM_maximum_ram_page which are able
>>>>> to return larger values, right?
>>>>>
>>>>>> The other advantage is it would be clear that the top 32-bit are not
>>>>>> usuable. Stefano, what do you think?
>>>>>
>>>>> Wouldn't it make more sense to check the return value to be a sign
>>>>> extended 32-bit value for 32-bit guests in do_trap_hypercall() instead?
>>>>>
>>>>> The question is what to return if this is not the case. -EDOM?
>>>>
>>>>
>>>> I can see where Julien is coming from: we have been trying to keep the
>>>> arm32 and arm64 ABIs identical since the beginning of the project. So,
>>>> like Julien, my preference would be to always return 32-bit on ARM, both
>>>> aarch32 and aarch64. It would make things simple.
>>>>
>>>> The case of XENMEM_maximum_ram_page is interesting but it is not a
>>>> problem in reality because the max physical address size is only 40-bit
>>>> for aarch32 guests, so 32-bit are always enough to return the highest
>>>> page in memory for 32-bit guests.
>>>
>>> You are aware that this isn't the guest's max page, but the host's?
> 
> I can see now that you meant to say that, no matter what is the max
> pseudo-physical address supported by the VM, XENMEM_maximum_ram_page is
> supposed to return the max memory page, which could go above the
> addressibility limit of the VM.
> 
> So XENMEM_maximum_ram_page should potentially be able to return (1<<44)
> even when called by an aarch32 VM, with max IPA 40-bit.
> 
> I would imagine it could be useful if dom0 is 32-bit but domUs are
> 64-bit on a 64-bit hypervisor (which I think it would be a very rare
> configuration on ARM.)
> 
> Then it looks like XENMEM_maximum_ram_page needs to be able to return a
> value > 32-bit when called by a 32-bit guest.
> 
> The hypercall ABI follows the ARM C calling convention, so a 64-bit
> value should be returned using r0 and r1. But looking at
> xen/arch/arm/traps.c:do_trap_hypercall, it doesn't seem it ever sets r1
> today. Only r0 is set, so effectively we only support 32-bit return
> values on aarch32 and for aarch32 guests.
> 
> In other words, today all hypercalls on ARM return 64-bit to 64-bit
> guests and 32-bit to 32-bit guests. Which in the case of memory_op is
> "technically" the correct thing to do because it matches the C
> declaration in xen/include/xen/hypercall.h:
> 
> extern long
> do_memory_op(
>     unsigned long cmd,
>     XEN_GUEST_HANDLE_PARAM(void) arg);
> 
> So...  I guess the conclusion is that on ARM do_memory_op should return
> "long" although it is not actually enough for a correct implementation
> of XENMEM_maximum_ram_page for aarch32 guests ?

For 32-bit guests the value needs to be saturated and allocations be
restricted to the "visible" part of physical address space. Just like
we do on x86. Except of course for Arm the question is in how far
knowledge of the largest physical address in the system is actually
relevant to guests (i.e. like for HVM on x86): This isn't transparent
only for PV, or at least it better would be restricted to PV.

Jan


