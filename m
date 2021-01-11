Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7070B2F1C36
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 18:23:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65095.115208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz0u5-0000kS-4i; Mon, 11 Jan 2021 17:22:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65095.115208; Mon, 11 Jan 2021 17:22:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz0u5-0000k3-1O; Mon, 11 Jan 2021 17:22:53 +0000
Received: by outflank-mailman (input) for mailman id 65095;
 Mon, 11 Jan 2021 17:22:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/ci+=GO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kz0u3-0000jy-HJ
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 17:22:51 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0078affd-7986-4b20-a9ca-87a4c1e9a305;
 Mon, 11 Jan 2021 17:22:49 +0000 (UTC)
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
X-Inumbo-ID: 0078affd-7986-4b20-a9ca-87a4c1e9a305
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610385769;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=iAQfXfTf4Z+UdFvsCgUjoLfv+gy7mWo6JYnC+pY4fzk=;
  b=Ko/6D9mGQNExNhCC5+qrQDfYfNGPNA5ld2yZNyYShxJnRYG5SxiwoX6X
   PubCkGs5FRJn73s2EuFSTlELGQpaVrEll7ci2pY5+SMTRGZRl0Y34cC66
   2S7U3ku34hlo/0/K/+d8wCV2WjIPr2s97M/7V6Hw/Y9AZ1xy1MuBeVRM5
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 4PzMZ1dDKve8zOA6xc+PD/G8Fwhg+KzyFx5b3kkaH4S5hqslRhmTmHwhDtUEbaehA5qRtq8ZTP
 5jvhNCrNVEAqhzQhdNa0QRcSOkR/lhiU6y7XCWx1MU4vpV2DTumH5GM13EpE8Z6Jocy/4WB53C
 A5p1xdda0nGU4m6plwacBGvsoKUD58oIOkTV/GPUuQXHA0GMYogLn/LdxVOhhQAPQkpnX0PDgE
 Q1YrQAgyuP0ZRdX3Lafwa2s6PIlw48M+CGrdQtFofPPMgOr3Sya0nHTiPDchu7qUvqmCj5rgcv
 AUw=
X-SBRS: 5.2
X-MesageID: 34888159
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,339,1602561600"; 
   d="scan'208";a="34888159"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kpOj4iIwoMe4t9cO3xkptFcqMUk+s3n3NRKD+KnQhLgBGiSQvdYlpnlttapMTeCAs80HjxMB7LJqpSZwNkA6qCGSajND63L89CY0zNdgXno1QYugQn12iiqeGKNY9j1RElbz8adK+4Xi/ZFw2e0Vn2RQZ1CsKBkBkX3J30yDn0eX0BVpxg8VJ+zBuxeORDIH+Wy/GULBKPXW+aKXjDz+HfXA7ahiS0V0VNGI23VNbfsmlAOQXWzGRl5FY7WjUXX27lv+YCIwHwH1wmCntV38eJRakGiC4FRSlldK4DIC2bmq14ChmDgQ9Xk7fpyodOAnG8cXmSILXdcoy0Qb4e2eLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HqxyMtMyu9iia4auKNo85ZpxohX8xv6XCEqCepSlv8o=;
 b=TyuUBqi5UOpDepTFiC8VO8d95NEBU8fUEwgUAr2NZJFVK1yzBMb8RkMVIa3pg961JzBDo1kF2O8iA1IkzLP9WZNey/Y0nVLtS/I4EZ1oqvuXeuzs68IHelAoGdTraxi2PTlo9LciSMowkTawVngIDdMFcCrO+gYmFbuacje9KOWIq6R4c0DFaIU05/Y+Cx+GsgjEcs9q9Rr1gl2WNQh8vGMxO6ca6eCjILGf1Hexiu3vvcZQNrUcWxdw6iIyYi5uyAcZ2OxwXPZ6eNtdhAbD/2rG+djLh/8HGLJaGlM306yzmajMO0eMkYhjvskuM7EvpNj1pA6IKGKmgECGeYdwvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HqxyMtMyu9iia4auKNo85ZpxohX8xv6XCEqCepSlv8o=;
 b=WWm21ERIdE7gcXElxCfunS0LTuLyIGakNOT2vFrI/PJ2re1tQJohtYL1E33Di1pj9oJu4Q/8uZIX1pMXgdscCd+iEIKVKwDdWDshUoyRoZR5L1ZI/H+HJcUa+koQyigKXgywjKcnPFstggKxvra0W/vxUF6ZbXImq6jces/Y/XU=
Date: Mon, 11 Jan 2021 18:22:39 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 10/24] Make libs/evtchn build on NetBSD
Message-ID: <20210111172239.27dn4ywgaplvdq62@Air-de-Roger>
References: <20201214163623.2127-1-bouyer@netbsd.org>
 <20201214163623.2127-11-bouyer@netbsd.org>
 <20201229115243.itpzsuriclqiljs7@Air-de-Roger>
 <20210104102645.GD2005@antioche.eu.org>
 <20210104171524.drvnwbqd2y5i4m66@Air-de-Roger>
 <20210110122250.GA1966@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210110122250.GA1966@antioche.eu.org>
