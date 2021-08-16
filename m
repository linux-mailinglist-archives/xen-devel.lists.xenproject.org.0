Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7823EDA1A
	for <lists+xen-devel@lfdr.de>; Mon, 16 Aug 2021 17:44:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167408.305575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFemQ-0005dB-GA; Mon, 16 Aug 2021 15:44:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167408.305575; Mon, 16 Aug 2021 15:44:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFemQ-0005ac-Ci; Mon, 16 Aug 2021 15:44:02 +0000
Received: by outflank-mailman (input) for mailman id 167408;
 Mon, 16 Aug 2021 15:44:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3tuO=NH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mFemO-0005aW-Fk
 for xen-devel@lists.xenproject.org; Mon, 16 Aug 2021 15:44:00 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c565ce6c-fea8-11eb-a460-12813bfff9fa;
 Mon, 16 Aug 2021 15:43:59 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2113.outbound.protection.outlook.com [104.47.18.113])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-36-e6n_MgQgOgqjLFQvOgxN_Q-1; Mon, 16 Aug 2021 17:43:57 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3295.eurprd04.prod.outlook.com (2603:10a6:802:f::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Mon, 16 Aug
 2021 15:43:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 15:43:56 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0022.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.9 via Frontend Transport; Mon, 16 Aug 2021 15:43:55 +0000
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
X-Inumbo-ID: c565ce6c-fea8-11eb-a460-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629128638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QQ6Ni4tb2I4yG+Vc0STXp/JQ8EwjwQ1iCtPSbEVLvs8=;
	b=KtyfXnDepGC4Dsj7S8rMjG5TnjsklgPufdFYyw5rMOvSlJVXS7g/2MB4/vHg8nnZO6u9cr
	QkeJzrPc+xTY0T5D3VwGHcrVdKGQbQnG+sMfNVoJHOB1bbY6SHSBn5tZ7XW/I8UQEIh/na
	fJfqlYj3WQKwtnrGkES6LR5xrBlGPTo=
X-MC-Unique: e6n_MgQgOgqjLFQvOgxN_Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AfSGfU3CgjAxqL06rgsEODnLbCXtard96WrNlFtryk0Sl9FAqF7+WFRrUObpnIvAuCXSthiLJDluAC5OsJaC9xke/3lVvL6m5ui9/AM3PpI4KYpGUwxgSEl85iVLnJFaLhpASiVyiTeTOMqwdyEI5+sTqVNvC+WDCCb/JE2P0e/DGb38TGniPCK4ZxhVKHaUXDuTomRUJzobAOyeOtTd+E/17/4Eg2D2Sj+UKCsRUz3MG6bfJ6jvHBkLPZI8tlxg6vC7O7vWaFzC8zvVpvZZtU0MEOPyrNLBse2FCBBx3/axnbcN2V5CQTkNh9D/1YRe7d6O6bVkAsBbWbWfz5upwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BMn6eybIX4RyhUSyE7uOxwLitQXQN/tNiFn+dm5R3Kw=;
 b=kAd0D6B+DRVby993wPX1G8EScqsRTkkJVAc8V4rRtT2v/+OSzKePrwXrJPVLj63/mOhFcf0vtsMYj+OrZgDGK7Og2RxhyttOUY66rkznQa6Egy1zA9/THtVIiTrSJcOtuKyVbms5IIKLc9E1sZxBBOhirlUoNr1SjuYPRyK4AF428mavhuaffDJxq9HTrtJLEyAqf7ts4pxaprCTfBsAEWVdMLj92xMUsV87FOBxKh3bxf5YBoExgcwvHKH7lnG2aAhgHbM0xOgDQ87BEs0KoqKoGeF1W71Fayv4Za4lC+xD1aKmxmy2I1TD3BUUuC5N0hWOj3seFJV469TBDPCWkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] x86: work around build issue with GNU ld 2.37
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2e0beb7e-022f-efb3-3adc-4877c60bfeba@suse.com>
 <69a34c1f-0df8-47c2-4c67-2b22abb9fd21@citrix.com>
 <28bc0732-9c20-c670-4485-8b39bc595eff@suse.com>
 <b310f267-c478-15b7-7e1d-19a650d0a891@citrix.com>
 <ee086e0a-f0c7-51c1-5be2-0610b6c78628@suse.com>
