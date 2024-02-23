Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E990861101
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 13:07:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684816.1064954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdUJz-0006wT-Lg; Fri, 23 Feb 2024 12:06:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684816.1064954; Fri, 23 Feb 2024 12:06:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdUJz-0006uM-IA; Fri, 23 Feb 2024 12:06:31 +0000
Received: by outflank-mailman (input) for mailman id 684816;
 Fri, 23 Feb 2024 12:06:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lysb=KA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rdUJx-0006di-U6
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 12:06:29 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9657c30-d243-11ee-98f5-efadbce2ee36;
 Fri, 23 Feb 2024 13:06:28 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-512dfa097b1so1051745e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 23 Feb 2024 04:06:28 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 oi8-20020a05621443c800b0068fb9bdd7absm2186266qvb.74.2024.02.23.04.06.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Feb 2024 04:06:27 -0800 (PST)
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
X-Inumbo-ID: f9657c30-d243-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708689988; x=1709294788; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sGVjziCIVDQTtjsVgjM5FvSGR0Kdkzwj0ZWP3aarH/A=;
        b=JcQoGMz5khAPiHpgWjvP23r8lOelqwUN7i7IluqSDaabbfjkFy8ChbBtP9rYhaBZj6
         B4zj7d85yaj9tDNNPBq9vORBRIGBw0GNzs8tuHekT18a3MiYaw+BrVav93E6+v++yZZ2
         mVl12iIVUEXRgQIIq51g9h67HsHV5IX6572OU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708689988; x=1709294788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sGVjziCIVDQTtjsVgjM5FvSGR0Kdkzwj0ZWP3aarH/A=;
        b=hgC5HXnYnmyd5KN0aygyjp9arE9jwzjWrI/8hKBlFBTLJWCKGxLoUPW25nihl7MjZF
         JxliSO8t+yliyL0U553/04fApVtY6ciRP6Hwi0kgLRecyEf9//jFZkoXwZRyFgbfHL7P
         AiOIO8YNbDQqvy0q4aM42EklwlSFcJZtOggxtr7MG6PKTOI9JNNkzcMsou9rflI7fnDT
         6ClRGi/3yM1uvakeDA1gr6IYTA8ZwtMRtgvWTbgkvjrA8mjaRU3Bi/74Edw/uEylOi+s
         48f8nDQSxxsfAusi1r3YwQeK00DOry2YwvQtJNHQQwymfJE8LzRy/NRytk3fhNQkL7Jv
         rNjg==
X-Gm-Message-State: AOJu0YzFt7zcluyt4/mVdmDluiw/kucQdWkbI5k9Dk7ZHzvERhVfaPPA
	hKuCMXJROxC7ywXBMr24UPlRKcnvY1om3ftnoYDopConM8HM3WiY0EGV8mbd3uWIKlff7XiocJS
	g
X-Google-Smtp-Source: AGHT+IFcLLC+oL9Adf9+8TDIGW+8rKQLVInW0WmgPPDKtHQfpV7bsa8+45vroPspfGJS4OhW6k3uWw==
X-Received: by 2002:a05:6512:32bb:b0:512:a7a1:147b with SMTP id q27-20020a05651232bb00b00512a7a1147bmr1213715lfe.63.1708689987842;
        Fri, 23 Feb 2024 04:06:27 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 0/3] x86/spec: improve command line parsing
Date: Fri, 23 Feb 2024 13:06:13 +0100
Message-ID: <20240223120616.73503-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

A couple of improvements for the spec-ctrl command line parsing, and one
bugfix for no_config_param().

Thanks, Roger.

Roger Pau Monne (3):
  xen/cmdline: fix printf format specifier in no_config_param()
  x86/spec: fix BRANCH_HARDEN option to only be set when build-enabled
  x86/spec: fix INDIRECT_THUNK option to only be set when build-enabled

 xen/arch/x86/spec_ctrl.c | 15 ++++++++++++++-
 xen/include/xen/param.h  |  2 +-
 2 files changed, 15 insertions(+), 2 deletions(-)

-- 
2.43.0


