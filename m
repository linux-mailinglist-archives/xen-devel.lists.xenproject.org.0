Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE701EBCB1
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 15:10:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg6gq-00058n-AD; Tue, 02 Jun 2020 13:10:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sr0K=7P=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jg6go-00058d-LE
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 13:10:46 +0000
X-Inumbo-ID: 78445cb0-a4d2-11ea-8993-bc764e2007e4
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 78445cb0-a4d2-11ea-8993-bc764e2007e4;
 Tue, 02 Jun 2020 13:10:46 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id k19so10011428edv.9
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2020 06:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fh1MChi4ucV0aKbtrjKRJQeQqvw0jax4gFsFyQpw5wo=;
 b=o4VCA6Z6cQjY+4Fu8+4LnJlrzSiNCqW4PWTyKlInMymg3r+5askL3jrX/yEgj73iUI
 zWUCcSnpzkoDCbPf5Fz+uVUFsmUyYMlblia7PNcn86c+5fLF7UBB1DS5wj0CQjPqgQBD
 8E6lx9LheX99M5SefzMstyux/BnXvbH7f7PT6r/78mBvBNTdZv4OB+4TcR6cjUSdOiTw
 0kgG81fz35iKjqXlcvuU1vDZrMwNeMqXKJv27I3mbq7gOjQ0XhR5x3d3zksb0qKRdLcJ
 kOVbtGPmKjIzWnwqNbGSs4yjzKdY+7YKznpI/+dyGQbRnOrT2VNJ0RkBZr2XIWUQD645
 wzRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fh1MChi4ucV0aKbtrjKRJQeQqvw0jax4gFsFyQpw5wo=;
 b=g+bzGQgFaBWZrJA9SrDMVffrHxdecCO+z1Xa92wOeViAJki4DDWN0gJ6hcV+DIwRe9
 5QIZk+CoX9vwl1+K+dmObstSzAXGVf/+Q9Ap3pezxiJAaxFpr+Ekbmlg3152mHmuBeTV
 G+HGcLM1AAghGLv9aIxlMPbwHKclV+Htygrw33P1yefSl/VvgyaxfsYGvtKboQC8JL9D
 UEbqS7KqJOlUU4dZ3jPyDcb4TrXKC6RR/03cXOsI3Zc/Cj1NtreLm2ISschDRgVgCzsX
 YcpVBqR34Br0WHnWcSf2i8KpCRRDmSFI3KUR8SiBeqG1GT6mSpO6ztlFNaFx0lWi2rrb
 1foQ==
X-Gm-Message-State: AOAM530JbG/1Z29NhlE8WmqXwELzubDv9IVMntkX9XmOMwsr48B0npvZ
 CVGCh/ijhAoo5lBm52B7P7AsWcRVK14=
X-Google-Smtp-Source: ABdhPJzjQX4CGB30tzJgq7PlowZEqxaBkH2/tr0S6isMimsdh52oPF7OohzhzfZRarDlSWCiSqfD0w==
X-Received: by 2002:aa7:d613:: with SMTP id c19mr13542036edr.321.1591103444849; 
 Tue, 02 Jun 2020 06:10:44 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com.
 [209.85.128.42])
 by smtp.gmail.com with ESMTPSA id z3sm1659543ejl.38.2020.06.02.06.10.44
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2020 06:10:44 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id c71so2860705wmd.5
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2020 06:10:44 -0700 (PDT)
X-Received: by 2002:a1c:1b13:: with SMTP id b19mr4019032wmb.84.1591103443840; 
 Tue, 02 Jun 2020 06:10:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1590028160.git.tamas@tklengyel.com>
 <b3c147cc226f3a30daec73b2ffd57bd285bc8659.1590028160.git.tamas@tklengyel.com>
 <20200602110223.GW1195@Air-de-Roger>
 <CABfawh=NST0Vq+O5UCqyCxt1z2O9pcES_DQon4-cs9w0TPOuJQ@mail.gmail.com>
 <a9256e7a-b11f-cd45-7d8c-a72cfca4ddab@suse.com>
 <CABfawhkneOTsVE3nD41_F3u3Jihf8kk8N9eFHMP9znGUnugvsw@mail.gmail.com>
 <c7091857-2613-303e-416e-a4778278e428@suse.com>
In-Reply-To: <c7091857-2613-303e-416e-a4778278e428@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 2 Jun 2020 07:10:07 -0600
X-Gmail-Original-Message-ID: <CABfawhkB1u2M8RCO0v8uwsur4ZUSThwy_1Uhj=k0UjUdyNZi3Q@mail.gmail.com>
Message-ID: <CABfawhkB1u2M8RCO0v8uwsur4ZUSThwy_1Uhj=k0UjUdyNZi3Q@mail.gmail.com>
Subject: Re: [PATCH v2 for-4.14 1/3] xen/monitor: Control register values
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jun 2, 2020 at 7:00 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 02.06.2020 14:51, Tamas K Lengyel wrote:
> > On Tue, Jun 2, 2020 at 6:47 AM Jan Beulich <jbeulich@suse.com> wrote:
> >>
> >> On 02.06.2020 14:40, Tamas K Lengyel wrote:
> >>> On Tue, Jun 2, 2020 at 5:08 AM Roger Pau Monn=C3=A9 <roger.pau@citrix=
.com> wrote:
> >>>>
> >>>> On Wed, May 20, 2020 at 08:31:52PM -0600, Tamas K Lengyel wrote:
> >>>>> Extend the monitor_op domctl to include option that enables
> >>>>> controlling what values certain registers are permitted to hold
> >>>>> by a monitor subscriber.
> >>>>
> >>>> I think the change could benefit for some more detail commit message
> >>>> here. Why is this useful?
> >>>
> >>> You would have to ask the Bitdefender folks who made the feature. I
> >>> don't use it. Here we are just making it optional as it is buggy so i=
t
> >>> is disabled by default.
> >>
> >> Now that's exactly the opposite of what I had derived from the
> >> description here so far. Perhaps an at least weak indication
> >> that you want to reword this. For example, from your reply to
> >> Roger I understand it's rather that the new flag allows to
> >> "suppress" the controlling (since presumably you don't change
> >> default behavior), rather then "enabling" it.
> >
> > What we are adding is a domctl you need to call that enables this
> > feature. It's not an option to suppress it. It shouldn't have been
> > enabled by default to begin with. That was a mistake when the feature
> > was contributed and it is buggy.
>
> Okay, in this case it's important to point out that you alter
> default behavior. The BitDefender folks may not like this, yet
> they've been surprisingly silent so far.

Well, it was Bitdefender who altered the default behavior. We are
reverting their mistake and making it optional. But I can certainly
make that more clear.

Tamas

