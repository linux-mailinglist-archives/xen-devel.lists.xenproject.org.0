Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EAB950A3E
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 18:34:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776450.1186601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sduT6-0007Qz-VU; Tue, 13 Aug 2024 16:33:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776450.1186601; Tue, 13 Aug 2024 16:33:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sduT6-0007PV-S5; Tue, 13 Aug 2024 16:33:56 +0000
Received: by outflank-mailman (input) for mailman id 776450;
 Tue, 13 Aug 2024 16:33:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EOoy=PM=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sduT5-0007PP-A4
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 16:33:55 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d312d730-5991-11ef-8776-851b0ebba9a2;
 Tue, 13 Aug 2024 18:33:52 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5bb8e62575eso2222236a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Aug 2024 09:33:52 -0700 (PDT)
Received: from localhost ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bd343e484esm1913466a12.95.2024.08.13.09.33.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Aug 2024 09:33:50 -0700 (PDT)
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
X-Inumbo-ID: d312d730-5991-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1723566831; x=1724171631; darn=lists.xenproject.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x0qShhTQymlQRj8RBJVu0uLqhFXz8Uwy5O32YELhPXE=;
        b=cafDcfhZstKOJUOvIMvIGFNQm1A2im4qDtu4hk3H9aCuaZZSPw/G9aqciIDAXKjOec
         XhDgeHxMSTOIV+tMwnMkebo4DQPLQENXELIqTOSvPCiGNeucVq0ltxgm2tQf1fJhCxbS
         OGcb0UT03G2XboE5091SaxEpD2QfidnlSzSsA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723566831; x=1724171631;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x0qShhTQymlQRj8RBJVu0uLqhFXz8Uwy5O32YELhPXE=;
        b=lMj+9/0El180kr3k+n4k2y+8CAOHmLyv98ioLHOX9AQNdo5A4eSwCx26hhZHKRgYR9
         I4sKagSQRNbHVL3A5tMVD87GOxukPolI2O5i8cagPaaLLzVTKazx6eP6BLd+UofdCHBL
         bgj9mR1uyHZQCA+gcB/nU+cDSZwE6LHzzTEFKVhUR65Z1bVkejV5Z/GDnFIhgIse6xs6
         5ynijc5Z1I8u5ePKF7qB4pdHr9nqlvZY/ZOL1sMf+IIwksM6Uhm+Hb+8Qw5Gl2CRpTEu
         xYGcJ7yYDKX3Nq0pqTHJBgT62/5BiuR8Me6UQLVjDXw9rIL5qkGmu9naR5huGmQgFHXL
         I9ow==
X-Forwarded-Encrypted: i=1; AJvYcCWGyjk1wFZoAAs7IOFITD2F3Ayh4yYNOr0AvBTkDGM+xTVjlKakamvcUwjMnIwDJTT9hreX2pvLitPhSc4z/nMngs2bLxuTFkHoKiuSmIY=
X-Gm-Message-State: AOJu0YxpPzqgc3+bilzk89Ffv0ACegX8UMKjs8riMGBbcDVBV8scuXPu
	Gr6R8ELD4U860QVOLL5V7SjukEHkVb/y+N7zQFvQjlqDl/FOn6vk2QK8XJ24YZ4=
X-Google-Smtp-Source: AGHT+IFiwaiEFXirdC6Wt6fyVq8saqaXmZU64ekcG7onN50GsIleC7SyfbgnWMvHzFIAUfV5Xw3C7w==
X-Received: by 2002:a05:6402:2549:b0:5a2:3df7:bb6a with SMTP id 4fb4d7f45d1cf-5bea1cb38f1mr48200a12.31.1723566831161;
        Tue, 13 Aug 2024 09:33:51 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Aug 2024 17:33:49 +0100
Message-Id: <D3EXG6HDKMYR.15275C42NLLBL@cloud.com>
Subject: Re: [PATCH v3 2/2] x86/fpu: Split fpu_setup_fpu() in three
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Xen-devel"
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.17.0
References: <20240813142119.29012-1-alejandro.vallejo@cloud.com>
 <20240813142119.29012-3-alejandro.vallejo@cloud.com>
 <c83942d9-bb55-45c2-9a44-314266ce14c0@suse.com>
In-Reply-To: <c83942d9-bb55-45c2-9a44-314266ce14c0@suse.com>

On Tue Aug 13, 2024 at 3:32 PM BST, Jan Beulich wrote:
> On 13.08.2024 16:21, Alejandro Vallejo wrote:
> > It was trying to do too many things at once and there was no clear way =
of
> > defining what it was meant to do. This commit splits the function in th=
ree.
> >=20
> >   1. A function to return the FPU to power-on reset values.
> >   2. A function to return the FPU to default values.
> >   3. A x87/SSE state loader (equivalent to the old function when it too=
k a data
> >      pointer).
> >=20
> > While at it, make sure the abridged tag is consistent with the manuals =
and
> > start as 0xFF.
> >=20
> > Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>
> > ---
> > v3:
> >   * Adjust commit message, as the split is now in 3.
> >   * Remove bulky comment, as the rationale for it turned out to be
> >     unsubstantiated. I can't find proof in xen-devel of the stream
> >     operating the way I claimed, and at that point having the comment
> >     at all is pointless
>
> So you deliberately removed the comment altogether, not just point 3 of i=
t?
>
> Jan

Yes. The other two cases can be deduced pretty trivially from the condition=
al,
I reckon. I commented them more heavily in order to properly introduce (3),=
 but
seeing how it was all a midsummer dream might as well reduce clutter.

I got as far as the original implementation of XSAVE in Xen and it seems to
have been tested against many combinations of src and dst, none of which wa=
s
that ficticious "xsave enabled + xsave context missing". I suspect the
xsave_enabled(v) was merely avoiding writing to the XSAVE buffer just for
efficiency (however minor effect it might have had). I just reverse enginee=
ring
it wrong.

Which reminds me. Thanks for mentioning that, because it was really just
guesswork on my part.

Cheers,
Alejandro

