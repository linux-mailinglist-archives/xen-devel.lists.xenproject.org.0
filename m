Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33009AEF7F9
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jul 2025 14:12:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029698.1403439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWZq8-0003sU-7a; Tue, 01 Jul 2025 12:11:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029698.1403439; Tue, 01 Jul 2025 12:11:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWZq8-0003pf-4O; Tue, 01 Jul 2025 12:11:56 +0000
Received: by outflank-mailman (input) for mailman id 1029698;
 Tue, 01 Jul 2025 12:11:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PdAb=ZO=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uWZq6-0003pS-MX
 for xen-devel@lists.xenproject.org; Tue, 01 Jul 2025 12:11:54 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 929654c3-5674-11f0-b894-0df219b8e170;
 Tue, 01 Jul 2025 14:11:52 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-553d771435fso4736373e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Jul 2025 05:11:52 -0700 (PDT)
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
X-Inumbo-ID: 929654c3-5674-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751371912; x=1751976712; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SaDIkMzPSoQfWqEQROAJ7+UJOlT+EPwAC07OUzgn05M=;
        b=aotP11EhlUKJWR9AntTU3Vykcrj+nhwMFg+Ax8VXkNh1ZbtKPANjP+rKM2D38enRCs
         Jjx9v+BU657jM3NsyUvqpsC1/l8lYicXAz1BYWPXnODG1AK1ZCePTGLmqUEsqGzh5hZb
         v64tPUhjZBcySYqddl12bmqTV7skbffp8EtMxo+I0IN00VVv6pF5N+v49Rt8lj7d8lfL
         e7JZ6SgCAyfo+DkwTKo2T8TWF0qBHuaUoz4GYlFnYGncu0vfs1qasSb7WK5/lfJU4bNG
         GLRERv6eSNPDFnHzYT2K4R4KblrHgx8kRdbwD6iOqk/WiHSgiMdM6SkAMt+Ck8vmLucH
         8Ytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751371912; x=1751976712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SaDIkMzPSoQfWqEQROAJ7+UJOlT+EPwAC07OUzgn05M=;
        b=Ev8TG2+E9wtauFrekJzI43SV3X2JXMOScxUO47XCs1477PPqbVSG67TSl913Cp5AsO
         jhdABKQV1ZDL/1RMD2E+U15a6YhTBpNzi+XXUD59Q/IEb5LTFB0OGMv6CDmW7kF2avlk
         BwVPo9S0BEFOXyojQfqKgTmL49H9WknIF883H657KvfunsbeBDCuh1Pvc5pY8r9SFfVf
         EQIg3DwcqGoYcuEFTopZ2sHMwDpsz5Eg8bUpb1dPyT9OfIbtXcz7gHLDbzpE0LXE3ryr
         9lQnela8NtgDqnlAjsp9B6tPaaNf9SBVp8um95O7Sg8QBe1sLoAY8OUrRUjpV3ef2oCH
         KWpA==
X-Gm-Message-State: AOJu0YzCTln0Cjv7/90y9spSHhyHhxFSevzI1aViArsW86GOR1vOpFIJ
	+UW90yqm7/OGVdSuauJjjJ4s8bqmg1CRS475TKI20EPdcfs3JlRtWf4FrmjMEhgnyabOHsL59y/
	HgWhFlxfQf7ddE088bU0/UnD/GSJ5iyo=
X-Gm-Gg: ASbGncsAwvfe1NEtrkAg4F92NFhehnd6+ITz3/uIdb7nS1hQLcKqkeA6Y7N3+npr6Y9
	9t141U/2PUJHHBEMADJW4RvhMjFceEIzK1sbEQPUfXMm/ldCfwk31dMjA4uB8qL4Wmz42PCvpa1
	S1wNCG1D8IJZdjERLcvYQlo9FwoJ/l0/zYtyuUgHQwag==
X-Google-Smtp-Source: AGHT+IGXeTIC+8jcIA71x0YbVMfJ+80Rn+7kCNkJOaJeCfbrSir+atysjmmVqQW2t45PB7b2YPTxsv0Wamkq7Bayr1I=
X-Received: by 2002:a05:6512:3c9d:b0:553:acbf:e003 with SMTP id
 2adb3069b0e04-5550b87c279mr5233391e87.13.1751371911334; Tue, 01 Jul 2025
 05:11:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250626081246.1923956-1-xakep.amatop@gmail.com> <aF6QmO7eepnpLWBD@l14>
