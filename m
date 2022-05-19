Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F1652CBBC
	for <lists+xen-devel@lfdr.de>; Thu, 19 May 2022 08:04:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332672.556409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrZGV-0005dG-SS; Thu, 19 May 2022 06:04:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332672.556409; Thu, 19 May 2022 06:04:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrZGV-0005ar-Nj; Thu, 19 May 2022 06:04:03 +0000
Received: by outflank-mailman (input) for mailman id 332672;
 Thu, 19 May 2022 06:04:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zL4X=V3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nrZGT-00057D-U3
 for xen-devel@lists.xenproject.org; Thu, 19 May 2022 06:04:02 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a5e67d7-d739-11ec-bd2c-47488cf2e6aa;
 Thu, 19 May 2022 08:04:01 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-14-54LQB2xTN7WNxLYSVqQ4hA-1; Thu, 19 May 2022 08:03:57 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8793.eurprd04.prod.outlook.com (2603:10a6:20b:408::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.15; Thu, 19 May
 2022 06:03:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.016; Thu, 19 May 2022
 06:03:54 +0000
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
X-Inumbo-ID: 7a5e67d7-d739-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1652940240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UQDBXjQYRnn9HMUzgtpNDzSU3AqMyCnMlbhx5IzLiA0=;
	b=SFDrgHqdZ4q0556pr64DHYY15fbVZnhnxrRJMH2mmhfPVxHG1eZpCflVZG4MenKt3wUPOv
	Bm0SaiyXZbBKc6hnBBZgINSa1QY7ROpL1D2xZ9CMblQUb3Yagvm3lEtS8x2MY6r2PXGvIe
	THDPaIbsk4yVrBp0rNztfnxmemK9hAU=
X-MC-Unique: 54LQB2xTN7WNxLYSVqQ4hA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LH6X5j15PzAzLVIzSUmkkdAZKOu5Exve+AtJy05a+TGJoIrX4zJsRw5rMN4OUmSQPKc8oJsE+9P7tC65KF9ubCD210rtf1CQHF690lNMx5o5Uy5eKSGzwLhqed8Wujig+omQGcysxXjs/q7B/J9SFP0l8NqtuDz23W23izznwOgXFeKVCLuF8og5w12f5/W4GnYpLvlaVdd2u+roBIMSU7JbElj1hwGWSV9hgBRA2xq7RFDx3Jafv2hQfKqnCPOQIKy2TPEyRAeAtJAS+BL/19HBt/nThG+9XaJu0XMbAXO2Jh1udF/724wsAQuMZgUhGT3RszsDTpATs1Gv5rUQKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mBttHXc9Bah/LeexF21QC1EdU+43Kka3upiCyrlpYO4=;
 b=nXzREZfDozzunRhruFNm5C0HC5oU3Uhmb4jdml1CdX8q0hXtvWRgdE7jElQaIi8xnIE1YGUiIhwJ1i7/gDurIrQrN5UzBIkl+OWAI1Rrkeb4mQLMrvbTjTeu5Zncj0WLVh2nLCHc9TmilmzTzjGSKZrWcEf3At3fAMOmwqx5o52FBuVeGeXYb9yM9YVSdqg1VxOYS/Th/6rEVWycI7QT3vzzUfd6GOoPgU+ieMCu7+LB/ttw9jJ24q+rkhfO/p8jQVMb9fsdRIOSHo0Ki+9C49pofl6R7Qm3e8/xIXbVS5wk0eLz0UiN5dpCd76dHDgysUKLhrxgSYsWYahPdEfBrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a3c4a082-9c4e-c288-7729-94cb5264e3b1@suse.com>
Date: Thu, 19 May 2022 08:03:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 2/3] tools/libxc: change xc_memshr_fork_reset API to match
 hypervisor
Content-Language: en-US
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>
References: <7f03387eebf9de474f404ef661f80133e3725365.1651073086.git.tamas.lengyel@intel.com>
 <f3fdd4e99892549dc68e7511f2d84f51af446e86.1651073086.git.tamas.lengyel@intel.com>
 <YnOIEb9sNfshZwtZ@Air-de-Roger>
 <CABfawh=WnQtGehg2mX4Lnz9y3AyAnaUjUyc4FNxjGvoc_YcOBg@mail.gmail.com>
 <CABfawh=2wHwxGuihNY=ecKcdx8ZapmWnNzx=O6nRxm1ENpr62g@mail.gmail.com>
 <f15dfd96-f104-7d5e-048a-8a9095520197@suse.com>
 <CABfawhmSFxa23PrmCzaQEvqUE1nZuVB1i1iw_terDa1BCq5gig@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CABfawhmSFxa23PrmCzaQEvqUE1nZuVB1i1iw_terDa1BCq5gig@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR04CA0169.eurprd04.prod.outlook.com
 (2603:10a6:20b:530::24) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52f3b390-6789-4987-bf40-08da395d5af8
