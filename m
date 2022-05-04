Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B99EA51A05F
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 15:07:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320716.541584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmEj5-0000YW-Kj; Wed, 04 May 2022 13:07:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320716.541584; Wed, 04 May 2022 13:07:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmEj5-0000V4-HT; Wed, 04 May 2022 13:07:31 +0000
Received: by outflank-mailman (input) for mailman id 320716;
 Wed, 04 May 2022 13:07:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IBxS=VM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nmEj3-0000Uw-SE
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 13:07:29 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 264f2cd4-cbab-11ec-a406-831a346695d4;
 Wed, 04 May 2022 15:07:28 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-exh7fVW5MqyLWgDWQUar8Q-1; Wed, 04 May 2022 15:07:27 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB5711.eurprd04.prod.outlook.com (2603:10a6:803:e7::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25; Wed, 4 May
 2022 13:07:26 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Wed, 4 May 2022
 13:07:25 +0000
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
X-Inumbo-ID: 264f2cd4-cbab-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651669648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a2g00xa9Q366Gjo2W3X1L9KuAwQR/CYQX5PBctOoVhk=;
	b=N47JmInkYTg2zFBXvg+WosC+LFV+witz3Fb/Wj/TNo/ZArTjtlRL5WMtrRjDskzU7yl76V
	kqex/DVlfUeI4+SNh4DK290RE057jZGYM3AGiRegdVUDMktcMUTZigtrtcwI9MGZfe8dNd
	0DmSU9dRXhoqm629sndbc1twvMNO0x8=
X-MC-Unique: exh7fVW5MqyLWgDWQUar8Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F/Nz2O8BLSfIRWX9dq6xrHxHkPiERNTtWML4mGVJlcBv8FieuOoRqQxTX7mtMaJWcCx28tayuu7TJnIYXimHSMIPfjC7ABXfRE6O08iUxqzbM6cQBqIjTvDbfiFINOlDPTNoDl2yiQT+MTMfXK6sfs9B/K7wlsX44lFempKeU114WG99SvoumbrsXMz2qdOdPbujkfjcUAkzYPlG+FFlhzzQ0P4GykqQd1vtZAMyrGL/SYtrL6sqomtYed4WzBr6jrdub3XPN61VtdQGVYGHL21WjUPPdZ+a+J+44gPPCXFJD45QgZAJKLLeAho1zmVDxcDfYuKSM1xH8AY32yD/7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pMgl4Gr/UeHBQ66d/DU6oKCkaWBT+A+HnvvjltgK/R0=;
 b=gosMQPsiDCukklNzqAjdwHd4x+Mj3lXFdv3bZTCDz/u+NEKdZlh0YIZsX8OKfZcuLwYADD5gyAS/q2A37v7hdrz3Xy6WuICKumoGAUxuyR8UVOx8oUbo4yYqGryB8AuG/DI5tHBM3l72dSgyIvdcpIyHOxqAY1B50PcIJVO6dl0xK1sPvnEJx3FW2Pr0pEXHPx8dM/361wHOPrZm1bG4cxtuXeccFoas2suJ7FO/hfPbE69AVXpSv56ynANBYc3IAzFp6a74MdCbMeMTZzIF9Q6RT1pxZZX1126rDSi67cjhACFhIAP6by8b4EUZWL5wHh//yQlLlMSZiTtli6tPig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2d0d8aa9-1ab8-a505-e2df-c9b6446062cf@suse.com>
Date: Wed, 4 May 2022 15:07:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 07/21] IOMMU/x86: support freeing of pagetables
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <1389c785-ffe3-5d8c-36f1-a923ce5250cd@suse.com>
 <YnFWW4zenNq/SAt4@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YnFWW4zenNq/SAt4@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR1001CA0032.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::45) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52f8f67f-4908-4539-954f-08da2dcf08bb
