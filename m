Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 861141CF9BF
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2020 17:53:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYXCy-00011Z-59; Tue, 12 May 2020 15:52:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rfNj=62=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jYXCw-00011U-VZ
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 15:52:39 +0000
X-Inumbo-ID: 9a465e82-9468-11ea-b9cf-bc764e2007e4
Received: from mail-lf1-x129.google.com (unknown [2a00:1450:4864:20::129])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9a465e82-9468-11ea-b9cf-bc764e2007e4;
 Tue, 12 May 2020 15:52:38 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id a4so10979626lfh.12
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2020 08:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Rw2zspztliujrBSlCejt1mULr8uYRGTb7Bs3TU+w8Z4=;
 b=DlzrmPO/lXQL8s3PQpz9yZUQ/kMmbfebLxIQtdayfZTmfrJq2ziKiDUmj3vgv0160E
 cjthc958h06SS/n5GCmfGiFTyCAmwFQGngGmYQmLTLGsC/J6y2/2a0ocv0QLs3zfa+fh
 KMN9FoQZYqNS63xZBya4f556kej/aDiOogIlpAJleO6+iEtNzCnrin8k0JLP0rC9xoWi
 Eqz9gKKq/7CeVuSU6036v5ZRKwlUzj6VJQDVTrokuj5mN/2lm/t/LM9nW+lOqVtgOJ9S
 UHvdUPfE4PeGnuxupSaM8zUKIto7u29YZnJPRgIMz+duGInRW/mUTf03yZU5KZ0o1HvO
 /RKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rw2zspztliujrBSlCejt1mULr8uYRGTb7Bs3TU+w8Z4=;
 b=KzWbDL69J8vll3Zq9uyedVYCuF4GeffkMsdRc5mERH9K+a1ODQV3QzVGYNI+jNch0T
 HuaB87voeMKT/h1kJXiCWVSM0ShqBB/H6T4cs8yMBX0qgeg04dD+u05PRQUmIr21tK/w
 AOFB284LpJ1ec5JQlQ4c2iQpc4DKS9zo2McTkoNsvRMEklYUpWC1n4/GxzBiqO+vpPg6
 CFlyjO0+fKRGy4WjN/aiRc1pjedhKdBP8IglTwU6QmbDirAETO/bXE9DTgLatwj7TbFB
 lywf2ICfXOU/f1HOC118/CWspw/dX/fEoBj+A4tjhaX3917nUmJcMaltBFK9sHy3AM1M
 fBPA==
X-Gm-Message-State: AOAM530M4dzILmH5Hdlq3Szrnt2BOp/myB6RdpOCWMW5w3s0toIasYpC
 3sMoXeiFgspP/kuLRznSlOzemZKABRPzr+Zoti4=
X-Google-Smtp-Source: ABdhPJxqQtqYiVUb1/vgFN7Zs7KiVWVWysMEQmDL+qno6j0+R718FBCMjY6VyN2yLopkBC8YxUCD5AFxrxIPXz4dVXE=
X-Received: by 2002:a19:e041:: with SMTP id g1mr14519604lfj.70.1589298756903; 
 Tue, 12 May 2020 08:52:36 -0700 (PDT)
MIME-Version: 1.0
References: <3bfd6384-fcaf-c74a-e560-a35aafa06a43@suse.com>
 <20200512141947.yqx4gmbvqs4grx5g@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
 <fa507eab-547a-c0fb-9620-825aba5f55b2@suse.com>
 <4b90b635-84bb-e827-d52e-dfe1ebdb4e4d@citrix.com>
 <814db557-4f6a-020d-9f71-4ee3724981e3@suse.com>
In-Reply-To: <814db557-4f6a-020d-9f71-4ee3724981e3@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 12 May 2020 11:52:25 -0400
Message-ID: <CAKf6xps0XDRTUJsbE1zHpn=h98yTN+Y1DzaNpVGzhhJGVccRRw@mail.gmail.com>
Subject: Re: use of "stat -"
To: Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, May 12, 2020 at 10:59 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 12.05.2020 16:47, Andrew Cooper wrote:
> > On 12/05/2020 15:33, Jan Beulich wrote:
> >> On 12.05.2020 16:19, Wei Liu wrote:
> >>> On Tue, May 12, 2020 at 12:58:46PM +0200, Jan Beulich wrote:
> >>>> now that I've been able to do a little bit of work from the office
> >>>> again, I've run into a regression from b72682c602b8 "scripts: Use
> >>>> stat to check lock claim". On one of my older machines I've noticed
> >>>> guests wouldn't launch anymore, which I've tracked down to the
> >>>> system having an old stat on it. Yes, the commit says the needed
> >>>> behavior has been available since 2009, but please let's not forget
> >>>> that we continue to support building with tool chains from about
> >>>> 2007.

Sorry for regressing your old system setup.  Out of curiosity, what OS
version are you using?

> >>>> Putting in place and using newer tool chain versions without
> >>>> touching the base distro is pretty straightforward. Replacing the
> >>>> coreutils package isn't, and there's not even an override available
> >>>> by which one could point at an alternative one. Hence I think
> >>>> bumping the minimum required versions of basic tools should be
> >>>> done even more carefully than bumping required tool chain versions
> >>>> (which we've not dared to do in years). After having things
> >>>> successfully working again with a full revert, I'm now going to
> >>>> experiment with adapting behavior to stat's capabilities. Would
> >>>> something like that be acceptable (if it works out)?
> >>> Are you asking for reverting that patch?
> >> Well, I assume the patch has its merits, even if I don't really
> >> understand what they are from its description.
> >
> > What is in any away unclear about the final paragraph in the commit message?
>
> This being the last sentence instead of the first (or even the
> subject) makes it look like this is a nice side effect, not
> like this was the goal of the change.

I see how the motivation wasn't conveyed properly in the commit
message.  It was captured in the cover letter, but that doesn't make
it into the repo. :(

> >> I'm instead asking
> >> whether something like the below (meanwhile tested) would be
> >> acceptable.
> >
> > Not really, seeing as removing perl was the whole point.
>
> The suggested change doesn't re-introduce a runtime dependency on
> Perl, _except_ on very old systems.

Yes, the runtime detection looks okay.  However, Ian may not like
testing `stat -` since he previously disliked the extra overhead of
calling sed.

v1 of the patchset created a dedicated C utility, but Ian preferred
using stat(1).

Qubes uses a different approach to remove perl to bypass stat-ing the
FD.  "Use plain flock on open FD. This makes the locking mechanism not
tolerate removing the lock file once created."
https://github.com/QubesOS/qubes-vmm-xen/blob/xen-4.13/patch-tools-hotplug-drop-perl-usage-in-locking-mechanism.patch
 So they have lockfiles persist even when no process holds the lock.

I was just looking to remove perl since it's a large dependency for
this single use.  I'm not tied to a particular approach.

Regards,
Jason

