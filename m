Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C53F4AEB7DB
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jun 2025 14:37:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1027619.1402195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uV8Ky-00021r-Ec; Fri, 27 Jun 2025 12:37:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1027619.1402195; Fri, 27 Jun 2025 12:37:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uV8Ky-0001zm-Bu; Fri, 27 Jun 2025 12:37:48 +0000
Received: by outflank-mailman (input) for mailman id 1027619;
 Fri, 27 Jun 2025 12:37:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uV8Kw-0001zg-IT
 for xen-devel@lists.xenproject.org; Fri, 27 Jun 2025 12:37:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uV8Kw-005IEC-0v;
 Fri, 27 Jun 2025 12:37:46 +0000
Received: from amontsouris-682-1-55-1.w90-87.abo.wanadoo.fr ([90.87.218.1]
 helo=l14) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uV8Kv-00CYTE-2u;
 Fri, 27 Jun 2025 12:37:46 +0000
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
	bh=TASf9clBATY2H74jz8xYrKCe944e20UVSOkhfpa+7pA=; b=UNWI6OnNZk4QzsoAwxH3w4r7EK
	yG1XXXwoBUKUAnOyv7LVQGJu/NP7IBwJHv/Bx5yRQ8sJmverPNWE8ml9UGCi7JBmaMezjI/5NB0O+
	C59/XRjsHzPBDrXg1Mf47APdav8nVdD5PQtAbOfBDgMzLpXSOSS8Dd3aGSiJtgeJtyxA=;
Date: Fri, 27 Jun 2025 14:37:44 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>
Subject: Re: [PATCH] systemd: Add hooks to stop/start xen-watchdog on
 suspend/resume
Message-ID: <aF6QmO7eepnpLWBD@l14>
References: <20250626081246.1923956-1-xakep.amatop@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250626081246.1923956-1-xakep.amatop@gmail.com>

Hi Mykola,

First, since you used a different email account to send you patch, the
email should start with "From: Mykola ... <...@epam.com>" so that
`git am` can set the correct author for the commit. Often
`git send-email` managed to do that automatically, if it knows that the
author of the email is going to be different than the author of the
commit been sent.

On Thu, Jun 26, 2025 at 11:12:46AM +0300, Mykola Kvach wrote:
> This patch adds a systemd sleep hook script to stop the xen-watchdog
> service before system suspend and start it again after resume.
> 
> Stopping the watchdog before a system suspend operation may look unsafe.
> Let’s imagine the following situation: 'systemctl suspend' does not
> interact with the running service at all. In such a case, the Xen
> watchdog daemon freezes just before suspend. If this happens, for
> example, right before sending a ping, and Xen has not yet marked the
> domain as suspended (is_shutting_down), the Xen watchdog timer may
> trigger a false alert.
> 
> This is an almost impossible situation, because typically:
>     ping time = watchdog timeout / 2
> 
> and the watchdog timeout is usually set to a relatively large value
> (dozens of seconds).
> 
> Still, this is more likely with very short watchdog timeouts. It may
> happen in the following scenarios:
>     * Significant delays occur between freezing Linux tasks and
>       triggering the ACPI or PSCI sleep request or handler.
>     * Long delays happen inside Xen between the entrance to the sleep
>       trigger and the actual forwarding of the sleep request further.
> 
> A similar situation may occur on resume with short timeouts. During the
> resume operation, Xen restores timers and the domain context. The Xen
> watchdog timer also resumes. If it schedules the domain right before the
> watchdog timeout expires, and the daemon responsible for pinging is not
> yet running, a timeout might occur.

On resume from suspend, does Xen expect a ping from the guest? Or is the
watchdog only rearmed on the first ping from the guest after been
resumed?

> Both scenarios are rare and typically require very small watchdog
> timeouts combined with significant delays in Xen or the Linux kernel
> during suspend/resume flows.
> 
> Conceptually, however, if activating and pinging the Xen watchdog is the
> responsibility of the domain and its services, then the domain should
> also manage the watchdog service/daemon lifecycle. This is similar to
> what is already done by the Xen watchdog driver inside the Linux kernel.

