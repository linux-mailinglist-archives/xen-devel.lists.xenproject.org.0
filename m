Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4F16ACF52
	for <lists+xen-devel@lfdr.de>; Mon,  6 Mar 2023 21:41:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507108.780320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZHdP-0000oh-8S; Mon, 06 Mar 2023 20:40:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507108.780320; Mon, 06 Mar 2023 20:40:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZHdP-0000mC-4L; Mon, 06 Mar 2023 20:40:39 +0000
Received: by outflank-mailman (input) for mailman id 507108;
 Mon, 06 Mar 2023 20:40:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r4JU=66=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1pZHdN-0000m6-Q5
 for xen-devel@lists.xenproject.org; Mon, 06 Mar 2023 20:40:37 +0000
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [2607:f8b0:4864:20::830])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25493301-bc5f-11ed-96b5-2f268f93b82a;
 Mon, 06 Mar 2023 21:40:36 +0100 (CET)
Received: by mail-qt1-x830.google.com with SMTP id y10so12118270qtj.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 Mar 2023 12:40:35 -0800 (PST)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:2825:cedc:1289:7391])
 by smtp.gmail.com with ESMTPSA id
 j10-20020ac8440a000000b003b82a07c4d6sm8086316qtn.84.2023.03.06.12.40.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 12:40:33 -0800 (PST)
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
X-Inumbo-ID: 25493301-bc5f-11ed-96b5-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678135234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tanG/61RIVNPTSr+AuBW+7eqNejzIWDAyrP5pglDf+Y=;
        b=Hm5s03+H5Zwz/oAK7rP85dmjyVQHRMTLWwmwtzZz2pJEDb+d+J4dfKQOjYLjT/pkcG
         R6GBlq2u9CYKJ5F8PXHduwlXMDIhjuOqhqtcyYNAghKLbhSDtaCmPGnbgm3fmkRcaHBQ
         A33rMQ+r0HTx+yhC8QnAOcR8/UbJALLDTXqDY6swR9AB0lgZf3+qyy3TThB/HAaolpie
         dnPYbVe535e7X30rYy8BJoc3+SvtyzRgBZvjRme1/BKigGEZ/TITFFc8p938+vHgxXwq
         WyXA1MgQ4oBYw80y9RvEujKtHMWf9B56hMzNp+qyVrByDXsSZqHp/5ocJFnS/lDPHRm6
         /IvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678135234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tanG/61RIVNPTSr+AuBW+7eqNejzIWDAyrP5pglDf+Y=;
        b=AoFvZgUyhSYoY51EdMKa0HjBdzmeSc6thOx5fIdkbergyM+o7Bby+b7VRYh/9i24iG
         SndbgQxXWmhwPM1p096Gt6UBc6oSkQ3M5jWAQSabhUTfxU9caAKT8ZuKhZc3jMrhiA35
         hLsIn8YMUPaOwW1VYD1v4P1HcWufHNHisbbYEXppk3e2AAcFplbsKOuuRxNPNCz1vrJL
         2Zm2fS7j24JMufZl+g7+vrJcoR0xBkn7xn0Ca93zvB1WEiDBF44hBkEfJ64SzRuwXBfd
         0Sz+dZtzvhV9e7xkC/VMAoU9wqS9uTkivNerD7r8fGWq3olPzzNCiPKThMyaUBht/y/q
         d7cg==
X-Gm-Message-State: AO0yUKUa95DGBMsyEJ5w795EG+8XQq5jVQIuGQejlT8C2WWKQHRq2mhr
	GS/DX1CI252Pj+Ae3A+vf7p1+ACfYwU=
X-Google-Smtp-Source: AK7set9S/prMsP6UV9btZCY/kpbvDySl0Yz4hcDEv+2lTxr76Pjxhm9JK1EWN6/Oksn+pG8nDUB1ww==
X-Received: by 2002:a05:622a:103:b0:3bf:a15e:a898 with SMTP id u3-20020a05622a010300b003bfa15ea898mr18661250qtw.18.1678135234116;
        Mon, 06 Mar 2023 12:40:34 -0800 (PST)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v4 0/3] libxl smbios support
Date: Mon,  6 Mar 2023 15:40:21 -0500
Message-Id: <20230306204024.124882-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.39.2
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

v4 is a rebase and resend of v3.

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
2.39.2


