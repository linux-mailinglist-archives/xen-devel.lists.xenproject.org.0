Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1767649FAAF
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jan 2022 14:30:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262004.454051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDRKI-0005oO-6V; Fri, 28 Jan 2022 13:30:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262004.454051; Fri, 28 Jan 2022 13:30:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDRKH-0005Zt-Qd; Fri, 28 Jan 2022 13:30:05 +0000
Received: by outflank-mailman (input) for mailman id 262004;
 Fri, 28 Jan 2022 13:30:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Vxm=SM=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nDRKF-0003aP-1i
 for xen-devel@lists.xenproject.org; Fri, 28 Jan 2022 13:30:03 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64c5d369-803e-11ec-8f75-fffcc8bd4f1a;
 Fri, 28 Jan 2022 14:30:01 +0100 (CET)
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
X-Inumbo-ID: 64c5d369-803e-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643376601;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6XFzfWwACy8HBslJifmIBor59KoqvIUElcwNprhZhXM=;
  b=Ov72tRGdsNQHi6wO9MKxt0gDyB4g70nYcf2kKqBxJZV9Ona61w3gk9zY
   Z0h5oWHak2iCZ6MhZWJz/ntwIf0eH10ImHr4TGiJWfozhlGdaeTzzur45
   9mHy7h/T4GiX71PSTMoZhGAndoMQ8IRtcpgez6RBRR9H3Kn0wOlS1gg4T
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: piDLzOU5VEiQ3+JIHjzXHS/8OU/Vg2LGWyleCFplUSAavkOdDdXOG1mKvwBI/Zve0YorWJWkyw
 39Xxr9U02x0D9XoWC+cFLQO0LATY2XtLesgnDeP4i0/F7LIOpT8PHMpOJnLXVczgUJQmsZH6IA
 uxA4YfwmJdHwA8wnnWGK7WTgMkoxVHwwKRfxSL5z7//VYfkdpegV/6jUJG3u/ad5QX7B+cp9x7
 2wQhAmri11SITSsHB1N0hsEySLfpCtEY76oWMKGHxEyBkAcjeGoUKVgShdRXStzhF7EWr5+t47
 dUVRqtEzowHwXJEjlOs7cqsy
X-SBRS: 5.2
X-MesageID: 62981613
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:btyenKKJMayEXwgMFE+RBZIlxSXFcZb7ZxGr2PjKsXjdYENSgjICn
 zQeUGmAaPyCa2r1ft4kPY7g8UtS68XUztRnSQJlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH170Us5y7Zl6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB25nOAqz
 egOvqbpRA4NYKPotu0tdzhhRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFFgMg5IdatF4QYonx6lhnSDOo8QICFSKLPjTNd9Glq15AXQ6+FD
 yYfQSNCZk/PbhFPAHw4T4s1lfuJxV3gTTIN/Tp5ooJoujOOnWSdyoPFL979atGMA8JPkS6wh
 EjL4mD4CREyL8GExHyO9XfErv/Cm2b3VZwfEJW89+V2mxuDy2oLEhoUWFCn5/6jhSaDt8l3c
 hJOvHB09O5rqRLtHoKVswCETGCsjh0sAN9tUOYAsQyE7vTaxyiQNkwld2sUADA5j/MeSTsv3
 16PutrmAz1zrbGYIU6gGqeoQSCaYnZMczJbDcMQZU5cuoS4/tlv5v7aZos7SMaIYsvJ9SYcK
 txghAw3nP0tgMECzM1XFniX0mv39vAlouPYjzg7v15JDCskPOZJhKTysDA3CMqsyq7DEzFtW
 1Bfw6CjABgmV83lqcB0aLxl8EuVz/iEKibAplVkAoMs8T+gk1b6I9wLumomfxk0aptVEdMMX
 KM1kVkPjHO0FCDyBZKbnqrrU5h6pUQePYqNug/ogipmPcEqKV7vENBGbk+MxWH9+HXAYolkU
 ap3hf2EVC5AYYw+lWLeb75EjdcDm35irUuOG8GT50n3gNK2OS/OIZ9YYQTmUwzMxP7eyOkj2
 4wBZ5LiJtQ2eLCWXxQ7BqZKfQlVdiBqXM6vwyGVH8baSjdb9KgaI6e56dscl0ZNxsy5T8/Eo
 SOwXFF20l36iSGVIAmGcCk7OrjuQYx+vTQwOil1ZQSk3H0qYICO6qYDdsRoIel7pbI7lfMkH
 eMYf8igA+hUTmiV8ToqcpSg/pdpcw6mhFzSMnP9MiQ/ZZNpWyfA5sTgIln07CALAyfu7Zk+r
 rSs2xn1W50GQwg+Xs/aZOj2lwG6vGQHmfI0VEzNe4EBdELp+YlsCirwkv5ofJ1cdUSdnmOXj
 l/EDw0ZqO/Bp54O3OPI3a3U/Z20F+ZeH1ZBGzWJ57iBKiSHrHGoxpVNUbjUcGmFBn/04qire
 c5c0+r4bK8chF9PvodxT+RrwKY564e9rrNW1F05TnDCblDtAbJ8OHiWm8JIs/QVlLNevAK3X
 GOJ+8VbZurVaJ+0TgZJKVp3dPmH2NEVhiLWvKY8L0jN7SNq+KaKDBdJNB6WhS0BdLZ4PevJG
 wv6VBL6P+BnticXDw==
