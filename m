Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BECD9401DC2
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 17:49:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180058.326564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNGr8-0008AO-1L; Mon, 06 Sep 2021 15:48:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180058.326564; Mon, 06 Sep 2021 15:48:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNGr7-00088a-Tv; Mon, 06 Sep 2021 15:48:21 +0000
Received: by outflank-mailman (input) for mailman id 180058;
 Mon, 06 Sep 2021 15:48:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4nFA=N4=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mNGr5-00088U-9s
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 15:48:19 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9d40a1fa-d63f-473a-9c81-61d5e52bc2fa;
 Mon, 06 Sep 2021 15:48:18 +0000 (UTC)
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
X-Inumbo-ID: 9d40a1fa-d63f-473a-9c81-61d5e52bc2fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1630943298;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ZW8rLL2Ju+LwKmfKg28mVm/orxZTxzhvsjw8xsAcAL8=;
  b=SW3HaML5diHR0KeK+K6mn3ZcUwit83U9Yad6VgeDWo0I1e/LIbY3TxKV
   TTUCzSwut/Xxz4+vfdZJ3a1DFEdNzbRsLYV6mg6eZZU01fDCxB7nmxIia
   e0Oyy9sw4paP8ZrJwR5G1xbCjjDP0q6wsWhaIPrsAGuR0NAEEhHS12w4q
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: szFn5Rx2CcSuwwNQSgdCA4V9pzjhPGxgwYXW4zhWAc8u8kbqhc0/avN1YHIM9EPT+q6qH/K2Xy
 amKg1jbA77nB6bRwsS7Bw0UL83AJcFIMGRTC177pmGimOmEEjayrapbqPDf6v6wOwp1l09fCUh
 V9PTFDsiaoXw+wivSubxBvA835Z1c+UE+mBe/G+H23rZyi1zgx89ifsPCsW+2G280kzzYElELp
 2Bi23k1lajzKsYwON8W0RXQZU1+968rUpNlqrfVdhMyoASlObHkkg3kLdvSSD7wkeku3/n3ax6
 Dt3q/SRhRog2nMUsqBjjNkQ+
X-SBRS: 5.1
X-MesageID: 51703951
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:j2H4TK5mw9yxhWnR3APXwD7XdLJyesId70hD6qkQc3FomwKj9/
 xG/c5rsyMc7Qx6ZJhOo7+90cW7L080sKQFg7X5Xo3SOzUO2lHYT72KhLGKq1Hd8m/Fh4tgPM
 9bGJSWY+eAaWSS4/ya3OG5eexQv+Vu8sqT9JnjJ6EGd3AaV0lihT0JejpyCidNNXB77QJSLu
 vg2iJAzQDQAUg/X4CAKVQuefPMnNHPnIKOW297O/Z2gDP+9g9B8dTBYmKl4is=
X-IronPort-AV: E=Sophos;i="5.85,272,1624334400"; 
   d="scan'208";a="51703951"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P4ahkLnBPGH/J6zIrsH2R47SfkgSH3cyayht7Is/8Wt6EdzxP5+9LRaQ6dStqADi2qSZMFYKSLF5vZ8L8ZUDJd6aoAehMDZsGLhNuL2oVum+5Xp7HWx9H38QWW3aQV/rTVe0dMimydRql1+F/tEEnsqSdmoCb7ep6s6SG9oSPDcHkxlH/krBhvbIrDIRp8p97hsp6xWlaf7/cnYSh7WjvN677xbebI3Lj0/bZYtWIgdENNyrJv0QmbYY23nnW18oRoBenfJP0689txVaky24DoZODKc08siJuPq/RRvNLTtCs/Ihux3xykeuok0JRwlozlq2MD4TyBjyMvRAxjrwXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=vLg9oQJLQc4EgCHbSr6T90rQDY6+Gti+7IBwBOjZGbY=;
 b=SJbpy3EgCZ8UXkgwW3Dhq/zC7VIU5ttzfDwL5Rk5sFJNx3jJcEEOYGAjBxH09hU8kYok5IO3D+glN3oHKtw2p31DIBPf3f17bFL+5QSRs81JwYyLtwfPUtONwUs93pOTKTsXo4ri3YivfpbdqdytfSzHzIaIoEgj/eYqHB/V+SLETTsqIhvOKwDFHf+o4UHyB3gSWb+CSWmpHY3ksGdXr9tarJyQqqz9jK5udCOPzyGWHmCzuAk93Wh6Cj1TykKZcl2ZRxe8z03HQ3tP5jnRZ+ONjZdEp5q391/XsLhD2QU7oi5+dohlZkfcvZnemXBjK6NoS8PiXt7esxY89O6j2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vLg9oQJLQc4EgCHbSr6T90rQDY6+Gti+7IBwBOjZGbY=;
 b=fvMhLCeYD61czJreXW+pOAnmpMyj33eXcw7h6FMjlsUGVy2EndwOXFspifROUJkFJp93LbRAsoEmwJ+XHbBXtmncIJrUmGzFYKpCAQaMhndBoUbP79kiAIsxYbP2ryunq2rdKYxUooaa9otDUl2lvLKu3Zk4GrG2SO90u4w5GpU=
