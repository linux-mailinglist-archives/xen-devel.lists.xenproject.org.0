Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CFA76E46
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 17:50:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr2SK-0003H9-7s; Fri, 26 Jul 2019 15:48:28 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yHJP=VX=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hr2SI-0003H4-1w
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 15:48:26 +0000
X-Inumbo-ID: cda9b068-afbc-11e9-8980-bc764e045a96
Received: from mail-io1-xd2f.google.com (unknown [2607:f8b0:4864:20::d2f])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cda9b068-afbc-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 15:48:25 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id j5so101588274ioj.8
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2019 08:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XkRXdrxoSjf/qLRXvI0BK2ZZdoPmM1i8IG7YiOJ+FQ8=;
 b=neO1wtnQH9BFIecd+5LBQqDV+KdctJJXe1mRCIZnCTTmt5lqMiuIgk/OTB1yXtsf8e
 5a5ZwnMAjPK8+3aSDRPS1zDARlWUy/KYLvfmDOLpW1gg3b87rjt5+mePosk+bu7WoGkT
 uytBF/Hkagy5xt55MZ1dQVwqLxH8xQ2sXhFFu4tYmydpv6ZUpUy+JjdL83IKox6GHI/W
 s3Q2UdOFx5vXF+Z/UuND3t5zpwBYDjS3DPxYzBs0xB4mqXLhC11iMmzxmHvfo71QxRqR
 nuVTg2UoAOYMc4Jkl4MYZSAoC/QrmnGZOh2N1OApVWCwMsOH1tY6FbuJH69PgVG5vt2m
 YM0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XkRXdrxoSjf/qLRXvI0BK2ZZdoPmM1i8IG7YiOJ+FQ8=;
 b=WyPtzjmUQJ2IvjT2LuNR4pY+yhMTihJpeS6dXRg6gwnPGdVGkTT7F/6y6TVwP3scxQ
 DPLA4BDgTKOOWoMm5DqIMaGpmqYtM/IcDAlJeXn7Uw6IEhyy1UuIrOHjeJeB+pJ3UbAL
 Gb9Pl9DRXaO+aw84tFDsvkaUTO/6nOcA6pQMqd2YAWXlQqpyfT3mHpNEDdV0NnP4sPZn
 FtM1rqdzXRxs7cOfeANB314qfiDz/EdInJ39Zgy1585b4gW8/X0ideqxhFU5sDjrHG9r
 QXGA8sn9s+5dyO2oQJ2CJ9vY7Er/H/WtrgXPS8UGiRShxHEhdWZemSiOfMFo4820a7s+
 tMwg==
X-Gm-Message-State: APjAAAVjGCouecVMi84YWenRUk/urm1lisdg2Z1mZxCcp5/PQMKQZbT+
 p/OVzY2n05K3sQQfjPLRSTcTuWFb8WI4SOa+92U=
X-Google-Smtp-Source: APXvYqwKU38cIM2pdl+0yvcg3Um1XmufKgjb1ZeCQeZ8fwizJcX2G3uvNOoPJQipn1MLpyeY5I5Z814o7dx76GNFlWs=
X-Received: by 2002:a02:4484:: with SMTP id o126mr98894203jaa.34.1564156104706; 
 Fri, 26 Jul 2019 08:48:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190718144317.23307-1-tamas@tklengyel.com>
In-Reply-To: <20190718144317.23307-1-tamas@tklengyel.com>
From: Viktor Mitin <viktor.mitin.19@gmail.com>
Date: Fri, 26 Jul 2019 18:48:13 +0300
Message-ID: <CAOcoXZbJHzfde_Os=i58vio7nXU2u=V0Tph3gQ_GYhE_UFtUcQ@mail.gmail.com>
To: Tamas K Lengyel <tamas@tklengyel.com>, Julien Grall <julien.grall@arm.com>,
 Lars Kurth <lars.kurth.xen@gmail.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>
Subject: Re: [Xen-devel] [RFC] xen: Add .astylerc for automated
 style-formatting
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQWxsLAoKT24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgNTo0NSBQTSBUYW1hcyBLIExlbmd5ZWwg
PHRhbWFzQHRrbGVuZ3llbC5jb20+IHdyb3RlOgoKPiBDaGVja2luZyB0aGUgY29tbWVudCBzdHls
ZXMgYXJlIG5vdCBpbmNsdWRlZCBpbiB0aGUgYXV0b21hdGlvbi4KClRoZSBzYW1lIGFib3V0IGNs
YW5nLWZvcm1hdC4gQ2hlY2tpbmcgdGhlIGNvbW1lbnQgc3R5bGVzIGlzIG5vdCBzdXBwb3J0ZWQu
Ckl0IHNlZW1zIHRoaXMgaXMgbm90IGNvZGUgZm9ybWF0IGNoZWNrZXIgdGFzayB0byBwYXJzZSBh
bmQgbW9kaWZ5IHRoZQpjb2RlIGNvbW1lbnRzLi4uCgpUaGFua3MKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
