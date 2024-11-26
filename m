Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E999D949B
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 10:36:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843435.1259050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFryv-0005oW-Pg; Tue, 26 Nov 2024 09:35:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843435.1259050; Tue, 26 Nov 2024 09:35:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFryv-0005lW-MK; Tue, 26 Nov 2024 09:35:41 +0000
Received: by outflank-mailman (input) for mailman id 843435;
 Tue, 26 Nov 2024 09:35:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lwvg=SV=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tFryt-0005lG-H5
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 09:35:39 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9a7a83d-abd9-11ef-99a3-01e77a169b0f;
 Tue, 26 Nov 2024 10:35:35 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5cfcd99846fso6894886a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2024 01:35:35 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d01d3a3451sm4950474a12.4.2024.11.26.01.35.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2024 01:35:33 -0800 (PST)
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
X-Inumbo-ID: c9a7a83d-abd9-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmUiLCJoZWxvIjoibWFpbC1lZDEteDUyZS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImM5YTdhODNkLWFiZDktMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNjEzNzM1LjI4MzU5LCJzZW5kZXIiOiJyb2dlci5wYXVAY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732613734; x=1733218534; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y+amtlMYsFXYHlssVX8JGA/2tl2HvFED7FxYw1wvRYk=;
        b=G8sFKWlVuNbLC8b2I8BoLwXBh/cl20heQ8hZsgCP2vVb4t/gHHbKPUF3rcBLHz/r5W
         rviUxchjMn94RKqQNdfwG/8bo3DmvvpeNU3UDnDp+lXaUAHhPjnlCVqhPzvCRXgnTQrI
         MBt7nyE23Opkp0P77bQMqAo9rJpwvOx7Kb6b0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732613734; x=1733218534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y+amtlMYsFXYHlssVX8JGA/2tl2HvFED7FxYw1wvRYk=;
        b=dow0DTg4TLO38SwgWghpnOd++sbgMBBzixoPM8FUQ9fRkmtxFfApI4vSNFuYhfUyuy
         qwedTHF8GiznpJKgHRw20lNS9AKiu6Uab74taBPFZjLYBbX+Ty3PQvWG+r4TyCTnN+Yu
         AuE/nPDpq8xVgDJzMiP8Zq8cC+RHkPTR5rDJvT29vM8MjywimqE1xNTVfrv47KmfEQ5M
         UAaT+qX4T20z2wCatzOUMEbSb4gLQyrr8T8hMS6Hh/F9IWJACoOu/2XSTPGY05mcIFaq
         IbhyPfpkpvPrZvTV4x0+YYcl0HDJ0ak+DSicAPR33pE7wbth+/oJ6dxCXN5bMekm6oT/
         qEdA==
X-Gm-Message-State: AOJu0YxNQoraTfyKzPfVQhhXHJCiEjnOYPLEyC11ciKLpLyjvnL/Pfu/
	/Ye06WJqc6Ao8utbBPSp2cj3JxweLoOazh64Qcek3go/TfbJCNjsh8XX1lchX6M6WzIpp3HVyuv
	V
X-Gm-Gg: ASbGncvFNmf6EqwOz8e0NdS7Zv0GtTFaQzLzGogTJdYtxt1ukieAZLky7Qo8EbB1H8p
	ima7VCEGaot0SN016orjpq6fSKr0mEzAKsQASdOgdvgZBNi+EEoQB1bGJ4EyTaQlnw+He5uTQhz
	1UMbDjH8ZwXfdWIPgUU/rohmNog2WRzqwtyIzLFt0UdkZQhB4X+OU5c8OiT6Zsedi3QIVbvRoBJ
	8HgkA5TM6WDu262GveSBZsNGZbWf2ze4eXvUaLpUiwFouLIYhjpT3KRd9g=
X-Google-Smtp-Source: AGHT+IFfPWgbrcF0H5EM02nXKb0tvkpJyye/cEQv1920pPrwYljVo31KV5CxY5Dnt6a22BUI4OakYQ==
X-Received: by 2002:a05:6402:2353:b0:5cf:d1b5:1b91 with SMTP id 4fb4d7f45d1cf-5d020625987mr14778146a12.15.1732613734317;
        Tue, 26 Nov 2024 01:35:34 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 0/2] x86/misra: fix remaining violation of rule 20.7
Date: Tue, 26 Nov 2024 10:35:06 +0100
Message-ID: <20241126093508.6966-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

This series fixes the remaining violation of rule 20.7, and marks the
rule a blocking for x86 also on the Eclair scan.

An example gitlab job with the rule enabled can be seen at:

https://gitlab.com/xen-project/people/royger/xen/-/jobs/8470641011

Thanks, Roger.

Roger Pau Monne (2):
  x86/uaccess: rework user access speculative harden guards
  automation/eclair: make Misra rule 20.7 blocking for x86 also

 automation/eclair_analysis/ECLAIR/tagging.ecl |  3 +-
 xen/arch/x86/include/asm/uaccess.h            | 45 +++++++++----------
 xen/arch/x86/usercopy.c                       | 26 +++++------
 3 files changed, 37 insertions(+), 37 deletions(-)

-- 
2.46.0


