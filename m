Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D0422ED40
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jul 2020 15:27:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k039M-0001Vg-Lx; Mon, 27 Jul 2020 13:26:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KGXS=BG=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1k039L-0001Vb-IK
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2020 13:26:39 +0000
X-Inumbo-ID: cd299500-d00c-11ea-8abe-bc764e2007e4
Received: from mail-qk1-x742.google.com (unknown [2607:f8b0:4864:20::742])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cd299500-d00c-11ea-8abe-bc764e2007e4;
 Mon, 27 Jul 2020 13:26:38 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id e13so15155744qkg.5
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2020 06:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Kx49vDFEnCjpI9bgQaIAKZwKthm3TcnrdPiQQLY4D+g=;
 b=Fjpay9uk88OzlbDiI4XZj29nQRdpswTCUxSE5QdvPFokrh9SFKNDQMiK6u+vyo9wdQ
 swXZx57LaMMCFUyHaoIXSNvXfUyOA5c85IixL7WdwtZg6h+Z6Z2nxHe4/iokGGMriV5+
 spt+rRmwVhWD8wTYJHxSveQcCE+uWEn5WXG1Tzp63lZAS3oUIFT7tMdgKMLNABgUt0kZ
 Sr0gJdffacM8dR7FA43XVFF6YlzFsoQ3LHLifWEChq6mMMiqXsRk78tvN0ShZbuX14wU
 N+E9KT3WeYN+d2UAm9EW395tn6hkZWEDUMMfHN532cTnh0eXEw2sxLPXUJyxcE0jIBAn
 XVsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Kx49vDFEnCjpI9bgQaIAKZwKthm3TcnrdPiQQLY4D+g=;
 b=Nx3p+rfgv0Yb51sx6kPO5Uo2XTUKPr5zk5DLx7MkAMWuil6xS/4jX1sktKj71iQFIF
 6tRF3NjH0S/+f0onf4w59TTR5TkEzuvWksaI9xdg3cUv0pjOqStspPVeDSglwv/Q3V8R
 KxDw81NQV3cgticUyEmZ4Wf6E9z2a0p9RCVSrLYxAHJnkCea+TXOAVUtMivGZoGUTAr7
 z/q+5r1zwSZPr7aAmrsIvr5+ubsV2/b+BTEEdAPrZKZ5yvmCl96WjKF8/8PmVF4J2p3l
 ptS5m50ZDMM84NLgru9o0f+EGN19QwzRL2eYltXr2Ab6HcIBoavdCpVS+D3zID+1uz+R
 nepw==
X-Gm-Message-State: AOAM533hcZrMlp/8JAls0x1IqHZLXV8Dez3A0I5+6XUOBRrENnaWszhx
 90Ry3hY30NoynYDDDjQzNQuV5Xo05OY=
X-Google-Smtp-Source: ABdhPJxGoSMrCEdz6hfZkFVRol1BJDahKxEfx9VpH4C9sQeIhlzkV19UDfnTzYgRfFKQbtFZt3/n9Q==
X-Received: by 2002:a37:5bc3:: with SMTP id
 p186mr23556116qkb.401.1595856397970; 
 Mon, 27 Jul 2020 06:26:37 -0700 (PDT)
Received: from six.lan (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id t8sm11828003qtc.50.2020.07.27.06.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 06:26:36 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Subject: [RFC PATCH 0/2] add function support to IDL
Date: Mon, 27 Jul 2020 09:26:31 -0400
Message-Id: <cover.1595854292.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, george.dunlap@citrix.com,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

At a Xen Summit design session for the golang bindings (see [1]), we
agreed that it would be beneficial to expand the libxl IDL with function
support. In addition to benefiting libxl itself, this would allow other
language bindings to easily generate function wrappers.

These RFC patches outline a potential strategy for accomplishing this
goal. The first patch adds the Function and CtxFunction classes to
libxl/idl.py, introducing the idea of functions to the IDL. The second
patch adds a DeviceFunction class and adds some sample definitions to
libxl/libxl_types.idl for example purposes.

[1] https://lists.xenproject.org/archives/html/xen-devel/2020-07/msg00964.html

Nick Rosbrook (2):
  libxl: add Function class to IDL
  libxl: prototype libxl_device_nic_add/remove with IDL

 tools/golang/xenlight/gengotypes.py |  2 +-
 tools/libxl/gentypes.py             |  2 +-
 tools/libxl/idl.py                  | 54 ++++++++++++++++++++++++++++-
 tools/libxl/libxl_types.idl         |  6 ++++
 4 files changed, 61 insertions(+), 3 deletions(-)

-- 
2.17.1


