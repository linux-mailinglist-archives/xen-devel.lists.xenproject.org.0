Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB4367E0A6
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 10:47:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485375.752552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLLK6-0003Gi-7h; Fri, 27 Jan 2023 09:47:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485375.752552; Fri, 27 Jan 2023 09:47:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLLK6-0003E2-4F; Fri, 27 Jan 2023 09:47:06 +0000
Received: by outflank-mailman (input) for mailman id 485375;
 Fri, 27 Jan 2023 09:47:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yrR2=5Y=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pLLK4-0003Dw-Pt
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 09:47:04 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d35e9a9-9e27-11ed-a5d9-ddcf98b90cbd;
 Fri, 27 Jan 2023 10:47:03 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id y19so4231203edc.2
 for <xen-devel@lists.xenproject.org>; Fri, 27 Jan 2023 01:47:03 -0800 (PST)
Received: from uni.router.wind (adsl-40.109.242.227.tellas.gr.
 [109.242.227.40]) by smtp.googlemail.com with ESMTPSA id
 l23-20020a50d6d7000000b004a0b1d7e39csm2054861edj.51.2023.01.27.01.47.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 01:47:01 -0800 (PST)
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
X-Inumbo-ID: 8d35e9a9-9e27-11ed-a5d9-ddcf98b90cbd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CuPGA/8gL6xHnSmQ2U0UWhnzfACNHy9SjmHvgXWBUiM=;
        b=oTBpDVON0Q4EIXeQyQX4pEn9RjlsJf6DHrr9rPbDsbR2kKHtPdQFL1wKJ7CX1adc+5
         uXiYqZseiUHfSrur8oVCbFF7Vxf8CGhCYKefv/y4jXWLw8EQDAsmM3gXDII6DPj+6l1A
         YaKJbR9NEHDc7zDbHB9ykMnmiRNadFG3AeIWgfiVURCxPUuSdB8LeCaOPl0mjELcPvDz
         9Sjel/HFIqfNg+pZXRbIYNrWy0N9lSkcN1OAr4q/JJcWMIH+ajKHgMGWJ6Om6CkEhE38
         AGv7MX8e27+7lKP5N9N33eQLr7f3l9wUc1zL53zWg/+/7JHx3j/w63no2/5lAFjB/Zdk
         2Qww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CuPGA/8gL6xHnSmQ2U0UWhnzfACNHy9SjmHvgXWBUiM=;
        b=OmypUSeel3DnzpNA9H6qKvuFB0by8lajagAuK09K7lK8Qgl2CuAdEHNycR2soWjEhO
         /R5gsMBpgaHFX2W49yNCQrgz/mvFmKbxHrcJlHv6vqbaWewabuBKDC3JAD3ySTt1lXjB
         BRUXpg4MbWcDqubPtwaQLqpKEAOO9yLhdbnxY2jfE3ffLHNolok99+dUbQBvb96mJ8s0
         OSPvylFi7jWHqH2m+AQigQoJu//YdB95qhJxByovogi33sxvgNP2ctcVkYfzZ4he/ve+
         0bbHobpWlmwU8Nl1aM4vncEcj6kZ4A9G1a7wu0s8wBsoAtY4GDLjyF2LhVc70RLN0dxL
         TfIw==
X-Gm-Message-State: AFqh2ko+41N/AZcDDzG0uXOIez97kmi7Lf2b+oe16SDyOKhk32A51qLR
	F+b9pHp1+8bEQBDYxggdDHo9PpnWIo8=
X-Google-Smtp-Source: AMrXdXt4FZtSMFZG/fxg6aTjEPe5Sc+/xzYteDgMpwQHB35/wJdbTUT8RiDQfgSQ1MsSwta0erzvUA==
X-Received: by 2002:a05:6402:10c9:b0:49d:a87f:ba78 with SMTP id p9-20020a05640210c900b0049da87fba78mr40140224edu.35.1674812822290;
        Fri, 27 Jan 2023 01:47:02 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 0/2] Remove unused virtualization technology specific headers
Date: Fri, 27 Jan 2023 11:46:54 +0200
Message-Id: <20230127094656.140120-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patches remove forgotten and now unused virtualization technology specific
headers from arch/x86/cpu/vpmu.c and arch/x86/hvm/emulate.c.

Xenia Ragiadakou (2):
  x86/emulate: remove unused svm specific header
  x86/vpmu: remove unused svm and vmx specific headers

 xen/arch/x86/cpu/vpmu.c    | 4 ----
 xen/arch/x86/hvm/emulate.c | 1 -
 2 files changed, 5 deletions(-)

-- 
2.37.2


