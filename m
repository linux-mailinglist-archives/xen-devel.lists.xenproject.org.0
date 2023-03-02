Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7876A865C
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 17:31:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505233.777875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXlpx-0001IS-8Y; Thu, 02 Mar 2023 16:31:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505233.777875; Thu, 02 Mar 2023 16:31:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXlpx-0001F3-4r; Thu, 02 Mar 2023 16:31:21 +0000
Received: by outflank-mailman (input) for mailman id 505233;
 Thu, 02 Mar 2023 16:31:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RuGR=62=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1pXlpv-0001EZ-Gx
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 16:31:19 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7f51748-b917-11ed-96ad-2f268f93b82a;
 Thu, 02 Mar 2023 17:31:18 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-108-FfzftseYMeyd-EeORqC0WQ-1; Thu, 02 Mar 2023 11:31:11 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C87A18E0044;
 Thu,  2 Mar 2023 16:31:10 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.93])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 31BB74010E86;
 Thu,  2 Mar 2023 16:31:08 +0000 (UTC)
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
X-Inumbo-ID: a7f51748-b917-11ed-96ad-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677774676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZDJm0qbzU2JdESu0wAQDuLmy0wi+765V7K8ePbWUcC0=;
	b=V3+wmj8YSqjOd1osE0XfbG9T4nMYXdIXc+oEaNa2UeAbzTDoPB3m6hOH8yCqwbqS2p4rBr
	zkipxEzoYCauWifJkKhLIFu6xxuOHCTwHq/hxR+9mlxXrH2qqjggtvcD1JOE03+2nrvO+E
	b0Vpb0Id4pvYCIvkY86/4l3CYj4HtQ0=
X-MC-Unique: FfzftseYMeyd-EeORqC0WQ-1
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Daniel Berrange <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Maxim Levitsky <mlevitsk@redhat.com>,
	libvir-list@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	Reinoud Zandijk <reinoud@netbsd.org>
Subject: [PATCH v2 0/6] Deprecate support for 32-bit x86 and arm hosts
Date: Thu,  2 Mar 2023 17:31:00 +0100
Message-Id: <20230302163106.465559-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1

We're struggling quite badly with our CI minutes on the shared
gitlab runners, so we urgently need to think of ways to cut down
our supported build and target environments. qemu-system-i386 and
qemu-system-arm are not really required anymore, since nobody uses
KVM on the corresponding systems for production anymore, and the
-x86_64 and -arch64 variants are a proper superset of those binaries.
So it's time to deprecate them and the corresponding 32-bit host
environments now.

This is a follow-up patch series from the previous discussion here:

 https://lore.kernel.org/qemu-devel/20230130114428.1297295-1-thuth@redhat.com/

where people still mentioned that there is still interest in certain
support for 32-bit host hardware. But as far as I could see, there is
no real need for 32-bit x86 host support and for system emulation on
32-bit arm hosts anymore, so it should be fine if we drop these host
environments soon (these are also the two architectures that contribute
the most to the long test times in our CI, so we would benefit a lot by
dropping those).

v2:
- Split binary and host deprecation into separate patches
- Added patches to immediately drop the jobs from the CI

Thomas Huth (6):
  docs/about/deprecated: Deprecate the qemu-system-i386 binary
  docs/about/deprecated: Deprecate 32-bit x86 hosts
  gitlab-ci.d/crossbuilds: Drop the i386 jobs
  docs/about/deprecated: Deprecate the qemu-system-arm binary
  docs/about/deprecated: Deprecate 32-bit arm hosts
  gitlab-ci.d/crossbuilds: Drop the 32-bit arm system emulation jobs

 docs/about/deprecated.rst    | 43 ++++++++++++++++++++++++++++++++++++
 .gitlab-ci.d/crossbuilds.yml | 30 -------------------------
 2 files changed, 43 insertions(+), 30 deletions(-)

-- 
2.31.1


