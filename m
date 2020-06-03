Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D136B1ED190
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jun 2020 15:57:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgTtB-0008U2-Uc; Wed, 03 Jun 2020 13:57:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vZjh=7Q=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jgTtB-0008Tx-Dc
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 13:57:05 +0000
X-Inumbo-ID: 1ac75814-a5a2-11ea-81bc-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ac75814-a5a2-11ea-81bc-bc764e2007e4;
 Wed, 03 Jun 2020 13:57:04 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: px/94CR6m58rgUqn6TH2mprv/7R8t7s1G9T0cktCs4f83+xtzc0DJ8jJM3JxeQmdfhskB8m+Xb
 CCHptaD+G4jKbxXluDq5hd6HpOmKnl3n2SY0cOJjVcbJUbd17wCeSaX3Hmk0l930MvfDxZz1KG
 XT0wv+VXqMs6eERI5ygRxhFVTGoJx1dEGZKOPQD23aX7+ZCbG5uO8lcERmtwyzJldqIcC+DXz4
 04btNGA05xI9s2KAkpi1L3m8KMrNXLEgx12upkApPC4niCsNGpbtE7xY4dDb4pNTPxuV7u3v/8
 OAY=
X-SBRS: 2.7
X-MesageID: 19471919
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,467,1583211600"; d="scan'208";a="19471919"
Date: Wed, 3 Jun 2020 15:56:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v3 for-4.14] x86/monitor: revert default behavior when
 monitoring register write events
Message-ID: <20200603135656.GE1195@Air-de-Roger>
References: <20200602134909.66581-1-tamas@tklengyel.com>
 <20200603082824.GC1195@Air-de-Roger>
 <CABfawhnfwMrEYhhsQik_SjVZ2qqL2L2UaSQ6zdR5uBEWvvN8=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABfawhnfwMrEYhhsQik_SjVZ2qqL2L2UaSQ6zdR5uBEWvvN8=g@mail.gmail.com>
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jun 03, 2020 at 06:25:31AM -0600, Tamas K Lengyel wrote:
> On Wed, Jun 3, 2020 at 2:28 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
> >
> > On Tue, Jun 02, 2020 at 07:49:09AM -0600, Tamas K Lengyel wrote:
> > > diff --git a/xen/arch/x86/hvm/monitor.c b/xen/arch/x86/hvm/monitor.c
> > > index 8aa14137e2..36894b33a4 100644
> > > --- a/xen/arch/x86/hvm/monitor.c
> > > +++ b/xen/arch/x86/hvm/monitor.c
> > > @@ -53,11 +53,11 @@ bool hvm_monitor_cr(unsigned int index, unsigned long value, unsigned long old)
> > >              .u.write_ctrlreg.old_value = old
> > >          };
> > >
> > > -        if ( monitor_traps(curr, sync, &req) >= 0 )
> > > -            return 1;
> > > +        return monitor_traps(curr, sync, &req) >= 0 &&
> > > +            curr->domain->arch.monitor.control_register_values;
> >
> > Nit (it can be fixed while committing IMO): curr should be aligned to
> > monitor.
> 
> This is the established style already in-place, see
> http://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/x86/hvm/monitor.c;h=8aa14137e25a47d3826843441e244decf81dc855;hb=refs/heads/staging#l76:
> 
>   76     return curr->domain->arch.monitor.emul_unimplemented_enabled &&
>   77         monitor_traps(curr, true, &req) == 1;
> 
> I don't really care either way but at least we should be consistent.

Oh, OK. This is slightly different from the indentation that I tend to
use, sorry for the request then.

Roger.

