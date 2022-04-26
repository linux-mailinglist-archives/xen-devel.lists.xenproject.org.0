Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF3150F46B
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 10:36:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313526.531090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njGg7-0007sO-MX; Tue, 26 Apr 2022 08:36:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313526.531090; Tue, 26 Apr 2022 08:36:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njGg7-0007q5-IC; Tue, 26 Apr 2022 08:36:11 +0000
Received: by outflank-mailman (input) for mailman id 313526;
 Tue, 26 Apr 2022 08:36:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=urB8=VE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njGg6-0007pz-Ka
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 08:36:10 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea809fbb-c53b-11ec-8fc2-03012f2f19d4;
 Tue, 26 Apr 2022 10:36:07 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2106.outbound.protection.outlook.com [104.47.18.106]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-eq2SiM7AOMGmI1JAqQ31Ng-1; Tue, 26 Apr 2022 10:36:05 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB4029.eurprd04.prod.outlook.com (2603:10a6:803:40::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Tue, 26 Apr
 2022 08:36:04 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 08:36:04 +0000
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
X-Inumbo-ID: ea809fbb-c53b-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650962166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wE0dAcNpuab9EHgItkLtAH1Is0Jr9wHHOKbDprsJ5xg=;
	b=I21GFxN027wXN69KCAG1R2KGsEXXZPraHswOGOzwPrK7aTpf6l6IvhEz+i0sC27NixTKea
	drHzUppPiLsiIRHIh+eNqPuvV5NFLRtXMXOEVvtLmZ0PDAF1vISqXUgR6RuVWscmfg/vjd
	NyEwk1NpA+PibpZ211SEdj0s/7q62rA=
X-MC-Unique: eq2SiM7AOMGmI1JAqQ31Ng-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DoRq/TrnxBnBcE7HZDvBiqVDPDxHzbr/mIcowe0auIr1814kgJLaRq90jGjOnVxZruQ/sowY3UoE2SKjzpyhU6v/n+cmg5SaNyYmhOyI5yuqbADWxUhn34PM3CXPxf6O0T76oP9wNK3g+twf+o0cruV7ZlFOYClV4IZUtSI2CtxEkRR4P7rxrHMw2UlZPA5pQ7pMlhMus/9vADHP1clOo4x9HpKjiOkRE22sg84p2M9HcKaFHCjcNFQwT2lnOQVTekQh6zCtVbeH+GBK1pUnx1ZP7q3noPZll/XNacNpyUKELz4dc3DM13NkZgpYlBclGI7Wl9eeUtyKd/BYubiftg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VxNmv+Qb/xUW1DVBPzy4gL03WTVj/O8Is4qts9N9Tys=;
 b=AyvzC7u835b+mD8n0ddEbH3ISP8tYQ1J6A4EYd/o/5y8E7/MYnXw76K1L1e9gyq3Rlss8aUcrVp32+O/EOJ//nu3puHiNVxeGiUOEeDCoOcHghcmnYax5l6l+wYNcS/b+9c5Vo7OVfgHXgM6jVgo3T7PkQAljAc62+gI1hujwZGDgm0IG6QZlrfVaUCLB+4IbVTJ0hcxXGSG/MJXKk2ePIJJjhKk2hItsvOx089i1jkQUS2pgTgmMwqj2gmBppti1L7qp3P9fkfka0q8cvaPEumnjgRU0R8QskwL+zgbgAtFU0z+MQzmTj1jCZ/8IFDiet/7VbpON4fC3QUoutvJ5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9da91b7b-7dc4-ef2f-6e72-e921b0d5651f@suse.com>
Date: Tue, 26 Apr 2022 10:36:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4] page_alloc: assert IRQs are enabled in heap alloc/free
Content-Language: en-US
To: Julien Grall <julien@xen.org>, David Vrabel <dvrabel@cantab.net>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 David Vrabel <dvrabel@amazon.co.uk>, xen-devel@lists.xenproject.org
References: <20220425132801.1076759-1-dvrabel@cantab.net>
 <4fbc28f9-5a0e-5ed2-12a7-d2bfd63af633@xen.org>
 <afb15744-5e80-6c40-069e-6fc076e40e3d@suse.com>
 <74500983-79f8-07a9-7dcf-54a7bc162061@xen.org>
 <54e0a438-e3ce-98d6-1b7f-ce2d69d45c7a@cantab.net>
 <c5273a0c-082c-0e10-a394-fa43654f1d24@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c5273a0c-082c-0e10-a394-fa43654f1d24@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR07CA0014.eurprd07.prod.outlook.com
 (2603:10a6:20b:451::11) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c61f5f81-c599-43ed-b1c0-08da275fccd0
