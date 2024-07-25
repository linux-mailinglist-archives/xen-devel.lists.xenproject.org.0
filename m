Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0641A93BD93
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2024 10:03:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764788.1175336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWtR4-00023i-EL; Thu, 25 Jul 2024 08:02:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764788.1175336; Thu, 25 Jul 2024 08:02:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWtR4-00022C-BS; Thu, 25 Jul 2024 08:02:50 +0000
Received: by outflank-mailman (input) for mailman id 764788;
 Thu, 25 Jul 2024 08:02:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/jnY=OZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sWtR2-00021z-SI
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2024 08:02:48 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47378f7f-4a5c-11ef-8776-851b0ebba9a2;
 Thu, 25 Jul 2024 10:02:46 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a7b2dbd81e3so21196566b.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jul 2024 01:02:46 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acadb021asm44214166b.188.2024.07.25.01.02.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jul 2024 01:02:45 -0700 (PDT)
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
X-Inumbo-ID: 47378f7f-4a5c-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721894566; x=1722499366; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AP47ysTrD1B/0czQGo5UjPtQ30JzUCGh6ScFen3bgnQ=;
        b=ZixbgwU0hfuxpnqaIhRzv7oWM5+9Ws4aMmEGHGcTBwaHmNlXuH8tPh1yfvD/Ancisa
         d/Y9VyjDfxW9NZmOlEVwvSI/Acbg4AqgyuT+AmwmZjZFv2jNTgyoFIY/9we0FpkMUNBn
         6JJpTXx0He+woWPMlDBJS1MmSFDZKdOw9Kg8a58+gXMpAqdRflA4+Xa/XbA/sCuROitS
         yT2FhnTYVJFnsht4UcpDTQujNL/xc4PnoLd5yUfF+BI3S39yiB4uo6s4DYQeQ77rnsYb
         0Q0Tveu8cbMAKLdIP/JZDnUVxZMcAnJrr3wyh1XyVrDRMk/YL04IVvQtjoTCpbYZoeXr
         ul9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721894566; x=1722499366;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AP47ysTrD1B/0czQGo5UjPtQ30JzUCGh6ScFen3bgnQ=;
        b=OMRZ+gze47MChL+y3jH46v7d0Wq6T+pBnSZOx7pl8Z/nAZU/mcL7R+NswV1GU4Qyiq
         5Qke2fcUyuljlx/THiKV/wCI9ZBmC40vC4p6UxbTOmnQRCo4Xjx7LarauKdJBXGqYG/l
         svnQCTJXv4urw44AnF+54FYyq9ORhlqrlY5vj9mX9zMah8eDEdzU1ZMd0bzlLOaxOP59
         4AUl6TMmPy6dKgYX61D5QAV8E2aOJn04L/GC+lDl8DbNSFoiEyMRryKy+sz0Wz4QoJ+N
         u/zjicMF02FZsDaWobzfV+DscI1ZNlEfDe9o+RNDitlDu0+j1WTuvNTr8CwGHoL/uIFy
         EdXw==
X-Forwarded-Encrypted: i=1; AJvYcCVCNmalqDTvGGuW+XQZo7mH1vn3yZ9CltWuTfwhV52J3IxcOQdBYMUQDraGTcIUDgXFm9Awvrg1AgkGCuj9aXllCricOowODvNW0wSZV54=
X-Gm-Message-State: AOJu0Yw3rE8kSDYmxi9ER3hoXK3m+uaTdkL4DDmzJW0ODGJmH5XGRC6h
	735JHAJoch1mIqYk424+JyKxCn1BnF6adfGfhlJz17Boj40ew9h+lPtLdTW+OhHybtJaeNZk8ry
	F
X-Google-Smtp-Source: AGHT+IEVJJ3nESMvDj3qZN35DsT4AR4wlpLYi6EzQNKrYOMLzABEAXbto0MdLywaTjjGWg0Y6EzVuw==
X-Received: by 2002:a17:907:9694:b0:a7a:b385:37c8 with SMTP id a640c23a62f3a-a7ac4d9f44amr153068366b.5.1721894566083;
        Thu, 25 Jul 2024 01:02:46 -0700 (PDT)
Message-ID: <a2edee01-b895-4d0f-b435-9a92bcc5c411@suse.com>
Date: Thu, 25 Jul 2024 10:02:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/xen: move xen_reserve_extra_memory()
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
References: <20240725073116.14626-1-roger.pau@citrix.com>
 <20240725073116.14626-2-roger.pau@citrix.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20240725073116.14626-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 25.07.24 09:31, Roger Pau Monne wrote:
> In preparation for making the function static.
> 
> No functional change.
> 
> Fixes: 38620fc4e893 ('x86/xen: attempt to inflate the memory balloon on PVH')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Without the Fixes: tag (can be dropped while committing):

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen


