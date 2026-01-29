Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MC5CMihFe2l+DAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 12:31:52 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3D6AFA65
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 12:31:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216299.1526218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlQFS-0006Cx-59; Thu, 29 Jan 2026 11:31:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216299.1526218; Thu, 29 Jan 2026 11:31:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlQFS-00069t-2G; Thu, 29 Jan 2026 11:31:42 +0000
Received: by outflank-mailman (input) for mailman id 1216299;
 Thu, 29 Jan 2026 11:31:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXHF=AC=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vlQFQ-00069n-GN
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 11:31:40 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 133f9b07-fd06-11f0-9ccf-f158ae23cfc8;
 Thu, 29 Jan 2026 12:31:38 +0100 (CET)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-383122fbc9bso7362431fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 29 Jan 2026 03:31:38 -0800 (PST)
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
X-Inumbo-ID: 133f9b07-fd06-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; t=1769686298; cv=none;
        d=google.com; s=arc-20240605;
        b=EZM/6yvT63B5XT0r8ODKJksN9P7ecpWgCLoWYoUutZ9gpo+Z6NpF9Qcv6vfyIWrxdP
         FLGZnqEFb4LXVf+ytq6q+lK30HcBAs0CbqlvCixGrLrh5M1ySH0k/a9VqAyhHc6kc9rs
         gWFt4MQndwru6C+UAKDvVyST3pXjainTR1g3BOxNUH0WdZaYF8JxZQifWFerSQCGgY/X
         6XT4SiBtV6uALIJI0JG7TN2HRhwnBMYYUQKy2GgTMy1Tc4qISCUStfMGnforQW1YlC7L
         696fHkZLbaQ19nD41HevHqtmwIgMcsuN+QPZl8VRfGnyOa5gc/B9RvPt6FX6czIYzA2z
         dWTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qB9JPqRk50DTcZH64YAxcbOSLeP8QgQD98CMoYjRSH4=;
        fh=XPwOTaEPrdk2pN2RgjfihMkJ4NQu8t1nAUIywJrC5RY=;
        b=e55DzTHg24dLgs6++G3b1mxcT5ArxX3C6VqY7jQWphhc/8VrKl0gCYxVG8umk/jt74
         8W3s8WZ49HomLeYOLMIoSAciOTcgi1M6r4zVtsSo16LdFOGPlvcPy61CuSJWB8PgOYAU
         WoMDQpmEUTf7V0Sqm9tVPn1clBAgEaPTZ5JOxhISFX78Luwyloybaw7D6OyV8FppY1rS
         XDGTXw1HRuIJBZQEDIUrmlXMxpBFjRdNjh20Skd6Ayizl3vYXbzSmvJeBdyLgEhTsbMB
         vChOP/FQn8yGOJIHdTFXZYpwWFAwduM5fHfYGgoVyqtXzIgKFmy2c3V1nYV6JSuxio61
         8q4A==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769686298; x=1770291098; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qB9JPqRk50DTcZH64YAxcbOSLeP8QgQD98CMoYjRSH4=;
        b=XDU+oh7PP49vKVCQIshnvWCUjrsBJOB8WsTgeA7SMgP4Sqo89JN83HDBn4UsszJA/D
         /8An4KhxT9PfkBE2yETQOT3wwhliNpFFCK5NWJA6KWnNBI9MAO7BpKtPoUWZ9PX0Szi1
         Aaob55NSQbOhdYU+reZwFeRDsWX5h8/E5wfWnb5LYnd6z4h4B4zoJd07LnrlbO5uF7ZH
         1yHBW3GMqrhPKcdgICcN4yumwLC3GBw3vVJe4kP9GpL3tJwbamqmnKrF5wxDKXA38bzG
         E/ixnTpnTZiN8XSBoVwZoCAUwUlaIocHPfJ5DXW7a8ZROMo2M2RghcATh1KPUKZnJIkr
         UE8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769686298; x=1770291098;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qB9JPqRk50DTcZH64YAxcbOSLeP8QgQD98CMoYjRSH4=;
        b=vhTalWSEjlSRdHpiE8w37jscUhy1djhEW/7YTn5yanaclxsCCp/w13/LZ75E4+mwrt
         C0CuqixGSDKCtKxxDe2q/mVsKJ1f8990gaGbQiviNC6XgHk7IgfaRUmgIwqETphr1Nel
         tce7ed+TjaLkKU5e0y8ExCEunUYt/HVQlTSy73XjoMFCnR6ybwyBTcanHYJh3C9p632l
         96RpZM2gEJwS8/HJEETamqICwXxkO9BZd2brWl5KMmo6nonFw8gEuc5K8cX7kUEx1KB6
         GHTcVzgSgDlrmvmXLdmr/xOEjDfLgPimobS8d+yB1ZRaFT3s6NhEyc7FF2/H5nyN70ui
         FSYw==
