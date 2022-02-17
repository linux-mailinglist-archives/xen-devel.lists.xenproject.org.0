Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4054B9E41
	for <lists+xen-devel@lfdr.de>; Thu, 17 Feb 2022 12:03:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274673.470226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKeZI-0007hO-Al; Thu, 17 Feb 2022 11:03:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274673.470226; Thu, 17 Feb 2022 11:03:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKeZI-0007fV-7K; Thu, 17 Feb 2022 11:03:24 +0000
Received: by outflank-mailman (input) for mailman id 274673;
 Thu, 17 Feb 2022 11:03:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xzkl=TA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nKeZG-0007fI-75
 for xen-devel@lists.xenproject.org; Thu, 17 Feb 2022 11:03:22 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37dbdf80-8fe1-11ec-8eb8-a37418f5ba1a;
 Thu, 17 Feb 2022 12:03:21 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-26-DxL0BHYJMMOc3IQIJTP3Vg-1; Thu, 17 Feb 2022 12:03:19 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5534.eurprd04.prod.outlook.com (2603:10a6:803:d2::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Thu, 17 Feb
 2022 11:03:18 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4995.016; Thu, 17 Feb 2022
 11:03:18 +0000
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
X-Inumbo-ID: 37dbdf80-8fe1-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645095800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=22IXCnbo7+/Kthl1EIQKUx4jCq4taBINGjK3TR/zkic=;
	b=hqqgMLbsJd8dBSJkUdlE+WZ23J5Dhkf/L4GZccSkPeE9yX45bXBny2s+Wg/1axyOMx07iK
	R8kRaPpnwCD+dwlFSTCzNRR1eorojMWowjuy2Cb/dSsKotPajO4Rk2+W4aMfTKEWDWnj0Y
	Pc9Johx7YAhz/D06XnvFrSbDeSoo1sc=
X-MC-Unique: DxL0BHYJMMOc3IQIJTP3Vg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iIa2idleg8NwJpGhVMBX77Rky8VJVUA+0Br6uaB7+dKtlkudpY29MWSAE5OkKbdWdHoDusJIbh1nfFtLMClhmj/hr8xpKMluwZMRtzLX1jYeBwrbYxdWO6MrFVwPg8e5nCTXWMx1gv4FPuyFKBMbCivbrVYmWKuO79LjWBAEFydJyXZayUz4zPy6tuJfmRJs9BP/n3LSmww9tcDIyZTYBW8eZmkqrFApToXq5vvaUIXwsXMDr60HICzB66//6l7lbTshMUARLfsnbv7XnsPqMLKXBlqx3EWoT+cP2t8TRVxVeUk8fzVwW5QHCOcjskPIXEVYPzgCUJq9uZXRd6jymg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yfe7nauKf8aNurctFju3NHseneLi7dJXN6BM8N+QbyI=;
 b=WOH5/vVhBZyRJqW3vq71fGD5XLLipxdIqAakXlN79bpAdP2CQGaEF4C3UhAxeec+Gh5gZnUSWsg+33cy8qqUbihU2ui6BHWF2ud1NpAv5x4K8vMQkOw2bx7O/hd7QQAJcZ8tJLfQ28VoMfiONWdRsaufs749LwBtzRQYWKDVjj4YkZlthKeK6QHOB6qLRu4DcBG54zSV+H7ba3yek54XcIw6aSx6jrljRwSzLfIXVPB6zris+v7qHeAbbAiY+4+r4g4M4i5Kshe3aa+ho6X26JLaONfrFyMEgTxT90FtCoy42IiO7NCvfCsKjYp0/2fkEbNXw793hWNx2MhH/ijclQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b22d6e6c-1810-8f04-7531-9d606478a79f@suse.com>
Date: Thu, 17 Feb 2022 12:03:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 1/3] x86/retpoline: rename retpoline Kconfig check to
 include GCC prefix
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220216162142.15384-1-roger.pau@citrix.com>
 <20220216162142.15384-2-roger.pau@citrix.com>
 <7e5f721c-9771-bf35-8b94-f7fec7cd6eeb@suse.com>
 <536a357b-b895-7fe6-f99d-e83f5ac44745@suse.com>
 <Yg4lgQlNBTyTlsLD@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yg4lgQlNBTyTlsLD@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR05CA0029.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::42) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 434908c0-b09c-4c34-4488-08d9f2051a88
