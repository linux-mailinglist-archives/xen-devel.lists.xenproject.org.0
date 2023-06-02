Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A716D71F9C1
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 07:50:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542924.847362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4xfJ-0004ht-Ep; Fri, 02 Jun 2023 05:49:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542924.847362; Fri, 02 Jun 2023 05:49:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4xfJ-0004gC-Bq; Fri, 02 Jun 2023 05:49:33 +0000
Received: by outflank-mailman (input) for mailman id 542924;
 Fri, 02 Jun 2023 05:49:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dv8B=BW=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1q4xfH-0004g6-7E
 for xen-devel@lists.xen.org; Fri, 02 Jun 2023 05:49:31 +0000
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [2001:4860:4864:20::2d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d2a5762-0109-11ee-b231-6b7b168915f2;
 Fri, 02 Jun 2023 07:49:29 +0200 (CEST)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1a28de15c8aso894255fac.2
 for <xen-devel@lists.xen.org>; Thu, 01 Jun 2023 22:49:29 -0700 (PDT)
Received: from localhost ([122.172.87.195]) by smtp.gmail.com with ESMTPSA id
 8-20020a17090a01c800b00252d960a8dfsm2448941pjd.16.2023.06.01.22.49.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jun 2023 22:49:27 -0700 (PDT)
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
X-Inumbo-ID: 3d2a5762-0109-11ee-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685684968; x=1688276968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4K0r0XR0o3cnSWZBLDTXJCeNa3krDTyt7mTDT7eZkck=;
        b=uweqPSkV9aGVeWrONeFiZM3V09yrKG9ExeFmXyv4lli2j6/ACV+0a4qvS82Qnzoj58
         lOQvR2igTTeI+dlINkURAxIoeCiypqp9S1UHr0PA7fkg5UsGW7n55Vyr0n5QNwXCDXq9
         KVRt/pGizw63GjxwnVFp+kvLzBP7/1WQ1tAKIvdQ9xVVc2p7VpFlEq90u+x8yYB6H/zF
         Oi5ZcbuqyOcU5654Lc6ZX+QH2YekFc91Jt0ckMDWphFgl2XLm2edEXIawqZtUGc55j1+
         YeeNXPvSCswEvP+7WJIbW+gugvdvl9Vfe9rRQgHyCf3p5phSL/sSzwWHHL8R/6yqzcVT
         dZ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685684968; x=1688276968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4K0r0XR0o3cnSWZBLDTXJCeNa3krDTyt7mTDT7eZkck=;
        b=WmiQ2y2+k8dO07wvOE75CkPx26jKLtNby132swoa+Nq5sGevt177KeY0X6AoGDLWOk
         304gS9OCn/IJr74VCyK492oix2za4d3FU2VHx7oeShXid1CpsgbD7alHyULZPMANXDDH
         sNfBRNwg6SsocGmV7g7rM2fJQrzmamP4haI6lCo7uUEqu9sX8BBPOV3f0buJCncC6TLJ
         oqiqgWli3MU9EFODl0maxZwaATNZcFIT55451QAAwdgNGJ/VBUizfCaIVel5PlkjRyQ9
         LQOud71mzdoEVIahh8BFjoLdS65kx5n8RPiAPCVzUcXq1VRPqTBz6kho5rwx9E433vjV
         WaSg==
X-Gm-Message-State: AC+VfDx4tsFJ36gqwY1drM3bFw1MDTzDwE+N9rYpK94qKNpGacXt/aA5
	9zIaWtk/rPj+pPQ5tDiBApGouFrFf3G6cs+9WSQ=
X-Google-Smtp-Source: ACHHUZ4Zt6mDj15xRYT94E8pbmJzrDzQNwFKIIRWE7cYdDVmA3Lc3RkdVLLhDQJtmZdEuCFMxRIwWQ==
X-Received: by 2002:a05:6358:5906:b0:127:82ef:1779 with SMTP id g6-20020a056358590600b0012782ef1779mr8082964rwf.30.1685684968241;
        Thu, 01 Jun 2023 22:49:28 -0700 (PDT)
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
	Erik Schilling <erik.schilling@linaro.org>
Subject: [PATCH V3 0/3] libxl: Make grants configurable for virtio devices
Date: Fri,  2 Jun 2023 11:19:06 +0530
Message-Id: <cover.1685684586.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This patchset intends to make grant mapping usage configurable for virtio
devices. Currently they are forced enabled for backends running on non-Dom0
domains. This patchset adds a new `grant_usage` parameter for the virtio
devices, which can be used to enable or disable grant mappings irrespective of
the backend domain, while still preserving the default behavior in absence of a
parameter.

V2->V3:
- Patch 2/3 is new and fixes ordering issues with default values.
- Reuse `libxl_defbool` instead of defining a new type, it can take values 0 and
  1.
- Improved commit logs and comments.

V1->V2:
- Instead of just 0 or 1, the argument can take multiple values now and control
  the functionality in a better way.

- Update .gen.go files as well.

- Don't add nodes under frontend path.

Viresh Kumar (3):
  libxl: virtio: Remove unused frontend nodes
  libxl: Call libxl__virtio_devtype.set_default() early enough
  libxl: arm: Add grant_usage parameter for virtio devices

 docs/man/xl.cfg.5.pod.in             |  8 +++++++
 tools/golang/xenlight/helpers.gen.go |  6 +++++
 tools/golang/xenlight/types.gen.go   |  1 +
 tools/libs/light/libxl_arm.c         | 22 +++++++++++--------
 tools/libs/light/libxl_create.c      | 11 +++++++++-
 tools/libs/light/libxl_types.idl     |  1 +
 tools/libs/light/libxl_virtio.c      | 33 ++++++++++++++++++++++------
 tools/xl/xl_parse.c                  |  2 ++
 8 files changed, 67 insertions(+), 17 deletions(-)

-- 
2.31.1.272.g89b43f80a514


