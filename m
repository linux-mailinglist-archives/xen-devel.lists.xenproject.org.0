Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF761C098A
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 23:39:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUGtj-000070-Lk; Thu, 30 Apr 2020 21:39:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aBcg=6O=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jUGth-00006r-VC
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 21:39:10 +0000
X-Inumbo-ID: 0645e338-8b2b-11ea-9887-bc764e2007e4
Received: from mail-qk1-x743.google.com (unknown [2607:f8b0:4864:20::743])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0645e338-8b2b-11ea-9887-bc764e2007e4;
 Thu, 30 Apr 2020 21:39:09 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id l78so7441700qke.7
 for <xen-devel@lists.xenproject.org>; Thu, 30 Apr 2020 14:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=5UcO7ftMOxojj4/6mDmCxipEpM1pYLxaKQc7yqp9D/I=;
 b=p/VLGs/cRdygdHN5Fb1gw+k2cICdymTxAWECnen88fnYR7Mvxcr0zuumiIkXdPWjqp
 T+tlb85kBoEw/l8GbYt6jmLR96m3b5HTJCr+26b9YfqDjrQfmS2KMGrsgcjKaQX1E54I
 BaRxOJdRp5Mdjeed7ApYeirJNdn4OAegPpIY9gdMz/df7W0kzrOBqKNOxFGzsKZtnK0O
 0tXHhEkP3MFNQun7/Gzp8BPp3o1Z0EHNvzXCN61o2TEqBDEr4aMKVBg+A1A9PvG5D2vS
 d01ITIB+UR3RrdvQiajS3lS3UfBvDvaety6+mu+iEbnT5ALdBmp9+XI21d5hEWUXFkUP
 gfvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=5UcO7ftMOxojj4/6mDmCxipEpM1pYLxaKQc7yqp9D/I=;
 b=lKec+vcO6Jgs5OO+cGY40Mx9WknT6B/ciSxnjz7ZnbtE+lEE2MiuJ4g3z9i9PEW+U4
 XH1zMBN07l8+Bzv6GU8YpIssNRa8IVEuUtw44/gMYm8TUesnQm6cPjfAvMtKbTfYjm9i
 LQV4E+J6PyixSzQlZZ7c3tWRGrgA3odCpx+C+j/B+FQZQYvsts6lFvSJcY+lPQyllsPY
 qh852LPp/llWiS4DEGOzZj166ujwbJUy5laPAtuwHqxX3UuFj7Rj2U/5JnejBp70Er05
 vG+4WirBEoAg6qV5m17jyoQNfpXDzuHS61ZI7BzbSMV9Lq4S/gWYYis1fQwycejXfKlh
 Fhdg==
X-Gm-Message-State: AGi0PuaJJNCCWCg45dNBKsgagw8O1d6vimjm0au90FYQKptbH6HdDM+H
 CRHSqMBVdFW7KPf+YBCLEMABNzklQMM=
X-Google-Smtp-Source: APiQypIXBU1y49nmsFnluRuRdm2xyir7c3+rVPs6c9L098yKxlyWGVAKl6zgyNAtqylcL1ORPQj/Aw==
X-Received: by 2002:a37:de16:: with SMTP id h22mr555115qkj.195.1588282748557; 
 Thu, 30 Apr 2020 14:39:08 -0700 (PDT)
Received: from six.lan (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id b42sm922476qta.29.2020.04.30.14.39.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 14:39:07 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 0/3] initialize xenlight go module
Date: Thu, 30 Apr 2020 17:38:58 -0400
Message-Id: <cover.1588282027.git.rosbrookn@ainfosec.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Nick Rosbrook <rosbrookn@ainfosec.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

These patches setup an initial Go module for the xenlight package. The
go code is tracked again, since the module is defined in xen.git as
xenbits.xen.org/git-http/xen.git/tools/golang/xenlight. The final patch
adds a README and LICENSE to tools/golang/xenlight so that the package
will show up properly on pkg.go.dev and be available via the module
proxy at proxy.golang.org.

Nick Rosbrook (3):
  golang/xenlight: re-track generated go code
  golang/xenlight: init xenlight go module
  golang/xenlight: add necessary module/package documentation

 .gitignore                           |    3 -
 .hgignore                            |    2 -
 tools/Rules.mk                       |    2 +-
 tools/golang/xenlight/LICENSE        |  416 +++
 tools/golang/xenlight/Makefile       |    1 -
 tools/golang/xenlight/README.md      |   17 +
 tools/golang/xenlight/go.mod         |    1 +
 tools/golang/xenlight/helpers.gen.go | 4728 ++++++++++++++++++++++++++
 tools/golang/xenlight/types.gen.go   | 1226 +++++++
 tools/golang/xenlight/xenlight.go    |    2 +
 10 files changed, 6391 insertions(+), 7 deletions(-)
 create mode 100644 tools/golang/xenlight/LICENSE
 create mode 100644 tools/golang/xenlight/README.md
 create mode 100644 tools/golang/xenlight/go.mod
 create mode 100644 tools/golang/xenlight/helpers.gen.go
 create mode 100644 tools/golang/xenlight/types.gen.go

-- 
2.17.1