X-MS-TrafficTypeDiagnostic: AM9PR04MB8793:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB8793F56205409E8619C0B65EB3D09@AM9PR04MB8793.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gCEa0cj9VknMUjfeWnpDGQSuA957okZxyXV052KuFlee5s8TAujkarWQOJM9eV5CkJXFH2rIaLwLPARbjZih8HqC8OVI8VU3vJzrBY2VGFdHefCj3UKU1Jh6HWWcIFaVK6rjM2ZUr2pobDu+C37HAmTnlW77wBXhpn6tmzrDWt0uxzXZEMryDnwXqCn57ei51xTXk406DJ+sf+Mprd4r0Mr4Vd7K9y0RsVbKIl4G/C9wQYyMzYr+AACtMtT55ba/RNhqUubWf28Y8P6M+vZPQaJsblOUF3B+gKr5N9rwqYUG39jTBwchzGLqwTvX0MZzdADnZrKE2T96MpoyNigEkV0wdV/0JEwXdNJUgZyTp+1uiik+NTZhmeRjH6J6o0O74rlSGDUHXAmZH2oT01Gn62ivFe6tD/1xFPPvTL5aRpTc8JuTg9BHmxIwH5Dskvfl6PeojrgZWORaE8j91OyMGRCWJ7m2l7oc7Qo89NftQIt9FVwAILoR9x3Zmi7ZIwhZCQLm+0+8sffPbBuk+QMHUgBZ5R8FldzkpkJEctlLrBBjwSVyfBBGWvTxBYFr+telfrlRfVARP0GAKiElACfwuqyzhT8ThunGJAAAbzAZI3NKlPa5ghifSYwBCy9u2CgKHiT2DwpjvFkeOx+yvKCgAETc5tgeSpR6dUwzAYPTkY54XDO7uCylRCOgjeLPV/rxZA2kk/y10Ga4vWQtg+8WLVz+qaM6gzm9yPW93QXPpdlpti3TJUHHTeYlXwgubblh
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(86362001)(31696002)(53546011)(31686004)(36756003)(186003)(2906002)(6506007)(316002)(8676002)(4326008)(66946007)(6916009)(54906003)(66556008)(66476007)(6486002)(5660300002)(38100700002)(8936002)(2616005)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cqUostkoR14WlHLhh/A7EAYtRbKi0evQNLghgHrUrbCZO62AO4CgwXttRK+l?=
 =?us-ascii?Q?O4NTtUAX2ThPrVwiLr4z7TBeDWvH/BxJFy3kXU0a5ptk7fyIsXt7VKn6oKzx?=
 =?us-ascii?Q?KcTNZXpbdeF84YUcBo3QyzayzL7MCJZu6wuIRfGj6uZGwtuSuq+QEyBlknM5?=
 =?us-ascii?Q?DoxRTa9fKnjrpoP6Jl9Jt/kUuSEDNpe9U5zYW1ac7xp60/huikRwqjwkesNk?=
 =?us-ascii?Q?JITc8CWaLjNlvHbUjqGtcn5TDbsWIEWqajfynitLE75zrigB6V9idaAmOqqV?=
 =?us-ascii?Q?p5+tAQXf+5no9cWv+gGqix8ZDP0lTiRdzeiAPkz9kwhIW5CIWGeyvFtQQgLG?=
 =?us-ascii?Q?de+PE6ynjuQwfkrMAwwJZgXnD8TS1aHIGhuMWA6DgNs/Y+rXcLMbMcyPi1dS?=
 =?us-ascii?Q?ywL0E4TXnzkFvGdStatOBgAtTw035XJ724n1+5Tgzt43MEIkJTl8FrnWT05k?=
 =?us-ascii?Q?Hvo2RSJncjNvDH0uggWjU8OUFbS6y4h5MCvIMHfQ3D3AiiIWA0XY0jBGlwTG?=
 =?us-ascii?Q?iF3skizQncEAD5FIFljyD9/D0fKixkCxyE7+4lOFAPJloEuGWwNIrVw3NUkv?=
 =?us-ascii?Q?R/BezWYEGi26p91phXbQkm32g61z9NpPbiOGQePvzPd3LAbWkhOQnxjQQp5t?=
 =?us-ascii?Q?JQcKrWMVMa3d9FeFQ68jahm/0rZK4HIlTp2o1qfMP3zvZHbR9/thrHkqbiIL?=
 =?us-ascii?Q?rhR0Wt2wY2juJQYrSK4WMbCCa3lXC9TkG6CXb8aXZwcJfo4LmX8rF+nO5A3E?=
 =?us-ascii?Q?0r4a/j7AL3kpC98H4ewuTElYZNZQrrZps40ggenxgCSm2SQtUw9hnCMBTRyw?=
 =?us-ascii?Q?iFU7DoCMHG0QIWR5094+KQzw4D1Pi5Fgj2cHXXgDp0GnyrVtjjYZ8yhoW23N?=
 =?us-ascii?Q?zHNDigjJqWjwhOczoq+BT0KocfAR6E03NHGOBcyyMW4ke/mOiNso38YCfwwU?=
 =?us-ascii?Q?HwkPZ/t/U7tPvloaZtccdz+UMAZFsgmAD+nNmSygPAaSkC6BHSJz0EEUkvIU?=
 =?us-ascii?Q?7LRVtaSVNGOj/09K/d/q/hFRMPWOigjI3Gsp0K3F37p6N6ptg2KqNqhRsJW/?=
 =?us-ascii?Q?ncCMPwgs709Slb6kVV/VMs4vrKPC9RbWqeuqgO04Wmzk+Rt3s1zw8gtsp3Gt?=
 =?us-ascii?Q?x3u4JKLoTJMcrtcv86lVShVzlg166rmA30iAI18bmbv37NUreIzkH46hpVsW?=
 =?us-ascii?Q?0fOZRC3jPUYs5yTdSTwbRNzTIRzaY1NGLFdyr5rH0Yw+7GBUXwQuafjRxkGf?=
 =?us-ascii?Q?ZdgCeXZBRtaQ6CHAgpk9Lyx4TwLe4aTIMATGSmC948MZ/9GidATXSQKO8OWq?=
 =?us-ascii?Q?ZbCgMOZXhuKN1wjxsNzpTFD1dUBs01reljIGzYwLXE3/ezi80WBhaOr2TGzl?=
 =?us-ascii?Q?KbwLIRCMqNHODiuVxF7ddQiVDB9FbZgTg/gwXvnh6Y/rOJHSUsce0OmdZVsm?=
 =?us-ascii?Q?VFe2+hH8GyKeCfIOgdW9xe2H5F8j5p25WHbQrKmA3sMXDg4YHND5PhPsN2ND?=
 =?us-ascii?Q?21ShOnbRoTvauWwaHcN1WVVnF+pV7vjSb2KaLcu16mgNrMtf7w9UQZaVAh0q?=
 =?us-ascii?Q?1bfX+HPezweivix7ykHC5mCfh6Pjd/h70lKTjPf5l8n27uyZhKbWY8H/4HvF?=
 =?us-ascii?Q?JyHntgZoNdUCuZFvdCfb1u7bK8KtwtHd7zINwyjzJFYovgIg8PjUGofu1Nmd?=
 =?us-ascii?Q?bHH/yyLW5MbOe72ZBVgse8qSm5UUzWaDY0kTE0vqlIbJf5gL4/vFFxlwDn8J?=
 =?us-ascii?Q?iL9SB/FpyQdlqeBgRyyCquR65/c8jWgufY7XLEdmq15Mj2Wc4zHgh+eLIPbC?=
