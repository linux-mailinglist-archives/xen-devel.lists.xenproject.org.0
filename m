Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 021C51A38EB
	for <lists+xen-devel@lfdr.de>; Thu,  9 Apr 2020 19:32:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMb1a-0004uj-4K; Thu, 09 Apr 2020 17:31:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tj/S=5Z=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1jMb1Y-0004ue-AZ
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2020 17:31:32 +0000
X-Inumbo-ID: f35245fe-7a87-11ea-b58d-bc764e2007e4
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f35245fe-7a87-11ea-b58d-bc764e2007e4;
 Thu, 09 Apr 2020 17:31:31 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id 65so12867528wrl.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2020 10:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9U+SFmuVEKPMqiO9SbKMssciL9jadcOK/xDYub/uv1I=;
 b=V/OyE5hmj6LQQGdEsKsiSdf2Yn8qMxTwFsXz7yi2fe/XA/wWMDXc/gipbktcvexdjy
 PyxyBa9b1ntg+TET0L+rQ4m0Uq8gtCwqyba3fFX1QukQzBiqW0QP1ZtoRvZaIOVqgON2
 toN8QYfl89Ad8urTVA6QAwCyG7xZNXtx3/muLsiOFOs2dmDSdp4/G68qCBTKplEyG3K2
 OnJ1kGRW3IwDYMajgsP6TBQwQOxap9oIdjGGn4fjv24ZdeHXC7hTd0ZFB7HR4SuKI13z
 +wKV2aOUbKR9RhIvUvME38FCQkwSY4s/gUxf0jgeLZWT45YY4hFjuhRL3j/mPw0ND1fR
 ZRwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9U+SFmuVEKPMqiO9SbKMssciL9jadcOK/xDYub/uv1I=;
 b=n9zwwxItTotzx9QSjJEQREdPNDlF+lQbnFLnzRRGHHg+9D/roptj55cfyaTmLZ/qYc
 xup0wkBuruKo7ajys5UgBbIKzwg4wjbY5LJ76SFjVnLJ+hFqquKqUnYNJie8moQStaYV
 Fhr6LVfMLPwGbGKjW1JJKXAVfqrGKuLaoZ4VwQF0Nt/Yi/4tZdTdpKClrXXA2BJvoN3d
 snfBebgNAbAigM1ZCS7uiwBhJF8neT15FbOuvkJm5jhaEMblyQYcAW/ThEJbvl7RnSXw
 n22uWvj3XKx2ikEEdhar8w7aAgp6SO6iinCKXNMU/VQRcwpfcOlwlKxTqQGQ6cwYXZAn
 Lfew==
X-Gm-Message-State: AGi0PuYF3SOSxZSAWhhBbinghCpho/GeMvJPYccyNsREnTT19SsrxStO
 yhM5OUTikg4KGjnOZasxHm5mZaCCPo7uJh/yDjI=
X-Google-Smtp-Source: APiQypJULY5PYda9001iWJpn46eAoX4Zlz8zIssKQSBC9rXsJS96PujHqvVxt32uHDC3KKIZVtkAPOkdY6TXrzlhXUY=
X-Received: by 2002:adf:f98b:: with SMTP id f11mr197952wrr.259.1586453490540; 
 Thu, 09 Apr 2020 10:31:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1586186121.git.tamas.lengyel@intel.com>
 <6d63f89124c7445be3185ab6722992b707dab72b.1586186121.git.tamas.lengyel@intel.com>
 <20200409154243.6ouh7r37fwm32mjg@debian>
 <CABfawhndtUA3hVyq9ObbuGRJOVg84qxPgEpc-HsEMxn7A7j_jA@mail.gmail.com>
 <20200409162159.cb2h7a6tmkbaduay@debian>
 <CABfawhnaDS=nGn3+NqoY_nWXvu0cfsAmpYjiv9VqkT6C0Ow1FA@mail.gmail.com>
 <20200409171113.cajvhjlftadqqq73@debian>
