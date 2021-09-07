Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A48B402B47
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 17:01:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181155.328191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNcbP-0006R0-RR; Tue, 07 Sep 2021 15:01:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181155.328191; Tue, 07 Sep 2021 15:01:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNcbP-0006Of-OA; Tue, 07 Sep 2021 15:01:35 +0000
Received: by outflank-mailman (input) for mailman id 181155;
 Tue, 07 Sep 2021 15:01:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNcbO-0006OX-E7
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 15:01:34 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e9534e9b-dccb-4cdb-ab3a-9eee082daf8a;
 Tue, 07 Sep 2021 15:01:33 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2109.outbound.protection.outlook.com [104.47.17.109])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-4-Weu6wJ30MmKhLA8foV0Wjw-1; Tue, 07 Sep 2021 17:01:31 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2605.eurprd04.prod.outlook.com (2603:10a6:800:57::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Tue, 7 Sep
 2021 15:01:29 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Tue, 7 Sep 2021
 15:01:27 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0051.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.6 via Frontend Transport; Tue, 7 Sep 2021 15:01:27 +0000
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
X-Inumbo-ID: e9534e9b-dccb-4cdb-ab3a-9eee082daf8a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631026892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3gOJT+pE51xlYTei+0Zv/UygilQrt+3sdPAMFW0ydco=;
	b=ZYPec0pZ2H8QsE2u/yGIh3VeQz+DivH4/Peit5lPqvP34yKZpNK/FR/59cZHbBR3r3hMWb
	kJgbnJBq6Nw1FQN3a5+XFVS3qWo6fHQWSd56RMTz2qtrvfKvWXMMJEWawpMXdRiKK2hYQL
	ehl7HfU76+EBQadFri6g3z2z8YCvFSw=
X-MC-Unique: Weu6wJ30MmKhLA8foV0Wjw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IOA/6gS4pY6AnCYtILAANLrTVUfP0X+rxkVrL7ehjnxI5881dchcqvIsVqieEqCLr2xwUfd/X0e42p0u0E0E/YOl+frFa6wd5CpAWm05eS4wDEV5sxGyFG3YWp5xtehHFok8UkicEHsFYGxBzw30odhX9E4E+tHAwP7ljIy3DzFclwZ8sUsTSc5TcRTa4Isc2bCbNG5/1UufvrU56Jh+qpevb8zMa+wctRv+6AGUFYpXo+XUj5xJ1ocF8q4II6bWBs4MzKmWAnXjE8Itg6cpHUNqHOn3ubVtslrsw7oecB5Xhf3JBGlqREmCiMxo88jwc7Z21PIpG8zuWFoJ05vTKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=/yJIGk4ydRvmXHfQr1S7Kfi9GZbDReLS7yzFgjiLH+0=;
 b=I9Zge/jXxu5qsMi//mDK8p844hiS8Ypw5zIwzoxdvDtSs9ZsWwD9SjG8fNQz8I7TSs3sHBs1RwDuenq2y0eAd5W6z4HMgvplMzby5UfirsYL2Ktv1p0bvd1LAWPiDwg8Q8TYKvB7WQACo5Ey2Swg6XBGUueicIQysTp3iAW1y6WuZuVfnsnIUq/BSKB38Ko09u/euEjbCg98wCaOo/HmozVpkKFjbh3IjHVAMppbfR8Pu29YZUzuwETPOovORpF98B/Kv15vxE84eTSBJZKlFgMzA5uHJTASl7WA3RvtC0xOsVqA2larNfkAxaTYzaUpY1rGEO+mtEubcU88tNqWHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v4 04/11] xsm: apply coding style
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
CC: Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20210903190629.11917-1-dpsmith@apertussolutions.com>
 <20210903190629.11917-5-dpsmith@apertussolutions.com>
 <01c81885-9ea0-3ecf-66b0-009b9e7ba39b@citrix.com>
 <ef0d627e-cc1f-4b9a-7695-daa646968c42@apertussolutions.com>
 <a3a9207e-7ab9-5eb9-7488-74bc4203e7a3@suse.com>
 <3b3762a7-5034-9094-84f9-cd8ab24e24a0@apertussolutions.com>
 <e006dc60-7745-43b7-f725-2390e174bfa7@suse.com>
 <bf876f84-aa0f-faff-da63-0f0525087883@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6c042f71-80a1-c6ee-f171-fa1ac4c3dcef@suse.com>
Date: Tue, 7 Sep 2021 17:01:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <bf876f84-aa0f-faff-da63-0f0525087883@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::9) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2284eca-7d06-4f1d-3bb1-08d972105e35
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2605:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB26057DFFF89225A813432EAAB3D39@VI1PR0401MB2605.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JrFF53dtO2jI54Ecl/NGU8KqOxWYurUwTn0xxHndtsx3rBUTA/9JeHnHt5qY6D2OMHNAzAeEw598wqj6l5aXK5/6a8m3BosG9rRuo0lrsmOnwveWncoCpt5+rrgMk/MEPf1lOCLmkF0+55zs/WyfR+EBHCHVLYzgKjXytnVfw0cy+g7Z4nOwwBNxyJIOZcZZDs0QvNkK2kvqodQKCxnCZG+uU1R5YKRYYb0F1ZQhinHR5jpg6mvFSAnznn1CZXMm2CiUCdOpl5JgifeXoLMXc3YZWKPZ4vuidNbNGKWWT/66URafH1gqSQqgioLM7WqaLnVM79/lT31bfSB904XYkrnpk0omeoaIdfsf1BsYdX1HHtSBb+PPSruhJO5HOF8YRJQVm96hXyfCgL1COReg1hb/cWM/XgB8GRumTH2+Q1slMR7WyUYy2KtcJwaSRsYu2FVSbO8AjuiCwPR4FA5G9nu5rU4CKj4SHpv25bdhlbAs8IL8QH+z5MtuLFTDbkZ876dBoITw1LmW9n9l/yqNqHzGLtKtF92+qC3+EGB/shHKCysAt9I6wy6HiqsCxylA1RT1Z0JDC8Q4yAFSBpX1CanHEDTyFlYAtcOToyls+UoDdS900aRqF2QfmjeLB2TH0ugI6ttg5Zz7ZoB9eMNlVDHlFllq7oAVqDH3ClGVA3GWRAUwACnBrWN+L0YM6LfgN2WI2dCI4rXqr/aZfwgMNqUnUut21BXDTjZMlQE+A3E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(39850400004)(376002)(366004)(136003)(6916009)(53546011)(5660300002)(36756003)(316002)(16576012)(83380400001)(66946007)(6486002)(66476007)(66556008)(2906002)(186003)(31686004)(956004)(38100700002)(31696002)(26005)(2616005)(478600001)(8936002)(8676002)(4326008)(86362001)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8qyMkGVN2guD2B3QnRHxgFg+Io2MhXpBXl24SjvMRRVTabOZMVx1cmHvNKcI?=
 =?us-ascii?Q?V7pBJkWXboZf2Vv3O9/E33UXZu/vDFHllWa3jHRtX4pETgBDlhyJsjG3cNay?=
 =?us-ascii?Q?cHOMbLpRWK3OZhSLypwpJZCk01pvtF2qikbUr1zubYzHgg4JKMYQrzG2SNwn?=
 =?us-ascii?Q?vk0ZOyIF6M0SlCMAFMCtmeI6rF5tb4l9cKpGKxpazbTgamqZWAGR+7TX/mXc?=
 =?us-ascii?Q?QBzLSgzR72TUsSonRF6JJXRgNxLwgnkUtMRRH5hNclXEVxq1kSlmJH5lcLiI?=
 =?us-ascii?Q?sm7Js0Bw2VMR2+Ism06xC0KW6CGryD5T/h9RqFi2XsLL62XBLWHIJU5H8zoh?=
 =?us-ascii?Q?CBAzzbGylZA8A/KTw1ClIux/BeYe5Vr8HnnFE+0sRrc+FxNbnbhk8X0Gr1o6?=
 =?us-ascii?Q?iUB8SE7LgeMbJSMzPRwGtmtddHYPrS4dYx2pPD8mW/Z5X0uvkua4b+7GkKm1?=
 =?us-ascii?Q?sqdmDmIvh3T/3sFVJABEgEf0oT8sy0uG0sRCndGy7aeArgCfap90fj+ZXnic?=
 =?us-ascii?Q?i6GUvIofYZ/xApQ8mG8bDtFv1hG19SW7sPttxjW+2QqkVYSbcCYVmSmzP0CY?=
 =?us-ascii?Q?d7V13VwyUflfoIqoyMIOEHQOebTfjZnQS3BfNxrue0O9a5/pCWX1du3Y6Ao1?=
 =?us-ascii?Q?cbwdYwFSkD1NiPB4EzEVu0+MqIPnwwyycYbG1q/RUmUfcueO3W31wHI5mD8O?=
 =?us-ascii?Q?QE1EEkUGQr1EtPcVCDlVw2G3nIKR+HFpr7/J5IdnTSNIlMShKIBSOz5sNKd8?=
 =?us-ascii?Q?O252/twMHi3uInfUPuksi/Qtfcc7xm8vwsT5+ySagpXkFgJTXEVlhxNbxPe4?=
 =?us-ascii?Q?8JavYhwcfhG2mxv0YRWW39RQLYcudvKxlscQrxu0fqrzyrPc9QO5aAmQGPOG?=
 =?us-ascii?Q?q+YNUt8xYPxsPkefsF2N0svk84Dt2Mb3BoGnjxC190kpOhAUjCyufuWAxDhz?=
 =?us-ascii?Q?C1146R4v7x+kMK+nG9C/0haeopB7vP4b7cCrGBVhSkpPviTDJgaduVmeR5hq?=
 =?us-ascii?Q?uMaXCZRdSkRd19qeKqc90D5npjOOr5Pedxlh56xkDmQ+SDB+LyBX/ywPl+Zu?=
 =?us-ascii?Q?uZQvmLCj60avQWZGkQV+c/x7GRtjYx5od1NtQAnvTxoU80Lzwwa0fktrdZI4?=
 =?us-ascii?Q?lcbOWZ6Ez6Di65LamSBWx7cd600csTpOSzecD+zZwYhZOk6DfGaqOgEyTYRc?=
 =?us-ascii?Q?RK2Z1FkgmafyOFtE+D3/NSKTe4qAZSxwxrxhMkcNNgU44YTbxC1j4mPr013L?=
 =?us-ascii?Q?scKCRYyLJ9Y6v4gdXBS6Pwv5BPPXfeWMXmepdKcUB3aXPsQXHzkpH0pSEFhN?=
 =?us-ascii?Q?b6bmD+2d2TZOqF6JOISDtiRE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2284eca-7d06-4f1d-3bb1-08d972105e35
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 15:01:27.6315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DkM6VkY+qvb4VFNQ8K32XycFTwC7TTRep3MY1iAebIi/izZSjZyVgoN5txO+CeLnUdK5CT3Q2yzbU3XP1JZyoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2605

