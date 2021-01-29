Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F34303087DD
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 11:38:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77929.141504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5RA2-00077e-6m; Fri, 29 Jan 2021 10:37:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77929.141504; Fri, 29 Jan 2021 10:37:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5RA2-00077E-3c; Fri, 29 Jan 2021 10:37:54 +0000
Received: by outflank-mailman (input) for mailman id 77929;
 Fri, 29 Jan 2021 10:37:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rFjR=HA=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1l5RA0-000779-Rw
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 10:37:52 +0000
Received: from mail-wr1-x430.google.com (unknown [2a00:1450:4864:20::430])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cf491b12-9c6a-4b5b-b86e-2764d26d10be;
 Fri, 29 Jan 2021 10:37:52 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id 7so8348517wrz.0
 for <xen-devel@lists.xenproject.org>; Fri, 29 Jan 2021 02:37:52 -0800 (PST)
Received: from CBGR90WXYV0 ([2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec])
 by smtp.gmail.com with ESMTPSA id s4sm9433653wme.38.2021.01.29.02.37.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 29 Jan 2021 02:37:50 -0800 (PST)
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
X-Inumbo-ID: cf491b12-9c6a-4b5b-b86e-2764d26d10be
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=GkFa5kkShAleTaE6/sbx2rVnUcWwNlhGyreQ4dfRTyE=;
        b=uH3bEk0ESk1dv8LCOWfdfcIcixbfnheM5lOlUl/PT6yMtCZlI47i+0io0mm++lnz1o
         +jzLIi6fQK2tzN8sETVSnyfjF1svhJnYCvLGfr8uGPAVL1MBKZONN1JzlrFubVFNuaSe
         cbIlGNDiDzzRxIMEaI8jbdLQSq5hZd3CXw33nhJqepu3CqKuUhjI8j/ylwrYUCKVICK/
         O7ZF6tUy6rV0DXjn0nuxfc6/p/BOvndJblqp/WQlhgfxxPRu2B/MOfjgKow1MD5AaWwL
         aHLajHLdq61rIOiDn3Qcm+MaOSFhstn13fGSyUHsXu8tfLC8jtfS3zuZI5cDAMawb9d7
         72uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=GkFa5kkShAleTaE6/sbx2rVnUcWwNlhGyreQ4dfRTyE=;
        b=CO7YbVDK5CGzGXIl1q9U/EiHvTsYJJDdkCl0Z2M7uYDAthY4n84YRb0dLhpDrN3rZ8
         VOugWzVoHuqZ3srywI2SimBCnpN1U8QGRtEwOhnGxpLpYPy46Uuo+gBhXFc7M3eflz2r
         SdYImZN0WXpuCWOudQ8M/BY1P9Jrnpm8t1x3H78eVRy2LUUdewPDxHRuJOn/cwVYJMVK
         QSbotqeNlzfHyZZiVUT/l/ti1bvEvvtKRZ0V1VaoOSEl1cTcIdl4a8ZGkIsP+pEwR+Eu
         G3ZYxEIOykD1UQLf8ObUDYd2BgW/vfVAJOipvtmteGvHllVe/Lr0K7kgndu7cJcWIpZw
         5rTg==
X-Gm-Message-State: AOAM533ijDzaXR7cHx+3O6jTKBvwQd1xwiviX94NP+4vdhBjpBXq9Gbd
	tjcYOyDmSXTYJ5rr0dYQOX0=
X-Google-Smtp-Source: ABdhPJxkn9E1v00Jrd0L6ehAI6ahvqQBioIdVjdli6CqRWFlf7IE0nQbISxHkb9/rsWZ/wSFo9avfA==
X-Received: by 2002:a5d:452f:: with SMTP id j15mr3888573wra.298.1611916671361;
        Fri, 29 Jan 2021 02:37:51 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Igor Druzhinin'" <igor.druzhinin@citrix.com>,
	<xen-devel@lists.xenproject.org>
Cc: <iwj@xenproject.org>,
	<wl@xen.org>,
	<andrew.cooper3@citrix.com>,
	<george.dunlap@citrix.com>,
	<jbeulich@suse.com>,
	<julien@xen.org>,
	<sstabellini@kernel.org>,
	<anthony.perard@citrix.com>,
	<roger.pau@citrix.com>
References: <1610425048-990-1-git-send-email-igor.druzhinin@citrix.com>
In-Reply-To: <1610425048-990-1-git-send-email-igor.druzhinin@citrix.com>
Subject: RE: [PATCH v2 1/2] viridian: remove implicit limit of 64 VPs per partition
Date: Fri, 29 Jan 2021 10:37:49 -0000
Message-ID: <030001d6f62a$caf547e0$60dfd7a0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQNSytsssxWJzcTJyJyBVC30FTjr4qdGv6Cw
Content-Language: en-gb

> -----Original Message-----
> From: Igor Druzhinin <igor.druzhinin@citrix.com>
> Sent: 12 January 2021 04:17
> To: xen-devel@lists.xenproject.org
> Cc: iwj@xenproject.org; wl@xen.org; andrew.cooper3@citrix.com; george.dunlap@citrix.com;
> jbeulich@suse.com; julien@xen.org; sstabellini@kernel.org; anthony.perard@citrix.com; paul@xen.org;
> roger.pau@citrix.com; Igor Druzhinin <igor.druzhinin@citrix.com>
> Subject: [PATCH v2 1/2] viridian: remove implicit limit of 64 VPs per partition
> 
> TLFS 7.8.1 stipulates that "a virtual processor index must be less than
> the maximum number of virtual processors per partition" that "can be obtained
> through CPUID leaf 0x40000005". Furthermore, "Requirements for Implementing
> the Microsoft Hypervisor Interface" defines that starting from Windows Server
> 2012, which allowed more than 64 CPUs to be brought up, this leaf can now
> contain a value -1 basically assuming the hypervisor has no restriction while
> 0 (that we currently expose) means the default restriction is still present.
> 
> Along with the previous changes exposing ExProcessorMasks this allows a recent
> Windows VM with Viridian extension enabled to have more than 64 vCPUs without
> going into BSOD in some cases.
> 
> Since we didn't expose the leaf before and to keep CPUID data consistent for
> incoming streams from previous Xen versions - let's keep it behind an option.
> 
> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>

Reviewed-by: Paul Durrant <paul@xen.org>


