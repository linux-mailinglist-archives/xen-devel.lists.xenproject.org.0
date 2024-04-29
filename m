Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 052F38B5A58
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 15:43:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714080.1115070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1RHP-0006Wa-O0; Mon, 29 Apr 2024 13:42:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714080.1115070; Mon, 29 Apr 2024 13:42:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1RHP-0006Ur-LI; Mon, 29 Apr 2024 13:42:51 +0000
Received: by outflank-mailman (input) for mailman id 714080;
 Mon, 29 Apr 2024 13:42:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UNw/=MC=cloud.com=matthew.barnes@srs-se1.protection.inumbo.net>)
 id 1s1RHO-0006Uf-LD
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 13:42:50 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5df28b75-062e-11ef-b4bb-af5377834399;
 Mon, 29 Apr 2024 15:42:48 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-34d1adeffbfso663918f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 06:42:48 -0700 (PDT)
Received: from EMEAENGAAD91498.citrite.net
 (default-46-102-197-201.interdsl.co.uk. [46.102.197.201])
 by smtp.gmail.com with ESMTPSA id
 f2-20020a5d50c2000000b0034c5b28c264sm8530404wrt.16.2024.04.29.06.42.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 06:42:47 -0700 (PDT)
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
X-Inumbo-ID: 5df28b75-062e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1714398168; x=1715002968; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N3TxYXr1x3lYaHF0ahI/SsLJ8fWwnHYXKuaNTpb18X8=;
        b=JJbkrIBMTE/UFrTA5tbhyk8sMPWWzsTSjp/lwGwbMCt48I0jhPqmpJ6gMlUG+u8B1f
         KmbnvDHWp6iKAfw02mV9e7o/yo4E8FbAh2SWpWgztwxXcr2AxsBLuK+gb3DbnPTJcwpF
         gbmjXIyNmMfNTNuXe3Alm4TVJBvyD12wr+mh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714398168; x=1715002968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N3TxYXr1x3lYaHF0ahI/SsLJ8fWwnHYXKuaNTpb18X8=;
        b=clfWWyCi0bloX39Jy0iB3AMoG/zJtfjYvDjQQUDbCaqxR40sDPd7NqLm7rGLS4UM35
         PT4azvMj/zRC+VNvy3VuBKL56jKZm+fJ2UtNra5ZscGrLqMyENnQbzw7zofnS4onbGle
         Wl/C1Et++qnGlcqEr6KXQGcMzZh7NHWU7pBfnNlAMscNQ8n7//5h02GpUNZvuAAzD/uW
         7e4p0tKx4Pp97xjOg7XDGm7XVJY9q/peDQtiHu49GDV83qlr8KxmhRlhiUO5L6KOEDNY
         egS+qqdQQrdqYt9V/ToE5de+y5E0hqa0t4Q7eHzi/4BkQ4XUSFN6rfvWGN2rxUtASPhA
         6uOA==
X-Gm-Message-State: AOJu0YwigNPpZSWaDY25ShbUoj7QTO9UBuOjkuT6paWdjtsIBcby2xyJ
	4SjStEKZverh9Lhi/i+tjemTkEvL+T40M8HgQEBGGiXc3FRotgJfFeHU73jzl8iq6sqYFNEr3HY
	k
X-Google-Smtp-Source: AGHT+IFdumLxgtxqGQQzgSMf/EEKHcD+pLmBjI+56fwS4+Ce6LabRtiqHaOr7A6Ne2YYbFhNjOKYPQ==
X-Received: by 2002:a5d:68c8:0:b0:34c:98dc:e6d0 with SMTP id p8-20020a5d68c8000000b0034c98dce6d0mr4306850wrw.20.1714398167874;
        Mon, 29 Apr 2024 06:42:47 -0700 (PDT)
From: Matthew Barnes <matthew.barnes@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Matthew Barnes <matthew.barnes@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [XEN PATCH v2 0/2] Enumerate all allocated evtchns in lsevtchn
Date: Mon, 29 Apr 2024 14:42:40 +0100
Message-Id: <cover.1714148012.git.matthew.barnes@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, lsevtchn aborts its event channel enumeration when it hits
its first hypercall error, namely:
* When an event channel doesn't exist at the specified port
* When the event channel is owned by Xen

This results in lsevtchn missing potential relevant event channels with
higher port numbers, since lsevtchn cannot determine the cause of
hypercall errors.

This patch adds error status indicators for the evtchn_status hypercall
for when no further event channels will be yielded for higher port
numbers, allowing lsevtchn to terminate when all event channels have
been enumerated over.

Matthew Barnes (2):
  evtchn: Add error status indicators for evtchn_status hypercall
  tools/lsevtchn: Use new status identifiers in loop

 tools/xcutils/lsevtchn.c           | 11 ++++++++++-
 xen/common/event_channel.c         | 12 +++++++++++-
 xen/include/public/event_channel.h |  2 ++
 3 files changed, 23 insertions(+), 2 deletions(-)

-- 
2.34.1


