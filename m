Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEAD51D515
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 11:59:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322843.544285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmukT-0001Su-W1; Fri, 06 May 2022 09:59:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322843.544285; Fri, 06 May 2022 09:59:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmukT-0001PV-TC; Fri, 06 May 2022 09:59:45 +0000
Received: by outflank-mailman (input) for mailman id 322843;
 Fri, 06 May 2022 09:59:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H7Ci=VO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nmukS-0001PP-UL
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 09:59:44 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 40add70b-cd23-11ec-8fc4-03012f2f19d4;
 Fri, 06 May 2022 11:59:43 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2108.outbound.protection.outlook.com [104.47.18.108]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-11-Ji18vRBoMDCbSM4Fh5TEdA-1; Fri, 06 May 2022 11:59:42 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by HE1PR04MB3307.eurprd04.prod.outlook.com (2603:10a6:7:23::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Fri, 6 May
 2022 09:59:40 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::84b:e9d3:8906:8b9c]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::84b:e9d3:8906:8b9c%6]) with mapi id 15.20.5227.018; Fri, 6 May 2022
 09:59:39 +0000
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
X-Inumbo-ID: 40add70b-cd23-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651831183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uWgqBKMYwVL1ucTGvYfEd14aArsaIvpUJfq5Cn+RyA8=;
	b=Pw6/29a3Wl4tefwS+rP8VqqqDYsRW/JJ+3ZKtvtM05IsIL1INZAy9kVFwWi5PO6oRi4xZr
	ga5wyscDtFIRE8LgAoENCxTdMSD+q7ZaWshIvLqj1n4vUgO/i4bBFokfzzWDKYfE/hBnob
	0d5jUg2oH81lUAL1JopAWaAqOTGjkyw=
X-MC-Unique: Ji18vRBoMDCbSM4Fh5TEdA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JkumnEpyo+bGYCA1eZRSkFJA+5DKWt7gDZomGVi+m9Vqp93DvK9mypCwX0UDS7WZfIcYBo/V30ECcxVm34QEBW9Dsw2iKgng8XR/reY8AUA72i/FvBGrxENLuk+xTNdXrLNEfMhC11d0XQbLqAHH2XMqeTr7k668AWh3sMAQi+cv/VKQYzLLQKlFkaI/U3JFd9F6ebeofI+eMrtcpieseWZQvDn3T6ER50ignjrBwavvEw6ptR5S/Nh6hTuwo57vGm9sVWowek259HRMVQo7mS/9p/u2FptOHlSump5uPRMa4Gsu83LmVHxaeEk3qlvnaPeD08XalnKAGjriGHrGow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iMvuZ7/xlozp6ZJdbEAzUbBzJf9NxYJWRlrX/bBoddE=;
 b=Kdr4cVAN70ijhNkQty3yr5udnnda2YupBD6LqbyW1j6mM2HTua5a5JFGcrsi322rOhTRvExnx7IWGYEaKHSg0rMxzbYRTFSkDdxrWucn2p+NrTce4SQyB1LaCX8JeVEFfmEbVFWUTgZRGvtfgqBhec/6mjnHJNcdKfCkrlgFNMv2Dfw/taTnqUI7myDepwES6EMDj3kACCD4HLO298ojTaIuSmpgDRTP2smD1uHYDoSrkBcfetS+kVOGZFS4em0g6iME4BFpyAoZZuitSd75T7Vm9gOV3PvP9ME4GYL9jVG/M9PvePcuI2IkQspOcQtRLVWEJ4JnYd71ZRf+wxzOpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <29ac1ea3-9661-f349-aa3c-55437903639d@suse.com>
Date: Fri, 6 May 2022 11:59:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 12/21] IOMMU: fold flush-all hook into "flush one"
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <024c89df-9cf9-4d74-116d-ca8481dca90b@suse.com>
 <YnTeiRV0yioRYBpQ@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YnTeiRV0yioRYBpQ@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::17) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e110a15e-eb2e-45af-512a-08da2f4722bb
