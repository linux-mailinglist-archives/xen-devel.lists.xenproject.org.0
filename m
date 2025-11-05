Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB63C355D3
	for <lists+xen-devel@lfdr.de>; Wed, 05 Nov 2025 12:31:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1156112.1485407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGbiJ-0003Xg-N1; Wed, 05 Nov 2025 11:30:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1156112.1485407; Wed, 05 Nov 2025 11:30:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGbiJ-0003Vr-K9; Wed, 05 Nov 2025 11:30:07 +0000
Received: by outflank-mailman (input) for mailman id 1156112;
 Wed, 05 Nov 2025 11:30:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fQBk=5N=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vGbiI-0003FY-35
 for xen-devel@lists.xenproject.org; Wed, 05 Nov 2025 11:30:06 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5dff474-ba3a-11f0-9d16-b5c5bf9af7f9;
 Wed, 05 Nov 2025 12:30:04 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-b7277324204so25026566b.0
 for <xen-devel@lists.xenproject.org>; Wed, 05 Nov 2025 03:30:04 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b723d3a2fe7sm488099866b.4.2025.11.05.03.29.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Nov 2025 03:29:58 -0800 (PST)
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
X-Inumbo-ID: c5dff474-ba3a-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762342203; x=1762947003; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dmCwwXku2+1/JMALc8pzifXhy1h2tHVWfXtnVGTLoBo=;
        b=CplF72+NttaQOHVgE9H2sgHbQ+6/nos2cM1tamEdMWVnsXdKy1av72Un6wegTg3U63
         jlem/RF6tIkC50Sm/4I87QxnbekgFikB96b3hOnhY0cguBFIR7R/U90kh3cwEOGPSfG9
         jnGts8nEFonSPClEuWNK2f8FZs8bhXinBHyZ1OTO+cydrn2Bid1hH3DyrnJ6APoy6Ico
         OFMQZCeXhA87fkK1FDQHtGjQ1wSt82IPTxS9sgtqBDFy9n/nBsmPrqMukQPj9G5YsJhp
         DikERnSsfMSLZsDIsv+6YYmRdFS1tlkHuB88TvgnsATg30GmAGXPmuHyhRSGk0MNo4Dq
         3hGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762342203; x=1762947003;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dmCwwXku2+1/JMALc8pzifXhy1h2tHVWfXtnVGTLoBo=;
        b=CpRhV7Ih0EOevaLuXuCV70Q/iNdC0fQumr587hsjvp4I7FPRMEfEjv7pHaI0QU2Ayc
         7dZMkyo1pEBnBm5qt0HubKezqZ9e1jMPASM6z5yV+Z9m/h+X+aNRMEBNpqiYHjzm2dVd
         ZXtx74SsL9Yt+YW8x2k5HMEkK1qq+8Li+EwAX6ykxfGlCOBevL/xQdi0Zqv7V9NAusuG
         N9ypKpEQglC53IyzRTM01P2ybZ6Jzo1hp2mLqDTVQ/vTaFRkKp2iYqlH6LO4tOw3JmmX
         zQwAk1YGVm3lsT/q4cX0kkJUeHXaPQhKu20X4KIvvMi+tb3AAFMemTCxjmdO1YiPVwCZ
         BMtA==
X-Forwarded-Encrypted: i=1; AJvYcCUc98IWT9vE4hNPTN+1+kT8OO5YUr9jVFWC32UhyjfVJuyOrbzlA/EDetBSjSGGj0CLiOiHd32TBVU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yze7r3rCNpJNJT7ioIyHy3bDbK3cA20BIsjKDJt1EEuLrApQyQI
	Tntxph4zHoy3T8Kd6I83OEdwyIbOj+6GOD31TPKdx8xrQLDIkbXUbTRB
