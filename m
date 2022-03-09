Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5C24D3512
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 18:04:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288011.488411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRzjY-0007ct-8u; Wed, 09 Mar 2022 17:04:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288011.488411; Wed, 09 Mar 2022 17:04:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRzjY-0007Zk-5R; Wed, 09 Mar 2022 17:04:20 +0000
Received: by outflank-mailman (input) for mailman id 288011;
 Wed, 09 Mar 2022 17:04:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gSYI=TU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRzjX-0007Yv-9Y
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 17:04:19 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f480ad4a-9fca-11ec-8eba-a37418f5ba1a;
 Wed, 09 Mar 2022 18:04:17 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2177.outbound.protection.outlook.com [104.47.17.177]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-xBkeaHlxMjSpi36_3I-hhg-1; Wed, 09 Mar 2022 18:04:16 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PA4PR04MB7758.eurprd04.prod.outlook.com (2603:10a6:102:c4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Wed, 9 Mar
 2022 17:04:15 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 17:04:15 +0000
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
X-Inumbo-ID: f480ad4a-9fca-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646845457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kYEftJiIGj6yfDAAPjoszK5aTkRZa/QpMF4edRziIB8=;
	b=kAZGNE48t9JVQ9T6P7woJaztlwOMl16PidfN9mcyTLFM0i3zkb1MHjU4Sr46r12kRH+361
	KW6FWDcjEOrOv9Bk3SebLMitMoNr4iz8N/Qq7jyA7mV8TkjiamUHiEfOCbfAZGx+wFusVy
	i9ueV++Tk7j0ouX7nUqoktFjTW3Oaqc=
X-MC-Unique: xBkeaHlxMjSpi36_3I-hhg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ADNptanbCyeEuuJdq5tXYbZGwgEbcPgaigxyluGf5RtvFkBzaD8BOfkF9hor0NH/NMY3ALwKvdkV+YYfHcx+1i+Hh1vhJiLvMk6Hya05n2JO0QQpH+fnOrzuhGmleYoNsoBT3yhVnlrKx2KnTCxai0yAj1JmF3qsyJ7nRcZiHJFCnqygfQ/Vvn7LNRgFO3HaA8vMbT1HdYZGLEX/mKD1b/MHbfBxNyCKsOhqmngmIQIV5edf3r8wlz/9K4wW24qk4P4SH45fczzw8t94ewvjWaS2j12PDw3hbThEmC2XUgA672X+p0+pTva4Lnf2TRBxNDM1jb30WF/Mt7dZTRTO2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AKdSvgH0ZDjtJ82QEizepRe+KX43zcsKwVMkl7A8GSM=;
 b=dBeHRf5+aSs8MYLRoxZ3A7ig1XSiIS6lRYhRZKbqfh7vsFjoMVCxnEjcE1EbVoM1gf5RlkNLrUgWebxYxivUJJYOFjSZLb0NE7mvnEKoNFJTfzjTO+yvDVfFBBFlh8sRLgWcYbCkdJVcAfRST1g9V86nCvcMYAEFBUkY7/S+x8acEbspeQbLVGPbR8ytWtv4RxaxVONujb1wqzvfVlFJC5N6nhmtNtyqWVhuVcaTcs3J5DwfZSqUUXtb3FY90yoLmnosU62ef5KdGqY0NmSPKrxXP/S5SlpOAupTEThgvx1mY8geVdQPPtsdNBHyJRXZi4LOFN3h8O8kJBeZXJzoyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a1ed8c2e-2ddb-3df8-daad-39676c1ade07@suse.com>
Date: Wed, 9 Mar 2022 18:04:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 1/3] amd/msr: implement VIRT_SPEC_CTRL for HVM guests on
 top of SPEC_CTRL
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220201164651.6369-1-roger.pau@citrix.com>
 <20220201164651.6369-2-roger.pau@citrix.com>
 <8e7f3193-dee6-1ff4-0c68-081032e240d2@suse.com>
 <YijBpyOlmTA7tIUl@Air-de-Roger>
 <6d0d901c-fc7c-2655-6285-df07101b852d@suse.com>
 <YijWUj3H+8UHEikf@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YijWUj3H+8UHEikf@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0238.eurprd06.prod.outlook.com
 (2603:10a6:20b:45e::8) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32f08a06-9f7c-431c-325f-08da01eed710
