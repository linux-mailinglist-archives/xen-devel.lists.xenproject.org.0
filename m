Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1525B4A997C
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 13:48:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265477.458855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFy0J-0007bM-Vp; Fri, 04 Feb 2022 12:47:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265477.458855; Fri, 04 Feb 2022 12:47:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFy0J-0007ZJ-QJ; Fri, 04 Feb 2022 12:47:55 +0000
Received: by outflank-mailman (input) for mailman id 265477;
 Fri, 04 Feb 2022 12:47:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1gJ0=ST=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFy0I-0007ZD-Bd
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 12:47:54 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aaa73076-85b8-11ec-8f75-fffcc8bd4f1a;
 Fri, 04 Feb 2022 13:47:52 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-22-LC6myEc5N1q0zJlgVMKmWQ-1; Fri, 04 Feb 2022 13:47:51 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB6513.eurprd04.prod.outlook.com (2603:10a6:208:178::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.14; Fri, 4 Feb
 2022 12:47:49 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.014; Fri, 4 Feb 2022
 12:47:49 +0000
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
X-Inumbo-ID: aaa73076-85b8-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643978872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YV+dG3qhJMPbTBxOksQyLr5gmXVQM7TVWOV+WFW2YKY=;
	b=NfE+HgfzF2WDVxYaTtbf8pudR9pep/6v9FsVpWEXf1ijlJmuymIVD7LTlMiPgI10Rv04KP
	bHmKbrpB74zGdES35HQQ+LDqtK11sUaSa5THj7tyBln0eGaKmLsWY4WSsM+inByBlL4n+T
	7vlSrYPIe630PGcfmxAE3MUYI6uH79w=
X-MC-Unique: LC6myEc5N1q0zJlgVMKmWQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R5suSWb73ptc91CG4Ut6a16B/YIA4FCNpij56StdKuz4SlHfL2E14cydZXcIETkUjoJE3ZYpOE0TQZoJRxStx/BgTSMWhRr4drWdUUm1ifjLPPEHKltU7Cs7ZTe1ORh9eNEZda2BmgLqZoIlzEy1L/68/ft7Zu8S+FHsWRC5vqMm0Oq2hUxGd3VwQ0tIQaCIPMeOKpk5wfGeYhQ5mbgW8dcWacKKAi4l19s7UDMttKveyyWEAaWsxeF4Me2ShjGpgkHyOXfPXhOl3xvn0sEYfgu3oMkgB9Uxb5iZYAX8tQq6NAcPi5PNvTE2cBLp4+1q+Jvki1oWiY0rRHlGR2ckYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hO1IzpY8C4sOIILpU08w1gKMfn4ieRR8a3HMoQZgoxg=;
 b=RWfD9WJ45nKxhHC2GFlZO9C+0WzIK+twwRFTL/DBlqGYppi5xUIk0z8fRMjlwjhe1lCUnl+3+EEExsEUFb/UljAkSnU9YFjTs40nwZmFXQxByvx/Sga0qMG6EfuqodTB9RHxP4B6OUagWo4by650iH+Zh26MVEdMv6F90pLFih0FSDAufKygQkQ1mhvBfF8o2XTEVo4LZtxEKG4vF81zMlW4p++NgjkXd38gziYE7hpjXC6pBdq5XvSojh6LpIUeM3MLQ4D43lxgeRco7yhDvOl3/tAVFZHWP0T1v8pFlB+xR8eMMXPs3YLRJnYi+fYDSwnT4yYeiTofSRw7HZ7cSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a8fc599c-f620-c4d1-2077-c57068f46a7f@suse.com>
Date: Fri, 4 Feb 2022 13:47:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-4-andr2000@gmail.com>
 <7209889d-8f17-61cc-72a4-97f6dbc1d54d@suse.com>
 <2cf022f8-b000-11b7-c6b9-90a56bc6e2ea@epam.com>
 <04726915-f39f-9019-436e-4399533c9fc3@suse.com>
 <9ed3f4ac-0a2d-ed45-9872-7c3f356a469e@epam.com>
 <c3a99712-cf7c-37da-aac1-f2ee00e6d53b@suse.com>
 <Yf0KcVD8W05A4fbB@Air-de-Roger>
 <1ed0e342-16cd-2f16-c05c-186667a22762@suse.com>
 <7e3562b5-fc67-f213-e872-f211450d9e2e@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7e3562b5-fc67-f213-e872-f211450d9e2e@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P194CA0046.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4376466-fd3b-4a58-0b02-08d9e7dc8d0e
X-MS-TrafficTypeDiagnostic: AM0PR04MB6513:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB6513711A90532E1C09A95E84B3299@AM0PR04MB6513.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YbVNqMlHRsDK2vTfDCnEdF6a2/jjSSwFKPRhy8OTMjksxnR/zRh+awMhl9yP0iE46aDz2Rqm8cI9ciKWNqQuhnkncrFzK16IZtNgPheGxIS1DsWit0LFHcty4at9NMr5xgWMjb0ALYU1XluNhFLZBsa8qTgtQ/P1rQCy6mWHUEO8GO1ehTW9vm4E4w5lGpuIfoWZbWhpY8ChwCVCYRTR/Q1Ra/iIca6YHs6JP1C9kVCRuRaDT3+KvWGvIikn3m38IZ5WhRh1ZoNXh1OeJFsdavVJ3GVgfLl0gcv9ekzaxXTvXe5HLKkH0wlBuwNILGrwTmbT/b5ZF5034ZTK7y5j2Cg9MtGMvFjKBtqhP/5ll2zk6Hjrb+aaJ0xboTSinadN4g9cws0ure4GYjr2V5Qch5OVGQTXiFi8t0zh3maz6clmwizuyphs0bDPw4i1g3BM6DmRefCZNfZzQGi4qB0/uBekBhsarmNBKQNNa0AFMnw8tn4XFtuCa454jla+uvE11olfDCobXWToYPU+JLseoTUh9Os2hTfqxGW7UOCOSQPB1t9ehoQbOIsaqtOtMAdgjjUdNO2VhfDerwkWQsF3nQ8aJ96GcDDSGG1bYTkjDqAZ0zJkoEs2q+ZHe9PLuXiVibu+JSuO/SOLvK94jurycjdwPJUfQPY1TPmGOr3XgJ2ypb4EaZcQqMWpfIUaacIQP7RmuRhOLfscA2OpOVdVWNGwfGDZhLZyo+VUvdpWHeU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(2616005)(66556008)(6512007)(6486002)(31696002)(8936002)(86362001)(26005)(186003)(6666004)(6506007)(53546011)(2906002)(66476007)(36756003)(6916009)(8676002)(4326008)(5660300002)(7416002)(38100700002)(31686004)(54906003)(83380400001)(316002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LwcBfEHdZwDkgiSxNcxpfn5Npd/bRKg2L7gLLC0iCTsFzj37ewVe5CXRXmRZ?=
 =?us-ascii?Q?C3iN0zq2CY3hbk1z4EjrS79qmScwLJQhrOekQB3ACQM0/eq2+7wNGcQvhZmf?=
 =?us-ascii?Q?ruzc65KM0aW5oyzZIHTepTtb6CZZa/Ve/kqkqPErrHQHBeJVWe1z4Oue+XNb?=
 =?us-ascii?Q?JAkJ7zdGnx61QpTRNkg4yuw26lD0vGv6+9DlhMJ64xD3q3WxeXUym9c3bEDW?=
 =?us-ascii?Q?IBQYEAhgB/EJGx5Hcwdn76Pxd9vY5HbL50C6TiBilbA35CMPzjkbdAqrCe4q?=
 =?us-ascii?Q?qRDSXCBFmtPqNisjWPqkAAIc0rUZzZZiiGndj71YjSJ8diG9t8DH+hVLhRJZ?=
 =?us-ascii?Q?sE3+k3DUKjGHC5Nxg8QuJ1vQnDx9l0STlw4+XkfyUqdA6s43j4cI8UR1s8TP?=
 =?us-ascii?Q?yGccOayPzH1Cd6CzH/NODbm1aYlJwaiEX7UWGTNWKKOqWelM65/cp+kMtCCX?=
 =?us-ascii?Q?jyD9XkXZ2nUV+k/E61r59wFAbWmr4Z3ieMYUdHoUeW+Y5sgcoBEUbZpi6Gw1?=
 =?us-ascii?Q?ga0iyFEXKn8ABQVvJaOgTl32/5ySI8gX2md87S3ST1JBJ0t5Kxd60lkiTaRH?=
 =?us-ascii?Q?auOBMZ/xYQe3bVFm7Jrh07sXB7sn7sVwoXX9VFrtHJgHK3omCH3Q2+HeiRfC?=
 =?us-ascii?Q?yQnwEUwIyNnN8TW/k7vt7kIbwMPtPw1iZwacTeZ5pfrfCfGcvaHJUJM0NQb6?=
 =?us-ascii?Q?RF0W3NdP7jcD8PYYXFDD4+8va/SJhobidxF1aaq6L9QkUkBAAJhSomQOSTUw?=
 =?us-ascii?Q?5ImJsu3j0w1ScKd2YdUH4vPuZX6L1x88KZzJe4vQjWodjBzRNK7Q1S3uVuXF?=
 =?us-ascii?Q?gRO5IU2PARpViyaCqHVrMMnGbA0/+cDUqkDBgULhNi6tpoBGzJvzDgPBhCFz?=
 =?us-ascii?Q?GHgS5LS7u114wrUU9UuBeGTrPNvzVKtJgm6p6+oGEEnlt0Mn+v/ojCsSbZvj?=
 =?us-ascii?Q?9f0UaqecsH5Q4DY3EXA8uQFJB4+NlGR4waxACdzSKsV4GSYxQh8r/qzDYtbb?=
 =?us-ascii?Q?LQREP7UZ0ZseWncZSA4CVFI31vJjnc24Z/y5ZW2nGsy4SBrARgwFtdTvbBLN?=
 =?us-ascii?Q?ph5GKA3trPGLBocwCqr/7jo0yI0IzwExsIfukUL9/RjLaznUCLQN7pEqc6PX?=
 =?us-ascii?Q?QV5mzo/BYLIC1EvokwHElitIQeFYgSTz/uMsXvhec5rD6MKrU+Vyhw9sl5NU?=
 =?us-ascii?Q?1Jc9n3tD68EbAStt6ojzCbv0Ts7ZKPYtyiVDq5mmc7jI9lil7vaIHqe/Sejr?=
 =?us-ascii?Q?x7a9F7fbEFWVbpJ6NmctaehK2/hG9Nx262Njt6w9nGBSyv9IouPNfavZxStp?=
 =?us-ascii?Q?Z9L166QVUIfTL7r2/+1AX7BbPEfFcrwanUe6/VWOFSuoUyc+6FyPqvu/5cxL?=
 =?us-ascii?Q?XMj0+AjP1UD0eLsWlBiP583a5n+cbbqLF9elyhHwaoFu+dG6V6OCHl9jXofN?=
 =?us-ascii?Q?ByJuEeUufhpU/X0Lz3pCKyAfkZ+TUbleGwhnlRjfto2h6sSrVqixaYBZEGmr?=
 =?us-ascii?Q?jRUPjrP0xQreCQEgRGsh2orPTWOZaKdsk4wCzaj/Vmy2uo93BXaJfKAPCclO?=
 =?us-ascii?Q?5nRQyIaQJ23qBdiCf/zSiqR5BZ52UkVLZk3NjO+GPP6ZuLzB+h2z24zrdRMt?=
 =?us-ascii?Q?xHfFLh5Zm2D4C+0KmW3aUFE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4376466-fd3b-4a58-0b02-08d9e7dc8d0e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 12:47:49.6214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aYAe4JGdHZqsqOAJa3PSY9IbruwS/I6KjlRNZxpNVsW2vD/8zJH0HysVvyFFE+YF2dCVJ06Y273YZOFRykC/ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6513

On 04.02.2022 13:37, Oleksandr Andrushchenko wrote:
>=20
>=20
> On 04.02.22 13:37, Jan Beulich wrote:
>> On 04.02.2022 12:13, Roger Pau Monn=C3=A9 wrote:
>>> On Fri, Feb 04, 2022 at 11:49:18AM +0100, Jan Beulich wrote:
>>>> On 04.02.2022 11:12, Oleksandr Andrushchenko wrote:
>>>>> On 04.02.22 11:15, Jan Beulich wrote:
>>>>>> On 04.02.2022 09:58, Oleksandr Andrushchenko wrote:
>>>>>>> On 04.02.22 09:52, Jan Beulich wrote:
>>>>>>>> On 04.02.2022 07:34, Oleksandr Andrushchenko wrote:
>>>>>>>>> @@ -285,6 +286,12 @@ static int modify_bars(const struct pci_dev =
*pdev, uint16_t cmd, bool rom_only)
>>>>>>>>>                     continue;
>>>>>>>>>             }
>>>>>>>>>    =20
>>>>>>>>> +        spin_lock(&tmp->vpci_lock);
>>>>>>>>> +        if ( !tmp->vpci )
>>>>>>>>> +        {
>>>>>>>>> +            spin_unlock(&tmp->vpci_lock);
>>>>>>>>> +            continue;
>>>>>>>>> +        }
>>>>>>>>>             for ( i =3D 0; i < ARRAY_SIZE(tmp->vpci->header.bars)=
; i++ )
>>>>>>>>>             {
>>>>>>>>>                 const struct vpci_bar *bar =3D &tmp->vpci->header=
.bars[i];
>>>>>>>>> @@ -303,12 +310,14 @@ static int modify_bars(const struct pci_dev=
 *pdev, uint16_t cmd, bool rom_only)
>>>>>>>>>                 rc =3D rangeset_remove_range(mem, start, end);
>>>>>>>>>                 if ( rc )
>>>>>>>>>                 {
>>>>>>>>> +                spin_unlock(&tmp->vpci_lock);
>>>>>>>>>                     printk(XENLOG_G_WARNING "Failed to remove [%l=
x, %lx]: %d\n",
>>>>>>>>>                            start, end, rc);
>>>>>>>>>                     rangeset_destroy(mem);
>>>>>>>>>                     return rc;
>>>>>>>>>                 }
>>>>>>>>>             }
>>>>>>>>> +        spin_unlock(&tmp->vpci_lock);
>>>>>>>>>         }
>>>>>>>> At the first glance this simply looks like another unjustified (in=
 the
>>>>>>>> description) change, as you're not converting anything here but yo=
u
>>>>>>>> actually add locking (and I realize this was there before, so I'm =
sorry
>>>>>>>> for not pointing this out earlier).
>>>>>>> Well, I thought that the description already has "...the lock can b=
e
>>>>>>> used (and in a few cases is used right away) to check whether vpci
>>>>>>> is present" and this is enough for such uses as here.
>>>>>>>>     But then I wonder whether you
>>>>>>>> actually tested this, since I can't help getting the impression th=
at
>>>>>>>> you're introducing a live-lock: The function is called from cmd_wr=
ite()
>>>>>>>> and rom_write(), which in turn are called out of vpci_write(). Yet=
 that
