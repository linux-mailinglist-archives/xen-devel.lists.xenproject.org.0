Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6B5ABECCF
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 09:12:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991556.1375393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHdcx-00040d-HS; Wed, 21 May 2025 07:12:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991556.1375393; Wed, 21 May 2025 07:12:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHdcx-0003yF-Eb; Wed, 21 May 2025 07:12:35 +0000
Received: by outflank-mailman (input) for mailman id 991556;
 Wed, 21 May 2025 07:12:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TwEK=YF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uHdcw-0003y9-9c
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 07:12:34 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6c7a32f-3612-11f0-a2fa-13f23c93f187;
 Wed, 21 May 2025 09:12:33 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ad1b94382b8so1156983266b.0
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 00:12:33 -0700 (PDT)
Received: from [10.1.248.227] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d4383f8sm849729066b.113.2025.05.21.00.12.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 May 2025 00:12:31 -0700 (PDT)
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
X-Inumbo-ID: f6c7a32f-3612-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747811552; x=1748416352; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k3AJnoLl/PZmaCOh+D/CsrVhF9m29JVSHBsr+xfTkLQ=;
        b=QJcptmQSurEq6GV1zsjggoKM1TXgj/Hp/h6u1GRL0lKFAsw9tohlnFKDKbA9VtjuyN
         +SQamVM9eDHwkpsH71w5O+taSk1JW3lrBPGdT4WekePvzv8KwFq2oUxjKktmSMXzOSGJ
         i1eVOe+7uCl9H8Z267ePwbmNJIDLXCaVTcPv2ie2x9881H17xQIEW1eTKq5h/CM2GEab
         SU+ThQBQVpFGqfiBSino6C9PfVo7A+BmJOFP9/1BEWKgtppRAivbE3MgDXGnltAn9wX9
         Z2YCJy1Jmrfr/LQ4CGyq/Tjk+T7t/OXi0KGGb46NXtDPZKcRGZyr2BSNp6FxY1wTcR+6
         IJQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747811552; x=1748416352;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k3AJnoLl/PZmaCOh+D/CsrVhF9m29JVSHBsr+xfTkLQ=;
        b=wZlW01eQW7ZTMTjxhCUWFkAYNp+1X4nCkG+0C7YFSse6EIQH+GMdkucwWp+WFkzudC
         Rmtxb3hyywB54jwfZlLln6laoD1YfnqTR23ojOkdGuOJihJO55/snZC18ZkAZUCf8E0W
         DUaabnOTGACoG8f0YWUuR2Y/bggzfpv262b2L4LMmCUrQcr81pVEWkisxIVscJF0MFV0
         4A8Jbz2Q2IIhRv+svrl2/pnCZoBLGV5o2Kp4ppRVKA9PvOgkaOui6ks2KoyRRXZ24Hr5
         MWq/j1GHFTaeXVWLDRIwbHJRT0qqHovkQbEwzzgLcbBGado8GG8asjFFo4Q7uSgMJlT+
         Rx/Q==
X-Forwarded-Encrypted: i=1; AJvYcCV+AEsFrn753byblX4ITpSZGhcftasWAaxVnnS0yQRlDOz8wGcDYlAnb0O+CTgug1PcomRz5Z6QSZY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx+Itnsi7/aByQGuSYelg/Wo2wGTXhhPDoajBrAzIH0yIt7J67R
	FjljCvNqOglo2IOfH1FpWffpnB++HRZxIQ0ksPkW6YF30IFhi9DujsybtUEjyAZdXQ==
X-Gm-Gg: ASbGncto4r0KOo9mjy08ilgfhS19tnMIMxLPBtP1cSgDMZlxdOcUWXIU+tiXMuFoBst
	bcBoyaX+15+035L8OzLgbifFsqtJDI89NUlfdr11/PRWQZKuNRCobZ2t9Zw05A56LXA1NwdtHZd
	PK7nO51PFaINX3/dtj3W80qp605iy8LNOaPjIpU3Wo73axnoFZFoiamCAmW6h+HYzgvuWJ9ZOMc
	eHr7YBF8e23bhxvBL73nFPP/beKcDQLpo1lm+IKLPdnysH3s7fgxJegmaCGq6kRDp0DoLyOcLm+
	/BDH0ykGnXfLWxb7J4yjZpHXkXNGIxi8K2Ee2LsuhLXcy+WhHaKZoxCRSSDNCQ==
X-Google-Smtp-Source: AGHT+IGBO0sTv5dXPNewLw1595h3fjHh4UiKlQI5lLMv5LDHTLk0MkGo8hxn1BmUGKDphF/4c6wo0g==
X-Received: by 2002:a17:907:97ca:b0:ace:f2c2:5a4 with SMTP id a640c23a62f3a-ad52d49e2c7mr1787732066b.13.1747811552216;
        Wed, 21 May 2025 00:12:32 -0700 (PDT)
Message-ID: <528bd2ae-d33b-4038-92c1-c9ab1ccf0bb7@suse.com>
Date: Wed, 21 May 2025 09:12:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] MAINTAINERS: include Argo documentation in the ARGO
 section
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Daniel Smith <dpsmith@apertussolutions.com>, Rich Persaud
 <persaur@gmail.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250520233220.868258-1-christopher.w.clark@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20250520233220.868258-1-christopher.w.clark@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.05.2025 01:32, Christopher Clark wrote:
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -226,6 +226,7 @@ S:	Maintained
>  F:	xen/include/public/argo.h
>  F:	xen/include/xen/argo.h
>  F:	xen/common/argo.c
> +F:	docs/designs/argo.pandoc

The list of F: isn't alphabetically sorted here, yes, but please let's
at least not make that problem worse.

Jan

