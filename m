Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F491FF32C
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 15:35:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jluhE-0004PU-Mq; Thu, 18 Jun 2020 13:35:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FPuN=77=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1jluhD-0004PN-78
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 13:35:11 +0000
X-Inumbo-ID: 87c76298-b168-11ea-bca7-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 87c76298-b168-11ea-bca7-bc764e2007e4;
 Thu, 18 Jun 2020 13:35:10 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id c3so6051286wru.12
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2020 06:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PgU7W2ZEDR8G3GYE3WyiZ0cSbfQREU9R2sTXUYCmOWE=;
 b=aDT75fKfc8y05/WXaHkV7n6rDQyhyUYVOHTG3MSWmHwCmWta4YLHlffJodsTMBV9Ph
 GqIL2vz9vh27obm0XPMCW2MRxMTwwNtajyzWUNFBFcC6LutwABGSV7HymmRBYpG44h30
 A6x/A7/tqjs1uNWQ0cAsFCGlGmDLl3zoJLfgJV8Ckl21ochFBAmooiZW805vmIjBFy02
 xsVaG4wIMGANDkcV5cGDxXgEeyC4JTZXpnusXpFxPe/FjVDlclxAoOE8/iuNzfVqBXuk
 skMhEmCU4T7H8VlrwPJFJVmCUSQN6TVJA5t4vWfWLlFtcYOnhvWs2AS1imwH21mWQZgT
 cxzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PgU7W2ZEDR8G3GYE3WyiZ0cSbfQREU9R2sTXUYCmOWE=;
 b=rfplPNphiKP0pz+BnjAlfi9/V+U38BzqiHqrfO6DWHDc3xqUK+wxvEd3Daizb600Rv
 g+nQ4kLr6g1aFh+15mqDUOPo7sk1w74Gcpndgy7qRrgcjDF1wMZCcUW3tRZv2xmmLqUE
 jcRg6i7ism9Ex9FnHqJBBWx8PazPvlEfupEpjXoVu/s001OJ0nCI0ahrIbcPFxai7lmu
 Scr9CZrkKhycgTz4kgQbOGcgwajI5BcOMODdTfHNbAFISz7V+5C93YvTFxylZUisQ55K
 8jSnSIFePpXO1b2Zwt3kK6wnblNt/AtLDAhO3AVGRMbT7SHYuncHyEi6FuUP6nVH8qQm
 g0XQ==
X-Gm-Message-State: AOAM530VSEgnLAjCgqAbntI2UqdRzvKpQx8z1gpWSFwazPW00wJfDlIY
 fU61G1L8QWgZbGijx6vNKGPcTWZ3bYL5fBB9NyI=
X-Google-Smtp-Source: ABdhPJy+xNr1SKrJ2FJ8JLX6h0Q5JyhpIM+GFVJ+ZbWA6RDtumN9h0U/YCGf5dwmiguivgXwiK6oAMhhLgBNptU/ips=
X-Received: by 2002:a5d:6809:: with SMTP id w9mr4944689wru.182.1592487309702; 
 Thu, 18 Jun 2020 06:35:09 -0700 (PDT)
MIME-Version: 1.0
References: <3555e16baa9e1909dbefaaab04330694135c9021.1592410065.git.tamas.lengyel@intel.com>
 <d63e00e0-0097-c37e-ba9d-ac9340192dfb@suse.com>
 <CABfawhngJT0cFJfNxoa9H6qvPEF1nNO9m9PrrbRgQsA5Z0Jc6g@mail.gmail.com>
 <c9288d56-297d-dc1f-0e99-6537d82b393c@suse.com>
 <20200618125205.GO735@Air-de-Roger>
 <CABfawhn5gtFpDoLM16zAF3Sx0QagSs0xjzMauVhBptEraFLRAQ@mail.gmail.com>
 <e936d7a1-e661-24d0-3dd1-28eb2a3f4da0@suse.com>
In-Reply-To: <e936d7a1-e661-24d0-3dd1-28eb2a3f4da0@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Thu, 18 Jun 2020 07:34:34 -0600
Message-ID: <CABfawhkHsYN55=yjhxB60xYKjHTRpX1nhOSkqv4tV6R8y+4SmA@mail.gmail.com>
Subject: Re: [PATCH v2 for-4.14] x86/vmx: use P2M_ALLOC in vmx_load_pdptrs
 instead of P2M_UNSHARE
To: Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Jun 18, 2020 at 7:26 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 18.06.2020 15:00, Tamas K Lengyel wrote:
> > On Thu, Jun 18, 2020 at 6:52 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.=
com> wrote:
> >>
> >> On Thu, Jun 18, 2020 at 02:46:24PM +0200, Jan Beulich wrote:
> >>> On 18.06.2020 14:39, Tamas K Lengyel wrote:
> >>>> On Thu, Jun 18, 2020 at 12:31 AM Jan Beulich <jbeulich@suse.com> wro=
te:
> >>>>>
> >>>>> On 17.06.2020 18:19, Tamas K Lengyel wrote:
> >>>>>> While forking VMs running a small RTOS system (Zephyr) a Xen crash=
 has been
> >>>>>> observed due to a mm-lock order violation while copying the HVM CP=
U context
> >>>>>> from the parent. This issue has been identified to be due to
> >>>>>> hap_update_paging_modes first getting a lock on the gfn using get_=
gfn. This
> >>>>>> call also creates a shared entry in the fork's memory map for the =
cr3 gfn. The
> >>>>>> function later calls hap_update_cr3 while holding the paging_lock,=
 which
> >>>>>> results in the lock-order violation in vmx_load_pdptrs when it tri=
es to unshare
> >>>>>> the above entry when it grabs the page with the P2M_UNSHARE flag s=
et.
> >>>>>>
> >>>>>> Since vmx_load_pdptrs only reads from the page its usage of P2M_UN=
SHARE was
> >>>>>> unnecessary to start with. Using P2M_ALLOC is the appropriate flag=
 to ensure
> >>>>>> the p2m is properly populated and to avoid the lock-order violatio=
n we
> >>>>>> observed.
> >>>>>
> >>>>> Using P2M_ALLOC is not going to address the original problem though
> >>>>> afaict: You may hit the mem_sharing_fork_page() path that way, and
> >>>>> via nominate_page() =3D> __grab_shared_page() =3D> mem_sharing_page=
_lock()
> >>>>> you'd run into a lock order violation again.
> >>>>
> >>>> Note that the nominate_page you see in that path is for the parent V=
M.
> >>>> The paging lock is not taken for the parent VM thus nominate_page
> >>>> succeeds without any issues any time fork_page is called. There is n=
o
> >>>> nominate_page called for the client domain as there is nothing to
> >>>> nominate when plugging a hole.
> >>>
> >>> But that's still a lock order issue then, isn't it? Just one that
> >>> the machinery can't detect / assert upon.
> >>
> >> Yes, mm lock ordering doesn't differentiate between domains, and the
> >> current lock order on the pCPU is based on the last lock taken
> >> (regardless of the domain it belongs to).
> >
> > I see, makes sense. In that case the issue is avoided purely due to
> > get_gfn being called that happens before the paging_lock is taken.
> > That would have to be the way-to-go on other paths leading to
> > vmx_load_pdptrs as well but since all other paths leading there do it
> > without the paging lock being taken there aren't any more adjustments
> > necessary right now that I can see.
>
> If this is indeed the case, then I guess all that's needed is a further
> extended / refined commit message in v3.

Alright.

Thanks,
Tamas

