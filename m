Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 045C81F3740
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 11:49:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jias5-0003Gs-E6; Tue, 09 Jun 2020 09:48:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kazQ=7W=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jias3-0003Gm-I3
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 09:48:39 +0000
X-Inumbo-ID: 64c93976-aa36-11ea-bb8b-bc764e2007e4
Received: from mail-wr1-x42c.google.com (unknown [2a00:1450:4864:20::42c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 64c93976-aa36-11ea-bb8b-bc764e2007e4;
 Tue, 09 Jun 2020 09:48:38 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id q11so20566612wrp.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2020 02:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=qH71riF6UY44PzwH7v4sc6MNHeLQWvJcZsyR+nDZOO0=;
 b=a5x7gf+r6s+3csOk/6scB9zRxic1oThNw4BDRZ8xzYvs3JFFO75XfX5WTTe7j12H8e
 vogh5SetXTULNqVvIMvkmU7V6cp6U0nEfyh3OfwM/mOjaWkXwPujRhD5ZyzjAf5zKKmF
 GHN4iTjJ0WWSaXVrVhe8ENwoUTQQhiHMiAW1youGEgNYz6F92hnVtFrZ7ddiO2/iv8ln
 40PeC9sJOEeqTFLf18DqGiypx9ExL87bNMPDKsV8IziAWhQU9O2kQEXwHY/F3vI5qDex
 wiNTV/iwJn6oPsPGPWAS0VZOEsrmLGIGEfIJkOKgOVGoowfk6D66P6IjqWvlhMaoOfUr
 YFPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=qH71riF6UY44PzwH7v4sc6MNHeLQWvJcZsyR+nDZOO0=;
 b=F7iJr06nnoDXsrHNkmCzsYLEvQovj5nbNFpGG2KGR9+6t3tV56oem4GoxJ/6B625Uc
 J1GPnUsaE+mziB0rNcCwjTMyFF+xCeWYVdzMveUCF5Ha5D2SzXVGQQ6zWsbU653rgaGB
 gB4geAnCYH9PQuW0HWCMWlijMNLKfexd8CJzlSx7f4Xtu7ePVVMhUxCDNzJyj7Pad031
 v2G+QRw0o+DyXipKG+F3YlEyWjE3ClM9yfSDnNNYcDre/Y7OiyTseQD9VuDDSa1uspsC
 gyfmR8JpcPNlxkhz5bBgyx0NMcfAq2CzzuNXolE8jQJ+uF7tnPJ/vheerfJB7LW8BQ0p
 4qsA==
X-Gm-Message-State: AOAM530IAIOva3SFFYJMGhZXru0KW+/rK++YAoI2QsvOnpft+ahY8ttS
 9LSqF5WLavpdsXSeG5FFOP0=
X-Google-Smtp-Source: ABdhPJyXJwZeBfjygdsVH/to0pOIFKrHh9NSVRlx6z0f+M1rXGqd1/eyI66FcY+SZGtR1p7RxjBnEQ==
X-Received: by 2002:adf:91c2:: with SMTP id 60mr3689399wri.41.1591696118013;
 Tue, 09 Jun 2020 02:48:38 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id 125sm2427590wmc.23.2020.06.09.02.48.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jun 2020 02:48:37 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
 "'Tamas K Lengyel'" <tamas@tklengyel.com>
References: <20200603125237.100041-1-tamas@tklengyel.com>
 <64ea771f-a7c1-cfc1-e135-632ec4c7fc93@suse.com>
In-Reply-To: <64ea771f-a7c1-cfc1-e135-632ec4c7fc93@suse.com>
Subject: RE: [PATCH v4 for-4.14] x86/monitor: revert default behavior when
 monitoring register write events
Date: Tue, 9 Jun 2020 10:48:35 +0100
Message-ID: <006f01d63e43$25e98440$71bc8cc0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQHMIvrjc9D1klp/MRCvYm/ZI0jSTQG6VnbhqNZtXKA=
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Petre Pircalabu' <ppircalabu@bitdefender.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>, 'Julien Grall' <julien@xen.org>,
 'Wei Liu' <wl@xen.org>, 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>,
 'Alexandru Isaila' <aisaila@bitdefender.com>, xen-devel@lists.xenproject.org,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 09 June 2020 10:37
> To: Tamas K Lengyel <tamas@tklengyel.com>
> Cc: xen-devel@lists.xenproject.org; Andrew Cooper =
<andrew.cooper3@citrix.com>; Wei Liu <wl@xen.org>;
> Roger Pau Monn=C3=A9 <roger.pau@citrix.com>; George Dunlap =
<george.dunlap@citrix.com>; Ian Jackson
> <ian.jackson@eu.citrix.com>; Julien Grall <julien@xen.org>; Stefano =
Stabellini
> <sstabellini@kernel.org>; Alexandru Isaila <aisaila@bitdefender.com>; =
Petre Pircalabu
> <ppircalabu@bitdefender.com>; Paul Durrant <paul@xen.org>
> Subject: Re: [PATCH v4 for-4.14] x86/monitor: revert default behavior =
when monitoring register write
> events
>=20
> On 03.06.2020 14:52, Tamas K Lengyel wrote:
> > For the last couple years we have received numerous reports from =
users of
> > monitor vm_events of spurious guest crashes when using events. In =
particular,
> > it has observed that the problem occurs when vm_events are being =
disabled. The
> > nature of the guest crash varied widely and has only occured =
occasionally. This
> > made debugging the issue particularly hard. We had discussions about =
this issue
> > even here on the xen-devel mailinglist with no luck figuring it out.
> >
> > The bug has now been identified as a race-condition between register =
event
> > handling and disabling the monitor vm_event interface. The default =
behavior
> > regarding emulation of register write events is changed so that they =
get
> > postponed until the corresponding vm_event handler decides whether =
to allow such
> > write to take place. Unfortunately this can only be implemented by =
performing the
> > deny/allow step when the vCPU gets scheduled.
> >
> > Due to that postponed emulation of the event if the user decides to =
pause the
> > VM in the vm_event handler and then disable events, the entire =
emulation step
> > is skipped the next time the vCPU is resumed. Even if the user =
doesn't pause
> > during the vm_event handling but exits immediately and disables =
vm_event, the
> > situation becomes racey as disabling vm_event may succeed before the =
guest's
> > vCPUs get scheduled with the pending emulation task. This has been =
particularly
> > the case with VMS that have several vCPUs as after the VM is =
unpaused it may
> > actually take a long time before all vCPUs get scheduled.
> >
> > In this patch we are reverting the default behavior to always =
perform emulation
> > of register write events when the event occurs. To postpone them can =
be turned
> > on as an option. In that case the user of the interface still has to =
take care
> > of only disabling the interface when its safe as it remains buggy.
> >
> > Fixes: 96760e2fba10 ('vm_event: deny register writes if refused by =
vm_event
> > reply').
> >
> > Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
>=20
> Applicable parts
> Acked-by: Jan Beulich <jbeulich@suse.com>
>=20

Release-acked-by: Paul Durrant <paul@xen.org>


