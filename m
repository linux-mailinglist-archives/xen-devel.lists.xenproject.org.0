Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D2130749A
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 12:22:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76924.139042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l55Mw-0001z1-Iy; Thu, 28 Jan 2021 11:21:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76924.139042; Thu, 28 Jan 2021 11:21:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l55Mw-0001yc-Fq; Thu, 28 Jan 2021 11:21:46 +0000
Received: by outflank-mailman (input) for mailman id 76924;
 Thu, 28 Jan 2021 11:21:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=umji=G7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l55Mu-0001yX-Gs
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 11:21:44 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b836b131-adc3-4ea1-aa27-5f610c8720e0;
 Thu, 28 Jan 2021 11:21:42 +0000 (UTC)
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
X-Inumbo-ID: b836b131-adc3-4ea1-aa27-5f610c8720e0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611832902;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=J28UvI4dBDizWgn/se6japuwBrNk9Kqxd7E+wp4L8hY=;
  b=O7TEbpWsWtuXAk01b4oDzmbT20wpCGzphh1Ie+VMzD4LyMqVeItmkDFK
   o4tlGWp3o/XhrscS6KFc6LaFw5Xn88KV+9PCCRT26lj9BbfH7axe8I2l0
   Bgh9bm6iKKbytf9IOpoNROSFWoLwjO1hORmSBq4Gab8U1GLNHHErSZAWW
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 15OThC7UWzXK2Uh0C1QfinBBEtxrOlWoydcMbff43Mq3UHGAuwurizEPudP3AX22py1ll5RdXp
 KzwTB0IV4RsZAFhScavO2Kc51GrHjkQzwOu+bS/mBr2EdGIvDkve6JZzFpDvOnobPDbZMoJQx8
 C+pGJaIfh2JU1qTgCtpm0/hUbXil+hTSFitsgiEFGlK68N9BYeBSbKwFk8UNVWJ2VScdsHIUJm
 365u4ZtDO6lRijBzgcR43caXpGTvitufW1R6sUAZKeCc+rQ2OR3oRGxDS/1vHkjpQVYMchHBVI
 CwI=
X-SBRS: 5.2
X-MesageID: 37366908
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,382,1602561600"; 
   d="scan'208";a="37366908"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XkVuE/3jDLO79XyDwGwjo9qEtLf+dbtdUmPtWWxSP2VyeZZHmWCYQcIVr6UdvmttrMDVmZ6jrCZBONWfWqtqwBYyw0Bocs97Mm7qBZoIYtpAolv5QoaltbKsHvHDm1TQpqb9rc3nwX3QSwcBHd4rjD4pXGXPHj1v/E1kVFbf19469vLONzR/W+9lYQgKCHraTPWsSLK8AJyKNSfuFFFZuse6Xb2Eqx/ejCBB+g+1ymiPkyTsbLt37EXpuKU/JC6r2JlrJK5qeKgy7beD4k5HR2tXr02iviDPvkH96Q3Ma7kbKUsdZXjZUBgK3NOgpVR/MS1FJaBDqLecDETMDwapiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4qZ7XlxTTfBAAKWoFY7Z0AqoG2s4SSfuLf0qdSXLJzM=;
 b=JFGAKAnUE20Kry17c5CUNHr/L0cNDkYGVgIsk3Mq4ETiAPeJgHaXUWhFXbKVME4Ax08ghtLYKilxZK9U3Vi7tEZTzXdkRNugjx3LUjOddTMHrwrCGHeMNSsjmpgEDWAiVn0hBoIRMcv+QVvF/Jeexiwr3JfMKdeI1i9Jl8QBRCyYz62kimgf49IG5QHxYiuJftPBsMW5jqhF/E6thzPMP1AC+kUKZpyvm6YWz1y2CfZslxqZuo1wx+Wj4H+f62fG2qON5l7Fj/AKQdHlTk3gc9y4YcEnAlhY7SGfSO8HIWkuo8tjgyqmqQIcQAYCy1Z3+viHbDw0LVNmpcfEYvIybA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4qZ7XlxTTfBAAKWoFY7Z0AqoG2s4SSfuLf0qdSXLJzM=;
 b=nQWpVNLzi4JONPLNwCM0ViZMue+J12JUVihV6xyTYYLW4rEj3uwd4AUpiYkcJUAwjtcswzqEEWGM98tyHCimsXoe79i1GZmPi7USdPuIbJi5yLlLKOOPPTyLP4Gc2lb/KLiBO+OXxPhfQkNCWSTrGpd3x01c3PEbx5VmlGQDHsI=
Date: Thu, 28 Jan 2021 12:21:33 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@netbsd.org>
CC: <xen-devel@lists.xenproject.org>, Elena Ufimtseva
	<elena.ufimtseva@oracle.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v2] NetBSD: use system-provided headers
