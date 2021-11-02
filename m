Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B42F7442FA7
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 15:00:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220254.381442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhuL2-0000t5-4w; Tue, 02 Nov 2021 14:00:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220254.381442; Tue, 02 Nov 2021 14:00:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhuL2-0000r7-1X; Tue, 02 Nov 2021 14:00:32 +0000
Received: by outflank-mailman (input) for mailman id 220254;
 Tue, 02 Nov 2021 14:00:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxJb=PV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mhuKz-0000qz-Sj
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 14:00:29 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 67cf0b3d-39b3-4797-bd7b-9b41aca23283;
 Tue, 02 Nov 2021 14:00:28 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-11-BAu1HQW1PQejTcJuCpUBqg-1; Tue, 02 Nov 2021 15:00:26 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3293.eurprd04.prod.outlook.com (2603:10a6:802:11::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17; Tue, 2 Nov
 2021 14:00:25 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 14:00:25 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR1001CA0068.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:15::45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Tue, 2 Nov 2021 14:00:25 +0000
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
X-Inumbo-ID: 67cf0b3d-39b3-4797-bd7b-9b41aca23283
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1635861627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6dWByail1OgjUCki+jjH6BIgPNl0pAfri+fzQ46mPO8=;
	b=k3fqsqEMHIXWQAa/eNbkLeg75Ic+UT9hi39hgZF0V+Un12YxjTOERr4UgKXnb357sgjOJx
	cvnIu6KlUSPSHBYoB830ROKDvQqaKrBwQWtV9+TVe3Mpg/9pxp/gopHXMfZjvQ+7IVllUS
	uy8gbQzqlQhQK47OSt1AAnFlE8tv5Ps=
X-MC-Unique: BAu1HQW1PQejTcJuCpUBqg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=og7FGUWuQ/2C2IEzU1HsoZ6T4/36AjI+Dn33OVGUjqM/CDDcwc7B+5xsYVsCSQHQnkpl+rhtwFnaAbbsKH4D7zEnrb0qNpO/+n99KRSb/XwX8bT1TuswdCtlmLDozLw/Ucq8/ztxbBpRPaUcfZ6LaSf0QXNfHjdevkMftXPJJcuVCdRxzMhNdFKRziKhdhuA3719xBIyaMeqpOBOOgBtcXBvlfBnACt5MujJsg3sDX6ROYV5Trjdm2R8qZZT8ngKfUPuM/R2GgaLS88B5/DMhNygH1KJmKZQ1Mhm7NDqFd19vs/ITuDJnR7LkbOARxdCLhQQzXcOZOgfdlzu3ty3iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DIylSAzZ9+lrIdokk6R80tpBA7paMaJ0WJdZy5302iI=;
 b=JQXOfC8XBV8RGr03kirSB3BTVVCTfYZdecpIrh0xJ6RERi+yr216mC8ERC4S645QI45gT1B8TP/QbBf6rX8Z3yZlkeSEptX4GFKbWPsax6xlY9ZFs2zNk+MxP/ahWF0eXe4XnTPyWRY9TA1+mUddckq4JuxXhdhhvcKSwFfF6OPzGo4BE+rmt8K4oLiL3L6shTl6jjPPWG1SazXY+rLpA1TWTN+JI8mEcSQkcnhBIoVy4WGX9fMS9C12DC6j6TnV2phYxUjwjH9iL7LlgDWpt0sMgIQH1iED1gNFkwNliQr6fLk20eWab1e1/OifZ26hbWIvCgnMKLFkI/AU4vt1cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1c604641-0dd9-6912-7bd5-02ee1cb868b6@suse.com>
Date: Tue, 2 Nov 2021 15:00:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2 3/3] AMD/IOMMU: iommu_enable vs iommu_intremap
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
References: <09137aa2-649f-08fb-ba68-75f8eb16fc63@suse.com>
 <ff7b68b2-5bba-2927-e3f0-f3062862c466@suse.com>
 <YXaGxX3J1aB39mSG@MacBook-Air-de-Roger.local>
 <dd2929fc-dc1a-1c16-5954-6894766d9dda@suse.com>
 <YYEa6HQGR1cHJBw/@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YYEa6HQGR1cHJBw/@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR1001CA0068.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::45) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d58f89b5-237d-4225-80d0-08d99e091eb1