In-Reply-To: <aF6QmO7eepnpLWBD@l14>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 1 Jul 2025 15:11:39 +0300
X-Gm-Features: Ac12FXwfnUaqWmklrQCPVhx_l5i1ukBxF-tBczPQiNFmK_5txIH33yaoWQa85JY
Message-ID: <CAGeoDV-yoBqfLeaS=EGvx4Qzd7mLJ+PZjjGuvMzysJ_NEsx-zQ@mail.gmail.com>
Subject: Re: [PATCH] systemd: Add hooks to stop/start xen-watchdog on suspend/resume
To: Anthony PERARD <anthony@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Anthony,

On Fri, Jun 27, 2025 at 3:37=E2=80=AFPM Anthony PERARD <anthony@xenproject.=
org> wrote:
>
> Hi Mykola,
>
> First, since you used a different email account to send you patch, the
> email should start with "From: Mykola ... <...@epam.com>" so that
> `git am` can set the correct author for the commit. Often
> `git send-email` managed to do that automatically, if it knows that the
> author of the email is going to be different than the author of the
> commit been sent.

Thank you for pointing this out. All my previous patches were sent
correctly =E2=80=94 I mean when I used my other email address. I=E2=80=99ll=
 look
into why this patch is missing the "From" line, even though I followed
the usual process.

>
> On Thu, Jun 26, 2025 at 11:12:46AM +0300, Mykola Kvach wrote:
> > This patch adds a systemd sleep hook script to stop the xen-watchdog
> > service before system suspend and start it again after resume.
> >
> > Stopping the watchdog before a system suspend operation may look unsafe=
.
> > Let=E2=80=99s imagine the following situation: 'systemctl suspend' does=
 not
> > interact with the running service at all. In such a case, the Xen
> > watchdog daemon freezes just before suspend. If this happens, for
> > example, right before sending a ping, and Xen has not yet marked the
> > domain as suspended (is_shutting_down), the Xen watchdog timer may
> > trigger a false alert.
> >
> > This is an almost impossible situation, because typically:
> >     ping time =3D watchdog timeout / 2
> >
> > and the watchdog timeout is usually set to a relatively large value
> > (dozens of seconds).
> >
> > Still, this is more likely with very short watchdog timeouts. It may
> > happen in the following scenarios:
> >     * Significant delays occur between freezing Linux tasks and
> >       triggering the ACPI or PSCI sleep request or handler.
> >     * Long delays happen inside Xen between the entrance to the sleep
> >       trigger and the actual forwarding of the sleep request further.
> >
> > A similar situation may occur on resume with short timeouts. During the
> > resume operation, Xen restores timers and the domain context. The Xen
> > watchdog timer also resumes. If it schedules the domain right before th=
e
> > watchdog timeout expires, and the daemon responsible for pinging is not
> > yet running, a timeout might occur.
>
> On resume from suspend, does Xen expect a ping from the guest? Or is the
> watchdog only rearmed on the first ping from the guest after been
> resumed?

If the suspend sequence is correct, the Xen watchdog timer is stopped.
It can be stopped either by the domain or directly by the Xen watchdog
timer handler, in the case where the domain is marked as shutting down.

During the resume process, a ping should be sent to start the watchdog
timer again. The guest must continue sending pings to prevent the
watchdog from triggering.

In this case, since a service is used, it starts a daemon that pings
the Xen watchdog at the configured interval:

https://elixir.bootlin.com/xen/v4.20.0/source/tools/misc/xenwatchdogd.c#L18=
6

>
> > Both scenarios are rare and typically require very small watchdog
> > timeouts combined with significant delays in Xen or the Linux kernel
> > during suspend/resume flows.
> >
> > Conceptually, however, if activating and pinging the Xen watchdog is th=
e
> > responsibility of the domain and its services, then the domain should
> > also manage the watchdog service/daemon lifecycle. This is similar to
> > what is already done by the Xen watchdog driver inside the Linux kernel=
.
>
> So there's already watchdog driver in Linux, why not activate it with
> systemd, since it knows how to do it? I almost want to to remove the

Actually, I don't know the exact reason why we have two different
implementations. It could be historical =E2=80=94 for example, initially th=
e
Xen daemon was used, and later the Linux kernel driver was introduced,
or vice versa. It's also possible that some setups still use very old
kernels that lack the driver, and backporting it would require
additional effort.

More likely, though, the daemon approach was chosen for simplicity.
Using the Linux kernel driver requires building the module or even
rebuilding the entire kernel if the driver needs to be built-in.
In contrast, with the daemon, you just need to build the binary and
copy it into the domain's filesystem. It's easier and requires much
less effort.

> service file and redirect users to use systemd's watchdog instead, in
> the documentation.

I think that would be a better solution too. At the very least, we
would avoid having to handle power-related scenarios for every
existing init system.

For example, I see that we currently have three separate watchdog
services: one for NetBSD (rc.d), and two for Linux (init.d and
systemd). I also looked into how to set up power-down hooks with
init.d, and it=E2=80=99s neither easy nor safe -- especially if pm-utils is
not installed on the system.

