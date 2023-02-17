Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE93469B284
	for <lists+xen-devel@lfdr.de>; Fri, 17 Feb 2023 19:48:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.497254.768160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pT5mX-00057Y-9A; Fri, 17 Feb 2023 18:48:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 497254.768160; Fri, 17 Feb 2023 18:48:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pT5mX-00054u-6K; Fri, 17 Feb 2023 18:48:29 +0000
Received: by outflank-mailman (input) for mailman id 497254;
 Fri, 17 Feb 2023 18:48:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DzBr=6N=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pT5mW-00054o-30
 for xen-devel@lists.xenproject.org; Fri, 17 Feb 2023 18:48:28 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa05025d-aef3-11ed-933d-83870f6b2ba8;
 Fri, 17 Feb 2023 19:48:27 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id i28so7288556eda.8
 for <xen-devel@lists.xenproject.org>; Fri, 17 Feb 2023 10:48:27 -0800 (PST)
Received: from uni.router.wind (adsl-65.109.242.225.tellas.gr.
 [109.242.225.65]) by smtp.googlemail.com with ESMTPSA id
 z61-20020a509e43000000b004ad03b18ae3sm2641585ede.62.2023.02.17.10.48.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 10:48:26 -0800 (PST)
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
X-Inumbo-ID: aa05025d-aef3-11ed-933d-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FVwarZtmkTXGqh8KcAnLXaGi6zlKgoAyKXggXaH/kQs=;
        b=IXC1sb+KpSnBZdP+KAmUvcYLIau52gdcdkuTeorOy1MR6/VwEdW7rA8Bcu3kbRnuu0
         sqywVbmdnv96zabWvwKM2HzW5PrpYzRGPsGrGvvYnp/8KVzvPi+bcNEzJGKdV5E8QquM
         Afell5y76NRkqlrQtu9RQf8w40yvUlfLsMVjBvBvANhVjRqv1iRYcXikKExGIVRffPpE
         f9NQMbF3mbp8ROtl+8d6yqM5ulnY6VPBri4aYsOo13w3XFg415g3DTrl7q/m5x7EsGA8
         bycI+AFNnoS95GzGNmPZf3uwsqdgjGXxnXu8tQpY2Ai4zdfp2YW4ua574fHlQ7bYEgUp
         rRUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FVwarZtmkTXGqh8KcAnLXaGi6zlKgoAyKXggXaH/kQs=;
        b=eISvtcTGIOB6atvOLXeVKdjS4w5z2XL25ueBAltd//mm5LmNhHsX3LT3C1OZSTe4Tn
         7v/JX4Ir4oImFiQwbhk9nrAJvHxVzLQMSHbW7XAzHHzQCi7Tg4uMl9GOIolZwj57V432
         P5L/4UG8LTbi3F1HZjojGWxjxgjeFjo/fWdVO/lbwRalr2d65/joB7grT85VwoKfGCuD
         +4nVXE4KzxkGkOQsAifWeQc15p/PrZBl1+JoFMXwwKcSKIrVKI2qPEETusz6vSN7me3E
         /p3tjs+B949KxH2gPPgBeZ17A82SCRfiXQGN/8x6rchn2eUtVlUUcBa50dVSCYsqEF/a
         RUFg==
X-Gm-Message-State: AO0yUKWeDyP12t87cAgYHGfIcEwYzJIMHYjf+TNoRLyIl9s2KQY5V2of
	foFCk3Rpd547YL2yURZRqhQBgQUtXew=
X-Google-Smtp-Source: AK7set8v2ApEerbiU2tweJkxUJaAeNGQEOeULXNiHvvEvGcJ7DVKvT7Y2L4iqw85RJTWy0kUJwCDvQ==
X-Received: by 2002:a05:6402:2997:b0:4ac:d90e:92b with SMTP id eq23-20020a056402299700b004acd90e092bmr6616302edb.10.1676659706516;
        Fri, 17 Feb 2023 10:48:26 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH 0/4] x86/hvm: {svm,vmx}.{c,h} cleanup
Date: Fri, 17 Feb 2023 20:48:10 +0200
Message-Id: <20230217184814.1243046-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series attempts a cleanup of files {svm,vmx}.{c,h} by removing
redundant headers and sorting the rest, removing forward declarations for
static functions, reducing the scope of declarations and definitions,
removing redundant new lines and trailing spaces etc

Xenia Ragiadakou (4):
  x86/svm: cleanup svm.c
  x86/svm: cleanup svm.h
  x86/vmx: cleanup vmx.c
  x86/vmx: cleanup vmx.h

 xen/arch/x86/hvm/svm/svm.c             |  163 +-
 xen/arch/x86/hvm/svm/vmcb.c            |    3 +
 xen/arch/x86/hvm/vmx/vmcs.c            |   43 +
 xen/arch/x86/hvm/vmx/vmx.c             | 6053 ++++++++++++------------
 xen/arch/x86/include/asm/hvm/svm/svm.h |   13 +-
 xen/arch/x86/include/asm/hvm/vmx/vmx.h |  194 +-
 6 files changed, 3210 insertions(+), 3259 deletions(-)

-- 
2.37.2


