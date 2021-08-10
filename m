Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8DB3E53B2
	for <lists+xen-devel@lfdr.de>; Tue, 10 Aug 2021 08:41:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165267.302039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDLRs-0005Fs-NY; Tue, 10 Aug 2021 06:41:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165267.302039; Tue, 10 Aug 2021 06:41:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDLRs-0005Cs-KF; Tue, 10 Aug 2021 06:41:16 +0000
Received: by outflank-mailman (input) for mailman id 165267;
 Tue, 10 Aug 2021 06:41:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RCh7=NB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mDLRr-0005Cm-Mw
 for xen-devel@lists.xenproject.org; Tue, 10 Aug 2021 06:41:15 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f48956c6-f9a5-11eb-9f5a-12813bfff9fa;
 Tue, 10 Aug 2021 06:41:14 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2052.outbound.protection.outlook.com [104.47.0.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-JW1mXRkPOgu-23m4PsUjJQ-1; Tue, 10 Aug 2021 08:41:11 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2702.eurprd04.prod.outlook.com (2603:10a6:800:b4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.21; Tue, 10 Aug
 2021 06:41:08 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4394.023; Tue, 10 Aug 2021
 06:41:08 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM3PR05CA0141.eurprd05.prod.outlook.com (2603:10a6:207:3::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.17 via Frontend Transport; Tue, 10 Aug 2021 06:41:08 +0000
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
X-Inumbo-ID: f48956c6-f9a5-11eb-9f5a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1628577673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HHy/bBTHJRzalDrHK7QCXmLH6hdSw0HSViJeiIZ0LXg=;
	b=ifcZt9NwxbivZiYp/Lctsn4R4XpSOVqTIhPOl1uprE2knJnyO1N6DdHyj0r+ksCx7dc2kf
	JPFAFSgypXKbm3ytCRDRi5axBTMG37jSuVcgb0PYZEVumiA83qZRC+8+htSLgOW0CqBGho
	PGUWrl3505uirChaugqAg4akgMYNGLM=
X-MC-Unique: JW1mXRkPOgu-23m4PsUjJQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KOnQlATVG3bnm1aSF9hcfHVr/cXWfPguroGSgBo9wKx21dUWhD5RQTc+JHZhmNPS774PyCLIWgs8PiGQJ652QWQpHhlG1lny0wsoYQviF/QBTmcQi78ghm4WWYFALEO+5sYPGkcfDEzkXZYZB7sHW49+CVXyaxeoJvgYSnf0Ql9tG+tSjO0wvcY86lryFAiQFMYuHEPeECUVmZURnCLRS0OYlOxtX8GkzV/KLuO1ADB6JXCoDro1DlBNEyV6CpBdGQo5YZ02sYd4+ypt2YdqnW9qqE/omgOSeaLB8mWcTNRfaaL8roVZRDECAp800Rb1bzCyoYda+PMxVttCK8QVkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HHy/bBTHJRzalDrHK7QCXmLH6hdSw0HSViJeiIZ0LXg=;
 b=naualJgUIgmUT2+7xs5l8PQpCmkNBeT6YntsZr4xHPtEMcQUxe/+Cnzs51NdQyVtiAFtNCty5j4KLa+1urY7gTBowSJyCD0PXwHcimXv0hrpAk89XU8KsKaQLizicduClCWxrZZ0uau+CLT9U/CAlTIFOVTkCqwWsDwRtvD89vy8ONFZ4guMnWmhDLdTootPkIW8OrrOLUm8Dt9Zz6rzkwnVk0514CmNtbaMnMdmjj2OdsM3qAavEAVr5Z2HbSGaprBgeFHvFwLBrxFr1S3BW56ilLwcLZLoY82kTkw7eat6Lu53tzpBET7QYPyK26rUH/88o6EXtqD1Cpc2hNtEHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 1/4] public: Add page related definitions for accessing
 guests memory
To: Costin Lupu <costin.lupu@cs.pub.ro>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1628519855.git.costin.lupu@cs.pub.ro>
 <b397d346dcd6243d1957b3e4cfe7a09a6bd1c1b4.1628519855.git.costin.lupu@cs.pub.ro>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d92ed571-521e-70f1-af20-1423dbbf4014@suse.com>
Date: Tue, 10 Aug 2021 08:41:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <b397d346dcd6243d1957b3e4cfe7a09a6bd1c1b4.1628519855.git.costin.lupu@cs.pub.ro>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM3PR05CA0141.eurprd05.prod.outlook.com
 (2603:10a6:207:3::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87a555f0-e810-4a79-cd6b-08d95bc9d5fa
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2702:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB27026969496CC3F5CE73ECDBB3F79@VI1PR0402MB2702.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Bik+/yWfsiaVMNhFIUNHR9m/UU8E3+EQY+M6itKAqbd41/1cxs1EoDSgd4m7RCru5kXpPL8Ku59U0suZHYrF4kDx9Snph14M0ubnoPANZ1RdGixvBv1BXZVGKFB5lA/FuSwGlyijsMyMs7sIkRXcQtF30bFuvcAnYD14K95LYHCvexSi1LTKaoeHBJTVraa8lesjNQCNH82IMcalo8uYW1MYU7i9i5++veL1uzd46jIgqwpv5PsIJl8fI59iN1OlLF8ZnSGJ1HsRpJhvIRqNEw7qbrek4W8wHpEjoIRBUoHyAK/cwsDo9+JR1bFHl10k4T2/tysQviNa1O72etOyM9GsrbNHUSEae0iWVHQExXXQD7qpaHgEdrBgITNTPdFBfXGGkcN4nkT19M8Qz5x//NpojJHPVqkdoy31ZHwPlwkT11VRZnuFUmjuiQDz2syRO8Td6ti1KdmnS+gvNpA9lYD0e+hXciNvpU2R7KzQU2t47whTdg97tha54np0OmR4hEgMtZtnm399eow0y3KN2Id1WPDstdkO+qJzC7AjuN7PsW8oXQnF3yl+wNIBdMaHIcGvLt5lKeUJ+aIOZaGOIOtJIg1CC9HjQIr6tMY5EJqQ5wwh1LHo0NSHKxvUC0SZAz3mX2sFh/LANY1XcyRWMXaf6gFbckZEoXz+IBIUPf50aU8qPuCUld03J/WQ7GaP4Ch9u64Ivz2sRoDYuPjwvr6zrXuMC6bAauGSdcvPlLM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(136003)(346002)(366004)(39860400002)(376002)(316002)(2906002)(16576012)(8936002)(36756003)(83380400001)(31686004)(2616005)(53546011)(956004)(38100700002)(7416002)(86362001)(4326008)(186003)(478600001)(66946007)(54906003)(8676002)(31696002)(6916009)(26005)(5660300002)(66476007)(66556008)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTM4amVXVWthekNCaFdxejk5RDdsdHFocEwyK0N5cUUwZEdKMkFLeXJML1Q2?=
 =?utf-8?B?OU9YdGNuM0JrN2dxRU45YUFrWHd5aWpMbUVqWGE1eDgzZTNoRVhTc3V6b25h?=
 =?utf-8?B?eFNPU3pOZDJyZjNDWCtucTY3aVg4Q29UR0NUemdrTVo3NXpZRXNHQkZEbWds?=
 =?utf-8?B?UVJMVUxBSUo1R0VrZnFSQ0hXYUVCZWtLdHAzZy9yZllnTnRRYTRKNnY1ZVBh?=
 =?utf-8?B?dnd3OGxSTlRqMzFIdDVpYUZTWE1UWlVwdGVPdElYbXJXdGFLeVJIaDdqTHVy?=
 =?utf-8?B?eEMzMmZCRHk1eU5YaFh4MnhpZHllNEdiWXBoaUJTMTZMRWhvVXJmaU5YY2x3?=
 =?utf-8?B?RGVuK3pyV1Zrd1EvWWxieGRXQUhZclhsSzJEQlJIRkluU3BucEhZeEVTakIv?=
 =?utf-8?B?TnQ3RDh2WVh3TkxBMUZLbnhxeGxuc215emttOHBGekRBbC9nTWRIeXA2T2Fm?=
 =?utf-8?B?QjRiRi9PZVRaWFpBWjhSRHE0UTZ5RjNtbWY5K1pNZVZBZ3VySkl6N1d2c053?=
 =?utf-8?B?c3pzLzh2N3VSRDhrUjgrMTdvYU5ndnV5R3FHM3VxdENDamtzUTVJSDVZNmQy?=
 =?utf-8?B?bng1aDRtcTR2bm5SOE8xc0RWWU5TVDFPb0R5QjBtZHBqTk1USitNR1RJd0h5?=
 =?utf-8?B?TVVXdHJKRlZHNzB0dC9iVlNRWVYvUysyRXFnaWdScWhvSFdrbnZEVWxSMzJy?=
 =?utf-8?B?YTFNc0lUY29iSkhQNzVZNHZmSDlPcVlMMkFKeXZ6WEc2Wkp2WTBNTmRiQXkw?=
 =?utf-8?B?a2htNWZibzBnL05BbDV3M2JlcjkzSFoxVnVSaXFRRG53SkwyTTZNSGJiclNu?=
 =?utf-8?B?VFR6V3hzQ3Z2N1VjQlJBY1ZpL2o4bFVPeWdTTTQ3OE9nWVNJeVcraUUzejdF?=
 =?utf-8?B?b3I5UUREbGtLMDlkWHNNNzBzSFZBOVV5dStXQmgwRVJZeG02UzM5OHRXRVVa?=
 =?utf-8?B?RkR3bFNnS2RsSS9JZm5VOGM1MmxOd3hRVzRSSkdQQi8zNDNwMW54QTBwWVl2?=
 =?utf-8?B?NmlROWlvYWNCVU5tK2pOZWU4OTFPalpDTkhFMGt1SUl3V3kwMXNOdCtCUmF4?=
 =?utf-8?B?T1lxZmVvaU5SRXc3cWNmN0hDMmZyQk8ybC90Z2FwV21pYVd5UlgrQnZkMExv?=
 =?utf-8?B?T3l4MnhIa3VKTnZ4S0ZxWnlibkRsdmlXMFVBZFZvWW5ORjVjb0pQQU00VUN6?=
 =?utf-8?B?MWIxR1hacW9MampFOExTbUdITHBHcy81MEtVNnh0eFBWZGNJVXJYNURqUGxV?=
 =?utf-8?B?eW1jR0FlaE1MWlJGMkhUckE4TXJZc3hJekE3dWFNV0pNcnRldUtpT0x5dXgz?=
 =?utf-8?B?T1NXSFdveFhpVVFEeVpDUG1mTllLOEV1bFM5ekpaVThNZjVVMkRXU01vQVZp?=
 =?utf-8?B?ckhmcGNVa2xsck9GL0tvVUFkeHcwaWdHQmd3cHRXdjhsRm5ERk1MWnFsM0FN?=
 =?utf-8?B?UWdXU0V1ZWJCZDhxVnBGVzN4eTBSM1I3dVZsU2tKUXh1Tnd6c0MrSjkzVzRl?=
 =?utf-8?B?UGIwT2twTng2NTBNRWtxaHlvMnpScmkvVFIreE5DTER6NFVjalB0YlpVdEtL?=
 =?utf-8?B?UndSOUxHMmplek1BQTNXbXBSQkVlV2R1b0NnT283Vk45Y2c4N0V3NXM4OFRh?=
 =?utf-8?B?SzNZaktoZDQ1ZWpoaWQ0aFAzVDI4czJVNUdJbGZ0elgvREJYcU10elVwT1Q0?=
 =?utf-8?B?RERMZWhwQmZ2cTgwM2hHWms3b2tMeWtacDc4b0J3VUdzeW5aVk50eWNYNGc2?=
 =?utf-8?Q?atedPDj197CwltNf8LgyvELIvE3oDCmR11thqhH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87a555f0-e810-4a79-cd6b-08d95bc9d5fa
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2021 06:41:08.7182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WRzJ9Lc6MIrjgwoJOwQkkuSXSW75FQo2OTYQ+iGWjuwFPwH4cFKoN9UGsYOKUlsqRxZPgVIWPy4L3Y/rgp4DjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2702

On 09.08.2021 16:47, Costin Lupu wrote:
> These changes introduce the page related definitions needed for mapping and
> accessing guests memory. These values are intended to be used by any toolstack
> component that needs to map guests memory. Until now, the values were defined
> by the xenctrl.h header, therefore whenever a component had to use them it also
> had to add a dependency for the xenctrl library.
> 
> For this patch we set the same values for both x86 and ARM architectures.
> 
> Signed-off-by: Costin Lupu <costin.lupu@cs.pub.ro>
> ---
>  xen/include/public/arch-arm/page.h | 34 ++++++++++++++++++++++++++
>  xen/include/public/arch-x86/page.h | 34 ++++++++++++++++++++++++++
>  xen/include/public/page.h          | 38 ++++++++++++++++++++++++++++++
>  3 files changed, 106 insertions(+)
>  create mode 100644 xen/include/public/arch-arm/page.h
>  create mode 100644 xen/include/public/arch-x86/page.h
>  create mode 100644 xen/include/public/page.h

I'm not convinced of these warranting introduction of new headers, but
I'm also not meaning to say that I'm strictly opposed. I don't recall
this aspect having had any consideration, yet.

> --- /dev/null
> +++ b/xen/include/public/arch-arm/page.h
> @@ -0,0 +1,34 @@
> +/******************************************************************************
> + * page.h
> + *
> + * Page definitions for accessing guests memory on ARM
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to
> + * deal in the Software without restriction, including without limitation the
> + * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
> + * sell copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
> + * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> + * DEALINGS IN THE SOFTWARE.
> + *
> + * Copyright (c) 2021, Costin Lupu
> + */
> +
> +#ifndef __XEN_PUBLIC_ARCH_ARM_PAGE_H__
> +#define __XEN_PUBLIC_ARCH_ARM_PAGE_H__
> +
> +#define XEN_PAGE_SHIFT           12
> +#define XEN_PAGE_SIZE            (1UL << XEN_PAGE_SHIFT)
> +#define XEN_PAGE_MASK            (~(XEN_PAGE_SIZE - 1))

The latter two, being identical ...

> --- /dev/null
> +++ b/xen/include/public/arch-x86/page.h
> @@ -0,0 +1,34 @@
> +/******************************************************************************
> + * page.h
> + *
> + * Page definitions for accessing guests memory on x86
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to
> + * deal in the Software without restriction, including without limitation the
> + * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
> + * sell copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
> + * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> + * DEALINGS IN THE SOFTWARE.
> + *
> + * Copyright (c) 2021, Costin Lupu
> + */
> +
> +#ifndef __XEN_PUBLIC_ARCH_X86_PAGE_H__
> +#define __XEN_PUBLIC_ARCH_X86_PAGE_H__
> +
> +#define XEN_PAGE_SHIFT           12
> +#define XEN_PAGE_SIZE            (1UL << XEN_PAGE_SHIFT)
> +#define XEN_PAGE_MASK            (~(XEN_PAGE_SIZE - 1))

... not just for x86, but in general, should imo move ...

> --- /dev/null
> +++ b/xen/include/public/page.h
> @@ -0,0 +1,38 @@
> +/******************************************************************************
> + * page.h
> + *
> + * Page definitions for accessing guests memory
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to
> + * deal in the Software without restriction, including without limitation the
> + * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
> + * sell copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
> + * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> + * DEALINGS IN THE SOFTWARE.
> + *
> + * Copyright (c) 2021, Costin Lupu
> + */
> +
> +#ifndef __XEN_PUBLIC_PAGE_H__
> +#define __XEN_PUBLIC_PAGE_H__
> +
> +#if defined(__i386__) || defined(__x86_64__)
> +#include "arch-x86/page.h"
> +#elif defined (__arm__) || defined (__aarch64__)
> +#include "arch-arm/page.h"
> +#else
> +#error "Unsupported architecture"
> +#endif

... here. I don't think though that 1UL is an appropriate construct
to use: Imo the smallest type this should evaluate to is xen_ulong_t,
the constant should also be usable in assembly sources, and it would
better also suitably sign-extend when used in e.g. XEN_PAGE_MASK.

Jan

> +#endif /* __XEN_PUBLIC_PAGE_H__ */
> 


