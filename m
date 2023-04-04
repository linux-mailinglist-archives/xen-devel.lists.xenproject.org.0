Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4286D6ADD
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 19:46:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518102.804292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjkjC-00062o-36; Tue, 04 Apr 2023 17:45:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518102.804292; Tue, 04 Apr 2023 17:45:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjkjC-00060m-0L; Tue, 04 Apr 2023 17:45:54 +0000
Received: by outflank-mailman (input) for mailman id 518102;
 Tue, 04 Apr 2023 17:45:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jyst=73=linaro.org=peter.maydell@srs-se1.protection.inumbo.net>)
 id 1pjkjA-00060Z-Qx
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 17:45:52 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8abb3184-d310-11ed-85db-49a42c6b2330;
 Tue, 04 Apr 2023 19:45:52 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id ew6so133753336edb.7
 for <xen-devel@lists.xenproject.org>; Tue, 04 Apr 2023 10:45:52 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 8abb3184-d310-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680630351;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zM6C51SzsToixyfPpduAVipa4SnNg5IMo4YirkkilTI=;
        b=m79o95DJlnvNJ4KH0Md0JB/qcLndytfefpLDAV0P5BOEkg/Vua/5v5yhxJiEAvb7w5
         zX4nTiEhJCuiD5E98BTa7eiGfw2OqM2TpwCvm1TcLI6Hk2miGK5+V4kheAWEibmMUm3R
         txiTr0hc/XRHsz4NUYkN/ovZ+XzpI7r9BRvI0kulU38aQadsOpX6GPzfUPpyJlXcZabB
         84rq8WrNEjrkLZ0VGXADyKLyZT0AVrpSg1AHZWPisb5dFOkkIAV3isD22l9nLcJ0JZJA
         mp4WPZrOD0ZIlWi0yX0/5QNNpEwJEB7WKHjVk6zXuk9UI4SAqf9oZJg3HYcHG/MKsiKz
         j7Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680630351;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zM6C51SzsToixyfPpduAVipa4SnNg5IMo4YirkkilTI=;
        b=vTlh7o9YqVL4pn9P4Jf9rDIZvvJFx5sn/95zoBemeVsjY0M8VFzS0BIG2nykF8pXjH
         /smTRZ18TWRHAPNY5Ncp7UDQ1B8jl/QswepLMHF7Ah9+d5+3xknJQsyPNwBmaK0ZSB/u
         cgUwkctZFXHb8FoafH1QeEGPYTeYtzjsAVcZvibiTKbjnFfcmQSsAA3+BkTRyyw677+7
         FqekhSqi1Dgcv9CsQkehob+J2XeK/FubeYTTjwW7+8Y7kxrotajqZwN55mhwuu+SimAd
         m6462gsp+gX2gg1F9oj/0DPQaBHumoWvRGKY/NPFIVV7yw7GtNbHIyj5TVWPstjqiE0U
         dRpA==
X-Gm-Message-State: AAQBX9fjR0CIBh2He4Cmey5xaK06dFlw3ZhkHsTPf90lJf5sjxyFBxQE
	g4lUvAFpPgU6x/nXxGNnRolKdiLf30oc8zTxy7h6XQ==
X-Google-Smtp-Source: AKy350aUoDCSACn1ctQt94298XZZELptJd4vlQvIrHKhZ59SL3gN/lMGnaDhhMIf4vhQdc2A1ymiyiiUf29jIj2J2NY=
X-Received: by 2002:a17:907:118d:b0:932:4577:6705 with SMTP id
 uz13-20020a170907118d00b0093245776705mr203873ejb.6.1680630351647; Tue, 04 Apr
 2023 10:45:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230307182707.2298618-1-dwmw2@infradead.org> <20230307182707.2298618-14-dwmw2@infradead.org>
 <CAFEAcA_SS8xRjGKZoSyGc0nh_-C2Wh8hauGzR82Aj8S1g8xBOQ@mail.gmail.com> <d079d8c1f455c96203dc44906d37c2ac8963a6ae.camel@infradead.org>
In-Reply-To: <d079d8c1f455c96203dc44906d37c2ac8963a6ae.camel@infradead.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Apr 2023 18:45:41 +0100
Message-ID: <CAFEAcA-DT-990Y81mh0rgBp-P0fdLTYCD=DN7m1qued7VFVrVg@mail.gmail.com>
Subject: Re: [PULL 13/27] hw/xen: Add xenstore operations to allow redirection
 to internal emulation
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>, 
	Joao Martins <joao.m.martins@oracle.com>, Ankur Arora <ankur.a.arora@oracle.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com, 
	Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, 
	Juan Quintela <quintela@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 4 Apr 2023 at 18:45, David Woodhouse <dwmw2@infradead.org> wrote:
>
> On Tue, 2023-04-04 at 18:35 +0100, Peter Maydell wrote:
> > On Tue, 7 Mar 2023 at 18:27, David Woodhouse <dwmw2@infradead.org>
> > wrote:
> > >
> > > From: Paul Durrant <pdurrant@amazon.com>
> > >
> > > Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> > > Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> > > Reviewed-by: Paul Durrant <paul@xen.org>
> > > ---
> >
> > Hi; Coverity points out a memory leak in this code (CID 1508098):
> >
> > > +static struct qemu_xs_handle *libxenstore_open(void)
> > > +{
> > > +    struct xs_handle *xsh = xs_open(0);
> > > +    struct qemu_xs_handle *h = g_new0(struct qemu_xs_handle, 1);
> >
> > Here we allocate memory...
> >
> > > +
> > > +    if (!xsh) {
> > > +        return NULL;
> >
> > ...but here we can return without freeing it...
> >
> > > +    }
> > > +
> > > +    h = g_new0(struct qemu_xs_handle, 1);
> >
> > ...and here we allocate a second time and overwrite the
> > pointer to the first allocation.
> >
> > Deleting the first call to g_new0() would fix both of these.
>
> Indeed, thanks. Do you want a
>
> Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
>
> or would you prefer me to submit the actual patch as described?

If you could submit the patch that would be easiest -- you're in
a better position to test it.

thanks
-- PMM

