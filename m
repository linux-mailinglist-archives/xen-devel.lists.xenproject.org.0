Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AD3787F24
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 07:03:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590492.922789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZOxy-0000PL-KT; Fri, 25 Aug 2023 05:02:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590492.922789; Fri, 25 Aug 2023 05:02:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZOxy-0000NG-Hp; Fri, 25 Aug 2023 05:02:38 +0000
Received: by outflank-mailman (input) for mailman id 590492;
 Fri, 25 Aug 2023 05:02:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=czQt=EK=linaro.org=erik.schilling@srs-se1.protection.inumbo.net>)
 id 1qZOxx-0000NA-ET
 for xen-devel@lists.xenproject.org; Fri, 25 Aug 2023 05:02:37 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ade5f81-4304-11ee-9b0c-b553b5be7939;
 Fri, 25 Aug 2023 07:02:35 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2bcc4347d2dso7439201fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 24 Aug 2023 22:02:35 -0700 (PDT)
Received: from localhost (i5C7438EA.versanet.de. [92.116.56.234])
 by smtp.gmail.com with ESMTPSA id
 s6-20020a1709060c0600b0099d45ed589csm502621ejf.125.2023.08.24.22.02.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Aug 2023 22:02:34 -0700 (PDT)
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
X-Inumbo-ID: 9ade5f81-4304-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692939755; x=1693544555;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+W09V8rePmobt/YJGJeaCGdTTI2+vAGeLCqHBo+BaI=;
        b=eQF0SW8x8BCb40044GBMmL5xPn/2Rc8tRALWLPhqBGmm1cl5RmeS21njMHnbIUI6oT
         RuFg+SrZdYRL20ZtUf9m5ynCO2muYseEno8td/xwjOSoCZOdL0l0Cc/QKqSmtJIGU01Z
         VoS4+A9xcd/veej5PUPPoPKrr5KwpgJYb86ccgYpTZOtvUs+2Jeq3v5ZOIymaTGiWcFQ
         vwSW8pNN1f/BNuFPDpgqZVl1F4mCVOHC4LjK3qlmeq8mLifjqdWdzM6MY4luniUjv7/K
         OT0ffSZ5wZKTNrC/XMnP1jheGzGhyscXwOphdk64ytV/n4K8fYIA8uzqbyyU8Q2fob+f
         3rtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692939755; x=1693544555;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p+W09V8rePmobt/YJGJeaCGdTTI2+vAGeLCqHBo+BaI=;
        b=OOIivG3P+iWsYGvlqFfTKTn7w1ZBa8Hnim2H9RE4QERHzYD7+McYDDWKYKQ+3tODKU
         6t6Epyh6oyzxRA4l4nsKsMiul1Tl379ULysImBsVDnV5HpwIGrp9euqHF4BjEm3sLpRE
         sxMv5SUjaSHg0Urh1e4CYiPjnZHvC+/IQeBtk0ZnGwSAtCwY7afL3vEJOW1A05DZC6Rt
         oP4kIlJ+Sx+wzVKPSvghjQhbwsmicXIOeje1J6kjYT2s3iEZYGtbtmj7s3K/5nmA8jPh
         p2n4hZ0VW3eNkNb4KHnZKFF+CczOjuto4X6qDnjXpzAJYzLybCZcK2HhmKIGQnyDKIYj
         k4Tg==
X-Gm-Message-State: AOJu0YyEw2dz/GHA42qB7ArMVafiltxkL88WTCkOGdRB7ewAmsXaH8LX
	icw2wVNkRN20Bcf3B/gBO60qKQ==
X-Google-Smtp-Source: AGHT+IHC6aIcLo+sue1ratW3RqkpBlDzYrw4PaUrvo64YfqDWZ1Xc3zEslF6SsICHibzUnwaWj2N+A==
X-Received: by 2002:a2e:944a:0:b0:2b9:f0b4:eaa1 with SMTP id o10-20020a2e944a000000b002b9f0b4eaa1mr10761699ljh.16.1692939754684;
        Thu, 24 Aug 2023 22:02:34 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 25 Aug 2023 07:02:33 +0200
Message-Id: <CV1D227LZPCW.2ELMBHY8LE53X@fedora>
Subject: Re: [PATCH v1] tools/hotplug: systemd: Make dependency on Xen
 device nodes
Cc: "Wei Liu" <wl@xen.org>, "Anthony PERARD" <anthony.perard@citrix.com>,
 "Mikko Rapeli" <mikko.rapeli@linaro.org>
To: "Leo Yan" <leo.yan@linaro.org>, <xen-devel@lists.xenproject.org>
From: "Erik Schilling" <erik.schilling@linaro.org>
X-Mailer: aerc 0.15.2
References: <20230825033616.3402812-1-leo.yan@linaro.org>
In-Reply-To: <20230825033616.3402812-1-leo.yan@linaro.org>

On Fri Aug 25, 2023 at 5:36 AM CEST, Leo Yan wrote:
> When system booting up, the kernel module xen_gntdev.ko is loaded and
> the device node '/dev/xen/gntdev' is created; later the xenstored
> service in systemd launches daemon to open this device node.
>
> This flow has a race condition between creating the device node in the
> kernel module and using the device node in the systemd service.  It's
> possible that the xenstored service fails to open the device node due
> to the delay of creating the device node.  In the end, xenbus cannot be
> used between the Dom0 kernel and the Xen hypervisor.
>
> To resolve this issue, we need to synchronize between udev and systemd
> for the device node.  There have an extra change in the udev rules for
> tagging 'systemd' for Xen device nodes, which notifies device node
> creating to systemd; besides udev change, this patch adds dependency in
> systemd service for waiting the device node.
>
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> ---
>
>  The udev rules change is on github:
>  https://github.com/systemd/systemd/pull/28962/commits/520340dfea3b6cf9fe=
7a24c9238313b1a5fe8539

Let's see what they think, but I fear systemd may not be the correct
upstream to carry this... Skimming through the rules that they have
there, it mostly looks like they only carry rules that are relevant for
systemd-related services directly.

>  tools/hotplug/Linux/systemd/xenstored.service.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tools/hotplug/Linux/systemd/xenstored.service.in b/tools/hot=
plug/Linux/systemd/xenstored.service.in
> index 261077dc92..6e48cdb0e7 100644
> --- a/tools/hotplug/Linux/systemd/xenstored.service.in
> +++ b/tools/hotplug/Linux/systemd/xenstored.service.in
> @@ -1,7 +1,7 @@
>  [Unit]
>  Description=3DThe Xen xenstore
> -Requires=3Dproc-xen.mount
> -After=3Dproc-xen.mount
> +Requires=3Dproc-xen.mount dev-xen-gntdev.device
> +After=3Dproc-xen.mount dev-xen-gntdev.device

I must admit that I am a bit confused why this is enough... During our
discussion on Slack, when you quoted from your rule it included
`ENV{SYSTEMD_WANTS}=3D"xenstored.service"`. Did you drop that during later
development? Was there additional reasearch involved in dropping it?

My understanding was that if devices do not exist when systemd builds
its transaction model, dependencies on them will just get tossed out[1].
So I would have expected that there should still be a race if
the .device does not pull in the service.

Did you hit the race frequently enough to be sure that this fixes it in
entirety? Is there a place somewhere in the Xen or kernel code where one
could add an excessive sleep in order to trigger the race more reliably?

[1] "citation-needed": But I vaguely remember dealing with a similar
    issue and getting told this on #systemd IRC

- Erik

