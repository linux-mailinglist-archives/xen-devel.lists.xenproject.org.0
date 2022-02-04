Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 551314A999F
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 14:04:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265510.458899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFyFx-0003Md-3A; Fri, 04 Feb 2022 13:04:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265510.458899; Fri, 04 Feb 2022 13:04:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFyFw-0003Kn-Un; Fri, 04 Feb 2022 13:04:04 +0000
Received: by outflank-mailman (input) for mailman id 265510;
 Fri, 04 Feb 2022 13:04:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1gJ0=ST=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFyFv-0003Kh-WA
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 13:04:04 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec96f9de-85ba-11ec-8eb8-a37418f5ba1a;
 Fri, 04 Feb 2022 14:04:02 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-19-iUA14Y4JNkiYSZiCvQw0SA-2; Fri, 04 Feb 2022 14:04:01 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DBAPR04MB7301.eurprd04.prod.outlook.com (2603:10a6:10:1a7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.14; Fri, 4 Feb
 2022 13:03:58 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.014; Fri, 4 Feb 2022
 13:03:58 +0000
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
X-Inumbo-ID: ec96f9de-85ba-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643979842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F5ZDGJxcxjXISvHmy4Not16q3L5iE6sMWbYjv/EzeYU=;
	b=WiHwRLKm4bhMumcISuOeuznoMIGvt5hQbvLNi15cuLw+SptrXrokdkmfWW44+P5tJ5E1Fp
	3bcI4C+StALtvh+ml+VF0yZbBPbSwyidcy1L6BKoLi3GWaNX9WTu2yI1Xg5mq1IxLoJqXG
	RSkKlAyLlrzc7U5R93FSL+/uoZsF01E=
X-MC-Unique: iUA14Y4JNkiYSZiCvQw0SA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ldkDsMFVwkuwvGeDqXn19LvBzo2wvoW7T8dTPIBG9jd0PVq/41/LXEpSwexg7t0+433iZobxRdPVwDSUv3VnStfmx4U6zex8hpP4woTAOGH4XQNug2O16PalrYTe3CqZWWRSNjfto5nWAreIUvMg05YBYqGD6g9BMWmbu4261e88uy0HDFZz26ptj/3BR5on6AZO0csM92dW5j8yPyc+kUTDa99DU7U4yXnKgTnkk8eBUP7eKoNIZw8uWGMNMSp5v43xIi7F/W8u/D4zat8kSMNxUy/Uw/fcHcWz8cg42RIYAO5Qv+3R6RuOsvXM12UVTh1uBGYrs0IsAQ37CKr0DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JseKSd140tNutMDTdDkXq+JSWQ6igfvum558lHwn68E=;
 b=bbFa/6DeAf/D8VXa31IoqBrxCno7g92TiFPEJM0hgoyIMSGN7D5rhA6LD2A1y0Vxur4NUdkx8liFFCsQ4FdA+hDvMz97xeoDbLvvcif4suMyUdfb8eQ03/gkOi+M9wqxIja3ZKilQH9YRa3zHKzXYcQB2LHX+Sv0su9OGZYLDZeB1lJxbI88xg9kHmW1F7Sc2XZeHLBTmBjNoWhzVrVIBgRnX46JuOD8ycPmCE8EvyFjxYc3OTOvxfcVaV7gv9J98HyH/pt/XBNgSmOP8CdPtPcKLFE0ICQNM+ykM6lChGV24mzxIBpCrXPz/CPMvIIMkPLCivC5e3aXC4X/I6Z6GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <655e491d-2af9-aac1-3ea6-fd0b6f1806a5@suse.com>
Date: Fri, 4 Feb 2022 14:03:55 +0100
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
 <a8fc599c-f620-c4d1-2077-c57068f46a7f@suse.com>
 <deef8468-d607-e49e-f456-6a8013329ca1@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <deef8468-d607-e49e-f456-6a8013329ca1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0117.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c23e7437-09af-4bd2-5efd-08d9e7dece8f
X-MS-TrafficTypeDiagnostic: DBAPR04MB7301:EE_
X-Microsoft-Antispam-PRVS:
	<DBAPR04MB7301C7346CB6EDEA118CD035B3299@DBAPR04MB7301.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9p436t/7XK3cJ7dq0dle75oO9OImJOi3qejc2NLFVEzHsQWW9dsdyTiBfcDJKy2p2G+W0tKrYy+Uh7UmSsdC22c8vTZ/G6wZ+d0PqKTk7cBfaKlPTRSbtiGo2ByY/tChmM0+QhpR67Q55fDpn5xj+6V0I96wyaGeyZP8VhlJs57IA/7NjSYQKRpK6CFqaxIVWe7QYjC0BzdGDUqKBK6X8wNbllmmaUgtXHYoux44mVoc4BwUpjdZXz9e/oRRpkh6AfjaUnoFIotGocso2/tccBilzK9P1U0DiqzhGe/FI42cfv7K1m237XYPcyUGj5cJ2b1Z6EcCJbQF6+1vWdXhwLNz+PLFBeBqKr8AkMypDz3zVT5lVLPzuYEGIfMf/9SxDtl7+26GQoQQBl2OvJR9ZroopjR3CyWF9Mcy5PwbEr+qbfv2WZ3wNnF49K59fNNIyYRoVEQIv7JVmBYVnZ+cJkGWoG0zNe+X9YfM6yNJbxVg+vhv1+V9It/7Sz72BSQLKME/66XBGJJNE/JcJY9L7BqidUGgMBLDVFIXgqfzfpc6E+iFo1G2BAXqHKVA3B/QTmOxF5QdMN7UjjfEbQ3Eey11pVJrQwAIGzokQlfeZe5zQ/XH+J73UKSP3csz2LZLHuDAf7RPCPLRTGxmUG8r2rEivyLeeV1ruoJ0OEpMMB8lGrzwm+Mgx5DCM9njBODmqFkRaDgWfv9bFgh3zGkNd+hCPPvbUkpViuXoEx26aWMK475dj0AWyw7GZHYtRPfB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(6916009)(38100700002)(8676002)(5660300002)(7416002)(66946007)(4326008)(83380400001)(31686004)(54906003)(186003)(8936002)(26005)(86362001)(508600001)(2616005)(6486002)(6512007)(31696002)(66476007)(36756003)(66556008)(6506007)(53546011)(6666004)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OdDG3SYl/3YfuuH184GUN910xHuDwoxMp+Pw7fqZNT4uP2A04tfHjq1UqdHJ?=
 =?us-ascii?Q?wOFaJPu0RIdwgmJXnHATHL0Nm4PvTnZhmucpCZ49pzhwZ9770baZpn2GqalL?=
 =?us-ascii?Q?xf0afCX/Krc/1vTC6ExqrIJzDmChn9JZMbyLVZunRxzAbzRTy6mCqtQxgyvv?=
 =?us-ascii?Q?fxseRUiMy77r/hzoWAKu5j4pafFf65ri7u8qG9jnpjDWi3uwy2HshJwsK+9N?=
 =?us-ascii?Q?EDsXc84e67XuBuznxu49rk/T1XZnVeUI4eywqFu+rNAC7kZkTirs1JY08J9y?=
 =?us-ascii?Q?JNcu72XPlQS+cic7i9K6X6zje1pvJBmgLJCOUGjnLLaTvuzLMIceA6D4WN80?=
 =?us-ascii?Q?7ehw16U9D1d2vb5nWi7sfZOR2KfEwPj2Nm4HkI4OtWlKWw0eg/6a+LwYF1PY?=
 =?us-ascii?Q?9u4lXz8R5g4izifgYKNPCrhOZ17UL/jSKt+cgUO8CHKXWOCiyJquPa9yEjh5?=
 =?us-ascii?Q?tAlFNAcdUgkDV1bxdTSFEIZBJtxbPQ9CVlQK+Pdnq3QdxQxBmsnyFRM98F+1?=
 =?us-ascii?Q?smobehY8rOo53tpjF6+GLdMn25rPPNK5TNE2BXE4+1wyTe8ZKbdJ72oghXh/?=
 =?us-ascii?Q?qMaCpXV4KalMdwcRCZaa2Gzy2xTJvAh7qZg56eBfeFVe4HULC8TtPIGIw/6c?=
 =?us-ascii?Q?UERajCajpbqg+DS4b/Ds+I6KPDrniIy6X1Y8VCNUNWe3c2B+Di3Jg2HJOHsa?=
 =?us-ascii?Q?rskmEUwLKLc3RfTnYP02yWE2hQuOzXJdi9KunUquRASYuPYxoyedZ05mDiEs?=
 =?us-ascii?Q?cFYyBZ7ypBQSEKrPVsRljV6H7EYCs6ki/+Uah9kMoNnQL/tW7gRQ2WV/EFZU?=
 =?us-ascii?Q?VY/UUEOmQg2gHxnjMLKtHi0ad/UtuXd+kaxw9oAsHzpMJPVFbFNdZyJL8Ztb?=
 =?us-ascii?Q?2k5/qyROJ4ZBfXfC1bgS9/20qsWtZAisqU4C6M5oRgMI3CQUJkA/HAtytGq1?=
 =?us-ascii?Q?w2osqZ8KdenU6j2MaHDJDVdU6FfwkBLqEkrw3wbZ+ic5/3x6xNQKUCyfPpEb?=
 =?us-ascii?Q?t0pHHxm2yuSu1HdmYMX5YImrjft+T2BbEdN90VKKGLLgCQeoexwP27wjc/ti?=
 =?us-ascii?Q?3ojOSS9khbHDljQ6Npi2E5aRvs0uvn2BkOD2hjm3o2RiLTb73TuB9jm19nku?=
 =?us-ascii?Q?KXfbfw3uIBidzszkqap6BDjWg/KxWbSkF5QNa1IQ9MPg0i70sqNJWZZUsOtq?=
 =?us-ascii?Q?c5L5/mts1UWC1EHJrugvgmJ3Hilwpid6zx/jyJwK7GIoHKRWqxgcmizfbyjm?=
 =?us-ascii?Q?TrhJK6RS0zhyb6A8TKilB/dkr4HMWJvPFy9+PDpZU5nwiY8pXCfnTiF8m0Rq?=
 =?us-ascii?Q?Zr+iLGfwLiWO05i/oGOM/0MOQGm2agKDVgFTvS/K/22zWvweSJ/nXo0BMrgx?=
 =?us-ascii?Q?IP4V8uIY8itRwt8u9XiSLD/KucfSs1gl0vTMhIx32xlumb9iec7iQ0T5ebxg?=
 =?us-ascii?Q?VnLV+o0KO8Arm2H1Z5g20OiiigfZxuibMlg3X22oB0LPirGjENnSt8Nq1Iio?=
 =?us-ascii?Q?dY1op03yiqchNHyZBxyYUBaHeHHTl4xB3c3ukURxYsmu28fzsRr1TjAT5qEU?=
 =?us-ascii?Q?iQHMac+1ary+M46tyLVEZvuu2tBxNiPWyiwVd0RqN2pijBn/mW0vwm6t+Mo5?=
 =?us-ascii?Q?TSabh8T66s9td8DZISYj108=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c23e7437-09af-4bd2-5efd-08d9e7dece8f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 13:03:58.5144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1CqWHDS8AKFIAjaYzgvZJPyE+KbLv4DsNYencwzC39skX0r6Cgbkz+N+GIO7bQ0wv/7w6hbVMqxtY1+a1n6cTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7301

On 04.02.2022 13:53, Oleksandr Andrushchenko wrote:
>=20
>=20
> On 04.02.22 14:47, Jan Beulich wrote:
>> On 04.02.2022 13:37, Oleksandr Andrushchenko wrote:
>>>
>>> On 04.02.22 13:37, Jan Beulich wrote:
>>>> On 04.02.2022 12:13, Roger Pau Monn=C3=A9 wrote:
>>>>> On Fri, Feb 04, 2022 at 11:49:18AM +0100, Jan Beulich wrote:
>>>>>> On 04.02.2022 11:12, Oleksandr Andrushchenko wrote:
>>>>>>> On 04.02.22 11:15, Jan Beulich wrote:
>>>>>>>> On 04.02.2022 09:58, Oleksandr Andrushchenko wrote:
>>>>>>>>> On 04.02.22 09:52, Jan Beulich wrote:
>>>>>>>>>> On 04.02.2022 07:34, Oleksandr Andrushchenko wrote:
>>>>>>>>>>> @@ -285,6 +286,12 @@ static int modify_bars(const struct pci_de=
v *pdev, uint16_t cmd, bool rom_only)
>>>>>>>>>>>                      continue;
>>>>>>>>>>>              }
>>>>>>>>>>>     =20
>>>>>>>>>>> +        spin_lock(&tmp->vpci_lock);
>>>>>>>>>>> +        if ( !tmp->vpci )
>>>>>>>>>>> +        {
>>>>>>>>>>> +            spin_unlock(&tmp->vpci_lock);
>>>>>>>>>>> +            continue;
>>>>>>>>>>> +        }
>>>>>>>>>>>              for ( i =3D 0; i < ARRAY_SIZE(tmp->vpci->header.ba=
rs); i++ )
>>>>>>>>>>>              {
>>>>>>>>>>>                  const struct vpci_bar *bar =3D &tmp->vpci->hea=
der.bars[i];
>>>>>>>>>>> @@ -303,12 +310,14 @@ static int modify_bars(const struct pci_d=
ev *pdev, uint16_t cmd, bool rom_only)
>>>>>>>>>>>                  rc =3D rangeset_remove_range(mem, start, end);
>>>>>>>>>>>                  if ( rc )
>>>>>>>>>>>                  {
>>>>>>>>>>> +                spin_unlock(&tmp->vpci_lock);
>>>>>>>>>>>                      printk(XENLOG_G_WARNING "Failed to remove =
[%lx, %lx]: %d\n",
>>>>>>>>>>>                             start, end, rc);
>>>>>>>>>>>                      rangeset_destroy(mem);
>>>>>>>>>>>                      return rc;
>>>>>>>>>>>                  }
>>>>>>>>>>>              }
>>>>>>>>>>> +        spin_unlock(&tmp->vpci_lock);
>>>>>>>>>>>          }
>>>>>>>>>> At the first glance this simply looks like another unjustified (=
in the
>>>>>>>>>> description) change, as you're not converting anything here but =
you
>>>>>>>>>> actually add locking (and I realize this was there before, so I'=
m sorry
>>>>>>>>>> for not pointing this out earlier).
>>>>>>>>> Well, I thought that the description already has "...the lock can=
 be
