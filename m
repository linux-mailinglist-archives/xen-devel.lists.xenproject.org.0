Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2329620589A
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2020 19:27:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnmhN-0000yp-09; Tue, 23 Jun 2020 17:27:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ClC/=AE=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jnmhL-0000yk-1L
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2020 17:27:03 +0000
X-Inumbo-ID: bfa75832-b576-11ea-bb8b-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bfa75832-b576-11ea-bb8b-bc764e2007e4;
 Tue, 23 Jun 2020 17:27:01 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: QOJk8ArHs5azm1dSCwaWNDuXN00Cl8NwCNa064iX8LeVO08dlX3opI04EF/4ZuWp8kh0Sehf6I
 W9Nvq/T7bOcfPuLwhcuAc8nBmb49UHGLyIhnio649eXjWwZkLjVkc3dGvr9XMZlc/+djYuls1R
 7aPwE89SK7L8U+LsaMGgOACZ5a4jabmhHaxn801rcNGVZCQ6oap6Xbrqb6FD0iY9l28a1JiL3g
 zs0RxzpahEvLGxPTLLcJneU7BtzYoSAeaq784qXeZ/NfFHgzhaUhP7dlD9lI7zYG8XfTfoa7bI
 tm0=
X-SBRS: 2.7
X-MesageID: 21544775
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,272,1589256000"; d="scan'208";a="21544775"
Date: Tue, 23 Jun 2020 19:26:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH for-4.14] mm: fix public declaration of struct
 xen_mem_acquire_resource
Message-ID: <20200623172652.GU735@Air-de-Roger>
References: <20200623135246.66170-1-roger.pau@citrix.com>
 <50e25ef7-e7a7-d2c1-5f78-ce32cae35f38@suse.com>
 <20200623155609.GS735@Air-de-Roger>
 <da8d4d26-0524-1d77-8516-e986dd0affaa@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <da8d4d26-0524-1d77-8516-e986dd0affaa@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian
 Jackson <ian.jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jun 23, 2020 at 06:18:52PM +0200, Jan Beulich wrote:
