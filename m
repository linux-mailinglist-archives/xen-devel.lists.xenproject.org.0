Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D05F78706A3
	for <lists+xen-devel@lfdr.de>; Mon,  4 Mar 2024 17:11:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688434.1072510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhAtu-0007QY-Dg; Mon, 04 Mar 2024 16:10:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688434.1072510; Mon, 04 Mar 2024 16:10:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhAtu-0007Oc-Az; Mon, 04 Mar 2024 16:10:50 +0000
Received: by outflank-mailman (input) for mailman id 688434;
 Mon, 04 Mar 2024 16:10:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bpxf=KK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rhAts-0007OP-Me
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2024 16:10:48 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1a7c6fb-da41-11ee-a1ee-f123f15fe8a2;
 Mon, 04 Mar 2024 17:10:45 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a2f22bfb4e6so766364966b.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 Mar 2024 08:10:45 -0800 (PST)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 o4-20020a17090611c400b00a458d85f9d9sm202394eja.142.2024.03.04.08.10.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 08:10:42 -0800 (PST)
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
X-Inumbo-ID: c1a7c6fb-da41-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709568644; x=1710173444; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4m0zDQO2biprRxwFjTqFVdZtLQIYv/njsgLK8Kh6PTw=;
        b=UIl83JlE4KIlDOcn9Z7DBPOWqfqV2tcrk5/b2sRb16zSLbySoQ6LrVCk3cfpdy0uSC
         HEm5q7GE0Y0FiVIkqzWanUXxUp6GCATvOVo0mdN8gC4AeiJysaZDrz7z/CTFEItDKM0s
         i/Cu5YMWxCzLhTDNtqd+bFLXcGc8fBuYl7/Ic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709568644; x=1710173444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4m0zDQO2biprRxwFjTqFVdZtLQIYv/njsgLK8Kh6PTw=;
        b=XQsbtFV3q7GMAs+0e//Sm4k2WpGiUtzU2I+sKLr3PJBmp4Vt4rH15HDFYF7BPGPKIM
         +30dJa/WFS9dQRyB4vAW+f2d0QIXrcAxuT97Gmp5d55ZXBTLVy1eoIZHLzcu10Alaiga
         QNeAO9zIwb1faJts672ptjfGG5Qc31RMyT/e2nVHp6/X7j6pjsUkcLB/fUEhMocFT4fm
         7a9lxOUxjr9uuYP9u5GpcFrumfMIJoVEflGh/vQNeOJSpaq7+oYt/SST0C6dNZ2U18dm
         n0OfMOuYjc+0Xrlr7TI3C6Jp09GtLEIEZN7fkevg5DxF3x7M3SuGDn+QvvVtsg9c+vQy
         GCww==
X-Gm-Message-State: AOJu0YwzP5aVJVWs3qDQMRvd+WA6/vcTF3QFoHhwmz18IxHa7hGKTxt6
	Qasd7qPZaH1ijmm9SEDv3WCDIpQQUa8F18a+jdKK7/g+Tg0LE4Spc2pysOa53B9wrryuZnWEhj0
	V
X-Google-Smtp-Source: AGHT+IHDRMZ+23vcWpN4lcrxO2vhKWg2kCf/5jOYUYBeoKMraQt55cRqMefgIkn2HoPOAN5AOjdhow==
X-Received: by 2002:a17:906:f35b:b0:a43:fd9e:2d69 with SMTP id hg27-20020a170906f35b00b00a43fd9e2d69mr7177614ejb.6.1709568643877;
        Mon, 04 Mar 2024 08:10:43 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 0/2] xen/nospec: Improvements
Date: Mon,  4 Mar 2024 16:10:39 +0000
Message-Id: <20240304161041.3465897-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Andrew Cooper (2):
  xen/*/nospec: Provide common versions of evaluate_nospec/block_speculation
  xen/nospec: Allow evaluate_nospec() to short circuit constant expressions

 xen/arch/arm/include/asm/nospec.h   |  9 --------
 xen/arch/ppc/include/asm/nospec.h   |  9 --------
 xen/arch/riscv/include/asm/nospec.h |  9 --------
 xen/arch/x86/include/asm/nospec.h   |  8 ++++----
 xen/include/xen/nospec.h            | 32 +++++++++++++++++++++++++++++
 5 files changed, 36 insertions(+), 31 deletions(-)

-- 
2.30.2


