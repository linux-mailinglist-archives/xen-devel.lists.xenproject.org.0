Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A1D9E1A76
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 12:13:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847954.1262980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIQq1-00085c-4Q; Tue, 03 Dec 2024 11:13:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847954.1262980; Tue, 03 Dec 2024 11:13:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIQq1-000848-1o; Tue, 03 Dec 2024 11:13:05 +0000
Received: by outflank-mailman (input) for mailman id 847954;
 Tue, 03 Dec 2024 11:13:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cRMW=S4=cloud.com=bernhard.kaindl@srs-se1.protection.inumbo.net>)
 id 1tIQpz-000842-QT
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 11:13:03 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f465404-b167-11ef-99a3-01e77a169b0f;
 Tue, 03 Dec 2024 12:13:01 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-53df6322ea7so9229514e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Dec 2024 03:13:01 -0800 (PST)
Received: from localhost ([185.68.248.203]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5998e6a3fsm604818866b.119.2024.12.03.03.13.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 03:13:00 -0800 (PST)
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
X-Inumbo-ID: 8f465404-b167-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1733224381; x=1733829181; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1Brczf+jm2PjfF/d6A12kdSlpJIrCxg0ukV1D8qw93M=;
        b=MAExyqAQcbsRqrmdE5X8t9VzI+9i72STsg/2QZ2isAlYla0zjcc0cGcC0FTCV5TjM9
         IUsrFk2R0H5Dr8R49lazl4ZTOwY/f+yN8Abv8UkolydS+nf6tc670IfYe05Bhpo7PABf
         0W5Vtg9pLBXXZLtHANQbDJxyNYbbUiVD+KOl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733224381; x=1733829181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Brczf+jm2PjfF/d6A12kdSlpJIrCxg0ukV1D8qw93M=;
        b=QkLcJl1nAuld8+IhjHIQp1CH6mX71knURBOfH1tM3OTMHO9oDGo1gEo5iHsOD0rkjL
         0fDSUNkqGJH21t6wTcXJuym/7x+gLKnjDTLrldXXF1PxwyesLscmZix38qhT0Y1D2QxR
         IoGXAEHABlIzaE9jQ47fSjZ1d0oQyu7d8NrVHMgHLwgGC3MQhFdASCX7Jylk60CyzmJN
         c/qoGvN+LT5Ibdibm5xbgX5TDFWwIJWNpDjyzMCrvbfRLT7GBfufQSVxcxMo9y+Lg3N8
         CtfTX/5R0CsUfIIPL3haApZB1mRzzLkl+LeHv66o7iivDyOfZmhcZsSzLs5fTREB8BUL
         8PjA==
X-Gm-Message-State: AOJu0YwkU2rkV++5A73W0BgPFWTUJ9HR0Rh7qTITmtEMLNfxbJk62xvv
	f/RcQFee1Uj2Wut6OJs32x0WLnKxe9twcan35xAMeav+yMRXAceikoF51iPAKDD4/jF1V8WR0sa
	fSLo=
X-Gm-Gg: ASbGncshICLM6YwCKnb4czM4iRYrUkJfOl1VrIrrV9luRgpXMmbWlM+f2zYYFlvJEMa
	1nYmdV5ES0XguoJxuaLqYOyyeAzwWmzeX5Xpkn6HUWOEJHiYSpGUhr5ZMtEwb8Rxd/Be4uYcg8w
	LYr9VMKb7lgGqCWujWh28h0/Xxt6LsG3ClL2Mn1qm+yS6G7sjlwXaSjkXRdNtw1J3i6IaCSc/Af
	nL+UznZGSe2QJtjEKjxKqvtwQ+/NgCQnw5zL+qHmuGU8Li1URilsQM=
X-Google-Smtp-Source: AGHT+IHLdK3NEMZBnYwxf68XeNDzEpzC8BNv3KJy82w58kTvJlGRhVYiBQTis/kYvEDtHN9aU2tzXA==
X-Received: by 2002:a05:6512:3d89:b0:53d:ed19:d25a with SMTP id 2adb3069b0e04-53e12a06d4dmr2013707e87.32.1733224380852;
        Tue, 03 Dec 2024 03:13:00 -0800 (PST)
From: Bernhard Kaindl <bernhard.kaindl@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Bernhard Kaindl <bernhard.kaindl@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFC PATCH] SYSCTL_numainfo.memsize: Switch spanned to present memory
Date: Tue,  3 Dec 2024 12:12:56 +0100
Message-ID: <10466e8c29b5f69774915bcf6562985c75e98bb7.1733224306.git.bernhard.kaindl@cloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This the 2nd part of my submission to fix the NUMA node memsize
retured in xen_sysctl_meminfo[].memsize by the XEN_SYSCTL_numainfo
hypercall to not count MMIO memory holes etc but only memory pages.

For this, we introduced NODE_DATA->node_present_pages as a prereq.
With the prereq merged in master, I send this 2nd part for review:

This RFC is for changing the value of xen_sysctl_meminfo[]->memsize
from NODE_DATA->node_spanned_pages << PAGE_SHIFT
  to NODE_DATA->node_present_pages << PAGE_SHIFT
for returing total present NUMA node memory instead of spanned range.

Sample of struct xen_sysctl_meminfo[].* as presented by in xl info -n:

xl info -n:
[...]
node:    memsize    memfree    distances
   0:  -> 67584 <-   60672      10,21
   1:     65536      60958      21,10

The -> memsize <- marked here is the value that we'd like to fix:
The current value based node_spanned_pages is often 2TB too large.

We're currently not using these often false memsize values in XenServer
according to my code review and and Andrew seemed to confirm this as well.

I think that the same is likely true for other Xen toolstacks, but of course
to review this change or propose an alternaive is the purpose of this RFC.

Thanks,
Bernhard

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@cloud.com>
---
 xen/common/sysctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index d02f44fe3a..cba6d3cfea 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -316,7 +316,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
                 {
                     if ( node_online(i) )
                     {
-                        meminfo.memsize = node_spanned_pages(i) << PAGE_SHIFT;
+                        meminfo.memsize = node_present_pages(i) << PAGE_SHIFT;
                         meminfo.memfree = avail_node_heap_pages(i) << PAGE_SHIFT;
                     }
                     else
--
2.43.0

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@cloud.com>
---
 xen/common/sysctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index d02f44fe3a..cba6d3cfea 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -316,7 +316,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
                 {
                     if ( node_online(i) )
                     {
-                        meminfo.memsize = node_spanned_pages(i) << PAGE_SHIFT;
+                        meminfo.memsize = node_present_pages(i) << PAGE_SHIFT;
                         meminfo.memfree = avail_node_heap_pages(i) << PAGE_SHIFT;
                     }
                     else
-- 
2.43.0


