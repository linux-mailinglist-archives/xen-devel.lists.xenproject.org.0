Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 010D159615D
	for <lists+xen-devel@lfdr.de>; Tue, 16 Aug 2022 19:43:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388453.625108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oO0az-0004EO-4h; Tue, 16 Aug 2022 17:43:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388453.625108; Tue, 16 Aug 2022 17:43:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oO0az-0004B5-1Y; Tue, 16 Aug 2022 17:43:17 +0000
Received: by outflank-mailman (input) for mailman id 388453;
 Tue, 16 Aug 2022 17:43:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NbGa=YU=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1oO0ax-0004Az-7A
 for xen-devel@lists.xenproject.org; Tue, 16 Aug 2022 17:43:15 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e71dba47-1d8a-11ed-9250-1f966e50362f;
 Tue, 16 Aug 2022 19:43:14 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id fy5so20286336ejc.3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Aug 2022 10:43:14 -0700 (PDT)
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
X-Inumbo-ID: e71dba47-1d8a-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=WXX4x+IKpAZ3iCSL+4AM/XfhvHo3b+sFbJ4bZV78QsI=;
        b=BRFTG8PlKxlau44fAxmTJdY5pze60IbGKWB+L5CLIPCgaSCrl3P4aTq5nerYjxfTbk
         eybDqxF8zupukl/4HbGxsFRBG9WJDaCfwjoGpP93xlUroO9HoizDMFVpauSrd/sdIcYS
         okAkeuUia6c94Nu6RrgNWLZ3g8UzL7I9NlvDayHs9tu5HX/cR13XA4sKMemkeVS0Bvti
         ZQ7wd/dYMB6dqbZHuF0hZh+F8YgdcgY+wzlKBvOJKsXF3LEHBN9mre4qYbeAFLCVjnw8
         HjvaDTMOIUlerdh4p47kDpVBifHZ2sG6qF4RE22Qou1JCeyAy6SzEhRYIW+/nxCHC3VW
         fyLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=WXX4x+IKpAZ3iCSL+4AM/XfhvHo3b+sFbJ4bZV78QsI=;
        b=ejgTR1hJGHFA/xdTiB/FqYCMCsjLnamRvd8BnQM0wgslSEcQQ/reOYW35MPbsbQX0r
         qvKoxl0QajteQm7nGminC3p4Cf2yNBhYGZDExNlxp8UCQ2LiWmlrdd1FKdf71hs8Ph93
         xE3BsGw46twMwZhcStp1KCvUOVbtZ/Yx0U19tIEyTLVfSPqAvAW4KW7vUwe22eyXQYye
         L14Ws1N0kGUXvQyr36frVZRz3sxCujh+ACMyxmoooH+gqMWGf+YqB1I1wo38HKSTHovA
         opOJX0jiPySoi2KI/Gq+vmlurGl5Bwv3DziPtkP2xI0obiYgp0ok+wRAPvErY7+DI4U6
         7ECw==
X-Gm-Message-State: ACgBeo2o2a+QQFPdWBay/W6SZtl/pVzqoxrmCpREk9FVfQURlKt5NTAW
	T34ioskn26lWkb/7fE31JyUGNZuqcs9oTy4yoC3SNL09
X-Google-Smtp-Source: AA6agR6+RZpW1liG7KjliGOz9c+nVXJGuEzoWWzFkcMqFl4Kfr6JTdK+ORndV4HgDaKSH9FgOjcttMG9/7TpByarNFM=
X-Received: by 2002:a17:907:6d8f:b0:730:b108:5062 with SMTP id
 sb15-20020a1709076d8f00b00730b1085062mr14327987ejc.461.1660671793540; Tue, 16
 Aug 2022 10:43:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220809140633.23537-1-dpsmith@apertussolutions.com>
In-Reply-To: <20220809140633.23537-1-dpsmith@apertussolutions.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 16 Aug 2022 13:43:01 -0400
Message-ID: <CAKf6xpur5sESPxgDEmY=PsnDDmuZ898UbaAECccGuQuyetjHEQ@mail.gmail.com>
Subject: Re: [PATCH v12] xsm: refactor flask sid alloc and domain check
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

I think you should change the title to "xsm/flask: Boot-time labeling
for multiple domains".  Refactor implies no functional change, and
this is a functional change.  With this, I think the commit message
should be re-written to focus on the "why" of the new labeling policy.

