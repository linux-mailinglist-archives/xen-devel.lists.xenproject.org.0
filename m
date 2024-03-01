Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8214A86E6D6
	for <lists+xen-devel@lfdr.de>; Fri,  1 Mar 2024 18:09:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687760.1071537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rg6N4-00023e-8L; Fri, 01 Mar 2024 17:08:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687760.1071537; Fri, 01 Mar 2024 17:08:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rg6N4-000225-5h; Fri, 01 Mar 2024 17:08:30 +0000
Received: by outflank-mailman (input) for mailman id 687760;
 Fri, 01 Mar 2024 17:08:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RIpQ=KH=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1rg6N2-00021z-3M
 for xen-devel@lists.xenproject.org; Fri, 01 Mar 2024 17:08:28 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50fc2be7-d7ee-11ee-a1ee-f123f15fe8a2;
 Fri, 01 Mar 2024 18:08:25 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-412cd58dd71so2267885e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 01 Mar 2024 09:08:25 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 jn3-20020a05600c6b0300b004128e903b2csm8910607wmb.39.2024.03.01.09.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 09:08:24 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 9A47B5F7B4;
 Fri,  1 Mar 2024 17:08:24 +0000 (GMT)
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
X-Inumbo-ID: 50fc2be7-d7ee-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709312905; x=1709917705; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yIsxd3I49dEeoEihY92y12I5QN6KFVksMBQbYfAFd0k=;
        b=MbSBKRy0Z8cpQv5rU7fvaPkGkBjAtk9LSeKmelqJT9d+yKxiQHyVH7FKvRgFCGbuYH
         CfvqjDlgoF7Y3xYvnNhFLNBHVt5JeZurhb9X8YFqgt3EMB+9r+gPF4KKRih+j1tSrm7e
         hmKeWTD0TmxGyhC3UTxczVZMvfXiLyzDemVx7xKGtUQGoGoraVUnTn/oJ9oLK6490x7L
         jemEv5dI0wzEDQEtDkXZc6k+GmBF92ag3UWE2n3AQyqCfU9G7j753GP+cd8DmH/8jrMu
         ljfNvKaIUJNoqndEeWjaMDo5hr9MRCA8VI5PgJT83uqqpEwS7svxembGHm/FG1YCtk2f
         FiiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709312905; x=1709917705;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yIsxd3I49dEeoEihY92y12I5QN6KFVksMBQbYfAFd0k=;
        b=aQOcpgf8/ri9YQukuq6EroXysnhF1gs0Z7HknwZvQtd7FUBJCxy7bozLwn/FQwaIuk
         px5X6xSfQnVneEzKMaqVqZFvPWUZD0V2DEd6ndJzpxFpUNl7PtaHeWh6yNgeQ6e8zAUQ
         0XPb+mlKP8IUFWrjQhUWxi988b47EaQGu3Xcd2UA+5S2+lNcrD1eLzZFeZxIluyhYNYK
         3+7jxbRc93nzn8oKu0B+DmBk2lLaa7T1n5sHKWhzinJnuI3rpq74WhgnCwFWi9cJ/0d3
         TMZH7zldmkIbHP7etn6drBemFV5jGOotPjT/xjU3rI8ayLSQxGSmuAMbUl+CdLmBaRcl
         CnWQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4W5v9fWcuH2IXreqg6FWcOVhEXdtmO2KGQN1fxFs7l3chqNkH9YtwoYSU3kyB0vgCv6/nQuQmh+2Y+HTHnr3PF/1QE5dvITjI1bczj8w=
X-Gm-Message-State: AOJu0YzInL+8Pav4AwQ7sYRB7t1KUMmrPw4dh9SkfWsvMbExukq8NFGm
	5i7HmWiYU87tbDXWpn7cnosmuaLpzjj/1ueI2hhmxYMn/5aPdL5ZwOCOIdZuS/E=
X-Google-Smtp-Source: AGHT+IF/04gw/RkqLIbw8xez/beiUpqog3Zmj88Frgy30DgiLIcrkJ88jnJeBOUjtNlvcLKherqjQg==
X-Received: by 2002:a05:600c:45cf:b0:412:ca55:10ec with SMTP id s15-20020a05600c45cf00b00412ca5510ecmr1148930wmo.19.1709312905208;
        Fri, 01 Mar 2024 09:08:25 -0800 (PST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: <qemu-devel@nongnu.org>,  <sstabellini@kernel.org>,  <jgross@suse.com>,
  Anthony Perard <anthony.perard@citrix.com>,  Paul Durrant <paul@xen.org>,
  "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [QEMU][PATCH v3 4/7] xen: let xen_ram_addr_from_mapcache()
 return -1 in case of not found entry
In-Reply-To: <20240227223501.28475-5-vikram.garhwal@amd.com> (Vikram Garhwal's
	message of "Tue, 27 Feb 2024 14:34:58 -0800")
References: <20240227223501.28475-1-vikram.garhwal@amd.com>
	<20240227223501.28475-5-vikram.garhwal@amd.com>
User-Agent: mu4e 1.12.0; emacs 29.1
Date: Fri, 01 Mar 2024 17:08:24 +0000
Message-ID: <87o7bx5187.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Vikram Garhwal <vikram.garhwal@amd.com> writes:

> From: Juergen Gross <jgross@suse.com>
>
> Today xen_ram_addr_from_mapcache() will either abort() or return 0 in
> case it can't find a matching entry for a pointer value. Both cases
> are bad, so change that to return an invalid address instead.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
>  hw/xen/xen-mapcache.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
> index dfc412d138..179b7e95b2 100644
> --- a/hw/xen/xen-mapcache.c
> +++ b/hw/xen/xen-mapcache.c
> @@ -396,13 +396,8 @@ ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
>          }
>      }
>      if (!found) {
> -        trace_xen_ram_addr_from_mapcache_not_found(ptr);
> -        QTAILQ_FOREACH(reventry, &mapcache->locked_entries, next) {
> -            trace_xen_ram_addr_from_mapcache_found(reventry->paddr_index,
> -                                                   reventry->vaddr_req);
> -        }

If these tracepoints aren't useful they need removing from trace-events.
However I suspect it would be better to keep them in as they are fairly
cheap.

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

