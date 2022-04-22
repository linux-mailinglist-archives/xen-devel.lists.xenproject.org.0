Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE9B50B496
	for <lists+xen-devel@lfdr.de>; Fri, 22 Apr 2022 12:01:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310796.527722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhq6Y-00047H-UQ; Fri, 22 Apr 2022 10:01:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310796.527722; Fri, 22 Apr 2022 10:01:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhq6Y-00044m-Qw; Fri, 22 Apr 2022 10:01:34 +0000
Received: by outflank-mailman (input) for mailman id 310796;
 Fri, 22 Apr 2022 10:01:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vZpq=VA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nhq6X-00044g-Jt
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 10:01:33 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2fc634f6-c223-11ec-a405-831a346695d4;
 Fri, 22 Apr 2022 12:01:32 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2174.outbound.protection.outlook.com [104.47.17.174]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-NV6oev0wMcKeiy0gO3zdcw-1; Fri, 22 Apr 2022 12:01:23 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VE1PR04MB7437.eurprd04.prod.outlook.com (2603:10a6:800:1b3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Fri, 22 Apr
 2022 10:01:22 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 10:01:22 +0000
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
X-Inumbo-ID: 2fc634f6-c223-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650621692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dwkz+mBkDfhEysjc1Ie8B940Oys83KiklybeJs9lA7M=;
	b=czsIUizmRpw95xSysBRwdLvKUyytve2qGtrLgRHC/0Ib3hV73v2+cQdne0KLBCyXe+RvAq
	nSao0iUqLjjYKcSn5Drsi14L+kbMGXT31Eo1fmOnhre/pyeaegMEooFeURiQzqd/aMIg+f
	uBjEd1Dm9BWUG1EyVx/j+j39A3H0oDI=
X-MC-Unique: NV6oev0wMcKeiy0gO3zdcw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S36AIGGe3yEM05OW1lGbXVy24kAVPGB1kvn3FqyWtUkUVuwT0uIqwbytodu7os1unk2s4fVHvWqaQNZm5Yj69GkIFbFWPCLx/Q6Cbp4RDhhh3JIC6JQ2SVUUhzytqNjEu0VRgyE4qstL4/3t4ug8J8k4n3ZgGw9nRoQKz/Qsb1o7VEhllIy+nE8oPWUTWl0Ae2TqbYwKZ0MLy7WrN+lWkKSV4Ukqq9uzVjTYkk0gbsEMWrEqOWUTQzwnO7VtB6+6Vf9ARc5SKkzFXr4heyKqULgNhbcrLYA6EeU4dpGvPCOdsfAeVFeX0Gy7DY0EKE1SOkzCGjMqlOPLUKqwPxsE9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aBVXcZ82YigjIcWpUdrI8BN27ZedpdUW5T6z9N8NJO4=;
 b=NjJDQufXLu20WCqBvDpisRsA6XMrSqb9P4gwWOoFhyh7CcZnCz2ZsxBWMlMQWeK7HzeK1K4qZOvq3OCbXY9F6VLzysConUfauXgV5bNfQuIKKeuSENhU0VZZYRwuMBya+CItWT0wp3IY5kulFkoDXFmMRh83B1g/KLqbQKBxkP822mhRRpVSBvQ9FROiYxzKt+be/v93PXlKJXDKiM91Fn0RWCZ3YjWefrxSePywZJ2q01A3G0sy0rkdddqJz8OG2/yg7oX/EoaTCVnIhbfi3z7ZwHU+8RvpYegMFOKzGK+wcRUGU6FBphhx5Gj2AR3ltB8B3IfEARzXo83Hu0jmvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8089c126-430f-1c30-68b7-562be0cf6fd6@suse.com>
Date: Fri, 22 Apr 2022 12:01:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 3/3] amd/msr: implement VIRT_SPEC_CTRL for HVM guests
 using legacy SSBD
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220331092717.9023-1-roger.pau@citrix.com>
 <20220331092717.9023-4-roger.pau@citrix.com>
 <0bb48681-a78f-d32e-f989-822dd5e54b70@suse.com>
 <YmF2Zw13O6oaAT0k@Air-de-Roger>
 <b7e3ecbe-6c2e-94f9-58c6-ae49652e6a29@suse.com>
 <YmJ7qr6W7cFkwV6W@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YmJ7qr6W7cFkwV6W@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0327.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::22) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ac5616a-72ea-4a61-465a-08da24470e05