Subject: Re: [PATCH v2 2/6] x86/P2M: relax permissions of PVH Dom0's MMIO
 entries
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>
References: <5972ce4c-bdb0-6d07-afad-cf4dd5615488@suse.com>
 <457637e2-d35c-18d0-ead8-0b513b257927@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <9b7936fc-f81a-d5e7-5ceb-6e10588503dc@citrix.com>
Date: Mon, 6 Sep 2021 16:48:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <457637e2-d35c-18d0-ead8-0b513b257927@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0096.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::36) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a2441a8-bb9e-441e-ec9f-08d9714dbc3d
X-MS-TrafficTypeDiagnostic: BY5PR03MB4966:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB4966E30AA9FFEF551B9047DEBAD29@BY5PR03MB4966.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QxgfqcIIXmpfgh+TmsFMbnCev7yqppudYl2WK9Bh+U62reyc+eGhs/HcyhP/XzeLx97mt4G/aUvuv0etePk+bzkBIpFSTYqhlX8ZzV58pAlYiY27h8JWBa0bFqyCghFRJ+/+VpoVPGCKyaVrmvigXj3FTMwBwQ9zyIhTNREBy5QdKK3pyBHMk9vZoCBMpM/eHNIKIhovKWB9Y++usOHoXO9SySXfzpkz2ef7c4TO/YmbTLatzmXIHOKslh9997Rt4e/y/cyTDPuINv0x/0wOieDWZAM3eW6rrw1WHOPf6eB51gsTcuqleUl8dDNEFUr34dl/D0w8ypcU2lXw2R4xyyvXvXV8Yf1OEpvP1rKlOeDz9V8pb3T8D/EWw7qPHso0ueeOXCzup00K9zAg5rB8zBOnY6gxpbQahZ6bdIzgLy+Uq01mYQyIwBCxs5jSgLMyb2bM7nIvIldJahb5V3Fa3gYveJOkTT/s3mOIpdj63/1mqimMaC16ioC0yT8bvKgQ7Juw7Qu0lyDlERzemf/zbg4Hf+NewcjpMMCFdulLs83jw6evChvXYplF5RJPd3sVdywgOnwGvVp1R7oHcRC/iopySp0CCm7Du3SK8HWCUl4aW2SgOTlTWW43OhoLcQvEaj2Osr2Et5SF2zVUBx1wfPlnVnM+6zZT8Q7b9ZRAC8g1mYL00ZZ9ig4bPPWfxDhP9dcQ7rzox9KDbMJKgnmR676OIBNLgOBhqdMYRy/zNkI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(86362001)(2906002)(53546011)(2616005)(8936002)(186003)(8676002)(55236004)(6486002)(31696002)(66556008)(36756003)(54906003)(6666004)(26005)(16576012)(4326008)(316002)(66476007)(66946007)(508600001)(83380400001)(956004)(31686004)(38100700002)(107886003)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzF2UDdLTVA4alZweVBaQ25Xcnk1bnd0NUNnTWNWT3BrKzVpWHZhSGkvL3B6?=
 =?utf-8?B?TkJZYnBBdmpocHNxZnJYSUZ6ZVRpNElwc2lMbEZKbFlMU0ZXNnRLckVjM2Nq?=
 =?utf-8?B?blJ5eFNUQmFHU0tyeDV4Yk15ZlRwS2J5UTh4c3N1VFE1aE5QNTRvVnJoT2Fk?=
 =?utf-8?B?THZSZ1hIaUQvYTl4UVY4VXpMdDEzWStpNFFybElOMzBGQm1FVzZ4VWRvRlFK?=
 =?utf-8?B?bnYzMDRUemFBcWszNjQwYTFaTzZURWM5dWo5eW4rNG8xUlE3V0EzajFYVm5X?=
 =?utf-8?B?N05WeFgyQkJ6eld3RnlveGlrTnlvbkhpYW5JZUtvdndhbnlaYTBXMVIxNzRK?=
 =?utf-8?B?UFJjVFdtTElDYnduYi83cGh1MGg5ZjFFdkNpRjdBTmxtY25kN2FOVDc5WFFV?=
 =?utf-8?B?MC9zV2hhWUxmWVQraWlkVENuYTBPU3hVczRKeGwxMXVvWm43bDZtaTBhcHZv?=
 =?utf-8?B?MkYrUVR2UGpUYVhEbUxnVXhXZVlQMTBIUDVMc0tzQWFwN1ZPd0FUR01DM0o1?=
 =?utf-8?B?Rm5nSU5lWFpzRzRqaXFmeHN4WFE1cUlLRWFSVHFManYrWk5HY3AyK1krTkVY?=
 =?utf-8?B?b2ZndjhiV1BuT21mYzJMQThINzlJRkIzK0NWSkNsZ3ZGditRUFRneDJvVUpm?=
 =?utf-8?B?TmFsME9wNUl0Y1grRXI0K2VjdE42c250RnRvekRwQUFlaEYvQXhOVFZaWmZW?=
 =?utf-8?B?S3R0clNLaVlIekk4VlJkbkRQS1FObGoyV21RSTZuNWVjWGhRWXliOG1QVnhm?=
 =?utf-8?B?UTJIdUduMjJrbEg5SGp2NDM4eklCczZXbUlscEsreks3aURYQXZFcEd1Rmxk?=
 =?utf-8?B?QVpiM1RZWXYzeGFDaU5JMWNDa2E2Vlcrb2RGTDUvUEJBTi9wZm1CSjhaZWFx?=
 =?utf-8?B?UVBycGQ0eWVJdXJJU1g1aEZmZHFhUWtJUkpPQVFTcGlORHR1UU14dk5RKzE0?=
 =?utf-8?B?QXZSa2F3TDJvYStXZmZHVkV0c25xMTFKUDcxdTd2dUt4MU1jemw0YmRoOUh2?=
 =?utf-8?B?by9VNnA4dGo2amY0ZlhhaTVoeGVSditkMlprQVlOT0c4MHpXSEFSREpkOENX?=
 =?utf-8?B?RzBRUkI2b0Y5VXJmcTFZN3BNQTVKU1JQemlBbC9yN1BaaDBPZlRZOHdydmxT?=
 =?utf-8?B?SzB2TWpCNUJYOXlScW9xcVdZaWg4TmlYV3ZkWGhzMHRQTnArOGJobjdnYk9E?=
 =?utf-8?B?aUowdGRXWmhWeEVLZzNKUmNZdEVyZGpOd0pYaDcxcHFqeXBqcHU5MDRFTjdG?=
 =?utf-8?B?TEdrUzhFb1ErWmRKZDBLR1V4c1hYK09rWHMzU2JrQUFhWXc1SVA0eFNvMUgy?=
 =?utf-8?B?WHl3RUdhM2dTdG9XNng3V2xkMHFsbU5mOGxDOW5qRmx6OVc2MmtNUW5TUjdW?=
 =?utf-8?B?dnIrUDVlMDdYdmVuY3orWkR5ajJmeWVGdTZLYThPaGdidXFSYUc0RDdQYVRk?=
 =?utf-8?B?REQ1S2YvOWltK0owai9rZ2x6THBxd1paZE9UcE9kMGZDK1doMU9RQWVVUld5?=
 =?utf-8?B?ZFNqUnVJZ3ROc25EdFdTL2RJaWRzaXFsdlRUcmVRTWF1VnlCcGxCamFuUFdz?=
 =?utf-8?B?VnhUcUFhVmJ6RTcvWmJlbXQxSEFDQXpIQTRwRnNreldXWExlTUpQTWJ3aytU?=
 =?utf-8?B?SWpLbGNyU3ZDbGgwcjFzZ0VpS3A2anNsem5KU2hwdlFhQS9WZlc0a09GVlpa?=
 =?utf-8?B?Y1poa3MwWGtPdkpHVzBFM1IrSTRVTllHMG5XeWNQWWlFbDMyeXFxOXVtSVNL?=
 =?utf-8?Q?foK6awgck0okiIU/bfleyTi8+RCuzX6oTWozsK5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a2441a8-bb9e-441e-ec9f-08d9714dbc3d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 15:48:14.0077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9EPCwDyiPSVK93v8mLg/Wpa/UwxGc1Yl9Llx0Ew/7Ud+raiHrd/SLQHLITTKETJ7IDYWlIlVoO3wOLFc/1qDmFkdpqfTztMekTjxuRlip6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4966