X-MS-TrafficTypeDiagnostic: PA4PR04MB7758:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR04MB7758D22A07952EA1169781E0B30A9@PA4PR04MB7758.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Rl2FB37+DJrWElCq90rppt5Fj/q8eZBKLB1HDU2o1mnQYLsZjVR/vNeC3ICkPPOy5piAopCaADtBASejuwor8p/JfJzOrXKDIP9udW9AlWvjsg+bR7mWvcfC0nISZV2wjxnnJ7Eq7cT/wfg2wjJv/RSVYX+YVVTdhnQRAlGLTy3nP3Nm6atSx5n5GImblgL3FOMhRaZNETwSRg0YcVj5sTBW0DQE97gnZiPEG6g6/tuaJh+M7UIMD4+LB3Kcl/QFv2TGz8lDgo44jrpQ+g9f74qUmdz0F86lpb1R6vlY/gFWbjBLFLckb2GX74+oPV9l01CAceUpPDDXuwhI8GOG8XGePfbWysYHRRcrizlwE7rBcjpIUQng7+QAWU43l2+bUeI9S2tDcIwa+N2g0L+p0uVRaE5/HaQpzzHwxsoq1tDPG49KeDO8T9iIdeKQJ+pe6z86nC20w02UQNXacIHoJHllTZgR/cRwf9h4ZAXJmtmQsVO1n7BWIiDUdX3KHw73haFOiBn4e5S5qIM3rCH4QNCMPeu11fYv100cf8qV2V/HYx/Zq6hmyRqxzJJh8GTAKqQmTO0/OIq+0PMDbputbJIN+JuM3htr1eQex3PDoIg0sLG9i/S8L3VJugmyaVpr0GZoc53kXEnNoD2ZxHCkCHFb9ElrfSAW1PAuHV/Wg1LrjOVtmf9Wul9bb2O5eX6y9ub048lrh+igTNUAd0DT0gl2lF2gAA3cD8nMO+LEjEUjHvw9Oycx/yMg4qXrCt3P
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(186003)(6506007)(6512007)(53546011)(6916009)(2616005)(6486002)(508600001)(31696002)(83380400001)(36756003)(86362001)(6666004)(31686004)(66556008)(66476007)(66946007)(4326008)(8676002)(5660300002)(2906002)(8936002)(38100700002)(54906003)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gHRwfUYvSyjGZgTwVsxIg5VmwGICK0mW/sZGqGQXFRLmXk8bZnxWfbzxtfBD?=
 =?us-ascii?Q?OMCRlE8hZxkOyulhWyHkiARlfJNGUZtzVbaaCS9gYia1j6ezL5uit6RanReU?=
 =?us-ascii?Q?7xZTbuI9Y+ypRDFyUlukiPqmPVAlOrl8xD5+e7EbqWHNTlTy0dY5Fo4F8Lff?=
 =?us-ascii?Q?FAPUcPYJFx2L/qwa+8LJbIpkzsE3zP+Vv45O/o8hC9+MuRZVRN0t1dya4x9M?=
 =?us-ascii?Q?sFoeMC3Mvz2xOlz5TP0sey7u0kKUML2xGGs4gskCVT9eZd34DsPAxwo6+7WC?=
 =?us-ascii?Q?kGEi7L9mkqw7wm5eX84n13+XKJxezjHk2IIS8c/vxFSW4v0N5YcM940mXMWF?=
 =?us-ascii?Q?zL0C22cfPJYWz5YnzD86selZdrbkFvb0+7yOdVWTMQey9P2e7XJr/9NiKE8O?=
 =?us-ascii?Q?ocetyZl5DdSYc4bR+MpWCifGKz44CwJhstDTBcx/bbxA8lQjypmOJjOa1/ob?=
 =?us-ascii?Q?+tmhsGg528c0zRUTnxQpy0Nl/qiSTQjN1sks9mOSa8qt1P4oYAwIaANsD1fy?=
 =?us-ascii?Q?gY0Zg3XUzvhy8lMoq2SnQYDrGTLHHUph3ffhW5qtLNp3Bgu0b2G/0rcOxKCK?=
 =?us-ascii?Q?TwLgintJPEWv6dzRCSBUThEua436IZEuv5qnChxIG/xRy4AmdBPaPGVLwL1O?=
 =?us-ascii?Q?PDWB4wuRv+6nd795BZjhza7QDuIB4WnLCQ6Zl8RYqv2DyKohMUJmj0x4xe7T?=
 =?us-ascii?Q?o3QJhUAJkkZpkQKQ8/0eOc05QtFbc7Ax8BWyWeTQcUlmDx81dKuCq8J2v+xh?=
 =?us-ascii?Q?MTUPUuaeVfrWLLPAD7sYikYFdaMSYIBgRA1UPceUkmo4aAXdEm6eIHm3TkvU?=
 =?us-ascii?Q?Rj5suEH8iwD1v7iHQANxdofn3iH8821CHBVJ8MFXw/inD06rerBRVsRJzuyG?=
 =?us-ascii?Q?d2QWNlnvuapoQIPJAx0/Nt+X9Yz9ZSWBGPln3jdjzjw/8m1gyXmSNnGENC1b?=
 =?us-ascii?Q?SpFDi6uNja/utT76BNqvGf8R30BUOoonCoJPbKWIQlf9uAzljvZBWSS4rWJe?=
 =?us-ascii?Q?59JogB4bLKlVWVh9VP9uB5+1r/PQJiGElBaWiaHN34IpwFZ885oDLFlJty/q?=
 =?us-ascii?Q?AUhumBn3cCAdNkTPaXlDEOUsVYmS6Roi2ke9oy+jPdisvSqVVNNQhgJF4S4n?=
 =?us-ascii?Q?AgYVq+iFEowVtT1mIZ7oI1m0edR4cl5GAgq0kiqHSO9alN2fb3X2bzxX5UNM?=
 =?us-ascii?Q?6qufGj5xqxlaV/i6Yf3s6l5ViUZJzc8TE5q3HNIKVfnRjnwbHDtd0SKmgrG6?=
 =?us-ascii?Q?7eqPEd/0iOq5YihUBOvG4xXuBZF2GhbPKNpfj/g/VL3GQ3HTZD59m74H2MqJ?=
 =?us-ascii?Q?ZZw/um25f7rsIR7Xly4JogB26gPeMnixd7T6JlvIYCi89cvTqHugy+zSG2uC?=
 =?us-ascii?Q?tm7VsgIv5gVq+G05VWIME178dK2ZNQOxVxxNHhJKJne37duzrxCvkdQZtsbS?=
 =?us-ascii?Q?F57N9c9818zeswqzs8CQm8xmlSzsg2FU4Sf4UiDY0PscxYemIycRcPWtwA7F?=
 =?us-ascii?Q?DtYTAFFfpmenDl9ylkhPERo/9dsQq2E9Rna7jhAWyq7C/InqibFCBBvK866E?=
 =?us-ascii?Q?oOtfO+XGWelN8l6e0x7fpDvVomG5kUvk3ieB6gw9VWzG4ITAI129RvEHGlCS?=
 =?us-ascii?Q?U7SbxPftVDXOGHStUperCoI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32f08a06-9f7c-431c-325f-08da01eed710
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 17:04:14.9759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zqfIN4Ql4hr+yq4NeAbqlO2q9xSMl12aJQq4or8R8qwcYkP/uR6PbP9sXRb4sFCy7/rL7KpJ2kI/WC7BS8Yz0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7758

