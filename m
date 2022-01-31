Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D264A48AF
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 14:51:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263112.455697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEX5T-00088G-GW; Mon, 31 Jan 2022 13:51:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263112.455697; Mon, 31 Jan 2022 13:51:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEX5T-00084y-Cd; Mon, 31 Jan 2022 13:51:19 +0000
Received: by outflank-mailman (input) for mailman id 263112;
 Mon, 31 Jan 2022 13:51:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Fky=SP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nEX5R-00084q-00
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 13:51:17 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db8154a5-829c-11ec-8f75-fffcc8bd4f1a;
 Mon, 31 Jan 2022 14:51:15 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-19-Ih7rbyWLMIyVw4nuux_V9w-1; Mon, 31 Jan 2022 14:51:13 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB7359.eurprd04.prod.outlook.com (2603:10a6:800:1a0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.21; Mon, 31 Jan
 2022 13:51:12 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45%6]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 13:51:12 +0000
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
X-Inumbo-ID: db8154a5-829c-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643637075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WWYONottKHEqXKdpNOzSs6U0kWV6p+A/VUOOsjZC4+c=;
	b=QMURNhf5mYln1R+YXNxN/5jronlOhFaXfctj5cEjV472ODx3cvdCK1gZdkdvWAcUyJ80eV
	TFoPwtOhAo5iTWXSbRpGWSTWN8s79Sb8fvv9eM5IcULkON98cLrNF3jusEyT4ObndsGZaZ
	wcBkVLYI1m1HERK9ksizQEcvz2fEoQQ=
X-MC-Unique: Ih7rbyWLMIyVw4nuux_V9w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gHUWuBvqxIOEixKo9WxJW6N1tCJZiWJ6SZnWDVIGkvtrnfSITjsDFG/qCq/R4vtdADIy9/+aqISs6vNSf0q7fPEPXcapMKX74jvhtjVGMr5Yb0DkufC/6OMUohHMXXQgw+WEQyC25kqSeCUogncqjqsCRcwGLX4GKF97XPCHjpuqfyWfL1wjS89a0rFenSxO9LGLGyR+Oie1ptEFla6vFDO5ZMJcHuvtZOun3L13t9wojFNm+7ExXmpNtJdtDRu+QgZ8S1YvqdjSrQmcEKtGBahjvusP2F+slMZpALnc/d0p3i8K+/i/PhSYubx4Lr98jpZSZBe+B5rMoas624DOfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AJpXaKqrSi1g38A2tsw1bcmlLytfYPjJ/0UNvam50pc=;
 b=QWBQ3aFpI/M1eP+TBGiHlVYWKhfBPrZEpmSklNYr1QeplwuPcEXhprGXbvsTMLBO9GgOlTvY38j+IlpHj+9lxY1LzRCa1gH9k0u7GgdWgMLIAP/v6R9KlEUTm70KDVd2xhXJyDMYm92pLYDcEd2nrujoEykvmhgwrfP6u6nJI+9f+mbbwXXaAZ4PtPtAUuxikiN5kxoMZjTjIdLU1RMUhpvtXw3f2obFE/DL3PtQ4V2YsKfdvN5XXBEiTThSgqnZZP88AiYdVpo2eI1F4acBM/HCG8DCflCxSmz7KrXyckQkxfWCynbuIrnbj1CSprTMrI4yt+GhKtGqYmiP8SbwCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <75b6e181-c0ab-a95b-2e17-7dc0b3dce8e9@suse.com>
Date: Mon, 31 Jan 2022 14:51:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-7-andr2000@gmail.com> <Yd7K+9fvnBz+WTXA@Air-de-Roger>
 <77c00154-646c-a2a3-98cb-be4324003446@epam.com>
 <c7e87ebd-2c56-d510-b08b-02d53f9158d1@epam.com>
 <YffDmW4JGk+iDIVF@Air-de-Roger>
 <6d1772b1-25f1-0f63-8b8a-5dfaf94b2953@epam.com>
 <36fe9000-87a8-eefd-9baf-331bf4bbf1ad@suse.com>
 <0b20be9a-61e6-d286-b379-92c29ee9a804@epam.com>
 <2cfb6134-ab5e-3231-45f4-692c31302b1e@suse.com>
 <39966ef4-ed69-3bf5-ef6b-a4790c7164a2@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <39966ef4-ed69-3bf5-ef6b-a4790c7164a2@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P194CA0061.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::38) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4349403b-3df7-4967-e855-08d9e4c0bdd6
