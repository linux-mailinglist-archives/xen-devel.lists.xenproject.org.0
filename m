Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E52D1B73BF
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 14:19:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRxIQ-0000dv-52; Fri, 24 Apr 2020 12:19:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/kKc=6I=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jRxIN-0000dq-UR
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 12:19:04 +0000
X-Inumbo-ID: c869db64-8625-11ea-83d8-bc764e2007e4
Received: from mail-ej1-x642.google.com (unknown [2a00:1450:4864:20::642])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c869db64-8625-11ea-83d8-bc764e2007e4;
 Fri, 24 Apr 2020 12:19:02 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id pg17so7335577ejb.9
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2020 05:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JAJKRNHFYZNqCPq3DrKNArnvYAdOjpI95Zy9oVEFu1c=;
 b=rwt6IbtzTQ0l/zzTihFF20Pd0SwAdYeEuGKMlZK46BFjVGRVyfa1MMUz2FsSlsSatf
 9dXb1gy76FVkcoDF2RKK0B5+hFy/26W9EWTA62UQZG93bwK+FQpADbI/urcdxfK8UePu
 8SDRRlVBLkgs2OxsqzUhVY7FxYdoPSzJ+UUQssFBDKZyzfllfbgKwVGtOw3Rrnxoaem7
 T00aMWqRBgyiFK4qUfxjJo6XYclk9hI64ByR7g9jHyq1R++f5Tlfm7t1m/rQ82QN57pX
 1/ftuSjvc3ihXCi2z3i9mPYwRyhYv3TcgmLJQfUs58Qp0Wembr8Sioy4rl1kqYiZq/mA
 UstQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JAJKRNHFYZNqCPq3DrKNArnvYAdOjpI95Zy9oVEFu1c=;
 b=W2nKKjka4roWLQ1Q4LOoQcaZOIbfT0YZEzEahnyaBACjPFZ2eS3HZz6z8aT94wRcvl
 6r+UtSQdxTYU4nMpeYT6cIbAwwaExuR1WknBDo8u7i8N8VIZh+ZdpxuLJe0yxhxKW1+a
 5mfkU3j1iDp4WlnmzCJjReZ3OedDgL8peSdsrbNXsvU2R7VqC8g4f8ytCfdxRvnT2NEN
 oflDPzUA6dJUf5GTAJZfaKw6oSakkPkYCivfy4hS4YMsAHaC8O/wGEZ0tv3AjAOEQRa7
 Kfnf0Ta7t9wpgdzqmZUdP5UlqTyyf9hhOHtlzz32I/ceKINRpt9YU6an65vVbmVtjigs
 baMQ==
X-Gm-Message-State: AGi0PubhCYb+VAQXnoI3sEWdK5lMSI+dIE1aTmm/wXRidlVoZzlL/mCb
 a0sMiTv8rXWYMZxjUY0zvf6PBeD2+tE=
X-Google-Smtp-Source: APiQypKjHenzEhnzFwASOmXyMd1MC9lmOwIlxCDVcEeHo71z91HapkQ9PAMbYOwl0FZGzhhITIwOdA==
X-Received: by 2002:a17:906:ce49:: with SMTP id
 se9mr3550709ejb.345.1587730741595; 
 Fri, 24 Apr 2020 05:19:01 -0700 (PDT)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com.
 [209.85.221.52])
 by smtp.gmail.com with ESMTPSA id i19sm535017edy.28.2020.04.24.05.19.00
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Apr 2020 05:19:01 -0700 (PDT)
Received: by mail-wr1-f52.google.com with SMTP id g13so10522110wrb.8
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2020 05:19:00 -0700 (PDT)
X-Received: by 2002:a05:6000:4:: with SMTP id
 h4mr11174537wrx.386.1587730740656; 
 Fri, 24 Apr 2020 05:19:00 -0700 (PDT)
MIME-Version: 1.0
References: <70ea4889e30ed35760329331ddfeb279fcd80786.1587655725.git.tamas.lengyel@intel.com>
 <20200424094343.GH28601@Air-de-Roger>
In-Reply-To: <20200424094343.GH28601@Air-de-Roger>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 24 Apr 2020 06:18:24 -0600
X-Gmail-Original-Message-ID: <CABfawhnRhLJ0AKjTKBx7snEOHBX5oJ2KrwbscQk=e7qXHFD3mA@mail.gmail.com>
Message-ID: <CABfawhnRhLJ0AKjTKBx7snEOHBX5oJ2KrwbscQk=e7qXHFD3mA@mail.gmail.com>
Subject: Re: [PATCH v17 1/2] mem_sharing: fix sharability check during fork
 reset
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
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Apr 24, 2020 at 3:44 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com>=
 wrote:
>
> On Thu, Apr 23, 2020 at 08:30:06AM -0700, Tamas K Lengyel wrote:
> > When resetting a VM fork we ought to only remove pages that were alloca=
ted for
> > the fork during it's execution and the contents copied over from the pa=
rent.
> > This can be determined if the page is sharable as special pages used by=
 the
> > fork for other purposes will not pass this test. Unfortunately during t=
he fork
> > reset loop we only partially check whether that's the case. A page's ty=
pe may
> > indicate it is sharable (pass p2m_is_sharable) but that's not a suffici=
ent
> > check by itself. All checks that are normally performed before a page i=
s
> > converted to the sharable type need to be performed to avoid removing p=
ages
> > from the p2m that may be used for other purposes. For example, currentl=
y the
> > reset loop also removes the vcpu info pages from the p2m, potentially p=
utting
> > the guest into infinite page-fault loops.
> >
> > Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
>
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks!

>
> I've been looking however and I'm not able to spot where you copy the
> shared_info data, which I think it's also quite critical for the
> domain, as it contains the info about event channels (when using L2).
> Also for HVM forks the shared info should be mapped at the same gfn as
> the parent, or else the child trying to access it will trigger an EPT
> fault that won't be able to populate such gfn, because the shared_info
> on the parent is already shared between Xen and the parent.

Pages that cause an EPT fault but can't be made shared get a new page
allocated for them and copied in mem_sharing_fork_page. There are many
pages like that, mostly due to QEMU mapping them and thus holding an
extra reference. That said, shared_info is manually copied during
forking in copy_special_pages, at the end of the function you will
find:

old_mfn =3D _mfn(virt_to_mfn(d->shared_info));
new_mfn =3D _mfn(virt_to_mfn(cd->shared_info));

copy_domain_page(new_mfn, old_mfn);

Cheers,
Tamas

