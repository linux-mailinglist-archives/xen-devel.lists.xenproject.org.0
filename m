Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD9342AFA1
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 00:25:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207740.363644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maQDD-00071Q-2z; Tue, 12 Oct 2021 22:25:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207740.363644; Tue, 12 Oct 2021 22:25:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maQDC-0006yj-WB; Tue, 12 Oct 2021 22:25:30 +0000
Received: by outflank-mailman (input) for mailman id 207740;
 Tue, 12 Oct 2021 22:25:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=quuu=PA=gmail.com=alistair23@srs-us1.protection.inumbo.net>)
 id 1maQDC-0006yd-22
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 22:25:30 +0000
Received: from mail-io1-xd33.google.com (unknown [2607:f8b0:4864:20::d33])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a8ad821f-d38a-46ac-a8b8-c0467bcde297;
 Tue, 12 Oct 2021 22:25:29 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id d125so607041iof.5
 for <xen-devel@lists.xenproject.org>; Tue, 12 Oct 2021 15:25:29 -0700 (PDT)
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
X-Inumbo-ID: a8ad821f-d38a-46ac-a8b8-c0467bcde297
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XmXWcURKTPZbu8+vMykz0wo7aGuZpEedRj7aUcQW/64=;
        b=jXP0Q6BYUaRM1g/D3kGRJaogyDNoXsMFf191OtG8ORGfqlH0QuWlkt3HNBo9PJfjF4
         q2ALCcfrBgKjp5dmcOASInobV+9gI7eBewus6GQw3nWBj5c5zdAczLbIF9ag2oRnY3k3
         RlycwIS2PzEhnccX5VbLXkAHUOYdM3dNG2A8HiuqAZvd5DF+0cKddahq4bvJmfro3a/W
         ppTNvUpJ4NQ9CFScQXQZYKdytzv9whHQwpayRU2mny766/62FwzY+XmJ1E49HBjU64m2
         AiEhm+27VgvQ2twDTfkqlPacg+dTyANr6ImfQGjoEIINDrbsXKJPJs9Qjj3pB+KyBmf/
         V3Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XmXWcURKTPZbu8+vMykz0wo7aGuZpEedRj7aUcQW/64=;
        b=iilpMPvQexeqcpW3wWnJySMO/W0sx5uo/NuRg1+i49qOlPijmmG7JwTT4yHKf25qwe
         4EJlrnUXM1HNBmnSXOlG4UVZ1RUiR6kbWP8/E2SMUG5w/B4HE8BOqkReif5nA31FGaDb
         r+uAjVZ8g5KDr7XuUt/NVl8aVNAyvo0dBkRwpV4u92zous8zIzcIXW6Lt/t2V1KeTUoF
         cpFbCU/emw6LqXJdHlRpK9OsuaNN9JnbUlPRjg9LL4Wu+2uG6/ICaClimrovjJu7hyqc
         LZMGcVN7DmJH2z3CFj4u3zZE0D3ZP5oBla9l7Xhvl/t+YVQGnmDDjTzA4IySzhW4lsWO
         Qfwg==
X-Gm-Message-State: AOAM532tjtlwq1LBOmS9RSo7B7SyaPUnwgWlcX149nRJJCBa9LePYcVl
	pMVagl5CqL7Y9X5dxZMbArkycZ/5ted8mkhklIQ=
X-Google-Smtp-Source: ABdhPJwY/7LCnJc4zrqz9k9AXZF5iV8jUexLQGaXC27y6KYjx+BhCMwCI+QO/p2VwL5gS3+DRS/txPkgBlsx8+654+g=
X-Received: by 2002:a05:6638:1483:: with SMTP id j3mr24996253jak.63.1634077528483;
 Tue, 12 Oct 2021 15:25:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210922161405.140018-1-damien.hedde@greensocs.com> <20210922161405.140018-7-damien.hedde@greensocs.com>
