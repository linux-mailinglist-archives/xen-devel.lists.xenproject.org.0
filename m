Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3FC4ECCE6
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 21:05:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296499.504732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZdcs-0001YG-RY; Wed, 30 Mar 2022 19:05:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296499.504732; Wed, 30 Mar 2022 19:05:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZdcs-0001VZ-Ob; Wed, 30 Mar 2022 19:05:02 +0000
Received: by outflank-mailman (input) for mailman id 296499;
 Wed, 30 Mar 2022 19:05:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L21/=UJ=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nZdcr-0001VT-S3
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 19:05:01 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b661566-b05c-11ec-a405-831a346695d4;
 Wed, 30 Mar 2022 21:05:00 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1648667094944933.625590599704;
 Wed, 30 Mar 2022 12:04:54 -0700 (PDT)
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
X-Inumbo-ID: 4b661566-b05c-11ec-a405-831a346695d4
ARC-Seal: i=1; a=rsa-sha256; t=1648667097; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cdbjdGskC4EwYcQuTTBL3GtZxbBYthMKsFnK7b4501BqDFU/E+UiFRwSin/oCgpYypotgYahnXeP7sQmisdU8nUiADuoPsiLg5zCPeNkJdP88tObuR/I9e75RsFzATdeGmZTntMAC17T/v2PKAbSSs7sLTzsHASiuBJel6RLy5E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1648667097; h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=HO/ZM3ckJO9X3H5rFqGUR3zPwBsdAhdUvZEo1ba69+k=; 
	b=a9ljHLpBZ+5129JuFVL8AYbosiOOhHtFl0A4OdnogjonEqyjX2du91vyBjk+mqOgpzKL6WwxW8VVKZxrxPKGHIFnAcFic4UHa3Mv+LU559CX1w6yuEPEzEQ7gFXwBasmJ8ybc43HuuQ77LSX0EqBqw6zJHVlYO7oemGIdahTqqc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1648667097;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=HO/ZM3ckJO9X3H5rFqGUR3zPwBsdAhdUvZEo1ba69+k=;
	b=iY5Cu0aALwBjkgZ+rly6CwpUyQJ07ryb/5lqG8FRs0QtjwTaRv1PIAuK9y0xquAr
	RGNvIbFeEAlifceobzVw1TX6R7sfD9A1G+pjLVhLU1SJI3wXR+FS4sFazVAPm64I1TA
	hU8dFdkXZf/PtKTcw4I/PBpPmGAXwJL0abxwaQR4=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	scott.davis@starlab.io,
	jandryuk@gmail.com
Subject: [PATCH 0/2] Introduce XSM ability for domain privilege escalation
Date: Wed, 30 Mar 2022 19:05:47 -0400
Message-Id: <20220330230549.26074-1-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This series introduces a pair of functions that allow a domain to be escalated to
is_privileged or demoted. Internally the functions enforce the policy that this
is only allowed for system domains, the idle domain in particular.

As for the implementation, there is a desire that the logic does not persist after
__init code is jettison after setup. This has to be balanced with the fact there is no
.c unit files for XSM when only the default policy is in use, i.e. CONFIG_XSM is not
set. To balance this the functions were implemented as always_inline functions in xsm.h.
This should ensure that if the only usage of these functions are in __init code, there
should be no instances of this logic present after __init code is jettisoned. Since
this introduces the ability to elevate the idle domain to is_privileged, this should
not be left in place when transitioning into the running state. As such, a pair of
ASSERTs were introduced, one each, for x86 and Arm to ensure that the idle domain
isn't inadvertently left with is_privileged being true.

Daniel P. Smith (2):
  xsm: add ability to elevate a domain to privileged
  arch: ensure idle domain is not left privileged

 xen/arch/arm/setup.c  |  3 +++
 xen/arch/x86/setup.c  |  3 +++
 xen/include/xsm/xsm.h | 22 ++++++++++++++++++++++
 3 files changed, 28 insertions(+)

-- 
2.20.1


