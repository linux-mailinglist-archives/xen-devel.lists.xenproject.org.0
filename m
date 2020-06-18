Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 920D31FF7F4
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 17:50:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlwnU-00010N-DM; Thu, 18 Jun 2020 15:49:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FPuN=77=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1jlwnT-00010E-G2
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 15:49:47 +0000
X-Inumbo-ID: 5592f40a-b17b-11ea-b7bb-bc764e2007e4
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5592f40a-b17b-11ea-b7bb-bc764e2007e4;
 Thu, 18 Jun 2020 15:49:46 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r7so6602284wro.1
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2020 08:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+DWoeFkopjjNX1PbX1m7YzEf1NbfIy2AI/0OrJadQp4=;
 b=kNjbbLFw4D7RVWzpqM5bEj4Ofjh4f94HgFK4Lt4YtGTcKDny1ugyb3tYKaoNCYg/wU
 ctutCbAVc2GqUTEOrbtIhGQ3v2j8VD50vsDfIaBfAKYjBjHFLnBSUP8chFs/onSJq6rl
 3qTenjqlWHYczvGc9Fx9IxTwKTfPAyBWMMJJXX8kf8RlExpnHFuEMo742vEMxyxfgepZ
 es5ah/nFDmfHTX5y8oro8rp+VBHRHO6cUOwNSPbL4tnhUzLOwptSa88aRmN8KbayXVce
 l+por2joOp6QJ/wwh3rOUsKcDksPZlJ1hwxwEls8DlWJsmt7Td68+M/vw3T+qT63Jy/7
 Y/cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+DWoeFkopjjNX1PbX1m7YzEf1NbfIy2AI/0OrJadQp4=;
 b=DTnijGxcN6tS7Lk0k4f5vXSMabNOQY0zeKFHvfmfESD+jLnv2/ycozzcg+Hjw3xx3L
 B+++s55H0i05gAH15tCd6sZq9D9jFygcIMvvoNvOa9Rj/SfoW8aoryMa7GC6NmXn1IR7
 XR61ypMvE7/8xe3s9uMv0bbbVO8CXZg3VNqUzJdA2lqQLBrtEqkGnbkTJXM4ZWn3HTrD
 VCrM8LqYmahSJK0YUbVZNcSIK564dQytL7JD6VGuQNVSFEGdY8drK6d8gcAZsXck3zDx
 uT5Xtd+IPsOdWDb4g7UJL3yxYO0+8r9EdL33Z/giJTAklN98ip4cLkqtSjRrXftpeaIU
 Tytg==
X-Gm-Message-State: AOAM533X/LvAM6CIGve7+11Up15pvZZdmrdkYwPPr5fCT6ovJtV5u4Z3
 OI1eaihY+Xb6lHi6OsETL7prrejtnCzAisWsSes=
X-Google-Smtp-Source: ABdhPJy6xrnztjHjy/7VPTjC89LXE7trX76wXLnB0zidbWIkw0GWWWxCh1ntuJjc9tlpIu9czTODWhogbvDjpUxkSj8=
X-Received: by 2002:a5d:490f:: with SMTP id x15mr5151188wrq.259.1592495385898; 
 Thu, 18 Jun 2020 08:49:45 -0700 (PDT)
MIME-Version: 1.0
References: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
 <34833328.8766172.1592320926648.JavaMail.zimbra@cert.pl>
 <20200616172352.GT735@Air-de-Roger>
 <1599209169.9756264.1592493912556.JavaMail.zimbra@cert.pl>
 <e2e873a3-6050-d4bf-f74c-ba31d7eef2f0@suse.com>
 <CABfawhk_Lx=An5BGO-pT=F3sk3dptpvkZ4dXed720sN4iAdKaQ@mail.gmail.com>
In-Reply-To: <CABfawhk_Lx=An5BGO-pT=F3sk3dptpvkZ4dXed720sN4iAdKaQ@mail.gmail.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Thu, 18 Jun 2020 09:49:10 -0600
Message-ID: <CABfawhmY+O8NtNTCwsA6FyZXS9nHJHE37A4Fx9+70BL1sXnJPA@mail.gmail.com>
Subject: Re: [PATCH v1 4/7] x86/vmx: add do_vmtrace_op
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?B?TWljaGHFgiBMZXN6Y3p5xYRza2k=?= <michal.leszczynski@cert.pl>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Jun 18, 2020 at 9:47 AM Tamas K Lengyel
<tamas.k.lengyel@gmail.com> wrote:
>
> On Thu, Jun 18, 2020 at 9:41 AM Jan Beulich <jbeulich@suse.com> wrote:
> >
> > On 18.06.2020 17:25, Micha=C5=82 Leszczy=C5=84ski wrote:
> > > ----- 16 cze 2020 o 19:23, Roger Pau Monn=C3=A9 roger.pau@citrix.com =
napisa=C5=82(a):
> > >> On Tue, Jun 16, 2020 at 05:22:06PM +0200, Micha=C5=82 Leszczy=C5=84s=
ki wrote:
> > >>> --- a/xen/include/public/hvm/hvm_op.h
> > >>> +++ b/xen/include/public/hvm/hvm_op.h
> > >>> @@ -382,6 +382,33 @@ struct xen_hvm_altp2m_op {
> > >>>  typedef struct xen_hvm_altp2m_op xen_hvm_altp2m_op_t;
> > >>>  DEFINE_XEN_GUEST_HANDLE(xen_hvm_altp2m_op_t);
> > >>>
> > >>> +/* HVMOP_vmtrace: Perform VM tracing related operation */
> > >>> +#define HVMOP_vmtrace 26
> > >>> +
> > >>> +#define HVMOP_VMTRACE_INTERFACE_VERSION 0x00000001
> > >>> +
> > >>> +struct xen_hvm_vmtrace_op {
> > >>> +    /* IN variable */
> > >>> +    uint32_t version;   /* HVMOP_VMTRACE_INTERFACE_VERSION */
> > >>> +    uint32_t cmd;
> > >>> +/* Enable/disable external vmtrace for given domain */
> > >>> +#define HVMOP_vmtrace_ipt_enable      1
> > >>> +#define HVMOP_vmtrace_ipt_disable     2
> > >>> +#define HVMOP_vmtrace_ipt_get_buf     3
> > >>> +#define HVMOP_vmtrace_ipt_get_offset  4
> > >>> +    domid_t domain;
> > >>
> > >> You are missing a padding field here AFAICT.
> > >
> > >
> > > Could you point out what is the purpose of this padding field and wha=
t should be the size in this case? It's pretty unclear to me.
> >
> > In the public interface we aim at making all padding explicit.
>
> Just to expand a bit on this: this is an ABI meaning the hypervisor
> and the tool sending this structure communicate via memory only. Since
> the hypervisor and the compiler can be compiled using different

   ^ meant to write "hypervisor and the toolstack" above

Tamas