>>>>>>>>> used (and in a few cases is used right away) to check whether vpc=
i
>>>>>>>>> is present" and this is enough for such uses as here.
>>>>>>>>>>      But then I wonder whether you
>>>>>>>>>> actually tested this, since I can't help getting the impression =
that
>>>>>>>>>> you're introducing a live-lock: The function is called from cmd_=
write()
>>>>>>>>>> and rom_write(), which in turn are called out of vpci_write(). Y=
et that
>>>>>>>>>> function already holds the lock, and the lock is not (currently)
>>>>>>>>>> recursive. (For the 3rd caller of the function - init_bars() - o=
toh
>>>>>>>>>> the locking looks to be entirely unnecessary.)
>>>>>>>>> Well, you are correct: if tmp !=3D pdev then it is correct to acq=
uire
>>>>>>>>> the lock. But if tmp =3D=3D pdev and rom_only =3D=3D true
>>>>>>>>> then we'll deadlock.
>>>>>>>>>
>>>>>>>>> It seems we need to have the locking conditional, e.g. only lock
>>>>>>>>> if tmp !=3D pdev
>>>>>>>> Which will address the live-lock, but introduce ABBA deadlock pote=
ntial
>>>>>>>> between the two locks.
>>>>>>> I am not sure I can suggest a better solution here
>>>>>>> @Roger, @Jan, could you please help here?
>>>>>> Well, first of all I'd like to mention that while it may have been o=
kay to
>>>>>> not hold pcidevs_lock here for Dom0, it surely needs acquiring when =
dealing
>>>>>> with DomU-s' lists of PCI devices. The requirement really applies to=
 the
