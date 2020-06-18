Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9D31FF289
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 15:01:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jluAM-0001W0-UU; Thu, 18 Jun 2020 13:01:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FPuN=77=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1jluAL-0001Vv-Us
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 13:01:14 +0000
X-Inumbo-ID: c96a3c0c-b163-11ea-b7bb-bc764e2007e4
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c96a3c0c-b163-11ea-b7bb-bc764e2007e4;
 Thu, 18 Jun 2020 13:01:13 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id b82so5117308wmb.1
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2020 06:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/BAcbHD+FNYqCmOTSTggIrjw3b8LA7HRlyFqGzv+6Qc=;
 b=a9qwrHfuMVjXURPsIJ8wGymBYG3Zsr39wMbZE8IxmRy0ZeZUnsa3kfzucHotGQr7uv
 hz4UdHucN6DQvs9QCOD6LVgtNzPUHM6mtBfwue0gaVd5D84INrSFnKVSzbzcSZDf1waE
 yEC07/cRIsFDC6DKgWhuHK+9yoW5HOfZdg4ozI9QdIICz0luyvXHeJa6Ivv8e1viKXaB
 sHhKzyAYiHQJOhkzFosX3EqVAwnuh6FNLSgpFXBpjOc3oHh0qVHUu0FjWR8T2ffrx16E
 gKg5B5bdbc9H+NnND2xWcbrkg3qLfYIP07Oer5Wbw+rDFEBfHISLTO9ATv3ZO/1twKE1
 7JXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/BAcbHD+FNYqCmOTSTggIrjw3b8LA7HRlyFqGzv+6Qc=;
 b=Twiavu4elMLI85a0LIz+BEWlEQrdByDDtrlc+EkbRSiFtJqVEqjAtA4eUvskjAZ1QB
 YCwjmMZKxuQ4HYTk7gUBHC5UjYrV4KRYA11BEDi6zgS4G7HkgZHIOZnfg1CBJjV9rcV3
 4HmAkqy8rPpZDWzCYQBNrNl/cDUUXNTcsZDIXrTLSh1pXHCg2Rom22zNAGmkxUAAMGtZ
 f9fb8cgr1nbWJeXgZNVqyuop3+Hazvm7uQ5/Re3ZENNrIrAcQtUeFTOGb1M2BxSZbE2i
 sg4+ouUP9b3/0Hq4MVcT8ttjABD2TRbpyWgp/NOZ9V6CR/5lrqwD+oOlHbn1tsu/976m
 cOTg==
X-Gm-Message-State: AOAM533B0JTIXX88vDasKzHKuZEzK+c9BiQpnWurbCiqOsxK7roMNCik
 ISPBhPXilPWc8+XV5EZBRxUYwHGv9ymCTN7TsXfwKsfx7Vo=
X-Google-Smtp-Source: ABdhPJxbWQfK/97nCEpBrBko87GdAvQRhOhWBDex74IKrrC71+WV1qdTJwJERZLs3QFIpf5QKuhgoDgfaksis73Jbyo=
X-Received: by 2002:a1c:1b13:: with SMTP id b19mr3868419wmb.84.1592485272336; 
 Thu, 18 Jun 2020 06:01:12 -0700 (PDT)
MIME-Version: 1.0
References: <3555e16baa9e1909dbefaaab04330694135c9021.1592410065.git.tamas.lengyel@intel.com>
 <d63e00e0-0097-c37e-ba9d-ac9340192dfb@suse.com>
 <CABfawhngJT0cFJfNxoa9H6qvPEF1nNO9m9PrrbRgQsA5Z0Jc6g@mail.gmail.com>
 <c9288d56-297d-dc1f-0e99-6537d82b393c@suse.com>
 <20200618125205.GO735@Air-de-Roger>
In-Reply-To: <20200618125205.GO735@Air-de-Roger>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Thu, 18 Jun 2020 07:00:37 -0600
Message-ID: <CABfawhn5gtFpDoLM16zAF3Sx0QagSs0xjzMauVhBptEraFLRAQ@mail.gmail.com>
Subject: Re: [PATCH v2 for-4.14] x86/vmx: use P2M_ALLOC in vmx_load_pdptrs
 instead of P2M_UNSHARE
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
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
 Tamas K Lengyel <tamas.lengyel@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Jun 18, 2020 at 6:52 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com>=
 wrote:
>
> On Thu, Jun 18, 2020 at 02:46:24PM +0200, Jan Beulich wrote:
> > On 18.06.2020 14:39, Tamas K Lengyel wrote:
> > > On Thu, Jun 18, 2020 at 12:31 AM Jan Beulich <jbeulich@suse.com> wrot=
e:
> > >>
> > >> On 17.06.2020 18:19, Tamas K Lengyel wrote:
> > >>> While forking VMs running a small RTOS system (Zephyr) a Xen crash =
has been
> > >>> observed due to a mm-lock order violation while copying the HVM CPU=
 context
> > >>> from the parent. This issue has been identified to be due to
> > >>> hap_update_paging_modes first getting a lock on the gfn using get_g=
fn. This
> > >>> call also creates a shared entry in the fork's memory map for the c=
r3 gfn. The
> > >>> function later calls hap_update_cr3 while holding the paging_lock, =
which
> > >>> results in the lock-order violation in vmx_load_pdptrs when it trie=
s to unshare
> > >>> the above entry when it grabs the page with the P2M_UNSHARE flag se=
t.
> > >>>
> > >>> Since vmx_load_pdptrs only reads from the page its usage of P2M_UNS=
HARE was
> > >>> unnecessary to start with. Using P2M_ALLOC is the appropriate flag =
to ensure
> > >>> the p2m is properly populated and to avoid the lock-order violation=
 we
> > >>> observed.
> > >>
> > >> Using P2M_ALLOC is not going to address the original problem though
> > >> afaict: You may hit the mem_sharing_fork_page() path that way, and
> > >> via nominate_page() =3D> __grab_shared_page() =3D> mem_sharing_page_=
lock()
> > >> you'd run into a lock order violation again.
> > >
> > > Note that the nominate_page you see in that path is for the parent VM=
.
> > > The paging lock is not taken for the parent VM thus nominate_page
> > > succeeds without any issues any time fork_page is called. There is no
> > > nominate_page called for the client domain as there is nothing to
> > > nominate when plugging a hole.
> >
> > But that's still a lock order issue then, isn't it? Just one that
> > the machinery can't detect / assert upon.
>
> Yes, mm lock ordering doesn't differentiate between domains, and the
> current lock order on the pCPU is based on the last lock taken
> (regardless of the domain it belongs to).

I see, makes sense. In that case the issue is avoided purely due to
get_gfn being called that happens before the paging_lock is taken.
That would have to be the way-to-go on other paths leading to
vmx_load_pdptrs as well but since all other paths leading there do it
without the paging lock being taken there aren't any more adjustments
necessary right now that I can see.

Tamas