On 07.09.2021 16:55, Daniel P. Smith wrote:
> On 9/7/21 10:27 AM, Jan Beulich wrote:
>> On 07.09.2021 16:09, Daniel P. Smith wrote:
>>> On 9/7/21 9:50 AM, Jan Beulich wrote:
>>>> On 07.09.2021 15:41, Daniel P. Smith wrote:
>>>>> On 9/6/21 2:17 PM, Andrew Cooper wrote:
>>>>>> On 03/09/2021 20:06, Daniel P. Smith wrote:
>>>>>>> --- a/xen/include/xsm/dummy.h
>>>>>>> +++ b/xen/include/xsm/dummy.h
>>>>>>> @@ -69,8 +69,9 @@ void __xsm_action_mismatch_detected(void);
>>>>>>>   =20
>>>>>>>    #endif /* CONFIG_XSM */
>>>>>>>   =20
>>>>>>> -static always_inline int xsm_default_action(
>>>>>>> -    xsm_default_t action, struct domain *src, struct domain *targe=
t)
>>>>>>> +static always_inline int xsm_default_action(xsm_default_t action,
>>>>>>> +                                            struct domain *src,
>>>>>>> +                                            struct domain *target)
>>>>>>
>>>>>> The old code is correct.=C2=A0 We have plenty of examples of this in=
 Xen, and