X-MS-TrafficTypeDiagnostic: HE1PR04MB3307:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR04MB33078437A95369E09A4C376CB3C59@HE1PR04MB3307.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	U9jm/xSxR2ZDwWJ49lMU50MZubMOd/GgPbwJs/bkstw0OQ2HW3bpuRXV8sgF981oa4aDSk19w9+fyfj0lmfSfabkG9d8fu0mu51xqp/AWi0YyyYJJ8L738j/2O+qvBPo2ce0B77C/uLAvCr9bdxMClvkm92vm2NGnBZXNYCNNG35QK+R6heSEUjvHUXHwYERBb9pbAIYRCcrJ43QMlwHn3Nxqv8AnTDyIECImRqR+hrgKuSKtQ3lR3StxCJZ4zwSEkfKzUJhF+WghqmvsrA2sAeL42T2eeVk/JFOCue+k8iJXDydUgKDha9F03zIWtm6IjYSexsV2IKyOvwaTgO6YsRFrwIOpTKY530KLOP+YhgZLnZQytmf6jgeJbwZWKlmw1WRBlmp+KF8ZRBBlEeh2efy2JlK9BXHgvbxhOChFvgaUA9Fbj9DxjA7OwqJzH3Mb/e9RXwA/thadlsXSNgDg64Qh8jRwSdAu5L8kC8BEaYiDdNiDetF2zlv9GaPxCTMSUxJSeuG2j/o0GK81T68rtK88UCqweQHq/gAphGJrLtg4vVeD/SU2jgAPVorWysF8B9XJprkZD2FaaJA3i/B+C/Sly5R+YhSLsTWB5DjWqaCdAbq7zmOEDjkftkRWkZp3qDtJVQRNLMVjeS6prK8PA4Bknaszpw/JYERFZAz+zGAWkU50BVuiCHZVnHc38AI4EKY2Dub1u+8wg8ixCqZTZSEmOvg1lmY840Sofr06i9Z0eNMIEU0v0QIl79Oxc62
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31686004)(36756003)(4326008)(2906002)(66476007)(8676002)(66946007)(6916009)(54906003)(316002)(6486002)(508600001)(5660300002)(8936002)(83380400001)(38100700002)(2616005)(6512007)(26005)(86362001)(31696002)(53546011)(186003)(6506007)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Za5LGkmL8NToVyQbAvqRcIJxqiroExiwcJDXvFJw8jhGqJA7zJApIZNI9WGl?=
 =?us-ascii?Q?V053S01wxz5e33jqrafPxxeGYexJgoia+mYc9/Odc7x38PM/UO3nlJkqTSFs?=
 =?us-ascii?Q?lzGICekNuc2JyiEKnu5ktZ7irLO7KXXe8G0KmUTTlrK9Mk07b9IF1JnwNOw5?=
 =?us-ascii?Q?EU93M4UFVb95RcpfUryk/8L2SSpYTSE4p8f78GW57YryZM/LxMr9Jjr/Gmyh?=
 =?us-ascii?Q?tMBSqIJT7u0jPjyKHb/I0nrwPco9Olkm3tg1EW3B4YzMRUmNeaUZ7cYM9x3n?=
 =?us-ascii?Q?okU430igT+wDi6ZZI5ZtYYkgrFndylBZYRsV6B2ncC9s7WWrik2u+rLjLIal?=
 =?us-ascii?Q?GXPWclsqE+cjbiR0kTU215GdoiM8WfFa/hDsJjinaI1JIkD/gdbtVLHlqPWl?=
 =?us-ascii?Q?95mcxhvY4w4UAH+OYaj8EDkJ4Tp4QS07XfxvJ2bn+R0kHK0KmZ34MUyNwHk0?=
 =?us-ascii?Q?+ikxXrNsgRRKWcOMmVv1eT2GaeETOW8lRiifJ+cjNxWw+EtWTf5/F55ydQ2v?=
 =?us-ascii?Q?ommz3BfC+7BFK1WXnWG7AwKqvniYAzRwvJsbw2t/WC7h68dVKrla6v4NisNW?=
 =?us-ascii?Q?jC7KYiy1NmqZeiGal1+Mj1OHSmYmOoXwr9f4ll7qTPUW91CYx68k04WUf05a?=
 =?us-ascii?Q?M0Px4s+IOmdwmM+jQN4z7XFeRuxRkW/t5wS18nzp1rFh3PkLECcKk4dhv8aV?=
 =?us-ascii?Q?4RH0zM1UxL9J3p1ILCS7wrKJQ5PdbFnyuNEXOG4VAUDkI4EoUP41VL48M4aM?=
 =?us-ascii?Q?dAsqawR6izHR2F5vpxSjZuG5dbjIabAnNBGwnoNXxvVBJ0s8KhOKnEXutYmC?=
 =?us-ascii?Q?RZowEUcED6upNw8Wqk+fxgBSLrZdD86c3DUuns+EJ1axyd6BdvT81sPxjpAt?=
 =?us-ascii?Q?rpjXJj/XXQEVRUn95p2WB4cMPFPe5pbWWmodZfnWxoUz3lthEguYWv2eofqN?=
 =?us-ascii?Q?GCLwrpz7twP0KS2bkdOLpQzf2CVfZWQ/Cqcao4CoCcWHxCB808VMtvVi1bGv?=
 =?us-ascii?Q?sBzPThyRXW1PrfAoblt7Fxg9M6nM6abwoW96RQ5VWFfEXEQ4dCpr699RutYP?=
 =?us-ascii?Q?mWowQA8OTEogRudPVqSjmf2JQEXNbPul2TDlXOkM/DWK2DMtCVWeTO/+k92a?=
 =?us-ascii?Q?ynFv4MKaHKZ4Chq/QnqY1Q9EhdicLGLSf4QfNCF43ZRICcRnfRfox9qLOfL/?=
 =?us-ascii?Q?l3ejXFx3fFeS+zsYe2KsnHv92gIf/xIEGpW6QJvDg4bJkyrtXtpogt8NTmlF?=
 =?us-ascii?Q?+QRO6itTB113gJhebeLr0pC/iSmIqjw8s4H/RbvtlrSJRnbC1ksTglvrjEUq?=
 =?us-ascii?Q?Kxs2VYIoyHGfqdTEsfKMZ+7RUPSvbpwyXX5qDKmzwFP8LQxgUcG66sLIwG6O?=
 =?us-ascii?Q?UhEuBu/rEzIoFcb3XS0z6oqE0a32dvCr0HNvy4lq8+3vqxLgo0HiF41QlCiS?=
 =?us-ascii?Q?Eq+CZPSM+ZToOVEvha37HND6emJCD2Rj5GOVioaQrd+bt/2Nb8mJnZTyGmHT?=
 =?us-ascii?Q?x+S2BnI6m6h2fm2NEJBMdpgvsdf6U3cp+A9tmQIIBMAU7OTV6XoLiMmshcHx?=
 =?us-ascii?Q?Z5/taQQBcgyc+jd2RpRikHRpkShAp2viRdorym2bC3LFX+mdUvDI1JtcZaEp?=
 =?us-ascii?Q?pxpufbeNJNrkmMGvw6g6oRyimbVoy8D3yNIBa9rGL6KdYx6uQsmNdlA7NQAx?=
 =?us-ascii?Q?LGGNLCsBhladg1PfSVGxe4Kv0Aam3/5TF9NKgBPIi1dHaYiZgXW0nmXxVN6f?=
 =?us-ascii?Q?WbrFvvXDmA=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e110a15e-eb2e-45af-512a-08da2f4722bb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 09:59:39.8966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2o3HLxrk8SUR8VZBu/+qMgCyxihcxIoWS7qxtTHBO9AmG4sIg2CUiPpheVvi5g6n+ZNW+AcfqSZtqDQSgIN/7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB3307

