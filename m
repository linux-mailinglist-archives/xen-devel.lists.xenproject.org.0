Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E80A858F353
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 21:49:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383997.619245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLrhH-0007Lr-Bb; Wed, 10 Aug 2022 19:48:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383997.619245; Wed, 10 Aug 2022 19:48:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLrhH-0007K4-8P; Wed, 10 Aug 2022 19:48:55 +0000
Received: by outflank-mailman (input) for mailman id 383997;
 Wed, 10 Aug 2022 19:48:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UxBI=YO=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1oLrhF-0007Jy-VX
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 19:48:54 +0000
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [2607:f8b0:4864:20::731])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75e531df-18e5-11ed-bd2e-47488cf2e6aa;
 Wed, 10 Aug 2022 21:48:53 +0200 (CEST)
Received: by mail-qk1-x731.google.com with SMTP id t11so1213827qkt.6
 for <xen-devel@lists.xenproject.org>; Wed, 10 Aug 2022 12:48:52 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:289e:b898:c7de:df6c])
 by smtp.gmail.com with ESMTPSA id
 bk9-20020a05620a1a0900b006b978b521c8sm520897qkb.69.2022.08.10.12.48.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 12:48:50 -0700 (PDT)
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
X-Inumbo-ID: 75e531df-18e5-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=QQXz13C4QpBnoSIB6G/QdpXurbcsW+r771/2/v8X8Eg=;
        b=DnDteQPj5aR12v8C6pwJWtGUrY5XcNNgA2jfxY+40VTKM5+vVZH3hndHbJyyDe2Z0S
         NeoV3IYVjvFFbrADf5ssweHA8qpV0ev8IKYcthH3VFAkMpz4JD7kB6Ga73jXbg+P2Eav
         NkIiB9Vh0HBkqVkkvmirha1KBaQziYLwm52leROPenNRX2pF5MGQjfMSO+dN0COsjGy8
         Z8T+DI7JlfHmeoR54XV27oX3FLYlHmGmUl/Dk+kZSUOyzeBAeDs4WY4iQDpabk9Ovnnu
         B6uT1PgDz53D+6DDFgLodh0fpCsW03gUG2b9DMkSgbXbkC9QdoflX7s18ywasY8PxRF9
         EBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=QQXz13C4QpBnoSIB6G/QdpXurbcsW+r771/2/v8X8Eg=;
        b=MhYKabDzJpBqwSo+d8J2KsuRxuj5YxTFnaKM4L3QSdD7v0GpPsnRJ6V4KTui0i/1sh
         nlunJkIUM8aoaV29M0QO+u2a8NW1IOG+WKg8PktFcxiGagc8L/W579NYxaHTwo1TK9kx
         jrQ4Xi9Nv4L3sgHiL1KELmXXMwI8cfCH4P+H/r04IfxWLZ4gvVvKSK8UFM3F7Y88H+j8
         hmNWxcYA689yMxGR/dBgVau0XUaO88aBbHcb/4bePOJcmgzh3HPd1OdOdL7Mj4OcQtXQ
         xnqoL3Knh39TSV2zrokL/GcNTjsHFs9fohOj5WAvRT7lWOLupftEP86AjpLHj4zc/wsx
         valw==
X-Gm-Message-State: ACgBeo1NyrzrYks2yinEGrw1TFzC7U2pzsbXPaGVw2aLmvodZCqYOm4e
	NkZhavbLsYfoPzw2X4DmbaYl3YJtoWM=
X-Google-Smtp-Source: AA6agR5QJ6NF835S+D0GBaIudLoXytyZlZUls2cm9dEHiwRT7//36PAPIAaS4Oqxky87lXnFl+smAw==
X-Received: by 2002:a05:620a:c55:b0:6a7:9e01:95c9 with SMTP id u21-20020a05620a0c5500b006a79e0195c9mr22093906qki.63.1660160931564;
        Wed, 10 Aug 2022 12:48:51 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 0/3] libxl smbios support
Date: Wed, 10 Aug 2022 15:48:24 -0400
Message-Id: <20220810194827.103428-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.37.1
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
The use of smbios_type Enum is a little unwieldy to defined so many
entries, but it works.  xl will internally parse smbios=["oem=A,oem=B"]
into oem_1 = "A" and oem_2 = "B".  xl still accepts oem_$N, though
hvmloader only reads sequentially from 1 up to a maximum of 99.  It's a
corner case what doesn't seem worth dealing with.

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

 docs/man/xl.cfg.5.pod.in             |  49 +++++++++++
 tools/golang/xenlight/gengotypes.py  |  41 +++++----
 tools/golang/xenlight/helpers.gen.go |  51 +++++++++++
 tools/golang/xenlight/types.gen.go   | 126 +++++++++++++++++++++++++++
 tools/include/libxl.h                |   5 ++
 tools/libs/light/libxl_dom.c         |  20 +++++
 tools/libs/light/libxl_types.idl     | 125 ++++++++++++++++++++++++++
 tools/xl/xl_parse.c                  |  59 ++++++++++++-
 8 files changed, 459 insertions(+), 17 deletions(-)

-- 
2.37.1


