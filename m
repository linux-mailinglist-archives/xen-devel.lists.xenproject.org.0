Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6E9938D62
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 12:19:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761605.1171592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVq7z-000169-IX; Mon, 22 Jul 2024 10:18:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761605.1171592; Mon, 22 Jul 2024 10:18:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVq7z-00014B-DI; Mon, 22 Jul 2024 10:18:47 +0000
Received: by outflank-mailman (input) for mailman id 761605;
 Mon, 22 Jul 2024 10:18:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QQNa=OW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sVq7x-00013j-SY
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 10:18:45 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5311b31-4813-11ef-bbfe-fd08da9f4363;
 Mon, 22 Jul 2024 12:18:44 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5a10835480bso3086825a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 03:18:42 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c7e3f58sm407102766b.91.2024.07.22.03.18.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 03:18:40 -0700 (PDT)
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
X-Inumbo-ID: c5311b31-4813-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721643521; x=1722248321; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hIOijb8+VxrZCQ3kiEmbcZFsSDI/3noifpCHlfSSVy8=;
        b=njCJEe5kth/0qNHV5elMDWSs8tHdtGR3Jkmgf2zMC+7UNEd4mEGuAG878NpiElAz5G
         jUUs6d1Seu+UPobMrVKklPyPP5LXnSjck5aYv/S48MGxo9vBZtj1USafjs23QGbt2oJ9
         j4tKN0jNaOLulmuAYvEnc4yEKKWwLlsIlVONc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721643521; x=1722248321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hIOijb8+VxrZCQ3kiEmbcZFsSDI/3noifpCHlfSSVy8=;
        b=ZCsG+CKVvxNxptGdwaNtwoUvCIh21ZSZ50QHJOk5PX14v+Ajl+oByLFGgZyi73IIBw
         i6qupMKcG9EpE9DSSBtkZdgyLTj0Urg/Poqev/+/OrOquIqDBIfhB70//oXoxPozJSux
         3izd6ti/Ylx3skwlv3r0hUEiBUxQgys2Wxg0vsqiSLJSVS6IFioXTbmN5WlhYqyPPWfn
         M6tr5kVlfmC5jegVQFPq0QUck4SrkaNmLeGWydOXvs3i/3ddmAostrxixuKQlpDLV5JH
         m2d1bqTTf1Ivcf1BeQ4alSRltGRvZkUDR0frBum2NbKLzx0Cjkp25CckBZj/dOQ6IT1d
         x75w==
X-Gm-Message-State: AOJu0YxkqV8h36p203par07kBoFP6AsDXIcb8twmU2LHXLkH3UUMTEqr
	R5axeKlLx3hgs/uWGXaZl+VJCzv7tduTypPQTY7qZ5vL9V1NfKI7rRIfaQK62wEBip/gzFWWaNa
	j
X-Google-Smtp-Source: AGHT+IHQFA9+nh23Kw2BYNvusO2dlD42iCBpEBm8+S69mdF25IgyfOEc+PkbdFMmhpy3eltfAf0Asg==
X-Received: by 2002:a17:907:d86:b0:a77:d1ea:ab3b with SMTP id a640c23a62f3a-a7a4c010093mr404244766b.25.1721643521380;
        Mon, 22 Jul 2024 03:18:41 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Gene Bright <gene@cyberlight.us>
Subject: [PATCH 0/2] x86/efi: Fix booting when NX is disabled
Date: Mon, 22 Jul 2024 11:18:36 +0100
Message-Id: <20240722101838.3946983-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Bugfix from the XCP-ng forums.  See patch 2 for details.

Apparently the native path with NX disabled is broken too, but I've not had
any time to look into that yet.

Andrew Cooper (2):
  x86/efi: Simplify efi_arch_cpu() a little
  x86/efi: Unlock NX if necessary

 xen/arch/x86/efi/efi-boot.h | 56 +++++++++++++++++++++++++++----------
 1 file changed, 42 insertions(+), 14 deletions(-)


base-commit: ff652ed5dcd797a46c84258255dfd429ae68a2d6
-- 
2.39.2


