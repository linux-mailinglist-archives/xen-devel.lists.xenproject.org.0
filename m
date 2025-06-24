Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA62EAE6A54
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 17:13:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023834.1399911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU5Ke-0000M7-Us; Tue, 24 Jun 2025 15:13:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023834.1399911; Tue, 24 Jun 2025 15:13:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU5Ke-0000Ke-Qx; Tue, 24 Jun 2025 15:13:08 +0000
Received: by outflank-mailman (input) for mailman id 1023834;
 Tue, 24 Jun 2025 15:13:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aTSQ=ZH=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uU5Kc-0000KY-Rk
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 15:13:06 +0000
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [2607:f8b0:4864:20::c2c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba11ab92-510d-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 17:13:05 +0200 (CEST)
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-610db3f3f90so248769eaf.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 08:13:05 -0700 (PDT)
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
X-Inumbo-ID: ba11ab92-510d-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1750777984; x=1751382784; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XxSLs0Zy2EVf7+xTJftz9OoG0jRFzUdFRd/V1EooDck=;
        b=Vo8rrF7ndqrMCJa8Ni7ifVn+qMYRQIGjBZaXeyk++SMYh6XQu8BBcFagSIUmGqvKjs
         HE0P05DNjpivvV0Vlje/Pg7uJtjffh9VX91HOFoLa9fXcXxC0JxzHXh3TdhqKBfoAYLD
         vLx1h3Eq1tBeNqNAKYWgGV/c5PyEnMZBBEbqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750777984; x=1751382784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XxSLs0Zy2EVf7+xTJftz9OoG0jRFzUdFRd/V1EooDck=;
        b=aLICluzIGq9WOiLVDlMO5ExwKqv81+fyKN2b7QzpFCr0yp3eKHKnYWQruN+JV0gTt2
         Hqv+vNnOC2zS9cQ+wXQYRMzCI/U0C/823lWvkWZ4a6z0K1vxFULP9NkCRBd4+Lvm9bJ2
         QrXOdorpcnu2gwi+XbQI3H5+29d95AJdSHD9LZgqlslsyA2Cfhs42uO+kqXzdORx5M5H
         MxcVHqlxQj5D0LUAOB9NVZoaE4OXEb8iJPsiQkV+Lw98mzv6xODB/o+YyUnL1WxvB+OQ
         vZr0blove8ugCJOfPY15f0IydyTDXaTU7/+wvwaf7zFp4EJVGl8xbCF71QDsyQmd1Jaz
         BdAg==
X-Gm-Message-State: AOJu0Yyrx6dSx04Ks80yFoPJRhYCXvoekDIi8TW78z8BfMFEeHJuUvan
	s0tRF8ISC8vOBZRw4hTeolWkc66OJtfHSWUqhj+rXG5O+WfwV08RsePrhzOd6fFCMPcvVpEyz2S
	U5fgjcQ0qbTIg8tSO7Szio2lmIdFFPWx9uMoQtjlMsg==
X-Gm-Gg: ASbGncvk0bm0DSzrLBVxxjpaiEouu0zp7yv2O8vCXxqkOz9xjBF5LUKX4a9GczDq9SK
	W7zXoAq7IW+j2dbb1ljtg8w+QKim/PY67jlodo3a7YRT/o5nWit2rUQgKDH15bEAxBy+6Xh7ojQ
	zQndsiPlmxMg8b1z7HN+2XZRKX6kZYygvP65ISUM7O
X-Google-Smtp-Source: AGHT+IGhG5YRXNh7ltEOHNr24yRx2e25hNQPik3tsdapkO8F67KZajZlYUraVtz/dLDZHi1oFdW3RrrFugNJ27UYE8k=
X-Received: by 2002:a05:6870:e8a:b0:2e9:d485:5ad4 with SMTP id
 586e51a60fabf-2efaf43e171mr165687fac.33.1750777984057; Tue, 24 Jun 2025
 08:13:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250624083157.9334-1-frediano.ziglio@cloud.com>
 <20250624083157.9334-2-frediano.ziglio@cloud.com> <aFqcQe5quyjhu24P@mail-itl>
 <CACHz=ZjcZRtjHnUPFRRYd4d-ESv4j2_ssjSTne=6NGCf0s2vBw@mail.gmail.com> <aFq3sYCAglRrMb8I@mail-itl>
In-Reply-To: <aFq3sYCAglRrMb8I@mail-itl>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Tue, 24 Jun 2025 16:12:46 +0100
X-Gm-Features: AX0GCFv4y0XEz-NK9ew9bIA39XR6y5Ktd--rTrtlhFUZIKGigicUL4fJY8rY7EM
Message-ID: <CACHz=ZjbVRWtRc8HHFYZo0CKv4wFq2bwS_emmuZJUawTyBERCw@mail.gmail.com>
Subject: Re: [PATCH 1/2] xen/efi: Handle cases where file didn't come from ESP
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 3:35=E2=80=AFPM Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> On Tue, Jun 24, 2025 at 03:05:25PM +0100, Frediano Ziglio wrote:
> > OT: the flow of read_file (specifically "what" handling) looks
> > weird... can I change it?
>
> It tries to avoid duplication of PrintErr calls, while including what
> failed in the error message. Looks like somebody really wanted to avoid
> using goto here... Sure, if you want to clean it up go ahead.
>

2 styles came into my mind
gotos: https://gitlab.com/xen-project/people/fziglio/xen/-/blob/flow1/xen/c=
ommon/efi/boot.c?ref_type=3Dheads#L765
no errors: https://gitlab.com/xen-project/people/fziglio/xen/-/blob/flow2/x=
en/common/efi/boot.c?ref_type=3Dheads#L765

What do you think?

Frediano

