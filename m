Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9A295B4F0
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2024 14:25:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781816.1191318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sh6sR-00056J-4x; Thu, 22 Aug 2024 12:25:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781816.1191318; Thu, 22 Aug 2024 12:25:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sh6sR-00054U-2H; Thu, 22 Aug 2024 12:25:19 +0000
Received: by outflank-mailman (input) for mailman id 781816;
 Thu, 22 Aug 2024 12:25:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gAWf=PV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sh6sP-00054O-Oa
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2024 12:25:17 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96a3e89e-6081-11ef-a50a-bb4a2ccca743;
 Thu, 22 Aug 2024 14:25:16 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-367990aaef3so335702f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Aug 2024 05:25:16 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f4f46a2sm113101166b.208.2024.08.22.05.25.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Aug 2024 05:25:15 -0700 (PDT)
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
X-Inumbo-ID: 96a3e89e-6081-11ef-a50a-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724329516; x=1724934316; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9G/PNpDU1KLjRYj6yyi5WJf+sjPLdAU05FGixmMV1/I=;
        b=C4yHM3vOGDoUgGXrGkagxLBKvF+HcTE3H3ATkdfMgi83RFeUb77M8Zhpd3usiGVbbD
         bf2WRj5n3TBsR+Xk/NFvOULsmnbD0kBUHjDoEMhDWOGP3xIBynAtr2uUol1o/DX304SS
         h8368OwgOSdj5QXZ8KEo2XnrmB7cGmmBI9K1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724329516; x=1724934316;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9G/PNpDU1KLjRYj6yyi5WJf+sjPLdAU05FGixmMV1/I=;
        b=F2wBtyJQaHp0my6ho7xlX+/7ctUMkkMN1OWiVEV4F1dTeDl2P0e65lNfCUjEVYQA2W
         SKyxzHzxKI3uI8ngdUZ4NK0l4lhMRtCgdo0p8k7iqboHjLUxPkzq9V4VFJ3OOPELlefw
         xnK0BMqem2BRk77OYDfCgVRaXFIwBLlBT2qSU5xSEiEtXbNZeCg1TS80hcr0yO1GjVoW
         7KKQMvb2MIG/dpLW8gJ63EzjOWtEhhoZlqatf0ZLux/VI/02F+djB7QotBmalnO1Ov1T
         ot95hHCTKxZgYgbw3qWeMxNXTwb2E2ArQyQ+7PpgjDDAp1C+G2SN19GDlmjR4LAC6Dw0
         5C5A==
X-Forwarded-Encrypted: i=1; AJvYcCX0e7WhwTQ7mk4laRxVduCKiPaxE67MaU+YwEel/dDwG0ooH0qZ1YZhO7r0XkhOfeX28n6gS3+3MO0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxkF4nSoXTGjnUv0Sik4DdMcD2LUCvAilThIKAgSLFNSf31kv60
	kyBum86F1Z4LL8wDRhUsq8uSViOrt15d43W1z/ZvScEfcI7OhRlLuCPH6WEdCS0=
X-Google-Smtp-Source: AGHT+IGHsReVvLmDYRNbLdWWP1ilJowM7K9mTb5ss5fiZyfJfHcpyLJeChk9f/a15HTRnt9r4Qy6mA==
X-Received: by 2002:a5d:4e8f:0:b0:368:4e2e:7596 with SMTP id ffacd0b85a97d-372fd6c0823mr3495945f8f.37.1724329515644;
        Thu, 22 Aug 2024 05:25:15 -0700 (PDT)
Message-ID: <e184ccf6-47da-443f-9170-dd503d225bf6@citrix.com>
Date: Thu, 22 Aug 2024 13:25:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] tools/ocaml/common.make: Remove '-cc $(CC)' flag
 from OCAMLOPTFLAGS
To: Andrii Sultanov <andrii.sultanov@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>, Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>
References: <cover.1724314239.git.andrii.sultanov@cloud.com>
 <110f63b76a12e8a9fead09f47319a35229222953.1724314239.git.andrii.sultanov@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <110f63b76a12e8a9fead09f47319a35229222953.1724314239.git.andrii.sultanov@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/08/2024 10:06 am, Andrii Sultanov wrote:
> This flag does not work as assumed and will not pass
> options (such as -shared) to the C compiler:
> https://github.com/ocaml/ocaml/issues/12284
>
> Signed-off-by: Andrii Sultanov <andrii.sultanov@cloud.com>
> ---
>  tools/ocaml/common.make | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/ocaml/common.make b/tools/ocaml/common.make
> index 0c8a597d5b..cc126b749f 100644
> --- a/tools/ocaml/common.make
> +++ b/tools/ocaml/common.make
> @@ -12,7 +12,7 @@ OCAMLFIND ?= ocamlfind
>  CFLAGS += -fPIC -I$(shell ocamlc -where)
>  
>  OCAMLOPTFLAG_G := $(shell $(OCAMLOPT) -h 2>&1 | sed -n 's/^  *\(-g\) .*/\1/p')
> -OCAMLOPTFLAGS = $(OCAMLOPTFLAG_G) -ccopt "$(LDFLAGS)" -dtypes $(OCAMLINCLUDE) -cc $(CC) -w F -warn-error F
> +OCAMLOPTFLAGS = $(OCAMLOPTFLAG_G) -ccopt "$(LDFLAGS)" -dtypes $(OCAMLINCLUDE) -w F -warn-error F
>  OCAMLCFLAGS += -g $(OCAMLINCLUDE) -w F -warn-error F
>  
>  VERSION := 4.1

This patch itself is fine, and I'll commit it in due course, but then I
got looking at the surrounding context...

`$(OCAMLOPT) -h` tells you on stderr to try `--help instead`, so
OCAMLOPTFLAG_G is never going to contain -g.

Also, why is -g conditional for OCAMLOPTFLAGS but unconditional for
OCAMLCFLAGS?  I think we can safely drop OCAMLOPTFLAG_G


Next, there's VERSION and git grep says its only used in META files.

xen.git/tools/ocaml$ git grep -w VERSION
Makefile.rules:43:      sed 's/@VERSION@/$(VERSION)/g' < $< $o
common.make:18:VERSION := 4.1
libs/eventchn/META.in:1:version = "@VERSION@"
libs/mmap/META.in:1:version = "@VERSION@"
libs/xb/META.in:1:version = "@VERSION@"
libs/xc/META.in:1:version = "@VERSION@"
libs/xenstoredglue/META.in:1:version = "@VERSION@"
libs/xenstoredglue/domain_getinfo_plugin_v1/META.in:1:version = "@VERSION@"
libs/xs/META.in:1:version = "@VERSION@"

4.1 is very very stale and should say 4.19 these days (definitely for
xc, and whatever else is using an unstable API), yet should definitely
not be 4.19 for xenstoredglue.

Are there any ABI/API implication from changing the META file?

~Andrew

