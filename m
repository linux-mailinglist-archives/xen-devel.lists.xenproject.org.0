Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4FF64257D
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 10:12:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453281.710928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p27VV-0005Bf-Nh; Mon, 05 Dec 2022 09:11:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453281.710928; Mon, 05 Dec 2022 09:11:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p27VV-00058x-KP; Mon, 05 Dec 2022 09:11:25 +0000
Received: by outflank-mailman (input) for mailman id 453281;
 Mon, 05 Dec 2022 09:11:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g57r=4D=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1p27VU-00058r-Gn
 for xen-devel@lists.xen.org; Mon, 05 Dec 2022 09:11:24 +0000
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [2607:f8b0:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c962d291-747c-11ed-91b6-6bf2151ebd3b;
 Mon, 05 Dec 2022 10:11:23 +0100 (CET)
Received: by mail-pl1-x632.google.com with SMTP id y4so10228218plb.2
 for <xen-devel@lists.xen.org>; Mon, 05 Dec 2022 01:11:23 -0800 (PST)
Received: from localhost ([122.172.87.149]) by smtp.gmail.com with ESMTPSA id
 u4-20020a17090341c400b00189e1522982sm706066ple.168.2022.12.05.01.11.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 01:11:20 -0800 (PST)
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
X-Inumbo-ID: c962d291-747c-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TZTwTFyYVwVJSHxG8cTL49t90VCYZlLgxeIX/tBwbME=;
        b=g9FYi07Dn1Hau1dsHKIjjn7xcxju/eScfmzF6vCTaHH9W/vq5FxZ+FN01vMFNQkCLL
         rWSgSU1Gw+EFF4GdrU4Qcpt7qCNUzp45HlaJrokIGr8K7bTYt/dHVTb2hcY0ErCddwCW
         A+0wKSbtyqQJD3KiDyMzuKlAuhHnkH99UHxrSrUHETb4vhuI+7rxZaXyuaRf9YPaSEkE
         zsIkA6SaH6vxeCl/w5GfO0+qn8vgKK8mxPMgs5upIDQCdF+bJjaN7GOTas3bImEMERpq
         J5LmUrEsFp0L68RQQA/HIEfc7TEMFFWH1TfFTzt0gKAT0T+oxjvFWJEDUNbt2PB0kq4H
         E2VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZTwTFyYVwVJSHxG8cTL49t90VCYZlLgxeIX/tBwbME=;
        b=GLOlyFfFMqUZ/HHGlwTTo4vlGiaFIK8xTNqxoqKRYsugFu2W71iKxKi59MzdRlUjFH
         xXlb91PqWemPF4Pe0sECItlRqp1N3aWKvb9uJZvIYEfshXKwfbfIigfTii3r1Kx5oCRg
         5IT7KeVxYidDsKSH5m4spog8Yz7i6rdmlC8B+LvHJIed6aqGAyZhja19/UFbGOWEgL7v
         39BhSWNg7u5D04WgmaOVk4YEOcBWhDtESS6aLTE66IjpAVK6AWwYN2VCRv39cAXQRyrV
         Ld17tiqNGcBDmUzjIbP36U3GJrDYmcYN5j8lZOf7An4ywgjNKorrbk1UOhGhFZE1dd0b
         nvwQ==
X-Gm-Message-State: ANoB5plWA4hhere0f7Ui0bCGOcEzYXk4d5mybHotW8RPAPGMhgOsk3H/
	a78/upW3HETb1FYi215e0zqhaA==
X-Google-Smtp-Source: AA0mqf5k4MlSEdEYwKxKHmQvMJGSvYf6tukbTNRHfPPo1wI6YsA4q95jne0kTyE2S5qSgd4Vtn0pag==
X-Received: by 2002:a17:90b:374f:b0:219:7bc8:f300 with SMTP id ne15-20020a17090b374f00b002197bc8f300mr20265674pjb.145.1670231481540;
        Mon, 05 Dec 2022 01:11:21 -0800 (PST)
Date: Mon, 5 Dec 2022 14:41:18 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Mike Holmes <mike.holmes@linaro.org>, Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>, xen-devel@lists.xen.org,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH V6 3/3] docs: Add documentation for generic virtio devices
Message-ID: <20221205091118.lttaot42hcidb7gj@vireshk-i7>
References: <cover.1667906228.git.viresh.kumar@linaro.org>
 <24a0278313ea9a9e6c093880dead835184025734.1667906228.git.viresh.kumar@linaro.org>
 <4fbe5c89-4468-9ad4-e391-2f51ceaa5b67@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4fbe5c89-4468-9ad4-e391-2f51ceaa5b67@gmail.com>

