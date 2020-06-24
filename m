Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D7E207482
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2020 15:30:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jo5SL-0005IA-11; Wed, 24 Jun 2020 13:28:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sbuU=AF=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jo5SJ-0005I5-K1
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 13:28:47 +0000
X-Inumbo-ID: a16fa290-b61e-11ea-8496-bc764e2007e4
Received: from mail-lj1-x233.google.com (unknown [2a00:1450:4864:20::233])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a16fa290-b61e-11ea-8496-bc764e2007e4;
 Wed, 24 Jun 2020 13:28:46 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id q19so2567304lji.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2020 06:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=nUrO1UmohK9ah4PTXz60cWnuU3BQE5TYlbAsoayD3rs=;
 b=j1qdfIIZ/q1NnGEj8rl1xpFjrLO16wTKUdJwWNBQqs/KEhL2zgL4G9Wuctl4moJ8L8
 p4QD4qRv+Jxfb3+f3s7wl4Zd3HVNUHUfLz5v/chtPrx2T9XWvEXr6GmUGONf8WQLq4BW
 6m+SjU0Ndjxhap5GK2lRLh4Uq574Av38crJK56x1R/5NmS/M3wZfhD0jPcgUB5YDesge
 1PUPooOkLnVqkckEFq6tB7UrB+I4SGRviggewzrNWeK1onAWEH1IUxSRhwJIqMhRGmLK
 HmIn7mwpJ6+6YvbNXqsbNTDDBBKInK+XtlISN/Tt0BzD4Z4K5VNdaI5FTtQ6H4aTej4k
 4f0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=nUrO1UmohK9ah4PTXz60cWnuU3BQE5TYlbAsoayD3rs=;
 b=s0De5d2lQxpVlsxhe+HlK5A+I+NM6X41gqczvJmXv50FHKvvmkOBgWrbIfIEymkl1f
 q34kgL5PYDdtWDzMB4oIJF5VzgmdEh2jwmE3Y7oKz12PO1tu0p56u6tI15zGeTp0rjzv
 n0m2qk6QuFwLbGejgQrS1rdXr7JxLMNOPzXA6Okk5e5Osnhhwigdf+2sgLs1CAKAQ9WB
 AHpdPBVVv1ypFdhWU5RdsWbUKdLCAjD43UgArTeRBjn7EcHBuW0UynM90Y6dfRQOsO00
 2lBA9CFPew5C8vw9dn3ZIpIleuva0ZpZMbHNom/rkyEWkZldKym5LM2X3qfV75SM+40F
 oeSw==
X-Gm-Message-State: AOAM533rrITRnxYHr/5OHPAMmZzn8pKJ74wnuoNhDHj7dcq8qVph/G52
 k59QOKexRYNmvHX5u+lARUFckhQRnCDdyroQLBQ=
X-Google-Smtp-Source: ABdhPJx7vdw407d2wlLmqmq7qPN+YgmYyWzZLeZti3qgdfxdqAyoP7/KyEKrMYgsteU0k3JGc7eosC0VKWXGiyAxTcE=
X-Received: by 2002:a2e:9a59:: with SMTP id k25mr14877859ljj.114.1593005325745; 
 Wed, 24 Jun 2020 06:28:45 -0700 (PDT)
MIME-Version: 1.0
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 24 Jun 2020 09:28:34 -0400
Message-ID: <CAKf6xptNySqXOHAZJiiBq=h99GBQcS8Cbzmpyqzy-ucxX8Od2Q@mail.gmail.com>
Subject: Migration vmdesc and xen-save-devices-state
To: QEMU <qemu-devel@nongnu.org>, xen-devel <xen-devel@lists.xenproject.org>, 
 zhang.zhanghailiang@huawei.com
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

At some point, QEMU changed to add a json VM description (vmdesc)
after the migration data.  The vmdesc is not needed to restore the
migration data, but qemu_loadvm_state() will read and discard the
vmdesc to clear the stream when should_send_vmdesc() is true.

xen-save-devices-state generates its migration data without a vmdesc.
xen-load-devices-state in turn calls qemu_loadvm_state() which tries
to load vmdesc since should_send_vmdesc is true for xen.  When
restoring from a file, this is fine since it'll return EOF, print
"Expected vmdescription section, but got 0" and end the restore
successfully.

Linux stubdoms load their migration data over a console, so they don't
hit the EOF and end up waiting.  There does seem to be a timeout
though and restore continues after a delay, but we'd like to eliminate
the delay.

Two options to address this are to either:
1) set suppress_vmdesc for the Xen machines to bypass the
should_send_vmdesc() check.
or
2) just send the vmdesc data.

Since vmdesc is just discarded, maybe #1 should be followed.

If going with #2, qemu_save_device_state() needs to generate the
vmdesc data.  Looking at qemu_save_device_state() and
qemu_savevm_state_complete_precopy_non_iterable(), they are both very
similar and could seemingly be merged.  qmp_xen_save_devices_state()
could even leverage the bdrv_inactivate_all() call in
qemu_savevm_state_complete_precopy_non_iterable().

The would make qemu_save_device_state a little more heavywight, which
could impact COLO.  I'm not sure how performance sensitive the COLO
code is, and I haven't measured anything.

Does anyone have thoughts or opinions on the subject?

Thanks,
Jason

