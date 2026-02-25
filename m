Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KONtJxWFnmmGVwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 06:13:57 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41160191D90
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 06:13:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1240362.1541777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vv7Cx-0000lx-Dq; Wed, 25 Feb 2026 05:13:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240362.1541777; Wed, 25 Feb 2026 05:13:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vv7Cx-0000il-7O; Wed, 25 Feb 2026 05:13:11 +0000
Received: by outflank-mailman (input) for mailman id 1240362;
 Wed, 25 Feb 2026 05:13:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MQeS=A5=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1vv7Cu-0000if-T7
 for xen-devel@lists.xenproject.org; Wed, 25 Feb 2026 05:13:08 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab1c2cbe-1208-11f1-b164-2bf370ae4941;
 Wed, 25 Feb 2026 06:13:06 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-483770e0b25so55721565e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Feb 2026 21:13:06 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd750701sm46374715e9.11.2026.02.24.21.13.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 24 Feb 2026 21:13:05 -0800 (PST)
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
X-Inumbo-ID: ab1c2cbe-1208-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771996386; x=1772601186; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j0v0q58T93WLY+QFmTAFfQHATj0wMqCjYTuLixMjNSE=;
        b=n6d+QnCVc4gFYa/B3eyCzHFnO0bCfL3nm+dr4RoTGW+x1g9t4UZU5SCvpkzZnMc7J0
         BFwt1l4yjMHV6EaNV/1IMgelGAztNZBYWr4qR8cZETZBvh7qxSKKKjN4fYamLWUWU5/U
         CQ2hitAiurNV7ypUsNnXrhGncGLg8RHE8kP031aTeoSIkV1R2hOSg6UbsNeeA5A9JKzy
         hlvmpcF0CeA9G5n51ih1fTDR+MS8NmM+kLJBbi+Xnt/qYIjUAHHflx0h+0pbRoPCKCuS
         +eQe+UdoW7TFXCHBhrsLH6BbF27jsypYZ6IKM9U1dzgyUHRp0eMBQv3fcn+6oaF3tQXf
         tZvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771996386; x=1772601186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j0v0q58T93WLY+QFmTAFfQHATj0wMqCjYTuLixMjNSE=;
        b=GPuBRa+j7/LL1S2p8kWPmELYUEKHxUlp+gHVr4C7Z2F2PX87hLD91aV6gMOE2vYeoI
         J89RoX+gwq2wdGo+xB/Qo3Xc3hjDtDtkIC/7QmezE/UzUM9r3Udl9jfi/+fRp44LrZ75
         Jo5y/rRRh8MZB3+a+8OKBOV7Xoh4bYHU6mLZoJaHtWs3B2V3rjbpol+IbmqHqxAZnBA/
         23aOXbRr1Mb2RS3Cj09PEMFO2CCIWIsDTxJzZn6M3CjM+lUF7k+ZOjuSnYG1DtEwhlWN
         WstiF3q7DzC5yq/cXgAirpIt7pev74PjZpl+e1TDlScba/1bod0hZJIq5pxg3zGrH15y
         wvZA==
X-Forwarded-Encrypted: i=1; AJvYcCUcYw/66L0tcZ/R//gJvbarD7bNPiziboavbTVq3o+sVVyhvxcKjt/4BlOc96uzeX0yBBqSLl/TXhA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yws7kGRleOtfwRwBvjZVFbgqyXccELvazuc1I1swKN1/XQEuMj7
	saPfJaYd4wwVUWuFMryNynTK/l1t1NqC3XLS/gEfbfXpW0AWsiyWK+ihR2K8K5AqU/Y=
X-Gm-Gg: ATEYQzwuivzJvYfZlxUcAm4uV9KdDj9bXoX9qxQWBwqpNldyGbAK1d1j8wOBLV0O+H9
	ilTjpZ6sq7i8Ixo6DEcjjZOa4gwC3ahiNv0JVvVa8Y+lMsbDW+A2aoXZHgGQw6seudi1Q0g7BGA
	IhW8QInzIizeVdL32zuRXxtt1etXj3DTXdTp8SDf/dTYiEayQ4mzSOYn6PFwoyayyEXwVtTYIbR
	JWsD8UsJdFh2MkHCgeRSze91TR6GjLiEUpI+R+6JMmGDJyLMLkMHAXd/02MjBPwxE2uToVWPxMx
	wNcKRMFtpb2kpWasX3CmofVoucpzlz6iF3pEBHv9KWgbl7RUiI1yVpHN6/prh04wUsRyws8TgNp
	ETAFyx2LNpm6Ap4xZbQTt4p4fSusOKiAZMCMDy6ehgHBi4bVXmVM/WgswksPoabffIukRR5yls+
	yrSXVYr2jp2PSQnRJarWHNtLF4ButZhcgBx4Px3zMbNoScHdClRfNMvhsqRtsfYX/2AhfsC6kc
X-Received: by 2002:a05:600c:4fd3:b0:47e:e20e:bb9c with SMTP id 5b1f17b1804b1-483a95fb0a0mr214322895e9.8.1771996386044;
        Tue, 24 Feb 2026 21:13:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/5] accel: Try to build without target-specific knowledge
Date: Wed, 25 Feb 2026 06:12:58 +0100
Message-ID: <20260225051303.91614-1-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:qemu-devel@nongnu.org,m:kvm@vger.kernel.org,m:pierrick.bouvier@linaro.org,m:pbonzini@redhat.com,m:xen-devel@lists.xenproject.org,m:philmd@linaro.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[philmd@linaro.org,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[philmd@linaro.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 41160191D90
X-Rspamd-Action: no action

Code in accel/ aims to be target-agnostic. Not all accelerators
are ready for that, but start by enforcing a few easy ones.

Philippe Mathieu-Daudé (5):
  accel/kvm: Include missing 'exec/cpu-common.h' header
  accel/mshv: Forward-declare mshv_root_hvcall structure
  accel/mshv: Build without target-specific knowledge
  accel/hvf: Build without target-specific knowledge
  accel/xen: Build without target-specific knowledge

 include/system/mshv_int.h | 5 ++---
 accel/kvm/kvm-accel-ops.c | 1 +
 accel/mshv/mshv-all.c     | 2 +-
 accel/hvf/meson.build     | 5 +----
 accel/mshv/meson.build    | 5 +----
 accel/xen/meson.build     | 2 +-
 6 files changed, 7 insertions(+), 13 deletions(-)

-- 
2.52.0


