Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E7F22978C
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jul 2020 13:38:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyD4S-0001AR-HB; Wed, 22 Jul 2020 11:38:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bhkO=BB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jyD4R-00019a-7k
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2020 11:37:59 +0000
X-Inumbo-ID: ca438cad-cc0f-11ea-8635-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ca438cad-cc0f-11ea-8635-bc764e2007e4;
 Wed, 22 Jul 2020 11:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595417878;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=rFikLpDoTwN+lb+5qA356sNYf4XfvDSl0K1Rs3d0IPE=;
 b=NRU1twIiwmhTKfJU7HGfj8Jgvjnl3mmZXni0uKsX4uxpEy73+gOpMpC3
 B8LU91m6Ify7hv33K+uaKpUI3PWVIGRb3RghWKGi20GPduoPu5JZqmOZA
 +FLPAKxJMTSbVSsG3BOoL9U5tPd5TywCazDu9MX5a/VUHIQL86o8oYfGC I=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 8iq/QQgwV7PDLNqmG2OEWqIzTiKctg2JRYeC6uH+7fIHrnT5u+7hjGHM0jhXsPw09Py1enmyqK
 /CcALuKPBw2XMAU2IayTbpLi0HbAHTASeTiv0V6Nl83OCfMbbHGvaFoMHRu1r92uCEpwqkbYyo
 C9uKc3hVIe9tMmtoi+/SaqOOhxyVwt2ejHa9Y0oGdmY04Xk1zehwG2KjHtxyTRHh0Xcu8acLVu
 +ZuRDKlNjb5aNzq4w+i6l2b6XJJ7v2D2EOJnfBbtghVewFmM6f3lxKoFeqAfSITIIamLPs6wZv
 ej4=
X-SBRS: 2.7
X-MesageID: 23123594
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,381,1589256000"; d="scan'208";a="23123594"
Date: Wed, 22 Jul 2020 13:37:51 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Subject: Re: Virtio in Xen on Arm (based on IOREQ concept)
Message-ID: <20200722113751.GY7191@Air-de-Roger>
References: <CAPD2p-nthLq5NaU32u8pVaa-ub=a9-LOPenupntTYdS-cu31jQ@mail.gmail.com>
 <20200717150039.GV7191@Air-de-Roger>
 <8f4e0c0d-b3d4-9dd3-ce20-639539321968@gmail.com>
 <3dcab37d-0d60-f1cc-1d59-b5497f0fa95f@xen.org>
 <b6cf0931-c31e-b03b-3995-688536de391a@gmail.com>
 <05acce61-5b29-76f7-5664-3438361caf82@xen.org>
 <20200722082115.GR7191@Air-de-Roger>
 <f3c54a7e-4352-7591-73c2-14215bd3ad34@xen.org>
 <20200722111012.GX7191@Air-de-Roger>
 <d28f7cff-53dc-6a63-c681-16bd90b50436@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d28f7cff-53dc-6a63-c681-16bd90b50436@xen.org>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <andr2000@gmail.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Oleksandr <olekstysh@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Artem
 Mygaiev <joculator@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jul 22, 2020 at 12:17:26PM +0100, Julien Grall wrote:
> 
> 
> On 22/07/2020 12:10, Roger Pau Monné wrote:
> > On Wed, Jul 22, 2020 at 11:47:18AM +0100, Julien Grall wrote:
> > > > 
> > > > You can still use the map-on-fault behaviour as above, but I would
> > > > recommend that you try to limit the number of hypercalls issued.
> > > > Having to issue a single hypercall for each page fault it's going to
> > > > be slow, so I would instead use mmap batch to map the hole range in
> > > > unpopulated physical memory and then the OS fault handler just needs to
> > > > fill the page tables with the corresponding address.
> > > IIUC your proposal, you are assuming that you will have enough free space in
> > > the physical address space to map the foreign mapping.
> > > 
> > > However that amount of free space is not unlimited and may be quite small
> > > (see above). It would be fairly easy to exhaust it given that a userspace
> > > application can map many times the same guest physical address.
> > > 
> > > So I still think we need to be able to allow Linux to swap a foreign page
> > > with another page.
> > 
> > Right, but you will have to be careful to make sure physical addresses
> > are not swapped while being used for IO with devices, as in that case
> > you won't get a recoverable fault. This is safe now because physical
> > mappings created by privcmd are never swapped out, but if you go the
> > route you propose you will have to figure a way to correctly populate
> > physical ranges used for IO with devices, even when the CPU hasn't
> > accessed them.
> > 
> > Relying solely on CPU page faults to populate them will not be enough,
> > as the CPU won't necessarily access all the pages that would be send
> > to devices for IO.
> 
> The problem you described here doesn't seem to be specific to foreign
> mapping. So I would really be surprised if Linux doesn't already have
> generic mechanism to deal with this.

Right, Linux will pre-fault and lock the pages before using them for
IO, and unlock them afterwards, in which case it should be safe.

> Hence why I suggested before to deal with foreign mapping the same way as
> Linux would do with user memory.

Should work, on FreeBSD privcmd I also populate the pages in the page
fault handler, but the hypercall to create the foreign mappings is
executed only once when the ioctl is issued.

Roger.

