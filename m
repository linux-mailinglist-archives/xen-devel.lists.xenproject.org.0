Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B520A3157A3
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 21:22:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83411.155186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9ZWS-0005YJ-GL; Tue, 09 Feb 2021 20:22:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83411.155186; Tue, 09 Feb 2021 20:22:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9ZWS-0005Xt-Co; Tue, 09 Feb 2021 20:22:08 +0000
Received: by outflank-mailman (input) for mailman id 83411;
 Tue, 09 Feb 2021 20:22:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p39W=HL=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1l9ZWQ-0005Xk-IP
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 20:22:06 +0000
Received: from mail-wr1-x42a.google.com (unknown [2a00:1450:4864:20::42a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e5450e4f-a17a-4135-8ca7-bec551057602;
 Tue, 09 Feb 2021 20:22:05 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id u14so23669462wri.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Feb 2021 12:22:05 -0800 (PST)
Received: from CBGR90WXYV0 (host86-180-176-157.range86-180.btcentralplus.com.
 [86.180.176.157])
 by smtp.gmail.com with ESMTPSA id y11sm36651129wrh.16.2021.02.09.12.22.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Feb 2021 12:22:04 -0800 (PST)
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
X-Inumbo-ID: e5450e4f-a17a-4135-8ca7-bec551057602
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=0DM4/d+upFhn6wMrNIoHq66Rpjqu7XLqTPr3rwHqnX8=;
        b=CTUnUF6XELrMelT02nwplknI30gE6VfySBgNx2Cvu0MWJdcWKYC6RgVFPkI7oJVJZ9
         odDmCd7MJoZIf44hpEfpcETJ+LjXArS/fNSfzgnx+bzDwxIq45KZimAB/Z/HGM3CpPG4
         MbuHYGbB7tsCXVtbDNZpEcmhlfgvVP2hB/jsMFEBbnVGAq/uzFR08uNZKLYKC4kwhK49
         ZKO0wOWWcBkkYWIe6n9haeqaMS4dKts8zWRwMmxe86dvQpYRDV57FETL5PwnPaC3TA2S
         WvshIK7GxJLHyFOamqFcW4UpRtm/CuZZUFDJ+vWyJtYLnOrzmBEE04RbkCOYqu91qWfM
         CZ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=0DM4/d+upFhn6wMrNIoHq66Rpjqu7XLqTPr3rwHqnX8=;
        b=bEcbDfcElpUutBNM1PWQUirfSqZbhb3wrPItHmlP0MdxkwnEteCBO4VuGz1kbnuJzp
         74OiEAV+7DljBQdTuA7MR0jXkzl/rep/ZeMy8ZfwkGcpW0IQ9ik9oPd0IjzppKFoHoQ6
         AWbzaFharlRDhM3Az4tzjSOZEVKR48VVkynzWoHYdkGF3zylSi4mGqZffEEjns3zBBDe
         iQy9qIYDTSBU8EE/vb9w1BQFa62zegVfICmApBUF4WCT//jo2s/M6MFqXjzoeiXGgcQ/
         h2ShOLux1EB3q61M91fMww1VEv/NJqViSTbEWs8VNUDVoF6u10emFeOy3luWE5nZ0bm5
         W5SQ==
X-Gm-Message-State: AOAM533Df1l6RI6SgL3OjSbVl+hO5V1Ez8nUnZiAW/GJdGMJ8YGbmKxh
	bPkv3yLTnsEj35pM80MHvXn8ZV/CXrw=
X-Google-Smtp-Source: ABdhPJxRScY63HGVSkdDj2jTf1QcEe8VguSUdVtnfCwkNOJdLWX7SzwY19auaYumAr5HcnFLdS7/Gw==
X-Received: by 2002:adf:d0d2:: with SMTP id z18mr28457666wrh.70.1612902125107;
        Tue, 09 Feb 2021 12:22:05 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Julien Grall'" <julien@xen.org>,
	<xen-devel@lists.xenproject.org>
Cc: <hongyxia@amazon.co.uk>,
	<iwj@xenproject.org>,
	"'Julien Grall'" <jgrall@amazon.com>,
	"'Jan Beulich'" <jbeulich@suse.com>
References: <20210209152816.15792-1-julien@xen.org> <20210209152816.15792-3-julien@xen.org>
In-Reply-To: <20210209152816.15792-3-julien@xen.org>
Subject: RE: [for-4.15][PATCH v2 2/5] xen/iommu: Check if the IOMMU was initialized before tearing down
Date: Tue, 9 Feb 2021 20:22:03 -0000
Message-ID: <04f401d6ff21$3b167720$b1436560$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJkA3sfHUQVO5jg8t87X8qwyW0VowJJWhUSqSPwG1A=
Content-Language: en-gb

> -----Original Message-----
> From: Julien Grall <julien@xen.org>
> Sent: 09 February 2021 15:28
> To: xen-devel@lists.xenproject.org
> Cc: hongyxia@amazon.co.uk; iwj@xenproject.org; Julien Grall <jgrall@amazon.com>; Jan Beulich
> <jbeulich@suse.com>; Paul Durrant <paul@xen.org>
> Subject: [for-4.15][PATCH v2 2/5] xen/iommu: Check if the IOMMU was initialized before tearing down
> 
> From: Julien Grall <jgrall@amazon.com>
> 
> is_iommu_enabled() will return true even if the IOMMU has not been
> initialized (e.g. the ops are not set).
> 
> In the case of an early failure in arch_domain_init(), the function
> iommu_destroy_domain() will be called even if the IOMMU is not
> initialized.
> 
> This will result to dereference the ops which will be NULL and an host
> crash.
> 
> Fix the issue by checking that ops has been set before accessing it.
> 
> Fixes: 71e617a6b8f6 ("use is_iommu_enabled() where appropriate...")
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Paul Durrant <paul@xen.org>