X-MS-TrafficTypeDiagnostic: VI1PR04MB3293:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB329378BC0D6A3F9D3794D195B38B9@VI1PR04MB3293.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	viPfqOBW3fFyb034uGXwd7dkJIavW4KolPiTvR+3wxaTeUerob9+a89WTmD7RoE1AS9CJ8ee341yDjRfwks+FwzIQqW19eEXQt4xEfwhyjpqGAIJYsXPBGsYLqLdlOGA61RG4zvfKrWW1EZKodAPhMLkPJO3zLazhl+2N9eL2NUu2hEiD0FrbibVAsWtMBlA/wI4miOSbRMamgQCK5lmht0vxjrFyMfv50R/drIdfOpZ8brbnI2TdSQC3yjpsYkTekjYKl8IrH3QtxebwbJnOzemaFUiWZWMoqV1we2659Y2ybqsDKF8FLYiTpMEX4Djdorn2kPUUrOKB11L9G0P+qX3zI3mHOAV5515XJN9/A6VAO82WdavBu06AYrLU010StP/1FrCmvD32e32rOcf/ahVn9MNygDHJRlFsaTp6bXMC8NoDQvxBR8/Wg9sgsx4D4QM4a7SQyKudfOMnemkcSjP6PaVlIaaDZjcTq0kGYaCdjlMMtIuFa55pe+MWAbpT5cktGkQhupswgph2pga64JmzmRTns17nzsAtvrWhQnxXaDAp8HaA2/29/OO50nwuHw8rDI7PWCMawfzBkjWnFzsYiOVCJNbgsmUn9jk0zBJdt2HU6Ba/IfP/RyL5CmaqOA7f85WkCbMG90DNiA/2L/GJuKDUT4xU6a3DAjPoRgSl6bWPk9oh7TIZ4yKRux/quBrE0WgTK4p9tNoIYBCQE1AXDC+mFMOAvLbmEpE6wgpSNccsj+VBD5NxQU8r4vX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(8936002)(186003)(6916009)(6486002)(36756003)(38100700002)(83380400001)(316002)(8676002)(16576012)(54906003)(31686004)(4326008)(26005)(2906002)(31696002)(5660300002)(66476007)(53546011)(66556008)(2616005)(86362001)(956004)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xiIzXTT2Gt7pss3+iNpQkVLZBu5vjwKFKVXh5mNjQtwbL2vfgzuBfFfn80yt?=
 =?us-ascii?Q?FkM4PLwC6xYwmWjlcsTd7kLxRVNNAU5dSmc/O8pOBWKJu/F9oM3rgAhDheXQ?=
 =?us-ascii?Q?WtTlAlQ46U1cAHDaongUAx7BJX78bjZZDu0xDrXRb9BPwO5iVVY956PFZ+LD?=
 =?us-ascii?Q?8KrH8Ol6JIQBEVU2LCcwK/iYTk7uwjUtCSWQ/7kForhsDovqmthBQWfCU/Pb?=
 =?us-ascii?Q?opypKLl4vu6hi9YwHfya29ZY8Bv9biWP3qSZB60XeyPE1DERyp3SHsOZtdQg?=
 =?us-ascii?Q?Oo3QDLTLzMfdOkQrTd/ykq/Zq5jKspec30d95iXbaUlFEJeulKUSsjXM1lSb?=
 =?us-ascii?Q?DuAt+soCc/4aattFXzcLmlliWv22l1RjA6HC7iyCiUukk9Xje06Ys2zd8Vjz?=
 =?us-ascii?Q?+Q6tWNs1gmTCBKsPAhhe8ZCAMYDNvUq1v/UjY7Z6eeOhoP6iQySEyOjEbv80?=
 =?us-ascii?Q?E8vTU0uNO/YS5n7yjTqopuqUWcKmhxGnqFnDGxrsQ2nHKn92HY9C50nAtTUa?=
 =?us-ascii?Q?vLCaNKE1ru0LqjbT9VANLTGJKo3ShbxsEIVIUmrl1AGMy9SypqKbWBO9OaMy?=
 =?us-ascii?Q?bmh59B2XCZGWFy7pjRw7fks5szNGNLxIFxOnxMBIQl5qir9djzB7beoHFagp?=
 =?us-ascii?Q?GoNQb9Jgn0SogYbvAJaY4S0P1qyircY5741RJ6rKYpyk7YB/RgM9sYZSVjgr?=
 =?us-ascii?Q?3kG6uG4TBOON6n92ubqZtWGjsXZ99U3LE1NzSBKsJtp0dtkaQv0wSwQAjklV?=
 =?us-ascii?Q?Vn1DT/T+5UXtG+Nx2RzxzSQ9azFT37hjS6DEWy+lgRhK6KgUIPdl3xoR+0ZQ?=
 =?us-ascii?Q?uIm3fzzyMUM8DoJtsnwjHt/QAdVN9W1pEHCDdKgxg74Rbv5oqvzeJk46bpBE?=
 =?us-ascii?Q?HbEAOmAAzZEUfuQD2aCKVoMurY3wD8J8vam675/FLbTsunec/oED1k8dk5Er?=
 =?us-ascii?Q?U5vilO69pj/Rfj1c1530HdNKoOYlmZ73sYZGUnoGZXNZhLvmIrR6vIe2jxpS?=
 =?us-ascii?Q?NCHty6uYNsGvljl0N6ktOGffEeprnLKYeudN4UdS9Fpr0MAivT6o49GWEUPk?=
 =?us-ascii?Q?bI/JDmIQ/OEQnTTv98pe6ado7pXq+hZzS8HiDX0FuVy2WR20to9lLyZ4rDAq?=
 =?us-ascii?Q?SwoHPeQ2yp/KnNuERQaLBJDh4BhJaJLB7hwco+XgksJeXNctoTmL4G188Rnw?=
 =?us-ascii?Q?FUh6GHOcmm/Ab75coNq/8AQmjWytuk4gFD4eiUECN8gCSgGG07ei8Fx6ULen?=
 =?us-ascii?Q?zrOWrPGLM9QIpU6NaPkSbUeXwCv8aC2l70y7Z+Ygs0yE9S3ZMOVxdVdngUPo?=
 =?us-ascii?Q?LhCrz6cvi2bq1cprmf8Mk/Or9oA5+N8nIsaoH3IIhCcIAql4KMDIKqSFV59F?=
 =?us-ascii?Q?lRPlC1A55um+DYads2/rOA7Sb81n3QCFpEd8MyXJSHVGMGDpB+HSgGQWEat8?=
 =?us-ascii?Q?WZaSseSH4fDgvZy8y7XPTam+g7cyNXyvPOCPEBV+PZ2e4keW9KcnpDjC+W36?=
 =?us-ascii?Q?M0bGloq5tuFgnBUqMNM1GKnF70aGlfJAVtUA8Pq+UELHhcZhuDp2uJBEa2tn?=
 =?us-ascii?Q?8U3XjDxWTI3Z1InGu9rduo8FVNxrKx8JCewD6e+zM61/zJQbCnEk2CGBWbau?=
 =?us-ascii?Q?5274FSAI9F8qhJbYyQv7GBk=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d58f89b5-237d-4225-80d0-08d99e091eb1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 14:00:25.8148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: swJ9ll6+hx4DXde20bFhM1KCzxAJgiDZoC8jCoxTvBtJCr6F0GW8elmn+SYCblnUjd0tRDsXeaCxU/fRjer/JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3293

