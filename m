Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C24996AB7DE
	for <lists+xen-devel@lfdr.de>; Mon,  6 Mar 2023 09:02:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506730.779858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ5mR-0008Vb-5T; Mon, 06 Mar 2023 08:01:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506730.779858; Mon, 06 Mar 2023 08:01:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ5mR-0008Th-2H; Mon, 06 Mar 2023 08:01:11 +0000
Received: by outflank-mailman (input) for mailman id 506730;
 Mon, 06 Mar 2023 08:01:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MPo4=66=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pZ5mP-0008Tb-2X
 for xen-devel@lists.xenproject.org; Mon, 06 Mar 2023 08:01:09 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20630.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09325fd9-bbf5-11ed-a550-8520e6686977;
 Mon, 06 Mar 2023 09:01:01 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by GVXPR04MB9995.eurprd04.prod.outlook.com (2603:10a6:150:118::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 08:00:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 08:00:59 +0000
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
X-Inumbo-ID: 09325fd9-bbf5-11ed-a550-8520e6686977
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ia5g6ZewEk6A4j7CtabKWykKY1wcuHu+bnBmFkuU8l8z97+90g1lv3cX7FZxX14dOK/3Za435xxzVSGS5IM2xtPc/U9Bt9s/VkX/tNpxd3yQK4PfrmvxcjEbR65M6ZmcGajKr3B4OOi2xNQ/UBLspngCXftMN+/jSwVMmwJGwlFr7Ve+GJ066qTDvbipRY1N4K6dsMM1cSZ2M7z2M21YJLJl6RDrYprMb81ESZOjOBmPPUe1SL9QdCmW1s3wWecoNsFiJN0zz/oZAuRvGkAN92ZKkpEL12LyP5Jg67acj/xYdP2aErAUfcB26Q2RFGogDTdlYipBMESdeGFvWniReg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eVidFXoQ0TImv9+Uo+6DJD93B3ElRJR+9kbL/je1y4g=;
 b=nWw/FE0hYk1UUaWMd/+ZNA9C3VR35PR80fELTuQp1ey3Oqufwzbf4lEuiONYjjN0iDldwxNlxnLbiN4Du5BSKIE/JYGJCL9MPzsw+CH1NRzTwg+Gf2Tbtz8d6wF5wkh+MWqAKKEh7dyTotgc9IHNLD+7vMziSSojYPYth8bWpomW+gzjbxb48Wa+rsFotOjesQqys74tV3ldRxfZKHEHaYmTuFZGjAgOXs/6XZl7RAaZkLocsoU0V76jr970M57rT3lxcfZhU2gs+M7S6e/1rD6kWBk6YiEPhZTdABcp0hhhlVvENd+zNqUaJnaRnSSWd/1klfJRrvk3uSx/TA9fEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eVidFXoQ0TImv9+Uo+6DJD93B3ElRJR+9kbL/je1y4g=;
 b=tgHjAO81ZkWxITomrXk4VSuQD49nVUtqqopKV/PKpstjK3PUdkaQp2vIa9BztKlirolF0PbUJCKTjZbfLYN8g5e+1Bm0h0E5INrl0y7jXgRE3I5+I7MF5CwNxVqwHQsjWWOExhEkvK0UG1zV15CkHgmieZZ1huY2LSRB8YGh05FYTdekTMroSKTnhoNbDYUEh9uDZdXCliWl+RUVsO0ORdjvEo21nuf2nr1doqdNsKD6M3oRRq5Km8xQqdO6KDEum0JNirhp/lXYkL63jMhfI/lgo7s+QV40lSCKfPOuaoTBaYXlHlLjWawpQP2IFahMgdUrMvQPRovLVGi4zG89pQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a38060b7-c4ff-51d2-e596-8bacbd253912@suse.com>
Date: Mon, 6 Mar 2023 09:00:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 4/4] tools: add offsetof() to xen-tools/common-macros.h
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230306072140.28402-1-jgross@suse.com>
 <20230306072140.28402-5-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230306072140.28402-5-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0132.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|GVXPR04MB9995:EE_