X-Gm-Gg: ASbGnctmY2cq09GQLjVLRVLJBOrUNpcOLWId2k0gD7bHTIgtK8RBD4czUdlvTSnIuvl
	uhx+GWXjSvf8lopfiNUfm7QEP+5iol2V2UDuGn6//84JlsxnzHdzecji6Rbp4qHMZID9HFVhPWQ
	3Ekb+GPbAB18d9aGOlS1GsNo1/lA4bh5hVKKWeCjR0qT5xvexY9ivtDFMFqvWyf+pfwnli+MiQR
	z9Vn18kX3f2S8slv2HPfD87hOyU1Fs/rtVrNWbASIA/oVoCklpVOKuSM6QRGSwPrKGJeYeNu6Al
	t+r6yJFSNi56dD1CoXdIEXTN29DkXnL77j7sOzDm+nWdVIYD/Ox42n7TX3A5/OsuICRL+0o5j4r
	ZzcPEp3hM5RKukRCEL3ed9YIVLfaf1YDOgEtl/nAkJP+bmV+jhcI1JuXCyTFow6IGXo5g8YRIpD
	Cmxv4XTTbathf0Yov+PsQuXjziRhGajdDoX9US/TcFRObGB+yMVA==
X-Google-Smtp-Source: AGHT+IE2vG7r8CYho0CP/1z15TYNpuk9z/6rZteOwX/GNC9s2AJPnELYU5RlgqEuivo5gzmgzBeJrQ==
X-Received: by 2002:a17:907:948c:b0:b70:df0d:e2f1 with SMTP id a640c23a62f3a-b72653ec470mr279791866b.28.1762342198724;
        Wed, 05 Nov 2025 03:29:58 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------vymPjakhxxNLm3P05sF51UWp"
Message-ID: <c64f865b-3a53-41f4-9800-9a85c3a6099b@gmail.com>
Date: Wed, 5 Nov 2025 12:29:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ocaml/xsd_glue: Fix dynamic linking configuration
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 Rob Hoes <Rob.Hoes@citrix.com>, Pau Ruiz Safont <pau.safont@vates.tech>,
 Andrii Sultanov <andriy.sultanov@vates.tech>
References: <20251104165644.4011663-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20251104165644.4011663-1-andrew.cooper3@citrix.com>

This is a multi-part message in MIME format.
--------------vymPjakhxxNLm3P05sF51UWp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/4/25 5:56 PM, Andrew Cooper wrote:
> The latest oxenstored from Xapi-project fails to start up:
>
>    launch-xenstore[1201]: Starting /usr/sbin/oxenstored...
>    launch-xenstore[1222]: Fatal error: exception
>      Dynlink.Error (Dynlink.Cannot_open_dll "Dynlink.Error (Dynlink.Cannot_open_dll
>      \"Failure(\\\"/usr/libexec/xen//ocaml/xsd_glue/xenctrl_plugin/domain_getinfo_v1.cmxs:
>      undefined symbol: xc_domain_getinfo_single\\\")\")")
>
> This is because domain_getinfo_v1.cmxs isn't dynamically linked correctly.
> Fill in the correct variable, and remove the xen prefix from xenctrl.
>
> Reported-by: Edwin Török<edwin.torok@citrix.com>
> Suggested-by: Edwin Török<edwin.torok@citrix.com>
> Fixes: a6576011a4d2 ("ocaml/libs: Implement a dynamically-loaded plugin for Xenctrl.domain_getinfo")
> Signed-off-by: Andrew Cooper<andrew.cooper3@citrix.com>
> ---
> CC: Christian Lindig<christian.lindig@citrix.com>
> CC: Rob Hoes<Rob.Hoes@citrix.com>
> CC: Pau Ruiz Safont<pau.safont@vates.tech>
> CC: Andrii Sultanov<andriy.sultanov@vates.tech>
> CC: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>
> For 4.21.  Without this, we can't proceed with deprecate oxenstored.

Release-Acked-By: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

