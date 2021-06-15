Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 220F73A8158
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jun 2021 15:49:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142214.262480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lt9RZ-0008PU-Sl; Tue, 15 Jun 2021 13:49:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142214.262480; Tue, 15 Jun 2021 13:49:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lt9RZ-0008NO-PT; Tue, 15 Jun 2021 13:49:29 +0000
Received: by outflank-mailman (input) for mailman id 142214;
 Tue, 15 Jun 2021 13:49:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=stKz=LJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lt9RY-0008NI-5w
 for xen-devel@lists.xenproject.org; Tue, 15 Jun 2021 13:49:28 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 03ab4646-a3cc-4c42-9fb8-d1cf54a9922d;
 Tue, 15 Jun 2021 13:49:27 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2051.outbound.protection.outlook.com [104.47.9.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-35-JQPXKHijOhiNFV5HlvdraA-1; Tue, 15 Jun 2021 15:49:25 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2608.eurprd04.prod.outlook.com (2603:10a6:800:4f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Tue, 15 Jun
 2021 13:49:23 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.025; Tue, 15 Jun 2021
 13:49:23 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2PR09CA0010.eurprd09.prod.outlook.com (2603:10a6:101:16::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Tue, 15 Jun 2021 13:49:23 +0000
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
X-Inumbo-ID: 03ab4646-a3cc-4c42-9fb8-d1cf54a9922d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623764966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L7Ef1FjiN7x1QXO4WGuChpDpELEzNJEDR5HVvEYj5Ps=;
	b=SR3Ec3L4As7MMQiIHHmII7MCpDL0/7UuN+qqTv8QvQ2XfM2dwY6g7C0kzNfo9YByct7udm
	kBBgyxeCTjwpev9TeI+EPxtfSe+KsdkM4RKxKWKwLaK5hzHStueJ6aDv3WlhOhfQ8oAcFm
	qgGer5coEXtRr4dEDwmGpbgJxOREE/A=
X-MC-Unique: JQPXKHijOhiNFV5HlvdraA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jaZAaf/1k8x23YV5XgdVCSzALrmT8DfMOMLMo2M4A5pyRWnlxapu5EbHiUvx5nMC4twz0iNIcGm7SDkQSgpWAiYQt40xKJvHMeIblpw1OALcNKm5gdiTpmwP85T/hoOyKJ/7BoEkGvlSJvhTJKo99chHRvNG1X0pAqnuAV7WF1vkYA2PwxZpl6qUlLu7J9Yv69R+vANUKGT9FUrBk89jByjQg9acQcTTE30CLWXlUc7grA5MetueUed6MAckJ7XGVSAKu9xd2DqrefRVG59JOS1kh98gkkJ5HABwZB5nBvh4lGFhNhF3mz/tfqmNIHHdSz8q5sOIzh/45DLWhKW+Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L7Ef1FjiN7x1QXO4WGuChpDpELEzNJEDR5HVvEYj5Ps=;
 b=dKrCqU8qwc6EaNp0IzIaWN8aVCmbaYChXlx6QY4qMZuOXDnqaDmbkOi1+pstY7pzGWb4dRzFEhY/n26RirivL4WzHvIrOqzBevg1QFsKhKZDc2Il/gUVAdOCEx/9zlKtg1LuhOzKhH9FEaO8hPc6kkd8YDS3FcFSTkw7ZvoLd86GGu3LIfHutJ79glJmlgCBwEw916K1sG4o0xI89Zj75VfvMVBmgBtLBXtCSpCJlFy8Cu9hxuSLVD6i+nqt8z6tNHtv2SzqKxz3NB5gD5VDDkFfo0ZtqL9MA0kkFotA//zrhxODdGUR+nVVHOJQbMKIHxrxnxFEY6Y8SDOXPCi7Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 5/5] tests: Introduce a TSX test
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>,
 Edwin Torok <edvin.torok@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210611163627.4878-6-andrew.cooper3@citrix.com>
 <20210614161317.31481-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5e48f143-5a9d-11a6-be98-37e67628c708@suse.com>
Date: Tue, 15 Jun 2021 15:49:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210614161317.31481-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR2PR09CA0010.eurprd09.prod.outlook.com
 (2603:10a6:101:16::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 060da0b7-ea59-4232-a6f3-08d930046228
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2608:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2608AFF89F8CDDD484209697B3309@VI1PR0401MB2608.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zuOhf2OSJUyHZUvHXmNk50e7mTZLmA2F+p2pY6+kTNqXaG8ZypXlNSCIyFG2Gz4BlGuteymiu8oJefuqS+UuZABNVmfVvRQSdY9Hj2K/6R1rsREzEfQXg8bA7go+JmcUNwoHfyfgu+zkVmsl3Vt6BEIK1mAgH7YztPGP9EyjK7mkze9bufb9WTFLm/FyFhop2Tp5yQqvXRZ36ewiyclS1TDTF1VPFaZ639dQIwjaWEOc2aD7bwJuSuGvv50RxhnMpjr8xyMj/H4teO3AgaBmqfsK3EgixUs2SLxIDaB233sM6oFf8ymqDhoqbvvm2KZYl54OUrVt9kuHg/FJ9wiUt21cqB5ax3GBB8x+i8JKqW46x6t0LOcINYuGfZ9yfBprrceu5NapJbryUFZvmeCdm+4zWzQo1edg0qqeUrJVBe+UZFtspAaSxGjNeT/9sBYI7KXTji15ISrZoevjhJBoxHKOO/v40eCSqd7LCl3EluxvTl5Ch5PFOwEp/QtoWf26HX8LbXY5FZW89wRgbGkPwX1wMGCT3Fnfb573pXmpOv65rBUE/c04Y+9eF+FlI4O7dRDJnDVsKV0gd3AFTj6atFmw4ReAFyhTPjIzddnI+5oP2P4ZpTkpnE6ESkL02Yv9VL7hXAGs/GjjSkyzVMnGEiJ7BZ879TrtRpuviCqPEI0HpL5L7fM9QC67z9xTjijb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(366004)(136003)(346002)(376002)(39840400004)(66946007)(66476007)(66556008)(53546011)(83380400001)(186003)(6486002)(26005)(54906003)(16576012)(16526019)(31686004)(5660300002)(478600001)(86362001)(8936002)(38100700002)(2616005)(4326008)(2906002)(956004)(36756003)(316002)(8676002)(6916009)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUlHajNlRGZFR2h2Z1g0QWtxWDhJTG8wSWRSakQ2d1Yvck5rQ244TG9lcWdZ?=
 =?utf-8?B?WEwwWHl3WDFGenFaTm1kTWFpd2dldThON2RCYUJGeUExZkdJRU5TZy9IaTIy?=
 =?utf-8?B?ekNzbDR3MTlzZEdvRkw4dVpsWWdnSzBJNEV2TUZqODhMa2dCbkR6QkJkVjhF?=
 =?utf-8?B?RjhhQkRpRGtOWjY3M1lSVElmSUxrQ1VzOTJPMWpBNmltU3FwMjRJbUp0R0VN?=
 =?utf-8?B?Z1dLdzkxWmpPby9QclVrdHRldE44Yms0OGlBeHBxWWt4KzhzZ3VCai8zN29q?=
 =?utf-8?B?VFFLVkhPamZYZDlZQWhzb2cwUEEwaWtVczZuckE2V2pSYzllZ2FydHJwMDZM?=
 =?utf-8?B?S3cvSlhIV2VQTlZ3WEszSzIwdTYraWNEYWhWNFhKSWpFdHgyQ3lPR0RjMnBo?=
 =?utf-8?B?WlZYRHkyKzhJYVgyMnlKUUoxOStPSlZGUkpOTXR0ZTN3anllalFCaWFDNGR2?=
 =?utf-8?B?YlBLY2FNZjVLNHpWSHdKRlhERkJaQmZmMXdnVEtSa3I1ODNlc3ROTTJuK1dl?=
 =?utf-8?B?bUkxTVE2c05icGRsN2pnQk1mRWFSZUppTTZ0ZWorQ0dpeWF3VXFvYyt1dDN1?=
 =?utf-8?B?THpXbjdRa3lQNkwyNkcwS2RvVnJlZFl0NVRBWGNkNVJjSHFuOGk0K2Iranp1?=
 =?utf-8?B?cjkvYkUySjB6b1VjWUNaTlBZbytZbnl3cDhPZlNyZGdZQjF3THU3UmR0L2cw?=
 =?utf-8?B?WDh2Qk42VXFydkd5ZS9nSWxMODVDem5CbUFXcU51RjlYcFRwemNkWW8yL2RZ?=
 =?utf-8?B?K0FBc0Z0UWdLZjB2L2lNcnQ4YnBBQmg5am5uaVdXZlpCZ3h4UGJMRDBYR3c3?=
 =?utf-8?B?N2RTZVNxZ1UxaXhPMytYQWlzSzBQemVZZGZpYzBkb2wvUEJaOVA1WHhzZm01?=
 =?utf-8?B?NmJReXcyZ0Fya3loak5UU1JDeGI0UXN1ZFhONFp4VVRoUEpCcmNLWnhtQTRW?=
 =?utf-8?B?R1picmxDOTdQVWFNKzJUUzY1YnRhYmUyZm1nNmExZjVRaW5lVDZRZTR4dXBN?=
 =?utf-8?B?N2VHRENEYm5WbklQb0NGZ1BsRjN2ZzljbFEwR2ZLZktidmtDQmNzaC9YUzVP?=
 =?utf-8?B?WGRvZW9qQ3Rwbk56NGg2ekZzUkdLRjN0a0g4VEkxNEFhOTFZWDdIVElOMWg0?=
 =?utf-8?B?RGV5TzVUOFdjSFFEL3AycUpHTUcrYUpvd2gzQXZpcCt2NnJHeE13bWdyY1J4?=
 =?utf-8?B?MGZOcFc1WnJnWW12SzNnc1E0RHZZYjlhYXBYRDk5UVJQTk9pNzltdlhhSkVT?=
 =?utf-8?B?TEJYSUprN0gzYVFsd0x5czRIVUE1ZFgwZXdQM0NQbkZzMDcvaTRBQ3RLSC9F?=
 =?utf-8?B?aEFIQXRzN3VBSmZNTnd4SXQ3NEtSbCtVQUkwNlgzZVVjeFZIa2dNbVBqZDBC?=
 =?utf-8?B?amc3SEFCVVpwNFhzaG1MK0F4U2pLOFdaN0JQelhNYkZ4SlJyQWxZQTd5TXNB?=
 =?utf-8?B?NkQ1L2s3eEY1KzJqOElURExmcnRqSHBaRlJLSkRQaXRYUlpaTlFSTXlCNmlJ?=
 =?utf-8?B?TVh2N0gxSUlWbFd4WUhMc2NMY2k0S3llQmcrdDVFNWlldi85bWpPZ2RPaHl6?=
 =?utf-8?B?UWFLalE2amlDVHBPUGdzanFqT2pDb05GTGVhZkI5L2c1TnRJUUhzK1VUaEox?=
 =?utf-8?B?U2lnU2ZGN1NlYTVlNWxpNFFRcUFTTkphbElFam0remRuMldjT1R3anRLMWE5?=
 =?utf-8?B?UDM5UVE2QkczbFF2YUlIRWZRTitWZENYdnlQSWcwVnlpa21OMkpURlM0dExM?=
 =?utf-8?Q?FWk8h90VDq3FTXhwoaI116ipBJU5flXtLImzw5s?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 060da0b7-ea59-4232-a6f3-08d930046228
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2021 13:49:23.5529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rM6CAOL1LbdA8ea3syk10bvWBrljg7w45Jugcy5B9ZvpORMD8ef7qqrrVvMex77ZvKUDQY54Soj2XwiJ+qXQGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2608

On 14.06.2021 18:13, Andrew Cooper wrote:
> --- /dev/null
> +++ b/tools/tests/tsx/test-tsx.c
> @@ -0,0 +1,538 @@
> +/*
> + * TSX settings and consistency tests
> + *
> + * This tests various behaviours and invariants with regards to TSX.  It
> + * ideally wants running for several microcode versions, and all applicable
> + * tsx= commandline settings, on a single CPU, including after an S3
> + * suspend/resume event.
> + *
> + * It tests specifically:
> + *  - The consistency of MSR_TSX_CTRL/MSR_TSX_FORCE_ABORT values across the
> + *    system, and their accessibility WRT data in the host CPU policy.
> + *  - The actual behaviour of RTM on the system.
> + *  - Cross-check the default/max policies based on the actual RTM behaviour.
> + *  - Create some guests, check their defaults, and check that the defaults
> + *    can be changed.
> + */
> +
> +#define _GNU_SOURCE
> +
> +#include <err.h>
> +#include <errno.h>
> +#include <inttypes.h>
> +#include <signal.h>
> +#include <stdio.h>
> +#include <string.h>
> +#include <sys/mman.h>
> +#include <sys/ucontext.h>
> +
> +#include <xenctrl.h>
> +#include <xenguest.h>
> +#include <xen-tools/libs.h>
> +
> +#include "xg_private.h"
> +
> +enum {
> +#define XEN_CPUFEATURE(name, value) X86_FEATURE_##name = value,
> +#include <xen/arch-x86/cpufeatureset.h>
> +};
> +#define bitmaskof(idx)      (1u << ((idx) & 31))
> +
> +#define MSR_ARCH_CAPABILITIES               0x0000010a
> +#define  ARCH_CAPS_TSX_CTRL                 (1 <<  7)
> +#define MSR_TSX_FORCE_ABORT                 0x0000010f
> +#define MSR_TSX_CTRL                        0x00000122
> +
> +static unsigned int nr_failures;
> +#define fail(fmt, ...)                          \
> +({                                              \
> +    nr_failures++;                              \
> +    (void)printf(fmt, ##__VA_ARGS__);           \

fprintf(stderr, ...)?

Either way (and with the adjustment you pointed yourself out in reply)
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan


