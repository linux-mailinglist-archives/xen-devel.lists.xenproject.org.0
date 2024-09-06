Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 335BC96F6C1
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2024 16:31:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791888.1201914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smZzW-0007ax-QT; Fri, 06 Sep 2024 14:31:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791888.1201914; Fri, 06 Sep 2024 14:31:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smZzW-0007YM-Nh; Fri, 06 Sep 2024 14:31:14 +0000
Received: by outflank-mailman (input) for mailman id 791888;
 Fri, 06 Sep 2024 14:31:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M+R7=QE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1smZzV-0006Pi-2H
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2024 14:31:13 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9f19fa0-6c5c-11ef-99a1-01e77a169b0f;
 Fri, 06 Sep 2024 16:31:11 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2f504652853so24295631fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 06 Sep 2024 07:31:11 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3cc697eefsm2493069a12.67.2024.09.06.07.31.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Sep 2024 07:31:09 -0700 (PDT)
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
X-Inumbo-ID: a9f19fa0-6c5c-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725633071; x=1726237871; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GrG0ovnCHv4mvD9b5oe2848HJj1yDnJARVL8M31n7ns=;
        b=OsMrTPAdrdeWKKgJy8lNjzsYhACUs2VCH6hEtudYeJLvd6X5ocYoSPisGVbgSaxaub
         Uwtupg1RcdYRiP/90yk9Bc0a0xe1HloaPE7LtbovqTTn+4oQxuTmt4/EWKKFMKyHem1a
         9xJD+ulm9ra/onZDQpl8Sp7AIVM+OrGNvoxHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725633071; x=1726237871;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GrG0ovnCHv4mvD9b5oe2848HJj1yDnJARVL8M31n7ns=;
        b=FE9jYzRJpXHUBqLbRoHpkdoEZCVbszPFvROWqyNU1WmSBoqbyqAlbINGl8DMo1rQ+8
         qbRi2s64SSP+G40DXWxS8aslGm8I+NOzPIxeWiRx9BSsMRc9GUKmC/SJqgKeG8B2vCV3
         6tOR4CvLUbJfJsYOAkgbuJ03vVVF2sntwMfeyq3wUYFNQTT7jeTIcML4t0QV3ZSzmsI1
         F3w34AfeqyiUgZWfzctxFVqyweCi4zOFYCrde9uFwnv9hpyp/aDj6jeGLCYDhd+Df7Tk
         EJ3PG6Jk1P2+AhWX5ygDX2oT+qfMSD93y3hRJ5DngaYxNtJF8cIdLQKk/ZxqwhgdcvkF
         6QEg==
X-Gm-Message-State: AOJu0Yz3HPv66CFM1ymjGks/3/WnPsRjh3cjF+hBylAe/UvHkJE+w8XB
	AD7XyBR0So9O8P8PBH4NHu36bwlgbdbPgpSHl9zjJIL3WZwWO5lllT7rwuO/I4++x6S+ERLR48c
	4
X-Google-Smtp-Source: AGHT+IFbYJ6XwtoRPcokIhtqdgJINf+IAHweCee0ls/4Y/U472qgFq0yniDvOQjQ0r/e1s095BdvtA==
X-Received: by 2002:a05:651c:211e:b0:2f6:62f3:9709 with SMTP id 38308e7fff4ca-2f751ee6a09mr17810201fa.20.1725633070694;
        Fri, 06 Sep 2024 07:31:10 -0700 (PDT)
Message-ID: <149d01de-571c-44fd-a16b-05891e8082b8@citrix.com>
Date: Fri, 6 Sep 2024 15:31:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] ocaml/libs: Implement a dynamically-loaded plugin
 for Xenctrl.domain_getinfo
To: Andrii Sultanov <andrii.sultanov@cloud.com>
Cc: xen-devel@lists.xenproject.org,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <cover.1725363427.git.andrii.sultanov@cloud.com>
 <e146c0e378f81aee0789dd472aae5f0ed09d8301.1725363427.git.andrii.sultanov@cloud.com>
 <d4985052-a229-48e5-9294-c8392ee74ab5@citrix.com>
 <CAAa3AOMLrpSGQR7bthqvmW7RNbyOWKXG-iYhdATJGVOxyn5VGg@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CAAa3AOMLrpSGQR7bthqvmW7RNbyOWKXG-iYhdATJGVOxyn5VGg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/09/2024 3:20 pm, Andrii Sultanov wrote:
>> > diff --git
> a/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/Makefile
> b/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/Makefile
>> > new file mode 100644
>> > index 0000000000..9c40026cab
>> > --- /dev/null
>> > +++ b/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/Makefile
>> > @@ -0,0 +1,38 @@
>> > +OCAML_TOPLEVEL=$(CURDIR)/../../..
>> > +XEN_ROOT=$(OCAML_TOPLEVEL)/../..
>> > +include $(OCAML_TOPLEVEL)/common.make
>> > +
>> > +CFLAGS += -I $(OCAML_TOPLEVEL)/libs -I
> $(OCAML_TOPLEVEL)/libs/xenstoredglue
>> > +CFLAGS += $(CFLAGS_libxenctrl) $(CFLAGS_xeninclude) $(APPEND_CFLAGS)
>> > +OCAMLOPTFLAGS += -opaque
>> > +OCAMLINCLUDE += -I ./ -I ../
>>
>> I think we only need "-I ../" here.  xen-caml-compat.h is the only local
>> header used.
> 
> With only "-I ../", the build fails:
> ```
> ocamlopt -g -ccopt "   " -dtypes -I ../ -w F -warn-error F -opaque
> -shared -linkall -o domain_getinfo_v1.cmxs  domain_getinfo_v1.cmxa
> /usr/bin/ld: cannot find -ldomain_getinfo_v1_stubs: No such file or
> directory
> collect2: error: ld returned 1 exit status
> ```

Oh ok.  Better keep it then.

~Andrew

