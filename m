Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF3F89B407
	for <lists+xen-devel@lfdr.de>; Sun,  7 Apr 2024 22:50:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701682.1096006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtZSq-0005Z4-K3; Sun, 07 Apr 2024 20:50:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701682.1096006; Sun, 07 Apr 2024 20:50:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtZSq-0005XY-H7; Sun, 07 Apr 2024 20:50:08 +0000
Received: by outflank-mailman (input) for mailman id 701682;
 Sun, 07 Apr 2024 20:50:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CRZ/=LM=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rtZSp-0005XS-Hu
 for xen-devel@lists.xenproject.org; Sun, 07 Apr 2024 20:50:07 +0000
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [2607:f8b0:4864:20::735])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68eec40a-f520-11ee-a1ef-f123f15fe8a2;
 Sun, 07 Apr 2024 22:50:05 +0200 (CEST)
Received: by mail-qk1-x735.google.com with SMTP id
 af79cd13be357-78a2a97c296so232746685a.2
 for <xen-devel@lists.xenproject.org>; Sun, 07 Apr 2024 13:50:04 -0700 (PDT)
Received: from shine.lan
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 op3-20020a05620a534300b0078a593b54e6sm2512745qkn.96.2024.04.07.13.50.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 13:50:02 -0700 (PDT)
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
X-Inumbo-ID: 68eec40a-f520-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712523003; x=1713127803; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qot47x5q7QEXni8/MbgirUQJ9Uu6F64YLsfo2qh4Ybw=;
        b=LU4j7kDoYW4oDuiE/oj6uCunmXf/vHEEOQwG4wz8RRpvs7TgP7qHlnsODDGRLLt7Wd
         R07L0dp5aFkf4DFDGVYeHYewSb5FNsRGIq+xjXP5Myi6++YjHef4neaaADszFrvfWOnA
         hIdGkuvR3/lpLrNj9WBMR02ETMOjISnRNowLy5Ux3E80cJC1omWFU6X2qn7AqU1Kzbjs
         TaFdVUkIFKV18vMsWX73Z13zyPguBcZKduGV+q/sHjCmaUeJXuILsELZmnx+2DgQBLHF
         IP5/7Zvgy5uKxZPfPLLUXGe4Z6Dx2TkDiviuOAsiW4bhOb8V0kL+RAtUhswsAZhKdWZj
         A4Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712523003; x=1713127803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qot47x5q7QEXni8/MbgirUQJ9Uu6F64YLsfo2qh4Ybw=;
        b=sAaArhj7o70ECl1t8klwrDo+jSpW5KL6okebibP8SqNKBeYX15w8hKfYNUcDfThTCy
         XsZKwXK4/JjinAEYeAnnpN1FBaPZ1Gj50BJZBBTLW9bvFTlJdE/UyL2Y8nkFOnSrhyyu
         e1na4cWeqo0WyZN4tc/hLLe6YZvhuZpq7tyQeVUuT/BOx/D4tnSpVZ3+Bes4O+ia0M40
         1dCr27I4ISW1xY1PlqVs49AU9uJOugg7RHDxUvDEY/tBh9f4aOvA0FxwkSflpLPAYvVz
         Ft00IStsQLpAuipvvJsb47BiRh9FwWHjv2051OSZuWkn268nPZFaGbAFNOgqIci9UMJ5
         hkNg==
X-Gm-Message-State: AOJu0YxkOVWw5zbJLx0S81xbX5HzJZDDUwO49QM3QaCKMwPCAqEFtSbE
	/eTtH1LhcQTaULw60vSBWE5IGojl9NOJ1pTEjngC1lU7cg6gqOBWvVyFAcQ+
X-Google-Smtp-Source: AGHT+IGvrjvAIE4TwdGR+TJljNUjr0G2nA6sadaQFOAivHM/fCHI857m0e78hSpJx6xXTImxqYYopA==
X-Received: by 2002:a05:620a:229a:b0:789:fa4d:eebb with SMTP id o26-20020a05620a229a00b00789fa4deebbmr6287430qkh.69.1712523002856;
        Sun, 07 Apr 2024 13:50:02 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jason.andryuk@amd.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v2 0/3] libxl: blktap/tapback support
Date: Sun,  7 Apr 2024 16:49:50 -0400
Message-Id: <20240407204953.60442-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jason Andryuk <jason.andryuk@amd.com>

This patch set  re-introduces blktap support to libxl.  Unlike earlier
versions, it does not link against any blktap library.  libxl changes
are needed to write to the vbd3 backend XenStore nodes.

blktap has three components.  tapdisk is a daemon implementing the disk
IO, NBD (Network Block Device), and Xen PV interfaces.  tap-ctl is a
tool to control tapdisks - creating, starting, stopping and freeing.
tapback manages the XenStore operations and instructs tapdisk to
connect.

It is notable that tapdisk performs the grant and event channel ops, but
doesn't interact with XenStore.  tapback performs XenStore operations
and notifies tapdisks of values and changes.

The flow is: libxl writes to the "vbd3" XenStore nodes and runs the
block-tap script.  The block-tap script runs tap-ctl to create a tapdisk
instance as the physical device.  tapback then sees the tapdisk and
instructs the tapdisk to connect up the PV blkif interface.

This is expected to work without the kernel blktap driver, so the
block-tap script is modified accordingly to write the UNIX NBD path.
(It works with the kernel blktap driver as well - upstream blktap hasn't
removed the blktap driver requirement yet -
https://github.com/xapi-project/blktap/pull/364)

An example command to attach a vhd:
xl block-attach vm 'vdev=xvdf,backendtype=tap,format=vhd,target=/srv/target.vhd'

VHD support is important for OpenXT since there are lots of existing
VHDs which still need supporting.  tapdisk also supports encrypted VHDs
which is not available in QEMU.

blktap's tapback needs minimal changes to work with libxl:
https://github.com/xapi-project/blktap/pull/394

With a stubdom, the block-tap isn't executed a second time meaning
tap-ctl destroy isn't called.  The stubdom's disk xenstore frontend
entry is removed, but tapback does nothing for this case right now.
Making FE removal transition the BE to closed lets the hotplug script
run properly.

v2 addresses review comments and adds a CHANGELOG entry.

Jason Andryuk (3):
  hotplug: Update block-tap
  libxl: Support blktap with HVM device model
  CHANGELOG: Mention libxl blktap/tapback support

 CHANGELOG.md                  |   1 +
 tools/hotplug/Linux/block-tap | 169 +++++++++++++++++++++++++++++++---
 tools/libs/light/libxl_disk.c |  18 +++-
 tools/libs/light/libxl_dm.c   |   1 -
 4 files changed, 172 insertions(+), 17 deletions(-)

-- 
2.39.2