Message-ID: <2557c71b-37af-2eed-c122-831391ce085a@suse.com>
Date: Mon, 16 Aug 2021 17:43:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <ee086e0a-f0c7-51c1-5be2-0610b6c78628@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0022.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::10) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed016e13-b844-4b2d-92fa-08d960cca836
X-MS-TrafficTypeDiagnostic: VI1PR04MB3295:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3295AAC31E7153F85CFD3BCEB3FD9@VI1PR04MB3295.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1zqwFY+6aytG6p/vJZk43gGbrOWoQ4Xylqa+pKT7PTamcpX4xLkqN+ZM/2ZG36ci193QALK2Dqlcq5E7iuB2Qk+fBXgHcDUlvS7X6GiyPKIOHydwYF95yZYK6dU3QrS3+WTinhXYs7hIfU6Z/gYgbtJV+QfUXGCyFnm2ftPuAtnt8+GVUTL1SI1oDmjp7fZoe+6P7pNza3/Ryt+Kx8IsDMnbW8ZZeAHNsbdfOqjekZtDQCD2/8IoTTQQMCD6DUhdRDad1/SrPsigNsePV1sduL+GLivytn/V9M0x0UzA7CdO6rGN9R3CjEJgFfjtstPO4teJstjbOUN/0OJHjAMVFyW6AxbzSeCB0h9XNPvtuknTMJzH1XuSI/Jp3CfPfQ1PTW+jHqifIVUm+IcGj9qSVZuNF76xDKh/cpGYiw6/Qr133X8le6FjFLhalpSziPddSdpM1TfI8oYbsR/7HWVcS4jwJ9yjcvOqDn94fAX9DGCsG0PnKFVydJzbsJzfm5SGVO+8MJy9DvY2rZz0i29TZvy7Ld9V8MIpcNx/3dxLpJeClrqns17BV4bacO5TG3tVrD9z3NdxGohhWjJC9zBHzmXYHNIkLusPLI5DiVloga86RMHsIZUBfdX40uzi8sm9LHiNebHMWSmd1BcZYD7xDG1kdGaNo2Yvlw2TIKKsXFCqUN9Ii9+I2yHoO3Uz25wqSa3HfliJY0csuEgfIiSX4i8GrEuEPuh2XUhdoui3hu11cuQl80iebVd0fMCw9c4aE0YmHwuvjwH6HW0zjh3oYeLgXXzdlLlixeuKBUh1r4tHgkYGCve0eC44ACmrG3nA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(366004)(136003)(346002)(376002)(39860400002)(186003)(2906002)(66476007)(86362001)(31696002)(31686004)(66556008)(4326008)(38100700002)(966005)(6486002)(8676002)(478600001)(66946007)(5660300002)(2616005)(54906003)(16576012)(36756003)(6916009)(316002)(26005)(53546011)(956004)(8936002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?igrUj7RTIKsJ9FWN+sRUt4ylA+Fc+YRI0fcH2jGI3vef6y4gxNZIEnZhBF/X?=
 =?us-ascii?Q?CzafA4GQno5PcHhta/leC5umyGdcjeSZW3jDMz4h0bO5zCgWOu/fhg9EQg2+?=
 =?us-ascii?Q?IPRz2qnYwRhApC545r11PtJZVfXRGvWzXArs2OLedM4rrK0ZaadC052GUP/l?=
 =?us-ascii?Q?mkHMSZAl3GIKB1g2QufY0Xr84J+0/FJAebekoWvaWBsOd2t4Hm07qOEtXUhm?=
 =?us-ascii?Q?RsIgI7KOpMkZFJeUmt4Cqf8fGo54PMqarKOb5R7+P45OHY1+JPjKb3Y30HS6?=
 =?us-ascii?Q?NOkCIYdQm334f0nnTiMxaLsdBEZhIQsw6zLu2udTXvxrAZt1L0qZ9XOPqpXr?=
 =?us-ascii?Q?BLJPjjmzwwpbhJJwp8msIFSuyPsG2J/fh6+v2DgW30JTnnYcjU4uav1GRCir?=
 =?us-ascii?Q?ZrUB32v+JD15FyzTIo9H3Qfl+iCmMZQYfPfa3F/a9C2hpBn1iHcUrKRKWXLP?=
 =?us-ascii?Q?QXjK75HB+UAWHmSwdmIvtCcwTVuz/+6RKsrJ83+zk6jmig2i83c3+xHDXg6O?=
 =?us-ascii?Q?LFk7FMk5xVQOo9vFUenVHNyZSNBieIdlKMH596+kYpXiCyAfP+2H58kMNyN/?=
 =?us-ascii?Q?/icBZGug+OweyeOt+b9c/pEj2QMR4tW/S3ZBRB1+HjOUKwJUC2BpQSJ2y60p?=
 =?us-ascii?Q?aMVJtXdk2e/J41OzbDKeb7PmnNuQWRfol9m2Ibu17QH67Eg0nLeEZx0/xW++?=
 =?us-ascii?Q?pTpHUsIvkWg6j3y8iMeRxJ+yQ19omHrlgwrdcToA0k8eLRdhfDsTSI6A2QSr?=
 =?us-ascii?Q?2zE2Q6rGGgCUD1OFCem1yehd7vT6DuKvnZTJLzM5oVMuyYoFViJHnlFShD4f?=
 =?us-ascii?Q?fdNwAshwzvU5+OEtz5aLTQ+Y/A0RynegdKSIpGrGw+aA09+scteQ9/Q9LrVC?=
 =?us-ascii?Q?+hYLhx8uiYeP9RwFbbGyC7kXEoEAkLFhR7ZZJORXGvztiWVbJogglPIsB3Bm?=
 =?us-ascii?Q?/RfgGqqcMhbIDONq7O00lq/evtmd+UXFf2zZV8xpCMPtsuIzLO/af0GV+8s8?=
 =?us-ascii?Q?zz9BW5SpMOAZFBdVzU5F9L+CXmF3/UeeqwZvCeYHYc8tOJGu6btcRo2sa4Gd?=
 =?us-ascii?Q?bgKVAlPg7IK1hOwFSaKIk3DykWBPSaKDQtko8ErVMfllNsL+aKnXABJtRtcq?=
 =?us-ascii?Q?ErWdCPitCwhUABQSmlMgiPGm6JY6F9zLcrC84kX2HAQlBIKSUPmGjXBwXz2j?=
 =?us-ascii?Q?SztluOwVbyWEtKaa4+8nF959p8tIUItQ57FcyvFgDvi7sYqcuU1Y3VLcyv3d?=
 =?us-ascii?Q?JJ+VVvNnsGKwhLBBzUU6rHAyiw3NVCMvu5Lt2g6bXi5BWlFrOpKKHj8aHhBD?=
 =?us-ascii?Q?XNHT7192x+GcGeet1fxtbGNQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed016e13-b844-4b2d-92fa-08d960cca836
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 15:43:56.2968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XM5ROLb6UGfE2i1PP2P+rwz55cov+BmbA8M7UQxxLmKEdAIbSQPVsbc7U2gpsddwDbqrk8rp3W72svD45aLLVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3295

On 10.08.2021 10:50, Jan Beulich wrote:
> On 10.08.2021 10:33, Andrew Cooper wrote:
>> On 03/08/2021 07:37, Jan Beulich wrote:
>>> On 27.07.2021 14:33, Andrew Cooper wrote:
>>>> On 22/07/2021 10:20, Jan Beulich wrote:
>>>>> I suspect it is commit 40726f16a8d7 ("ld script expression parsing")
>>>>> which broke the hypervisor build, by no longer accepting section name=
s
>>>>> with a dash in them inside ADDR() (and perhaps other script directive=
s
>>>>> expecting just a section name, not an expression): .note.gnu.build-id
>>>>> is such a section.
>>>> Are binutils going to fix their testing to reduce the number of seriou=
s
>>>> regressions they're releasing?
>>> To be honest - I simply don't know.
>>>
>>>>> Quoting all section names passed to ADDR() via DECL_SECTION() works
>>>>> around the regression.
>>>>>
>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> I guess we've got no choice.=C2=A0 Acked-by: Andrew Cooper
>>>> <andrew.cooper3@citrix.com>
>>> Thanks. I see you've committed this already.
>>
>> Actually, it unilaterally breaks FreeBSD builds:=C2=A0
>> https://cirrus-ci.com/task/5417332467040256
>>
>> I'm not sure why my build tests didn't notice, but obviously this patch
>> isn't a workable option.
>=20
> I'm confused: Is the tool called "ld" there something that's not only not
> GNU ld, but not even compatible with GNU ld? (Iirc clang's linker is name=
d
> differently. Or maybe that's just on Linux? In any event I've just checke=
d
> with clang5 [on Linux], and the build worked fine there. But this looks t=
o
> be using GNU ld irrespective of the compiler choice, and I also don't see=
m
> to have anything named "llvm-ld" on that system, despite there being a lo=
t
> of other "llvm-*".)

So I've looked at their man pages. From version 11 to version 12 the
linker changed from GNU ld to LLVM's. Interestingly the respective man
page says

     ld.lld is a drop-in replacement for the GNU BFD and gold linkers.	It a=
c-
     cepts most	of the same command line arguments and linker scripts as GN=
U
     linkers.

To me "most of the same" isn't quite enough to claim "drop-in
replacement", but I guess that's just me ... Anyway - short of Roger
being around to ask, I'll try to locate a means to tell the two apart
from a linker script.

Jan


