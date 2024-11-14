Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DED89C8B03
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 13:50:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836417.1252306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBZIU-0002BX-P5; Thu, 14 Nov 2024 12:50:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836417.1252306; Thu, 14 Nov 2024 12:50:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBZIU-0002AQ-Kt; Thu, 14 Nov 2024 12:50:06 +0000
Received: by outflank-mailman (input) for mailman id 836417;
 Thu, 14 Nov 2024 12:50:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Deeb=SJ=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tBZIT-0001tD-1A
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 12:50:05 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f613d5d9-a286-11ef-99a3-01e77a169b0f;
 Thu, 14 Nov 2024 13:50:01 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-53b34ed38easo551920e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2024 04:50:01 -0800 (PST)
Received: from localhost.localdomain (99.149.115.87.dyn.plus.net.
 [87.115.149.99]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3821ae1685csm1416809f8f.83.2024.11.14.04.49.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2024 04:49:59 -0800 (PST)
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
X-Inumbo-ID: f613d5d9-a286-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMmEiLCJoZWxvIjoibWFpbC1sZjEteDEyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImY2MTNkNWQ5LWEyODYtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNTg4NjAxLjA4MTAyLCJzZW5kZXIiOiJmcmVkaWFuby56aWdsaW9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1731588600; x=1732193400; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4yrJsZaI8Gx3PHwfNrL2D8jf+fI1lhP6Sb43yRpqP2A=;
        b=OOKy8vZNLfS3LcPFyUvcQ8ohGFhdp+EHthzEccX8hdfj5WHsVzPT0Zx3iKsae1iMuE
         4JhOJvh+xidRa0xuonEACkYhG3CdWjUtbLav0kSoIZ4N/+Z698MUuVzLRCY2oRsBNdne
         326sITTIBlCeXInwnmKQUmnTXle4inIGZvOAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731588600; x=1732193400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4yrJsZaI8Gx3PHwfNrL2D8jf+fI1lhP6Sb43yRpqP2A=;
        b=t1jGEm+hYwWfOivVinOof3UPAgOtyLuvzZFFAn1olJ954wgnjaAgzGoDVo3RUKhXni
         Rroza9hLt+jzXtJA8B9LKj5/Xtf+9YzkT8B/KKIzJ0Bqf+Z7YVNTtkQxP3FIFOrJvPly
         54xqMxxubfepSG1N50BWf48ysQ3qBPY3jtpAjLkMJ13RV4MIcpSTkhW1XEjfPNkELkhc
         uJKXWbYhIMeUDgoWXCeKz51GeiRpoBAwUNPJKgpnWeBvMQ+q3PGRyKr2GEOO3NTyQupD
         d2gOZzUaLiiVNVD17Gb/veTcyh7uJ0N+BtL+L3DT0uz48OzCtEHqvaK09gVdxem4Kbrn
         W4HQ==
X-Gm-Message-State: AOJu0YzG3AzHXUhdj9LNphp1d/dEPmVy+Quq4746NajUsbo5cou+kJh3
	hgD9LPbmOui1pd18bwPrdl0pfmTZm1TBdTj6Iz+3nnHxKeM2quRbWsHj+4jeXmfTUMybSUAak1Y
	emNY=
X-Google-Smtp-Source: AGHT+IFpBMYXPzhu+Vo3nkDVd7E2hesXTd+g/hTwK/pbzYrVf1s3QBmJQQY8D/xtn/PpPo6/X39zwA==
X-Received: by 2002:a05:6512:3a87:b0:52c:9383:4c16 with SMTP id 2adb3069b0e04-53d862bd8b4mr10370088e87.22.1731588600220;
        Thu, 14 Nov 2024 04:50:00 -0800 (PST)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 0/4] Move some boot code from assembly to C
Date: Thu, 14 Nov 2024 12:49:46 +0000
Message-Id: <20241114124950.24808-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As a continuation of this series start sorting out the issue of headers
not compatible with 32 bit.
Instead of having to change headers which are almost only used for 64 bit
allows to override headers or move reusable definitions to new shared
headers.
This results in less changes.

Frediano Ziglio (4):
  Use an include/boot directory to override headers for boot code
  x86/boot: Use header to allows inclusion of public xen.h header
  x86/boot: Move some settings to C
  x86/boot: Use external symbols from cmdline_parse_early

 xen/arch/x86/boot/Makefile                |  2 +-
 xen/arch/x86/boot/build32.lds.S           |  4 ++++
 xen/arch/x86/boot/cmdline.c               | 14 ++++++++++--
 xen/arch/x86/boot/head.S                  | 19 +--------------
 xen/arch/x86/boot/reloc.c                 | 28 ++++++++++++++++++-----
 xen/arch/x86/boot/trampoline.S            |  2 +-
 xen/arch/x86/include/asm/guest/pvh-boot.h |  1 +
 xen/arch/x86/include/asm/setup.h          |  2 ++
 xen/arch/x86/include/boot/public/xen.h    | 28 +++++++++++++++++++++++
 xen/arch/x86/include/boot/xen/cpumask.h   |  1 +
 xen/arch/x86/include/boot/xen/string.h    | 10 ++++++++
 11 files changed, 83 insertions(+), 28 deletions(-)
 create mode 100644 xen/arch/x86/include/boot/public/xen.h
 create mode 100644 xen/arch/x86/include/boot/xen/cpumask.h
 create mode 100644 xen/arch/x86/include/boot/xen/string.h

-- 
2.34.1


