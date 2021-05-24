Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A06338F479
	for <lists+xen-devel@lfdr.de>; Mon, 24 May 2021 22:38:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.131877.246262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llHKY-0001i0-SW; Mon, 24 May 2021 20:37:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131877.246262; Mon, 24 May 2021 20:37:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llHKY-0001f4-PC; Mon, 24 May 2021 20:37:42 +0000
Received: by outflank-mailman (input) for mailman id 131877;
 Mon, 24 May 2021 20:37:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+P1=KT=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1llHKX-0001ey-4a
 for xen-devel@lists.xenproject.org; Mon, 24 May 2021 20:37:41 +0000
Received: from mail-qk1-x736.google.com (unknown [2607:f8b0:4864:20::736])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fb112d32-1625-435e-86d4-070dcf340050;
 Mon, 24 May 2021 20:37:39 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id f18so28295191qko.7
 for <xen-devel@lists.xenproject.org>; Mon, 24 May 2021 13:37:39 -0700 (PDT)
Received: from localhost.localdomain (c-73-89-138-5.hsd1.vt.comcast.net.
 [73.89.138.5])
 by smtp.gmail.com with ESMTPSA id t25sm5142847qkt.62.2021.05.24.13.37.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 13:37:38 -0700 (PDT)
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
X-Inumbo-ID: fb112d32-1625-435e-86d4-070dcf340050
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=fT2owAWSONQ5Td8PrGcFnFo4mj+tLu/Yq6/E3PpJKDM=;
        b=LMVvtw69MKVxK+kROImOEJaQegyq/o3anijqdLvUoo3LIy+h6+7oZ4L8PLDU5K2zN0
         KWajWfCxxq5j4YNcqzCWPUOo2YUcguATVRXGcsi5ZUtSI2LxjfuE8aQS4POE6v/3MdTc
         AhXKR2ep7bqtxiWQBbTFaujfzA8FjPqMeiTPrBcybXkmgCkjiJrZ7BWhJ9OFTUQ+VBsS
         l5w+w7Py1iXe7KcF9gF4AyyYkqNRGCgMSrvG0OM5gfT954viw6jEaGkvS4LgXGQRC8nB
         rFQwKlksuj1jFP4ipU/RX/kcp9pP6ebRpGy29yz25JjN0H6cPV71KvKLDLI34r0GZhyB
         HFRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=fT2owAWSONQ5Td8PrGcFnFo4mj+tLu/Yq6/E3PpJKDM=;
        b=E6zR1XcmYxYGuSHAiUDx6NGkiR09VgPjBaNjwgsAVg9CVVKYHEmTSJhJaj8Cto3X2B
         KLOdtRk/7Ue3nwSZV1XCUaqUNf1OJXP7IN6+Aovvie4gyvIjqa8kAWv5phHde8su9tCx
         KjLOJOh7DbmRDqCcsLPOEAkN02g9YKQTpuCBEdK8gzp1PEEobJ6rcoKs4WJmyw6XxA+E
         aP2F5qS0DpjiiYwPlB8ETszaY6qfV5s8N8+XkXR/BynxUP+qkwIveK/TF3j7orUGrXtz
         rTNSy7RuckgxKiDFU5+gvWmM1uPIbnmjtdOrT8UsMkZvujVVj8+5t4AcbcLTU3ek/X0E
         kQew==
X-Gm-Message-State: AOAM533tc+SDafo5LEcWP1IDXARvIyRflmJnl4xwcfg6uSF4ySEf8QDh
	Xfg31CfIUOVxmZoIViSfLQU=
X-Google-Smtp-Source: ABdhPJxKKmRl70PFWvfEmJ085Ib8hp4wiOr/94ElFKb3+npLqJHzrtoVbUfm4lqTBF8aMVnggiIdXw==
X-Received: by 2002:a05:620a:1312:: with SMTP id o18mr27335892qkj.158.1621888659431;
        Mon, 24 May 2021 13:37:39 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.prg,
	xen-devel@lists.xenproject.org
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [RESEND PATCH 00/12] golang/xenlight: domain life cycle support
Date: Mon, 24 May 2021 16:36:41 -0400
Message-Id: <cover.1621887506.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1

The primary goal of this patch series is to allow users of the xenlight
package to manage a full domain life cycle. In particular, it provides
support for receiving domain death events so that domain shutdown,
reboot, destroy, etc. can be handled. And, it addresses issues found
when using the package to boot domains with various configurations.

These patches address several things (e.g. bug fixes, code style,
conveniences, new wrapper functions), but are all work towards the final
goal of allowing a package user to manage a full domain life cycle.

Nick Rosbrook (12):
  golang/xenlight: update generated code
  golang/xenlight: fix StringList toC conversion
  golang/xenlight: fix string conversion in generated toC functions
  golang/xenlight: export keyed union interface types
  golang/xenlight: use struct pointers in keyed union fields
  golang/xenlight: rename Ctx receivers to ctx
  golang/xenlight: add logging conveniences for within xenlight
  golang/xenlight: add functional options to configure Context
  golang/xenlight: add DomainDestroy wrapper
  golang/xenlight: add SendTrigger wrapper
  golang/xenlight: do not negate ret when converting to Error
  golang/xenlight: add NotifyDomainDeath method to Context

 tools/golang/xenlight/gengotypes.py  |  11 +-
 tools/golang/xenlight/helpers.gen.go | 210 ++++++++++++--
 tools/golang/xenlight/types.gen.go   |  63 +++--
 tools/golang/xenlight/xenlight.go    | 398 ++++++++++++++++++++-------
 4 files changed, 521 insertions(+), 161 deletions(-)

-- 
2.17.1