X-MS-TrafficTypeDiagnostic: VI1PR04MB5534:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB553483F3B663BDC92B6A6C5EB3369@VI1PR04MB5534.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rV4Y6YX40s3xyxp5vs5tLO3Djoo+qwHfWZKQGQ4NGz+7mlzrd1rAKAPPNI21h8fUFdUP2WO2RR8g5HXOCdQmCX5rXtG702DJPs3S7ywpLOy05u7N2Ou4BYisOxH8tV5akib+3dIHFKgvMIrJgqkhGzKAjH1aruVPcS2L/MywpJYt5Q5X+eavtIjqsD3r++Fqrq6gN1QsvEgqbLfI+BY1wxWFkp843SQxyxkjsJu/MB9YGc6y0r+7hkfy/83739Mw58N7f4jWZkVi5ygAN+H30BlooRmUg4tbWwFRiku+x1sy7vqd0gw4VWqwJRpUMrIMMbz9LUNz39tylOL5IxOCs6IiHamFbFJw+ahM3nDQjnbMGDknIn9d3h5NXzLiiFUg0ZHcmLnCo/7BnfXov1BSKfVizwLeEssMBNnjh+Xx2WcM6AbRWPHNqfiPfL4dX6x8DDFr34Kq36jdmFRAREbe3eghfKVH8Lli5PiN7Qx0wc9tM+f1yZsf2DNdBTtl1t+mlEuz3oPk3OWi4Ey64nLzT4ZNp/7sf2FZ5KxLGAKP6iWuAoDshLdUrEQvjGhfZ45HzVjmYvpMYVygrsfCIuPduXSbqRQwRKfiV6ttT3UzGwkxnFYatlTz9uu5rtsfQOrDeCss4g2LpXRaayChQfHQMHkwYjqpYgX07PedgRhK45NI2wpu/jGKYxw4UsXTQYAysGjwN+w24MAtyTKfdYDQSD7ClkSlettKB7kFnq0aBX25McORgg6wx6mubAHGtoJW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6916009)(6486002)(31696002)(54906003)(31686004)(316002)(86362001)(508600001)(36756003)(26005)(8676002)(6506007)(66556008)(66476007)(4326008)(8936002)(66946007)(53546011)(38100700002)(2616005)(6512007)(2906002)(5660300002)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YCB1m7H/fdhRUizMKwtwH9vqVXcxZNcmhmal3PT1GmSc4GyrN1S4i1kD1yRA?=
 =?us-ascii?Q?+lhHIfQo4RtiARuDOckarJNRYHOzmJSyyY+CuV2AGyjiZpNWDlr/tJQzhTST?=
 =?us-ascii?Q?SJ0gNI7EO9EGz4uTbR4DT6mlPbgZeFKQ3eS5i853AKSJj69bmhPmaOKzXWRV?=
 =?us-ascii?Q?tr8AHwE962VOk0dDfvHKbkO/VQMVmjjjC24XOL1RW+7gex3cMW/jD3rmQmOK?=
 =?us-ascii?Q?EijR1FXsq4scJGe43ldnrNQMr3gE6xcbh92tYozuYvK06hhh70+0vPU1n+qv?=
 =?us-ascii?Q?B5/gBUlF3P36r9RTQNpfvKWl81Iw2F2nwctyn0fc43+adFmOe/IHWaHPmOaR?=
 =?us-ascii?Q?6+eYKHftcTLka8LhhKQ7mxGV/4Xj38vQQpFR69+y4a8aqgzFFDJIXHsXGvQl?=
 =?us-ascii?Q?Zx6oh6TSom1JuK2sZrh9oephPWOSIGmiGiz7o4qkEZhXxZf17Vn2wzB20dGm?=
 =?us-ascii?Q?9DCCD4AcMk5dwBfp+xvQ9wjiWe8mFr65podBJRjktBKlrrMjmo5nLu8PC7Oj?=
 =?us-ascii?Q?5c6+6LwpNintRC/UGtbo7EHNCsmqs0RHNFcwp5kNMJ4OwL7WLGCIyx6chdRq?=
 =?us-ascii?Q?KM89yOoGTK5RRboL8Cs282fqv5oEnzHD4eY424TmxaUynX4Qy9QQgGg/CpGB?=
 =?us-ascii?Q?mWF/+weiLJNbIGUNHigOJS02IB1TlJCqkIHQMkk1GWtxfviqGiGwbicduJhB?=
 =?us-ascii?Q?EWhP98EwJqXYAdunx4/LuUKSqCX5+UbvAh7ilc5GX5T1c0MBUP8sMBfhqS3I?=
 =?us-ascii?Q?mal6gauw7+yeiDRC9eYJ/hA57vnEJ00KJoJ4Y5D4ge016bZLCeu216c2tY4z?=
 =?us-ascii?Q?WxA8Ooc2CzLRaBubH9wtXuKbidjcBMhTnerONoiZjm3NXOTYez8WWf7xl9A1?=
 =?us-ascii?Q?2tbO4+VCYjPdeJ5N6Pue86pZJ8bOwc1hPIGj/oqylfp8CZEamW6Vip4cBmOG?=
 =?us-ascii?Q?3JjtKYP39BPuOdCRYpqF4ISh61KDBIH2zqRqVmyJOtU/U6vRUkEem+6gAluK?=
 =?us-ascii?Q?7rJL7FIF6JkBtVuLOJj3yGrNiax/RLMVUf2KTn2puTi7ECv6ZEHIZodYzgtv?=
 =?us-ascii?Q?uBwCvA5+GEv7f6kOmhtQPCmxsgdqY2RnvOCvYq4lnYMOP3ScHkKqG8E24OY0?=
 =?us-ascii?Q?lfeX601RZH6pwmcA4c/79vq0TDufVX72op3NeF9c44CtBAgpHEQb6oabbkJh?=
 =?us-ascii?Q?qCobgK947YgqunciWQSAwWv6UCHG4xcfHLKkRZMqwb6cPUDMCD+aBC/5z2gW?=
 =?us-ascii?Q?t1ibTaFKUG9NxaCEO+186/1oh1UvPG1MZpzBUZajFJjORruKoHRKujNdRBpm?=
 =?us-ascii?Q?V0IosjNrj6af93/i9TXN0pukceQQLCKJ2wydOPu4D1KcLZoHUt4C0zmKHyzO?=
 =?us-ascii?Q?H1YbeNVpNXGBS+e7vgmc/eAkPvbMZl+PL5tQG1ZmkQ4oIX8+pOO3RrdNLC6+?=
 =?us-ascii?Q?FknbyH+i2Hv7RYJN5+TXZj/aNpaxhsIqq0bMzp0FxtY4TM/HddL4rARgf71W?=
 =?us-ascii?Q?41qWEIfbj4k8k5TN/3TmkRaPYfSdVtd0Xd43awT0NmZyjB3MyKY7rD2ndWSE?=
 =?us-ascii?Q?nfXbQxZV1GD5TX9KU2gMyL4MIUPHkdwTHQ0Xl8/yMw/zTvIhVbCI78q8c0Nn?=
 =?us-ascii?Q?jKz/5TUOUQ15rj/4Yydc+EI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 434908c0-b09c-4c34-4488-08d9f2051a88
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 11:03:18.4782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C2YXsOcujTIWkwOEToWf651XtXyRCyxl0hbmapR4Z2wfA4/mtJv+iNxnJ17SkV+6XVsvgm0j2La+dZEvQQuPEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5534

