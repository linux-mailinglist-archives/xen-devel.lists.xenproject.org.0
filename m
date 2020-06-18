Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BECE61FFE59
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 00:50:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jm3Lr-0004di-8Q; Thu, 18 Jun 2020 22:49:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UxAD=77=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jm3Lp-0004dd-QO
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 22:49:41 +0000
X-Inumbo-ID: fe4461c6-b1b5-11ea-bb8b-bc764e2007e4
Received: from mail-wm1-x331.google.com (unknown [2a00:1450:4864:20::331])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fe4461c6-b1b5-11ea-bb8b-bc764e2007e4;
 Thu, 18 Jun 2020 22:49:40 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id y20so7341024wmi.2
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2020 15:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e4v5lGFAfpa4m/MPKqRqTZ8nc/gfuYPKkhcMxsNKeT4=;
 b=sIya2hykS0aDKCgm6LdW6vLYW0Y7OMWgkIXWRxIuIxUE/Wf4iQdRatgWVx1kn38/MP
 H+2Vq4Fvo1IdcAmcfQiC9tOLHz/VhQk2STtVRUB2NVwpB2IA0GRFlBMdLlhqrVKY/f0n
 RBQgmeMRfgGGFziIlrskILvHGx5TXDCp5Z1DV3zo0PYeLUI+Rh/j9Q8sWdPA6+eHQ03d
 YJ0fPHS7XyVw5wEPI1BgeY+w1rDrpYAE1YKhZG4tExwjSk01lMIBeASHb66GbHshlKik
 LWyL/vCwmw/DNGxEe/0AjOef7vEtNr9YbEVoqumMqiU9qG/Uq2GdwhLvfXboWRpQsLf6
 gD+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e4v5lGFAfpa4m/MPKqRqTZ8nc/gfuYPKkhcMxsNKeT4=;
 b=a5mY2HpTDVCZJ7OXNq4uvjNglS+dpm4cfW6Q475eUlbYLtIWvad9pOMJrBg+DL6J4/
 ToOBMKyHVKzj7aIcKzkFzdqjAdIoMt4z8jMyErhgQvpf3RZC4HKQQEZqlCg5M9rqKebe
 yk2yUJCDorM6uhj6H64+s87AKArnuvoe9R8D/CCXV+9Ce1DaQW/SXD/JFZc2gAioR+qK
 R8+ZvOxVrn3gg6OvUtVlpwRkRrtO/RzdQKlQexw1HihPABxJjgf+yJ1f6CQpwAgtjS/H
 Il2WWihHo0ucEjL45/N1jp0FFjWUZx7h7Ja9eHRAMx9rBTR2Z7TZ3viVNGvJD/b4HEbV
 FLXw==
X-Gm-Message-State: AOAM532KF+zR0F23OW6px6R0TnYwmaitaZjniwYueevv1LLIAcBERDZS
 rhLwxqRQPaNd+YYVL0VTbrgLc6zGrxLwd95xpFg=
X-Google-Smtp-Source: ABdhPJzVjjjIo24UGU0ekySe9iGYTjHxs1H+O7FYAU2n4DRr/FCblWMUMvvccBi3NTN3xvV+LxOA2+VRISdypg796Ig=
X-Received: by 2002:a1c:c1:: with SMTP id 184mr560500wma.74.1592520579547;
 Thu, 18 Jun 2020 15:49:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAMmSBy9R57ntWmzNZDvwcvJM1f1wwD7ogWvCshipAcPX4x-TmQ@mail.gmail.com>
 <DB6PR0402MB276072324DC3E1E9BD9A96BE88890@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <c3856c1f-52bf-92fd-5226-4b09229e2127@epam.com>
 <alpine.DEB.2.21.2006040829390.6774@sstabellini-ThinkPad-T480s>
 <d6b39cd7-eeaa-f82b-df62-051f9f715968@epam.com>
 <54dcfce1-c401-0581-8620-dc8790209a87@xen.org>
 <alpine.DEB.2.21.2006181444460.14005@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2006181444460.14005@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Thu, 18 Jun 2020 23:49:28 +0100
Message-ID: <CAJ=z9a1NtCr1MM7oUBUH3hgc8SL_K9jERy+NQ6pLzxNpGPpXzw@mail.gmail.com>
Subject: Re: UEFI support in ARM DomUs
To: Stefano Stabellini <sstabellini@kernel.org>
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
Cc: Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>,
 Juergen Gross <jgross@suse.com>, Peng Fan <peng.fan@nxp.com>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Roman Shaposhnik <roman@zededa.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Nataliya Korovkina <malus.brandywine@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, 18 Jun 2020 at 23:00, Stefano Stabellini <sstabellini@kernel.org> wrote:
