Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF16165E4D
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 14:08:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4lWr-00010O-Ie; Thu, 20 Feb 2020 13:06:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OTtJ=4I=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1j4lWp-00010I-S0
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 13:06:07 +0000
X-Inumbo-ID: bf704b05-53e1-11ea-8526-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id bf704b05-53e1-11ea-8526-12813bfff9fa;
 Thu, 20 Feb 2020 13:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582203963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IAmYFDb/7MmwCRG3sYs3ce3Q6pXzhe5z0UwykWSueMI=;
 b=NFYSq2XmFEBftztS7K9h4zMRMP0HIyrdtcDs+U/5DugU1sCBRCNzA4OdTUPHO/bwwYp9Et
 Bb7TjP3F9Hv+K/hWZZc5TAlyiHDbg9dXrsNzTvqQL3LLucr7E+ksmsRUVZ3mnm9Q+S+/dC
 JoAzCeIH7x6xK9ZWpW6+EjNaefPCZ9A=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-vQ3AWEf7O66GfpN-E_C4yA-1; Thu, 20 Feb 2020 08:05:59 -0500
Received: by mail-wm1-f72.google.com with SMTP id n17so808289wmk.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2020 05:05:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4cFZx3MMvL5YTnq3TreW86G7x/AmeK47tUPtRXUhNQM=;
 b=aCuHGxW6OHTpMnNxG2Zcu+01RCf+1l9sRJDJEST1cWo3pSftFo9RJoLBqStPhKrlor
 gB5VEpf4QOCYwxY+IIDp0S2daIMR3UueSvWMu4MkVgTIXsq7fno4EWskXG9dcgD0tkhZ
 qyP6O80ldmRqxe1Ufk9SEXwsQgVl8dlcfOL93VEEHV6MhD4Y7uuCvzn1gPXsguOA9m9C
 xWFOQ31H4M6S9evjhy78PPjh9+KqYhT1Q2r0O8707h5EU7XEYENgv5NkO0S9wLI/ooyk
 4YJasyHzdTuLKyxXZzV7it+9ajhmm0AIh4SQ3V/HV4X0KjibysA0tXuJwsEkU6v2Y2dx
 QGSA==
X-Gm-Message-State: APjAAAUAmxJaWDrLobQZlm/FPFSWVHZfKFiZ2arRQK49MMOgbWHu18RE
 gGVHErQ76iQtc0ogrzv8cLKlw/uAyrNRq9/uUBs69PgVQknipTpYC7UfC6xekrrxQaYy04lDcTP
 TytI9s0oiRDp0KLstfqRMag+I3Vs=
X-Received: by 2002:a05:600c:3d1:: with SMTP id
 z17mr4707540wmd.90.1582203957915; 
 Thu, 20 Feb 2020 05:05:57 -0800 (PST)
X-Google-Smtp-Source: APXvYqw5jcBfwQCBB55iS//J5oZ4nyff+vZw9LvNNuT8fCe2PE+cfM3f9N7yqnDLu5ddD34rthBOSw==
X-Received: by 2002:a05:600c:3d1:: with SMTP id
 z17mr4707497wmd.90.1582203957647; 
 Thu, 20 Feb 2020 05:05:57 -0800 (PST)
Received: from localhost.localdomain (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id b67sm4594690wmc.38.2020.02.20.05.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 05:05:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 20 Feb 2020 14:05:29 +0100
Message-Id: <20200220130548.29974-2-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200220130548.29974-1-philmd@redhat.com>
References: <20200220130548.29974-1-philmd@redhat.com>
MIME-Version: 1.0
X-MC-Unique: vQ3AWEf7O66GfpN-E_C4yA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Xen-devel] [PATCH v3 01/20] scripts/git.orderfile: Display Cocci
 scripts before code modifications
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

V2hlbiB3ZSB1c2UgYSBDb2NjaW5lbGxlIHNlbWFudGljIHNjcmlwdCB0byBkbyBhdXRvbWF0aWMK
Y29kZSBtb2RpZmljYXRpb25zLCBpdCBtYWtlcyBzZW5zZSB0byBsb29rIGF0IHRoZSBzZW1hbnRp
YwpwYXRjaCBmaXJzdC4KClNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxw
aGlsbWRAcmVkaGF0LmNvbT4KLS0tCiBzY3JpcHRzL2dpdC5vcmRlcmZpbGUgfCAzICsrKwogMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3NjcmlwdHMvZ2l0Lm9y
ZGVyZmlsZSBiL3NjcmlwdHMvZ2l0Lm9yZGVyZmlsZQppbmRleCAxZjc0N2I1ODNhLi43Y2YyMmUw
YmY1IDEwMDY0NAotLS0gYS9zY3JpcHRzL2dpdC5vcmRlcmZpbGUKKysrIGIvc2NyaXB0cy9naXQu
b3JkZXJmaWxlCkBAIC0yMiw2ICsyMiw5IEBAIE1ha2VmaWxlKgogcWFwaS8qLmpzb24KIHFnYS8q
Lmpzb24KIAorIyBzZW1hbnRpYyBwYXRjaGVzCisqLmNvY2NpCisKICMgaGVhZGVycwogKi5oCiAK
LS0gCjIuMjEuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
