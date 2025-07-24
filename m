Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B146B10F97
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 18:23:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056342.1424564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueyiw-0007o4-Fo; Thu, 24 Jul 2025 16:23:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056342.1424564; Thu, 24 Jul 2025 16:23:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueyiw-0007hN-CJ; Thu, 24 Jul 2025 16:23:14 +0000
Received: by outflank-mailman (input) for mailman id 1056342;
 Thu, 24 Jul 2025 16:23:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uSid=2F=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ueyiv-0007fj-Eb
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 16:23:13 +0000
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [2a00:1450:4864:20::444])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ddbf1ca-68aa-11f0-b895-0df219b8e170;
 Thu, 24 Jul 2025 18:23:11 +0200 (CEST)
Received: by mail-wr1-x444.google.com with SMTP id
 ffacd0b85a97d-3a536ecbf6fso760686f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 09:23:11 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b76fcc2bc8sm2615965f8f.72.2025.07.24.09.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jul 2025 09:23:10 -0700 (PDT)
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
X-Inumbo-ID: 7ddbf1ca-68aa-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753374191; x=1753978991; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yhiejiw6P1oU1fHogYZkr3yX44GjB6ihpwxAsvxnYWM=;
        b=o6qvoVqchc3GTVzlwevWg2cw95QZtJqyZDzhDWUbJ83uHtcMffMO1pTp6TGtnVS+mE
         uZ4lZIEWajdTqwuADeyucGJF8TBIgaoPD0f05wq9/I7aaMXPP1ibU0ZIjc5mpzDhJSbm
         AqRN2B1RpgrDAphBt8oiiw4AH+8MWPXBwtK9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753374191; x=1753978991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yhiejiw6P1oU1fHogYZkr3yX44GjB6ihpwxAsvxnYWM=;
        b=go+yfH0+yjtzr7dYnUJeN35WfXkjhUSFhV2grfItUOAWbngHfT6OWRcZmu0YBIrWvb
         O0tqTC78IA0nBgX8mzu7gMLiySSRPImZwi3bMXHphe5YQSltNJLr0tfwRIUOqbdIDqBA
         NyGVrgY06BLgIXRiA1Ck/iNjKGrfovjHZLP3Bf6sNHmNXkz+6adVKZTFBV7BPA7GWwZw
         T8rNU9HCWuV0+VAQ4PJCBa+ubOTvti8RsiQBqGIL5+A0cQU2Hzv79GFm6gssP2e/br2J
         bpFxJJ/l6cPlYlbZRyFg5uJA6/eLICcH3DYvqNCGQ4+hRx9AKw3YI1M4yjHvgPWZNG9l
         kEXw==
X-Gm-Message-State: AOJu0YzR/ZhOujo+8V/sD5Jr98yScH8i/a8D3yJCJNdj+uRpoKZUUaUB
	0g9rfIXAtJL0CWjKWSX2GY6deY+B8recepDl5kePORcSuItTly+UW2SVjm9VUHcWsw7QUALgcgv
	0T0VewFkqkaWL
X-Gm-Gg: ASbGncs7vruJAw4inNXvyE37KKtnWTkOw5VG8PY0UfmA7tXu6WmSlXN9EIBzmhnbCSS
	b+B0aXt+4ChVs2wAbKZQwQEpAJWbnszrdCubCnN0mneRf94UjQ6rsGRcmm149OlGcPqhJ/dCDfq
	V7yzl835H/q/koU2os0e4d00qBd13N3M2pkDFPNcIGjbu6rMjymYCZERbviyC1ZMsCyB2qLxc1Z
	CdyrT7FwUWoFOwQWfJpawlouiqixL5jgC/22S/Kd34/CABPo2WxZxjp0dulCYmF/sM/FeRh/cIR
	IM8UauJGzYru/Culr36FwwDENqE7sn9rwIv2msb3ezcu21BY4Lx6yr5EXPWUs5npb6II7yCQ3Ag
	U7YQHVb1QoE6m5F89TTyXIgqhLQgUVW9KwS6f8AcAr/7p2waBke4ySa9L0zAXr0PvvRgtmEaV8g
	nq
X-Google-Smtp-Source: AGHT+IHTrhyrwbpK3Vog45AdiN2IWMed048TAlF/LSyXZN4WkfAf1USF85Okp/bxhwwkWDh9H1LSfQ==
X-Received: by 2002:a5d:5846:0:b0:3a4:ea40:4d3f with SMTP id ffacd0b85a97d-3b768f27a57mr6533475f8f.53.1753374190612;
        Thu, 24 Jul 2025 09:23:10 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Marco Solieri <marco.solieri@minervasys.tech>
Subject: [PATCH 0/4] xen/cache-col: Multiple fixes
Date: Thu, 24 Jul 2025 17:23:02 +0100
Message-Id: <20250724162306.2978741-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Found because XEN_DOMCTL_set_llc_colors failed in XenServer's HostUEFI Secure
Boot environment (which has additional checks on hypercalls).  Everything else
came from trying to fix that.

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1946483850

Andrew Cooper (4):
  xen/cache-col: Remove bogus cast in domain_llc_coloring_free()
  xen/cache-col: Fix freeing of colouring information
  xen/cache-col: Fix initialisation of domain colouring information
  tools/libxl: Remove unconditional XEN_DOMCTL_set_llc_colors hypercall

 tools/libs/light/libxl_create.c | 24 +++++++++++---------
 xen/common/domain.c             | 11 +++++++--
 xen/common/llc-coloring.c       | 40 ++++++++++++++-------------------
 xen/include/xen/llc-coloring.h  |  2 ++
 xen/include/xen/sched.h         |  2 +-
 5 files changed, 42 insertions(+), 37 deletions(-)


base-commit: 5c798ac8854af3528a78ca5a622c9ea68399809b
-- 
2.39.5