X-OriginatorOrg: citrix.com

On 02/09/2021 09:33, Jan Beulich wrote:
> To become independent of the sequence of mapping operations, permit
> "access" to accumulate for Dom0, noting that there's not going to be an
> introspection agent for it which this might interfere with. While e.g.
> ideally only ROM regions would get mapped with X set, getting there is
> quite a bit of work.

?

That's literally the opposite of what needs to happen to fix this bug. 
Introspection is the only interface which should be restricting X
permissions.

>  Plus the use of p2m_access_* here is abusive in the
> first place.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Split off from original patch.
>
> --- a/xen/arch/x86/mm/p2m.c
> +++ b/xen/arch/x86/mm/p2m.c
> @@ -1319,6 +1319,18 @@ static int set_typed_p2m_entry(struct do
>              return -EPERM;
>          }
>  
> +        /*
> +         * Gross bodge, to go away again rather sooner than later:
> +         *
> +         * For MMIO allow access permissions to accumulate, but only for Dom0.
> +         * Since set_identity_p2m_entry() and set_mmio_p2m_entry() differ in
> +         * the way they specify "access", this will allow the ultimate result
> +         * be independent of the sequence of operations.

"result to be"

~Andrew

> +         */
> +        if ( is_hardware_domain(d) && gfn_p2mt == p2m_mmio_direct &&
> +             access <= p2m_access_rwx && a <= p2m_access_rwx )
> +            access |= a;
> +
>          if ( access == a )
>          {
>              gfn_unlock(p2m, gfn, order);
>
>