>
> On Thu, 18 Jun 2020, Julien Grall wrote:
> > On 18/06/2020 06:22, Oleksandr Andrushchenko wrote:
> > >
> > > On 6/4/20 6:31 PM, Stefano Stabellini wrote:
> > > > On Thu, 4 Jun 2020, Oleksandr Andrushchenko wrote:
> > > > > On 6/4/20 4:57 AM, Peng Fan wrote:
> > > > > > Grall <julien@xen.org>;
> > > > > > > Nataliya Korovkina <malus.brandywine@gmail.com>
> > > > > > > Subject: UEFI support in ARM DomUs
> > > > > > We have made U-Boot run inside XEN DomU, but just only PV console
> > > > > > part,
> > > > > > not implement other frontend drivers currently. Would this help for
> > > > > > your
> > > > > > case if enable EFI in U-Boot?
> > > > > Well, we have a working PV block implementation on top of that on iMX8
> > > > >
> > > > > platform, mostly ported from mini-os. Currently we are finalizing the
> > > > > work
> > > > >
> > > > > and cleaning up (it's going to take a week or so hopefully). Then, we
> > > > > we'll post
> > > > >
> > > > > it on our public github. We are also thinking about upstreaming the
> > > > > work, but it may
> > > > >
> > > > > take quite some time if the whole idea fits u-boot's view on such an
> > > > > extension at all.
> > > > Yes please to both of you! :-)
> > > >
> > > > In the meantime, while we wait for those changes to go upstream in
> > > > uboot, could you please post a branch on github and a link on this email
> > > > thread?
> > >
> > > It took a bit more time than we expected, but here we go [1]:
> > >
> > > this is in form of a pull-request as we would love to hear from the
> > >
> > > community and it is easier to discuss the code (please leave comments there)
> > >
> > > 1. There is code originating from MiniOS and work done by Peng, so we
> > >
> > > would like to ask the respective copyright owners to raise their hands and
> >
> > Not everyone are closely watching xen-devel. So if you want to find out who
> > are the copyright owners, then your best solution is to go through the git log
> > and CC the authors.
>
> That is true. But why do you want to contact them? It doesn't look like
> there would be any licensing issues.

From the sentence, I wasn't entirely sure whether he wanted to contact
the copyright owner for crediting them in the headers.

> > >
> > > 5. We use -D__XEN__ to access some of the hidden defines we need such as
> > >
> > > GUEST_RAM0_BASE and the friends as there is no other way but manually
> > > defining the
> > >
> > > same which is not cute.
> >
> > I have replied to this in the pull request. But I want to bring the
> > conversation here to have a wider discussion.
> >
> > For a first, __XEN__ should really only be defined by the hypervisor and not
> > used by the guest. This is used to gate non-stable ABI (such as the tools) and
> > anything behind it hasn't been vetted to work in other build configuration
> > that the one used by Xen.
> >
> > In general, we expect the guest to discover everything for the device-tree
> > because the memory layout is not stable (we want to be able to reshuffle as we
> > add more features).
> >
> > I know that EDK2/Tianocore can be built once and work on every Xen
> > configuration. It would be ideal that U-boot follow the same. If it is really
> > not possible, then we should explore a path that is preventing to define
> > __XEN__.
> >
> > How much does U-boot expect to know about the memory layout? Does it require
> > to know all the memory banks? Or would it be sufficient for it to know the
> > start address of the first bank and the minimum of RAM?
>
> Copy/pasting here from my comment on the pull request plus additional
> thoughts.
>
> Uboot is one of those embedded projects that typically assumes that all
> the information about the platform is available at *build time*. It is
> meant to be built tailored for a specific version of a specific board. A
> Uboot binary is not expected to be "portable" across different versions
> of the platform or different platforms. In other words, it is not
> expected to be portable across Xen versions.

Can you define "version" here? Do you refer to the difference in terms
of memory?

>
> This is a different model meant for different use-cases. I don't think
> it is a problem "philosophically" to let Uboot know about Xen details at
> build time. Yes, that is not what we did historically but it is very
> much in the spirit of Uboot.

TBH, I don't particularly mind that U-boot is built against a specific
version of Xen. I am more concerned about the long term implication if
we endorse it
and then try to change the memory layout in depth.

>
> But of course the least Uboot depends on these details the better
> because it will be more flexible, but it could very well be that we
> won't be able to reach the point where the binary works on any version
> like we did with Tianocore. The two projects work differently.

Can we have a list of things U-boot require to know at compile time?

In particular, I would like to understand if it would be sufficient to
only be aware of the first bank. If it is, then my preference would be
to standardize that bit of the layout.

> That said, I think Julien is right that we need to be careful on how we
> expose these information to Uboot, i.e. defining __XEN__ to build Uboot
> doesn't seem like a good idea because we enable definitions that were
> never meant to be used outside of a Xen build. Also, it wouldn't be easy
> to know exactly which definitions are actively used by Uboot and which
> ones aren't.
>
> If we are going to make Uboot dependent on version-specific information
> of the Xen interface, it would be better to be very clear about which
> definitions we are using. So that one day if we need to change them, we
> can find them easily.
>
> So I think it would be better to introduce a set of defines with the
> minimum amount of information required by Uboot statically. That way,
> at least we have a single place where to find all the version-specific
> definitions that Uboot is using.

I am not sure what you are suggesting. Can you expand a bit more?

> We can also manage versioning of the
> Xen interface (like we do in QEMU) if we have to.

Can you provide more details about the compatibility? I am quite
interested in the part where you would have to deal with an older QEMU
version built against a new Xen?

Cheers,

