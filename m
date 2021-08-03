Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2E83DEDDB
	for <lists+xen-devel@lfdr.de>; Tue,  3 Aug 2021 14:29:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163429.299376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAtXh-0002TO-By; Tue, 03 Aug 2021 12:29:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163429.299376; Tue, 03 Aug 2021 12:29:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAtXh-0002Qv-8u; Tue, 03 Aug 2021 12:29:09 +0000
Received: by outflank-mailman (input) for mailman id 163429;
 Tue, 03 Aug 2021 12:29:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfYh=M2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mAtXf-0002Qp-Oo
 for xen-devel@lists.xenproject.org; Tue, 03 Aug 2021 12:29:07 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2fb5e60c-5ccf-4c2f-96a1-2e1ae04c57f4;
 Tue, 03 Aug 2021 12:29:06 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-9-jmW1zcphMbuHNrvOl8MaUA-1; Tue, 03 Aug 2021 14:29:04 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6671.eurprd04.prod.outlook.com (2603:10a6:803:11f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Tue, 3 Aug
 2021 12:29:03 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4373.026; Tue, 3 Aug 2021
 12:29:03 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P251CA0016.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:b5::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Tue, 3 Aug 2021 12:29:02 +0000
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
X-Inumbo-ID: 2fb5e60c-5ccf-4c2f-96a1-2e1ae04c57f4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1627993745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NqlYz28upoXaBZzrhPMud6S8TyuxwmIdONwR19uI0Lg=;
	b=iBrzJ1lzVd2Sa2eQpS30SabD2WMon4QWajhJmZwgddPLgzje1AcB7xrfU1o1HYeqD9fQFe
	lQKrl5YZU/piUbn8wg/wTS12+tzAkojNXq/a/QHJ5f0pDM1mC0D1cNY0Q+hnIQeryDoTnb
	Db+MzwqXDseLRA+3rX9z802TQhZ7UP4=
X-MC-Unique: jmW1zcphMbuHNrvOl8MaUA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CCZxCalgkzuElPAvrRLK5B+6jmPhQdimQI0IhsoR6eVILywwmYnfxDFyKuKNNZHiHnt1+yPg8k6GfCsS2coKcj+yYAAH2FvfGEQjRhv6fNLVEw2qeUOCVt9iqY9uvDD+HiEgo5ncLCkd5lWak6PPtpVvfAmW1LJv8omJRgBiotjPjHyLAsQpjzG8b7hrS49JOWqD6ta9selnlJEsUv/6RhjH/+LtuEDJ2bBi6iC6RxpwO/9Me/ThX50qOka/Gy8Var8w6Jh/XP+ZoRvQ7hMFBb3txAQAXjlGbs4odsjpTEgRBaSIWiseWxXLP0FshHIGQaYmP4yHNw3pABsAXeSITw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V2o7E8kfBI04fuAlvqLmOKYeKPlP81uV+Pv1xEeV0DE=;
 b=BqM0w2y0u5cqwjbDy+4rtBLLPmwB3NMe2fHyX1Gvj+7NZhFp8RzCzYhCbcTe/zncszqqvRBW2ZnnYBmyXv62IWQUU/lKMivYE9gqdE5WBTcrhJSogTfT6CRPXH8vMkeKovEoexDC/JQ40fS9C8Q293DmRT07UkHSjhV8jdeU6In2NCKUo+FMvgJkPm0YhSSb8yPLocoq919duhVYqzFDdZqWG/+umuBWWk/WtylGpVtQA75IoIe/3hlMGZ54ppjmAlQwPdywYnzvap1f62FEcswVwhIWT9rVSrqshpa/qbDQvbQjkXXt8DeLtE90LMDHo91R8b3rIC2WT/I/yhHxOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH] VT-d: Tylersburg errata apply to further steppings
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <07ded368-5c12-c06e-fd94-d7ae52d18836@suse.com>
 <YQk0vrH5Oe62ozbW@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ec1cc65d-5a10-7ef3-2643-622302cdafb7@suse.com>
