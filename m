Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C47DF84DC94
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 10:15:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678050.1055094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY0Tv-00087X-9j; Thu, 08 Feb 2024 09:14:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678050.1055094; Thu, 08 Feb 2024 09:14:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY0Tv-00085I-6g; Thu, 08 Feb 2024 09:14:07 +0000
Received: by outflank-mailman (input) for mailman id 678050;
 Thu, 08 Feb 2024 09:14:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N3hj=JR=cloud.com=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1rY0Tt-00085C-6M
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 09:14:05 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67423078-c662-11ee-8a4a-1f161083a0e0;
 Thu, 08 Feb 2024 10:14:03 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a26fa294e56so206641466b.0
 for <xen-devel@lists.xenproject.org>; Thu, 08 Feb 2024 01:14:03 -0800 (PST)
Received: from smtpclient.apple ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 h1-20020a1709063c0100b00a372b38380csm1715669ejg.13.2024.02.08.01.14.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Feb 2024 01:14:02 -0800 (PST)
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
X-Inumbo-ID: 67423078-c662-11ee-8a4a-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1707383643; x=1707988443; darn=lists.xenproject.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hVUbvbl2/tPS9JovxVYvASUjcfKuy1BNXPlNtJB8Tc8=;
        b=ZqbrBhcLJshmdOClxTRfVxUY6on6mEMzDXzLjSoz0y7588dBFpR98EulepbkdBnI1x
         Hp+ENA4C6ZsjTMXVQ3BAs9TP/z0kitWhan17rpcow0u7HwrYPE+XEjgcJ8Y986k+HaRq
         8nzgtF+WUGLvSZRn5oYugoGv0t7/d7n5phZKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707383643; x=1707988443;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hVUbvbl2/tPS9JovxVYvASUjcfKuy1BNXPlNtJB8Tc8=;
        b=DZlSpFWpr/S/PnDgqaQRcJ7HU/u3VoLggUA2jv/zfLcpdI4Yjc+Q9f7ELhKO3i/CIp
         4uKJJEROZG19nE5xRDEU9ppc81S9qgh34WMEF6kYtgRguv05QqDK5qupXFWQYZ1s2Nt3
         Q0mo7M8b8DeYn0DB860wsvNIX+iIb7EAQUcIE8SOKF2rmsSYgtmLup3QapqALZV1AtrD
         yabLidOQbzUuCK+4IHrjT3g9aQtUt69JnecR4vgr9LbbVOt7s/yktuVYu99tkaUoUNfz
         kLM39EhcdgMVSPJ5z6nfFawARI6p4X733pvwxHMvDEEIqDRdtrsdix2QhSmL0NQsPsoc
         /NCQ==
X-Gm-Message-State: AOJu0YyQ2zwYW9orxhzZdFq1MomycYV7DigizIith3Hj6li97kWmA3nj
	q5Yu0+cl/yZ35ZG7JhW3IHq8R6oeYJnVkJEK9WxAJuSHDXtADMN+gVAym/0YCdA=
X-Google-Smtp-Source: AGHT+IG6GKz4l5u8ca0bu6orYcFUm4XWtTikWwfW7+VDzhRstJ5EzyJeGLpFV9yqc2y+6/QdED2eww==
X-Received: by 2002:a17:906:4:b0:a37:fb7d:6f21 with SMTP id 4-20020a170906000400b00a37fb7d6f21mr7037565eja.51.1707383643338;
        Thu, 08 Feb 2024 01:14:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXjnLUAUCQ6o/4FF2Ub28aLOdMFIDyw99MMcvTl/+J9jrElWth2YUEmeeqzAdwYWBzK1zlR+QefcEno41yKcAcYpeRIMZsJtSVk+32g8tq30rCQuAW+1dAn7gmFz5r+4oaSHjzDNcef+oNxePC1XbJqXtJxvxagMZn/YvNzozxlR2k=
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.200.91.1.1\))
Subject: Re: [PATCH] tools/ocaml: Add missing vmtrace_buf_kb field
From: Christian Lindig <christian.lindig@cloud.com>
In-Reply-To: <9b9909c9e93cb540b3488c784935acc2bc9e071e.1707343396.git.w1benny@gmail.com>
Date: Thu, 8 Feb 2024 09:13:51 +0000
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 David Scott <dave@recoil.org>,
 Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <3A858D7F-C953-4EF0-8919-AE96D6105AB1@cloud.com>
References: <9b9909c9e93cb540b3488c784935acc2bc9e071e.1707343396.git.w1benny@gmail.com>
To: =?utf-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
X-Mailer: Apple Mail (2.3774.200.91.1.1)



> On 7 Feb 2024, at 22:04, Petr Bene=C5=A1 <w1benny@gmail.com> wrote:
>=20
>=20
> Add the missing `vmtrace_buf_kb` field to the OCaml bindings to match =
the
> vm.cfg configuration, correcting an oversight from its initial =
introduction.
>=20
> Signed-off-by: Petr Bene=C5=A1 <w1benny@gmail.com>

Acked-by: Christian Lindig <christian.lindig@cloud.com>

This looks correct from an OCaml perspective. Why was the new field =
added in the middle of the record type domctl_create_config and thus =
forcing changes to the index of fields coming later in the record versus =
just appending the new field to the record type?

The critical bit is using the correct type in =
"Int32_val(VAL_VMTRACE_BUF_KB)=E2=80=9D that matches the type =
"vmtrace_buf_kb: int32;=E2=80=9D - which it does.

=E2=80=94- C=