X-MS-TrafficTypeDiagnostic: VI1PR04MB5711:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB571168C669539717B87FE16CB3C39@VI1PR04MB5711.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RY6I9FDfR1nMs7YeA/QUs7V03yrphpods4lz/ggNKnvbWe/0620HwYUsNyAhIY4MGEaS6Wg7nhfo+4wndNqOIDa2mb79zGkcWuXbeFD1kMaF/CxQ/j8jL8uqhRSh3+H2yOb0RfVHi63HI3Ar5JhdlHqd8ImMOHUIoAvSjIBFcViVu01xz90QI/nVi25+k1KL/4O802Wb0iaM3A2H+RXpOYA5DFCYbPNTk7uANZ32XujNQJRoKEailRiZUZvyka0F4LWcFryr+S9g1liV9ia5C1+bOS5aOsEMARitoCm62RaiQmyigseffi0HDqOr7vUhVHhHnBLwSbi+hATC2EEBdXskgYOoUaUWRXwP5hKZqrKtAtOcO7S+9vgO0nvQ2eJ5C5Sqrx+laaMbz6vC3Tu4SsmMdrwSqtKH76deKv3DxBKNaJuh6aOIJUuSiug4KDEkCExrzN09WsNfAjM3nJqVWS7Yqsl0uw93+vIFaHbD9DRmN7rbvBVHfa1uLFE8lp0u6MUUnT5gXO6h2rC4eWpmkGFVPtj6UncaV+gMkOO+BgtzCv6KgrtOUT1ouxLCyas2NyYteXgQBAd9Qbmb5UL7UdG8tFRGReYqyHRDKjBVgGMux/2gwaxssneu3HljRVs7YYr4putBBKOhn323JhCJuhUudvBBWghsrbyuj06JMad1DtVVprs6xeU/nhdXSkU015TrgRZsCaBLKJWSGSoDmVKD+oB6266Fke/a31CRyFc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(26005)(6506007)(6512007)(66946007)(2616005)(86362001)(54906003)(66476007)(8676002)(4326008)(186003)(8936002)(6916009)(66556008)(36756003)(316002)(5660300002)(83380400001)(31686004)(53546011)(38100700002)(31696002)(508600001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ht1guBpo30JPhOyapwo/I6ljelQCiS55CFaQMQM+EpiuRvkZ8U6XpAjooXjb?=
 =?us-ascii?Q?v4vELA460s1ffcF5c02B+pChCF6Ouc3q7H4OwD9+YIaYOOqI9ZscyM9OpW66?=
 =?us-ascii?Q?uJSYWvuqaJy3t10uD5h61wDOO6zWxopB1XYGDcEDrSjMCIiuGISfWyfT8KU3?=
 =?us-ascii?Q?ZDqvBAibjQEEBMoZGgWgIv4L6qE08OD9d67RCQc+cAttVrcnL2PPaHRS0LF2?=
 =?us-ascii?Q?53bTh2eA7kP5rGVQPt3J76XlgVYiGC7nCyCsMvJcpQhYuNP8qUwr20t6pkha?=
 =?us-ascii?Q?yG5xm2CVPAQLY53WhLMAOa7abfk0OU3/D1qxXDFdx1sowf6CsmzSlw+IMpaP?=
 =?us-ascii?Q?uJkMy6oVH4RnlNLaytJWKpeXJ17ZbZeYn9nv6LM9JzmLcuHDbd8TNYvaIbTa?=
 =?us-ascii?Q?kjyaL1z3qEGO9a9ejCpKuZ+leXtsgvD3M56bnfIW7eLcU7Usxm5IO3tWcXL4?=
 =?us-ascii?Q?RbGDPdExzhLtGkF8Pfui92fsNFWoafgueZjh4x+A4dC2KbAZ2Iuv0Tv3GYTx?=
 =?us-ascii?Q?Gu9Vuu6401MtYnom5eNLmREbElWT/YDn1qmT8njhwgpVgP6dVGC/6nOYVDNe?=
 =?us-ascii?Q?Um9wKw3Hhouf0qvBJLVd3y2l5hi+kpJlsW9aCtsQdrzU9ERoaL0skVMCU3QF?=
 =?us-ascii?Q?KGNNFZYh0NFz/neO2z6AEDBYMCr9JCxIUK9OZrFUeq9KSVkDGYW0hgxpZahR?=
 =?us-ascii?Q?OkImvpVELv42WGAPWmfDnDP6f8FsKu+5U/e9Z4U/nzoqrQzQD92dqlhdT/sN?=
 =?us-ascii?Q?6b4YrHH0CWHceiB3bF1EW9KkyP0dkI4H3neSuWjOvVsGXHV0a3aPtzmcmL1d?=
 =?us-ascii?Q?veLl3QwxoS+pDJkIs1oqGPTNzgsa6JnidFbmLsuXRlS0SbdqTEzHo/d6YL6m?=
 =?us-ascii?Q?BPaQQEm/kwEFigVc22GJLcAtotOFXUKlmialU0q9rBfdjvWaE+YgQeXBF/pa?=
 =?us-ascii?Q?cxUqsc12k0UF9hR+0rdF4fMrgVNsc8qawoafDKD+x+fo0IAGhmnl9FsBy+Ca?=
 =?us-ascii?Q?5foOYYyk1+CZr05TnuoO/M07cOikFvRfJgvizWY5ElOVSzS3s4pJFxi6C539?=
 =?us-ascii?Q?Z1mE5BLPJBJA5U4FW2o48EhwjiXOcqgXLQirceRdQAEpAieYNzgL0/j+Sk3W?=
 =?us-ascii?Q?Jf9OEy789vrPfi7YA8PAQdVJmc2Av+bFbSjf120Y25+6Pwn7O26b6npEF3so?=
 =?us-ascii?Q?E+M5LLAwVqzhyP/7AThIIbEQZ4K8VgbZ8vPkM/figW1YocTPRIeb/eldbJt2?=
 =?us-ascii?Q?igKRFlL8YcVTaS3wHvNOjhxek8mBAT55KmEHvCEem8pXY1uTMuA71WqiDcQ9?=
 =?us-ascii?Q?bshcG542Bz6ZJLLg1cSXXkYp4z3uwg6ytCLUUBXcK1mbp8LnPlOIg7o1TDV9?=
 =?us-ascii?Q?LISvoMbQq0xL86zZxcRDQpWMfDSKjvgh5Ux1LRXNtlwCT+giqWmb970r7nFO?=
 =?us-ascii?Q?pb6em6Z+sKrjBN82ZdswMWlEET4Mfzj+mRWNZdU2eWfgmAjLNsQWx/9PZNrD?=
 =?us-ascii?Q?TBJjHZz/pcHfwQdiNBLjW96ccWxwOvN1rtWzwx3geBDdpgYZINREGWzq8mio?=
 =?us-ascii?Q?2+nbiZ86vIOohUAb3ewE4RcIPQTXXbt/8Ptvml2jrsR8amcpDZ7CYGx9OQQG?=
 =?us-ascii?Q?DPghIN+Ec5Sn4Q8xHMK7pt8+pZiE4kzlx5z30sn6PSjAO8+EkN+mjobtE7Iw?=
 =?us-ascii?Q?QHkBJevslwo4A6Z09Y79GDgG0fmV50Qo+SG/IEVEYxLyRrQyPXfrvdYdmRRJ?=
 =?us-ascii?Q?OHQHfjMa7g=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52f8f67f-4908-4539-954f-08da2dcf08bb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 13:07:25.8555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +kd/Jk7vY4Kws37F+IsBwoVsjceJdkZAoS0fi6ZTyTu8DkdLMVCfw+hgKtTGlrxYgx4mnJll3RCsKaybHiCiLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5711

On 03.05.2022 18:20, Roger Pau Monn=C3=A9 wrote:
> On Mon, Apr 25, 2022 at 10:35:45AM +0200, Jan Beulich wrote:
>> For vendor specific code to support superpages we need to be able to
>> deal with a superpage mapping replacing an intermediate page table (or
>> hierarchy thereof). Consequently an iommu_alloc_pgtable() counterpart is
>> needed to free individual page tables while a domain is still alive.
>> Since the freeing needs to be deferred until after a suitable IOTLB
>> flush was performed, released page tables get queued for processing by a
>> tasklet.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> I was considering whether to use a softirq-tasklet instead. This would
>> have the benefit of avoiding extra scheduling operations, but come with
>> the risk of the freeing happening prematurely because of a
>> process_pending_softirqs() somewhere.
>=20
> I'm sorry again if I already raised this, I don't seem to find a
> reference.

Earlier on you only suggested "to perform the freeing after the flush".

> What about doing the freeing before resuming the guest execution in
> guest vCPU context?
>=20
> We already have a hook like this on HVM in hvm_do_resume() calling
> vpci_process_pending().  I wonder whether we could have a similar hook
> for PV and keep the pages to be freed in the vCPU instead of the pCPU.
> This would have the benefit of being able to context switch the vCPU
> in case the operation takes too long.

I think this might work in general, but would be troublesome when
preparing Dom0 (where we don't run on any of Dom0's vCPU-s, and we
won't ever "exit to guest context" on an idle vCPU). I'm also not
really fancying to use something like

    v =3D current->domain =3D=3D d ? current : d->vcpu[0];

(leaving aside that we don't really have d available in
iommu_queue_free_pgtable() and I'd be hesitant to convert it back).
Otoh it might be okay to free page tables right away for domains
which haven't run at all so far. But this would again require
passing struct domain * to iommu_queue_free_pgtable().

Another upside (I think) of the current approach is that all logic
is contained in a single source file (i.e. in particular there's no
new field needed in a per-vCPU structure defined in some header).

> Not that the current approach is wrong, but doing it in the guest
> resume path we could likely prevent guests doing heavy p2m
> modifications from hogging CPU time.

Well, they would still be hogging time, but that time would then be
accounted towards their time slices, yes.

>> @@ -550,6 +551,91 @@ struct page_info *iommu_alloc_pgtable(st
>>      return pg;
>>  }
>> =20
>> +/*
>> + * Intermediate page tables which get replaced by large pages may only =
be
>> + * freed after a suitable IOTLB flush. Hence such pages get queued on a
>> + * per-CPU list, with a per-CPU tasklet processing the list on the assu=
mption
>> + * that the necessary IOTLB flush will have occurred by the time taskle=
ts get
>> + * to run. (List and tasklet being per-CPU has the benefit of accesses =
not
>> + * requiring any locking.)
>> + */
>> +static DEFINE_PER_CPU(struct page_list_head, free_pgt_list);
>> +static DEFINE_PER_CPU(struct tasklet, free_pgt_tasklet);
>> +
>> +static void free_queued_pgtables(void *arg)
>> +{
>> +    struct page_list_head *list =3D arg;
>> +    struct page_info *pg;
>> +    unsigned int done =3D 0;
>> +
>=20
> With the current logic I think it might be helpful to assert that the
> list is not empty when we get here?
>=20
> Given the operation requires a context switch we would like to avoid
> such unless there's indeed pending work to do.

But is that worth adding an assertion and risking to kill a system just
because there's a race somewhere by which we might get here without any
work to do? If you strongly think we want to know about such instances,
how about a WARN_ON_ONCE() (except that we still don't have that
specific construct, it would need to be open-coded for the time being)?

>> +static int cf_check cpu_callback(
>> +    struct notifier_block *nfb, unsigned long action, void *hcpu)
>> +{
>> +    unsigned int cpu =3D (unsigned long)hcpu;
>> +    struct page_list_head *list =3D &per_cpu(free_pgt_list, cpu);
>> +    struct tasklet *tasklet =3D &per_cpu(free_pgt_tasklet, cpu);
>> +
>> +    switch ( action )
>> +    {
>> +    case CPU_DOWN_PREPARE:
>> +        tasklet_kill(tasklet);
>> +        break;
>> +
>> +    case CPU_DEAD:
>> +        page_list_splice(list, &this_cpu(free_pgt_list));
>=20
> I think you could check whether list is empty before queuing it?

I could, but this would make the code (slightly) more complicated
for improving something which doesn't occur frequently.

Jan