>>>>>>>> function already holds the lock, and the lock is not (currently)
>>>>>>>> recursive. (For the 3rd caller of the function - init_bars() - oto=
h
>>>>>>>> the locking looks to be entirely unnecessary.)
>>>>>>> Well, you are correct: if tmp !=3D pdev then it is correct to acqui=
re
>>>>>>> the lock. But if tmp =3D=3D pdev and rom_only =3D=3D true
>>>>>>> then we'll deadlock.
>>>>>>>
>>>>>>> It seems we need to have the locking conditional, e.g. only lock
>>>>>>> if tmp !=3D pdev
>>>>>> Which will address the live-lock, but introduce ABBA deadlock potent=
ial
>>>>>> between the two locks.
>>>>> I am not sure I can suggest a better solution here
>>>>> @Roger, @Jan, could you please help here?
>>>> Well, first of all I'd like to mention that while it may have been oka=
y to
>>>> not hold pcidevs_lock here for Dom0, it surely needs acquiring when de=
aling
>>>> with DomU-s' lists of PCI devices. The requirement really applies to t=
he
>>>> other use of for_each_pdev() as well (in vpci_dump_msi()), except that
>>>> there it probably wants to be a try-lock.
>>>>
>>>> Next I'd like to point out that here we have the still pending issue o=
f
>>>> how to deal with hidden devices, which Dom0 can access. See my RFC pat=
ch
>>>> "vPCI: account for hidden devices in modify_bars()". Whatever the solu=
tion
>>>> here, I think it wants to at least account for the extra need there.
>>> Yes, sorry, I should take care of that.
>>>
>>>> Now it is quite clear that pcidevs_lock isn't going to help with avoid=
ing
>>>> the deadlock, as it's imo not an option at all to acquire that lock
>>>> everywhere else you access ->vpci (or else the vpci lock itself would =
be
>>>> pointless). But a per-domain auxiliary r/w lock may help: Other paths
>>>> would acquire it in read mode, and here you'd acquire it in write mode=
 (in
>>>> the former case around the vpci lock, while in the latter case there m=
ay
>>>> then not be any need to acquire the individual vpci locks at all). FTA=
OD:
>>>> I haven't fully thought through all implications (and hence whether th=
is is
>>>> viable in the first place); I expect you will, documenting what you've
>>>> found in the resulting patch description. Of course the double lock
>>>> acquire/release would then likely want hiding in helper functions.
>>> I've been also thinking about this, and whether it's really worth to
>>> have a per-device lock rather than a per-domain one that protects all
>>> vpci regions of the devices assigned to the domain.
>>>
>>> The OS is likely to serialize accesses to the PCI config space anyway,
>>> and the only place I could see a benefit of having per-device locks is
>>> in the handling of MSI-X tables, as the handling of the mask bit is
>>> likely very performance sensitive, so adding a per-domain lock there
>>> could be a bottleneck.
>> Hmm, with method 1 accesses serializing globally is basically
>> unavoidable, but with MMCFG I see no reason why OSes may not (move
>> to) permit(ting) parallel accesses, with serialization perhaps done
>> only at device level. See our own pci_config_lock, which applies to
>> only method 1 accesses; we don't look to be serializing MMCFG
>> accesses at all.
>>
>>> We could alternatively do a per-domain rwlock for vpci and special case
>>> the MSI-X area to also have a per-device specific lock. At which point
>>> it becomes fairly similar to what you propose.
> @Jan, @Roger
>=20
> 1. d->vpci_lock - rwlock <- this protects vpci
> 2. pdev->vpci->msix_tbl_lock - rwlock <- this protects MSI-X tables
> or should it better be pdev->msix_tbl_lock as MSI-X tables don't
> really depend on vPCI?

If so, perhaps indeed better the latter. But as said in reply to Roger,
I'm not convinced (yet) that doing away with the per-device lock is a
good move. As said there - we're ourselves doing fully parallel MMCFG
accesses, so OSes ought to be fine to do so, too.

Jan


