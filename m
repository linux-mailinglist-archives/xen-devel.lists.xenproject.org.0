Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D976D5E78B7
	for <lists+xen-devel@lfdr.de>; Fri, 23 Sep 2022 12:51:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410705.653832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obgH6-0007EY-PI; Fri, 23 Sep 2022 10:51:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410705.653832; Fri, 23 Sep 2022 10:51:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obgH6-0007BT-Mj; Fri, 23 Sep 2022 10:51:16 +0000
Received: by outflank-mailman (input) for mailman id 410705;
 Fri, 23 Sep 2022 10:51:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LNbl=Z2=gmail.com=matiasevara@srs-se1.protection.inumbo.net>)
 id 1obgH5-0007BN-GT
 for xen-devel@lists.xenproject.org; Fri, 23 Sep 2022 10:51:15 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a276ed89-3b2d-11ed-9374-c1cf23e5d27e;
 Fri, 23 Sep 2022 12:51:10 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id g3so19750383wrq.13
 for <xen-devel@lists.xenproject.org>; Fri, 23 Sep 2022 03:51:14 -0700 (PDT)
Received: from horizon ([2a01:e0a:19f:35f0:dde5:d55a:20f5:7ef5])
 by smtp.gmail.com with ESMTPSA id
 o41-20020a05600c512900b003a5c244fc13sm2284917wms.2.2022.09.23.03.51.12
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 03:51:12 -0700 (PDT)
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
X-Inumbo-ID: a276ed89-3b2d-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date;
        bh=ePAqBWVCbNIh2fW7ZvyICalrFQoKNjGDm/4R3uj8Qbs=;
        b=IUO3AQRwDtsUYvHOB7m7YWA00NaXtnYRAewsB8wJGFYfCHm9P7GtS9JU7PuRCgQWeC
         xsj7EFPCUSGvZzl5Y5YgTZUsaaYW5kbDzwSbEZhZDnL589jaih2uhPPIWeYxJFxV4jxu
         CDOPyD0vBmDUfucYmZH4mMw1uzbk694OEqKTz9ZqlQPQJqsHRQ6GP+4yWxCIghRUfxM3
         hFgv890lgo4EYTEK5xvxTaxBRliYZRKV6hmlSkRXl9NKYVhPqwnAWlKpVrpe3HCdhdx5
         UEO0LebD15Kyj9714LdwDzZkpG+ZFV8w5+WfVmibOpiuOPsH3JmB3iIRBNsVaC7qWLwr
         vgFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=ePAqBWVCbNIh2fW7ZvyICalrFQoKNjGDm/4R3uj8Qbs=;
        b=7ej8/VgRkLnaaFtlLoHWflY2crHLzq3hHRjr1l/qh2YoqLghC0HqldqCD03XZwSBZz
         y+VQi3Rj38aLafOJ7jF4nzDJ+qP62aF/ub/BhUCTtY44dZbhx2R0w70+NobDKxGT7Uf1
         CsqS9T+5UDrupNxF8EFZ/QzwUFcmmAH3nkTxZxQvZjirCPvMNOSgV7zMhIkQRZYGFLWI
         klzCILIjYz1b8KjwqJp8Tv7ybiEhIj9HDwd6oFwkiJ/WywiDGYxbBQDhwr7rlKSYS7u0
         SSNH3G/K8TdNhAiS0W3dztVDIBMk58hbvhHjUVFg0mrEl/HYRwWVb1qyL8VElU9/CViH
         5Trg==
X-Gm-Message-State: ACrzQf0mejGpUeMEe9HQXHhKHutQdptJAhJ0CQTva/Z/z3RPwrreoWqJ
	KPSSXohNH3Yg9unfSidUYckGtyxWiDYGKYML
X-Google-Smtp-Source: AMsMyM5hD/vhhdM7DveEBMtckkoBllUgQ4Qpj+hVpK72YTUJl8FcqJi/z8WX+uhqw8RegXRp9UqZZA==
X-Received: by 2002:a05:6000:887:b0:21e:24a0:f302 with SMTP id ca7-20020a056000088700b0021e24a0f302mr4622829wrb.466.1663930273445;
        Fri, 23 Sep 2022 03:51:13 -0700 (PDT)
Date: Fri, 23 Sep 2022 12:51:11 +0200
From: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: Design session "Using the new VCPU counters in XAPI"
Message-ID: <20220923105111.GA647305@horizon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Participants: Pau, Edwin, Matias

- the semantics of the new interface for querying registers is now async, this would require a initialization phase in xcp-rrdd before query the counters.
- why this https://github.com/xenserver/xen.pg/blob/XS-8.2.x/master/mixed-domain-runstates.patch is not up-streamed?
- we need to implement a protocol to ensure consistency between producer(hypervisor) and consumer(user-space)
- we can get inspiration from in xen/arch/x86/time.c:__update_vcpu_system_time(). This relies on version_update_begin() and version_update_end()
- get inspiration from the comment at public/xen.h in the struct vcpu_time_info{} in which a version number is used
- get inspiration from arch/x86/time.c:read_xen_timer()
- we need something in user-space that relies on the same mechanism, i.e., get a consistent value if version number is the same before and after reading the structure.
- add bindings for acquiere resource see https://github.com/xapi-project/xen-api/blob/master/ocaml/xenopsd/c_stubs/xenctrlext_stubs.c#L460)
- also get inspiration from 2529c85
- we cannot find where is the implementation of this protocol in user-space. Xenctrl should implement it somewhere

