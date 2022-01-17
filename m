Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 915BD490BF4
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 16:58:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258196.444396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9UNy-0003na-Hz; Mon, 17 Jan 2022 15:57:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258196.444396; Mon, 17 Jan 2022 15:57:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9UNy-0003l7-Ew; Mon, 17 Jan 2022 15:57:34 +0000
Received: by outflank-mailman (input) for mailman id 258196;
 Mon, 17 Jan 2022 15:57:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MIPE=SB=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1n9UNw-0003kx-IK
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 15:57:32 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c1a6251-77ae-11ec-9bbc-9dff3e4ee8c5;
 Mon, 17 Jan 2022 16:57:30 +0100 (CET)
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
X-Inumbo-ID: 2c1a6251-77ae-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642435050;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EdC3KH93mB30h+nubuvYbgV46plAngv1iEt//C4ggZE=;
  b=S9X3VfsblCcGnTIHt2I8C68594ff0p3m6Dz/f3SIla8yI2ItBxCrzWKC
   G0wINd4V5V9vP7GpzmKtaacBCV2J1zfFrp1/GDfeoo7Ot4QMca8GC1TLO
   QiJgzLGvr77osLXkizjs1ktTjKd82ApnvbRoHoY6sw5zhdvazGAZTv/Kg
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 0Hf78XvPPhLf3O19dekpPUNTV4aHrIdL/rU4KYM0rt9kctCutlnAUwHfniEKGmtBHiTSfyWOP/
 IE3RK064kgIBT3slE3rnMk3PqdJQA+Mr1r5koY+pdWWrsL3Ie87pG9BwtALWwkIOhtlpJ0UFsr
 bYFDKFvYAjKtH5sA9+HNtPXdfjGky/TZ8BJZfQIat8zYTgJtfYMjliIyuPdSsKFeAkNiOIQ80m
 Dth0ES/kCMD80lREIHvCwyikzK8lnNE10Cq7dJxRNEAdF07ikStHjOW6SWawybL/pK68N8Q0uE
 M0ANvTSeZe8gb5QyDrSp1qRA
X-SBRS: 5.2
X-MesageID: 62564686
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:0MqbBK32r1OPfW2yhfbD5SB2kn2cJEfYwER7XKvMYLTBsI5bpzADx
 zMZWG3TbPuNNDb9eI13Pdjl9kJXv8PUzNFnGlE/pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCanAZqTNMEn9700o6wrFh2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhw9tdl
 8gUmLGLWShxEbzVuccZfgVAOnQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Ej8I/LM7tLcUHt2tp1z3xBvc6W5HTBa7N4Le02R9u3J0QQaiOO
 aL1bxIwSjmaaA8VG20YUpQjzOD32HnvbyVX/Qf9Sa0fvDGIkV0ZPKLWGMXRUsyHQ4NShEnwj
 nLL+SH1Dw8XMPSbyCGZ6TS8i+nXhyT5VYkOUrqi+ZZCglOexmgSBzUNSEC25/K+jyaWV9xWJ
 EMV/S4vhbMv70HtRd74NzWaj2SDpQU0QMdLHqsx7wTl90bPy1/HXC5eFGcHMYF48p9tLdA36
 rOXt4/iKWNy6ZC4cmKyrpiFtBKRPQUJNUZXMEfoUjA5y9XkpYgyiDfGQdBiDLO5g7XJJN3g/
 9yZhHNg3utO1Kbnw43+pAma2Gz0+vAlWyZsvl2PNl9J+D+Vc2JMi2aAzVHApchNI4+CJrVql
 ChVwpPOhAzi4HzkqcBsfAnvNOzzjxpmGGeF6bKKI3XH3273k5JEVdoBiAyS3G8zbq45lcbBO
 Sc/Qz956p5JJ2eNZqRqeY+3AMlC5fG+SY6+C6CPPoYSPMgZmOq7EMdGPxP4M4fFyhlErE3CE
 c3DLZbE4YgyVMyLMwZat89CiOR2l0jSNEvYRIzhzgTP7FZtTCX9dFvxC3PXNrpRxPrd+G39q
 o8DX+PXlUk3eLCgM0H/rN5CRXhXfCNTLc2n9KRqmhurf1AO9JcJUaGBmNvMuuVNwsxoqws/1
 irsBR8Dlguu3C2vxMfjQikLVY4DlK1X9RoTVRHA9370s5T6SYrwvqoZabUterwrqL5qwfJuF
 qFXcMScGPVfDD/A/m1FP5X6qYVjcjWthB6PYHX5MGRuIcY4Slyb4MLgcyvu6DIKUni9u/whr
 uDyzQjcW5cCGVhvVZ6EdPK1wlqtlnEBg+YuDVDQK9xedRy0oohnIiD8lNEtJMQIJUmRzzeWz
 V/OUxwZufPMs8k+99yQ3fKIqIKgEu1fGEtGHjaEsebqZHeCpmf6mN1OSueFezzZRVjYwqT6a
 LUH1ez4Pd0GgE1O79h2HYF0wP9s/NDovbJbkFhpRS2Zc1SxB7p8CXCaxs0T5LZVz7pUtAbqC
 EKC/t5WZeeANM//SQNDIQMkaqKI1O0OmymU5vMweR2o6Chy9buBcENTIxjT13ANcOoraNsok
 bU7pcobyw2jkR57YN+Jgxdd+3mIMnFdAb4ssYsXAdOzhwcmor2YjUcw1sMiDEmzVuhx
