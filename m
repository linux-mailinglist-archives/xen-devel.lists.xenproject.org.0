Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C83E360F3A6
	for <lists+xen-devel@lfdr.de>; Thu, 27 Oct 2022 11:24:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430961.683315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onz7c-0000YY-4D; Thu, 27 Oct 2022 09:24:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430961.683315; Thu, 27 Oct 2022 09:24:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onz7c-0000VJ-1U; Thu, 27 Oct 2022 09:24:20 +0000
Received: by outflank-mailman (input) for mailman id 430961;
 Thu, 27 Oct 2022 09:24:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uk3A=24=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1onz7a-0000VD-HO
 for xen-devel@lists.xenproject.org; Thu, 27 Oct 2022 09:24:18 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2128c7d8-55d9-11ed-8fd0-01056ac49cbb;
 Thu, 27 Oct 2022 11:24:17 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id y16so1100318wrt.12
 for <xen-devel@lists.xenproject.org>; Thu, 27 Oct 2022 02:24:17 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 y16-20020adfd090000000b0022ae401e9e0sm625789wrh.78.2022.10.27.02.24.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 02:24:16 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BF57E1FFB7;
 Thu, 27 Oct 2022 10:24:15 +0100 (BST)
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
X-Inumbo-ID: 2128c7d8-55d9-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jDTjrVScAlJawu8O4rOrl/s+z1ctwZBTr4dK/zNh2kk=;
        b=dbNT40tpHaizjJf90K0GLRgx8AmjLic8rHnbmqMrjgOlq8louULOewrNvFFSM7M+gT
         gTKv82My1kp9pHHyoX4vCyyoJcswugjNnJE2qecfdl0nwsN5wBHgc+wx//mUT2tuXP7B
         D304uZejigrgCcEwBike5XRZEFdRCpnQxgIzOpvsQcevPVm0NljDNWpJ0f47KyC9GVa5
         otETWhh6XPk8F4jgRTWVNBtZk33/iOltNy502agfrectvcogqiK9X4ZdMhTv0/SKoQg2
         Fe++HYepBuBZ1o5gYSS71EPctyq+G1zIM7jxgEiRAiAbPMfqt3vj2jqiLqHqCzrBVVQY
         3mqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jDTjrVScAlJawu8O4rOrl/s+z1ctwZBTr4dK/zNh2kk=;
        b=ik4CGNpVPu7HTLFgjCw1bs9ktPZQBOVDRoAagxGYbGBkTSrCAw6lVmE9fk/0UsyRAS
         QSoTbtpgt8Mb+BL/rw9h3qLuVcVYlaNF11uopg0ykkW1BmNMga3SaUNv3sQ9N55zZTwI
         vCmhk3zarzk4raZPL4fE2JE/aANS+7Nhi5AwRuhDqyC7tanjNIRH7PicRLpow73ipgwd
         3y8Vj3Wbj4tBHjLgtKvaqpQUmlvY7J77JDIuUd2cWX4g4OkGe/kIAMD/eiEmXrJs/+1x
         oWyxTzWWkZjFOR2PHOhAaHA4//yeIh0rjZVc2H5CTz/hygRARbrd/Ni8xY0r5dtxY4R4
         AWeQ==
X-Gm-Message-State: ACrzQf0KbDUikTDvKor2GPeu3kNTtr4E5H/DDypJWDlg5KdJB+7bBnu7
	U0OS5z9jEYALKvQ/0Odj39pXIg==
X-Google-Smtp-Source: AMsMyM6N4jvLFy+y/t7rQnlbUN+Se1FB5PabUpFJR3tGTSgQmy2PSOfE7OmGVTDLLzGAeL4+arSrKQ==
X-Received: by 2002:adf:b646:0:b0:221:76eb:b3ba with SMTP id i6-20020adfb646000000b0022176ebb3bamr30840721wre.237.1666862656717;
        Thu, 27 Oct 2022 02:24:16 -0700 (PDT)
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
 <20221015050750.4185-10-vikram.garhwal@amd.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: qemu-devel@nongnu.org, stefano.stabellini@amd.com, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, Paul
  Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 09/12] accel/xen/xen-all: export
 xenstore_record_dm_state
Date: Thu, 27 Oct 2022 10:14:40 +0100
In-reply-to: <20221015050750.4185-10-vikram.garhwal@amd.com>
Message-ID: <87pmed1uww.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Vikram Garhwal <vikram.garhwal@amd.com> writes:

> xenstore_record_dm_state() will also be used in aarch64 xenpv machine.
>
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
>  accel/xen/xen-all.c  | 2 +-
>  include/hw/xen/xen.h | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
> index 69aa7d018b..276625b78b 100644
> --- a/accel/xen/xen-all.c
> +++ b/accel/xen/xen-all.c
> @@ -100,7 +100,7 @@ void xenstore_store_pv_console_info(int i, Chardev *c=
hr)
>  }
>=20=20
>=20=20
> -static void xenstore_record_dm_state(struct xs_handle *xs, const char *s=
tate)
> +void xenstore_record_dm_state(struct xs_handle *xs, const char *state)
>  {
>      char path[50];
>=20=20
> diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
> index afdf9c436a..31e9538a5c 100644
> --- a/include/hw/xen/xen.h
> +++ b/include/hw/xen/xen.h
> @@ -9,6 +9,7 @@
>   */
>=20=20
>  #include "exec/cpu-common.h"
> +#include <xenstore.h>

This is breaking a bunch of the builds and generally we try and avoid
adding system includes in headers (apart from osdep.h) for this reason.
In fact there is a comment just above to that fact.

I think you can just add struct xs_handle to typedefs.h (or maybe just
xen.h) and directly include xenstore.h in xen-all.c following the usual
rules:

  https://qemu.readthedocs.io/en/latest/devel/style.html#include-directives

It might be worth doing an audit to see what else is including xen.h
needlessly or should be using sysemu/xen.h.=20

>=20=20
>  /* xen-machine.c */
>  enum xen_mode {
> @@ -31,5 +32,6 @@ qemu_irq *xen_interrupt_controller_init(void);
>  void xenstore_store_pv_console_info(int i, Chardev *chr);
>=20=20
>  void xen_register_framebuffer(struct MemoryRegion *mr);
> +void xenstore_record_dm_state(struct xs_handle *xs, const char *state);
>=20=20
>  #endif /* QEMU_HW_XEN_H */


--=20
Alex Benn=C3=A9e

