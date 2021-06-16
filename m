Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3482B3A9E6B
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 17:01:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143354.264259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltX2i-0006Nh-Qv; Wed, 16 Jun 2021 15:01:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143354.264259; Wed, 16 Jun 2021 15:01:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltX2i-0006Ln-Ne; Wed, 16 Jun 2021 15:01:24 +0000
Received: by outflank-mailman (input) for mailman id 143354;
 Wed, 16 Jun 2021 15:01:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jola=LK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ltX2h-0006Le-94
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 15:01:23 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ad9bd4ce-de2c-489f-afb1-9ec5cdcc1bb1;
 Wed, 16 Jun 2021 15:01:21 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-31-21fd_TuyOIm1h4jd0AZOMA-1; Wed, 16 Jun 2021 17:01:19 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6861.eurprd04.prod.outlook.com (2603:10a6:803:13c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.24; Wed, 16 Jun
 2021 15:01:18 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.019; Wed, 16 Jun 2021
 15:01:17 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0209.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1f::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.18 via Frontend Transport; Wed, 16 Jun 2021 15:01:17 +0000
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
X-Inumbo-ID: ad9bd4ce-de2c-489f-afb1-9ec5cdcc1bb1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623855681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yVRTu0CfEeFesjRETUlB3Z+ftIEmd6Fu6G7zHSTMe9w=;
	b=lW4wtMgAmwRstwNkXvwSqlKM4TiKhiqWq6mb5vEUmio0RIwzMihqardHPkfu46Ob1T36LW
	umeoOl6Zz4ThFC6i2GxYIY7xd8VrururB7y10NR95hTDPK7onzhOqz1tkEHSbz48odtfyG
	LtjpVHaLitEMGGGVZrow9yLDaI4aV1M=
X-MC-Unique: 21fd_TuyOIm1h4jd0AZOMA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iXKbNE6I8vjYZ6lLSeuqxy7kB9HAilJdZqGwAWBj+lJmbFE94drAiQt1GpO/XhRwnHn24yyYwtgLd/3yf1nx3dRUg3jphIqyaiEn1jMTG3Bk6xe/akrfPeHyXbWHHFyHStCmz9WY/K00bPKmUiZawfcokfStdbibo7eZF3rywnGqaa1YR/bK1gMvhDXX1kIU/4/HlpnvE+wKRLz+ToAcYg9en7hdZ5afBJY0dQKodBKP6K2lljETwC5StwbMw5LAGyKY9Dn4gRofpt6AcN2FuC4ejfGN4FGZaq3jvbHDyXgNLbRkkT/d5eHWqe2JGft8ZOqabsvrS/1uhTuvieZX4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3lFacDmEIodEaoxeJPMMmvxpxSTyv01Hwb2O7xxbCpc=;
 b=XXKxOYVVWlmCe6ODR8ymkc37QGGF/QnfpCQfBk36U82naQ2+ojgPkqNwNQW29VwUj+axRS0F9crbO9o1f2iyUar7STLp8TaiXSYXEAi0Tcq5bcaybbFPC6YEey8Ep7q+SF2Gg3lCBDI9JEgfSVQocE2lQViKwD7A/YEeCKU+a3tBRiXq61EBkQGstAvi8EBO2UcV9TwyIvg9CRCe/yO40VsWyv8xovHti8KA9VDXyeMrFw3kMIblRGm11cimlYECByePXV1JuzXNig5h4rxQDBd5jFmwnmjx7ioZ3m/Bvpwq/p2zWPDAHrrliccqDO3YKEoXVHg+S/6rG1NNMRMb0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [xen-unstable test] 162845: regressions - FAIL
From: Jan Beulich <jbeulich@suse.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: Ian Jackson <iwj@xenproject.org>, xen-devel@lists.xenproject.org,
 osstest service owner <osstest-admin@xenproject.org>
References: <osstest-162845-mainreport@xen.org>
 <8e39ca8f-3202-7d3a-d65d-7087634bd49e@suse.com> <YMoI8YZfOvogwOMY@perard>
 <f8c4151a-6dac-d87c-ef46-eb35ada07bd9@suse.com>
Message-ID: <52c8fd06-c60b-2765-b25a-47c28f98427f@suse.com>
Date: Wed, 16 Jun 2021 17:01:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <f8c4151a-6dac-d87c-ef46-eb35ada07bd9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR0P264CA0209.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5d45577-52fa-4795-55ec-08d930d79803
X-MS-TrafficTypeDiagnostic: VI1PR04MB6861:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB686196F34B9D4C3B5A5FAD51B30F9@VI1PR04MB6861.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rDtQ/YAAm6OZzqnCVIBWpIWZfM7jXg2GhqFUf9Az0BIsSrl52mZryZPbbve8osEd5hsqXbQLs78x9mkNy1XxQgW1TeIhBwm6KEReNuw2roXEYIMFNxl2KcmNvtFm4gy/UPQ4bTznYuDWAQYnBbTuvyJmYuzek6u0s/4YaWt4jA8eO/5pzNHdf9atao2zZjyfOUlbAw9IRfrqRufuieWFlAQMee/rqkJxzpsbt+4dQXqozWpx+R/k+B427QR4OTUo1DXykOhQnFfJFlEr/2xBEAGXzK3cQJsfk/VC1Ulb9a8xcK+/lexBqRMCc6f4YwcVLu1b/wPQ6Nd/KLT4H6Fu+NJtumjJ91FEQC2MrQGRrCVVw7Cgj/T/6dOCelNXo1HZXKgqU3rG5TpAtwrhOK/ugRAsqD9WRcnHirWyUs4Ja8OfPC8gPGTc4UBtKZktOrGa04hA1J+8lwFG+OWyvNlp9i3tL+3iBYKb6fKkSZloCnsrMbrawspxYyktBbpvzVBC6/2PQtPSueWvwS5XVaaVyPAaEReKph3+nH9hHdNKEw4ELLWhyQ+UXGWmKdQfV1Zu2bvLs/nbTMA9j+aObDP+6SVi/JymOChP7SXUPkhqsRp1tRUG5KQ3KPvTU8YAkqpJNqMsnQpFxWevn4U8W25/DRPyxrAFApiO2wQE8iifpwdhnnET1d/wTseBUrEuoqtBkiBHleay6eHDThkO+fldgMcsvPzg3epcnaO8fsgvjKfXoybvAnI0dtl52+KCJC8vQ+A678S06g22gK/DhiwdagCbW5RZTJ109bVbQKWbZBuREQbeJmRbtEuWVj+KyIwZaVfXVaQ70dlNIwZ+vCVt5Q/oGcxogvWtltTM6vaA3wk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(366004)(39860400002)(346002)(376002)(136003)(966005)(8936002)(8676002)(31696002)(5660300002)(6916009)(54906003)(36756003)(478600001)(83380400001)(4326008)(53546011)(66574015)(38100700002)(2906002)(6486002)(956004)(66476007)(86362001)(66556008)(16526019)(16576012)(26005)(186003)(2616005)(316002)(31686004)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SlvCYzGPbKndFUaQzeGu0m0UQKZHUQoBauVQ4ua+GQUI/juPXSmeHnPQFwf8?=
 =?us-ascii?Q?HkHLPSDuSDEvNp0JHnbWvwm6QFHdiDTuYKMPjTyXRzkEX6Ca65QJfl+Os2r8?=
 =?us-ascii?Q?SEsPPg/KFq0DpbFBEtrR31w5VRpPp9eU3vrSuHy54QULoSmx0iKBdf3ec9oZ?=
 =?us-ascii?Q?YbHbHYjhoLPezi4PuHjg0G+cUINA0rTHp4+A5uOxWGxVwLAiU6I/2ZfbDQwL?=
 =?us-ascii?Q?osvzN6lBsT9BLQ7mQE6WHpJUXUBVIAoCFLkhRzxp+FMFPzyXGkpMKKqqiKd2?=
 =?us-ascii?Q?rIpwEnXQFOX+XyQCTfhPorXXMSlpNV6UIT7IpsX39GLCf8bIYbWufWHxRv5Q?=
 =?us-ascii?Q?TkbFNhHCChydzYaChmWYqQiSSq720HwwNqE14StvKvOQ8jG3GZAHBVN5nboV?=
 =?us-ascii?Q?1KJJQU9JJipNrHmBVExkpR/FToWC2xjVOZk2EWyVENPQUgJiLbZhOOQpGF3Z?=
 =?us-ascii?Q?QRWdtMhL2TM1Lu3ziOGdbiIxdw/pTTZsoCVqK/mxBdEoOo3OT/0jjcaoiOtE?=
 =?us-ascii?Q?wian4kzSZw1p1ez1KUx5SrxO6z0hW1C7FHEDxAt7QHi0qtVdxCwweCzvMrj3?=
 =?us-ascii?Q?rySDktKvyIYquzhCTsqqrMYqASyeZPn+JRSphuwGgDtJvJYuRfiLqRqoE9Kq?=
 =?us-ascii?Q?e86OoC+FFFTvvTJ7DZS42qeXEmUOr0Ha2y8+bgJGeAj483d3BJlw4pmoet69?=
 =?us-ascii?Q?RdhuglAljz/Hdh8xhRh2mMYTPrIVPd2fz9n5qILvKcguIAcN/GEh3uh9YvUe?=
 =?us-ascii?Q?aB6lWdhs4JppdJF7sB+nGwDTkszr29Y40GuvR+xDq7qEj2izAz0z42FasAUK?=
 =?us-ascii?Q?8C2wyDchPX0fQ0195/keAQLlV3oc5ZJCU4v/m50cai2QMd5+MCPIW6BaK++l?=
 =?us-ascii?Q?++pLA0Fi7JzKK2U4m1ZTC8aG5EU7gEk0daNgN1u7NehaRvWQBiR2QyiVkJD5?=
 =?us-ascii?Q?q8z9VfT62d0bhRQRgpTwyvbjULRlqlUUB3svqful4oUy/PzGlCwFrm0iHl02?=
 =?us-ascii?Q?cY5OjyqWZR35wiRG6g+AL63phwyDv4RtppZY3LL7dwFzpm8+Szwvz0vgxgwB?=
 =?us-ascii?Q?n8ZVQseaxftKYQjDi8gs7aTtEHZ54VCWBX+4Uht5y1gcFXUOOv9x2bGTBJ9C?=
 =?us-ascii?Q?fcAzp1ntJjTZiWiTVqIWiz19qOwAjW7V2g4Ku/NHG1482sYm38YGSz4BQR1b?=
 =?us-ascii?Q?DPqy/IY/CHOerkdSkBib05WzCTaEJGvQWU+EKQ99HFXLxJZvqBBQCX0yyQrm?=
 =?us-ascii?Q?8bKuf90xjVUBvz2YG+rfGM08p4Kg5EM6Lzq/J6LHc12AhPCHseLGq0hJBGI4?=
 =?us-ascii?Q?hEshwUSnqZf6y92rXggmOGNM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5d45577-52fa-4795-55ec-08d930d79803
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 15:01:17.7442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yslFqtSrRz2/ggtbIQDKbaXStHx+T+wjLiNINhGyluQ5iABP/nqnJEFFZf6lJ2xuy6p8hHzyZl/OV6g39N/tSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6861

On 16.06.2021 16:49, Jan Beulich wrote:
> On 16.06.2021 16:21, Anthony PERARD wrote:
>> On Wed, Jun 16, 2021 at 09:12:52AM +0200, Jan Beulich wrote:
>>> On 16.06.2021 08:54, osstest service owner wrote:
>>>> flight 162845 xen-unstable real [real]
>>>> flight 162853 xen-unstable real-retest [real]
>>>> http://logs.test-lab.xenproject.org/osstest/logs/162845/
>>>> http://logs.test-lab.xenproject.org/osstest/logs/162853/
>>>>
>>>> Regressions :-(
>>>>
>>>> Tests which did not succeed and are blocking,
>>>> including tests which could not be run:
>>>>  test-amd64-amd64-xl-qemuu-ovmf-amd64 15 guest-saverestore fail REGR. =
vs. 162533
>>>>  test-amd64-i386-xl-qemuu-ovmf-amd64 15 guest-saverestore fail REGR. v=
s. 162533
>>>
>>> There looks to still be an issue with the ovmf version used. I'm
>>> puzzled to find this flight reporting
>>>
>>> built_revision_ovmf	e1999b264f1f9d7230edf2448f757c73da567832
>>>
>>> which isn't what the tree recently was rewound to, but about two
>>> dozen commits older. I hope one of you has a clue at what is going
>>> on here.
>>
>> So this commit is "master" from https://xenbits.xen.org/git-http/ovmf.gi=
t
>> rather than "xen-tested-master" from https://xenbits.xen.org/git-http/os=
stest/ovmf.git
>>
>> master is what xen.git would have cloned. And "xen-tested-master" is the
>> commit that I was expecting osstest to pick up, but maybe that as been
>> setup only for stable trees?
>>
>> Anyway, after aad7b5c11d51 ("tools/firmware/ovmf: Use OvmfXen platform
>> file is exist"), it isn't the same OVMF that is been used. We used to
>> use OvmfX64, but now we are going to use OvmfXen. (Xen support in
>> OvmfX64 has been removed so can't be used anymore.)
>>
>>
>> So there is maybe an issue with OvmfXen which doesn't need to block
>> xen-unstable flights.
>>
>>
>> As for the failure, I can think of one thing in that is different,
>> OvmfXen maps the XENMAPSPACE_shared_info page as high as possible in the
>> guest physical memory, in order to avoid creating hole the RAM, but a
>> call to XENMEM_remove_from_physmap is done as well. Could that actually
>> cause issues with saverestore?
>=20
> I don't think it should. But I now notice I should have looked at the
> logs of these tests:
>=20
> xc: info: Saving domain 2, type x86 HVM
> xc: error: Unable to obtain the guest p2m size (1 =3D Operation not permi=
tted): Internal error
> xc: error: Save failed (1 =3D Operation not permitted): Internal error
>=20
> which looks suspiciously similar to the issue J=C3=BCrgen's d21121685fac
> ("tools/libs/guest: fix save and restore of pv domains after 32-bit
> de-support") took care of, just that here we're dealing with a HVM
> guest. I'll have to go inspect what exactly the library is doing there,
> and hence where in Xen the -EPERM may be coming from all of the
> sudden (and only for OVMF).

The *-amd64-i386-* variant has

xc: info: Saving domain 2, type x86 HVM
xc: error: Cannot save this big a guest (7 =3D Argument list too long): Int=
ernal error

which to me hints at ...

> Of course the behavior you describe above may play into this, since
> aiui this might lead to an excessively large p2m (depending what
> exactly you mean with "as high as possible").

.. a connection, but I'm not sure at all. XENMEM_maximum_gpfn returns
its result as the hypercall return value, so huge values could be a
problem at least for 32-bit tool stacks.

What page number are you mapping the shared info page at in OVMF?

Jan


