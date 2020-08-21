Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8C924CF50
	for <lists+xen-devel@lfdr.de>; Fri, 21 Aug 2020 09:33:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k91Y5-0000Lx-VV; Fri, 21 Aug 2020 07:33:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vzen=B7=gmail.com=s.temerkhanov@srs-us1.protection.inumbo.net>)
 id 1k91HL-00077M-PQ
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2020 07:15:59 +0000
X-Inumbo-ID: 6bc7464d-eea2-48b1-9089-cef1bd1c483e
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6bc7464d-eea2-48b1-9089-cef1bd1c483e;
 Fri, 21 Aug 2020 07:15:58 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id y2so783268ljc.1
 for <xen-devel@lists.xenproject.org>; Fri, 21 Aug 2020 00:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CUzVgyONcvIrjj+r32JV1X8GPNAPpUSmfn0oAyAKO7k=;
 b=bUNKQniNbq+FBIYiMPoegJrsvNf8lE3DVC5hJ8HgowoHUoopx36A9uSDlDT+TBedQ5
 0Ye6EdZAJKuR3PSSbm9LHh9z784iHDra4EvUvbqJACVhvpk1nlLXpzG3v9S5f1vmoqc5
 YCQ1JsG5UX8cRFjOBIiB06e65mh54SPPd4P4AziU9aYo7y3tp7nz74He2isk0oPF2Ebj
 WlvnuV+BKcEzm6Fq4nyShZTLV6P0P8Vr6vNQRvizzS4+PSftvEblu1GqkgIDNS4TiKw1
 ///Jo4+s81yMROHIYoeFCSZvxyFeyU0zpIJxMrS3e5OKR1B+niejXDjfcBVbsjvSACkf
 0bng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CUzVgyONcvIrjj+r32JV1X8GPNAPpUSmfn0oAyAKO7k=;
 b=ZTuZwch3Hr96UwrHuAEbciMFIPudx2HJettfyQBD0azZHfvSQRAtNwxLdf8GafhRn2
 QPWI+N97VStaauspwxP3lm9tjdtRJL1kx1cmJpd0McfqXbkix4+JBR8Gi9pS1IJwJsey
 POmF78o2FR1iDl/AbFnSx0qL9QZPBDPAMEJA2V8YAWCASyx1kbueV0Wn9iDq4bY+fQGY
 6CHQnw0Sk0An4SsALY7Q7aXykD/1O5h5ryJksH6Ft1M6vwVrsUCcd6YKfgoysfzrXjzS
 l5Q9XOV0Z0iVjabqzZ5Prryo0EP0eJopKzvHJzH9KARPtVHvyTqqgIkrl0H5N+zWU6MQ
 4yFQ==
X-Gm-Message-State: AOAM530IH1zFjLLyzSTWD0cAGIC9GLcxsIw5+qSWQxiuso1TdQvEOtnq
 Nd038ZcamPQom+8lt9MUbyrYRoLuRZs=
X-Google-Smtp-Source: ABdhPJyiuwiYewCP9umTgqFVG5HGI95Tdjgr1HKAcTQFIgmbFoGyuYVEQFehptzG8keyDKl+/+webg==
X-Received: by 2002:a2e:8059:: with SMTP id p25mr773775ljg.219.1597994157635; 
 Fri, 21 Aug 2020 00:15:57 -0700 (PDT)
Received: from DESKTOP-D7CKA1V.localdomain ([109.252.108.2])
 by smtp.googlemail.com with ESMTPSA id z3sm202059ljz.109.2020.08.21.00.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 00:15:57 -0700 (PDT)
From: Sergey Temerkhanov <s.temerkhanov@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Sergey Temerkhanov <s.temerkhanov@gmail.com>
Subject: [PATCH 0/2] Xen: Use a dedicated pointer for IRQ data
Date: Fri, 21 Aug 2020 10:15:45 +0300
Message-Id: <20200821071547.18894-1-s.temerkhanov@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <CAMmSBy9-cJuxC0jLPh6O-UCraThzg2wvNO29ZvxrBmVkatt_sg@mail.gmail.com>
References: <CAMmSBy9-cJuxC0jLPh6O-UCraThzg2wvNO29ZvxrBmVkatt_sg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 21 Aug 2020 07:33:16 +0000
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Use a dedicated pointer for IRQ data to avoid conflicts with some
other parts of the kernel code which my use handler_data for their
own purposes while still running on Xen

Sergey Temerkhanov (2):
  Xen: Use a dedicated irq_info structure pointer
  Xen: Rename irq_info structure

 drivers/xen/events/events_2l.c       |  2 +-
 drivers/xen/events/events_base.c     | 80 +++++++++++++---------------
 drivers/xen/events/events_fifo.c     |  5 +-
 drivers/xen/events/events_internal.h | 12 ++---
 include/linux/irq.h                  | 17 ++++++
 kernel/irq/chip.c                    | 14 +++++
 6 files changed, 78 insertions(+), 52 deletions(-)

-- 
2.26.2