>
> This wants backporting to 4.20 too.
>
> Previously this was hidden by oxenstored unexpectedly statically linking
> libxenctrl via the ocaml-evtchn bindings, and became exposed when the bindings
> were moved to use libxenevtchn.
> ---
>   tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/Makefile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/Makefile b/tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/Makefile
> index 4be1feacfe24..6356159020c1 100644
> --- a/tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/Makefile
> +++ b/tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/Makefile
> @@ -11,7 +11,7 @@ OBJS = domain_getinfo_v1
>   INTF = $(foreach obj, $(OBJS),$(obj).cmi)
>   LIBS = domain_getinfo_v1.cmxa domain_getinfo_v1.cmxs
>   
> -LIBS_xsd_glue = $(call xenlibs-ldflags-ldlibs,xenctrl)
> +LIBS_domain_getinfo_v1 = $(call xenlibs-ldflags-ldlibs,ctrl)
>   
>   all: $(INTF) $(LIBS) $(PROGRAMS)
>   
>
> base-commit: 9632ce6fe5b288244d2550cd2e619a55c5168bf8
--------------vymPjakhxxNLm3P05sF51UWp
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/4/25 5:56 PM, Andrew Cooper
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20251104165644.4011663-1-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">The latest oxenstored from Xapi-project fails to start up:

  launch-xenstore[1201]: Starting /usr/sbin/oxenstored...
  launch-xenstore[1222]: Fatal error: exception
    Dynlink.Error (Dynlink.Cannot_open_dll "Dynlink.Error (Dynlink.Cannot_open_dll
    \"Failure(\\\"/usr/libexec/xen//ocaml/xsd_glue/xenctrl_plugin/domain_getinfo_v1.cmxs:
    undefined symbol: xc_domain_getinfo_single\\\")\")")

This is because domain_getinfo_v1.cmxs isn't dynamically linked correctly.
Fill in the correct variable, and remove the xen prefix from xenctrl.

Reported-by: Edwin Török <a class="moz-txt-link-rfc2396E" href="mailto:edwin.torok@citrix.com">&lt;edwin.torok@citrix.com&gt;</a>
Suggested-by: Edwin Török <a class="moz-txt-link-rfc2396E" href="mailto:edwin.torok@citrix.com">&lt;edwin.torok@citrix.com&gt;</a>
Fixes: a6576011a4d2 ("ocaml/libs: Implement a dynamically-loaded plugin for Xenctrl.domain_getinfo")
Signed-off-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>
---
CC: Christian Lindig <a class="moz-txt-link-rfc2396E" href="mailto:christian.lindig@citrix.com">&lt;christian.lindig@citrix.com&gt;</a>
CC: Rob Hoes <a class="moz-txt-link-rfc2396E" href="mailto:Rob.Hoes@citrix.com">&lt;Rob.Hoes@citrix.com&gt;</a>
CC: Pau Ruiz Safont <a class="moz-txt-link-rfc2396E" href="mailto:pau.safont@vates.tech">&lt;pau.safont@vates.tech&gt;</a>
CC: Andrii Sultanov <a class="moz-txt-link-rfc2396E" href="mailto:andriy.sultanov@vates.tech">&lt;andriy.sultanov@vates.tech&gt;</a>
CC: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

For 4.21.  Without this, we can't proceed with deprecate oxenstored.</pre>
    </blockquote>
    <pre>Release-Acked-By: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii</pre>
    <blockquote type="cite"
      cite="mid:20251104165644.4011663-1-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">

This wants backporting to 4.20 too.

Previously this was hidden by oxenstored unexpectedly statically linking
libxenctrl via the ocaml-evtchn bindings, and became exposed when the bindings
were moved to use libxenevtchn.
---
 tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/Makefile b/tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/Makefile
index 4be1feacfe24..6356159020c1 100644
--- a/tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/Makefile
+++ b/tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/Makefile
@@ -11,7 +11,7 @@ OBJS = domain_getinfo_v1
 INTF = $(foreach obj, $(OBJS),$(obj).cmi)
 LIBS = domain_getinfo_v1.cmxa domain_getinfo_v1.cmxs
 
-LIBS_xsd_glue = $(call xenlibs-ldflags-ldlibs,xenctrl)
+LIBS_domain_getinfo_v1 = $(call xenlibs-ldflags-ldlibs,ctrl)
 
 all: $(INTF) $(LIBS) $(PROGRAMS)
 

base-commit: 9632ce6fe5b288244d2550cd2e619a55c5168bf8
</pre>
    </blockquote>
  </body>
</html>

--------------vymPjakhxxNLm3P05sF51UWp--