So there's already watchdog driver in Linux, why not activate it with
systemd, since it knows how to do it? I almost want to to remove the
service file and redirect users to use systemd's watchdog instead, in
the documentation.

> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
>  tools/hotplug/Linux/systemd/Makefile          | 12 ++++-
>  .../Linux/systemd/xen-watchdog-sleep.sh       | 45 +++++++++++++++++++
>  2 files changed, 56 insertions(+), 1 deletion(-)
>  create mode 100644 tools/hotplug/Linux/systemd/xen-watchdog-sleep.sh
> 
> diff --git a/tools/hotplug/Linux/systemd/Makefile b/tools/hotplug/Linux/systemd/Makefile
> index e29889156d..98d325cc5d 100644
> --- a/tools/hotplug/Linux/systemd/Makefile
> +++ b/tools/hotplug/Linux/systemd/Makefile
> @@ -5,6 +5,9 @@ XEN_SYSTEMD_MODULES := xen.conf
>  
>  XEN_SYSTEMD_MOUNT := proc-xen.mount
>  
> +XEN_SYSTEMD_SLEEP_SCRIPTS := xen-watchdog-sleep.sh
> +XEN_SYSTEMD_SLEEP_DIR := $(XEN_SYSTEMD_DIR)/../system-sleep

This is the wrong directory, I have no idea what "$(XEN_SYSTEMD_DIR)/.."
could be, even if it's likely to be systemd's directory.
$(XEN_SYSTEMD_DIR) should only be used for system unit files, because
that's how it is defined.

Another comment, from `man 8 systemd-suspend.service`:

    Note that scripts or binaries dropped in /lib/systemd/system-sleep/ are
    intended for local use only and should be considered hacks. If
    applications want to react to system suspend/hibernation and resume,
    they should rather use the Inhibitor interface[1].

    [1] https://www.freedesktop.org/wiki/Software/systemd/inhibit

So is a script in system-sleep the right way?
We probably don't want to go the "inhibitor" way that the manual
suggest, as this would add many dependencies to the daemon (and it's
probably not needed).

How about enhancing xen-watchdog.service to deal with suspend?
It's possible to have "Conflicts=sleep.target" which mean stop this unit
when doing suspend. But restarting the unit on resume seems to need a
second service file which might be a bit more complicated to write,
something like:
    [Unit]
    After=sleep.target
    [Service]
    ExecStart=systemctl restart xen-watchdogd
    [Install]
    WantedBy=suspend.target
    WantedBy=hibernate.target
    WantedBy=hybrid-sleep.target
    WantedBy=suspend-then-hibernate.target
    ...
Actually, I'm not sure After=sleep.target is going to work... we should
be able to use systemd's watchdog capability instead :-) (which seems to
mean that a driver in Linux for xen's watchdog is needed); Never mind,
I've re-read the patch description and commented there.

Anyway, don't use XEN_SYSTEMD_DIR and introduce a new variable
in "systemd.m4".

> +
>  XEN_SYSTEMD_SERVICE := xenstored.service
>  XEN_SYSTEMD_SERVICE += xenconsoled.service
>  XEN_SYSTEMD_SERVICE += xen-qemu-dom0-disk-backend.service
> @@ -15,7 +18,8 @@ XEN_SYSTEMD_SERVICE += xendriverdomain.service
>  
>  ALL_XEN_SYSTEMD :=	$(XEN_SYSTEMD_MODULES)  \
>  			$(XEN_SYSTEMD_MOUNT)	\
> -			$(XEN_SYSTEMD_SERVICE)
> +			$(XEN_SYSTEMD_SERVICE)	\
> +			$(XEN_SYSTEMD_SLEEP_SCRIPTS)
>  
>  .PHONY: all
>  all:	$(ALL_XEN_SYSTEMD)
> @@ -31,15 +35,21 @@ distclean: clean
>  install: $(ALL_XEN_SYSTEMD)
>  	$(INSTALL_DIR) $(DESTDIR)$(XEN_SYSTEMD_DIR)
>  	$(INSTALL_DIR) $(DESTDIR)$(XEN_SYSTEMD_MODULES_LOAD)
> +	$(INSTALL_DIR) $(DESTDIR)$(XEN_SYSTEMD_SLEEP_DIR)
>  	$(INSTALL_DATA) *.service $(DESTDIR)$(XEN_SYSTEMD_DIR)
>  	$(INSTALL_DATA) *.mount $(DESTDIR)$(XEN_SYSTEMD_DIR)
>  	$(INSTALL_DATA) *.conf $(DESTDIR)$(XEN_SYSTEMD_MODULES_LOAD)
> +	set -e; for i in $(XEN_SYSTEMD_SLEEP_SCRIPTS); \
> +	    do \
> +	    $(INSTALL_PROG) $$i $(DESTDIR)$(XEN_SYSTEMD_SLEEP_DIR); \

