Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B09E16D9227
	for <lists+xen-devel@lfdr.de>; Thu,  6 Apr 2023 10:58:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518775.805620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkLRv-0003sJ-Kb; Thu, 06 Apr 2023 08:58:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518775.805620; Thu, 06 Apr 2023 08:58:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkLRv-0003p9-Hl; Thu, 06 Apr 2023 08:58:31 +0000
Received: by outflank-mailman (input) for mailman id 518775;
 Thu, 06 Apr 2023 08:58:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ozA9=75=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1pkLRu-0003p3-7w
 for xen-devel@lists.xen.org; Thu, 06 Apr 2023 08:58:30 +0000
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [2607:f8b0:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 304a2780-d459-11ed-b464-930f4c7d94ae;
 Thu, 06 Apr 2023 10:58:26 +0200 (CEST)
Received: by mail-pl1-x62d.google.com with SMTP id ix20so36940117plb.3
 for <xen-devel@lists.xen.org>; Thu, 06 Apr 2023 01:58:25 -0700 (PDT)
Received: from localhost ([122.172.85.8]) by smtp.gmail.com with ESMTPSA id
 f8-20020a170902860800b001a1adbe215asm904655plo.142.2023.04.06.01.58.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 01:58:22 -0700 (PDT)
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
X-Inumbo-ID: 304a2780-d459-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680771504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DEQiq5V6EhExtdzg7l+GGgGWzMI4MYV9sltCbuia9S8=;
        b=DqZf+45MshOs1nlVyinOhqFrKCuzw0gQlsLOP0ABgx6laBf7Pg+beSuaze8QVVfghR
         awdDutM8sqXBsgP+BXTWzNrINKIlxL9iBKaOC6FIfHodelL7FbNSBDgVYjhwvLKOgE5m
         MdjjBz40SWhgR+pdZt5+jIRFtwB9GjMGosHqmqyaRwzYl/f1JBuTl1aMIqxNxdBI9KHf
         zicgU3cKtHZbiUWCVP2oqG6BYFOJGaCiOczU/tO9FR/zPQr/Xvr7opcZkYDOOoS4h7PS
         iQfhUMh6M2zx9Qn2jzsUzYLyunaEwrK0rd1FhMpQJRTeuVUHLGXqkeJrdlGtH/t/RBDy
         5U7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680771504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DEQiq5V6EhExtdzg7l+GGgGWzMI4MYV9sltCbuia9S8=;
        b=VnPy/njpmlu+i3yzYGBra32JD7STFd7O+TZPEwsAD91nD84kQB3vuNVkx929KUxpYB
         bG3cbUt53eDvw1JmQ5rFFTWRS0aoNPBPTTJ1TxerJn5LVKYT7JSRpJYlDLakdIj/KqIb
         YAqwF30DS1qPucvs0A61m/tRiKb4zLHkEZMsL4/lhptcR4ygQHQsnLfmc9rEiIguGCVa
         TqapjUmyTqHJ7DH6q/dRAqTsORxSlMQ4viKwjP+gu54ASlQFUIu+FwbqJaxkgBZvsVdN
         nzsj9lYPRvIw4Q6ZBjpj6KeMUQh3TXrS+zVwB5dSIJxYxOy8AnWMJFuWPBzxxGIuCD2y
         XMVg==
X-Gm-Message-State: AAQBX9d1iJ5bnqB/FBUhJ77brRGKdW0E/Sru9nzIZhiUhPxWoJuamnc0
	rILMSPNqqjIiz+8iAqE/aJLFQaK7ONAXOf45zFc=
X-Google-Smtp-Source: AKy350YftpXWO2PU4R2xgveFOOV/hWCgUBa/eRONakgCC5lW+aSPlmCOp88OEaOYp2Sq6SUnduQGYA==
X-Received: by 2002:a17:902:f986:b0:1a2:85f0:e73d with SMTP id ky6-20020a170902f98600b001a285f0e73dmr8431947plb.33.1680771503940;
        Thu, 06 Apr 2023 01:58:23 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: xen-devel@lists.xen.org,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>,
	Erik Schilling <erik.schilling@linaro.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH V3 1/2] docs: Allow generic virtio device types to contain device-id
Date: Thu,  6 Apr 2023 14:28:17 +0530
Message-Id: <18458fa39433ce4ac950a0a20cc64da93db0b03a.1680771422.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For generic virtio devices, where we don't need to add compatible or
other special DT properties, the type field is set to "virtio,device".

But this misses the case where the user sets the type with a valid
virtio device id as well, like "virtio,device1a" for file system device.
The complete list of virtio device ids is mentioned here:

https://docs.oasis-open.org/virtio/virtio/v1.2/cs01/virtio-v1.2-cs01.html#x1-2160005

Update documentation to support that as well.

Fixes: dd54ea500be8 ("docs: add documentation for generic virtio devices")
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
V2->V3:
- Updated commit log and clarified / fixed doc.
- Tag from Oleksandr.

 docs/man/xl.cfg.5.pod.in | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 10f37990be57..24ac92718288 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -1608,8 +1608,11 @@ example, "type=virtio,device22" for the I2C device, whose device-tree binding is
 
 L<https://www.kernel.org/doc/Documentation/devicetree/bindings/i2c/i2c-virtio.yaml>
 
-For generic virtio devices, where we don't need to set special or compatible
-properties in the Device Tree, the type field must be set to "virtio,device".
+For other generic virtio devices, where we don't need to set special or
+compatible properties in the Device Tree, the type field must be set to
+"virtio,device" or "virtio,device<N>", where "N" is the virtio device id in
+hexadecimal format, without the "0x" prefix and all in lower case, like
+"virtio,device1a" for the file system device.
 
 =item B<transport=STRING>
 
-- 
2.31.1.272.g89b43f80a514


