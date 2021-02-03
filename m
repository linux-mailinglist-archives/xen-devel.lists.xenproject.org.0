Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D5F30E27E
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 19:28:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81031.148963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7Msc-0006WD-Kq; Wed, 03 Feb 2021 18:27:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81031.148963; Wed, 03 Feb 2021 18:27:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7Msc-0006Vo-H3; Wed, 03 Feb 2021 18:27:54 +0000
Received: by outflank-mailman (input) for mailman id 81031;
 Wed, 03 Feb 2021 18:27:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L1oB=HF=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l7Msa-0006Vj-3j
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 18:27:52 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a7ba0b80-9523-4518-8721-f81bc8f12f6c;
 Wed, 03 Feb 2021 18:27:50 +0000 (UTC)
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
X-Inumbo-ID: a7ba0b80-9523-4518-8721-f81bc8f12f6c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612376870;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Smtte2Bv11lAulYHj5mml6sMiAjm0cgQD5a5sQTZc08=;
  b=M0puG4cEV/yeMEWT45rZ8Ge42isaguaBzKfus7DNt+t2KcJk+0Wvr45s
   A4XOIEvlSa641TZHjywQL1atTQ1tgnU6yskjod2U9HZPmPmrNG4uPlrAQ
   0ph98Ju2/AcTmpsz4PIDV/XRe8b28dWw209e+P+KRl8h2xHsIDrkh9Ona
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 1CnpsB47DER3/O/js1NieQnMx0ISOHvm49TdGH4pWLIblRVqU4UQh8SH4Fnbjd0gMS+R1phFFD
 3LJyxetsHLm0bDc6jO/rQ79CJhMGd76lbBVO0TqoVxoJCKsUhf9Kk5iG9lWhYKTuk8CXNjMgq+
 86MeBeXGUNyW7fqbAwQ+b6nz75mUuvsMY9D0xe+13Uar9l381HOMjmzvI+b/FCfa6w3gZ1VYAZ
 MXEof5tYy17z08gLhgF37QRwz8EM/mmmc+KVsJ+UYW7/MLgQOt4dTmSZ5f0m90gGIotC5ht4wd
 y34=
X-SBRS: 5.2
X-MesageID: 36488278
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,399,1602561600"; 
   d="scan'208";a="36488278"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f4jlGYzPHH/Y/dEl0bdsYVFHxwMe42EYxS1rwuiqr2anVo0cFU2NqYMEKMImaEF/M8yfrjn0sUOY8G1rtnpezEu22ZH/kAYilH6YK7bbL/VMHjqOebrXRBcd6/nZaaC9WYnjGdqJwub5igmgZvsnur3oSQJSZl8efh/2EwhbOc18G5pnbafIjDCKPVrd8bdbBrYyMlWnoebkCAGMG4oZFC3AWWoWk/t/Kj0ETTrZe6WQKmBjjYeNVmlyxp0nLOK6FdX39mgwRpr7wprT56HO6F6L9IL2h5dRYQs+j99dO/AkWmzG5/d1aWSy5JSjKjqV/anSNb+XehVvgPznpKOQhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p4dcvWQS3pySTSt+XdeIGhGDdTXQFonS/J+U2VJyU6M=;
 b=Yx7rlanD6bS0RPwcS3hJ9TYm6ppNY3BKoJewTBBT1n3U49FH50MJ+CcXQ+Ml6L1qdR4LRVf5V9ntDn6eBafMKkh4AdApP1B1oOuFagBYn3Mjg8PyBAOvnOAX0wrgvVwfwTQYrRAQcy120sNcWthLV4zkWMKOwCrD+50BFKFldRssfQMr/OkbLg2YeKVE3a8nKYJ5HP4P3zBE5YG1Fi8hHatsXZb+jMiyFaRKUY2PN1is9KbumxnY7liU0B2CfqdHUnWfN8QF6KFGmuTqEwXguVWrC8Q03VcGnvS1zxq9R1WKgzm2joIboA4NPW20opCy72rn/d6fZoz0a0JK8J/bLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p4dcvWQS3pySTSt+XdeIGhGDdTXQFonS/J+U2VJyU6M=;
 b=D/ufqujM9cOY2tZsj3gd9qgjQ8sH1QMwtJdXwheLhH1Fv6ZRH0zetHjmh2q5wLfptAGswG/k0yOq64G4BV+EZMeTZmd2uzyMsDIrhrtIIf+m5dknOFuob5iea+bQSnyBeEQ305cGWmDB8IOM44SRLbneFxguB8H34sxjWcIBiII=
