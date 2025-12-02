Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F7AC9B3D1
	for <lists+xen-devel@lfdr.de>; Tue, 02 Dec 2025 11:57:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176069.1500618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQO4M-00077s-UD; Tue, 02 Dec 2025 10:57:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176069.1500618; Tue, 02 Dec 2025 10:57:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQO4M-00075v-RK; Tue, 02 Dec 2025 10:57:18 +0000
Received: by outflank-mailman (input) for mailman id 1176069;
 Tue, 02 Dec 2025 10:57:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tQLy=6I=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vQO4L-00075j-Du
 for xen-devel@lists.xenproject.org; Tue, 02 Dec 2025 10:57:17 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa1cbe01-cf6d-11f0-9d1a-b5c5bf9af7f9;
 Tue, 02 Dec 2025 11:57:16 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4779a4fc95aso40860635e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Dec 2025 02:57:16 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4791164d365sm289825795e9.12.2025.12.02.02.57.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Dec 2025 02:57:14 -0800 (PST)
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
X-Inumbo-ID: aa1cbe01-cf6d-11f0-9d1a-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1764673035; x=1765277835; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xrL0FvCQZwFfencE4E0741eUwaWwStBHn3t1ATURTIU=;
        b=UG3uiqDlT4kdrjr263+Z53DFXBl6uFEhfGFmqDIKVjI5/WnfI3F4a4SvYgyA1dWN2g
         dsqwUaBR8g2PpUck95CVU+y2vByehlvr9B98dYpNKpGCahBx+kJ8jvPvI1EVCVZICpdq
         2uU7j4YZKRchDzpqHj/+Q/ViiDw/HNrwH1YjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764673035; x=1765277835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xrL0FvCQZwFfencE4E0741eUwaWwStBHn3t1ATURTIU=;
        b=gWv1Szw5QFkSqodTtBypP6GpRSu32/VB6fbliRuYF++NhKvNtLrLNC7xS7pTP3bROH
         bGVjfxxZKHcYSIbsKbeFkNBhIApc7KZoiySyULRWtv4ve5r4CkcCbXyZyBgdnW8G8Vod
         gKw3a42LLsELTlV/smNWREvItP2FHiwdUyAgG497dkosxzCx0LL45tNc1HsYXfTmMj7Z
         HMfvLhGnrjvVFMGE27rJDfv6r3MuF1EF7HhNY3VaC4BRPESEQIVjQa0LcUcAPhw0BqtP
         wcoSrHsx6BYb2Bjl56XM5kq/3ORgHftY3dnBAeXWSXVd6NAEGPTXgqj93CuobXW3jugF
         mexQ==
X-Gm-Message-State: AOJu0Yw2JNHYoxotf/6zB0Z8oaiEKNyRzYKvAEpXYB0c/4P1IRJlZw37
	Zsf5qgmuQLQtG6IOlQGptdBj6Gdilo/0SH9Dkh7hPdt6DSlTFflT1qgStaI0X4+BzNQSYOzCXgI
	Cslvk
X-Gm-Gg: ASbGncvYLJT/iIw2SRlYP6w85B+RMRjb+zpGBvCb6l0Rz6mqVrU3FuSxNJbBmH8lsvC
	hgd/RezM1BMqKKnDNdxNLkIoRLDKwMtUNEzs0KlFD8svAnHejmLa+bMME5vJpLqWoxXeRGIqw9v
	43ZbA2o9XMP0LT5SfPWNJOgwwqECGT1yJvcMy9R8XW0BreRJ2fwWlSYIYyb9Hg7Todoykdunkz0
	WEj57YcHmf3ThMmMuuEmgXaDaTWWbPefZWwdg/lz4F0H1oTtpKwJWMhHprPu4ptYXuSQDDvboNa
	8ICYVqtaw/EualHOWDXz3a0NTaS1VuLqz32PmwAdPX/HNYMjTNDc5kSDp2mEIXqf5VrHvGAcWhd
	RhP0QorZ4Mb0dLR8U6Cwj0RTuNKujYdAXR2V2HBWQcYfeuUAarC7/LX+Otlo3mrgi7lVv6P4+vq
	oEO9Fgz6dTTzZw3h2moQaayp6s9X5F1lu6PsSv1ucmrySQexiXHITT97lEmzi5Sw==
X-Google-Smtp-Source: AGHT+IFi4Kk7JXi3FtIKAA9OFg31sEycDB98aS7Z0ApNQYzzIEh+qVGvvPyRX5+i5u2exZiZzTS9Yg==
X-Received: by 2002:a05:600c:1f0f:b0:479:13e9:3d64 with SMTP id 5b1f17b1804b1-47926fc1797mr21515605e9.15.1764673035182;
        Tue, 02 Dec 2025 02:57:15 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 0/3] x86/amd: Fixes for levelling setup
Date: Tue,  2 Dec 2025 10:57:07 +0000
Message-Id: <20251202105710.1472927-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

More fixes for AMD setup.

Andrew Cooper (3):
  x86/amd: Fold another DE_CFG edit into amd_init_de_cfg()
  x86/amd: Exclude K8 RevD and earlier from levelling
  x86/amd: Delay amd_init_levelling() until after fixes to the CPUID
    MSRs

 xen/arch/x86/cpu/amd.c   | 40 ++++++++++++++++++----------------------
 xen/arch/x86/cpu/cpu.h   |  2 +-
 xen/arch/x86/cpu/hygon.c |  6 +++++-
 3 files changed, 24 insertions(+), 24 deletions(-)

-- 
2.39.5


