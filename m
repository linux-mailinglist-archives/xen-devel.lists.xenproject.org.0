Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D56E6DFE10
	for <lists+xen-devel@lfdr.de>; Wed, 12 Apr 2023 20:54:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520329.807818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmfbk-0005GD-33; Wed, 12 Apr 2023 18:54:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520329.807818; Wed, 12 Apr 2023 18:54:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmfbk-0005EQ-02; Wed, 12 Apr 2023 18:54:16 +0000
Received: by outflank-mailman (input) for mailman id 520329;
 Wed, 12 Apr 2023 18:54:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mKmc=AD=linaro.org=peter.maydell@srs-se1.protection.inumbo.net>)
 id 1pmfbi-0005EC-3F
 for xen-devel@lists.xenproject.org; Wed, 12 Apr 2023 18:54:14 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68b94743-d963-11ed-8611-37d641c3527e;
 Wed, 12 Apr 2023 20:54:10 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-504718a2282so3778162a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Apr 2023 11:54:10 -0700 (PDT)
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
X-Inumbo-ID: 68b94743-d963-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681325649; x=1683917649;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OCBM1eYOuCRMs+HWvFuj5wOCzBihsmjaSCKE5mxqFgI=;
        b=VXQdX4vyMY3Ts0kkSN2W7HmWqpWcjPqeqmESwkSYw/q+25N8hvpY4U6FCHolp/aSvK
         MNKlEndf4lQRDiitq6UIN/+34xz3Q7//qS6jjPrgY6j8IHZHoZJ3fOwKmuVDRlkTQ0jA
         xE7LoPfyFE5cmWTELrHJ5NIQ/1Q5ioX4YcfBW3IbzyXXMmLqaMDaQjndFk7+sXFoSz+A
         Mbusyjbo6iE+llpLR9OFKLxabubeD369SAwLc2bQfq8kh8o3gk/AhTStNyTVDXZ0THrE
         4bGnZhRjZYE+yVpugd4VoPmQYiuTZGQlS6Gm1GePZxuvuniS954uRoeLQ0SOjiZpCHym
         HIrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681325649; x=1683917649;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OCBM1eYOuCRMs+HWvFuj5wOCzBihsmjaSCKE5mxqFgI=;
        b=jYg11YJFCJnni/WOkjUCBTQklHTkQHtQEF5yl3ITg4VTX9mFt5XJeg9215CwdVxi1Q
         vPKrzUPmR/D7MIMI9GZZaV5dqp0g5zySZDBfYuea9XWrI7kmDs6b0VK8Xd1OtgzBmOJh
         ygQ1pAaJ+6JTnYLnqhQAFwf54y9mAl3P5GrsHHeR9livBehiPqrnubmDcmLeG538n8sM
         ZwcHDs2ezBzYaRpcNRwbJcLgU9HqTYbF/bGMzhQx67QSKt+iokXJFiq/RZO96BruKXgu
         vPdT47vqm8BedrppLkc45BoH1obz3oEFB2le5NdABSUagrOmbt5iECq3xhy1NxYp+MSQ
         M8+g==
X-Gm-Message-State: AAQBX9cqtmyd/xfFZZ9X8ngJnrTJPwrY5lEI3HrYKDgvUc/qgsYOMvZ3
	q0K0os2eKEtcuCVI4ZBni+LCMe/EkR0Y9EAFJpTL+g==
X-Google-Smtp-Source: AKy350YpkBKagCiorTlciXGC1XIYvr/Cp6SiNr9+jL2am6FQOLrXgpQ/KR800WHaG6IAXmEJFIDhvRUdZb691xauqlI=
X-Received: by 2002:a50:9f65:0:b0:505:521:7880 with SMTP id
 b92-20020a509f65000000b0050505217880mr1382745edf.6.1681325649641; Wed, 12 Apr
 2023 11:54:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230307182707.2298618-1-dwmw2@infradead.org> <20230307182707.2298618-23-dwmw2@infradead.org>
 <CAFEAcA-vCihVupZsLBdh6+-xjdNX2-K1Ceo+tgsjA=KCdWTjpg@mail.gmail.com> <92e10c45117dce9c07304a567fd412434ea0ddd3.camel@infradead.org>
In-Reply-To: <92e10c45117dce9c07304a567fd412434ea0ddd3.camel@infradead.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Apr 2023 19:53:58 +0100
Message-ID: <CAFEAcA8W49n-O3jokxQjYD-u0ScC+giGdryai4bKy_Lk-nrseA@mail.gmail.com>
Subject: Re: [PULL 22/27] hw/xen: Add emulated implementation of XenStore operations
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>, 
	Joao Martins <joao.m.martins@oracle.com>, Ankur Arora <ankur.a.arora@oracle.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com, 
	Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, 
	Juan Quintela <quintela@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 12 Apr 2023 at 19:22, David Woodhouse <dwmw2@infradead.org> wrote:
>
> On Tue, 2023-04-11 at 19:07 +0100, Peter Maydell wrote:
> >
> >
> > > +static void xs_be_unwatch(struct qemu_xs_handle *h, struct
> > > qemu_xs_watch *w)
> > > +{
> > > +    xs_impl_unwatch(h->impl, DOMID_QEMU, w->path, NULL,
> > > xs_be_watch_cb, w);
> >
> > Coverity points out that this is the only call to xs_impl_unwatch()
> > where we don't check the return value. Is there some useful way
> > we can report the error, or is it a "we're closing everything down
> > anyway, no way to report anything" situation? (This particular
> > Coverity heuristic is quite prone to false positives, so if that's
> > the way it is I'll just mark it as a f-p in the coverity UI.)
>
> This is because the Xen libxenstore API doesn't return an error, and
> this is the ops function which emulates that same API. I suppose we
> could explicitly cast to void with a comment to that effect, to avoid
> having it linger in Coverity? I think that's sufficient to make
> Coverity shut up, isn't it?

I've just marked it a false-positive in the UI. Coverity's generally
good at not resurfacing old false-positives, so don't bother
changing the code unless you think it would improve clarity for
a human reader.

thanks
-- PMM