X-MS-Office365-Filtering-Correlation-Id: 60673e1d-5740-4cbc-06fd-08db1e18ebcb
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kBN/CJD9T3eRHbX79BjhcxJDrSF2DgHzHmIM0Nf4LoXzjytnQJlyRezkFA+gsojx1CB/z908jzH6wdrTnCi7ZRq5+JOy2GuymVUZPqWQE65xU4WLNA/f+9h6cel9kHJtQgna/qfSOhV74R4RIlkz1vuBmc2xHaHVkq0e7BTJ1EPeYuFToDGTK0JjQyOXYFxVJR8+3C5Sg2RDhYNAD3VasIzgPmynKWIo1LCrD2UxyUMbRJqe+m6e5v0jjFMAVm3oZ4tUjRbxN0zF3XMwusIsTbnsi1D5WVoOxi+MocxYz+S7s7cLFW/DSXRdQ5NTshE6JbJLLVHBH7Dbj5zSQzCKjArEB61RCnFYHDulIMSvH3rPuS9zicfal/vGmoq4te5HvNFLJlwU6hIJ/La9stIa+PJFE4R3b+lDW3tG0KfiXVAtyoGF+9gnz38M5Vl7IGuBn1QM608HCwMj8VzY5htEMsFOF43JB387RNQfJrQOj5hORhEQs4uQZX+vOop/m0HFlQrXAY0uLMuWjtR5ZcAYLykLRR31s1yZrvEnmw3D7/PcKI2mYL7YsFxis4aYUgvdNmwwxwwYHo1EzNAxuc4P7hWDwgD8N2InPdDAbwCo4KSfahiGDVxMB3i5k/ZqwsjlaAYgHcfMges4PquIlsXxwODe7A6/vnwLGe+otj6WstfySGpKFEXAzll656mbE9erVwk17Tvdd16fFw8XUHmhDpQVIG8LcmnjCS6om72eqpg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(396003)(366004)(39860400002)(376002)(346002)(451199018)(86362001)(31696002)(38100700002)(36756003)(2906002)(5660300002)(4326008)(66556008)(8676002)(66476007)(8936002)(6862004)(41300700001)(66946007)(2616005)(53546011)(186003)(26005)(83380400001)(6512007)(6506007)(54906003)(478600001)(6636002)(37006003)(316002)(6486002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bk0vSUtoQkZxcVMrQXFmblMyM1Rvejd6aThrQUR1MFA2SWJsYzRLczRjVml2?=
 =?utf-8?B?NEFqZ2t3YlNPTlU2U1RNd1djQ1VKc1VvOGt3TFc0MkR6TzF0ZExZOStvMmUy?=
 =?utf-8?B?blNoWkFhekhFR0ZOU2M4WXpOTzJlOWY4djRQL3BDT2hNVWVZR2ZpYStBZ0lt?=
 =?utf-8?B?ZnNlMFMrbldwbEQvWE54TzFUMnZtT3FLTnBIQ0MxeHpmQUFvUzdVREJ3OUs5?=
 =?utf-8?B?WlphL0p6QVRlTjNMczc0Y0VYVjZ3ZEZIUE02Y3dhL2V6b1prZjV0cnBqbk16?=
 =?utf-8?B?VGlNRm9DL3lwejdkTWNMRXIyYkg4RU8yWEpBMm01dEJDdmpLRHVUYzhGWTBE?=
 =?utf-8?B?dWJZU2VDemJUTzNCZFdyZGtLZWRJNnlUZWNLMzg4WjJYRDlObWhWakFibzRK?=
 =?utf-8?B?N0V1TThnOE94UXFwaHIrM1BRQlFxQVNNLys0Z2xxUUFmdDVSY2tTcytKSkhz?=
 =?utf-8?B?MkovbVVqNlRFcXJiMGtFcXh4emRNSGNsR3N1MU84T0U5N0J4ZVp1MkN5QzRx?=
 =?utf-8?B?d2Iya1dqazlIQ1FIMGJLbkN0S0VsZHV0anU4Y0FWbmZPc1prbjFCMmlyZzAr?=
 =?utf-8?B?TnNVaVBjYnZjN05iVG11TkdjSHg1d2hkQ21Fei9kVTZSam1sWkNteDdNN1RP?=
 =?utf-8?B?aG1aSVVvTTIvNG1JQXg1TVltTDkybjV3cVNDbm93U0lETlhTaDREOHlKem1T?=
 =?utf-8?B?bGIvWElrQUpibzg1cC9wc014NU9xTEtsc2pvNGJWV2REOVJhaTduYkplODFD?=
 =?utf-8?B?WWxwSlZMdDRjQS9YRmdHVG1na0JOSnU3ZWpsZnRSODcyK08vV0FrazRrNXJx?=
 =?utf-8?B?RXlzaDhma0JtWkhhVDVFMHJKcUZvcW8zOUVsUlYyemVhNHZsNmZ0aENIMm9F?=
 =?utf-8?B?Zjg4Vi9Uc0xacUtvOUhPZVA1Skw0QldSSFRhK1VxMEt1SmpyU0UxSXYxQzVM?=
 =?utf-8?B?NlRLUnNjREpoeUhTMUE3cndYSm4yT3h6akdJZkNNZmZTNEF0eS95eFh6czFx?=
 =?utf-8?B?bWxxMXlnQVNEcEtEQmlCaTR4MWNiU1llWDdaaTJvVkFkTUxGMFBBMk02WWNj?=
 =?utf-8?B?TGloajcvS2luVHVOZk12Q0pLVmtKZlNiOGE0K1JrZ0JyaHQyR1l3d0F0STFM?=
 =?utf-8?B?cWVWbERCMmpIa0huRC9vdTFrSGJSKzNlQ29abzUwUGR4VzdiQ2QwVzdIVmdN?=
 =?utf-8?B?M0Rzczdva3VEVDVyL0ZvSm9PZzJGRHhJOWNHVVBUeCtST0xmd1JQTjAxWDFB?=
 =?utf-8?B?U3FjemxwWnRhOXpnVzVZVGptNklSZGpTMmVZMFZSb0tzRDh5bnUzeE9raVl3?=
 =?utf-8?B?QWV6ZmdnbVFaMDF4S2QvOFB4a0svdFpDWXBQVk5rbUhKeVhsQ1Nkd0YwV3Nw?=
 =?utf-8?B?d2VsQWdDOVVkZEFuQTRiY1NITnNEOG9haWtBUzV0dGUxM1l3ODZsMmIvdjk4?=
 =?utf-8?B?ZXNJOHlMdDhBeWRyVkZYajUyNTV2c2hSTFlVY1dGbVNzOFA3NGViN1FlWFZT?=
 =?utf-8?B?TTV6UFRMYnhmVEFSNk5NTnFGamZ1eXhJcU8ySGlMT3E5SXdjemdiWXpxMzI1?=
 =?utf-8?B?dGJZekJ6WStpQXlQN1p5M0ltTzR3VXdGakk1SEpiUjJmTFIwc0d2Y3A0QUJR?=
 =?utf-8?B?Si9MWHhJbWhpTUtaY0NyWnlaRGljblYyUnI3NEgrODZvbU5KTW5Pb0VYUTli?=
 =?utf-8?B?dnZ3eTV3R20xUmw2eHhqQ1ZnSzgybGF0bTRGTmdpU1RSQTUzb0NwTTFqd1pZ?=
 =?utf-8?B?aXE2emRLKzl3MTlKRmFPcldKT2ZQYVBQbTZqVjYzVWYyMjF3MnZFc3pERTZu?=
 =?utf-8?B?V0hjRmJZVW1tT1FIK0xCU0lQZUo2bnVTS0R4OU1mcG8xS3NDbS9FWnNyNUxw?=
 =?utf-8?B?RVJybTQ2THZ0MlJTN09FWUVXM1pEWGhTSzVVTjVZZms1R09YQ1VxcWJBMnB4?=
 =?utf-8?B?ZnRoazdCWWZSd3VsVmdNYVlxcndkN2tKdWhTQjl5MDlORUR2RTlzSktZUlpI?=
 =?utf-8?B?ci9nblpRQlNqcm5FbFJOSXlMc1FWaEJYb3V2cmRtdXQ2OFlqemZhcTIwL1pK?=
 =?utf-8?B?eCsyUHpucXEycHRRb3krdlJnczUvc3ZlMVplT2VBZDl0WUJTa1IvUDdKdDdH?=
 =?utf-8?Q?ojWQDfzItWGMU1nuuQDvsiacm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60673e1d-5740-4cbc-06fd-08db1e18ebcb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 08:00:58.8463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0pNKubrdhWaiWCT0hfroxoWk6ShqvhJu119z6qPWWtSCyTdZ/RqJ7suCjVlKXZ0bD6xcFdiabo8R70EbyaD/EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9995

On 06.03.2023 08:21, Juergen Gross wrote:
> --- a/tools/include/xen-tools/common-macros.h
> +++ b/tools/include/xen-tools/common-macros.h
> @@ -80,4 +80,8 @@
>      typeof( ((type *)0)->member ) *__mptr = (ptr);        \
>      (type *)( (char *)__mptr - offsetof(type,member) );})
>  
> +#ifndef offsetof
> +#define offsetof(a, b) __builtin_offsetof(a, b)
> +#endif