In-Reply-To: <20210922161405.140018-7-damien.hedde@greensocs.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 13 Oct 2021 08:25:02 +1000
Message-ID: <CAKmqyKNuOppuy2i=dF7SD0pZ0u_Us5J0CRGe8CJ-Zay-KMFBRA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 06/16] qapi: Allow device_add to execute in machine
 initialized phase
To: Damien Hedde <damien.hedde@greensocs.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>, 
	mirela.grujic@greensocs.com, Alistair Francis <Alistair.Francis@wdc.com>, 
	Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>, Eric Blake <eblake@redhat.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, "open list:X86" <xen-devel@lists.xenproject.org>, 
	Paul Durrant <paul@xen.org>, Markus Armbruster <armbru@redhat.com>, 
	Anthony Perard <anthony.perard@citrix.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Eduardo Habkost <ehabkost@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
	Eric Auger <eric.auger@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"open list:RISC-V" <qemu-riscv@nongnu.org>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Mark Burton <mark.burton@greensocs.com>, Edgar Iglesias <edgari@xilinx.com>, 
	Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 23, 2021 at 2:26 AM Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> From: Mirela Grujic <mirela.grujic@greensocs.com>
>
> To configure a machine using QMP we need the device_add command to
> execute at machine initialized phase.
>
> Note: for device_add command in qdev.json adding the 'allow-init-config'
> option has no effect because the command appears to bypass QAPI (see
> TODO at qapi/qdev.json:61). The option is added there solely to document
> the intent.
> For the same reason, the flags have to be explicitly set in
> monitor_init_qmp_commands() when the device_add command is registered.
>
> Signed-off-by: Mirela Grujic <mirela.grujic@greensocs.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
> The commit is fine, but we may add intermediate commits before this one
> in order to add or change the condition for a device type to be accepted
> in the 'initialized' state (see the cover-letter of the series).
> ---
>  qapi/qdev.json         | 3 ++-
>  monitor/misc.c         | 2 +-
>  softmmu/qdev-monitor.c | 6 ++++++
>  3 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/qapi/qdev.json b/qapi/qdev.json
> index b83178220b..ad669ae175 100644
> --- a/qapi/qdev.json
> +++ b/qapi/qdev.json
> @@ -67,7 +67,8 @@
>  ##
>  { 'command': 'device_add',
>    'data': {'driver': 'str', '*bus': 'str', '*id': 'str'},
> -  'gen': false } # so we can get the additional arguments
> +  'gen': false, # so we can get the additional arguments
> +  'allow-preconfig': true }
>
>  ##
>  # @device_del:
> diff --git a/monitor/misc.c b/monitor/misc.c
> index ffe7966870..2c476de316 100644
> --- a/monitor/misc.c
> +++ b/monitor/misc.c
> @@ -231,7 +231,7 @@ static void monitor_init_qmp_commands(void)
>      qmp_init_marshal(&qmp_commands);
>
>      qmp_register_command(&qmp_commands, "device_add", qmp_device_add,
> -                         QCO_NO_OPTIONS);
> +                         QCO_ALLOW_PRECONFIG);
>
>      QTAILQ_INIT(&qmp_cap_negotiation_commands);
>      qmp_register_command(&qmp_cap_negotiation_commands, "qmp_capabilities",
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index 834f2b56b5..47ccd90be8 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -824,6 +824,12 @@ void qmp_device_add(QDict *qdict, QObject **ret_data, Error **errp)
>      QemuOpts *opts;
>      DeviceState *dev;
>
> +    if (!phase_check(MACHINE_INIT_PHASE_INITIALIZED)) {
> +        error_setg(errp, "The command is permitted only after "
> +                         "the machine is initialized");
> +        return;
> +    }
> +
>      opts = qemu_opts_from_qdict(qemu_find_opts("device"), qdict, errp);
>      if (!opts) {
>          return;
> --
> 2.33.0
>
>