On 02.11.2021 12:03, Roger Pau Monn=C3=A9 wrote:
> On Tue, Nov 02, 2021 at 11:13:08AM +0100, Jan Beulich wrote:
>> On 25.10.2021 12:28, Roger Pau Monn=C3=A9 wrote:
>>> On Thu, Oct 21, 2021 at 11:59:02AM +0200, Jan Beulich wrote:
>>>> The two are really meant to be independent settings; iov_supports_xt()
>>>> using || instead of && was simply wrong. The corrected check is,
>>>> however, redundant, just like the (correct) one in iov_detect(): These
>>>> hook functions are unreachable without acpi_ivrs_init() installing the
>>>> iommu_init_ops pointer, which it does only upon success. (Unlike for
>>>> VT-d there is no late clearing of iommu_enable due to quirks, and any
>>>> possible clearing of iommu_intremap happens only after iov_supports_xt=
()
>>>> has run.)
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> In fact in iov_detect() it could be iommu_enable alone which gets
>>>> checked, but this felt overly aggressive to me. Instead I'm getting th=
e
>>>> impression that the function may wrongly not get called when "iommu=3D=
off"
>>>> but interrupt remapping is in use: We'd not get the interrupt handler
>>>> installed, and hence interrupt remapping related events would never ge=
t
>>>> reported. (Same on VT-d, FTAOD.)
>>>
>>> I've spend a non-trivial amount of time looking into this before
>>> reading this note. AFAICT you could set iommu=3Doff and still get x2API=
C
>>> enabled and relying on interrupt remapping.
>>
>> Right, contrary to ...
>>
>>>> For iov_supports_xt() the question is whether, like VT-d's
>>>> intel_iommu_supports_eim(), it shouldn't rather check iommu_intremap
>>>> alone (in which case it would need to remain a check rather than getti=
ng
>>>> converted to ASSERT()).
>>>
>>> Hm, no, I don't think so. I think iommu_enable should take precedence
>>> over iommu_intremap, and having iommu_enable =3D=3D false should force
>>> interrupt remapping to be reported as disabled. Note that disabling it
>>> in iommu_setup is too late, as the APIC initialization will have
>>> already taken place.
>>>
>>> It's my reading of the command line parameter documentation that
>>> setting iommu=3Doff should disable all usage of the IOMMU, and that
>>> includes the interrupt remapping support (ie: a user should not need
>>> to set iommu=3Doff,no-intremap)
>>
>> ... that documentation. But I think it's the documentation that
>> wants fixing, such that iommu=3Doff really only control DMA remap.
>=20
> IMO I think it's confusing to have sub-options that could be enabled
> when you set the global one to off. I would expect `iommu=3Doff` to
> disable all the iommu related options, and I think it's fair for
> people to expect that behavior.
>=20
> I'm unsure whether it's fair to change the documentation now, we
> should instead fix the code, so that people using `iommu=3Doff` get the
> expected behavior. Then we would likely need to introduce a way to
> disable just dma remapping (dmaremap, similar to intremap). That
> would make a much better and saner interface IMO.

But from an x2APIC perspective it is a problem to have "iommu=3Doff"
also turn off intremap. And indeed the option has never (fully)
worked that way: It clears iommu_enable, but not iommu_intremap
(nor any of the other sub-options, but there it's less of a problem
because they're not used in isolation), and iommu_intremap only
may have happened to either get turned off later or to not get
evaluated in at least some of the case.

Jan


