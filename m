Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B81E34B535D
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 15:31:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272362.467173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJcNz-0005CZ-Fi; Mon, 14 Feb 2022 14:31:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272362.467173; Mon, 14 Feb 2022 14:31:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJcNz-00059u-Cm; Mon, 14 Feb 2022 14:31:27 +0000
Received: by outflank-mailman (input) for mailman id 272362;
 Mon, 14 Feb 2022 14:31:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KkXt=S5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nJcNy-00059e-1q
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 14:31:26 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9591d17-8da2-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 15:31:24 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2057.outbound.protection.outlook.com [104.47.14.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-XS9JKTohNHygPYYJahPdEw-1; Mon, 14 Feb 2022 15:31:23 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by GV1PR04MB9199.eurprd04.prod.outlook.com (2603:10a6:150:2a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Mon, 14 Feb
 2022 14:31:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Mon, 14 Feb 2022
 14:31:20 +0000
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
X-Inumbo-ID: c9591d17-8da2-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644849084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g49lSleL0N+LCM5o0WC5yqxYazkTD0zCKYRZ6P4Zzrg=;
	b=lpTAFbJQDYUxvyWbVZwZIKhC0duHDLbezUqzi0FwFCaFHJlB+0V3Kv5oSeaf5mK9AkHbw+
	hEG9j5kUCbSYqU1XNMEhmSZP+sc87dzYj5c5LWf2Fz2RelBUAfoUui71gNVZh+onBtyaum
	2qvvY4VNQ2WaBYGLSSSS2idee6cKTjU=
X-MC-Unique: XS9JKTohNHygPYYJahPdEw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K/xUSclmp4gqg1inHyyZSSxRQ3C/mfSwAsPt8MVNj48ZR78HHpy8aiy6CRHICsP6rZ176saKbTsw7tVljGnCpbkJIGrtCZeqLq0Lj6+QoTvoqPmN2gIK3Dxh8pF3GJE8qSXGe86mWDKEAe/pWf0i66kXjXfGeZlTVYI8CvCh2R+Rr16w3vXlN4br1eLhPaGeUItcWTzht/hEjE2+VoaFhORQPNcubEFc88xqd4Ol29R1zqc+kusTGXlEAmJuQ/ortYz45AszfZFFky8YofTP0r3vY2idf+hsdYRdYnTvlgdgOAYOjzgoppAkhj8JmsyJXdWzo4HlGaTq8cHOQOV+Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9bX+Bm6Kq+UGImw8PzonFban3IJbCKjlxzEsURkdbNU=;
 b=WB2ahwc/jOwxo37OlT4Q0T4bOVq/ScBN0m5+hCFDSK3/8lluugCc0JyGSNveGLI22JK/nkCF08UILsDRefJW6k5wJps6Wh/tIXG9k8DDPJapjOE5RGLsqkzII2p5Mnvh987l5lNH0qnbxGkKJpempJdMJV3n5baB303N+jhNeNY0to1ukdbBfxApcJVCZQHIqe1qj68RQjgYEp8YW/sBegHI3Fi/9MqCNPN2EIVZqkjeDUDvisFyngtMi+s/5RcKqxk6wu06ebm9odfrAJ5rWRKZY5PFU/cjDLNp3REE9a5IvhomB3UaOW6u9LqQorRhD+HgsTKATB1mvHw9dD1wIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7a9c9ed1-3c10-247d-ee7b-c2f47dee1f38@suse.com>
Date: Mon, 14 Feb 2022 15:31:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] vpci: introduce per-domain lock to protect vpci structure
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220209133627.959649-1-andr2000@gmail.com>
 <77f818a7-fe8a-20e5-3f1c-8fb7aef7984b@suse.com>
 <40feb747-c459-2a2d-6ca1-ac9f8fea47e3@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <40feb747-c459-2a2d-6ca1-ac9f8fea47e3@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0136.eurprd06.prod.outlook.com
 (2603:10a6:20b:467::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cab48b42-1145-4246-00ad-08d9efc6ab34
X-MS-TrafficTypeDiagnostic: GV1PR04MB9199:EE_
X-Microsoft-Antispam-PRVS:
	<GV1PR04MB919994468F972BAF1772C507B3339@GV1PR04MB9199.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gSjG3Jw3yh+LxRp+g86S5e0VzPpL4Kv02CPm1wTE6K0vw2tlICEmvt+flrWtrBjMNfzpKcAp61wVyKCqiDORNPbFzhEeQEJBQgg0xpPeNI0aRS4YXcOBekfJv922jSq7/IY1xjVEhuGUVh4M4IL3UW8moeLLrQqPuMUjSfNyzVFlvQI6JGszwc63G1EKBY/0EwqhrfczGXQ/ocSAA+F1DyxVbBw04UPKGXCGGCy4I0aYATMb8sVY++1ps1dFkf+cKpN2HKaVfsy74AVanIAwW5vrrkCWsLHpVkaMMoCehJBZY2IGIumrYojU2snVJRwzmvfieJK/p/ghEILg5BFSdxr++e0bro/pWqnwhakzJXWjaSzgx37eHhrHSkPdgS7Dd6nUgBHcuT0bgU67aPpSSRxwBrkKcLgg8XPCvDS5ZyzyhmmTatCKtm3SjVl17Fd74zp4y0lFPWzrGrqgf9vGpE7lkA3QOXgHbtFZdOoCYTDTVx2adgUlNbGdZaryr0WAXZZuZfoTB+qui5lRQNO5erdTbvVY7PiBhZ+voYjisaromP3yKFS02sHy8QuGetL/f9DvWrGyAY+VtrmYdf4YLkO3ljgCeop5JIqJ9+xMzobYjgVljw847+1dt5qHTjJ5CScWLLZwsFfEzWh1i4Eyj6S7qW9uv+EVI3T8/gs+1V+8LfdWTucJgf2frNFZ2xSunRHPCi4cRDZB2DfCbnAITZlzxzw5X3LCI7xUBAV6ipw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(316002)(86362001)(6916009)(83380400001)(54906003)(66556008)(66946007)(8676002)(186003)(26005)(4326008)(66476007)(53546011)(2906002)(38100700002)(31686004)(6486002)(6506007)(7416002)(5660300002)(8936002)(2616005)(508600001)(6512007)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GSYKQ4CiLv7mcp9Bc7Ih/D+SAoS5CqdRs3z7G8/8K+362kwyKkISjVeoO0TT?=
 =?us-ascii?Q?dJI1nU8lfNkVyr385jXuhMJp9bTMWw6JNdA7PftCpXCsXZBISKQbDlBAa/e9?=
 =?us-ascii?Q?xxiEaMTyOkOYYes+0CR5b4+TedBSOcEsW4/ZFm9qpF+rV6NuCBMLvoSeu/Zf?=
 =?us-ascii?Q?n39o52T20GbgXBUUd8vsrVJEjX6+lDNyfM3Eww6vozLxHKvLh8v8PWeI21uZ?=
 =?us-ascii?Q?o0I9sxEeh5pT+ZofNeeeLV4hg7Cu/q+tMAT7FoN/Au/1h9cmtxgkMRaTNfNM?=
 =?us-ascii?Q?WzFF7SZJvSi0DLAaFLawdgtzxTjNwweLzR2Qolj8dtLZih29el/xRloEvD92?=
 =?us-ascii?Q?9c/Gv7LPHiKbFQXy7HINl9qtYS0OMNfbWJfU3wSy9LWd98Qu5L8wW2GA7ZnQ?=
 =?us-ascii?Q?+2uqxDmSBpN5KDyRM15aPZ4CuzmSoA8zp56q8oOmvEXEafbs7qduSuFpjQK/?=
 =?us-ascii?Q?7glsCgrlY/psdQAn0xGBl8Hf0x9FTdiTkkjE80uoYsCfit2Bdqfyu5V9LkM/?=
 =?us-ascii?Q?R4cvm9uHr/SCZR6u2u9JroO2iKqf5hKhfSqSUkdbouq/BKVfM4EA8B5d1/U3?=
 =?us-ascii?Q?pQihO+cDxl34l5URl6FjrHTAgU4ZFwg5a3gTxQ2n2/ywYBoQmTFeuxGVa4FD?=
 =?us-ascii?Q?or5cHMGVZawC44z+x35i5VDDuUDEPBDE++vazJtiqJ8SEvxQzC/9Lm2+ty6j?=
 =?us-ascii?Q?QKVxhN2D4mDfHbAO/ouNjpsa8R5iwh26MQbUA+PoZqpbMB8a9vlybbrNGHTa?=
 =?us-ascii?Q?2sci1WnQ1G+Bv8tcRbncA2jghWc5CqExQZhtHEk1pSgrj9KVTXJ+4D7uf8o5?=
 =?us-ascii?Q?96P+xVISUlAV0kkpdFxRYqJTOGIka7V1N/ex4HELSfk2q6+EF0NBCGepTAGQ?=
 =?us-ascii?Q?wlpbz0TVCXHmC5KrruO1l3qXf3HWHY1zOwbcbJKC1RyRv+wepqssQCfJLzEE?=
 =?us-ascii?Q?jPWEvByNijkXeZ3u8HS6kcCYmj8x3b+7E/ZSGnLMVUDq7+yoj6EelBxQ3biE?=
 =?us-ascii?Q?X5MYNHy/q+vi9Nuvjyry0sOPBUHBDRB1qX/8Hj8nwyMxGSLOnN+CULnLKnZF?=
 =?us-ascii?Q?XHWVvag0kkFO33IazKKRrvg3NppwuGKFNaU1LFBRsz5injHNTHvHd/JMStii?=
 =?us-ascii?Q?VI+CmLxQBZW55rmdh4xWZZrDcG58NtH8LAkX6Ixa3ldCeWGllHzJvNG6lqa7?=
 =?us-ascii?Q?0KxHjoOGvr+WrQSHEJYG98OKuz2eGzxW4DGtNT1bv8dxCNzZ1o0M0v/b5krq?=
 =?us-ascii?Q?6FXX51/2ZQGAYBfDigQXg5Z/Lkwu3kJgW1pMwjPT5Nh9DoOJRBnvelKrQw1l?=
 =?us-ascii?Q?PEuOt1CwPOwHq/0gBF6/wE/GmuIhqX5elwuh+YJQG62iAHl6Vg/ZMpFbYoO4?=
 =?us-ascii?Q?lVVcMGwM/RimihTVFtdVErc85CBhfjbkYEozzQ1MExqY0UNkrP5CpE4N1jQn?=
 =?us-ascii?Q?4CBWx9KM8jjPn9cfO3f2yv3PFvxc75kDjNOgSh2Ynuunus6VolZtW9dQbPAm?=
 =?us-ascii?Q?VxP3zC8BvyyU7H+KK8eqaVplRmlSyT7yYBrd66ZWW2oPpasXxn2ITveRCPnV?=
 =?us-ascii?Q?nmWXkU8OHp6EkxZqxrx9KqFHcF0EHSUPUMv4c6yEmfKcZ3ljQ4Xb3/CVX/EB?=
 =?us-ascii?Q?SgKbX7DL1FrcF+YMIo8BVu0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cab48b42-1145-4246-00ad-08d9efc6ab34
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 14:31:20.5760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EqJNsvaWTHzi9zFUzv96XI4w6N5DOOMXV1jEvYbOG/uygsGUvB65QnDnYu2Fu8jLm+QzI1yVvQpA7IrsxpFkNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9199

On 14.02.2022 15:26, Oleksandr Andrushchenko wrote:
>=20
>=20
> On 14.02.22 16:19, Jan Beulich wrote:
>> On 09.02.2022 14:36, Oleksandr Andrushchenko wrote:
>>> @@ -410,14 +428,37 @@ static void vpci_write_helper(const struct pci_de=
v *pdev,
>>>                r->private);
>>>   }
>>>  =20
>>> +static bool vpci_header_write_lock(const struct pci_dev *pdev,
>>> +                                   unsigned int start, unsigned int si=
ze)
>>> +{
>>> +    /*
>>> +     * Writing the command register and ROM BAR register may trigger
>>> +     * modify_bars to run which in turn may access multiple pdevs whil=
e
>>> +     * checking for the existing BAR's overlap. The overlapping check,=
 if done
>>> +     * under the read lock, requires vpci->lock to be acquired on both=
 devices
>>> +     * being compared, which may produce a deadlock. It is not possibl=
e to
>>> +     * upgrade read lock to write lock in such a case. So, in order to=
 prevent
>>> +     * the deadlock, check which registers are going to be written and=
 acquire
>>> +     * the lock in the appropriate mode from the beginning.
>>> +     */
>>> +    if ( !vpci_offset_cmp(start, size, PCI_COMMAND, 2) )
>>> +        return true;
>>> +
>>> +    if ( !vpci_offset_cmp(start, size, pdev->vpci->header.rom_reg, 4) =
)
>>> +        return true;
>>> +
>>> +    return false;
>>> +}
>> A function of this name gives (especially at the call site(s)) the
>> impression of acquiring a lock. Considering that of the prefixes
>> neither "vpci" nor "header" are really relevant here, may I suggest
>> to use need_write_lock()?
>>
>> May I further suggest that you either split the comment or combine
>> the two if()-s (perhaps even straight into single return statement)?
>> Personally I'd prefer the single return statement approach here ...
> That was already questioned by Roger and now it looks like:
>=20
> static bool overlap(unsigned int r1_offset, unsigned int r1_size,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int r2_offset, unsigned=
 int r2_size)
> {
>  =C2=A0=C2=A0=C2=A0 /* Return true if there is an overlap. */
>  =C2=A0=C2=A0=C2=A0 return r1_offset < r2_offset + r2_size && r2_offset <=
 r1_offset + r1_size;
> }
>=20
> bool vpci_header_write_lock(const struct pci_dev *pdev,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 unsigned int start, unsigned int size)
> {
>  =C2=A0=C2=A0=C2=A0 /*
>  =C2=A0=C2=A0=C2=A0=C2=A0 * Writing the command register and ROM BAR regi=
ster may trigger
>  =C2=A0=C2=A0=C2=A0=C2=A0 * modify_bars to run which in turn may access m=
ultiple pdevs while
>  =C2=A0=C2=A0=C2=A0=C2=A0 * checking for the existing BAR's overlap. The =
overlapping check, if done
>  =C2=A0=C2=A0=C2=A0=C2=A0 * under the read lock, requires vpci->lock to b=
e acquired on both devices
>  =C2=A0=C2=A0=C2=A0=C2=A0 * being compared, which may produce a deadlock.=
 It is not possible to
>  =C2=A0=C2=A0=C2=A0=C2=A0 * upgrade read lock to write lock in such a cas=
e. So, in order to prevent
>  =C2=A0=C2=A0=C2=A0=C2=A0 * the deadlock, check which registers are going=
 to be written and acquire
>  =C2=A0=C2=A0=C2=A0=C2=A0 * the lock in the appropriate mode from the beg=
inning.
>  =C2=A0=C2=A0=C2=A0=C2=A0 */
>  =C2=A0=C2=A0=C2=A0 if ( overlap(start, size, PCI_COMMAND, 2) ||
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (pdev->vpci->header.rom=
_reg &&
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 overlap(start, si=
ze, pdev->vpci->header.rom_reg, 4)) )
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return true;
>=20
>  =C2=A0=C2=A0=C2=A0 return false;
> }
>=20
> vpci_header_write_lock moved to header.c and is not static anymore.
> So, sitting in header.c, the name seems to be appropriate now

The prefix of the name - yes. But as said, a function of this name looks
as if it would acquire a lock. Imo you want to insert "need" or some
such.

Jan


