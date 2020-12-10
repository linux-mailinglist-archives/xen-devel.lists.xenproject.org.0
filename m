Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6A02D5EBA
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 15:57:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49401.87365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knNNT-0007hD-2m; Thu, 10 Dec 2020 14:57:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49401.87365; Thu, 10 Dec 2020 14:57:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knNNS-0007go-V2; Thu, 10 Dec 2020 14:57:06 +0000
Received: by outflank-mailman (input) for mailman id 49401;
 Thu, 10 Dec 2020 14:57:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sk2J=FO=redhat.com=mlureau@srs-us1.protection.inumbo.net>)
 id 1knNNR-0007gi-KY
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 14:57:05 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 7e32e582-82f0-4700-ba16-327a22c4b256;
 Thu, 10 Dec 2020 14:57:04 +0000 (UTC)
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-dGGqX1UcNrSh7OuJ36995A-1; Thu, 10 Dec 2020 09:57:02 -0500
Received: by mail-io1-f72.google.com with SMTP id s11so4075542iod.14
 for <xen-devel@lists.xenproject.org>; Thu, 10 Dec 2020 06:57:01 -0800 (PST)
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
X-Inumbo-ID: 7e32e582-82f0-4700-ba16-327a22c4b256
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607612224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JXqyrvdOJb2ioK7+vOVVst13JBAIvCX7ELMPyGaGrxc=;
	b=I0lfrheSPqu6tv4AJijdNDtV76CNhf/PA+NuUFLXl/S6HegtODw/r2ygmrS4bT/ufuYvoq
	i8+jJgqVJSaJMCtDKYd4KFpY/oPUgnN17lo0/g3NoMu97VDqlVEUfsgTUhEXUxMhFR1YVZ
	xUHr9yrN3jWcgvd2w/7N4+0kBKIbD1E=
X-MC-Unique: dGGqX1UcNrSh7OuJ36995A-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=JXqyrvdOJb2ioK7+vOVVst13JBAIvCX7ELMPyGaGrxc=;
        b=phbkRyH0gVy2pOyvdGnsQnXP6G3pFhW++bJpuY7gKtC+mcHjO9pfrlCfNdSpsyYE5O
         exIh2rair5LRtPAGr4EtOBpsmjBSTu9sURvcx8PNbf2eB10PJi5SsXyBTex79NA7iKhB
         VsE9rIeTTNOW+SBjypEiWQ0rdlZ8BKqtvIIs8UVZRgTThDT5hdeQbIeNBEHKX5i1bZo2
         w23vXJEDYazLL8OEJ62HoaF0QeXfrUBVOHKorb9hMbtwVkiKe5vwzYtX8G4faFI8yHMq
         vk4qHlwHvHmOaMXV70dZPTodwxheQZNkgVz+ERUnqqTJsZy4jcbZtpOgnbQIHOHaCDUS
         mULA==
X-Gm-Message-State: AOAM531NxTtC0kzM+JiGOptgjViDcIX9fQCOKGE563bFY8jdiraeeuFz
	8yRgzMZPqcMkYYKRkeMlCX9AKUKxnnvJn0f2aICqOObXynJKCIyBX+kwHZSllp2+jUm/Kq34Eis
	HhrbkFxmIlEj+s2Rh+zm/WWU2hKShNThHaSDUrOu88w0=
X-Received: by 2002:a92:c26c:: with SMTP id h12mr3441190ild.165.1607612221488;
        Thu, 10 Dec 2020 06:57:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzTp0xzsbwNTZrcPB5s1KuzFnilNq6cZjoRe/XflqmlO4DDt1OBf1aX0Z0sIhLZJ0uGd19w3g9P9yy6kBEvWm4=
X-Received: by 2002:a92:c26c:: with SMTP id h12mr3441180ild.165.1607612221323;
 Thu, 10 Dec 2020 06:57:01 -0800 (PST)
MIME-Version: 1.0
References: <20201210134752.780923-1-marcandre.lureau@redhat.com>
 <20201210134752.780923-9-marcandre.lureau@redhat.com> <a162ec7c-4dc3-5784-866e-dc95f6919b1f@redhat.com>
 <CAFEAcA_xbEm+DmP5hixtkzWJK1fi8X7wZh+eGKmDneZv_=-xbA@mail.gmail.com> <ac25b79a-c22a-04ab-f125-873710ef9f6d@redhat.com>
In-Reply-To: <ac25b79a-c22a-04ab-f125-873710ef9f6d@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 10 Dec 2020 18:56:49 +0400
Message-ID: <CAMxuvay1DzS=GzW+0g3x0BgTC850zuqsQ_3tVZ-Fu7Nxz+vLYw@mail.gmail.com>
Subject: Re: [PATCH v3 08/13] audio: remove GNUC & MSVC check
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Laurent Vivier <laurent@vivier.eu>, 
	Paul Durrant <paul@xen.org>, "open list:X86" <xen-devel@lists.xenproject.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, 
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm <qemu-arm@nongnu.org>, 
	Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Dec 10, 2020 at 6:35 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> On 12/10/20 3:27 PM, Peter Maydell wrote:
> > On Thu, 10 Dec 2020 at 14:26, Philippe Mathieu-Daud=C3=A9 <philmd@redha=
t.com> wrote:
> >>
> >> On 12/10/20 2:47 PM, marcandre.lureau@redhat.com wrote:
> >>> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >>>
> >>> QEMU requires either GCC or Clang, which both advertize __GNUC__.
> >>> Drop MSVC fallback path.
> >>>
> >>> Note: I intentionally left further cleanups for a later work.
> >>>
> >>> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >>> ---
> >>>  audio/audio.c | 8 +-------
> >>>  1 file changed, 1 insertion(+), 7 deletions(-)
> >>>
> >>> diff --git a/audio/audio.c b/audio/audio.c
> >>> index 46578e4a58..d7a00294de 100644
> >>> --- a/audio/audio.c
> >>> +++ b/audio/audio.c
> >>> @@ -122,13 +122,7 @@ int audio_bug (const char *funcname, int cond)
> >>>
> >>>  #if defined AUDIO_BREAKPOINT_ON_BUG
> >>>  #  if defined HOST_I386
> >>> -#    if defined __GNUC__
> >>> -        __asm__ ("int3");
> >>> -#    elif defined _MSC_VER
> >>> -        _asm _emit 0xcc;
> >>> -#    else
> >>> -        abort ();
> >>> -#    endif
> >>> +      __asm__ ("int3");
> >>
> >> This was 15 years ago... Why not simply use abort() today?
> >
> > That's what I suggested when I looked at this patch in
> > the previous version of the patchset, yes...
>
> Ah, I went back to read v2 thread. Actually I even prefer
> Gerd's suggestion to remove this dead code.
>

And I totally agree. However, I don't want to mix concerns. I am just
removing dead-code.


