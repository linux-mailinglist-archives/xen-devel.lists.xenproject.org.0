Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECE7AB6A6F
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 13:45:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984242.1370421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFAXn-0003IR-KD; Wed, 14 May 2025 11:45:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984242.1370421; Wed, 14 May 2025 11:45:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFAXn-0003GH-Ha; Wed, 14 May 2025 11:45:03 +0000
Received: by outflank-mailman (input) for mailman id 984242;
 Wed, 14 May 2025 11:45:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Q1L=X6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uFAXl-0003GA-71
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 11:45:01 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da9e5d43-30b8-11f0-9ffb-bf95429c2676;
 Wed, 14 May 2025 13:44:55 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-ad23db02350so755626466b.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 May 2025 04:44:55 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ad2197bd3a6sm920246866b.131.2025.05.14.04.44.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 04:44:54 -0700 (PDT)
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
X-Inumbo-ID: da9e5d43-30b8-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747223095; x=1747827895; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ubg3h8wapkFGfWHn3cyifpLCAoAOZacgNEoyNgrU1GU=;
        b=nG1huWmt+LWBvqRsunzP6cJqJEtLd0/cepmrgYlBZrZDYex5Mj2CCkbkG7UGbIVGHZ
         smbCUwJq3ypCmuH7jGnTFK4zeRlTuIyy8i6cGA3QVE1cbyuV1RO5t9FSi8N6ZeJ4RAta
         fuZv/gNJpQMXRGEtFoAfFFMQ00IX7DyKrCjzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747223095; x=1747827895;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ubg3h8wapkFGfWHn3cyifpLCAoAOZacgNEoyNgrU1GU=;
        b=k5VXpHcdxkz34c24+37DTdfkH12wT+/w+5yoY3xY7gJDavfldoxVptqpPYpnSY14NX
         FqZXHVqBhjQ0Hb4wY08H0Dhk89KSi59GE9K865EclOXjvDLPBcmhVMMQrRSb+9HSaAN4
         ePM5VZTBuSaE06S6120j7s7WpkWY01tGp6v+PLO4jRA6SCouqsPhY8+g++5A7OMoYMA9
         pYcw86rUJTh4wPqrvQ+iuiXf4f8Ku8z85FhDy8tnJFvN4xbFxhsOmc7PFBcLixsSyTHS
         l8rmJm/B5gO7CwowWx8BTCslhkFUiV+CZci8rp2g/uAlqlBPh6t4oHsUoxBSYbqSwrKW
         C+wQ==
X-Gm-Message-State: AOJu0YwJLolFvdpLfOhhesO95ED3sBirchCUFLmhFFTCSGLSbfkDKL2f
	1LqIiUEO0ngTsNQtpH9VvGfyaNY5VPmiXJEXmjonSCiH8nKvgoHNbLjZq5Vr4ZmfiWUkSftmMvF
	v
X-Gm-Gg: ASbGncsoKb2au2IO5Yl86JBez2IKH4gg81EFYuNeFVEJwAggNm8T6PcUOw9JJkyjbus
	ixDn/HM+81PPfBDuF79I6r26n4oZpt1mFkOkl5fYxDSFCEAO3zFzKpVEkptCgI/5DkpF2BaTzgo
	sZrxiaMTd7dQPYvhp+c8Ae31Nc0MGPPLSyMaJH4iA76HFJ1Qft0C0aUFkVU5XLTAICeg2FItdp9
	i+yYEMfU+EBd8KNTMiJvvNIy7DELDF/R8zrHOnbM6/UBtheGw4KEwFdyx0H4+x3PqivuqXg1HQj
	KCgsl4U8yddlJWTKDr+5MRP4BupgwgQdAUP9k9SpMy8wKYokqZ0QgkQWJ+49YA==
X-Google-Smtp-Source: AGHT+IHtLZx8Z4NJ8Zv1aoUaU1ItOuWpsyFGODCigS/C6X+SmOKaBJaL7LP4vMA/8RcvcAh//KovAQ==
X-Received: by 2002:a17:907:3ea8:b0:ad2:e683:a776 with SMTP id a640c23a62f3a-ad4f70f6322mr304684066b.1.1747223094667;
        Wed, 14 May 2025 04:44:54 -0700 (PDT)
Date: Wed, 14 May 2025 13:44:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 5/6] x86: FLUSH_CACHE -> FLUSH_CACHE_EVICT
Message-ID: <aCSCNUGdbuwrJLd6@macbook.lan>
References: <c030bfde-c5bb-f205-edff-435278a435f4@suse.com>
 <ca63920c-b349-bcd3-8c1d-c869d8de4d99@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ca63920c-b349-bcd3-8c1d-c869d8de4d99@suse.com>

On Wed, May 03, 2023 at 11:46:41AM +0200, Jan Beulich wrote:
> This is to make the difference to FLUSH_CACHE_WRITEBACK more explicit.
> 
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

This is however missing the previous calls from SVM/VMX that at this
point in the series have already been switched to write-back instead
of evict.  Maybe this patch should be the 1st of 2nd, so that changes
from evict to write-back are done afterwards?

Thanks, Roger.

