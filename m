Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F041A7F997
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 11:32:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941662.1341092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u25Jq-00058S-Vs; Tue, 08 Apr 2025 09:32:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941662.1341092; Tue, 08 Apr 2025 09:32:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u25Jq-000561-RS; Tue, 08 Apr 2025 09:32:34 +0000
Received: by outflank-mailman (input) for mailman id 941662;
 Tue, 08 Apr 2025 09:32:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7fLb=W2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u25Jp-00055v-I7
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 09:32:33 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65af060b-145c-11f0-9eaa-5ba50f476ded;
 Tue, 08 Apr 2025 11:32:32 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ac25520a289so933303566b.3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Apr 2025 02:32:32 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac7bfeed008sm877791966b.85.2025.04.08.02.32.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 02:32:30 -0700 (PDT)
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
X-Inumbo-ID: 65af060b-145c-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744104751; x=1744709551; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yXJZv282eMm2CNHhd19p7+TXeVAIxeHRkWcQd14B3uE=;
        b=eGzligRchHGhcPNJ3sXPVRMoDwz3/eBG6/0SOSvh1lf0nEgipVtp4FnNqPh0nAjFBa
         13CF/8rWiY5IPGNwZABGt2gBWl01FjqGLGYNOIIRSj05REjMqBPN9WGdXbilOPLSODug
         6z97uRMFn7WrZRMsKUirJFY00J60FneQXZEyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744104751; x=1744709551;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yXJZv282eMm2CNHhd19p7+TXeVAIxeHRkWcQd14B3uE=;
        b=bXd+7JXfY4RCyYIJGpNZKyDp55N7sml+s2tN0I7UfB6l5qHv6N1ZG0udePZVh1Eyoe
         XzxgnRKUrXWDoqFUYCuObfDq2aNmpSL73hJ/zC82QyBHCTmYTHt6xEtiJwuSroODG3zT
         TDa0in4j9mIb3sO8l/y5mgvvW8z3T1mPtM5faPFTRHR8ZXHF6/DxGVLhC9qtfxt2xzI0
         fduM9ojGuwfQ95jpHuAi82lEapxqfm0BDuQuvIvqYGi6P+A4gvhGpOxTKgKSXXZS77VZ
         TYZw775RnQLbPYgKSpA8tnFzYVdpX5AL5ZYccl3FJb9RtX1eeH7v8a7aRnCHtxuGQ8SW
         K8aA==
X-Gm-Message-State: AOJu0YxIAmZ+YHXnuz46spYNJWedFA/FN+c8cbjfBh8WHi8rIMidJ7ZO
	QNnpOcDDva9UUDGbemdqQO1OunrQ3G+YliETuxs8xoO8mXNS5slAKLxMhBtCp4IBG7LBwVgZ8jY
	e
X-Gm-Gg: ASbGncuKE9NulqsBt6nkoW4hO/ddp+2mgQjpPsvXtTZqLHMLH8yJS/getL3W8SC+CFK
	xfATvXSC6c5PSM/0LrXsegin83lBEoXPQRTY6DZ9eSPMU4ycSCss1jC/k1WwWFLgE8cxvmoLpSI
	k5J9WcGcDwu0Fq0Eqn/lFbdQjPENzStUAiLgF0CHJrMaE2yQbqAyV0vSpT+hTwPBOmkzfOqNaKZ
	Q2VSu3u8x59N08muSR8GhTB1QKNSOTFJoF0UV6jCoMM2eleHz9XCTLHVtIHhX1wICNAAjF7XQfq
	UElZOQMF5zHxfpIJo8AMLXg1mfxVG3WKen+2GoTqklLeqDfAyw==
X-Google-Smtp-Source: AGHT+IHlFLTzJisMVV9/r18vcwbEkQbRk6D6mYf7q2U5y7ov+wCH5JbyIvP7WkTX5QIzwObM6GkO7w==
X-Received: by 2002:a17:907:2cc5:b0:ac7:391a:e2d5 with SMTP id a640c23a62f3a-ac7d6e9fedfmr1387212366b.60.1744104751102;
        Tue, 08 Apr 2025 02:32:31 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 0/2] x86/hvm: fixes for RO MMIO emulation
Date: Tue,  8 Apr 2025 11:31:54 +0200
Message-ID: <20250408093156.83277-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

Two small fixes for RO MMIO emulation for HVM guests. First one removes
unreachable code from the HVM path, second fixes an issue in the
mmio_ro_emulated_write() handler when used in HVM guests context.

Thanks, Roger.

Roger Pau Monne (2):
  x86/hvm: remove unreachable MMCFG write emulation
  x86/hvm: fix write emulation of RO ranges

 xen/arch/x86/hvm/emulate.c      | 22 +++++++------------
 xen/arch/x86/include/asm/mm.h   |  3 ---
 xen/arch/x86/mm.c               | 38 ++++++---------------------------
 xen/arch/x86/pv/ro-page-fault.c | 31 +++++++++++++++++++++++++++
 4 files changed, 45 insertions(+), 49 deletions(-)

-- 
2.48.1


