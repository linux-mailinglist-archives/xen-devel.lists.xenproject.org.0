Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 542732CC79C
	for <lists+xen-devel@lfdr.de>; Wed,  2 Dec 2020 21:19:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43002.77378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkYZe-0004Bu-K0; Wed, 02 Dec 2020 20:18:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43002.77378; Wed, 02 Dec 2020 20:18:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkYZe-0004BV-Gn; Wed, 02 Dec 2020 20:18:02 +0000
Received: by outflank-mailman (input) for mailman id 43002;
 Wed, 02 Dec 2020 20:18:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X14H=FG=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1kkYZd-0004BQ-N1
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 20:18:01 +0000
Received: from mail-io1-xd43.google.com (unknown [2607:f8b0:4864:20::d43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bfff363c-9dc3-4be9-b6de-9344e0d4efbb;
 Wed, 02 Dec 2020 20:18:00 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id n4so2838840iow.12
 for <xen-devel@lists.xenproject.org>; Wed, 02 Dec 2020 12:18:00 -0800 (PST)
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
X-Inumbo-ID: bfff363c-9dc3-4be9-b6de-9344e0d4efbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=imOsHZ8UM7k2PqA8O+sHJ8lLeteNEVL/iOURmAIDRzs=;
        b=YVI++cRdislCT0pqLziNmY07cMrzMaRRyo/bg+OnOunK0TjuLN46oD1Fgsmb45irUj
         pomtFMYzxtICc1wZfYv1PpfGed/fNZanjbBDdiP6LnsfQ2NnFqtjuVrC1/eszVO5Ksyr
         dDnJoPIcfW/7t90rWKKtqmnPQOtTniKefkBae1QCYlNbxnUsmDMiZO11/iBEdVD1+MuW
         tT1vPjNXgTxzcc5LFTUhw7v5KCFuayV/JFyFBZALL12jPMFX2t4gUQo/qJYudqLDSNm9
         rLXju7QSBIi5U94JWFX+jbJAJ3sC0ne4uh4CdUv+3Dte/iopxngHLphNceER/WxjWxHz
         wVLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=imOsHZ8UM7k2PqA8O+sHJ8lLeteNEVL/iOURmAIDRzs=;
        b=k4rpKvbTMjc7eeg1QQIvG6wgrZptLjKG5H6zo+NYCQzHy+1c1nhZruXguUdO3EjStp
         G0qxBDQSybH9GLg9wIwOiOeswcMFeyVtNqNjwe8/YSnia8Uo9JLOJKzLZHhuzdHUNx6w
         /QFsYE5vNUJEZOozhrzIlX1GCTgZURQ1RxmMukNV34MhvOWcwkg8ALqyoeGQRpwjQnLC
         NwC28A0q6cMlYFYST7YXxCYDiIlaiM/DqD5WHR6j4aBbw2h7A8dj/IzBuniRI/coOcIP
         dk/33pjL+1qIgiDyizhY5x5AywdfFjJkCcPVcctgYIZ6FjgJFTnUgCHrQzx6djXNuKIF
         Iozw==
X-Gm-Message-State: AOAM530rslzk0ouQHtI7MAIsIQzOrUhF5fzxLlFCq07jkHSvV8gtgp7S
	PRzSIMrGbfG7Bm9Lw2RcV+1lb5iFoitmBq0M6io=
X-Google-Smtp-Source: ABdhPJwKiwf3SlGeZHIvOJLeNs1DGgEjYagjHDl7JjsFhuHVeh4GR8neEtie0iv0Pib34F/M4DbydMviVlR03QOkMNg=
X-Received: by 2002:a02:c981:: with SMTP id b1mr3811297jap.6.1606940280062;
 Wed, 02 Dec 2020 12:18:00 -0800 (PST)
MIME-Version: 1.0
References: <20201202164628.24224-1-olaf@aepfle.de>
In-Reply-To: <20201202164628.24224-1-olaf@aepfle.de>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 2 Dec 2020 15:17:48 -0500
Message-ID: <CAKf6xpt8tK2otnYEFEPQHAxx3oCmGo8iogdgkRM5_Pgtsg2VkQ@mail.gmail.com>
Subject: Re: [PATCH v1] tools/hotplug: allow tuning of xenwatchdogd arguments
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, 
	Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 2, 2020 at 11:47 AM Olaf Hering <olaf@aepfle.de> wrote:
>
> Currently the arguments for xenwatchdogd are hardcoded with 15s
> keep-alive interval and 30s timeout.
>
> It is not possible to tweak these values via
> /etc/systemd/system/xen-watchdog.service.d/*.conf because ExecStart
> can not be replaced. The only option would be a private copy
> /etc/systemd/system/xen-watchdog.service, which may get out of sync
> with the Xen provided xen-watchdog.service.
>
> Adjust the service file to recognize XENWATCHDOGD_ARGS= in a
> private unit configuration file.
>
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> ---
>  tools/hotplug/Linux/init.d/xen-watchdog.in          | 7 ++++++-
>  tools/hotplug/Linux/systemd/xen-watchdog.service.in | 4 +++-
>  2 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/tools/hotplug/Linux/init.d/xen-watchdog.in b/tools/hotplug/Linux/init.d/xen-watchdog.in
> index c05f1f6b6a..87e2353b49 100644
> --- a/tools/hotplug/Linux/init.d/xen-watchdog.in
> +++ b/tools/hotplug/Linux/init.d/xen-watchdog.in
> @@ -19,6 +19,11 @@
>
>  . @XEN_SCRIPT_DIR@/hotplugpath.sh
>
> +xencommons_config=@CONFIG_DIR@/@CONFIG_LEAF_DIR@
> +
> +test -f $xencommons_config/xencommons && . $xencommons_config/xencommons
> +
> +test -z "$XENWATCHDOGD_ARGS" || XENWATCHDOGD_ARGS='15 30'

This should be `test -z ... && ` or `test -n ... || ` to set the
default values properly.

Regards,
Jason

