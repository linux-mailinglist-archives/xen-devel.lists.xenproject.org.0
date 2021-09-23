Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F1241603F
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 15:47:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194262.346055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTP44-0002ia-63; Thu, 23 Sep 2021 13:47:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194262.346055; Thu, 23 Sep 2021 13:47:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTP44-0002gl-1f; Thu, 23 Sep 2021 13:47:04 +0000
Received: by outflank-mailman (input) for mailman id 194262;
 Thu, 23 Sep 2021 13:47:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZpLY=ON=anisinha.ca=ani@srs-us1.protection.inumbo.net>)
 id 1mTP42-0002gf-2e
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 13:47:02 +0000
Received: from mail-ed1-x52d.google.com (unknown [2a00:1450:4864:20::52d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9cbeecaa-b1b2-4cdd-ae9a-8cc795971c54;
 Thu, 23 Sep 2021 13:47:01 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id c21so23596735edj.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 Sep 2021 06:47:01 -0700 (PDT)
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
X-Inumbo-ID: 9cbeecaa-b1b2-4cdd-ae9a-8cc795971c54
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=X6tPYj9oUhcOZ+uoKP+nG8NnVQLmoHX/d9g9BCvLsR4=;
        b=hhQ6niECsnZzrG0mdkN3l2WljsCA50VtPKnZq/g/2/G/ZURvGbApaDR4yM3Qu7Nedr
         yCbU2ae+DEh22mAwEsYAFVeHCmi2bWr7WdChJM2pKepbtPDure7P44nCJZ2ISY4/vdNs
         bq8yhJ5dTW5mGd3AfNM1D7FzOCp7GGd6zmvX2Sac656+re+366zG2dB+NClxqXqRq0xh
         htyslKOh7ULkt6Pot837zj5o9iN+TyPQOYd2F9w9eoRyHdRezVHYpRhoZ3Njl2piiKKY
         XjR+oCA6huAJMYDWQDZUBthnwD5zHMYYY3ylJSOJ4a0uQ9yJ3GvdPxnjKj4UhEWK172g
         MV7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=X6tPYj9oUhcOZ+uoKP+nG8NnVQLmoHX/d9g9BCvLsR4=;
        b=wHcfr42cb1QDILBnQo7IrKLqqxLyzml/JDvCP2tZwCEKdXoulwVuusYrqNumDiH3XE
         X7AeX9/VrNaA9Di1l9T8h87jx1FEJ3/x5a2xEGtvKZxn8hSBkgFHUmyS11ajII7JYV/R
         L3xKzV9gFUtvRSrVCP7ixMzsit5qgifTfOItVNyPKeybb/LkV9J4bKRiDNQHngSKRhle
         9qkTNtJujl+qxiRasx1QpSeGwjt0fPf3K0m27F/DMwRQeElnbavv0MiQmUO+vkIFZ0vZ
         kLwzr6tqVOCw/bGzhjmOWOGKDs8CYt2IluVVvb2HtaYMX+CmwqsLO8nlRjzKcFlnMTTs
         Rdfw==
X-Gm-Message-State: AOAM533DyQy4aR0kFHpnOIZaON23KCOxb1yNjxdFHHChkCPwDjaetTDy
	9vwzFKMXgerjr0YexO13YMHkh9xrJxvc9ZfT83tsOg==
X-Google-Smtp-Source: ABdhPJwICFJ0kqduDlOdG2Bm7hRT1CYmYq3zG89jCtiaURODn4W0xVzTn8I3igE6k1ZKJtFQaXUt4Jr9El0Yfcd7sdE=
X-Received: by 2002:a05:6402:3128:: with SMTP id dd8mr5448390edb.383.1632404816373;
 Thu, 23 Sep 2021 06:46:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
 <20210922161405.140018-3-damien.hedde@greensocs.com> <d27c5829-e28f-4d17-966e-6cb86ebe00e6@redhat.com>
 <e3ab341b-3e7a-1485-90ed-dbd9d2e3588d@greensocs.com>
In-Reply-To: <e3ab341b-3e7a-1485-90ed-dbd9d2e3588d@greensocs.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Thu, 23 Sep 2021 19:16:45 +0530
Message-ID: <CAARzgww_dxXLhJTm1jeWzbQxVGzT6YNxZi+uTrRDnBZ9Z1v+QA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 02/16] qapi: Implement query-machine-phase QMP command
To: Damien Hedde <damien.hedde@greensocs.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	QEMU Developers <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>, 
	mirela.grujic@greensocs.com, Alistair Francis <Alistair.Francis@wdc.com>, 
	Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org, 
	Paul Durrant <paul@xen.org>, Markus Armbruster <armbru@redhat.com>, 
	Anthony Perard <anthony.perard@citrix.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Eduardo Habkost <ehabkost@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
	Eric Auger <eric.auger@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	mark.burton@greensocs.com, edgari@xilinx.com, 
	Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 23, 2021 at 6:13 PM Damien Hedde <damien.hedde@greensocs.com> w=
rote:
>
>
>
> On 9/22/21 19:37, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 9/22/21 18:13, Damien Hedde wrote:
> >> From: Mirela Grujic <mirela.grujic@greensocs.com>
> >>
> >> The command returns current machine initialization phase.
> >>  From now on, the MachineInitPhase enum is generated from the
> >> QAPI schema.
> >>
> >> Signed-off-by: Mirela Grujic <mirela.grujic@greensocs.com>
> >
> > Missing your S-o-b, otherwise:
>
> Sorry. I did not realize I had to add it since it was already done by
> Mirela. I'll add it for this patch and patches 1, 6 and 8.

https://wiki.qemu.org/Contribute/SubmitAPatch#Patch_emails_must_include_a_S=
igned-off-by:_line
btw, it's strictly not mandatory if you are both from the same company
and you did not write the patch or contribute in anyway to it.

>
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com >
> >> ---
> >>   qapi/machine.json          | 56 ++++++++++++++++++++++++++++++++++++=
++
> >>   include/hw/qdev-core.h     | 30 ++------------------
> >>   hw/core/machine-qmp-cmds.c |  9 ++++++
> >>   hw/core/qdev.c             |  5 ++++
> >>   4 files changed, 72 insertions(+), 28 deletions(-)
> >