Date: Wed, 3 Feb 2021 19:27:30 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ian Jackson <iwj@xenproject.org>
CC: Manuel Bouyer <bouyer@netbsd.org>, <xen-devel@lists.xenproject.org>,
	"Elena Ufimtseva" <elena.ufimtseva@oracle.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3] NetBSD: use system-provided headers
Message-ID: <YBrrEulPi+27bV2u@Air-de-Roger>
References: <20210203165421.1550-1-bouyer@netbsd.org>
 <20210203165421.1550-4-bouyer@netbsd.org>
 <24602.56532.169889.71270@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <24602.56532.169889.71270@mariner.uk.xensource.com>
X-ClientProxiedBy: MRXP264CA0017.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::29) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ab2f880-11e3-4b04-65e9-08d8c87160be
X-MS-TrafficTypeDiagnostic: SA2PR03MB5692:
X-Microsoft-Antispam-PRVS: <SA2PR03MB569263D2198F072EB9D664F88FB49@SA2PR03MB5692.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oC0xksk/ttUDVPfSxT2+1biRD3XffoyDon9Vg5VXqY1pecU3bb3EAlz5rFUBFy/8tmidvFfqQADbYQzYk/LUpGzXgmOvCVtHXWOn2t9OToTDPih6gf5lYG2QJwVj2UmJi3NXfgWTaVWNSVZsrI+gD6GJ/uVYw/Jv8fMvlNR9tVTbCTW810Qp4hj0+xwufoUqgB1EyLpkCxVL9hL/WBAbEiB2MzVPBF7WF4go6qXSqDDaot/L0b/Y7MeVGpysd3QsDevpPW6Q0r2fPM89PVSLLYSgWI+qPbnpZxS1T+qLgAcRMmXwHbRUXT+CsgzlwG+MP7yngUhUdIxpFZQ5AJ3b7fGnPQNkDtvEMwcBxL8zXPPXaV6roQ48W1hDUxOX2w8Hcdqiv+C7h0aDuKlTSr7Z3270AwP/DacM3FbKqLhVPhxxwJKjAI5HN0DmFnLZ8r9EiuufQU6Q9A74zb66k7TgyfI8diy7Uzso0vqYFIikKoXl4YC0LrcN1zF+EDxW1o1FuInNVm2RQz/85U78NmOW4UnGsGcnXBQ7G3w7VNcr88bSbP+mh9HewsybgglAGQuj
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(39860400002)(346002)(376002)(366004)(396003)(16526019)(956004)(26005)(9686003)(86362001)(6916009)(186003)(33716001)(6496006)(6486002)(66476007)(66556008)(5660300002)(478600001)(4744005)(85182001)(4326008)(8936002)(8676002)(316002)(54906003)(6666004)(66946007)(2906002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RjVmcnl4NnhsdWdlYXlzQzAxenYrQTZBZUFiT1R1SjM1ZkRmNjI1OFRUNWt1?=
 =?utf-8?B?Ky8wd1ZpWEg4TndObmlnL2FKKzhxQUhnTUNZREo2a2ZvQ24yaGYvUk5haVp0?=
 =?utf-8?B?UHRpcU9wVytNL1ByTU5vTUg4Zm8wL3RWWEl6ck50ZGoxbFRxWFBtcnVnQjZl?=
 =?utf-8?B?ZnV2d0lzSUdCbHhkRXZWY0k3a3NhM3VCNmhwVVdlTFVuQzVGRVRhT0hKTHNm?=
 =?utf-8?B?QjgzV0ppQURBVFo4bnhWOGwyS3I5UWdkdTBUTXpoVnVSQ1ZCTjZUa0Facmg1?=
 =?utf-8?B?MlFWNUQzdEZCSkpKaHlScHdqcEFhTDFIdlUzalppM3NPT0VXazBGVXRUMTU3?=
 =?utf-8?B?a3owYWd5OC9iWXpnQlpiZVk0cHRyV2ZLSCs3aWxsc0M5UVRBdFJWNlFaQTE0?=
 =?utf-8?B?SnlGaHk4dW1seDYvdEY5aDFTclVyQ3pmNnh6Y2FVUjd4RGhNempEZXQzWnNj?=
 =?utf-8?B?d1dOLzZRR0oxYUhtbXRRVFAydnRQWVJSbGE5WFAwSDlHSTJOOGR3NHZNaDAy?=
 =?utf-8?B?TkM0VEl2WUhTVjdvcEc5U1cxMi9OWmE4L2F2cWxGQlVkbzdYeUkxY29TUTBx?=
 =?utf-8?B?aHZlZ1pCdzk5dFpLTzQ3d3RGbDFqTTI1SlhFcTNVK1JncXZuKy9ISC9IWTQ3?=
 =?utf-8?B?Ni93QWx1MlBtUEVEOUQxQVBwbkoxSCs5M0hWTnJXL2xPd3ZrL0Q3MDFFQk1r?=
 =?utf-8?B?cWZWQml6UkIwMEJ2NEZ0TFB0YTFaWktNUnRLcXU5aTBnMTY0UUFJTVplNFFW?=
 =?utf-8?B?WFFPdXdTczVVK0hFYlMyVkJpMmF1Q0ZHSXh4WUR4dUkwdVJsaGdBdGtYV3hF?=
 =?utf-8?B?a2dES29rRUJ4dHpmSVZPVE9KeEhQcG5NSVhnanlxbVZQWkF3QWtxYi9rUkV1?=
 =?utf-8?B?YXZHcXdOWmlQbmhmeUZZYlNVc0xMdExsMlZUeW0rbkVMMFpoMzNaQlM4VjVW?=
 =?utf-8?B?T2x6ZXBvYXh3cUlWWGFMS0wwZlR5OWFOVDFQUUw2NnkxcGVCdXp6SThtYkNR?=
 =?utf-8?B?VFl0Y1gyWmF2VDZJNGhIQjBsdDEyTHk0cnlDN2F3b2Q4ektZN0RyamV2L0xS?=
 =?utf-8?B?WVMxSUdCQ1p0YlZTWEhmMFlyZEtselpQelVYNjFtRXhCOHJRbnF6bnptV1ht?=
 =?utf-8?B?bHZ4TFUrLzcwY1BhdFY4UUtQZTZISFBxSXBTRGlGK2NBMjdPU0NNQ0EyeENF?=
 =?utf-8?B?UHhWaFFsbFptNTdxRnlmT2UzdXEzOXFSRkJLRlhvaTZpZHJ4cUozVlhyaytU?=
 =?utf-8?B?YVNzZG5qejg3TGNLR1dsZ1NJRlJoTGVDTWllYmNRcEVmRVJqVitvV1pDMGpN?=
 =?utf-8?B?R2xCazQ2WEtTUVhSdll4WlJFVFpnVzM1d0JDNkNhUDBqYXIrV0Q1TVJ6RWN6?=
 =?utf-8?B?dUQ1MU5ET3VOUFZGQ3dDVURySFNuUjNrL2tOMDJ0U21BRWU1cFo5Uk9kQ2hi?=
 =?utf-8?B?dElCNkVQaFl0TmNScmdlVkVvQ1hSQlRQZCttQ2x3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ab2f880-11e3-4b04-65e9-08d8c87160be
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2021 18:27:35.4040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lOu+6ckca0EBvOr/upZomrgw//QM0L+z6CtPC8JQVW7W7+pTLo9QkUQMkOZSze73ldAiixy+0R/ysx/0lroWbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5692
X-OriginatorOrg: citrix.com

On Wed, Feb 03, 2021 at 05:26:44PM +0000, Ian Jackson wrote:
> Manuel Bouyer writes ("[PATCH v3] NetBSD: use system-provided headers"):
> > +#ifdef __NetBSD__
> > +#include <xen/xenio.h>
> > +#else
> >  #include <xen/sys/privcmd.h>
> > +#endif
> >  #include <xen/foreign/x86_32.h>
> >  #include <xen/foreign/x86_64.h>
> Maneul, thanks.  I think this is a bugfix and ought in principle to go
> in but I think we probably want to do this with configure rather than
> ad-hoc ifdefs.
> 
> Roger, what do you think ?  Were you going to add a configure test for
> the #ifdef that we put in earlier ?

Yes, sorry, I owe you that patch. Will try to do tomorrow so that we
can have a model for other headers. AFAICT I will have to build
something around AC_CHECK_HEADER so that we can get a define that
contains a path that can be used with an #include directive.

Thanks, Roger.

