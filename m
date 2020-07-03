Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E44D7213873
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jul 2020 12:12:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrIfJ-0003A1-TU; Fri, 03 Jul 2020 10:11:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gjf6=AO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jrIfI-00039w-HT
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2020 10:11:28 +0000
X-Inumbo-ID: 8eb000de-bd15-11ea-8962-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8eb000de-bd15-11ea-8962-12813bfff9fa;
 Fri, 03 Jul 2020 10:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1593771087;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=X+P6sIYROQUrJMGeiNvi5GHRePLeRgpPx8AihGlO/N0=;
 b=Orqw9sWysC3YU1bxdmfREMkE2FrJdQRMW8qXi/4JKm/j7jbMP9Mr8F4l
 LtJt5cim7qrRkxnNTIGrEPdfHpkYhxCZbvQo4qF7dQVc6Ff+CWx9lVerI
 MDdap+h9hnBoNOZDfkqv/V4dQI9TtBMr1wBylSfxogxh2x9mCYckNU8tL c=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: PhBJq5feS6AtDWsamf3SJO8BhZ0iN6oEh1Ay5Mg4n1CsvgriISyVgh52qEwwuscFsQRv71wDsS
 e9g7iYh1GNokYYX86h5xUzBvCpHNzl4iuVJd7yBhn08XGQqAfgFH8aTLLZeQsX6J1YSEnEhjc3
 8kMlJZrDV8vAynN0BpkY98IUxuoJ4kd1Et2EKu+53I34u7imP3VxF+X78No9oA3kk+z5XCu3Pz
 5Q56v2t2Ls55mtvUAvU/1SlOuYx7V2vE8s2xXKDaw4g2RieWWzrhDLHImCe68GjhsyFzaQDxiI
 xPU=
X-SBRS: 2.7
X-MesageID: 21762672
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,307,1589256000"; d="scan'208";a="21762672"
Date: Fri, 3 Jul 2020 12:11:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v4 03/10] tools/libxl: add vmtrace_pt_size parameter
Message-ID: <20200703101120.GZ735@Air-de-Roger>
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
 <5f4f4b1afa432258daff43f2dc8119b6a441fff4.1593519420.git.michal.leszczynski@cert.pl>
 <20200702090047.GX735@Air-de-Roger>
 <1505813895.18300396.1593707008144.JavaMail.zimbra@cert.pl>
 <20200703094438.GY735@Air-de-Roger>
 <b5335c2e-da13-28de-002b-e93dd68a0a11@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b5335c2e-da13-28de-002b-e93dd68a0a11@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, tamas lengyel <tamas.lengyel@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, luwei kang <luwei.kang@intel.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Jul 03, 2020 at 11:56:38AM +0200, Jan Beulich wrote:
> On 03.07.2020 11:44, Roger Pau Monné wrote:
> > On Thu, Jul 02, 2020 at 06:23:28PM +0200, Michał Leszczyński wrote:
> >> ----- 2 lip 2020 o 11:00, Roger Pau Monné roger.pau@citrix.com napisał(a):
> >>
> >>> On Tue, Jun 30, 2020 at 02:33:46PM +0200, Michał Leszczyński wrote:
> >>>> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> >>>> index 59bdc28c89..7b8289d436 100644
> >>>> --- a/xen/include/public/domctl.h
> >>>> +++ b/xen/include/public/domctl.h
> >>>> @@ -92,6 +92,7 @@ struct xen_domctl_createdomain {
> >>>>      uint32_t max_evtchn_port;
> >>>>      int32_t max_grant_frames;
> >>>>      int32_t max_maptrack_frames;
> >>>> +    uint8_t vmtrace_pt_order;
> >>>
> >>> I've been thinking about this, and even though this is a domctl (so
> >>> not a stable interface) we might want to consider using a size (or a
> >>> number of pages) here rather than an order. IPT also supports
> >>> TOPA mode (kind of a linked list of buffers) that would allow for
> >>> sizes not rounded to order boundaries to be used, since then only each
> >>> item in the linked list needs to be rounded to an order boundary, so
> >>> you could for example use three 4K pages in TOPA mode AFAICT.
> >>>
> >>> Roger.
> >>
> >> In previous versions it was "size" but it was requested to change it
> >> to "order" in order to shrink the variable size from uint64_t to
> >> uint8_t, because there is limited space for xen_domctl_createdomain
> >> structure.
> > 
> > It's likely I'm missing something here, but I wasn't aware
> > xen_domctl_createdomain had any constrains regarding it's size. It's
> > currently 48bytes which seems fairly small.
> 
> Additionally I would guess a uint32_t could do here, if the value
> passed was "number of pages" rather than "number of bytes"?

That could work, not sure if it needs to state however that those will
be 4K pages, since Arm can have a different minimum page size IIRC?
(or that's already the assumption for all number of frames fields)
vmtrace_nr_frames seems fine to me.

Roger.