X-MS-TrafficTypeDiagnostic: VI1PR04MB4029:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB40291CDDC3FBC9BE6935DA00B3FB9@VI1PR04MB4029.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fDwjym9w4XLJZoVE6e2VWFuneThkDOHJRwDuBQSXYp+0/sKikEKW+qe2yHaqdoQt4Ig7M5eAnywOrgMisNxfn73db4hUv8dNg9ce8nJCqXvTGpMq8XBzZIltU5YBtnUFUpi+4sYxFdpmwILcHmPcm+qrI2yZbE7NM5TvAFU7fv52HYHoLLI1Reub7qq7naOcwollpJhDEJSXhICp4E4G4q//xz0pFmCXLjuL5jJZeewT7udfpP77fHljvqaddly+F3uXdn6E/8rbpsGSRgpJJht/hZcCHEqUfLEq8YpHUFFlgSK7UA557mM6aegNj6mvGtvsLoElE6vGY05IqdqJMX8cCmunpZ+mQolwK4v/Sjr4+dFu/aiNomxkwCeSutTfaL9sEnRV1SajsyXjmmqPrDTqEmlqeILww/uHfJNLrnPq8caA6k20BO4nC16mYj45lkdK6tQUj1FIpA7e1sk/VdKdIjc8sbwe5Ipfc0et8feKlmuMQiEqg+xReDta96OiTZHxJ73tamIWiV3A4XW9UfTfcujPKjFnRFmhXTWDYAM3ggLgeVrgU46Ms4Dpk5Xi4tD6vLajkDT9ooYd56Hv2N1RVW9vZ2FnR0iBOWayibf2vUkg1A2CrjwwfW5dygutzh9MT//Opqt6AbFeF1FGOiPrOEF36nmWeWo/LJfReUZv8/kuEVJZAZwLTxHcYVOqxbOt0NnLEN/XcEkUw5qewS/UoMsS+0QMfGELBFPQU7g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(54906003)(66946007)(6512007)(66556008)(8676002)(66476007)(4326008)(2616005)(26005)(316002)(36756003)(508600001)(53546011)(6506007)(110136005)(86362001)(186003)(83380400001)(38100700002)(2906002)(31686004)(8936002)(5660300002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?idxyGms2D+7k67xMVUVuoVyJDbSbzr/76pSszljtXgWSr7G/8J5uDlzKfjzm?=
 =?us-ascii?Q?q7vGs7TuWst2rtw0yyAVzWxA8+sIqTs3Z+YtfWJxXm+uEmq1w5qQcjlGGPUZ?=
 =?us-ascii?Q?YfFO9rADqLf1tvCFE0MtVlgKNmKYU/BcyciKNfcPWswluqZGjorQg4FTANMW?=
 =?us-ascii?Q?0L5sIueQE+t0IuBFsqpypISLnqFBpr6HhyfW0D/W6uMvPHoZHn5O/RSYVwd5?=
 =?us-ascii?Q?MSYpEl7GV2SzZyW7xzQ5silr0Jtv6gd7K8/6OZCm8lTEJl+h195gliBo0uqR?=
 =?us-ascii?Q?DaFKCXCs1c+hXfkZsLjTkRn5os9zGTp+FEtlDk9K+fVXJmsZ5g1tnKp1cl/K?=
 =?us-ascii?Q?MfElCEaz6oFvIaVZHYVaUz3NJinrsMJuzQJYhu3j8NropHfVGXCrgScacK6I?=
 =?us-ascii?Q?ZaBKCRJUI1Mlb/zFypalGqYi8Wxdl4ay7HvLJJiho73szu318JngR9VJqcLL?=
 =?us-ascii?Q?56XitBt4Hx/faO2Efu/0P13taMgm4kPCm4kytWlmRzrBxH412xFVQ/wQ/0QV?=
 =?us-ascii?Q?3DQgCRj+WJs36WSflHxUrwcZ4Sdc4hdFz6z8twbuMuN9mTIA5r0w6MgQzczw?=
 =?us-ascii?Q?w6iNOsGP5JhekI9rLF3CACJ4Wtbo7VkgMqRkbcGKObEqwU8tA8cJIb7zVIVL?=
 =?us-ascii?Q?MQY1UU6xzb+zKuI041a8trAjM5aFws3RWNwlCCTSIORKThiD/NS3OTY6zwFD?=
 =?us-ascii?Q?VkFmyqsIf9GDQfWvV1RnLrRICr7NaghreVu/0f+trW1D9xlYDQZ2ydrq+ZGh?=
 =?us-ascii?Q?I6Ov896VYZFLeq09xDPnbm3oFO3TQjNC5fIDLAheR8oQq6fBhlBwvXITw5J6?=
 =?us-ascii?Q?j9hIixSLziIGr0pRi6kxiVEDm5TVRPT/7q3x6GFhOx6d8n9NfaQzyQRwTY5e?=
 =?us-ascii?Q?xU/KutoB8KlNrWTUBs+M6PlIhazV6nFff4z+gKm0fUyUcuPXbwEyuo29Y9q8?=
 =?us-ascii?Q?/dImL5ynWAKiobZLfpXycJMgWnT+X31Ozquept3tnLsFPx6YiaRTadA3Kpzf?=
 =?us-ascii?Q?qP1uu8XdNYUYZ64x7soM1G0gKJZhtpoeKacEIDcKANqVB+6V69nQI7JFSYH1?=
 =?us-ascii?Q?9YJOMb+tj9w+spEKUyLcKoJ3nqMV+OE6s1nzUgfTSphiibdXJ6Tp7Bd3D0xD?=
 =?us-ascii?Q?nL0Y/4mOyxPGGi/RbEjLgg0fT7S8ctE3w0p/2u96EtzfpjD9INQZzp4CHlsJ?=
 =?us-ascii?Q?gqzQRWfs1gdc31ZDiBUvVx1AggDJZlAyf82nuw5KPvyFEmY1zP59uI05ca5i?=
 =?us-ascii?Q?7OErBNMH2uyv5snSkzlyYST9D5cDV5L1lzeFGyW1H7x2GWb/AoLp+O41p4g5?=
 =?us-ascii?Q?XgTh4OGhf18WM7053Pzqk4Q35SYjnmn+nDz90ybgezSQjzpL+1Nu+ZPnNX20?=
 =?us-ascii?Q?ln4lqOx6ZE8HijZNY4f8yT3FcJJfKpIM34wtnbPdybsLNaBtOxN5Z19XiE/s?=
 =?us-ascii?Q?wwb9ObLm75J6MFcGiAFxj5i9vNQgPxo1JZhUtg25f4Lq1IT9ZtFk4aMKQTiQ?=
 =?us-ascii?Q?k+64qQUESxI0+iVvf0gXOmKsEeR7fdUZqvD4xDbrf5JYaM/Y8xWsQFu2zvFs?=
 =?us-ascii?Q?o4XDteb9xUyC1nvB785//voclX1H7vYBQFpCVweBk2tTfaD2k4g6r2CUeP5A?=
 =?us-ascii?Q?6pbRYmlr2gFdlz7JF519d2b2bz6DPMOOWWjOxsJ8oF+uO+rRuX8k+rWwnyBl?=
 =?us-ascii?Q?ao76gmA9PNWVTAIZI9mM63pQ51RKy3rwPlWWkuLxJjIKYnAKjkUoaWy3BaSu?=
 =?us-ascii?Q?YtVg5O1c5g=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c61f5f81-c599-43ed-b1c0-08da275fccd0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 08:36:03.9514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xl/KR8v3vO+tEcb1yiBNvw87os6KNyiluVtVOJhDlUTQ/rfQpEKyJuEij5S/YNx2iRqKDFJFgrRAF99rrcjaSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4029