Date: Tue, 3 Aug 2021 14:29:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <YQk0vrH5Oe62ozbW@mail-itl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR3P251CA0016.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:b5::8) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce3cda01-2896-42ae-8a99-08d9567a472b
X-MS-TrafficTypeDiagnostic: VE1PR04MB6671:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB667133AEAF108C2202919BA6B3F09@VE1PR04MB6671.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p6FJTmccHwCpf+5fO469WqFODu5mJujovowBsbXY7CHlQsQ0mGnert2zcwkdqdtrMyDqHhEfTAsHFw11Gv48tS/k0dwkvjkgYsBCMK97Gf3VEiZfqtkZ3/uONJDjvo/Eh/qaWvL4RINUvYXdUjLyNZOjpAhqlmgaKi0B9HxHgbtqhPkz73/iLKWJ9A5qGMxS0yjoCFvgeYLRLbZyEJ9Cdw6gnqJC6+gUVrLMN842ltedfcARt4y3sVGlp3eJBVlIBwGYzMJmHOsfhoAIwS542qA87QRIXl5pSOclZS8lCnAX1yYxONlsInPxNs0o6UDboZQ1kzmjaTCtHaOtdUIcRWyF7G/WNwozGnXUVXLggi7r2RPXRxIpPzhGzyK5Ea3dostVHSDjHuUi0oZLjnEZTunCGXf4GBXueK5uqMjpizHXeu2AEsOEEAX6XNDW4GeuyHeT5ptrLGElqT0J9wG6CCKdKNVm3atfgTjAOBgGtwlf01XvBXsQaI9hfc8vop33MUTW+pWAWieWHUJ9UM69tck8PQiStw6JAIDxP6ZUj5qSdli12zP+VD1ZFnOZxuKc7HAYG0qUp1JLWqVBZwlii+PMZhBx1bV4k9RDPoNoq8OcrwMrF48X7QViPDnKSCe9sPgmPvOYw787g6wR7MGaZkusxwHO8N8tD81zUECZwz/4m3PxcPhT7jrapJfKROkzO6OllOuuYxlWU5gAo4CT6g84xB0Q5Ex4opKuYrc5sN4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(376002)(366004)(136003)(396003)(346002)(5660300002)(38100700002)(31686004)(2906002)(83380400001)(66574015)(316002)(16576012)(54906003)(53546011)(31696002)(26005)(6916009)(86362001)(66556008)(2616005)(36756003)(66476007)(956004)(66946007)(4326008)(8936002)(6486002)(478600001)(186003)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iHwDE5ztYS5XO/MkEG0WWotT0DGXAgFRcJA5s1VKVGig4q6eM59hxf9ygcWd?=
 =?us-ascii?Q?U7q8/pdCQ6Cq0CzgtkZXdGKpWsXb+hvCxBllnuNmz+vVc6FChdE12uxBgQhi?=
 =?us-ascii?Q?B4v88f5K1PyYPNTkD3CkkyjaPcR27DSLnLOoS77cKglv7oHZP0QiCGi4hXex?=
 =?us-ascii?Q?5Qt6r9+tUG5oHMytALGlUmVbjiBbvyGkwl0qc9/HCPed8uui/uMEoGKKcLc9?=
 =?us-ascii?Q?NO7+C/hUW8DSEzYRDd4TCelu7eXgS8qQ3jSUaCzZp6N1EszF+AzAwqp2be4p?=
 =?us-ascii?Q?8TCsFRjSJg8pBoteEqWLURuKw4JAvciZ0CGWZQLSXphfB6yn/MZooVgdbe7E?=
 =?us-ascii?Q?f/IJNTShbTg0mPCCLEX3u25L/U1sNYVYRGpyZ5iN0KyiCfCsOvxuCoWOBFvj?=
 =?us-ascii?Q?H/lmhkI1NSubsoIIG6v94sgchBTYsrZZx+JuApYbJrOMTL1uMz+w89Z22Htx?=
 =?us-ascii?Q?HRSjP3M5aD2Y7c0pT7atlkTIU8tWd7rpSz+Zkr37qBEIarH6iF0pwl+ddB9n?=
 =?us-ascii?Q?4pjc0iUQr3USOWBsAirvQDRat8LQfaZ9TuUbvlE86ssCLCtLhdyo8ZLN3Ifa?=
 =?us-ascii?Q?8WvoKNMERR92aQxDjh5H1sowUuOP2iU9S2Qtd/NDN4RQsNbhjxLsXTuSDhDm?=
 =?us-ascii?Q?OqwHgoF8fvXqUWNHRHOST8cSwzb4KeISVGCB+ttFJbURO45P5wsuH1i6jjQg?=
 =?us-ascii?Q?rSNDruUooPPWK4pkiJ/IJriykdpXlp/C/ktw1p3QNYrql8ANT5KSI1uO1OUo?=
 =?us-ascii?Q?NyBSA4TIAmaxVfPZ6SfiOc23S/P4SYtJ6u8SeU+hhVhD44wl6CLNPSCm5Icv?=
 =?us-ascii?Q?b30zCeX2ECWHtCFejdUB2sD8RAjD/qIhhsc1gO3xO0+EiL/qptOPZh3RYfG/?=
 =?us-ascii?Q?Wv2ZG7RjEYSKf07J+HCXTV4f0wrqnwanfV53LxclALuiJzqeeX/H086+CvC2?=
 =?us-ascii?Q?2Ez7P29kiEvIckOFbvruoYwZFCAAOvk8Hp7CI3Uxg+QsoWv8u2FIS4dJS+at?=
 =?us-ascii?Q?d75hNxB30E7aLbtJb5GvZs6lULfK+TZh6Lf4YMfQeu7Pjf/+BnC/Tdv1GEZ4?=
 =?us-ascii?Q?nyFxpTOPiEdSr1MFGt0Y+DENiib52IpuY+VFu1ML8J77mq57FRNYvO8nq0uc?=
 =?us-ascii?Q?paFpfpcJeOTBkjUduxnE+0Mt85giQ5WCNDMBrdSTKB0nbExQWysA7Am/eXn9?=
 =?us-ascii?Q?x/iAfF/7RoX3kz0Uangj0gM32Y+BVx95T1YLUX37GtKkbWYd4MfmIYXptGOC?=
 =?us-ascii?Q?lSamKkHkXvxFIawXTIuoHNu7jatvtQDc5BQ4sVWKbHlPZzEAq8D8PqqXlRYq?=
 =?us-ascii?Q?78ELNKqMS2vS5a0l4KhmYq5R?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce3cda01-2896-42ae-8a99-08d9567a472b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2021 12:29:03.0829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gsJiCQWN/iUV4uwxtfvO5cuNbJriD56O764jRopVDdEiPdlQIiL3fhNBW2xW4VF5l8NqOp69CLO0a4iWiGAFMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6671