>>>>>> other use of for_each_pdev() as well (in vpci_dump_msi()), except th=
at
>>>>>> there it probably wants to be a try-lock.
>>>>>>
>>>>>> Next I'd like to point out that here we have the still pending issue=
 of
>>>>>> how to deal with hidden devices, which Dom0 can access. See my RFC p=
atch
>>>>>> "vPCI: account for hidden devices in modify_bars()". Whatever the so=
lution
>>>>>> here, I think it wants to at least account for the extra need there.
>>>>> Yes, sorry, I should take care of that.
>>>>>
>>>>>> Now it is quite clear that pcidevs_lock isn't going to help with avo=
iding
>>>>>> the deadlock, as it's imo not an option at all to acquire that lock
>>>>>> everywhere else you access ->vpci (or else the vpci lock itself woul=
d be
>>>>>> pointless). But a per-domain auxiliary r/w lock may help: Other path=
s
>>>>>> would acquire it in read mode, and here you'd acquire it in write mo=
de (in
>>>>>> the former case around the vpci lock, while in the latter case there=
 may
>>>>>> then not be any need to acquire the individual vpci locks at all). F=
TAOD:
>>>>>> I haven't fully thought through all implications (and hence whether =
this is
>>>>>> viable in the first place); I expect you will, documenting what you'=
ve
>>>>>> found in the resulting patch description. Of course the double lock
>>>>>> acquire/release would then likely want hiding in helper functions.
>>>>> I've been also thinking about this, and whether it's really worth to
>>>>> have a per-device lock rather than a per-domain one that protects all
>>>>> vpci regions of the devices assigned to the domain.
>>>>>
>>>>> The OS is likely to serialize accesses to the PCI config space anyway=
,
>>>>> and the only place I could see a benefit of having per-device locks i=
s
>>>>> in the handling of MSI-X tables, as the handling of the mask bit is
>>>>> likely very performance sensitive, so adding a per-domain lock there
>>>>> could be a bottleneck.
>>>> Hmm, with method 1 accesses serializing globally is basically
>>>> unavoidable, but with MMCFG I see no reason why OSes may not (move
>>>> to) permit(ting) parallel accesses, with serialization perhaps done
>>>> only at device level. See our own pci_config_lock, which applies to
>>>> only method 1 accesses; we don't look to be serializing MMCFG
>>>> accesses at all.
>>>>
>>>>> We could alternatively do a per-domain rwlock for vpci and special ca=
se
>>>>> the MSI-X area to also have a per-device specific lock. At which poin=
t
>>>>> it becomes fairly similar to what you propose.
>>> @Jan, @Roger
>>>
>>> 1. d->vpci_lock - rwlock <- this protects vpci
>>> 2. pdev->vpci->msix_tbl_lock - rwlock <- this protects MSI-X tables
>>> or should it better be pdev->msix_tbl_lock as MSI-X tables don't
>>> really depend on vPCI?
>> If so, perhaps indeed better the latter. But as said in reply to Roger,
>> I'm not convinced (yet) that doing away with the per-device lock is a
>> good move. As said there - we're ourselves doing fully parallel MMCFG
>> accesses, so OSes ought to be fine to do so, too.
> But with pdev->vpci_lock we face ABBA...

I didn't say without per-domain r/w lock, did I? I stand by my earlier
outline.

Jan


