Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D50323BBE
	for <lists+xen-devel@lfdr.de>; Wed, 24 Feb 2021 13:02:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89290.168090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEsrE-0001iA-Qb; Wed, 24 Feb 2021 12:01:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89290.168090; Wed, 24 Feb 2021 12:01:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEsrE-0001hi-NJ; Wed, 24 Feb 2021 12:01:32 +0000
Received: by outflank-mailman (input) for mailman id 89290;
 Wed, 24 Feb 2021 12:01:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qs49=H2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lEsrC-0001hZ-OT
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 12:01:31 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3637d434-1057-45bd-99c5-83888c23a5ed;
 Wed, 24 Feb 2021 12:01:29 +0000 (UTC)
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
X-Inumbo-ID: 3637d434-1057-45bd-99c5-83888c23a5ed
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614168089;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=EjGlgW462sH8P19Ms353SLwTaTK5KVgqqkHtffHh78A=;
  b=Pp0dG+q/kc//irqpmEXyQ18OjqsofDYlPPlBUUZYyWvx3pxENYmFOG8w
   ZZplRJKwtCAdx3YdlrtkmaF/Jz9xeEHQS6ioRQbkuF7jZFmeKdrduJU9S
   18AHc3WniokvDbVosECrbvw4wIJFgulCax58LrmqZMwFZ0gRsPKwsdJ1K
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: a7x+pRvs27SmkhG9MWSjkknWzCQT8Op4wLpv73zxRHLCiL+O6Kdb/OgziL9yKRYLcDhmLvVCoW
 ToXklTvCvww/jPSUo3k5vKrv2t725Zy4c/Kc5toDt4ICI+POzEpZWtMzSej7S/6zEUa8D8Vy1U
 kP5BwCdYJFZAWw0ocRR9l131UMrljjJSKJADZqVBydj+p2s0FpWxLnsHaRuH1C9ZnUxClVI4ac
 aalKNCo/Wu/YJOn2qdD7w0kPxUocpOun6dT/ZG0eS7roO3e8kANmPaB5CP+kQ7yz8QzyFqidxY
 ujE=
X-SBRS: 5.2
X-MesageID: 38106618
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,202,1610427600"; 
   d="scan'208";a="38106618"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LOdE1Y/pf5SNar6yxJrcUMz+zaZ5P3B7K9RreAUM+SwOC7AV6tf1rk9aNw/8dlas2RovRK8gxK7KtMQZ5mXhhabrtQnIF/6FAKdJcja0PtdQwpUtN7HDTTpt6UtPahPY1lugAy7IIt00A4lMVnyjY2ihaewfODfhdC/9yxcmDXD9l9vJp42mJ6ezc/JwyVAoPdU5dYBnLbCAGDQiQ4pgVrmNTVz/w554dpP/+B+VaFEfbnTgItw1sayI4sctJNdjSqauSCg+NYTpBna8cLi0fMMwIOJNt2SbakOKEUsowPVrvl88SbT0slKoMxi6J3ibsANsS5v2H+9XDLt1SxU+ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UxFW7RVYTR75gQJZBY19+9Q+oJH44WliVf6AYexgJuY=;
 b=FjIjMrG16U9o1kYOpuRPIw5Mg45Z8Ulk0CV3HB7pIcl+/aECHxiyUzjl9+qC81+K4gsrxVkE9wng+3dCypUoFUGKDNCJPUR1gZ4lFUjBMWiQMO9wD5qL+YY/i+apJkNwW1W3LxDy92J83/U6UB2nrVeIokmilt4+8mLwbldd9SSE5ZxYU1b30kQTsX7GVud87LHZQVfYO6XGaLnLPij46FXnAjZq8g4PMF2gPlm+nfan8Jfh+f/AVbslAjDqUFuoQFIWLsr+Y3XvoqzfZDMOn/Pj3ZT4nvXq9jBqu3R0t/D/R+FWOuLZ1DGGCH1lxN1NPpvlg1xvTvUkSYL7OvG5ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UxFW7RVYTR75gQJZBY19+9Q+oJH44WliVf6AYexgJuY=;
 b=wDirOk8JzGer7Cthcaf9U6znLMb/DSBmdhYIXM1PA/01EmN6XhjS17doSa7NHW4YsH8aHosQp8GPtMZiRrNmThy20ip2atWDX428b9r2qTb5C4z13LRV5aKrQhYqKZ0V6h90Q7p4J4dC6Qlrx0KLFzhFfmlfcchxpwTuNsuUfa4=