X-ClientProxiedBy: ZR0P278CA0020.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::7) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c58d466-e245-4905-0ac4-08d8b6558229
X-MS-TrafficTypeDiagnostic: DS7PR03MB5445:
X-Microsoft-Antispam-PRVS: <DS7PR03MB5445B1ABDDBF5625E94C19C98FAB0@DS7PR03MB5445.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m/sJjstVD+aZ4fELQMxpvZtUBUVrf+gJEUbxDpKLhN1iB2Bfg/WCSYP6GQIiQ2mq0DW64LabQO7n3AAM3qMjyGMjNLflaffoAspVfO/MLOSPi0guhYfup1Ik3U0ir+1IPOjB3yeNW8pGveiYd7nB6sOoQgp152vXoeSEk6jo4kiPzKkF4VoTEAotiHivS2UJxuYu8d5R3zvbmzfaqFdAvEEgL/wkqX/YhcAuU2CObcpEIG5lMyrIOdBoACIdvh/zpHdW7Arj46a7srUs6plScAhcsn0u4RwpYUZGZ4iDh5214zyojlnTHEV2OG2OFg/bNodcyI1HD4kpQzjE0u3TX8huMboDIjPdrJznHl+8jGB0oY+VHxS8WQ2A0GDDOVw5si/gFiG3rY/7uFywPP1IYg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(376002)(136003)(39860400002)(346002)(396003)(366004)(6496006)(6916009)(956004)(4326008)(316002)(85182001)(66946007)(66476007)(33716001)(478600001)(6486002)(26005)(1076003)(66556008)(83380400001)(86362001)(8936002)(2906002)(16526019)(186003)(9686003)(8676002)(6666004)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MnFXTHRlbmxxQmJLZGRwdDVSczZIMTk0czNmaWg4ZkJWWjdjWTRlUjlnMXlG?=
 =?utf-8?B?RWIxS3YrMFZPRExGYXd1eW1PNVJWa3lGTzVUaHJiT3cxcVVYRmFHNDBSYXNj?=
 =?utf-8?B?VDRGeVZsejN2aFRzT3Mzd05pVGpEQlowS25RMjVkTWRud1owT1JxT0pyT0Rx?=
 =?utf-8?B?OVdHaEdvbUJNbk85TGxoMDg4dG5MdEd1blI1ZG8vN1lJbWx5Y0RlbmFndlZy?=
 =?utf-8?B?WHozcm5FT0d0bnNlNTRBbkI0dHo4ZXdwMnI4QkRVcEJNbVdObEZCTXZOOGNN?=
 =?utf-8?B?c2xFMTA5a3hUZjM0dzEwNkt5eXZkTko5Rjh6S1daRGtlS01TTmRTaVJkcHlF?=
 =?utf-8?B?eUpNY3VQQ0NLL2FKRnB5Y1puWnpCUmpqcWRlYXMzazhxSEQrOFVlbDcrOUVV?=
 =?utf-8?B?YVQ1WmNUNWlsdFdkRmtXWkpTbFNwM3ZYV2Vtbytqc2lTUmxyYlFvT1JtMFhN?=
 =?utf-8?B?MTViaUo5bzdGNnhIYkhFaTNrVldlK3c0RlF0WXl6TGptWDN6b3VTOExuSTdo?=
 =?utf-8?B?V3oyT2QxT0crMHFmeVdtZXFidXB3Q0pIUjJVM1RwTHdJMS9KSndtaTY4dEs4?=
 =?utf-8?B?V3J2Ujg2T0EvRXNjYjlPMnFNREkrNDFUMVJpVW1idGxsdXpIZllvcm1OM1pk?=
 =?utf-8?B?Wm1IakVwUVdYMVpTRlBYdnp3aFllNDVUZW9oZDAxNUN2MWQvVkhRM3M4OExF?=
 =?utf-8?B?ajczS0pYdUprUzFGUW9lVU1yU0prWjBjMXNLR2t3ZTNGZlBCS3FtVWE0RUQ4?=
 =?utf-8?B?Y0hlME15enAyNnhvMjhvUkZKS2tSUzVEdWxZU2VyNzJ2ajZZQ0sxZElGcTJV?=
 =?utf-8?B?S2phRXpaMXAwVGdEcURhSTlNSjBPN1VlWmJ5UmZJRjVPb0Y5YzJETUdJdHBY?=
 =?utf-8?B?dXluMzZLdEplRndSalMydGpOcTIzRWFRbjN5RXFVUkRlbzdKT3Q4UDE1ZXJS?=
 =?utf-8?B?eXh3QXBKcUxhZTdVWk9QdkxqcW9TVGh2SVUrcmI1cERGNitCZkF2OHdXWlRD?=
 =?utf-8?B?d1FTOFZXZ2VEQUptaHVRWG4yQkk5Q0p6ZFhHNllGeVYzQzhnWDViRkREa0VJ?=
 =?utf-8?B?Y2I3YTRmNGJ0VU1rODBOU0p5b2FHN0E1cjNYZURyYmFtVzBpNnEzSXlPaGxy?=
 =?utf-8?B?ZEdsVk5oQ1J0RFZuZDhwTTNiczJ0cUU5SUx2TnR5aXhMNDRGS2kxRm1kdDF0?=
 =?utf-8?B?bTdXS3dzYTRHT1I2RnFsZU1yR2xaUWxIUmVBTExpL2pPT0V4Q1lGVXJqVHBS?=
 =?utf-8?B?cHVvSWR4ejlzYmJaZjE2d0F4UFFDRExZakJRRHB4a2UzQlR6WlZQbUtoMHF3?=
 =?utf-8?Q?nlQ8QFkMRniIKWTu37xRlfS9ftYBKCcwLI?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 17:22:44.3953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c58d466-e245-4905-0ac4-08d8b6558229
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tjD98ySVhWaPQd7aeLt40iAHMO8khY/R9VoCsogwy1bLpx/CSmR0GsTUwnciaTmHEsc5l56glk+RbvTzJhCj1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5445
X-OriginatorOrg: citrix.com