X-MS-TrafficTypeDiagnostic: VE1PR04MB7437:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB74372DB24F3A880C72164717B3F79@VE1PR04MB7437.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1lLtlQ0Su/05QCPyf3hAwXt1ISzSGBkHFjg3f4K4LZc6uuyBcDlrlkYvMrSlWAS+tQULVqL2mTj1roL+jw735V9z0rYUI63jPDr5kgC+Lu9UIZRVVkjqD+gyXKpXTKemRKQm77JJyo6GVD2/ZyWU/FsXQKm9FSsD2QI2DkTMOlMBEH71w/UWHl0XyTfKC0q578B3hJ3L9w3Wle1dmFHXVqO+I5/SQDWQ4BcrXSx4CQRb568qEVZr+ai3bp6o3FW8qqBmQVXPCjtzJdM/FUBjN0HRvSZI1jZ3cPR+LwIB6eVeO15ykCwYt8RoAVQDrOiK/K4Ktj1Efjx6IaUHpB6HricR7tbYKNGCqQbadHNQyl6vnwzwdR4ENPsAHajCiz+BaR9AjHyELTRTfRIqiYxRnA0M/ux9TCy4tCYpXDhcXXg9orxewmfpWd3zREZeDB5b6APkoJQ+1XQCFvmw5eM+4qbWD7B8WGh5amRrqNBIuUAUGMK8Qm0v4WWgUy9t31hVNKaqmgH29xdzIhVhiEWWQFU8Ecmjdb4MYFW1EoZ1ARPk8YTgc6m+vraF+iMTH34iGTM0MmJn+7LkWPaz3zxfSJRVT5HgKvlW4eBL1PQN/k1yOcdwkIg9aPVsgtg//1VA6sQXxGC6R/4Bodoq5WsD6ay0MuYfkgJ6q6Ujrx4Eo9/X+JuJiRR3GdSIQXqzez/ovYf7bn0/Mp/VWmaYIXZw/6pYn4oq2YswBbW84wPiPZ8Sm2YpDScdF9dtxLUbTOl7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(66556008)(83380400001)(2616005)(8936002)(66476007)(4326008)(54906003)(8676002)(86362001)(6916009)(2906002)(316002)(31696002)(53546011)(6506007)(38100700002)(5660300002)(6486002)(508600001)(6512007)(186003)(36756003)(26005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Oi4WHz2Iza09xDL8ekbAbwi/0sSfSB3RjtLPWAgg7cZjL/Hmqbgu6qovFuXU?=
 =?us-ascii?Q?rMXY5iKMEmbHty0WrG6aEDDamzu4+CkHSEwMv1ATcGtTvTPczj3b4PfTDrwK?=
 =?us-ascii?Q?jIbAXfVUZt/1UkpcHJj8vSwFUy7wRotryB5dLAgs+3yi21EUEgOyJNSHv10F?=
 =?us-ascii?Q?EtaqAV0gk0XzhqGptt8eSFExl/lYcEM9d4KiMrO7COZ9HqADF6jNvP8YhPdl?=
 =?us-ascii?Q?Bdixvs5/5XrtlpmmqRC04ftTJA32Il7MdtjTjsKpQqCKjrtZp8C8SEx4N9NW?=
 =?us-ascii?Q?aChoUuTyXrp/YKg0A7ayrJW7REsdNUJcyB3TTDTbBT+no9OWaqWrM/Cpxn43?=
 =?us-ascii?Q?knG2uOvMcChna+M/ddFvTalRy4z5rBUjXQvKqL8jbyLB9AJYr4S9q5OKcGZs?=
 =?us-ascii?Q?092N7k5s+tkgzXuTnMfQ40KuypNKU6Z+QiIyYq6n6VAmIgfe5rN84T5CokPh?=
 =?us-ascii?Q?qN4fSFYYaYkOMpOhVDRFJecK0fE7hcmnuCcIrqIl3NdB2CW+Rj1GjoVWZBy+?=
 =?us-ascii?Q?Zpor2n1WoR3HLuHMhlLmJNRwbKTLkU4la+RP22ZwLtVZP1yZ9sBD0LwEvTqi?=
 =?us-ascii?Q?TpgDpp/Mztf7t318gyM2MNORW/rrbMZqdgA/1Jfi8LDYP8msUQDLiC+F9Ie0?=
 =?us-ascii?Q?//WM8+vXGxQF/iZKQow2JFSs2Kvog2qlB35zCZQZFTGHyj/iTeVbo+p1s7T5?=
 =?us-ascii?Q?G8gSKlLRfqXCSS/S4gVGGmlt5rxgDCc4hxtYSR9rs0hkwyUzgFA4SwBJFzAU?=
 =?us-ascii?Q?snquXn+at9rFXH/fde95jB1Hn0W28ZzfZZ7fwRyVfpsM55q31+7Xd1B/j2zG?=
 =?us-ascii?Q?X/mP/4lU3+rneS8uFisGKcyIAsJvrqt7ARQDvj2wjpZXuMiVn0N/PUYJr3ke?=
 =?us-ascii?Q?dDPz0CQY+TXLYb2P8sR/0AfiTngbMhMrishhDge11CZZgnEKC3BKNW1v1YAj?=
 =?us-ascii?Q?1zb1RWndr63p3pzuSIv4H1cgr1+3oODuY/da9IT8z8SgkhrMjMI+sKvTgRHo?=
 =?us-ascii?Q?r1pPDbj/yRbwLdsLeCgtYMs+lDkONT6oZ3WhZ81E+HvlIfPCAN/ewutnNxN9?=
 =?us-ascii?Q?fM1jMInSSY5TJqDQ9QWbehLBQe+nt4orAm5Vf+eHyWuY8DtqFhExTjKuN0US?=
 =?us-ascii?Q?ekxsefKKJX1q+FP67jxbPVhhzh5quQ8oQ6zOJmOELRhYiuy1Psgq5bsxUxzq?=
 =?us-ascii?Q?cScZP8KsADnWCJIpfM3VwyS5H0F8atqWJ+egROc/l4/U2jOG/owCTPnJw5kt?=
 =?us-ascii?Q?gxgQtCGhgjQQFYrrKc98z5n1FxePPjoikSlTIaLFlYpSYDTsishiceVcrvZX?=
 =?us-ascii?Q?i99sAchZXbAyl8GKIdukqaVQtcWKC973KxAsM9LmcVtUMeAP/oN0eoSuC+yW?=
 =?us-ascii?Q?GobwF2qsQa28BPM+97U5oOtvK6inqYOnYk2jaMjUtxJ78wCWl8FvZpimkASM?=
 =?us-ascii?Q?RBT3ulzV7pg6UTyPbtr6F36DZfD3xryjHDoMRWyJ7qQxqNoLeHaO+E3stbfq?=
 =?us-ascii?Q?uGIj3HPsH3yA/MkCcd8LcaRVmeHrTxwiRo0Vcdyw8Wths4Zdh/HWeUgDd/gc?=
 =?us-ascii?Q?eLTZ+Ko5VNgY7AE27J5eHnXSOHwD60+fxa3si3/YELNGMBFHM2ObyHMIdddN?=
 =?us-ascii?Q?GBQmaNq4OeV0pFp76iv0niMSK6e/J95b6ZxVW7OO4qBJUt1e8GBhTYZGEn/x?=
 =?us-ascii?Q?Y/r+raKisETUtYWK66A6h98Al7JFnKeRzITDiHu0XFH8Ud2bNn1R7stlRzVs?=
 =?us-ascii?Q?/gcSrhWMuQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ac5616a-72ea-4a61-465a-08da24470e05
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 10:01:22.5506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KNSNKoCjovvQUJ8qUrm83rbpfsqE1jw60Ii9RxTsqDFCa+OZGQVsMYkw+UbAswbtn83vs0Eum+nsUqP1s2K8vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7437