Date: Wed, 24 Feb 2021 13:01:19 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, "Ian
 Jackson" <iwj@xenproject.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/2] hvmloader: do not include system headers for type
 declarations
Message-ID: <YDY+tvs9Llf5K8Da@Air-de-Roger>
References: <20210224102641.89455-1-roger.pau@citrix.com>
 <20210224102641.89455-3-roger.pau@citrix.com>
 <fb677f29-2b21-aaf1-1127-6774fb8e91e9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fb677f29-2b21-aaf1-1127-6774fb8e91e9@suse.com>
X-ClientProxiedBy: MR2P264CA0176.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::15)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b67d9c3b-202b-4061-10bc-08d8d8bbe915
X-MS-TrafficTypeDiagnostic: DM5PR03MB2633:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2633CD682C3930377AB7FC9B8F9F9@DM5PR03MB2633.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jAFbWfi7wi3edTuzQoq82SIG0fvf+yA4og5bpm/kF4Ct+ccXrjxjiimxeh6BHBJJY/w2I4P3lSYwJGE6A+Bf4TozjfzkF2jGvs/Q7C9ID1IuUYsCfgzGK9B712Gfh4s8+4pq/j3Bg3xqcUm1b4tyDDXszO7JV2ESRskDBAT6kj9735jjBknGnkOKg/2AgC1Za3cA7uT24pv90U9y2CSnIKHq46Q/TuyY5UzbP8InFifvo4EKzUFgaTL+8G+iO4relTyQGXElPoQwtJIGqhqTLtvx8k6JcbZnjMLzsO8TsfnXxk3rjlJJJO17kE+IBE8Hv/drzI6+83vdxk4jyVrCqc7sdqoI4zqPSjSU2FH/i9Z5AMthBYUEk7tRTTo7Rz0wgSnQLUW1YF16/osYOfuv3RATiS1VXILQ8hFJoIuKmqkar/QYPdQASXoHHi11ZpoeAQsAgAi9LDLQAOgUkX2lo4ypJnrB277Yk/xdd4TA6GBmn0dTeDBLr6pkgwNKuqcImgluTOot7oFYpS5I4BYHKdAWQvOqiip/riLNUs6DtQdWHRPDR9MfYLmTutqQ9QRA
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(346002)(39860400002)(376002)(136003)(396003)(366004)(53546011)(4326008)(5660300002)(6666004)(85182001)(6496006)(86362001)(316002)(8676002)(26005)(8936002)(33716001)(956004)(2906002)(66946007)(478600001)(9686003)(6486002)(54906003)(186003)(6916009)(66476007)(66556008)(16526019)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cWpKOSsrMGRjaDdVdVU5ZDhKSnUzZWY3UHdYdy9GZGNUSm14YXFYNVRDeGpV?=
 =?utf-8?B?bTNVUXAxSjNGMDBaY2tqRGlGVmpUUWJicCs4aEZoQkdJTklQNk1GU1k2dU14?=
 =?utf-8?B?Zy9sUW9scUJwSXpheVZpMGh2aDcveUUveURqOGtHVHNQSnp0TURBY3ZCVVJ2?=
 =?utf-8?B?czFWUkYzbzNSNHkvTFhQa21sN1lMcjVMOGgrNUNNS2RPd2wydTZ3MzcwdDQz?=
 =?utf-8?B?dnhvNTI3c2E4eVc0UTgzRlZZNWZsK3NER1RrblRBVmpWbkprTktRMDZEaGdW?=
 =?utf-8?B?L0tKa2NxNUF1Qlp0bk1xZ3FHc1UvTG1OaFA0b04xSGkzbXZWT3VZWlZ1ZGcw?=
 =?utf-8?B?Y2VWUUpOTHNKbTQyVCtqR2J4U2hPdmZnZlNqa1AwQ0RXVlhqc2xPM3VETU9h?=
 =?utf-8?B?aXVQTEJ0L3VzSFRpa1VTeGMybXJiZytmcUZFcjJoZWZkMHc1UEhhL3dNampK?=
 =?utf-8?B?cVZPdFM4cmJPUS9tbjB5TzRnTEhaUStlSlV6Q2dLRDVlQURzVitVMExvMXdS?=
 =?utf-8?B?SXllNWZuRnlBVlpMZDk5MS9sOC9OQUp1UFZvYU1BY1k4OTRDbUNsQjVxL0d2?=
 =?utf-8?B?Q1hhWkZTY2lwVGpnU1g5a1dndDdXUW1INUgrblI0RW5abEJPQi9PV1NlYUpr?=
 =?utf-8?B?RlNSNUdIVEJxQ1FSL2pKb3dmb3hrWTl5U2xsNmhBMVAwL2ZneGgrRUhVcHIy?=
 =?utf-8?B?aG5RWDZaN1ZwR0s4aitnZVFIbCtGYVdvMmh0dnY4Tk5aMWE5VkVqUU4xQnBr?=
 =?utf-8?B?U200Nm8xL3poT1pDUTJsa3pxbExmTnNqNjZhV2RodGdoMjdPRndJZ3hRUlZ0?=
 =?utf-8?B?L0ltcy9NQ1h1S2E2ZmNFYTBoSDRaU1lRU2RsMFhKanZzWEEwVW1nWEVMcnM4?=
 =?utf-8?B?ZXc4dkxqaGFsNFlBbzBKWFN1ZThmYVdycmZ4NFdTMDBNVTZNNnhmcnZFcmJR?=
 =?utf-8?B?MlA2Rm95QWJUSFpFSUlOdnRFN3ZoczVPVUFMa1MyVXBvcjhUWmNQZHVNN1Jk?=
 =?utf-8?B?YkJaRlltT3RIVFl1ZHY4UWtCeFNaM05zT2ZCcG9Jbjd0aGFNL1gyUCtTZ0Rm?=
 =?utf-8?B?WGdTblBpcitweGswS0N0eVlnY3lDdEIzZ1ZWWDFzN3lyT2oyVml6UzJTeUl0?=
 =?utf-8?B?TXpnUUpHZ2VaRG1xKzZRSUlWeStvZEVyNHhUSlYxNVA0bXc0alJSS092Q1Rq?=
 =?utf-8?B?aXVMRmxlRjU3VUpSTHczVk9CYnVKWHQzb3hOQk1yeU14a25hMVBVMWE2N3VX?=
 =?utf-8?B?SUtIbmI5K0dpS0ZOOGZORHVQaDB1RHpQdktoTTdpa2NCOTF3Y294b0R0Q2Fa?=
 =?utf-8?B?bmszcUI5RGJOUGFNWUlwSDdYYVZ2ZnhTNVJrRDlwOWZmcmNpYkZKYTk5RmRs?=
 =?utf-8?B?WmdLcHNzN0FRZURUM2NCc0pNR0pONG9qZ3p0YVlIa0U0emFJUWVOU3F6clRR?=
 =?utf-8?B?SlB2cDg2QnpHZFArN3JNMTJCYXVYTW02QTFNZWxyT2xTajJKM25TQWZSVDlh?=
 =?utf-8?B?UHV1M0NSaFNBK1hmZGJuTkFQYzArY3JrS3FhQ0RMQ1Vzcy9xb294WWNtMmVN?=
 =?utf-8?B?MERhT0J6Rm1pREczVU4zTTQvb3dlZ2l6Umt0SFhmREJKRElUTGR2b0U5aGtY?=
 =?utf-8?B?V2dNR3djNXIzQ1BWOHpxZS9vSlNEWEVjSXlWRUM5cit1TXFYZGtlK0ljMDYz?=
 =?utf-8?B?VzRwOVhJK1I0VHlqV0xUbE5PUkFKWkp5akE0dFJSWGV4dVhXWnlLek02QW9E?=
 =?utf-8?B?QWFlVTRENWZrQWdiYWMrc0wyVk5WT0h6QWNCZkZwcUhtTER6L1d0Z0t2d0Fu?=
 =?utf-8?B?UXZCbGo4Z0s4S0I5MnhYUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b67d9c3b-202b-4061-10bc-08d8d8bbe915
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 12:01:25.6479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RXribDZOYrjSlSJy292SmxpTwpmmL9DSq8nhuYEGCPccjshO1B8YYukFSVyjIs2gGYU+61yhxDcEJRGcCm4BrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2633
X-OriginatorOrg: citrix.com

