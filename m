Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E445BA6A99F
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 16:21:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922517.1326420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvHhm-0000Rx-6Z; Thu, 20 Mar 2025 15:21:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922517.1326420; Thu, 20 Mar 2025 15:21:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvHhm-0000OA-1f; Thu, 20 Mar 2025 15:21:10 +0000
Received: by outflank-mailman (input) for mailman id 922517;
 Thu, 20 Mar 2025 15:21:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5hxt=WH=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tvHhl-0000Ny-6o
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 15:21:09 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f20b9c6a-059e-11f0-9ffa-bf95429c2676;
 Thu, 20 Mar 2025 16:21:07 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ac29af3382dso159808966b.2
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 08:21:07 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-5e816ad3937sm11146616a12.49.2025.03.20.08.21.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 08:21:06 -0700 (PDT)
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
X-Inumbo-ID: f20b9c6a-059e-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742484066; x=1743088866; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qlZ8K6df/QHtSj7gc4lffDD6HTEVmJac/tim/W78zIk=;
        b=IHVIDEjEOqBfnnpH5kcnH/L8H6Q450HPXJMyZi04v+ptlL71sfTe8oa9+oDNNjDTct
         Km/gk+ZwnwQJ0eyKimrNJ0jEnthWa/nn3ia5a1IbxWXXoCY9fnCxvHK5ZN/ctq3RQSH8
         2Wp+rcI0RnCyKCGYit3++r/iE3PRKvJUawypk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742484066; x=1743088866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qlZ8K6df/QHtSj7gc4lffDD6HTEVmJac/tim/W78zIk=;
        b=RaDLARKH4LtClyquGyGXXheeBFKeIbYGH0LII1GxOvgv4zGmpWu48bDRY/9nAzdTen
         raSBj0wkaNDeSoF9Xpd1iMKToofuU4woMCdYbBWIOs7SYLdHGUbWwq67injgTecR7cvh
         +IMuS+hgxw15wlJsPphD94AsXeqYpBvNbXCbYLenp57CBVETDBKCs62/R+2eCdwSQ/I7
         CDdjXI1L2nvuHsGfQpf3CgC4YS9Fns2/FildDb9TsawLUSScZZd1ud2HBC7GB/vJ+Vmx
         bmqWB3FbtSsQH7Nlg1jRIGMdHDyFx9KgrKc0wlRTp1N7yJVNwpEbBOD+V9iBod/KW49f
         T1qg==
X-Gm-Message-State: AOJu0YwG2mmlsLjF/CB9iR4ygPDVehmhQvpSozGoTNphJ1QksFVP/2IL
	v++FOQM4GhLwsZQ4OHxgLwTllb64Yd5OBrN91P4hlXkjSEVwiDTl0Ok/D9n8WpCr8evOwez9bjY
	c
X-Gm-Gg: ASbGnct2Mi0u3NDCziWus3A+KPxQX3am2vH6Rs+QmIZ/PHpwXDXFuN0rXaHW1yQCDhG
	blujz5eOHND7YGiLJ30cvIAnNFhb299M8DPNfCFUkPQ931SYfobzhbzswGNChSE8ZDvtKVmNLoG
	j4RO7TLxNbaIkYUFnxw40GOAw6UnZYw0SCHJBLiy9Mts/rt+lOyd3ux79a/ZnN3mfPrehyCaBCG
	6hraIB89vCZHc1o7L6NqPQiXLZkdNXO13nN7UuHz1Lb4UCo8h1m3t0mYInB/xhu4QozY0RDmD4y
	KlmhOUqd4QWO9xMehRjGqG7kkGr7+0CLQyqlXAKxaIFbg17TIg==
X-Google-Smtp-Source: AGHT+IFXWwZuJiT3FTsM0GALf+zt0Fs4208FiRIDzc96XOgpF2orFgNcAhQ4o/eInU8jIrKRmDhp+A==
X-Received: by 2002:a17:907:7f9f:b0:ac2:fd70:dda3 with SMTP id a640c23a62f3a-ac3ce17cd73mr434767466b.35.1742484066440;
        Thu, 20 Mar 2025 08:21:06 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v2 0/4] automation/cirrus-ci: add smoke tests of the FreeBSD builds
Date: Thu, 20 Mar 2025 16:20:16 +0100
Message-ID: <20250320152020.88526-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

The aim of the series is to introduce a basic set of smoke tests using
QEMU and XTF, to ensure some minimal run-time testing of the LLVM
toolchain generated Xen binary.

Thanks, Roger.

Roger Pau Monne (4):
  automation/cirrus-ci: use matrix keyword to generate per-version build
    tasks
  automation/cirrus-ci: build XTF
  automation/cirrus-ci: store XTF and Xen build artifacts
  automation/cirrus-ci: add smoke tests for the FreeBSD builds

 .cirrus.yml  | 152 ++++++++++++++++++++++++++++++++++++++++-----------
 CHANGELOG.md |   1 +
 2 files changed, 120 insertions(+), 33 deletions(-)

-- 
2.48.1


