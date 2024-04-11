Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 661598A1886
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 17:25:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703990.1100044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruwIG-0000PI-LF; Thu, 11 Apr 2024 15:24:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703990.1100044; Thu, 11 Apr 2024 15:24:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruwIG-0000Mo-Ie; Thu, 11 Apr 2024 15:24:52 +0000
Received: by outflank-mailman (input) for mailman id 703990;
 Thu, 11 Apr 2024 15:24:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TdS7=LQ=cloud.com=matthew.barnes@srs-se1.protection.inumbo.net>)
 id 1ruwIF-0000Mi-AS
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 15:24:51 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3517040-f817-11ee-b908-491648fe20b8;
 Thu, 11 Apr 2024 17:24:50 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2d6ff0422a2so99359681fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 Apr 2024 08:24:50 -0700 (PDT)
Received: from EMEAENGAAD91498.citrite.net ([2.223.45.79])
 by smtp.gmail.com with ESMTPSA id
 jg25-20020a05600ca01900b004169836bf9asm5719725wmb.23.2024.04.11.08.24.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Apr 2024 08:24:49 -0700 (PDT)
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
X-Inumbo-ID: a3517040-f817-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1712849089; x=1713453889; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MyG28NV0LIBCoyoOk3M1T9RmN0wl3VvIjJk55UXCQb4=;
        b=ZLfa6HNUSkSzU+3BADwsLSPEyigYZhWblatIqaKZDMepmIhBTOGJcigvM17T++XGFK
         Pxoqa4q5SyPf+mHEqJsRQ3fauLmH6pj0eNrOWQrvblRxzApDw6uuYrIhUHqdMx4Dv9bd
         deAiKvUZn+0+8Kzx94pXA0w/nY6/P+t0GoTCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712849089; x=1713453889;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MyG28NV0LIBCoyoOk3M1T9RmN0wl3VvIjJk55UXCQb4=;
        b=HoVNwK1QVOsHivhwTJL0UBALW4Q3eEhOz5gSujRjqWl+/OZDCdYhAGQqvKp62kLH7u
         CTxvAYxwGumg5hJO8bmApX7ULKDHmr8Ov5LZ83/VL9N7PYy/3As0O/OLm785Oa52eq8Q
         YHtLRd4GGWMXE4tHKiPkBF2Wu2VZLhoe5bttV94MQnne0ZdSPlMKhg6zuUzq53O2gYzw
         17/F/wXhJamolAATPRGVObQksIE+VR1o2+Hm+Wx9q7NryyHQ/ZwMpBSBuvvj4xuTb0Mq
         qEqlYycj13n9yTlRHBBTNpVhX9GH/f77L19/tnPNYlBQIACZz4CBx8AlPfb3O3vlML0n
         n0sg==
X-Gm-Message-State: AOJu0Yy/WpySoMOAknoeVEQ3G1ZSbmuPts/5Prv+P/pKpxdwl1cTG9qO
	grcHX3fQ+OZe8+onvWXDF0rAEPgy/aXmcKsa8xrTY+uwlkEu54p/mJWK3hXVutY4WP3yeR53R9m
	a
X-Google-Smtp-Source: AGHT+IHL2E7YF306VkyBludtWczBBXMpdkqMrwhFLWYTAiGJvNWQWXIQNSF8kbdxh0yFGvdf+S/h0Q==
X-Received: by 2002:a2e:8496:0:b0:2d9:fbac:dbee with SMTP id b22-20020a2e8496000000b002d9fbacdbeemr41172ljh.31.1712849089495;
        Thu, 11 Apr 2024 08:24:49 -0700 (PDT)
From: Matthew Barnes <matthew.barnes@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Matthew Barnes <matthew.barnes@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [XEN PATCH 0/2] Enumerate all allocated evtchns in lsevtchn
Date: Thu, 11 Apr 2024 16:24:09 +0100
Message-Id: <cover.1712840924.git.matthew.barnes@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, lsevtchn aborts its event channel enumeration when it hits
its first hypercall error, namely:
* When an event channel doesn't exist at the specified port
* When the event channel is owned by Xen

This results in lsevtchn missing potential relevant event channels with
higher port numbers.

This patch series adds the highest allocated event channel port for a
given domain in the xen_domctl_getdomaininfo hypercall struct, and uses
that value as an upper bound in the lsevtchn loop.

Matthew Barnes (2):
  xen/domctl: Add highest allocated evtchn port to getdomaininfo
  tools/lsevtchn: Use evtchn port upper bound for evtchn enumeration

 tools/xcutils/lsevtchn.c    | 8 ++++++--
 xen/common/domctl.c         | 1 +
 xen/include/public/domctl.h | 3 ++-
 3 files changed, 9 insertions(+), 3 deletions(-)

-- 
2.34.1


