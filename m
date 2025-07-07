Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4416DAFB5C7
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 16:22:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035600.1407924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYmjQ-00076D-D7; Mon, 07 Jul 2025 14:22:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035600.1407924; Mon, 07 Jul 2025 14:22:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYmjQ-00073X-A2; Mon, 07 Jul 2025 14:22:08 +0000
Received: by outflank-mailman (input) for mailman id 1035600;
 Mon, 07 Jul 2025 14:22:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uYmjO-00073P-LA
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 14:22:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uYmjO-005X6e-0K;
 Mon, 07 Jul 2025 14:22:06 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uYmjN-004yb1-2T;
 Mon, 07 Jul 2025 14:22:05 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=KIB9MGqo18BGrerh3fzmGsgMMAO+2c/afabIIeT4LnY=; b=OgwF7P/hJr6bj2ot0W1uN3ddsh
	hseBgwmxdy+b3JH10IDrEfovIVQIrkaBxz/JqNojxFZM5F1R83BMd5qjWAzevo9G4UCBUzamCprEs
	mEtypCW/QMQtsJNoMV6Kq5Jra9lzELi1WiqbMyO9NaErKGhnXaoEFVJK2itqSaWx1YBo=;
Date: Mon, 7 Jul 2025 16:22:04 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>
Subject: Re: [PATCH] systemd: Add hooks to stop/start xen-watchdog on
 suspend/resume
Message-ID: <aGvYDEgXFxUaB29a@l14>
References: <20250626081246.1923956-1-xakep.amatop@gmail.com>
 <aF6QmO7eepnpLWBD@l14>
 <CAGeoDV-yoBqfLeaS=EGvx4Qzd7mLJ+PZjjGuvMzysJ_NEsx-zQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGeoDV-yoBqfLeaS=EGvx4Qzd7mLJ+PZjjGuvMzysJ_NEsx-zQ@mail.gmail.com>

On Tue, Jul 01, 2025 at 03:11:39PM +0300, Mykola Kvach wrote:
> On Fri, Jun 27, 2025 at 3:37 PM Anthony PERARD <anthony@xenproject.org> wrote:
> > On Thu, Jun 26, 2025 at 11:12:46AM +0300, Mykola Kvach wrote:
> > > Both scenarios are rare and typically require very small watchdog
> > > timeouts combined with significant delays in Xen or the Linux kernel
> > > during suspend/resume flows.
> > >
> > > Conceptually, however, if activating and pinging the Xen watchdog is the
> > > responsibility of the domain and its services, then the domain should
> > > also manage the watchdog service/daemon lifecycle. This is similar to
> > > what is already done by the Xen watchdog driver inside the Linux kernel.
> >
> > So there's already watchdog driver in Linux, why not activate it with
> > systemd, since it knows how to do it? I almost want to to remove the
> 
> Actually, I don't know the exact reason why we have two different
> implementations. It could be historical — for example, initially the

It's definitely historical. xenwatchdogd was introduced before systemd
existed. Then someone added systemd service files to Xen, but I don't
know if systemd's watchdog support existed at the time, or the service
file was created just to replace the existing init script.

> Xen daemon was used, and later the Linux kernel driver was introduced,
> or vice versa. It's also possible that some setups still use very old
> kernels that lack the driver, and backporting it would require
> additional effort.
> 
> More likely, though, the daemon approach was chosen for simplicity.
> Using the Linux kernel driver requires building the module or even
> rebuilding the entire kernel if the driver needs to be built-in.
> In contrast, with the daemon, you just need to build the binary and
> copy it into the domain's filesystem. It's easier and requires much
> less effort.

That sound like a good explanation, make it easier to use Xen's
watchdog, even if the currently built kernel doesn't have support for
it, so having a systemd.service file for this case is useful.

> 
> > service file and redirect users to use systemd's watchdog instead, in
> > the documentation.
> 
> I think that would be a better solution too. At the very least, we
> would avoid having to handle power-related scenarios for every
> existing init system.
> 
> For example, I see that we currently have three separate watchdog
> services: one for NetBSD (rc.d), and two for Linux (init.d and
> systemd). I also looked into how to set up power-down hooks with
> init.d, and it’s neither easy nor safe -- especially if pm-utils is
> not installed on the system.
> 
> > > diff --git a/tools/hotplug/Linux/systemd/xen-watchdog-sleep.sh b/tools/hotplug/Linux/systemd/xen-watchdog-sleep.sh
> > > new file mode 100644
> > > index 0000000000..2b2f0e16d8
> > > --- /dev/null
> > > +++ b/tools/hotplug/Linux/systemd/xen-watchdog-sleep.sh

> > > +XEN_WATCHDOG_SLEEP_LOG="${XEN_LOG_DIR}/xen-watchdog-sleep.log"
> >
> > Is this necessary? Use only `logger`, if `echo log` doesn't log anything.
> 
> In my case, I do see logs in journalctl after using echo in this script.
> I thought it was a common approach for the Xen toolstack to use its own log
> files for tools and services.

Well, most or all those log files were usually "created" before systemd
existed, and I don't think a single one of those were created for only
a systemd service.

> However, if it’s preferable to use only the standard systemd logging, I can
> remove all changes related to logging into separate files.

For something systemd specific, I think we should use systemd's logging
facility. There's already too many separated log files that are hard to
discover when there's an error. Adding one more isn't going to help,
especially for something that barely generate any logs.

> > > +log_watchdog() {
> > > +    echo "$1"
> > > +    echo "$(date): $1" >> "${XEN_WATCHDOG_SLEEP_LOG}"
> > > +}
> > > +
> > > +# Exit silently if Xen watchdog service is not present
> > > +if ! systemctl show "${SERVICE_NAME}" > /dev/null 2>&1; then
> >
> > Is this necessary? It seems `systemctl is-active` works fine when the
> > unit doesn't exist.
> 
> is-active doesn't work correctly on resume.
> In the case of resume, the script exits early because of
> the is-active check. Maybe I'm missing something.

I think I meant to remove this check and let the script just do its
thing. If the unit isn't present, `systemctl is-active` is going to be
"false" on suspend, and the $STATE_FILE isn't going to exist on resume.

> > > +    exit 0
> > > +fi
> > > +
> > > +case "$1" in
> > > +pre)
> > > +    if systemctl is-active --quiet "${SERVICE_NAME}"; then
> > > +        touch "${STATE_FILE}"
> > > +        log_watchdog "Stopping ${SERVICE_NAME} before $2."
> > > +        systemctl stop "${SERVICE_NAME}"
> > > +    fi
> > > +    ;;
> > > +post)
> > > +    if [ -f "${STATE_FILE}" ]; then
> >
> > Would using `systemctl is-enabled` instead work? It seems to work for a
> > service on my machine.
> 
> The service may be enabled (set to start on boot) but not running right
> now. I want to restart it only if it was running before suspend --
> for example, if the user stopped the service before suspend, they’d
> expect it to remain stopped after resume.

Sounds good.

> >
> > > +        log_watchdog "Starting ${SERVICE_NAME} after $2."
> > > +        systemctl start "${SERVICE_NAME}"
> > > +        rm "${STATE_FILE}"
> > > +    fi
> > > +    ;;
> > > +*)
> > > +    log_watchdog "Script called with unknown action '$1'. Arguments: '$@'"
> > > +    exit 1
> > > +    ;;
> > > +esac

Cheers,

-- 
Anthony PERARD

