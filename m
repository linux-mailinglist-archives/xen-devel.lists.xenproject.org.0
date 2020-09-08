Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7C52612A8
	for <lists+xen-devel@lfdr.de>; Tue,  8 Sep 2020 16:26:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFeZT-0004W8-GT; Tue, 08 Sep 2020 14:26:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cV5b=CR=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kFeZR-0004Vu-Rj
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2020 14:26:06 +0000
X-Inumbo-ID: e67a68ad-80ba-4a9a-be08-4ad3c345adc9
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id e67a68ad-80ba-4a9a-be08-4ad3c345adc9;
 Tue, 08 Sep 2020 14:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599575165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AigchT0IqpQTMPs2wbwFMKYiR3x5TIxf3jJNE6ATp5A=;
 b=dcfn3GGRTBT1VaX075XZQwKYP0Hjquy8GHvaZTjCpYK1xJeJWo807FjPbfHBZTKAqeQ2nf
 9ZVY5XsjC7pRGAHObaG0Swpgtje5MSznQtcmLyB0ks9icUQEzXPv6sP+QIOucMPPptam4s
 7SHMvFyoSIQzN/by5FWWc7Sq7QyTD8s=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-pfpLC3VhNmWkrSHzFKrArw-1; Tue, 08 Sep 2020 10:26:03 -0400
X-MC-Unique: pfpLC3VhNmWkrSHzFKrArw-1
Received: by mail-wm1-f71.google.com with SMTP id u5so4539963wme.3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2020 07:26:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AigchT0IqpQTMPs2wbwFMKYiR3x5TIxf3jJNE6ATp5A=;
 b=t3PI9hy6L9zdoGQ//zmyxHoftr9xFxedZjeTwMHLL76ODEh6uVRPiFAo0s0r+fnZ7R
 huJo1K0N7O8/cLluZNG1Oe74MH1eld2JM67jfsAJPgPBeE5dVzX4w9cH/o9T5lGisS/g
 +IdZFzRnmhpl2en8YqaJQ4PNnN1PmaREx27orJjvQl9wN2XSg0Z3MBU/posrAFWQDiom
 jQ04BnQmSbRoxr82i08o1kZfjLS/PToTPYDJeEn3hkQVhQfAlcqEu/gCppNPHQtSe3hU
 cjvSg/3vRnBkEQ0lR6A1H7ONa04W7f+6uvpuj/0qoDYWLjLp1gL57NhxfaYr1l9ufIDa
 rqTQ==
X-Gm-Message-State: AOAM531AyTeYggVKCm2uQVAu6hrNDvVtlKfIAVdvPWV9zCU1FZIvbvgZ
 2f7M+ZPDlLjRUQz95eNsQW5NOcfkWZgeMvqnJY849y/saAdwpOKwIpvCTu05n6TgRhGEsEa57/w
 G10DLXkLaGYJmoalDr6HAHcIYwV4=
X-Received: by 2002:adf:e989:: with SMTP id h9mr29297431wrm.38.1599575161369; 
 Tue, 08 Sep 2020 07:26:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsWz2CkHeEuhNarNgmaivVi6iopBf5ujS65WHyGjJQWXzXJi1ZEAq7Y9Gv1FoWsJeCqXsz6A==
X-Received: by 2002:adf:e989:: with SMTP id h9mr29297414wrm.38.1599575161222; 
 Tue, 08 Sep 2020 07:26:01 -0700 (PDT)
Received: from localhost.localdomain (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id 189sm33177412wmb.3.2020.09.08.07.26.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 07:26:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paul Durrant <paul@xen.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 0/5] hw/xen: Housekeeping
Date: Tue,  8 Sep 2020 16:25:54 +0200
Message-Id: <20200908142559.192945-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

Hard to make an exciting cover of this series.

Basically:
- Make better separation between Xen accel and Xen hardware,
- Move stuff around to restrict PCMachineState to hw/i386/.

Philippe Mathieu-Daudé (5):
  hw/i386/q35: Remove unreachable Xen code on Q35 machine
  hw/i386/xen: Rename X86/PC specific function as xen_hvm_init_pc()
  stubs: Split accelerator / hardware related stubs
  hw/xen: Split x86-specific declaration from generic hardware ones
  typedefs: Restrict PCMachineState to 'hw/i386/pc.h'

 include/hw/i386/pc.h     |  4 ++--
 include/hw/xen/xen-x86.h | 15 ++++++++++++
 include/hw/xen/xen.h     |  2 --
 include/qemu/typedefs.h  |  1 -
 accel/stubs/xen-stub.c   | 41 +--------------------------------
 hw/i386/pc_piix.c        |  8 +++----
 hw/i386/pc_q35.c         | 13 ++---------
 hw/i386/xen/xen-hvm.c    |  3 ++-
 stubs/xen-hw-stub.c      | 49 ++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS              |  1 +
 stubs/meson.build        |  1 +
 11 files changed, 77 insertions(+), 61 deletions(-)
 create mode 100644 include/hw/xen/xen-x86.h
 create mode 100644 stubs/xen-hw-stub.c

-- 
2.26.2


