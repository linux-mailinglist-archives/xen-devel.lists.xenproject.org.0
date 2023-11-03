Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FCF7E099B
	for <lists+xen-devel@lfdr.de>; Fri,  3 Nov 2023 20:47:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627328.978301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qz07y-0002pa-An; Fri, 03 Nov 2023 19:46:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627328.978301; Fri, 03 Nov 2023 19:46:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qz07y-0002nw-6z; Fri, 03 Nov 2023 19:46:46 +0000
Received: by outflank-mailman (input) for mailman id 627328;
 Fri, 03 Nov 2023 19:46:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wEjK=GQ=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qz07v-0002nq-Sg
 for xen-devel@lists.xenproject.org; Fri, 03 Nov 2023 19:46:43 +0000
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [2607:f8b0:4864:20::734])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b566556f-7a81-11ee-9b0e-b553b5be7939;
 Fri, 03 Nov 2023 20:46:41 +0100 (CET)
Received: by mail-qk1-x734.google.com with SMTP id
 af79cd13be357-77063481352so283971385a.1
 for <xen-devel@lists.xenproject.org>; Fri, 03 Nov 2023 12:46:41 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 ef19-20020a0562140a7300b0063f88855ef2sm1022825qvb.101.2023.11.03.12.46.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Nov 2023 12:46:39 -0700 (PDT)
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
X-Inumbo-ID: b566556f-7a81-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699040800; x=1699645600; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j+4dhvies66LiWDYNd3p0v1aNRY4JVVMabvE4Lw6PAk=;
        b=RSs/mNgCcUto2fBhPqWoNc6QFqaUM3cB2WA+bw88iPxkfn+gZHk2+h9qiaHQ33w5/X
         5RM/hs9mnQ8TYu6kgWGs0hMGjT9MjtEgc0eWFlGMxLpIHg+ZgC0RbfCxhduzEBS6lQX2
         qMdqmaLAt6cL9UYxk4Fpt2R0XMwtwfxRwBx9DRBFfMT7fW/zvQ7r+PMN9JXUuuDQs8TT
         ZdjxinjeaakCWvh8uSQkNwzDfscdo9GH1cOqnKFSlnIRnVSwAnxr36VO6J/cx0D5j0F6
         8nf7//12zEwtv5GlOqT8OgYiABN6bq1CLT1WxJzK6A0YsxTSoRlY+UA8JPiang9U66Ep
         unkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699040800; x=1699645600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j+4dhvies66LiWDYNd3p0v1aNRY4JVVMabvE4Lw6PAk=;
        b=Q3OhHB5J9hPrW4/I+eV6WOVEfyoUqSjKn524WWGTmww1lhsVFGO7+oeSxv8GUxMYsW
         MEtYEFh/k1jEiF1DyxdhbtMZoK5QVRfZ+o1t4cV++qe9jTgdLw9KIFAq+2rawr0YyOdK
         xI3dcG3HIw20WCKKeQhTrgBUoo/Er3/ZFmiedQ8CSQXixdcOqig4kr3a37HiFhZhuKiX
         STl9j6ASgmZXbqD0NEKR+2wUo35QE5eCi8q1UeFld/NFNDSNcdEsstf+luOgPIcsBU64
         Ngr13lehnLEGLaF7mUNuvRHW0LS9YpRAJCAeMkDTZZdoZi54h8krIfJi/1BUiWz632K6
         NbuA==
X-Gm-Message-State: AOJu0YxBaw+KS0PvN0Bk4wAalWr94MZQ96yDlPFD3/pSxUCM4CIHKH9j
	o/5DvuTYuEWLUDdXHcWLXo5QMobGWis=
X-Google-Smtp-Source: AGHT+IHtC23R3PfWvCji43KEKMgNvhcAf0oEP03VOqeOocFjW2h+G9uvMENVUv76n5qY1dKLjicsSg==
X-Received: by 2002:a05:6214:c43:b0:672:131e:4e9 with SMTP id r3-20020a0562140c4300b00672131e04e9mr5379946qvj.6.1699040799771;
        Fri, 03 Nov 2023 12:46:39 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Jason Andryuk <jandryuk@gmail.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH for-4.18 0/2] golang: Binding fixes
Date: Fri,  3 Nov 2023 15:45:49 -0400
Message-ID: <20231103194551.64448-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These two patches refresh the bindings which have gone a little stale.
I used two separate patches since the XSA-443 one may want backporting.

Jason Andryuk (2):
  golang: Fixup binding for Arm FF-A
  golang: Fix bindings after XSA-443

 tools/golang/xenlight/helpers.gen.go | 9 +++++++++
 tools/golang/xenlight/types.gen.go   | 3 +++
 2 files changed, 12 insertions(+)

-- 
2.41.0