I don't think you need a loop for that, `install` is perfectly capable
of installing multiple sources.

> +	done
>  
>  .PHONY: uninstall
>  uninstall:
>  	rm -f $(DESTDIR)$(XEN_SYSTEMD_MODULES_LOAD)/*.conf
>  	rm -f $(DESTDIR)$(XEN_SYSTEMD_DIR)/*.mount
>  	rm -f $(DESTDIR)$(XEN_SYSTEMD_DIR)/*.service
> +	rm -f $(addprefix $(DESTDIR)$(XEN_SYSTEMD_SLEEP_DIR)/, $(XEN_SYSTEMD_SLEEP_SCRIPTS))
>  
>  $(XEN_SYSTEMD_MODULES):
>  	rm -f $@.tmp
> diff --git a/tools/hotplug/Linux/systemd/xen-watchdog-sleep.sh b/tools/hotplug/Linux/systemd/xen-watchdog-sleep.sh
> new file mode 100644
> index 0000000000..2b2f0e16d8
> --- /dev/null
> +++ b/tools/hotplug/Linux/systemd/xen-watchdog-sleep.sh
> @@ -0,0 +1,45 @@
> +#!/bin/sh
> +
> +# The first argument ($1) is:
> +#     "pre" or "post"
> +# The second argument ($2) is:
> +#     "suspend", "hibernate", "hybrid-sleep", or "suspend-then-hibernate"
> +
> +. /etc/xen/scripts/hotplugpath.sh
> +
> +SERVICE_NAME="xen-watchdog.service"
> +STATE_FILE="/run/xen-watchdog-sleep-marker"

This should use $XEN_RUN_DIR

> +XEN_WATCHDOG_SLEEP_LOG="${XEN_LOG_DIR}/xen-watchdog-sleep.log"

Is this necessary? Use only `logger`, if `echo log` doesn't log anything.

> +log_watchdog() {
> +    echo "$1"
> +    echo "$(date): $1" >> "${XEN_WATCHDOG_SLEEP_LOG}"
> +}
> +
> +# Exit silently if Xen watchdog service is not present
> +if ! systemctl show "${SERVICE_NAME}" > /dev/null 2>&1; then

Is this necessary? It seems `systemctl is-active` works fine when the
unit doesn't exist.

> +    exit 0
> +fi
> +
> +case "$1" in
> +pre)
> +    if systemctl is-active --quiet "${SERVICE_NAME}"; then
> +        touch "${STATE_FILE}"
> +        log_watchdog "Stopping ${SERVICE_NAME} before $2."
> +        systemctl stop "${SERVICE_NAME}"
> +    fi
> +    ;;
> +post)
> +    if [ -f "${STATE_FILE}" ]; then

Would using `systemctl is-enabled` instead work? It seems to work for a
service on my machine.

> +        log_watchdog "Starting ${SERVICE_NAME} after $2."
> +        systemctl start "${SERVICE_NAME}"
> +        rm "${STATE_FILE}"
> +    fi
> +    ;;
> +*)
> +    log_watchdog "Script called with unknown action '$1'. Arguments: '$@'"
> +    exit 1
> +    ;;
> +esac
> +
> +exit 0
> -- 
> 2.48.1

Thanks,

-- 
Anthony PERARD

