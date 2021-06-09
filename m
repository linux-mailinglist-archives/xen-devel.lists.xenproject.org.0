Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1243A0C90
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jun 2021 08:37:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139046.257221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqrp7-000840-BZ; Wed, 09 Jun 2021 06:36:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139046.257221; Wed, 09 Jun 2021 06:36:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqrp7-00081v-8Q; Wed, 09 Jun 2021 06:36:21 +0000
Received: by outflank-mailman (input) for mailman id 139046;
 Wed, 09 Jun 2021 06:36:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jMcQ=LD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lqrp5-00081p-Te
 for xen-devel@lists.xenproject.org; Wed, 09 Jun 2021 06:36:19 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 53270274-7e39-4e0d-b9f8-78d5c8b38193;
 Wed, 09 Jun 2021 06:36:18 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2057.outbound.protection.outlook.com [104.47.5.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-Z2ewEaSAP7KcNuosk0-lBQ-1; Wed, 09 Jun 2021 08:36:16 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3536.eurprd04.prod.outlook.com (2603:10a6:803:2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.25; Wed, 9 Jun
 2021 06:36:14 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.021; Wed, 9 Jun 2021
 06:36:13 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0286.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20 via Frontend Transport; Wed, 9 Jun 2021 06:36:13 +0000
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
X-Inumbo-ID: 53270274-7e39-4e0d-b9f8-78d5c8b38193
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623220577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DpG5z7mszEvm3pGLZqzstd4pzaFEQVrKJ2H3PJilBk8=;
	b=GyvGk1TWlGlHgoKyjFGCXkTI2VJ6Pj105bRQS263rTuSegU5QIdK1AJi9EOuS/2ZT4CtgT
	e170bTc16mWZ1vyEoNQ9/LvxjkxZnBI9Fg7hoGto68JWlokB7aPDi21ckRvAft8/KLdT3Q
	vTmXLXb7diqj7e3sTPRVOwkRERRvne0=
X-MC-Unique: Z2ewEaSAP7KcNuosk0-lBQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lbBpFCxLGqMvpkCnz32LZa5FiNVy9blofEvgLBZ6Tpd2765JOS4MbLVZDeo6ezU3QjGoFpFKNCJeIY1hVtN5N55p5WgczxY05lksVDDgsW7wlY3kSXtzUYKbpkPkLQr490gj8YcIr+PZIEwkcCgF1wq3ri4dOE/j4RmcpLxdTX1TP4+bKFbk5J0UD9MIF60omS7C56qDri3YJcCXMALcgX+ulutltIcsZDG24n3yU5DIvLOi6tZHVs6eCRIA7MZYuwjuDmqM/vM4nGtPRseb35CdMmmZEGNVHYaRzCcKcomYsuMbzYx6m1NAGN2kcCCOCeD+AXmGKkwq1SiLQJf56w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DpG5z7mszEvm3pGLZqzstd4pzaFEQVrKJ2H3PJilBk8=;
 b=Lk15ZDsSdUMaE292s19GtiVCEE3pNgSPDviaX7MLigp8tRIXPvP8EgNHGRASXoNAVjAXddcMzvjdY7ym4hBGsWkC+KRztCO87+jJo8z1HKn9cxaWVvPzd0Uvk3LxMwPOJO4UfH2HoazI4aFx+TDVEcprY5HsUBWtJGwtfNYpyord9t8B/rEFUydTvRhY6FM/GFz/ylIqHXNk4z9nxv4VUDFSxgLTtDC234+8Z7p+VayooW07cpwKWucC9n+V40zlXYQA7LbvBaaq9uGglQO215OSNuxRIGtuAvgz35FAMuOW4DWqaxRZM3XQMIt6ZrHeceofGWWKLfuk35Bh0BCV9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] x86/tsx: Cope with TSX deprecation on SKL/KBL/CFL/WHL
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210608170559.6732-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <72aedd57-9722-2c5b-7365-f46a0e0fe39d@suse.com>
Date: Wed, 9 Jun 2021 08:36:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210608170559.6732-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR0P264CA0286.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3364c35-3197-43d0-65c7-08d92b10e062
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3536:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3536A022159138578572F614B3369@VI1PR0402MB3536.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LVwf2nE1szuSlmPTeBbrMA+r7zyE4+9snabF3TQ1ug8sDMdBbXoPyYN4EMB9neFpfS16d9pvkJO5a/H8Y0P02QNdJ2StSlzyb4lV9yS1BNcVvt0NP0paE/Qm4M+HYK5PIzG10NidOCtWDfrl93V3bzO3jCm1tXBUuQkh6tDyrtog2wAjy5X5lwGeKmZsNUTfBOoR1/wV4Y7/Vktm3HAoYN797LAiScxYdIAap/LxRqVM18P4n1bQz6OlCCWj6IPMunoiTaaT4eRd068PM+60zj3UXaa0ycjzdA7IIbl7t56lZD+1P1wi56wAwbdt0mvt94l+ABRlJ6UaP9e4B8lIIVB07fLpbn87mVs4alGF1p3YEJEeRZ9cjH8E6GqlF5GyWCzdCBbN/8vJY5gI2bq7LvWqErXrG3a/SbitPe7rDF4IMahuZG8sW4zac8HOWSyO7dxPCZEAHdRD9+B6DaPKwBqqXwD3t1fptX4n+VoCnJi3vLd2x+EqGX7GP2ME4qaJatnJR6P/dGi1LPVFA5M64De6V9y7Ztzpe1QVSi+hDgWZkknMMkKBSQcf1bpAfXOY1OodhHyp/3U32pz0BztPob5TRQaKNdSb6JoPHBdHn4AtPlsR3G9L0R4r+DMet75vVg119jiJYb4C840P20/Z83SKoH5vtoqZr+uZ7o44OkrCiXobbkUX9HdnMngd/MpQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39860400002)(396003)(376002)(346002)(136003)(8936002)(478600001)(2616005)(54906003)(956004)(36756003)(38100700002)(83380400001)(5660300002)(31686004)(86362001)(53546011)(66476007)(186003)(4326008)(16576012)(2906002)(316002)(6916009)(31696002)(6486002)(26005)(66556008)(66946007)(16526019)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?utf-8?B?eFU5TzFWQ2NFT2VtTVY1eXIwSXAvM0VrV3Vib2lldXplcUk4MnNyckc4Ty9t?=
 =?utf-8?B?NWc5ZVRGbVJ0WnlieWphOHJIaU0vQlk1Um1DakVxc3RzMnF3QkFqZzljalNO?=
 =?utf-8?B?YUY1MWtaTHRlajNFelFaZHdTeStacVpLZlhlNytWRmNlcS9xSWVGYVpSVEY0?=
 =?utf-8?B?M1JDQy9kNWRCWDVhbTkyVVpmVmhCdU5lMnh6V1V5VGxpZnlUdDQyZ29vOVQ3?=
 =?utf-8?B?djVPTUQ1ZHcxVFNmNlFPZmZuZXFpeXdEb2syTUQ3N09aTWJnUEpGTHJsbDhX?=
 =?utf-8?B?UFRPaGt5UHZMdGcwdCtyU0VJdng0dWdhdzNVOHpJaDJ0TWxvNTFPTEw0OUNs?=
 =?utf-8?B?enc4VHZMTzJzcWZjOW1HVXBPT1lGUXphY1VuZmRneG1VeVFETmYrWVc3eFh1?=
 =?utf-8?B?S3ErSEkrVTd3RUMyOXFQbEdYc3hDNlNtSmNoaUdwUThWYU9iSWtFUkhlTWxj?=
 =?utf-8?B?YTFGOWVKVFJXV0JNb0hqODJmbVFmcmVvb1gvZENnd3hjdjl5aVo1Rk1IVVFS?=
 =?utf-8?B?bk5sMXMydUtPc2dVYkJKektJUU5ieFM2MzVtUU9iY3k3VTFEOWdmYU1uUjVn?=
 =?utf-8?B?emFEZWRFdkMxY1FhQlhXVUxjcTF6Sk5IWkhVLzN5SlJOZUE5NTdWSTdNZGZm?=
 =?utf-8?B?L09RKzBNRlR0Q003YzIyeDZxRTM0U29IdkdtYmpwcEtUc1dLa3JoYUJBVWdp?=
 =?utf-8?B?SWFoSFAwV1BZN0xBZFNVMTFnOGdQYnR4MXJiT0N0czJHYjlRaExyNklaL3FD?=
 =?utf-8?B?dUI2Um52czlPZGNJUEdPcVJGOU9tNTYyOGhPTGNhczVjdHdqV3lwNUFEdjBK?=
 =?utf-8?B?S0Q1U05oNlV4S2RUNlF1SThJVDF5QjBOQmczcURaNWtUYlVxUWZ6MVAvRDMz?=
 =?utf-8?B?UnI2TktTVU04VjBGRFNxeEFHZ2h0QXEzUmlFV2kxdHJBbTZaK3ZKQklick5i?=
 =?utf-8?B?VERyRE91RjhRNWVWS0JiTDVsb25iVnR5YUliL1BSZjN3azFKU3ltQzNsaVZR?=
 =?utf-8?B?aFNnTGl2U2hzMTJ3MGxNN3UzZS9aZkpIdEIzbGNsN0lwbzRqdUJidWtmT3BH?=
 =?utf-8?B?UlI2QlhRWVQ0RlRRWVNZV01ZN3oyWDJLclpia1JjRUVuQXN3SVdtUnVwUlVr?=
 =?utf-8?B?UkUrSzJVcTVZSnRBaEtlZVk1NkRUeFRMSXR3SXMyczFwTVhJWS8xZGM1Y3Vm?=
 =?utf-8?B?aXl6Wit1LzEralZNUXhSNkpKaHMrNXVyWHgzTnBCVysrckhpQkc2Rzk1NlBk?=
 =?utf-8?B?OGxCaE5yZ0ZpVnEvY3hBU2ppd2lNczBndWNkMEQxWThmZ2VHZ25vWDYySmZi?=
 =?utf-8?B?QUlKRmtSWStyNnc2ZUUvcURsdFVVMzEwaVYwcjM3dTN5aG92ODkvQUJCRldH?=
 =?utf-8?B?NGE5RUx1V3QrVzFVVFRnb1YxeFJCRjRraFR1NUU3b1MzaDl0TytkbVJpY25j?=
 =?utf-8?B?SWVPMVZTZzFrY2MrNTkwamdQKzFVWEZ1YWNnU3JGeGRWVXNXdE9WM29YMXRM?=
 =?utf-8?B?ZDVGbDV3TkhUM2pCVitDMzdjbWRMV05nWlNqQ3NiOTEwRVJWZnMvTjAvdm5X?=
 =?utf-8?B?VGloMHBYcmRQZ0t3THZzWVRBbnQ5VmJneGUyMDNBb25JTlhkQlJnK2tTR3VY?=
 =?utf-8?B?U1dyVzFiSXhOMWN4UGtHN2JGRDNoeEM3OGpWM25rSFB0c2o0Ly9pZ001U000?=
 =?utf-8?B?Sk1uMUkrWCtVTEFLdkk3cmt6dEhmK282NVpqZU5SOFZTQ1BaU0V5UmtjWFJR?=
 =?utf-8?Q?ZoQAzVyqansTxE9dqRZzVa2LKJDAbv2AsI7VxEC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3364c35-3197-43d0-65c7-08d92b10e062
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 06:36:13.4781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h+JDxLi2iXRbeZOK1d2L+QQ/XgAr+83DoeH+Wc1AbCc4zRP6HJfv0jy2XenWEwUkzDioj/a4ZRkqRw8tEwjDlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3536

