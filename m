Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA6E76B806
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 16:51:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574358.899609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQqio-0005v4-8D; Tue, 01 Aug 2023 14:51:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574358.899609; Tue, 01 Aug 2023 14:51:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQqio-0005st-5Y; Tue, 01 Aug 2023 14:51:38 +0000
Received: by outflank-mailman (input) for mailman id 574358;
 Tue, 01 Aug 2023 14:51:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w4lv=DS=gmail.com=raj.khem@srs-se1.protection.inumbo.net>)
 id 1qQqim-0005lo-Th
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 14:51:36 +0000
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [2607:f8b0:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8e59a8a-307a-11ee-8613-37d641c3527e;
 Tue, 01 Aug 2023 16:51:35 +0200 (CEST)
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-6bca5d6dcedso1755751a34.1
 for <xen-devel@lists.xenproject.org>; Tue, 01 Aug 2023 07:51:35 -0700 (PDT)
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
X-Inumbo-ID: e8e59a8a-307a-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690901494; x=1691506294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H88X5gfHf9VxmAkjJBqSKV70I+aQh9Izc8ZfPc/BhRg=;
        b=S4lezuvicEDGzoR/m9HZk0SMsBwHoMinC1LMlVO0wVObRRo+8h+QlmU3M4OsbOW9Jq
         UhqxuWHSRQHCrfrTCMKq0grHpdYc4tAm5hAYPjuntAsEbQdU86JxF6+NlI9ioDE+kwfv
         JUCk/W5bbLUhXtotdPcw+O/IrNrfb5VrYMOI5kqPg05cxOGI8LIT4ic8coww2mY7QSBw
         9HdNx2XaaDmPoaKFOM1WEyTjYbhJAnPe7SwCJpAGNniCnUEB5NV6aK7nBVrwmHU4LGSW
         ORiXy9dIaKrvlnG0C5uZxx+BYHs+PNkV5rJJfxjqylVj9WlIpOc5DDCDzOTJu37kvYSi
         gbwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690901494; x=1691506294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H88X5gfHf9VxmAkjJBqSKV70I+aQh9Izc8ZfPc/BhRg=;
        b=Zv65Xm5OASK+q+kTZhPsxwhGog4JUypHfDCVGa4zGd+R71yKfSWJIz5XQO8APbHEJg
         AVf0y6rOMancgCpAxO0B2GQVP38tYkN5ZBxBSYLZCJ2KLdJhGGhOu3cE3X0Ss6eS+TCy
         3pr1TboaLxvBgGJmDNmJ4h2To+VRKEx2muoLY0am9KdRjW/+ZUfkwCrW9OqYILMYi8R3
         xzBF6ci7jkvU3VVhAOfqrBRDuVGOmuWGQNhehDgnRf/Hh3grYMYJmPlbsmV3TmtyezAj
         1kkBRUX+x417kRFnI0yh/hwYuwJrqQBIJQRr43qJnZGMo4Svb9oj10rB6kr84EfCyUoW
         LSiQ==
X-Gm-Message-State: ABy/qLbbPrSErfYkxXz/z3gtAfSssbjPA+RUx8ihjOtn0WA42ZaE95lO
	FPyTkd5unp/uc3MhbZIl7/B2DfZ/hIBzSOxvquI2wYJwXEc=
X-Google-Smtp-Source: APBJJlFqUq7uzRO3KioIVq8hurFoIOS+BN5308K5b9dIadr0OS3Ne5WsQLdAo6tM2o3DNYocWWEwINndhJzCnUfZ1cI=
X-Received: by 2002:a05:6870:210a:b0:1b0:57f8:dabf with SMTP id
 f10-20020a056870210a00b001b057f8dabfmr13933189oae.33.1690901493893; Tue, 01
 Aug 2023 07:51:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230801001258.555944-1-raj.khem@gmail.com> <ed6ce883-4905-fc3b-5614-48f86dc490dc@suse.com>
In-Reply-To: <ed6ce883-4905-fc3b-5614-48f86dc490dc@suse.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Aug 2023 07:51:07 -0700
Message-ID: <CAMKF1spd77aTkEv6jZ7LUU9KuegrS28c+K6x5VvV7YhVByy7bQ@mail.gmail.com>
Subject: Re: [PATCH] arm32: Avoid using solaris syntax for .section directive
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 1, 2023 at 12:33=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 01.08.2023 02:12, Khem Raj wrote:
> > Assembler from binutils 2.41 rejects this syntax
> >
> > .section "name"[, flags...]
> >
> > where flags could be #alloc, #write, #execstr
> > Switch to using ELF syntax
>
> You mean GNU, not ELF (ELF is describing the object format, not the
> syntax used). Feels almost like a regression (I'll mention that to
> Alan), which likely went unnoticed so far because Linux had changed
> to GNU syntax already in 5.5, to allow building with Clang's
> integrated assembler. This aspect may be worth mentioning here as
> well.

OK will send v2

>
> > .section name[, "flags"[, @type]]
> >
> > [1] https://ftp.gnu.org/old-gnu/Manuals/gas-2.9.1/html_chapter/as_7.htm=
l#SEC119
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> Out of curiosity - why were there four instances of the patch?
> They all look largely identical; if there are differences, I haven't
> spotted them.

there should not have been
I was a not a subscriber to mailing list, did not realize why it was
not appearing on ml :)

>
> Jan

