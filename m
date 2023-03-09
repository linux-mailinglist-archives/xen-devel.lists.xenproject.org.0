Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A90A06B1EAA
	for <lists+xen-devel@lfdr.de>; Thu,  9 Mar 2023 09:51:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508182.782551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paBzX-0006qt-PP; Thu, 09 Mar 2023 08:51:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508182.782551; Thu, 09 Mar 2023 08:51:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paBzX-0006ns-MD; Thu, 09 Mar 2023 08:51:15 +0000
Received: by outflank-mailman (input) for mailman id 508182;
 Thu, 09 Mar 2023 08:51:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WFGn=7B=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1paBzW-0006nh-EU
 for xen-devel@lists.xen.org; Thu, 09 Mar 2023 08:51:14 +0000
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [2607:f8b0:4864:20::102d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 886bbb01-be57-11ed-87f5-c1b5be75604c;
 Thu, 09 Mar 2023 09:51:09 +0100 (CET)
Received: by mail-pj1-x102d.google.com with SMTP id l1so1472488pjt.2
 for <xen-devel@lists.xen.org>; Thu, 09 Mar 2023 00:51:08 -0800 (PST)
Received: from localhost ([122.172.83.155]) by smtp.gmail.com with ESMTPSA id
 nu14-20020a17090b1b0e00b002339195a47bsm1067154pjb.53.2023.03.09.00.51.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 00:51:06 -0800 (PST)
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
X-Inumbo-ID: 886bbb01-be57-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678351867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YtzXHGHMS64VogkrKd3Ei8P73aUrg9lW5cX1ATCVQYo=;
        b=eFOuzm8nD7a5HidSqF7eFTA1nvdUol1ji6xW6YQNmLzmVO7oLym7uEt/O8FALVrsrj
         FzGlJjpPSszYsxPfAC8PXdystVBhFyStdRVTiCArCS3CggGUweI2tlTOyMSQBYSRkcbw
         +UaYc1kRN5AU+H4rRcqssppbBmAOojcXwUJK1m7XOCCn2gW5xHw/gDnmt++tkFC1J7jg
         GKzpm1mPVnLWFhiknRcHxUlu3OUW1UPkZbfCAPQ+jQnUaW7AGcWGZ5399JShxvbT0AEf
         dvU+zvi5rRSvbOIkxyV+9cGwEskJG8HmsyNDAxavhak1+JB/Oq2eNJMI9On6emuN25mK
         fc2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678351867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YtzXHGHMS64VogkrKd3Ei8P73aUrg9lW5cX1ATCVQYo=;
        b=mNO9jUet/gTpTcKVkZQfuIon+sxBNA2Ymnv8Xjr6itHj9F8VrkbZCcNxlLaf83jQAy
         ODtRtKXJVDHBmXm70EWjy4ewZ1J2hV+wB802kqoXLqALpfU0S8yiIfc15iulTJe0aRHe
         uiyTtBq/klxL7cN12wt5UfU7q42PM4Dyk3HNY/2fVmSBs19Y9SIIS9tSN5AJU8Mq2WLF
         KdfWAtGYRbUyh279bdsuTSGs4rCZlYX0gs14zoebkv6jvAw6oP5SPCbmtsHnqY2AuPwC
         t86h+k/1b84Sh3xsOoSFV13bK+vJ5T8Mkfuz7uZVzT9EKCGuP3RBG9bPyXNc1T633mCS
         CVkA==
X-Gm-Message-State: AO0yUKXa3+0r7FOH08VTipdD94vIFEfLPQQT9vvDd/f5a7OD7Sg9BhVo
	ofe3BlGkzyZD0JfI0eZbVTroOQ==
X-Google-Smtp-Source: AK7set82c8nTI8LDr+yjMnggASdbq6ivX+wK6RPkhvCxpvT+V+TAj3Gj4shp7wy6TtmXW50qCtK/Eg==
X-Received: by 2002:a17:90b:4a4c:b0:237:9cc7:28a4 with SMTP id lb12-20020a17090b4a4c00b002379cc728a4mr22372080pjb.14.1678351867185;
        Thu, 09 Mar 2023 00:51:07 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: qemu-devel@nongnu.org,
	virtio-dev@lists.oasis-open.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Oleksandr Tyshchenko <olekstysh@gmail.com>,
	xen-devel@lists.xen.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Sebastien Boeuf <sebastien.boeuf@intel.com>,
	Liu Jiang <gerry@linux.alibaba.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [PATCH V3 0/2] qemu: vhost-user: Support Xen memory mapping quirks
Date: Thu,  9 Mar 2023 14:20:59 +0530
Message-Id: <cover.1678351495.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This patchset tries to update the vhost-user protocol to make it support special
memory mapping required in case of Xen hypervisor.

The first patch is mostly cleanup and second one introduces a new xen specific
feature.

V2->V3:
- Remove the extra message and instead update the memory regions to carry
  additional data.

- Drop the one region one mmap relationship and allow back-end to map only parts
  of a region at once, required for Xen grant mappings.

- Additional cleanup patch 1/2.

V1->V2:
- Make the custom mmap feature Xen specific, instead of being generic.
- Clearly define which memory regions are impacted by this change.
- Allow VHOST_USER_SET_XEN_MMAP to be called multiple times.
- Additional Bit(2) property in flags.

Viresh Kumar (2):
  docs: vhost-user: Define memory region separately
  docs: vhost-user: Add Xen specific memory mapping support

 docs/interop/vhost-user.rst | 60 ++++++++++++++++++++++++-------------
 1 file changed, 39 insertions(+), 21 deletions(-)

-- 
2.31.1.272.g89b43f80a514


