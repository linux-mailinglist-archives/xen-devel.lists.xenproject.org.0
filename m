Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C385B5A14
	for <lists+xen-devel@lfdr.de>; Mon, 12 Sep 2022 14:24:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.405775.648198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXiTa-0008HY-20; Mon, 12 Sep 2022 12:23:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 405775.648198; Mon, 12 Sep 2022 12:23:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXiTZ-0008FO-VX; Mon, 12 Sep 2022 12:23:45 +0000
Received: by outflank-mailman (input) for mailman id 405775;
 Mon, 12 Sep 2022 12:23:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2z8A=ZP=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1oXiTY-0008FI-3v
 for xen-devel@lists.xenproject.org; Mon, 12 Sep 2022 12:23:44 +0000
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [2607:f8b0:4864:20::82f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b75e466d-3295-11ed-9760-273f2230c3a0;
 Mon, 12 Sep 2022 14:23:33 +0200 (CEST)
Received: by mail-qt1-x82f.google.com with SMTP id s18so2982185qtx.6
 for <xen-devel@lists.xenproject.org>; Mon, 12 Sep 2022 05:23:43 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:cc03:373b:6dc6:a951])
 by smtp.gmail.com with ESMTPSA id
 f1-20020ac87f01000000b0031d283f4c4dsm6705092qtk.60.2022.09.12.05.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Sep 2022 05:23:20 -0700 (PDT)
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
X-Inumbo-ID: b75e466d-3295-11ed-9760-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=plCROruMnCJO+u23xBOec2JrcA1xylXfcF6qLleFq0U=;
        b=CgaSqMF2JcSWi59eCI93+wiMQYsQBA+Csu1ab7rUypcxjWCI6X4ya4I0pA7uajrrEo
         KhjH/YVX8pzIe+mZRyMqJRTzJCsuM9ti/SYIUfEAyAikfFUddonE7S5BUaMw+Dc5BYrf
         zNeI+ygzs/PUpzBpLOlsL5TSdvea+sreL/O8Fy0e2j4FipcdfdwzrY4WTMqJfUmWbziC
         yOsoqYHg5KoPnekoivYAoBADFzLfKKMTRk5zoTSnl/NVCli4WXaDmQcexNt1lziQxrID
         SQ1Hzp26nDtGgiGSyfrSqJVaLAy9gB5MJ94l6ovqrlEMMLF86a9YQ4A0cPdA5hDl6bc/
         OFYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=plCROruMnCJO+u23xBOec2JrcA1xylXfcF6qLleFq0U=;
        b=ujdXz2QRYrn/CsngBGrit563Z67dDEzpAW42eCLIo5qEYZ8EZYF6b0STxh1ilb/9Ax
         xbUtrkUZHA9MDIk9lOj23LYqmhDw69MLEROqwv+rg2lOs+/n0rOhFp3CV7wumN11zhk8
         oROgBr3yRa2EM5gw4Jywswa3/mfZ8ICTAeXtXvMwp/bydceANpQUPXK23hof0RJFOMDi
         hOkoEjN7VkeV2zKUoH6EpV5g3nxlzIUjDMnhnsN8YqgrTTDVBgolUXiPZC0fw6fJVUTk
         YMAMTzCJKX4Fwzfcop1Fyy/xS+pypvwf9JzDDjwZ6OVJRrIpSdZhsyhDdn67QUdVOKra
         aFUQ==
X-Gm-Message-State: ACgBeo3a5nH+3VtFgZsbjZJddUkjwtuh27373wupgEBWlVrNGMSbcQIL
	Xp46vSfYhaVOBd/mgdhepHP5oYB9948=
X-Google-Smtp-Source: AA6agR6Oy46Paz+N0EgswBrqNpSZBtEJRHD2N4kYO2stMOkbjFCV6Xd4GxX/Pg3fK2agZIs2iPk1yQ==
X-Received: by 2002:ac8:4e87:0:b0:343:6249:1810 with SMTP id 7-20020ac84e87000000b0034362491810mr22821180qtp.117.1662985421702;
        Mon, 12 Sep 2022 05:23:41 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 0/3] libxl smbios support
Date: Mon, 12 Sep 2022 08:22:34 -0400
Message-Id: <20220912122237.5431-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hvm_xs_strings.h specifies xenstore entries which can be used to set or
override smbios strings.  hvmloader has support for reading them, but
xl/libxl support is not wired up.  This patches adds a new xl.cfg option
and libxl support to write the xenstore strings.

The xl syntax looks like:
smbios=["bios_vendor=Xen Project","system_version=1.0"]

The Go binding generation needed extending to support Arrays inside a
KeyedUnion, which is what the first patch does.  The generated go code
builds, but it is otherwise untested.

There are also oem strings, oem-1..oem-99, that HVM loader supports.
xl parse multiple oem strings like smbios=["oem=A,oem=B"], libxl then
iterates over them and assigned to the oem-%d entries.  Both xl and
libxl check that the 99 string limit isn't exceeded.

The rendered man page and html don't have a newline at the end of the
new section after patch 2.
"""
           battery_device_name=STRING
       ms_vm_genid="OPTION"
"""

however the txt format is correct:
"""
        battery_device_name=STRING

    ms_vm_genid="OPTION"
"""

It goes away after patch 3 is applied since it adds text about the "oem"
option in between the two lines above.  I'm at a loss as to why this is
happening.

Jason Andryuk (3):
  golang/xenlight: Extend KeyedUnion to support Arrays
  xl/libxl: Add ability to specify SMBIOS strings
  xl/libxl: Add OEM string support to smbios

 docs/man/xl.cfg.5.pod.in             | 49 +++++++++++++++++++
 tools/golang/xenlight/gengotypes.py  | 41 +++++++++-------
 tools/golang/xenlight/helpers.gen.go | 51 ++++++++++++++++++++
 tools/golang/xenlight/types.gen.go   | 28 +++++++++++
 tools/include/libxl.h                |  5 ++
 tools/libs/light/libxl_dom.c         | 33 +++++++++++++
 tools/libs/light/libxl_types.idl     | 27 +++++++++++
 tools/xl/xl_parse.c                  | 71 +++++++++++++++++++++++++++-
 8 files changed, 288 insertions(+), 17 deletions(-)

-- 
2.37.3