>
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> >  tools/hotplug/Linux/systemd/Makefile          | 12 ++++-
> >  .../Linux/systemd/xen-watchdog-sleep.sh       | 45 +++++++++++++++++++
> >  2 files changed, 56 insertions(+), 1 deletion(-)
> >  create mode 100644 tools/hotplug/Linux/systemd/xen-watchdog-sleep.sh
> >
> > diff --git a/tools/hotplug/Linux/systemd/Makefile b/tools/hotplug/Linux=
/systemd/Makefile
> > index e29889156d..98d325cc5d 100644
> > --- a/tools/hotplug/Linux/systemd/Makefile
> > +++ b/tools/hotplug/Linux/systemd/Makefile
> > @@ -5,6 +5,9 @@ XEN_SYSTEMD_MODULES :=3D xen.conf
> >
> >  XEN_SYSTEMD_MOUNT :=3D proc-xen.mount
> >
> > +XEN_SYSTEMD_SLEEP_SCRIPTS :=3D xen-watchdog-sleep.sh
> > +XEN_SYSTEMD_SLEEP_DIR :=3D $(XEN_SYSTEMD_DIR)/../system-sleep
>
> This is the wrong directory, I have no idea what "$(XEN_SYSTEMD_DIR)/.."
> could be, even if it's likely to be systemd's directory.
> $(XEN_SYSTEMD_DIR) should only be used for system unit files, because
> that's how it is defined.
>
> Another comment, from `man 8 systemd-suspend.service`:
>
>     Note that scripts or binaries dropped in /lib/systemd/system-sleep/ a=
re
>     intended for local use only and should be considered hacks. If
>     applications want to react to system suspend/hibernation and resume,
>     they should rather use the Inhibitor interface[1].
>
>     [1] https://www.freedesktop.org/wiki/Software/systemd/inhibit
>
> So is a script in system-sleep the right way?
> We probably don't want to go the "inhibitor" way that the manual
> suggest, as this would add many dependencies to the daemon (and it's
> probably not needed).

I'm not very familiar with this area, but thank you for the information --
I'll read up on it.

>
> How about enhancing xen-watchdog.service to deal with suspend?
> It's possible to have "Conflicts=3Dsleep.target" which mean stop this uni=
t
> when doing suspend. But restarting the unit on resume seems to need a
> second service file which might be a bit more complicated to write,
> something like:
>     [Unit]
>     After=3Dsleep.target
>     [Service]
>     ExecStart=3Dsystemctl restart xen-watchdogd
>     [Install]
>     WantedBy=3Dsuspend.target
>     WantedBy=3Dhibernate.target
>     WantedBy=3Dhybrid-sleep.target
>     WantedBy=3Dsuspend-then-hibernate.target
>     ...
> Actually, I'm not sure After=3Dsleep.target is going to work... we should
> be able to use systemd's watchdog capability instead :-) (which seems to
> mean that a driver in Linux for xen's watchdog is needed); Never mind,
> I've re-read the patch description and commented there.

I had considered that approach before, but I decided it's better to keep
everything in one place.

>
> Anyway, don't use XEN_SYSTEMD_DIR and introduce a new variable
> in "systemd.m4".

Got it.

>
> > +
> >  XEN_SYSTEMD_SERVICE :=3D xenstored.service
> >  XEN_SYSTEMD_SERVICE +=3D xenconsoled.service
> >  XEN_SYSTEMD_SERVICE +=3D xen-qemu-dom0-disk-backend.service
> > @@ -15,7 +18,8 @@ XEN_SYSTEMD_SERVICE +=3D xendriverdomain.service
> >
> >  ALL_XEN_SYSTEMD :=3D   $(XEN_SYSTEMD_MODULES)  \
> >                       $(XEN_SYSTEMD_MOUNT)    \
> > -                     $(XEN_SYSTEMD_SERVICE)
> > +                     $(XEN_SYSTEMD_SERVICE)  \
> > +                     $(XEN_SYSTEMD_SLEEP_SCRIPTS)
> >
> >  .PHONY: all
> >  all: $(ALL_XEN_SYSTEMD)
> > @@ -31,15 +35,21 @@ distclean: clean
> >  install: $(ALL_XEN_SYSTEMD)
> >       $(INSTALL_DIR) $(DESTDIR)$(XEN_SYSTEMD_DIR)
> >       $(INSTALL_DIR) $(DESTDIR)$(XEN_SYSTEMD_MODULES_LOAD)
> > +     $(INSTALL_DIR) $(DESTDIR)$(XEN_SYSTEMD_SLEEP_DIR)
> >       $(INSTALL_DATA) *.service $(DESTDIR)$(XEN_SYSTEMD_DIR)
> >       $(INSTALL_DATA) *.mount $(DESTDIR)$(XEN_SYSTEMD_DIR)
> >       $(INSTALL_DATA) *.conf $(DESTDIR)$(XEN_SYSTEMD_MODULES_LOAD)
> > +     set -e; for i in $(XEN_SYSTEMD_SLEEP_SCRIPTS); \
> > +         do \
> > +         $(INSTALL_PROG) $$i $(DESTDIR)$(XEN_SYSTEMD_SLEEP_DIR); \
>
> I don't think you need a loop for that, `install` is perfectly capable
> of installing multiple sources.