IronPort-HdrOrdr: A9a23:vz0ytagkFCwaL0+mUCeIff9Vi3BQXtgji2hC6mlwRA09TySZ//
 rOoB0+726StN9xYgBFpTnuAsW9qB/nmqKdpLNhW4tKPzOW3VdATrsSjrcKqgeIc0aVm9K1l5
 0QEZSWYOeAdGSS5vyb3ODXKbgd/OU=
X-IronPort-AV: E=Sophos;i="5.88,295,1635220800"; 
   d="scan'208";a="62564686"
Date: Mon, 17 Jan 2022 15:56:56 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Dario Faggioli <dfaggioli@suse.com>
CC: Juergen Gross <JGross@suse.com>, Jim Fehlig <jfehlig@suse.com>,
	"wl@xen.org" <wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/2] tools/libs/light: numa placement: don't try to free
 a NULL list of vcpus
Message-ID: <YeWRyDGEFrOCeycP@perard>
References: <164200566223.24755.262723784847161301.stgit@work>
 <164200569629.24755.2980883411590685040.stgit@work>
 <YeAVjpmuV9LIRFpa@perard>
 <912014da2d821a14418e272f95c25e60be2b7a4e.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <912014da2d821a14418e272f95c25e60be2b7a4e.camel@suse.com>

On Fri, Jan 14, 2022 at 11:22:00PM +0000, Dario Faggioli wrote:
> On Thu, 2022-01-13 at 12:05 +0000, Anthony PERARD wrote:
> > On Wed, Jan 12, 2022 at 05:41:36PM +0100, Dario Faggioli wrote:
> > 
> > > 2) there should be nothing to free anyway
> > 
> > The issue here is that it doesn't appear to be true. Even if "info"
> > is
> > NULL, "nr" have an other value than 0, so libxl_vcpuinfo_list_free()
> > will try to access random addresses.
> > 
> My point here was that if vinfo is NULL (because libxl_list_vcpu()
> returned NULL), there aren't any list element or any list to free, so
> we can avoid calling libxl_vcpuinfo_list_free().
> 
> Then, sure, if we call it with a NULL vinfo and a non-zero
> nr_dom_vcpus, things explode, but this was being addressed in patch 2.
> 
> This first one was really only about not trying to free an empty list.
> And not to workaround the fact that it currently can make things
> explode, just because it feels pointless.
> 
> > > Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
> > > Tested-by: James Fehlig <jfehlig@suse.com>
> > 
> > Can I suggest to make libxl_vcpuinfo_list_free() work a bit better in
> > case it's "nr" parameter is wrong? It will do nothing if "list" is
> > NULL.
> >
> I thought about that, and we certainly can do it.
> 
> However, I think it's unrelated to this patch so, if I do it, I'll do
> it in its own one.
> 
> Also, if we go that way, I guess we want to change
> libxl_cputopology_list_free(), libxl_pcitopology_list_free(),
> libxl_numainfo_list_free(), libxl_dominfo_list_free(),
> libxl_vminfo_list_free() and libxl_cpupoolinfo_list_free(), don't we?

I actually don't know if that would be useful. Those functions do work
as expected (I think) with the right parameters: they do nothing when
called with (NULL, 0). free(NULL) does nothing.

So checking for NULL before using `nr` would probably just be a
workaround for programming mistake in the function allocating the object
or some missing initialisation in the caller. So I don't think it is
important anymore.

> > Also I think it is better to keep the free in the exit path at the
> > end
> > of the loop.
> > 
> Can I ask why as, as I was trying to say above, if we are sent directly
> to next by one of the goto, we do know that vinfo is NULL and
> libxl_vcpuinfo_list_free() will be basically a NOP, however it is
> implemented.
> 
> Of course, you're the maintainer of this code, so I'll do like that if
> you ask... I'm just curious. :-)

Freeing resources should always been attempted, even if that mean to
check whether there's something to free before calling the associated
free function. Imagine someone adding some code that could fail after
the libxl_list_vcpu(), then when that new code fails it would `goto
next;` and the allocated data from libxl_list_vcpu() would never be
freed.

> Actually, if you really think that the call to
> libxl_vcpuinfo_list_free() should stay where it is, I can just drop
> this patch and go on with patch 2 only, which is enough for fixing the
> crash.

This patch is just a workaround a bug in libxl_list_vcpu(), so I think
it can be dropped.

Cheers,

-- 
Anthony PERARD