How's this going to work reliably with parties perhaps also including
stddef.h, which also is expected to define this macro, and which may
do so with a different sequence of tokens (even if that ends up
having the same effect)? There shouldn't be a need to define this
macro for any "normal" environments, e.g. ...

> --- a/tools/libfsimage/xfs/fsys_xfs.c
> +++ b/tools/libfsimage/xfs/fsys_xfs.c
> @@ -19,6 +19,7 @@
>  
>  #include <xenfsimage_grub.h>
>  #include "xfs.h"
> +#include <xen-tools/common-macros.h>
>  
>  #define MAX_LINK_COUNT	8
>  
> @@ -182,9 +183,6 @@ fsb2daddr (xfs_fsblock_t fsbno)
>  			 (xfs_agblock_t)(fsbno & mask32lo(xfs.agblklog)));
>  }
>  
> -#undef offsetof
> -#define offsetof(t,m)	((size_t)&(((t *)0)->m))
> -
>  static inline int
>  btroot_maxrecs (fsi_file_t *ffi)
>  {

... this library or ...

> --- a/tools/libs/vchan/init.c
> +++ b/tools/libs/vchan/init.c
> @@ -69,10 +69,6 @@
>  #define MAX_RING_SHIFT 20
>  #define MAX_RING_SIZE (1 << MAX_RING_SHIFT)
>  
> -#ifndef offsetof
> -#define offsetof(TYPE, MEMBER) ((size_t) &((TYPE *)0)->MEMBER)
> -#endif
> -
>  static int init_gnt_srv(struct libxenvchan *ctrl, int domain)
>  {
>  	int pages_left = ctrl->read.order >= PAGE_SHIFT ? 1 << (ctrl->read.order - PAGE_SHIFT) : 0;

... this tool or ...

> --- a/tools/tests/vhpet/emul.h
> +++ b/tools/tests/vhpet/emul.h
> @@ -115,8 +115,6 @@ enum
>      NR_COMMON_SOFTIRQS
>  };
>  
> -#define offsetof(t, m) ((unsigned long )&((t *)0)->m)
> -
>  struct domain;
>  
>  struct vcpu

... this test binary (which is an ordinary host one as well). They all
should include stddef.h and be done.

Jan

