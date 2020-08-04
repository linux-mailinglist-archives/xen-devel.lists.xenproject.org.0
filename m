Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C88923B609
	for <lists+xen-devel@lfdr.de>; Tue,  4 Aug 2020 09:49:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2rhc-0000oJ-RE; Tue, 04 Aug 2020 07:49:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bOER=BO=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1k2rha-0000oD-Rs
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 07:49:39 +0000
X-Inumbo-ID: 0ba6fae7-d627-11ea-b019-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 0ba6fae7-d627-11ea-b019-12813bfff9fa;
 Tue, 04 Aug 2020 07:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596527378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=E2jiGLglr9GMSiEGPHsA3lR63Xofi0iHowxjVG7mx/w=;
 b=PqjBHAMza+5zw7DnIvirctPm6U9UXOhPsLniNCvi6k2sJ7vZyae6lXbS1Xn5wp09ze8uoq
 3jbCMxXYkx5NlRuuiLxIHlVHUwolzTBUGXRianendqdFzCHeng2x82TgOhl14LCVWyUolv
 ilvP9ftFh3KYWXKRMm0tX0aBeMW8Zfw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-aO1xFc6YNNGSwKC2ozcedA-1; Tue, 04 Aug 2020 03:49:34 -0400
X-MC-Unique: aO1xFc6YNNGSwKC2ozcedA-1
Received: by mail-wm1-f70.google.com with SMTP id t26so917290wmn.4
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2020 00:49:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E2jiGLglr9GMSiEGPHsA3lR63Xofi0iHowxjVG7mx/w=;
 b=Yv8rZ7reUz4PWPluId1+jyKwxtEF+W53k5sCuSdVYLSOEsgRY/AyERXOHn35FwynMX
 w4DabM9YQ3fNC3Evx1caCxmgsJxpKRcqS9LcRjH/SZjzvkSk//3fh49M22GJXpRftDYS
 jYYG6sahIZe1o55hGhTTF32Jyzfcs2XtrvEG7P5/o/9Wqpvv/OGdPGiQYohO8NMkauCi
 nMHsGjQKXCgG4CogOsEbv2+i92Hx7kdXiBPe636Zh2EZSro0mQDv89wiNsYzu5Qj/93v
 p3xV7C7T485d3IBQMQ1is8m0XXr4kUXVcVPBnFkU0600i5GTrCVQ7HDBTXO+uolBgJLa
 VXiA==
X-Gm-Message-State: AOAM532FmEKZA9XDZjLPUkBJ5pnEGHrInoW9WZGiTFuviTnchuvzY7bL
 SUrXlhs2Bevtg7lAbGJCH+ruUpaB9Xp6uXosr8gIpJH/HChtZ1nqWLQbMeaZwVNJsQ0ICB9S0Un
 mGx7YsWVetG9YZgXlKA3oU4qAYmU=
X-Received: by 2002:a7b:cb98:: with SMTP id m24mr2996183wmi.10.1596527372815; 
 Tue, 04 Aug 2020 00:49:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVcaY1shpVa8jfBFMJx1xeZaNFrBZTRm99UYupi2noXnPadzDchI/0SLQAgLJaYlx8QkcURQ==
X-Received: by 2002:a7b:cb98:: with SMTP id m24mr2996163wmi.10.1596527372609; 
 Tue, 04 Aug 2020 00:49:32 -0700 (PDT)
Received: from localhost.localdomain (214.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.214])
 by smtp.gmail.com with ESMTPSA id f12sm3317241wmc.46.2020.08.04.00.49.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2020 00:49:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.1 v2 0/1] accel/xen: Fix xen_enabled() behavior on
 target-agnostic objects
Date: Tue,  4 Aug 2020 09:49:29 +0200
Message-Id: <20200804074930.13104-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Since v1: Fix build error reported by Peter:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg727251.html
Now following KVM implementation closely.

Philippe Mathieu-Daudé (1):
  accel/xen: Fix xen_enabled() behavior on target-agnostic objects

 include/sysemu/xen.h   | 18 ++++++++++++++----
 accel/stubs/xen-stub.c |  2 ++
 accel/xen/xen-all.c    |  7 +------
 3 files changed, 17 insertions(+), 10 deletions(-)

-- 
2.21.3