On Wed, Feb 24, 2021 at 11:51:39AM +0100, Jan Beulich wrote:
> On 24.02.2021 11:26, Roger Pau Monne wrote:
> > --- /dev/null
> > +++ b/tools/firmware/hvmloader/types.h
> > @@ -0,0 +1,47 @@
> > +#ifndef _HVMLOADER_TYPES_H_
> > +#define _HVMLOADER_TYPES_H_
> > +
> > +typedef unsigned char uint8_t;
> > +typedef signed char int8_t;
> > +
> > +typedef unsigned short uint16_t;
> > +typedef signed short int16_t;
> > +
> > +typedef unsigned int uint32_t;
> > +typedef signed int int32_t;
> > +
> > +typedef unsigned long long uint64_t;
> > +typedef signed long long int64_t;
> 
> I wonder if we weren't better of not making assumptions on
> short / int / long long, and instead use
> __attribute__((__mode__(...))) or, if available, the compiler
> provided __{,U}INT*_TYPE__.

Oh, didn't know about all this fancy stuff.

Clang doens't seem to support the same mode attributes, for example
QImode is unknown, and that's just on one version of clang that I
happened to test on.

Using __{,U}INT*_TYPE__ does seem to be supported on the clang version
I've tested with, so that might be an option if it's supported
everywhere we care about. If we still need to keep the current typedef
chunk for fallback purposes then I see no real usefulness of using
__{,U}INT*_TYPE__.