On 06.05.2022 10:38, Roger Pau Monn=C3=A9 wrote:
> On Mon, Apr 25, 2022 at 10:40:06AM +0200, Jan Beulich wrote:
>> --- a/xen/drivers/passthrough/vtd/iommu.c
>> +++ b/xen/drivers/passthrough/vtd/iommu.c
>> @@ -772,18 +772,21 @@ static int __must_check cf_check iommu_f
>>      struct domain *d, dfn_t dfn, unsigned long page_count,
>>      unsigned int flush_flags)
>>  {
>> -    ASSERT(page_count && !dfn_eq(dfn, INVALID_DFN));
>> -    ASSERT(flush_flags);
>> +    if ( flush_flags & IOMMU_FLUSHF_all )
>> +    {
>> +        dfn =3D INVALID_DFN;
>> +        page_count =3D 0;
>> +    }
>> +    else
>> +    {
>> +        ASSERT(page_count && !dfn_eq(dfn, INVALID_DFN));
>> +        ASSERT(flush_flags);
>> +    }
>> =20
>>      return iommu_flush_iotlb(d, dfn, flush_flags & IOMMU_FLUSHF_modifie=
d,
>>                               page_count);
>=20
> In a future patch we could likely move the code in iommu_flush_iotlb
> into iommu_flush_iotlb_pages, seeing as iommu_flush_iotlb_pages is the
> only caller of iommu_flush_iotlb.

And indeed a later patch does so, and an earlier version of the patch
here did say so in a post-commit-message remark.

Jan


