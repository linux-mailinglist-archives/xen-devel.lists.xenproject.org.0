Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DE8415D1E
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 13:56:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193802.345238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNKn-0002yp-Kn; Thu, 23 Sep 2021 11:56:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193802.345238; Thu, 23 Sep 2021 11:56:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNKn-0002vs-GF; Thu, 23 Sep 2021 11:56:13 +0000
Received: by outflank-mailman (input) for mailman id 193802;
 Thu, 23 Sep 2021 11:56:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZpLY=ON=anisinha.ca=ani@srs-us1.protection.inumbo.net>)
 id 1mTNKl-0002vR-9W
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 11:56:11 +0000
Received: from mail-pf1-x42c.google.com (unknown [2607:f8b0:4864:20::42c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b7f1e4b4-490d-4c5d-9f3d-274201aa7a26;
 Thu, 23 Sep 2021 11:56:06 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id 145so5473279pfz.11
 for <xen-devel@lists.xenproject.org>; Thu, 23 Sep 2021 04:56:06 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.156.170])
 by smtp.googlemail.com with ESMTPSA id 201sm5097769pfw.37.2021.09.23.04.55.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 04:56:05 -0700 (PDT)
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
X-Inumbo-ID: b7f1e4b4-490d-4c5d-9f3d-274201aa7a26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=SY869irrxzfOoJkdWCuDuzh7ZngMT+9YxkjytmTDREU=;
        b=U7PowsmPYHknkV3fCw5NxMoC2azRQc+aWAttZ+UHqBZVvwM6dUlqw02Rm2h0zbAbI0
         xbGhtLJ9geYBLFjmTS/5oO5gArei8XSmN62/NNQFQA1+cUB9oZTURXW+AEEwQjYGwoGe
         hBw5BdJd2jktGxhnL3O8AKZdJ95pCO39/6x2yaNFPkm/oAj+jO6+sfeIxbSIkB6qsEtT
         mjDd6A1iOBomObypmypRTU8IV2hWlesozGv9gtU73ixhNgIUvTqibBGj62+H1g2CH6Yv
         O0Y0fl6s49RPCuLNCFEjmFme7dqAQUWsUdhWd8oioOQzNLIehSsGSIHAl7DSq+d4KCb4
         3L8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=SY869irrxzfOoJkdWCuDuzh7ZngMT+9YxkjytmTDREU=;
        b=v3huI2vacsc2x3vrCF8GaevaceP9BJ/tPGADfmc3LSY2Im181wUbJeackuiT4PKpfC
         Q4GxJmnw3zuexCX7wdhF2CTFXwrGIEY+TwF+PyWHGGS06sIxuzhQ9gu0kAETFrJ+tyLO
         A3JSx3oJBUGLfr12NSfERrzWsbERVgHCf5lWoXTonQlRdip++2wfbrDRBas749nkN69L
         FyhXkZMoWD80hnz1+uWzlDkINO9xKBzGfd8llkCvautj/Dt+gAABDcWHCo9gCeKXkEDt
         UJqKRwBpnB8EcC7XFSC/a8GXL4Lbs+hgHci7F1VifHMmeIr2VWlQrP5k9DD+d3nzj8LP
         Pdhg==
X-Gm-Message-State: AOAM532fNmy8JMXDHbDyc9e6vMUydS5aI2ewf3CqHGl4jni2fPIpH9R3
	Lqai5yesDpV/HSxyIK3CpUysfg==
X-Google-Smtp-Source: ABdhPJxN+kA2mTsQR+l1zBPEpE/rXxHeA2wclNVyce3HUXRFs9M3E7zp1eZW9twTe7ZJhuUZvRsFxQ==
X-Received: by 2002:a62:1ec5:0:b0:446:40ec:73b2 with SMTP id e188-20020a621ec5000000b0044640ec73b2mr4086191pfe.5.1632398165735;
        Thu, 23 Sep 2021 04:56:05 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Thu, 23 Sep 2021 17:25:54 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Ani Sinha <ani@anisinha.ca>
cc: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org, 
    Alistair Francis <Alistair.Francis@wdc.com>, 
    =?ISO-8859-15?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>, 
    Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>, 
    Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
    =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>, 
    "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>, 
    Gerd Hoffmann <kraxel@redhat.com>, Eric Auger <eric.auger@redhat.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
    Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>, 
    "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
    Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>, 
    qemu-riscv@nongnu.org, xen-devel@lists.xenproject.org, 
    mark.burton@greensocs.com, mirela.grujic@greensocs.com, edgari@xilinx.com, 
    Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH v2 10/16] qdev-monitor: allow adding any sysbus device
 before machine is ready
In-Reply-To: <alpine.DEB.2.22.394.2109231628280.630@anisinha-lenovo>
Message-ID: <alpine.DEB.2.22.394.2109231723060.630@anisinha-lenovo>
References: <20210922161405.140018-1-damien.hedde@greensocs.com> <20210922161405.140018-11-damien.hedde@greensocs.com> <alpine.DEB.2.22.394.2109231628280.630@anisinha-lenovo>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Thu, 23 Sep 2021, Ani Sinha wrote:

>
>
> On Wed, 22 Sep 2021, Damien Hedde wrote:
>
> > Skip the sysbus device type per-machine allow-list check before the
> > MACHINE_INIT_PHASE_READY phase.
> >
> > This patch permits adding any sysbus device (it still needs to be
> > user_creatable) when using the -preconfig experimental option.
> >
> > Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> > ---
> >
> > This commit is RFC. Depending on the condition to allow a device
> > to be added, it may change.
> > ---
> >  softmmu/qdev-monitor.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> > index f1c9242855..73b991adda 100644
> > --- a/softmmu/qdev-monitor.c
> > +++ b/softmmu/qdev-monitor.c
> > @@ -269,8 +269,13 @@ static DeviceClass *qdev_get_device_class(const char **driver, Error **errp)
> >          return NULL;
> >      }
> >
> > -    if (object_class_dynamic_cast(oc, TYPE_SYS_BUS_DEVICE)) {
> > -        /* sysbus devices need to be allowed by the machine */
> > +    if (object_class_dynamic_cast(oc, TYPE_SYS_BUS_DEVICE) &&
> > +        phase_check(MACHINE_INIT_PHASE_READY)) {
> > +        /*
> > +         * Sysbus devices need to be allowed by the machine.
> > +         * We only check that after the machine is ready in order to let
> > +         * us add any user_creatable sysbus device during machine creation.
> > +         */
> >          MachineClass *mc = MACHINE_CLASS(object_get_class(qdev_get_machine()));
> >          if (!machine_class_is_dynamic_sysbus_dev_allowed(mc, *driver)) {
> >              error_setg(errp, "'%s' is not an allowed pluggable sysbus device "
>
> Since now you are adding the state of the machine creation in the
> valiation condition, the failure error message becomes misleading.
> Better to do this I think :
>
> if (object class is TYPE_SYS_BUS_DEVICE)
> {
>   if (!phase_check(MACHINE_INIT_PHASE_READY))
>     {
>       // error out here saying the state of the machine creation is too
> early
>     }
>
>     // do the other check on dynamic sysbus
>
> }

The other thing to consider is whether we should put the machine phaze
check at a higher level, at qdev_device_add() perhaps. One might envison
that different device types may be allowed to be added at different
stages of machine creation. So this check needs be more generalized for
the future.