On Tue, Aug 9, 2022 at 10:06 AM Daniel P. Smith
<dpsmith@apertussolutions.com> wrote:
>
> The function flask_domain_alloc_security() allocates the security context and
> assigns an initial SID for the domain under construction. When it came to SID
> assignment of the initial domain, flask_domain_alloc_security() would assign
> unlabeled_t. Then in flask_domain_create() it would be switched to dom0_t.
> This logic worked under the assumption that the first domain constructed would
> be the hypervisor constructing dom0 and all other domains would be constructed
> by a toolstack, which would provide a SID. The introduction of dom0less and
> subsequently hyperlaunch violates this assumption, as non-privileged domain may
> be constructed before the initial domain or no initial domain may be
> constructed at all. It is not possible currently for dom0less to express domain
> labels in the domain configuration, as such the FLASK policy must employ a
> sensible initial SID assignment that can differentiate between hypervisor and
> toolstack domain construction.  With the introduction of xenboot_t it is now
> possible to distinguish when the hypervisor is in the boot state, and thus any
> domain construction happening at this time is being initiated by the
> hypervisor.

The problem this commit is addressing is "flask can only label a
single dom0_t at boot, and this is incompatible with dom0less and
hyperlaunch".

ISTM that dom0less device tree could gain a node for the security
label, and Hyperlaunch already supports labels.  But a goal of this
patch is to make it work without changing dom0less?  And it may be
worth more directly stating that dom0less panics today since the domU
fails to build with unlabeled_t.

Also a motivation was to align Flask labels to match the dummy policy
with dom0/domU, correct?  That would be worth adding.

> This commit addresses the above situation by using a check to confirm if the
> hypervisor is under the xenboot_t context in flask_domain_alloc_security().
> When that is the case, it will inspect the domain's is_privileged field to
> determine whether an initial label of dom0_t or domU_t should be set for the
> domain. The logic for flask_domain_create() was changed to allow the incoming
> SID to override the initial label.

AFAICT, the labeling policy needs to handle these three cases:
1) Traditional domain 0 (x86 or arm)
Single domain - domid == 0 && privileged

2) dom0less (arm)
Possibly a single dom0 - domid == 0 && privileged
Multiple domUs - domid > 0 && not privileged
Notably, it takes care not to create a domU with domid 0.

3) Hyperlaunch (x86 or arm)
Potentially anything?  I don't know what you envision for this.

When it was only dom0, it was easy to put a heuristic in flask to
label the first domain as dom0_t.  With dom0less, the heuristic can be
expanded to include domid > 0 -> domU_t.  With hyperlaunch, I'm not
sure.  Is there something it needs that wouldn't be covered?

dom0_t being a singleton emphasized for me that using only
is_privileged for the check isn't quite right.  Does hyperlaunch need
domid != 0 && is_privileged to get assigned dom0_t?  That could still
be done explicitly, but just not implicitly by the above.

> The base policy was adjusted to allow the idle domain under the xenboot_t
> context the ability to construct domains of both types, dom0_t and domu_t.

I suppose if someone doesn't want to use domU_t/dom0_t, then they
could remove the xenboot_t allow rules which would defacto require
explicit labels.

> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>


> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -182,7 +182,15 @@ static int cf_check flask_domain_alloc_security(struct domain *d)
>          dsec->sid = SECINITSID_DOMIO;
>          break;
>      default:
> -        dsec->sid = SECINITSID_UNLABELED;
> +        if ( domain_sid(current->domain) == SECINITSID_XENBOOT )
> +        {
> +            if ( d->is_privileged )

The policy outlined above would change this line to:
    if ( d->is_privileged && d->domid == 0 )

> +                dsec->sid = SECINITSID_DOM0;
> +            else
> +                dsec->sid = SECINITSID_DOMU;
> +        }
> +        else
> +            dsec->sid = SECINITSID_UNLABELED;
>      }
>
>      dsec->self_sid = dsec->sid;
> @@ -550,20 +558,36 @@ static int cf_check flask_domain_create(struct domain *d, uint32_t ssidref)
>      struct domain_security_struct *dsec = d->ssid;
>      static int dom0_created = 0;
>
> -    if ( is_idle_domain(current->domain) && !dom0_created )

This old check only applied at boot time to label the first domain as
dom0_t, but it didn't restrict runtime labeling...

> +    /*
> +     * The dom0_t label is expressed as a singleton label in the base policy.
> +     * This cannot be enforced by the security server, therefore it will be
> +     * enforced here.
> +     */
> +    if ( ssidref == SECINITSID_DOM0 )
>      {

...this new one restricts runtime labeling with dom0_t.  It's an
unusual case, so making the code change is (probably) fine.   But it
should at least be mentioned in the commit message.

However, if the boot time policy adds "domid == 0" to the dom0_t
assignment, then the dom0_created code can go away.

Regards,
Jason