X-MS-Exchange-AntiSpam-MessageData-1: EGCgTvIIAHPNBg==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52f3b390-6789-4987-bf40-08da395d5af8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2022 06:03:54.9058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GFztfleDbSIq2HcQCyrcaH9FPQoeIRRtYVfqacSNsRZA8uX1Y1gzgJXpiWrqNz/sYpXD887NALflgHXFK8zUnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8793

On 18.05.2022 19:03, Tamas K Lengyel wrote:
> On Wed, May 18, 2022 at 11:48 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 18.05.2022 17:01, Tamas K Lengyel wrote:
>>> On Thu, May 12, 2022 at 9:46 AM Tamas K Lengyel
>>> <tamas.k.lengyel@gmail.com> wrote:
>>>>
>>>> On Thu, May 5, 2022 at 4:27 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.=
com> wrote:
>>>>>
>>>>> On Wed, Apr 27, 2022 at 11:34:19AM -0400, Tamas K Lengyel wrote:
>>>>>> Need to separately specify if the reset is for the memory or for the=
 VM state,
>>>>>> or both.
>>>>>>
>>>>>> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
>>>>>
>>>>> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>>>>
>>>> Patch ping. Can this patch be merged please?
>>>
>>> Patch ping.
>>
>> Your mail (and I guess also your earlier one) was _To_ Roger, which
>> is odd since he already did provide R-b. What you're missing is a
>> tool stack maintainer ack aiui, so it may help if you send your
>> pings _To_ the respective people.
>=20
> True, but all the toolstack maintainers have been CC-d from the start.
> Is it the case that CC-ing is now officially insufficient?

No - patch submissions should still only Cc maintainers. But I think
pings, especially repeated ones, would better go To the respective
people. (And this follows my general remark I keep making every once
in a while: There's a reason there is both To and Cc, and using them
appropriately can help. Of course there's no guarantee, as people
may not pay attention at all.)

> What's the
> point of ./scripts/add_maintainers.pl then which specifically adds
> maintainers only as CC? How are you supposed to get their attention?
> Just know you specifically have to send emails to them and not the
> mailinglist? I'm getting the distinct impression that the toolstack
> side has simply become unmaintained/orphaned with no one left who
> actually is looking at the mailinglist.

While things are far from ideal (and as you likely know we're still
looking for a 2nd tool stack maintainer), I have actually got the
impression that things have improved a little lately.

Jan