On 22.04.2022 11:55, Roger Pau Monn=C3=A9 wrote:
> On Thu, Apr 21, 2022 at 05:27:18PM +0200, Jan Beulich wrote:
>> On 21.04.2022 17:21, Roger Pau Monn=C3=A9 wrote:
>>> On Thu, Apr 21, 2022 at 11:50:16AM +0200, Jan Beulich wrote:
>>>> On 31.03.2022 11:27, Roger Pau Monne wrote:
>>>>> Expose VIRT_SSBD to guests if the hardware supports setting SSBD in
>>>>> the LS_CFG MSR (a.k.a. non-architectural way). Different AMD CPU
>>>>> families use different bits in LS_CFG, so exposing VIRT_SPEC_CTRL.SSB=
D
>>>>> allows for an unified way of exposing SSBD support to guests on AMD
>>>>> hardware that's compatible migration wise, regardless of what
>>>>> underlying mechanism is used to set SSBD.
>>>>>
>>>>> Note that on AMD Family 17h (Zen 1) the value of SSBD in LS_CFG is
>>>>> shared between threads on the same core, so there's extra logic in
>>>>> order to synchronize the value and have SSBD set as long as one of th=
e
>>>>> threads in the core requires it to be set. Such logic also requires
>>>>> extra storage for each thread state, which is allocated at
>>>>> initialization time.
>>>>
>>>> So where exactly is the boundary? If I'm not mistaken Zen2 is also
>>>> Fam17 (and only Zen3 is Fam19), yet here and elsewhere you look to
>>>> take Zen1 =3D=3D Fam17.
>>>
>>> Right, but Zen2 already has AMD_SSBD (ie: SPEC_CTRL), so it's not
>>> using this logic.
>>>
>>> The AMD whitepaper is more clear about this: any Fam17h processor that
>>> is using the non-architectural MSRs to set SSBD and has more than 1
>>> logical processor for each logical core must synchronize the setting
>>> of SSBD.
>>>
>>> I think just dropping the mention of Zen 1 in the commit message
>>> should remove your concerns?
>>
>> Or keep it, but qualify it by saying that Zen2 isn't expected to take
>> this path because of having SSBD. But iirc SSBD was introduced to
>> Zen2 only by a ucode update, so such a description should not be wrong
>> wrt such not-up-to-date systems.
>=20
> FTAOD I've worded this as:
>=20
> "Note that on AMD Family 17h and Hygon Family 18h processors the value
> of SSBD in LS_CFG is shared between threads on the same core, so
> there's extra logic in order to synchronize the value and have SSBD
> set as long as one of the threads in the core requires it to be set.
> Such logic also requires extra storage for each thread state, which is
> allocated at initialization time."

Thanks.

> Which I think is correct in all cases.  Iff Zen2 was to resort to
> using the non-architectural way of setting SSBD (if that's even
> possible) it should synchronize it between threads according to my
> read of the AMD whitepaper.
>=20
> I've also added handling for Hygon Fam18h, seeing as those also make
> use of the non-architectural way of setting SSBD.

Right, better be on the safe side.

Jan


