Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB1E4AC30B
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 16:24:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267126.460838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH5rZ-0006vF-VB; Mon, 07 Feb 2022 15:23:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267126.460838; Mon, 07 Feb 2022 15:23:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH5rZ-0006tT-S1; Mon, 07 Feb 2022 15:23:33 +0000
Received: by outflank-mailman (input) for mailman id 267126;
 Mon, 07 Feb 2022 15:23:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=owYM=SW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nH5rY-0006t7-9q
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 15:23:32 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e82651aa-8829-11ec-8f75-fffcc8bd4f1a;
 Mon, 07 Feb 2022 16:23:31 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2058.outbound.protection.outlook.com [104.47.8.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-34-_FTcQM1QOfyTVz68aXFNOQ-2; Mon, 07 Feb 2022 16:23:30 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by HE1PR0402MB2761.eurprd04.prod.outlook.com (2603:10a6:3:e2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Mon, 7 Feb
 2022 15:23:28 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 15:23:27 +0000
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
X-Inumbo-ID: e82651aa-8829-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644247411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MCeSFh10N9Ftigv8rn7PHORI3Qhf5yu5FxYcJO10plM=;
	b=Dt7po/gF7JCN9yqbdkmIYvf7YqTM0Bam+v6C0NLO5rCIvoyIgtsc5eMQIV+HF3mzeH82Uj
	hfC1Pc8ePU3NgsnF5RE3noj8PyrpbjmOijM56mw35rLM254xjHpTAueCz3JFYruy91ciPO
	BvR7+s2ZenCS36c2e/h7x05hxhqg28E=
X-MC-Unique: _FTcQM1QOfyTVz68aXFNOQ-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZOUUs8a9G5zGMnx9HaY67MmG3iJPNmYSGXSDI/Wsbzkurxb4ALd13Y9Zq4OQx5PXODvNIheq0QXooeZCdeggBDpd23CcxGj+/4+Pq5PGnhmheDsWxIAiBCmYkp7bbWUykOoBWAe6aYnCRtmK6Y9K0pBCad22F9wVvB9qj8pNhy4Qe7pOrDzSYdYLKNhK0VStHtOU9vbmcbp5FIe5YDH0OsKMdq79bekBAIWS+bfsmR+TEJECnNqBnRPv7KpJ+2M2QB9uXNipRnTSW2u1pF7mI2Jr/1dKMOGIfRV5aDIQ51AnbeN+1XK9xiQVh0sdwHXVuRu1Hxe4WMtrd+GJk2RfDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=05l7ZYLdRIwwriqqWm0poDjmnN1jNoCs55GRcALMQKU=;
 b=cj+aWaAgbj+YNocVGT4s/z1cNK20TX2H6K2V56sQmy55S2Z66CKgdP3fEGv5HKLV4ihikFDcBmslejemL2G9sLGAxPAHshuCH2Q9Iru2qVssXHGdVye+8u1UD0VOqk59yCVzjavO5G9allORMIPW6HMKa8PTuM+CkQ6T+ml1+nDlEVB5aga7bdC0Y3Cha0Vgt7noqj0iXBI9F9vB0DfTkhEb6d7SEXQXaJYsaHcVrrXoZacZIoSJ/kHx6TSoV1poFXeKY7hefmNGemHFtTPYhlGsFZchwA+3OSfqueRXYchcbK/1pJHv3ziYE19uPzQ409gEGt29kD1rE8TLuiF4Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1425efc7-42e9-bb50-8db7-356fe1db1477@suse.com>
Date: Mon, 7 Feb 2022 16:23:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 08/16] x86/P2M: PoD, altp2m, and nested-p2m are HVM-only
Content-Language: en-US
To: George Dunlap <George.Dunlap@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
 <694a6590-0018-223a-c796-3e1469ec354a@suse.com>
 <0C051DFA-9147-42DB-AA36-0DED3D192F43@citrix.com>
 <ccc16e12-2036-d71b-5521-71685f0ab38d@suse.com>
 <E8945018-F8D5-4930-8E5B-ACBCB039BC2F@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <E8945018-F8D5-4930-8E5B-ACBCB039BC2F@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0072.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2cb19420-b091-4730-92fb-08d9ea4dca4a
X-MS-TrafficTypeDiagnostic: HE1PR0402MB2761:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0402MB2761115C8622361A4752CB87B32C9@HE1PR0402MB2761.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:800;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gnwegLlZOVFHjZACYHs25L4jY0gGWq9F2GUFu/GLc599sj/0Hv9uas0MSijt67xWAwR3/HlKxSjt5xNEpSlX/H/0ThCTRouOv33Oz9FuZrQ3dWluFih7ttP3+DwIPP3RBBOydxPh/r2FH850rC7+EoznoqQe0Sw4WU4Uk+TTm1lGLsqNWa2wl5sZ1g0plOHaOfmR1PyMSKQ+9Iw3zfSjECMLXJ9JzmCQ6rM4Gzj8nsOcDnIRxYOyeOkdaV39yjNxwrQANM4TYKKFo+gEDyqoutGx9aY9kNKhL2YUPellxptiI+P2Gu1CC+vcHE7/J65NnuTSmzf4ZHFHNl3SxUo1EM/0uGCWMlN1II6dcDe49aEo90T3IqfT4HCvtNHngBwM3f/rJj/v0zpOOJG3BKgpu30Unym5sjrUZ/Vfps+fvHl5cUbeh5rX7roFlQzVcnB3icz01NkwJhDyd9BZ3ARPXv7YuWnSsx2/qIYARFN4mCV6vnqhugw+gBsrb2JuvoHY6gFVJFs0Y7Qk0zoh8Ryr2bCrk+6VEyJRGJmDrqzobeo0u90wljhgvd5RhzA7p3vXYKPrWnvWwEYreSG8zCU9YPQf1ahotyGFXn9SZ+aA6IeGXzaS/64R+3NP4qGZpZOURvFe9kqraf6XAFARvTUk82fG1e0Fw3xy2A+QHPo5RldKxC6cIWoZ1S671Wr9oS3WcvfcLBBJg00NqxgrJ8nRON5RMdxCz7vyGSfDolZKr9w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(66556008)(4326008)(66476007)(8936002)(31686004)(8676002)(83380400001)(36756003)(508600001)(6486002)(26005)(6506007)(38100700002)(86362001)(31696002)(53546011)(5660300002)(6512007)(66946007)(2906002)(316002)(6916009)(54906003)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sIu9THsDPddUBqoErqKoYjZpX8F8AP9SBImXyJVjvO20y4FNce6jJi/oVXZd?=
 =?us-ascii?Q?bVqg4cFJAJoG+pwhAgmwRxCrFXPm3tH4jBSEJNBrXEqS63bpxwr9AN8+qKqL?=
 =?us-ascii?Q?zFnCCnJdxFhCmis6+46eiWNPAwbGufw+KrBkl3aMPx4jdmu5fI3S8S1RT2qP?=
 =?us-ascii?Q?LJ7YdMfQJQLmE6zxiyAEq767CGp1SV3iylIO0dkcW3va2mw+AT/Nf06sd2a8?=
 =?us-ascii?Q?Px6Us9GsAqI2qlNiFuUr745DMATgwb5rO3fAu0uPSf2c5FBqesKdsFRJ9HJ/?=
 =?us-ascii?Q?/dVi4Iz++q5fMsPwNMDQhQRUV2KS2nyUY88mwbwi2uDdAMS0eLNo/HKrgeHM?=
 =?us-ascii?Q?G/yFvemcwlWWdm/skAqphdL0YyHrcqWKnJtbASTqS4ovHL1/0R34I7FgXz+3?=
 =?us-ascii?Q?OQ6vaxFk1NzL9y11IqRQws09CJayFIVpIX+6juf/2JwMaxWvaMTAL9CpKLvO?=
 =?us-ascii?Q?Lvvx1Qq8hmK+ywjWYhS3AUeGWZvu1h/JsZcu7lek65TQaAWqGOSrVb9f6poI?=
 =?us-ascii?Q?a/LmEBrtw0ZBEQ/DTGflJM/y2H0MYxLQ52S3NW2epilZLJ93wsgEk0fwKqi9?=
 =?us-ascii?Q?IDUYRBQBGrhHCtkhToV6FG332EdEqjAs6uA5BrhKOA+Fi8U+Cmcs3BheCaz/?=
 =?us-ascii?Q?vQB4/AEPBPrVgUKMx5K1mRrs09vgWw/niJY8WPHXi4PakLkHXrd9KJwdrNq8?=
 =?us-ascii?Q?WupVafqjBW+HquL0i396QcOstKN5qQg/v8SlFo7YbhoeX2sQR24KFqmbJx35?=
 =?us-ascii?Q?SputDjFw4/1BtBpuBWijsDjTnB5Ut+SlqDENpBcsxTIyLdB/f9njV9Oh0b55?=
 =?us-ascii?Q?Ewtx+ihzQQKlgOM36k/TU+x/M9dSBJdiHnSIy9xHPNdrt1b+JdnwXX843xSy?=
 =?us-ascii?Q?wXSeE2KT4mVc0xLllSsBCzpEzqyq+d8gS0JrrakmX+UHHSHT2culFvMJ5XUB?=
 =?us-ascii?Q?xi8T50yN9++pqmLHaAGMyIBFrkIqd8yImNWxsmuG9yh6egOD/kVoNUc4fU5t?=
 =?us-ascii?Q?4gWR/xYvh93shpC72JPBbd57gVjY9LbUwJwS0x9zr7ol9Ke164qfBx7yeDRA?=
 =?us-ascii?Q?Z8TXrCecdGK8sdjdmFVx+hPG+ASImHVAU4N32a1DKsvpkTCLBkJ1jDiRwvXi?=
 =?us-ascii?Q?p5ELoLd9aSJgX6cSXE8buy9mT1Qu8IfrL8WbaAq7azST9IS2Q7JawSY8oqBL?=
 =?us-ascii?Q?1xL3UjWqdwoyQdkheX6KkqXoLHPcOA430wANHGl0CW4S5jET3Fl62dqIPMFn?=
 =?us-ascii?Q?Lt2ra8DlCEmePh0Wpq/zj01ADVQp16OzSczEGEfpBl9t4HyVn5izpG+QFMbI?=
 =?us-ascii?Q?s2HtmoL0l8hJ0aHDqk5CUaFvipyYoQbpXbWUDohaLQ2O/u/6TIhWtt775eAQ?=
 =?us-ascii?Q?WsVW5XZw9m6SQMT+Kkt5Y8MsCxJiUVOwsQgT3PMFOheA6qDWKHuYWKuynX31?=
 =?us-ascii?Q?cGI4qehPaD93i3GY+2a6JueTdhkQdXKWg2EaA/r1cUmakzQ7yQBG4oyLeGS4?=
 =?us-ascii?Q?aND9Puh4+HgFIj3kLDpTcxvA7uHcLdXHjk2fZckdVKa+MJjzWuE/EVyNHP6n?=
 =?us-ascii?Q?eL5P5FZoEPLstk2n4o1J2bgoqfoL2uwMZrrogxuCRv4/s1rnmiohc3frWXT2?=
 =?us-ascii?Q?vFqbViA51XXZ27fk5KsyOHA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cb19420-b091-4730-92fb-08d9ea4dca4a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 15:23:27.8464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VC/QNd9zuDqsVwQThiLpHGwdoabMLBkWPsm/ZUomx790iTks1gNo/xRnrb5d7DBfwQRAELcj8bcaxrFs9KKwBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB2761

On 07.02.2022 15:45, George Dunlap wrote:
>> On Feb 7, 2022, at 10:11 AM, Jan Beulich <jbeulich@suse.com> wrote:
>> On 05.02.2022 22:29, George Dunlap wrote:
>>>> On Jul 5, 2021, at 5:09 PM, Jan Beulich <JBeulich@suse.com> wrote:
>>>> --- a/xen/arch/x86/mm/p2m-pod.c
>>>> +++ b/xen/arch/x86/mm/p2m-pod.c
>>>> @@ -1135,6 +1135,12 @@ p2m_pod_demand_populate(struct p2m_domai
>>>>    mfn_t mfn;
>>>>    unsigned long i;
>>>>
>>>> +    if ( !p2m_is_hostp2m(p2m) )
>>>> +    {
>>>> +        ASSERT_UNREACHABLE();
>>>> +        return false;
>>>> +    }
>>>> +
>>>>    ASSERT(gfn_locked_by_me(p2m, gfn));
>>>>    pod_lock(p2m);
>>>
>>> Why this check rather than something which explicitly says HVM?
>>
>> Checking for just HVM is too lax here imo. PoD operations should
>> never be invoked for alternative or nested p2ms; see the various
>> uses of p2m_get_hostp2m() in p2m-pod.c.
>=20
> The fact remains that it doesn=E2=80=99t match what the patch description=
s says, and you=E2=80=99re making me, the reviewer, guess why you changed i=
t =E2=80=94 along with anyone else coming back to try to figure out why the=
 code was this way.
>=20
> If you want me to approve of the decision to make the check more strict t=
han simply HVM, then you need to make it clear why you=E2=80=99re doing it.=
  Adding a sentence in the commit message should be fine.

I've added a paragraph, but already after your first reply I was
asking myself whether I actually need that change here. It's
more of the "just to be on the safe side" nature, I think. But
it's been quite a while since I put this change together, so I
may also have forgotten about some subtle aspect.

Jan


