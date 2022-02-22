Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DC04BF549
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 10:59:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276615.472828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMRwu-0001Ia-Qt; Tue, 22 Feb 2022 09:59:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276615.472828; Tue, 22 Feb 2022 09:59:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMRwu-0001GI-N2; Tue, 22 Feb 2022 09:59:12 +0000
Received: by outflank-mailman (input) for mailman id 276615;
 Tue, 22 Feb 2022 09:59:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QzH2=TF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nMRws-0001Fw-K7
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 09:59:10 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 143334a9-93c6-11ec-8539-5f4723681683;
 Tue, 22 Feb 2022 10:59:09 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2050.outbound.protection.outlook.com [104.47.1.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-20-cxJ1z3WXNWa26hBKBIcljQ-1; Tue, 22 Feb 2022 10:59:07 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4143.eurprd04.prod.outlook.com (2603:10a6:803:46::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.27; Tue, 22 Feb
 2022 09:59:06 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.4995.027; Tue, 22 Feb 2022
 09:59:06 +0000
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
X-Inumbo-ID: 143334a9-93c6-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645523949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3E4DN5wu9eAa042FEHvhQ4k1rLrdlQXI+GccYDoUlAI=;
	b=bS2gdlm3qcbCJ8X0otVl78Ht04Rte94GjIYNbL4H5XlgwE31+FSqviQtjoXrIxdaK9PuIr
	td1Uyp6p5NhLXPjXdLHoYCJreQ5Dg7t81HLIV4ued14yFSC29AhIW0DziLU8rOqdh8m6Ec
	zoO9H39c3Xev3rvPfCx2w2VF9UCWB9g=
X-MC-Unique: cxJ1z3WXNWa26hBKBIcljQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bjfBmtCPoXXKd/O3hs9KhVKm9bpdHvtL4LqyKoSBWzy1Qp/+3Wz0QONuY4PMf/ozDuryb8zdVrGQseTaQjQLXBA6O4EGZr1+hWBlhMrBksduRySoCy0YfeTgf8Q1cSbZHhUHypApO2x/3wDqsWyq+ewkEkxmnR0y8ZcerQuoam5kwGKRoDAFYn2CqMuFdbA3ofLpri3sRJ+HrAIKm5LqemODWTZkaa3zojdhLj3W5H9Wmsp0mX0/3YGhtNr4xs2Mfh10oe90e2ljuN0ZfQgh7MCQq/9RY4kyjdAcSWE0Wzbv3QtK0Ube0aL0ZAj9Wg2bZEJ8jXN1pO/1IOKL4fK97g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BIuneDHh5RZByOlHybUEbZOMV0xtuh2BkQFO0M0WPII=;
 b=cJ3w5mGB7w/b3/j1mGUdpSjZ9Lt2vc8VJLYBWNfHYHpuSzquvGAXV6ABF3x73kau9/BZ1JzLLRoD9w/MIF3AMmTAbpbM5/5HwJk9c1spd0/STmCV/0V4YaCM8jEj1lJe0/0Cxf0aMRvBcJIW5kUCa9yk/2b3SELFEBFvtiQbJw9T0EnibFUQbsP8oQzA4BsSj0Gp6N/lw5Ako8D7ITyrC0YJEp3xPaHfRxcDhLpDpbPR4fJ/w7frJ7CaJr7UtV6zG7LX1sK8PcOtXjdkqU8zPUsyTauNPO6CHMRBKYUoKjB/rAS3z+mXAzezWgBoT28uffAdo1vlWbAx8VMutRplDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5f52598e-d72b-7bd6-b47a-d4ee2faadf5e@suse.com>
Date: Tue, 22 Feb 2022 10:59:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 3/3] x86/perfc: fold HVM's VM-exit counter arrays
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <ff461a77-93a0-5424-6565-2e947bec3912@suse.com>
 <6a2a47af-4ae1-2fe9-1190-e15b6ce742e6@suse.com>
 <YhSveDsp+3NW3hYX@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YhSveDsp+3NW3hYX@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0701CA0054.eurprd07.prod.outlook.com
 (2603:10a6:203:2::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f07c6c0-494d-4501-d9d3-08d9f5e9f67e
X-MS-TrafficTypeDiagnostic: VI1PR04MB4143:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4143CD24788DB3E0E881CB5CB33B9@VI1PR04MB4143.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rq7++xmmKfWnsO8v+XOJQPWulOGXOAgUTEmASZPbwaK0usQiZTDWgkQxvaV5Ah7CdV4d48FRdVDfFmNj/oDJqN4YlwAefZiNPJF2bNtWQfHBh3wOm3eMaap76Wb/ZruAByzhsTYzvX5M+VN7K0CCpvJ4o8BlihoY3Kf9JdSHm8wf+AO9Gh0gqGWxL5aq9TEIzTr2PH0Bd+QKHTmhVxLqwjPJTPn/DgTbmuthfhkkb3exqrFgVRR391Jpya7QdROneGubJPJHVeD830HSBhCwoQfC+cKzCNV87bWuLu7MM+Wr5I8G8DEIqMHAAiv/7ABpLt73XcsJkyLGf+A/uQ/umEXFgs6tMwE8tje02zcc6UQ7w+0JAjbsRXnE6iy+nsKgbitR6amn70d48T/8ZbzFzAve7TswgP8RTTpIx1QahyqYSy47Kw4BfE0sWnfI6ZXHz+XblDxqAbjX7VwxBuTilPZ5ORuieJ0y6NbwC5/st3KgkKp5qP4WJZFixAhhhh0oj/zIuZVrfIBrMa3hvvkSO/aO0yjIE3bvkXqArxnQOMXiyrjclMKeQpK3Vb10mlRTUA2ibpFwl8Q8HZTW6+AvGJc6OrZ93yDk/Td1Pp4+bXRcO3JVqw7HGG/vAuw2b+JqRiVOQi8M1JvJaH3TD2c5cUQi/N3PhYoYiYDPlNR5aow0SyGFqEbYW8cCqiesBZR+oOJi4YazbNf8FfBGJL0SKAN3luTdfrG72e4VU8BXunv7DWunx5kdi511/OgjkqtJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(2906002)(53546011)(2616005)(6506007)(66556008)(66946007)(66476007)(8676002)(4326008)(6512007)(31686004)(5660300002)(38100700002)(26005)(31696002)(6916009)(8936002)(36756003)(186003)(86362001)(6486002)(508600001)(54906003)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EyJcmu8JsBvunNNEfejp4pfiZd1YevvDroxe7pwF4SF7S1nqfMwLLrc3wbEW?=
 =?us-ascii?Q?rrRQ79b7klGJAG43VR3XfQHvTIcCXWYogcO5Ujye/mEMIoo+lE2PNuPlDVjg?=
 =?us-ascii?Q?Uuywh+WHof7K29MSsB2XnzMIUpMfdKXt47btSJ2BenufHGRdOKZYkSALiLlQ?=
 =?us-ascii?Q?gjx7+TJ8YxVD/yKXQQB0YByumADOFZbj4e/r5xtHws8eVDvcY/XdyN38O6X7?=
 =?us-ascii?Q?kKVkenoZz6wIMBlWu09bVXwnWx2WtsRKq33kRf1ocVoQGJQ4A6Vnc127PB9Y?=
 =?us-ascii?Q?0jXkMAK1kLLimvyDn6I10sRVlEKRMKi0QHBcS4jxAomeJXG7odXOFLN2Z2PN?=
 =?us-ascii?Q?4AsdH6NUiM7x2+A8bY7ztoJCwU13m8N/QtoRHXSGUSW4exNoe2VsJY45OIqL?=
 =?us-ascii?Q?o2Eu8xQbmsskKwe+eKGGaKr+P85vFFLGp+4tj9auJ4k7TpYEkn2fDMyaNnuw?=
 =?us-ascii?Q?c7TobCj4bNxNJyKQqCz90seJ/30kRMq5djqQKKVRi5UvWeY8HUTvoEdCZXEl?=
 =?us-ascii?Q?JNEiLBOnMWNlrY1VAskmHQEG3B5ZS0GYVf9v/4JUQNoG4vWdwKsgNt5t5sZI?=
 =?us-ascii?Q?4dwKme1AfsmFzGVTwRgyD9e8tYhcfjnNMkmZp0A2I0S7rizCGH4Z3IpuMzOJ?=
 =?us-ascii?Q?bl3khuwWU8ocjkXqekSfIzKwWZQgZ0NagnhV/qNdCjTjqvvX6A37wdO1nr3V?=
 =?us-ascii?Q?esx2SMVd/MLZmUate/Li11WPhlfmug18NjtXuP7OkzEmyUUqsjoOochMi71V?=
 =?us-ascii?Q?vi32k/rkwAGi9YnvlmxFTB5QHWDa4DcY8tTAQOqUBhBWEs7hjj1K2g0IBuOL?=
 =?us-ascii?Q?MPo6sxP74ZUdsMdwkpS64YGfl/rL10wR+XJ1yFGxe0tPmHjje0U0lto0eEvE?=
 =?us-ascii?Q?UZ4Dp/451WtdHK6xVK324/BUpUC//2RBTsiD9zhUQN/aNQjEAN+TMNL+c04g?=
 =?us-ascii?Q?PY3u05EYHkGKAHu4KxLRFkMHlh8RyVvgwrJ+A3DTNNoogHbqhY4283/tr/q5?=
 =?us-ascii?Q?kNi/mw4hnzlVF5nXVZMhbrRz2NUpst6AukMnQN2tplDcoQigVAZJkVHEwG+O?=
 =?us-ascii?Q?st2IAxh7TyOR5uTK52mh/hBM29uNUoNCMOWESnpMjQ6Xs3tWBh6fGoMo17Eo?=
 =?us-ascii?Q?HIChHCGxGkXXjea2sW9oSzQm35hooC1i8BWy4kqhZ7qX3NwylbLP9tTrwrQg?=
 =?us-ascii?Q?Ly9FJ/xOVF5aW8Xr9Mm5/KvcDe8o4cz1O/NmtMRO4ZF3wlTA9TXZXm0xWeN0?=
 =?us-ascii?Q?Tlf2EsEgabWfeu8BcVknSBWNbYDwc2hyWpnFsQ00ic6NaH8pN6RrCZHqKkmU?=
 =?us-ascii?Q?4+Dqv/Lp/OxL2b0Vep3Gj0Db3+aVyMqZXdSRZnHI0oZ7t7YCz3RzTR1gVCKY?=
 =?us-ascii?Q?sel4X5VSmdSAxgiqQK6wyNk15nSi0Bl+ARRZxC3vYLXqL4O/aoffuN/kMt1a?=
 =?us-ascii?Q?p4KkF1j4HRiVH3zzifNxv5LPsxB7XecIdyLvHVElTqfIQuhfhC30ouWm7y1n?=
 =?us-ascii?Q?btG6QGthsdkuLUIxXFxVVXt0GkpJLI4NeFi32078Hi5CclhlsJh0kaPHEiXm?=
 =?us-ascii?Q?plM518f48UTPZ9dBnIfjfT9pLfoVzesuMK07QftPBbwsu9jv/XeO5KC95I+A?=
 =?us-ascii?Q?MJJSGV+sdVX+KK7emjT9FvA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f07c6c0-494d-4501-d9d3-08d9f5e9f67e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 09:59:06.3516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: irjIUk1qtMejn9x2NI4wLxO90tn7/ghKXYVu+mV6sxE3EMX0jyB01X1RDOEqsom1F5758UcDsZxjRukdAlxdYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4143

On 22.02.2022 10:40, Roger Pau Monn=C3=A9 wrote:
> On Wed, Jan 05, 2022 at 02:59:03PM +0100, Jan Beulich wrote:
>> Only one of them can be in use at a time, so make the whole set union-
>> like. While doing the rename in SVM code, combine the two perf_incra(),
>> generalizing the range upwards of VMEXIT_NPF.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks.

>> --- a/xen/arch/x86/hvm/svm/svm.c
>> +++ b/xen/arch/x86/hvm/svm/svm.c
>> @@ -2644,7 +2644,10 @@ void svm_vmexit_handler(struct cpu_user_
>>          goto out;
>>      }
>> =20
>> -    perfc_incra(svmexits, exit_reason);
>> +    perfc_incra(vmexits,
>> +                exit_reason < VMEXIT_NPF
>> +                ? exit_reason
>> +                : exit_reason - VMEXIT_NPF + VMEXIT_NPF_PERFC);
>=20
> Should we assert that the index used here < SVM_PERF_EXIT_REASON_SIZE?
>=20
> Just so that adding new exit reasons without increasing
> SVM_PERF_EXIT_REASON_SIZE is not likely to go unnoticed?

But that's what the comments are for that the previous patch adds.

Jan