On 08.06.2021 19:05, Andrew Cooper wrote:
> --- a/xen/arch/x86/tsx.c
> +++ b/xen/arch/x86/tsx.c
> @@ -60,6 +60,38 @@ void tsx_init(void)
>               */
>  
>              /*
> +             * Probe for the June 2021 microcode which de-features TSX on
> +             * client parts.  (Note - this is a subset of parts impacted by
> +             * the memory ordering errata.)
> +             *
> +             * RTM_ALWAYS_ABORT enumerates the new functionality, but is also
> +             * read as zero if TSX_FORCE_ABORT.ENABLE_RTM has been set before
> +             * we run.
> +             *
> +             * Undo this behaviour in Xen's view of the world.
> +             */
> +            bool has_rtm_always_abort = cpu_has_rtm_always_abort;
> +
> +            if ( !has_rtm_always_abort )
> +            {
> +                uint64_t val;
> +
> +                rdmsrl(MSR_TSX_FORCE_ABORT, val);
> +
> +                if ( val & TSX_ENABLE_RTM )
> +                    has_rtm_always_abort = true;
> +            }
> +
> +            /*
> +             * Always force RTM_ALWAYS_ABORT to be visibile, even if it
> +             * currently is.  If the user explicitly opts to enable TSX, we'll
> +             * set TSX_FORCE_ABORT.ENABLE_RTM and hide RTM_ALWAYS_ABORT from
> +             * the general CPUID scan later.
> +             */
> +            if ( has_rtm_always_abort )
> +                setup_force_cpu_cap(X86_FEATURE_RTM_ALWAYS_ABORT);

