Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D674D7C15
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 08:37:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289990.491834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTfG9-0005pu-J4; Mon, 14 Mar 2022 07:36:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289990.491834; Mon, 14 Mar 2022 07:36:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTfG9-0005kl-FN; Mon, 14 Mar 2022 07:36:53 +0000
Received: by outflank-mailman (input) for mailman id 289990;
 Mon, 14 Mar 2022 07:36:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=29fN=TZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nTfCf-00056d-88
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 07:33:17 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02f66b30-a369-11ec-8eba-a37418f5ba1a;
 Mon, 14 Mar 2022 08:33:16 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2051.outbound.protection.outlook.com [104.47.8.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-RxVZ-D7QPsOK1Koy0nd3Ng-1; Mon, 14 Mar 2022 08:33:14 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB7PR04MB5148.eurprd04.prod.outlook.com (2603:10a6:10:14::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.28; Mon, 14 Mar
 2022 07:33:11 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0%6]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 07:33:11 +0000
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
X-Inumbo-ID: 02f66b30-a369-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647243195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nk3/gBSQM3XFj4SLDCHDdprdUbPzYyz1f+yxqCkw2Yo=;
	b=HHdJT0PMU+PEPqCnoVjOHFKd5GrVRUpc4UssqAQrQ8a8cDtuaBLowmyvTz8c3CzxnE6iiq
	Wxr0HjsX7ojleTArVQkDA1h4hYJAGJk2n66jjl51Kt2QiRsnnE+vyqGmFaX8koZCWV2NQE
	IDZx5B4Og5wY+dprogBxUMUwHUFdP1M=
X-MC-Unique: RxVZ-D7QPsOK1Koy0nd3Ng-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D8pRRxauO98wpPMx4jiz3yqnl6lFj/6F9ROf1H9DKsGxWBLR0gMP6HS8oARxcyfTSNYK2cIHJ+U1K0HUh2gr/IZodNV/zKTnGlPEgz1nCi3B2ZciIZKClNqsuyyGmgr1atWwYyc0MfjSx2OcvaCtnYwE57EdbF+g3qAW8q00+TtiBwbJg1PcElNXHPaiTljccQYl3wzxbgoBtRzcMRmkSrTfE8A+zan5l2Iwlit+2ahyJWXVS86I7syd9fTWUsOaNlECZWPyx5bygQ5Xil/W50kv9bMDmijiXmZYq9dkMTyflT2BnGhqPZporYuF5nyLl7DLbTTvIf6ii9PI1xx5Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nk3/gBSQM3XFj4SLDCHDdprdUbPzYyz1f+yxqCkw2Yo=;
 b=DxzVNd7+fMcQAv5d7Pvw6wv64aNl8k/sa4dKlzEfg2dlgxDVtlPF1rJ96Scx1GHEbYD8EsiiPuO5MvpJWD1B5etgZnps2gBqMOE3Os6fGUbf0/neuoJpPrz84Vb97nG3MpnpEYtNZqNzErSZMW1LGzr8E+z5YlDAhiixuU09vG6E2eQ21j5BwaFnnRFlxCSZerwI2E4bkH8v0tU+pWi5TrNbjfVHS45s5j9hvovOLoWq/N+m2vqkU2mW9FZNpHp1tobcbTZXP7jb7AOvjhmpDzc8qANNbYi8r7D6xkaIS1d5lwvUsD19hrmtiluNizP3d7FTKxmgE2Gmw9Jcb8R0tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ca2ad24a-0703-de6c-81a5-e01615f93d21@suse.com>
Date: Mon, 14 Mar 2022 08:33:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 20/23] VT-d: free all-empty page tables
Content-Language: en-US
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: "Cooper, Andrew" <andrew.cooper3@citrix.com>, Paul Durrant
 <paul@xen.org>, =?UTF-8?Q?Pau_Monn=c3=a9=2c_Roger?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
 <807a48fe-3829-d976-75dc-1767d32fb0f4@suse.com>
 <BN9PR11MB527622E58C2E4EF90CF29EF88C379@BN9PR11MB5276.namprd11.prod.outlook.com>
 <9432990c-6de4-ad12-e9fa-12792200748a@suse.com>
 <BN9PR11MB5276930B2AFE79C4961E66548C0F9@BN9PR11MB5276.namprd11.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <BN9PR11MB5276930B2AFE79C4961E66548C0F9@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR04CA0011.eurprd04.prod.outlook.com
 (2603:10a6:206:1::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 600f9635-43eb-434a-3c37-08da058ce4a9
X-MS-TrafficTypeDiagnostic: DB7PR04MB5148:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB51480E193FF8ADA997ACB57BB30F9@DB7PR04MB5148.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2AJv5gIdM0W7X2PdU5VqNnLGSFWhzKmvr2481b0mn0JVhJICwoUZvMvM70V1Pa29eU3NJdvl/S9b53eWZwBMHIIjt8Nc2Lq9dtU7EEzhuHGLb3/zLr8/kD0ZEZnLTPuvdPRnPpqDnfSq2D2Q4a3/ze5G4vIPVJFx9TDoSfyFecOVG4RgVdR81Uq1RX9/HIT7uln2lOyPxxzRx+dksdy+8TQdsvz+AJDdSsjHsZzVo3FCEiS6yRb1YAqPkrU5TiA6ys2vBAZUOSY7/XvQ432+DtdiT3hJiS0Y0TU4wMSS0HHtS5K105iSSBzSjJQLtybRdoRIwYR1UAEWn629wWWGftouw2vHnn0HYFhD1xOjxuZD7otM1mZ5V6CJuCcYmT25h+8+qBfvK9nOYJzDRivtaK4VJnSRjPZtBBW5kKclkfiqCkHaAmCI4I6191AgvvBlBtP17AKTp5Po6DDtQf9eFODpqpFqunS6bBdNVvoAJfco3JEAwhXo7aPOgokjKD9kJTcIxOVry4pueOWK9Rx7KkckN3g1JicyIdLnyj7Tn4zutvxOSUK5bs5fSBBjPAHaK3o3BDi3jbSG23ENlbq99+Yiurh53Jhxxi2/X1sbvXRm9VCrlYJ4pFmvq6/qcw14B852bnI5GwFYHICRytR8IUOtygDc6FTplpAMqq35aLvc5H34wnw1wWsWHtJEPW9UizsSXLV7kLTpDAWvTsfqDJuim4kljbc5fe4alOjO11w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(53546011)(66946007)(83380400001)(31686004)(86362001)(31696002)(6486002)(38100700002)(186003)(2906002)(2616005)(36756003)(66556008)(66476007)(26005)(54906003)(316002)(5660300002)(8676002)(4326008)(6916009)(8936002)(6512007)(6506007)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TU5lRmtFZGZlVmcrMjJnZFNqTU9qZ1I3eTAxTlQ2ODU2TGhUY2hkYWJJWFdS?=
 =?utf-8?B?aTJUMDkwRkRqWStGbCt2UjFPYnptZlhNcExNaXFVV1NrZFVTaFdXaUdVUXdB?=
 =?utf-8?B?SGtvYkxOeDdmeHRiM21ndnR6RWVBbzRGdG8zakhMYjVidk1ZN3ljM3JyZ1k1?=
 =?utf-8?B?LzRSMHNxMDlWb2dodnBsV05XQ2JVVDR6QmtKL3RlL2hpMy8yWDROWXMxbVo5?=
 =?utf-8?B?cERVdEl3cmNIekR0VTdpQWZqTFRQRTMwTmdsdWFDVU05T0RBSlhkc1VKWlVv?=
 =?utf-8?B?YUNYTWkwejVDYVp1ZXNSS3l6a2Vnalc4ZHU5ZFd0RzdNR0tBR3d2WmI4Vk40?=
 =?utf-8?B?aTM4aXBOK3o3R1ZRSE5xdWttUUVLWmVJRHNtbFhPN00zQ3lnUGJ3RFhhdlJ5?=
 =?utf-8?B?SnlTSzVMYjNhVFUwanlsSjVraVpkcit0M1JWSEQzZGZUZ2RnMWs2VmVZNFVw?=
 =?utf-8?B?TktxaG8zUmk4dFVjNWhrdTM4ZnZQY1IyclFzVFhsZ0d0NTVCZWFXdy9hRTR0?=
 =?utf-8?B?UnBIcTdBZ2RXUVdQS1ozWUlPRGFMY0gzN0VTcUQwVzByZDZhTkd6NTdxRUEy?=
 =?utf-8?B?eGpndDlKRDZWUHBaR3U5amVYVEVzcVRjV0cvb2UwNDRmT3BVQi9iK1U2WVpz?=
 =?utf-8?B?Nko2bndXM1I4ekpNbHkybnBxb25CL1dObDIwZ2lPZkUzOWw4YUhIbjFrNTBa?=
 =?utf-8?B?YWJXbkNhbmJoaDMzMSt0T2lHU1Yzd3JaOHZRY1J3UkU5RE1KVHRCWDRGUzNP?=
 =?utf-8?B?UmlLN25scVZhODNud2xnbnUraGFTS2s0RW9ER0djVlZ1UFpYM2hjRGEyY2hH?=
 =?utf-8?B?Wk1PRmxONzdhVjB3czlHb2pISnBpSGNYVERjWUF2ekl1Z1dwektDcVpXUVZB?=
 =?utf-8?B?TVdxVTY0V2dibVJFMlJ4NGIzbGZwVzYzZlp6Y2hIR1dQUFJMejBUR2RKTTIr?=
 =?utf-8?B?M2UxS1BvdEE4TGlEWXdFekVxWjJMbUsxYXc2NCtVZ0ppTGtIM0ZOVjI2NGht?=
 =?utf-8?B?RkYxSENQZW5lYjEwWkNFTFowajVZRzdRams0U1ZVTlZST0tKbjJmZVF1OGlK?=
 =?utf-8?B?dW5wMnVXQ3E1R1pBTlZuVjhqUG9SS2pwcVpmRDNKT0k2WHZyZ3FDWVcyNjVY?=
 =?utf-8?B?QTJoOHh5b3pGZHJhUFJuc0tyRlAxcmVTQVdQOGNvbGlVaC9aQ21OTTdEa1Q0?=
 =?utf-8?B?MmFvbU94RGx1bVZ2M1RGUThMcHQwYm9Rdm1vL3BnbmtOQ0dSenlHTm94c1pt?=
 =?utf-8?B?cjlsMHYyNXcyVVlnS1hSQXQxZXEvUUJQaVNBcEVoUHFJMlVDMEJ0TmRRZHhl?=
 =?utf-8?B?YVlUWll3Z3NhVS9ib0Y5d05YMGpLeFI2VHNNSWp3S3pZUUNwcWQ0NXRScFB2?=
 =?utf-8?B?ZXYwcGpNSGNZZEdIOVZxa3k0TjZQOWsvOGhBaFdrVDdXS3ZPbzlyMHAxOWlt?=
 =?utf-8?B?SDEvNmJZUkRRUEhtMjBTY1VsRmdkVmFmSmtkTGkvdUN6TGloMExzejluQTYy?=
 =?utf-8?B?ek5vTCtCczY1RFpZdVVQcDZNa20xM0h2WUFrYmc4TFZyUWpob3JwVlZrMGtN?=
 =?utf-8?B?RC85WWRRV3BxN0VkRHVzc2laaUZRajJGdzVXVEM1cGorTTVMWktqQXZ1bmdG?=
 =?utf-8?B?Z1BxTEt1S1JidThVY0U3YTg1V3JOUWNENVF6YlBOOFVqSkQ3ajN1OWxHRVph?=
 =?utf-8?B?MUpSVnpyVlhXdDgzb3dHeG1rSnNLQnpFR2ZGRDhzdDd4Z1JZWEs3WS9iU1FC?=
 =?utf-8?B?Y3grcUp0cUxManpyN0Y0Z3hIbHZoaDhqa1hNaW9XVUtZVW9oSjUzQlZCTDdh?=
 =?utf-8?B?cGFXdFFuenM5ck5JaVpmbU1EUkJMcVY0NVFQZHJtNjF4WTc1SnpBL3BMMGNl?=
 =?utf-8?B?SjdYMUMyaFhNWnAvSlBYUmp6VlQ1OThtN2VBVDRHSE1Fcmh6TmRyckM5cnRi?=
 =?utf-8?Q?cFwPDsNvQLq5yLmeE77uZK9CxEx8UuP+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 600f9635-43eb-434a-3c37-08da058ce4a9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2022 07:33:11.7452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kFD2rpYmCLvBWTdBjjp3CaTvoFFoWRya4XcJw/Ebnb3tFWXUhaa21Af0CYF7/26mqHquAPJiANYtFEKNIlPEsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5148

On 14.03.2022 05:01, Tian, Kevin wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Friday, February 18, 2022 4:31 PM
>>
>> On 18.02.2022 06:20, Tian, Kevin wrote:
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: Tuesday, January 11, 2022 12:36 AM
>>>>
>>>> When a page table ends up with no present entries left, it can be
>>>> replaced by a non-present entry at the next higher level. The page table
>>>> itself can then be scheduled for freeing.
>>>>
>>>> Note that while its output isn't used there yet,
>>>> pt_update_contig_markers() right away needs to be called in all places
>>>> where entries get updated, not just the one where entries get cleared.
>>>>
>>>> Note further that while pt_update_contig_markers() updates perhaps
>>>> several PTEs within the table, since these are changes to "avail" bits
>>>> only I do not think that cache flushing would be needed afterwards. Such
>>>> cache flushing (of entire pages, unless adding yet more logic to me more
>>>> selective) would be quite noticable performance-wise (very prominent
>>>> during Dom0 boot).
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> v3: Properly bound loop. Re-base over changes earlier in the series.
>>>> v2: New.
>>>> ---
>>>> The hang during boot on my Latitude E6410 (see the respective code
>>>> comment) was pretty close after iommu_enable_translation(). No errors,
>>>> no watchdog would kick in, just sometimes the first few pixel lines of
>>>> the next log message's (XEN) prefix would have made it out to the screen
>>>> (and there's no serial there). It's been a lot of experimenting until I
>>>> figured the workaround (which I consider ugly, but halfway acceptable).
>>>> I've been trying hard to make sure the workaround wouldn't be masking a
>>>> real issue, yet I'm still wary of it possibly doing so ... My best guess
>>>> at this point is that on these old IOMMUs the ignored bits 52...61
>>>> aren't really ignored for present entries, but also aren't "reserved"
>>>> enough to trigger faults. This guess is from having tried to set other
>>>
>>> Is this machine able to capture any VT-d faults before?
>>
>> Not sure what you mean here. I don't think I can trigger any I/O at this
>> point in time, and hence I also couldn't try to trigger a fault. But if
>> the question is whether fault reporting at this time actually works,
>> then yes, I think so: This is during Dom0 construction, i.e. late enough
>> for fault reporting to be fully set up and enabled.
>>
> 
> My point was that with your guess that the ignored bits are not
> ignored some VT-d faults should be triggered. If the reason why
> you cannot observe such faults is because they happened too
> early so no much can be shown on the screen then trying to
> setting those bits at much later point might get more shown to
> verify your guess. 

Pretty clearly there aren't any faults. And in fact my suspicion is
that the bits are used for addressing memory, and then the memory
access hangs (doesn't complete).

> btw any progress since last post? How urgent do you want this
> feature in (compared to the issue that it may paper over)? 

Well, one way or another the issue needs to be dealt with for this
series to eventually go in. To be honest I hadn't expected that it
would still be pending ...

Jan


