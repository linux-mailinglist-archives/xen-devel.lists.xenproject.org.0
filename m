Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEAD96F696
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2024 16:23:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791871.1201884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smZs8-0004NL-H8; Fri, 06 Sep 2024 14:23:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791871.1201884; Fri, 06 Sep 2024 14:23:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smZs8-0004LF-EQ; Fri, 06 Sep 2024 14:23:36 +0000
Received: by outflank-mailman (input) for mailman id 791871;
 Fri, 06 Sep 2024 14:23:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M+R7=QE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1smZs7-0004L9-Is
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2024 14:23:35 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9909489d-6c5b-11ef-99a1-01e77a169b0f;
 Fri, 06 Sep 2024 16:23:33 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2f50f1d864fso24749511fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 06 Sep 2024 07:23:33 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3cc6a51b0sm2453029a12.86.2024.09.06.07.23.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Sep 2024 07:23:31 -0700 (PDT)
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
X-Inumbo-ID: 9909489d-6c5b-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725632613; x=1726237413; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=g4kr1vy0eoOW1tu67LORb1Xl9lP5+PplLtYFRIqXhNY=;
        b=sJLhrkdNPtCLZfQXOU1yMpIQu6gj+/C+GwVucunu2x8HxLV0qS1BolygUp0pVa5+s2
         s2fp96UqnADtpb3IQN7CNhqzjG3uRLVcHb9Ck134qf4a1rv25Y+le6ZTeaiuzFZkV1Zx
         ULwwfDBtmGIlG9TWIBEU7jnSLKJpMiE+QJtPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725632613; x=1726237413;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g4kr1vy0eoOW1tu67LORb1Xl9lP5+PplLtYFRIqXhNY=;
        b=waZ+w8Bb4w4ZGYmQUx43oT5U43/s/oQgxull6L3oZz+u1RJIbI0NWcEV2OlnoDxheG
         3Mll7RO5qRyye4h/aPxyrhs6msoGsK1eZc28MsFQc4qAlifRIQflJMkTwAELwP34Tehb
         Vxvyg8uSmTdODzDMuK80U5rapAGdEvP5RA/09L59Oc3erDIXs2yLfDXwur0b45bH0ex3
         2PPcRdcl26auGD/nl3UhJpTLx/3zJF0ZaToeiIqIzUXOBjs6I2f/YjR0LvnBCtv3a0t9
         Z9oMqVSrYAQ4dTZsYszw6VdwjvOMqOTnZVxy9fbig5EaliGBswjrawNpXEOTPxnmoYqb
         5N5w==
X-Forwarded-Encrypted: i=1; AJvYcCWpFsAsqCQqzCcJrVgbxa0t6C1oLBv/CtepAsLuCA6y06ZcDCebrV3mpfHM0TDLs0JViz6tHrT2H00=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywqx/ctZSfYCTxvUiCm5FyiFIDCpfarm7/1y2CqfkRRYHGw4Zib
	+I4dTDs2MTAUVELexTQJtCnVike7RxxcBeMxzreSb37zNSumvbXm98acTQXOg1k=
X-Google-Smtp-Source: AGHT+IFRd9jC6XGmSr0/nFX5HZyjWIdKf07Jp8P/AjS0kzCLVoq+J01ghQ7il884LBwFPI6yaUBiQA==
X-Received: by 2002:a2e:be2c:0:b0:2f3:f068:b107 with SMTP id 38308e7fff4ca-2f751f86592mr23924381fa.40.1725632612333;
        Fri, 06 Sep 2024 07:23:32 -0700 (PDT)
Message-ID: <27afc902-e5bd-4a81-9e6d-70a709b3c92a@citrix.com>
Date: Fri, 6 Sep 2024 15:23:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] ocaml/libs: Implement a dynamically-loaded plugin
 for Xenctrl.domain_getinfo
To: Andrii Sultanov <andrii.sultanov@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <cover.1725363427.git.andrii.sultanov@cloud.com>
 <e146c0e378f81aee0789dd472aae5f0ed09d8301.1725363427.git.andrii.sultanov@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <e146c0e378f81aee0789dd472aae5f0ed09d8301.1725363427.git.andrii.sultanov@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/09/2024 12:44 pm, Andrii Sultanov wrote:
>  tools/ocaml/Makefile                          |   1 +
>  tools/ocaml/libs/Makefile                     |   2 +-
>  tools/ocaml/libs/xenstoredglue/META.in        |   4 +
>  tools/ocaml/libs/xenstoredglue/Makefile       |  46 +++++
>  .../domain_getinfo_plugin_v1/META.in          |   5 +
>  .../domain_getinfo_plugin_v1/Makefile         |  38 ++++
>  .../domain_getinfo_stubs_v1.c                 | 172 ++++++++++++++++++
>  .../domain_getinfo_v1.ml                      |  36 ++++
>  .../domain_getinfo_v1.mli                     |   0
>  .../libs/xenstoredglue/plugin_interface_v1.ml |  28 +++
>  .../xenstoredglue/plugin_interface_v1.mli     |  36 ++++
>  11 files changed, 367 insertions(+), 1 deletion(-)
>  create mode 100644 tools/ocaml/libs/xenstoredglue/META.in
>  create mode 100644 tools/ocaml/libs/xenstoredglue/Makefile
>  create mode 100644 tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/META.in
>  create mode 100644 tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/Makefile
>  create mode 100644 tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_getinfo_stubs_v1.c
>  create mode 100644 tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_getinfo_v1.ml
>  create mode 100644 tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_getinfo_v1.mli
>  create mode 100644 tools/ocaml/libs/xenstoredglue/plugin_interface_v1.ml
>  create mode 100644 tools/ocaml/libs/xenstoredglue/plugin_interface_v1.mli

Only noticed after some trial builds.

This patch should include tools/ocaml/libs/xenstoredglue/.gitignore
which causes these paths:

tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/.ocamldep.make
tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_getinfo_v1.annot
tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_getinfo_v1.cmi
tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_getinfo_v1.cmx
tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_getinfo_v1.cmxa
tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_getinfo_v1.cmxs

to get ignored.  Although, I don't see any local gitignores, so I
suspect it's still the root .gitignore which wants adjusting.

I'll see about doing another cleanup patch.

~Andrew

