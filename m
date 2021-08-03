Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D293DEB2E
	for <lists+xen-devel@lfdr.de>; Tue,  3 Aug 2021 12:43:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163402.299341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mArsf-0000V7-R3; Tue, 03 Aug 2021 10:42:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163402.299341; Tue, 03 Aug 2021 10:42:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mArsf-0000SE-Nb; Tue, 03 Aug 2021 10:42:41 +0000
Received: by outflank-mailman (input) for mailman id 163402;
 Tue, 03 Aug 2021 10:42:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfYh=M2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mArse-0000S8-Dq
 for xen-devel@lists.xenproject.org; Tue, 03 Aug 2021 10:42:40 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4ef422fc-a6c1-4a50-8111-5b4a114e9fd8;
 Tue, 03 Aug 2021 10:42:39 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2107.outbound.protection.outlook.com [104.47.18.107])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-33-vZY-dygmM2qGi3BajRxXcA-1; Tue, 03 Aug 2021 12:42:36 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2829.eurprd04.prod.outlook.com (2603:10a6:800:bb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.23; Tue, 3 Aug
 2021 10:42:35 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4373.026; Tue, 3 Aug 2021
 10:42:35 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2PR09CA0019.eurprd09.prod.outlook.com (2603:10a6:101:16::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Tue, 3 Aug 2021 10:42:34 +0000
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
X-Inumbo-ID: 4ef422fc-a6c1-4a50-8111-5b4a114e9fd8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1627987358;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BuRoum/Nad4Gf6RJJTl7K+XY4MVcbHSdL+3jOnUs6r0=;
	b=Rzb/3IaUJZtAF/9XjuBLueto7gO2TpMY+eQkxJT2XvZbgr2fKuJigs4cOqmvPZzSOXNToX
	S79sVcEaUAW0jfW3EajegjZIfLJa0AuMgW62VF5Zdc+keJySo0rQp2gsvo+BoMZcq+C/Et
	xGO1n/9jwD6tiok0C7J5GhxaRF03NjE=
X-MC-Unique: vZY-dygmM2qGi3BajRxXcA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LwMSIVcIp0GVc3UzczpDnOHMuAxPrUj7/A6VpaPMFgb3Lwi9nw37ncS+BF6x27tSHZquUVMeiJydByJOfqXXocaw0n2edh0HYwglCvmi3BYsPnJJDj1QLjkwEsFHMKSqIvrB5YNKasKccQGMaOnN9xupcckz2UslmPut+evP77fW0AL8CfloP2gKS0EUkg+9lmHN8tj/V+/M2rMsnNGmajpYSyv/B1tUV7DFpsXh1bp4Z5yhxQJ7YagiVPZqzdW1Z8ZQisJThBMHVbGr/XCcWk518NHNBk7Qkbu51pjUbxNTtBRcrsSK7chrTYrzYaTPlY0pNE2Ny80VqbD8CvyehA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMkVA/l2nrqW9yireGHA+41NCyqRsWOtb5IB3/UnIjw=;
 b=f2W3XayjpGWUNhHQPOtdgaLSBkHAW6IqcbLKVLW9MOcTVqChsqgQ9hivC45B+/hTqZQxlMjKA/Iz5PbmI0wRS0gJVqB08yaGCAmCWC2IzJ0h+3KDfejMEscGBO56IfbFb1ZIgDUk67J2sQ6eyaEkcY/JtOCz+/hSnHbecqROzy+eDtar+a4OWhd5TALB0uMQY6bU/NUVXrd66GYsr3bWQXB8nIgiEN2AIOsgsj4P8cBNGAty1mzjUP1m6fX0+pCPyCVD53hadxWOinlQVGTXgp6hmPkzZkZowgXDt36fCrpMzx+70v60oYC4erM2ZLqNVn+OqI8wlTyjSEjtPAomow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 2/2] xen: rename wrong named pfn related variables
To: Juergen Gross <jgross@suse.com>
CC: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, x86@kernel.org
References: <20210616073007.5215-1-jgross@suse.com>
 <20210616073007.5215-3-jgross@suse.com>
 <8dbeb9ea-56c9-de30-4d5f-fc9c0ced6ac4@suse.com>
 <79434ec4-4543-97ad-b010-3f2c1b6a55ad@suse.com>
 <b9c64bcd-4192-0075-ddf5-711e84301063@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <94d629fd-27e2-f2be-ed26-c3e04e95c5b4@suse.com>
Date: Tue, 3 Aug 2021 12:42:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <b9c64bcd-4192-0075-ddf5-711e84301063@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR2PR09CA0019.eurprd09.prod.outlook.com
 (2603:10a6:101:16::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dfc0995f-998d-49d9-949a-08d9566b67b1
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2829:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB28295A4568E4C692BECE2F2BB3F09@VI1PR0402MB2829.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PmCxdNryIsX0vr8BQHusl8I7ssAdVmulsuse7dQY8ajnyTUmrgyrKnzPmDiiIb/4Z+CDmMSCZuSTts7yKxrNV4z5mTbDgCWDIKuWRqVk01oF0mTc+CegiXcPQ+ZxK04sZuO+k8E2R1dlUkTZzojfxyGJMkec9W47kY9a2F5Mor7KfmKSSzd8KhlCBbfpuTvNMTwOMwSlZVNe4ILrwZUpvZ+RA5BDdDefnziSosAMuFceM6rpwtokn/j7tjFPIUkVCXg3wrv+KxFB5XSvtgIkaWsLspeFVn2HKZuTJsg+4mPZ5gdvVzdOQjeDEbfjA3/TtUfnW3eZsXq3W0ilBpwvdABVRM2Vs6DWslNxSKBOu6OWNhkH35r7EOm/Ut9eDlGNs8/Csl0SeRLWaTl+RKuRiTeuiufreY7Ubc6VX/dFEYaWtUf3HHoUaIcSO1kmHCjML7hGamn1PSlt3hrPCyLH5odHNwWaEl55lYhY86Vm+vkeRv7hpqRpf141FXsNQ8SYgUSexFk3quXi3tby6ZBnU4OHpC2KzyMA+8L8mknnYkaEBQINCmOzK2iVpXcVsnZPQBHOYbBvCYUtYFMHgsdZuajG/kpCgxHOrMdMzM7bhoog5diFQykY2Itj6cuPnW9oKLv03nw3dG06BSjun5loxu3iB+viWzHCd4F797M5TlAZEMdQsOnECEZWDRfakFzKakLBFqoCnTkvNxdo7MlqwTTG5wqUufAAMW23g08XdN0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39860400002)(346002)(376002)(136003)(396003)(478600001)(83380400001)(66476007)(37006003)(316002)(16576012)(36756003)(66946007)(53546011)(5660300002)(8676002)(31696002)(38100700002)(66556008)(86362001)(54906003)(8936002)(31686004)(2906002)(6486002)(26005)(6862004)(4326008)(6636002)(956004)(186003)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?j8t4LPYmuM+UA/XptHS0QuCgqBEf3m/LA+jBllUfEKaKDVX3cxC84TA05+gQ?=
 =?us-ascii?Q?hWFmdmDtzIH1lzw6y2ibwmG9l+cKNpvkR2vKvT3ANP3SJE0wv1tR8mLVnmNm?=
 =?us-ascii?Q?W1w+sm6bEq+gIOOn8S6X2PtVTtaPpV5KN5qxSU2eMsJUvwZFR1dxp/UgKEKE?=
 =?us-ascii?Q?XZEhaNa+eOjJNl4azExLP6UIxzP3xuP2YHGtXLEXCW4GRIgAO3973rjpDIVZ?=
 =?us-ascii?Q?YJx6neqz/GoxsXQgKb+0u5iZPrQ4n6JGSfp4lql7clIu2ugRIrzKFoLpnsvM?=
 =?us-ascii?Q?RjfZv8Ui3zX6VyHcjLyflD9/7y0DbCKQsgu+Y4jF1FZNKYhVpbQwMbAuMGei?=
 =?us-ascii?Q?pHqrXvXyCtI3utEMDXNDqPMGiYqCii81fglzuSFiG/DU2h4L2AQ8pEw8MYP3?=
 =?us-ascii?Q?HeN3/ws7yIt7Q6kKjogG54Xl/hWXNtGOUtdpDRav/DovrTlRPIIgLNLH9KU8?=
 =?us-ascii?Q?zRL+ziGFKR/h32Q4gNSm2KOA4iHFDo3oF0JKcML/OTZ3dgTc0B51v4udyQHY?=
 =?us-ascii?Q?fjYJ/EcgS+DmDuqK28swnRg+t2AVQM9aCCLArx2Y1x6HZsCCTdLrhm81t21O?=
 =?us-ascii?Q?IeBAV98BxM9PLRdfq8ikJGdx8W82JQ9c8HC6RylLTFqzGyymZlIYygZnmApH?=
 =?us-ascii?Q?14nMSms6K9Y7xF04KDKmC419um650vY7qJbjbDKe5cF936ZFVfamMszSI8mf?=
 =?us-ascii?Q?qYQYC4l7rSdEIPDN+CuERnMcfbYVBfs4odbEe9akNYhDGqtfqzACzrmJ7hkO?=
 =?us-ascii?Q?OblgPN89wdK49p5k6ZQs8JbWZ2cdNRjBiaZIngQuo9UBdz52rru7E0To1uRh?=
 =?us-ascii?Q?XBSRDG0UrRbF1K09sjS9gewyH727c6Dbg7lS2MQ5DvNXYnwkoNnM6ytzfMfU?=
 =?us-ascii?Q?3COes1bOJB2CEc35Dprd7A8XE9i8eFrTHTjJ96HhDOpMjYf/5mQMhcQFNXES?=
 =?us-ascii?Q?NGXYvA46Z06x8JQQFcrvd62ZiD9M5urjznnW2+jUKaSQRz/55YDj+Ier25sZ?=
 =?us-ascii?Q?BuuPRIEwB667KAsZufyAtafGXDQZcSVy7TwR67nDf5R3nGX+ohmjDvE6hc8j?=
 =?us-ascii?Q?sSFjBFQ6YI1NM5bqBI0AbG8644hbEWZQx18llsRae3t2Hw8y0t31UHlIaXWz?=
 =?us-ascii?Q?lySgSpcZyaVGJbFVX79yLTIAUk/mefEp1/PSkaSYiNThfD2rSS6hkWGXUvfH?=
 =?us-ascii?Q?uVnKoeq5Bz1maX88eEYjl+amggYzd2QOc4i1EM9ObH4p0q0ikfYwo0MB5C0T?=
 =?us-ascii?Q?B2m11AlkCaRjWinfgFL+rnZrXMRBCCwA3+GE0EFKx0O+p6pyprZRxOFU12/i?=
 =?us-ascii?Q?jJIb7Dpmok99378J+iRStOg8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfc0995f-998d-49d9-949a-08d9566b67b1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2021 10:42:35.2365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F0e6H7pmWn2ZNpmsCif4akAejTQjlU6BV79PbrC3Va03NZ1v+8R7VbkZJnI3gCe2gNuttyBHfsxtmbzypvQqjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2829

On 30.07.2021 11:00, Juergen Gross wrote:
> On 16.06.21 12:43, Juergen Gross wrote:
>> On 16.06.21 11:56, Jan Beulich wrote:
>>> On 16.06.2021 09:30, Juergen Gross wrote:
>>>> --- a/arch/x86/xen/p2m.c
>>>> +++ b/arch/x86/xen/p2m.c
>>>> @@ -95,8 +95,8 @@ unsigned long *xen_p2m_addr __read_mostly;
>>>> =C2=A0 EXPORT_SYMBOL_GPL(xen_p2m_addr);
>>>> =C2=A0 unsigned long xen_p2m_size __read_mostly;
>>>> =C2=A0 EXPORT_SYMBOL_GPL(xen_p2m_size);
>>>> -unsigned long xen_max_p2m_pfn __read_mostly;
>>>> -EXPORT_SYMBOL_GPL(xen_max_p2m_pfn);
>>>> +unsigned long xen_p2m_max_size __read_mostly;
>>>> +EXPORT_SYMBOL_GPL(xen_p2m_max_size);
>>>
>>> Instead of renaming the exported variable (which will break consumers
>>> anyway), how about dropping the apparently unneeded export at this
>>> occasion?
>>
>> Why do you think it isn't needed? It is being referenced via the inline
>> function __pfn_to_mfn() in arch/x86/include/asm/xen/page.h. And
>> __pfn_to_mfn() is used via lots of other inline functions and macros.
>>
>>> Further it looks to me as if xen_p2m_size and this variable
>>> were actually always kept in sync, so I'd like to put up the question
>>> of dropping one of the two.
>>
>> Hmm, should be possible, yes.
>=20
> Looking into this it seems this is not possible.
>=20
> xen_p2m_size always holds the number of p2m entries in the p2m table,
> including invalid ones at the end. xen_p2m_pfn_limit however contains
> the (rounded up) index after the last valid p2m entry.

I'm afraid I can't follow:

xen_build_dynamic_phys_to_machine() sets xen_p2m_size and then syncs
its value to what so far has been xen_max_p2m_pfn.

xen_vmalloc_p2m_tree() sets xen_max_p2m_pfn and then syncs its value
to xen_p2m_size.

I therefore can't see how the two values would hold different values,
except for the brief periods between updating one and then the other.

Jan


