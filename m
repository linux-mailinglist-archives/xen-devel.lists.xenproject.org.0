Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F9393BD27
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2024 09:32:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764733.1175234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWsxD-0002u8-IP; Thu, 25 Jul 2024 07:31:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764733.1175234; Thu, 25 Jul 2024 07:31:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWsxD-0002ru-FZ; Thu, 25 Jul 2024 07:31:59 +0000
Received: by outflank-mailman (input) for mailman id 764733;
 Thu, 25 Jul 2024 07:31:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KwaG=OZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sWsxB-0002ro-V5
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2024 07:31:57 +0000
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [2607:f8b0:4864:20::b2b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f86418f2-4a57-11ef-bbff-fd08da9f4363;
 Thu, 25 Jul 2024 09:31:56 +0200 (CEST)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-e0b2d2e7dc9so297226276.2
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jul 2024 00:31:56 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb3fafa1aesm4291046d6.133.2024.07.25.00.31.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 00:31:54 -0700 (PDT)
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
X-Inumbo-ID: f86418f2-4a57-11ef-bbff-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721892715; x=1722497515; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VvZ4DTblxYxly9G9vL3gUkX/k/yzmXgKCMvFtxah1qs=;
        b=GAjXDM4mJFrtJkkb40bdTCjB+ecbdBUA7LgDA7TJkxatI8rYs+4Xlz+jpST6K+ktEm
         wssxFs8HKzkEbuKFiqUSdHZl9csT2WQNz35BGGg/abtuRbJbHW0DLnyM5fTP+jt1uCFJ
         jFRH1mGbxssuIpZqn69QR8E9zzPTY5/obP8Qc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721892715; x=1722497515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VvZ4DTblxYxly9G9vL3gUkX/k/yzmXgKCMvFtxah1qs=;
        b=rHojpaZbLiocc4JbfnwGeFE/a4nE4xJSVkt1AC7SZsy6dSvkok4OMlFDNdJTLPHh0H
         OgsE+ztDfjrr6SComjzImpmYFAktFrDd6Z6vbnkfx4krDVfFEI8xe1G3ZsKomr8mNw8B
         W2xBaw9efAOvjT8aHnL7/b9c5p1tTILp6OhPlmFc4yUpDRwXsDM1LnE1L+qCyy+NUDkz
         CqaGin+eOp/C6DbbOe1IW8SiEOA8KnRJNYSaIjC6/xjE1bBgCxHqcsd0FuEqO7IjooWG
         9JM7QYqygdgCJJuCUV6fxBDIGXKIQRtepbME81njis6LD+bTu1eJF25Fz3OFWevkQY+N
         VVHw==
X-Gm-Message-State: AOJu0YwtH7WmfyAcGySwE0mQ26jJJiH/StJbWpWEeYOhjhcQsfucq2jd
	b1Gu3AGZ+SMzHL77Us9njlPV1nlrKoDmfEfLTblO7E3nLMLP0WSJAi06fCSpF7XMzmETNBfTHh5
	W
X-Google-Smtp-Source: AGHT+IEQ3ilVsGS4D0Yn0i3rrErdJYCa0VhU+F+tFJqk4zJ4GND8LiLWiZXrzfjIIg4gfIYZK7uezQ==
X-Received: by 2002:a05:6902:240f:b0:e02:b9ac:1486 with SMTP id 3f1490d57ef6-e0b2346ead8mr1859811276.57.1721892715002;
        Thu, 25 Jul 2024 00:31:55 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 0/2] x86/xen: fix memblock_reserve() usage on PVH
Date: Thu, 25 Jul 2024 09:31:13 +0200
Message-ID: <20240725073116.14626-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

First patch is just code movement, the second patch is the actual
bugfix.

Thanks, Roger.

Roger Pau Monne (2):
  x86/xen: move xen_reserve_extra_memory()
  x86/xen: fix memblock_reserve() usage on PVH

 arch/x86/include/asm/xen/hypervisor.h |   5 --
 arch/x86/platform/pvh/enlighten.c     |   3 -
 arch/x86/xen/enlighten_pvh.c          | 107 ++++++++++++++------------
 3 files changed, 58 insertions(+), 57 deletions(-)

-- 
2.45.2


