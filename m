Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE11530B04
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 10:13:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.335558.559737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt3BY-0005mC-Gi; Mon, 23 May 2022 08:13:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 335558.559737; Mon, 23 May 2022 08:13:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt3BY-0005jV-DX; Mon, 23 May 2022 08:13:04 +0000
Received: by outflank-mailman (input) for mailman id 335558;
 Mon, 23 May 2022 08:13:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ASRr=V7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nt3BX-0005jP-7E
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 08:13:03 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29dc1ce6-da70-11ec-bd2c-47488cf2e6aa;
 Mon, 23 May 2022 10:13:01 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2052.outbound.protection.outlook.com [104.47.13.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-19-bj4x5uwyMaWFPTcAAPSucw-1; Mon, 23 May 2022 10:12:59 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6868.eurprd04.prod.outlook.com (2603:10a6:208:18c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.22; Mon, 23 May
 2022 08:12:57 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.022; Mon, 23 May 2022
 08:12:55 +0000
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
X-Inumbo-ID: 29dc1ce6-da70-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653293581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UQ24r0YUc6qh7IvEhWFMsvsADczbMGaGoENmb57gQ/8=;
	b=bJT1ewnebu9TL2SOCAflQ9rnZrw1YeDj3URqpn4gJtq1+Gjxh/YBsSCCjVJ6Bn2qrCzpi4
	4cjG2zsioL8n8uaIEJ4AAB7dCa+NyeP/rLRpGkL0VsuNG3nCA6lLVA95zMF2enC84xyOre
	QlyPj86Sy/rn2ob2wgCX0bAx1KOpwCk=
X-MC-Unique: bj4x5uwyMaWFPTcAAPSucw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EnHbtDTT8jWc5S225ImFFQs8m+nTBccVKDsgzUxTj8XMMeGsKejurYXJGXIHZnHD/YJjbGUJU6cIotvoY3q6tRGoMbqJAWd+SIap8sD6JgO1+Wv/x6mNvkoeAPKvc1Y7pkxPeXfuwGljPCeYUn4JBuMbrtTAv6APd6PUHPMpYXfUtJ3C0JHZ8ut2F7Kc1SaP2pgwlEy5XRHsFKre1hvF1L1emX2oCKJf/IF3IwFNZCuFoVI6wKrpDkO8iQ/sXx6DzygFWivDvBfUh8dlDPCaHh3GqNdadwV3rt5j7P6a+m9axHDZ8iSWvg11f5OGna+2NxHPv0wh7gUEeJTsPZ8cJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B0IYNLEgBeHXbWvEkHgbLyf7B7ltz3Z71RxN3MdbvH8=;
 b=mflyaXZ8FDLXcryLUJGlIdmRA5FbQJJBWaaEkjyIGRH6Oaa/nyepoWAHoC2Dq6RVRAhrrKYDcO1XwscqZnkmnQeSn3tXoQIu8WXuZvJfGe/3UQdFuNKBj+1ozBxMrWc3xXmhj5ANKxj+PS1j8XjZ8ZRSc+GuJJT+g38AiBZ2VHROil5aqfYqCh70RHB0to8qdNzzP6rbkXaIiECdYMPRAytVYiHfFpbUZJeyGvp3R9sbLQhZB1p5buWAtEmUAaoWvc1JlMPDja6QDnWSn2ILTDLmuogecWhcvmEl/1FOrITgEGH6AKMkIkJhhwVtkbgHGs9oWp5ep6UcqfTFDJ9Bug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5330ca97-2b72-409e-c021-61ab4356e051@suse.com>
Date: Mon, 23 May 2022 10:12:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 3/5] x86/perf: expose LBR format in PERF_CAPABILITIES
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220520133746.66142-1-roger.pau@citrix.com>
 <20220520133746.66142-4-roger.pau@citrix.com>
 <33632dc6-940f-6737-c808-48e6c28fc0bf@citrix.com>
 <42cac54e-134b-dcfd-3ce1-1d6bfae9176c@suse.com>
 <e4d202f7-f4db-71e6-46a1-ee62ef41f2dd@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e4d202f7-f4db-71e6-46a1-ee62ef41f2dd@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0777.eurprd06.prod.outlook.com
 (2603:10a6:20b:484::31) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0716f269-a048-48a9-2c9c-08da3c940a96
X-MS-TrafficTypeDiagnostic: AM0PR04MB6868:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB6868EA773AE9D255F52AF89EB3D49@AM0PR04MB6868.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LXI7e2bTmBpl4vDgE1t+FALOVNunZ4D0xXYatuKwpdSzRY50C+eE39PP1ketGFBpPS1aL7nSNE18wwzyTgt2DmtLQoruZCl8GqlO5gNny+mfwK2llQPIhaOsDunhT99Ju6Wdw8x/YEi+AnGLYtGLkABv01b+V1MD5iYux55WogaSXiHQHTI40K3trUVS6nMg2Yidzjp30Lj9JaRslkGTH1JV0hWH6q8BQLgj1q2UgzHqa9N4yAzI4+i2IlD6ziEJcn+Iy8wfq70za6coV1gzei7CjojcMUPKPSW1hIoI2/r9ffCu/8aicVbu9BpI1je/TQcEd3zZHkxfjBLACumR0tkFhwAqP4dKGFT9bTYGenP6z3eSOKlYd6PvKaUXG59CTzlA7DXHiHdTEia7a2xUIj3tIDPeo69+UjCa2JD98m3QF99EMjGZwKfkrxg+uSzvPp9a0I1vhVC+3QV2SEcMfXwHHZW4Z4oWtq27EJdDb56Eba8R5nx/J9ngr1mpTChXWVAO11h3HJVPINnrUL0h45o7r427U4K39pqBzT9QaKUU0zZb78M/lXwi9/8c6KU4HXxlp7VftYvG7GT0kVV78UTfUd8R1Zdr1utti3BwoU3r2T0HPk3QHMAvyMPYfvVivKfAclJKDbicjrfNP84Kgfibl5nxlOCy5MWJbK6wNtPbV/QDRIjOJ+l/01mlGsbfRvvw5ikLlL26ajecTqR1F8Kv9vSepCoBCLxKvS2RaXCkbcR3xhtIfQn3USOTeNqz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(6916009)(53546011)(6506007)(508600001)(6512007)(26005)(6486002)(54906003)(2616005)(86362001)(31696002)(5660300002)(31686004)(8676002)(316002)(66556008)(66476007)(8936002)(2906002)(186003)(83380400001)(66946007)(4326008)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KwkmT+HL7E6uF/gsg0/QSkWUd/9Uaqla/Xe+rUik0dYPKv73AzWoxNZGeT/V?=
 =?us-ascii?Q?hcQ2cTVcSGfh+Xaidy27RKytjgnPHszh4S8i50vALsaGG+CpNSASKyOe91St?=
 =?us-ascii?Q?nFwa+nMKVm1xW7BPYCpd2HMfmu0xlgdXT9BzDMUYcc3nGBglIO+L39zkB46J?=
 =?us-ascii?Q?LLr937Gq7VUV2XX/1WI0Tf0y5mpl4psoZ85nOXxw6bhZ6XssrD4CuUhdOgk/?=
 =?us-ascii?Q?DsTVvxKt71AXetsQl9z8DHyGbsvV80x0NFTUgRZW3KPhnPEEesYbYiKSEsGT?=
 =?us-ascii?Q?cTHLue3uRwgSaSVOw3+dggWg8fIbvR+/dvzuFqjJqmwSwZIV1n4dhBsl99iN?=
 =?us-ascii?Q?bYhXEdKJvHoXeXClsqwzexfZqjJXeDy37wWoPIBlyL8/eWkvyrbt4arYHeO0?=
 =?us-ascii?Q?j+csk5Cfzk0qyA1cfKQFMxdsAwc5f5To7DCeJwDCQboO7GA+TfknY5OjcjZs?=
 =?us-ascii?Q?bKbZzPFH0IuxfACkxgR4PheF6JeNw34YnvoRS4lmqeElf0z1vU6SFuAtu+Y+?=
 =?us-ascii?Q?yp4rOX2zIbTeOubMxLUafXhr/5tFIYsPVmTE/hCa3IuHfMIvUkEcd7oBoVEy?=
 =?us-ascii?Q?CZ8TXeB1JQ+MXkeqhRQVn794tU7hNTRObnNHq2u4Gj+Dpn3SUKS4aIqHUKJ1?=
 =?us-ascii?Q?gQ/c+UBBLp1xVfh9Py96q0v2x+Tzf0wS29TPR1nGktSsMqkv1AnNtqcz6gEA?=
 =?us-ascii?Q?/4MUYED9ad0plI0UKOcsEk6grOVYGV5Dr2mc9MbZIF96Tza3YuMorrsKTctQ?=
 =?us-ascii?Q?mWAlO0vh2qPRkvFM0c0NOv/4Na2Xw8RfJqhOVdt20Rp+dqnrnAx1kL/NNQss?=
 =?us-ascii?Q?VO1/hdGu2T/mK8Dlq3eESQlDgkDeYOa7WqsA7787Z2x9p+szFrYdUDNXqcJ/?=
 =?us-ascii?Q?YiUkRdaItsQYstOWQKZUyxMMUGbQHr3eccDa+91NpfFQNGqFsBD63lU3dfwF?=
 =?us-ascii?Q?78oJKvGs+YmhaCbENlFQa3Ha1qiAZUrYtnycutXFf5D7ThlSHe6Xd2I6+JjZ?=
 =?us-ascii?Q?0Wh2IeNShmTrfGlQBNbjFjGw8a5btoMXDM1t1etcRmRGpBwuPUmIxpGo5n62?=
 =?us-ascii?Q?zcce91OIJ93k9/N2Vd9QAMsDXHHt8bGmUs6aWxRmXZda88kjuXnwPpA+ZI3u?=
 =?us-ascii?Q?C4ykURjiYHSBuyofOgJuyd58Z4KaCCfdjMBzbQV5sg3HN2zBtyp1zGnI/hRB?=
 =?us-ascii?Q?Sbq7zob2Vuq6cuNtDcksZ8YoQd+OEDvmCLH1+WNJuQXOgYCNPE7/kXTQfx8L?=
 =?us-ascii?Q?9j07fazmTfXSRdOlxknSJ8X4KOB8tzqyfQSMoSsYVPkKs5oyC7EcQVLdI72T?=
 =?us-ascii?Q?0RPbEta7VW04W4aGItnqksBeYg9g5dPIP3+r3tBOERgN6E5qQ15u5DlyOp0L?=
 =?us-ascii?Q?61W41AsYKZ0H6gfWE66tSS3ya1UuM6TiLH8MwDB/55ebIPYgAsC6EfjfTFp6?=
 =?us-ascii?Q?5oRajJihG1LL6NaP/4EaHPZ+1w1VU6AAp1FzG5KJl2hRpoAsXKuhuOe7R2FV?=
 =?us-ascii?Q?oDpGXfpgkSos6sMYxGLcgHIQvxdKoE7pItnA5SkT8oqKCDNUyHyXNtefihwQ?=
 =?us-ascii?Q?SynPp/fR3n3FsmL+wwlLTQh+Dl4DyHLZLck2bFp8fzC+1PkBhgrP2e7a7lDe?=
 =?us-ascii?Q?wVTTpeV6dwpCHKHxFft9ukE9HOjAD6xHgZO0UODAY8ZMZ6x8N0KwD7U2EJZA?=
 =?us-ascii?Q?dPWirV7taR9p11rNsH1W7BxdBjSS1qyxCRdH2E7yVQEkX2j7wiU/dY6hF+yK?=
 =?us-ascii?Q?+62ThuteMg=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0716f269-a048-48a9-2c9c-08da3c940a96
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 08:12:55.8192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e5oyvoRMnStgqVUmPFDgBTEIQ2+26j+YIoz3Urecdzn5eRCN7gevqg1Kmk4HXrDRBvaRziBaaD/WFHf7eeKRfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6868

On 20.05.2022 16:58, Andrew Cooper wrote:
> On 20/05/2022 15:19, Jan Beulich wrote:
>> On 20.05.2022 16:10, Andrew Cooper wrote:
>>> On 20/05/2022 14:37, Roger Pau Monne wrote:
>>>> --- a/xen/include/public/arch-x86/cpufeatureset.h
>>>> +++ b/xen/include/public/arch-x86/cpufeatureset.h
>>>> @@ -135,7 +135,7 @@ XEN_CPUFEATURE(SSSE3,         1*32+ 9) /*A  Supple=
mental Streaming SIMD Extensio
>>>>  XEN_CPUFEATURE(FMA,           1*32+12) /*A  Fused Multiply Add */
>>>>  XEN_CPUFEATURE(CX16,          1*32+13) /*A  CMPXCHG16B */
>>>>  XEN_CPUFEATURE(XTPR,          1*32+14) /*   Send Task Priority Messag=
es */
>>>> -XEN_CPUFEATURE(PDCM,          1*32+15) /*   Perf/Debug Capability MSR=
 */
>>>> +XEN_CPUFEATURE(PDCM,          1*32+15) /*S  Perf/Debug Capability MSR=
 */
>>> This is the bit which requires more toolstack logic to safely enable.=
=C2=A0
>>> Using 's' for off-by-default is fine if we want to get the series in no=
w.
>>>
>>> But before we expose the MSR generally, we need to:
>>>
>>> 1) Put the configuration in msr_policy so the toolstack can reason abou=
t it
>>> 2) Reject migration attempts to destinations where the LBR format chang=
es
>> Since this could be quite restrictive, and since people needing to know
>> they need to hide this feature for migration to work, I guess this would
>> further want qualifying by "did the guest actually use LBRs so far"?
>=20
> In practice, it's every major generation ("tock" on Intel's old model),
> so isn't actually limiting the kinds of heterogeneous setups used in
> production.=C2=A0 (Migration gets steadily less stable the further apart =
the
> two CPUs are.)
>=20
> As to dynamic, no - that would be a security bug in a cloud scenario,
> because there must not be anything the guest can do to interfere with
> the manageability.
>=20
> Use of LBR is rare, as demonstrated by the fact that noone has
> complained about the fact that migrating such a VM will malfunction.
>=20
> As we now have a way of reporting "no model-specific LBR",

Which only rather new guest kernels will know to look for. Hence ...

> I'm tempted
> to suggest that VMs get no LBR by default, and someone wanting LBR has
> to opt in, which is also an explicit agreement to the migration limitatio=
n.

... while in principle I agree with this, I see a practical issue.

Jan