> > +#define INT8_MIN        (-0x7f-1)
> > +#define INT16_MIN       (-0x7fff-1)
> > +#define INT32_MIN       (-0x7fffffff-1)
> > +#define INT64_MIN       (-0x7fffffffffffffffll-1)
> > +
> > +#define INT8_MAX        0x7f
> > +#define INT16_MAX       0x7fff
> > +#define INT32_MAX       0x7fffffff
> > +#define INT64_MAX       0x7fffffffffffffffll
> > +
> > +#define UINT8_MAX       0xff
> > +#define UINT16_MAX      0xffff
> > +#define UINT32_MAX      0xffffffffu
> > +#define UINT64_MAX      0xffffffffffffffffull
> 
> At least if going the above outlined route, I think we'd then
> also be better off not #define-ing any of these which we don't
> really use. Afaics it's really only UINTPTR_MAX which needs
> providing.

I've assumed that for consistency we would like to provide those
already. I can switch them to using __{U}INT*_{MAX,MIN}__ if we agree
that it's supported on all compilers we care about, but I would rather
not drop them. I think those might be useful in the future, and having
them already does no harm.

> > +typedef uint32_t size_t;
> 
> Like the hypervisor, we should prefer using __SIZE_TYPE__
> when available.
> 
> > +typedef uint32_t uintptr_t;
> 
> Again - use __UINTPTR_TYPE__ or, like Xen,
> __attribute__((__mode__(__pointer__))).

Let me run a gitlab test suite using the __{,U}INT*_TYPE__ stuff and
if that's fine everywhere we test then I think we can go for that if
you prefer over the current proposal?

I still think that coding them like I've done above should be fine as
we don't expect hvmloader to ever be built in a mode different than
i386?

Thanks, Roger.

