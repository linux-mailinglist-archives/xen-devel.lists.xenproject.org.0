Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A867B1A4854
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2020 18:21:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMwPI-00054S-UX; Fri, 10 Apr 2020 16:21:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Kp13=52=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1jMwPH-00054M-EI
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2020 16:21:27 +0000
X-Inumbo-ID: 534a388a-7b47-11ea-b58d-bc764e2007e4
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 534a388a-7b47-11ea-b58d-bc764e2007e4;
 Fri, 10 Apr 2020 16:21:26 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id e26so2939489wmk.5
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2020 09:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cnMzUHdiTqnOVirdhY4+hp8JnHcBsGj3wbW2WQ7nszs=;
 b=LZMwwox8qZbuYFAwd9kVhKNUyecvbcCKdJvYiNdPMixoeHhbWOnLVPLqHuq96f0wkh
 VQqc61CS9MJJmOPgM9+vpqIw6rSP4IwcqbfCsWIQrhcAO6mxXCHcEXMItl0UelMAsRI2
 IxPRvZCMd2oHSWfL19pGLg3PCTTBOy0ate1UeS0QrWii8cPycnEgp6N+5I8b46FnwQ3/
 c51K8vFTzXlbdBfR4B9UUp5at2S0+zt60N9xdGQCRhTVl6GKIN43xUNeB+6FbZz2SMCX
 CVAs31nX86RRecwAxF1hW6f9b8ko136HOB+YjxKuu7m8DzJxvOpubdcd6WPRC2ctSFMH
 3REg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cnMzUHdiTqnOVirdhY4+hp8JnHcBsGj3wbW2WQ7nszs=;
 b=PxxuaFfel0LyhEPS//vLQg0mwSvPYSyBi0EYYtg2aMZPgJI5/ttQJYzGDjeAAUNQWC
 rF3GX4E6HeHDl0GgPmTLdtGr1Yh1cFk/nMIzNbz9oDpfeCw9aoAINQ6UuSeDIkxKEgdB
 FBLbe7/+OZzKS8Fcr8/fz5CbingDNuJF+MccPsoczMy7HfpFpaxhjRrENRzozC6bmiDQ
 JYTXdiJuytr3p2mF29QEUQArwu/yIDEdd0UnE9c9RcDfaVytQZkkGAITR4slEkDYqn1U
 z5eaz7Dl7L3qT7DrAWpEWsJXxheTdfFtsTKcxqM0mclSo8wgWrOuupQWOmpmmoZuU8Fx
 3Y+g==
X-Gm-Message-State: AGi0PuZ+sNckOpWJDYw6CWrvW7ROAXW5yDA6avXmBMJMNrxAJ7WMVQ8M
 V4WR2SYGcJkYnEk7AoDaEkv87ZOIPNSYA5LTqP4=
X-Google-Smtp-Source: APiQypJgKYyjw3S8e8Nnx7QeHF3q9wjfColeTyQ9dALPXT1oFGkHLgBwXD0R/k63tCxJBDaat3VgW3lwZgYA4Y/2MgE=
X-Received: by 2002:a1c:4c10:: with SMTP id z16mr5916107wmf.77.1586535685453; 
 Fri, 10 Apr 2020 09:21:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1586186121.git.tamas.lengyel@intel.com>
 <6d63f89124c7445be3185ab6722992b707dab72b.1586186121.git.tamas.lengyel@intel.com>
 <20200409154243.6ouh7r37fwm32mjg@debian>
 <CABfawhndtUA3hVyq9ObbuGRJOVg84qxPgEpc-HsEMxn7A7j_jA@mail.gmail.com>
 <20200409162159.cb2h7a6tmkbaduay@debian>
 <CABfawhnaDS=nGn3+NqoY_nWXvu0cfsAmpYjiv9VqkT6C0Ow1FA@mail.gmail.com>
 <20200409171113.cajvhjlftadqqq73@debian>
 <CABfawhmdSdC2kKzE5jLLCtkR9Pb4mcT6iRdzv0s=v0mQiju_Kg@mail.gmail.com>
 <CABfawhnw2O6GPXEwk0-vAkAVpwn95F-pcpahOpQUo23Luz7eFg@mail.gmail.com>
 <20200410161906.tjonj2btem5nqkpp@debian>
