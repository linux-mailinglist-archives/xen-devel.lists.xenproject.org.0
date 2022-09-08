Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A055B272B
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 21:52:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403573.645710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWNYv-0005l5-Ha; Thu, 08 Sep 2022 19:51:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403573.645710; Thu, 08 Sep 2022 19:51:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWNYv-0005iS-EI; Thu, 08 Sep 2022 19:51:45 +0000
Received: by outflank-mailman (input) for mailman id 403573;
 Thu, 08 Sep 2022 19:51:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J4jV=ZL=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1oWNYt-0005iM-5r
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 19:51:43 +0000
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [2607:f8b0:4864:20::836])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8a798ee-2faf-11ed-a31c-8f8a9ae3403f;
 Thu, 08 Sep 2022 21:51:42 +0200 (CEST)
Received: by mail-qt1-x836.google.com with SMTP id cr9so13730964qtb.13
 for <xen-devel@lists.xenproject.org>; Thu, 08 Sep 2022 12:51:42 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
 by smtp.gmail.com with ESMTPSA id
 bp33-20020a05620a45a100b006b8e049cf08sm17095814qkb.2.2022.09.08.12.51.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 12:51:39 -0700 (PDT)
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
X-Inumbo-ID: a8a798ee-2faf-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=YsI3iFijxvi+NCMqRHPiIXyCiqm6MIXQN1SaSCN3Ld8=;
        b=q4CLeRsZ14bwrNwYKCFtJ98mzcbQ3IwHSCI8261GXNGcuHGepaEq+vM2V33ap23fuj
         m2L0TMg+txeYwVsCx8AoQsaqYfWbGadXIHnEcnLxdfJ1bnrv7Xb0TER3JCPmmSVRojyC
         a2UJTn49BWqkUG0a62swOepxO1kjsj54JmhVA0iYVcCcwIHRdJoGIS7RIhRNLBgkmNVA
         HiBJzSb5lkmLQKiTcznhwHikjYnNw2Nl1ePTLpfMTkIyInzklNEH3La8HPt6P0F+RIHE
         f+q57hK5PooX2A1Ec735RvwA7KoEXATGw2cWpjPsbmgh6Iwi9U9xIWRLwd7jtK9OWmKz
         xvcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=YsI3iFijxvi+NCMqRHPiIXyCiqm6MIXQN1SaSCN3Ld8=;
        b=CIMHUJ19Wk8mFFkHh04Nl0drsKvLbH31mo1tiQuWlpkpQqK2zHb5Qe3mW7F6Ng/GHo
         g3GQ7OqfSYDBSw1Bs/oxNzH5XvwRwbXwcshPRE2t3SUl0jMhdGV/kWovzTEitrfu1lO9
         7zpRUpUj84x8sfImlbCZXcOJuDtBqoLEr62M5owAkdHAIeiZytMI6so9axn8zZ747la4
         1bPDAHkvUkTCFQFfoz33hY3/KPHvkHbba+mQW1lAuoXGK5kU2dh6jWMxQSPkjPaSyN8z
         miN/SiyLnCEV4w4Hl4AzG9iFserBa4+wP6kcgsk9kS9u4FM0vlcMA60RB30wN06vGg8n
         GPfA==
X-Gm-Message-State: ACgBeo2pUsnz1BfgT/5zi5Tfi2QGXpAlCZL4NngF9wsMBklCBqRGUVTp
	z4gOkAsYbCaT0fMLM+1J96TjMfGzHTI=
X-Google-Smtp-Source: AA6agR51dlMBzoWWBmSInIMh/au/9Ceh79DSjHse7XlrOpEWGvYzbxEPwR5MZcxbajxgZAEQK/0fUQ==
X-Received: by 2002:a05:622a:1111:b0:35a:6ffd:9a6c with SMTP id e17-20020a05622a111100b0035a6ffd9a6cmr2722977qty.583.1662666700510;
        Thu, 08 Sep 2022 12:51:40 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 0/3] libxl smbios support
Date: Thu,  8 Sep 2022 15:51:10 -0400
Message-Id: <20220908195113.218201-1-jandryuk@gmail.com>
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

The rendered man page and html don't have a newline at then end of the
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

 docs/man/xl.cfg.5.pod.in             | 49 +++++++++++++++++++++
 tools/golang/xenlight/gengotypes.py  | 41 ++++++++++-------
 tools/golang/xenlight/helpers.gen.go | 51 +++++++++++++++++++++
 tools/golang/xenlight/types.gen.go   | 28 ++++++++++++
 tools/include/libxl.h                |  5 +++
 tools/libs/light/libxl_dom.c         | 32 ++++++++++++++
 tools/libs/light/libxl_types.idl     | 27 ++++++++++++
 tools/xl/xl_parse.c                  | 66 +++++++++++++++++++++++++++-
 8 files changed, 282 insertions(+), 17 deletions(-)

-- 
2.37.3


