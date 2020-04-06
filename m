Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 220C519FB9E
	for <lists+xen-devel@lfdr.de>; Mon,  6 Apr 2020 19:31:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLVbB-0001EI-Aq; Mon, 06 Apr 2020 17:31:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=t1eN=5W=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1jLVb9-0001ED-Vq
 for xen-devel@lists.xen.org; Mon, 06 Apr 2020 17:31:48 +0000
X-Inumbo-ID: 7d90057a-782c-11ea-9e09-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7d90057a-782c-11ea-9e09-bc764e2007e4;
 Mon, 06 Apr 2020 17:31:47 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id j19so166986wmi.2
 for <xen-devel@lists.xen.org>; Mon, 06 Apr 2020 10:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QtQEmnvIRNjTWAGtotK8vr5aL1WEPMTRa/UAOoQ/pSk=;
 b=q7Vu5MbnAyAdq/X/v95seSyLeDOQk8rxYf+a67Xnw4wEm5iwv2I9i+vchjZoNsEHgD
 du9Y9hb9L/kmiuRzQaWSv2efPtKcOoTFKkuVfmzR4uFlEHCVI3geAXV/w/G7F7Nr+yax
 U5FSg0SxRBKqOQhmPv/MoQxkm9nRYLlYhfgCFO0UDFKkLA+aRro7pRIbqxASFisOATFh
 0yNIeDS7PY7mYo4r+ZHcSgJcZtY6sbKvTcQ/GSrtkiCmZh0EVubXhadxbImZoxKfB44c
 qdDTY2AUETLxAWoincuEiBYClnfsjOg2BnKQigVyOgByxLgiDzJJ+BXHb6uzqQyHGI/2
 ZQOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QtQEmnvIRNjTWAGtotK8vr5aL1WEPMTRa/UAOoQ/pSk=;
 b=ATXo26cFknS9/jxheynSbV/DGAbt6w14G4B/zr9lBdf+X6gjubRFdu3ixxkP8/SFOa
 1p9hF/j7PAukkwjmADJU0/D28BbSdDvyG9KbhccCuPLoeFTm1DdRcWhODP2MG142t+m6
 Hk/HpYbwQxBU/0RyJq3JSVjc4MVcmipve3BfHmkNTMo3jqlGnEyD+ZnNEVhnbpwclws+
 DHkM5JJ1VJEOCb1FuMq/V3bFgSyC7YZMuU++gXiwU5M/KltwGviOdIW+oiqkT3rgbSbB
 pL37Ys/2dVwTKuKaMoFfZgVCk64TD0vlxAFSmZCHYc6wSxMwhiSGyJ0Ipb3XqwSh8loD
 202g==
X-Gm-Message-State: AGi0PuYCN5niYOOmx5mvpcuhXdXBuVyw5EJn9czqdWcfP4cLH9JLGLrx
 r11QQMtGc8k3VvBYFKtSXhpq2pKEvSmKSzkr004=
X-Google-Smtp-Source: APiQypIbzVcQhtuKPx/sWYXqksN+tCLZDAk0hzlSjQiNX5GtwWG/GDjtfexjX56TkPBmMZS9LXKn4lmLqLhrYWNb/MQ=
X-Received: by 2002:a7b:c842:: with SMTP id c2mr457489wml.154.1586194306477;
 Mon, 06 Apr 2020 10:31:46 -0700 (PDT)
MIME-Version: 1.0
References: <CABB6KG-UCdPTa3yM57JB13G=Yebe8chuQKvKkNbtoGRSZ9Ypsw@mail.gmail.com>
 <a8c56ab0-bc51-fa1c-c63f-cb9ada8a1823@citrix.com>
 <CABfawhn_hw=o5j+G9VfqPK6opytqt=q2-cz4GjNgCTA5zBvNrA@mail.gmail.com>
 <6bb7eb58-01c6-00e4-672e-83d5fcb87ea0@citrix.com>
In-Reply-To: <6bb7eb58-01c6-00e4-672e-83d5fcb87ea0@citrix.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Mon, 6 Apr 2020 11:31:10 -0600
Message-ID: <CABfawh=6z-pxgrj1M3JbG-9H=iR78rTwt8+MUf_6-Sd5kqyhdA@mail.gmail.com>
Subject: Re: Live migration and PV device handling
To: Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xen.org>,
 Anastassios Nanos <anastassios.nanos@sunlight.io>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Apr 6, 2020 at 11:24 AM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> On 06/04/2020 18:16, Tamas K Lengyel wrote:
> > On Fri, Apr 3, 2020 at 6:44 AM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
> >> On 03/04/2020 13:32, Anastassios Nanos wrote:
> >>> Hi all,
> >>>
> >>> I am trying to understand how live-migration happens in xen. I am
> >>> looking in the HVM guest case and I have dug into the relevant parts
> >>> of the toolstack and the hypervisor regarding memory, vCPU context
> >>> etc.
> >>>
> >>> In particular, I am interested in how PV device migration happens. I
> >>> assume that the guest is not aware of any suspend/resume operations
> >>> being done
> >> Sadly, this assumption is not correct.  HVM guests with PV drivers
> >> currently have to be aware in exactly the same way as PV guests.
> >>
> >> Work is in progress to try and address this.  See
> >> https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=775a02452ddf3a6889690de90b1a94eb29c3c732
> >> (sorry - for some reason that doc isn't being rendered properly in
> >> https://xenbits.xen.org/docs/ )
> > That proposal is very interesting - first time it came across my radar
> > - but I dislike the idea that domain IDs need to be preserved for
> > uncooperative migration to work.
>
> The above restriction is necessary to work with existing guests, which
> is an implementation requirement of the folks driving the work.
>
> > Ideally I would be able to take
> > advantage of the same plumbing to perform forking of VMs with PV
> > drivers where preserving the domain id is impossible since its still
> > in use.
>
> We would of course like to make changes to remove the above restriction
> in the longterm.  The problem is that it is not a trivial thing to fix.
> Various things were discussed in Chicago, but I don't recall if any of
> the plans made their way onto xen-devel.

Yea I imagine trying to get this to work with existing PV drivers is
not possible in any other way. But if we can update the PV driver code
such that in the longterm it can work without preserving the domain
ID, that would be worthwhile.

Tamas

