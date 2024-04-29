Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB318B5C35
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 17:01:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714124.1115144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1SUi-00063h-QH; Mon, 29 Apr 2024 15:00:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714124.1115144; Mon, 29 Apr 2024 15:00:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1SUi-000629-Nd; Mon, 29 Apr 2024 15:00:40 +0000
Received: by outflank-mailman (input) for mailman id 714124;
 Mon, 29 Apr 2024 15:00:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hXAa=MC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s1SUg-00061u-OO
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 15:00:38 +0000
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [2607:f8b0:4864:20::e2f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c9cb86d-0639-11ef-909b-e314d9c70b13;
 Mon, 29 Apr 2024 17:00:37 +0200 (CEST)
Received: by mail-vs1-xe2f.google.com with SMTP id
 ada2fe7eead31-47c5bf7aadaso172935137.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 08:00:37 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 pp6-20020a056214138600b006a0d7154d13sm325965qvb.78.2024.04.29.08.00.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 08:00:34 -0700 (PDT)
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
X-Inumbo-ID: 3c9cb86d-0639-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714402836; x=1715007636; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XLDb+cZAz3TcRuYrTZgK4SE4NsryhjwmSdkiv3ZqfqQ=;
        b=Ag+qyr0E8zt5twJKiFcWebLkG2CAsJeEZ7x3Pa4DCAIB3gx/tqNhlQhgtNGFILbzwR
         gdEdV4663ytYnJvlGWrj9p8324ZTqDERqdFaS+SRGzUrkj+otoGyp40Dr9LoQn5PouNN
         +Mo3paWqQLzPwGQHMRNeJ4+g1z42L+Z7thcBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714402836; x=1715007636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XLDb+cZAz3TcRuYrTZgK4SE4NsryhjwmSdkiv3ZqfqQ=;
        b=UTcw6utCZm0fr6KJQbrtI3Mw5OCJhHmYOWvOe2mNItjW1pBkJFw+fR57mW+Q6/Zd/S
         VNfG8TbbGV5h4c2GsPB4U+42w9kj41p1dLoyIcK67/khdd+QCqqzTgAMXeJTCES0YG0R
         nHUFYof3GLs7KB2Uo7qz+Kpl1gyxQ7OlmTD1hJl9ncZ7rdgnItktxVYhWoa4T+VY6kR8
         mWenZK5kphp56aH0PouXm4Yz1kx7XT6SGuo4DdbF97bW9tCwsBTdWXzxXhIMgXXsmhB/
         0JRH0b/HDUFZ3QmK7ZhRKH/YbgP6r8CoELFMDjqNJjnfSyWcdLPESpRoPDH4NTTBPXtR
         pHHw==
X-Gm-Message-State: AOJu0YxNg3gqYzbxCAAkTrR1p4UpGpVPZZfBp9MwNbQEYp04as3fczof
	BF6eeZgRsIwP+NVSfq6OrdUOfqFPRwWTaNJVIMtlLWCxFPbMTm5I2+MPgRqMvaCHFkBNL+MCCV1
	p
X-Google-Smtp-Source: AGHT+IHSjOxOUkY89xDRJ34eGL8emqQ/UrLXNEvOMzFU34RV81b1VlUMQdzmYP5S5GZ5YmI3NC3BlA==
X-Received: by 2002:a67:fb51:0:b0:47b:f690:c8fc with SMTP id e17-20020a67fb51000000b0047bf690c8fcmr8549vsr.11.1714402834778;
        Mon, 29 Apr 2024 08:00:34 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: konrad.wilk@oracle.com,
	ross.lagerwall@citrix.com,
	Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 0/9] livepatch-build-tools: some bug fixes and improvements
Date: Mon, 29 Apr 2024 16:56:45 +0200
Message-ID: <20240429145654.71669-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

The first 3 patches in the series attempt to fix some bugs, I don't
think they will be specially controversial or difficult to review (patch
1 was already posted standalone).

The rest of the patches are more convoluted, as they attempt to solve
some shortcomings when attempting to create livepatches that change
alternatives or exceptions.  For example a patch that only changes
content in alternative blocks (the code that ends up in the
.altinstr_replacement section) won't work, as create-diff-object will
report that there are no changes.

I've attempted to test as many corner cases as I could come up with, but
it's hard to figure all the possible changes, plus it's also fairly easy
to inadvertently regress existing functionality.

Thanks, Roger.

Roger Pau Monne (9):
  livepatch-build-tools: allow patch file name sizes up to 127
    characters
  create-diff-object: update default alt_instr size
  livepatch-build: fix detection of structure sizes
  create-diff-object: document kpatch_regenerate_special_section()
    behavior
  create-diff-object: move kpatch_include_symbol()
  create-diff-object: detect changes in .altinstr_replacement and .fixup
    sections
  create-diff-object: don't account for changes to .bug_frame.? sections
  create-diff-object: account for changes in the special section itself
  create-diff-object: account for special section changes

 create-diff-object.c | 196 +++++++++++++++++++++++++++++++++----------
 livepatch-build      |  12 ++-
 2 files changed, 161 insertions(+), 47 deletions(-)

-- 
2.44.0