On Sun, Jan 10, 2021 at 01:22:50PM +0100, Manuel Bouyer wrote:
> On Mon, Jan 04, 2021 at 06:15:24PM +0100, Roger Pau Monné wrote:
> > On Mon, Jan 04, 2021 at 11:26:45AM +0100, Manuel Bouyer wrote:
> > > On Tue, Dec 29, 2020 at 12:52:43PM +0100, Roger Pau Monné wrote:
> > > > On Mon, Dec 14, 2020 at 05:36:09PM +0100, Manuel Bouyer wrote:
> > > > > ---
> > > > >  tools/libs/evtchn/netbsd.c | 8 ++++----
> > > > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > > > > 
> > > > > diff --git a/tools/libs/evtchn/netbsd.c b/tools/libs/evtchn/netbsd.c
> > > > > index 8b8545d2f9..6d4ce28011 100644
> > > > > --- a/tools/libs/evtchn/netbsd.c
> > > > > +++ b/tools/libs/evtchn/netbsd.c
> > > > > @@ -25,10 +25,10 @@
> > > > >  
> > > > >  #include <sys/ioctl.h>
> > > > >  
> > > > > -#include <xen/sys/evtchn.h>
> > > > > -
> > > > >  #include "private.h"
> > > > >  
> > > > > +#include <xen/xenio3.h>
> > > > > +
> > > > >  #define EVTCHN_DEV_NAME  "/dev/xenevt"
> > > > >  
> > > > >  int osdep_evtchn_open(xenevtchn_handle *xce)
> > > > > @@ -131,7 +131,7 @@ xenevtchn_port_or_error_t xenevtchn_pending(xenevtchn_handle *xce)
> > > > >      int fd = xce->fd;
> > > > >      evtchn_port_t port;
> > > > >  
> > > > > -    if ( read_exact(fd, (char *)&port, sizeof(port)) == -1 )
> > > > > +    if ( read(fd, (char *)&port, sizeof(port)) == -1 )
> > > > >          return -1;
> > > > >  
> > > > >      return port;
> > > > > @@ -140,7 +140,7 @@ xenevtchn_port_or_error_t xenevtchn_pending(xenevtchn_handle *xce)
> > > > >  int xenevtchn_unmask(xenevtchn_handle *xce, evtchn_port_t port)
> > > > >  {
> > > > >      int fd = xce->fd;
> > > > > -    return write_exact(fd, (char *)&port, sizeof(port));
> > > > > +    return write(fd, (char *)&port, sizeof(port));
> > > > 
> > > > I'm afraid we will need some context as to why {read/write}_exact
> > > > doesn't work here.
> > > 
> > > It just doesn't exists on NetBSD
> > 
> > But those are not part of libc or any external library, they are
> > implemented in tools/libs/ctrl/xc_private.c and should be available to
> > the NetBSD build AFAICT.
> > 
> > They are just helpers build on top of the standard read/write calls.
> 
> Yes, I misremembered (I have this patch for a long time, since 4.11 at last,
> maybe even older).
> Anyway the build fails with:
> netbsd.c: In function 'xenevtchn_pending':
> netbsd.c:134:10: error: implicit declaration of function 'read_exact'; did you mean 'readlinkat'? [-Werror=implicit-function-declaration]
> 
> The only header where I see this function defined is
> tools/libs/ctrl/xc_private.h, so I would need something like
> #include "../../ctrl/xc_private.h"
> but this doesn't look right.
> 
> I didn't find where other OSes are getting the prototype from (or maybe
> they just have this -Werror turned off ?)
> 
> Anyway I think NetBSD doesn't need this read_exact/write_exact thing,
> the underlying pseudo-device won't to partial read/write.

The usage of {read/write}_exact there is indeed a mistake, when the
evtchn library was split from libxc no one realized that the
{read/write}_exact where no longer available to that code.

Could you please add:

Fixes: b7f76a699dc ('tools: Refactor /dev/xen/evtchn wrappers into libxenevtchn.')

To the commit message?

And also:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