X-Gm-Message-State: AOJu0YzjI/uqV/B9oP9XRamy588uT8yF3ARlTkD/Ko856t1vi1at4YS7
	IB0H9xS1AFFTLYgzuf5qZ6n5KLsaSDtvJNIkeGuSLjaslvKhRbDHuwSwQge0rUstFXEt/UqgA17
	33Gp9zVG9OJ0O0aGVnm++5GKYBja7e0w=
X-Gm-Gg: AZuq6aJPabluRir5tPHwFceIiWqOHN1/a4M9RYs63wnM4t9+922OymjCvhIlEfuCRWJ
	hKI4dTxoSNjvVvyFMI3h5dUJErUkhwcmOCNvwbtsa5ikr8Wx/1P4lGQi9TtP3vYVCSDb3x9r2qy
	cj5vFUvDspfcAG5T/cmbrnFckaVnYaiImfsU18Fv30enNUyW2tdcFo9lKbgxEYmk4w+92mavUF3
	m7KncVSa9ZyLObTd/Ukcd/OY6QVKGoOnqHvenIZidv0CiZzpCsuO+sCy15JBe9ynVUpOiPWyQZQ
	eeQr
X-Received: by 2002:a05:6512:1393:b0:59b:7c2b:4440 with SMTP id
 2adb3069b0e04-59e0413b297mr3327102e87.53.1769686297500; Thu, 29 Jan 2026
 03:31:37 -0800 (PST)
MIME-Version: 1.0
References: <cover.1765533584.git.mykola_kvach@epam.com> <f1d118552f84e2b894ec7163000f6dba98d0e3fa.1765533584.git.mykola_kvach@epam.com>
 <806731b5-6c56-4274-98f1-120530cfe398@amd.com>
In-Reply-To: <806731b5-6c56-4274-98f1-120530cfe398@amd.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 29 Jan 2026 13:30:00 +0200
X-Gm-Features: AZwV_QjCq70XFQkE8IMqdsVwexUv0tKKaqQ3p8A10J0RKqfO1y46Yqzl6CysOvo
Message-ID: <CAGeoDV8hCwBgjKDsms68f8MnY0tEus6oGWC2v1uYNSYiUfWBBw@mail.gmail.com>
Subject: Re: [PATCH v16 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for guests
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,mail.gmail.com:mid,epam.com:email,amd.com:email];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3E3D6AFA65
X-Rspamd-Action: no action

Hi Michal,

Thanks for the review -- I think there are two separate concerns here
(domain state vs. ARM-specific resume context), and it=E2=80=99s easy to co=
nflate
them.

On Thu, Jan 15, 2026 at 11:03=E2=80=AFAM Orzel, Michal <michal.orzel@amd.co=
m> wrote:
>
>
>
> On 12/12/2025 14:18, Mykola Kvach wrote:
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > Add support for the PSCI SYSTEM_SUSPEND function in the vPSCI interface=
,
> > allowing guests to request suspend via the PSCI v1.0+ SYSTEM_SUSPEND ca=
ll
> > (both 32-bit and 64-bit variants).
> >
> > Implementation details:
> > - Add SYSTEM_SUSPEND function IDs to PSCI definitions
> > - Trap and handle SYSTEM_SUSPEND in vPSCI
> > - Allow only non-hardware domains to invoke SYSTEM_SUSPEND; return
> >   PSCI_NOT_SUPPORTED for the hardware domain to avoid halting the syste=
m
> >   in hwdom_shutdown() via domain_shutdown
> > - Require all secondary VCPUs of the calling domain to be offline befor=
e
> >   suspend, as mandated by the PSCI specification
> >
> > The arch_domain_resume() function is an architecture-specific hook that=
 is
> > invoked during domain resume to perform any necessary setup or restorat=
ion
> > steps required by the platform. arch_domain_resume() stays int to propa=
gate
> > errno-style detail into common logging; preserving the integer keeps th=
e
> > reason visible and leaves room for future arch-specific failures or ric=
her
> > handling.
> >
> > The new vpsci_vcpu_up_prepare() helper is called on the resume path to =
set up
> > the vCPU context (such as entry point, some system regs and context ID)=
 before