On 04-12-22, 20:52, Oleksandr Tyshchenko wrote:
> So as I understand current series adds support for two virtio devices
> (i2c/gpio) that require specific device-tree sub node with specific
> compatible in it [1]. Those backends are standalone userspace applications
> (daemons) that do not require any additional configuration parameters from
> the toolstack other than just virtio-mmio irq and base (please correct me if
> I am wrong).

For now, yes. But we may want to link these devices with other devices
in DT, like GPIO line consumers. I am not pushing a half informed
solution for that right now and that can be taken up later.

> Well, below just some thoughts (which might be wrong) regarding the possible
> extensions for future use. Please note, I do not suggest the following to be
> implemented right now (I mean within the context of current series):
> 
> 1. For supporting usual virtio devices that don't require specific
> device-tree sub node with specific compatible in it [2] we would probably
> need to either make "compatible" (or type?) string optional or to reserve
> some value for it ("common" for the instance).

I agree. Maybe we can use "virtio,device" without a number for the
device in this case.

> 2. For supporting Qemu based virtio devices we would probably need to add
> "backendtype" string (with "standalone" value for daemons like yours and
> "qemu" value for Qemu backends).

Hmm, I realize now that my patch did define a new type for this,
libxl_virtio_backend, which defines STANDALONE already, but it isn't
used currently. Maybe I should remove it too.

And I am not sure sure how to use these values, STANDALONE or QEMU.
Should the DT nodes be created only for STANDALONE and never for QEMU
?

Maybe we can add these fields and a config param, once someone wants
to reuse this stuff for QEMU ?

> 3. For supporting additional configuration parameters for Qemu based virtio
> devices we could probably reuse "device_model_args" (although it is not
> clear to me what alternative to use for daemons).

I would leave it for the person who will make use of this eventually,
as then we will have more information on the same.

> > +=item B<compatible=STRING>
> 
> Shouldn't it be "type" instead (the parsing code is looking for type and the
> example below suggests the type)?

Yes.

> > +Specifies the compatible string for the specific Virtio device. The same will be
> > +written in the Device Tree compatible property of the Virtio device. For
> > +example, "type=virtio,device22" for the I2C device > +
> > +=item B<transport=STRING>
> > +
> > +Specifies the transport mechanism for the Virtio device, like "mmio" or "pci".
> > +
> > +=back
> > +
> >   =item B<tee="STRING">
> >   B<Arm only.> Set TEE type for the guest. TEE is a Trusted Execution
> 
> Also the commit description for #1/3 mentions that Virtio backend could run
> in any domain. So looks like the "backend" string is missing here. I would
> add the following:
> 
> =item B<backend=domain-id>
> 
> Specify the backend domain name or id, defaults to dom0.

I haven't used the backend in any other domain for now, just Dom0, but
the idea is definitely there to run backends in separate user domains.

> P.S. I am wondering do i2c/gpio virtio backends support Xen grant mappings
> for the virtio?

Not yet, we haven't made much progress in that area until now, but it
is very much part of what we intend to do.

> Have you tried to run the backends in non-hardware domain
> with CONFIG_XEN_VIRTIO=y in Linux?

Not yet.

-- 
viresh

