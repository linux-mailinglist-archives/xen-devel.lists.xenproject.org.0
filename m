Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C37876921F
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 11:45:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.572864.896941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQPSl-0003vD-To; Mon, 31 Jul 2023 09:45:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 572864.896941; Mon, 31 Jul 2023 09:45:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQPSl-0003tZ-Qy; Mon, 31 Jul 2023 09:45:15 +0000
Received: by outflank-mailman (input) for mailman id 572864;
 Mon, 31 Jul 2023 09:45:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GapS=DR=citrix.com=prvs=569ba324e=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qQPSk-0003tT-NO
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 09:45:14 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f042085d-2f86-11ee-b254-6b7b168915f2;
 Mon, 31 Jul 2023 11:45:12 +0200 (CEST)
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
X-Inumbo-ID: f042085d-2f86-11ee-b254-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690796712;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=5JDwv0ENuZfBG/YaonkgjG5m7XmXFUJcjYnOjiFHnZg=;
  b=DtsJGmjxUWYgWRLVK38NZYTN6KsxsVz273FiXghjub/MK1oAOzTFKrRI
   9t504dNU7T5t60Rk5wQYPJVWjD2ZbNeT9fzg5gpPuHqiy4yBWDgnCeFNv
   xUSbENy97kJrBZMIHIkfdpe27AMzMzq5DckWG3ob8r2vGaGZ6KuVHyyE/
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 117255370
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:uzRCQa5ZZ7vZptXz+XF8fAxRtOLHchMFZxGqfqrLsTDasY5as4F+v
 mQdWmiGbqqKa2GhKdglatm0oElX78PTyYVnG1Fo/Hw9Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35ZwehBtC5gZlPa8Q5QeH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m/
 +06M3c2TB64ibiq8PW7ctRWmcUzFZy+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrnD5bz1frkPTvact6nLf5AdwzKLsIJzefdniqcB9xx/H/
 D+bpDuhav0cHIywimXdoliKvMTChi/VY44bGLanyPE/1TV/wURMUUZLBDNXu8KRiEe4V8hON
 k889S8nrKx0/0uuJvHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpQMMinN87Q3otz
 FDht9HmHzt0q5WOVGmQsLyTqFuaOyIYMGsDbi8sVhYe7p/op4RbphDSStduFoalg9uzHiv/q
 xiRtzQ3jbgXic8N1o248ErBjjbqoYLGJiY8/gjNV3ipxh94boWiIYev7DDmAe1oddjDCAPb5
 T5dxpbYtbpVZX2QqMCTaO8cPqru3NSLCzOGnW4oH6EczSus60f2KOi8/wpCyFdV3tcsIGG4O
 BCI6F4Kvfe/L1PxM/YpPtvZ59ACiPG5SI+7Dq28gs9mOMAZSeORwM15iad8NUjJmVNkr6wwM
 IzznS2EXSdDUvQPINZbqo4gPV4XKsMWnzm7qWjTlUjP7FZnTCf9pU05GFWPdPsly6iPvR/Y9
 d1SX+PTlUQHD7GkOnWLqdZPRbzvEZTcLcmnw/G7i8bZelY2cI3fI6G5LUwdl3xNwP0Oy7agE
 oCVUU5E0lvv7UAr2i3TAk2PnIjHBM4lxVpiZHxEALpd8yR7CWpZxPtFJsRfkHhO3LAL8MOYu
 NFeIZrcX6weEmSWk9nfBLGkxLFfmN2QrVrmF0KYjPIXJvaMmyShFgfYQzbS
IronPort-HdrOrdr: A9a23:a4e0ta7GnQECW44FJQPXwAzXdLJyesId70hD6qkQc3Fom62j5q
 WTdZEgvyMc5wx/ZJhNo7690cq7MBHhHPxOgbX5VI3KNGXbUQOTR72KhrGSoAEIdReeygZcv5
 0QCZSXCrfLfCVHZRCR2njFLz4iquP3j5xBnY3lvhNQpZkBUdAZ0+9+YDzrdXFedU19KrcSMo
 GT3cZDryrIQwVtUizqbkN1OdQqvrfw5evbXSI=
