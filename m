Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39127A20976
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 12:18:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878410.1288589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcjbu-00010q-R5; Tue, 28 Jan 2025 11:18:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878410.1288589; Tue, 28 Jan 2025 11:18:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcjbu-0000z3-OG; Tue, 28 Jan 2025 11:18:26 +0000
Received: by outflank-mailman (input) for mailman id 878410;
 Tue, 28 Jan 2025 11:18:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=p3hs=UU=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tcjbt-0000yw-Fn
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 11:18:25 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95fdbe84-dd69-11ef-99a4-01e77a169b0f;
 Tue, 28 Jan 2025 12:18:23 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3862ca8e0bbso4802777f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jan 2025 03:18:23 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1764e9sm14028356f8f.17.2025.01.28.03.18.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 28 Jan 2025 03:18:22 -0800 (PST)
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
X-Inumbo-ID: 95fdbe84-dd69-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738063103; x=1738667903; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fT2SAbuvKPbKd3z1KkDvR/xDsz8I4RjNHLW+g3/uOgc=;
        b=f6nx3FfrGbWpBXuJorKeQpOVxAi3hfHNIR1OpCCZ1iCBskdNxQFKvozk/H6537En8S
         lGNIIhVjlY5Y/tEwVJnRAqyWbAdXLbAKwS7jMRsZf/3GfLh6qZ36TwOOWp5x3KDkv6of
         OGGe3X6PieWFc9RcLbo5vmbE0Dp+UZ4hXzvtCVh9OLVhaRSRCB2XKX/O71yw3FQG3oQf
         ZzSmHlIgs0DaZk5eMzihZqMF3XnJRsK5VYUTP241Ij+HDFPxMVOLqHOfFkFtHxTKfGqY
         V5kOhb0zN5EgOQdRVMSPFYY3Ndy0MrtOA6MORNPENGHByoyou8i4wIl840X6kTIPhJ8r
         z54g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738063103; x=1738667903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fT2SAbuvKPbKd3z1KkDvR/xDsz8I4RjNHLW+g3/uOgc=;
        b=AcnyTrl6wmDbz4NKP6OG/oAhiCHBlna/MO+PVkKUadaipM5nZyTQxpeObKVO9D1aMZ
         w3fSclelx3pyMy7aBZGsa8YWMztHm8gL7nRS9Zk4wk/ao91KxczUL7OB55qLlfN10hnc
         GBcAk8617EHIdTIeMdcw9gUFjVbznCE/g82Tw0vQ9JIXa12ayi60UhCxETv6TTrjwFNL
         ipWmqHabFkZuWBWJ+xVGaWA2drtQSoPDO2m24lbTPV3D9IxkdaFyiACBfgLTyR4h70xx
         lAFSoC+9yi+YfgqZukJU2JmJrchI21bf1dKr5YPHFig9EG7mt01VM0GH/cwJNE+TQOCH
         rEBg==
X-Gm-Message-State: AOJu0YyTPTLWfeKcX1pDH/Yct4zAGGKTROC0vmOZZ2xF8BADL0ICqcw+
	NGA0m4+IWLWSC/J+w2fwQ2/s2J7yLOym7Y+Nf1wrUJzG1CR0DvV7AEUIj77ik6M=
X-Gm-Gg: ASbGncuv/gg3abJLBTm3DMwPuvTBW5Nant0MbXQ8hQ0v5ED9cL6C9JJLds52Y4btbku
	SOhBaxdUnFe4CYtUosEwdf49HpwEV3HCz8DPiTqPYssPCzSFE7aoTFAhKanKky7zdYKfv54Ji+x
	42Z+oylDC1l+VOP9xhy1t4lS17+zhbZMWNr8HlO/SPfx5fKYVt66cP6mh/2QGN9mQncvWH48NSM
	I3907xe0xvMNnsXkK043pMGCMSi2lLzh0fmpTPZPs2ZyyW7f2MrcJIGf4gqtvCPJ9NF9PvvGkVe
	I7Ubnn55yC8tfhReaKjvNeFViPYKQ23VCrMUKk0g6KCvH7oD1E8LJWUc+IQboDQGUA==
X-Google-Smtp-Source: AGHT+IH+qdHcEoJcFpOtnVud1J3WbJAaKIWKl6fv7LCSJoOys54P6jRa3uzMWf61KKffEYTlHNPhxw==
X-Received: by 2002:a05:6000:2a9:b0:38a:50f7:24fa with SMTP id ffacd0b85a97d-38bf57bed8emr46915786f8f.54.1738063102960;
        Tue, 28 Jan 2025 03:18:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	Markus Armbruster <armbru@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	Bernhard Beschow <shentey@gmail.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/2] tests/qtest: Make qtest_has_accel() generic
Date: Tue, 28 Jan 2025 12:18:19 +0100
Message-ID: <20250128111821.93767-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

In preparation of running QTests using HVF on Darwin,
make qtest_has_accel() generic.

Note, this also allow running other accelerators such
Xen, WHPX, ...

Philippe Mathieu-Daudé (2):
  tests/qtest: Extract qtest_qom_has_concrete_type() helper
  tests/qtest: Make qtest_has_accel() generic

 tests/qtest/libqtest.c | 110 +++++++++++++++++++++++------------------
 1 file changed, 61 insertions(+), 49 deletions(-)

-- 
2.47.1


