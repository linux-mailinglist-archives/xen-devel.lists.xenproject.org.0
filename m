Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A157DBF8D
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 19:11:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625375.974588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxWjL-0003IP-DM; Mon, 30 Oct 2023 18:11:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625375.974588; Mon, 30 Oct 2023 18:11:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxWjL-0003GX-AY; Mon, 30 Oct 2023 18:11:15 +0000
Received: by outflank-mailman (input) for mailman id 625375;
 Mon, 30 Oct 2023 18:11:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NDJX=GM=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1qxWjK-0003GR-7s
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 18:11:14 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b50dc7dc-774f-11ee-9b0e-b553b5be7939;
 Mon, 30 Oct 2023 19:11:12 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-53de8fc1ad8so7749593a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 30 Oct 2023 11:11:12 -0700 (PDT)
Received: from smtpclient.apple (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 d26-20020a17090648da00b00988dbbd1f7esm6340554ejt.213.2023.10.30.11.11.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 Oct 2023 11:11:11 -0700 (PDT)
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
X-Inumbo-ID: b50dc7dc-774f-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1698689471; x=1699294271; darn=lists.xenproject.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NYoqCY0LYF5XJAiA01xiE5ruVPds5+30jxb9bHFiooc=;
        b=RABCwJWGjS/NVo/P69psbkBM4BzEmz10NNXS2p1fYUlqmoywZ59JeGhVXfw6Zy6Ogi
         HvwSgD8bQVe5fWo2lTidU/hnwbQmP+xm9l1E1kBS4t8TrIMZJtnaGDKjKeV69a1JFe6n
         DmgZhlNE8ramMbwoJQHsxM0pFZSvHxEDC3m1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698689471; x=1699294271;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NYoqCY0LYF5XJAiA01xiE5ruVPds5+30jxb9bHFiooc=;
        b=MZ8AAHtddyEOQ4qeZV9FZw458/mOLgXxXiOrdvnRtNdKskM9pos81/4iM+TFnBtAPV
         yCv3gWf5jKDtSY+Dqz/OGZsSs7xxKhpDTZjf1rFMSxya3yjNdkRxXgdfG38ygOrDkdhq
         LFEwGT2Rb47nfPFpPlT5mfHH43Zq4IIV09djKmh1NQ+i8AzscRJMmIvhpF7zh8n1pyyM
         vtAo8TSpwsCMjinI6JF2mjiH5xuSfEZ6QNPQSUDw/ow4YEtni4VZrr8f26GtqamVHPhA
         6BCArt5KV62owlzoJAyE9EQWjCvVcV0QNKxjdX5Lyp8iBuooY899UiBIe/ESZUGvoR/0
         bZog==
X-Gm-Message-State: AOJu0YyUBnbSJUgJzj+HkFeMTnE2cgHeEBMFYSfhuPm17YDDPhyt/47Y
	FVHPF2wd4uo7lnWUfhBdTNlh+w==
X-Google-Smtp-Source: AGHT+IHSlZ95GVuJRkbKq27UE7kWd0F2kU70DtZfb6mgFlADRB6kTUromYUR7kzZZ19UNoNyFB6SFg==
X-Received: by 2002:a17:906:a044:b0:9d1:92bb:ce74 with SMTP id bg4-20020a170906a04400b009d192bbce74mr5986312ejb.38.1698689471483;
        Mon, 30 Oct 2023 11:11:11 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.100.2.1.4\))
Subject: Re: [PATCH] xenstored: do not redirect stderr to /dev/null
From: Edwin Torok <edwin.torok@cloud.com>
In-Reply-To: <87fbae122fd2d75852026d621358031c72c9a36d.1698227069.git.edwin.torok@cloud.com>
Date: Mon, 30 Oct 2023 18:11:00 +0000
Cc: xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <ECFA15A7-9DC8-4476-8D0B-44A6D12192D6@cloud.com>
References: <87fbae122fd2d75852026d621358031c72c9a36d.1698227069.git.edwin.torok@cloud.com>
To: =?utf-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>
X-Mailer: Apple Mail (2.3774.100.2.1.4)



> On 25 Oct 2023, at 14:50, Edwin T=C3=B6r=C3=B6k =
<edvin.torok@citrix.com> wrote:
>=20
> From: Edwin T=C3=B6r=C3=B6k <edwin.torok@cloud.com>
>=20
> By default stderr gets redirected to /dev/null because oxenstored =
daemonizes itself.
> This must be a left-over from pre-systemd days.
>=20
> In ee7815f49f ("tools/oxenstored: Set uncaught exception handler") a =
workaround was added to log exceptions
> directly to syslog to cope with standard error being lost.
>=20
> However it is better to not lose standard error (what if the =
connection to syslog itself fails, how'd we log that?),
> and use the '--no-fork' flag to do that.
> This flag is supported by both C and O versions of xenstored.
>=20
> Both versions also call sd_notify so there is no need for forking.
>=20
> Leave the default daemonize as is so that xenstored keeps working on =
non-Linux systems as before.
>=20
> Signed-off-by: Edwin T=C3=B6r=C3=B6k <edwin.torok@cloud.com>
> ---
> tools/hotplug/Linux/init.d/sysconfig.xencommons.in | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tools/hotplug/Linux/init.d/sysconfig.xencommons.in =
b/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
> index 433e4849af..09a1230cee 100644
> --- a/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
> +++ b/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
> @@ -52,7 +52,7 @@
> # like "--trace-file @XEN_LOG_DIR@/xenstored-trace.log"
> # See "@sbindir@/xenstored --help" for possible options.
> # Only evaluated if XENSTORETYPE is "daemon".
> -XENSTORED_ARGS=3D
> +XENSTORED_ARGS=3D--no-fork


I think the CI failure is due to this patch, and it only happens on =
Linux systems that do not use systemd.
In that case we do need to fork, because that is the only way not to tie =
up the boot sequence.

I'll try to make '--no-fork' depend on having systemd present, because =
otherwise I tested both C and O xenstored and they do start up with =
--no-fork.

Best regards,
--Edwin=

