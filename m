Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 338C529F2A6
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 18:10:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14392.35550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYBR3-0001Mm-Dv; Thu, 29 Oct 2020 17:10:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14392.35550; Thu, 29 Oct 2020 17:10:01 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYBR3-0001MN-AZ; Thu, 29 Oct 2020 17:10:01 +0000
Received: by outflank-mailman (input) for mailman id 14392;
 Thu, 29 Oct 2020 17:10:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o7xP=EE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kYBR2-0001MI-8x
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 17:10:00 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0639829f-d219-4018-aa96-5a8fc86ef1cb;
 Thu, 29 Oct 2020 17:09:59 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A5290ACDF;
 Thu, 29 Oct 2020 17:09:58 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=o7xP=EE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kYBR2-0001MI-8x
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 17:10:00 +0000
X-Inumbo-ID: 0639829f-d219-4018-aa96-5a8fc86ef1cb
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 0639829f-d219-4018-aa96-5a8fc86ef1cb;
	Thu, 29 Oct 2020 17:09:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603991398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3hE4uVxT8Nrw6+ayb6BmQUqV+JrKDRf67hQnoXyI4UA=;
	b=LHHiOfgHMsbd7/1FTq8fAj9nbwJ6GsYestzVeJhFsijS3lO3BeHJLSa6nHFb+GZrDnM4vd
	VggUzE65cPeRqv1gDP2+gW3r2iYtHnuGIKPUiGLdDwWTAJBg9POIngPVnvCBHp7MP7wXoL
	R/Zohxa80zTnAnVHeg3MKuGGMWd1gJ0=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A5290ACDF;
	Thu, 29 Oct 2020 17:09:58 +0000 (UTC)
Subject: [PATCH 1/2] x86: fix build of PV shim when !GRANT_TABLE
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <94c18ebf-632d-8a2c-220c-c31d6e37eb55@suse.com>
Message-ID: <333de96e-5f60-dc87-7668-e8027dcfbcdd@suse.com>
Date: Thu, 29 Oct 2020 18:09:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <94c18ebf-632d-8a2c-220c-c31d6e37eb55@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

To do its compat translation, shim code needs to include the compat
header. For this to work, this header first of all needs to be
generated.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -24,6 +24,7 @@ headers-$(CONFIG_X86)     += compat/arch
 headers-$(CONFIG_ARGO)    += compat/argo.h
 headers-$(CONFIG_PV)      += compat/callback.h
 headers-$(CONFIG_GRANT_TABLE) += compat/grant_table.h
+headers-$(CONFIG_PV_SHIM) += compat/grant_table.h
 headers-$(CONFIG_HVM)     += compat/hvm/dm_op.h
 headers-$(CONFIG_HVM)     += compat/hvm/hvm_op.h
 headers-$(CONFIG_HVM)     += compat/hvm/hvm_vcpu.h