On 25.04.2022 20:32, Julien Grall wrote:
> On 25/04/2022 15:13, David Vrabel wrote:
>> On 25/04/2022 14:43, Julien Grall wrote:
>>> On 25/04/2022 14:37, Jan Beulich wrote:
>>>> On 25.04.2022 15:34, Julien Grall wrote:
>>>>> On 25/04/2022 14:28, David Vrabel wrote:
>>>>>> --- a/xen/common/page_alloc.c
>>>>>> +++ b/xen/common/page_alloc.c
>>>>>> @@ -162,6 +162,13 @@
>>>>>> =C2=A0=C2=A0 static char __initdata opt_badpage[100] =3D "";
>>>>>> =C2=A0=C2=A0 string_param("badpage", opt_badpage);
>>>>>> +/*
>>>>>> + * Heap allocations may need TLB flushes which require IRQs to be
>>>>>
>>>>> The comment needs to be updated to reflect the fact that at least Arm
>>>>> doesn't use IPI to flush TLBs.
>>>>
>>>> I thought the use of "may" was satisfying your earlier request?
>>>
>>> Maybe I read wrongly this comment... To me, anything after 'which' is=20
>>> optional (it is a non-defining clause) and describe how the TLB=20
>>> flushes works. So the 'may' here is referring to the possibility to=20
>>> use flush TLB.
>>
>> Oh dear, you're using formal grammar with a native English speaker who's=
=20
>> never seen a grammar rule in any of his schooling.
>>
>> I think this should be:
>>
>> "Heap allocations may need TLB flushes that require IRQs..."
>>
>> i.e., "that" instead of "which"
>=20
> I am fine with that.

But that's still not necessarily correct. I've gone with adding the 2nd
"may".

Jan


