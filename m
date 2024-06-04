Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 874A78FAAF2
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2024 08:39:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735187.1141370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sENos-0006ew-SC; Tue, 04 Jun 2024 06:38:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735187.1141370; Tue, 04 Jun 2024 06:38:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sENos-0006dD-OB; Tue, 04 Jun 2024 06:38:54 +0000
Received: by outflank-mailman (input) for mailman id 735187;
 Tue, 04 Jun 2024 06:38:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N7N6=NG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sENor-0006d7-NX
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2024 06:38:53 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b11b2cf-223d-11ef-b4bb-af5377834399;
 Tue, 04 Jun 2024 08:38:51 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-42136faf3aeso16194985e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 03 Jun 2024 23:38:51 -0700 (PDT)
Received: from [172.31.7.231] ([62.48.184.126])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42135fea176sm104337255e9.24.2024.06.03.23.38.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jun 2024 23:38:50 -0700 (PDT)
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
X-Inumbo-ID: 1b11b2cf-223d-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1717483131; x=1718087931; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vcb6mdZUN4++Vz54iHGsZAG3B9yDliTGLd0WfbnrCcU=;
        b=e8eGB0ELPxLuXjP4qWBlEKjvKXDiDhfjX/64x4FG8RZ0Bx/TygRItEus8ME38mFrFo
         5UTo0E4szZxf74DQKSLiYcaHl7oQbIzz44FmXmkoV+gmg46OEjjlhVb0WNHQj/2xA5QQ
         wo9D0inrEjjfTZZUN4ZrstCDaH9ATnU77KV3lpTmPpgp6V58PrqiJvCTWopOcHGyDvwr
         R+9N6zTYuPitEuR0IEJBdMNdDse+UAtYVZkz6Ss8eXmw0neZsZ9vaaJ17Wc/HVnSSKFt
         CTbocV90BG20n6jBMuLjUWp0LWu3jt+Lay5pTvOAJfGqAps85ZTSmu8K8B1zOo14mdqr
         q37Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717483131; x=1718087931;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vcb6mdZUN4++Vz54iHGsZAG3B9yDliTGLd0WfbnrCcU=;
        b=uMphA/9IQspt65HviuCy8Q0bjZOhiGy3T5dCj8dC+BdzxN5dlU6ETLCu3bHFsst6HM
         vZWXcO3FWJw7CL7jBSQ51aNGpRB9eoubE37AmbJjVKyajjkarKDRWPKuApe+TvtRoOXt
         1oPM7DKmPQukHva2cO+2m5QpqwOd8gh/XsLApGtNKoIBgOxw/AKuDxzk+06nbqx8alCD
         dlyMxZ+YWrG/MfSn23SCmGPnP5gGnk4u11/NgbznTc5xylaxKgxo1tpErg2h5mmdc7T1
         0QPEvlGgFlo357VArfJNoKr1zpAxuoqKIPGTYlO41Fk5tuEoMGuD+PKXIkuV/ChJcGzv
         m2ag==
X-Forwarded-Encrypted: i=1; AJvYcCWYdjG70r+yxx8i0NsSW9AHVEqMFA3XGJkocFSSBrkmDSIjjyPWJ4jNS12bCFWbsFp8hOZpf78ElqAlEOym2BLicsEwiusrZbCaeBruvOw=
X-Gm-Message-State: AOJu0YwGTyEOTlmRx1/yBWxznQj6LccI/pIobSNOpj6rkZmeJTnCcSUR
	yBSbFF7WZtJjcneBDDDNiK2DpeFvx7gWcAOddrqCVo5sLHw0femgXN+NubdwLQ==
X-Google-Smtp-Source: AGHT+IHVHD4SHYJOO8JZnijobM0cIWA28UoQAnUGn4YZWlpKthhK3xz0Gt/SrKQIVqY3+5Lkcp+Kzw==
X-Received: by 2002:a05:600c:5012:b0:41b:9e4f:d2b2 with SMTP id 5b1f17b1804b1-4212e044b0dmr94150615e9.2.1717483131060;
        Mon, 03 Jun 2024 23:38:51 -0700 (PDT)
Message-ID: <2c7bc1df-74da-420a-9cc8-d64f0bf212cf@suse.com>
Date: Tue, 4 Jun 2024 08:38:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19? v5 03/10] xen: Refactor altp2m options into a
 structured format
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1717356829.git.w1benny@gmail.com>
 <5dc1d0375206bd982b91f4db4bd237769a889f48.1717356829.git.w1benny@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5dc1d0375206bd982b91f4db4bd237769a889f48.1717356829.git.w1benny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.06.2024 22:04, Petr Beneš wrote:
> From: Petr Beneš <w1benny@gmail.com>
> 
> Encapsulate the altp2m options within a struct. This change is preparatory
> and sets the groundwork for introducing additional parameter in subsequent
> commit.
> 
> Signed-off-by: Petr Beneš <w1benny@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com> # hypervisor