X-Talos-CUID: 9a23:F/GFZGDhgqU7R0r6EyN21lVTIeIrSXOH0EeXI3eFM3loWITAHA==
X-Talos-MUID: 9a23:uYqiDQmFMuxg+M/UGSR2dnoyG4Q3u/SELnomnI4KlfKIPCB7JAmS2WE=
X-IronPort-AV: E=Sophos;i="6.01,244,1684814400"; 
   d="scan'208";a="117255370"
Date: Mon, 31 Jul 2023 10:44:59 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v7 04/15] xen/sysctl: Nest cpufreq scaling options
Message-ID: <0026cde5-2f2a-4572-b7c5-ec4b82272a8a@perard>
References: <20230726170945.34961-1-jandryuk@gmail.com>
 <20230726170945.34961-5-jandryuk@gmail.com>
 <5a6365b0-7809-4287-96fa-be7809d664c8@perard>
 <CAKf6xpvzKiCkNkWYQyngENmF4+VmT3EgTWubDrQ0OZXgK9-jJg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKf6xpvzKiCkNkWYQyngENmF4+VmT3EgTWubDrQ0OZXgK9-jJg@mail.gmail.com>

On Thu, Jul 27, 2023 at 11:05:33AM -0400, Jason Andryuk wrote:
> On Thu, Jul 27, 2023 at 6:27 AM Anthony PERARD
> <anthony.perard@citrix.com> wrote:
> >
> > On Wed, Jul 26, 2023 at 01:09:34PM -0400, Jason Andryuk wrote:
> > > Add a union and struct so that most of the scaling variables of struct
> > > xen_get_cpufreq_para are within in a binary-compatible layout.  This
> > > allows cppc_para to live in the larger union and use uint32_ts - struct
> > > xen_cppc_para will be 10 uint32_t's.
> > >
> > > The new scaling struct is 3 * uint32_t + 16 bytes CPUFREQ_NAME_LEN + 4 *
> > > uint32_t for xen_ondemand = 11 uint32_t.  That means the old size is
> > > retained, int32_t turbo_enabled doesn't move and it's binary compatible.
> > >
> > > The out-of-context memcpy() in xc_get_cpufreq_para() now handles the
> > > copying of the fields removed there.
> > >
> > > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> > > Reviewed-by: Jan Beulich <jbeulich@suse.com>
> > > ---
> > > NOTE: Jan would like a toolside review / ack because:
> > >     Nevertheless I continue to be uncertain about all of this: Parts of
> > >     the struct can apparently go out of sync with the sysctl struct, but
> > >     other parts have to remain in sync without there being an
> > >     appropriate build-time check (checking merely sizes clearly isn't
> > >     enough). Therefore I'd really like to have a toolstack side review /
> > >     ack here as well.
> >
> > I wish we could just use "struct xen_get_cpufreq_para" instead of
> > having to make a copy to replace the XEN_GUEST_HANDLE_*() macro.
> >
> > Next I guess we could try to have something like the compat layer in xen
> > is doing, with plenty of CHECK_FIELD_ and other CHECK_* macro, but that
> > would be a lot of work. (xen/include/xen/compat.h and how it's used in
> > xen/include/compat/xlat.h)
> 
> I can add a set of BUILD_BUG_ON()s checking the offsets of the two
> structs' members.

Yes, that would be fine.

> I think that would work and we don't need the
> complication of the compat code.  The build of the library just deals
> with a single bit-width and needs to be consistent.  The hypervisor
> needs to deal with receiving differing pointer sizes and layouts, but
> the userspace library just uses whatever it was compiled for.  The
> preprocessor expands XEN_GUEST_HANDLE_64(uint32) -> "typedef struct {
> uint32_t *p; } __guest_handle_uint32", so it's just going to be a
> single pointer in size, which will match between the two.
> 
> Does that sound right, or am I missing something?

That sounds about right.

Thanks,

-- 
Anthony PERARD