>>>>>> I have been adding new ones when appropriate.
>>>>>>
>>>>>> It avoids squashing everything on the RHS and ballooning the line co=
unt
>>>>>> to compensate.=C2=A0 (This isn't a particularly bad example, but we'=
ve had
>>>>>> worse cases in the past).
>>>>>
>>>>> Based on the past discussions I understood either is acceptable and f=
ind
>>>>> this version much easier to visually parse myself. With that said, if
>>>>> the "next line single indent" really is the preferred style by the
>>>>> maintainers/community, then I can convert all of these over.
>>>>
>>>> I guess neither is the "preferred" style; as Andrew says, both are
>>>> acceptable and both are in active use. I guess the rule of thumb is:
>>>> The longer what's left of the function name, the more you should
>>>> consider the style that you change away from.
>>>>
>>>> Anyway, in the end I guess the request for style adjustments was
>>>> mainly to purge bad style, not to convert one acceptable form to
>>>> another. Converting the entire file to the same style is of course
>>>> fine (for producing a consistent result), but then - as per above -
>>>> here it would more likely be the one that in this case was already
>>>> there.
>>>
>>> Understood, I will respin with all the function defs to align with the=
=20
>>> "next line single indent" style, though it would be helpful for=20
>>> clarification on this style exactly. Do you always wrap all args if one=
=20
>>> extends past 80 col or is there a rule for when some should remain on=20
>>> the first line (function def line)?
>>
>> I don't think that aspect has been discussed. I would say
>>
>> void sufficiently_long_attribute test(unsigned int x, unsigned int y,
>>                                       unsigned int z, void *p);
>>
>> is as acceptable as
>>
>> void sufficiently_long_attribute test(unsigned int x,
>>                                       unsigned int y,
>>                                       unsigned int z,
>>                                       void *p);
>>
>> with a slight preference to the former.
>=20
> Apologies, I was referring to this style which I am understanding is a
> little more preferred
>=20
> void short_function_name(
>     struct really_long__struct_name *x,
>     struct really_long__struct_name *y, unsigned int z, void *p);
>=20
> vs
>=20
> void short_function_name(struct really_long__struct_name *x,
>     struct really_long__struct_name *y, unsigned int z, void *p);

This latter style is not supposed to be used.

Jan


