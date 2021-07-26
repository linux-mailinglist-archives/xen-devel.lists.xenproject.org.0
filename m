Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EE33D5A0C
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jul 2021 15:07:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.160952.295534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m80KG-0008D5-R9; Mon, 26 Jul 2021 13:07:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 160952.295534; Mon, 26 Jul 2021 13:07:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m80KG-0008AQ-O7; Mon, 26 Jul 2021 13:07:20 +0000
Received: by outflank-mailman (input) for mailman id 160952;
 Mon, 26 Jul 2021 13:07:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DUSJ=MS=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1m80KF-0008AK-K3
 for xen-devel@lists.xenproject.org; Mon, 26 Jul 2021 13:07:19 +0000
Received: from mail-lf1-x12f.google.com (unknown [2a00:1450:4864:20::12f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c9364005-ace2-4930-9c40-b5121726098b;
 Mon, 26 Jul 2021 13:07:16 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id m13so15275187lfg.13
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jul 2021 06:07:16 -0700 (PDT)
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
X-Inumbo-ID: c9364005-ace2-4930-9c40-b5121726098b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DVeS+mT5YLCi8K9+YNgz4S4XkXfjuLUKhj5989jmeEE=;
        b=L0P2is/TuLlme7ZfRUNaFzlQP0vXUg8P3VRd6VTfmWUHa2g1k5+d5Yf2+PxMZeMKNI
         NXP8o9owuMLAqwdmz3i6Cg/wqcIJ0eFcz09E0IXc3YvnGFvkmNIGwXMEJV5w1GJcJTtg
         5+hiyyJZf8WmNj0S79tOjEChl7tpCqGi95Xm8TDl7y426vhPFMzJFYxH5/Z2UjwUqh6i
         +7BvpBt6Py0z+3IrnaH355BnopwnU2CwJVAzQO33JY7flIz4bpHkZccrngUsBcpS8VLD
         Mp0rC6pg6A5JScT5po30QeL0vMMyyVR5jywksM4Eej2xSEJa/46dPI0I05ILqw4BG6kA
         pl8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DVeS+mT5YLCi8K9+YNgz4S4XkXfjuLUKhj5989jmeEE=;
        b=AB7rFHDq7Igh/oXCVerO+vmzyKvaQZchnbhaTlD4oTRiY82AgY8KfFOfXMsl5rVo43
         30J5D0rqfxk4UmW34M5UqXf8GR5Cf87dFbdNgYogD5vHiKYp81fbEKg95Yu/I5AFl8ci
         JAUV8G9LJk5m5qKWY5SWY1lepIKoDyLlt45ibrVMDBrkJUtG7AXT1Qc69c1JVSw/S4vl
         p5s7jVH+T+eB6eZ/0+qF/gZYYt8FKjikhov0c8mjN73uhVNC76Mc+CRGzEPDlO9y3m3a
         EtPSOrEFQqhuLYwgBe5DuwSar02vsMcgKtz03aCxiApqvb4kd/+BrsL9ncqXwEvVyi8X
         5khA==
X-Gm-Message-State: AOAM531Me3P6WTjal9arSklS/pdNPRqp2MrbwjnZvvzheaHaZ+TM4gye
	WRB/7cW+sZA7jBUKxutPGBuDbQtz3kv6eoyIdsM=
X-Google-Smtp-Source: ABdhPJz55rlmWDgq/LKqQGMm5Qt/Ov4dyav4/5iKVUqLorDhChBfpgvSGFE5Gh5VEtLihRxFTuG63GBsNmcxpmRTcg8=
X-Received: by 2002:ac2:5383:: with SMTP id g3mr12886750lfh.150.1627304834893;
 Mon, 26 Jul 2021 06:07:14 -0700 (PDT)
MIME-Version: 1.0
References: <8ee22fab0731347dd7f998c5f336eac804785c28.1627014699.git.scott.davis@starlab.io>
In-Reply-To: <8ee22fab0731347dd7f998c5f336eac804785c28.1627014699.git.scott.davis@starlab.io>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 26 Jul 2021 09:07:03 -0400
Message-ID: <CAKf6xpvZZCdEbPoetXabX15yL_oMnya0813-nrm6+WagL3Wx3w@mail.gmail.com>
Subject: Re: [XEN PATCH] tools/xl: Add device_model_stubdomain_init_seclabel
 option to xl.cfg
To: Scott Davis <scottwd@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Scott Davis <scott.davis@starlab.io>, 
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, 
	George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@ainfosec.com>, 
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, 
	Daniel De Graaf <dgdegra@tycho.nsa.gov>, "Daniel P . Smith" <dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 23, 2021 at 12:47 AM Scott Davis <scottwd@gmail.com> wrote:
>
> This adds an option to the xl domain configuration syntax for specifying
> a build-time XSM security label for device-model stubdomains separate from
> the run-time label specified by 'device_model_stubdomain_seclabel'. Fields
> are also added to the 'libxl_domain_build_info' struct to contain the new
> information, and a new call to 'xc_flask_relabel_domain' inserted to
> affect the change at the appropriate time.
>
> The implementation mirrors that of the 'seclabel' and 'init_seclabel'
> options for user domains. When all used in concert, this enables the
> creation of security policies that minimize run-time privileges between
> the toolstack domain, device-model stubdomains, and user domains.

Cool stuff!

> Signed-off-by: Scott Davis <scott.davis@starlab.io>
> ---

> @@ -1935,7 +1953,13 @@ static void domcreate_complete(libxl__egc *egc,
>      libxl__domain_build_state_dispose(&dcs->build_state);
>
>      if (!rc && d_config->b_info.exec_ssidref)
> -        rc = xc_flask_relabel_domain(CTX->xch, dcs->guest_domid, d_config->b_info.exec_ssidref);
> +        rc = xc_flask_relabel_domain(CTX->xch, dcs->guest_domid,
> +                                     d_config->b_info.exec_ssidref);
> +
> +    if (!rc && dcs->sdss.pvqemu.guest_domid != INVALID_DOMID &&
> +        d_config->b_info.device_model_exec_ssidref)
> +        rc = xc_flask_relabel_domain(CTX->xch, dcs->sdss.pvqemu.guest_domid,
> +                                     d_config->b_info.device_model_exec_ssidref);

The build/create logic is complicated, so I'm asking the question in
case you already know.  This looks like domcreate_complete runs once
and relabels both the guest domain and the stubdom.  I thought it
would get called for each of stubdom and guest, so they would be
labeled according to exec_ssidref which you set for the stubdom b_info
below.  I looked around some and it seems like domcreate_complete is
only called for the guest.

Sort of relatedly, is stubdom unpaused before the guest gets
relabeled?  Quickly looking, I think stubdom is unpaused.  I would
think you want them both relabeled before either is unpaused.  If the
stubdom starts with the exec_label, but it sees the guest with the
init_label, it may get an unexpected denial?  On the other hand,
delayed unpausing of stubdom would slow down booting.

With the stubdom getting unpaused before relabel, do you have to give
the stubdom some extra flask policy permissions to handle that case?

>      bool retain_domain = !rc || rc == ERROR_ABORTED;
>
> diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
> index dbd3c7f278..2b69b207c4 100644
> --- a/tools/libs/light/libxl_dm.c
> +++ b/tools/libs/light/libxl_dm.c
> @@ -2300,20 +2300,24 @@ void libxl__spawn_stub_dm(libxl__egc *egc, libxl__stub_dm_spawn_state *sdss)
>      sdss->pvqemu.guest_domid = INVALID_DOMID;
>
>      libxl_domain_create_info_init(&dm_config->c_info);
> +    libxl_domain_build_info_init(&dm_config->b_info);
> +    libxl_domain_build_info_init_type(&dm_config->b_info, LIBXL_DOMAIN_TYPE_PV);
> +

Is there a particular need for moving these lines here?

>      dm_config->c_info.type = LIBXL_DOMAIN_TYPE_PV;
>      dm_config->c_info.name = libxl__stub_dm_name(gc,
>                                      libxl__domid_to_name(gc, guest_domid));
> -    /* When we are here to launch stubdom, ssidref is a valid value
> -     * already, no need to parse it again.
> +
> +    /* When we are here to launch stubdom, ssidrefs are valid values already,
> +     * no need to parse them again.
>       */
>      dm_config->c_info.ssidref = guest_config->b_info.device_model_ssidref;
>      dm_config->c_info.ssid_label = NULL;
> +    dm_config->b_info.exec_ssidref =
> +        guest_config->b_info.device_model_exec_ssidref;
> +    dm_config->b_info.exec_ssid_label = NULL;

At first glance, it seems only these additions are strictly necessary.
But if only domcreate_complete is doing the relabel, then they are
unused?

Thanks,
Jason