X-MS-TrafficTypeDiagnostic: VE1PR04MB7359:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB7359C7AA83EAAA19E81EF9B5B3259@VE1PR04MB7359.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JMM9Es3JfzXd6KfjCUMMrLnTMm+AFk4uh6slj63HdeLbmYrJSaAcpS56QZPpIwZ3DATkbmAQxiBXLPuMsXgKQg8MDsbJOBKp5OxFBLkIgjW2F0+TVn2WyH5cVMFSLZOcyLlx6Tgp2i8SCVXTEpX7t9lKRCs4JXCCt1wB5DAy+EhzSyShgofKHwPgx6Sd2FmaUkGNBuY5sFjS5gFyeVTbaikitrYIG0jUoAEYyhoeWBSNDZpIsV3pWey2N4YbII+dw0eh4MSn4G5LvdFWGsA0fTi6rU/aN3a+Y7rGaWSmA1lbt+11bq5UoYoJfdCF0eRbXoW4g7tVpRlbvIYhnqGNztgwGbJI7T+4pkDgTneIMvwHUhAeLflCk1gZ8xdXyU0mlpcCXg6/9ksmm7jq28CMSWZ1I53L6cv/8lLvOSDSvZrRcD7DNgBLeEOKZHc/bw3OUMPtdM4kN7jqivdPC6IjbanGSrSKBJ4u57+S+Rc3KBjfs0FzSh5b0gUfJA1Jo+gBplJngsBejYjNxyUbR+S0UnTVQG3sSTDwMuc7TGIzMax3+IE52yt/5n/dsdAa3MfkxtXRdmcwzSRA+1ApuqCbstgwDAJBBdlwwqbq8oh9JexH/92EgkTLKiS7la3VKF5DaPLytR6E9Ha4pU4teMiVrT+DE8mt0d/0JA9K7S9/KvPdgpSkqxsAGayzb0Uis9yUYEbJQZhdupoyf3FHn1y0TCvTj0Pqni4wLQoQvLbk3qDCT9DcLQAV8pIgUNbZRPq0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(7416002)(54906003)(6916009)(6486002)(6512007)(36756003)(316002)(38100700002)(2616005)(508600001)(186003)(26005)(6506007)(53546011)(2906002)(83380400001)(66476007)(66946007)(66556008)(86362001)(8676002)(31686004)(4326008)(8936002)(5660300002)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?leGuIEvNx89EKvnfcZNXvS6DNYXAAo/5WXnKkFDhhmBxJ3gk/HVy5sQ0bGYl?=
 =?us-ascii?Q?kP/kCwNIjqfVl6pc/NiO3QhTsQXAzsYp21bPB9pnoT4Lz3EiB990GzAqFCqw?=
 =?us-ascii?Q?mHhsTUKaqDlA55SEv4SF5UE4TwwXDj5KqgGxDpaU06iaBv4Dzb7nqVBOfbGL?=
 =?us-ascii?Q?jmk5GQyF02yrHLhe94DalAjMf24sLNcbdpVaC/OaHl/da/uB1Y4qM2QQ/T/l?=
 =?us-ascii?Q?Pn1suJjWKJPS4lsJ94JlE8V1YFgsRaWm86xXT2+Hx/LgM7Pe9O9aYGm0qrYb?=
 =?us-ascii?Q?+Z22QS6chR13jilbfcIEeY8o8KDMRvv+50f3alnZ6BNC7xmMYoRw0oTu0d4L?=
 =?us-ascii?Q?qZmS/uSEHiK/llhtAJNR8kYDL1A3MlyaFgkr6Lmiz+GvbZvGGCNt/lIbHTMV?=
 =?us-ascii?Q?jRLAzmiI1qS+rgDAjSsd/QX++poC0ny+Y2G97DuSGh1quUxUwC/liv91RnVy?=
 =?us-ascii?Q?faClSYSzRIdPMIHGeyRzQc4XZI55fOAgQGzS3s6OT3FAzilpJr2DmagNhP/7?=
 =?us-ascii?Q?aZamuZL1BImeJ1xGyl1IcD0q6rF2DXSoeSV9fnb1m6O4EGzaIS4+bpCkivrQ?=
 =?us-ascii?Q?dZN+Psvd496JtcV4uiU6TZPEw0gwCphKt1BY+Sc+0kvnY7J1FDeAJ0Bh1DPI?=
 =?us-ascii?Q?DLe2Z51PHDQAdmnsmwx6cA1yjr4AVJVjmTN1CTE13kPPFBLlVIekOTpowd9B?=
 =?us-ascii?Q?xTfjCK6N6hcHgNMMCHtlV/s1Sraav259Vb+h3bPbOdch5AeCH1fOdhm3BDVN?=
 =?us-ascii?Q?UQVIAUlRqRgQbXJRgsZoIF4YFwEnNY+bZvv+sfZrpaJ5Fbt9fhtr9dU3bYJm?=
 =?us-ascii?Q?8PssxIqX/2vCnaT8P56cCEUaqwfegl2CLZeaMpB/y+fb3UYy5ai/kIXX5z9n?=
 =?us-ascii?Q?8mcp54wBS+0e/kqmY63Y3dYE6Fc5u6TfppgIWxj460t2XTzr4pm8T3/rHs9y?=
 =?us-ascii?Q?Mp0uFh5S2LDa3UNcnigBm3HR59XijS1gSKZsrA0AP8CppP51dNE4w6AFG9DK?=
 =?us-ascii?Q?F45ZKE70hs5yIznFKDTpTG3TQkjEpOMTxu2dB2A3L5a0n2f2eAG6O7BLys8P?=
 =?us-ascii?Q?t8BKqBLQHg3Ltp4s/n9UeYQRlZ0z6Eh/AsPzWuM+nCINA9M3fg2YIEUbgTpu?=
 =?us-ascii?Q?rntKWKsbTgBxMhFb0sINdx3nttiNTBTZZcVW2VGkQBWq5Q0mpEkT72yngl+N?=
 =?us-ascii?Q?FNFtne1GAtSQTh1oRGrsVPevYVZlvmX8JT3WYmnQRSlOTwCVZmZ5maWu7PZL?=
 =?us-ascii?Q?sart/U+8zwL2N7KWV5jSIn2e8cU+hbubP3R3cxIvM2DSUokPQC2pDngs3u4p?=
 =?us-ascii?Q?4mOOguDOm0j+h6zccR7Eac+N6dqmvWTh21AgBFT/tS2JmhpWy5VWH/GYCK5S?=
 =?us-ascii?Q?xGquuvNdUfDn6p/QOKX9x7pTz356D3LskCSgDhRbhXZ2GkX2KPaNPp3fnGFU?=
 =?us-ascii?Q?/ZVkyvQ274KcGuZqTD9F17RxrpOubliu2YYQaPh/gCTAwMfHFYsJeNw/K5Me?=
 =?us-ascii?Q?BOzVvQMMs2VpanCDE0GvyRbGzrDIONrjYaseATVER+5QZ37cZw7922SDAvKs?=
 =?us-ascii?Q?1nzJQZ9C3QbR7iRK4trHVZBE1+gQd4oNSP8TXZ56Omq0O4PsDI/wC0it9BV7?=
 =?us-ascii?Q?tbNK/yBH5kHwg7YZdk8Zjuo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4349403b-3df7-4967-e855-08d9e4c0bdd6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 13:51:12.1654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RG0+RmlhaeUJdUNSqJye1BW0pKAq/tal4g7/odfhaPOppqmbGJF0x4knbGDnIqHSUPYJWZUXMPClnHaHErWOVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7359