In-Reply-To: <20200409171113.cajvhjlftadqqq73@debian>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Thu, 9 Apr 2020 11:30:54 -0600
Message-ID: <CABfawhmdSdC2kKzE5jLLCtkR9Pb4mcT6iRdzv0s=v0mQiju_Kg@mail.gmail.com>
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

On Thu, Apr 9, 2020 at 11:11 AM Wei Liu <wl@xen.org> wrote:
>
> On Thu, Apr 09, 2020 at 10:59:55AM -0600, Tamas K Lengyel wrote:
> [...]
> > >
> > > >
> > > > > >
> > > > > > +/*
> > > > > > + * The parent domain is expected to be created with default settings for
> > > > > > + * - max_evtch_port
> > > > > > + * - max_grant_frames
> > > > > > + * - max_maptrack_frames
> > > > > > + */
> > > > > > +int libxl_domain_fork_vm(libxl_ctx *ctx, uint32_t pdomid, uint32_t max_vcpus, uint32_t *domid)
> > > > > > +{
> > > > > > +    int rc;
> > > > > > +    struct xen_domctl_createdomain create = {0};
> > > > > > +    create.flags |= XEN_DOMCTL_CDF_hvm;
> > > > > > +    create.flags |= XEN_DOMCTL_CDF_hap;
> > > > > > +    create.flags |= XEN_DOMCTL_CDF_oos_off;
> > > > > > +    create.arch.emulation_flags = (XEN_X86_EMU_ALL & ~XEN_X86_EMU_VPCI);
> > > > > > +    create.ssidref = SECINITSID_DOMU;
> > > > > > +    create.max_vcpus = max_vcpus;
> > > > >
> > > > >
> > > > > Some questions:
> > > > >
> > > > > Why does the caller need to specify the number of vcpus?
> > > > >
> > > > > Since the parent (source) domain is around, can you retrieve its domain
> > > > > configuration such that you know its max_vcpus and other information
> > > > > including max_evtchn_port and maptrack frames?
> > > >
> > > > Because we want to avoid having to issue an extra hypercall for these.
> > > > Normally these pieces of information will be available for the user
> > > > and won't change, so we save time by not querying for it every time a
> > > > fork is created. Remember, we might be creating thousands of forks in
> > > > a very short time, so those extra hypercalls add up.
> > >
> > > I see. Speed is a big concern to you.
> > >
> > > What I was referring to doesn't require issuing hypercalls but requires
> > > calling libxl_retrieve_domain_configuration. That's likely to be even
> > > slower than making a hypercall.
> >
> > Right. We only want to parse the domain config if the device model is
> > being launched.
> >
> > >
> > > I'm afraid the current incarnation of libxl_domain_fork_vm cannot become
> > > supported (as in Xen's support statement) going forward, because it is
> > > leaky.
> >
> > What do you mean by leaky?
>
> It requires the caller to specify the number of max_vcpus. The reason
> for doing that is because you want to avoid extra hypercall(s). There is
> nothing that stops someone from coming along in the future claiming some
> other parameters are required because of the same concern you have
> today. It is an optimisation, not a must-have in terms of functionality.
>
> To me the number shouldn't be specified by the caller in the first
> place. It is like forking a process somehow requires you to specify how
> many threads it will have.

I agree. It's not how I wanted to have the interface work but
unfortunately this was the least "ugly" of the possible solutions
given the circumstances.

> >
> > >
> > > I can see two solutions: 1. batch forking to reduce the number of
> > > queries needed; 2. make a proper domctl which duplicates the source
> > > domain structure inside Xen.
> >
> > I've attempted to do that by extending the domain create hypercall so
> > that this information can be copied in the hypervisor. That approach
> > was very unpopular.
> >
>
> Sigh. Sorry I haven't had the chance to read previous discussions.
> -ETIME.

Sigh indeed.

Tamas