Ok, thanks for the suggestion.
I=E2=80=99ll redo it without the loop and use install to handle multiple fi=
les directly.

>
> > +     done
> >
> >  .PHONY: uninstall
> >  uninstall:
> >       rm -f $(DESTDIR)$(XEN_SYSTEMD_MODULES_LOAD)/*.conf
> >       rm -f $(DESTDIR)$(XEN_SYSTEMD_DIR)/*.mount
> >       rm -f $(DESTDIR)$(XEN_SYSTEMD_DIR)/*.service
> > +     rm -f $(addprefix $(DESTDIR)$(XEN_SYSTEMD_SLEEP_DIR)/, $(XEN_SYST=
EMD_SLEEP_SCRIPTS))
> >
> >  $(XEN_SYSTEMD_MODULES):
> >       rm -f $@.tmp
> > diff --git a/tools/hotplug/Linux/systemd/xen-watchdog-sleep.sh b/tools/=
hotplug/Linux/systemd/xen-watchdog-sleep.sh
> > new file mode 100644
> > index 0000000000..2b2f0e16d8
> > --- /dev/null
> > +++ b/tools/hotplug/Linux/systemd/xen-watchdog-sleep.sh
> > @@ -0,0 +1,45 @@
> > +#!/bin/sh
> > +
> > +# The first argument ($1) is:
> > +#     "pre" or "post"
> > +# The second argument ($2) is:
> > +#     "suspend", "hibernate", "hybrid-sleep", or "suspend-then-hiberna=
te"
> > +
> > +. /etc/xen/scripts/hotplugpath.sh
> > +
> > +SERVICE_NAME=3D"xen-watchdog.service"
> > +STATE_FILE=3D"/run/xen-watchdog-sleep-marker"
>
> This should use $XEN_RUN_DIR

Got it.

>
> > +XEN_WATCHDOG_SLEEP_LOG=3D"${XEN_LOG_DIR}/xen-watchdog-sleep.log"
>
> Is this necessary? Use only `logger`, if `echo log` doesn't log anything.

In my case, I do see logs in journalctl after using echo in this script.
I thought it was a common approach for the Xen toolstack to use its own log
files for tools and services.

However, if it=E2=80=99s preferable to use only the standard systemd loggin=
g, I can
remove all changes related to logging into separate files.

>
> > +log_watchdog() {
> > +    echo "$1"
> > +    echo "$(date): $1" >> "${XEN_WATCHDOG_SLEEP_LOG}"
> > +}
> > +
> > +# Exit silently if Xen watchdog service is not present
> > +if ! systemctl show "${SERVICE_NAME}" > /dev/null 2>&1; then
>
> Is this necessary? It seems `systemctl is-active` works fine when the
> unit doesn't exist.

is-active doesn't work correctly on resume.
In the case of resume, the script exits early because of
the is-active check. Maybe I'm missing something.

>
> > +    exit 0
> > +fi
> > +
> > +case "$1" in
> > +pre)
> > +    if systemctl is-active --quiet "${SERVICE_NAME}"; then
> > +        touch "${STATE_FILE}"
> > +        log_watchdog "Stopping ${SERVICE_NAME} before $2."
> > +        systemctl stop "${SERVICE_NAME}"
> > +    fi
> > +    ;;
> > +post)
> > +    if [ -f "${STATE_FILE}" ]; then
>
> Would using `systemctl is-enabled` instead work? It seems to work for a
> service on my machine.

The service may be enabled (set to start on boot) but not running right
now. I want to restart it only if it was running before suspend --
for example, if the user stopped the service before suspend, they=E2=80=99d
expect it to remain stopped after resume.

>
> > +        log_watchdog "Starting ${SERVICE_NAME} after $2."
> > +        systemctl start "${SERVICE_NAME}"
> > +        rm "${STATE_FILE}"
> > +    fi
> > +    ;;
> > +*)
> > +    log_watchdog "Script called with unknown action '$1'. Arguments: '=
$@'"
> > +    exit 1
> > +    ;;
> > +esac
> > +
> > +exit 0
> > --
> > 2.48.1

Thank you for the detailed review.

Best regards,
Mykola

>
> Thanks,


>
> --
> Anthony PERARD

