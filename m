Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8771A9F3357
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 15:37:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858188.1270450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNCEA-0007MQ-Br; Mon, 16 Dec 2024 14:37:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858188.1270450; Mon, 16 Dec 2024 14:37:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNCEA-0007Jg-8q; Mon, 16 Dec 2024 14:37:42 +0000
Received: by outflank-mailman (input) for mailman id 858188;
 Mon, 16 Dec 2024 14:37:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XQSc=TJ=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tNCE8-0007JW-6h
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 14:37:40 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c8ee97d-bbbb-11ef-a0d6-8be0dac302b0;
 Mon, 16 Dec 2024 15:37:39 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-385f06d0c8eso1998259f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2024 06:37:39 -0800 (PST)
Received: from localhost ([85.152.134.39]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c8012081sm8286251f8f.19.2024.12.16.06.37.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2024 06:37:38 -0800 (PST)
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
X-Inumbo-ID: 4c8ee97d-bbbb-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1734359858; x=1734964658; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qmixK1R7uIJ58XLLGHalch+xpsQmxBAYBg2y8shx5Vc=;
        b=PExY6CiB01tgK3v7pfwulHNCsYLfxeXAcpBWVApD7+R8bmeT2gHn1XtKBFdDLtw4p1
         jcCGdFD8hpiAqF+VqB1h6J/Qw6WijZQd4Y0BJuQMjB4tGGePGTraGMqO7PWnbv/VuBBx
         7iBZvsZGsBaaTK9SOSm3aeDVNzx/30G0qAyUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734359858; x=1734964658;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qmixK1R7uIJ58XLLGHalch+xpsQmxBAYBg2y8shx5Vc=;
        b=h9q1/6bTRdXrgrlJLng/7rwKDkwpRAqR+WTp8/fiKjL53ak2IOi9X4zrV45qqpzHWm
         7Yk19JgZbKxaivBOEvHGn+fsBBiBna4kyihk+FptF47J9ZD+qUn2PQ9HJJ8HrvenMsn4
         lkBa9E+juls06evwszV6gRK9SF1R5+t1pXZzwiRKmVNF8IM9nyOqBhQDwvEvY3rEldpp
         KtZVoWrOcNtB2dZplker2HmTI0bCiCIwknDNzq04u7pUc1FQ5Bu9H3Ykcu/kaVf8NBVv
         Yh518z7iyRiB45YbT79yii42S+LBUAC9jHvLDNgrSg1kaeuxPMWUsfulGF0My49QYmLy
         dfmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAvkpBpFWAodzxJIGaz/8tdYyIjZylAP+BoIC+y08SyimENWbiXBqfRkfz2oSJB2bFD9KoJJ8bSVc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzoDgAsPYC8r9Cj+Z5QeST5Kqo8T0M0UXPX9CD/UcEGSGYlU2UP
	HxffxQ/P0SSLAGWhfnLD1hTJS5Tg8NJBrWH5w6q6mw5/pu0SdX3RPn0iVlDO81U=
X-Gm-Gg: ASbGnctOrTadnRXey4PqS0666cMvdR/bm+o0g7gSL9++pQSaFHqUtbWlZxRQpVeaTWA
	g0fJ+LJbYTsLyLlgvLxCh+MpHQOt3N3qUQJp3iQkNsM2jC9KUgsp/E1ARnQJC+luPEwAvvJ3v6G
	ix1fjWbhzY/4ctodS/DX75y8vclDJRXDihFD+EaN3Xm7AuILn7pH2ffExIY/6OrT24NUhihIRYj
	QLdjvjNy/ruG0VeoYKlcnd7MLUttm0NKrzp67gW54oKJq3HMKoFRhC1+Efosk4=
X-Google-Smtp-Source: AGHT+IHKOQ1T5zlzLZ1O7ljZch543RGQEbbglxnGxBnY+tQAj+mQO79eo+CHbl0Fa4jGd/yyvzENlA==
X-Received: by 2002:a05:6000:1fa9:b0:385:de67:2269 with SMTP id ffacd0b85a97d-3888e0b86f2mr11888788f8f.36.1734359858573;
        Mon, 16 Dec 2024 06:37:38 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Dec 2024 14:37:35 +0000
Message-Id: <D6D79AABU8DJ.23P477VLAQ9XW@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 09/13] x86/emulator: Refactor FXSAVE_AREA to use
 wrappers
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
X-Mailer: aerc 0.18.2
References: <20241105143310.28301-1-alejandro.vallejo@cloud.com>
 <20241105143310.28301-10-alejandro.vallejo@cloud.com>
 <bc308e63-5791-4e29-a218-0c83728c116a@suse.com>
 <D6D3VA6T02AX.3PVLA7M6C30H@cloud.com>
 <96c6dbc9-05f3-4e55-acee-5e9f9e2c93e5@suse.com>
In-Reply-To: <96c6dbc9-05f3-4e55-acee-5e9f9e2c93e5@suse.com>

On Mon Dec 16, 2024 at 12:01 PM GMT, Jan Beulich wrote:
> On 16.12.2024 12:58, Alejandro Vallejo wrote:
> > On Mon Dec 9, 2024 at 4:26 PM GMT, Jan Beulich wrote:
> >> On 05.11.2024 15:33, Alejandro Vallejo wrote:
> >>> --- a/xen/arch/x86/x86_emulate/blk.c
> >>> +++ b/xen/arch/x86/x86_emulate/blk.c
> >>> @@ -11,9 +11,12 @@
> >>>      !defined(X86EMUL_NO_SIMD)
> >>>  # ifdef __XEN__
> >>>  #  include <asm/xstate.h>
> >>> -#  define FXSAVE_AREA ((void *)&current->arch.xsave_area->fpu_sse)
> >>> +/* has a fastpath for `current`, so there's no actual map */
> >>> +#  define FXSAVE_AREA ((void *)VCPU_MAP_XSAVE_AREA(current))
> >>> +#  define UNMAP_FXSAVE_AREA(x) VCPU_UNMAP_XSAVE_AREA(currt ent, x)
> >>
> >> The typo of the first argument strongly suggests that the macro should
> >> already now evaluate its parameters, also pleasing Misra.
> >=20
> > Not an unreasonable takeaway. I can expand as follows instead:
> >=20
> > #define VCPU_UNMAP_XSAVE_AREA(v, x) ({ (void)(v); x; })
> >=20
> > Thoughts?
>
> Why would x not also be cast to void?
>
> Jan

it should have the "x =3D NULL", in fact.

  #define VCPU_UNMAP_XSAVE_AREA(v, x) do { (void)(v); (x) =3D NULL; } while=
(0)

Regardless, the important bit was adding a separate statement for (v) caste=
d to
void. Leaving the rest as-is.

Cheers,
Alejandro