On 03.08.2021 14:21, Marek Marczykowski-G=C3=B3recki wrote:
> On Tue, Aug 03, 2021 at 01:13:40PM +0200, Jan Beulich wrote:
>> While for 5500 and 5520 chipsets only B3 and C2 are mentioned in the
>> spec update, X58's also mentions B2, and searching the internet suggests
>> systems with this stepping are actually in use. Even worse, for X58
>> erratum #69 is marked applicable even to C2. Split the check to cover
>> all applicable steppings and to also report applicable errata numbers in
>> the log message. The splitting requires using the DMI port instead of
>> the System Management Registers device, but that's then in line (also
>> revision checking wise) with the spec updates.
>>
>> Fixes: 6890cebc6a98 ("VT-d: deal with 5500/5520/X58 errata")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> As to disabling just interrupt remapping (as the initial version of the
>> original patch did) vs disabling the IOMMU as a whole: Using a less
>> heavy workaround would of course be desirable, but then we need to
>> ensure not to misguide the tool stack about the state of the system. It
>> uses the PHYSCAP_directio sysctl output to determine whether PCI pass-
>> through can be made use of, yet that flag is driven by "iommu_enabled"
>> alone, without regard to the setting of "iommu_intremap".
>=20
> How does it differ from the situation where interrupt remapping actually
> isn't supported at all? Toolstack will use IOMMU then, in a way that is
> supported on a given platform. Sure, missing interrupt remapping makes
> it less robust[1]. But really, broken and missing interrupt remapping
> should be treated the same way.

I agree; in fact I meant to mention this aspect but then forgot.

> If we would have an option (in
> toolstack, or Xen) to force interrupt remapping, then indeed when it's
> broken, PCI passthrough should be refused (or maybe even system should
> refuse to boot if we'd have something like iommu=3Dintremap=3Drequire). B=
ut
> none of those actually exists.

"iommu=3Dforce" actually does prevent boot from completing when
interrupt remapping is available, but then gets turned off for
some reason. See iommu_setup()'s

    bool_t force_intremap =3D force_iommu && iommu_intremap;

> And disabling the whole IOMMU in some
> cases of unusable intremap, but not the others, is not exactly useful
> thing to do (it breaks some cases, but still doesn't allow to reason
> about intremap in toolstack).
>=20
> So, I propose to disable just iommu_intremap if it's broken as part of
> this bug fix. But, independently (and _not_ as a pre-requisite) do
> either:
>  - let the toolstack know if intremap is used, or

I don't follow why you even emphasize the "not" on this being a prereq.
I consider it a plain bug (with possibly a security angle) that PCI
pass-through may be permitted by the tool stack in the absence of
interrupt remapping, without an explicit admin request to enable this
(even) less secure mode of operation. Not making this a prereq would
mean to widen the scope of the bug.

Jan