In-Reply-To: <20200410161906.tjonj2btem5nqkpp@debian>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Fri, 10 Apr 2020 10:20:49 -0600
Message-ID: <CABfawhn2=-WiEyT--Z-h-mYBSc2uwU8X7VGaTmc6GRzOAEXzLQ@mail.gmail.com>
Subject: Re: [PATCH v14 3/3] xen/tools: VM forking toolstack side
To: Wei Liu <wl@xen.org>
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Apr 10, 2020 at 10:19 AM Wei Liu <wl@xen.org> wrote:
>
> On Fri, Apr 10, 2020 at 10:05:50AM -0600, Tamas K Lengyel wrote:
> > On Thu, Apr 9, 2020 at 11:30 AM Tamas K Lengyel
> > <tamas.k.lengyel@gmail.com> wrote:
> > >
> > > On Thu, Apr 9, 2020 at 11:11 AM Wei Liu <wl@xen.org> wrote:
> > > >
> > > > On Thu, Apr 09, 2020 at 10:59:55AM -0600, Tamas K Lengyel wrote:
> > > > [...]
> > > > > >
> > > > > > >
> > > > > > > > >
> > > > > > > > > +/*
> > > > > > > > > + * The parent domain is expected to be created with default settings for
> > > > > > > > > + * - max_evtch_port
> > > > > > > > > + * - max_grant_frames
> > > > > > > > > + * - max_maptrack_frames
> > > > > > > > > + */
> > > > > > > > > +int libxl_domain_fork_vm(libxl_ctx *ctx, uint32_t pdomid, uint32_t max_vcpus, uint32_t *domid)
> > > > > > > > > +{
> > > > > > > > > +    int rc;
> > > > > > > > > +    struct xen_domctl_createdomain create = {0};
> > > > > > > > > +    create.flags |= XEN_DOMCTL_CDF_hvm;
> > > > > > > > > +    create.flags |= XEN_DOMCTL_CDF_hap;
> > > > > > > > > +    create.flags |= XEN_DOMCTL_CDF_oos_off;
> > > > > > > > > +    create.arch.emulation_flags = (XEN_X86_EMU_ALL & ~XEN_X86_EMU_VPCI);
> > > > > > > > > +    create.ssidref = SECINITSID_DOMU;
> > > > > > > > > +    create.max_vcpus = max_vcpus;
> > > > > > > >
> > > > > > > >
> > > > > > > > Some questions:
> > > > > > > >
> > > > > > > > Why does the caller need to specify the number of vcpus?
> > > > > > > >
> > > > > > > > Since the parent (source) domain is around, can you retrieve its domain
> > > > > > > > configuration such that you know its max_vcpus and other information
> > > > > > > > including max_evtchn_port and maptrack frames?
> > > > > > >
> > > > > > > Because we want to avoid having to issue an extra hypercall for these.
> > > > > > > Normally these pieces of information will be available for the user
> > > > > > > and won't change, so we save time by not querying for it every time a
> > > > > > > fork is created. Remember, we might be creating thousands of forks in
> > > > > > > a very short time, so those extra hypercalls add up.
> > > > > >
> > > > > > I see. Speed is a big concern to you.
> > > > > >
> > > > > > What I was referring to doesn't require issuing hypercalls but requires
> > > > > > calling libxl_retrieve_domain_configuration. That's likely to be even
> > > > > > slower than making a hypercall.
> > > > >
> > > > > Right. We only want to parse the domain config if the device model is
> > > > > being launched.
> > > > >
> > > > > >
> > > > > > I'm afraid the current incarnation of libxl_domain_fork_vm cannot become
> > > > > > supported (as in Xen's support statement) going forward, because it is
> > > > > > leaky.
> > > > >
> > > > > What do you mean by leaky?
> > > >
> > > > It requires the caller to specify the number of max_vcpus. The reason
> > > > for doing that is because you want to avoid extra hypercall(s). There is
> > > > nothing that stops someone from coming along in the future claiming some
> > > > other parameters are required because of the same concern you have
> > > > today. It is an optimisation, not a must-have in terms of functionality.
> > > >
> > > > To me the number shouldn't be specified by the caller in the first
> > > > place. It is like forking a process somehow requires you to specify how
> > > > many threads it will have.
> > >
> > > I agree. It's not how I wanted to have the interface work but
> > > unfortunately this was the least "ugly" of the possible solutions
> > > given the circumstances.
> >
> > By the way, it would be trivial to query the parent in case max_vcpus
> > is not provided by the user. But I would still like to keep the option
> > available to skip that step if the number is known already. Let me
> > know if you would like me to add that.
>
> I'm still waiting for Ian and Anthony to chime in to see whether they
> agree to keep this interface unstable.
>
> At the end of the day, if it is unstable, I don't really care that much.
> I'm happy to let you (the developer and user) have more say in that
> case.  I will instead divert my (limited) time to code that your patch
> touches which is also used by other stable functions.

SGTM

Thanks,
Tamas