On 31.01.2022 14:41, Oleksandr Andrushchenko wrote:
> On 31.01.22 15:36, Jan Beulich wrote:
>> On 31.01.2022 14:30, Oleksandr Andrushchenko wrote:
>>> On 31.01.22 13:39, Jan Beulich wrote:
>>>> On 31.01.2022 12:23, Oleksandr Andrushchenko wrote:
>>>>> On 31.01.22 13:10, Roger Pau Monn=C3=A9 wrote:
>>>>>> Right (see my previous reply to this comment). I think it would be
>>>>>> easier (and cleaner) if you switched the default behavior regarding
>>>>>> unhandled register access for domUs at the start of the series (drop
>>>>>> writes, reads returns ~0), and then you won't need to add all those
>>>>>> dummy handler to drop writes and return ~0 for reads.
>>>>>>
>>>>>> It's going to be more work initially as you would need to support
>>>>>> passthrough of more registers, but it's the right approach that we
>>>>>> need implementation wise.
>>>>> While I agree in general, this effectively means that I'll need to pr=
ovide
>>>>> handling for all PCIe registers and capabilities from the very start.
>>>>> Otherwise no guest be able to properly initialize a PCI device withou=
t that.
>>>>> Of course, we may want starting from stubs instead of proper emulatio=
n,
>>>>> which will direct the access to real HW and later on we add proper em=
ulation.
>>>>> But, again, this is going to be a rather big piece of code where we n=
eed
>>>>> to explicitly handle every possible capability.
>>>> Since the two sub-threads are now about exactly the same topic, I'm
>>>> answering here instead of there.
>>>>
>>>> No, you are not going to need to emulate all possible capabilities.
>>>> We (or really qemu) don't do this on x86 either. Certain capabilities
>>>> may be a must, but not everything. There are also device specific
>>>> registers not covered by any capability structures - what to do with
>>>> those is even more of a question.
>>>>
>>>> Furthermore for some of the fields justification why access to the
>>>> raw hardware value is fine is going to be easy: r/o fields like
>>>> vendor and device ID, for example. But every bit you allow direct
>>>> access to needs to come with justification.
>>>>
>>>>> At the moment we are not going to claim that vPCI provides all means =
to
>>>>> pass through a PCI device safely with this respect and this is why th=
e feature
>>>>> itself won't even be a tech preview yet. For that reason I think we c=
an still
>>>>> have implemented only crucial set of handlers and still allow the res=
t to
>>>>> be read/write directly without emulation.
>>>> I think you need to separate what you need for development from what
>>>> goes upstream: For dev purposes you can very well invert the policy
>>>> from white- to black-listing. But if we accepted the latter into the
>>>> main tree, the risk would be there that something gets missed at the
>>>> time where the permission model gets changed around.
>>>>
>>>> You could even have a non-default mode operating the way you want it
>>>> (along the lines of pciback's permissive mode), allowing you to get
>>>> away without needing to carry private patches. Things may also
>>>> initially only work in that mode. But the default should be a mode
>>>> which is secure (and which perhaps initially offers only very limited
>>>> functionality).
>>> Ok, so to make it clear:
>>> 1. We do not allow unhandled access for guests: for that I will create =
a
>>> dedicated patch which will implement such restrictions. Something like
>>> the below (for both vPCI read and write):
>>>
>>> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
>>> index c5e67491c24f..9ef2a1b5af58 100644
>>> --- a/xen/drivers/vpci/vpci.c
>>> +++ b/xen/drivers/vpci/vpci.c
>>> @@ -347,6 +347,7 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int re=
g, unsigned int size)
>>>   =C2=A0=C2=A0=C2=A0=C2=A0 const struct vpci_register *r;
>>>   =C2=A0=C2=A0=C2=A0=C2=A0 unsigned int data_offset =3D 0;
>>>   =C2=A0=C2=A0=C2=A0=C2=A0 uint32_t data =3D ~(uint32_t)0;
>>> +=C2=A0=C2=A0=C2=A0 bool handled =3D false;
>>>
>>>   =C2=A0=C2=A0=C2=A0=C2=A0 if ( !size )
>>>   =C2=A0=C2=A0=C2=A0=C2=A0 {
>>> @@ -405,6 +406,8 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int re=
g, unsigned int size)
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( cmp > 0 )
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 continue;
>>>
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 handled =3D true; /* Found =
the handler for this access. */
>>> +
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( emu.offset < r-=
>offset )
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 /* Heading gap, read partial content from hardware. */
>>> @@ -432,6 +435,10 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int r=
eg, unsigned int size)
>>>   =C2=A0=C2=A0=C2=A0=C2=A0 }
>>>   =C2=A0=C2=A0=C2=A0=C2=A0 spin_unlock(&pdev->vpci_lock);
>>>
>>> +=C2=A0=C2=A0=C2=A0 /* All unhandled guest requests return all 1's. */
>>> +=C2=A0=C2=A0=C2=A0 if ( !is_hardware_domain(d) && !handled )
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ~(uint32_t)0;
>>> +
>>>   =C2=A0=C2=A0=C2=A0=C2=A0 if ( data_offset < size )
>>>   =C2=A0=C2=A0=C2=A0=C2=A0 {
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Tailing gap, read=
 the remaining. */
>> Except that like for the "tailing gap" you also need to avoid the
>> "heading gap" ending up in a read of the underlying hardware
>> register. Effectively you want to deal properly with all
>> vpci_read_hw() invocations (including the one when no pdev was
>> found, which for a DomU may simply mean domain_crash()).
> Yes. And with the above patch I can now remove the "TODO patch" then?
> Because it is saying that we allow access to the registers, but it is not=
 safe.
> And now, if we disable that access, then TODO should be about the need to
> implement emulation for all the registers which are not yet handled which=
 is
> obvious.

Yes, I think that other patch then should have no use anymore. (To be
honest I don't recall such a patch anyway.)

Jan