I understand the "we'll set" part, but I don't think "we'll hide"
anything explicitly. Aiui it is ...

> @@ -131,9 +170,36 @@ void tsx_init(void)
>          /* Check bottom bit only.  Higher bits are various sentinels. */
>          rtm_disabled = !(opt_tsx & 1);
>  
> -        lo &= ~TSX_FORCE_ABORT_RTM;
> -        if ( rtm_disabled )
> -            lo |= TSX_FORCE_ABORT_RTM;
> +        lo &= ~(TSX_FORCE_ABORT_RTM | TSX_CPUID_CLEAR | TSX_ENABLE_RTM);
> +
> +        if ( cpu_has_rtm_always_abort )
> +        {
> +            /*
> +             * June 2021 microcode, on a client part with TSX de-featured:
> +             *  - There are no mitigations for the TSX memory ordering errata.
> +             *  - Performance counter 3 works.  (I.e. it isn't being used by
> +             *    microcode to work around the memory ordering errata.)
> +             *  - TSX_FORCE_ABORT.FORCE_ABORT_RTM is fixed read1/write-discard.
> +             *  - TSX_FORCE_ABORT.TSX_CPUID_CLEAR can be used to hide the
> +             *    HLE/RTM CPUID bits.
> +             *  - TSX_FORCE_ABORT.ENABLE_RTM may be used to opt in to
> +             *    re-enabling RTM, at the users own risk.
> +             */
> +            lo |= rtm_disabled ? TSX_CPUID_CLEAR : TSX_ENABLE_RTM;

... the setting of TSX_ENABLE_RTM here which, as a result, causes
RTM_ALWAYS_ABORT to be clear. If that's correct, perhaps the wording
in that earlier comment would better be something like "we'll set
TSX_FORCE_ABORT.ENABLE_RTM and hence cause RTM_ALWAYS_ABORT to be
hidden from the general CPUID scan later"?

If this understanding of mine is correct, then preferably with some
suitable adjustment to the comment wording
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Also Intel recommends this for SDVs only - can we consider such a
setup supported (not to speak of security supported) at all? I guess
you mean to express this by saying "at their own risk" in the
cmdline doc? If so, perhaps mentioning this in SUPPORT.md would be
a good thing nevertheless, notwithstanding the fact that we're not
really good at expressing there how command line option use affects
support status.

Jan


