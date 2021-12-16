Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 382544773DE
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 15:01:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247976.427664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxrJH-0000Xd-Bz; Thu, 16 Dec 2021 14:00:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247976.427664; Thu, 16 Dec 2021 14:00:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxrJH-0000Vt-8c; Thu, 16 Dec 2021 14:00:39 +0000
Received: by outflank-mailman (input) for mailman id 247976;
 Thu, 16 Dec 2021 14:00:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VxGf=RB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mxrJF-0000Vh-Uy
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 14:00:37 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b3fd471-5e78-11ec-85d3-df6b77346a89;
 Thu, 16 Dec 2021 15:00:36 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-ixWsouYaP-ioJc9jZna7rw-1; Thu, 16 Dec 2021 15:00:35 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4848.eurprd04.prod.outlook.com (2603:10a6:803:55::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Thu, 16 Dec
 2021 14:00:33 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4778.018; Thu, 16 Dec 2021
 14:00:33 +0000
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
X-Inumbo-ID: 8b3fd471-5e78-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639663236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8UE9ysZnnZMtzNOvo68CEBc6e1obdUMxjlIfpT34rqQ=;
	b=nc4dYqYeTglf4GfmHJy9S3xMMrsX3plZnvKw23HKOjAHb4l8Ttk9E9CoD8YnVrpPiVRrSM
	bHcVZsEIv0qabPHOAI8fGFNXKMMXwyBrBAdOPEV1OXlFehdPCXoOQcVOR7iTxn5Bf3T4Ru
	rt9GQsh+ZgoL5fMBj0nrXXfV8Qig5yY=
X-MC-Unique: ixWsouYaP-ioJc9jZna7rw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JxAA4Siv8aY9nK7C3eSJAvJfpcT78kPwYkJMch0XRiOwOi21eWoDwgYPIQ41xBL7zNyTcCcjQcxfZ36QaloQWEvX1dG3BlGIhcsxgD91na8qF7W9UKwMO/U0lGbQed3mEZEGSohILFgKNmzAyAQs1Gc3PDcaG18GovN8EWAIbRJgCGAikFBFzqV5J8DsoeboFp5Sjnm17IRn/xlpmYgSJAY47tLZILrNeBgNAKsskfk15v1N38lgIcUE2W6vP769XC06QZRUmLSB5O9CAvZ9pQbx2ZAT3Ah+5N9JbeDKv582yn9E2Qu4UUaCcu7oIbf4Nzog33zudxCq6FZDwT4f1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8UE9ysZnnZMtzNOvo68CEBc6e1obdUMxjlIfpT34rqQ=;
 b=ciKovPzCI8sk2RGEK/8yQ5PSWO8naF6bTwLm2YRX+0LHAI9WP/zG+fCtDNleHaOsYupDkdxxHMdZrqlCNU+C8M2D5FryvR805HOz8+i88IQ5bxCQLQJbALc51YiMGa6l2MJaCbDeBTnt2zL0buLYWERS2kRZjKOOFHq6fMPwg4hHCs5IgCcDjAENcrmCkXECLzuKd1+fSnaBG+9rMIolAFj9k3xLZojJPrLDdYU7rMSrRncxE/Qql/pgfbJUFWG6R648xGO3d5mxnkQbVTcHl9zmsMh9nt5M+/qhYzoQVCHhUhL1m6AZsuQPgEX1ABMvMc1v04KBwLznUhqPk5edcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a6dab969-ce3e-a328-03bc-c27abbba0448@suse.com>
Date: Thu, 16 Dec 2021 15:00:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] xen/build: Fix `make cscope` rune
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20211216092014.707-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211216092014.707-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0009.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: abb1fd67-501c-4ae5-a89c-08d9c09c6d1f
X-MS-TrafficTypeDiagnostic: VI1PR04MB4848:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB484811E7FA6C43DF5FB27AC8B3779@VI1PR04MB4848.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	S3r0WakVH8XnP6hSHAMICvmdtWA7ean1Ir9KwC5AUfTHf0voiBEZREMJXcZcwcuC6by8UkdARDF1JEn/wGicOsfhPRtPBoWqEKJskXRCpp7sRRZwTsrBgKU/oqcxIK0IIurZFepQe7eHohwwB8daAGRfZA0BVw3Wph9NWj1s/89lVnC4YjJB+Ja+M0hXa5eZdMtcQvohCrUQH7tAStldGCHiaZ1W5buGaW5wIdWBRGd7yDAOoi5P7fATBJ+Kdxqt2j7IJ6P29aOSGj5gauYz4AYho0wpmWb74+a8auKGeGZM/WJ4jAx+bvOUifijLo6HgTK4IrqOD9xfoAUh3OVzjLfok1gKqYMrTAwX3z638UnfrB0Cpz8qJlgMaCayVpKpvC5GEiO0VB6KfksXoWi85LDMED85j2Upd3XISZ1CCT5I8vACWRQfbXh3JLJnmHDv/IFgmaeJLV94NA0pLjyF4EsAZ9tGIfkq1jm6+ApznZG8bbnei6lMj+qpsqpjc+oZqTMu0rzFHYYkVagCjZ4Oe6KGTSMVFiIOJWMdJUZHI1RVkmir+7y4QCS8tAoeQm7NWauyA39HUQpK/8l6eEbGBjNFwtGVGdbvGMRKsr6/VR1vNMvXqfGYO+/hCq9Fem60d9prafgxXiAZ4hElzlvzl1RsxNSZsTDtAyYDUnx/R3eMPFS2fAv/zjfRlhCz+KOMEdfx8UO4CXPXSXNG1svUk61rnQqM36dlGKGmvxBCZbBMsm4qFgND8dSfoOrmV6HmQla0fz/QloZe7vC657CLwg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(83380400001)(6512007)(54906003)(6666004)(8676002)(86362001)(5660300002)(6506007)(53546011)(316002)(508600001)(6916009)(36756003)(31696002)(38100700002)(2906002)(4326008)(186003)(8936002)(66946007)(6486002)(26005)(2616005)(66476007)(66556008)(31686004)(81973001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUw4STRrVXEzcTRrWFZzbTlxeWxLVTZKR2hYdUJqdFNHNXBBM2xSdG1PRUE5?=
 =?utf-8?B?YXlJa1hVL0hDOUFQR1lOQzYwOE52eWRIY2lYQm8wVG9qWUM1enUyN1hOVzNS?=
 =?utf-8?B?RHBTZ1lNblhFbU16cXFsZXptZUFBRUYrQ0ozVG16bXA1eWh2Y0NHRHkxK3F4?=
 =?utf-8?B?bUgvS1NBUi9WdGgzZnExd2VNbW16RlpTaUVwRklUNWxHdERkdVRHdTJxWFBV?=
 =?utf-8?B?Mzk2M3hZc0phd1ZjTzlUd3J0eS8zNTJ6d3dzdVo4dTEzelZidDRNelJYUlIz?=
 =?utf-8?B?Kzk5bFpHVU9EWGVzTG5SY2ZkVVRwL1h0SkpVVzJlMm9KM1JiMHVuZFlud1Vz?=
 =?utf-8?B?bFYxbFlxRW0rS1duUjhUWDdGN2lrdk1jMUI2ZXBzZ09ESkw2UEF0SGtIREFj?=
 =?utf-8?B?MWtmNzRHdFVOd1VRU3UyUk1RMENJeXBQTXN2MXFORFdDcTBDVm10cmhxR25T?=
 =?utf-8?B?Zkl6SDJxQTkxZzVCYkE2bTJYYTJLWkpVdHdxaWt5SlpncXJ6UDJNZ3ZlTWxZ?=
 =?utf-8?B?d2hzc1lZRWxpK1p1eTRaVGNRRW1yYzVsdmsyN3E3d1hFWUVhWWtBdGl1RVJz?=
 =?utf-8?B?YmlxSjRNejZJYmN0R0IyK2MyUzBUWG5zRXgzNVRhbVU5eUZWOFM0d05PTDgy?=
 =?utf-8?B?ZDkrSDVkMEs5TFNmRWwrR0d2dlpjR3ZjTnczWlpXVExHbWRGUFlKdVR3cElt?=
 =?utf-8?B?bjVVTlpjMGtYdVVOS0FVbXp2b2xHUUpBWWhjSW9wQmZ3a25lNGg5eHpqMld2?=
 =?utf-8?B?Tng3K3FzNzQ5YlJaMWlBSzMyakcyZDA2L0Q3TEhvUEYxaC9XajFma1BobTB2?=
 =?utf-8?B?bVRnYTZiWGh5Y1AvR3JKTDV1eUFiZFpseUpucjJTazduQWxMSUZjZVg4L0U5?=
 =?utf-8?B?dEpWVUFKVkJZUzU4YTZXY3hRcmgwcTNpbENwcjd4UkhweWRjUFpmS2hQWlV5?=
 =?utf-8?B?dHV4WW5zZzVSL3IwR3d4a09pTmh0VGVXM2tqR3dDSktmVGFaQnJ0TkVkL3hY?=
 =?utf-8?B?UndVbEhza2srQmhaZUNSUG1FQXBsMnNQTWpuVU8wQlBHbjIxYzdrQTdKcndW?=
 =?utf-8?B?Qzc4TmVWa3hoTytmWUhreTdUUk1kU1cwSENWaDQvY0ZTVHo0bUNXZFZIQjhw?=
 =?utf-8?B?bmovalFYL0VXSzRlN1RBQkUwdWl1REdPRlVvOGh0djVrNFRURk8yZFNvV0xF?=
 =?utf-8?B?UDEzbVhrU082QjQyUEVMYUxmVDBXbEpwY1dIWTRKNzh5RXk3T0hDY1hkL2Vv?=
 =?utf-8?B?V0poWlZ4RThMT1dUUERaRmdJNnhXSlFic0JnMGlxS3Vrc2w0RjlNclRVb2Uy?=
 =?utf-8?B?SG4zQnQ1SDNyYWwyT21vdk5RQkpnczFhZnlQa0hzQ0ZIVWsyL2ZGbmlCM0NR?=
 =?utf-8?B?NndKVStGWHkwaEpUaytuN2xDS0NuNzF6eW5jZldhOWZ5UHJQTG5SMmZVVHZw?=
 =?utf-8?B?andSSlYyZWJrRjdVT1VwclFaNzBiNWthRlpxOTEzUTBOVlo5WER6OUk5V3Zk?=
 =?utf-8?B?ZmlaSnU5MHptb29TbjlLdUFQTE5Bb0psQU5MTHJvZmhTMkVCUUZiSW5ZdzNp?=
 =?utf-8?B?ZTdJRWFiN3ZwTWVzWXBGWFlLWlkwWGlSMWNHWEJodTdPdWRyOHVJV1BNaWx3?=
 =?utf-8?B?dmJpZXU2VjE5eVFwdVRFKzZTdTJiUC8xcHpDSkljT1VGVXREc1VRaGNNMUpU?=
 =?utf-8?B?RW9TZ0JkYlZEYnBVRlNaMHZuK1pDVTd4aUo1cmc5a0xLeWE2Sk84Q1puZ2xs?=
 =?utf-8?B?RmJIQUJidnVYQ2FoNVdPdytMWWtMK1h4VjBodnBvc0pvUEVKQUkxd0QwWFA1?=
 =?utf-8?B?ZnRQQTZYYnJaZmRScUFNZS9mUnF4bGxEa0M1RW9HVXRDOTBwRmQyRXM5VkRV?=
 =?utf-8?B?ZzAwUTMrNWt2YXBIT2xidkF2UG5SVkRCY2lTQmVOK0htcm14T0VDbjBCYnRs?=
 =?utf-8?B?MjlJcDFsNm1zZmJhbkkvOHV4VzV4MVBUWmVWOW54ei9wdW5EWVZSSFQrank4?=
 =?utf-8?B?K1ZjRkh5Qk9HbDIrbXFzUDhSS3dZWEdEQUxRakVkMWVxUy9rN3hQSHVhQmlL?=
 =?utf-8?B?bHlYVWZ3UkMrNG10T0l2NmJhNUpQdk9LMExpY2t2VE9uU0hFMUs2bVpLUXNP?=
 =?utf-8?B?K2l0eFBRTnJUdkV6M2tIVmZCcjIybmFhbUtnQlNwa2pZcjI1TGs0b0c1TFBm?=
 =?utf-8?Q?HEL80TmeBxI12TSxXBmYpDw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abb1fd67-501c-4ae5-a89c-08d9c09c6d1f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 14:00:32.9817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L6s5PC//6ZDjGoPKcsDWHCH+O+BROspjlXJ9Z119qOnl7h8ecIA4qGW7iIyOFcGrp1Gn/vKe/ENDV6yosMpGnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4848

On 16.12.2021 10:20, Andrew Cooper wrote:
> There are two problems, both in the all_sources definition.
> 
> First, everything in arch/*/include gets double hits with cscope queries,
> because they end up getting listed twice in cscope.files.
> 
> Drop the first `find` rune of the three, because it's redundant with the third
> rune following c/s 725381a5eab3 ("xen: move include/asm-* to
> arch/*/include/asm").

I'm certainly fine with this part.

> Second, and this way for a long time:
> 
>   $ make cscope
>   ( find arch/x86/include -name '*.h' -print; find include -name '*.h' -print;
>   find xsm arch/x86 common drivers lib test -name '*.[chS]' -print ) >
>   cscope.files
>   cscope -k -b -q
>   cscope: cannot find file arch/x86/efi/efi.h
>   cscope: cannot find file arch/x86/efi/ebmalloc.c
>   cscope: cannot find file arch/x86/efi/compat.c
>   cscope: cannot find file arch/x86/efi/pe.c
>   cscope: cannot find file arch/x86/efi/boot.c
>   cscope: cannot find file arch/x86/efi/runtime.c
> 
> This is caused by these being symlinks to common/efi.  Restrict all find runes
> to `-type f` to skip symlinks, because common/efi/*.c are already listed.

I have reservations here, albeit of theoretical nature as long as only
the csope target is affected (simply because I don't use it): Make
rules should really be independent of a dir entry being a real file or
a symlink. I did run into problems with that already years ago when
the shim was introduced. My arrangements heavily use symlinking, and
any assumption on files being "real" ones will break this. At the very
least symlink checks should be restricted to cover only relative ones;
ideally one would distinguish ones staying within the tree vs ones
reaching to the "outside".

> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -468,9 +468,8 @@ arch/$(TARGET_ARCH)/include/asm/asm-offsets.h: asm-offsets.s
>  
>  SUBDIRS = xsm arch/$(TARGET_ARCH) common drivers lib test
>  define all_sources
> -    ( find arch/$(TARGET_ARCH)/include -name '*.h' -print; \
> -      find include -name '*.h' -print; \
> -      find $(SUBDIRS) -name '*.[chS]' -print )
> +    ( find include -type f -name '*.h' -print; \
> +      find $(SUBDIRS) -type f -name '*.[chS]' -print )
>  endef

I further wonder how use of $(TARGET_ARCH) can be correct here. Why
would the enumeration of items here be limited to a particular arch?
When you edit files in the source tree, everything should be covered.
Restriction to a particular arch only makes sense in a build tree.

Jan


