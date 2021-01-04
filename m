Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6772E929B
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 10:32:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61041.107099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwMEC-0003yW-8p; Mon, 04 Jan 2021 09:32:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61041.107099; Mon, 04 Jan 2021 09:32:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwMEC-0003y4-58; Mon, 04 Jan 2021 09:32:40 +0000
Received: by outflank-mailman (input) for mailman id 61041;
 Mon, 04 Jan 2021 09:32:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W3Jv=GH=redhat.com=mst@srs-us1.protection.inumbo.net>)
 id 1kwMEA-0003xz-P5
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 09:32:39 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 77ebc68f-38a7-4f5d-a491-72318a9a4147;
 Mon, 04 Jan 2021 09:32:35 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-WY8MMyIpNTWARJyoBtZGiw-1; Mon, 04 Jan 2021 04:32:31 -0500
Received: by mail-wm1-f71.google.com with SMTP id z12so10274150wmf.9
 for <xen-devel@lists.xenproject.org>; Mon, 04 Jan 2021 01:32:30 -0800 (PST)
Received: from redhat.com (bzq-79-178-32-166.red.bezeqint.net. [79.178.32.166])
 by smtp.gmail.com with ESMTPSA id n9sm88912868wrq.41.2021.01.04.01.32.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 01:32:28 -0800 (PST)
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
X-Inumbo-ID: 77ebc68f-38a7-4f5d-a491-72318a9a4147
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1609752754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HxTr71QZaT90y8c2vL2GVs5Sp2A5X0ewvCwxjpolVVQ=;
	b=eFegN5DYxlwHQjgzb7T49vdg0kqgCEz9jHfaDmqPsteRZ905ITtsloFDLW1Std8gl/Q8L8
	vspS7JdfxRoGZZY0eaD/Gs2m0fuOO4rEUlKnM1rNnQnFUnaCgE5nyqMqzvfqU49a85lRtX
	SoTZYKlQYIWr0o6uLmJcKWZKpc0WLC8=
X-MC-Unique: WY8MMyIpNTWARJyoBtZGiw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=tn7hDzxpKrM1swuwnw3aSgEMZIORK6hhOk9QF/UxR54=;
        b=GDk3so2UBwl/r/V8NYXHXYsfKTEXDLFPTaGX8NkqfHrIK5xOpSHPAyMzAZAgMZTV8w
         LGfq1M3swS6y+yVl/09C/CnZ+xMMM3PDeXXhwBdwQmKDFi7bX/z/Bo/K8qo+Na0K6V6b
         FWOB2XrW3afDQkAt7zuP9XQMCBuz202Rgl1IUvatMaX/95CNtdvWLa1BiP5VQnebHdM5
         dRtnIeEtUPorAcMSCVekUzRXxDqyBb8sCsbMiIAllsvYNxYacfp09FIuL9/yJxihgkQ4
         +vJNjxS98InSZdM/5MiMa/AFEeNb4VqKX6U150Mg2JqOPhExsWL8JHuJCCy9KwAFITXq
         5rLA==
X-Gm-Message-State: AOAM5300nIpqJTs2y19GaeoLBq9A2K+lg6jFuQX56+IZY6rzAvVtnDcp
	5yxylFnviJWCFOyCBPzx1XDRqrKT7i3tVWTwX2XF3pMHSfwhgf+rwzFdwrcj4artFzfJJ+kuxeU
	JDbM9a+oO0mDm19/ycLOjoBLQ1CE=
X-Received: by 2002:a05:6000:10c4:: with SMTP id b4mr80539845wrx.170.1609752749936;
        Mon, 04 Jan 2021 01:32:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx4JuLN6jtROkA0DcLhevcSrtv/oKG8Fo13+2fbLpVuH3BNDwBHHvd1SgSdxKPaKWu9HdWnpw==
X-Received: by 2002:a05:6000:10c4:: with SMTP id b4mr80539832wrx.170.1609752749696;
        Mon, 04 Jan 2021 01:32:29 -0800 (PST)
Date: Mon, 4 Jan 2021 04:32:25 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-ppc@nongnu.org, qemu-trivial@nongnu.org,
	Paul Durrant <paul@xen.org>, Aurelien Jarno <aurelien@aurel32.net>,
	qemu-arm@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	=?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Anthony Perard <anthony.perard@citrix.com>,
	Richard Henderson <rth@twiddle.net>,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	xen-devel@lists.xenproject.org,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Huacai Chen <chenhc@lemote.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 0/5] hw: Use PCI macros from 'hw/pci/pci.h'
Message-ID: <20210104043218-mutt-send-email-mst@kernel.org>
References: <20201012124506.3406909-1-philmd@redhat.com>
 <04b12adf-39ad-dc19-0458-74b0db809a95@amsat.org>
MIME-Version: 1.0
In-Reply-To: <04b12adf-39ad-dc19-0458-74b0db809a95@amsat.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sun, Jan 03, 2021 at 02:04:53PM +0100, Philippe Mathieu-Daudé wrote:
> On 10/12/20 2:45 PM, Philippe Mathieu-Daudé wrote:
> > Trivial patches using the generic PCI macros from "hw/pci/pci.h".
> > 
> > Philippe Mathieu-Daudé (5):
> >   hw/pci-host/bonito: Make PCI_ADDR() macro more readable
> >   hw/pci-host: Use the PCI_BUILD_BDF() macro from 'hw/pci/pci.h'
> >   hw/pci-host/uninorth: Use the PCI_FUNC() macro from 'hw/pci/pci.h'
> >   hw: Use the PCI_SLOT() macro from 'hw/pci/pci.h'
> >   hw: Use the PCI_DEVFN() macro from 'hw/pci/pci.h'
> 
> As this series are trivial and Acked, I'm going to queue
> it via the mips-tree, as other reviewed patches depend
> on it.
> 
> Thanks,
> 
> Phil.

Fine.
Acked-by: Michael S. Tsirkin <mst@redhat.com>