IronPort-HdrOrdr: A9a23:BOMmJKDd9ms45MzlHejhsseALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPEfP+UwssQIb6K290ci7MDnhHPtOj7X5Uo3SOjUO1FHYT72KqLGSuAEIeBeOu9K1t5
 0QCpSWYeeYZTMR7KbHCUuDYq4dKbK8gcWVbJLlvhBQpHZRGsVdBmlCe2SmO3wzYDMDKYsyFZ
 Ka6MYCjSGnY24rYsOyAWRAd/TfpvXQ/aiWLiIuNloC0k2jnDmo4Ln1H1yzxREFSQ5Cxr8k7C
 zsjxH53KO+qPu2oyWsmVM7rq4m2ecJ+OEzR/BkufJlaAkETTzYIbiJbofy/AzdZtvfrGrC3u
 O85CvIdP4Dl085NlvF3icFnTOQnAoG2jva0lmfjmLkocvlABwHK+cpv/MeTjLpr3M6utdyya
 RK2H/ckaF2I1fvoATRjuK4Di2DsCKP0CEfeCoo/iRieJpbZ7lLoYMF+kRJVJ8GASLh8YgiVP
 JjFcfG+Z9tABqnhl3izx5SKeaXLwIO99a9Mzs/k93Q1yITkGFyzkMeysBalnAc9IglQ50B4+
 jfKKxnmLxHU8dTNMtGdaw8aNryDnaITQPHMWqUL1iiHKYbO2jVo5qy5Lku/umldJEB0ZN3kp
 XcV1FTs3I0ZivVeIWz9YwO9gqITHS2XDzrxM0b759luqfkTL6uKiGHQEBGqbrVnxzeOLyvZx
 +eAuMmPxbTFxqdJW8S5XyBZ3B7EwhvbPEo
X-IronPort-AV: E=Sophos;i="5.88,324,1635220800"; 
   d="scan'208";a="62981613"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 0/9] x86: MSR_SPEC_CTRL support for SVM guests
Date: Fri, 28 Jan 2022 13:29:18 +0000
Message-ID: <20220128132927.14997-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Fixes/extensions to allow HVM guests to use AMD hardware MSR_SPEC_CTRL
facilities.

No PV support yet - that will require some substantially more careful
unpicking of the PV entry/exit asm.

Andrew Cooper (9):
  x86/cpuid: Advertise SSB_NO to guests by default
  x86/spec-ctrl: Drop use_spec_ctrl boolean
  x86/spec-ctrl: Introduce new has_spec_ctrl boolean
  x86/spec-ctrl: Don't use spec_ctrl_{enter,exit}_idle() for S3
  x86/spec-ctrl: Record the last write to MSR_SPEC_CTRL
  x86/spec-ctrl: Use common MSR_SPEC_CTRL logic for AMD
  x86/svm: VMEntry/Exit logic for MSR_SPEC_CTRL
  x86/msr: AMD MSR_SPEC_CTRL infrastructure
  x86/cpuid: Enable MSR_SPEC_CTRL in SVM guests by default

 xen/arch/x86/acpi/power.c                   |  8 +++-
 xen/arch/x86/cpu/amd.c                      |  2 +-
 xen/arch/x86/cpuid.c                        | 16 +++++--
 xen/arch/x86/hvm/svm/entry.S                | 12 +++---
 xen/arch/x86/hvm/svm/svm.c                  | 40 +++++++++++++++++
 xen/arch/x86/include/asm/current.h          |  2 +-
 xen/arch/x86/include/asm/hvm/svm/svm.h      |  3 ++
 xen/arch/x86/include/asm/msr.h              |  9 ++++
 xen/arch/x86/include/asm/spec_ctrl_asm.h    |  7 +++
 xen/arch/x86/msr.c                          |  8 ++--
 xen/arch/x86/setup.c                        |  5 ++-
 xen/arch/x86/smpboot.c                      |  7 ++-
 xen/arch/x86/spec_ctrl.c                    | 66 ++++++++++++++++++++---------
 xen/include/public/arch-x86/cpufeatureset.h | 18 ++++----
 xen/tools/gen-cpuid.py                      | 14 +++---
 15 files changed, 166 insertions(+), 51 deletions(-)

-- 
2.11.0


