Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE51697FA2
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 16:39:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496081.766635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSJsE-0002O5-Ea; Wed, 15 Feb 2023 15:39:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496081.766635; Wed, 15 Feb 2023 15:39:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSJsE-0002M7-Az; Wed, 15 Feb 2023 15:39:10 +0000
Received: by outflank-mailman (input) for mailman id 496081;
 Wed, 15 Feb 2023 15:39:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v50p=6L=tibco.com=sdyasli@srs-se1.protection.inumbo.net>)
 id 1pSJsC-00026r-9u
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 15:39:08 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e17a86fe-ad46-11ed-93b5-47a8fe42b414;
 Wed, 15 Feb 2023 16:39:06 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 k8-20020a05600c1c8800b003dc57ea0dfeso1930653wms.0
 for <xen-devel@lists.xenproject.org>; Wed, 15 Feb 2023 07:39:06 -0800 (PST)
Received: from localhost.localdomain ([185.25.65.68])
 by smtp.gmail.com with ESMTPSA id
 t39-20020a05600c32a700b003e1e8d794e1sm2320560wmp.13.2023.02.15.07.39.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 07:39:05 -0800 (PST)
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
X-Inumbo-ID: e17a86fe-ad46-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tibco.com; s=googleworkspace; t=1676475545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=UbkQ0Tsofds3NIZpEYPN9Zfob+Z/kFBDvI+50cJgOTM=;
        b=cK7G53pbRRvYWG0NrH6g46H5ccChizmhf+OMIn3sDSOyZCdfYJN8UCPJ13I0/lXBje
         AiQL5SSJF6arfota0cupDCiFPtapupyZ8fDF6/ggY9oDZ5ObcEEC/AqmuGcv94zdYGpb
         JjrKTQz4XP1KDkCk0WVJWKH8kkoqkw8mtSJw9IpGTMqsdsUoNjrS8sVdSUZFDGV2zi/o
         HCS9SOw5Qk/KguErYSALh3J1tVi3FCdCD+Ca86P+fLR38NcboymTHnuzRSwg+ZA56TFn
         Qngu9KMqehCtaV9PHr/R2IScGLO1pdFNzjh/h8EB3I7Sp6IR5ySrR8hEeg4LwsxUqlN/
         quiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1676475545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=UbkQ0Tsofds3NIZpEYPN9Zfob+Z/kFBDvI+50cJgOTM=;
        b=LX9X0vR0PmfM/bT1+in8SkC60wnaEG2Y7WgXGD7J1E2oXB6A5GVIEYsUoAcX5KTGDZ
         nKZpyxF7hHX4hjhWZUOCUHLnTHaKySKEqdDRHWfHvGaG7CHoiV/eqwc0q3q6oPzBLuNw
         H9YwqrFbcfAGBxzwEEDslmLIQU9WVUbfCAnLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676475545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UbkQ0Tsofds3NIZpEYPN9Zfob+Z/kFBDvI+50cJgOTM=;
        b=a5PHaiPT1h6iahv75oTj7w3I5JnU7W/8qz+O4uBkWfELlpbNucvd3cRM78uWwyaE53
         ySA9TpVVnf2jDKa/XFi917wi7OsdkOsD1jIy/f/7hzh2sQShx3qAsc/sE8dZEKC7ehhp
         aMS8/Gj+vtrFeBgafiHLJhhi97QY8lt/YAQkQRpGc1NdIJMFPyeGXiddtepQ5sSTV6Sl
         f73t5IWDMygRg9SoseMeurO37NZ14TgCmy27jzcB0U0yi9uTXTzwFsuusEhrP0+ub8Dq
         TJIsYaPytZV7oh3Mj/HePfpbAo9P2PXlQV+NcCxYidvfOfPGRhVL8SU9MTfCJC2/51aj
         GugQ==
X-Gm-Message-State: AO0yUKXP80yMiKQphUdxiUv+HZ3GFJPy/xm11nSgqotZB7mrmPWRgXuy
	gc030PSNnQ9g2x11hOCGcu1O/Oxc4DHJdnaqk/g=
X-Google-Smtp-Source: AK7set9n63sxpMrWJk0NbgvChXfNCvF8njnRiXbW8unE/b+ryxNYGg2yDTNOIdijgUByiHCz3WGybg==
X-Received: by 2002:a05:600c:3c9e:b0:3dc:3b1a:5d2d with SMTP id bg30-20020a05600c3c9e00b003dc3b1a5d2dmr2671723wmb.0.1676475545615;
        Wed, 15 Feb 2023 07:39:05 -0800 (PST)
Sender: Sergey Dyasli <sdyasli@tibco.com>
From: Sergey Dyasli <sergey.dyasli@cloud.com>
X-Google-Original-From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Sergey Dyasli <sergey.dyasli@citrix.com>
Subject: [PATCH v4 0/2] x86/ucode/AMD: load ucode on every logical thread
Date: Wed, 15 Feb 2023 15:38:44 +0000
Message-Id: <20230215153846.18582-1-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I've added a second patch to cover late loading as that should also
happen on every cpu, according to AMD.

Sergey Dyasli (2):
  x86/ucode/AMD: apply the patch early on every logical thread
  x86/ucode/AMD: late load the patch on every logical thread

 xen/arch/x86/cpu/microcode/amd.c     | 11 +++--
 xen/arch/x86/cpu/microcode/core.c    | 61 +++++++++++++++++++---------
 xen/arch/x86/cpu/microcode/intel.c   | 10 +++--
 xen/arch/x86/cpu/microcode/private.h |  3 +-
 4 files changed, 59 insertions(+), 26 deletions(-)

-- 
2.31.1