On 17.02.2022 11:37, Roger Pau Monn=C3=A9 wrote:
> On Thu, Feb 17, 2022 at 10:04:01AM +0100, Jan Beulich wrote:
>> On 17.02.2022 09:59, Jan Beulich wrote:
>>> On 16.02.2022 17:21, Roger Pau Monne wrote:
>>>> Current retpoline checks apply to GCC only, so make it obvious by
>>>> prefixing the Kconfig option with GCC. Keep the previous option as a
>>>> way to signal generic retpoline support regardless of the underlying
>>>> compiler.
>>>>
>>>> No functional change intended.
>>>>
>>>> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> Changes since v1:
>>>>  - Put def_bool before depend on.
>>>
>>> Just for the record: A slightly shorter alternative would have been ...
>>>
>>>> --- a/xen/arch/x86/Kconfig
>>>> +++ b/xen/arch/x86/Kconfig
>>>> @@ -32,9 +32,13 @@ config ARCH_DEFCONFIG
>>>>  	string
>>>>  	default "arch/x86/configs/x86_64_defconfig"
>>>> =20
>>>> -config INDIRECT_THUNK
>>>> +config GCC_INDIRECT_THUNK
>>>>  	def_bool $(cc-option,-mindirect-branch-register)
>>>> =20
>>>> +config INDIRECT_THUNK
>>>> +	def_bool y
>>>> +	depends on GCC_INDIRECT_THUNK
>>>
>>> config INDIRECT_THUNK
>>> 	bool
>>>
>>> config GCC_INDIRECT_THUNK
>>> 	def_bool $(cc-option,-mindirect-branch-register)
>>> 	select INDIRECT_THUNK
>>
>> Oh, looking at patch 3 again (which I should have still had in mind)
>> this would of course not help. Yet ..
>>
>>> A more appropriate thing to use for "depends on" might have been
>>> CC_IS_GCC. With the next patch in mind this would then avoid
>>> potential confusion if e.g. Clang folks decided to (also) support
>>> the gcc style command line options.
>>
>> ... adding this dependency (and a respective one in patch 2) might
>> still be a good thing.
>=20
> So you would like to make GCC_INDIRECT_THUNK depend on CC_IS_GCC?

It would seem more clean to me, but ...

> That would be fine, but I think it's extremely unlikely for CLANG to
> adopt the GCC options - I've already mentioned at implementation time
> and they refused.

... I'm not going to insist.

Jan