Message-ID: <YBKePdnq7SA90GJI@Air-de-Roger>
References: <20210126224800.1246-1-bouyer@netbsd.org>
 <20210126224800.1246-4-bouyer@netbsd.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210126224800.1246-4-bouyer@netbsd.org>
X-ClientProxiedBy: MR2P264CA0036.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::24)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 816ad66f-fe4f-4bac-60f7-08d8c37ee0fb
X-MS-TrafficTypeDiagnostic: DM5PR03MB2555:
X-Microsoft-Antispam-PRVS: <DM5PR03MB255529F63A4D805F8BFA3A208FBA9@DM5PR03MB2555.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HFBvpW/cswhuF/8fn/+QYaTc1dro08tqlj95LpXxaq1ismipQ8kviZ771kyahPDEN+IpGxL9RThU6urRpf+yqitnIQq8/35zizhMEsOze5uGE9O+Vv6MCgd1uYQubkRSK43Zc9mx1gcRxUjfl7EYzrrkPjGLoKPNJqPNtOebNIPbCYGzXpkutbgTfNa10cY7QbdX+j4rpSg9jwO6spXk3YWGn1t8VfGiaR88k7m0R2JLa7XB4pJaUGl26TUJsip3GNE7tT5M7Bkb63Je0G5H2WZpZn4jx+FSJMrOG8MyZ17gigN5qFc09UFxeDEHEXfo+Tv8dB7TMNUC72/1QUCxKmO+bLQaxFre5ifF5CxsLkxeeu5Zd/095uVhFhzKlkDyIGnms/2JrQ0fks5Coe+KHq+/zP4hXC5qNUI1eC3dqP7RszUBiMp9RYOYiIYM7JvD7ttsr0vaZYqfN3ptsI+gmFV55SCm0+mZeDtbHyIi7WMBBBMUKVverW8+cDFdQ7AC3HES9dAcGpEcoSDFbYdNWg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39860400002)(366004)(346002)(136003)(376002)(396003)(6916009)(2906002)(54906003)(478600001)(4326008)(8936002)(66946007)(86362001)(26005)(9686003)(956004)(6496006)(316002)(33716001)(5660300002)(85182001)(6666004)(83380400001)(66476007)(66556008)(186003)(16526019)(6486002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Vk9XTFQrOEJBdzAyL2xMUitRZFlvcjJHbU5SbFdxb2JsWUN4dVpoemNDK21P?=
 =?utf-8?B?VzFIbk4zVjFaclpIVUNldUFaNlJwNCtzZUVBeVdWSlA4UC9IeDI4WXVVS3FL?=
 =?utf-8?B?bXQ1RGowTCtDdzRxaUJlUlRrVFBmN0NNdkg0UjVCc3ZNZlhGUFdNbUFnRVFz?=
 =?utf-8?B?SnFVZ1JtbHpnV25oQlpMenIxZ2MrUUUwNWpCSCtTengwZzZMSlREYzhUZUZ0?=
 =?utf-8?B?NTVuZlV2Sm5VbW5RaWZXOWpKdWpPVkxjd0pxOVZQUHF6aEQvVFN2V0pmb1Vq?=
 =?utf-8?B?QnVTL21uV2R5b3FDWkxzeEdyTHJVNDZSZUdlbHdIZGg1UzZ3M1VXNVRkRjJi?=
 =?utf-8?B?SXZVSGFxOU5nNllBTUR3K1NhbU53MmlOeWJPK1hHcGhYZmpWck5JcThrNGFQ?=
 =?utf-8?B?b1RpWkkwekw5MHJja3JnK1lBQzV4UGxGWFA4WktkNzFuZGxwSXEzWXpNdTNl?=
 =?utf-8?B?SUlwOXZoZ3E5dHQrZE9XZmMxTkFtY1Y3N3BEcklRemZRWlF4Z3Bsb2M0MDdG?=
 =?utf-8?B?bjY4OFNpS0tGbVFQdjRqUEhJeFdRYmIyVXVoblIwcmFWUzBwRW1yenF6Wkx1?=
 =?utf-8?B?cGEwZlc5T2VqWGpRaWkvSnNaZXJMejNtMWcxNG4rTzgwNTU3QnZDb2k0QUdZ?=
 =?utf-8?B?bDViSU1NNCs2VjdBWVcvYlI5ZkFFelhsVTdGM1p5ZHZsT2Jlais3YTA2bHZ3?=
 =?utf-8?B?aFA0MHFkNUZxWnVHQUFZMW5IWEhYWThUUm0wemJuTXAzQ3E1SXl3UVBTejJ4?=
 =?utf-8?B?TU9CdzhxV20yaW5WQlZwaGxyZWJHSHEwMVRaWThIRXF0ZDladnAydlJRTWxZ?=
 =?utf-8?B?aVFqZHY2Qm1LVm1nbnZmUVM0c2VCem0rbGFwNSt0WUlkTU1rVmJCakpBV0Q1?=
 =?utf-8?B?Uk1hKzB2L2twa0JyanU1SGx4eXQ4S3VVYlprTG92azFpcm5td243akFWd0Qv?=
 =?utf-8?B?S2VMTUczbHpRMzcyb2ZWdHg3OURwczg1dVlkU2M0djhVTU9td2U1LzNuNDM4?=
 =?utf-8?B?NENYMEd1Z0JSNTVGMzdJNmZ0amg0UWY3RnUva2orQnRjOXZxcThjemVMRS9T?=
 =?utf-8?B?UTNGYXJ0bEdWb1AzSlFEb0xla0kyM25La2ZzaXlyeVZ4eDJ0aEZhOXoxdE1K?=
 =?utf-8?B?MGxnUjBNSkpBK2k1SVA4Q283K001d1FPZTFrRUFvdlhWNmdKRG1Najdaa2F2?=
 =?utf-8?B?eUorS0hMenRpMkVnaHVlYjNtL1ROUm9YVklIeG5IUk53eUN5L2x3c2tQcloy?=
 =?utf-8?B?d3BwMDQrQzRjRFc0QVp2d1VoQXpkQ25aY1VLa3hFcWVBOTYrbHc5NGlTcU5m?=
 =?utf-8?B?R2p1YVI4YVNZemFaTjhaamR4WmlLV255aEVyOXBSejBZZUVzUmVZZEQzczhV?=
 =?utf-8?B?eHRHeDJoYk9od2NEbmV2eWd6aGJxTVgyR2Q1UWIrdU5wdVFlOHl0cVJVWDJr?=
 =?utf-8?B?S01VU1o5eE0vTTZpQVFmUkpkeFhGM1I4ajQweWVnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 816ad66f-fe4f-4bac-60f7-08d8c37ee0fb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 11:21:38.3091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i9krXooHoR4gI/rsnbN/SWhBLXCDqMMdPrPzdQ1dsBspTRq9OjY28hNCMn678gSm13sPAZr0J2jfOU81DK6BHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2555
X-OriginatorOrg: citrix.com

On Tue, Jan 26, 2021 at 11:47:50PM +0100, Manuel Bouyer wrote:
> On NetBSD use the system-provided headers for ioctl and related definitions,
> they are up to date and have more chances to match the kernel's idea of
> the ioctls and structures.
> Remove now-unused NetBSD/evtchn.h and NetBSD/privcmd.h.
> Don't fail install if xen/sys/*.h are not present.
> 
> Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
> ---
>  tools/debugger/gdbsx/xg/xg_main.c      |   4 +
>  tools/include/Makefile                 |   2 +
>  tools/include/xen-sys/NetBSD/evtchn.h  |  86 --------------------
>  tools/include/xen-sys/NetBSD/privcmd.h | 106 -------------------------
>  tools/libs/call/private.h              |   4 +
>  tools/libs/ctrl/xc_private.h           |   4 +
>  tools/libs/foreignmemory/private.h     |   6 ++
>  7 files changed, 20 insertions(+), 192 deletions(-)
>  delete mode 100644 tools/include/xen-sys/NetBSD/evtchn.h
>  delete mode 100644 tools/include/xen-sys/NetBSD/privcmd.h
> 
> diff --git a/tools/debugger/gdbsx/xg/xg_main.c b/tools/debugger/gdbsx/xg/xg_main.c
> index 4576c762af..903d60baed 100644
> --- a/tools/debugger/gdbsx/xg/xg_main.c
> +++ b/tools/debugger/gdbsx/xg/xg_main.c
> @@ -49,7 +49,11 @@
>  #include "xg_public.h"
>  #include <xen/version.h>
>  #include <xen/domctl.h>
> +#ifdef __NetBSD__
> +#include <xen/xenio.h>
> +#else
>  #include <xen/sys/privcmd.h>
> +#endif
>  #include <xen/foreign/x86_32.h>
>  #include <xen/foreign/x86_64.h>
>  
> diff --git a/tools/include/Makefile b/tools/include/Makefile
> index 4d4ec5f974..04902397b7 100644
> --- a/tools/include/Makefile
> +++ b/tools/include/Makefile
> @@ -68,7 +68,9 @@ install: all
>  	$(INSTALL_DATA) xen/foreign/*.h $(DESTDIR)$(includedir)/xen/foreign
>  	$(INSTALL_DATA) xen/hvm/*.h $(DESTDIR)$(includedir)/xen/hvm
>  	$(INSTALL_DATA) xen/io/*.h $(DESTDIR)$(includedir)/xen/io
> +ifeq ($(wildcard xen/sys/.),)

Maybe I'm confused, but doesn't this need to be ifneq? So that if
wildcard returns any output the command is executed?

I would also use $(wildcard xen/sys/*.h) because that matches exactly
the pattern used below.

Thanks, Roger.

