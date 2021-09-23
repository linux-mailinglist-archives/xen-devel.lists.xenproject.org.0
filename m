Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D734161EE
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 17:20:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194437.346381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTQVq-0005jG-7e; Thu, 23 Sep 2021 15:19:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194437.346381; Thu, 23 Sep 2021 15:19:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTQVq-0005hT-4e; Thu, 23 Sep 2021 15:19:50 +0000
Received: by outflank-mailman (input) for mailman id 194437;
 Thu, 23 Sep 2021 15:19:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Uzs+=ON=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mTQVp-0005bT-C9
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 15:19:49 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ad584d1c-1c81-11ec-ba52-12813bfff9fa;
 Thu, 23 Sep 2021 15:19:43 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-UF8XVssKPn2UierGQXgDSA-2; Thu, 23 Sep 2021 17:19:41 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6862.eurprd04.prod.outlook.com (2603:10a6:803:130::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 15:19:37 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.013; Thu, 23 Sep 2021
 15:19:37 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR04CA0112.eurprd04.prod.outlook.com (2603:10a6:208:55::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.14 via Frontend Transport; Thu, 23 Sep 2021 15:19:36 +0000
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
X-Inumbo-ID: ad584d1c-1c81-11ec-ba52-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632410382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ePumqdto0fRB5Q6HDi/I4XD/7s1DkFeFdUnzVrFS644=;
	b=ewLPF+TMFUayRwgA7noFLvwt0vHae/4RClxgzSct7oan91UXkh5utzmO4MEbpe5IUkQ1x4
	P/OaEbPTmv+54N5EeJ3oVnS20g+E460Wxbr5TQX85Yc/yw+785ky3McotRlw9uVP7MTojG
	jwFeRcAi4U9QjJcwzuToqTxK+jsoSDM=
X-MC-Unique: UF8XVssKPn2UierGQXgDSA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GrmJxD9ZV/eppmkPovLbT+61w5cSlI9CfYjIe8ZdpdMou4Lob+KC+Eq3wzvxpUsqRGb/EPgs5PtNV1fJeh2WtSxhRf6pUmZ6C79V1bcTtePo2Bno/2fYWgv0JeSUj5f3buifI8CAi9Uc12PvfKXtszUHyHMRJ6o9x9jQ26S+qf4JiJKA2js+ll6zFt7oS9RBJ2seQKj6646Px1Ak2yxeXY2wLNvaKDffpIW+AKbygsro6kE1rNh8FDFmumJwcqkRL3OjtslcGL+0OCVx+XsUQea1kckPznts6PIm7TnDiqG0Ovya72D/XwokvPXiMIv0dCy+99c3ub781h+O9+jc0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=ePumqdto0fRB5Q6HDi/I4XD/7s1DkFeFdUnzVrFS644=;
 b=e22TUJQrDPrjbdHQ5eeS6a7SlIJtmOlWU/nUWBc83+YDkuXMg+ebOLGu9bPlsr8r+7CS7PgQOyR9sVGVRUJG22SYm5GEJ21x6JLsA6XFsWr4xibhBiU6QzA9rvvSZKsUtTvujbl8divMVodzRirhUQt3uJScQUZY45wSBmrK9m1cDIXMtvVEUm9aaVwLuP51CdeyoNSEvVupxVGH4D3b7lygs6aqPV3hUPMNg/ivNzZc6tR7icQ4e7wO33iHQ/OTpsc5cJgihW/Q+81YXitYy0dIWpenBFto8Fo4UDq+wVvy9C0Ey9zQzCN5p94JJ/5Tw9yp+MBaF/e4JQ0Ohop51w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 7/9] xen/x86: hook up xen_banner() also for PVH
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <4efa804e-3250-227f-00c7-347581366cd4@suse.com>
 <5af11027-cf9d-cf78-9f48-b2ce2edd6e62@suse.com>
 <2ded8c58-b9c3-89dc-6883-1794d1c4126a@suse.com>
 <d9b6e98c-4e75-73f3-1e6d-42df300cfd49@suse.com>
 <89cb2d39-2bfc-dccf-8e92-39e4e952750d@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f613a83c-2b29-23eb-ca78-a8a75a67f651@suse.com>
Date: Thu, 23 Sep 2021 17:19:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <89cb2d39-2bfc-dccf-8e92-39e4e952750d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR04CA0112.eurprd04.prod.outlook.com
 (2603:10a6:208:55::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2b8563e-2070-43c7-3b39-08d97ea58e68
X-MS-TrafficTypeDiagnostic: VI1PR04MB6862:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB68628E9EEFE1B77CA4BAA484B3A39@VI1PR04MB6862.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Hnwhemz2GuRAS1JqvSq2mV/HlLdGzYR7CjDynwi/mU49jeDjUpwmpM4xYQbaU8Z3GF5q7wW5nC7zoDJNdGDQwLJ29BHjo/aSbeo+DxvhCZXoRhUMhOy4sYyaxr2+RyHx2U95j/reIssBhhp2gRakX2TXIHCABPBZj040okY8WMEMbfNJqc4ReLmiaSq4mukSmPa7Pb2vfIv8My2BIvqQzqA9aU24wRKpT+nle80evLP1++3Rf8ksej0RLQxa5c8J6A4hgflqoDvlxDXrc7wnrOFGSGxHPnvDWv7cJ1MkDcZRpBNxFr2PLRERNrBSMyzou0Q0OB4gTXpjPKRphhgYwOi7JNRX+YHpcZhSWA1RYIgqjVhBZOVJnul1YVf/HTu5peKYT5cDiKZWqzEmOgzSfNEs69iEXbt/SUIj5p0y9AsekOesKHa1AiHO5/ywyxutV74IdMV5CYcJZXdQQP0fmZAR/gA8iIOWjfd3WlaNkgy7jeJr5/o1eo2NNgwzn/Dto7+tG+J0/W8eSMnByLj/ZUBfwzgZ8mz+YAhGVbNQx4UfDGHyBu8ttq+gH+k2VPhfKWfjB54KvbbhbCau5t2xUnybYbcJ1TfyAbHPeGvZvUnfhxj4wU1iqVmyWd4qUpQWvJY6IjO/nVnW81b6qokCj3FmPQO9FdSP+GYeWtzxSeg5PvCkgCDueO+hJZowZjGxHuAsdCAXp2wQ8rH/FZ2Fz2frQmjRONiDeR9HdR+msYEBgthKpyDOQtSjOFDVYmMNZCQlTL66Ooxt4bbMx+BAq70yWKk8E2BEJ0tM/N37mDk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(37006003)(66556008)(31686004)(8936002)(38100700002)(2906002)(53546011)(31696002)(54906003)(6636002)(16576012)(66946007)(956004)(4326008)(6862004)(6486002)(86362001)(508600001)(36756003)(2616005)(66476007)(83380400001)(26005)(186003)(316002)(5660300002)(52103002)(158003001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGJUSWNIRjNnWm5aUlVMS3hXVnFZYzUralBTVGY1SWYraGswcFUwZTQxOXJF?=
 =?utf-8?B?V205Zk15T053RjJHb1JkUjhvNUhBbmh4cnZrZzMxZHptV2h5Tmo4MzQ0akNW?=
 =?utf-8?B?L2JFVXdLeWo4U1NKT2dIa0t3Wll0MDhpTGx3QXBlc2hqQjMvMUdEM3FqV1A5?=
 =?utf-8?B?eEZUMXNYbEoxSmk1NWNVWnltNTNsWEJmR2IzZDh0Zjkyc1FWT1J1UTdHZW9D?=
 =?utf-8?B?dzJaVFo0Uy9WcktWbm1zVVVKdVN2dGxOMmZ3NyttTkVHdUsrVnl4SFJGaHZB?=
 =?utf-8?B?bldSNmt4Y2lPR1NYNjIzWXAyOUJqSkhQMzF2RUppMVo0ckFweFNhZmZiTjhZ?=
 =?utf-8?B?WG1lQTRwamNMQWFod1Q5Q09UcG9MS3pJVksySzVHbkdaMlJsbnhkRGZWekY2?=
 =?utf-8?B?SHlUQ0ROZ3AzdFpuSjFLUE1uL2lJTi9GdTdSQ3VKZEwvU1VXWFk0RHZ5cExt?=
 =?utf-8?B?ZkkxMmZESWs1YjhqL2dTRndTR2NtZjFQeUxSemxELzlGbGxCU0JFSmdkZmpR?=
 =?utf-8?B?UXR3WXowWjNpanlVcE9nVWF6aXhRMkpkbytGRDVtUnNXWGR4TE5KdnF4NUli?=
 =?utf-8?B?N3pIT3BYaWZORWJYZGtpR08ydmI0UWhOTDI1dGhWSThMM0JvKzAvNHZYdGtV?=
 =?utf-8?B?M1lTUStVYi9LQzB1aEJyajR6alFWR3MwdmxaZGJFdFlnZFROazJHcG56MUFu?=
 =?utf-8?B?VEF5MVhHemt0eEFoelRhY00xMm92OThqYmFkbkV2REVzc3VOSll1YnN2RHBn?=
 =?utf-8?B?K2p1b3F5d2IrZ004UFc0aEd3RXM2MVNROU5CaEZQS3lvQTV2MHlvUldVamJr?=
 =?utf-8?B?RmJOVXNiWFFXR0svNkFKZzB0RFVqOG5uZ2V6NXU1OTRRNzlGQ25kOTl1S3l6?=
 =?utf-8?B?WlQyUmVDRzZwRXpqbnU3aUNwVWxtbWhPUlBuVlpGaFZlbjBCZjRlNG84U1BL?=
 =?utf-8?B?bnZpakE5UThlNzlMbDc2SUZwVU4xdWlha24vcFFjdGpOVUZvRDlDSFJ2eTBo?=
 =?utf-8?B?Y0ErVWdPRTlYVm5RdVB3aFhEenRLVGFUQmEwTHBZM0IvNkQ5eVB0M1VpWUF2?=
 =?utf-8?B?UTNyNFFYTzRUMFJvN3Q1ay9OaHpVb0NjWWlNamVCZEszRkNkaXpsQVhaYUJI?=
 =?utf-8?B?b0dPL1AvaDN2VzZBblRhZ2VucEhab0ZKMzBMektFdzFIcnpHSUh3amRsUTZp?=
 =?utf-8?B?L3FyVjRlaVhDcHNYYzMzWGwxcEh6a2tRQ1dsbmNOQkdNaGdDam5BM0FYQzYw?=
 =?utf-8?B?K08zeXBuSzN2ZXI0RWhMblNNODkrclN6V2JnbXBZYmRZT1VpTTE2RE92UklJ?=
 =?utf-8?B?dE1pNHVWMENpcHppRC9McURnZk5aeDVxejNrSGQ2UHdYSEN0ZWpvMVFoRHJw?=
 =?utf-8?B?Rzd3UDhySnh4Um5JT05kNHcwVXdaSGs1TnlQaU9HeHY4NWNYVU1ZcURpa3Ru?=
 =?utf-8?B?bXhYWnEyeW5HSm9YNWpsMm1jck9ueFlMYjVtSURlQlRYUG13TXZkQS9DV2FO?=
 =?utf-8?B?ZG1yUFRZYjYxSjNZR3FLcG5wcFMwajlFdmlLWDV1ZTE2ZGg5d0VLdEx0Q3pW?=
 =?utf-8?B?c0hsQUZyK0cwaHo4d0tkdENoNWxZQnROYlFLc2VFM3E3ZXIxOGRYYXFON3BV?=
 =?utf-8?B?Ujh0eklBLzZNUnArVHp0UklobmNLa0prUEk3MHgvamNlVndZSytBMlQrTUZj?=
 =?utf-8?B?Q1RZL0pRRFJsdFBFQ2ZMRGhaUDYvMmlnempQQ0xCZnJ1ckpmODBZcDY1MzVp?=
 =?utf-8?Q?Q47NSnk/ihufygNf4wWv354jf4Fh59/KpZ/yi5+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2b8563e-2070-43c7-3b39-08d97ea58e68
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 15:19:37.4384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nt+Z4L/F4H+D62AlbFUV0oYkYkZWBLPj/hDF2/+GcoEj8CQTiT2EFEtuqc6a62yVEWzvFPwfCUT2F3cCSz4RKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6862

On 23.09.2021 17:15, Juergen Gross wrote:
> On 23.09.21 17:10, Jan Beulich wrote:
>> On 23.09.2021 16:59, Juergen Gross wrote:
>>> On 07.09.21 12:11, Jan Beulich wrote:
>>>> This was effectively lost while dropping PVHv1 code. Move the function
>>>> and arrange for it to be called the same way as done in PV mode. Clearly
>>>> this then needs re-introducing the XENFEAT_mmu_pt_update_preserve_ad
>>>> check that was recently removed, as that's a PV-only feature.
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>
>>>> --- a/arch/x86/xen/enlighten.c
>>>> +++ b/arch/x86/xen/enlighten.c
>>>> @@ -261,6 +261,18 @@ int xen_vcpu_setup(int cpu)
>>>>    	return ((per_cpu(xen_vcpu, cpu) == NULL) ? -ENODEV : 0);
>>>>    }
>>>>    
>>>> +void __init xen_banner(void)
>>>> +{
>>>> +	unsigned version = HYPERVISOR_xen_version(XENVER_version, NULL);
>>>> +	struct xen_extraversion extra;
>>>
>>> Please add a blank line here.
>>
>> Oops.
>>
>>>> +	HYPERVISOR_xen_version(XENVER_extraversion, &extra);
>>>> +
>>>> +	pr_info("Booting paravirtualized kernel on %s\n", pv_info.name);
>>>
>>> Is this correct? I don't think the kernel needs to be paravirtualized
>>> with PVH (at least not to the same extend as for PV).
>>
>> What else do you suggest the message to say? Simply drop
>> "paravirtualized"? To some extent it is applicable imo, further
>> qualified by pv_info.name. And that's how it apparently was with
>> PVHv1.
> 
> The string could be selected depending on CONFIG_XEN_PV.

Hmm, now I'm confused: Doesn't this setting control whether the kernel
can run in PV mode? If so, that functionality being present should have
no effect on the functionality of the kernel when running in PVH mode.
So what you suggest would end up in misleading information imo.

Jan


