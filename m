Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C88DD28CFC9
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 16:06:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6232.16573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSKvq-0007bR-Vf; Tue, 13 Oct 2020 14:05:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6232.16573; Tue, 13 Oct 2020 14:05:38 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSKvq-0007b1-SY; Tue, 13 Oct 2020 14:05:38 +0000
Received: by outflank-mailman (input) for mailman id 6232;
 Tue, 13 Oct 2020 14:05:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M+FY=DU=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1kSKvp-0007ar-Ao
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 14:05:37 +0000
Received: from mail-qk1-x72e.google.com (unknown [2607:f8b0:4864:20::72e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4e79a1db-bee2-4c59-896f-c71ecb68f6bd;
 Tue, 13 Oct 2020 14:05:36 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id s4so20910104qkf.7
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2020 07:05:36 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:2df1:3321:942a:fbce])
 by smtp.gmail.com with ESMTPSA id z26sm13793609qki.40.2020.10.13.07.05.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2020 07:05:35 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=M+FY=DU=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
	id 1kSKvp-0007ar-Ao
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 14:05:37 +0000
X-Inumbo-ID: 4e79a1db-bee2-4c59-896f-c71ecb68f6bd
Received: from mail-qk1-x72e.google.com (unknown [2607:f8b0:4864:20::72e])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 4e79a1db-bee2-4c59-896f-c71ecb68f6bd;
	Tue, 13 Oct 2020 14:05:36 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id s4so20910104qkf.7
        for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2020 07:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZUGu1UjR8L476LNL7fXxphmCIcS0ofD66g+kHXKobM4=;
        b=IObwVdNCG2HviBddPIHXaO7fBXgVd4IMV54T1c2dgm1mPpyez8saUJlRLHH0D6x6cc
         YxLX4GLFKpnuALRKE5kWohB56qyTKO78DlSbiO7OkXjlOP2zazIfIk411MKZrXJkC/7G
         9gm5WgxpovwnivU3B7/YrmdIPzcf5pOUBWNBpHiIvFw/kwmbIqriV++tLM20h75LZKW9
         tQ7lw8VMQfgoUvmIulj/27zu2xX4I6yZGAAR8j3PHcc88Tfq86jJ/PFcabnrl5YaJMLk
         K9um05Vg9uaGQUm+PBThNycqv6wH1rGvgeVwYnxXq8iOsqjOWnPh2pPNA7YyWwb4Wt0+
         MtSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZUGu1UjR8L476LNL7fXxphmCIcS0ofD66g+kHXKobM4=;
        b=DqHu8m9i46b98+XpjT+ZpHlv8s7qtib49MwA3D0D6xNhnyu1+Q8E83DEQ42KcVgDcu
         b7I5Owti9X6rMjN0cr9ifJTvVxbMBSZMJpLrPvRSLJsKFf0Qajp8DgfyVNauT1mxDgfu
         gojqFHrTse9LcRIOm4Na9WMutu16sJh84+noF0C7qwMHerdhCrQ5r393Z50aF0wiiXJN
         qPgIxD/wFj5a1akdR844ASHPmvo5q4VY6fbBgfac9JPY3qYfZ6MUVC4aK2YscpW0Kakp
         nSlS8hZiQxqBsWtUROSvEBWzQUPASpyBJ4BR90GFqHm+FwszVEkAV9GIGAtWuxkgpk4q
         iPXQ==
X-Gm-Message-State: AOAM530omk8MghLI3bowDtFymt4c8JZrS+Zkyyp3fYsACbTHCuzOcgCV
	K6l1zSl2N5lJX7O4OL58HdI=
X-Google-Smtp-Source: ABdhPJxOTxmkqh+AoB4DBTpV5Pol3D0nwJYAhdUYd7RDexCSOKqQbKr0DammqDLpjyQZagRGN1nPOg==
X-Received: by 2002:ae9:ef56:: with SMTP id d83mr98199qkg.83.1602597935940;
        Tue, 13 Oct 2020 07:05:35 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:2df1:3321:942a:fbce])
        by smtp.gmail.com with ESMTPSA id z26sm13793609qki.40.2020.10.13.07.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 07:05:35 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>,
	Jason Andryuk <jandryuk@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 0/3] Add Xen CpusAccel
Date: Tue, 13 Oct 2020 10:05:08 -0400
Message-Id: <20201013140511.5681-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xen was left behind when CpusAccel became mandatory and fails the assert
in qemu_init_vcpu().  It relied on the same dummy cpu threads as qtest.
Move the qtest cpu functions to a common location and reuse them for
Xen.

v2:
  New patch "accel: Remove _WIN32 ifdef from qtest-cpus.c"
  Use accel/dummy-cpus.c for filename
  Put prototype in include/sysemu/cpus.h

Jason Andryuk (3):
  accel: Remove _WIN32 ifdef from qtest-cpus.c
  accel: move qtest CpusAccel functions to a common location
  accel: Add xen CpusAccel using dummy-cpus

 accel/{qtest/qtest-cpus.c => dummy-cpus.c} | 27 ++++------------------
 accel/meson.build                          |  8 +++++++
 accel/qtest/meson.build                    |  1 -
 accel/qtest/qtest-cpus.h                   | 17 --------------
 accel/qtest/qtest.c                        |  5 +++-
 accel/xen/xen-all.c                        |  8 +++++++
 include/sysemu/cpus.h                      |  3 +++
 7 files changed, 27 insertions(+), 42 deletions(-)
 rename accel/{qtest/qtest-cpus.c => dummy-cpus.c} (71%)
 delete mode 100644 accel/qtest/qtest-cpus.h

-- 
2.25.1


