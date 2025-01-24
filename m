Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F4AA1B446
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2025 11:57:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876670.1287025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbHNQ-0004pl-Ps; Fri, 24 Jan 2025 10:57:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876670.1287025; Fri, 24 Jan 2025 10:57:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbHNQ-0004nP-NE; Fri, 24 Jan 2025 10:57:28 +0000
Received: by outflank-mailman (input) for mailman id 876670;
 Fri, 24 Jan 2025 10:57:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AkuS=UQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tbHNO-0004nJ-QN
 for xen-devel@lists.xenproject.org; Fri, 24 Jan 2025 10:57:26 +0000
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [2607:f8b0:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id facf0e84-da41-11ef-99a4-01e77a169b0f;
 Fri, 24 Jan 2025 11:57:19 +0100 (CET)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-216395e151bso26014925ad.0
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jan 2025 02:57:24 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21da3d9e09dsm13814305ad.23.2025.01.24.02.57.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 02:57:22 -0800 (PST)
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
X-Inumbo-ID: facf0e84-da41-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737716243; x=1738321043; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rFQIflmp26yTsLJbWxnGkhpLA53I4s54Cp17dTKkwog=;
        b=ajJafDITsHfy9dyreKRUUqHo+jKBn6XqDeF0UGwxjd+u4MO/BvlCsMsHsB5N1x0wdN
         qp0/IHz+TItnAUprR5aSHRlGzpmoRl8buFs/Meu+8WxmtgYN54n9zrjRelOiwajHhEF9
         8OyjPV3G4hc9PY6OV2oHXExgZ6JtjM3TSVACU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737716243; x=1738321043;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rFQIflmp26yTsLJbWxnGkhpLA53I4s54Cp17dTKkwog=;
        b=LLjPt3w6WbS5ZV16/NBFFmECoDPOv4KiHikxRaWS0oa71ccVSJlPYv6TyTsQJhyrJm
         +A1uXVUpw5XMLpKRD0m/5t6l6OJxUP2A8ksyrgsHkr5BKfE9SltNVKzL3m43wdAEOr4T
         ssOWMX3wrZ08vNQsQ2C90ob5kJTOnwEGV+vCPhgph1a/mCJReXXuOuaiOTDKLIVXitOS
         QcPwttp2FDAdN1NV49A7gC5XP0kPY+T8udS6ft4l1zShfSXYsoYTyd0ktM3xYs5jac2z
         sZKsNE25CXsUamYnjolMZcj1Xp0D9K2rsF17FEztiWS7lpeauf3AHb1aNXrHpSiJPD4b
         4wHA==
X-Gm-Message-State: AOJu0YyPdil7vysOJyce+uQnlKZWA5KwHGIX3nfv5ZGMtwbG5SO/Ss9A
	KpNipJXdAHw3UJdrlQYXgVAwSWoXNXQLMbHl0EswhcrUuJvNebpTbcXnSfoELRo=
X-Gm-Gg: ASbGncsbPceNuXWdL3ZdsnQq/TMctpZnbEYbIPWJ1ptSWAwJRRFWf2H6QOu23lbBsiA
	wWLQ3NaUYozBq/pERu4+W6FXe9Eum09kkEvpqi0mvqJxZPkolLE4dK7UHtqQs2p3T1RqNNv6gu2
	Ggc/phCg1uxf+AGSCaClpOeUYm8oFEEs8081BhZI35NKXzvPrmOySuXUxUUuOgZHDsLdISozjSw
	rae3IgdCA+yqpPOzxk5SKa1QgtwxT4nbBFKJ7QtchaC1JtsPH4yJvPEM0FWRGKP/ymW3TXNhr2X
	RXQsIJcFbRE26M8=
X-Google-Smtp-Source: AGHT+IF25OZFiLio9neQOJNfyfp9Y7pK1Oo6zaWPwQ1t22frCvYY7dDwDHB4ncAs4lOGRe1aP5519w==
X-Received: by 2002:a17:902:ea02:b0:216:4676:dfb5 with SMTP id d9443c01a7336-21d9937d527mr105145015ad.21.1737716243426;
        Fri, 24 Jan 2025 02:57:23 -0800 (PST)
Date: Fri, 24 Jan 2025 11:57:17 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>
Subject: Re: [PATCH v3 04/12] VMX: convert vmx_basic_msr
Message-ID: <Z5NyDfY_ja3hr96P@macbook.local>
References: <293e5aef-8843-461c-bc96-709a605b2680@suse.com>
 <eb9874c7-a392-49c2-a610-cf7ff45a3e3b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eb9874c7-a392-49c2-a610-cf7ff45a3e3b@suse.com>

On Mon, Feb 26, 2024 at 05:43:21PM +0100, Jan Beulich wrote:
> ... to a struct field, which is then going to be accompanied by other
> capability/control data presently living in individual variables. As
> this structure isn't supposed to be altered post-boot, put it in
> .data.ro_after_init right away.
> 
> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