On 09.03.2022 17:31, Roger Pau Monn=C3=A9 wrote:
> On Wed, Mar 09, 2022 at 04:40:24PM +0100, Jan Beulich wrote:
>> On 09.03.2022 16:03, Roger Pau Monn=C3=A9 wrote:
>>> On Mon, Feb 14, 2022 at 04:07:09PM +0100, Jan Beulich wrote:
>>>> On 01.02.2022 17:46, Roger Pau Monne wrote:
>>>>> --- a/docs/misc/xen-command-line.pandoc
>>>>> +++ b/docs/misc/xen-command-line.pandoc
>>>>> @@ -2273,8 +2273,9 @@ to use.
>>>>>  * `pv=3D` and `hvm=3D` offer control over all suboptions for PV and =
HVM guests
>>>>>    respectively.
>>>>>  * `msr-sc=3D` offers control over Xen's support for manipulating `MS=
R_SPEC_CTRL`
>>>>> -  on entry and exit.  These blocks are necessary to virtualise suppo=
rt for
>>>>> -  guests and if disabled, guests will be unable to use IBRS/STIBP/SS=
BD/etc.
>>>>> +  and/or `MSR_VIRT_SPEC_CTRL` on entry and exit.  These blocks are n=
ecessary to
>>>>
>>>> Why would Xen be manipulating an MSR it only brings into existence for=
 its
>>>> guests?
>>>
>>> Well, that's not exactly true. Xen does use VIRT_SPEC_CTRL (see
>>> amd_init_ssbd).
>>>
>>> I'm unsure how to express support for VIRT_SPEC_CTRL, as it does rely
>>> on SPEC_CTRL when available.
>>
>> I wonder whether the command line doc needs to go into this level of
>> detail.
>=20
> Right, so you would be fine with leaving the command line option
> description alone.

Yes.

>>>>> --- a/xen/arch/x86/include/asm/msr.h
>>>>> +++ b/xen/arch/x86/include/asm/msr.h
>>>>> @@ -291,6 +291,7 @@ struct vcpu_msrs
>>>>>  {
>>>>>      /*
>>>>>       * 0x00000048 - MSR_SPEC_CTRL
>>>>> +     * 0xc001011f - MSR_VIRT_SPEC_CTRL
>>>>>       *
>>>>>       * For PV guests, this holds the guest kernel value.  It is acce=
ssed on
>>>>>       * every entry/exit path.
>>>>> @@ -301,7 +302,10 @@ struct vcpu_msrs
>>>>>       * For SVM, the guest value lives in the VMCB, and hardware save=
s/restores
>>>>>       * the host value automatically.  However, guests run with the O=
R of the
>>>>>       * host and guest value, which allows Xen to set protections beh=
ind the
>>>>> -     * guest's back.
>>>>> +     * guest's back.  Use such functionality in order to implement s=
upport for
>>>>> +     * VIRT_SPEC_CTRL as a shadow value of SPEC_CTRL and thus store =
the value
>>>>> +     * of VIRT_SPEC_CTRL in this field, taking advantage of both MSR=
s having
>>>>> +     * compatible layouts.
>>>>
>>>> I guess "shadow value" means more like an alternative value, but
>>>> (see above) this is about setting for now just one bit behind the
>>>> guest's back.
>>>
>>> Well, the guest sets the bit in VIRT_SPEC_CTRL and Xen sets it on
>>> SPEC_CTRL in order for it to have effect. I can use 'alternative
>>> value' if that's clearer.
>>
>> Well, as I tried to express in my earlier reply, I view "shadow value"
>> to mean "alternative value", so replacing wouldn't help. The question
>> whether it acts like the shadow values we know elsewhere (VMX'es CR0
>> and CR4, for example). If it does, using the same term is of course
>> fine. But it didn't look to me as if it would, hence I'd prefer to
>> avoid ambiguity. But please realize that I may have misunderstood
>> things ...
>=20
> No, you are OK to ask. When developing the series I went back and
> forth myself deciding whether 'hijacking' the spec_ctrl field to
> implement VIRT_SPEC_CTRL was OK.
>=20
> If host has AMD_SSBD: VIRT_SPEC_CTRL.SSBD will use the SPEC_CTRL.SSBD
> bit in the spec_ctrl field, but it will be set behind the guests back.
> If guests sets VIRT_SPEC_CTRL.SSBD but not SPEC_CTRL.SSBD, reads of
> SPEC_CTRL.SSBD from guest context will return 0, but the bit will be
> set.
>=20
> I called it 'shadow' because the underlying SPEC_CTRL.SSBD bit will
> get set, but reading SPEC_CTRL.SSBD could return 0 if the bit has been
> set from VIRT_SPEC_CTRL.
>=20
> Do you think that's a suitable use of 'shadow'?

Not sure, but since I don't have a good alternative suggestion, please
keep using "shadow".

Jan