> On 23.06.2020 17:56, Roger Pau Monné wrote:
> > On Tue, Jun 23, 2020 at 05:02:04PM +0200, Jan Beulich wrote:
> >> On 23.06.2020 15:52, Roger Pau Monne wrote:
> >>> XENMEM_acquire_resource and it's related structure is currently inside
> >>> a __XEN__ or __XEN_TOOLS__ guarded section to limit it's scope to the
> >>> hypervisor or the toolstack only. This is wrong as the hypercall is
> >>> already being used by the Linux kernel at least, and as such needs to
> >>> be public.
> >>>
> >>> Also switch the usage of uint64_aligned_t to plain uint64_t, as
> >>> uint64_aligned_t is only to be used by the toolstack. Note that the
> >>> layout of the structure will be the same, as the field is already
> >>> naturally aligned to a 8 byte boundary.
> >>
> >> I'm afraid it's more complicated, and hence ...
> >>
> >>> No functional change expected.
> >>
> >> ... this doesn't hold: As I notice only now the struct also wrongly
> >> (if it was meant to be a tools-only interface) failed to use
> >> XEN_GUEST_HANDLE_64(), which would in principle have been a problem
> >> for 32-bit callers (passing garbage in the upper half of a handle).
> >> It's not an actual problem because, unlike would typically be the
> >> case for tools-only interfaces, there is compat translation for this
> >> struct.
> > 
> > Yes, there's already compat translation for the frame_list array.
> > 
> >> With this, however, the problem of your change becomes noticeable:
> >> The structure's alignment for 32-bit x86, and with it the structure's
> >> sizeof(), both change. You should be able to see this by comparing
> >> xen/common/compat/memory.c's disassembly before and after your
> >> change - the number of bytes to copy by the respective
> >> copy_from_guest() ought to have changed.
> > 
> > Right, this is the layout with frame aligned to 8 bytes:
> > 
> > struct xen_mem_acquire_resource {
> > 	uint16_t                   domid;                /*     0     2 */
> > 	uint16_t                   type;                 /*     2     2 */
> > 	uint32_t                   id;                   /*     4     4 */
> > 	uint32_t                   nr_frames;            /*     8     4 */
> > 	uint32_t                   pad;                  /*    12     4 */
> > 	uint64_t                   frame;                /*    16     8 */
> > 	long unsigned int *        frame_list;           /*    24     4 */
> > 
> > 	/* size: 32, cachelines: 1, members: 7 */
> > 	/* padding: 4 */
> > 	/* last cacheline: 32 bytes */
> > };
> > 
> > And this is without:
> > 
> > struct xen_mem_acquire_resource {
> > 	uint16_t                   domid;                /*     0     2 */
> > 	uint16_t                   type;                 /*     2     2 */
> > 	uint32_t                   id;                   /*     4     4 */
> > 	uint32_t                   nr_frames;            /*     8     4 */
> > 	uint32_t                   pad;                  /*    12     4 */
> > 	uint64_t                   frame;                /*    16     8 */
> > 	long unsigned int *        frame_list;           /*    24     4 */
> > 
> > 	/* size: 28, cachelines: 1, members: 7 */
> > 	/* last cacheline: 28 bytes */
> > };
> > 
> > Note Xen has already been copying those extra 4 padding bytes from
> > 32bit Linux kernels AFAICT, as the struct declaration in Linux has
> > dropped the aligned attribute.
> > 
> >> The question now is whether we're willing to accept such a (marginal)
> >> incompatibility. The chance of a 32-bit guest actually running into
> >> it shouldn't be very high, but with the right placement of an
> >> instance of the struct at the end of a page it would be possible to
> >> observe afaict.
> >>
> >> Or whether we go the alternative route and pad the struct suitably
> >> for 32-bit.
> > 
> > I guess we are trapped with what Linux has on it's headers now, so we
> > should handle the struct size difference in Xen?
> 
> How do you mean to notice the difference in Xen? You don't know
> what the caller's environment's sizeof() would yield.

I'm confused. Couldn't we switch from uint64_aligned_t to plain
uint64_t (like it's currently on the Linux headers), and then use the
compat layer in Xen to handle the size difference when called from
32bit environments?

This would of course assume that no toolstack has implemented direct
calls using this interface, which seems likely because it either
returns mfns to be mapped in the PV case or require gfns to be
provided for HVM.

> > I'm very tempted to just say switch the XEN_GUEST_HANDLE to
> > XEN_GUEST_HANDLE_64, but I guess it's risky.
> 
> Plus, like uint64_aligned_t, iirc it's a construct exposed through
> tool-stack-only interfaces, but not generally.

Ack.

> >>> --- a/xen/include/public/memory.h
> >>> +++ b/xen/include/public/memory.h
> >>> @@ -607,6 +607,8 @@ struct xen_reserved_device_memory_map {
> >>>  typedef struct xen_reserved_device_memory_map xen_reserved_device_memory_map_t;
> >>>  DEFINE_XEN_GUEST_HANDLE(xen_reserved_device_memory_map_t);
> >>>  
> >>> +#endif /* defined(__XEN__) || defined(__XEN_TOOLS__) */
> >>> +
> >>>  /*
> >>>   * Get the pages for a particular guest resource, so that they can be
> >>>   * mapped directly by a tools domain.
> >>
> >> This comment is now stale.
> > 
> > Hm, I'm not so sure. This is indeed used by Xen related tools (or
> > emulators) and then those domains running such tools would also be
> > tools domains?
> > 
> > Anyway, I don't mind removing it, but I also don't think it's so
> > off.
> 
> Well - if this isn't a tool stack interface (see also my 2nd reply
> to your original patch), then the comment shouldn't suggest it is.

OK, let me take a look.

Roger.

