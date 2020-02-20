Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE59165E54
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 14:09:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4lXi-0001lI-4f; Thu, 20 Feb 2020 13:07:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OTtJ=4I=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1j4lXh-0001kj-5Q
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 13:07:01 +0000
X-Inumbo-ID: e187c853-53e1-11ea-8526-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.61])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id e187c853-53e1-11ea-8526-12813bfff9fa;
 Thu, 20 Feb 2020 13:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582204020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sxNYWqNUijyMJnaH8NFL0bgSwoZM6mID2KmYVvs4o6o=;
 b=DoDDvACjU3/4DnB+zEFd6oX6JqFAuLfnyBY/mPudGuSRzF//JkQpa9i6hnWEpra48nK9n5
 T8EV+PCYMBuuiYD6Jb8qhmCsz6MUiRSJO19bk3bFMwAho8sGCJKBpP+EvIObz04dco9x0I
 7XjllPrA8mwEC0iMDtdvpJUMzYCtQSk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-9s2Z5wd0PU2tM80Ox0SLAA-1; Thu, 20 Feb 2020 08:06:58 -0500
Received: by mail-wr1-f72.google.com with SMTP id d8so1702214wrq.12
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2020 05:06:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HqjVrldq/ACwB3h0fVhMHW95VpOuJ6iegNutM3g++eM=;
 b=WHPo43NailY7oCh1yHirAmH9j+DrJapvOyW9cjR9KIqvOQhnkvQf6f6/amnH/yfIwF
 lQlAtSF/PWnKCLIzrI/ziqrF2v902yzoshAZ06BiCi962juxvlcOCTalCDWeqJPzIber
 ofYDIhOCVEBqwMSc6+oGZrdi1QxMH9wn0PIxe39iZUS0pQlQave57z1eVXpNWwG7BM+U
 BkIj5IiunMTxOA8w+KkL0iLlKaDqn5DaUb7dOWf2gM+ZjPdyOMsuOC1MlymDjf280bZL
 UJJ/X20mxJNXXRp6R4/mRCCRShOLzHwtonr3p4E65KPBXYSosD7Vw0eT8SeHW3dF49/M
 CORQ==
X-Gm-Message-State: APjAAAVBQbWeMf37Y5yhWlPIsCcuFl3Mgv1eIUnk/8oa7xCaDW9TwHtt
 /JeY2rJyY/mrfGKiiDI278BcQu5J+lKqCqDglk0T69pUENv0XRzxq0drmV7ZCbfkNcHAKanBfwV
 YvDLWd0Svz3fIyCxKiv+nspUmAZ8=
X-Received: by 2002:a5d:4e91:: with SMTP id e17mr40463045wru.233.1582204017586; 
 Thu, 20 Feb 2020 05:06:57 -0800 (PST)
X-Google-Smtp-Source: APXvYqxMGFl+IFZrtHZDte4P/R96xDKYdgOkawy+8epg2tZDd8Fi56EKpiHK5Ha76g6PPzAayNlwiw==
X-Received: by 2002:a5d:4e91:: with SMTP id e17mr40461365wru.233.1582203995044; 
 Thu, 20 Feb 2020 05:06:35 -0800 (PST)
Received: from localhost.localdomain (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id b67sm4594690wmc.38.2020.02.20.05.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 05:06:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 20 Feb 2020 14:05:39 +0100
Message-Id: <20200220130548.29974-12-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200220130548.29974-1-philmd@redhat.com>
References: <20200220130548.29974-1-philmd@redhat.com>
MIME-Version: 1.0
X-MC-Unique: 9s2Z5wd0PU2tM80Ox0SLAA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Xen-devel] [PATCH v3 11/20] hw/ide/internal: Remove unused
 DMARestartFunc typedef
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
Cc: Fam Zheng <fam@euphon.net>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Paul Durrant <paul@xen.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIElERSBETUEgcmVzdGFydCBjYWxsYmFjayBoYXMgYmVlbiByZW1vdmVkIGluIGNvbW1pdCBm
ZTA5YzdjOWYwLgoKRml4ZXM6IGZlMDljN2M5ZjAKU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0
aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPgotLS0KIGluY2x1ZGUvaHcvaWRlL2ludGVy
bmFsLmggfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9ody9pZGUvaW50ZXJuYWwuaCBiL2luY2x1ZGUvaHcvaWRlL2ludGVybmFsLmgKaW5k
ZXggNTJlYzE5N2RhMC4uY2U3NjZhYzQ4NSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9ody9pZGUvaW50
ZXJuYWwuaAorKysgYi9pbmNsdWRlL2h3L2lkZS9pbnRlcm5hbC5oCkBAIC0zMjYsNyArMzI2LDYg
QEAgdHlwZWRlZiBpbnQgRE1BSW50RnVuYyhJREVETUEgKiwgaW50KTsKIHR5cGVkZWYgaW50MzJf
dCBETUFJbnQzMkZ1bmMoSURFRE1BICosIGludDMyX3QgbGVuKTsKIHR5cGVkZWYgdm9pZCBETUF1
MzJGdW5jKElERURNQSAqLCB1aW50MzJfdCk7CiB0eXBlZGVmIHZvaWQgRE1BU3RvcEZ1bmMoSURF
RE1BICosIGJvb2wpOwotdHlwZWRlZiB2b2lkIERNQVJlc3RhcnRGdW5jKHZvaWQgKiwgaW50LCBS
dW5TdGF0ZSk7CiAKIHN0cnVjdCB1bnJlcG9ydGVkX2V2ZW50cyB7CiAgICAgYm9vbCBlamVjdF9y
ZXF1ZXN0OwotLSAKMi4yMS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