> > resuming a suspended guest. This keeps ARM/vPSCI-specific logic out of =
common
> > code and avoids intrusive changes to the generic resume flow.
> >
> > Usage:
> >
> > For Linux-based guests, suspend can be initiated with:
> >     echo mem > /sys/power/state
> > or via:
> >     systemctl suspend
> >
> > Resuming the guest is performed from control domain using:
> >       xl resume <domain>
> >
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > Changes in V16:
> > - Refactor error handling in domain_resume: move logging to generic cod=
e,
> >   use explicit return code checking.
> > - Make context clearing conditional on success in arch_domain_resume.
> > - The 'int' return type is retained for arch_domain_resume for consiste=
ncy
> >   with other arch hooks and to allow for specific negative error codes.
> > ---
> >  xen/arch/arm/domain.c                 |  39 +++++++++
> >  xen/arch/arm/include/asm/domain.h     |   2 +
> >  xen/arch/arm/include/asm/perfc_defn.h |   1 +
> >  xen/arch/arm/include/asm/psci.h       |   2 +
> >  xen/arch/arm/include/asm/suspend.h    |  27 ++++++
> >  xen/arch/arm/include/asm/vpsci.h      |   5 +-
> >  xen/arch/arm/vpsci.c                  | 116 +++++++++++++++++++++-----
> >  xen/common/domain.c                   |  10 +++
> >  xen/include/xen/suspend.h             |  25 ++++++
> >  9 files changed, 205 insertions(+), 22 deletions(-)
> >  create mode 100644 xen/arch/arm/include/asm/suspend.h
> >  create mode 100644 xen/include/xen/suspend.h
> >
> > diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> > index 47973f99d9..f903e7d4f0 100644
> > --- a/xen/arch/arm/domain.c
> > +++ b/xen/arch/arm/domain.c
> > @@ -12,6 +12,8 @@
> >  #include <xen/softirq.h>
> >  #include <xen/wait.h>
> >
> > +#include <public/sched.h>
> > +
> >  #include <asm/arm64/sve.h>
> >  #include <asm/cpuerrata.h>
> >  #include <asm/cpufeature.h>
> > @@ -24,10 +26,12 @@
> >  #include <asm/platform.h>
> >  #include <asm/procinfo.h>
> >  #include <asm/regs.h>
> > +#include <asm/suspend.h>
> >  #include <asm/firmware/sci.h>
> >  #include <asm/tee/tee.h>
> >  #include <asm/vfp.h>
> >  #include <asm/vgic.h>
> > +#include <asm/vpsci.h>
> >  #include <asm/vtimer.h>
> >
> >  #include "vpci.h"
> > @@ -851,6 +855,41 @@ void arch_domain_creation_finished(struct domain *=
d)
> >      p2m_domain_creation_finished(d);
> >  }
> >
> > +int arch_domain_resume(struct domain *d)
> > +{
> > +    int rc;
> > +    struct resume_info *ctx =3D &d->arch.resume_ctx;
> > +
> > +    if ( !d->is_shutting_down || d->shutdown_code !=3D SHUTDOWN_suspen=
d )
> How does this check and returning -EINVAL correspond to...

The

  if ( !d->is_shutting_down || d->shutdown_code !=3D SHUTDOWN_suspend )

guard is meant to validate the domain state for the DOMCTL resumedomain
entry point (i.e. reject an xl resume on a domain that isn=E2=80=99t in the
"suspend shutdown" state). Suspend requests issued via SCHEDOP_shutdown /
SCHEDOP_remote_shutdown with reason SUSPEND still put the domain into
is_shutting_down=3D1 and shutdown_code=3DSHUTDOWN_suspend, so they do pass
this state check.

What the comment below was trying to say is different: those hypercall
paths don=E2=80=99t go through vPSCI SYSTEM_SUSPEND, so they don=E2=80=99t =
populate the
Arm-specific resume context (notably wake_cpu). In that case ctx->wake_cpu
remains NULL and the Arm arch_domain_resume() returns early.

>
> > +    {
> > +        dprintk(XENLOG_WARNING,
> > +                "%pd: Invalid domain state for resume: is_shutting_dow=
n=3D%u, shutdown_code=3D%u\n",
> > +                d, d->is_shutting_down, d->shutdown_code);
> > +        return -EINVAL;
> > +    }
> > +
> > +    /*
> > +     * It is still possible to call domain_shutdown() with a suspend r=
eason
> > +     * via some hypercalls, such as SCHEDOP_shutdown or SCHEDOP_remote=
_shutdown.
> > +     * In these cases, the resume context will be empty.
> this comment? This patch assumes that we can now resume successfully (i.e=
. this
> function returns 0 and common domain_resume can continue) only if the shu=
tdown
> was with SCHEDOP_shutdown. Anything else will infinitely keep the vCPUS p=
aused.

Separately (and this is why I=E2=80=99m hesitant to make domain_resume()
"suspend-only"): domain_resume() is also used by the soft-reset flow.
Today soft-reset is effectively x86-only (gated by HAS_SOFT_RESET), but
the core plumbing is in common code and is intentionally generic -- the
soft-reset calling chain ends up using domain_resume() as a generic
helper. If domain_resume() itself starts rejecting anything other than
SHUTDOWN_suspend, it would also be a future trap if/when someone
enables HAS_SOFT_RESET on Arm.

>
> Other than that, the patch looks good.
>
> ~Michal
>

Best regards,
Mykola

